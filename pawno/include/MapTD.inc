//-----------------------------------------//
/*

GTA SA Map on a TextDraw by TokicMajstor / Toxic

This include will make a GTA SA default map on a TextDraw and you can show it to any player using ShowMapForPlayer or hide
by using HideMapForPlayer.
This include also contains creating/destroying global/player icons on that map.
In order for this include to work you need to add "#include <TDMap>" on the top of your gamemode/filterscript somewhere
below "#include <a_samp>".
Maximal number of the player icons by the default is 100, and maximal number of the global icons by the default is 100,
you can always modify that by defining "MAX_ICONS" or "MAX_PLAYER_ICONS" in your GameMode/FilterScript.
If you are using this include in a FilterScript you need to add "#define FS_MapTD 1" inside your FilterScript.


Features:


-ShowMapForPlayer(playerid) 								| Used to show the map on a TextDraw for a specified player.
															| Return values:
															| returns 1 : if the function was successful
															| returns 0 : if playerid was not found
															| Parameters:
															| playerid : map will be shown for player with this ID

-HideMapForPlayer(playerid) 								| Used to hide the map on a TextDraw for a specified player.
															| Return values:
															| returns 1 : if the function was successful
															| returns 0 : if playerid was not found
															| Parameters:
															| playerid : map will be hidden for player with this ID

-CreateIcon(IconID,type,Float:x,Float:y)					| Used to create a global icon on the map.
															| Return values:
															| returns IconID : if the icon was created successfully
															| returns -1 : if the icon type or icon ID is wrong
															| Parameters:
															| IconID : the unique ID of the icon also returned by this function
															| type : SAMP map icon type (these types are not available: 0,1,3)
															| Float:x : the X position of the icon
															| Float:y : the Y position of the icon

-CreatePlayerIcon(playerid,IconID,type,Float:x,Float:y) 	| Used to create a player icon on the map for specified player.
															| Return values:
															| returns IconID : if the icon was created successfully
															| returns -1 : if playerid was not found, the icon type or icon ID is wrong
															| Parameters:
															| playerid : ID of the player who will see the icon
															| IconID : the unique ID of the player icon also returned by this function
															| type : SAMP map icon type (these types are not available: 0,1,3)
															| Float:x : the X position of the icon
															| Float:y : the Y position of the icon

-DestroyIcon(IconID)                                        | Used to destroy global icon on the map.
															| Return values:
															| returns 1 : if the icon was destroyed successfully
															| returns 0 : if the icon ID was wrong
															| Parameters:
															| IconID : the unique ID of the icon returned by CreateIcon

-DestroyPlayerIcon(playerid,IconID)                         | Used to destroy player icon on the map.
															| Return values:
															| returns 1 : if the icon was destroyed successfully
															| returns 0 : if the icon ID was wrong
															| Parameters:
															| playerid : ID of the player whose icon will be destroyed
															| IconID : the unique ID of the icon returned by CreateIcon

-IsMapShownForPlayer(playerid)                         		| Used to find out is player looking at the map currently.
															| Return values:
															| returns 1 : if player is looking at the map
															| returns 0 : if player is not looking at the map or playerid is wrong
															| Parameters:
															| playerid : ID of the player
															


*/
//-----------------------------------------//
#include <a_samp>
#include <YSI\y_hooks>

#if !defined MAX_ICONS
	#define MAX_ICONS 100
#endif
#if !defined MAX_PLAYER_ICONS
	#define MAX_PLAYER_ICONS 100
#endif
#if !defined FS_MapTD
	#define FS_MapTD 0
#endif


new Text:Map;
new Text:MapOutline[4];
new Text:GlobalMapIcon[MAX_ICONS];
new PlayerText:PlayerMapIcon[MAX_PLAYERS][MAX_PLAYER_ICONS];
new bool:OnMap[MAX_PLAYERS];
new IsPlayerIconUsed[MAX_PLAYERS][MAX_PLAYER_ICONS] = 0;
new IsIconUsed[MAX_ICONS] = 0;
new loaded = 0;
new FS = FS_MapTD;


hook OnGameModeInit()
{
    if(FS == 0) //GM
    {
		LoadMapTD();
	}
	return 1;
}

hook OnFilterScriptInit()
{
    if(FS != 0) //FS
    {
		LoadMapTD();
	}
	return 1;
}


stock ShowMapForPlayer(playerid)
{
	if(!IsPlayerConnected(playerid)) return 0;
	TextDrawShowForPlayer(playerid, Map);
	OnMap[playerid] = true;
	for(new i; i<sizeof(MapOutline); i++)
	{
		TextDrawShowForPlayer(playerid, MapOutline[i]);
	}
	for(new i; i<MAX_PLAYER_ICONS; i++)
	{
		PlayerTextDrawShow(playerid, PlayerMapIcon[playerid][i]);
	}
	for(new i; i<MAX_ICONS; i++)
	{
		TextDrawShowForPlayer(playerid, GlobalMapIcon[i]);
	}
	return 1;
}

stock HideMapForPlayer(playerid)
{
    if(!IsPlayerConnected(playerid)) return 0;
	TextDrawHideForPlayer(playerid, Map);
	OnMap[playerid] = false;
	for(new i; i<sizeof(MapOutline); i++)
	{
		TextDrawHideForPlayer(playerid, MapOutline[i]);
	}
	for(new i; i<MAX_PLAYER_ICONS; i++)
	{
		PlayerTextDrawHide(playerid, PlayerMapIcon[playerid][i]);
	}
	for(new i; i<MAX_ICONS; i++)
	{
		TextDrawHideForPlayer(playerid, GlobalMapIcon[i]);
	}
	return 1;
}

stock CreatePlayerIcon(playerid,IconID,const type,Float:x,Float:y)
{
    if(!IsPlayerConnected(playerid))
	{
	    printf("[PlayersMap-debug] Attempted to create player icon for a player that does not exist (playerid:%d).", playerid);
	    return -1;
	}
    if(type == 0 || type == 1 || type == 3) // these icons (as far as I know) don`t have a TextDraw to be shown with
	{
	    printf("[PlayersMap-debug] Attempted to create player icon type %d on the map, that type is not available.", type);
	    return -1;
	}
	if(type < 0 || type > 63) // these icons don`t exist in SAMP
	{
	    printf("[PlayersMap-debug] Attempted to create player icon type %d on the map, that type does not exist.", type);
	    return -1;
	}
	if(IconID < 0 || IconID > MAX_PLAYER_ICONS)
	{
	    printf("[PlayersMap-debug] Attempted to create player icon ID %d on the map, that icon ID is above the maximum (MAX_PLAYER_ICONS) or below zero.", IconID);
	    return -1;
	}
	if(IsPlayerIconUsed[playerid][IconID] == 1)
	{
	    printf("[PlayersMap-debug] Attempted to create player icon ID %d on the map, that icon ID is already being used for another icon, you first need to destroy it.", IconID);
	    return -1;
	}
	new Float:X,Float:Y;
	if(y < 0) Y=(y-(y*2))/15+212;
	else Y=212-y/15;
	if(x < 0) X=311-((x-(x*2))/14.8);
	else X=311+x/14.8;
	switch(type)
	{
		case 2: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_centre");
		case 4: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_north");
		case 5: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_airYard");
		case 6: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_ammugun");
		case 7: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_barbers");
		case 8: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_BIGSMOKE");
		case 9: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_boatyard");
		case 10: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_burgerShot");
		case 11: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_bulldozer");
		case 12: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_CATALINAPINK");
		case 13: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_CESARVIAPANDO");
		case 14: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_chicken");
		case 15: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_CJ");
		case 16: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_CRASH1");
		case 17: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_diner");
		case 18: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_emmetGun");
		case 19: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_enemyAttack");
		case 20: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_fire");
		case 21: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_girlfriend");
		case 22: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_hostpital");
		case 23: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_LocoSyndicate");
		case 24: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_MADDOG");
		case 25: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_mafiaCasino");
		case 26: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_MCSTRAP");
		case 27: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_modGarage");
		case 28: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_OGLOC");
		case 29: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_pizza");
		case 30: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_police");
		case 31: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_propertyG");
		case 32: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_propertyR");
		case 33: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_race");
		case 34: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_RYDER");
		case 35: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_saveGame");
		case 36: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_school");
		case 37: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_qmark");
		case 38: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_SWEET");
		case 39: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_tattoo");
		case 40: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_THETRUTH");
		case 41: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_waypoint");
		case 42: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_TORENO");
		case 43: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_triads");
		case 44: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_triadsCasino");
		case 45: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_tshirt");
		case 46: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_WOOZIE");
		case 47: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_ZERO");
		case 48: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_dateDisco");
		case 49: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_dateDrink");
		case 50: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_dateFood");
		case 51: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_truck");
		case 52: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_cash");
		case 53: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_Flag");
		case 54: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_gym");
		case 55: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_impound");
		case 56: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_light");
		case 57: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_runway");
		case 58: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_gangB");
		case 59: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_gangP");
		case 60: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_gangY");
		case 61: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_gangN");
		case 62: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_gangG");
		case 63: PlayerMapIcon[playerid][IconID] = CreatePlayerTextDraw(playerid, X, Y, "hud:radar_spray");
 	}
	PlayerTextDrawBackgroundColor(playerid, PlayerMapIcon[playerid][IconID], 255);
	PlayerTextDrawFont(playerid, PlayerMapIcon[playerid][IconID], 4);
	PlayerTextDrawLetterSize(playerid, PlayerMapIcon[playerid][IconID], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid, PlayerMapIcon[playerid][IconID], -1);
	PlayerTextDrawSetOutline(playerid, PlayerMapIcon[playerid][IconID], 0);
	PlayerTextDrawSetProportional(playerid, PlayerMapIcon[playerid][IconID], 1);
	PlayerTextDrawSetShadow(playerid, PlayerMapIcon[playerid][IconID], 1);
	PlayerTextDrawUseBox(playerid, PlayerMapIcon[playerid][IconID], 1);
	PlayerTextDrawBoxColor(playerid, PlayerMapIcon[playerid][IconID], 255);
	PlayerTextDrawTextSize(playerid, PlayerMapIcon[playerid][IconID], 14.000000, 14.000000);
	if(OnMap[playerid] == true)
	{
		PlayerTextDrawShow(playerid, PlayerMapIcon[playerid][IconID]);
	}
	IsPlayerIconUsed[playerid][IconID] = 1;
	return IconID;
}

stock DestroyPlayerIcon(playerid, IconID)
{
    if(!IsPlayerConnected(playerid) || IconID > MAX_PLAYER_ICONS || IconID < 0)
	{
	    return 0;
	}
    PlayerTextDrawHide(playerid, PlayerMapIcon[playerid][IconID]);
	PlayerTextDrawDestroy(playerid, PlayerMapIcon[playerid][IconID]);
	IsPlayerIconUsed[playerid][IconID] = 0;
	return 1;
}

stock CreateIcon(IconID,const type,Float:x,Float:y)
{
    if(type == 0 || type == 1 || type == 3) // these icons (as far as I know) don`t have a TextDraw to be shown with
	{
	    printf("[PlayersMap-debug] Attempted to create global icon type %d on the map, that type is not available.", type);
	    return -1;
	}
	if(type < 0 || type > 63) // these icons don`t exist in SAMP
	{
	    printf("[PlayersMap-debug] Attempted to create global icon type %d on the map, that type does not exist.", type);
	    return -1;
	}
	if(IconID < 0 || IconID > MAX_PLAYER_ICONS)
	{
	    printf("[PlayersMap-debug] Attempted to create global icon ID %d on the map, that icon ID is above the maximum (MAX_ICONS) or below zero.", IconID);
	    return -1;
	}
	if(IsIconUsed[IconID] == 1)
	{
	    printf("[PlayersMap-debug] Attempted to create icon ID %d on the map, that icon ID is already being used for another icon, you first need to destroy it.", IconID);
	    return -1;
	}
	new Float:X,Float:Y;
	if(y < 0) Y=(y-(y*2))/15+212;
	else Y=212-y/15;
	if(x < 0) X=311-((x-(x*2))/14.8);
	else X=311+x/14.8;
	switch(type)
	{
		case 2: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_centre");
		case 4: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_north");
		case 5: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_airYard");
		case 6: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_ammugun");
		case 7: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_barbers");
		case 8: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_BIGSMOKE");
		case 9: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_boatyard");
		case 10: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_burgerShot");
		case 11: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_bulldozer");
		case 12: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_CATALINAPINK");
		case 13: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_CESARVIAPANDO");
		case 14: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_chicken");
		case 15: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_CJ");
		case 16: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_CRASH1");
		case 17: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_diner");
		case 18: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_emmetGun");
		case 19: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_enemyAttack");
		case 20: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_fire");
		case 21: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_girlfriend");
		case 22: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_hostpital");
		case 23: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_LocoSyndicate");
		case 24: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_MADDOG");
		case 25: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_mafiaCasino");
		case 26: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_MCSTRAP");
		case 27: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_modGarage");
		case 28: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_OGLOC");
		case 29: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_pizza");
		case 30: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_police");
		case 31: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_propertyG");
		case 32: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_propertyR");
		case 33: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_race");
		case 34: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_RYDER");
		case 35: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_saveGame");
		case 36: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_school");
		case 37: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_qmark");
		case 38: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_SWEET");
		case 39: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_tattoo");
		case 40: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_THETRUTH");
		case 41: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_waypoint");
		case 42: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_TORENO");
		case 43: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_triads");
		case 44: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_triadsCasino");
		case 45: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_tshirt");
		case 46: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_WOOZIE");
		case 47: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_ZERO");
		case 48: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_dateDisco");
		case 49: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_dateDrink");
		case 50: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_dateFood");
		case 51: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_truck");
		case 52: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_cash");
		case 53: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_Flag");
		case 54: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_gym");
		case 55: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_impound");
		case 56: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_light");
		case 57: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_runway");
		case 58: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_gangB");
		case 59: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_gangP");
		case 60: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_gangY");
		case 61: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_gangN");
		case 62: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_gangG");
		case 63: GlobalMapIcon[IconID] = TextDrawCreate(X, Y, "hud:radar_spray");
	}
	TextDrawBackgroundColor(GlobalMapIcon[IconID], 255);
	TextDrawFont(GlobalMapIcon[IconID], 4);
	TextDrawLetterSize(GlobalMapIcon[IconID], 0.500000, 1.000000);
	TextDrawColor(GlobalMapIcon[IconID], -1);
	TextDrawSetOutline(GlobalMapIcon[IconID], 0);
	TextDrawSetProportional(GlobalMapIcon[IconID], 1);
	TextDrawSetShadow(GlobalMapIcon[IconID], 1);
	TextDrawUseBox(GlobalMapIcon[IconID], 1);
	TextDrawBoxColor(GlobalMapIcon[IconID], 255);
	TextDrawTextSize(GlobalMapIcon[IconID], 14.000000, 14.000000);
	for(new i = 0; i<MAX_PLAYERS; i++)
	{
 		if(OnMap[i] == true)
		{
		    TextDrawShowForPlayer(i, GlobalMapIcon[IconID]);
		}
	}
	IsIconUsed[IconID] = 1;
	return IconID;
}

stock DestroyIcon(IconID)
{
    if(IconID > MAX_ICONS || IconID < 0)
	{
	    return 0;
	}
    TextDrawHideForAll(GlobalMapIcon[IconID]);
	TextDrawDestroy(GlobalMapIcon[IconID]);
	IsIconUsed[IconID] = 0;
	return 1;
}

stock IsMapShownForPlayer(playerid)
{
	if(!IsPlayerConnected(playerid))
	{
	    return 0;
	}
	else if(OnMap[playerid] == true)
	{
		return 1;
	}
	else if(OnMap[playerid] == false)
	{
		return 0;
	}
}

stock LoadMapTD()
{
	if(loaded != 1)
	{
		Map = TextDrawCreate(120.0, 20.0, "samaps:map");
		TextDrawFont(Map, 4);
		TextDrawColor(Map, 0xFFFFFFFF);
		TextDrawTextSize(Map, 400.0, 400.0);

	    MapOutline[0] = TextDrawCreate(117.444427, 16.617773, "LD_SPAC:white");
		TextDrawTextSize(MapOutline[0], 3.000000, 406.000000);
		TextDrawAlignment(MapOutline[0], 1);
		TextDrawColor(MapOutline[0], 255);
		TextDrawSetShadow(MapOutline[0], 0);
		TextDrawBackgroundColor(MapOutline[0], 255);
		TextDrawFont(MapOutline[0], 4);
		TextDrawSetProportional(MapOutline[0], 0);

		MapOutline[1] = TextDrawCreate(519.222595, 17.115549, "LD_SPAC:white");
		TextDrawTextSize(MapOutline[1], 3.000000, 405.010009);
		TextDrawAlignment(MapOutline[1], 1);
		TextDrawColor(MapOutline[1], 255);
		TextDrawSetShadow(MapOutline[1], 0);
		TextDrawBackgroundColor(MapOutline[1], 255);
		TextDrawFont(MapOutline[1], 4);
		TextDrawSetProportional(MapOutline[1], 0);

		MapOutline[2] = TextDrawCreate(117.444740, 16.617767, "LD_SPAC:white");
		TextDrawTextSize(MapOutline[2], 404.000000, 4.000000);
		TextDrawAlignment(MapOutline[2], 1);
		TextDrawColor(MapOutline[2], 255);
		TextDrawSetShadow(MapOutline[2], 0);
		TextDrawBackgroundColor(MapOutline[2], 255);
		TextDrawFont(MapOutline[2], 4);
		TextDrawSetProportional(MapOutline[2], 0);

		MapOutline[3] = TextDrawCreate(117.444793, 418.822204, "LD_SPAC:white");
		TextDrawTextSize(MapOutline[3], 404.000000, 4.000000);
		TextDrawAlignment(MapOutline[3], 1);
		TextDrawColor(MapOutline[3], 255);
		TextDrawSetShadow(MapOutline[3], 0);
		TextDrawBackgroundColor(MapOutline[3], 255);
		TextDrawFont(MapOutline[3], 4);
		TextDrawSetProportional(MapOutline[3], 0);
		
		loaded = 1;
	}
	return 1;
}

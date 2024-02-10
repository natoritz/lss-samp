#pragma warning disable 217

#include <a_samp>
#undef MAX_PLAYERS
    #define MAX_PLAYERS (350)

#include <a_mysql>
#include <Pawn.RakNet>
#include <streamer>
#include <foreach>
#include <sscanf2>
#include <crashdetect>
#include <zcmd>
#include <handev>
#include <nex-ac>
#include <easy-dialog>
#include <weapon-data>
#include <strlib>
#include <3dmenu>
#include <evi>
#include <ysf>
#include <PreviewModel>
#include <TD-Streamer>
#include <discord-connector>

main () {}
new MySQL: m_Handle;

new Menu: main_page,
    Menu: sub_page;

new DCC_Channel: cctv_channel;
new DCC_Channel: impound_channel;
new DCC_Channel: fines_channel;
new DCC_Channel: jail_channel;



#include "lss_globals.pwn"
#include "lss_anticheat.pwn"
#include "lss_callbacks.pwn"
#include "lss_acmds.pwn"
#include "lss_pcmds.pwn"
#include "lss_animations.pwn"
#include "lss_dialogs.pwn"
#include "lss_poker.pwn"
#include "lss_functions.pwn"
#include "lss_mdc.pwn"
#include "lss_maps.pwn"


public OnGameModeInit()
{
    Streamer_TickRate(60);
    Streamer_SetVisibleItems(STREAMER_TYPE_OBJECT, 1000);
    Streamer_ToggleChunkStream(1);
    Streamer_ToggleErrorCallback(1);

    cctv_channel = DCC_FindChannelById("874734007131197470");
    impound_channel = DCC_FindChannelById("874734237704650793");
    fines_channel = DCC_FindChannelById("874734206834573362");
    jail_channel = DCC_FindChannelById("874734288506064906");



    new MySQLOpt: option_id = mysql_init_options();
    mysql_set_option(option_id, AUTO_RECONNECT, true);
    m_Handle = mysql_connect(MYSQL_HOSTNAME, MYSQL_USERNAME, MYSQL_PASSWORD, MYSQL_DATABASE, option_id);
    if (m_Handle == MYSQL_INVALID_HANDLE || mysql_errno(m_Handle) != 0)
    {
        print("MySQL baglantisi basarisiz, sunucu kapatiliyor.");
        SendRconCommand("exit");
        return 1;
    }

    mysql_set_charset("latin5", m_Handle);
    mysql_tquery(m_Handle, "SET NAMES `latin5`", "", "");
    mysql_tquery(m_Handle, "SET CHARACTER SET `latin5`","", "");
    mysql_tquery(m_Handle, "SET COLLATION_CONNECTION = `latin5_turkish_ci`", "", "");

    print("MySQL baglantisi basarili.");
    mysql_log(ERROR);

    SetGameModeText(REVISION);
    ShowPlayerMarkers(PLAYER_MARKERS_MODE_OFF);
    SetNameTagDrawDistance(20);
    EnableStuntBonusForAll(0);
    DisableInteriorEnterExits();
    ManualVehicleEngineAndLights();

    gettime(hour, second, minute);
    SetWorldTime(hour);
    SetWeather(weather);

    //commandChannel = DCC_FindChannelById("858246818050605056");
    // DCC_SendChannelMessage(commandChannel, "Testing");
    // DCC_SendChannelMessage(commandChannel, "Þesting");


    //Loading systems:
    mysql_tquery(m_Handle, "SELECT * FROM streets", "SQL_LoadStreets");
    mysql_tquery(m_Handle, "SELECT * FROM antenna", "SQL_LoadAntennas");

    mysql_tquery(m_Handle, "SELECT * FROM atms", "SQL_LoadATMs");
    mysql_tquery(m_Handle, "SELECT * FROM sprays", "SQL_LoadTags");
    mysql_tquery(m_Handle, "SELECT * FROM doors", "SQL_LoadDoors");
    mysql_tquery(m_Handle, "SELECT * FROM gates", "SQL_LoadGates");
    mysql_tquery(m_Handle, "SELECT * FROM models", "SQL_LoadModels");
    mysql_tquery(m_Handle, "SELECT * FROM actors", "SQL_LoadActors");
    mysql_tquery(m_Handle, "SELECT * FROM paynsprays", "SQL_LoadPNS");
    mysql_tquery(m_Handle, "SELECT * FROM objects", "SQL_LoadObjects");
    mysql_tquery(m_Handle, "SELECT * FROM garages", "SQL_LoadGarages");
    mysql_tquery(m_Handle, "SELECT * FROM cameras", "SQL_LoadCameras");
    mysql_tquery(m_Handle, "SELECT * FROM garbages", "SQL_LoadGarbages");
    mysql_tquery(m_Handle, "SELECT * FROM entrances", "SQL_LoadEntrances");
    mysql_tquery(m_Handle, "SELECT * FROM billboards", "SQL_LoadBillboards");
    mysql_tquery(m_Handle, "SELECT * FROM dealerships", "SQL_LoadDealerships");
    mysql_tquery(m_Handle, "SELECT * FROM dealership_categories", "SQL_LoadDealershipCats");

    mysql_tquery(m_Handle, "SELECT * FROM truck_cargo", "SQL_LoadTruckers");

    mysql_tquery(m_Handle, "SELECT * FROM factions", "SQL_LoadFactions");
    mysql_tquery(m_Handle, "SELECT * FROM businesses", "SQL_LoadBusinesses");
    mysql_tquery(m_Handle, "SELECT * FROM vehicles WHERE FactionID != -1 OR RentalID != 0", "SQL_LoadVehicles");
    mysql_tquery(m_Handle, "SELECT * FROM xmr_sub", "SQL_LoadXMRCategories");
    mysql_tquery(m_Handle, "SELECT * FROM impoundlots", "SQL_LoadImpound");
    mysql_tquery(m_Handle, "SELECT * FROM xmr_data", "SQL_LoadXMRData");
    mysql_tquery(m_Handle, "SELECT * FROM chopshop", "SQL_LoadChopshop");
    mysql_tquery(m_Handle, "SELECT * FROM tolls", "SQL_LoadTolls");


    //DCC_SendChannelMessage(g_WelcomeChannelId, "*** The Machine has been started now.");

    Ship_Init();
    Warship_Init();

    main_page = CreateMenu("Los Santos Gazetesi", 3, 75.0, 170.0, 750.0, 150.0);
    SetMenuColumnHeader(main_page, 0, "Vatandas Bilgisi");
    AddMenuItem(main_page, 0, "Sonraki Sayfa");
    AddMenuItem(main_page, 0, "Taksi nasil cagririm?");
    AddMenuItem(main_page, 0, "Otobus rotalari");
    AddMenuItem(main_page, 0, "Nerede yasarim");
    AddMenuItem(main_page, 0, "Hastane Yardimi");
    AddMenuItem(main_page, 0, "Polis Yardimi");
    AddMenuItem(main_page, 0, "OOC: Forum Linki");

    sub_page = CreateMenu("Los Santos Gazetesi", 3, 75.0, 170.0, 750.0, 150.0);
    SetMenuColumnHeader(sub_page, 0, "Legal Meslekler");
    AddMenuItem(sub_page, 0, "Sonraki Sayfa");
    AddMenuItem(sub_page, 0, "Trucker");
    AddMenuItem(sub_page, 0, "Taksi");
    AddMenuItem(sub_page, 0, "Copculuk");
    AddMenuItem(sub_page, 0, "Balikcilik");
    AddMenuItem(sub_page, 0, "Mekanik");

    //Mapping:
    LoadPNSGates();
    LoadModGates();
    LoadTollBooths();
    AddHousesInteriors();

    CreateDynamicPickup(1239, 1, EXTERIOR_TUNING_X, EXTERIOR_TUNING_Y, EXTERIOR_TUNING_Z, 0);

    CreateDynamicPickup(MECHANIC_PICKUP_ID, 1, MECHANIC_POS_X, MECHANIC_POS_Y, MECHANIC_POS_Z, 0);
    CreateDynamic3DTextLabel(MECHANIC_LABEL_TEXT, -1, MECHANIC_POS_X, MECHANIC_POS_Y, MECHANIC_POS_Z, 7.0, _, _, 0, 0);

    CreateDynamicPickup(MECHANIC_COMP_PICKUP_ID, 1, MECHANIC_COMP_POS_X, MECHANIC_COMP_POS_Y, MECHANIC_COMP_POS_Z, 0);
    CreateDynamic3DTextLabel(MECHANIC_COMP_LABEL_TEXT, -1, MECHANIC_COMP_POS_X, MECHANIC_COMP_POS_Y, MECHANIC_COMP_POS_Z, 7.0, _, _, 0, 0);

    // Vehicle (un)Registration
    CreateDynamic3DTextLabel("Ýllegal Araç Kayýt\n/arac kayitsil",COLOR_RED,2519.9568,-1484.8695,23.9967, 2.5);
    //Create3DTextLabel("Ýllegal Araç Kayýt\n/arac kayitsil",COLOR_RED,2519.9568,-1484.8695,23.9967,40,0,0);

    //DMV vehicles:
    dmv_vehicles[0] = AddStaticVehicle(405, 1273.0470, -1557.0576, 13.5405, -91.0000, 1, 1); SetVehicleNumberPlate(dmv_vehicles[0], "DMV");
    dmv_vehicles[1] = AddStaticVehicle(405, 1273.0470, -1549.9562, 13.5405, -91.0000, 1, 1); SetVehicleNumberPlate(dmv_vehicles[1], "DMV");
    dmv_vehicles[2] = AddStaticVehicle(405, 1273.0470, -1542.8961, 13.5405, -91.0000, 1, 1); SetVehicleNumberPlate(dmv_vehicles[2], "DMV");
    dmv_vehicles[3] = AddStaticVehicle(405, 1273.0470, -1536.0962, 13.5405, -91.0000, 1, 1); SetVehicleNumberPlate(dmv_vehicles[3], "DMV");
    for(new i; i < 4; i++) CarData[dmv_vehicles[i]][carFaction] = -1;

    taxi_vehicles[0] = AddStaticVehicle(438, 1281.7174, -1536.8301, 13.5405, -91.0000, 1, 1); SetVehicleNumberPlate(taxi_vehicles[0], "DMV");
    taxi_vehicles[1] = AddStaticVehicle(438, 1285.6564, -1529.6683, 13.5405, -91.0000, 1, 1); SetVehicleNumberPlate(taxi_vehicles[1], "DMV");
    taxi_vehicles[2] = AddStaticVehicle(438, 1273.0470, -1528.5847, 13.5405, -91.0000, 1, 1); SetVehicleNumberPlate(taxi_vehicles[2], "DMV");
    for(new i; i < 3; i++) CarData[taxi_vehicles[i]][carFaction] = -1;

    //Timers:
    SetTimer("LoadFurnitures", 10000, false);

    SetTimer("OnVehicleUpdate", 1000, true);
    SetTimer("RentalCheck", 3600000, true);
    SetTimer("FunctionPlayers", 1000, true);

    SetTimer("OnPlayerNearPickup", 1500, true);
    SetTimer("FillRandomGarbage", 300000, true);

    Pkr_InitialisePoker();
    SetTimer("Pkr_OnOneSecond", 1000, true);


    //Pickups
    CreateDynamicPickup(1239, 1, 2177.2847, -2259.5659, 14.7734, 0, 0, -1, 20.0);

    Masktd = TextDrawCreate(544.890441, 354.666625, "_");
    TextDrawFont(Masktd, TEXT_DRAW_FONT_MODEL_PREVIEW);
    TextDrawTextSize(Masktd, 80.0, 80.0);
    TextDrawSetPreviewModel(Masktd, 19036);
    TextDrawBackgroundColor(Masktd, 0);
    TextDrawSetPreviewRot(Masktd, 0.0, 0.0, 90.0, 1.0);

    blindfoldTextdraw = TextDrawCreate(0.999984, 0.429619, "box");
    TextDrawLetterSize(blindfoldTextdraw, 0.000000, 49.499942);
    TextDrawTextSize(blindfoldTextdraw, 664.000000, 0.000000);
    TextDrawAlignment(blindfoldTextdraw, 1);
    TextDrawColor(blindfoldTextdraw, -1);
    TextDrawUseBox(blindfoldTextdraw, 1);
    TextDrawBoxColor(blindfoldTextdraw, 255);
    TextDrawSetShadow(blindfoldTextdraw, 0);
    TextDrawSetOutline(blindfoldTextdraw, 0);
    TextDrawBackgroundColor(blindfoldTextdraw, 255);
    TextDrawFont(blindfoldTextdraw, 1);
    TextDrawSetProportional(blindfoldTextdraw, 1);
    TextDrawSetShadow(blindfoldTextdraw, 0);

//    CreateDynamicPickup(1239, 1, -1489.6921, 22.7626, 359.7074);
//    CreateDynamic3DTextLabel("/reklam", -1, -1489.6921, 22.7626, 359.707, 1.5);

//    CreateDynamicPickup(1239, 1, 1663.8573, -2330.1743, -2.6797);
 //   CreateDynamic3DTextLabel("/gazete", -1, 1663.8573, -2330.1743, -2.6797, 1.5);

    CreateDynamicPickup(1239, 1, 2676.0427, -2539.7114, 13.4232);
    CreateDynamic3DTextLabel("/meslek kamyoncu", -1, 2676.0427, -2539.7114, 13.4232, 1.5);
    return 1;
}

public OnGameModeExit()
{
    SaveProperties();
    SaveFactions();
    SaveBusinesses();
    SaveTolls();
    SavePaynSprays();
    SaveDoors();
    SavePropertyGarages();
    SaveTruckers();
    SaveEntrances();

    mysql_close(m_Handle);
    return 1;
}

public OnPlayerSelect3DMenuBox(playerid, MenuID, boxid, list, boxes)
{
    if(PlayerData[playerid][p3DMenu] == MenuID)
    {
        if(PlayerData[playerid][pHouseFurniture] != -1)
        {
            if(IsPlayerInProperty(playerid) != PlayerData[playerid][pHouseFurniture])
            {
                SendClientMessage(playerid, COLOR_ADM, "ERÝÞÝM REDDEDÝLDÝ: {FFFFFF}Bu komutu kullanabilmek için kendi evinizde olmalýsýnýz.");
                return 1;
            }
        }
        else if(PlayerData[playerid][pBizFurniture] != -1)
        {
            if(IsPlayerInBusiness(playerid) != PlayerData[playerid][pBizFurniture])
            {
                SendClientMessage(playerid, COLOR_ADM, "ERÝÞÝM REDDEDÝLDÝ: {FFFFFF}Bu komutu kullanabilmek için kendi iþyerinizde olmalýsýnýz.");
                return 1;
            }
        }

        new data[e_furniture], objid = GetPVarInt(playerid, "chose_slot");
        Streamer_GetArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data);

        new slot = GetPVarInt(playerid, "chose_texture");
        new tid = (list * boxes) + boxid; data[furnitureTexture][slot] = tid;
        SetDynamicObjectMaterial(objid, slot, ObjectTextures[tid][TModel], ObjectTextures[tid][TXDName], ObjectTextures[tid][TextureName], ObjectTextures[tid][MaterialColor]);
        Streamer_SetArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data);

        new query[74];
        mysql_format(m_Handle, query, sizeof(query), "UPDATE furnitures SET Texture_%i = %i WHERE id = %i", slot+1, data[furnitureTexture][slot], data[SQLID]);
        mysql_tquery(m_Handle, query);
        return 1;
    }
    return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid, bodypart)
{
    new gameId = Pkr_GetPlayerGame(playerid);
    if(gameId == -1)
        return 1;

    if(issuerid == INVALID_PLAYER_ID)
        return 1;

    if(GetPVarType(playerid, POKER_SIT_VAR_NAME) == PLAYER_VARTYPE_NONE)
        return 1;

    switch(GetPlayerTeam(playerid))
    {
        case STATE_DEAD:
        {
            SetPlayerHealth(playerid, 100);
            return 0;
        }

        case STATE_WOUNDED:
        {
            SetPlayerHealth(playerid, 100);
            return 0;
        }
    }

    SetCameraBehindPlayer(playerid);
    Pkr_HidePlayerTextDraws(playerid, gameId);
    TogglePlayerControllable(playerid, 0);
    SendClientMessage(playerid, COLOR_DARKGREEN, "Biri sana hasar verdiði için poker masasýndan kalktýn, tekrar oturmak için /pkr sit yazabilirsin.");
    DeletePVar(playerid, POKER_SIT_VAR_NAME);
    return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
{
    if(damagedid != INVALID_PLAYER_ID)
    {
        new
            Float: target_x,
            Float: target_y,
            Float: target_z,
            Float: distance;

        GetPlayerPos(damagedid, target_x, target_y, target_z);
        distance = floatround(GetPlayerDistanceFromPoint(playerid, target_x, target_y, target_z), floatround_round);

        // Punching with a parachute
        if (weaponid == WEAPON_PARACHUTE) {
          weaponid = 0;
          amount = 7.0;
        }

        switch (weaponid) {
          case WEAPON_COLT45 .. WEAPON_SNIPER,
               WEAPON_MINIGUN, WEAPON_SPRAYCAN, WEAPON_FIREEXTINGUISHER: {
            // A pistol whip inflicts 2.64 damage
            if (_:amount == _:2.6400001049041748046875) {
              bodypart = BODY_PART_HEAD;
              weaponid = 0;
              amount = 7.0;
            }
          }
        }

        switch(weaponid)
        {
            case 0: amount = 2.5;
            case 1: amount = 3.5;
            case 3: amount = 5.0;
            case 4: amount = 10.0;
            case 5: amount = 4.9;
            case 6: amount = 4.9;
            case 7: amount = 4.9;
            case 8: amount = 21;
            case 10..15: amount = 4;
            case 22: amount = 13.0;
            case 23: amount = 13.0;
            case 24: amount = 45.0;
            case 25: amount = 45.0;
            case 27: amount = 10;
            case 28: amount = 16.0;
            case 29: amount = 16.0;
            case 30: amount = 23.0;
            case 31: amount = 23.0;
            case 32: amount = 16.0;
            case 33: amount = 60;
            case 34: amount = 400;
        }

        switch(bodypart)
        {
            case BODY_PART_HEAD: amount = amount * 1.5;
            case BODY_PART_LEFT_LEG, BODY_PART_RIGHT_LEG: amount = amount * 0.8;
        }

        switch(distance)
        {
            case 46..70:
            {
                if(weaponid != WEAPON_SNIPER && weaponid != WEAPON_RIFLE) amount = amount * 0.74;
                else if(weaponid == WEAPON_M4 || weaponid == WEAPON_AK47 || weaponid == WEAPON_SHOTGUN) amount = amount * 0.79;
            }
            case 71..200:
            {
                if(weaponid != WEAPON_SNIPER && weaponid != WEAPON_RIFLE) amount = amount * 0.70;
                else if(weaponid == WEAPON_M4 || weaponid == WEAPON_AK47 || weaponid == WEAPON_SHOTGUN) amount = amount * 0.74;
            }
        }

        new Float: amoun;
        new Float: health, Float: armour;
        GetPlayerHealth(damagedid, health);
        GetPlayerArmour(damagedid, armour);

        switch(GetPlayerTeam(damagedid))
        {
            case STATE_DEAD:
            {
                SetPlayerHealth(damagedid, 100);
                return 0;
            }
            case STATE_WOUNDED:
            {
                if(!PlayerData[damagedid][pExecuteTime])
                {
                    SetDead(damagedid);
                    SetPlayerTeam(damagedid, STATE_DEAD);
                    return 0;
                }

                SetPlayerHealth(damagedid, 100);
                return 0;
            }
            case STATE_ALIVE:
            {
                if(weaponid == 0)
                {
                    SetPlayerHealth(damagedid, health-amount);
                }

                if(weaponid == 23 && PlayerData[playerid][pTaser])
                {
                    SetPlayerHealth(damagedid, health);
                    SetPlayerArmour(damagedid, armour);

                    if(!GetDistanceBetweenPlayers(playerid, damagedid, 20.0))
                    {
                        SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Kiþi senden çok uzak.");
                        return 0;
                    }

                    new vehicle = GetPlayerVehicleID(damagedid);
                    if(vehicle != 0 && !IsAMotorBike(vehicle) && !IsABike(vehicle))
                        return 1;

                    if(PlayerIsTased[damagedid])
                        return SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Kiþi zaten taserlanmýþ.");

                    if(vehicle != 0)
                        RemovePlayerFromVehicle(damagedid);

                    GetPlayerPos(damagedid, PlayerData[damagedid][pPos][0], PlayerData[damagedid][pPos][1], PlayerData[damagedid][pPos][2]);
                    cmd_ame(damagedid, sprintf("%s tarafýndan ateþlenen taser etkisiyle yere düþer.", ReturnName(playerid, 0)));
                    SendClientMessageEx(damagedid, COLOR_ADM, "[ ! ] {FFFFFF}%s seni taserladý, 10,000 volt vücudundan içeri girdi.", ReturnName(playerid, 0));
                    SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}%s isimli kiþiyi taserladýn.", ReturnName(damagedid, 0));
                    PlayAnimation(damagedid, "SWEET", "Sweet_injuredloop", 4.0, 1, 0, 0, 1, 0);
                    SetPlayerDrunkLevel(damagedid, 2500);
                    PlayerIsTased[damagedid] = 10;
                    return 1;
                }
                else if(weaponid == 25 && PlayerData[playerid][pRubberbullet])
                {
                    SetPlayerHealth(damagedid, health);
                    SetPlayerArmour(damagedid, armour);

                    if(!GetDistanceBetweenPlayers(playerid, damagedid, 20.0))
                    {
                        SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Kiþi senden çok uzak.");
                        return 0;
                    }

                    new vehicle = GetPlayerVehicleID(damagedid);
                    if(vehicle != 0 && !IsAMotorBike(vehicle) && !IsABike(vehicle))
                        return 1;

                    if(PlayerIsTased[damagedid])
                        return SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Kiþi zaten zarar vermeyen mermi ile vurulmuþ.");

                    if(vehicle != 0)
                        RemovePlayerFromVehicle(damagedid);

                    GetPlayerPos(damagedid, PlayerData[damagedid][pPos][0], PlayerData[damagedid][pPos][1], PlayerData[damagedid][pPos][2]);
                    cmd_ame(damagedid, sprintf("%s tarafýndan ateþlenen plastik merminin etkisiyle yere düþer.", ReturnName(playerid, 0)));
                    SendClientMessageEx(damagedid, COLOR_ADM, "[ ! ] {FFFFFF}%s seni plastik mermiyle vurdu.", ReturnName(playerid, 0));
                    SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}%s isimli kiþiyi plastik mermiyle vurdun.", ReturnName(damagedid, 0));
                    PlayAnimation(damagedid, "SWEET", "Sweet_injuredloop", 4.0, 1, 0, 0, 1, 0);
                    SetPlayerDrunkLevel(damagedid, 2500);
                    PlayerIsTased[damagedid] = 20;
                    return 1;
                }
                else if(weaponid == 33 && PlayerData[playerid][pLethalbullet])
                {
                    SetPlayerHealth(damagedid, health);
                    SetPlayerArmour(damagedid, armour);

                    if(!GetDistanceBetweenPlayers(playerid, damagedid, 50.3))
                    {
                        SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Kiþi senden çok uzak.");
                        return 0;
                    }

                    new vehicle = GetPlayerVehicleID(damagedid);
                    if(vehicle != 0 && !IsAMotorBike(vehicle) && !IsABike(vehicle))
                        return 1;

                    if(PlayerIsTased[damagedid])
                        return SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Kiþi zaten 40mm LTL ile vurulmuþ.");

                    if(vehicle != 0)
                        RemovePlayerFromVehicle(damagedid);

                    GetPlayerPos(damagedid, PlayerData[damagedid][pPos][0], PlayerData[damagedid][pPos][1], PlayerData[damagedid][pPos][2]);
                    cmd_ame(damagedid, sprintf("%s tarafýndan ateþlenen 40mm plastik merminin etkisiyle yere düþer.", ReturnName(playerid, 0)));
                    SendClientMessageEx(damagedid, COLOR_ADM, "[ ! ] {FFFFFF}%s seni 40mm plastik mermiyle vurdu.", ReturnName(playerid, 0));
                    SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}%s isimli kiþiyi 40mm plastik mermiyle vurdun.", ReturnName(damagedid, 0));
                    PlayAnimation(damagedid, "SWEET", "Sweet_injuredloop", 4.0, 1, 0, 0, 1, 0);
                    SetPlayerDrunkLevel(damagedid, 2500);
                    PlayerIsTased[damagedid] = 20;
                    return 1;
                }

                if(armour > 0)
                {
                    amoun = armour - amount;
                    if(amoun <= 0)
                    {
                        SetPlayerHealth(damagedid, health - amount);
                    }
                    else
                    {
                        if(bodypart != BODY_PART_HEAD && bodypart != BODY_PART_RIGHT_LEG && bodypart != BODY_PART_LEFT_LEG)
                            SetPlayerArmour(damagedid, armour - amount);
                        else
                            SetPlayerHealth(damagedid, health - amount);
                    }
                }
                else SetPlayerHealth(damagedid, health - amount);

                if(bodypart == BODY_PART_LEFT_LEG || bodypart == BODY_PART_RIGHT_LEG)
                {
                    if(!PlayerData[damagedid][pLegShot])
                    {
                        PlayerData[damagedid][pLegShot] = 1;
                        LegShotTimer[damagedid] = SetTimerEx("LegShotEnd", 900000, false, "i", damagedid);
                        SendClientMessage(damagedid, COLOR_ADM, "-> Bacaðýndan vuruldun, bu durumda koþamayacak ve zýplayamayacaksýn.");
                    }
                }

                /*if(health - amount <= 30.0 && !PlayerData[damagedid][pLowSkill])
                {
                    SetPlayerDrunkLevel(damagedid, 4000);
                    SendClientMessage(damagedid, COLOR_ADM, "-> Canýn azaldý, atýþ becerilerin orta seviyeye geriledi.");
                    SetPlayerSkillLevel(damagedid, WEAPONSKILL_PISTOL, 200);
                    SetPlayerSkillLevel(damagedid, WEAPONSKILL_AK47, 200);
                    SetPlayerSkillLevel(damagedid, WEAPONSKILL_DESERT_EAGLE, 200);
                    SetPlayerSkillLevel(damagedid, WEAPONSKILL_SHOTGUN, 200);
                    SetPlayerSkillLevel(damagedid, WEAPONSKILL_M4, 200);
                    SetPlayerSkillLevel(damagedid, WEAPONSKILL_MP5, 200);
                    PlayerData[damagedid][pLowSkill] = true;
                }*/

                if(health - amount <= 5)
                {
                    if(IsPlayerInAnyVehicle(damagedid)) SetBrutallyWounded(damagedid, playerid, weaponid, 1);
                    else SetBrutallyWounded(damagedid, playerid, weaponid, 0);
                    SetPlayerTeam(damagedid, STATE_WOUNDED);
                    return 0;
                }

                if(health - amount <= 1)
                {
                    if(IsPlayerInAnyVehicle(playerid)) SetBrutallyWounded(damagedid, playerid, weaponid, 1);
                    else SetBrutallyWounded(damagedid, playerid, weaponid, 0);
                    SetPlayerTeam(damagedid, STATE_WOUNDED);
                    return 0;
                }
            }
        }

        Damages_Add(damagedid, playerid, weaponid, bodypart, amount);
    }
    return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    for(new i; i < 4; ++i) if(weaponid == blacklisted_weaps[i])
    {
        KickEx(playerid);
        return 1;
    }

    new
        index = Weapon_GetSlotID(weaponid);

    if(index == -1)
        return 0;

    if(PlayerData[playerid][pWeapons][index] != weaponid)
        return 0;

    if(PlayerData[playerid][pWeaponsAmmo][index] > 1)
    {
        PlayerData[playerid][pWeaponsAmmo][index]--;
    }
    else
    {
        PlayerData[playerid][pWeapons][index] = PlayerData[playerid][pWeaponsAmmo][index] = 0;
    }

    if(hittype == BULLET_HIT_TYPE_PLAYER)
    {

        switch(GetPlayerTeam(hitid))
        {
            case STATE_WOUNDED:
            {
                if(!PlayerData[hitid][pExecuteTime])
                {
                    SetDead(hitid);
                    SetPlayerTeam(hitid, STATE_DEAD);
                    return 0;
                }
            }
        }
    }


      foreach(new cam : Cameras) if(IsPlayerInRangeOfPoint(playerid, 2.5, CameraData[cam][CameraLocation][0], CameraData[cam][CameraLocation][1], CameraData[cam][CameraLocation][2]) && GetPlayerInterior(playerid) == CameraData[cam][CameraInterior] && GetPlayerVirtualWorld(playerid) == CameraData[cam][CameraWorld])
      {

        printf("%d",GetPlayerVehicleID(playerid));

        if(weaponid == 0)
          return 1;

        if(GetPVarInt(playerid, "cctvShot") == 1)
          return 1;

        if(weaponid == 23 && PlayerData[playerid][pTaser])
          return 1;

        if(weaponid == 25 && PlayerData[playerid][pRubberbullet])
          return 1;

        if(weaponid == 33 && PlayerData[playerid][pLethalbullet])
          return 1;

        new cctv_message[256];

        if(!IsPlayerInAnyVehicle(playerid))
        {
          if(PlayerData[playerid][pMaskOn])
          {
            if(PlayerData[playerid][pGender] == 0)
            {
              format(cctv_message, sizeof(cctv_message), "Maskeli bir erkek %s bölgesinde ateþ açarken görüldü. [%s] ", Player_GetLocation(playerid), GetFullTime(Time()));
            }
            else
            {
              format(cctv_message, sizeof(cctv_message), "Maskeli bir kadýn %s bölgesinde ateþ açarken görüldü. [%s] ", Player_GetLocation(playerid), GetFullTime(Time()));
            }
          }
          else
          {
            format(cctv_message, sizeof(cctv_message), "%s isimli kiþi %s bölgesinde ateþ açarken görüldü. [%s] ", ReturnName(playerid), Player_GetLocation(playerid), GetFullTime(Time()));
          }
        }
        else if(IsPlayerInAnyVehicle(playerid))
        {
          if(PlayerData[playerid][pMaskOn])
          {
            if(PlayerData[playerid][pGender] == 0)
            {
              format(cctv_message, sizeof(cctv_message), "Maskeli bir erkek %s bölgesinde araç içerisinden ateþ açarken görüldü. [%s] - [Araç Bilgileri: %s - %s]", Player_GetLocation(playerid), GetFullTime(Time()), ReturnVehicleModelName(GetVehicleModel(GetPlayerVehicleID(playerid))), ReturnVehiclePlate(GetPlayerVehicleID(playerid)));
            }
            else
            {
              format(cctv_message, sizeof(cctv_message), "Maskeli bir kadýn %s bölgesinde araç içerisinden ateþ açarken görüldü. [%s] - [Araç Bilgileri: %s - %s]", Player_GetLocation(playerid), GetFullTime(Time()), ReturnVehicleModelName(GetVehicleModel(GetPlayerVehicleID(playerid))), ReturnVehiclePlate(GetPlayerVehicleID(playerid)));
            }
          }
          else
          {
            format(cctv_message, sizeof(cctv_message), "%s isimli kiþi %s bölgesinde araç içerisinden ateþ açarken görüldü. [%s] - [Araç Bilgileri: %s - %s]", ReturnName(playerid), Player_GetLocation(playerid), GetFullTime(Time()), ReturnVehicleModelName(GetVehicleModel(GetPlayerVehicleID(playerid))), ReturnVehiclePlate(GetPlayerVehicleID(playerid)));
          }
        }


        DCC_SendChannelMessage(cctv_channel, FixDiscordWord(cctv_message));
        SetPVarInt(playerid, "cctvShot", 1);
        SetTimerEx("RemoveCCTVShot", 10000, false, "i", playerid);
    }

    if(weaponid == 23 && PlayerData[playerid][pTaser])
    {
        PlayerPlaySoundEx(playerid, 6003);
        PlayAnimation(playerid, "COLT45", "colt45_reload", 4.1, 0, 0, 0, 0, 0, 1);
        if(GetPlayerWeaponState(playerid) == WEAPONSTATE_LAST_BULLET) cmd_taser(playerid, "");
    }

    if(GetPlayerAmmo(playerid) == 1 && hittype == WEAPONSTATE_LAST_BULLET)
    {
        SendServerMessage(playerid, "Mermin bittiði için silahýn silindi.");
        Player_RemoveWeapon(playerid, weaponid);
        PlayerData[playerid][pWeapons][ Weapon_GetSlotID(weaponid) ] = 0;
        PlayerData[playerid][pWeaponsAmmo][ Weapon_GetSlotID(weaponid) ] = 0;
    }
    return 1;
}


public OnPlayerConnect(playerid)
{
    Player_DefaultValues(playerid);
    TogglePlayerSpectating(playerid, 1);
    SetPlayerScore(playerid, 1);
    SetPlayerColor(playerid, COLOR_WHITE);
    SetPlayerTeam(playerid, STATE_ALIVE);
    LoadPlayerTextdraw(playerid);
    PreloadAnimations(playerid);

    // Init all of the textdraw related globals
    Dealership_Next_Arrow[playerid] = Dealership_Prev_Arrow[playerid] = Dealership_Model_Cat[playerid] = PlayerText:INVALID_TEXT_DRAW;

    for(new x=0; x < DEALERSHIP_PER_PAGE; x++) {
        Dealership_Model[playerid][x] = Dealership_Model_Name[playerid][x] = Dealership_Model_Price[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
    }

    foreach(new i : Player) if(PlayerData[i][pConnectStatus])
    {
        SendClientMessageEx(i, COLOR_GREY, "** %s[%i] sunucuya baðlandý. IP: %s", ReturnName(playerid), playerid, ReturnIP(playerid));
    }

    RemoveBuildingForPlayer(playerid, 1266, 2317.5859, -1355.8281, 37.2188, 0.25);
    RemoveBuildingForPlayer(playerid, 615, 1147.6016, -1416.8750, 13.9531, 0.25);

    RemoveBuildingForPlayer(playerid, 985, 2497.409, 2777.070, 11.531, 0.250);
    RemoveBuildingForPlayer(playerid, 986, 2497.409, 2769.110, 11.531, 0.250);
    ClearLines(playerid, 20);
    return 1;
}

forward OnPlayerFinishedDownloading(playerid, virtualworld);
public OnPlayerFinishedDownloading(playerid, virtualworld)
{
    if(!pLoggedIn[playerid])
    {
        g_MysqlRaceCheck[playerid]++;
        SetTimerEx("CheckAccount", 1000, false, "ii", playerid, g_MysqlRaceCheck[playerid]);
    }
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_SELECT_SKIN)
    {
        if(response)
        {
            new modelid;
            if(PlayerData[playerid][pGender] == 0)
            {
                modelid = erkekSkin[listitem][modelidx];
            }
            else
            {
                modelid = kadinSkin[listitem][modelidx];
            }

            PlayerData[playerid][pSkin] = modelid;

            ClearLines(playerid, 20);
      			PlayerData[playerid][pFirstLogin] = 0;
      			SaveSQLInt(PlayerData[playerid][pSQLID], "players", "FirstLogin", 0);
      			TogglePlayerSpectating(playerid, 0);
      			SetPlayerSpawn(playerid);
        }
        else Kick(playerid);
    }

    if(dialogid == DIALOG_SELECT_SKIN2)
    {
        if(response)
        {
            new modelid;
            if(PlayerData[playerid][pGender] == 0)
            {
                modelid = erkekSkin[listitem][modelidx];
            }
            else
            {
                modelid = kadinSkin[listitem][modelidx];
            }

            PlayerData[playerid][pSkin] = modelid;
            SetPlayerSkin(playerid, modelid);
        }
    }

    if(dialogid == DIALOG_SELECT_ACCESSORY)
    {
        if(response)
        {
            new modelid;
            modelid = aksesuarListe[listitem][modelidx];

            new clothing_id = FreeAttachmentSlot(playerid);

            SendClientMessage(playerid, COLOR_WHITE, "ÝPUCU: {FFFF00}SPACE{FFFFFF} basarak bakýnabilirsin. Ýptal etmek için {FFFF00}ESC{FFFFFF} basabilirsin.");
            SetPlayerAttachedObject(playerid, clothing_id, modelid, 2);
            EditAttachedObject(playerid, clothing_id);

            format(PlayerData[playerid][pClothingName], 32, "%s", Clothing_GetNameFromModelID(modelid));
            PlayerData[playerid][pClothingPrice] = Clothing_GetPriceFromModelID(modelid);
            PlayerData[playerid][pBuyingClothing] = true;
        }
    }

    for (new i, l = strlen(inputtext); i < l; i ++)
    {
        if (inputtext[i] == '%')
        {
            inputtext[i] = '#';
        }
    }

    switch(dialogid)
    {
        case DIALOG_SELECT_HOUSE:
        {
            if(response)
            {
                new id = playerHouseSelect[playerid][listitem];

                PlayerData[playerid][pSpawnPoint] = SPAWN_POINT_PROPERTY;
                PlayerData[playerid][pSpawnPointHouse] = id;

                SendServerMessage(playerid, "Artýk seçtiðin %i numaralý evinde oyuna baþlayacaksýn.", listitem);
            }
            return 1;
        }

        /*case DIALOG_CONFIRM_SYS:
        {
            ConfirmDialog_Response(playerid, response);
        }*/
        case DIALOG_REMOVE_COMP:
        {
            if(!response) return 0;

            new vid = GetPlayerVehicleID(playerid);
            new component;
            new count;

            if(vid == -1) return 1;

            if(CarData[vid][carOwnerID] != PlayerData[playerid][pSQLID])
                return SendServerMessage(playerid, "Bu araca sahip deðilsin.");

            if(!listitem)
            {
                for(new j; j < 14; j++)
                {
                    component = GetVehicleComponentInSlot(vid, j);
                    if(!component)continue;
                    RemoveVehicleComponent(vid, component);
                    CarData[vid][carMods][GetVehicleComponentType(component)] = 0;
                    Car_Save(vid);
                    count++;
                }

                if(!count) return SendErrorMessage(playerid, "Hiç modifiye parçan yok.");

                SendServerMessage(playerid, "Parçalar baþarýyla silindi.");
                return 1;
            }

            if(listitem == 1)
            {
                if(!count && CarData[vid][carPaintjob] == 3)
                    return SendServerMessage(playerid, "Bu araçta hiç paintjob yok.");

                CarData[vid][carPaintjob] = 3;
                ChangeVehiclePaintjob(vid, 3);
                ChangeVehicleColor(vid, CarData[vid][carColor1], CarData[vid][carColor2]);
                SendServerMessage(playerid, "Paintjob baþarýyla silindi.");
                return Car_Save(vid);
            }

            listitem -= 2; component = GetVehicleComponentInSlot(vid, listitem);

            if(!component)return
                SendServerMessage(playerid, "Hiç modifiye parçan yok.");

            RemoveVehicleComponent(vid, component);
            CarData[vid][carMods][GetVehicleComponentType(component)] = 0;
            Car_Save(vid);

            SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %s (#%d) parça silindi.", GetComponentName(component), component);
        }

        case DIALOG_SPRAY_CREATE:
        {
            if(!response) return 1;
            Spray_Create(playerid, g_spraytag[listitem][tag_modelid]);
            return 1;
        }
        case DIALOG_SPRAY_MAIN:
        {
            if(!response) return 1;
            switch(listitem)
            {
                case 0: ShowSprayDialog(playerid, DIALOG_SPRAY_IMAGE);
                case 1: ShowSprayDialog(playerid, DIALOG_SPRAY_INPUT);
                case 2: ShowSprayDialog(playerid, DIALOG_SPRAY_FONT);
            }
            return 1;
        }
        case DIALOG_SPRAY_IMAGE:
        {
            if(!response) return ShowSprayDialog(playerid, DIALOG_SPRAY_MAIN);
            PlayerData[playerid][pSprayFont] = g_spraytag[listitem][tag_modelid];
            PlayerData[playerid][pSprayAllow] = 2;
            PlayerData[playerid][pSprayLength] = 10;
            PlayerData[playerid][pSprayPoint] = 1;
            SendClientMessageEx(playerid, COLOR_YELLOW, "Graffiti resmini seçtin: {FFFFFF}%s", g_spraytag[listitem][tag_name]);
            return 1;
        }
        case DIALOG_SPRAY_INPUT:
        {
            if(!response) return ShowSprayDialog(playerid, DIALOG_SPRAY_MAIN);
            if(!strlen(inputtext)) return ShowSprayDialog(playerid, DIALOG_SPRAY_INPUT);

            PlayerData[playerid][pSprayAllow] = 1;
            PlayerData[playerid][pSprayLength] = strlen(inputtext);
            PlayerData[playerid][pSprayPoint] = 0;
            PlayerData[playerid][pSprayTarget] = Spray_Nearest(playerid);

            SendClientMessage(playerid, COLOR_YELLOW, "Graffiti yazýsýný ayarladýn.");
            new str[128];
            format(str, sizeof(str), "%s", inputtext);
            SendClientMessageEx(playerid, COLOR_WHITE, str);
            PlayerData[playerid][pSprayText] = str;
            return 1;
        }
        case DIALOG_SPRAY_FONT:
        {
            if(!response) return ShowSprayDialog(playerid, DIALOG_SPRAY_MAIN);

            SendClientMessageEx(playerid, COLOR_YELLOW, "Graffiti yazý tipini seçtin: {FFFFFF}%s", font_data[listitem][font_name]);
            PlayerData[playerid][pSprayFont] = listitem;
            return 1;
        }
        case DIALOG_DEALERSHIP_APPEND:
        {
          if(GetPlayerVehicleID(playerid) != g_aVehicleSpawned[playerid])
            {
              if(IsValidVehicle(g_aVehicleSpawned[playerid])) DestroyVehicle(g_aVehicleSpawned[playerid]);
              TogglePlayerControllable(playerid, 1);
              return ResetDealershipVars(playerid);
            }

            new
                caption[60],
                str[1024],
                price[128];

            format(caption, 60, "%s - {33AA33}%s", DealershipData[SubDealershipHolder[playerid]][DealershipModelName], MoneyFormat(g_aTotalAmount[playerid] + GetPVarInt(playerid, "InsPrice") + GetPVarInt(playerid, "LockPrice") + GetPVarInt(playerid, "ImmobPrice") + GetPVarInt(playerid, "AlarmPrice")));

            if(response)
            {
                switch(listitem)
                {
                    case 0: //Alarms;
                    {
                        new car_price = DealershipData[ SubDealershipHolder[playerid] ][DealershipPrice];
                        strcat(str, "Alarm Yok\n");
                        if(g_aAlarmLevel[playerid] == 1)
                        {
                            format(price, sizeof(price), "{FFFF00}>>{FFFFFF}Alarm Seviyesi 1 - $%s\n", MoneyFormat(floatround(car_price * 0.20 * 1)));
                            strcat(str, price);
                        }
                        else { format(price, sizeof(price), "Alarm Seviyesi 1 - $%s\n", MoneyFormat(floatround(car_price * 0.20 * 1))), strcat(str, price); }

                        if(g_aAlarmLevel[playerid] == 2)
                        {
                            format(price, sizeof(price), "{FFFF00}>>{FFFFFF}Alarm Seviyesi 2 - $%s\n", MoneyFormat(floatround(car_price * 0.20 * 2)));
                            strcat(str, price);
                        }
                        else
                        {
                            format(price, sizeof(price), "Alarm Seviyesi 2 - $%s\n", MoneyFormat(floatround(car_price * 0.20 * 2)));
                            strcat(str, price);
                        }
                        if(g_aAlarmLevel[playerid] == 3)
                        {
                            format(price, sizeof(price), "{FFFF00}>>{FFFFFF}Alarm Seviyesi 3 - $%s\n", MoneyFormat(floatround(car_price * 0.20 * 3)));
                            strcat(str, price);
                        }
                        else
                        {
                            format(price, sizeof(price), "Alarm Seviyesi 3 - $%s\n", MoneyFormat(floatround(car_price * 0.20 * 3)));
                            strcat(str, price);
                        }
                        if(g_aAlarmLevel[playerid] == 4)
                        {
                            format(price, sizeof(price), "{FFFF00}>>{FFFFFF}Alarm Seviyesi 4 - $%s\n", MoneyFormat(floatround(car_price * 0.20 * 4)));
                            strcat(str, price);
                        }
                        else
                        {
                            format(price, sizeof(price), "Alarm Seviyesi 4 - $%s\n", MoneyFormat(floatround(car_price * 0.20 * 4)));
                            strcat(str, price);
                        }

                        ShowPlayerDialog(playerid, DIALOG_DEALERSHIP_APPEND_ALARM, DIALOG_STYLE_LIST, caption, str, "Seç", "<<");
                    }
                    case 1: //Locks;
                    {
                        new car_price = DealershipData[ SubDealershipHolder[playerid] ][DealershipPrice];
                        if(g_aLockLevel[playerid] == 0)
                        {
                            strcat(str, "{FFFF00}>>{FFFFFF}Kilit Seviyesi 1 - $0\n");
                        }
                        else { strcat(str, "Kilit Seviyesi 1 - $0\n"); }

                        if(g_aLockLevel[playerid] == 1)
                        {
                            format(price, sizeof(price), "{FFFF00}>>{FFFFFF}Kilit Seviyesi 2 - $%s\n", MoneyFormat(floatround(car_price * 0.15 * 1)));
                            strcat(str, price);
                        }
                        else { format(price, sizeof(price), "Kilit Seviyesi 2 - $%s\n", MoneyFormat(floatround(car_price * 0.15 * 1))), strcat(str, price); }

                        if(g_aLockLevel[playerid] == 2)
                        {
                            format(price, sizeof(price), "{FFFF00}>>{FFFFFF}Kilit Seviyesi 3 - $%s\n", MoneyFormat(floatround(car_price * 0.15 * 2)));
                            strcat(str, price);
                        }
                        else
                        {
                            format(price, sizeof(price), "Kilit Seviyesi 3 - $%s\n", MoneyFormat(floatround(car_price * 0.15 * 2)));
                            strcat(str, price);
                        }
                        if(g_aLockLevel[playerid] == 3)
                        {
                            format(price, sizeof(price), "{FFFF00}>>{FFFFFF}Kilit Seviyesi 4 - $%s\n", MoneyFormat(floatround(car_price * 0.15 * 3)));
                            strcat(str, price);
                        }
                        else
                        {
                            format(price, sizeof(price), "Kilit Seviyesi 4 - $%s\n", MoneyFormat(floatround(car_price * 0.15 * 3)));
                            strcat(str, price);
                        }
                        if(g_aLockLevel[playerid] == 4)
                        {
                            format(price, sizeof(price), "{FFFF00}>>{FFFFFF}Kilit Seviyesi 5 - $%s\n", MoneyFormat(floatround(car_price * 0.15 * 4)));
                            strcat(str, price);
                        }
                        else
                        {
                            format(price, sizeof(price), "Kilit Seviyesi 5 - $%s\n", MoneyFormat(floatround(car_price * 0.15 * 4)));
                            strcat(str, price);
                        }

                        ShowPlayerDialog(playerid, DIALOG_DEALERSHIP_APPEND_LOCK, DIALOG_STYLE_LIST, caption, str, "Seç", "<<");
                    }
                    case 2: //Immob;
                    {

                        new car_price = DealershipData[ SubDealershipHolder[playerid] ][DealershipPrice];
                        strcat(str, "Immob Yok\n");
                        if(g_aImmobLevel[playerid] == 1)
                        {
                            format(price, sizeof(price), "{FFFF00}>>{FFFFFF}Immob Seviyesi 1 - $%s\n", MoneyFormat(floatround(car_price * 0.23 * 1)));
                            strcat(str, price);
                        }
                        else { format(price, sizeof(price), "Immob Seviyesi 1 - $%s\n", MoneyFormat(floatround(car_price * 0.23 * 1))), strcat(str, price); }

                        if(g_aImmobLevel[playerid] == 2)
                        {
                            format(price, sizeof(price), "{FFFF00}>>{FFFFFF}Immob Seviyesi 2 - $%s\n", MoneyFormat(floatround(car_price * 0.23 * 2)));
                            strcat(str, price);
                        }
                        else
                        {
                            format(price, sizeof(price), "Immob Seviyesi 2 - $%s\n", MoneyFormat(floatround(car_price * 0.23 * 2)));
                            strcat(str, price);
                        }
                        if(g_aImmobLevel[playerid] == 3)
                        {
                            format(price, sizeof(price), "{FFFF00}>>{FFFFFF}Immob Seviyesi 3 - $%s\n", MoneyFormat(floatround(car_price * 0.23 * 3)));
                            strcat(str, price);
                        }
                        else
                        {
                            format(price, sizeof(price), "Immob Seviyesi 3 - $%s\n", MoneyFormat(floatround(car_price * 0.23 * 3)));
                            strcat(str, price);
                        }
                        if(g_aImmobLevel[playerid] == 4)
                        {
                            format(price, sizeof(price), "{FFFF00}>>{FFFFFF}Immob Seviyesi 4 - $%s\n", MoneyFormat(floatround(car_price * 0.23 * 4)));
                            strcat(str, price);
                        }
                        else
                        {
                            format(price, sizeof(price), "Immob Seviyesi 4 - $%s\n", MoneyFormat(floatround(car_price * 0.23 * 4)));
                            strcat(str, price);
                        }
                        ShowPlayerDialog(playerid, DIALOG_DEALERSHIP_APPEND_IMMOB, DIALOG_STYLE_LIST, caption, str, "Seç", "<<");
                    }
                    case 3: //Ins
                    {
                        new car_price = DealershipData[ SubDealershipHolder[playerid] ][DealershipPrice];
                        strcat(str, "Sigorta Yok\n");
                        if(g_aInsurance[playerid] == 1)
                        {
                            format(price, sizeof(price), "{FFFF00}>>{FFFFFF}Sigorta Seviyesi 1 - $%s\n", MoneyFormat(floatround(car_price * 0.25 * 1)));
                            strcat(str, price);
                        }
                        else { format(price, sizeof(price), "Sigorta Seviyesi 1 - $%s\n", MoneyFormat(floatround(car_price * 0.25 * 1))), strcat(str, price); }

                        if(g_aInsurance[playerid] == 2)
                        {
                            format(price, sizeof(price), "{FFFF00}>>{FFFFFF}Sigorta Seviyesi 2 - $%s\n", MoneyFormat(floatround(car_price * 0.25 * 2)));
                            strcat(str, price);
                        }
                        else
                        {
                            format(price, sizeof(price), "Sigorta Seviyesi 2 - $%s\n", MoneyFormat(floatround(car_price * 0.25 * 2)));
                            strcat(str, price);
                        }
                        if(g_aInsurance[playerid] == 3)
                        {
                            format(price, sizeof(price), "{FFFF00}>>{FFFFFF}Sigorta Seviyesi 3 - $%s\n", MoneyFormat(floatround(car_price * 0.25 * 3)));
                            strcat(str, price);
                        }
                        else
                        {
                            format(price, sizeof(price), "Sigorta Seviyesi 3 - $%s\n", MoneyFormat(floatround(car_price * 0.25 * 3)));
                            strcat(str, price);
                        }
                        ShowPlayerDialog(playerid, DIALOG_DEALERSHIP_APPEND_INS, DIALOG_STYLE_LIST, caption, str, "Seç", "<<");
                    }
                    case 4: //Colors
                    {
                        DisplayColors(playerid, true);
                        SelectTextDraw(playerid, COLOR_GREY);
                        SendClientMessage(playerid, COLOR_PINK, "ÝPUCU: Birincil ve ikincil renkleri seçtikten sonra ESC tuþuyla satýn alma iþlemine devam edebilirsin.");
                    }
                    case 5: //XM-Radio
                    {
                        if(!g_aXMR[playerid])
                        {
                            g_aXMR[playerid] = true;
                            g_aTotalAmount[playerid] += 10000;
                        }
                        else
                        {
                            g_aXMR[playerid] = false;
                            g_aTotalAmount[playerid] -= 10000;
                        }
                        return ShowDealerAppend(playerid);
                    }
                    case 6: //Purchase
                    {
                        new
                            dstr[256],
                            Float:vehMass,
                            Float:vehVelo,
                            vehDrive[60],
                            vehFuel[60]
                        ;

                        vehMass = GetVehicleModelInfoAsFloat(GetVehicleModel(g_aVehicleSpawned[playerid]), "fMass");
                        vehVelo = GetVehicleModelInfoAsFloat(GetVehicleModel(g_aVehicleSpawned[playerid]), "TransmissionData_fMaxVelocity");


                        if(GetVehicleModelInfoAsInt(GetVehicleModel(g_aVehicleSpawned[playerid]), "TransmissionData_nDriveType") == 'F')
                            vehDrive = "Önden Çekiþli";

                        else if(GetVehicleModelInfoAsInt(GetVehicleModel(g_aVehicleSpawned[playerid]), "TransmissionData_nDriveType") == 'R')
                            vehDrive = "Arkadan Çekiþli";

                        else if(GetVehicleModelInfoAsInt(GetVehicleModel(g_aVehicleSpawned[playerid]), "TransmissionData_nDriveType") == '4')
                            vehDrive = "Dört Çekiþli";


                        if(GetVehicleModelInfoAsInt(GetVehicleModel(g_aVehicleSpawned[playerid]), "TransmissionData_nEngineType") == 'P')
                            vehFuel = "Benzin";

                        else if(GetVehicleModelInfoAsInt(GetVehicleModel(g_aVehicleSpawned[playerid]), "TransmissionData_nEngineType") == 'D')
                            vehFuel = "Dizel";

                        else if(GetVehicleModelInfoAsInt(GetVehicleModel(g_aVehicleSpawned[playerid]), "TransmissionData_nEngineType") == 'E')
                            vehFuel = "Elektrik";


                        format(dstr, sizeof(dstr), "{FFFF00}Fiyat:\t\t{FFFFFF}$%s \n", MoneyFormat(DealershipData[SubDealershipHolder[playerid]][DealershipPrice]));
                        strcat(str, dstr);

                        format(dstr, sizeof(dstr), "{FFFF00}Maks. Hýz:\t{FFFFFF}%.2f \n", vehVelo);
                        strcat(str, dstr);

                        format(dstr, sizeof(dstr), "{FFFF00}Maks. Can:\t{FFFFFF}%.2f \n", GetVehicleCondition(g_aVehicleSpawned[playerid], 0));
                        strcat(str, dstr);

                        format(dstr, sizeof(dstr), "{FFFF00}Aðýrlýk:\t\t{FFFFFF}%.2f \n\n", vehMass);
                        strcat(str, dstr);

                        format(dstr, sizeof(dstr), "{FFFF00}Motor Tipi:\t{FFFFFF}%s \n", vehDrive);
                        strcat(str, dstr);

                        format(dstr, sizeof(dstr), "{FFFF00}Yakýt Tipi:\t{FFFFFF}%s \n", vehFuel);
                        strcat(str, dstr);

                        format(dstr, sizeof(dstr), "{FFFF00}Tüketim:\t{FFFFFF}%.2f \n\n", GetVehicleModelInfoAsFloat(GetVehicleModel(g_aVehicleSpawned[playerid]), "fSuspensionHighSpdComDamp"));
                        strcat(str, dstr);


                        new car_price = DealershipData[SubDealershipHolder[playerid]][DealershipPrice];

                        switch(g_aAlarmLevel[playerid])
                        {
                            case 1:
                            {
                                format(dstr, sizeof(dstr), "{FFFF00}Alarm:\t\t{C0C0C0}level 1 {FFFFFF}$%s\n", MoneyFormat(floatround(car_price * 0.20 * 1)));
                                strcat(str, dstr);
                                strcat(str, "\t\t{FF6347}+ {FFFFFF}Yüksek sesli araç alarmý\n");
                            }
                            case 2:
                            {
                                format(dstr, sizeof(dstr), "{FFFF00}Alarm:\t\t{C0C0C0}level 2 {FFFFFF}$%s\n", MoneyFormat(floatround(car_price * 0.20 * 2)));
                                strcat(str, dstr);
                                strcat(str, "\t\t{FF6347}+ {FFFFFF}Yüksek sesli araç alarmý\n");
                                strcat(str, "\t\t{FF6347}+ {FFFFFF}Araç, sahibini olasý bir ihlal konusunda uyarýr\n");
                            }
                            case 3:
                            {
                                format(dstr, sizeof(dstr), "{FFFF00}Alarm:\t\t{C0C0C0}level 3 {FFFFFF}$%s\n", MoneyFormat(floatround(car_price * 0.20 * 3)));
                                strcat(str, dstr);
                                strcat(str, "\t\t{FF6347}+ {FFFFFF}Yüksek sesli araç alarmý\n");
                                strcat(str, "\t\t{FF6347}+ {FFFFFF}Araç, sahibini olasý bir ihlal konusunda uyarýr\n");
                                strcat(str, "\t\t{FF6347}+ {FFFFFF}Araç, yerel kolluk kuvvetlerini olasý bir ihlal konusunda uyarýr\n");
                            }
                            case 4:
                            {
                                format(dstr, sizeof(dstr), "{FFFF00}Alarm:\t\t{C0C0C0}level 4 {FFFFFF}$%s\n", MoneyFormat(floatround(car_price * 0.20 * 4)));
                                strcat(str, dstr);
                                strcat(str, "\t\t{FF6347}+ {FFFFFF}Yüksek sesli araç alarmý\n");
                                strcat(str, "\t\t{FF6347}+ {FFFFFF}Araç, sahibini olasý bir ihlal konusunda uyarýr\n");
                                strcat(str, "\t\t{FF6347}+ {FFFFFF}Araç, yerel kolluk kuvvetlerini olasý bir ihlal konusunda uyarýr\n");
                                strcat(str, "\t\t{FF6347}+ {FFFFFF}Haritada aracýn çalýndýðýna dair iþaretleyici çýkar\n");
                            }
                        }

                        if (g_aImmobLevel[playerid])
                        {
                            format(dstr, sizeof(dstr), "{FFFF00}Immobiliser:\t{C0C0C0}level %i {FFFFFF}$%s\n", g_aImmobLevel[playerid], MoneyFormat(floatround(car_price * 0.23 * g_aImmobLevel[playerid])));
                            strcat(str, dstr);
                        }

                        if(g_aXMR[playerid])
                            strcat(str, "{FFFF00}XM:\t\t{FFFFFF}$10,000\n");

                        ShowPlayerDialog(playerid, DIALOG_DEALERSHIP_PURCHASE, DIALOG_STYLE_MSGBOX, caption, str, "Düzenle", "Satýnal");
                        return 1;
                    }
                }
            }
            else ConfirmDialog(playerid, "Galeri: Onay", "Çýkmak istediðine emin misin?", "OnPlayerExitDealership");
            return 1;
        }
        case DIALOG_DEALERSHIP_PURCHASE:
        {
          if(GetPlayerVehicleID(playerid) != g_aVehicleSpawned[playerid])
            {
              if(IsValidVehicle(g_aVehicleSpawned[playerid])) DestroyVehicle(g_aVehicleSpawned[playerid]);
              TogglePlayerControllable(playerid, 1);
              return ResetDealershipVars(playerid);
            }

            if(response)
            {
                return ShowDealerAppend(playerid);
            }
            else
            {
                if(IsTaxi(g_aVehicleSpawned[playerid]))
                {
                    if(PlayerData[playerid][pSideJob] != TAXI_JOB && PlayerData[playerid][pJob] != TAXI_JOB)
                    {
                        SendServerMessage(playerid, "Bu aracý alabilmek için taksi ehliyetine sahip olmalýsýn.");
                        DestroyVehicle(g_aVehicleSpawned[playerid]);
                        TogglePlayerControllable(playerid, 1);
                        return ResetDealershipVars(playerid);
                    }
                }

                new price = g_aTotalAmount[playerid] + GetPVarInt(playerid, "InsPrice") + GetPVarInt(playerid, "LockPrice") + GetPVarInt(playerid, "ImmobPrice") + GetPVarInt(playerid, "AlarmPrice");
                if(price > PlayerData[playerid][pMoney])
                {
                    SendServerMessage(playerid, "Bu aracý satýn almak için yeterli paran yok. (Toplam Tutar: $%s, Paran: $%s)", MoneyFormat(price), MoneyFormat(PlayerData[playerid][pMoney]));
                    DestroyVehicle(g_aVehicleSpawned[playerid]);
                    TogglePlayerControllable(playerid, 1);
                    return ResetDealershipVars(playerid);
                }

                new
                    Float:x,
                    Float:y,
                    Float:z,
                    Float:a,
                    rand[3],
                    car_plate[32],
                    slot_id = FreePlayerCarID(playerid);

                GetVehiclePos(g_aVehicleSpawned[playerid], x, y, z);
                GetVehicleZAngle(g_aVehicleSpawned[playerid], a);

                for (new i = 0; i < 3; i++) rand[i] = random(sizeof(PlatePossible));
                format(car_plate, sizeof(car_plate), "%d%s%s%s%d%d%d", random(9), PlatePossible[rand[0]], PlatePossible[rand[1]], PlatePossible[rand[2]], random(9), random(9), random(9));

                SendClientMessage(playerid, 0xB9E35EFF, "ÝÞLEM SÜRECÝ: Araç listen yenileniyor.");
                InfoTD_MSG(playerid, 1, 5000, sprintf("~w~YENI_PLAKAN_AYARLANDI~n~~b~~h~%s", car_plate));
                GiveMoney(playerid, -price);

                PlayerPurchasingVehicle[playerid] = true;
                TogglePlayerControllable(playerid, 1);

                new query[554];
                mysql_format(m_Handle, query, sizeof(query), "INSERT INTO vehicles (OwnerID, ModelID, PosX, PosY, PosZ, PosA, VehicleName) VALUES (%i, %i, %f, %f, %f, %f, '%e')", PlayerData[playerid][pSQLID], DealershipData[SubDealershipHolder[playerid]][DealershipModel], x, y, z, a, ReturnVehicleModelName(GetVehicleModel(g_aVehicleSpawned[playerid])));
                //mysql_tquery(m_Handle, query, "OnPlayerVehiclePurchase", "iisffff", playerid, slot_id, car_plate, x, y, z, a);
                new Cache:cache = mysql_query(m_Handle, query);

                new
                    vehicleid = INVALID_VEHICLE_ID;

                DestroyVehicle(g_aVehicleSpawned[playerid]);
                g_aVehicleSpawned[playerid] = INVALID_VEHICLE_ID;

                vehicleid = CreateVehicle(DealershipData[SubDealershipHolder[playerid]][DealershipModel], x, y, z, a, g_aVehicleColor[playerid][0], g_aVehicleColor[playerid][1], -1);
                SetVehicleNumberPlate(vehicleid, car_plate);
                SetVehicleToRespawn(vehicleid);

                PutPlayerInVehicle(playerid, vehicleid, 0);
                PlayerData[playerid][pOwnedCar][slot_id] = cache_insert_id();
                Player_Save(playerid);

                if(vehicleid != INVALID_VEHICLE_ID)
                {
                    CarData[vehicleid][carID] = cache_insert_id();
                    CarData[vehicleid][carOwnerID] = PlayerData[playerid][pSQLID];
                    CarData[vehicleid][carFaction] = -1;
                    CarData[vehicleid][carRental] = 0;
                    CarData[vehicleid][carRentedBy] = 0;
                    CarData[vehicleid][carTerminate] = 0;

                    CarData[vehicleid][carModel] = DealershipData[SubDealershipHolder[playerid]][DealershipModel];

                    CarData[vehicleid][carColor1] = g_aVehicleColor[playerid][0];
                    CarData[vehicleid][carColor2] = g_aVehicleColor[playerid][1];

                    CarData[vehicleid][carPaintjob] = -1;

                    CarData[vehicleid][carPos][0] = x;
                    CarData[vehicleid][carPos][1] = y;
                    CarData[vehicleid][carPos][2] = z;
                    CarData[vehicleid][carPos][3] = a;

                    CarData[vehicleid][carImpounded] = -1;

                    format(CarData[vehicleid][carName], 35, ReturnVehicleModelName(GetVehicleModel(vehicleid)));
                    format(CarData[vehicleid][carPlates], 32, "%s", car_plate);

                    CarData[vehicleid][carLocked] = false;
                    CarData[vehicleid][carIllegalPlate] = false;
                    CarData[vehicleid][carFuel] = 100;

                    CarData[vehicleid][carLastHealth] = GetVehicleCondition(vehicleid, 0);
                    CarData[vehicleid][carMaxHealth] = GetVehicleCondition(vehicleid, 0);
                    CarData[vehicleid][carEngine] = GetVehicleCondition(vehicleid, 1);
                    CarData[vehicleid][carBattery] = GetVehicleCondition(vehicleid, 2);

                    CarData[vehicleid][carXMR] = g_aXMR[playerid];
                    CarData[vehicleid][carTimeDestroyed] = 0;

                    CarData[vehicleid][carAlarm] = g_aAlarmLevel[playerid];
                    CarData[vehicleid][carLock] = g_aLockLevel[playerid];
                    CarData[vehicleid][carImmob] = g_aImmobLevel[playerid];
                    CarData[vehicleid][carInsurance] = g_aInsurance[playerid];

                    CarData[vehicleid][carMileage] = 0.0;

                    SetVehicleHealth(vehicleid, CarData[vehicleid][carLastHealth]);

                    _has_vehicle_spawned[playerid] = true;
                    _has_spawned_vehicleid[playerid] = vehicleid;

                    switch(GetVehicleModel(vehicleid))
                    {
                        case 481, 509, 510: ToggleVehicleEngine(vehicleid, true);
                    }

                    Car_Save(vehicleid);
                }

                cmd_arac(playerid, "bilgi");
                PlayerPurchasingVehicle[playerid] = false;
                ResetDealershipVars(playerid);
                cache_delete(cache);
            }
            return 1;
        }
        case DIALOG_DEALERSHIP_APPEND_ALARM:
        {
            if(response)
            {
                if(listitem == 0)
                {
                    SetPVarInt(playerid, "AlarmPrice", 0);
                    g_aAlarmLevel[playerid] = 0;
                }
                else
                {
                    g_aAlarmLevel[playerid] = listitem;
                    SetPVarInt(playerid, "AlarmPrice", floatround(DealershipData[ SubDealershipHolder[playerid] ][DealershipPrice] * 0.20 * listitem));
                }
                ShowDealerAppend(playerid);
            }
            else return ShowDealerAppend(playerid);
            return 1;
        }
        case DIALOG_DEALERSHIP_APPEND_LOCK:
        {
            if(response)
            {
                if(listitem == 0)
                {
                    SetPVarInt(playerid, "LockPrice", 0);
                    g_aLockLevel[playerid] = 0;
                }
                else
                {
                    g_aLockLevel[playerid] = listitem;
                    SetPVarInt(playerid, "LockPrice", floatround(DealershipData[ SubDealershipHolder[playerid] ][DealershipPrice] * 0.15 * listitem));
                }
                ShowDealerAppend(playerid);
            }
            else return ShowDealerAppend(playerid);
            return 1;
        }
        case DIALOG_DEALERSHIP_APPEND_IMMOB:
        {
            if(response)
            {
                if(listitem == 0)
                {
                    SetPVarInt(playerid, "ImmobPrice", 0);
                    g_aImmobLevel[playerid] = 0;
                }
                else
                {
                    g_aImmobLevel[playerid] = listitem;
                    SetPVarInt(playerid, "ImmobPrice", floatround(DealershipData[ SubDealershipHolder[playerid] ][DealershipPrice] * 0.23 * listitem));
                }
                ShowDealerAppend(playerid);
            }
            else return ShowDealerAppend(playerid);
            return 1;
        }
        case DIALOG_DEALERSHIP_APPEND_INS:
        {
            if(response)
            {
                if(listitem == 0)
                {
                    SetPVarInt(playerid, "InsPrice", 0);
                    g_aInsurance[playerid] = 0;
                }
                else
                {
                    g_aInsurance[playerid] = listitem;
                    SetPVarInt(playerid, "InsPrice", floatround(DealershipData[ SubDealershipHolder[playerid] ][DealershipPrice] * 0.25 * listitem));
                }
                ShowDealerAppend(playerid);
            }
            else return ShowDealerAppend(playerid);
            return 1;
        }
        case DIALOG_XMR:
        {
            if(response)
            {
                if(!strcmp(inputtext, "URL Yöntemiyle Aç"))
                {
                    ShowPlayerDialog(playerid, DIALOG_XMR_URL, DIALOG_STYLE_INPUT, "XMR: URL", "Açmak istediðiniz müziðin URL adresini giriniz: (bit.ly kullanmanýz tavsiye edilir)", "Aç", "Ýptal");
                    return 1;
                }

                new string[400], counter = 0;
                string[0] = EOS;

                CatXMRHolder[playerid] = listitem + 1;

                for(new i = 1; i < MAX_XMR_SUBCATEGORY; i++)
                {
                    if (CatXMRHolder[playerid] == XMRData[i][xmrCategory])
                    {
                        format(string, sizeof(string), "%sID:%d - %s\n", string, XMRData[i][xmrID], XMRData[i][xmrName]);

                        SubXMRHolderArr[playerid][counter] = i;
                        counter++;
                    }
                }

                strcat(string, "{FFFF00}Kapatmak için týklayýn.\n");
                ShowPlayerDialog(playerid, DIALOG_XMR_SELECT, DIALOG_STYLE_LIST, "Ýstasyonlar", string, "Seç", "Ýptal");
            }
        }
        case DIALOG_XMR_SELECT:
        {
            if(response)
            {
                SubXMRHolder[playerid] = SubXMRHolderArr[playerid][listitem];

                if(!strcmp(inputtext, "Kapatmak için týklayýn."))
                {
                    cmd_istasyon(playerid, "kapat");
                    return 1;
                }

                new
                    vehicleid = GetPlayerVehicleID(playerid);

                new id = -1;
                if((id = Boombox_Nearest(playerid, 4.0)) != -1)
                {
                    cmd_ame(playerid, sprintf("%s radyo istasyonunu açar.", XMRData[SubXMRHolder[playerid]][xmrName]));

                    foreach (new i : Player) if(Boombox_Nearest(i, 25.0) == id)
                    {
                        PlayAudioStreamForPlayer(i, XMRData[SubXMRHolder[playerid]][xmrStationURL], BoomboxData[id][BoomboxLocation][0], BoomboxData[id][BoomboxLocation][1], BoomboxData[id][BoomboxLocation][2], 25.0, 1);
                        SendClientMessageEx(i, COLOR_ADM, "SERVER: Radyo istasyonu %s olarak deðiþtirildi.", XMRData[SubXMRHolder[playerid]][xmrName]);
                    }

                    format(BoomboxData[id][BoomboxURL], 128, "%s", XMRData[SubXMRHolder[playerid]][xmrStationURL]);
                    BoomboxData[id][BoomboxStatus] = true;
                    return 1;
                }

                if(IsPlayerInAnyVehicle(playerid))
                {
                    cmd_ame(playerid, sprintf("%s radyo istasyonunu açar.", XMRData[SubXMRHolder[playerid]][xmrName]));

                    foreach(new i : Player) if(IsPlayerInVehicle(i, vehicleid))
                    {
                        SendClientMessageEx(i, COLOR_ADM, "SERVER: Radyo istasyonu %s olarak deðiþtirildi.", XMRData[SubXMRHolder[playerid]][xmrName]);
                        PlayAudioStreamForPlayer(i, XMRData[SubXMRHolder[playerid]][xmrStationURL]);
                    }

                    if(IsValidPlayerCar(vehicleid))
                    {
                        format(CarData[vehicleid][carXMRUrl], 128, "%s", XMRData[SubXMRHolder[playerid]][xmrStationURL]);
                        CarData[vehicleid][carXMROn] = true;
                    }
                    return 1;
                }

                if((id = IsPlayerInProperty(playerid)) != -1)
                {
                    cmd_ame(playerid, sprintf("%s radyo istasyonunu açar.", XMRData[SubXMRHolder[playerid]][xmrName]));

                    foreach(new i : Player) if(IsPlayerInProperty(i) == id)
                    {
                        SendClientMessageEx(i, COLOR_ADM, "SERVER: Radyo istasyonu %s olarak deðiþtirildi.", XMRData[SubXMRHolder[playerid]][xmrName]);
                        PlayAudioStreamForPlayer(i, XMRData[SubXMRHolder[playerid]][xmrStationURL]);
                    }

                    format(PropertyData[id][PropertyXMRUrl], 128, "%s", XMRData[SubXMRHolder[playerid]][xmrStationURL]);
                    PropertyData[id][PropertyXMROn] = true;
                    return 1;
                }

                if((id = IsPlayerInBusiness(playerid)) != -1)
                {
                    cmd_ame(playerid, sprintf("%s radyo istasyonunu açar.", XMRData[SubXMRHolder[playerid]][xmrName]));

                    foreach(new i : Player) if(IsPlayerInBusiness(i) == id)
                    {
                        SendClientMessageEx(i, COLOR_ADM, "SERVER: Radyo istasyonu %s olarak deðiþtirildi.", XMRData[SubXMRHolder[playerid]][xmrName]);
                        PlayAudioStreamForPlayer(i, XMRData[SubXMRHolder[playerid]][xmrStationURL]);
                    }

                    format(BusinessData[id][BusinessXMRUrl], 128, "%s", XMRData[SubXMRHolder[playerid]][xmrStationURL]);
                    BusinessData[id][BusinessXMROn] = true;
                    return 1;
                }

                SendClientMessage(playerid, COLOR_ADM, "SERVER: Yakýnýnda XMR yok.");
                return 1;
            }
        }
        case DIALOG_XMR_URL:
        {
            if(response)
            {
                new
                    vehicleid = GetPlayerVehicleID(playerid);

                new id = -1;
                if((id = Boombox_Nearest(playerid, 4.0)) != -1)
                {
                    foreach (new i : Player) if(Boombox_Nearest(i, 25.0) == id)
                    {
                        PlayAudioStreamForPlayer(i, inputtext, BoomboxData[id][BoomboxLocation][0], BoomboxData[id][BoomboxLocation][1], BoomboxData[id][BoomboxLocation][2], 25.0, 1);
                        SendClientMessage(i, COLOR_ADM, "SERVER: Radyo istasyonu özel olarak deðiþtirildi.");
                    }

                    cmd_ame(playerid, "özel radyo istasyonu açar.");
                    format(BoomboxData[id][BoomboxURL], 128, "%s", XMRData[SubXMRHolder[playerid]][xmrStationURL]);
                    BoomboxData[id][BoomboxStatus] = true;
                    return 1;
                }

                if(IsPlayerInAnyVehicle(playerid))
                {
                    cmd_ame(playerid, "özel radyo istasyonu açar.");

                    foreach(new i : Player) if(IsPlayerInVehicle(i, vehicleid))
                    {
                        SendClientMessage(i, COLOR_ADM, "SERVER: Radyo istasyonu özel olarak deðiþtirildi.");
                        PlayAudioStreamForPlayer(i, inputtext);
                    }

                    if(IsValidPlayerCar(vehicleid))
                    {
                        format(CarData[vehicleid][carXMRUrl], 128, "%s", inputtext);
                        CarData[vehicleid][carXMROn] = true;
                    }
                    return 1;
                }

                if((id = IsPlayerInProperty(playerid)) != -1)
                {
                    cmd_ame(playerid, "özel radyo istasyonu açar.");

                    foreach(new i : Player) if(IsPlayerInProperty(i) == id)
                    {
                        SendClientMessage(i, COLOR_ADM, "SERVER: Radyo istasyonu özel olarak deðiþtirildi.");
                        PlayAudioStreamForPlayer(i, inputtext);
                    }

                    format(PropertyData[id][PropertyXMRUrl], 128, "%s", inputtext);
                    PropertyData[id][PropertyXMROn] = true;
                    return 1;
                }

                if((id = IsPlayerInBusiness(playerid)) != -1)
                {
                    cmd_ame(playerid, "özel radyo istasyonu açar.");

                    foreach(new i : Player) if(IsPlayerInBusiness(i) == id)
                    {
                        SendClientMessage(i, COLOR_ADM, "SERVER: Radyo istasyonu özel olarak deðiþtirildi.");
                        PlayAudioStreamForPlayer(i, inputtext);
                    }

                    format(BusinessData[id][BusinessXMRUrl], 128, "%s", inputtext);
                    BusinessData[id][BusinessXMROn] = true;
                    return 1;
                }

                SendClientMessage(playerid, COLOR_ADM, "SERVER: Yakýnýnda XMR yok.");
                return 1;
            }
        }
        case DIALOG_CLOTHING_MENU:
        {
            if(response) return Clothing_Menu(playerid, listitem);
        }
        case DIALOG_FOOD_CONFIG:
        {
            if (response)
            {
                switch(listitem)
                {
                    case 0: ShowPlayerDialog(playerid, DIALOG_FOOD_TYPE, DIALOG_STYLE_LIST, "Restaurant: Ürün Tipi", "Pizza Restaurant\nBurger Fast-Food\nChicken Fast-Food\nDonut Fast-Food", "Tamam", "Geri <<<");
                    case 1: ShowPlayerDialog(playerid, DIALOG_FOOD_PRICE_1, DIALOG_STYLE_INPUT, "Restaurant: 1. Ürün Fiyatý", "Bu ürün için lütfen bir fiyat giriniz. (en az $25, en fazla $1000)", "Tamam", "Geri <<<");
                    case 2: ShowPlayerDialog(playerid, DIALOG_FOOD_PRICE_2, DIALOG_STYLE_INPUT, "Restaurant: 2. Ürün Fiyatý", "Bu ürün için lütfen bir fiyat giriniz. (en az $25, en fazla $1000)", "Tamam", "Geri <<<");
                    case 3: ShowPlayerDialog(playerid, DIALOG_FOOD_PRICE_3, DIALOG_STYLE_INPUT, "Restaurant: 3. Ürün Fiyatý", "Bu ürün için lütfen bir fiyat giriniz. (en az $25, en fazla $1000)", "Tamam", "Geri <<<");
                }
            }
            return 1;
        }
        case DIALOG_FOOD_TYPE:
        {
            if(!response) return Food_Config(playerid);

            new
                id = IsPlayerInBusiness(playerid);

            switch(listitem)
            {
                case 0:
                {
                    BusinessData[id][BusinessFood][0] = 0;
                    BusinessData[id][BusinessFood][1] = 1;
                    BusinessData[id][BusinessFood][2] = 2;
                    BusinessData[id][BusinessRestaurantType] = listitem;
                }
                case 1:
                {
                    BusinessData[id][BusinessFood][0] = 3;
                    BusinessData[id][BusinessFood][1] = 4;
                    BusinessData[id][BusinessFood][2] = 5;
                    BusinessData[id][BusinessRestaurantType] = listitem;
                }
                case 2:
                {
                    BusinessData[id][BusinessFood][0] = 6;
                    BusinessData[id][BusinessFood][1] = 7;
                    BusinessData[id][BusinessFood][2] = 8;
                    BusinessData[id][BusinessRestaurantType] = listitem;
                }
                case 3:
                {
                    BusinessData[id][BusinessFood][0] = 9;
                    BusinessData[id][BusinessFood][1] = 10;
                    BusinessData[id][BusinessFood][2] = 11;
                    BusinessData[id][BusinessRestaurantType] = listitem;
                }
            }

            SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] Restaurant tipi deðiþtirildi: {FFFFFF}%s", Restaurant_Type(listitem));
            Business_Save(id);
            return 1;
        }
        case DIALOG_FOOD_PRICE_1:
        {
            if(!response) return Food_Config(playerid);

            if(strval(inputtext) < 25 || strval(inputtext) > 1000)
                return ShowPlayerDialog(playerid, DIALOG_FOOD_PRICE_1, DIALOG_STYLE_INPUT, "Restaurant: 1. Ürün Fiyatý", "Bu ürün için lütfen bir fiyat giriniz. (en az $25, en fazla $1000)", "Tamam", "Geri <<<");

            BusinessData[IsPlayerInBusiness(playerid)][BusinessFoodPrice][0] = strval(inputtext);
            SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] Restaurant 1. ürün fiyatý deðiþtirildi. {FFFFFF}$%d", strval(inputtext));
            Business_Save(IsPlayerInBusiness(playerid));
            return 1;
        }
        case DIALOG_FOOD_PRICE_2:
        {
            if(!response) return Food_Config(playerid);

            if(strval(inputtext) < 25 || strval(inputtext) > 1000)
                return ShowPlayerDialog(playerid, DIALOG_FOOD_PRICE_2, DIALOG_STYLE_INPUT, "Restaurant: 2. Ürün Fiyatý", "Bu ürün için lütfen bir fiyat giriniz. (en az $25, en fazla $1000)", "Tamam", "Geri <<<");

            BusinessData[IsPlayerInBusiness(playerid)][BusinessFoodPrice][1] = strval(inputtext);
            SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] Restaurant 2. ürün fiyatý deðiþtirildi. {FFFFFF}$%d", strval(inputtext));
            Business_Save(IsPlayerInBusiness(playerid));
            return 1;
        }
        case DIALOG_FOOD_PRICE_3:
        {
            if(!response) return Food_Config(playerid);

            if(strval(inputtext) < 25 || strval(inputtext) > 1000)
                return ShowPlayerDialog(playerid, DIALOG_FOOD_PRICE_3, DIALOG_STYLE_INPUT, "Restaurant: 3. Ürün Fiyatý", "Bu ürün için lütfen bir fiyat giriniz. (en az $25, en fazla $1000)", "Tamam", "Geri <<<");

            BusinessData[IsPlayerInBusiness(playerid)][BusinessFoodPrice][2] = strval(inputtext);
            SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] Restaurant 3. ürün fiyatý deðiþtirildi. {FFFFFF}$%d", strval(inputtext));
            Business_Save(IsPlayerInBusiness(playerid));
            return 1;
        }
        case DIALOG_ADMIN_MSG:
        {
            if (response)
            {
                PlayerData[playerid][pAdmMsgConfirm] = true;
                format(PlayerData[playerid][pAdminMsg], 128, "");
                PlayerData[playerid][pAdminMsgBy] = 0;
            }
        }
        case DIALOG_MDC:
        {
            if(response)
            {
                PlayNearbySound(playerid, MDC_SELECT);

                switch(listitem)
                {
                    case 0: return ShowPlayerDialog(playerid, DIALOG_MDC_NAME, DIALOG_STYLE_INPUT, "MVB: Ýsim Sorgulama", "Sorgulamak istediðiniz kiþinin ismini giriniz: (Kevin_McCavish)", "Sorgula", "<<");
                    case 2: return ShowPlayerDialog(playerid, DIALOG_MDC_PLATE_FULL, DIALOG_STYLE_INPUT, "MVB: Plaka Sorgulama", "Sorgulamak istediðiniz aracýn plakasýný giriniz:", "Sorgula", "<<");
                    case 3: return ShowPlayerDialog(playerid, DIALOG_MDC_PLATE_PARTIAL, DIALOG_STYLE_INPUT, "MVB: Kýsmý Plaka Sorgulama", "Sorgulamak istediðiniz aracýn kýsmi plakasýný giriniz:", "Sorgula", "<<");
                    case 5:
                    {
                        new
                            primary[500], sub[128];

                        if(!TotalJailees)
                            return ShowPlayerDialog(playerid, DIALOG_MDC_FINISH_QUEUE, DIALOG_STYLE_MSGBOX, "MVB: Mahkumlar", "Kimse hapiste gözükmüyor.", "<<", "");

                        foreach(new i : Player)
                        {
                            if(PlayerData[i][pICJailed])
                            {
                                format(sub, sizeof(sub), "%s\n", ReturnName(i));
                                strcat(primary, sub);
                            }
                        }

                        format(sub, sizeof(sub), "{1E0C95}Mahkum Sayýsý: %i", TotalJailees);
                        strcat(primary, sub);

                        ShowPlayerDialog(playerid, DIALOG_MDC_FINISH_QUEUE, DIALOG_STYLE_LIST, "MVB: Mahkumlar", primary, ">>", "<<");
                    }
                    case 6:
                    {
                        return mysql_tquery(m_Handle, "SELECT ModelID, Plate, ReportedStolenDate FROM vehicles WHERE ReportedStolen = 1 ORDER BY id DESC", "OnStolenCars", "i", playerid);
                    }
                    case 8: return ShowPlayerDialog(playerid, DIALOG_MDC_NUMBER_SEARCH, DIALOG_STYLE_INPUT, "MVB: Telefon Sorgulama", "Sorgulamak istediðiniz telefon numarasýný giriniz:", "Sorgula", "<<");
                    case 9:
                    {
                        new
                            primary[900], sub[128],
                            callsign[128], bool:found;

                        foreach(new i : Player)
                        {
                            if(!PlayerData[i][pLAWduty])
                                continue;

                            format(callsign, 128, "- %s", PlayerData[i][pCallsign]);

                            format(sub, sizeof(sub), "%s %s\n", ReturnName(i), (strlen(PlayerData[i][pCallsign]) > 1) ? (callsign) : (""));
                            strcat(primary, sub);

                            found = true;
                        }
                        if(!found)
                            return ShowPlayerDialog(playerid, DIALOG_MDC_FINISH_QUEUE, DIALOG_STYLE_MSGBOX, "MVB: Sahadaki Memurlar", "Kimse sahada gözükmüyor.", ">>", "<<");

                        ShowPlayerDialog(playerid, DIALOG_MDC_FINISH_QUEUE, DIALOG_STYLE_LIST, "MVB: Sahadaki Memurlar", primary, ">>", "<<");
                    }
                }
            }
            return 1;
        }
        case DIALOG_MDC_NAME:
        {
            if(response)
            {
                if(strlen(inputtext) < 3 || strlen(inputtext) > MAX_PLAYER_NAME + 1)
                    return ShowPlayerDialog(playerid, DIALOG_MDC_NAME, DIALOG_STYLE_INPUT, "MVB: Ýsim Sorgulama", "Sorgulamak istediðiniz kiþinin ismini giriniz: (Kevin_McCavish)", "Sorgula", "<<");

                for(new i = 0; i < strlen(inputtext); i++)
                {
                    if(inputtext[i] == '_')
                    {
                        PlayNearbySound(playerid, MDC_ERROR);
                        ShowPlayerDialog(playerid, DIALOG_MDC_NAME, DIALOG_STYLE_INPUT, "MVB: Ýsim Sorgulama", "Sorgulamak istediðiniz kiþinin ismini giriniz: (Kevin_McCavish)", "Sorgula", "<<");
                    }
                    else
                    {
                        if(inputtext[i] == ' ')
                        {
                            inputtext[i] = '_';
                        }
                    }
                }

                PlayNearbySound(playerid, MDC_SELECT);
                format(PlayerMDCText[playerid], 32, "%s", inputtext);

                new
                    search_query[356];

                mysql_format(m_Handle, search_query, sizeof(search_query), "SELECT PhoneNumber, DriversLicense, WeaponsLicense, ActiveListing, JailTimes, PrisonTimes FROM players WHERE Name = '%e'", inputtext);
                mysql_tquery(m_Handle, search_query, "OnMDCNameSearch", "i", playerid);
                return 1;
            }
            else ShowPlayerMDC(playerid);
        }
        case DIALOG_MDC_PLATE_FULL:
        {
            if(response)
            {
                if(strlen(inputtext) > 7 || strlen(inputtext) < 7)
                {
                    PlayNearbySound(playerid, MDC_ERROR);
                    return ShowPlayerDialog(playerid, DIALOG_MDC_PLATE_FULL, DIALOG_STYLE_INPUT, "MVB: Plaka Sorgulama", "Sorgulamak istediðiniz aracýn plakasýný giriniz:", "Sorgula", "<<");
                }

                PlayNearbySound(playerid, MDC_SELECT);
                format(PlayerMDCText[playerid], 32, "%s", inputtext);

                new
                    search_query[256];

                mysql_format(m_Handle, search_query, sizeof(search_query), "SELECT OwnerID, ModelID, Impounded, Insurance, ReportedStolen, ReportedStolenDate FROM vehicles WHERE Plate = '%e'", inputtext);
                mysql_tquery(m_Handle, search_query, "OnMDCPlateSearch", "i", playerid);
                return 1;
            }
            else return ShowPlayerMDC(playerid);
        }
        case DIALOG_MDC_PLATE_PARTIAL:
        {
            if(response)
            {
                if(strlen(inputtext) < 3 || strlen(inputtext) > 7)
                {
                    PlayNearbySound(playerid, MDC_ERROR);
                    return ShowPlayerDialog(playerid, DIALOG_MDC_PLATE_PARTIAL, DIALOG_STYLE_INPUT, "MVB: Kýsmi Plaka Sorgulama", "Sorgulamak istediðiniz aracýn kysmi plakasýný giriniz:", "Sorgula", "<<");
                }

                PlayNearbySound(playerid, MDC_SELECT);
                format(PlayerMDCText[playerid], 32, "%s", inputtext);

                new
                    search_query[128];

                mysql_format(m_Handle, search_query, sizeof(search_query), "SELECT Plate FROM vehicles WHERE Plate LIKE '%%%e%%' LIMIT 5", inputtext);
                mysql_tquery(m_Handle, search_query, "OnMDCPartialPlate", "i", playerid);
                return 1;
            }
            else return ShowPlayerMDC(playerid);
        }
        case DIALOG_MDC_PLATE_LIST:
        {
            if(response)
            {
                new
                    search_query[230];

                PlayNearbySound(playerid, MDC_SELECT);
                format(PlayerMDCText[playerid], 32, "%s", PlayerMDCPlateHolder[playerid][listitem]);

                mysql_format(m_Handle, search_query, sizeof(search_query), "SELECT OwnerID, ModelID, Impounded, Insurance, ReportedStolen, ReportedStolenDate FROM ownedcars WHERE Plate = '%e'", PlayerMDCPlateHolder[playerid][listitem]);
                mysql_tquery(m_Handle, search_query, "OnMDCPlateSearch", "i", playerid);
                return 1;
            }
            else return ShowPlayerMDC(playerid);
        }
        case DIALOG_MDC_NUMBER_SEARCH:
        {
            if(response)
            {
                if(!IsNumeric(inputtext))
                    return ShowPlayerDialog(playerid, DIALOG_MDC_NUMBER_SEARCH, DIALOG_STYLE_INPUT, "MVB: Telefon Sorgulama", "Sorgulamak istediðiniz telefon numarasýný giriniz:", "Sorgula", "<<");

                new
                    number,
                    thread[128];

                number = strval(inputtext);

                mysql_format(m_Handle, thread, sizeof(thread), "SELECT Name FROM players WHERE PhoneNumber = %i", number);
                mysql_tquery(m_Handle, thread, "OnPhoneSearch", "ii", playerid, number);
            }
            else return ShowPlayerMDC(playerid);
        }
        case DIALOG_MDC_FINISH_QUEUE:
        {
            if(response)
                return ShowPlayerMDC(playerid);

            return 1;
        }
        case DIALOG_ADMIN_NAME:
        {
            if(response)
            {
                if(strlen(inputtext) > 60)
                    return ShowPlayerDialog(playerid, DIALOG_ADMIN_NAME, DIALOG_STYLE_INPUT, "Los Santos Stories: Yönetici Adý", "Bir yönetici olarak görülecek adýnýz sisteme girilmemiþ.\nYönetici adýnýzý girin:", "Tamam", "Kapat");

                return cmd_adminname(playerid, inputtext);
            }
            return 1;
        }
        case DIALOG_INTERIORS:
        {
            if(response)
            {
                SetPlayerPos(playerid, Interiors[listitem][INT_POS][0], Interiors[listitem][INT_POS][1], Interiors[listitem][INT_POS][2]);
                SetPlayerInterior(playerid, Interiors[listitem][INT_ID]);

                SendServerMessage(playerid, "Seçilen noktaya baþarýyla ýþýnlandýn.");
                ResetHouseVar(playerid);
                return 1;
            }
            return 1;
        }
        case DIALOG_VLOG_LIST:
        {
            if(response)
            {
                if(listitem == 0)
                {
                    if(PlayerVlogPage[playerid] == 1)
                        ShowVehicleLogs(playerid, PlayerVlogVehicle[playerid], 1);

                    else
                        ShowVehicleLogs(playerid, PlayerVlogVehicle[playerid], PlayerVlogPage[playerid]-1);

                    return 1;
                }
                if(listitem == MAX_VLOG_PER_PAGE+1){
                    return ShowVehicleLogs(playerid, PlayerVlogVehicle[playerid], PlayerVlogPage[playerid]+1);
                }
            }
            return 1;
        }
        case DIALOG_PLOG_LIST:
        {
            if(response)
            {
                if(listitem == 0)
                {
                    if(PlayerLogPage[playerid] == 1)
                        ShowPlayerLogs(playerid, PlayerLogPlayer[playerid], 1);

                    else
                        ShowPlayerLogs(playerid, PlayerLogPlayer[playerid], PlayerLogPage[playerid]-1);

                    return 1;
                }

                if(listitem == MAX_PLOG_PER_PAGE+1) return ShowPlayerLogs(playerid, PlayerLogPlayer[playerid], PlayerLogPage[playerid]+1);
            }
        }
        case DIALOG_HACKSYS:
        {
            if(response)
            {
                EnableAntiCheat(listitem, IsAntiCheatEnabled(listitem) ? 0 : 1);
                ShowHackPanel(playerid);
                return 1;
            }
            return 1;
        }
        case DIALOG_APANEL:
        {
            if(response) return ShowAdminPanel(playerid);
            return 1;
        }
        case DIALOG_SKINSEARCH:
        {
            if(!response)
                return ShowAdminPanel(playerid);

            if(!IsNumeric(inputtext))
                return ShowAdminSys(playerid, 8, "Your input needs to be a numeric value.");

            new Skin;
            Skin = strval(inputtext);

            if(Skin < 0 || Skin == 74 || Skin > 311)
                return ShowAdminSys(playerid, 8, "You specified an invalid Skin ID.");

            new FoundSkin, ListStr[900], PlayerStr[128];

            format(PlayerStr, sizeof(PlayerStr), "Players with Skin ID %i:\n\n", Skin);
            strcat(ListStr, PlayerStr);

            foreach(new i : Player) if(GetPlayerSkin(i) == Skin)
            {
                FoundSkin++;

                format(PlayerStr, sizeof(PlayerStr), "\t%s (ID: %i) - Location: %s - Vehicle: %i\n", ReturnName(i), i, Player_GetLocation(i), GetPlayerVehicleID(i));
                strcat(ListStr, PlayerStr);
            }
            if(!FoundSkin)
                return ShowPlayerDialog(playerid, DIALOG_APANEL, DIALOG_STYLE_MSGBOX, "Administration panel", "No player was found with that Skin ID.", "Okay!", "");

            ShowPlayerDialog(playerid, DIALOG_APANEL, DIALOG_STYLE_MSGBOX, "Administration panel", ListStr, "Okay!", "");
            return 1;
        }
        case DIALOG_ANOTE_LOOKUP:
        {
            if(!response)
                return ShowAdminPanel(playerid);

            if(!IsValidRoleplayName(inputtext))
            {
                ShowAdminSys(playerid, 9, "The username you specified isn't possible.");
                return 1;
            }

            if(!ReturnSQLFromName(inputtext))
            {
                ShowAdminSys(playerid, 9, "The username you specified doesn't exist in the database.");
                return 1;
            }

            new Query[200], string[128];

            mysql_format(m_Handle, Query, sizeof(Query), "SELECT * FROM player_anotes WHERE player_dbid = %i", ReturnSQLFromName(inputtext));
            new Cache:cache = mysql_query(m_Handle, Query);

            if(!cache_num_rows())
            {
                format(string, sizeof(string), "The user \"{A52A2A}%s{ADC3E7}\" does not have any admin notes.", inputtext);
                ShowPlayerDialog(playerid, DIALOG_APANEL, DIALOG_STYLE_MSGBOX, "Administration panel", string, "Okay!", "");

                cache_delete(cache);
                return 1;
            }
            else
            {
                new Reason[128];
                new ID;

                new FullList[400], ShowList[128];

                for(new i = 0, j = 1; i < cache_num_rows(); i++)
                {
                    cache_get_value_name(i, "anote_reason", Reason, 128);
                    cache_get_value_name_int(i, "id", ID);

                    AdminNoteSelect[playerid][j] = ID;
                    j++;

                    if(j > MAX_ADMIN_NOTES)
                        break;

                    format(ShowList, sizeof(ShowList), "[%i] %.35s...\n", i+1, Reason);
                    strcat(FullList, ShowList);
                }

                ShowPlayerDialog(playerid, DIALOG_ANOTE_SELECT, DIALOG_STYLE_LIST, "Administration panel", FullList, "Seç", "<<");
            }
            return 1;
        }
        case DIALOG_ANOTE_SELECT:
        {
            if(!response)
                return ShowAdminPanel(playerid);

            new Query[128];

            mysql_format(m_Handle, Query, sizeof(Query), "SELECT * FROM player_anotes WHERE id = %i", AdminNoteSelect[playerid][listitem+1]);
            new Cache:cache = mysql_query(m_Handle, Query);

            if(!cache_num_rows())
            {
                cache_delete(cache);

                ShowPlayerDialog(playerid, DIALOG_APANEL, DIALOG_STYLE_MSGBOX, "Administration panel", "An error occurred with this admin note.", "Okay!", "");
                return 1;
            }
            else
            {
                new PlayerDBID, Reason[128],
                    Issuer[60], note_date;

                cache_get_value_name_int(0, "player_dbid", PlayerDBID);
                cache_get_value_name(0, "anote_issuer", Issuer, 60);

                cache_get_value_name(0, "anote_reason", Reason, 128);
                cache_get_value_name_int(0, "anote_date", note_date);

                new Primary[500], Sub[128];

                format(Sub, sizeof(Sub), "Player name: %s\n", ReturnSQLName(PlayerDBID));
                strcat(Primary, Sub);

                format(Sub, sizeof(Sub), "Issuer name: %s\n\n", Issuer);
                strcat(Primary, Sub);

                format(Sub, sizeof(Sub), "Date: %s\n", GetFullTime(note_date));
                strcat(Primary, Sub);

                format(Sub, sizeof(Sub), "Reason: %s\n\n", Reason);
                strcat(Primary, Sub);

                strcat(Primary, "{A52A2A}Use admin sys to Delete or Edit this admin note.");
                ShowPlayerDialog(playerid, DIALOG_APANEL, DIALOG_STYLE_MSGBOX, "Administration panel", Primary, "Okay!", "");

                for(new i = 1; i < MAX_ADMIN_NOTES; i++)
                    AdminNoteSelect[playerid][i] = 0;
            }
            return 1;
        }
        case DIALOG_ANOTE_EDIT:
        {
            if(!response)
                return ShowAdminPanel(playerid);

            if(!IsValidRoleplayName(inputtext))
            {
                ShowAdminSys(playerid, 10, "The username you specified isn't possible.");
                return 1;
            }

            if(!ReturnSQLFromName(inputtext))
            {
                ShowAdminSys(playerid, 10, "The username you specified doesn't exist in the database.");
                return 1;
            }

            new Query[200], string[128];

            mysql_format(m_Handle, Query, sizeof(Query), "SELECT * FROM player_anotes WHERE player_dbid = %i", ReturnSQLFromName(inputtext));
            new Cache:cache = mysql_query(m_Handle, Query);

            if(!cache_num_rows())
            {
                format(string, sizeof(string), "The user \"{A52A2A}%s{ADC3E7}\" does not have any admin notes.", inputtext);
                ShowPlayerDialog(playerid, DIALOG_APANEL, DIALOG_STYLE_MSGBOX, "Administration panel", string, "Okay!", "");

                cache_delete(cache);
                return 1;
            }
            else
            {
                new ID,
                    Reason[128];

                new FullList[400], ShowList[128];

                for(new i = 0, j = 1; i < cache_num_rows(); i++)
                {
                    cache_get_value_name(i, "anote_reason", Reason, 128);
                    cache_get_value_name_int(i, "id", ID);

                    AdminNoteSelect[playerid][j] = ID;
                    j++;

                    if(j > MAX_ADMIN_NOTES)
                        break;

                    format(ShowList, sizeof(ShowList), "[%i] %.35s...\n", i+1, Reason);
                    strcat(FullList, ShowList);
                }

                format(AdminPanelName[playerid], 60, "%s", inputtext);

                ShowPlayerDialog(playerid, DIALOG_ANOTE_EDIT_YES, DIALOG_STYLE_LIST, "Administration panel", FullList, "Seç", "<<");
            }
            return 1;
        }
        case DIALOG_ANOTE_EDIT_YES:
        {
            if(!response)
                return ShowAdminPanel(playerid);

            new Query[128];

            mysql_format(m_Handle, Query, sizeof(Query), "SELECT * FROM player_anotes WHERE id = %i", AdminNoteSelect[playerid][listitem+1]);
            new Cache:cache = mysql_query(m_Handle, Query);

            if(!cache_num_rows())
            {
                cache_delete(cache);

                ShowPlayerDialog(playerid, DIALOG_APANEL, DIALOG_STYLE_MSGBOX, "Administration panel", "An error occurred with this admin note.", "Okay!", "");
                return 1;
            }
            else
            {
                new PlayerDBID, Reason[128],
                    Issuer[60], note_date;

                cache_get_value_name_int(0, "player_dbid", PlayerDBID);
                cache_get_value_name(0, "anote_issuer", Issuer, 60);
                cache_get_value_name(0, "anote_reason", Reason, 128);
                cache_get_value_name_int(0, "anote_date", note_date);

                new Primary[500], Sub[128];

                format(Sub, sizeof(Sub), "Player name: %s\n", ReturnSQLName(PlayerDBID));
                strcat(Primary, Sub);

                format(Sub, sizeof(Sub), "Issuer name: %s\n\n", Issuer);
                strcat(Primary, Sub);

                format(Sub, sizeof(Sub), "Date: %s\n", GetFullTime(note_date));
                strcat(Primary, Sub);

                format(Sub, sizeof(Sub), "Reason: %s\n\n", Reason);
                strcat(Primary, Sub);

                strcat(Primary, "{A52A2A}Select \"EDIT\" to edit this admin note reason.");
                ShowPlayerDialog(playerid, DIALOG_ANOTE_EDIT_YES2, DIALOG_STYLE_MSGBOX, "Administration panel", Primary, "Edit", "<<");

                cache_delete(cache);
                AdminNoteSelected[playerid] = AdminNoteSelect[playerid][listitem+1];
                format(AdminNoteIssuer[playerid], 90, "%s", Issuer);
            }
            return 1;
        }
        case DIALOG_ANOTE_EDIT_YES2:
        {
            if(!response)
                return ShowAdminPanel(playerid);

            ShowPlayerDialog(playerid, DIALOG_ANOTE_EDIT_YES3, DIALOG_STYLE_INPUT, "Administration panel", "What would you like to edit this admin notes reason to?", "Seç", "<<");
            return 1;
        }
        case DIALOG_ANOTE_EDIT_YES3:
        {
            if(!response)
                return ShowAdminPanel(playerid);

            new Query[256], IssuerEdit[128];

            if(strlen(inputtext) < 3)
                return ShowPlayerDialog(playerid, DIALOG_ANOTE_EDIT_YES3, DIALOG_STYLE_INPUT, "Administration panel", "What would you like to edit this admin notes reason to?", "Seç", "<<");

            if(strcmp(AdminNoteIssuer[playerid], ReturnName(playerid), true))
            {
                format(IssuerEdit[playerid], 128, "%s+%s", AdminNoteIssuer[playerid], ReturnName(playerid));
            }
            else format(IssuerEdit[playerid], 128, "%s", AdminNoteIssuer[playerid]);

            foreach(new i : Player)
            {
                for(new j = 1; j < MAX_ADMIN_NOTES; j++)
                {
                    if(aNotesData[i][j][anote_SQLID] == AdminNoteSelected[playerid])
                    {
                        format(aNotesData[i][j][anote_reason], 128, "%s", inputtext);
                        format(aNotesData[i][j][anote_issuer], 60, "%s", IssuerEdit);
                    }
                }
            }

            mysql_format(m_Handle, Query, sizeof(Query), "UPDATE player_anotes SET anote_reason = '%e', anote_issuer = '%e' WHERE id = %i", inputtext, IssuerEdit[playerid], AdminNoteSelected[playerid]);
            mysql_tquery(m_Handle, Query);

            format(IssuerEdit, sizeof(IssuerEdit), "You successfully edited an admin note on {A52A2A}%s.", AdminPanelName[playerid]);
            ShowPlayerDialog(playerid, DIALOG_APANEL, DIALOG_STYLE_MSGBOX, "Administration panel", IssuerEdit, "Okay!", "");

            format(IssuerEdit, sizeof(IssuerEdit), "%s had an admin noted edited by %s", AdminPanelName[playerid], ReturnName(playerid));
            adminWarn(2, IssuerEdit);
            return 1;
        }
        case DIALOG_ANOTE_ADD:
        {
            if(!response)
                return ShowAdminPanel(playerid);

            if(!IsValidRoleplayName(inputtext))
            {
                ShowAdminSys(playerid, 11, "The username you specified isn't possible.");
                return 1;
            }

            if(!ReturnSQLFromName(inputtext))
            {
                ShowAdminSys(playerid, 11, "The username you specified doesn't exist in the database.");
                return 1;
            }

            new bool:hasSlot = false;
            new NotIG;
            new string[128];

            foreach(new i : Player)
            {
                if(!strcmp(ReturnName(i), inputtext, true))
                {
                    if(ReturnANoteSlot(i) != -1)
                    {
                        hasSlot = true;
                    }
                }
                else
                {
                    NotIG = true;
                }
            }

            if(NotIG)
            {
                new Query[128];

                mysql_format(m_Handle, Query, sizeof(Query), "SELECT id FROM player_anotes WHERE player_dbid = %i", ReturnSQLFromName(inputtext));
                new Cache:cache = mysql_query(m_Handle, Query);

                if(!cache_num_rows())
                {
                    hasSlot = true;
                    cache_delete(cache);
                }
                else
                {
                    if(cache_num_rows() > MAX_ADMIN_NOTES)
                    {
                        hasSlot = false;
                    }
                }
            }

            if(!hasSlot)
            {
                format(string, sizeof(string), "The user \"{A52A2A}%s{ADC3E7}\" does not have any free admin note slots.", inputtext);
                ShowPlayerDialog(playerid, DIALOG_APANEL, DIALOG_STYLE_MSGBOX, "Administration panel", string, "Okay!", "");
                return 1;
            }

            format(AdminPanelName[playerid], 60, "%s", inputtext);

            format(string, sizeof(string), "Input the reason for \"{A52A2A}%s{ADC3E7}\"'s new admin note:", inputtext);
            ShowPlayerDialog(playerid, DIALOG_ANOTE_ADD_REASON, DIALOG_STYLE_INPUT, "Administration panel", string, "Seç", "<<");
            return 1;
        }
        case DIALOG_ANOTE_ADD_REASON:
        {
            if(!response)
                return ShowAdminPanel(playerid);

            if(strlen(inputtext) < 3)
            {
                new string[128];

                format(string, sizeof(string), "Input the reason for \"{A52A2A}%s{ADC3E7}\"'s new admin note:", AdminPanelName[playerid]);
                ShowPlayerDialog(playerid, DIALOG_ANOTE_ADD_REASON, DIALOG_STYLE_INPUT, "Administration panel", string, "Seç", "<<");
                return 1;
            }

            new Insert[400];
            mysql_format(m_Handle, Insert, sizeof(Insert), "INSERT INTO player_anotes (player_dbid, anote_reason, anote_issuer, anote_date) VALUES(%i, '%e', '%e', %i)", ReturnSQLFromName(AdminPanelName[playerid]), inputtext, ReturnName(playerid), Time());
            mysql_tquery(m_Handle, Insert, "OnAdminNoteAdd", "is", playerid, inputtext);
            return 1;
        }
        case DIALOG_ANOTE_DELETE:
        {
            if(!response)
                return ShowAdminPanel(playerid);

            if(!IsValidRoleplayName(inputtext))
            {
                ShowAdminSys(playerid, 12, "The username you specified isn't possible.");
                return 1;
            }

            if(!ReturnSQLFromName(inputtext))
            {
                ShowAdminSys(playerid, 12, "The username you specified doesn't exist in the database.");
                return 1;
            }

            new Query[200], string[128];

            mysql_format(m_Handle, Query, sizeof(Query), "SELECT * FROM player_anotes WHERE player_dbid = %i", ReturnSQLFromName(inputtext));
            new Cache:cache = mysql_query(m_Handle, Query);

            if(!cache_num_rows())
            {
                format(string, sizeof(string), "The user \"{A52A2A}%s{ADC3E7}\" does not have any admin notes.", inputtext);
                ShowPlayerDialog(playerid, DIALOG_APANEL, DIALOG_STYLE_MSGBOX, "Administration panel", string, "Okay!", "");

                cache_delete(cache);
                return 1;
            }
            else
            {
                new Reason[128];
                new ID;

                new FullList[400], ShowList[128];

                for(new i = 0, j = 1; i < cache_num_rows(); i++)
                {
                    cache_get_value_name(i, "anote_reason", Reason, 128);
                    cache_get_value_name_int(i, "id", ID);

                    AdminNoteSelect[playerid][j] = ID;
                    j++;

                    if(j > MAX_ADMIN_NOTES)
                        break;

                    format(ShowList, sizeof(ShowList), "[%i] %.35s...\n", i+1, Reason);
                    strcat(FullList, ShowList);
                }

                format(AdminPanelName[playerid], 60, "%s", inputtext);

                ShowPlayerDialog(playerid, DIALOG_ANOTE_DELETE_SELECT, DIALOG_STYLE_LIST, "Administration panel", FullList, "Seç", "<<");
            }
            return 1;
        }
        case DIALOG_ANOTE_DELETE_SELECT:
        {
            if(!response)
                return ShowAdminPanel(playerid);

            new Query[128];

            mysql_format(m_Handle, Query, sizeof(Query), "SELECT * FROM player_anotes WHERE id = %i", AdminNoteSelect[playerid][listitem+1]);
            new Cache:cache = mysql_query(m_Handle, Query);

            if(!cache_num_rows())
            {
                cache_delete(cache);

                ShowPlayerDialog(playerid, DIALOG_APANEL, DIALOG_STYLE_MSGBOX, "Administration panel", "An error occurred with this admin note.", "Okay!", "");
                return 1;
            }
            else
            {
                new PlayerDBID, Reason[128],
                    Issuer[60], note_date;

                cache_get_value_name_int(0, "player_dbid", PlayerDBID);
                cache_get_value_name(0, "anote_issuer", Issuer, 60);
                cache_get_value_name(0, "anote_reason", Reason, 128);
                cache_get_value_name_int(0, "anote_date", note_date);

                new Primary[500], Sub[128];

                format(Sub, sizeof(Sub), "Player name: %s\n", ReturnSQLName(PlayerDBID));
                strcat(Primary, Sub);

                format(Sub, sizeof(Sub), "Issuer name: %s\n\n", Issuer);
                strcat(Primary, Sub);

                format(Sub, sizeof(Sub), "Date: %s\n", GetFullTime(note_date));
                strcat(Primary, Sub);

                format(Sub, sizeof(Sub), "Reason: %s\n\n", Reason);
                strcat(Primary, Sub);

                strcat(Primary, "{A52A2A}Select \"DELETE\" to delete this admin note.");
                ShowPlayerDialog(playerid, DIALOG_ANOTE_DELETE_CONFIRM, DIALOG_STYLE_MSGBOX, "Administration panel", Primary, "Delete", "<<");

                cache_delete(cache);
                AdminNoteSelected[playerid] = AdminNoteSelect[playerid][listitem+1];
            }
            return 1;
        }
        case DIALOG_ANOTE_DELETE_CONFIRM:
        {
            if(!response)
                return ShowAdminPanel(playerid);

            new string[128];

            format(string, sizeof(string), "Are you sure you want to delete \"{A52A2A}%s{ADC3E7}\"'s admin note?", AdminPanelName[playerid]);
            ConfirmDialog(playerid, "Administration panel", string, "OnAdminNoteDelete", AdminNoteSelected[playerid]);
            return 1;
        }
        case DIALOG_PASSWORD_CHANGE:
        {
            if(response)
            {
                if(strlen(inputtext) > 128 || strlen(inputtext) < 3)
                {
                    new
                        largeString[800];

                    strcat(largeString, "{F81414}ÞÝFRENÝ DEÐÝÞTÝRMEK ÜZERESÝN!\n");
                    strcat(largeString, "{FFFFFF}Hesap þifrenizi güvende tutmak için birkaç ipucu:\n\n");
                    strcat(largeString, "\tParolanýzda harf, sayý ve simge karýþýmý kullanýn.\n");
                    strcat(largeString, "\tÖnemli hesaplarýnýzýn her biri için benzersiz bir þifre kullanýn.\n");
                    strcat(largeString, "\tKiþisel bilgilerinizi veya yaygýn kelimeleri þifre olarak kullanmayýn.\n");
                    strcat(largeString, "\twww.forum.lss-roleplay.com forum hesabýnýzla ayný þifreyi kullanmayýn.\n\n");
                    strcat(largeString, "Unutmayýn, Los Santos Stories ekibi asla þifrenizi istemez.\n\n");
                    strcat(largeString, "{F81414}Þifreniz en az 3 fazla 128 karakter aralýðýnda olmalýdýr.");
                    ShowPlayerDialog(playerid, DIALOG_PASSWORD_CHANGE, DIALOG_STYLE_PASSWORD, "Los Santos Stories: Þifre Deðiþtir", largeString, "Deðiþtir", "Ýptal");
                    return 1;
                }

                new hashed_password[129], query[256];
                WP_Hash(hashed_password, 129, inputtext);
                mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET Password = '%e' WHERE id = %i", hashed_password, PlayerData[playerid][pSQLID]);
                mysql_tquery(m_Handle, query);

                ShowPlayerDialog(playerid, DIALOG_USE, DIALOG_STYLE_MSGBOX, "Los Santos Stories: Þifre Deðiþtir", "Þifreniz baþarýyla deðiþtirildi.", "Tamam", "");
            }
            else return SendClientMessage(playerid, COLOR_ADM, "SERVER: Þifre deðiþtirme iþlemini iptal ettin.");
            return 1;
        }
        case DIALOG_PASSWORD_SECURITY_WORD:
        {
            if(!response)
            {
                new
                    string[128],
                    ipString[128];

                if(PlayerData[playerid][pAdmin] < 3)
                    format(ipString, 128, "%s", ReturnIP(playerid));

                else ipString = "Admin Account";

                format(string, sizeof(string), "%s (IP: %s) þifre deðiþtirirken gizli kelimeyi yazamadi ve menüyü kapattý.", ReturnName(playerid), ipString);
                adminWarn(1, string);

                printf("[Uyarý] %s (IP: %s) sifre degistirirken gizli kelimeyi yazamadi ve menuyu kapatti.", ReturnName(playerid), ReturnIP(playerid));
                return 1;
            }

            new query[354], hashed_secretword[129];
            WP_Hash(hashed_secretword, 129, inputtext);
            mysql_format(m_Handle, query, sizeof(query), "SELECT id FROM players WHERE SecretWord = '%e' AND id = %i", hashed_secretword, PlayerData[playerid][pSQLID]);
            mysql_tquery(m_Handle, query, "ConfirmSecretWord", "i", playerid);
            return 1;
        }
        case DIALOG_CALL:
        {
            if(response)
            {
                if(!(1 <= strlen(inputtext) <= 12))
                    return ShowPlayerDialog(playerid, DIALOG_CALL, DIALOG_STYLE_INPUT, "Telefon: Ara", "Geçerli bir telefon numarasý girin.\nLütfen aramak istediðiniz telefon numarasýný giriniz:", "Ara", "Kapat");

                new str[13];
                format(str, sizeof(str), "%s", inputtext);
                cmd_ara(playerid, str);
            }
            return 1;
        }
        case DIALOG_SMS_1:
        {
            if(response)
            {
                if(!(1 <= strlen(inputtext) <= 12))
                    return ShowPlayerDialog(playerid, DIALOG_SMS_1, DIALOG_STYLE_INPUT, "Telefon: SMS", "Geçerli bir telefon numarasý girin.\nLütfen SMS göndermek istediðiniz telefon numarasýný giriniz:", "Ýleri", "Kapat");

                new str[13];
                format(str, sizeof(str), "%s", inputtext);
                SetPVarString(playerid, "UIPhone_SMSNumber", str);
                ShowPlayerDialog(playerid, DIALOG_SMS_2, DIALOG_STYLE_INPUT, "Telefon: SMS", "Lütfen göndermek istediðiniz SMS içeriðini giriniz:", "Gönder", "Kapat");
            }
            return 1;
        }
        case DIALOG_SMS_2:
        {
            if(response)
            {
                if(!(1 <= strlen(inputtext) <= 64))
                    return ShowPlayerDialog(playerid, DIALOG_SMS_2, DIALOG_STYLE_INPUT, "Telefon: SMS", "Geçerli bir mesaj girin.\nLütfen göndermek istediðiniz SMS içeriðini giriniz:", "Gönder", "Kapat");

                new number[13], str[128];
                GetPVarString(playerid, "UIPhone_SMSNumber", number, sizeof(number));
                format(str, sizeof(str), "%s %s", number, inputtext);
                cmd_sms(playerid, str);
            }
            return 1;
        }
        case DIALOG_CONTACT_1:
        {
            if(response)
            {
                if(!(1 <= strlen(inputtext) <= 24))
                    return ShowPlayerDialog(playerid, DIALOG_CONTACT_1, DIALOG_STYLE_INPUT, "Telefon: Rehbere Ekle", "Geçerli bir kiþi adý girin.\nRehbere ekleyeceðiniz kiþinin adý nedir:", "Ýleri", "Kapat");

                if(ContainsInvalidCharacters(inputtext))
                    return ShowPlayerDialog(playerid, DIALOG_CONTACT_1, DIALOG_STYLE_INPUT, "Telefon: Rehbere Ekle", "Geçerli bir kiþi adý girin.\nRehbere ekleyeceðiniz kiþinin adý nedir:", "Ýleri", "Kapat");

                new str[25];
                format(str, sizeof(str), "%s", inputtext);
                SetPVarString(playerid, "UIPhone_ContactName", str);
                ShowPlayerDialog(playerid, DIALOG_CONTACT_2, DIALOG_STYLE_INPUT, "Telefon: Rehbere Ekle", "Rehbere ekleyeceðiniz kiþinin numarasý nedir:", "Ekle", "Kapat");
            }
            return 1;
        }
        case DIALOG_CONTACT_2:
        {
            if(!(1 <= strlen(inputtext) <= 12))
                return ShowPlayerDialog(playerid, DIALOG_CONTACT_2, DIALOG_STYLE_INPUT, "Telefon: Rehbere Ekle", "Geçerli bir telefon numarasý girin.\nRehbere ekleyeceðiniz kiþinin numarasý nedir:", "Ekle", "Kapat");

            new contact_name[25], str[128];
            GetPVarString(playerid, "UIPhone_ContactName", contact_name, sizeof(contact_name));
            format(str, sizeof(str), "ekle %s %s", contact_name, inputtext);
            cmd_rehber(playerid, str);
            return 1;
        }
        case DIALOG_CONTACT_EDIT_1:
        {
            if (response)
            {
                SetPVarInt(playerid, "ContactEditID", listitem+1);
                new id = GetPVarInt(playerid, "ContactEditID");

                new string[128];
                format (string, sizeof(string), "Düzenlenen Kiþi: %s - %d\n\nBu kiþinin yeni telefon numarasýný giriniz:", ContactsData[playerid][id][contactName], ContactsData[playerid][id][contactNumber]);
                ShowPlayerDialog(playerid, DIALOG_CONTACT_EDIT_2, DIALOG_STYLE_INPUT, "Telefon: Kiþi Düzenle", string, "Ýleri", "Kapat");
            }
            return 1;
        }

        case DIALOG_CONTACT_EDIT_2:
        {
            if (response)
            {
                new string[128];
                new id = GetPVarInt(playerid, "ContactEditID");

                if(!(1 <= strlen(inputtext) <= 10))
                {
                    format (string, sizeof(string), "Düzenlenen Kiþi: %s - %d\n\nBu kiþinin yeni telefon numarasýný giriniz:", ContactsData[playerid][id][contactName], ContactsData[playerid][id][contactNumber]);
                    ShowPlayerDialog(playerid, DIALOG_CONTACT_EDIT_2, DIALOG_STYLE_INPUT, "Telefon: Kiþi Düzenle", string, "Ýleri", "Kapat");
                    return 1;
                }

                if(ContainsInvalidCharacters(inputtext))
                {
                    format (string, sizeof(string), "Düzenlenen Kiþi: %s - %d\n\nBu kiþinin yeni telefon numarasýný giriniz:", ContactsData[playerid][id][contactName], ContactsData[playerid][id][contactNumber]);
                    ShowPlayerDialog(playerid, DIALOG_CONTACT_EDIT_2, DIALOG_STYLE_INPUT, "Telefon: Kiþi Düzenle", string, "Ýleri", "Kapat");
                    return 1;
                }

                ContactsData[playerid][id][contactNumber] = strval(inputtext);
                format (string, sizeof(string), "Düzenlenen Kiþi: %s - %d\n\nBu kiþinin yeni adýný giriniz:", ContactsData[playerid][id][contactName], ContactsData[playerid][id][contactNumber]);
                ShowPlayerDialog(playerid, DIALOG_CONTACT_EDIT_3, DIALOG_STYLE_INPUT, "Telefon: Kiþi Düzenle", string, "Kaydet", "Kapat");
            }
            return 1;
        }

        case DIALOG_CONTACT_EDIT_3:
        {
            if (response)
            {
                new string[128];
                new id = GetPVarInt(playerid, "ContactEditID");

                if(!(1 <= strlen(inputtext) <= 24))
                {
                    format (string, sizeof(string), "Düzenlenen Kiþi: %s - %d\n\nBu kiþinin yeni adýný giriniz:", ContactsData[playerid][id][contactName], ContactsData[playerid][id][contactNumber]);
                    ShowPlayerDialog(playerid, DIALOG_CONTACT_EDIT_3, DIALOG_STYLE_INPUT, "Telefon: Kiþi Düzenle", string, "Kaydet", "Kapat");
                    return 1;
                }

                if(ContainsInvalidCharacters(inputtext))
                {
                    format (string, sizeof(string), "Düzenlenen Kiþi: %s - %d\n\nBu kiþinin yeni adýný giriniz:", ContactsData[playerid][id][contactName], ContactsData[playerid][id][contactNumber]);
                    ShowPlayerDialog(playerid, DIALOG_CONTACT_EDIT_3, DIALOG_STYLE_INPUT, "Telefon: Kiþi Düzenle", string, "Kaydet", "Kapat");
                    return 1;
                }

                format(string, sizeof(string), "%s", inputtext);
                ContactsData[playerid][id][contactName] = string;
                SendClientMessage(playerid, COLOR_ACTION, "SERVER: Seçtiðin kiþinin bilgileri baþarýyla düzenlendi.");
            }
            return 1;
        }

        case DIALOG_CONTACT_DELETE:
        {
            if (response) {
                SetPVarInt(playerid, "ContactDeleteID", listitem+1);
                new id = GetPVarInt(playerid, "ContactDeleteID");

                new query[128];
                mysql_format(m_Handle, query, sizeof(query), "DELETE FROM player_contacts WHERE id = %i", ContactsData[playerid][id][contactSQLID]);
                mysql_pquery(m_Handle, query);

                ContactsData[playerid][id][contactID] = 0;
                ContactsData[playerid][id][contactSQLID] = 0;

                SendClientMessage(playerid, COLOR_ACTION, "SERVER: Seçtiðin kiþi rehberinden baþarýyla silindi.");
            }
            return 1;
        }
        case DIALOG_SMS_OR_CALL:
        {
            if (!response)
                ShowPlayerDialog(playerid, DIALOG_SMS_OR_CALL2, DIALOG_STYLE_INPUT, "Telefon: SMS", "Lütfen göndermek istediðiniz SMS içeriðini giriniz:", "Gönder", "Kapat");
            else {
                cmd_ara(playerid, sprintf("%d", GetPVarInt(playerid, "SMSorCall")));
            }
            return 1;
        }

        case DIALOG_SMS_OR_CALL2:
        {
            if(response)
            {
                if(!(1 <= strlen(inputtext) <= 64))
                    return ShowPlayerDialog(playerid, DIALOG_SMS_2, DIALOG_STYLE_INPUT, "Telefon: SMS", "Geçerli bir mesaj girin.\nLütfen göndermek istediðiniz SMS içeriðini giriniz:", "Gönder", "Kapat");

                new str[128];
                format(str, sizeof(str), "%d %s",GetPVarInt(playerid, "SMSorCall"), inputtext);
                cmd_sms(playerid, str);
            }
        }
        case DIALOG_FACTIONMENU:
        {
            if(response)
            {
                ShowYourFactionMenuAlt(playerid, listitem);
            }
            return 1;
        }
        case DIALOG_FACTIONMENU_NAME:
        {
            if(!response) return ShowYourFactionMenu(playerid);
            if(strlen(inputtext) < 6 || strlen(inputtext) > 60) return ShowYourFactionMenuAlt(playerid, 0);
            if(ContainsInvalidCharacters(inputtext)) return ShowYourFactionMenuAlt(playerid, 0);

            SendClientMessageEx(playerid, COLOR_GREY, "SERVER: Rütbe ismini \"%s\" olarak deðiþtirdin.", inputtext);
            format(FactionData[PlayerData[playerid][pFaction]][FactionName], 128, "%s", inputtext);
            Faction_Save(PlayerData[playerid][pFaction]);
            ShowYourFactionMenu(playerid);
            return 1;
        }
        case DIALOG_FACTIONMENU_ABBREV:
        {
            if(!response) return ShowYourFactionMenu(playerid);
            if(strlen(inputtext) < 1 || strlen(inputtext) > 7) return ShowYourFactionMenuAlt(playerid, 1);
            if(ContainsInvalidCharacters(inputtext)) return ShowYourFactionMenuAlt(playerid, 1);

            SendClientMessageEx(playerid, COLOR_GREY, "SERVER: Birlik kýsaltmasýný \"%s\" olarak deðiþtirdin.", inputtext);
            format(FactionData[PlayerData[playerid][pFaction]][FactionAbbrev], 128, "%s", inputtext);
            Faction_Save(PlayerData[playerid][pFaction]);
            ShowYourFactionMenu(playerid);
            return 1;
        }
        case DIALOG_FACTIONMENU_ALTER:
        {
            if(!response) return ShowYourFactionMenu(playerid);
            if(!IsNumeric(inputtext)) return ShowYourFactionMenuAlt(playerid, 2);

            new rank_id = strval(inputtext);
            if(rank_id > MAX_FACTION_RANKS || rank_id < 1) return ShowYourFactionMenuAlt(playerid, 2);

            SendClientMessageEx(playerid, COLOR_GREY, "SERVER: Birliðin rütbe deðiþtirme yetkisini \"%s\" [%i] rütbesi olarak deðiþtirdin.", FactionRanks[PlayerData[playerid][pFaction]][rank_id], rank_id);
            FactionData[PlayerData[playerid][pFaction]][FactionEditrank] = rank_id;
            Faction_Save(PlayerData[playerid][pFaction]);
            ShowYourFactionMenu(playerid);
            return 1;
        }
        case DIALOG_FACTIONMENU_TOW:
        {
            if(!response)
                return ShowYourFactionMenu(playerid);

            if(!IsNumeric(inputtext))
                return ShowYourFactionMenuAlt(playerid, 3);

            new rank_id;
            rank_id = strval(inputtext);

            if(rank_id > MAX_FACTION_RANKS || rank_id < 1)
                return ShowYourFactionMenuAlt(playerid, 3);

            SendClientMessageEx(playerid, COLOR_GREY, "SERVER: Birliðin araç çekme yetkisini \"%s\" [%i] rütbesi olarak deðiþtirdin.", FactionRanks[PlayerData[playerid][pFaction]][rank_id], rank_id);
            FactionData[PlayerData[playerid][pFaction]][FactionTowrank] = rank_id;
            Faction_Save(PlayerData[playerid][pFaction]);

            ShowYourFactionMenu(playerid);
            return 1;
        }
        case DIALOG_FACTIONMENU_CHAT:
        {
            if(!response)
                return ShowYourFactionMenu(playerid);

            if(!IsNumeric(inputtext))
                return ShowYourFactionMenuAlt(playerid, 4);

            new rank_id;
            rank_id = strval(inputtext);

            if(rank_id > MAX_FACTION_RANKS || rank_id < 1)
                return ShowYourFactionMenuAlt(playerid, 4);

            SendClientMessageEx(playerid, COLOR_GREY, "SERVER: Birliðin /f yetkisini \"%s\" [%i] rütbesi olarak deðiþtirdin.", FactionRanks[PlayerData[playerid][pFaction]][rank_id], rank_id);
            FactionData[PlayerData[playerid][pFaction]][FactionChatrank] = rank_id;
            Faction_Save(PlayerData[playerid][pFaction]);

            ShowYourFactionMenu(playerid);
            return 1;
        }
        case DIALOG_FACTIONMENU_JOIN:
        {
            if(!response)
                return ShowYourFactionMenu(playerid);

            if(!IsNumeric(inputtext))
                return ShowYourFactionMenuAlt(playerid, 5);

            new rank_id;
            rank_id = strval(inputtext);

            if(rank_id > MAX_FACTION_RANKS || rank_id < 1)
                return ShowYourFactionMenuAlt(playerid, 5);

            SendClientMessageEx(playerid, COLOR_GREY, "SERVER: Birliðin giriþ rütbesini \"%s\" [%i] olarak deðiþtirdin.", FactionRanks[PlayerData[playerid][pFaction]][rank_id], rank_id);
            FactionData[PlayerData[playerid][pFaction]][FactionMaxRanks] = rank_id;
            Faction_Save(PlayerData[playerid][pFaction]);

            ShowYourFactionMenu(playerid);
            return 1;
        }
        case DIALOG_FACTIONMENU_EDIT:
        {
            if(!response) return ShowYourFactionMenu(playerid);
            SetPVarInt(playerid, "SelectedRank", listitem + 1);
            ShowYourFactionMenuAlt(playerid, 8);
            return 1;
        }
        case DIALOG_FACTIONMENU_EDITALT:
        {
            if(!response)
            {
                DeletePVar(playerid, "SelectedRank");
                return ShowYourFactionMenuAlt(playerid, 6);
            }

            if(strlen(inputtext) < 2 || strlen(inputtext) > 60)
            {
                return ShowYourFactionMenuAlt(playerid, 8);
            }

            new rank_id = GetPVarInt(playerid, "SelectedRank");
            SendClientMessageEx(playerid, COLOR_GREY, "SERVER: Birliðin %s[%i] rütbesinin adýný \"%s\" olarak deðiþtirdin.", FactionRanks[PlayerData[playerid][pFaction]][rank_id], rank_id, inputtext);
            format(FactionRanks[PlayerData[playerid][pFaction]][rank_id], 60, "%s", inputtext);
            Faction_SaveRanks(PlayerData[playerid][pFaction]);
            DeletePVar(playerid, "SelectedRank");
            ShowYourFactionMenuAlt(playerid, 6);
            return 1;
        }
        case DIALOG_FACTIONMENU_EDITSAL:
        {
            if(!response) return ShowYourFactionMenu(playerid);

            SetPVarInt(playerid, "SelectedRank", listitem + 1);
            ShowYourFactionMenuAlt(playerid, 9);
            return 1;
        }
        case DIALOG_FACTIONMENU_EDITALTSAL:
        {
            if(!response)
            {
                DeletePVar(playerid, "SelectedRank");
                return ShowYourFactionMenuAlt(playerid, 7);
            }

            if(!IsNumeric(inputtext)) return ShowYourFactionMenuAlt(playerid, 9);
            if(strval(inputtext) < 1 || strval(inputtext) > 2000) return ShowYourFactionMenuAlt(playerid, 9);

            new rank_id;
            rank_id = GetPVarInt(playerid, "SelectedRank");
            SendClientMessageEx(playerid, COLOR_GREY, "SERVER: Birliðin %s[%i] rütbesinin maaþýný \"$%s\" olarak deðiþtirdin.", FactionRanks[PlayerData[playerid][pFaction]][rank_id], rank_id, MoneyFormat(strval(inputtext)));
            FactionRanksSalary[PlayerData[playerid][pFaction]][rank_id] = strval(inputtext);
            Faction_SaveRanks(PlayerData[playerid][pFaction]);
            DeletePVar(playerid, "SelectedRank");
            ShowYourFactionMenuAlt(playerid, 7);
            return 1;
        }
    }

    if(dialogid != POKER_DIALOG_ID)
        return 0;

    Pkr_PlayerDialogResponse(playerid, dialogid, response, listitem, inputtext);
    Pkr_GameDialogResponse(playerid, dialogid, response, listitem, inputtext);
    Pkr_PlayerChipsDialogResponse(playerid, response, inputtext);
    return 0;
}

public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{
    if (PlayerData[playerid][pBuyingClothing])
    {
        if(!response)
        {
            SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}Ýþlem iptal edildi.");
            RemovePlayerAttachedObject(playerid, index);

            PlayerData[playerid][pBuyingClothing] = false;
            return 1;
        }

        if (PlayerData[playerid][pMoney] < PlayerData[playerid][pClothingPrice])
        {
            SendClientMessageEx(playerid, COLOR_ADM, "[!] {FFFFFF}Yeterli paran yok. Toplam: $%s", MoneyFormat(PlayerData[playerid][pClothingPrice]));
            RemovePlayerAttachedObject(playerid, index);

            PlayerData[playerid][pBuyingClothing] = false;
            return 1;
        }

        Clothing_Create(playerid, index, modelid, boneid, fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, fScaleX, fScaleY, fScaleZ);

        GiveMoney(playerid, -PlayerData[playerid][pClothingPrice]);
        PlayerData[playerid][pBuyingClothing] = false;
        PlayerData[playerid][pClothingPrice] = 0;
        return 1;
    }

    if(PlayerData[playerid][pEditingClothing])
    {
        if(!response)
        {
            SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}Ýþlem iptal edildi.");
            RemovePlayerAttachedObject(playerid, index);

            PlayerData[playerid][pEditingClothing] = false;
            return 1;
        }

        new id = GetPVarInt(playerid, "ClothingID");

        ClothingData[playerid][id][ClothingPos][0] = fOffsetX, ClothingData[playerid][id][ClothingPos][1] = fOffsetY, ClothingData[playerid][id][ClothingPos][2] = fOffsetZ;
        ClothingData[playerid][id][ClothingRot][0] = fRotX, ClothingData[playerid][id][ClothingRot][1] = fRotY, ClothingData[playerid][id][ClothingRot][2] = fRotZ;
        ClothingData[playerid][id][ClothingScale][0] = fScaleX, ClothingData[playerid][id][ClothingScale][1] = fScaleY, ClothingData[playerid][id][ClothingScale][2] = fScaleZ;

        new query[354];
        mysql_format(m_Handle, query, sizeof(query), "UPDATE player_clothing SET pos_x = %f, pos_y = %f, pos_z = %f, rot_x = %f, rot_y = %f, rot_z = %f WHERE id = %i", fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, ClothingData[playerid][id][ClothingID]);
        mysql_tquery(m_Handle, query);

        mysql_format(m_Handle, query, sizeof(query), "UPDATE player_clothing SET scale_x = %f, scale_y = %f, scale_z = %f WHERE id = %i", fScaleX, fScaleY, fScaleZ, ClothingData[playerid][id][ClothingID]);
        mysql_tquery(m_Handle, query);

        SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: Aksesuarýný baþarýyla düzenledin!");
        PlayerData[playerid][pEditingClothing] = false;
        return 1;
    }

    if(EditingDisplay[playerid])
    {
        new weaponid = EditingDisplay[playerid];

        if (response)
        {
            new enum_index = weaponid - 22;
            WeaponSettings[playerid][enum_index][WeaponPos][0] = fOffsetX;
            WeaponSettings[playerid][enum_index][WeaponPos][1] = fOffsetY;
            WeaponSettings[playerid][enum_index][WeaponPos][2] = fOffsetZ;
            WeaponSettings[playerid][enum_index][WeaponPos][3] = fRotX;
            WeaponSettings[playerid][enum_index][WeaponPos][4] = fRotY;
            WeaponSettings[playerid][enum_index][WeaponPos][5] = fRotZ;
            RemovePlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid));
            SetPlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid), ReturnWeaponsModel(weaponid), WeaponSettings[playerid][enum_index][WeaponBone], fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, 1.0, 1.0, 1.0);

            new
                search_query[356];

            mysql_format(m_Handle, search_query, sizeof(search_query), "SELECT id FROM weapon_attachments WHERE WeaponID = %d AND playerdbid = %d", weaponid, PlayerData[playerid][pSQLID]);
            mysql_tquery(m_Handle, search_query, "CheckWeaponAttachements", "id", playerid, weaponid);
            SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}%s silahýnýn pozisyonunu güncelledin.", ReturnWeaponName(weaponid));
        }

        EditingDisplay[playerid] = 0;
    }
    return 1;
}

public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
    switch(EditingObject[playerid])
    {
        case 1: // Gate Pozisyonu
        {
            switch(response)
            {
                case EDIT_RESPONSE_CANCEL:
                {
                    new id = EditingID[playerid];
                    SetDynamicObjectPos(GateData[id][GateObject], GateData[id][GatePos][0], GateData[id][GatePos][1], GateData[id][GatePos][2]);
                    SetDynamicObjectRot(GateData[id][GateObject], GateData[id][GatePos][3], GateData[id][GatePos][4], GateData[id][GatePos][5]);
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                }
                case EDIT_RESPONSE_FINAL:
                {
                    new id = EditingID[playerid];
                    GateData[id][GatePos][0] = x, GateData[id][GatePos][1] = y, GateData[id][GatePos][2] = z;
                    GateData[id][GatePos][3] = rx, GateData[id][GatePos][4] = ry, GateData[id][GatePos][5] = rz;
                    SetDynamicObjectPos(GateData[id][GateObject], x, y, z);
                    SetDynamicObjectRot(GateData[id][GateObject], rx, ry, rz);
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                    Gate_Refresh(id);
                    Gate_Save(id);
                }
            }
        }
        case 2: // Gate Açýlýþ Pozisyonu
        {
            switch(response)
            {
                case EDIT_RESPONSE_CANCEL:
                {
                    new id = EditingID[playerid];
                    SetDynamicObjectPos(GateData[id][GateObject], GateData[id][GateMovePos][0], GateData[id][GateMovePos][1], GateData[id][GateMovePos][2]);
                    SetDynamicObjectRot(GateData[id][GateObject], GateData[id][GateMovePos][3], GateData[id][GateMovePos][4], GateData[id][GateMovePos][5]);
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                }
                case EDIT_RESPONSE_FINAL:
                {
                    new id = EditingID[playerid];
                    GateData[id][GateMovePos][0] = x, GateData[id][GateMovePos][1] = y, GateData[id][GateMovePos][2] = z;
                    GateData[id][GateMovePos][3] = rx, GateData[id][GateMovePos][4] = ry, GateData[id][GateMovePos][5] = rz;
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                    Gate_Refresh(id);
                    Gate_Save(id);
                }
            }
        }
        case 3: // CCTV Pozisyonu
        {
            switch(response)
            {
                case EDIT_RESPONSE_CANCEL:
                {
                    new id = EditingID[playerid];
                    SetDynamicObjectPos(CameraData[id][CameraObject], CameraData[id][CameraLocation][0], CameraData[id][CameraLocation][1], CameraData[id][CameraLocation][2]);
                    SetDynamicObjectRot(CameraData[id][CameraObject], CameraData[id][CameraLocation][3], CameraData[id][CameraLocation][4], CameraData[id][CameraLocation][5]);
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                }
                case EDIT_RESPONSE_FINAL:
                {
                    new id = EditingID[playerid];
                    CameraData[id][CameraLocation][0] = x, CameraData[id][CameraLocation][1] = y, CameraData[id][CameraLocation][2] = z;
                    CameraData[id][CameraLocation][3] = rx, CameraData[id][CameraLocation][4] = ry, CameraData[id][CameraLocation][5] = rz;
                    SetDynamicObjectPos(CameraData[id][CameraObject], x, y, z);
                    SetDynamicObjectRot(CameraData[id][CameraObject], rx, ry, rz);
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                    Camera_Refresh(id);
                    Camera_Save(id);
                }
            }
        }

        case 4: // Chopshop Pozisyonu
        {
            switch(response)
            {
                case EDIT_RESPONSE_CANCEL:
                {
                    new id = EditingID[playerid];
                    SetDynamicObjectPos(ChopshopData[id][chopshop_object][0], ChopshopData[id][chopshop_pos][0], ChopshopData[id][chopshop_pos][1], ChopshopData[id][chopshop_pos][2]);
                    SetDynamicObjectRot(ChopshopData[id][chopshop_object][0], ChopshopData[id][chopshop_pos][3], ChopshopData[id][chopshop_pos][4], ChopshopData[id][chopshop_pos][5]);

                    SendClientMessage(playerid, COLOR_GOLD, "SERVER: Chopshop'u düzenlemekten vazgeçtiniz.");
                    LogAdminAction(playerid, sprintf("%i numaralý Chopshop'un pozisyonunu güncellemekten vazgeçti.", id));
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                }
                case EDIT_RESPONSE_FINAL:
                {
                    new id = EditingID[playerid];

                    ChopshopData[id][chopshop_pos][0] = x, ChopshopData[id][chopshop_pos][1] = y, ChopshopData[id][chopshop_pos][2] = z;
                    ChopshopData[id][chopshop_pos][3] = rx, ChopshopData[id][chopshop_pos][4] = ry, ChopshopData[id][chopshop_pos][5] = rz;
                    SetDynamicObjectPos(ChopshopData[id][chopshop_object][0], x, y, z);
                    SetDynamicObjectRot(ChopshopData[id][chopshop_object][0], rx, ry, rz);

                    Chopshop_Save(id);
                    Chopshop_Refresh(id);

                    SendClientMessage(playerid, COLOR_GOLD, "SERVER: Chopshop'u baþarýyla düzenlendiniz.");
                    LogAdminAction(playerid, sprintf("%i numaralý Chopshop'un pozisyonunu güncelledi.", id));
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                }
            }
        }
        /*case 5: // Poker Masasý PokerData[id][pokerObject]
        {
        }*/
        case 6: // PD Engel
        {
            switch(response)
            {
                case EDIT_RESPONSE_CANCEL:
                {
                    new id = EditingID[playerid];
                    SetDynamicObjectPos(RoadblockData[id][RoadblockObject], RoadblockData[id][RoadblockPos][0], RoadblockData[id][RoadblockPos][1], RoadblockData[id][RoadblockPos][2]);
                    SetDynamicObjectRot(RoadblockData[id][RoadblockObject], RoadblockData[id][RoadblockPos][3], RoadblockData[id][RoadblockPos][4], RoadblockData[id][RoadblockPos][5]);

                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                    SendServerMessage(playerid, "Engel kaldýrýldý.");
                }
                case EDIT_RESPONSE_FINAL:
                {
                    new id = EditingID[playerid];
                    RoadblockData[id][RoadblockPos][0] = x, RoadblockData[id][RoadblockPos][1] = y, RoadblockData[id][RoadblockPos][2] = z;
                    RoadblockData[id][RoadblockPos][3] = rx, RoadblockData[id][RoadblockPos][4] = ry, RoadblockData[id][RoadblockPos][5] = rz;
                    SetDynamicObjectPos(RoadblockData[id][RoadblockObject], x, y, z);
                    SetDynamicObjectRot(RoadblockData[id][RoadblockObject], rx, ry, rz);
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                    Roadblock_Refresh(id);
                }
            }
        }
        case 7: // Bagaja Silah Yerleþtirme
        {
            new
                vehicleid = GetPVarInt(playerid, "getVehicleID"),
                slot = GetPVarInt(playerid, "getSlot"),
                Float:ofx, Float:ofy,
                Float:ofz, Float:ofaz,
                Float:finalx, Float:finaly,
                Float:px, Float:py, Float:pz, Float:roz,
                weap_query[198];

            switch(response)
            {
                case EDIT_RESPONSE_CANCEL:
                {
                    AttachDynamicObjectToVehicle(vehicle_weap_data[vehicleid][slot][temp_object], vehicleid, 0, 0, 0, 0, 0, 0);
                    SendClientMessage(playerid, COLOR_ADM, "BÝLGÝ: Silah objen araç sýnýrlarý dýþýna çýkmýþtý, eski pozisyonuna çevrildi.");
                    for(new i = 0; i < 6; i ++) vehicle_weap_data[vehicleid][slot][wep_offset][i] = 0.0;
                    mysql_format(m_Handle, weap_query, sizeof(weap_query), "UPDATE vehicle_weapons SET offsetX = 0.0, offsetY = 0.0, offsetZ = 0.0, rotX = 0.0, rotY = 0.0, rotZ = 0.0 WHERE id = %i", vehicle_weap_data[vehicleid][slot][data_id]);
                    mysql_tquery(m_Handle, weap_query);
                    DeletePVar(playerid, "getVehicleID");
                    DeletePVar(playerid, "getSlot");
                    EditingID[playerid] = 0;
                    return 1;
                }
                case EDIT_RESPONSE_FINAL:
                {
                    GetVehiclePos(vehicleid, px, py, pz);
                    GetVehicleZAngle(vehicleid, roz);

                    ofx = x-px; ofy = y-py;
                    ofz = z-pz; ofaz = rz-roz;

                    finalx = ofx*floatcos(roz, degrees)+ofy*floatsin(roz, degrees);
                    finaly = -ofx*floatsin(roz, degrees)+ofy*floatcos(roz, degrees);
                    AttachDynamicObjectToVehicle(vehicle_weap_data[vehicleid][slot][temp_object], vehicleid, finalx, finaly, ofz, rx, ry, ofaz);
                    mysql_format(m_Handle, weap_query, sizeof(weap_query), "UPDATE vehicle_weapons SET offsetX = %f, offsetY = %f, offsetZ = %f, rotX = %f, rotY = %f, rotZ = %f WHERE id = %i", finalx, finaly, ofz, rx, ry, ofaz, vehicle_weap_data[vehicleid][slot][data_id]);
                    mysql_tquery(m_Handle, weap_query);

                    vehicle_weap_data[vehicleid][slot][wep_offset][0] = finalx;
                    vehicle_weap_data[vehicleid][slot][wep_offset][1] = finaly;
                    vehicle_weap_data[vehicleid][slot][wep_offset][2] = ofz;
                    vehicle_weap_data[vehicleid][slot][wep_offset][3] = rx;
                    vehicle_weap_data[vehicleid][slot][wep_offset][4] = ry;
                    vehicle_weap_data[vehicleid][slot][wep_offset][5] = ofaz;

                    DeletePVar(playerid, "getVehicleID");
                    DeletePVar(playerid, "getSlot");
                    EditingID[playerid] = 0;
                    return 1;
                }
            }
        }
        case 8: // Ateþ Objesi
        {
            switch(response)
            {
                case EDIT_RESPONSE_CANCEL:
                {
                    new id = EditingID[playerid];
                    SetDynamicObjectPos(FireData[id][fire_object], FireData[id][fire_pos][0], FireData[id][fire_pos][1], FireData[id][fire_pos][2]);
                    SetDynamicObjectRot(FireData[id][fire_object], FireData[id][fire_pos][3], FireData[id][fire_pos][4], FireData[id][fire_pos][5]);
                    FireData[id][f_is_editing] = false;

                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                }
                case EDIT_RESPONSE_FINAL:
                {
                    new id = EditingID[playerid];
                    FireData[id][fire_pos][0] = x, FireData[id][fire_pos][1] = y, FireData[id][fire_pos][2] = z;
                    FireData[id][fire_pos][3] = rx, FireData[id][fire_pos][4] = ry, FireData[id][fire_pos][5] = rz;
                    SetDynamicObjectPos(FireData[id][fire_object], x, y, z);
                    SetDynamicObjectRot(FireData[id][fire_object], rx, ry, rz);
                    FireData[id][f_is_editing] = false;
                    Fire_Refresh(id);

                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                }
            }
        }
        case 9: // ATM Objesi
        {
            switch(response)
            {
                case EDIT_RESPONSE_CANCEL:
                {
                    new id = EditingID[playerid];
                    SetDynamicObjectPos(ATMData[id][AtmObject], ATMData[id][AtmPos][0], ATMData[id][AtmPos][1], ATMData[id][AtmPos][2]);
                    SetDynamicObjectRot(ATMData[id][AtmObject], ATMData[id][AtmPos][3], ATMData[id][AtmPos][4], ATMData[id][AtmPos][5]);
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                }
                case EDIT_RESPONSE_FINAL:
                {
                    new id = EditingID[playerid];
                    ATMData[id][AtmPos][0] = x, ATMData[id][AtmPos][1] = y, ATMData[id][AtmPos][2] = z;
                    ATMData[id][AtmPos][3] = rx, ATMData[id][AtmPos][4] = ry, ATMData[id][AtmPos][5] = rz;
                    SetDynamicObjectPos(ATMData[id][AtmObject], x, y, z);
                    SetDynamicObjectRot(ATMData[id][AtmObject], rx, ry, rz);
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                    ATM_Refresh(id);
                    ATM_Save(id);
                }
            }
        }
        case 10: // Kalýcý Sunucu Objeleri
        {
            switch(response)
            {
                case EDIT_RESPONSE_CANCEL:
                {
                    new id = EditingID[playerid];
                    SetDynamicObjectPos(ObjectData[id][ObjectHolder], ObjectData[id][ObjectPos][0], ObjectData[id][ObjectPos][1], ObjectData[id][ObjectPos][2]);
                    SetDynamicObjectRot(ObjectData[id][ObjectHolder], ObjectData[id][ObjectPos][3], ObjectData[id][ObjectPos][4], ObjectData[id][ObjectPos][5]);
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                }
                case EDIT_RESPONSE_FINAL:
                {
                    new id = EditingID[playerid];
                    ObjectData[id][ObjectPos][0] = x, ObjectData[id][ObjectPos][1] = y, ObjectData[id][ObjectPos][2] = z;
                    ObjectData[id][ObjectPos][3] = rx, ObjectData[id][ObjectPos][4] = ry, ObjectData[id][ObjectPos][5] = rz;
                    SetDynamicObjectPos(ObjectData[id][ObjectHolder], x, y, z);
                    SetDynamicObjectRot(ObjectData[id][ObjectHolder], rx, ry, rz);
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                    Object_Refresh(id);
                    Object_Save(id);
                }
            }
        }
        case 11: // Graffiti Noktalarý
        {
            switch(response)
            {
                case EDIT_RESPONSE_CANCEL:
                {
                    new id = EditingID[playerid];
                    SetDynamicObjectPos(SprayData[id][SprayObject], SprayData[id][SprayLocation][0], SprayData[id][SprayLocation][1], SprayData[id][SprayLocation][2]);
                    SetDynamicObjectRot(SprayData[id][SprayObject], SprayData[id][SprayLocation][3], SprayData[id][SprayLocation][4], SprayData[id][SprayLocation][5]);
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                }
                case EDIT_RESPONSE_FINAL:
                {
                    new id = EditingID[playerid];
                    SprayData[id][SprayLocation][0] = x, SprayData[id][SprayLocation][1] = y, SprayData[id][SprayLocation][2] = z;
                    SprayData[id][SprayLocation][3] = rx, SprayData[id][SprayLocation][4] = ry, SprayData[id][SprayLocation][5] = rz;
                    SetDynamicObjectPos(SprayData[id][SprayObject], x, y, z);
                    SetDynamicObjectRot(SprayData[id][SprayObject], rx, ry, rz);
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                    Spray_Refresh(id);
                    Spray_Save(id);
                }
            }
        }
        case 12: // Billboard Noktalarý
        {
            switch(response)
            {
                case EDIT_RESPONSE_CANCEL:
                {
                    new id = EditingID[playerid];
                    SetDynamicObjectPos(BillboardData[id][BillboardObject], BillboardData[id][BillboardLocation][0], BillboardData[id][BillboardLocation][1], BillboardData[id][BillboardLocation][2]);
                    SetDynamicObjectRot(BillboardData[id][BillboardObject], BillboardData[id][BillboardLocation][3], BillboardData[id][BillboardLocation][4], BillboardData[id][BillboardLocation][5]);
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                }
                case EDIT_RESPONSE_FINAL:
                {
                    new id = EditingID[playerid];
                    BillboardData[id][BillboardLocation][0] = x, BillboardData[id][BillboardLocation][1] = y, BillboardData[id][BillboardLocation][2] = z;
                    BillboardData[id][BillboardLocation][3] = rx, BillboardData[id][BillboardLocation][4] = ry, BillboardData[id][BillboardLocation][5] = rz;
                    SetDynamicObjectPos(BillboardData[id][BillboardObject], x, y, z);
                    SetDynamicObjectRot(BillboardData[id][BillboardObject], rx, ry, rz);
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                    Billboard_Refresh(id);
                    Billboard_Save(id);
                }
            }
        }
        /*case 13: // Dedektör Noktalarý
        {
        }*/
        case 14: // SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: /istasyon yazarak radyo kanalýný deðiþtirebilirsin.");
        {
            switch(response)
            {
                case EDIT_RESPONSE_CANCEL:
                {
                    new id = EditingID[playerid];
                    SetDynamicObjectPos(BoomboxData[id][BoomboxObject], BoomboxData[id][BoomboxLocation][0], BoomboxData[id][BoomboxLocation][1], BoomboxData[id][BoomboxLocation][2]);
                    SetDynamicObjectRot(BoomboxData[id][BoomboxObject], BoomboxData[id][BoomboxLocation][3], BoomboxData[id][BoomboxLocation][4], BoomboxData[id][BoomboxLocation][5]);
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                }
                case EDIT_RESPONSE_FINAL:
                {
                    new id = EditingID[playerid];

                    if(GetDistanceBetweenPoints(x, y, z, BoomboxData[id][BoomboxLocation][0], BoomboxData[id][BoomboxLocation][1], BoomboxData[id][BoomboxLocation][2]) > 5.0)
                    {
                        SetDynamicObjectPos(BoomboxData[id][BoomboxObject], BoomboxData[id][BoomboxLocation][0], BoomboxData[id][BoomboxLocation][1], BoomboxData[id][BoomboxLocation][2]);
                        SetDynamicObjectRot(BoomboxData[id][BoomboxObject], BoomboxData[id][BoomboxLocation][3], BoomboxData[id][BoomboxLocation][4], BoomboxData[id][BoomboxLocation][5]);
                        EditingObject[playerid] = 0;
                        EditingID[playerid] = 0;
                        return 1;
                    }

                    BoomboxData[id][BoomboxLocation][0] = x, BoomboxData[id][BoomboxLocation][1] = y, BoomboxData[id][BoomboxLocation][2] = z;
                    BoomboxData[id][BoomboxLocation][3] = rx, BoomboxData[id][BoomboxLocation][4] = ry, BoomboxData[id][BoomboxLocation][5] = rz;
                    SetDynamicObjectPos(BoomboxData[id][BoomboxObject], x, y, z);
                    SetDynamicObjectRot(BoomboxData[id][BoomboxObject], rx, ry, rz);
                    Boombox_Refresh(id);

                    SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: /istasyon yazarak radyo kanalýný deðiþtirebilirsin.");
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                }
            }
        }
        case 15: // Yemek Menüsü
        {
            switch(response)
            {
                case EDIT_RESPONSE_CANCEL:
                {
                    new id = EditingID[playerid]; Meal_Drop(id);
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                }
                case EDIT_RESPONSE_FINAL:
                {
                    new id = EditingID[playerid];

                    if(GetDistanceBetweenPoints(x, y, z, MealData[id][MealPos][0], MealData[id][MealPos][1], MealData[id][MealPos][2]) > 7.0)
                    {
                        SetDynamicObjectPos(MealData[id][MealObjectID], MealData[id][MealPos][0], MealData[id][MealPos][1], MealData[id][MealPos][2]);
                        MealData[id][MealEditing] = false;
                        EditingObject[playerid] = 0;
                        EditingID[playerid] = 0;
                        return 1;
                    }

                    SetDynamicObjectPos(MealData[id][MealObjectID], x, y, z);
                    SetDynamicObjectRot(MealData[id][MealObjectID], rx, ry, rz);
                    GetDynamicObjectPos(MealData[id][MealObjectID], MealData[id][MealPos][0], MealData[id][MealPos][1], MealData[id][MealPos][2]);
                    MealData[id][MealEditing] = false;
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                }
            }
        }
        // case 16: boþa düþtü
        case 17: // Giþe Pozisyonu
        {
            switch(response)
            {
                case EDIT_RESPONSE_CANCEL:
                {
                    new id = EditingID[playerid];
                    SetDynamicObjectPos(TollData[id][TollObject], TollData[id][TollPos][0], TollData[id][TollPos][1], TollData[id][TollPos][2]);
                    SetDynamicObjectRot(TollData[id][TollObject], TollData[id][TollPos][3], TollData[id][TollPos][4], TollData[id][TollPos][5]);
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                }
                case EDIT_RESPONSE_FINAL:
                {
                    new id = EditingID[playerid];
                    TollData[id][TollPos][0] = x, TollData[id][TollPos][1] = y, TollData[id][TollPos][2] = z;
                    TollData[id][TollPos][3] = rx, TollData[id][TollPos][4] = ry, TollData[id][TollPos][5] = rz;
                    SetDynamicObjectPos(TollData[id][TollObject], x, y, z);
                    SetDynamicObjectRot(TollData[id][TollObject], rx, ry, rz);
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                    Toll_Refresh(id);
                    Toll_Save(id);
                }
            }
        }
        case 18: // Giþe Açýlýþ Pozisyonu
        {
            switch(response)
            {
                case EDIT_RESPONSE_CANCEL:
                {
                    new id = EditingID[playerid];
                    SetDynamicObjectPos(TollData[id][TollObject], TollData[id][TollMovePos][0], TollData[id][TollMovePos][1], TollData[id][TollMovePos][2]);
                    SetDynamicObjectRot(TollData[id][TollObject], TollData[id][TollMovePos][3], TollData[id][TollMovePos][4], TollData[id][TollMovePos][5]);
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                }
                case EDIT_RESPONSE_FINAL:
                {
                    new id = EditingID[playerid];
                    TollData[id][TollMovePos][0] = x, TollData[id][TollMovePos][1] = y, TollData[id][TollMovePos][2] = z;
                    TollData[id][TollMovePos][3] = rx, TollData[id][TollMovePos][4] = ry, TollData[id][TollMovePos][5] = rz;
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                    Toll_Refresh(id);
                    Toll_Save(id);
                }
            }
        }
        case 19: // Ev XMR Düzenleme
        {
            switch(response)
            {
                case EDIT_RESPONSE_CANCEL:
                {
                    new id = EditingID[playerid];
                    SetDynamicObjectPos(PropertyData[id][PropertyXMRObject], PropertyData[id][PropertyXMR][0], PropertyData[id][PropertyXMR][1], PropertyData[id][PropertyXMR][2]);
                    SetDynamicObjectRot(PropertyData[id][PropertyXMRObject], PropertyData[id][PropertyXMR][3], PropertyData[id][PropertyXMR][4], PropertyData[id][PropertyXMR][5]);
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                }
                case EDIT_RESPONSE_FINAL:
                {
                    new id = EditingID[playerid];

                    if(GetDistanceBetweenPoints(x, y, z, PropertyData[id][PropertyXMR][0], PropertyData[id][PropertyXMR][1], PropertyData[id][PropertyXMR][2]) > 7.0)
                    {
                        SetDynamicObjectPos(PropertyData[id][PropertyXMRObject], PropertyData[id][PropertyXMR][0], PropertyData[id][PropertyXMR][1], PropertyData[id][PropertyXMR][2]);
                        SetDynamicObjectRot(PropertyData[id][PropertyXMRObject], PropertyData[id][PropertyXMR][3], PropertyData[id][PropertyXMR][4], PropertyData[id][PropertyXMR][5]);
                        EditingObject[playerid] = 0;
                        EditingID[playerid] = 0;
                        return 1;
                    }

                    PropertyData[id][PropertyXMR][0] = x, PropertyData[id][PropertyXMR][1] = y, PropertyData[id][PropertyXMR][2] = z;
                    PropertyData[id][PropertyXMR][3] = rx, PropertyData[id][PropertyXMR][4] = ry, PropertyData[id][PropertyXMR][5] = rz;
                    SetDynamicObjectPos(PropertyData[id][PropertyXMRObject], x, y, z);
                    SetDynamicObjectRot(PropertyData[id][PropertyXMRObject], rx, ry, rz);
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                }
            }
        }
        case 20: // Ev XMR Satýnal
        {
            switch(response)
            {
                case EDIT_RESPONSE_CANCEL:
                {
                    new id = EditingID[playerid];
                    DestroyDynamicObject(PropertyData[id][PropertyXMRObject]);
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                }
                case EDIT_RESPONSE_FINAL:
                {
                    new id = EditingID[playerid];

                    if(GetDistanceBetweenPoints(x, y, z, PropertyData[id][PropertyXMR][0], PropertyData[id][PropertyXMR][1], PropertyData[id][PropertyXMR][2]) > 7.0)
                    {
                        SetDynamicObjectPos(PropertyData[id][PropertyXMRObject], PropertyData[id][PropertyXMR][0], PropertyData[id][PropertyXMR][1], PropertyData[id][PropertyXMR][2]);
                        SetDynamicObjectRot(PropertyData[id][PropertyXMRObject], PropertyData[id][PropertyXMR][3], PropertyData[id][PropertyXMR][4], PropertyData[id][PropertyXMR][5]);
                        SendClientMessage(playerid, COLOR_GRAD2, "SERVER: Evine XM radyo satýn aldýn! /istasyon");
                        PropertyData[id][PropertyHasXMR] = true;
                        GiveMoney(playerid, -5000);
                        EditingObject[playerid] = 0;
                        EditingID[playerid] = 0;
                        return 1;
                    }

                    PropertyData[id][PropertyXMR][0] = x, PropertyData[id][PropertyXMR][1] = y, PropertyData[id][PropertyXMR][2] = z;
                    PropertyData[id][PropertyXMR][3] = rx, PropertyData[id][PropertyXMR][4] = ry, PropertyData[id][PropertyXMR][5] = rz;
                    SetDynamicObjectPos(PropertyData[id][PropertyXMRObject], x, y, z);
                    SetDynamicObjectRot(PropertyData[id][PropertyXMRObject], rx, ry, rz);
                    SendClientMessage(playerid, COLOR_GRAD2, "SERVER: Evine XM radyo satýn aldýn! /istasyon");
                    PropertyData[id][PropertyHasXMR] = true;
                    GiveMoney(playerid, -5000);
                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                }
            }
        }
        case 21: // Mobilya Satýnal
        {
            switch(response)
            {
                case EDIT_RESPONSE_CANCEL:
                {
                    new data[e_furniture], query[64], objid = GetPVarInt(playerid, "chose_slot");
                    Furniture_SubCategoryAlt(playerid, GetPVarInt(playerid, "furniture_subcategory"));

                    Streamer_GetArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data);
                    GiveMoney(playerid, data[furniturePrice]); DestroyDynamicObject(objid);

                    mysql_format(m_Handle, query, sizeof(query), "DELETE FROM furnitures WHERE id = %d", data[SQLID]);
                    mysql_tquery(m_Handle, query);

                    //Streamer_RemoveArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data[SQLID]);

                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                }
                case EDIT_RESPONSE_FINAL:
                {
                    new data[e_furniture], objid = GetPVarInt(playerid, "chose_slot");
                    Streamer_GetArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data);

                    data[furnitureX] = x, data[furnitureY] = y, data[furnitureZ] = z;
                    data[furnitureRX] = rx, data[furnitureRY] = ry, data[furnitureRZ] = rz;
                    SetDynamicObjectPos(objid, data[furnitureX], data[furnitureY], data[furnitureZ]);
                    SetDynamicObjectRot(objid, data[furnitureRX], data[furnitureRY], data[furnitureRZ]);

                    Streamer_SetArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data);

                    new query[256];
                    mysql_format(m_Handle, query, sizeof(query), "UPDATE furnitures SET FurnitureX=%f, FurnitureY=%f, FurnitureZ=%f, FurnitureRX=%f, FurnitureRY=%f, FurnitureRZ=%f WHERE ID=%d", data[furnitureX], data[furnitureY], data[furnitureZ], data[furnitureRX], data[furnitureRY], data[furnitureRZ], data[SQLID]);
                    mysql_tquery(m_Handle, query);

                    SendClientMessageEx(playerid, COLOR_WHITE, "%s adlý mobilyayý satýn aldýn. ({FFFF00}-$%s{FFFFFF})", data[furnitureName], MoneyFormat(data[furniturePrice]));

                    EditingObject[playerid] = 0;
                    EditingID[playerid] = 0;
                }
            }
        }
        case 22: // Mobilya Düzenle
        {
            switch(response)
            {
                case EDIT_RESPONSE_CANCEL:
                {
                    new data[e_furniture], objid = GetPVarInt(playerid, "chose_slot");
                    Streamer_GetArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data);
                    if(Streamer_IsInArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data[TempObjectID]))
                    {
                        SetDynamicObjectPos(objid, data[furnitureX], data[furnitureY], data[furnitureZ]);
                        SetDynamicObjectRot(objid, data[furnitureRX], data[furnitureRY], data[furnitureRZ]);
                        Furniture_Edit(playerid);
                        EditingObject[playerid] = 0;
                        EditingID[playerid] = 0;
                    }
                    else
                    {
                        EditingObject[playerid] = 0;
                        EditingID[playerid] = 0;
                        cmd_mobilya(playerid, "");
                    }
                }
                case EDIT_RESPONSE_FINAL:
                {
                    new data[e_furniture], objid = GetPVarInt(playerid, "chose_slot");
                    Streamer_GetArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data);
                    if(Streamer_IsInArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data[TempObjectID]))
                    {
                        data[furnitureX] = x, data[furnitureY] = y, data[furnitureZ] = z;
                        data[furnitureRX] = rx, data[furnitureRY] = ry, data[furnitureRZ] = rz;
                        SetDynamicObjectPos(objid, data[furnitureX], data[furnitureY], data[furnitureZ]);
                        SetDynamicObjectRot(objid, data[furnitureRX], data[furnitureRY], data[furnitureRZ]);
                        Streamer_SetArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data);

                        new query[256];
                        mysql_format(m_Handle, query, sizeof(query), "UPDATE furnitures SET FurnitureX=%f, FurnitureY=%f, FurnitureZ=%f, FurnitureRX=%f, FurnitureRY=%f, FurnitureRZ=%f WHERE id = %d", data[furnitureX], data[furnitureY], data[furnitureZ], data[furnitureRX], data[furnitureRY], data[furnitureRZ], data[SQLID]);
                        mysql_tquery(m_Handle, query);
                        Furniture_Edit(playerid);

                        EditingObject[playerid] = 0;
                        EditingID[playerid] = 0;
                    }
                    else
                    {
                        EditingObject[playerid] = 0;
                        EditingID[playerid] = 0;

                        cmd_mobilya(playerid, "");
                    }
                }
            }
        }
        case 23: // Ceset Düzenle
        {
          switch(response)
          {
              case EDIT_RESPONSE_CANCEL:
              {
                new cid = EditingID[playerid];
                CorpseData[cid][corpseBodybag] = false;
                DestroyDynamicObject(CorpseData[cid][corseBodybagObject]);
                CorpseData[cid][corpseActor] = CreateDynamicActor(CorpseData[cid][corpseSkin], CorpseData[cid][corpsePos][0], CorpseData[cid][corpsePos][1], CorpseData[cid][corpsePos][2], CorpseData[cid][corpsePos][3], true, 100.0, 0, 0, -1);
                ApplyDynamicActorAnimation(CorpseData[cid][corpseActor], "WUZI", "CS_Dead_Guy", 4.1, 0, 1, 1, 1, 0);
                EditingObject[playerid] = 0;
                EditingID[playerid] = 0;
              }
              case EDIT_RESPONSE_FINAL:
              {
                  new cid = EditingID[playerid];
                  if(IsValidDynamicObject(CorpseData[cid][corseBodybagObject])) DestroyDynamicObject(CorpseData[cid][corseBodybagObject]);
                  CorpseData[cid][corpsePos][0] = x, CorpseData[cid][corpsePos][1] = y, CorpseData[cid][corpsePos][2] = z+1.5;
                  CorpseData[cid][corpsePos][3] = rz;
                  CorpseData[cid][corpseBodyBagPos][0] = x, CorpseData[cid][corpseBodyBagPos][1] = y, CorpseData[cid][corpseBodyBagPos][2] = z;
                  CorpseData[cid][corpseBodyBagPos][3] = rx, CorpseData[cid][corpseBodyBagPos][4] = ry, CorpseData[cid][corpseBodyBagPos][5] = rz;
                  EditingObject[playerid] = 0;
                  EditingID[playerid] = 0;
                  PlayerData[playerid][pCorpseBag] = 0;
                  CorpseData[cid][corseBodybagObject] = CreateDynamicObject(19944, CorpseData[cid][corpseBodyBagPos][0], CorpseData[cid][corpseBodyBagPos][1], CorpseData[cid][corpseBodyBagPos][2], CorpseData[cid][corpseBodyBagPos][3], CorpseData[cid][corpseBodyBagPos][4], CorpseData[cid][corpseBodyBagPos][5], -1, -1, -1);
              }
          }
        }
    }

    Streamer_Update(playerid);
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    printf("[Baglanti] %s (DBID: %d) cikis yapti.", ReturnName(playerid, 1), PlayerData[playerid][pSQLID]);

    new
        string[128+11];

    if(pLoggedIn[playerid])
    {
        new id = Boombox_Placed(playerid);

        if(id != -1)
        {
            Boombox_Delete(id);
        }

        DeletePVar(playerid, "tedaviolSure");
        PlayerData[playerid][PmOFF] = false;
        SaveSQLInt(AccountData[playerid][mSQLID], "accounts", "adminlevel", PlayerData[playerid][pAdmin]);

        SaveSQLInt(AccountData[playerid][mSQLID], "accounts", "testerlevel", PlayerData[playerid][pTester]);

        g_MysqlRaceCheck[playerid]++;

        switch(reason)
        {
            case 0:
            {
                PlayerData[playerid][pCrashed] = 1;
                SaveSQLInt(PlayerData[playerid][pSQLID], "players", "Crashed", 1);

                format(string, sizeof(string), "** %s (Baðlantý koptu)", ReturnName(playerid, 1));
            }
            case 1: format(string, sizeof(string), "** %s (Çýkýþ yaptý)", ReturnName(playerid, 1));
            case 2: format(string, sizeof(string), "** %s (Atýldý)", ReturnName(playerid, 1));
        }

        new thr[129];
        mysql_format(m_Handle, thr, sizeof(thr), "UPDATE players SET DutySkin = %i, pCopDuty = %i, pSWATDuty = %i, Fishes = %i WHERE id = %i", PlayerData[playerid][pDutySkin], PlayerData[playerid][pLAWduty], PlayerData[playerid][pSWATduty], PlayerData[playerid][pFishWeight], PlayerData[playerid][pSQLID]);
        mysql_tquery(m_Handle, thr);

        if(GetPlayerState(playerid) != PLAYER_STATE_SPECTATING)
        {
            LocalChat(playerid, 20.0, string, COLOR_FADE1);
        }

        //DCC_SendChannelMessage(g_WelcomeChannelId, sprintf("*** %s sunucuya giris yapti.", ReturnName(playerid, 1)));

        if(reason == 1)
        {
            LogPlayerAction(playerid, "Oyundan çýkýþ yaptý. (/q)");
        }

        if(PlayerTutorialTimer[playerid])
        {
            KillTimer(PlayerTutorialTimer[playerid]);
        }

        if(PlayerData[playerid][pDrugUse] != -1)
        {
            KillTimer(PlayerData[playerid][pDrugTimer]);
            PlayerData[playerid][pDrugTimer] = -1;
        }

        if(PlayerData[playerid][pInsidePNS] != -1)
        {
            new pns_Id = PlayerData[playerid][pInsidePNS];
            SendPlayer(playerid, PNSData[pns_Id][PnsPos][0], PNSData[pns_Id][PnsPos][1], PNSData[pns_Id][PnsPos][2], PNSData[pns_Id][PnsPos][3], PNSData[pns_Id][EnterInteriorID], PNSData[pns_Id][EnterWorld]);
            PNSData[pns_Id][PnsOccupied] = false;
        }

        if(PlayerData[playerid][pInTuning]) Tuning_ExitDisplay(playerid);

        foreach(new i : Reports)
        {
            if(ReportData[i][ReportPlayer] == playerid)
            {
                ReportData[i][ReportPlayer] = INVALID_PLAYER_ID;
                Iter_SafeRemove(Reports, i, i);
            }
        }

        foreach(new i : Supports)
        {
            if(SupportData[i][SupportPlayer] == playerid)
            {
                SupportData[i][SupportPlayer] = INVALID_PLAYER_ID;
                Iter_SafeRemove(Supports, i, i);
            }
        }

        foreach(new i : Player)
        {
            if(PlayerData[i][pConvoID] == playerid)
            {
                SendClientMessageEx(i, COLOR_ACTION, "SERVER: Sohbet ettiðiniz %s isimli oyuncu sunucudan ayrýldý.", ReturnName(playerid, 1));
                PlayerData[i][pConvoID] = INVALID_PLAYER_ID;
            }

            if(PlayerData[i][pLiveOffer] == playerid)
            {
                SendClientMessageEx(i, COLOR_ACTION, "SERVER: Size canlý yayýn isteði gönderen %s isimli oyuncu sunucudan ayrýldý.", ReturnName(playerid, 1));
                PlayerData[i][pLiveOffer] = INVALID_PLAYER_ID;
            }

            if(PlayerData[i][pPhoneline] == playerid)
            {
                SendClientMessageEx(i, COLOR_ACTION, "SERVER: Konuþtuðunuz %s isimli oyuncu sunucudan ayrýldý.", ReturnName(playerid, 1));
                cmd_tkapat(i, "");
            }

            if(VehicleOfferBy[i] == playerid)
            {
                SendClientMessageEx(i, COLOR_ACTION, "SERVER: Size araç satmak isteyen %s isimli oyuncu sunucudan ayrýldý.", ReturnName(playerid));
                VehicleOfferBy[i] = INVALID_PLAYER_ID;
                VehicleDBIDOffered[i] = 0;
                VehiclePrice[i] = 0;
            }

            if(VehicleOfferedTo[i] == playerid)
            {
                SendClientMessageEx(i, COLOR_ACTION, "SERVER: Araç satmak istediðiniz %s isimli oyuncu sunucudan ayrýldý.", ReturnName(playerid));
                VehicleOfferedTo[i] = INVALID_PLAYER_ID;
                VehicleDBIDOffered[i] = 0;
                VehiclePrice[i] = 0;
            }
        }

        new gameId = Pkr_GetPlayerGame(playerid);
        if(gameId != INVALID_POKER_GAME_ID)
            Pkr_UnassignPlayerFromGame(playerid, gameId);

        if(PlayerData[playerid][pDrivingTest]) CancelDrivingTest(playerid);
        if(PlayerData[playerid][pTaxiDrivingTest]) CancelTaxiDrivingTest(playerid);

        if(InTaxiRide[playerid])
        {
            foreach(new i : Player) if(PlayerData[i][pSQLID] == TaxiDriver[playerid])
            {
                SendClientMessage(i, COLOR_YELLOW, "->  Taksindeki oyuncu çýkýþ yaptý. (kötüye kullandýðýný düþünüyorsan þikayet açabilirsin)");
            }

            EndTaxiFair(playerid);
        }

        if (HaveVME[playerid] != 0)
        {
            Delete3DTextLabel(VME[playerid]);
            KillTimer(TimerVME[playerid]);
            HaveVME[playerid] = 0;
        }

        if (_has_player_reviving[playerid] != 0)
        {
            new i = _has_player_reviver[playerid];

            KillTimer(playerHelpingTimer[playerid]);
            Delete3DTextLabel(playerHelpSign[i]);

            SendClientMessage(i, COLOR_DARKGREEN, "SERVER: Yardým eden kiþi oyundan çýktý.");

            _has_player_reviving[playerid] = 0;
            _has_player_reviver[playerid] = -1;
            _has_player_reviver[i] = -1;

            playerHelpCount[playerid] = 0;
            playerHelpingPlayer[playerid] = false;
        }

        if(GetPVarInt(playerid, "OnPlayerBuringCorpse") == 1)
        {
          SetPVarInt(playerid, "OnPlayerBuringCorpse", 0);
          CorpseData[GetPVarInt(playerid, "OnPlayerBuringCorpseID")][corpseBuring] = false;
          KillTimer(PlayerData[playerid][pCorpseBurialTimer]);
          TogglePlayerControllable(playerid, true);
        }

        if(IsValidVehicle(PlayerBreakInVehicle[playerid]))
        {
            new Float:cX, Float:cY, Float:cZ;
            new vehicleid = PlayerBreakInVehicle[playerid];
            GetVehiclePos(vehicleid, cX, cY, cZ);

            CarData[vehicleid][carPhysicalAttack] = false;
            CarData[vehicleid][carCooldown] = false;

            if(IsValidDynamic3DTextLabel(BreakInTextDraw[playerid]))
            {
                DestroyDynamic3DTextLabel(BreakInTextDraw[playerid]);
            }

            KillTimer(BreakInTDTimer[playerid]);
            PlayerBreakInVehicle[playerid] = INVALID_VEHICLE_ID;
            PlayerBreakingIn[playerid] = 0;
            BreakInError[playerid] = 0;
            ActiveLockTD[playerid] = 0;
        }

        if(CCTVID[playerid] != -1)
        {
            Camera_Quit(playerid);
        }

        if (PlayerData[playerid][pCarryTrash])
        {
            PlayerData[playerid][pCarryTrash] = false;
            //ApplyAnimation(playerid, "GRENADE", "WEAPON_throwu", 4.1, 0, 0, 0, 0, 0);
            //SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
            RemovePlayerAttachedObject(playerid, 7);
        }

        if(PlayerRefilling[playerid])
        {
            KillTimer(RefillTimer[playerid]);
            DestroyDynamic3DTextLabel(RefillTextdraw[playerid]);
        }

        if(IsValidDynamic3DTextLabel(vehicleTextdraw[playerid]))
        {
            DestroyDynamic3DTextLabel(vehicleTextdraw[playerid]);
        }

        if(IsValidDynamic3DTextLabel(BreakInTextDraw[playerid]))
        {
            DestroyDynamic3DTextLabel(BreakInTextDraw[playerid]);
            KillTimer(BreakInTDTimer[playerid]);
        }

        if(g_aVehicleSpawned[playerid] != INVALID_VEHICLE_ID)
        {
            if(IsValidVehicle(g_aVehicleSpawned[playerid]) && !CarData[g_aVehicleSpawned[playerid]][carID])
            {
                DestroyVehicle(g_aVehicleSpawned[playerid]);
            }

            if(!PlayerPurchasingVehicle[playerid]) ResetDealershipVars(playerid);
        }

        GetPlayerPos(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]);

        if(PlayerData[playerid][pLAWduty] || PlayerData[playerid][pSWATduty] && reason != 0)
            SetPlayerArmour(playerid, 0.0);

        if(PlayerData[playerid][pICJailed])
        {
            DestroyDynamic3DTextLabel(PlayerData[playerid][pICJail3D]);
            TotalJailees--;
        }

        if(PlayerData[playerid][pLegShot]) KillTimer(LegShotTimer[playerid]);

        if (Chopshopping[playerid] != 0)
        {
            KillTimer(ChopshopTimer[playerid]);
            Chopshopping[playerid] = 0;
        }

        KillTimer(phoneTimer[playerid]);
        KillTimer(MechanicCallTimer[playerid]);
        KillTimer(TaxiCallTimer[playerid]);

        if(PlayerData[playerid][pUnscrambling])
        {
            KillTimer(PlayerData[playerid][pUnscrambleTimer]);
        }

        Iter_Remove(SpectatePlayers, playerid);

        new prev = GetPreviousPlayer(playerid);
        if (prev == INVALID_PLAYER_ID) {
            foreach (new i : Player) {
                if (SpectateID[i] == playerid) {
                    StopSpectate(i);
                }
            }
        }
        else {
            foreach (new i : Player) {
                if (SpectateID[i] == playerid) {
                    StartSpectate(i, prev);
                }
            }
        }

        PlayerData[playerid][pLastTimeLength] = ((NetStats_GetConnectedTime(playerid) % (1000*60*60)) % (1000*60)) / 1000;
        PlayerData[playerid][pLastTime] = Time();
        Player_Save(playerid);

        Player_DefaultValues(playerid);
    }

    return 1;
}

public OnPlayerText(playerid, text[])
{
    new
        string[128];

    PlayerData[playerid][pLastChat] = gettime();
    LogPlayerAction(playerid, sprintf("%s yazdý: %s", ReturnName(playerid, 1), text));

    if(!pLoggedIn[playerid])
    {
        SendClientMessage(playerid, COLOR_ADM, "ERÝÞÝM REDDEDÝLDÝ: {FFFFFF}Yazý yazabilmek için ilk önce giriþ yapmalýsýn.");
        return 0;
    }

    if(PlayerData[playerid][pFirstLogin])
    {
        SendClientMessage(playerid, COLOR_ADM, "ERÝÞÝM REDDEDÝLDÝ: {FFFFFF}Tanýtýmý izlerken konuþamazsýn.");
        return 0;
    }

    if(SpectateID[playerid] != -1)
    {
        SendClientMessage(playerid, COLOR_ADM, "SERVER: {FFFFFF}Birini izlerken konuþamazsýn.");
        return 0;
    }

    if(GetPlayerTeam(playerid) != STATE_ALIVE)
    {
        SendClientMessage(playerid, COLOR_GREY, "...Bu durumdayken yazý yazamazsýn.");
        return 0;
    }

    if(PlayerData[playerid][pConvoID] != INVALID_PLAYER_ID)
    {
        cmd_pm(playerid, sprintf("%i %s", PlayerData[playerid][pConvoID], text));
        return 0;
    }

    if(PlayerData[playerid][pLiveBroadcast] != INVALID_PLAYER_ID)
    {
        foreach(new i : Player) if(PlayerData[i][pNewsStatus])
        {
            if(strlen(text) > 99)
            {
                SendClientMessageEx(i, 0x069907FF, "[San TV] %s: %.99s...", ReturnName(playerid, 0), text);
                SendClientMessageEx(i, 0x069907FF, "[San TV] %s: ... %s", ReturnName(playerid, 0), text[99]);
            }
            else SendClientMessageEx(i, 0x069907FF, "[San TV] %s: %s", ReturnName(playerid, 0), text);
        }
    }

    if(PlayerData[playerid][pPhoneline] != INVALID_PLAYER_ID && !PlayerData[playerid][pCalling])
    {
        new message[128+1]; // +1 for looping
        format(message, sizeof(message), text);
        new playerAntenna, receiverAntenna;
        new antennasLimit = MAX_ANTENNAS;
        new length = strlen(message);
        new position;

        receiverAntenna = GetNearestAntenna(PlayerData[playerid][pPhoneline]);
        playerAntenna = GetNearestAntenna(playerid);

        if(receiverAntenna == -1 || playerAntenna == -1)
        {
            cmd_tkapat(playerid, "");
            return 0;
        }

        if(receiverAntenna > antennasLimit || playerAntenna > antennasLimit) for(new j; j < random(6); j++)
        {
            if(j >= length) break;
            position = random(length);

            if(position + DOTS_ADD > length) position--;
            if(!position) position++;

            strdel(message, position, position + DOTS_ADD);
            strins(message, "...", position);
        }

        if(PlayerData[playerid][pPhoneline] == 911)
        {
            if(strlen(text) > 90)
            {
                format(string, sizeof(string), "%s (telefon): %.90s", ReturnName(playerid, 0), message);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);

                format(string, sizeof(string), "%s (telefon): %s", ReturnName(playerid, 0), message[90]);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);
            }
            else
            {
                format(string, sizeof(string), "%s (telefon): %s", ReturnName(playerid, 0), message);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);
            }

            switch(PlayerData[playerid][p911Steps])
            {
                case 0:
                {
                    if(strfind(message, "polis", true) != -1 || strfind(message, "PD", true) != -1 || strfind(message, "Hükümet", true) != -1)
                    {
                        SendClientMessage(playerid, COLOR_YELLOW, "911 Operatörü: LSPD hattýna yönlendiriyorum. Lütfen acil durumunuzu belirtin.");
                        PlayerData[playerid][p911Steps] = 1;
                    }
                    else if(strfind(message, "medikal", true) != -1 || strfind(message, "hastane", true) != -1 || strfind(message, "ambulans", true) != -1 || strfind(message, "itfaiye", true) != -1)
                    {
                        SendClientMessage(playerid, COLOR_YELLOW, "911 Operatörü: Ýtfaiye ve Medikal dairesi hattýna yönlendiriyorum. Lütfen acil durumunuzu belirtin.");
                        PlayerData[playerid][p911Steps] = 2;
                    }
                    else SendClientMessage(playerid, COLOR_YELLOW, "911 Operatörü: Ýhtiyaç duyduðunuz aciliyet servisi nedir? (Polis/Medikal/Ýtfaiye)");
                }
                case 1: // Police forward;
                {
                    format(PlayerData[playerid][p911Text], 128, "%s", message);
                    PlayerData[playerid][p911Steps] = 5;

                    SendClientMessage(playerid, COLOR_YELLOW, "911 Operatörü: Lokasyonunuz nedir?");
                }
                case 2: // Medic forward;
                {
                    format(PlayerData[playerid][p911Text], 128, "%s", message);
                    PlayerData[playerid][p911Steps] = 10;

                    SendClientMessage(playerid, COLOR_YELLOW, "911 Operatörü: Lokasyonunuz nedir?");
                }
                case 5: // Police;
                {
                    format(PlayerData[playerid][p911Location], 128, "%s", message);
                    SendClientMessage(playerid, COLOR_YELLOW, "911 Operatörü: LSPD birimleri belirtilen bölgeye gönderilmek üzere bilgilendirildi.");

                    Send911Message(playerid, 1);
                }
                case 10: // Medics;
                {
                    format(PlayerData[playerid][p911Location], 128, "%s", message);
                    SendClientMessage(playerid, COLOR_YELLOW, "911 Operatörü: LSFD birimleri belirtilen bölgeye gönderilmek üzere bilgilendirildi.");

                    Send911Message(playerid, 2);
                }
            }
        }
        else if(PlayerData[playerid][pPhoneline] == 788 && PlayerStolenCarPrompt[playerid] != 0)
        {
            if(strlen(text) > 90)
            {
                format(string, sizeof(string), "%s (telefon): %.90s", ReturnName(playerid, 0), message);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);

                format(string, sizeof(string), "%s (telefon): %s", ReturnName(playerid, 0), message[90]);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);
            }
            else
            {
                format(string, sizeof(string), "%s (telefon): %s", ReturnName(playerid, 0), message);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);
            }

            switch(PlayerStolenCarPrompt[playerid])
            {
                case 1:
                {
                    if(strfind(text, "evet", true) != -1 || strfind(text, "tabiki", true) != -1 || strfind(text, "mhm", true) != -1)
                    {
                        PlayerStolenCarPrompt[playerid] = 2;
                        SendClientMessage(playerid, COLOR_YELLOW, "788 Operatörü: Tamam! Size olan aracýn plakasý tam bir þekilde bize söyler misiniz?");
                    }
                    else if(strfind(text, "hayýr", true) != -1 || strfind(text, "istemiyorum", true) != -1 || strfind(text, "olumsuz", true) != -1)
                    {
                        PlayerStolenCarPrompt[playerid] = 10;
                        SendClientMessage(playerid, COLOR_YELLOW, "788 Operatörü: Tamam o zaman! Sizi 911 operatörüne transfer etmemi ister misiniz?");
                    }
                    else SendClientMessage(playerid, COLOR_YELLOW, "788 Operatörü: Dediðinizi anlamayamadým efendim, tekrar eder misiniz? (Evet/Hayýr)");
                }
                case 2: //"Yes" answer to prompt 1;
                {
                    format(PlayerStolenCarPlate[playerid], 32, "%s", text);
                    PlayerStolenCarPrompt[playerid] = 99;

                    SendClientMessage(playerid, COLOR_YELLOW, "788 Operatörü: Plakayý kontrol ediyorum, lütfen bekleyiniz.");

                    mysql_format(m_Handle, string, sizeof(string), "SELECT Plate, ModelID FROM vehicles WHERE Plate = '%e'", text);
                    mysql_tquery(m_Handle, string, "OnStolenCarPrompt", "i", playerid);
                }
                case 3: //Bad plate, end or try again:
                {
                    if(strfind(text, "evet", true) != -1 || strfind(text, "onay", true) != -1)
                    {
                        PlayerStolenCarPrompt[playerid] = 2;
                        SendClientMessage(playerid, COLOR_YELLOW, "788 Operatörü: Tamam! Az önce verdiðiniz plakayý tekrar söyler misiniz?");
                    }
                    else if(strfind(text, "hayýr", true) != -1 || strfind(text, "dur", true) != -1)
                    {
                        SendClientMessage(playerid, COLOR_YELLOW, "788 Operatörü: Görüþürüz!");
                        PlayerStolenCarPrompt[playerid] = 0;
                        cmd_tkapat(playerid, "");
                    }
                    else SendClientMessage(playerid, COLOR_YELLOW, "788 Operatörü: Dediðinizi anlamayamadým efendim, tekrar eder misiniz? (Evet/Hayýr)");
                }
                case 4:
                {
                    if(strfind(text, "evet", true) != -1 || strfind(text, "onay", true) != -1)
                    {
                        PlayerStolenCarPrompt[playerid] = 99;
                        SendClientMessage(playerid, COLOR_YELLOW, "788 Operatörü: Onayladýðýnýz için teþekkürler. Lütfen bekleyiniz!");

                        mysql_format(m_Handle, string, sizeof(string), "SELECT OwnerID FROM vehicles WHERE Plate = '%e'", PlayerStolenCarPlate[playerid]);
                        mysql_tquery(m_Handle, string, "OnStolenCarOwnedCheck", "i", playerid);
                    }
                    else if(strfind(text, "hayýr", true) != -1 || strfind(text, "onaylamýyorum", true) != -1)
                    {
                        SendClientMessage(playerid, COLOR_YELLOW, "788 Operatörü: Görüþürüz!");
                        PlayerStolenCarPrompt[playerid] = 0;
                        cmd_tkapat(playerid, "");
                    }
                    else SendClientMessage(playerid, COLOR_YELLOW, "788 Operatörü: Dediðinizi anlamayamadým efendim, onaylýyor musunuz? (Evet/Hayýr)");
                }
                case 10: //"No" answer to prompt 1;
                {
                    if(strfind(text, "evet", true) != -1 || strfind(text, "transfer", true) != -1 || strfind(text, "polis", true) != -1)
                    {
                        SendClientMessage(playerid, COLOR_YELLOW, "788 Operatörü: Sizi 911 operatörüne baðlýyorum, lütfen bekleyin.");
                        PlayerStolenCarPrompt[playerid] = 0;
                        PlayerData[playerid][pPhoneline] = 999;
                        PlayerData[playerid][pCalling] = 2;
                        PlayerPlaySound(playerid, 3600, 0.0, 0.0, 0.0);
                        PlayerData[playerid][p911CallTimer][0] = SetTimerEx("CallingEmergencyServices", 2000, false, "i", playerid);
                    }
                    else if(strfind(text, "hayýr", true) != -1 || strfind(text, "kapat", true) != -1 || strfind(text, "bitir", true) != -1)
                    {
                        SendClientMessage(playerid, COLOR_YELLOW, "788 Operatörü: Tamam! Lütfen araç bildirmeyeceðiniz sürece bu hattý meþgul etmeyin.");
                        PlayerStolenCarPrompt[playerid] = 0;
                        cmd_tkapat(playerid, "");
                    }
                    else SendClientMessage(playerid, COLOR_YELLOW, "788 Operatörü: Dediðinizi anlamayamadým efendim, transferi onaylýyor musunuz? (Evet/Hayýr)");
                }
                case 99: //Avoid spam for prompt 2;
                {
                    SendClientMessage(playerid, COLOR_YELLOW, "788 Operatörü: Lütfen bekleyiniz!");
                }
            }
        }
        else if(PlayerData[playerid][pPhoneline] == TAXI_NUMBER && !PlayerData[playerid][pCalling])
        {
            if(strlen(text) > 90)
            {
                format(string, sizeof(string), "%s (telefon): %.90s", ReturnName(playerid, 0), message);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);

                format(string, sizeof(string), "%s (telefon): %s", ReturnName(playerid, 0), message[90]);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);
            }
            else
            {
                format(string, sizeof(string), "%s (telefon): %s", ReturnName(playerid, 0), message);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);
            }

            SendClientMessage(playerid, COLOR_WHITE, "** /taksi kontrol komutuyla taksicinin tarifesini öðrenebilirsin. **");
            SendClientMessage(playerid, COLOR_YELLOW, "Taksi Operatörü (telefon): Anladým, sana en kýsa sürede birini göndereceðim.");
            format(TaxiText[playerid], 128, "%s", text);

            foreach(new i : Player)
            {
                if(StartedTaxiJob[i])
                {
                    SendClientMessage(i, COLOR_YELLOW, "|_______________Taksi Çaðrýsý_______________|");
                    SendClientMessageEx(i, COLOR_YELLOW, "Arayan: %i", ReturnPhoneNumber(playerid));
                    SendClientMessageEx(i, COLOR_YELLOW, "Gideceði Yer: %s", TaxiText[playerid]);
                    SendClientMessageEx(i, COLOR_YELLOW, "** Bu çaðrýyý kabul etmek için /taksi kabul %i yazýn. **", ReturnPhoneNumber(playerid));
                }
            }

            SetPVarInt(playerid, "NeedTaxi", 1);
            cmd_tkapat(playerid, "");
        }
        else if(PlayerData[playerid][pPhoneline] == MECHANIC_NUMBER && !PlayerData[playerid][pCalling])
        {
            if(strlen(text) > 90)
            {
                format(string, sizeof(string), "%s (telefon): %.90s", ReturnName(playerid, 0), message);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);

                format(string, sizeof(string), "%s (telefon): %s", ReturnName(playerid, 0), message[90]);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);
            }
            else
            {
                format(string, sizeof(string), "%s (telefon): %s", ReturnName(playerid, 0), message);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);
            }

            SendClientMessage(playerid, COLOR_YELLOW, "556 Operatörü: Tabiki! En iyi mekanik ustalarýmýz en kýsa sürede size ulaþacaklar!");

            foreach(new i : Player)
            {
                if(PlayerData[i][pJob] == MECHANIC_JOB || PlayerData[i][pSideJob] == MECHANIC_JOB)
                {
                    SendClientMessage(i, COLOR_DARKGREEN, "|_______________Mekanik Çaðrýsý_______________|");
                    SendClientMessageEx(i, COLOR_WHITE, "Arayan: %s, Telefon: [%i]", ReturnName(playerid, 0), ReturnPhoneNumber(playerid));
                    if(strlen(message) > 90)
                    {
                        SendClientMessageEx(i, COLOR_WHITE, "Açýklama: %.90s...", message);
                        SendClientMessageEx(i, COLOR_WHITE, "...%s", message[90]);
                    }
                    else SendClientMessageEx(i, COLOR_WHITE, "Açýklama: %s", message);
                }
            }

            cmd_tkapat(playerid, "");
        }
        else if(PlayerData[playerid][pPhoneline] == 1800 && !PlayerData[playerid][pCalling])
        {
            if(strlen(text) > 90)
            {
                format(string, sizeof(string), "%s (telefon): %.90s", ReturnName(playerid, 0), message);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);

                format(string, sizeof(string), "%s (telefon): %s", ReturnName(playerid, 0), message[90]);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);
            }
            else
            {
                format(string, sizeof(string), "%s (telefon): %s", ReturnName(playerid, 0), message);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);
            }

            if(Billboard_Available(playerid) == -1)
            {
                SendClientMessage(playerid, COLOR_YELLOW, "1-800-BLBRD (telefon): Þu anda çevrenizde kiralayabileceðin bir billboard bulunmuyor.");
                cmd_tkapat(playerid, "");
            }
            else if(PlayerData[playerid][pMoney] < 5000)
            {
                SendClientMessage(playerid, COLOR_YELLOW, "1-800-BLBRD (telefon): Ýþleme baþlayabilmek için en az $5,000 miktar paranýz olmalýdýr.");
                cmd_tkapat(playerid, "");
            }
            else if(strlen(text) > 40)
            {
                SendClientMessage(playerid, COLOR_YELLOW, "1-800-BLBRD (telefon): Reklam metniniz 40 karakteri geçmemelidir.");
                cmd_tkapat(playerid, "");
            }
            else
            {
                GiveMoney(playerid, -5000);
                Billboard_Publish(playerid, Billboard_Available(playerid), text);
                cmd_tkapat(playerid, "");
            }
        }
        else if(PlayerData[playerid][pPhoneline] == 991 && !PlayerData[playerid][pCalling] && GetPVarInt(playerid, "NonEmergencyCall") > 0)
        {
            if(strlen(text) > 90)
            {
                format(string, sizeof(string), "%s (telefon): %.90s", ReturnName(playerid, 0), message);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);

                format(string, sizeof(string), "%s (telefon): %s", ReturnName(playerid, 0), message[90]);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);
            }
            else
            {
                format(string, sizeof(string), "%s (telefon): %s", ReturnName(playerid, 0), message);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);
            }

            SendClientMessage(playerid, COLOR_YELLOW, "991 Operatörü: Tabiki! Yerel kolluk kuvvetlerine haber verdik.");
            cmd_tkapat(playerid, "");

            SendLawMessage(COLOR_NINER, "|____________ACÝLÝYETSÝZ ÇAÐRI____________|");

            new
                emertext[128];

            format(emertext, sizeof(emertext), "Arayan: %s, Telefon: %d", ReturnName(playerid, 0), ReturnPhoneNumber(playerid));
            SendLawMessage(COLOR_NINER, emertext);

            if(strlen(message) > 90)
            {
                format(emertext, 128, "Durum: %.90s", message);
                SendLawMessage(COLOR_NINER, emertext);

                format(emertext, 128, "Durum: ...%s", message[90]);
                SendLawMessage(COLOR_NINER, emertext);
            }
            else
            {
                format(emertext, 128, "Durum: %s", message);
                SendLawMessage(COLOR_NINER, emertext);
            }
        }
        else
        {
            new
                playerb = PlayerData[playerid][pPhoneline];

            /*new sender[60] = "";
            for(new i = 1; i < MAX_PLAYER_CONTACTS; i++)
            {
                if(ContactsData[playerid][i][contactNumber] == ReturnPhoneNumber(playerb))
                {
                    format(sender, 60, "%s", ContactsData[playerid][i][contactName]);
                }
            }

            if(isnull(sender))
                format(sender, 60, "%d", ReturnPhoneNumber(playerb));*/

            if(strlen(text) > 99)
            {
                format (string, sizeof(string), "%s (telefon): %.99s...", ReturnName(playerid, 0), message);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);

                if(!PlayerData[playerb][pLoudspeaker]) SendClientMessage(playerb, COLOR_YELLOW, string);
                else LocalChat(playerb, 6.0, string, COLOR_FADE1);

                format (string, sizeof(string), "%s (telefon): ... %s", ReturnName(playerid, 0), message[99]);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);

                if(!PlayerData[playerb][pLoudspeaker]) SendClientMessage(playerb, COLOR_YELLOW, string);
                else LocalChat(playerb, 6.0, string, COLOR_FADE1);
            }
            else
            {
                format (string, sizeof(string), "%s (telefon): %s", ReturnName(playerid, 0), message);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);

                if(!PlayerData[playerb][pLoudspeaker]) SendClientMessage(playerb, COLOR_YELLOW, string);
                else LocalChat(playerb, 6.0, string, COLOR_FADE1);
            }
        }
    }
    else
    {

        if(PlayerData[playerid][pAutoLow] || (PlayerData[playerid][pInsideBusiness] != -1 && BusinessData[PlayerData[playerid][pInsideBusiness]][BusinessType] == BUSINESS_CLUB))
        {
            if(strlen(text) > 99)
            {
                format(string, sizeof(string), "%s [sessizce]: %.99s...", ReturnName(playerid, 0), text);
                LocalChat(playerid, 6.0, string, COLOR_FADE3);

                format(string, sizeof(string), "%s [sessizce]: ... %s", ReturnName(playerid, 0), text[99]);
                LocalChat(playerid, 6.0, string, COLOR_FADE3);
            }
            else
            {
                format(string, sizeof(string), "%s [sessizce]: %s", ReturnName(playerid, 0), text);
                LocalChat(playerid, 6.0, string, COLOR_FADE3);
            }
        }
        else
        {
            if(strlen(text) > 99)
            {
                format (string, sizeof(string), "%s: %.99s...", ReturnName(playerid, 0), text);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);

                format (string, sizeof(string), "%s: ... %s", ReturnName(playerid, 0), text[99]);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);
            }
            else
            {
                format (string, sizeof(string), "%s: %s", ReturnName(playerid, 0), text);
                LocalChat(playerid, 20.0, string, COLOR_FADE1);
            }
        }
        if(!IsPlayerInAnyVehicle(playerid) && !PlayerData[playerid][pPlayingAnimation])
        {
            ReturnChatAnimation(playerid, text);
        }
    }

    //DCC_SendChannelMessage(g_WelcomeChannelId, text);
    return 0;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    GetPlayerPos(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]);
    SetPlayerHealth(playerid, PlayerData[playerid][pMaxHealth]);

    if(killerid != INVALID_PLAYER_ID)
        SendAdminMessageEx(COLOR_ADM, "[ÖLÜM] %s isimli oyuncu %s tarafýndan öldürüldü. (%s)", ReturnName(playerid, 1), ReturnName(killerid, 1), ReturnWeaponName(reason));
    else
        {
          SetSpawnInfo(playerid, 0, PlayerData[playerid][pSkin], PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], 90.0, 0, 0, 0, 0, 0, 0);
          SendAdminMessageEx(COLOR_ADM, "[ÖLÜM] %s öldü.", ReturnName(playerid));
        }

    if(IsValidVehicle(PlayerBreakInVehicle[playerid]))
    {
        new Float:cX, Float:cY, Float:cZ;
        new vehicleid = PlayerBreakInVehicle[playerid];
        GetVehiclePos(vehicleid, cX, cY, cZ);

        CarData[vehicleid][carPhysicalAttack] = false;
        CarData[vehicleid][carCooldown] = false;

        if(IsValidDynamic3DTextLabel(BreakInTextDraw[playerid]))
        {
            DestroyDynamic3DTextLabel(BreakInTextDraw[playerid]);
        }

        KillTimer(BreakInTDTimer[playerid]);
        PlayerBreakInVehicle[playerid] = INVALID_VEHICLE_ID;
        PlayerBreakingIn[playerid] = 0;
        BreakInError[playerid] = 0;
        ActiveLockTD[playerid] = 0;
    }

    if(PlayerData[playerid][pCargoID])
    {
        RemovePlayerAttachedObject(playerid, SLOT_MISC);
        PlayerData[playerid][pCargoID] = 0;
    }

    if(Pkr_IsPlayerOnAnyGame(playerid)) {
        new gameId = Pkr_GetPlayerGame(playerid);
        Pkr_UnassignPlayerFromGame(playerid, gameId);
    }

    new Float:cx, Float:cy, Float:cz;
    GetPlayerCameraPos(playerid, cx, cy, cz);
    cz += !GetPlayerInterior(playerid) ? 5.0 : 0.5;

    foreach (new i : Player)
    {
        if (SpectateID[i] == playerid) {
            SetPlayerCameraPos(i, cx, cy, cz);
            SetPlayerCameraLookAt(i, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]);
        }
    }

    Iter_Remove(SpectatePlayers, playerid);

    SetPlayerTeam(playerid, STATE_WOUNDED);
    PlayerData[playerid][pBrutallyWounded] = 1;
    GetPlayerPos(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]);
    PlayerData[playerid][pWorld] = GetPlayerVirtualWorld(playerid);
    PlayerData[playerid][pInterior] = GetPlayerInterior(playerid);
    SetPlayerTeam(playerid, STATE_WOUNDED);
    return 1;
}

public OnVehicleSpawn(vehicleid)
{
    if(IsValidCar(vehicleid))
    {
        if(IsValidPlayerCar(vehicleid))
        {
            Tuning_SetComponents(vehicleid);
            SetVehicleParamsCarDoors(vehicleid, CarData[vehicleid][carDoors][0], CarData[vehicleid][carDoors][1], CarData[vehicleid][carDoors][2], CarData[vehicleid][carDoors][3]);
            SetVehicleParamsCarWindows(vehicleid, CarData[vehicleid][carWindows][0], CarData[vehicleid][carWindows][1], CarData[vehicleid][carWindows][2], CarData[vehicleid][carWindows][3]);
            UpdateVehicleDamageStatus(vehicleid, CarData[vehicleid][carPanelStatus], CarData[vehicleid][carDoorsStatus], CarData[vehicleid][carLightsStatus], CarData[vehicleid][carTiresStatus]);
        }

        if(IsValidFactionCar(vehicleid))
        {
            if(CarData[vehicleid][carSirenOn])
            {
                DestroyDynamicObject(CarData[vehicleid][carSirenObject]);
                CarData[vehicleid][carSirenOn] = false;
            }

            if(strcmp(CarData[vehicleid][carSign], "-", true))
            {
                if(!IsValidDynamic3DTextLabel(CarData[vehicleid][carSign3D])) CarData[vehicleid][carSign3D] = CreateDynamic3DTextLabel(sprintf("%s", CarData[vehicleid][carSign]), COLOR_WHITE, -0.7, -1.9, -0.3, 10.0, INVALID_PLAYER_ID, vehicleid, 0, -1, -1, -1);
                else UpdateDynamic3DTextLabelText(CarData[vehicleid][carSign3D], COLOR_WHITE, CarData[vehicleid][carSign]);
            }

            if(FactionData[CarData[vehicleid][carFaction]][FactionCopPerms])
            {
                Car_RefreshWeapons(vehicleid);
            }
        }

        for(new i; i != MAX_TRUCK_PRODUCT; i++)
        {
            if(i < 6 && IsValidDynamicObject(CarData[vehicleid][carCargoObj][i]))
            {
                DestroyDynamicObject(CarData[vehicleid][carCargoObj][i]);
                CarData[vehicleid][carCargoObj][i] = INVALID_OBJECT_ID;
            }

            CarData[vehicleid][carCargoAmount][i] = 0;
        }

        CarEngine[vehicleid] = CarLights[vehicleid] = false;
        SetVehicleParamsEx(vehicleid, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF);
        LinkVehicleToInterior(vehicleid, CarData[vehicleid][carInterior]);
        SetVehicleVirtualWorld(vehicleid, CarData[vehicleid][carWorld]);
        if(HasNoEngine(vehicleid)) ToggleVehicleEngine(vehicleid, true);
    }

    return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
    new Float:vehiclesHealth;
    GetVehicleHealth(vehicleid, vehiclesHealth);

    printf("[DEBUG] %s isimli arac %s tarafindan yok edildi. Yok edilmeden onceki aracin can degeri: %.0f", ReturnVehicleName(vehicleid), ReturnName(killerid, 1), vehiclesHealth);

    if(IsValidCar(vehicleid))
    {
        if(IsValidFactionCar(vehicleid))
        {
            if(IsValidDynamic3DTextLabel(CarData[vehicleid][carSign3D])) DestroyDynamic3DTextLabel(CarData[vehicleid][carSign3D]);
        }

        if(IsValidRentalCar(vehicleid))
        {
            SetVehicleToRespawn(vehicleid);
            if(CarData[vehicleid][carRentedBy])
            {
                SetVehicleToRespawn(vehicleid);
                new rentedby = GetIDByID(CarData[vehicleid][carRentedBy]);
                if(rentedby != INVALID_PLAYER_ID)
                {
                    PlayerData[rentedby][pRentCarKey] = 0;
                    SendClientMessage(rentedby, COLOR_ADM, "[ ! ] {FFFFFF}Kiraladýðýn araç patladýðý için kira sözleþmesi iptal edildi.");
                }

                CarData[vehicleid][carRentedBy] = 0;
            }
        }
    }
    SetVehicleToRespawn(vehicleid);
    return 1;
}

public OnDynamicObjectMoved(objectid)
{
    if(objectid == obj_ship)
    {
        switch(ship_docked)
        {
            case 2: ship_docked = 0;
            case 3:
            {
                ship_docked = 1;
                ship_arrived = Time();
                ship_depart = Time() + 1800;
                ship_next = Time() + 1800 + 450;

                SetObjectMaterialText(obj_board[1], sprintf("OCEAN DOCKS GEMI\nGELDIGI SAAT: %s\nKALKIS SAATI: %s\nDONUS SAATI: %s", GetShipHour(ship_arrived), GetShipHour(ship_depart), GetShipHour(ship_next)), 0, OBJECT_MATERIAL_SIZE_512x256, "Arial", 26, 1, -1, 0, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);

                new Float: ox,
                    Float: oy,
                    Float: oz,
                    Float: rx,
                    Float: ry,
                    Float: rz;

                foreach(new i : Trucker)
                {
                    if(i < 9)
                        Streamer_SetIntData(STREAMER_TYPE_OBJECT, obj_lamp[i], E_STREAMER_MODEL_ID, 19123);

                    if(i < 2)
                    {
                        GetDynamicObjectPos(obj_gate[i], ox, oy, oz);
                        GetDynamicObjectRot(obj_gate[i], rx, ry, rz);
                        MoveDynamicObject(obj_gate[i], ox, oy, oz, 0.0005, rx, ry, rz);
                    }

                    if(TruckerData[i][tType] != 2)
                        continue; // gemi olmayanlarý pas geç

                    Streamer_SetIntData(STREAMER_TYPE_3D_TEXT_LABEL, TruckerData[i][tLabel], E_STREAMER_INTERIOR_ID, 0);
                    Streamer_SetIntData(STREAMER_TYPE_PICKUP, TruckerData[i][tPickup], E_STREAMER_INTERIOR_ID, 0);
                }
            }
        }
    }
    return 1;
}

public OnPlayerUpdate(playerid)
{
    PlayerData[playerid][pPauseCheck] = GetTickCount();

    new animlib[32], animname[32]; // Knýfe Fix
    GetAnimationName(GetPlayerAnimationIndex(playerid),animlib,32,animname,32);
    if(strcmp(animlib, "KNIFE") == 0 && GetPlayerWeapon(playerid) ==  4)
    {
        if(strcmp(animname, "KILL_PARTIAL") == 0)
        {
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
        ClearAnimations(playerid);
        TogglePlayerControllable(playerid, 0);
        SetTimerEx("unfreeze_player", 100, false, "d", playerid);
        }
    }

    if(IsPlayerInAnyVehicle(playerid))
    {
      if(GetPlayerVehicleSeat(playerid) != 0)
        return 1;

      foreach(new e : Roadblocks) if(IsPlayerInRangeOfPoint(playerid, 1.5, RoadblockData[e][RoadblockPos][0], RoadblockData[e][RoadblockPos][1], RoadblockData[e][RoadblockPos][2]))
      {
        if(RoadblockData[e][RoadblockSpikes])
        {
          if(spikeTire[GetPlayerVehicleID(playerid)] == true)
            return 1;

          PlayerPlaySound(playerid, 1190, 0.0, 0.0, 0.0);
          spikeTire[GetPlayerVehicleID(playerid)] = true;
          spikeTimer[GetPlayerVehicleID(playerid)] = SetTimerEx("bumpTierBlowout", 10000+randomEx(5000, 15000), false, "i", GetPlayerVehicleID(playerid));

          if(IsValidDynamicObject(RoadblockData[e][RoadblockObject])) DestroyDynamicObject(RoadblockData[e][RoadblockObject]);
          if(IsValidDynamicArea(RoadblockData[e][RoadblockAreaID]))
          {
              Streamer_RemoveArrayData(STREAMER_TYPE_AREA, RoadblockData[e][RoadblockAreaID], E_STREAMER_PLAYER_ID, e);
              DestroyDynamicArea(RoadblockData[e][RoadblockAreaID]);
          }
          RoadblockData[e][RoadblockSpikes] = false;
          Iter_Remove(Roadblocks, e);
          return 1;
        }
      }
    }


    if(PlayerData[playerid][pRadar] == true)
    {
      if(PlayerData[playerid][pRadarSpeed] == 0)
        return 1;

      for(new v = 1, j = GetVehiclePoolSize(); v <= j; v++)
      {
        if(!IsValidVehicle(v)) continue;
        if(GetVehicleDriver(v) == -1) continue;

        if(GetVehicleSpeed(v) < 10)
          return 1;

        if(gettime() - GetPVarInt(playerid, "speedradar_lasttime") < 2)
          return 1;

        if(!IsPlayerInRangeOfPoint(playerid, 5.0, PlayerData[playerid][pRadarPos][0], PlayerData[playerid][pRadarPos][1], PlayerData[playerid][pRadarPos][2]))
        {
            DisablePlayerRaceCheckpoint(playerid);
            return 1;
        }

        if(!IsVehicleInRangeOfPoint(v, 2.5, PlayerData[playerid][pRadarPos][0], PlayerData[playerid][pRadarPos][1], PlayerData[playerid][pRadarPos][2])) continue;

        SetPVarInt(playerid, "speedradar_lasttime", gettime());
        if(GetVehicleSpeed(v) > PlayerData[playerid][pRadarSpeed])
        {
          SendMessage(playerid, "{FFFFFF}[Hýz Radarý] MPH: {FF6347}%i{FFFFFF}, KPH: {FF6347}%3.f", floatround(GetVehicleSpeed(v)), GetVehicleSpeed(v) * 0.6214);
        }
        else
        {
          SendMessage(playerid, "{FFFFFF}[Hýz Radarý] MPH: %i, KPH: %3.f", floatround(GetVehicleSpeed(v)), GetVehicleSpeed(v) * 0.6214);
        }
      }
    }

    if (NetStats_GetConnectedTime(playerid) - PlayerConnectionTick[playerid] >= 250)
    {
        new weaponid, ammo, objectslot, count, index;

        for (new i = 2; i <= 7; i++) //Loop only through the slots that may contain the wearable weapons
        {
            GetPlayerWeaponData(playerid, i, weaponid, ammo);
            index = weaponid - 22;

            if (weaponid && ammo && !WeaponSettings[playerid][index][WeaponHidden] && IsWeaponWearable(weaponid) && EditingDisplay[playerid] != weaponid)
            {
                objectslot = GetWeaponObjectSlot(weaponid);

                if (GetPlayerWeapon(playerid) != weaponid)
                    SetPlayerAttachedObject(playerid, objectslot, ReturnWeaponsModel(weaponid), WeaponSettings[playerid][index][WeaponBone], WeaponSettings[playerid][index][WeaponPos][0], WeaponSettings[playerid][index][WeaponPos][1], WeaponSettings[playerid][index][WeaponPos][2], WeaponSettings[playerid][index][WeaponPos][3], WeaponSettings[playerid][index][WeaponPos][4], WeaponSettings[playerid][index][WeaponPos][5], 1.0, 1.0, 1.0);

                else if (IsPlayerAttachedObjectSlotUsed(playerid, objectslot)) RemovePlayerAttachedObject(playerid, objectslot);
            }
        }

        for (new i = 5; i <= 8; i++) if (IsPlayerAttachedObjectSlotUsed(playerid, i))
        {
            count = 0;

            for (new j = 22; j <= 34; j++) if (Player_HasWeapon(playerid, j) && GetWeaponObjectSlot(j) == i)
                count++;

            if (!count) RemovePlayerAttachedObject(playerid, i);
        }
        PlayerConnectionTick[playerid] = NetStats_GetConnectedTime(playerid);
    }

    if(PlayerData[playerid][pExecuteTime])
    {
        if(!IsPlayerInAnyVehicle(playerid)) ApplyAnimation(playerid, "WUZI", "CS_Dead_Guy", 4.0, 0, 0, 0, 1, 0, 1);
        else ApplyAnimation(playerid, "PED", "CAR_dead_LHS", 4.1, 0, 1, 1, 1, 0, 1);
    }

    if(noclipdata[playerid][cameramode] == CAMERA_MODE_FLY)
    {
        new keys,ud,lr;
        GetPlayerKeys(playerid,keys,ud,lr);


        if(noclipdata[playerid][mode] && GetTickCountDifference(GetTickCount(), noclipdata[playerid][lastmove]) > 100)
        {
            // If the last move was > 100ms ago, process moving the object the players camera is attached to
            MoveCamera(playerid);
        }

        if(noclipdata[playerid][udold] != ud || noclipdata[playerid][lrold] != lr)
        {
            if((noclipdata[playerid][udold] != 0 || noclipdata[playerid][lrold] != 0) && ud == 0 && lr == 0)
            {   // All keys have been released, stop the object the camera is attached to and reset the acceleration multiplier
                StopPlayerObject(playerid, noclipdata[playerid][flyobject]);
                noclipdata[playerid][mode]      = 0;
                noclipdata[playerid][accelmul]  = 0.0;
            }
            else
            {   // Indicates a new key has been pressed

                // Get the direction the player wants to move as indicated by the keys
                noclipdata[playerid][mode] = GetMoveDirectionFromKeys(ud, lr);

                // Process moving the object the players camera is attached to
                MoveCamera(playerid);
            }
        }
        noclipdata[playerid][udold] = ud; noclipdata[playerid][lrold] = lr; // Store current keys pressed for comparison next update
    }
    return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
    if(!IsValidWeapon(GetPlayerWeapon(playerid)))
    {
      SetPlayerArmedWeapon(playerid, 0);
    }

    if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CARRY)
    {
        ClearAnimations(playerid);
        return 1;
    }

    if(PlayerData[playerid][pBrutallyWounded])
    {
        SendClientMessage(playerid, COLOR_ADM, "SERVER: Bu durumda bir aracý kullanmaya çalýþmak yasaklanmana yol açacaktýr.");
        ClearAnimations(playerid);
        return 1;
    }

    if(CarData[vehicleid][carFaction] == -1 && CarData[vehicleid][carLocked] && !PlayerData[playerid][pAdminDuty])
    {
        if(!playerTextdraw[playerid])
        {
            vehicleTextdraw[playerid] = CreateDynamic3DTextLabel("Araç Kilitli!", COLOR_RED, 0.0, 0.0, 0.0, 10.0, .attachedvehicle = vehicleid, .playerid = playerid, .worldid = GetPlayerVirtualWorld(playerid), .interiorid = GetPlayerInterior(playerid));
            SetTimerEx("OnVehicleTextdraw", 4000, false, "i", playerid);
            playerTextdraw[playerid] = true;
        }
        return ClearAnimations(playerid);
    }

    if(!ispassenger && CarData[vehicleid][carFaction] != -1 && CarData[vehicleid][carFaction] != PlayerData[playerid][pFaction] && !PlayerData[playerid][pAdminDuty])
    {
        if(!playerTextdraw[playerid])
        {
            vehicleTextdraw[playerid] = CreateDynamic3DTextLabel("Bu arabaya binemezsin. (Birlik)", COLOR_WHITE, 0.0, 0.0, 0.0, 10.0, .attachedvehicle = vehicleid, .playerid = playerid, .worldid = GetPlayerVirtualWorld(playerid), .interiorid = GetPlayerInterior(playerid));
            SetTimerEx("OnVehicleTextdraw", 4000, false, "i", playerid);
            playerTextdraw[playerid] = true;
        }

        return ClearAnimations(playerid);
    }

    playerEnteringVehicle[playerid] = vehicleid;
    return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
    if(GetPVarInt(playerid, "Mechanic_Started") == 1)
    {
        InfoTD_MSG(playerid, 2, 5000, "~h~~p~HUNERLERINI_GOSTER.");
        GivePlayerWeapon(playerid, 41, 2000);
    }

    if(InTaxiRide[playerid])
    {
        EndTaxiFair(playerid);
    }

    if (Chopshopping[playerid] != 0)
    {
        KillTimer(ChopshopTimer[playerid]);
        Chopshopping[playerid] = 1;
    }
    return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    Vehicle_DriveBy(playerid, oldkeys);

    if(newkeys == KEY_AIM)
    {
        if(PlayerData[playerid][pPlayingAnimation])
        {
            AnimasyonBoz(playerid);
        }
    }

    if(SpectateID[playerid] != -1)
    {
        if(newkeys == KEY_FIRE) {
            new prev = GetPreviousPlayer(SpectateID[playerid]);
            if (prev == -1) {
                PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
            }
            else {
                StartSpectate(playerid, prev);
            }
        }
        else if(newkeys == KEY_AIM)
        {
            new next = GetNextPlayer(SpectateID[playerid]);
            if (next == -1) {
                PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
            }
            else {
                StartSpectate(playerid, next);
            }
        }
        else if(newkeys == KEY_SPRINT)
        {
            StartSpectate(playerid, SpectateID[playerid]);
        }
    }

    if(PlayerData[playerid][p3DMenu] != -1)
    {
        if(PRESSED(KEY_CTRL_BACK))
        {
            SetPVarInt(playerid, "chose_texture", GetPVarInt(playerid, "chose_texture") + 1);
            if(GetPVarInt(playerid, "chose_texture") > 4) SetPVarInt(playerid, "chose_texture", 0);
            InfoTD_MSG(playerid, 1, 4000, sprintf("~y~SECILEN SLOT: ~w~%i", GetPVarInt(playerid, "chose_texture")+1));
            return 1;
        }

        if(PRESSED(KEY_SECONDARY_ATTACK))
        {
            Destroy3DMenu(PlayerData[playerid][p3DMenu]);
            PlayerData[playerid][p3DMenu] = -1;
            Furniture_Edit(playerid);
            return 1;
        }
    }

    switch(EditingObject[playerid])
    {
        case 21, 22:
        {
            if(newkeys & KEY_SPRINT && newkeys & KEY_SUBMISSION)
            {
                new data[e_furniture], objid = GetPVarInt(playerid, "chose_slot");
                Streamer_GetArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data);
                GetXYInFrontOfPlayer(playerid, data[furnitureX], data[furnitureY], 1.0);
                SetDynamicObjectPos(objid, data[furnitureX], data[furnitureY], data[furnitureZ]);
            }
        }
    }

    if(newkeys & KEY_JUMP && PlayerData[playerid][pPlayingAnimation])
    {
        ApplyAnimation(playerid, "CARRY", "crry_prtial", 4, 0, 0, 0, 0, 0, 1);

        if(!PlayerData[playerid][pHandcuffed] && GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_DRINK_BEER && GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_DRINK_WINE && GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_DRINK_SPRUNK)
            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);

        PlayerData[playerid][pPlayingAnimation] = false;
    }

    switch(GetPlayerTeam(playerid))
    {
        case STATE_ALIVE:
        {
            if(newkeys == KEY_SUBMISSION)
            {
              if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
              {
                  cmd_motor(playerid, "");
              }
            }
            if(newkeys == KEY_YES)
            {
                cmd_giris(playerid, "");

                if(GetPVarInt(playerid, "AtHouse") != -1)
                {
                    new h = GetPVarInt(playerid, "AtHouse");
                    if(PropertyData[h][PropertyType] == 2)
                    {
                        if(IsPlayerInRangeOfPoint(playerid, 3.0, PropertyData[h][PropertyExit][0], PropertyData[h][PropertyExit][1], PropertyData[h][PropertyExit][2]) && PlayerData[playerid][pInsideApartment] == h)
                        {
                            if(GetPlayerVirtualWorld(playerid) == PropertyData[h][PropertyExitWorld])
                            {
                                if(PropertyData[h][PropertyLocked]) return GameTextForPlayer(playerid, "~r~Kilitli", 2000, 1);

                                SendPlayer(playerid, PropertyData[h][PropertyEnter][0], PropertyData[h][PropertyEnter][1], PropertyData[h][PropertyEnter][2], PropertyData[h][PropertyEnter][3], PropertyData[h][PropertyEnterInterior], PropertyData[h][PropertyEnterWorld]);
                                PlayerData[playerid][pInsideComplex] = PropertyData[h][PropertyComplexLink];
                                PlayerData[playerid][pInsideApartment] = -1;
                                StopAudioStreamForPlayer(playerid);
                                return 1;
                            }
                        }
                    }
                    else
                    {
                        if(IsPlayerInRangeOfPoint(playerid, 3.0, PropertyData[h][PropertyExit][0], PropertyData[h][PropertyExit][1], PropertyData[h][PropertyExit][2]))
                        {
                            if(GetPlayerVirtualWorld(playerid) == PropertyData[h][PropertyExitWorld])
                            {
                                if(PropertyData[h][PropertyLocked]) return GameTextForPlayer(playerid, "~r~Kilitli", 2000, 1);

                                SendPlayer(playerid, PropertyData[h][PropertyEnter][0], PropertyData[h][PropertyEnter][1], PropertyData[h][PropertyEnter][2], PropertyData[h][PropertyEnter][3], PropertyData[h][PropertyEnterInterior], PropertyData[h][PropertyEnterWorld]);
                                PlayerData[playerid][pInsideComplex] = -1;
                                PlayerData[playerid][pInsideHouse] = -1;
                                StopAudioStreamForPlayer(playerid);
                                return 1;
                            }
                        }
                    }
                }

                new h = -1;
                if((h = IsPlayerInProperty(playerid)) != -1)
                {
                    if(IsPlayerInRangeOfPoint(playerid, 3.0, PropertyData[h][PropertyExit][0], PropertyData[h][PropertyExit][1], PropertyData[h][PropertyExit][2]))
                    {
                        switch(PropertyData[h][PropertyType])
                        {
                            case 2:
                            {
                                if(PlayerData[playerid][pInsideApartment] == h && GetPlayerVirtualWorld(playerid) == PropertyData[h][PropertyExitWorld])
                                {
                                    if(PropertyData[h][PropertyLocked]) return GameTextForPlayer(playerid, "~r~Kilitli", 2000, 1);
                                    SendPlayer(playerid, PropertyData[h][PropertyEnter][0], PropertyData[h][PropertyEnter][1], PropertyData[h][PropertyEnter][2], PropertyData[h][PropertyEnter][3], PropertyData[h][PropertyEnterInterior], PropertyData[h][PropertyEnterWorld]);
                                    PlayerData[playerid][pInsideComplex] = PropertyData[h][PropertyComplexLink];
                                    PlayerData[playerid][pInsideApartment] = -1;
                                    StopAudioStreamForPlayer(playerid);
                                }
                            }
                            default:
                            {
                                if(PropertyData[h][PropertyLocked]) return GameTextForPlayer(playerid, "~r~Kilitli", 2000, 1);
                                SendPlayer(playerid, PropertyData[h][PropertyEnter][0], PropertyData[h][PropertyEnter][1], PropertyData[h][PropertyEnter][2], PropertyData[h][PropertyEnter][3], PropertyData[h][PropertyEnterInterior], PropertyData[h][PropertyEnterWorld]);
                                PlayerData[playerid][pInsideComplex] = -1;
                                PlayerData[playerid][pInsideHouse] = -1;
                                StopAudioStreamForPlayer(playerid);
                            }
                        }
                    }
                }


                if(GetPVarInt(playerid, "AtBusiness") != -1)
                {
                    new b = GetPVarInt(playerid, "AtBusiness");
                    if(IsPlayerInRangeOfPoint(playerid, 3.0, BusinessData[b][ExitPos][0], BusinessData[b][ExitPos][1], BusinessData[b][ExitPos][2]))
                    {
                        if(BusinessData[b][BusinessLocked]) return GameTextForPlayer(playerid, "~r~Kilitli", 3000, 1);
                        SendPlayer(playerid, BusinessData[b][EnterPos][0], BusinessData[b][EnterPos][1], BusinessData[b][EnterPos][2], BusinessData[b][EnterPos][3], BusinessData[b][EnterInterior], BusinessData[b][EnterWorld]);
                        PlayerData[playerid][pInsideBusiness] = -1;
                        StopAudioStreamForPlayer(playerid);
                        return 1;
                    }
                }

                if(GetPVarInt(playerid, "AtGarage") != -1)
                {
                    new g = PlayerData[playerid][pInsideGarage];
                    if(IsPlayerInRangeOfPoint(playerid, 3.0, GarageData[g][GarageInt][0], GarageData[g][GarageInt][1], GarageData[g][GarageInt][2]) && GarageData[g][ExitWorld] == GetPlayerVirtualWorld(playerid))
                    {
                        SendPlayer(playerid, GarageData[g][GaragePos][0], GarageData[g][GaragePos][1], GarageData[g][GaragePos][2], GarageData[g][GaragePos][3], GarageData[g][EnterInteriorID], GarageData[g][EnterWorld]);
                        PlayerData[playerid][pInsideGarage] = -1;

                        if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
                        {
                            foreach(new i : Player)
                            {
                                if(IsPlayerInVehicle(i, GetPlayerVehicleID(playerid)))
                                {
                                    SetPlayerInterior(i, GarageData[g][EnterInteriorID]);
                                    SetPlayerVirtualWorld(i, GarageData[g][EnterWorld]);
                                    PlayerData[i][pInsideGarage] = -1;
                                }
                            }
                        }
                        return 1;
                    }
                }

                if(GetPVarInt(playerid, "AtDoor") != -1)
                {
                    new d = GetPVarInt(playerid, "AtDoor");
                    if(IsPlayerInRangeOfPoint(playerid, 3.0, DoorData[d][ExitPos][0], DoorData[d][ExitPos][1], DoorData[d][ExitPos][2]))
                    {
                        SendPlayer(playerid, DoorData[d][EnterPos][0], DoorData[d][EnterPos][1], DoorData[d][EnterPos][2], DoorData[d][EnterPos][3], DoorData[d][EnterInterior], DoorData[d][EnterWorld]);
                        PlayerData[playerid][pInsideDoor] = -1;
                        return 1;
                    }
                }

                if(GetPVarInt(playerid, "AtEntrance") != -1)
                {
                    new e = GetPVarInt(playerid, "AtEntrance");
                    if(IsPlayerInRangeOfPoint(playerid, 3.0, EntranceData[e][EntranceInt][0], EntranceData[e][EntranceInt][1], EntranceData[e][EntranceInt][2]))
                    {
                        if(IsPlayerInAnyVehicle(playerid)) return SendServerMessage(playerid, "Araçtayken bu komutu kullanamazsýn.");
                        if(EntranceData[e][EntranceLocked] && !PlayerData[playerid][pAdminDuty]) return GameTextForPlayer(playerid, "~r~Kilitli", 3000, 1);

                        SendPlayer(playerid, EntranceData[e][EntrancePos][0], EntranceData[e][EntrancePos][1], EntranceData[e][EntrancePos][2], EntranceData[e][EntrancePos][3], EntranceData[e][EntranceInteriorID], EntranceData[e][EntranceWorld]);
                        PlayerData[playerid][pInsideEntrance] = -1;
                        return 1;
                    }
                }
            }

            if(newkeys & KEY_SPRINT && !(oldkeys & KEY_SPRINT) && PlayerData[playerid][pLegShot] && !IsPlayerInAnyVehicle(playerid)) {
                ApplyAnimation(playerid, "ped", "FALL_collapse", 4.1, 0, 1, 1, 0, 0, 1);
            }

            if(newkeys & KEY_JUMP && !(oldkeys & KEY_JUMP) && (PlayerData[playerid][pLegShot] || PlayerData[playerid][pHandcuffed])) {
                ApplyAnimation(playerid, "GYMNASIUM", "gym_jog_falloff", 4.1, 0, 1, 1, 0, 0, 1);
            }
        }
        case STATE_WOUNDED, STATE_DEAD:
        {
            if((newkeys & KEY_SPRINT && !(oldkeys & KEY_SPRINT)) || newkeys & KEY_JUMP && !(oldkeys & KEY_JUMP))
            {
                if(!IsPlayerInAnyVehicle(playerid)) ApplyAnimation(playerid, "WUZI", "CS_Dead_Guy", 4.1, 0, 1, 1, 1, 0, 1);
                else ApplyAnimation(playerid, "PED", "CAR_dead_LHS", 4.1, 0, 1, 1, 1, 0, 1);
            }
        }
    }

    if(GetPVarInt(playerid, "IdentityActive") == 2)
    {
      if(PRESSED(KEY_NO))
      {
        SetPVarInt(playerid, "IdentityActive", 0);
        for(new m = 0; m < 11; m++)
        {
          PlayerTextDrawHide(playerid, IdentityCard[playerid][m]);
        }
        Player_ReturnLicenses(GetPVarInt(playerid, "LastIdentity"), playerid, 1);
      }

      if(PRESSED(KEY_YES))
      {
          SetPVarInt(playerid, "IdentityActive", 0);
          for(new m = 0; m < 11; m++)
          {
            PlayerTextDrawHide(playerid, IdentityCard[playerid][m]);
          }
      }
    }

    if(GetPVarInt(playerid, "IdentityActive") == 1)
    {
      if(PRESSED(KEY_NO))
      {
          PlayerTextDrawHide(playerid, IdentityCard[playerid][9]);
          PlayerTextDrawHide(playerid, IdentityCard[playerid][10]);
          Player_ReturnLicenses(GetPVarInt(playerid, "LastIdentity"), playerid, 1);
      }
      if(PRESSED(KEY_YES))
      {
          PlayerTextDrawHide(playerid, IdentityCard[playerid][9]);
          PlayerTextDrawHide(playerid, IdentityCard[playerid][10]);
          Player_ReturnLicenses(GetPVarInt(playerid, "LastIdentity"), playerid, 2);
      }
    }


    if(GetPVarInt(playerid, "Grantbuild_ID") != INVALID_PLAYER_ID)
    {
        new id = GetPVarInt(playerid, "Grantbuild_ID"),
            p_id = GetPVarInt(playerid, "Grantbuild_PropertyID"),
            b_id = GetPVarInt(playerid, "Grantbuild_BusinessID");

        if(PRESSED(KEY_NO))
        {
            InfoTD_MSG(id, 1, 5000, sprintf("~y~%s ~r~DAVETINI REDDETTI.", ReturnName(playerid)));
            InfoTD_MSG(playerid, 1, 5000, sprintf("~y~%s ~r~DAVETINI REDDETTINIZ.", ReturnName(id)));
            DeletePVar(playerid, "Grantbuild_ID");
            DeletePVar(playerid, "Grantbuild_PropertyID");
            DeletePVar(playerid, "Grantbuild_BusinessID");
        }

        if(PRESSED(KEY_YES))
        {
            InfoTD_MSG(id, 1, 5000, sprintf("~y~%s ~g~DAVETINI KABUL ETTI.", ReturnName(playerid)));
            InfoTD_MSG(playerid, 1, 5000, sprintf("~y~%s ~g~DAVETINI KABUL ETTINIZ.", ReturnName(id)));
            SetPlayerChatBubble(id, sprintf("(( * %s, %s adlý kiþiye mobilya izni verdi. ))", ReturnName(playerid, 1), ReturnName(id, 1)), COLOR_EMOTE, 20.0, 3000);

            SetPVarInt(playerid, "Grantbuild_ID", INVALID_PLAYER_ID);
            if(p_id != -1)
            {
                PlayerData[playerid][pGrantBuild] = PropertyData[p_id][PropertyID];
                DeletePVar(playerid, "Grantbuild_PropertyID");
            }
            else if(b_id != -1)
            {
                PlayerData[playerid][pGrantBuildBiz] = BusinessData[b_id][BusinessID];
                DeletePVar(playerid, "Grantbuild_BusinessID");
            }
        }
    }

    if(GetPVarInt(playerid, "Mechanic_ID") != INVALID_PLAYER_ID)
    {
        new id = GetPVarInt(playerid, "Mechanic_ID");

        if(PRESSED(KEY_NO))
        {
            InfoTD_MSG(id, 2, 5000, sprintf("~g~%s~p~_SENIN_TEKLIFINI_REDDETTI.", ReturnName(playerid)));
            InfoTD_MSG(playerid, 2, 5000, sprintf("~g~%s~p~_ISIMLI_KISININ_TEKLIFINI_REDDETTIN.", ReturnName(id)));
            SetPVarInt(playerid, "Mechanic_ID", INVALID_PLAYER_ID);
            SetPVarInt(playerid, "Mechanic_Type", -1);
        }

        if(PRESSED(KEY_YES))
        {
            if(!GetDistanceBetweenPlayers(playerid, id, 8.0))
            {
                InfoTD_MSG(id, 2, 5000, sprintf("~g~%s~p~_SENIN_TEKLIFI_OTOMATIK_REDDEDILDI.", ReturnName(playerid)));
                InfoTD_MSG(playerid, 2, 5000, sprintf("~g~%s~p~_ISIMLI_KISININ_TEKLIFI_OTOMATIK_REDDEDILDI.", ReturnName(id)));
                SetPVarInt(playerid, "Mechanic_ID", INVALID_PLAYER_ID);
                SetPVarInt(playerid, "Mechanic_Type", -1);
                return 1;
            }

            if(!IsPlayerInAnyVehicle(playerid))
            {
                InfoTD_MSG(id, 2, 5000, sprintf("~g~%s~p~_SENIN_TEKLIFI_OTOMATIK_REDDEDILDI.", ReturnName(playerid)));
                InfoTD_MSG(playerid, 2, 5000, sprintf("~g~%s~p~_ISIMLI_KISININ_TEKLIFI_OTOMATIK_REDDEDILDI.", ReturnName(id)));
                SetPVarInt(playerid, "Mechanic_ID", INVALID_PLAYER_ID);
                SetPVarInt(playerid, "Mechanic_Type", -1);
                return 1;
            }

            new type = GetPVarInt(playerid, "Mechanic_Type");

            InfoTD_MSG(id, 2, 5000, sprintf("~g~%s~p~_SENIN_TEKLIFINI_KABUL_ETTI.", ReturnName(playerid)));
            InfoTD_MSG(playerid, 2, 5000, sprintf("~g~%s~p~_ISIMLI_KISININ_TEKLIFINI_KABUL_ETTIN.", ReturnName(id)));
            SetPVarInt(playerid, "Mechanic_ID", INVALID_PLAYER_ID);
            SetPVarInt(playerid, "Mechanic_Type", -1);

            if(type == 6)
            {
                AttachTrailerToVehicle(GetPlayerVehicleID(playerid), GetPlayerVehicleID(id));
                return 1;
            }

            SetPVarInt(id, "Mechanic_Started", 1);
            SetPVarInt(id, "Mechanic_CarID", GetPlayerVehicleID(playerid));
            SetPVarInt(id, "Mechanic_Type", type);
        }
    }

    if(GetPVarInt(playerid, "Mechanic_Started") == 1)
    {
        if(!IsPlayerInAnyVehicle(playerid))
        {
            if(RELEASED(KEY_FIRE))
            {
                GameTextForPlayer(playerid, "~r~Spray Durdu", 3000, 3);
                SetPVarInt(playerid, "Mechanic_Started", 0);
                SetPVarInt(playerid, "Mechanic_CarID", INVALID_VEHICLE_ID);
                SetPVarInt(playerid, "Mechanic_Type", -1);
                KillTimer(PaintJobTimer[playerid]);
                PaintJobTimer[playerid] = -1;
            }

            if(PRESSED(KEY_FIRE))
            {
                new vehicleid = GetPVarInt(playerid, "Mechanic_CarID");

                new Float: x, Float: y, Float: z; GetVehiclePos(vehicleid, x, y, z);
                if(!IsPlayerInRangeOfPoint(playerid, 5.0, x, y, z))
                {
                    GameTextForPlayer(playerid, "~r~Spray Durdu", 3000, 3);
                    SetPVarInt(playerid, "Mechanic_Started", 0);
                    SetPVarInt(playerid, "Mechanic_CarID", INVALID_VEHICLE_ID);
                    SetPVarInt(playerid, "Mechanic_Type", -1);
                    return 1;
                }

                SetPVarInt(playerid, "Mechanic_Time", 20);
                PaintJobTimer[playerid] = SetTimerEx("Mechanic_Count", 1000, true, "i", playerid);
            }
        }
    }

    if ((newkeys & KEY_FIRE) && PlayerData[playerid][pTackle])
    {
        if(GetPlayerTargetPlayer(playerid) != INVALID_PLAYER_ID)
        {
          if (IsWeaponWearable(GetPlayerWeapon(playerid))) return 1;

            new target = GetPlayerTargetPlayer(playerid);

            if (PlayerData[playerid][pFaction] == PlayerData[target][pFaction]) return SendServerMessage(playerid, "Kendi birliðindeki birine bu komutu kullanamazsýn.");
            //if (IsWeaponWearable(GetPlayerWeapon(target))) return SendErrorMessage(playerid, "Bu kiþinin elinde silah var.");
            if (GetPlayerTeam(target) != STATE_ALIVE) return SendServerMessage(playerid, "Etkisiz haldeki birine bu komutu kullanamazsýn.");

            new rand = random(2);
            switch(rand)
            {
                case 0:
                {
                    SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s, %s adlý kiþinin üstüne doðru atlayarak yere düþürür.", ReturnName(playerid, 0), ReturnName(target, 0));
                    PlayAnimation(target, "PARACHUTE", "FALL_skyDive_DIE", 4.0, 0, 1, 1, 1, -1);
                    PlayAnimation(playerid, "ped", "EV_dive", 4.0, 0, 1, 1, 1, -1);
                    PlayerData[playerid][pTackle] = false;
                }
                case 1:
                {
                    SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s, %s adlý kiþinin üstüne atlar fakat yere düþer.", ReturnName(playerid, 0), ReturnName(target, 0));
                    ApplyAnimation(playerid, "ped","EV_dive",4.0, 0, 1, 1, 1, -1);
                }
            }
        }
    }

    if(PlayerBreakInVehicle[playerid] != INVALID_VEHICLE_ID && CarData[PlayerBreakInVehicle[playerid]][carPhysicalAttack] && RELEASED(KEY_FIRE) && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && !CarData[PlayerBreakInVehicle[playerid]][carCooldown])
    {
        new
            weaponid = GetPlayerWeapon(playerid),
            vehicleid = PlayerBreakInVehicle[playerid];

        if(weaponid != 0 && !Player_HasWeapon(playerid, weaponid))
            return 0;

        if(IsValidVehicle(vehicleid))
        {
            new Float:cX, Float:cY, Float:cZ;
            new Float:dX, Float:dY, Float:dZ, Float: playerHealth;

            GetPlayerHealth(playerid, playerHealth);
            GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_FRONTSEAT, cX, cY, cZ);
            GetVehicleRelativePos(vehicleid, dX, dY, dZ, -cX - 0.5, cY, cZ);

            if(!IsPlayerInRangeOfPoint(playerid, 1.2, dX, dY, dZ))
                return 1;

            if(GetVehicleDriver(vehicleid) != -1)
                return 1;

            if(CarData[vehicleid][carDoorHealth] <= 0.0)
                return 1;

            switch(CarData[vehicleid][carDoorEffect])
            {
                case LESS_DAMAGE_FIST:
                {
                    /*if(weaponid == 0)
                    {
                        CarData[vehicleid][carDoorHealth] = (CarData[vehicleid][carDoorHealth] - 1 <= 0) ? 0 : CarData[vehicleid][carDoorHealth] - 1;
                        if(playerHealth > 10.0)
                        {
                            SetPlayerHealth(playerid, playerHealth - 10.0);
                        }
                    }*/
                    if(weaponid >= 1 && weaponid <= 9)
                    {
                        CarData[vehicleid][carDoorHealth] = (CarData[vehicleid][carDoorHealth] - 10 <= 0) ? 0 : CarData[vehicleid][carDoorHealth] - 10;
                    }
                    if(weaponid >= 22 && weaponid <= 24)
                    {
                        CarData[vehicleid][carDoorHealth] = (CarData[vehicleid][carDoorHealth] - 15 <= 0) ? 0 : CarData[vehicleid][carDoorHealth] - 15;
                    }
                    if(weaponid >= 25 && weaponid <= 33)
                    {
                        CarData[vehicleid][carDoorHealth] = (CarData[vehicleid][carDoorHealth] - 30 <= 0) ? 0 : CarData[vehicleid][carDoorHealth] - 30;
                    }
                }
                case BLOCK_FIST:
                {
                    if(weaponid >= 1 && weaponid <= 9)
                    {
                        CarData[vehicleid][carDoorHealth] = (CarData[vehicleid][carDoorHealth] - 10 <= 0) ? 0 : CarData[vehicleid][carDoorHealth] - 10;
                    }
                    if(weaponid >= 22 && weaponid <= 24)
                    {
                        CarData[vehicleid][carDoorHealth] = (CarData[vehicleid][carDoorHealth] - 15 <= 0) ? 0 : CarData[vehicleid][carDoorHealth] - 15;
                    }
                }
                case LESS_DAMAGE_MELEE:
                {
                    if(weaponid >= 22 && weaponid <= 24)
                    {
                        CarData[vehicleid][carDoorHealth] = (CarData[vehicleid][carDoorHealth] - 5 <= 0) ? 0 : CarData[vehicleid][carDoorHealth] - 5;
                    }
                    if(weaponid >= 25 && weaponid <= 33)
                    {
                        CarData[vehicleid][carDoorHealth] = (CarData[vehicleid][carDoorHealth] - 20 <= 0) ? 0 : CarData[vehicleid][carDoorHealth] - 20;
                    }
                }
                case BLOCK_PHYSICAL:
                {
                    if(weaponid >= 25 && weaponid <= 33)
                    {
                        CarData[vehicleid][carDoorHealth] = (CarData[vehicleid][carDoorHealth] - 30 <= 0) ? 0 : CarData[vehicleid][carDoorHealth] - 30;
                    }
                }
                default:
                {
                    if(weaponid == 0)
                    {
                        CarData[vehicleid][carDoorHealth] = (CarData[vehicleid][carDoorHealth] - 2 <= 0) ? 0 : CarData[vehicleid][carDoorHealth] - 2;
                        SetPlayerHealth(playerid, playerHealth - 5.0);
                    }
                    if(weaponid >= 1 && weaponid <= 9)
                    {
                        CarData[vehicleid][carDoorHealth] = (CarData[vehicleid][carDoorHealth] - 10 <= 0) ? 0 : CarData[vehicleid][carDoorHealth] - 10;
                    }
                    if(weaponid >= 22 && weaponid <= 24)
                    {
                        CarData[vehicleid][carDoorHealth] = (CarData[vehicleid][carDoorHealth] - 15 <= 0) ? 0 : CarData[vehicleid][carDoorHealth] - 15;
                    }
                    if(weaponid >= 25 && weaponid <= 33)
                    {
                        CarData[vehicleid][carDoorHealth] = (CarData[vehicleid][carDoorHealth] - 30 <= 0) ? 0 : CarData[vehicleid][carDoorHealth] - 30;
                    }
                }
            }

            GetVehicleDamageStatus(vehicleid, CarData[vehicleid][carPanelStatus], CarData[vehicleid][carDoorsStatus], CarData[vehicleid][carLightsStatus], CarData[vehicleid][carTiresStatus]);
            switch(CarData[vehicleid][carDoorHealth])
            {
                case 0: UpdateVehicleDamageStatus(vehicleid, CarData[vehicleid][carPanelStatus], encode_doors(0, 0, 4, 0, 0, 0), CarData[vehicleid][carLightsStatus], CarData[vehicleid][carTiresStatus]);
                case 1 .. 20: UpdateVehicleDamageStatus(vehicleid, CarData[vehicleid][carPanelStatus], encode_doors(0, 0, 2, 0, 0, 0), CarData[vehicleid][carLightsStatus], CarData[vehicleid][carTiresStatus]);
            }

            if(!IsValidDynamic3DTextLabel(BreakInTextDraw[playerid]))
                BreakInTextDraw[playerid] = CreateDynamic3DTextLabel(sprintf("%i", CarData[vehicleid][carDoorHealth]), COLOR_WHITE, cX, cY, cZ, 10.0, .attachedvehicle = vehicleid, .playerid = playerid, .worldid = GetPlayerVirtualWorld(playerid), .interiorid = GetPlayerInterior(playerid));

            else UpdateDynamic3DTextLabelText(BreakInTextDraw[playerid], COLOR_WHITE, CarData[vehicleid][carDoorHealth]);

            CarData[vehicleid][carCooldown] = true;
            SetTimerEx("OnCoolDown", 1000, false, "i", vehicleid);

            if(CarData[vehicleid][carDoorHealth] <= 0)
            {
                CarData[vehicleid][carDoorHealth] = 0;

                CarData[vehicleid][carCooldown] = false;
                CarData[vehicleid][carPhysicalAttack] = false;

                //Vehicle unlocked:
                CarData[vehicleid][carLocked] = false;
                ToggleVehicleLock(vehicleid, false);

                //Updating label to let player know it's unlocked:
                UpdateDynamic3DTextLabelText(BreakInTextDraw[playerid], COLOR_DARKGREEN, "Kilit Kýrýldý");
                Streamer_Update(playerid);

                //Destroying the label with a timer:
                BreakInTDTimer[playerid] = SetTimerEx("OnBreakSuccess", 2000, false, "i", playerid);

                //Clearing variables:
                PlayerBreakInVehicle[playerid] = INVALID_VEHICLE_ID;
                PlayerBreakingIn[playerid] = 0;
                BreakInError[playerid] = 0;
                ActiveLockTD[playerid] = 0;
            }
        }
    }

    if(PRESSED(KEY_FIRE))
    {
        if(PlayerData[playerid][pSprayAllow] && GetPlayerWeapon(playerid) == 41 && PlayerData[playerid][pSprayTarget] != -1 && PlayerData[playerid][pSprayTarget] == Spray_Nearest(playerid))
        {
            KillTimer(PlayerData[playerid][pSprayTimer][1]);
            PlayerData[playerid][pSprayTimer][0] = SetTimerEx("SprayListener", 1000, true, "ii", playerid, 1);
        }
    }

    if(RELEASED(KEY_FIRE))
    {
        if(PlayerData[playerid][pSprayAllow] && GetPlayerWeapon(playerid) == 41 && PlayerData[playerid][pSprayTarget] != -1 && PlayerData[playerid][pSprayTarget] == Spray_Nearest(playerid))
        {
            KillTimer(PlayerData[playerid][pSprayTimer][0]);
            PlayerData[playerid][pSprayPoint] --;
            GameTextForPlayer(playerid, "~g~DURMA DEVAM ET!", 5000, 5);
            PlayerData[playerid][pSprayTimer][1] = SetTimerEx("SprayListener", 20000, true, "ii", playerid, 2);
        }
    }

    /*if(IsPlayerInAnyVehicle(playerid))
    {
        if(HOLDING(KEY_SPRINT))
        {
            new vehicleid = GetPlayerVehicleID(playerid);

            if(CarData[vehicleid][carTweak] == true)
            {
                if(gettime() - CarData[vehicleid][carRev] < 60)
                {
                    PlayerData[playerid][TempTweak] ++;
                    PlayNearbySound(playerid, 11200);
                    if(PlayerData[playerid][TempTweak] >= 20)
                    {
                        new rand = random(3);
                        if(rand != 0)
                        {
                            CarData[vehicleid][carTweak] = false;
                            PlayerData[playerid][TempTweak] = 0;
                            CarData[vehicleid][carRev] = 0;
                            cmd_ame(playerid, sprintf("%s model aracýn motorunu çalýþtýrýr.", ReturnVehicleName(vehicleid)));
                            ToggleVehicleEngine(vehicleid, true);
                            CarEngine[vehicleid] = true;
                        }
                        else
                        {
                            GameTextForPlayer(playerid, "~r~BASARISIZ OLDU~n~~w~TEKRAR DENE!", 3000, 4);
                            PlayerData[playerid][TempTweak] = 0;
                            CarData[vehicleid][carRev] = 0;
                        }
                    }
                }
            }
        }

        if(RELEASED(KEY_JUMP) && RELEASED(KEY_SPRINT))
        {
            if(CarData[ GetPlayerVehicleID(playerid) ][carTweak])
            {
                PlayerData[playerid][TempTweak] = 0;
            }
        }
    }*/

    if(PlayerData[playerid][pInTuning])
   	{
    		new string[64];
  		new vehID = GetPlayerVehicleID(playerid);
  		new categoryTuning = PlayerData[playerid][pTuningCategoryID];

  		if(newkeys & KEY_LOOK_RIGHT || newkeys & KEY_LOOK_LEFT)
  		{
  			PlayerData[playerid][pTuningCategoryID] = (newkeys & KEY_LOOK_RIGHT) ? categoryTuning + 1 : categoryTuning - 1;

  			if(PlayerData[playerid][pTuningCategoryID] > 10)PlayerData[playerid][pTuningCategoryID] = 10;
  			if(PlayerData[playerid][pTuningCategoryID] < 0)PlayerData[playerid][pTuningCategoryID] = 0;

  			categoryTuning = PlayerData[playerid][pTuningCategoryID];

  			if(categoryTuning != 0 && categoryTuning != 10)
  			{
  	  			format(string, sizeof(string), "~y~%s~w~ (~<~) %s (~>~)~y~ %s", TuningCategories[categoryTuning - 1], TuningCategories[categoryTuning], TuningCategories[categoryTuning + 1]);
  	     		PlayerTextDrawSetString(playerid, TDTuning_Component[playerid], string);

  			}
  	        else
  	        {
  				format(string, sizeof(string), (!categoryTuning) ? ("%s (~>~)~y~ %s") : ("~y~%s~w~ (~>~) %s"), TuningCategories[(newkeys & KEY_LOOK_RIGHT) ? categoryTuning - 1 : categoryTuning], TuningCategories[(newkeys & KEY_LOOK_RIGHT) ? categoryTuning : categoryTuning + 1]);
  				PlayerTextDrawSetString(playerid, TDTuning_Component[playerid], string);
  			}

        PlayerTextDrawShow(playerid, TDTuning_Component[playerid]);
  			Tuning_SetDisplay(playerid);
  		}
  		else if(newkeys & KEY_FIRE || newkeys & KEY_HANDBRAKE)
  		{
  		    new validCount = GetVehicleComponentCount(categoryTuning, CarData[vehID][carModel]);
  		    new tuningCount = PlayerData[playerid][pTuningCount];

  		    if(tuningCount && (newkeys & KEY_FIRE && tuningCount != validCount) || (newkeys & KEY_HANDBRAKE && tuningCount != 0 && tuningCount != 1) && validCount)
  		    {
  			    PlayerData[playerid][pTuningCount] = (newkeys & KEY_FIRE) ? tuningCount + 1 : tuningCount - 1;
            Tuning_SetDisplay(playerid, PlayerData[playerid][pTuningCount]);
  			}
  			else return 1;
  		}
  		else if(newkeys & KEY_YES)
  		{
  			if(!PlayerData[playerid][pTuningCount]) return SendErrorMessage(playerid, "Satýn alýnabilecek bir modifiye parçasý seçmemiþsiniz.");

  		    new componentPrice = (categoryTuning == 10) ? 2500 : GetComponentPrice(PlayerData[playerid][pTuningComponent]);

  			if(componentPrice > PlayerData[playerid][pMoney])
  				return SendErrorMessage(playerid, "Bu parçayý satýn almak için yeterli paran yok.");


  			if(categoryTuning == 10)
  			{
  					GiveMoney(playerid, -componentPrice);
     				ChangeVehiclePaintjob(vehID, PlayerData[playerid][pTuningComponent]);
  	        CarData[vehID][carPaintjob] = PlayerData[playerid][pTuningComponent];
  	        Car_Save(vehID);
  			}
  			else Tuning_AddComponent(vehID, PlayerData[playerid][pTuningComponent], componentPrice);


  			PlayerPlaySound(playerid, 1134, 0, 0, 0);
  		}
  		else if(newkeys & KEY_NO) Tuning_ExitDisplay(playerid);
  	}

    if(PRESSED(KEY_FIRE) && GetPlayerWeapon(playerid) == 42)
    {
        static
            Float:fX,
            Float:fY,
            Float:fZ;

        foreach(new i : Fires) if (!FireData[i][f_is_extinguished])
        {
            GetDynamicObjectPos(FireData[i][fire_object], fX, fY, fZ);
            if (IsPlayerInRangeOfPoint(playerid, 4.0, fX, fY, fZ))
            {
                SetTimerEx("DestroyWater", 2000, false, "d", CreateDynamicObject(18744, fX, fY, fZ - 0.2, 0.0, 0.0, 0.0));
                FireData[i][f_is_extinguished] = true;
                Fire_Destroy(i);
            }
        }
    }

    if (PRESSED(KEY_FIRE) && (GetVehicleModel(GetPlayerVehicleID(playerid)) == 407 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 544))
    {
        static
            Float:fX,
            Float:fY,
            Float:fZ,
            Float:fVector[3],
            Float:fCamera[3];

        GetPlayerCameraFrontVector(playerid, fVector[0], fVector[1], fVector[2]);
        GetPlayerCameraPos(playerid, fCamera[0], fCamera[1], fCamera[2]);

        foreach(new i : Fires) if (!FireData[i][f_is_extinguished])
        {
            GetDynamicObjectPos(FireData[i][fire_object], fX, fY, fZ);
            if (IsPlayerInRangeOfPoint(playerid, 20.0, fX, fY, fZ))
            {
                if (DistanceCameraTargetToLocation(fCamera[0], fCamera[1], fCamera[2], fX, fY, fZ + 2.5, fVector[0], fVector[1], fVector[2]) < 12.0)
                {
                    SetTimerEx("DestroyWater", 2000, false, "d", CreateDynamicObject(18744, fX, fY, fZ - 0.2, 0.0, 0.0, 0.0));
                    FireData[i][f_is_extinguished] = true;
                    Fire_Destroy(i);
                }
            }
        }
    }

    return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    new vID = GetPlayerVehicleID(playerid);
    switch(newstate)
    {
        case PLAYER_STATE_DRIVER:
        {
            /*if(playerEnteringVehicle[playerid] != GetPlayerVehicleID(playerid))
            {
                LogPlayerAction(playerid, "Car-Warp hilesi kullandý.");
                SendClientMessageToAll(COLOR_ADM, sprintf("AdmCmd: %s isimli oyuncu The Machine tarafýndan atýldý. Sebep: Car-Warp Hilesi.", ReturnName(playerid)));
                KickEx(playerid);
                print("carwarp 1");
                return 1;
            }*/

            playerEnteringVehicle[playerid] = INVALID_VEHICLE_ID;

            if(CarData[vID][carLocked] && !PlayerData[playerid][pAdminDuty])
            {
                adminWarn(1, sprintf("%s(%i) #%d numaralý kilitli olan araca þoför olarak bindi. (/awp %i)", ReturnName(playerid, 1), playerid, vID, playerid));
                RemovePlayerFromVehicle(playerid);
                ClearAnimations(playerid);
                return 1;
            }

            CarData[vID][carlastDriver] = PlayerData[playerid][pSQLID];

            if(!PlayerData[playerid][pDriversLicense]) SendClientMessage(playerid, COLOR_ADM, "Ehliyetsiz araç sürüyorsun, teste girerek ehliyet edinebilirsin.");
            if(!CarEngine[vID] && !NoEngineCar(vID)) SendClientMessage(playerid, COLOR_DARKGREEN, "Motor kapalý durumda. (/motor)");

            for(new i = 0; i < sizeof dmv_vehicles; i++) if(GetPlayerVehicleID(playerid) == dmv_vehicles[i])
            {
                SendClientMessage(playerid, COLOR_WHITE, "Ehliyet Testi: /ehliyet yazarak sýnavý baþlatabilirsin. Eðer baþarýlý olursan $350 tutacak.");
            }

            for(new i = 0; i < sizeof taxi_vehicles; i++) if(GetPlayerVehicleID(playerid) == taxi_vehicles[i])
            {
                SendClientMessage(playerid, COLOR_WHITE, "Taksi Testi: /ehliyet yazarak taksi sýnavýný baþlatabilirsin. Eðer baþarýlý olursan $1,000 tutacak.");
            }

            if(CarData[vID][carOwnerID] == PlayerData[playerid][pSQLID])
            {
                SendClientMessageEx(playerid, COLOR_WHITE, "%s adlý aracýna hoþ geldin.", ReturnVehicleName(vID));
                if(CountVehicleFines(vID) > 0)
                {
                    SendClientMessageEx(playerid, COLOR_ADM, "[!] Aracýnýn %i adet toplamda $%s miktarýnda ödenmemiþ cezasý bulunuyor.", CountVehicleFines(vID), MoneyFormat(CountVehicleFinesTotal(vID)));
                    SendClientMessage(playerid, COLOR_ADM, "            (( Listelemek için /arac cezalar ))");
                }
            }

            if(IsValidRentalCar(vID))
            {
                if(!CarData[vID][carRentedBy])
                {
                    SendClientMessageEx(playerid, COLOR_WHITE, "Araç Kiralama Servisi: %s model aracý $%s'a kiralayabilirsin. (/arackirala)", ReturnVehicleName(vID), MoneyFormat(CarData[vID][carRentalPrice]));
                    SendClientMessage(playerid, COLOR_DARKGREEN, "Bu aracý kiraladýðýnda /kilit özelliði aktif olacaktýr.");
                }
                //else SendClientMessageEx(playerid, COLOR_WHITE, "Araç Kiralama Servisi: %s model aracý baþkasý tarafýndan kiralanmýþ.", ReturnVehicleName(vID));
            }

            if(CarData[vID][carXMR] && CarData[vID][carXMROn])
            {
                PlayAudioStreamForPlayer(playerid, CarData[vID][carXMRUrl]);
            }


            new tempVID = GetPVarInt(playerid, "lastVehicle"),
            tempSEAT = GetPVarInt(playerid, "lastSeat");

            SetPVarInt(playerid, "lastVehicle", vID);
            SetPVarInt(playerid, "lastSeat", GetPlayerVehicleSeat(playerid));

            if(tempVID != vID || (tempVID == vID && tempSEAT != GetPVarInt(playerid, "lastSeat")))
            {
                foreach (new i : Player) {
                    if (SpectateID[i] == playerid) {
                        PlayerSpectateVehicle(i, vID, SPECTATE_MODE_NORMAL);
                        SpectateType[i] = SPECTATE_TYPE_VEHICLE;
                    }
                }
            }

            SetPlayerArmedWeapon(playerid, 0);
        }
        case PLAYER_STATE_PASSENGER:
        {
            if(playerEnteringVehicle[playerid] != GetPlayerVehicleID(playerid))
            {
                LogPlayerAction(playerid, "Car-Warp hilesi kullandý.");
                SendClientMessageToAll(COLOR_ADM, sprintf("AdmCmd: %s isimli oyuncu The Machine tarafýndan atýldý. Sebep: Car-Warp Hilesi.", ReturnName(playerid)));
                KickEx(playerid);
                print("carwarp 2");
                return 1;
            }

            playerEnteringVehicle[playerid] = INVALID_VEHICLE_ID;

            if(CarData[vID][carLocked] && !PlayerData[playerid][pAdminDuty])
            {
                adminWarn(1, sprintf("%s(%i) #%d numaralý kilitli olan araca yolcu olarak bindi. (/awp %i)", ReturnName(playerid, 1), playerid, vID, playerid));
                RemovePlayerFromVehicle(playerid);
                ClearAnimations(playerid);
                return 1;
            }

            CarData[vID][carlastPassenger] = PlayerData[playerid][pSQLID];

            if(GetPlayerWeapon(playerid) == WEAPON_DEAGLE || GetPlayerWeapon(playerid) == WEAPON_SNIPER)
                SetPlayerArmedWeapon(playerid, 0);

            if(CarData[vID][carXMR] && CarData[vID][carXMROn])
            {
                PlayAudioStreamForPlayer(playerid, CarData[vID][carXMRUrl]);
            }

            new tempVID = GetPVarInt(playerid, "lastVehicle"),
                tempSEAT = GetPVarInt(playerid, "lastSeat");

            SetPVarInt(playerid, "lastVehicle", vID);
            SetPVarInt(playerid, "lastModel", GetVehicleModel(vID));
            SetPVarInt(playerid, "lastSeat", GetPlayerVehicleSeat(playerid));
            SetPVarInt(playerid, "lastPassangerVehicle", vID);

            if(tempVID != GetPVarInt(playerid, "lastVehicle") || (tempVID == GetPVarInt(playerid, "lastVehicle") && tempSEAT != GetPVarInt(playerid, "lastSeat")))
            {
                foreach (new i : Player) {
                    if (SpectateID[i] == playerid) {
                        PlayerSpectateVehicle(i, vID, SPECTATE_MODE_NORMAL);
                        SpectateType[i] = SPECTATE_TYPE_VEHICLE;
                    }
                }
            }
        }
        case PLAYER_STATE_ONFOOT:
        {
            if(g_aVehicleSpawned[playerid] != INVALID_VEHICLE_ID)
            {
                if(IsValidVehicle(g_aVehicleSpawned[playerid]) && !CarData[g_aVehicleSpawned[playerid]][carID])
                {
                    DestroyVehicle(g_aVehicleSpawned[playerid]);
                }

                if(!PlayerPurchasingVehicle[playerid]) ResetDealershipVars(playerid);
            }

            if(PlayerData[playerid][pUnscrambling])
            {
                PlayerData[playerid][pUnscrambling] = false;
                PlayerData[playerid][pUnscrambleID] = 0;
                PlayerData[playerid][pUnscramblerTime] = 111;
                PlayerData[playerid][pScrambleFailed] = 0;
                PlayerData[playerid][pScrambleSuccess] = 0;

                KillTimer(PlayerData[playerid][pUnscrambleTimer]);
                ShowUnscrambleTextdraw(playerid, false);
            }

            if(PlayerData[playerid][pDrivingTest])
            {
                GameTextForPlayer(playerid, "~w~Ehliyet Testin Iptal Oldu", 4000, 1);
                CancelDrivingTest(playerid);
            }

            if(PlayerData[playerid][pTaxiDrivingTest])
            {
                GameTextForPlayer(playerid, "~w~Taksi Ehliyet Testin Iptal Oldu", 4000, 1);
                CancelTaxiDrivingTest(playerid);
            }

            StopAudioStreamForPlayer(playerid);


            foreach (new i : Player)
            {
                if (SpectateID[i] == playerid) {
                    PlayerSpectatePlayer(i, playerid, SPECTATE_MODE_NORMAL);
                    SpectateType[i] = SPECTATE_TYPE_PLAYER;
                }
            }

            SetPVarInt(playerid, "lastPassangerVehicle", -1);
        }
        case PLAYER_STATE_SPECTATING:
        {
            new prev = GetPreviousPlayer(playerid);

            if (prev == -1) {
                foreach (new i : Player) {
                    if (SpectateID[i] == playerid) {
                        StopSpectate(i);
                    }
                }
            }
            else {
                foreach (new i : Player) {
                    if (SpectateID[i] == playerid) {
                        StartSpectate(i, prev);
                    }
                }
            }

            Iter_Remove(SpectatePlayers, playerid);
        }
    }

    return true;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
    if(PlayerData[playerid][pFishCheckpoint])
    {
        cmd_ame(playerid, "oltasýný suyun derinliklerine doðru sallar.");
        TogglePlayerControllable(playerid, 0);
        PlayerData[playerid][pFishTime] = 6;

        PlayerPlaySound(playerid, 1138, 0.0, 0.0, 0.0);
        DisablePlayerRaceCheckpoint(playerid);
    }
    return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
    if(PlayerData[playerid][pCheckpoint] == -1)
    {
        if(PlayerData[playerid][pCarCheckpoint]) {
            GameTextForPlayer(playerid, "~p~Checkpointi Buldun!", 3000, 3);
        }
        PlayerPlaySound(playerid, 1138, 0.0, 0.0, 0.0);
        DisablePlayerCheckpoint(playerid);
    }

    if(PlayerData[playerid][pTaxiDrivingTest])
    {
        if(PlayerData[playerid][pTestStage] < sizeof(g_arrTaxiDrivingCheckpoints)-1)
        {
            switch(PlayerData[playerid][pTestStage])
            {
                case 0:
                {
                    SendClientMessage(playerid, COLOR_WHITE, "Taksi sýnavýna hoþgeldin! Ekrana gelecek mesajlara dikkat edin.");
                    PlayerData[playerid][pTestTime] += 135;
                }
                case 1: SendClientMessage(playerid, COLOR_WHITE, "Taksi sýnavýný baþarýyla geçmek için belirtilen rotalarý zamanýnda bitirmelisin.");
                case 2: SendClientMessage(playerid, COLOR_WHITE, "Buradaki amaç bir noktadan yolcuyu alýp diðer noktaya yetiþtirmektir.");
                case 3, 6, 9, 12, 15, 18, 21, 24:
                {
                    SendClientMessage(playerid, COLOR_YELLOW, "|_______________Taksi Çaðrýsý_______________|");
                    SendClientMessageEx(playerid, COLOR_YELLOW, "Arayan: Taksi Eðitmeni Telefon: %i", randomEx(4000, 9500));
                    SendClientMessageEx(playerid, COLOR_YELLOW, "Lokasyon: %s", g_arrTaxiDrivingBotTexts[PlayerData[playerid][pTestStage]]);

                    if(PlayerData[playerid][pTestStage] == 3) {
                        SendClientMessage(playerid, COLOR_ADM, "ÝPUCU: Düzgün sürün ve rotalarý sakince takip edin.");
                    }
                }
                case 4, 7, 10, 13, 16, 19, 22, 25:
                {
                    new r = random(sizeof(g_arrTaxiDrivingPickupTexts));
                    SendClientMessageEx(playerid, COLOR_SOFTPINK, "Yolcu: %s", g_arrTaxiDrivingPickupTexts[r]);
                    SendClientMessageEx(playerid, COLOR_SOFTPINK, "Yolcu: %s", g_arrTaxiDrivingBotTexts[PlayerData[playerid][pTestStage]]);
                }
                case 5, 8, 11, 14, 17, 20, 23, 26:
                {
                    new rtext = random(sizeof(g_arrTaxiDrivingTexts));
                    SendClientMessageEx(playerid, COLOR_SOFTPINK, "Yolcu: %s", g_arrTaxiDrivingTexts[rtext]);

                    new r = randomEx(0, 10);
                    switch(r)
                    {
                        case 0..3:
                        {
                            SendClientMessageEx(playerid, COLOR_ADM, "[Yolcu mutsuz gözüküyor. - süre düþürüldü]");
                            PlayerData[playerid][pTestTime] -= 10;
                        }
                        case 5..10:
                        {
                            SendClientMessageEx(playerid, COLOR_ADM, "[Beklentileri karþýladýn. - süre eklendi]");
                            PlayerData[playerid][pTestTime] += 155;
                        }
                    }
                }
            }

            PlayerData[playerid][pTestStage]++;
            SetPlayerCheckpoint(playerid, g_arrTaxiDrivingCheckpoints[PlayerData[playerid][pTestStage]][0], g_arrTaxiDrivingCheckpoints[PlayerData[playerid][pTestStage]][1], g_arrTaxiDrivingCheckpoints[PlayerData[playerid][pTestStage]][2], 3.0);
        }
        else
        {
            static Float:health;
            GetVehicleHealth(GetPlayerVehicleID(playerid), health);

            if (health < 950.0) SendServerMessage(playerid, "Araç fazla hasar aldýðý için taksi testi baþarýsýz sayýldý.");
            else
            {
                PlayerData[playerid][pJob] = TAXI_JOB;
                SaveSQLInt(PlayerData[playerid][pSQLID], "players", "Job", TAXI_JOB);
                GameTextForPlayer(playerid, "~w~Tebrikler!~n~Artik bir taksi soforusun!", 5000, 1);
                GiveMoney(playerid, -1000);
            }

            CancelTaxiDrivingTest(playerid);
            return 1;
        }

    }

    if(PlayerData[playerid][pDrivingTest])
    {
        PlayerData[playerid][pTestStage]++;

        if(PlayerData[playerid][pTestStage] < sizeof(g_arrDrivingCheckpoints))
        {
            SendClientMessage(playerid, COLOR_GREY, "Sürüþ Eðitmeni: Bir sonraki kontrol noktasýna gidin.");
            SetPlayerCheckpoint(playerid, g_arrDrivingCheckpoints[PlayerData[playerid][pTestStage]][0], g_arrDrivingCheckpoints[PlayerData[playerid][pTestStage]][1], g_arrDrivingCheckpoints[PlayerData[playerid][pTestStage]][2], 3.0);
        }
        else
        {
            static Float:health;
            GetVehicleHealth(GetPlayerVehicleID(playerid), health);

            if (health < 950.0) SendServerMessage(playerid, "Araç fazla hasar aldýðý için test baþarýsýz sayýldý.");
            else
            {
                PlayerData[playerid][pDriversLicense] = true;
                SaveSQLInt(PlayerData[playerid][pSQLID], "players", "DriversLicense", 1);
                GameTextForPlayer(playerid, "~w~Tebrikler!~n~Ehliyeti kaptin!", 5000, 1);
                GiveMoney(playerid, -350);
            }

            CancelDrivingTest(playerid);
        }
    }
    return true;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
    if (PlayerData[playerid][pMaskOn])
    {
        if(!PlayerData[forplayerid][pAdminDuty])
        {
            ShowPlayerNameTagForPlayer(forplayerid, playerid, 0);
        }
    }
    return true;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
    foreach (new i : Player)
    {
        if (SpectateID[i] == playerid)
        {
            //SetPlayerInterior(i, newinteriorid);
            SetTimerEx("SpectateUpdate", 500, false, "ii", i, playerid);
        }
    }
    return 1;
}

public OnPlayerPickUpDynamicPickup(playerid, pickupid)
{
/*  foreach(new i : Businessses)
    {
        if(GetPlayerVirtualWorld(playerid) == BusinessData[b][businessBankPickupWorld] && BusinessData[b][businessType] == BIZ_BANK)
        {
            if(pickupid == BusinessData[b][businessBankPickup])
            {
                if (!PlayerData[playerid][pPaycheck])
                {
                    break;
                }
                else
                {
                    PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
                    GiveMoney(playerid, PlayerData[playerid][pPaycheck]);
                    GameTextForPlayer(playerid, sprintf("~w~Paycheck:~n~~g~$%d", PlayerData[playerid][pPaycheck]), 4000, 4);
                    LogPlayerAction(playerid, sprintf("$%s maaþ aldý. [Banka: $%i, Üstündeki: $%i]", MoneyFormat(PlayerData[playerid][pPaycheck]), PlayerData[playerid][pBank], PlayerData[playerid][pMoney]));
                    PlayerData[playerid][pPaycheck] = 0;
                }
            }
        }
    }*/
    return true;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
    new bool: _handled = false;

    _handled = Pkr_PlayerReadyTextDrawClick(playerid, clickedid);

    if(!_handled)
        Pkr_PlayerMenuTextDrawClick(playerid, clickedid);

    if(clickedid == Text:INVALID_TEXT_DRAW)
    {
      if(GetPVarInt(playerid, "OnPlayerUseMDC") == 1)
        {
          MDC_Hide(playerid);
          SetPVarInt(playerid, "OnPlayerUseMDC", 0);
          return 1;
        }

        if(GetPVarInt(playerid, "Viewing_CharacterList"))
        {
            Selection_Hide(playerid);
            KickEx(playerid);
            return 1;
        }

        if(GetPVarInt(playerid, "Viewing_OwnedCarList"))
        {
            PlayerVehicles_Hide(playerid);
            PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
            SetPVarInt(playerid, "Viewing_OwnedCarList", 0);
            CancelSelectTextDraw(playerid);
            return 1;
        }

        if(GetPVarInt(playerid, "Viewing_DealershipCats"))
        {
            Dealership_Hide(playerid);
            PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
            SetPVarInt(playerid, "Viewing_DealershipCats", 0);
            CancelSelectTextDraw(playerid);
            return 1;
        }

        if(GetPVarInt(playerid, "Viewing_Dealership"))
        {
            //SetPVarInt(playerid, "dealership_category_page", 0);

            Dealership_Show(playerid, 0);
            SelectTextDraw(playerid, COLOR_DARKGREEN);
            PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
            return 1;
        }

        if(PlayerData[playerid][pUseCaseGUI])
        {
            PhoneCase_HideUI(playerid);
            return 1;
        }

        if(GetPVarInt(playerid, "ColorSelect") != 0)
        {
            DisplayColors(playerid, false);
            ShowDealerAppend(playerid);
            return 1;
        }

        if(GetPVarInt(playerid, "Viewing_FoodList") == 1)
        {
            Food_Menu(playerid, false);
            return 1;
        }

        if(GetPVarInt(playerid, "Viewing_StoreList") == 1)
        {
            SetPVarInt(playerid, "Viewing_StoreList", 0);
            CancelSelectTextDraw(playerid);
            Market_Hide(playerid);
            return 1;
        }
    }
    return false;
}

Server:CallOnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{

    if(GetPVarInt(playerid, "Viewing_StoreList"))
    {
        for(new x = 0; x < sizeof(MarketData); x ++)
        {
            if(playertextid == Market_Selectable[playerid][x])
            {
                if(PlayerData[playerid][pItemCache][x] != 1)
                {
                    PlayerData[playerid][pItemCache][x] = 1;
                    SetPVarInt(playerid, "PriceCount", (GetPVarInt(playerid, "PriceCount") + MarketData[x][ItemPrice]));
                    PlayerTextDrawSetString(playerid, Market_Textdraw[playerid][5], sprintf("%s", MarketData[x][ItemName]));
                    PlayerTextDrawSetString(playerid, Market_Textdraw[playerid][7], sprintf("Hesap ~g~$%i", GetPVarInt(playerid, "PriceCount")));
                }
                return 1;
            }
        }

        if(playertextid == Market_Textdraw[playerid][2])
        {
            SetPVarInt(playerid, "Viewing_StoreList", 0);
            CancelSelectTextDraw(playerid);
            Market_Hide(playerid);
        }

        if(playertextid == Market_Textdraw[playerid][3])
        {
            if(!GetPVarInt(playerid, "PriceCount")) return PlayerTextDrawSetString(playerid, Market_Textdraw[playerid][7], "Hesap ~r~BOS");

            if(PlayerData[playerid][pMoney] < GetPVarInt(playerid, "PriceCount"))
                return SendErrorMessage(playerid, "Yeterli paran yok. Tutar: $%i", GetPVarInt(playerid, "PriceCount"));

            for(new i = 0; i < 10; i ++)
            {
                if(PlayerData[playerid][pItemCache][i] == 1)
                {
                    Player_PurchaseItem(playerid, i);

                    PlayerData[playerid][pItemCache][i] = 0;
                }
            }

            SendClientMessageEx(playerid, COLOR_GREY, "Satýn alým iþlemi tamamlandý.");
            GiveMoney(playerid, -GetPVarInt(playerid, "PriceCount"));
            DeletePVar(playerid, "PriceCount");

            SetPVarInt(playerid, "Viewing_StoreList", 0);
            CancelSelectTextDraw(playerid);
            Market_Hide(playerid);
        }

        if(playertextid == Market_Textdraw[playerid][4]) // temizle
        {
            for(new i = 0; i < 10; i ++) PlayerData[playerid][pItemCache][i] = 0;
            PlayerTextDrawSetString(playerid, Market_Textdraw[playerid][7], "Hesap ~r~BOS");
            DeletePVar(playerid, "PriceCount");
        }
    }

    if(GetPVarInt(playerid, "Viewing_CharacterList"))
    {
        for(new x = 0; x < 3; x++)
        {
            if(playertextid == Character_Preview[playerid][x])
            {
                Selection_Hide(playerid);
                //TogglePlayerSpectating(playerid, false);
                PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
                LoadPlayerData(playerid, CharacterHolder[playerid][x]);
                return 1;
            }
        }
    }

    if(GetPVarInt(playerid, "Viewing_OwnedCarList"))
    {
        new curpage = GetPVarInt(playerid, "playervehicles_page");

        if(playertextid == Dealership_Next_Arrow[playerid])
        {
            if(curpage < (GetNumberOfPages(GetPVarInt(playerid, "playervehicles_count")) - 1))
            {
                PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
                SetPVarInt(playerid, "playervehicles_page", curpage + 1);
                PlayerVehicles_Show(playerid);
            } else {
                PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
            }
            return 1;
        }

        if(playertextid == Dealership_Prev_Arrow[playerid])
        {
            if(curpage > 0) {
                PlayerPlaySound(playerid, 1084, 0.0, 0.0, 0.0);
                SetPVarInt(playerid, "playervehicles_page", curpage - 1);
                PlayerVehicles_Show(playerid);
            } else {
                PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
            }
            return 1;
        }

        for(new x = 0; x < DEALERSHIP_PER_PAGE; x++)
        {
            if(playertextid == Dealership_Model[playerid][x])
            {
                PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
                //HandlePlayerItemSelection(playerid, DealershipHolder[playerid][x]);

                if(_has_vehicle_spawned[playerid])
                {
                    SendClientMessage(playerid, COLOR_ADM, "SERVER: Daha önceden bir araç spawnlamýþsýn.");

                    PlayerVehicles_Hide(playerid);
                    SetPVarInt(playerid, "Viewing_OwnedCarList", 0);
                    CancelSelectTextDraw(playerid);
                    return 1;
                }

                PlayerVehicles_Hide(playerid);
                SetPVarInt(playerid, "Viewing_OwnedCarList", 0);
                CancelSelectTextDraw(playerid);
                LoadVehicles(playerid, DealershipHolder[playerid][x]);
                return 1;
            }
        }
    }

    if(GetPVarInt(playerid, "Viewing_DealershipCats") == 1)
    {
        new curpage = GetPVarInt(playerid, "dealership_category_page");

        if(playertextid == Dealership_Next_Arrow[playerid])
        {
            if(curpage < (GetNumberOfPages(Iter_Count(DealershipCats)) - 1))
            {
                PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
                SetPVarInt(playerid, "dealership_category_page", curpage + 1);
                Dealership_Show(playerid, 0);
            } else {
                PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
            }
            return 1;
        }

        if(playertextid == Dealership_Prev_Arrow[playerid])
        {
            if(curpage > 0) {
                PlayerPlaySound(playerid, 1084, 0.0, 0.0, 0.0);
                SetPVarInt(playerid, "dealership_category_page", curpage - 1);
                Dealership_Show(playerid, 0);
            } else {
                PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
            }
            return 1;
        }

        for(new x = 0; x < DEALERSHIP_PER_PAGE; x++)
        {
            if(playertextid == Dealership_Model[playerid][x])
            {
                PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
                HandlePlayerItemSelection(playerid, DealershipHolder[playerid][x]);
                return 1;
            }
        }
    }

    if(GetPVarInt(playerid, "Viewing_Dealership") == 1)
    {
        new curpage = GetPVarInt(playerid, "dealership_page");

        if(playertextid == Dealership_Next_Arrow[playerid])
        {
            if(curpage < (GetNumberOfPages(GetPVarInt(playerid, "dealership_count")) - 1))
            {
                SetPVarInt(playerid, "dealership_page", curpage + 1);
                Dealership_Show(playerid, 1);
                PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
            } else {
                PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
            }
            return 1;
        }

        if(playertextid == Dealership_Prev_Arrow[playerid])
        {
            if(curpage > 0) {
                SetPVarInt(playerid, "dealership_page", curpage - 1);
                Dealership_Show(playerid, 1);
                PlayerPlaySound(playerid, 1084, 0.0, 0.0, 0.0);
            } else {
                PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
            }
            return 1;
        }

        for(new x = 0; x < DEALERSHIP_PER_PAGE; x++)
        {
            if(playertextid == Dealership_Model[playerid][x])
            {
                new d = PlayerData[playerid][pAtDealership];

                foreach(new i : Dealerships)
                {
                    if(DealershipData[i][DealershipModel] == DealershipHolder[playerid][x])
                    {
                        SubDealershipHolder[playerid] = i;
                    }
                }

                SetPVarInt(playerid, "dealership_page", 0);
                SetPVarInt(playerid, "dealership_count", 0);
                SetPVarInt(playerid, "dealership_category_page", 0);
                SetPVarInt(playerid, "Viewing_DealershipCats", 0);
                SetPVarInt(playerid, "Viewing_Dealership", 0);
                PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
                CancelSelectTextDraw(playerid);
                Dealership_Hide(playerid);

                if(PlayerData[playerid][pAdmin] < 1)
                {
                    if(IsABike(DealershipData[SubDealershipHolder[playerid]][DealershipModel]) && !PlayerData[playerid][pDonator])
                        return SendErrorMessage(playerid, "Bu aracý sadece donatorler satýn alabilir.");

                    if(DealershipData[SubDealershipHolder[playerid]][DealershipIsEnabled] == 0)
                        return SendErrorMessage(playerid, "Bu aracý sadece yöneticiler satýn alabilir.");
                }

                if(DealershipData[SubDealershipHolder[playerid]][DealershipPrice] > PlayerData[playerid][pMoney])
                    return SendErrorMessage(playerid, "Bunu satýn alabilmek için $%s gerekiyor. (Paran: $%s)", MoneyFormat(DealershipData[SubDealershipHolder[playerid]][DealershipPrice]), MoneyFormat(PlayerData[playerid][pMoney]));

                g_aVehicleSpawned[playerid] = CreateVehicle(DealershipData[SubDealershipHolder[playerid]][DealershipModel], BusinessData[d][ExitPos][0], BusinessData[d][ExitPos][1], BusinessData[d][ExitPos][2], 90, 0, 0, -1);
                PutPlayerInVehicle(playerid, g_aVehicleSpawned[playerid], 0);

                g_aTotalAmount[playerid] = DealershipData[SubDealershipHolder[playerid]][DealershipPrice];
                ShowPlayerDialog(playerid, DIALOG_DEALERSHIP_APPEND, DIALOG_STYLE_LIST, sprintf("%s - {33AA33}$%s", DealershipData[SubDealershipHolder[playerid]][DealershipModelName], MoneyFormat(g_aTotalAmount[playerid])), "Alarm\nKilit\nImmobiliser\nSigorta\nRenkler\nXM Yok\n{FFFF00}Satýnal", "Seç", "<<");
                TogglePlayerControllable(playerid, 0);
                return 1;
            }
        }
    }

    if(GetPVarInt(playerid, "Viewing_FoodList") == 1)
    {
        new
            id = IsPlayerInBusiness(playerid);

        if(playertextid == FoodOrder[playerid][4])
        {
            GiveMoney(playerid, -BusinessData[id][BusinessFoodPrice][0]);
            BusinessData[id][BusinessCashbox] += BusinessData[id][BusinessFoodPrice][0];
            BusinessData[id][BusinessProduct] -= 1;

            OnPlayerFoodPurchase(playerid, BusinessData[id][BusinessFood][0]);
            Food_Menu(playerid, false);
            return 1;
        }

        if(playertextid == FoodOrder[playerid][5])
        {
            GiveMoney(playerid, -BusinessData[id][BusinessFoodPrice][1]);
            BusinessData[id][BusinessCashbox] += BusinessData[id][BusinessFoodPrice][1];
            BusinessData[id][BusinessProduct] -= 2;

            OnPlayerFoodPurchase(playerid, BusinessData[id][BusinessFood][1]);
            Food_Menu(playerid, false);
            return 1;
        }

        if(playertextid == FoodOrder[playerid][6])
        {
            GiveMoney(playerid, -BusinessData[id][BusinessFoodPrice][2]);
            BusinessData[id][BusinessCashbox] += BusinessData[id][BusinessFoodPrice][2];
            BusinessData[id][BusinessProduct] -= 3;

            OnPlayerFoodPurchase(playerid, BusinessData[id][BusinessFood][2]);
            Food_Menu(playerid, false);
            return 1;
        }

        if(playertextid == FoodOrder[playerid][3])
        {
            return Food_Menu(playerid, false);
        }
    }

    if(PlayerData[playerid][pUseCaseGUI])
    {
        static clicked_id = -1;
        for(new i; i <= 6; i++) if (playertextid == PhoneCase[playerid][i])
        {
            clicked_id = i;
            break;
        }

        if (clicked_id != -1)
        {
            PlayerTextDrawHide(playerid, PhoneCase[playerid][8]);
            PlayerTextDrawSetPreviewModel(playerid, PhoneCase[playerid][8], g_aPhoneCaseData[clicked_id][caseModel]);
            PlayerTextDrawShow(playerid, PhoneCase[playerid][8]);
        }

        if(playertextid == PhoneCase[playerid][9])
        {
            ConfirmDialog(playerid, "Onay", "$5,000 karþýlýðýnda yeni bir telefon ve kýlýfý almak istiyor musun?", "OnPlayerNewPhone", clicked_id);
        }
    }

    if(GetPVarInt(playerid, "ColorSelect") != 0)
    {
        new offset = GetPVarInt(playerid, "index_color") * 8;

        for(new i; i < 8; i ++)
        {
            if(playertextid == ColorPanel[playerid][i])
            {
                if(GetPVarInt(playerid, "ColorSelect") == 1)
                {
                    g_aVehicleColor[playerid][0] = i+offset;
                    ChangeVehicleColor(g_aVehicleSpawned[playerid], i+offset, g_aVehicleColor[playerid][1]);
                }
                else if(GetPVarInt(playerid, "ColorSelect") == 2)
                {
                    g_aVehicleColor[playerid][1] = i+offset;
                    ChangeVehicleColor(g_aVehicleSpawned[playerid], g_aVehicleColor[playerid][0], i+offset);
                }
            }
        }
        if(playertextid == ColorPanel[playerid][9])
        {
            showNextColor(playerid);
        }
        if(playertextid == ColorPanel[playerid][8])
        {
            if(GetPVarInt(playerid, "ColorSelect") == 1)
            {
                SetPVarInt(playerid, "index_color", 0);
                for(new i; i < 8; i ++)
                {
                    PlayerTextDrawHide(playerid, ColorPanel[playerid][i]);
                    PlayerTextDrawBackgroundColor(playerid, ColorPanel[playerid][i], VehicleColoursTableRGBA[i]);
                    PlayerTextDrawShow(playerid, ColorPanel[playerid][i]);
                }
                SetPVarInt(playerid, "ColorSelect", 2);
                PlayerTextDrawSetString(playerid, ColorPanel[playerid][8], "Ikincil_Renkler");
            }
            else if(GetPVarInt(playerid, "ColorSelect") == 2)
            {

                SetPVarInt(playerid, "index_color", 0);
                for(new i; i < 8; i ++)
                {
                    PlayerTextDrawHide(playerid, ColorPanel[playerid][i]);
                    PlayerTextDrawBackgroundColor(playerid, ColorPanel[playerid][i], VehicleColoursTableRGBA[i]);
                    PlayerTextDrawShow(playerid, ColorPanel[playerid][i]);
                }
                SetPVarInt(playerid, "ColorSelect", 1);
                PlayerTextDrawSetString(playerid, ColorPanel[playerid][8], "Birincil_Renkler");
            }
        }
    }

    if(PlayerData[playerid][pUseGUI])
    {
        if(playertextid == PhoneSwitch[playerid])
        {
            if(!PlayerData[playerid][pPhoneCooldown])
            {
                PlayerData[playerid][pPhoneCooldown] = 1;
                Phone_ShowMenu(playerid, false, PhoneData[playerid][pCurrentPage] = PAGE_HOME);
                Phone_Switch(playerid);
            }
        }

        if(!PlayerData[playerid][pPhoneOff]) {
            if(playertextid == PhoneBtnL[playerid])
            {
                if(PhoneData[playerid][pCurrentPage] == PAGE_HOME)
                {
                    Phone_ShowMenu(playerid, true, PhoneData[playerid][pCurrentPage] = PAGE_MENU);
                }
            }
        }

        if(playertextid == PhoneBtnR[playerid])
        {
            if(PlayerData[playerid][pCalling]) return cmd_tkapat(playerid, "");

            if(PhoneData[playerid][pCurrentPage] == PAGE_HOME)
            {
                PlayerData[playerid][pPhoneCooldown] = 1;
                Phone_ShowMenu(playerid, false, PhoneData[playerid][pCurrentPage] = PAGE_HOME);
                Phone_Switch(playerid);
            }

            switch(PhoneData[playerid][pCurrentPage])
            {
                case PAGE_MENU: Phone_ShowMenu(playerid, false, PhoneData[playerid][pCurrentPage] = PAGE_HOME);
                case PAGE_NOTEBOOK: Phone_ShowMenu(playerid, true, PhoneData[playerid][pCurrentPage] = PAGE_MENU);
                case PAGE_CONTACT: Phone_ShowMenu(playerid, true, PhoneData[playerid][pCurrentPage] = PAGE_MENU);
                case PAGE_SETTING: Phone_ShowMenu(playerid, true, PhoneData[playerid][pCurrentPage] = PAGE_MENU);
                case PAGE_RINGTONE: Phone_ShowMenu(playerid, true, PhoneData[playerid][pCurrentPage] = PAGE_SETTING);
                case PAGE_PHONECOLOR: Phone_ShowMenu(playerid, true, PhoneData[playerid][pCurrentPage] = PAGE_SETTING);
                case PAGE_PHONEMODE: Phone_ShowMenu(playerid, true, PhoneData[playerid][pCurrentPage] = PAGE_SETTING);
                case PAGE_USERS: Phone_ShowMenu(playerid, true, PhoneData[playerid][pCurrentPage] = PAGE_NOTEBOOK);
            }
        }

        if(playertextid == PhoneArrowUp[playerid])
        {
            switch(PhoneData[playerid][pCurrentPage])
            {
                case PAGE_USERS:
                {
                    if (GetPVarInt(playerid, "ContactList") <= 0) SetPVarInt(playerid, "ContactList", 0);

                    SetPVarInt(playerid, "ContactList", GetPVarInt(playerid, "ContactList")-1);
                    new user_page = GetPVarInt(playerid, "ContactList");
                    ShowContactMembers(playerid, user_page);
                }
            }
        }

        if(playertextid == PhoneArrowDown[playerid])
        {
            switch(PhoneData[playerid][pCurrentPage])
            {
                case PAGE_USERS:
                {
                    SetPVarInt(playerid, "ContactList", GetPVarInt(playerid, "ContactList")+1);
                    new user_page = GetPVarInt(playerid, "ContactList");
                    ShowContactMembers(playerid, user_page);
                }
            }
        }

        if(playertextid == PhoneList[playerid][0])
        {
            if(PhoneData[playerid][pCurrentPage] == PAGE_MENU)
            {
                Phone_ShowMenu(playerid, true, PhoneData[playerid][pCurrentPage] = PAGE_NOTEBOOK);
                return 1;
            }

            if(PhoneData[playerid][pCurrentPage] == PAGE_SETTING)
            {
                Phone_ShowMenu(playerid, true, PhoneData[playerid][pCurrentPage] = PAGE_RINGTONE);
                return 1;
            }

            switch(PhoneData[playerid][pCurrentPage])
            {
                case PAGE_NOTEBOOK: ShowPlayerDialog(playerid, DIALOG_CALL, DIALOG_STYLE_INPUT, "Telefon: Ara", "Lütfen aramak istediðiniz telefon numarasýný giriniz:", "Ara", "Kapat");
                case PAGE_CONTACT: ShowPlayerDialog(playerid, DIALOG_CONTACT_1, DIALOG_STYLE_INPUT, "Telefon: Kiþi Ekle", "Rehbere ekleyeceðiniz kiþinin adý nedir:", "Ýleri", "Kapat");
                case PAGE_RINGTONE:
                {
                    if (PlayerData[playerid][pPhoneRingtone] == 20600)
                        return SendClientMessage(playerid, COLOR_GREY, "[!] Telefon zil sesi zaten bu olarak ayarlý.");

                    PlayerData[playerid][pPhoneRingtone] = 20600;
                    SendClientMessage(playerid, COLOR_GREY, "[!] Telefon zil sesini 1. zil sesi olarak deðiþtirdin.");
                }
                case PAGE_PHONECOLOR:
                {
                    if(PlayerData[playerid][pPhoneType] == PHONE_TYPE_BLACK) return 1;

                    for(new i = 0; i < 3; i++) PlayerTextDrawHide(playerid, PhoneFrame[playerid][i]);
                    PlayerTextDrawBoxColor(playerid, PhoneFrame[playerid][0], 255);
                    PlayerTextDrawColor(playerid, PhoneFrame[playerid][1], -1);
                    PlayerTextDrawColor(playerid, PhoneFrame[playerid][2], -1);
                    for(new i = 0; i < 3; i++) PlayerTextDrawShow(playerid, PhoneFrame[playerid][i]);

                    SetPlayerAttachedObject(playerid, SLOT_PHONE, 18868, 6, 0.064999, 0.043999, 0.004999, -112.0, 0.0, -178.9);
                    PlayerData[playerid][pPhoneType] = PHONE_TYPE_BLACK;

                    SendClientMessage(playerid, COLOR_GREY, "[!] Telefon rengini siyah olarak deðiþtirdin.");
                }
                case PAGE_PHONEMODE:
                {
                    if (!PlayerData[playerid][pPhoneSilent]) return SendClientMessage(playerid, COLOR_GREY, "[!] Telefon zaten normal modda görünüyor.");

                    SendClientMessage(playerid, COLOR_GREY, "[!] Telefonu sessiz moddan çýkardýn.");
                    PlayerData[playerid][pPhoneSilent] = 0;
                }
                case PAGE_USERS:
                {
                    SetPVarInt(playerid, "SMSorCall", PlayerData[playerid][pContacts][0]);
                    ShowPlayerDialog(playerid, DIALOG_SMS_OR_CALL, DIALOG_STYLE_MSGBOX, "Telefon: Ýþlem", "Seçtiðiniz kiþiye hangi iþlemi yapmak istiyorsunuz:", "Ara", "SMS");
                }

            }

        }
        if(playertextid == PhoneList[playerid][1])
        {
            if(PhoneData[playerid][pCurrentPage] == PAGE_MENU)
            {
                Phone_ShowMenu(playerid, true, PhoneData[playerid][pCurrentPage] = PAGE_CONTACT);
                return 1;
            }

            if(PhoneData[playerid][pCurrentPage] == PAGE_SETTING)
            {
                Phone_ShowMenu(playerid, true, PhoneData[playerid][pCurrentPage] = PAGE_PHONECOLOR);
                return 1;
            }

            switch(PhoneData[playerid][pCurrentPage])
            {
                case PAGE_NOTEBOOK: ShowPlayerDialog(playerid, DIALOG_SMS_1, DIALOG_STYLE_INPUT, "Telefon: SMS", "Lütfen SMS göndermek istediðiniz telefon numarasýný giriniz:", "Ýleri", "Kapat");
                case PAGE_CONTACT:
                {
                    new string[128];
                    format(string, sizeof(string), "Ýsim\tNumara\n");
                    for(new i = 1; i < MAX_PLAYER_CONTACTS; i++)
                    {
                        if(ContactsData[playerid][i][contactID] != 0)
                        {
                            if(!isnull(ContactsData[playerid][i][contactName]))
                            {
                                format(string, sizeof(string), "%s%s\t%d\n", string, ContactsData[playerid][i][contactName], ContactsData[playerid][i][contactNumber]);
                            }
                        }
                    }
                    ShowPlayerDialog(playerid, DIALOG_CONTACT_EDIT_1, DIALOG_STYLE_TABLIST_HEADERS, "Telefon: Kiþi Düzenle", string, "Ýleri", "Kapat");

                }
                case PAGE_RINGTONE:
                {
                    if (PlayerData[playerid][pPhoneRingtone] == 23000)
                        return SendClientMessage(playerid, COLOR_GREY, "[!] Telefon zil sesi zaten bu olarak ayarlý.");

                    PlayerData[playerid][pPhoneRingtone] = 23000;
                    SendClientMessage(playerid, COLOR_GREY, "[!] Telefon zil sesini 2. zil sesi olarak deðiþtirdin.");
                }
                case PAGE_PHONECOLOR:
                {
                    if(PlayerData[playerid][pPhoneType] == PHONE_TYPE_RED) return 1;

                    for(new i = 0; i < 3; i++) PlayerTextDrawHide(playerid, PhoneFrame[playerid][i]);
                    PlayerTextDrawBoxColor(playerid, PhoneFrame[playerid][0], 1225921279);
                    PlayerTextDrawColor(playerid, PhoneFrame[playerid][1], 1225921279);
                    PlayerTextDrawColor(playerid, PhoneFrame[playerid][2], 1225921279);
                    for(new i = 0; i < 3; i++) PlayerTextDrawShow(playerid, PhoneFrame[playerid][i]);

                    SetPlayerAttachedObject(playerid, SLOT_PHONE, 18870, 6, 0.064999, 0.043999, 0.004999, -112.0, 0.0, -178.9);
                    PlayerData[playerid][pPhoneType] = PHONE_TYPE_RED;

                    SendClientMessage(playerid, COLOR_GREY, "[!] Telefon rengini kýrmýzý olarak deðiþtirdin.");
                }
                case PAGE_PHONEMODE:
                {
                    if (PlayerData[playerid][pPhoneSilent])
                        return SendClientMessage(playerid, COLOR_GREY, "[!] Telefon zaten sessiz modda görünüyor.");

                    SendClientMessage(playerid, COLOR_GREY, "[!] Telefonu sessiz moda geçirdin.");
                    PlayerData[playerid][pPhoneSilent] = 1;
                }
                case PAGE_USERS:
                {
                    SetPVarInt(playerid, "SMSorCall", PlayerData[playerid][pContacts][1]);
                    ShowPlayerDialog(playerid, DIALOG_SMS_OR_CALL, DIALOG_STYLE_MSGBOX, "Telefon: Ýþlem", "Seçtiðiniz kiþiye hangi iþlemi yapmak istiyorsunuz:", "Ara", "SMS");
                }
            }
        }
        if(playertextid == PhoneList[playerid][2])
        {
            if(PhoneData[playerid][pCurrentPage] == PAGE_MENU)
            {
                Phone_ShowMenu(playerid, true, PhoneData[playerid][pCurrentPage] = PAGE_SETTING);
                return 1;
            }

            if(PhoneData[playerid][pCurrentPage] == PAGE_SETTING)
            {
                Phone_ShowMenu(playerid, true, PhoneData[playerid][pCurrentPage] = PAGE_PHONEMODE);
                return 1;
            }

            if(PhoneData[playerid][pCurrentPage] == PAGE_NOTEBOOK)
            {
                Phone_ShowMenu(playerid, true, PhoneData[playerid][pCurrentPage] = PAGE_USERS);
                return 1;
            }

            switch(PhoneData[playerid][pCurrentPage])
            {
                case PAGE_CONTACT:
                {
                    new string[128];
                    format(string, sizeof(string), "Ýsim\tNumara\n");
                    for(new i = 1; i < MAX_PLAYER_CONTACTS; i++)
                    {
                        if(ContactsData[playerid][i][contactID] != 0)
                        {
                            if(!isnull(ContactsData[playerid][i][contactName]))
                            {
                                format(string, sizeof(string), "%s%s\t%d\n", string, ContactsData[playerid][i][contactName], ContactsData[playerid][i][contactNumber]);
                            }
                        }
                    }
                    ShowPlayerDialog(playerid, DIALOG_CONTACT_DELETE, DIALOG_STYLE_TABLIST_HEADERS, "Telefon: Kiþi Sil", string, "Sil", "Kapat");

                }
                case PAGE_PHONECOLOR:
                {
                    if(PlayerData[playerid][pPhoneType] == PHONE_TYPE_BLUE) return 1;

                    for(new i = 0; i < 3; i++) PlayerTextDrawHide(playerid, PhoneFrame[playerid][i]);
                    PlayerTextDrawBoxColor(playerid, PhoneFrame[playerid][0], 456290303);
                    PlayerTextDrawColor(playerid, PhoneFrame[playerid][1], 456290303);
                    PlayerTextDrawColor(playerid, PhoneFrame[playerid][2], 456290303);
                    for(new i = 0; i < 3; i++) PlayerTextDrawShow(playerid, PhoneFrame[playerid][i]);

                    SetPlayerAttachedObject(playerid, SLOT_PHONE, 18866, 6, 0.064999, 0.043999, 0.004999, -112.0, 0.0, -178.9);
                    PlayerData[playerid][pPhoneType] = PHONE_TYPE_BLUE;

                    SendClientMessage(playerid, COLOR_GREY, "[!] Telefon rengini mavi olarak deðiþtirdin.");
                }
                case PAGE_USERS:
                {
                    SetPVarInt(playerid, "SMSorCall", PlayerData[playerid][pContacts][2]);
                    ShowPlayerDialog(playerid, DIALOG_SMS_OR_CALL, DIALOG_STYLE_MSGBOX, "Telefon: Ýþlem", "Seçtiðiniz kiþiye hangi iþlemi yapmak istiyorsunuz:", "Ara", "SMS");
                }
            }
        }
    }
    return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
    if(PlayerData[playerid][pAdminDuty])
    {
        SetPlayerPosFindZ(playerid, fX, fY, fZ);
        SendClientMessage(playerid, COLOR_GREY, "SERVER: Seçtiðin noktaya ýþýnlandýn.");
    }
    return 1;
}

public OnPlayerSpawn(playerid)
{
    pSpawnedIn[playerid] = true;
    Iter_Add(SpectatePlayers, playerid);
    SetPlayerTeam(playerid, STATE_ALIVE);

    SetPlayerWeather(playerid, weather);

    foreach (new i : Player)
    {
        if (SpectateID[i] == playerid)
        {
            StartSpectate(i, playerid);
        }
    }

    SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL, 899);
    SetPlayerSkillLevel(playerid, WEAPONSKILL_MICRO_UZI, 0);
    SetPlayerSkillLevel(playerid, WEAPONSKILL_SPAS12_SHOTGUN, 0);

    SetPlayerSkillLevel(playerid, WEAPONSKILL_AK47, 999);
    SetPlayerSkillLevel(playerid, WEAPONSKILL_DESERT_EAGLE, 999);
    SetPlayerSkillLevel(playerid, WEAPONSKILL_SHOTGUN, 999);
    SetPlayerSkillLevel(playerid, WEAPONSKILL_M4, 999);
    SetPlayerSkillLevel(playerid, WEAPONSKILL_MP5, 999);

    for(new i = 0; i < 4; i ++) if(PlayerData[playerid][pWeapons][i] != 0)
    {
        GivePlayerWeapon(playerid, PlayerData[playerid][pWeapons][i], PlayerData[playerid][pWeaponsAmmo][i]);
    }

    SetPlayerArmedWeapon(playerid, 0);

    if(PlayerData[playerid][pAjailed])
    {
        ClearAnimations(playerid);
        SendPlayer(playerid, 2578.929931, 2658.771728, 10.820312, 90.0, 0, 1338);
        SendServerMessage(playerid, "Yönetici tarafýndan hapise atýlmýþsýn, %i saniye sonra serbest kalacaksýn.", PlayerData[playerid][pAjailTime]);
        ResetHouseVar(playerid);
        return 1;
    }

    SetPlayerHealth(playerid, PlayerData[playerid][pLastHealth]);
    SetPlayerArmour(playerid, PlayerData[playerid][pLastArmor]);

    if(PlayerData[playerid][pCrashed])
    {
        PlayerData[playerid][pCrashed] = 0;
        SaveSQLInt(PlayerData[playerid][pSQLID], "players", "Crashed", 0);
        GameTextForPlayer(playerid, "~r~Crash~n~~w~Son Lokasyonda Spawnlandin!", 4000, 1);

        if(PlayerData[playerid][pLAWduty] || PlayerData[playerid][pSWATduty])
        {
            SetPlayerSkin(playerid, PlayerData[playerid][pDutySkin]);
            SetPlayerColor(playerid, COLOR_COP);
        }

        SendPlayer(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], PlayerData[playerid][pPos][3], PlayerData[playerid][pInterior], PlayerData[playerid][pWorld]);
        return 1;
    }

    if(SpectateID[playerid] != -1)
    {
        SendPlayer(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], PlayerData[playerid][pPos][3], PlayerData[playerid][pInterior], PlayerData[playerid][pWorld]);
        SpectateID[playerid] = SpectateType[playerid] = -1;
        return 1;
    }

    if(CCTVID[playerid] != -1)
    {
        SendPlayer(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], PlayerData[playerid][pPos][3], PlayerData[playerid][pInterior], PlayerData[playerid][pWorld]);
        CCTVID[playerid] = -1;
        return 1;
    }

    SpawnPlayerIn(playerid);
    return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
    if(pLoggedIn[playerid])
    {
        if(PlayerData[playerid][pBrutallyWounded])
        {
            SetPlayerPos(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]);
            SetSpawnInfo(playerid, 0, PlayerData[playerid][pSkin], PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], 90.0, 0, 0, 0, 0, 0, 0);
            SetPlayerSkin(playerid, PlayerData[playerid][pSkin]);
            SetTimerEx("SecureSpawn", 700, false, "i", playerid);
        }
    }
    return 1;
}

public OnPlayerRequestSpawn(playerid)
{
    return 0;
}

new SERVER_DOWNLOAD[] = "https://fervent-mccarthy-de3fe0.netlify.app/";
public OnPlayerRequestDownload(playerid, type, crc)
{
    if(!IsPlayerConnected(playerid))
        return 0;

    new filename[64], filefound, final_url[256];

    if(type == DOWNLOAD_REQUEST_TEXTURE_FILE)
        filefound = FindTextureFileNameFromCRC(crc, filename, sizeof(filename));
    else if(type == DOWNLOAD_REQUEST_MODEL_FILE)
        filefound = FindModelFileNameFromCRC(crc, filename, sizeof(filename));

    if(filefound)
    {
        format(final_url, sizeof(final_url), "%s/%s", SERVER_DOWNLOAD, filename);
        RedirectDownload(playerid, final_url);
    }
    return 1;
}

public OnPlayerCommandReceived(playerid, cmdtext[])
{
    if(pLoggedIn[playerid] == true)
    {
        if(PlayerData[playerid][pFirstLogin])
        {
            SendClientMessage(playerid, COLOR_ADM, "ERÝÞÝM REDDEDÝLDÝ: {FFFFFF}Tanýtýmý izlerken komut kullanamazsýn.");
            return 0;
        }
        return 1;
    }
    else
    {
        SendClientMessage(playerid, COLOR_ADM, "ERÝÞÝM REDDEDÝLDÝ: {FFFFFF}Komut kullanabilmek için ilk önce giriþ yapmalýsýn.");
        printf("[cmd] [%s] %s (engellendi, giris yapmamis)", ReturnName(playerid), cmdtext);
        return 0;
    }
}

public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
    if(!success)
    {
        SendClientMessage(playerid, COLOR_WHITE, "{ADC3E7}HATA:{FFFFFF} Komut bulunamadý. {ADC3E7}/yardim{FFFFFF} ve {ADC3E7}/yardimiste{FFFFFF} komutlarý ile destek alabilirsin.");
    }

    foreach(new i : Player)
    {
        if(PlayerData[i][pAdmin] < 1) continue;
        if(SpectateID[i] != playerid) continue;

        SendServerMessage(i, "[CMD] %s: %s", ReturnName(playerid, 1), cmdtext);
    }

    LogPlayerAction(playerid, sprintf("%s komut kullandi: %s", ReturnName(playerid, 1), cmdtext));
    return 1;
}

public OnPlayerEnterDynamicArea(playerid, areaid)
{
    new array[2];
    Streamer_GetArrayData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID, array, 2);

    switch(array[0])
    {
        //case 1: SetPVarInt(playerid, "AtIndustry", array[1]);
        case 2..3: SetPVarInt(playerid, "AtEntrance", array[1]);
        case 4: SetPVarInt(playerid, "AtArrest", array[1]);
        case 5..6: SetPVarInt(playerid, "AtDoor", array[1]);
        case 7: SetPVarInt(playerid, "AtToll", array[1]), SetPVarInt(playerid, "toll_msg_sent", 0);
        case 8: SetPVarInt(playerid, "AtPayNSpray", array[1]), SetPVarInt(playerid, "pns_msg_sent", 0);
        case 9..10: SetPVarInt(playerid, "AtGarage", array[1]);
        case 11: SetPVarInt(playerid, "AtGate", array[1]);
        case 12: SetPVarInt(playerid, "AtSpray", array[1]);
        //case 13: SetPVarInt(playerid, "AtCrate", array[1]);
        case 14: SetPVarInt(playerid, "AtGarbage", array[1]), SetPVarInt(playerid, "garbage_msg_sent", 0);
        //case 15: SetPVarInt(playerid, "AtDetector", array[1]), SetPVarInt(playerid, "detector_msg_sent", 0);
        case 16..17: SetPVarInt(playerid, "AtBusiness", array[1]);
        case 18: SetPVarInt(playerid, "AtATM", array[1]);
        //case 19: SetPVarInt(playerid, "AtDrop", array[1]);
        //case 19: SetPVarInt(playerid, "AtPump", array[1]);
        case 20: SetPVarInt(playerid, "AtObject", array[1]);
        case 21: SetPVarInt(playerid, "AtLabel", array[1]);
        case 22: SetPVarInt(playerid, "AtCCTV", array[1]);
        case 23: SetPVarInt(playerid, "AtSpike", array[1]);
        case 24: SetPVarInt(playerid, "AtBoombox", array[1]);
        case 25..26: SetPVarInt(playerid, "AtHouse", array[1]);
    }

    if(!IsPlayerInAnyVehicle(playerid))
    {
        new b = -1;
        if((b = IsPlayerNearBusiness(playerid)) != -1)
        {
            if(BusinessData[b][BusinessWantedProduct] > 0)
            {
                SendClientMessage(playerid, COLOR_WHITE, "Bu iþyeri kargo satýn almayý {9ACD32}kabul ediyor.");
                SendClientMessageEx(playerid, COLOR_WHITE, "(Ýstenilen: {9ACD32}%i %s %s{FFFFFF}, her birine {9ACD32}$%i {FFFFFF}veriyor.)", BusinessData[b][BusinessWantedProduct], Trucker_GetType(biz_prod_types[BusinessData[b][BusinessType]]), TruckerData_product[BusinessData[b][BusinessType]], BusinessData[b][BusinessProductPrice]);
            }
        }

        if(GetPVarInt(playerid, "AtEntrance") != -1)
        {
            new e = GetPVarInt(playerid, "AtEntrance");
            if(IsPlayerInRangeOfPoint(playerid, 3.0, EntranceData[e][EntrancePos][0], EntranceData[e][EntrancePos][1], EntranceData[e][EntrancePos][2]))
            {
                GameTextForPlayer(playerid, sprintf("%s", EntranceData[e][EntranceName]), 2000, 3);
            }
        }

        new h = -1;
        if((h = IsPlayerInProperty(playerid)) != -1)
        {
            SetPlayerTime(playerid, PropertyData[h][PropertyTime], 0);
            if(PropertyData[h][PropertyLights]) PlayerTextDrawShow(playerid, PropertyLightsTXD[playerid]);
            else PlayerTextDrawHide(playerid, PropertyLightsTXD[playerid]);
        }
        else {
            gettime(hour, minute, second); SetPlayerTime(playerid, hour, minute);
            PlayerTextDrawHide(playerid, PropertyLightsTXD[playerid]);
        }
        /*
        if(GetPVarInt(playerid, "AtDetector") != -1)
        {
            if(!GetPVarInt(playerid, "detector_msg_sent"))
            {
                SendNearbyMessage(playerid, 30.0, COLOR_EMOTE, "** Metal dedektör öter. (( %s ))", ReturnName(playerid, 0));
                SetPVarInt(playerid, "detector_msg_sent", 1);
                PlayerPlaySoundEx(playerid, 43000);
            }
        }
        */

        if((h = IsPlayerNearProperty(playerid)) != -1)
        {
            if(PlayerData[playerid][pCheckpoint] == -1)
            {
                switch(PropertyData[h][PropertyType])
                {
                    case 1:
                    {
                        /*
                        if(!PropertyData[h][propertyOwnerSQL])
                        {
                            SendClientMessage(playerid, COLOR_DARKGREEN, "Bu apartman kompleksini satýn almak ister misin?");
                            SendClientMessageEx(playerid, COLOR_DARKGREEN, "$%s", MoneyFormat(PropertyData[h][propertyMarketPrice]));
                        }
                        else
                        {
                        */
                        if(PropertyData[h][PropertyOwnerID] == PlayerData[playerid][pSQLID]) SendClientMessage(playerid, COLOR_DARKGREEN, "Apartman kompleksine hoþgeldin!");
                        SendClientMessageEx(playerid, COLOR_DARKGREEN, "Apartman Kompleksi: %s", PropertyData[h][PropertyAddress]);
                        SendClientMessage(playerid, COLOR_WHITE, "Kullanýlabilir komutlar: /giris, /kapical, /ds, /ddo");

                        if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID])
                        {
                            if(PropertyData[h][PropertyRentable] && PlayerData[playerid][pRenting] != h)
                                SendClientMessage(playerid, COLOR_WHITE, "Bu apartman kompleksinde oda kiralamak ister misin? /odakirala");
                        }
                        //}

                        PlayerData[playerid][pCheckpoint] = h;

                        if(PlayerData[playerid][pAdminDuty])
                        {
                            SendClientMessageEx(playerid, COLOR_YELLOW, "APT KOMPLEKS ID: [%i] VERÝTABANI ID: [%i]", h, PropertyData[h][PropertyID]);
                            SendClientMessageEx(playerid, COLOR_YELLOW, "APT KOMPLEKS SAHÝBÝ: %s[%i] ", ReturnSQLName(PropertyData[h][PropertyOwnerID]), PropertyData[h][PropertyOwnerID]);
                        }
                    }
                    case 2:
                    {
                        if(!PropertyData[h][PropertyOwnerID])
                        {
                            SendClientMessage(playerid, COLOR_DARKGREEN, "Bu apartman dairesini satýn almak ister misin?");
                            SendClientMessageEx(playerid, COLOR_DARKGREEN, "Ücret: $%s", MoneyFormat(PropertyData[h][PropertyMarketPrice]));
                        }
                        else
                        {
                            if(PropertyData[h][PropertyOwnerID] == PlayerData[playerid][pSQLID]) SendClientMessage(playerid, COLOR_DARKGREEN, "Apartman dairene hoþgeldin!");
                            SendClientMessageEx(playerid, COLOR_DARKGREEN, "%s", PropertyData[h][PropertyAddress]);
                            SendClientMessage(playerid, COLOR_WHITE, "Kullanýlabilir komutlar: /giris, /kapical, /ds, /ddo");

                            if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID])
                            {
                                if(PropertyData[h][PropertyRentable] && PlayerData[playerid][pRenting] != h)
                                    SendClientMessage(playerid, COLOR_WHITE, "Bu apartman dairesinde oda kiralamak ister misin? /odakirala");
                            }
                        }

                        SetPlayerCheckpoint(playerid, PropertyData[h][PropertyEnter][0], PropertyData[h][PropertyEnter][1], PropertyData[h][PropertyEnter][2], 2.0);
                        PlayerData[playerid][pCheckpoint] = h;

                        if(PlayerData[playerid][pAdminDuty])
                        {
                            SendClientMessageEx(playerid, COLOR_YELLOW, "APARTMAN ID: [%i] VERÝTABANI ID: [%i]", h, PropertyData[h][PropertyID]);
                            SendClientMessageEx(playerid, COLOR_YELLOW, "APARTMAN SAHÝBÝ: %s[%i] ", ReturnSQLName(PropertyData[h][PropertyOwnerID]), PropertyData[h][PropertyOwnerID]);
                        }
                    }
                    case 3:
                    {
                        if(!PropertyData[h][PropertyOwnerID])
                        {
                            SendClientMessage(playerid, COLOR_DARKGREEN, "Bu evi satýn almak ister misin?");
                            SendClientMessageEx(playerid, COLOR_DARKGREEN, "Ücret: $%s", MoneyFormat(PropertyData[h][PropertyMarketPrice]));
                        }
                        else
                        {
                            if(PropertyData[h][PropertyOwnerID] == PlayerData[playerid][pSQLID]) SendClientMessage(playerid, COLOR_DARKGREEN, "Evine hoþgeldin!");
                            SendClientMessageEx(playerid, COLOR_DARKGREEN, "%s", PropertyData[h][PropertyAddress]);
                            SendClientMessage(playerid, COLOR_WHITE, "Kullanýlabilir komutlar: /giris, /kapical, /ds, /ddo");

                            if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID])
                            {
                                if(PropertyData[h][PropertyRentable] && PlayerData[playerid][pRenting] != h)
                                    SendClientMessage(playerid, COLOR_WHITE, "Bu evde oda kiralamak ister misin? /odakirala");
                            }
                        }

                        SetPlayerCheckpoint(playerid, PropertyData[h][PropertyEnter][0], PropertyData[h][PropertyEnter][1], PropertyData[h][PropertyEnter][2], 2.0);
                        PlayerData[playerid][pCheckpoint] = h;

                        if(PlayerData[playerid][pAdminDuty])
                        {
                            SendClientMessageEx(playerid, COLOR_YELLOW, "EV ID: [%i] VERÝTABANI ID: [%i]", h, PropertyData[h][PropertyID]);
                            SendClientMessageEx(playerid, COLOR_YELLOW, "EV SAHÝBÝ: %s[%i] ", ReturnSQLName(PropertyData[h][PropertyOwnerID]), PropertyData[h][PropertyOwnerID]);
                        }
                    }
                }
            }
        }

        if(GetPVarInt(playerid, "AtGarbage") != -1)
        {
            if(!GetPVarInt(playerid, "garbage_msg_sent"))
            {
                new g = GetPVarInt(playerid, "AtGarbage");
                SetPlayerCheckpoint(playerid, GarbageData[g][GarbagePos][0], GarbageData[g][GarbagePos][1], GarbageData[g][GarbagePos][2]-1.0, 2.0);
                PlayerData[playerid][pCheckpoint] = g;

                SendClientMessageEx(playerid, COLOR_ADM, "[!] {FFFFFF}Bu çöpün kapasitesi: %i/%i", GarbageData[g][GarbageTakenCapacity], GarbageData[g][GarbageCapacity]);
                SetPVarInt(playerid, "garbage_msg_sent", 1);
            }
        }
    }

    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    {
        if(GetPVarInt(playerid, "AtToll") != -1)
        {
            if(!GetPVarInt(playerid, "toll_msg_sent"))
            {
                if (PlayerData[playerid][pLAWduty]) SendClientMessage(playerid, COLOR_ADM, "Giþe Görevlisi: {FFFFFF}Bu giþeden geçiþ sana ücretsiz, geçmek için /gise yazabilirsin.");
                else SendClientMessageEx(playerid, COLOR_ADM, "Giþe Görevlisi: {FFFFFF}Bu giþeden geçiþ ücreti $%i, geçmek için /gise yazabilirsin.", TollData[GetPVarInt(playerid, "AtToll")][TollPrice]);
                SetPVarInt(playerid, "toll_msg_sent", 1);
            }
        }

        if(GetPVarInt(playerid, "AtPayNSpray") != -1)
        {
            if(!GetPVarInt(playerid, "pns_msg_sent"))
            {
                GameTextForPlayer(playerid, sprintf("%s", PNSData[GetPVarInt(playerid, "AtPayNSpray")][PnsName]), 1000, 1);
                SetPVarInt(playerid, "pns_msg_sent", 1);
            }
        }
    }


    new h = Streamer_GetIntData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID);

    if(0 <= h < MAX_BOOMBOXS)
    {
        if (Iter_Contains(Boomboxs, h))
        {
            if(areaid == BoomboxData[h][BoomboxAreaID] && BoomboxData[h][BoomboxStatus])
            {
                if(IsPlayerInAnyVehicle(playerid))
                {
                    if(!CarData[GetPlayerVehicleID(playerid)][carXMROn]) PlayAudioStreamForPlayer(playerid, BoomboxData[h][BoomboxURL], BoomboxData[h][BoomboxLocation][0], BoomboxData[h][BoomboxLocation][1], BoomboxData[h][BoomboxLocation][2], 30.0, 1);
                }
                else PlayAudioStreamForPlayer(playerid, BoomboxData[h][BoomboxURL], BoomboxData[h][BoomboxLocation][0], BoomboxData[h][BoomboxLocation][1], BoomboxData[h][BoomboxLocation][2], 30.0, 1);

                SetPVarInt(playerid, "AtBoombox", h);
            }
        }
    }
    return 1;
}

public OnPlayerLeaveDynamicArea(playerid, areaid)
{
    new array[2];
    Streamer_GetArrayData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID, array, 2);

    switch(array[0])
    {
        //case 1: SetPVarInt(playerid, "AtIndustry", -1);
        case 2..3: SetPVarInt(playerid, "AtEntrance", -1);
        case 4: SetPVarInt(playerid, "AtArrest", -1);
        case 5..6: SetPVarInt(playerid, "AtDoor", -1);
        case 7: SetPVarInt(playerid, "AtToll", -1), SetPVarInt(playerid, "toll_msg_sent", 0);
        case 8: SetPVarInt(playerid, "AtPayNSpray", -1), SetPVarInt(playerid, "pns_msg_sent", 0);
        case 9..10: SetPVarInt(playerid, "AtGarage", -1);
        case 11: SetPVarInt(playerid, "AtGate", -1);
        case 12: SetPVarInt(playerid, "AtSpray", -1);
        //case 13: SetPVarInt(playerid, "AtCrate", -1);
        case 14: SetPVarInt(playerid, "AtGarbage", -1), SetPVarInt(playerid, "garbage_msg_sent", 0);
        //case 15: SetPVarInt(playerid, "AtDetector", -1), SetPVarInt(playerid, "detector_msg_sent", 0);
        case 16..17: SetPVarInt(playerid, "AtBusiness", -1);
        case 18: SetPVarInt(playerid, "AtATM", -1);
        //case 19: SetPVarInt(playerid, "AtDrop", -1);
        //case 19: SetPVarInt(playerid, "AtPump", -1);
        case 20: SetPVarInt(playerid, "AtObject", -1);
        case 21: SetPVarInt(playerid, "AtLabel", -1);
        case 22: SetPVarInt(playerid, "AtCCTV", -1);
        case 23: SetPVarInt(playerid, "AtSpike", -1);
        case 24: SetPVarInt(playerid, "AtBoombox", -1);
        case 25..26: SetPVarInt(playerid, "AtHouse", -1);
    }

    new v = -1;
    if((v = IsPlayerInProperty(playerid)) != -1)
    {
        SetPlayerTime(playerid, PropertyData[v][PropertyTime], 0);
        if(PropertyData[v][PropertyLights]) PlayerTextDrawShow(playerid, PropertyLightsTXD[playerid]);
        else PlayerTextDrawHide(playerid, PropertyLightsTXD[playerid]);
    }
    else {
        gettime(hour, minute, second); SetPlayerTime(playerid, hour, minute);
        PlayerTextDrawHide(playerid, PropertyLightsTXD[playerid]);
    }

    if(!IsPlayerInAnyVehicle(playerid))
    {
        if(PlayerData[playerid][pCheckpoint] != -1)
        {
            new cp = PlayerData[playerid][pCheckpoint];
            if(!IsPlayerInRangeOfPoint(playerid, 3.0, PropertyData[cp][PropertyEnter][0], PropertyData[cp][PropertyEnter][1], PropertyData[cp][PropertyEnter][2]))
            {
                PlayerData[playerid][pCheckpoint] = -1;
                DisablePlayerCheckpoint(playerid);
            }
        }
    }

    new h = Streamer_GetIntData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID);
    if(0 <= h < MAX_BOOMBOXS)
    {
        if (Iter_Contains(Boomboxs, h))
        {
            if(areaid == BoomboxData[h][BoomboxAreaID] && BoomboxData[h][BoomboxStatus])
            {
                if(Boombox_Placed(playerid) == h)
                {
                    Boombox_Delete(h);
                }

                if(IsPlayerInAnyVehicle(playerid))
                {
                    if(!CarData[GetPlayerVehicleID(playerid)][carXMROn]) StopAudioStreamForPlayer(playerid);
                }
                else StopAudioStreamForPlayer(playerid);

                DeletePVar(playerid, "AtBoombox");
            }
        }
    }
    return 1;
}

public OnPlayerSelectDynamicObject(playerid, objectid, modelid, Float:x, Float:y, Float:z)
{
    if(PlayerData[playerid][pHouseFurniture] != -1)
    {
        if(IsPlayerInProperty(playerid) != PlayerData[playerid][pHouseFurniture])
        {
            SendClientMessage(playerid, COLOR_ADM, "ERÝÞÝM REDDEDÝLDÝ: {FFFFFF}Bu komutu kullanabilmek için kendi evinizde olmalýsýnýz.");
            return 1;
        }

        new data[e_furniture];
        Streamer_GetArrayData(STREAMER_TYPE_OBJECT, objectid, E_STREAMER_EXTRA_ID, data);
        if(Streamer_IsInArrayData(STREAMER_TYPE_OBJECT, objectid, E_STREAMER_EXTRA_ID, data[SQLID]))
        {
            if(data[SQLID] > 0 && data[TempObjectID] == objectid)
            {
                CancelEdit(playerid);
                SetPVarInt(playerid, "chose_slot", objectid);
                Furniture_Edit(playerid);
                return 1;
            }
        }
        else SendClientMessage(playerid, COLOR_ADM, "ERÝÞÝM REDDEDÝLDÝ: {FFFFFF}Sadece kendi eklediðin mobilyalar üzerinde iþlem yapabilirsin.");
    }
    return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
    if(GetPlayerMenu(playerid) == main_page)
    {
        switch(row)
        {
            case 0: ShowMenuForPlayer(sub_page, playerid);
            case 1:
            {
                SendClientMessage(playerid, COLOR_DARKGREEN, "________Taksi Nasýl Çaðýrýrým?________");
                SendClientMessage(playerid, COLOR_WHITE, "/ara 555");
                SendClientMessage(playerid, COLOR_DARKGREEN, "____________________");
                ShowMenuForPlayer(main_page, playerid);
            }
            case 2: ShowMenuForPlayer(main_page, playerid);
            case 3:
            {
                SendClientMessage(playerid, COLOR_DARKGREEN, "________Nerede Yaþayabilirim?________");
                SendClientMessage(playerid, COLOR_WHITE, "- Bir otelde oda kiralayabilirsin.");
                SendClientMessage(playerid, COLOR_WHITE, "- Herhangi bir evin odasýný kiralayabilirsin");
                SendClientMessage(playerid, COLOR_WHITE, "- veya LS Aiport otelinde kalýn.");
                SendClientMessage(playerid, COLOR_DARKGREEN, "____________________");
                ShowMenuForPlayer(main_page, playerid);
            }
            case 4:
            {
                SendClientMessage(playerid, COLOR_DARKGREEN, "________Hastane Yardýmý:________");
                SendClientMessage(playerid, COLOR_WHITE, "/ara 911");
                SendClientMessage(playerid, COLOR_DARKGREEN, "____________________");
                ShowMenuForPlayer(main_page, playerid);
            }
            case 5:
            {
                SendClientMessage(playerid, COLOR_DARKGREEN, "________Polis Yardýmý:________");
                SendClientMessage(playerid, COLOR_WHITE, "/ara 911");
                SendClientMessage(playerid, COLOR_DARKGREEN, "____________________");
                ShowMenuForPlayer(main_page, playerid);
            }
            case 6:
            {
                SendClientMessage(playerid, COLOR_DARKGREEN, "________Forum Linkleri:________");
                SendClientMessage(playerid, COLOR_WHITE, "(Kurallarý ve rehberleri okuyun)");
                SendClientMessage(playerid, COLOR_WHITE, "forum.lss-roleplay");
                SendClientMessage(playerid, COLOR_DARKGREEN, "____________________");
                ShowMenuForPlayer(main_page, playerid);
            }
        }
    }
    else if(GetPlayerMenu(playerid) == sub_page)
    {
        switch(row)
        {
            case 0: ShowMenuForPlayer(main_page, playerid);
            case 1:
            {
                SendClientMessage(playerid, COLOR_YELLOW, "> Trucker mesleði iþaretlendi.");
                ShowMenuForPlayer(sub_page, playerid);
                SetPlayerCheckpoint(playerid, 2676.0427, -2539.7114, 13.4232, 3.0);
            }
            case 2:
            {
                SendClientMessage(playerid, COLOR_YELLOW, "Bu mesleðin bir pozisyonu yok.");
                ShowMenuForPlayer(sub_page, playerid);
            }
            case 3:
            {
                SendClientMessage(playerid, COLOR_YELLOW, "Bu mesleðin bir pozisyonu yok.");
                ShowMenuForPlayer(sub_page, playerid);
            }
            case 4:
            {
                SendClientMessage(playerid, COLOR_YELLOW, "Bu mesleðin bir pozisyonu yok.");
                ShowMenuForPlayer(sub_page, playerid);
            }
            case 5:
            {
                SendClientMessage(playerid, COLOR_YELLOW, "> Mekanik mesleði iþaretlendi.");
                ShowMenuForPlayer(sub_page, playerid);
                SetPlayerCheckpoint(playerid, MECHANIC_POS_X, MECHANIC_POS_Y, MECHANIC_POS_Z, MECHANIC_POS_RANGE);
            }
        }
    }
    return 1;
}

public OnPlayerExitedMenu(playerid)
{
    TogglePlayerControllable(playerid, 1);
    return 1;
}

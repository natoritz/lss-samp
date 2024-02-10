/* //BU ANTÝ HÝLE LOS SANTOS STORÝES ADLI PROJE ÝÇÝN KODLANMIÞTIR.\\
------------------------------DEVELOPER:JUDGEMENTDRAGON---------------
Yapým Tarihi: 06.05.2021
*/
//ANTI SILENT AIMBOT: 0
//ANTI VEHICLE REPAIR JACK: 1
//ANTI SCREEN FLICKERING: 2
//ANTI CAR TROLLER: 3
//ANTI SURFING INVISIBLE: 4
//ANTI AIRBREAK: 5
//ANTI SEAT ID CRASHER: 6
//ANTI SPEED JACK (On Foot/Driver): 7
//ANTI TROLL ANIMATION: 8
//ANIMATION INVISIBLE: 9
//ANTI FLY JACK (On Foot): 10
//ENGINE JACK: 11
//ANTI RAGE SHOT: 12
//ANTI TRAILER CRASHER: 13 (mr.project attack)
//DAHA EKLENECEK - - -JUDGEMENTDRAGON
#include <a_samp>
/*
*/
main()
{
    print("\n------------------------------------");
	print(" J-AC, Coded By JUDGEMENTDRAGON");
	print("--------------------------------------\n");
}

#if !defined IsValidVehicleModel
    native IsValidVehicleModel(modelid);
#endif

forward OnPlayerCheatDetected(playerid, code);

forward OnPlayerChangedToTrailer(playerid, vehicleid, trailerid);

#define OnPlayerWeaponShot  	            JAC_OnPlayerWeaponShot
#define OnPlayerConnect     	            JAC_OnPlayerConnect
#define OnPlayerSpawn        	            JAC_OnPlayerSpawn
#define OnVehicleDamageStatusUpdate     	JAC_OnVehicleDamageStatusUpdate
#define OnVehicleSpawn                      JAC_OnVehicleSpawn
#define OnPlayerStateChange  	            JAC_OnPlayerStateChange
#define OnVehicleMod                     	JAC_OnVehicleMod
#define OnVehiclePaintjob              	    JAC_OnVehiclePaintjob
#define OnVehicleRespray                 	JAC_OnVehicleRespray
#define OnPlayerUpdate                  	JAC_OnPlayerUpdate


new OldSpeed[MAX_PLAYERS];
new Float:LastPosition[MAX_PLAYERS][3];
new LegalEngine[MAX_PLAYERS];
new OldTrailer[MAX_PLAYERS];

new MaxSeat[] =
{
	0x10331113, 0x11311131, 0x11331313, 0x80133301, 0x1381F110,
	0x10311103, 0x10001F10, 0x11113311, 0x13113311, 0x31101100,
	0x30002301, 0x11031311, 0x11111331, 0x10013111, 0x01131100,
	0x11111110, 0x11100031, 0x11130111, 0x33113311, 0x11111101,
	0x33101133, 0x10100510, 0x03133111, 0xFF11113F, 0x13330111,
	0xFF131111, 0x0000FF3F
};

public OnPlayerConnect(playerid)
{
    SetPVarInt(playerid, "LegalSpeed", 0);
	#if defined JAC_OnPlayerConnect
	    return JAC_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}

public OnPlayerSpawn(playerid)
{
	SetTimerEx("AntiCheatControl", 200, true, "i", playerid);
	#if defined JAC_OnPlayerSpawn
	    return JAC_OnPlayerSpawn(playerid);
	#else
		return 1;
	#endif
}

forward AntiCheatControl(playerid);
public AntiCheatControl(playerid)
{
	OldSpeed[playerid] = PlayerSpeed(playerid);
	GetPlayerPos(playerid, LastPosition[playerid][0], LastPosition[playerid][1], LastPosition[playerid][2]);
	if (GetPlayerVehicleID(playerid) > -1 && GetVehicleTrailer(GetPlayerVehicleID(playerid)) > -1)
	{
	    OldTrailer[playerid] = GetVehicleTrailer(GetPlayerVehicleID(playerid));
	}
	else
	{
		OldTrailer[playerid] = -1;
	}
	return 1;
}

public OnPlayerChangedToTrailer(playerid, vehicleid, trailerid)
{
    if (OldTrailer[playerid] != -1 && OldTrailer[playerid] != trailerid)
    {
        CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 13);
    }
	return 1;
}

static MaxPassangers(modelid)
{
	if(IsValidVehicleModel(modelid))
	{
		modelid -= 400;
		return ((MaxSeat[modelid >>> 3] >>> ((modelid & 7) << 2)) & 0xF);
	}
	return 0xF;
}

public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
    SetPVarInt(playerid, "LegalSpeed", 1);
    SetTimerEx("ResetLegalSpeed", 500, false, "i", playerid);
    #if defined JAC_OnVehicleDamageStatusUpdate
	    return JAC_OnVehicleDamageStatusUpdate(vehicleid, playerid);
	#else
		return 1;
	#endif
}

forward ResetLegalSpeed(playerid);
public ResetLegalSpeed(playerid)
{
    SetPVarInt(playerid, "LegalSpeed", 0);
    return 1;
}


forward ResetLegalEngine(playerid);
public ResetLegalEngine(playerid)
{
    LegalEngine[playerid] = 0;
    return 1;
}

stock PlayerSpeed(playerid)
{
    new Float:ST[4];
    if(IsPlayerInAnyVehicle(playerid))
    GetVehicleVelocity(GetPlayerVehicleID(playerid),ST[0],ST[1],ST[2]);
    else GetPlayerVelocity(playerid,ST[0],ST[1],ST[2]);
    ST[3] = floatsqroot(floatpower(floatabs(ST[0]), 2.0) + floatpower(floatabs(ST[1]), 2.0) + floatpower(floatabs(ST[2]), 2.0)) * 179.28625;
    return floatround(ST[3]);
}

public OnVehicleSpawn(vehicleid) 
{
	new Float:vJudgesd;
	GetVehicleHealth(vehicleid, vJudgesd);
	if (vJudgesd > 950)
	{
	    SetVehicleHealth(vehicleid, 950);
	}
	#if defined JAC_OnVehicleSpawn
	    return JAC_OnVehicleSpawn(vehicleid);
	#else
		return 1;
	#endif
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    new vehicleid = GetPlayerVehicleID(playerid);
    SetPVarInt(playerid, "CarID", vehicleid);
	#if defined JAC_OnPlayerStateChange
	    return JAC_OnPlayerStateChange(playerid, newstate, oldstate);
	#else
		return 1;
	#endif
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
    new Float:vHealth;
	GetVehicleHealth(vehicleid, vHealth);
	if (vHealth > 950)
	{
		SetVehicleHealth(vehicleid, 950); 
	}
	#if defined JAC_OnVehicleMod
	    return JAC_OnVehicleMod(playerid, vehicleid, componentid);
	#else
		return 1;
	#endif
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
    new Float:vHealth;
	GetVehicleHealth(vehicleid, vHealth); 
	if (vHealth > 950) 
	{
		SetVehicleHealth(vehicleid, 950); 
	}
	#if defined JAC_OnVehiclePaintjob
	    return JAC_OnVehiclePaintjob(playerid, vehicleid, paintjobid);
	#else
		return 1;
	#endif
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	new Float:vHealth;
	GetVehicleHealth(vehicleid, vHealth);
	if (vHealth > 950) 
	{
		SetVehicleHealth(vehicleid, 950);
	}
	#if defined JAC_OnVehicleRespray
	    return JAC_OnVehicleRespray(playerid, vehicleid, color1, color2);
	#else
		return 1;
	#endif
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
   	if (hittype == 1)
	{
        new Float:ox, Float:oy, Float:oz, Float:hx, Float:hy, Float:hz;
        GetPlayerLastShotVectors(playerid, ox, oy, oz, hx, hy, hz);
        new Float:hitposdistance = GetPlayerDistanceFromPoint(hitid, hx, hy, hz);
    	if (hitposdistance == 0)
	    {
	    	CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 0);
	    }
        if (hitposdistance > 3.0)
	    {
	    	CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 0);
	    }
        new Float:xyz[3];
        GetPlayerPos(hitid,xyz[0],xyz[1],xyz[2]);
        new Float:Distance = GetPlayerDistanceFromPoint(playerid,xyz[0],xyz[1],xyz[2]);
		switch(weaponid) {
			case 30: {
				if(Distance > 70) return CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 12);
			}
			case 31: {
				if(Distance > 90) return CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 12);
			}
			case 33: {
				if(Distance > 100) return CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 12);
			}
			case 34: {
				if(Distance > 200) return CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 12);
			}
			case 25: {
				if(Distance > 30) return CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 12);
			}
			case 29: {
				if(Distance > 40) return CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 12);
			}
			case 22: {
				if(Distance > 50) return CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 12);
			}
			case 23: {
				if(Distance > 50) return CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 12);
			}
			case 24: {
				if(Distance > 50) return CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 12);
			}
        }
    }
    #if defined JAC_OnPlayerWeaponShot
	    return JAC_OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
    #else
		return 1;
	#endif
}

stock VehicleEngine(vehicleid)
{
	static
	    engine,
	    lights,
	    alarm,
	    doors,
	    bonnet,
	    boot,
	    objective;

	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);

	if (engine != 1)
		return 0;

	return 1;
}

stock IsPlaneVehicle(vehicleid)
{
	switch(GetVehicleModel(vehicleid)) {
		case 592, 577, 511, 512, 593, 520, 553, 476, 519, 460, 513, 548, 425, 417, 487, 488, 497, 563, 447, 469: return 1;
	}
	return 0;
}

public OnPlayerUpdate(playerid) 
{
	new vehid = GetPlayerVehicleID(playerid);
	if (vehid > -1) 
    {
		new Float:vehealth;
		GetVehicleHealth(vehid, vehealth);
		if (vehealth > 950)
		{
            CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 1);
		}
	}
	if (GetPlayerCameraMode(playerid) == 45 || GetPlayerCameraMode(playerid) == 34)
	{
		CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 2);
	}
    if (GetPVarInt(playerid, "LegalSpeed") == 0 && GetPlayerPing(playerid) < 200 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER && PlayerSpeed(playerid) >= 60 && PlayerSpeed(playerid) - OldSpeed[playerid] >= 20)
    {
        CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 7);
    }
    if (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && PlayerSpeed(playerid) - OldSpeed[playerid] >= 15)
    {
		CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 7);
	}
    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && GetPVarInt(playerid, "CarID") != vehid)
    {
        CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 3);
    }
    if(GetPlayerAnimationIndex(playerid) == 970 || GetPlayerAnimationIndex(playerid) == 966 || GetPlayerAnimationIndex(playerid) == 516)
    {
        CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 8);
    }
	if(GetPlayerAnimationIndex(playerid) == 402)
	{
		CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 9);
	}
	new surfingvehicle = GetPlayerSurfingVehicleID(playerid);
    new Float:svx, Float:svy, Float:svz, Float:npx, Float:npy, Float:npz;
    GetVehiclePos(surfingvehicle, svx, svy, svz);
    GetPlayerPos(playerid, npx, npy, npz);
    new Float:surfing = (svy + svx + svz) - (npx + npy + npz);
    if((surfingvehicle != 65535) && (surfing  < -30 || surfing > 30))
    {
	   CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 4);
    }
    new SurfingObject = GetPlayerSurfingObjectID(playerid);
    new Float:XObject, Float:YObject, Float:ZObject;
    GetObjectPos(SurfingObject, XObject, YObject, ZObject);
    new Float:surfing2 = (XObject + YObject + ZObject) - (npx + npy + npz);
    if((SurfingObject != 65535) && (surfing2  < -30 || surfing2 > 30))
	{
        CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 4);
	}
	new VehicleModel = GetVehicleModel(GetPlayerVehicleID(playerid));
	new SeatID = GetPlayerVehicleSeat(playerid);
	if(GetPlayerState(playerid) == PLAYER_STATE_PASSENGER && MaxPassangers(VehicleModel) < SeatID)
	{
		CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 6);
	}
	if(GetPlayerState(playerid) == PLAYER_STATE_PASSENGER && SeatID == 0)
	{
        CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 6);
	}
	new Float:airbreak = GetPlayerDistanceFromPoint(playerid, LastPosition[playerid][0], LastPosition[playerid][1], LastPosition[playerid][2]);
    if (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && GetPlayerSurfingVehicleID(playerid) == INVALID_VEHICLE_ID && GetPlayerAnimationIndex(playerid) != 1130)
    {
        if(PlayerSpeed(playerid) >= 5 && airbreak >= 5.0 && airbreak < 10.0)
        {
            CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 5);
        }
    }
    if (GetPlayerAnimationIndex(playerid) == 44 && PlayerSpeed(playerid) >= 5)
    {
		CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 10);
	}
	if (PlayerSpeed(playerid) - OldSpeed[playerid] >= 5 && PlayerSpeed(playerid) > 40 && !IsPlaneVehicle(GetPlayerVehicleID(playerid)) && !VehicleEngine(GetPlayerVehicleID(playerid)) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    {
        CallLocalFunction("OnPlayerCheatDetected", "ii", playerid, 11);
    }
    if (GetVehicleTrailer(vehid) > -1)
    {
        CallLocalFunction("OnPlayerChangedToTrailer", "iii", playerid, vehid, GetVehicleTrailer(vehid));
	}
	#if defined JAC_OnPlayerUpdate
	    return JAC_OnPlayerUpdate(playerid);
    #else
		return 1;
	#endif
}

#if defined JAC_OnPlayerWeaponShot
	forward JAC_OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
#endif

#if defined JAC_OnPlayerConnect
	forward JAC_OnPlayerConnect(playerid);
#endif

#if defined JAC_OnPlayerSpawn
	forward JAC_OnPlayerSpawn(playerid);
#endif

#if defined JAC_OnVehicleDamageStatusUpdate
	forward JAC_OnVehicleDamageStatusUpdate(vehicleid, playerid);
#endif

#if defined JAC_OnVehicleSpawn
	forward JAC_OnVehicleSpawn(vehicleid);
#endif

#if defined JAC_OnPlayerStateChange
	forward JAC_OnPlayerStateChange(playerid, newstate, oldstate);
#endif

#if defined JAC_OnVehicleMod
	forward JAC_OnVehicleMod(playerid, vehicleid, componentid);
#endif

#if defined JAC_OnVehiclePaintjob
	forward JAC_OnVehiclePaintjob(playerid, vehicleid, paintjobid);
#endif

#if defined JAC_OnVehicleRespray
	forward JAC_OnVehicleRespray(playerid, vehicleid, color1, color2);
#endif

#if defined JAC_OnPlayerUpdate
	forward JAC_OnPlayerUpdate(playerid);
#endif

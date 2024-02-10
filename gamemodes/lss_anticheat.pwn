const VEHICLE_SYNC = 200;
const BULLET_SYNC = 206;
const PLAYER_SYNC = 207;
const UNOCCUPIED_SYNC = 209;
const PASSENGER_SYNC = 211;

IPacket:UNOCCUPIED_SYNC(playerid, BitStream:bs)
{
    new unoccupiedData[PR_UnoccupiedSync];

    BS_IgnoreBits(bs, 8); // ignore packetid (byte)
    BS_ReadUnoccupiedSync(bs, unoccupiedData);

    if ((unoccupiedData[PR_roll][0] == unoccupiedData[PR_direction][0]) &&
        (unoccupiedData[PR_roll][1] == unoccupiedData[PR_direction][1]) &&
        (unoccupiedData[PR_roll][2] == unoccupiedData[PR_direction][2])
    ) {
        return 0;
    }

    if (IsNaN(unoccupiedData[PR_roll][0]) ||
        IsNaN(unoccupiedData[PR_roll][1]) ||
        IsNaN(unoccupiedData[PR_roll][2]) ||
        IsNaN(unoccupiedData[PR_direction][0]) ||
        IsNaN(unoccupiedData[PR_direction][1]) ||
        IsNaN(unoccupiedData[PR_direction][2]) ||
        IsNaN(unoccupiedData[PR_position][0]) ||
        IsNaN(unoccupiedData[PR_position][1]) ||
        IsNaN(unoccupiedData[PR_position][2]) ||
        IsNaN(unoccupiedData[PR_angularVelocity][0]) ||
        IsNaN(unoccupiedData[PR_angularVelocity][1]) ||
        IsNaN(unoccupiedData[PR_angularVelocity][2]) ||
        IsNaN(unoccupiedData[PR_velocity][0]) ||
        IsNaN(unoccupiedData[PR_velocity][1]) ||
        IsNaN(unoccupiedData[PR_velocity][2]) ||
        (floatabs(unoccupiedData[PR_roll][0]) > 1.0) ||
        (floatabs(unoccupiedData[PR_roll][1]) > 1.0) ||
        (floatabs(unoccupiedData[PR_roll][2]) > 1.0) ||
        (floatabs(unoccupiedData[PR_direction][0]) > 1.0) ||
        (floatabs(unoccupiedData[PR_direction][1]) > 1.0) ||
        (floatabs(unoccupiedData[PR_direction][2]) > 1.0) ||
        (floatabs(unoccupiedData[PR_position][0]) > 20000.0) ||
        (floatabs(unoccupiedData[PR_position][1]) > 20000.0) ||
        (floatabs(unoccupiedData[PR_position][2]) > 20000.0) ||
        (floatabs(unoccupiedData[PR_angularVelocity][0]) > 1.0) ||
        (floatabs(unoccupiedData[PR_angularVelocity][1]) > 1.0) ||
        (floatabs(unoccupiedData[PR_angularVelocity][2]) > 1.0) ||
        (floatabs(unoccupiedData[PR_velocity][0]) > 100.0) ||
        (floatabs(unoccupiedData[PR_velocity][1]) > 100.0) ||
        (floatabs(unoccupiedData[PR_velocity][2]) > 100.0)
    ) {
        return 0; // ignore bad packet
    }

    return 1;
}

IPacket:VEHICLE_SYNC(playerid, BitStream:bs)
{
    new inCarData[PR_InCarSync];

    BS_IgnoreBits(bs, 8);
    BS_ReadInCarSync(bs, inCarData);

    if(inCarData[PR_velocity][0] > 0.0 || inCarData[PR_velocity][1] > 0.0 || inCarData[PR_velocity][2] > 0.0)
    {
		if(!CarEngine[inCarData[PR_vehicleId]])
		{
			inCarData[PR_velocity][0] = inCarData[PR_velocity][1] = inCarData[PR_velocity][2] = 0.0;
			BS_SetWriteOffset(bs, 8);
        	BS_WriteInCarSync(bs, inCarData);
		}
    }

    new slot = Weapon_GetSlotID(inCarData[PR_weaponId]);
    if(slot == -1)
    {
		inCarData[PR_weaponId] = 0;

		BS_SetWriteOffset(bs, 8);
        BS_WriteInCarSync(bs, inCarData);
        BS_ResetReadPointer(bs);
        return 1;
    }

	if(inCarData[PR_weaponId] != 46 && inCarData[PR_weaponId] != 40 && inCarData[PR_weaponId] > 0 && inCarData[PR_weaponId] != PlayerData[playerid][pWeapons][slot])
	{
		//Player_RemoveWeapon(playerid, inCarData[PR_weaponId]);
		PlayerData[playerid][pWeapons][slot] = PlayerData[playerid][pWeaponsAmmo][slot] = 0;

		inCarData[PR_weaponId] = 0;
 		BS_SetWriteOffset(bs, 8);
        BS_WriteInCarSync(bs, inCarData);
	}

    BS_ResetReadPointer(bs);
    return 1;
}

IPacket:BULLET_SYNC(playerid, BitStream:bs)
{
    new bulletData[PR_BulletSync];

    BS_IgnoreBits(bs, 8);
    BS_ReadBulletSync(bs, bulletData);

    new slot = Weapon_GetSlotID(bulletData[PR_weaponId]);
    if(slot == -1)
    {
		bulletData[PR_weaponId] = 0;

		BS_SetWriteOffset(bs, 8);
        BS_WriteBulletSync(bs, bulletData);
        BS_ResetReadPointer(bs);
        return 1;
    }

	if(bulletData[PR_weaponId] != 46 && bulletData[PR_weaponId] != 40 && bulletData[PR_weaponId] > 0 && bulletData[PR_weaponId] != PlayerData[playerid][pWeapons][slot])
	{
		PlayerData[playerid][pWeapons][slot] = PlayerData[playerid][pWeaponsAmmo][slot] = 0;

		bulletData[PR_weaponId] = 0;

		BS_SetWriteOffset(bs, 8);
        BS_WriteBulletSync(bs, bulletData);
	}

    BS_ResetReadPointer(bs);
    return 1;
}

IPacket:PLAYER_SYNC(playerid, BitStream:bs)
{
	//if(NetStats_GetConnectedTime(playerid) - PlayerConnectionTick[playerid] < 300) return 1;

    new onFootData[PR_OnFootSync];

    BS_IgnoreBits(bs, 8);
    BS_ReadOnFootSync(bs, onFootData);

	if(onFootData[PR_velocity][1] > 0.1)
	{
		onFootData[PR_velocity][1] = 0;
		BS_SetWriteOffset(bs, 8);
        BS_WriteOnFootSync(bs, onFootData);
	}

    new slot = Weapon_GetSlotID(onFootData[PR_weaponId]);
   	if(slot == -1)
   	{
		onFootData[PR_weaponId] = 0;

		BS_SetWriteOffset(bs, 8);
        BS_WriteOnFootSync(bs, onFootData);
        BS_ResetReadPointer(bs);
        return 1;
   	}

	if(onFootData[PR_weaponId] != PlayerData[playerid][pWeapons][slot])
	{
		PlayerData[playerid][pWeapons][slot] = PlayerData[playerid][pWeaponsAmmo][slot] = 0;

		onFootData[PR_weaponId] = 0;
		BS_SetWriteOffset(bs, 8);
        BS_WriteOnFootSync(bs, onFootData);
	}

    BS_ResetReadPointer(bs);
    return 1;
}

IPacket:PASSENGER_SYNC(playerid, BitStream:bs)
{
    new passengerData[PR_PassengerSync];

    BS_IgnoreBits(bs, 8);
    BS_ReadPassengerSync(bs, passengerData);

    new slot = Weapon_GetSlotID(passengerData[PR_weaponId]);
    if(slot == -1)
    {
		passengerData[PR_weaponId] = 0;

		BS_SetWriteOffset(bs, 8);
        BS_WritePassengerSync(bs, passengerData);
        BS_ResetReadPointer(bs);
        return 1;
    }

	if(passengerData[PR_weaponId] != 46 && passengerData[PR_weaponId] != 40 && passengerData[PR_weaponId] > 0 && passengerData[PR_weaponId] != PlayerData[playerid][pWeapons][slot])
	{
		PlayerData[playerid][pWeapons][slot] = PlayerData[playerid][pWeaponsAmmo][slot] = 0;

        passengerData[PR_weaponId] = 0;

        BS_SetWriteOffset(bs, 8);
        BS_WritePassengerSync(bs, passengerData);
    }

    BS_ResetReadPointer(bs);
    return 1;
}

public OnIncomingRPC(playerid, rpcid, BitStream:bs)
{
	if(playerid == INVALID_PLAYER_ID) return 0;

	switch(rpcid)
	{
		case 115: // GiveTakeDamage
		{
			new bool: bGiveOrTake, Float: damage_amount, wPlayerID, dWeaponID, dBodypart;
			BS_ReadValue(bs, PR_BOOL, bGiveOrTake, PR_UINT16, wPlayerID, PR_FLOAT, damage_amount, PR_UINT32, dWeaponID, PR_UINT32, dBodypart);
			new slot = Weapon_GetSlotID(dWeaponID);

		}
	}
	return 1;
}

public OnOutcomingRPC(playerid, rpcid, BitStream:bs)
{
	if(playerid == INVALID_PLAYER_ID) return 0;

	switch(rpcid)
	{
		case 21: // ResetPlayerWeapons
		{
			for(new i = 0; i < 4; i++)
			{
				PlayerData[playerid][pWeapons][i] = 0;
				PlayerData[playerid][pWeaponsAmmo][i] = 0;
			}
		}
		case 22: // GivePlayerWeapon
		{
			new weapid, weapammo, slot;
			BS_ReadValue(bs, PR_UINT32, weapid, PR_UINT32, weapammo);
			BS_ResetReadPointer(bs);

			slot = Weapon_GetSlotID(weapid);
			if(slot == -1) return 0;

			PlayerData[playerid][pWeapons][slot] = weapid;
			PlayerData[playerid][pWeaponsAmmo][slot] = weapammo;

			if((weapid > 21 && weapid < 35) || weapid == 38) // Weapons that fire bullets only.
			{
				BS_SetWriteOffset(bs, 32);
				BS_WriteValue(bs, PR_UINT32, weapammo);
			}
		}
		case 145: // SetPlayerAmmo
		{
			new weapid, weapammo, slot;
			BS_ReadValue(bs, PR_UINT8, weapid, PR_INT16, weapammo);

			slot = Weapon_GetSlotID(weapid);
			if(weapammo > 0 && ((weapid > 21 && weapid < 35) || weapid == 38))
			{
				PlayerData[playerid][pWeaponsAmmo][slot] = weapammo;
				return 0; // Don't allow it to be sent.
			}
			else
			{
				if(weapid > 15) // Melee weaps can't be removed by setting their ammo to 0.
				{
					PlayerData[playerid][pWeapons][slot] = weapammo;
				}
			}

			BS_ResetReadPointer(bs);
		}
		case 70: // PutPlayerInVehicle
		{
			new vehicleid, seatid;
			BS_ReadValue(bs, PR_UINT16, vehicleid, PR_UINT8, seatid);

			if(vehicleid != INVALID_VEHICLE_ID && seatid != 128)
			{
				playerEnteringVehicle[playerid] = vehicleid;
			}

			BS_ResetReadPointer(bs);
		}
	}
	return 1;
}

SS_GetPlayerWeaponData(playerid, slot, &weapon, &ammo)
{
	if(!IsPlayerConnected(playerid) || (slot < 0 || slot > 12))
	{
		return 0;
	}

	GetPlayerWeaponData(playerid, slot, weapon, ammo);

	if(weapon != 46 && weapon != 40)
	{
		if(Weapon_GetSlotID(weapon) == -1) return 0;
		weapon = PlayerData[playerid][pWeapons][Weapon_GetSlotID(weapon)];
	}

	if((weapon > 21 && weapon < 35) || weapon == 38)
	{
		if(Weapon_GetSlotID(weapon) == -1) return 0;
		ammo = PlayerData[playerid][pWeaponsAmmo][Weapon_GetSlotID(weapon)];
	}

	return 1;
}

#if defined _ALS_GetPlayerWeaponData
#undef GetPlayerWeaponData
#else
#define _ALS_GetPlayerWeaponData
#endif
#define GetPlayerWeaponData SS_GetPlayerWeaponData

/*SS_GetPlayerAmmo(playerid)
{
	if(!IsPlayerConnected(playerid))
	{
		return 0;
	}

	new
		weapid = GetPlayerWeapon(playerid);

	if(weapid)
	{
		if((weapid > 21 && weapid < 35) || weapid == 38) return PlayerData[i][pWeaponsAmmo][Weapon_GetSlotID(weapid)];
		else return GetPlayerAmmo(playerid);
	}

	return 0;
}

#if defined _ALS_GetPlayerAmmo
#undef GetPlayerAmmo
#else
#define _ALS_GetPlayerAmmo
#endif
#define GetPlayerAmmo SS_GetPlayerAmmo*/

new VehicleDestroyed = 136;

IRPC:VehicleDestroyed(playerid, BitStream:bs)
{
    new vehicleid;

    BS_ReadUint16(bs, vehicleid);

    if (GetVehicleModel(vehicleid) < 400)
    {
        return 0;
    }

    return OnVehicleRequestDeath(vehicleid, playerid);
}

forward OnVehicleRequestDeath(vehicleid, killerid);
public OnVehicleRequestDeath(vehicleid, killerid)
{
    new Float:health;

    GetVehicleHealth(vehicleid, health);

    if (health >= 250.0)
    {
        return 0;
    }

    return 1;
}

Server:OnCheatDetected(playerid, ip_address[], type, code)
{
//	new
//		string[128];

    if(type)
    {

    }
    else //Responded to the player ID
    {
		switch(code)
		{
		    case 0, 1:
		    {
		    	//SendAdminMessageEx(COLOR_YELLOW, "%s(%d) isimli oyuncu airbreak hilesi kullanýyor olabilir.", ReturnName(playerid, 0), playerid);
	         	//SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine airbreak hilesi yaptýðýný tespit etti.");
		        //KickEx(playerid);
		    }
		    case 2, 3, 4, 6:
		    {
	         	SendAdminMessageEx(COLOR_YELLOW, "%s(%d) isimli oyuncu teleport hilesi kullanýyor olabilir.", ReturnName(playerid, 0), playerid);
		        //KickEx(playerid);
		    }
		    case 5: return 1;
		    case 7, 8:
		    {
	         	SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine fly hilesi yaptýðýný tespit etti.");
		        //KickEx(playerid);
		    }
		    case 9, 10:
		    {
		    	if(!IsPlayerFalling(playerid)) SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine speed hilesi yaptýðýný tespit etti.");
		        //KickEx(playerid);
		    }
      		case 11: //Repair car, it is better to return the old hp (if cheater will not set old hp - anti-nop will detect him)
            {
                new vehid = GetPlayerVehicleID(playerid), Float:vhealth;
                AntiCheatGetVehicleHealth(vehid, vhealth);
                SetVehicleHealth(vehid, vhealth);

				//KickEx(playerid); // araç tamir hilesi
                return 1;
            }
		    case 12, 13:
		    {
	         	SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine health/armour hilesi yaptýðýný tespit etti.");
		        //KickEx(playerid);
		    }
		    case 15:
		    {
		    	SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine silah hilesi yaptýðýný tespit etti.");
               // SendClientMessage(playerid, COLOR_WHITE, "_________________________________________________________________________");
	  			//SendClientMessageEx(playerid, COLOR_ADM, "[!] {F8E687}%s tarihinde The Machine silah hilesi yaptýðýný tespit etti.", GetFullTime(Time()));
	  			//SendClientMessage(playerid, COLOR_GREY, "SERVER: Eðer bu yasaklamanýn hatalý olduðunu düþünüyorsan, itiraz edebilirsin.");
		        //SendClientMessage(playerid, COLOR_WHITE, "_________________________________________________________________________");
		        KickEx(playerid);
		        return 1;
		    }
		    case 16, 17:
		    {
	  			SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine mermi hilesi yaptýðýný tespit etti.");
		        //KickEx(playerid);
		    }
		    case 18:
		    {
	  			SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine animasyon hilesi yaptýðýný tespit etti.");
		        //KickEx(playerid);
		    }
		    case 19, 20:
		    {
	  			SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine god-mode hilesi yaptýðýný tespit etti.");
		        //KickEx(playerid);
		    }
		    case 21:
		    {
	  			SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine görünmezlik hilesi yaptýðýný tespit etti.");
		        //KickEx(playerid);
		    }
		    case 22:
		    {
	  			SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine lag-comp-spoof hilesi yaptýðýný tespit etti.");
		        //KickEx(playerid);
		    }
		    case 23:
		    {
	  			SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine modifiye hilesi yaptýðýný tespit etti.");
		        //KickEx(playerid);
		    }
		    case 26:
		    {
	  			SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine rapid-fire hilesi yaptýðýný tespit etti.");
		        //KickEx(playerid);
		    }
		    case 27:
		    {
	  			SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine fake-spawn hilesi yaptýðýný tespit etti.");
		        //KickEx(playerid);
		    }
		    case 28:
		    {
	  			SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine fake-kill hilesi yaptýðýný tespit etti.");
		        //KickEx(playerid);
		    }
		    case 29:
		    {
	  			SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine pro-aim hilesi yaptýðýný tespit etti.");
		        //KickEx(playerid);
		    }
		    case 30:
		    {
	  			SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine CJ-Run hilesi yaptýðýný tespit etti.");
		        //KickEx(playerid);
		    }
		    case 31, 32:
		    {
		    	//SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine krdþ napýyon yaptýðýný tespit etti.");
		    }
		    case 35:
		    {
	  			SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine full-aim hilesi yaptýðýný tespit etti.");
		        //KickEx(playerid);
		    }
		    case 36:
		    {
	  			SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine npc-aim hilesi yaptýðýný tespit etti.");
		        //KickEx(playerid);
		    }
		    case 39:
		    {
		        //KickEx(playerid);
		    }
		    case 40:
		    {
	  			SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine sandbox kullandýðýný tespit etti.");
		        //KickEx(playerid);
		    }
		    case 41:
		    {
	  			SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine geçersiz SA-MP sürümü kullandýðýný tespit etti.");
		        //KickEx(playerid);
		    }
		    case 42:
		    {
	  			SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine rcon hilesi yaptýðýný tespit etti.");
		        //KickEx(playerid);
		    }
		    case 43, 44, 45, 46: // 47 - silah
		    {

	  			SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine crasher-type hilesi yaptýðýný tespit etti.");

		        KickEx(playerid);
		    }
		    case 48:
		    {
	  			SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine connection-flood hilesi yaptýðýný tespit etti.");
		        //KickEx(playerid);
		    }
		    case 51:
		    {
	  			SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine anti-dos hilesi yaptýðýný tespit etti.");
		        //KickEx(playerid);
		    }
		    case 52:
		    {
	  			SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}The Machine anti-nop hilesi yaptýðýný tespit etti.");
		        //KickEx(playerid);
		    }
	    }
  	}
    return 1;
}

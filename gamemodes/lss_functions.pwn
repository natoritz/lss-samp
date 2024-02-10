forward Float:GetDistanceBetweenPoints(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2);
public Float:GetDistanceBetweenPoints(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2)
{
    return VectorSize(x1-x2, y1-y2, z1-z2);
}

GetDynamicPlayerPos(playerid, &Float:x, &Float:y, &Float:z)
{
    new world = GetPlayerVirtualWorld(playerid);
    if(world == 0)
    {
        GetPlayerPos(playerid, x, y, z);
    }
    else
    {
        new p = IsPlayerInProperty(playerid);
        new b = IsPlayerInBusiness(playerid);
        new g = PlayerData[playerid][pInsideGarage];

        if(p != -1)
        {
            x = PropertyData[p][PropertyEnter][0];
            y = PropertyData[p][PropertyEnter][1];
            z = PropertyData[p][PropertyEnter][2];
        }
        else if(b != -1)
        {
            x = BusinessData[b][EnterPos][0];
            y = BusinessData[b][EnterPos][1];
            z = BusinessData[b][EnterPos][2];
        }
        else if(g != -1)
        {
            x = GarageData[g][GaragePos][0];
            y = GarageData[g][GaragePos][1];
            z = GarageData[g][GaragePos][2];
        }
        else
        {
            GetPlayerPos(playerid, x, y, z);
        }
    }
    return 1;
}

GetNearestAntenna(playerid, Float:radius = 600.0)
{
    new Float:x, Float:y, Float:z, Float:distance, result = -1;
    GetDynamicPlayerPos(playerid, x, y, z);

    if(GetPlayerInterior(playerid) != 0)
    {
        result = 5;
        return result;
    }

    foreach(new j : Antennas)
    {
        Streamer_GetDistanceToItem(x, y, z, STREAMER_TYPE_OBJECT, AntennaData[j][AntennaObject], distance);
        if(distance < radius)
        {
            radius = distance;
            result = j;
        }
        continue;
    }
    return (result == -1) ? (-1) : (radius <= 600.0 - 75.0) ? (result) : (MAX_ANTENNAS + result);
}

GetNearestAntennaEx(playerid, Float:radius = 600.0)
{
    new Float:x, Float:y, Float:z, Float:distance, result = 0;
    GetDynamicPlayerPos(playerid, x, y, z);

    foreach(new j : Antennas)
    {
        Streamer_GetDistanceToItem(x, y, z, STREAMER_TYPE_OBJECT, AntennaData[j][AntennaObject], distance);
        if(distance < radius)
        {
            radius = distance;
            if((0.0 <= radius <= 100.0)) result = 5;
            else if((101.0 <= radius <= 200.0)) result = 4;
            else if((201.0 <= radius <= 300.0)) result = 3;
            else if((301.0 <= radius <= 400.0)) result = 2;
            else if((401.0 <= radius <= 600.0)) result = 1;
            else result = 0;
        }
        continue;
    }

    if(GetPlayerInterior(playerid) != 0)
    {
        result = 5;
    }

    return result;
}

stock PlayerPlaySoundEx(playerid, sound)
{
    new
        Float:x,
        Float:y,
        Float:z;

    GetPlayerPos(playerid, x, y, z);

    foreach (new i : Player) if (IsPlayerInRangeOfPoint(i, 20.0, x, y, z)) {
        PlayerPlaySound(i, sound, x, y, z);
    }
    return 1;
}

ContainsInvalidCharacters(txt[])
{
    for(new j = 0; j < strlen(txt); j++)
    {
        switch(txt[j])
        {
            case '>', '<', '\"', '!', '@', '#', '£', '€', '%', '/', '\\', '´', '`', '~', '§', '*', '-', '+', ':', '.', '½', 'ý', 'ü', 'ð', 'þ', 'ö', 'ç', 'Ç', 'Ö', 'Þ', 'Ý', 'Ð', 'Ü', '[', ']', '™':
            {
                return true;
            }
        }
    }
    return false;
}

AttachPlayerPhone(playerid)
{
    switch(PlayerData[playerid][pPhoneType])
    {
        case PHONE_TYPE_BLACK:
        {
            PlayerTextDrawBoxColor(playerid, PhoneFrame[playerid][0], 255);
            PlayerTextDrawColor(playerid, PhoneFrame[playerid][1], -1);
            PlayerTextDrawColor(playerid, PhoneFrame[playerid][2], -1); // 18868
            SetPlayerAttachedObject(playerid, SLOT_PHONE, 18868, 6, 0.064999, 0.043999, 0.004999, -112.0, 0.0, -178.9);
        }
        case PHONE_TYPE_RED:
        {
            PlayerTextDrawBoxColor(playerid, PhoneFrame[playerid][0], 1225921279);
            PlayerTextDrawColor(playerid, PhoneFrame[playerid][1], 1225921279);
            PlayerTextDrawColor(playerid, PhoneFrame[playerid][2], 1225921279);
            SetPlayerAttachedObject(playerid, SLOT_PHONE, 18870, 6, 0.064999, 0.043999, 0.004999, -112.0, 0.0, -178.9);
        }
        case PHONE_TYPE_BLUE:
        {
            PlayerTextDrawBoxColor(playerid, PhoneFrame[playerid][0], 456290303);
            PlayerTextDrawColor(playerid, PhoneFrame[playerid][1], 456290303);
            PlayerTextDrawColor(playerid, PhoneFrame[playerid][2], 456290303);
            SetPlayerAttachedObject(playerid, SLOT_PHONE, 18866, 6, 0.064999, 0.043999, 0.004999, -112.0, 0.0, -178.9);
        }
    }
    return 1;
}


Phone_ShowUI(playerid)
{
    Phone_HideUI(playerid);

    PlayerData[playerid][pUseGUI] = true;
    PhoneData[playerid][pCurrentPage] = PAGE_HOME;

    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
    ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 0, 0, 0, 0, 0);
    AttachPlayerPhone(playerid);

    PlayerTextDrawSetString(playerid, PhoneTime[playerid], GetHour());
    PlayerTextDrawSetString(playerid, PhoneDate[playerid], GetDate());

    if(PlayerData[playerid][pPhoneOff])
        PlayerTextDrawBoxColor(playerid, PhoneDisplay[playerid], 255);

    for(new i = 0; i < 3; i++) PlayerTextDrawShow(playerid, PhoneFrame[playerid][i]);
    PlayerTextDrawShow(playerid, PhoneLogo[playerid]);
    PlayerTextDrawShow(playerid, PhoneSwitch[playerid]);
    PlayerTextDrawShow(playerid, PhoneInfo[playerid]);
    PlayerTextDrawShow(playerid, PhoneDisplay[playerid]);
    PlayerTextDrawShow(playerid, PhoneBtnL[playerid]);
    PlayerTextDrawShow(playerid, PhoneBtnR[playerid]);
    PlayerTextDrawShow(playerid, PhoneArrowUp[playerid]);
    PlayerTextDrawShow(playerid, PhoneArrowDown[playerid]);
    PlayerTextDrawShow(playerid, PhoneArrowLeft[playerid]);
    PlayerTextDrawShow(playerid, PhoneArrowRight[playerid]);
    PlayerTextDrawShow(playerid, PhoneBtnMenu[playerid]);
    PlayerTextDrawShow(playerid, PhoneBtnBack[playerid]);
    PlayerTextDrawShow(playerid, PhoneDate[playerid]);
    PlayerTextDrawShow(playerid, PhoneTime[playerid]);
    PlayerTextDrawShow(playerid, PhoneSignal[playerid]);
    PlayerTextDrawShow(playerid, PhoneDate[playerid]);
    PlayerTextDrawShow(playerid, PhoneTime[playerid]);
    PlayerTextDrawShow(playerid, PhoneNotify[playerid]);
    SelectTextDraw(playerid, COLOR_GREY);
    return 1;
}

Phone_HideUI(playerid)
{
    PlayerData[playerid][pUseGUI] = false;
    PhoneData[playerid][pCurrentPage] = PAGE_NONE;
    RemovePlayerAttachedObject(playerid, SLOT_PHONE);
    CancelSelectTextDraw(playerid);

    for(new i = 0; i < 3; i++) PlayerTextDrawHide(playerid, PhoneFrame[playerid][i]), PlayerTextDrawHide(playerid, PhoneList[playerid][i]);
    PlayerTextDrawHide(playerid, PhoneLogo[playerid]);
    PlayerTextDrawHide(playerid, PhoneSwitch[playerid]);
    PlayerTextDrawHide(playerid, PhoneInfo[playerid]);
    PlayerTextDrawHide(playerid, PhoneDisplay[playerid]);
    PlayerTextDrawHide(playerid, PhoneBtnL[playerid]);
    PlayerTextDrawHide(playerid, PhoneBtnR[playerid]);
    PlayerTextDrawHide(playerid, PhoneArrowUp[playerid]);
    PlayerTextDrawHide(playerid, PhoneArrowDown[playerid]);
    PlayerTextDrawHide(playerid, PhoneArrowLeft[playerid]);
    PlayerTextDrawHide(playerid, PhoneArrowRight[playerid]);
    PlayerTextDrawHide(playerid, PhoneBtnMenu[playerid]);
    PlayerTextDrawHide(playerid, PhoneBtnBack[playerid]);
    PlayerTextDrawHide(playerid, PhoneDate[playerid]);
    PlayerTextDrawHide(playerid, PhoneTime[playerid]);
    PlayerTextDrawHide(playerid, PhoneSignal[playerid]);
    PlayerTextDrawHide(playerid, PhoneDate[playerid]);
    PlayerTextDrawHide(playerid, PhoneTime[playerid]);
    PlayerTextDrawHide(playerid, PhoneNotify[playerid]);
    PlayerTextDrawHide(playerid, PhoneSMSInfo[playerid]);
    PlayerTextDrawHide(playerid, PhoneListName[playerid]);
    return 1;
}

Phone_ShowMenu(playerid, bool:show, page)
{
    if(show)
    {
        switch(page)
        {
            case PAGE_HOME: PlayerTextDrawSetString(playerid, PhoneListName[playerid], "Telefon~n~Rehber~n~Ayarlar");
            case PAGE_MENU: PlayerTextDrawSetString(playerid, PhoneListName[playerid], "Telefon~n~Rehber~n~Ayarlar");
            case PAGE_NOTEBOOK: PlayerTextDrawSetString(playerid, PhoneListName[playerid], "Ara~n~SMS~n~Kisiler");
            case PAGE_CONTACT: PlayerTextDrawSetString(playerid, PhoneListName[playerid], "Kisi_Ekle~n~Kisi_Duzenle~n~Kisi_Sil");
            case PAGE_SETTING: PlayerTextDrawSetString(playerid, PhoneListName[playerid], "Zil_Sesi~n~Tema~n~Telefon_Modu");
            case PAGE_RINGTONE: PlayerTextDrawSetString(playerid, PhoneListName[playerid], "Zil_Sesi_1~n~Zil_Sesi_2~n~Bos");
            case PAGE_PHONECOLOR: PlayerTextDrawSetString(playerid, PhoneListName[playerid], "Siyah~n~Kirmizi~n~Mavi");
            case PAGE_PHONEMODE: PlayerTextDrawSetString(playerid, PhoneListName[playerid], "Normal~n~Sessiz");
            case PAGE_USERS:
            {
                SetPVarInt(playerid, "ContactList", 0);
                new user_page = GetPVarInt(playerid, "ContactList");
                ShowContactMembers(playerid, user_page);
            }
        }

        PlayerTextDrawShow(playerid, PhoneListName[playerid]);
        for(new i = 0; i < 3; i ++) PlayerTextDrawShow(playerid, PhoneList[playerid][i]);

        PlayerTextDrawHide(playerid, PhoneDate[playerid]);
        PlayerTextDrawHide(playerid, PhoneTime[playerid]);
        PlayerTextDrawHide(playerid, PhoneSignal[playerid]);
        PlayerTextDrawHide(playerid, PhoneNotify[playerid]);
        PlayerTextDrawHide(playerid, PhoneBtnMenu[playerid]);
        PlayerTextDrawHide(playerid, PhoneBtnBack[playerid]);

    }
    else
    {
        PhoneData[playerid][pCurrentPage] = PAGE_NONE;
        PlayerTextDrawHide(playerid, PhoneListName[playerid]);
        for(new i = 0; i < 3; i ++) PlayerTextDrawHide(playerid, PhoneList[playerid][i]);

        Phone_HideUI(playerid);
        Phone_ShowUI(playerid);
    }
    return 1;
}

Phone_Switch(playerid)
{
    if(PlayerData[playerid][pPhoneOff])
    {
        PlayerTextDrawHide(playerid, PhoneDisplay[playerid]);
        PlayerTextDrawBoxColor(playerid, PhoneDisplay[playerid], 255);
        PlayerTextDrawShow(playerid, PhoneDisplay[playerid]);
        PlayerTextDrawSetString(playerid, PhoneNotify[playerid], "Yukleniyor..");
    }
    else
    {
        for(new i = 0; i < 3; i++) PlayerTextDrawHide(playerid, PhoneList[playerid][i]);
        PlayerTextDrawHide(playerid, PhoneListName[playerid]);

        PlayerTextDrawHide(playerid, PhoneDisplay[playerid]);
        PlayerTextDrawBoxColor(playerid, PhoneDisplay[playerid], 255);
        PlayerTextDrawShow(playerid, PhoneDisplay[playerid]);
        PlayerTextDrawSetString(playerid, PhoneNotify[playerid], "Gorusmek_uzere!");
    }

    return SetTimerEx("Phone_Toggle", 2500, false, "i", playerid);
}

stock HasNoEngine(vehicleid)
{
    switch(GetVehicleModel(vehicleid))
    {
        case 481, 509, 510: return 1;
    }
    return 0;
}

Car_RefreshWeapons(vehicleid)
{
    for(new slot = 1; slot < MAX_WEP_SLOT; slot++)
    {
        vehicle_weap_data[vehicleid][slot][data_id] = 0;

        switch(CarData[vehicleid][carModel])
        {
            case 409, 528, 427, 579, 426:
            {
                vehicle_weap_data[vehicleid][slot][veh_wep] = trunk_weapons_swat[slot][0];
                vehicle_weap_data[vehicleid][slot][veh_ammo] = trunk_weapons_swat[slot][1];
            }
            default:
            {
                vehicle_weap_data[vehicleid][slot][veh_wep] = trunk_weapons[slot][0];
                vehicle_weap_data[vehicleid][slot][veh_ammo] = trunk_weapons[slot][1];
            }
        }

        vehicle_weap_data[vehicleid][slot][veh_id] = CarData[vehicleid][carID];
        if(IsValidDynamicObject(vehicle_weap_data[vehicleid][slot][temp_object])) DestroyDynamicObject(vehicle_weap_data[vehicleid][slot][temp_object]);
        for(new j = 0; j < 6; j++) vehicle_weap_data[vehicleid][slot][wep_offset][j] = 0.0;
        vehicle_weap_data[vehicleid][slot][is_exist] = true;
    }
    return 1;
}

Ship_Update()
{
    if(time_truck-- == 0)
    {
        time_truck = 3600;
        CheckIndustries();
    }

    switch(ship_docked)
    {
        case 1: // kalkýþ
        {
            if(ship_depart <= Time()+40 && ship_steps == 0)
            {
                foreach (new i : Player)
                {
                    if(!IsPlayerInRangeOfPoint(i, 75.0, 2805.6328, -2392.6589, 13.6409)) continue;

                    SendClientMessage(i, COLOR_WHITE, "_______________________________________________________________________________");
                    SendClientMessage(i, COLOR_ADM,   "Dikkat! Gemi 40 saniye içinde kalkacak, 20 saniye içinde rampalar kapanacaktýr.");
                    SendClientMessage(i, COLOR_WHITE, "Kalmaya karar verdiysen, gemi hareket ederken sakýn ZIPLAMA, bu seni öldürebilir.");
                    SendClientMessage(i, COLOR_WHITE, "GEMÝ HAREKET EDERKEN ARACIN ÝÇÝNDE OTURMAYINIZ!");
                    SendClientMessage(i, COLOR_WHITE, "_______________________________________________________________________________");
                    GameTextForPlayer(i, "~r~DIKKAT~n~~w~GEMI 40 SANIYE~n~~w~ICINDE KALKACAK!", 5000, 1);
                }

                ship_steps = 1;
            }
            else if(ship_depart <= Time()+20 && ship_steps == 1)
            {
                new
                    Float: ox,
                    Float: oy,
                    Float: oz,
                    Float: rx,
                    Float: ry,
                    Float: rz;

                for(new i; i != 11; i++)
                {
                    if(i < 9)
                        Streamer_SetIntData(STREAMER_TYPE_OBJECT, obj_lamp[i], E_STREAMER_MODEL_ID, 19124);

                    if(i < 2)
                    {
                        GetDynamicObjectPos(obj_gate[i], ox, oy, oz);
                        GetDynamicObjectRot(obj_gate[i], rx, ry, rz);
                        MoveDynamicObject(obj_gate[i], ox, oy, oz, 0.0005, rx, ry, rz);
                    }
                }

                ship_steps = 2;
            }
            else if(ship_depart <= Time())
            {
                foreach(new i : Trucker)
                {
                    if(TruckerData[i][tType] != 2)
                        continue; // gemi olmayanlarý pas geç

                    Streamer_SetIntData(STREAMER_TYPE_3D_TEXT_LABEL, TruckerData[i][tLabel], E_STREAMER_INTERIOR_ID, 53);
                    Streamer_SetIntData(STREAMER_TYPE_PICKUP, TruckerData[i][tPickup], E_STREAMER_INTERIOR_ID, 53);
                }

                mysql_tquery(m_Handle, "UPDATE truck_cargo SET storage = 0 WHERE type = 2");

                ship_docked = 2;
                ship_steps = 0;

                new
                    Float: ox,
                    Float: oy,
                    Float: oz;

                GetDynamicObjectPos(obj_ship, ox, oy, oz);
                MoveDynamicObject(obj_ship, ox, oy - 600.0, oz, 10.0);
            }
        }
        case 0: // geri dönüþ
        {
            if(ship_next <= Time())
            {
                ship_docked = 3;

                new Float: ox,
                    Float: oy,
                    Float: oz;

                GetDynamicObjectPos(obj_ship, ox, oy, oz);
                MoveDynamicObject(obj_ship, ox, oy + 600.0, oz, 10.0);
            }
        }
    }
    return 1;
}

/*IsPlayerArmed(playerid)
{
    new
        weapon,
        ammo;

    for (new i = 0; i < 13; i ++) {
        GetPlayerWeaponData(playerid, i, weapon, ammo);

        if (ammo > 0) {
            switch (weapon) {
                case 1, 2, 4, 6, 8, 9, 15, 22..38: return 1;
            }
        }
    }
    return 0;
}*/

TriggerAlarm(vehicleid, street[], level)
{
    switch(level)
    {
        case 1:
        {
            ToggleVehicleAlarms(vehicleid, true, 60000);
        }
        case 2:
        {
            NotifyVehicleOwner(vehicleid);
            ToggleVehicleAlarms(vehicleid, true, 120000);
        }
        case 3:
        {
            NotifyVehicleOwner(vehicleid);
            ToggleVehicleAlarms(vehicleid, true, 180000);

            foreach(new i : Player) if(PlayerData[i][pLAWduty])
            {
                SendClientMessage(i, COLOR_RED, sprintf("* [Araba Alarmý] %s bölgesinde %s model aracýn alarmý çalýyor.", street, ReturnVehicleName(vehicleid)));
            }
        }
        case 4:
        {
            NotifyVehicleOwner(vehicleid);
            ToggleVehicleAlarms(vehicleid, true, 240000);

            foreach(new i : Player) if(PlayerData[i][pLAWduty])
            {
                SendClientMessage(i, COLOR_RED, sprintf("* [Araba Alarmý] %s bölgesinde %s model aracýn alarmý çalýyor.", street, ReturnVehicleName(vehicleid)));
            }
        }
    }
    return 1;
}

VehicleHasDoors(vehicleid)
{
    switch (GetVehicleModel(vehicleid))
    {
        case 400..424, 426..429, 431..440, 442..445, 451, 455, 456, 458, 459, 466, 467, 470, 474, 475, 477..480, 482, 483, 486, 489, 490..492, 494..496, 498..500, 502..508, 514..518, 524..529, 533..536, 540..547, 549..552, 554..562, 565..568, 573, 575, 576, 578..580, 582, 585, 587..589, 596..605, 609:
            return 1;
    }
    return 0;
}

SetPlayerCellphoneAction(playerid, enable)
{
    if (GetPlayerTeam(playerid) == STATE_ALIVE || PlayerData[playerid][pHandcuffed])
    {
        return 0;
    }
    else
    {
        if (VehicleHasDoors(GetPlayerVehicleID(playerid)) && PlayerData[playerid][pPlayingAnimation])
        {
            PlayerData[playerid][pPlayingAnimation] = false;
        }

        if (enable)
        {
            if (VehicleHasDoors(GetPlayerVehicleID(playerid))) ApplyAnimation(playerid, "CAR_CHAT", "carfone_in", 4.1, 0, 0, 0, 1, 0, 1);
            else SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
        }
        else
        {
            if (VehicleHasDoors(GetPlayerVehicleID(playerid))) ApplyAnimation(playerid, "CAR_CHAT", "carfone_out", 4.1, 0, 0, 0, 0, 0, 1);
            else SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
        }
    }
    return 1;
}

Label_Create(playerid, params[])
{
    new id = -1;
    id = Iter_Free(Labels);
    if (id == -1) return SendErrorMessage(playerid, "Þu anda daha fazla bilgi yazýsý eklenemiyor.");

    GetPlayerPos(playerid, LabelData[id][label_pos][0], LabelData[id][label_pos][1], LabelData[id][label_pos][2]);
    LabelData[id][label_virtualworld] = GetPlayerVirtualWorld(playerid);
    LabelData[id][label_interior] = GetPlayerInterior(playerid);

    format(LabelData[id][label_location], 40, "%s", Player_GetLocation(playerid));
    format(LabelData[id][label_placedby], 34, "%s", ReturnName(playerid));

    LabelData[id][label_3D] = CreateDynamic3DTextLabel(sprintf("(( %s )) %s", ReturnName(playerid, 1), params), COLOR_EMOTE, LabelData[id][label_pos][0], LabelData[id][label_pos][1], LabelData[id][label_pos][2], 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, LabelData[id][label_virtualworld], LabelData[id][label_interior]);
    new array[2]; array[0] = 21; array[1] = id;

    LabelData[id][LabelAreaID] = CreateDynamicSphere(LabelData[id][label_pos][0], LabelData[id][label_pos][1], LabelData[id][label_pos][2], 2.0, LabelData[id][label_virtualworld], LabelData[id][label_interior]);
    Streamer_SetArrayData(STREAMER_TYPE_AREA, LabelData[id][LabelAreaID], E_STREAMER_EXTRA_ID, array, 2);

    SendClientMessage(playerid, -1, "SERVER: {ADC3E7}Bilgi yazýsý {FFFFFF}ekledin.");
    Iter_Add(Labels, id);
    return 1;
}

Label_Nearest(playerid)
{
    return GetPVarInt(playerid, "AtLabel");
}

Label_Destroy(id)
{
    if (IsValidDynamic3DTextLabel(LabelData[id][label_3D])) DestroyDynamic3DTextLabel(LabelData[id][label_3D]);
    if (IsValidDynamicArea(LabelData[id][LabelAreaID])) {
        Streamer_RemoveArrayData(STREAMER_TYPE_AREA, LabelData[id][LabelAreaID], E_STREAMER_PLAYER_ID, id);
        DestroyDynamicArea(LabelData[id][LabelAreaID]);
    }

    Iter_SafeRemove(Labels, id, id);
    return 1;
}

PhoneCase_ShowUI(playerid)
{
//  PhoneCase_HideUI(playerid);

    SendClientMessage(playerid, COLOR_ADM, "Ýpucu: ESC tuþuna basarak telefon kýlýfý menüsünü kapatabilirsin.");

    PlayerData[playerid][pUseCaseGUI] = true;
    TogglePlayerControllable(playerid, false);
    for(new i; i <= 9; i++) PlayerTextDrawShow(playerid, PhoneCase[playerid][i]);
    SelectTextDraw(playerid, COLOR_GREY);
    return 1;
}

PhoneCase_HideUI(playerid)
{
    PlayerData[playerid][pUseCaseGUI] = false;
    TogglePlayerControllable(playerid, true);
    for(new i; i <= 9; i++) PlayerTextDrawHide(playerid, PhoneCase[playerid][i]);
    CancelSelectTextDraw(playerid);
    return 1;
}

stock UI_ALPR(playerid)
{
  alprHit[playerid][0] = CreatePlayerTextDraw(playerid, 278.499267, 332.021270, "mdl-20053:plaka");
	PlayerTextDrawLetterSize(playerid, alprHit[playerid][0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, alprHit[playerid][0], 82.470314, 41.139976);
	PlayerTextDrawAlignment(playerid, alprHit[playerid][0], 1);
	PlayerTextDrawColor(playerid, alprHit[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, alprHit[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, alprHit[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, alprHit[playerid][0], 255);
	PlayerTextDrawFont(playerid, alprHit[playerid][0], 4);
	PlayerTextDrawSetProportional(playerid, alprHit[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, alprHit[playerid][0], 0);

	alprHit[playerid][1] = CreatePlayerTextDraw(playerid, 320.301818, 307.583953, "ALPR_HIT");
	PlayerTextDrawLetterSize(playerid, alprHit[playerid][1], 0.304199, 2.094042);
	PlayerTextDrawAlignment(playerid, alprHit[playerid][1], 2);
	PlayerTextDrawColor(playerid, alprHit[playerid][1], -1660612609);
	PlayerTextDrawSetShadow(playerid, alprHit[playerid][1], 1);
	PlayerTextDrawSetOutline(playerid, alprHit[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, alprHit[playerid][1], 255);
	PlayerTextDrawFont(playerid, alprHit[playerid][1], 2);
	PlayerTextDrawSetProportional(playerid, alprHit[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, alprHit[playerid][1], 0);

	alprHit[playerid][2] = CreatePlayerTextDraw(playerid, 320.301818, 343.583953, "BOSPLAKA");
	PlayerTextDrawLetterSize(playerid, alprHit[playerid][2], 0.304199, 2.094042);
	PlayerTextDrawAlignment(playerid, alprHit[playerid][2], 2);
	PlayerTextDrawColor(playerid, alprHit[playerid][2], 1751345151);
	PlayerTextDrawSetShadow(playerid, alprHit[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, alprHit[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, alprHit[playerid][2], 255);
	PlayerTextDrawFont(playerid, alprHit[playerid][2], 2);
	PlayerTextDrawSetProportional(playerid, alprHit[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, alprHit[playerid][2], 0);
  return 1;
}
stock UI_PhoneCase(playerid)
{
    PhoneCase[playerid][0] = CreatePlayerTextDraw(playerid, 271.000000, 145.000000, "_"); // Gri
    PlayerTextDrawFont(playerid, PhoneCase[playerid][0], 1);
    PlayerTextDrawLetterSize(playerid, PhoneCase[playerid][0], 0.633333, 2.399980);
    PlayerTextDrawTextSize(playerid, PhoneCase[playerid][0], 305.000000, 27.000000);
    //PlayerTextDrawTextSize(playerid, PhoneCase[playerid][0], 12.000000, 13.000000);
    PlayerTextDrawSetOutline(playerid, PhoneCase[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, PhoneCase[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, PhoneCase[playerid][0], 2);
    PlayerTextDrawColor(playerid, PhoneCase[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, PhoneCase[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, PhoneCase[playerid][0], 1228944895);
    PlayerTextDrawUseBox(playerid, PhoneCase[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, PhoneCase[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, PhoneCase[playerid][0], 1);

    PhoneCase[playerid][1] = CreatePlayerTextDraw(playerid, 311.000000, 145.000000, "_"); // Kýrmýzý
    PlayerTextDrawFont(playerid, PhoneCase[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid, PhoneCase[playerid][1], 0.633333, 2.399980);
    PlayerTextDrawTextSize(playerid, PhoneCase[playerid][1], 305.000000, 27.000000);
    //PlayerTextDrawTextSize(playerid, PhoneCase[playerid][1], 12.000000, 13.000000);
    PlayerTextDrawSetOutline(playerid, PhoneCase[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, PhoneCase[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, PhoneCase[playerid][1], 2);
    PlayerTextDrawColor(playerid, PhoneCase[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, PhoneCase[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, PhoneCase[playerid][1], -1375271681);
    PlayerTextDrawUseBox(playerid, PhoneCase[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, PhoneCase[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, PhoneCase[playerid][1], 1);

    PhoneCase[playerid][2] = CreatePlayerTextDraw(playerid, 271.000000, 180.000000, "_"); // Sarý
    PlayerTextDrawFont(playerid, PhoneCase[playerid][2], 1);
    PlayerTextDrawLetterSize(playerid, PhoneCase[playerid][2], 0.633333, 2.399980);
    PlayerTextDrawTextSize(playerid, PhoneCase[playerid][2], 305.000000, 27.000000);
    PlayerTextDrawSetOutline(playerid, PhoneCase[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, PhoneCase[playerid][2], 0);
    PlayerTextDrawAlignment(playerid, PhoneCase[playerid][2], 2);
    PlayerTextDrawColor(playerid, PhoneCase[playerid][2], -1);
    PlayerTextDrawBackgroundColor(playerid, PhoneCase[playerid][2], 255);
    PlayerTextDrawBoxColor(playerid, PhoneCase[playerid][2], -52158465);
    PlayerTextDrawUseBox(playerid, PhoneCase[playerid][2], 1);
    PlayerTextDrawSetProportional(playerid, PhoneCase[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, PhoneCase[playerid][2], 1);

    PhoneCase[playerid][3] = CreatePlayerTextDraw(playerid, 311.000000, 180.000000, "_"); // Mavi
    PlayerTextDrawFont(playerid, PhoneCase[playerid][3], 1);
    PlayerTextDrawLetterSize(playerid, PhoneCase[playerid][3], 0.633333, 2.399980);
    PlayerTextDrawTextSize(playerid, PhoneCase[playerid][3], 305.000000, 27.000000);
    PlayerTextDrawSetOutline(playerid, PhoneCase[playerid][3], 1);
    PlayerTextDrawSetShadow(playerid, PhoneCase[playerid][3], 0);
    PlayerTextDrawAlignment(playerid, PhoneCase[playerid][3], 2);
    PlayerTextDrawColor(playerid, PhoneCase[playerid][3], -1);
    PlayerTextDrawBackgroundColor(playerid, PhoneCase[playerid][3], 255);
    PlayerTextDrawBoxColor(playerid, PhoneCase[playerid][3], 541151743);
    PlayerTextDrawUseBox(playerid, PhoneCase[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, PhoneCase[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, PhoneCase[playerid][3], 1);

    PhoneCase[playerid][4] = CreatePlayerTextDraw(playerid, 271.000000, 216.000000, "_"); // Yeþil
    PlayerTextDrawFont(playerid, PhoneCase[playerid][4], 1);
    PlayerTextDrawLetterSize(playerid, PhoneCase[playerid][4], 0.633333, 2.399980);
    PlayerTextDrawTextSize(playerid, PhoneCase[playerid][4], 305.000000, 27.000000);
    PlayerTextDrawSetOutline(playerid, PhoneCase[playerid][4], 1);
    PlayerTextDrawSetShadow(playerid, PhoneCase[playerid][4], 0);
    PlayerTextDrawAlignment(playerid, PhoneCase[playerid][4], 2);
    PlayerTextDrawColor(playerid, PhoneCase[playerid][4], -1);
    PlayerTextDrawBackgroundColor(playerid, PhoneCase[playerid][4], 255);
    PlayerTextDrawBoxColor(playerid, PhoneCase[playerid][4], 39518975);
    PlayerTextDrawUseBox(playerid, PhoneCase[playerid][4], 1);
    PlayerTextDrawSetProportional(playerid, PhoneCase[playerid][4], 1);
    PlayerTextDrawSetSelectable(playerid, PhoneCase[playerid][4], 1);

    PhoneCase[playerid][5] = CreatePlayerTextDraw(playerid, 311.000000, 216.000000, "_"); // Turuncu
    PlayerTextDrawFont(playerid, PhoneCase[playerid][5], 1);
    PlayerTextDrawLetterSize(playerid, PhoneCase[playerid][5], 0.633333, 2.399980);
    PlayerTextDrawTextSize(playerid, PhoneCase[playerid][5], 305.000000, 27.000000);
    PlayerTextDrawSetOutline(playerid, PhoneCase[playerid][5], 1);
    PlayerTextDrawSetShadow(playerid, PhoneCase[playerid][5], 0);
    PlayerTextDrawAlignment(playerid, PhoneCase[playerid][5], 2);
    PlayerTextDrawColor(playerid, PhoneCase[playerid][5], -1);
    PlayerTextDrawBackgroundColor(playerid, PhoneCase[playerid][5], 255);
    PlayerTextDrawBoxColor(playerid, PhoneCase[playerid][5], -917231873);
    PlayerTextDrawUseBox(playerid, PhoneCase[playerid][5], 1);
    PlayerTextDrawSetProportional(playerid, PhoneCase[playerid][5], 1);
    PlayerTextDrawSetSelectable(playerid, PhoneCase[playerid][5], 1);

    PhoneCase[playerid][6] = CreatePlayerTextDraw(playerid, 271.000000, 252.000000, "_"); // Pembe
    PlayerTextDrawFont(playerid, PhoneCase[playerid][6], 1);
    PlayerTextDrawLetterSize(playerid, PhoneCase[playerid][6], 0.633333, 2.399980);
    PlayerTextDrawTextSize(playerid, PhoneCase[playerid][6], 305.000000, 27.000000);
    PlayerTextDrawSetOutline(playerid, PhoneCase[playerid][6], 1);
    PlayerTextDrawSetShadow(playerid, PhoneCase[playerid][6], 0);
    PlayerTextDrawAlignment(playerid, PhoneCase[playerid][6], 2);
    PlayerTextDrawColor(playerid, PhoneCase[playerid][6], -1);
    PlayerTextDrawBackgroundColor(playerid, PhoneCase[playerid][6], 255);
    PlayerTextDrawBoxColor(playerid, PhoneCase[playerid][6], -1487439105);
    PlayerTextDrawUseBox(playerid, PhoneCase[playerid][6], 1);
    PlayerTextDrawSetProportional(playerid, PhoneCase[playerid][6], 1);
    PlayerTextDrawSetSelectable(playerid, PhoneCase[playerid][6], 1);

    PhoneCase[playerid][7] = CreatePlayerTextDraw(playerid, 318.000000, 118.000000, "RENK_SECINIZ");
    PlayerTextDrawFont(playerid, PhoneCase[playerid][7], 2);
    PlayerTextDrawLetterSize(playerid, PhoneCase[playerid][7], 0.270832, 1.749980);
    PlayerTextDrawTextSize(playerid, PhoneCase[playerid][7], 306.500000, 131.000000);
    PlayerTextDrawSetOutline(playerid, PhoneCase[playerid][7], 0);
    PlayerTextDrawSetShadow(playerid, PhoneCase[playerid][7], 0);
    PlayerTextDrawAlignment(playerid, PhoneCase[playerid][7], 2);
    PlayerTextDrawColor(playerid, PhoneCase[playerid][7], -1);
    PlayerTextDrawBackgroundColor(playerid, PhoneCase[playerid][7], 255);
    PlayerTextDrawBoxColor(playerid, PhoneCase[playerid][7], 135);
    PlayerTextDrawUseBox(playerid, PhoneCase[playerid][7], 1);
    PlayerTextDrawSetProportional(playerid, PhoneCase[playerid][7], 1);
    PlayerTextDrawSetSelectable(playerid, PhoneCase[playerid][7], 0);

    PhoneCase[playerid][8] = CreatePlayerTextDraw(playerid, 258.000000, 123.000000, "Preview_Model");
    PlayerTextDrawFont(playerid, PhoneCase[playerid][8], 5);
    PlayerTextDrawLetterSize(playerid, PhoneCase[playerid][8], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, PhoneCase[playerid][8], 146.500000, 168.000000);
    PlayerTextDrawSetOutline(playerid, PhoneCase[playerid][8], 0);
    PlayerTextDrawSetShadow(playerid, PhoneCase[playerid][8], 0);
    PlayerTextDrawAlignment(playerid, PhoneCase[playerid][8], 1);
    PlayerTextDrawColor(playerid, PhoneCase[playerid][8], -1);
    PlayerTextDrawBackgroundColor(playerid, PhoneCase[playerid][8], 0);
    PlayerTextDrawBoxColor(playerid, PhoneCase[playerid][8], 255);
    PlayerTextDrawUseBox(playerid, PhoneCase[playerid][8], 0);
    PlayerTextDrawSetProportional(playerid, PhoneCase[playerid][8], 1);
    PlayerTextDrawSetSelectable(playerid, PhoneCase[playerid][8], 0);
    PlayerTextDrawSetPreviewModel(playerid, PhoneCase[playerid][8], 18873);
    PlayerTextDrawSetPreviewRot(playerid, PhoneCase[playerid][8], 269.000000, -15.000000, -181.000000, 0.970000);
    PlayerTextDrawSetPreviewVehCol(playerid, PhoneCase[playerid][8], 1, 1);

    PhoneCase[playerid][9] = CreatePlayerTextDraw(playerid, 352.000000, 269.000000, "SATINAL");
    PlayerTextDrawFont(playerid, PhoneCase[playerid][9], 2);
    PlayerTextDrawLetterSize(playerid, PhoneCase[playerid][9], 0.258332, 1.499981);
    PlayerTextDrawTextSize(playerid, PhoneCase[playerid][9], 301.500000, 47.500000);
    PlayerTextDrawSetOutline(playerid, PhoneCase[playerid][9], 0);
    PlayerTextDrawSetShadow(playerid, PhoneCase[playerid][9], 0);
    PlayerTextDrawAlignment(playerid, PhoneCase[playerid][9], 2);
    PlayerTextDrawColor(playerid, PhoneCase[playerid][9], -1);
    PlayerTextDrawBackgroundColor(playerid, PhoneCase[playerid][9], 255);
    PlayerTextDrawBoxColor(playerid, PhoneCase[playerid][9], 135);
    PlayerTextDrawUseBox(playerid, PhoneCase[playerid][9], 1);
    PlayerTextDrawSetProportional(playerid, PhoneCase[playerid][9], 1);
    PlayerTextDrawSetSelectable(playerid, PhoneCase[playerid][9], 1);
    return 1;
}

Fire_Create(playerid)
{
    new id = -1;
    id = Iter_Free(Fires);
    if (id == -1) return SendErrorMessage(playerid, "Þu anda daha fazla yangýn ateþi eklenemiyor.");

    new
        Float:x,
        Float:y,
        Float:z;

    GetPlayerPos(playerid, x, y, z);

    FireData[id][fire_pos][0] = x, FireData[id][fire_pos][1] = y, FireData[id][fire_pos][2] = z;
    FireData[id][fire_pos][3] = FireData[id][fire_pos][4] = FireData[id][fire_pos][5] = 0.0;
    format(FireData[id][fire_location], 40, "%s", Player_GetLocation(playerid));
    format(FireData[id][fire_placedby], 34, "%s", ReturnName(playerid));
    FireData[id][fire_virtualworld] = GetPlayerVirtualWorld(playerid);
    FireData[id][fire_interior] = GetPlayerInterior(playerid);
    Iter_Add(Fires, id);

    EditingID[playerid] = id;
    EditingObject[playerid] = 8;
    FireData[id][f_is_editing] = true;
    FireData[id][f_is_extinguished] = false;
    SendClientMessage(playerid, -1, "SERVER: {ADC3E7}Yangýn ateþi {FFFFFF}ekliyorsun. Duracaðý noktayý ayarlayýp kaydet.");
    FireData[id][fire_object] = CreateDynamicObject(18691, FireData[id][fire_pos][0], FireData[id][fire_pos][1], FireData[id][fire_pos][2], 0.0, 0.0, 0.0, FireData[id][fire_virtualworld], FireData[id][fire_interior]);
    EditDynamicObject(playerid, FireData[id][fire_object]);
    return 1;
}

Fire_Refresh(id)
{
    if (IsValidDynamicObject(FireData[id][fire_object])) DestroyDynamicObject(FireData[id][fire_object]);
    FireData[id][fire_object] = CreateDynamicObject(18691, FireData[id][fire_pos][0], FireData[id][fire_pos][1], FireData[id][fire_pos][2], FireData[id][fire_pos][3], FireData[id][fire_pos][4], FireData[id][fire_pos][5], FireData[id][fire_virtualworld], FireData[id][fire_interior]);
    return 0;
}

Fire_Destroy(id)
{
    if(IsValidDynamicObject(FireData[id][fire_object])) DestroyDynamicObject(FireData[id][fire_object]);
    FireData[id][f_is_editing] = false;
    Iter_SafeRemove(Fires, id, id);
    return 1;
}

Fire_Nearest(playerid)
{
    foreach(new i : Fires) if (IsPlayerInRangeOfPoint(playerid, 5.0, FireData[i][fire_pos][0], FireData[i][fire_pos][1], FireData[i][fire_pos][2]))
    {
        if (GetPlayerInterior(playerid) == FireData[i][fire_interior] && GetPlayerVirtualWorld(playerid) == FireData[i][fire_virtualworld])
            return i;
    }
    return -1;
}

stock ResetSprayVars(playerid)
{
    KillTimer(PlayerData[playerid][pSprayTimer][0]);
    KillTimer(PlayerData[playerid][pSprayTimer][1]);
    PlayerData[playerid][pSprayPoint] = 0;
    PlayerData[playerid][pSprayLength] = 0;
    PlayerData[playerid][pSprayTarget] = -1;
    return 1;
}

Tuning_AddComponent(vehicleid, component, componentPrice)
{
    if(!IsValidVehicle(vehicleid)) return 0;

    new cslot = GetVehicleComponentType(component);
		if(CarData[vehicleid][carMods][cslot] == component)
			return SendErrorMessage(GetVehicleDriver(vehicleid), "Bu parça zaten araçta var.");

		GiveMoney(GetVehicleDriver(vehicleid), -componentPrice);
		CarData[vehicleid][carMods][cslot] = component;
    AddVehicleComponent(vehicleid, component);
    Car_Save(vehicleid);
    return 1;
}


Tuning_SetComponents(vehicleid)
{
	for(new i; i < 14; i++)
	{
	    if(GetVehicleComponentInSlot(vehicleid, i) > 0) RemoveVehicleComponent(vehicleid, CarData[vehicleid][carMods][i]);
		if(!CarData[vehicleid][carMods][i]) continue;


 		AddVehicleComponent(vehicleid, CarData[vehicleid][carMods][i]);
	}

	return 1;
}

Tuning_ExitDisplay(playerid)
{
    new n = sizeof(RandomTuningSpawn);
    new random_spawn = random(n);
    new categoryTuning = PlayerData[playerid][pTuningCategoryID];

    new vehID = GetPlayerVehicleID(playerid);
    RemoveVehicleComponent(vehID, PlayerData[playerid][pTuningComponent]);
    TogglePlayerControllable(playerid, true);
    SetPlayerVirtualWorld(playerid, 0);
    SetVehicleVirtualWorld(vehID, 0);

    switch(CarData[vehID][carModel])
    {
        case 455, 403, 514, 515: SetVehiclePos(vehID, 422.5606, -1325.7305,14.8214);
        default: SetVehiclePos(vehID, RandomTuningSpawn[random_spawn][0], RandomTuningSpawn[random_spawn][1], RandomTuningSpawn[random_spawn][2]);
    }
    SetVehicleZAngle(vehID, RandomTuningSpawn[random_spawn][3]);
    Car_Save(vehID);

    PlayerData[playerid][pInTuning] = 0;

    if(categoryTuning == 10)
    {
        ChangeVehiclePaintjob(vehID, CarData[vehID][carPaintjob]);
        if(CarData[vehID][carPaintjob] == 3) ChangeVehicleColor(vehID, CarData[vehID][carColor1], CarData[vehID][carColor2]);
    }


    PlayerTextDrawHide(playerid, TDTuning_Component[playerid]);
    PlayerTextDrawHide(playerid, TDTuning_Dots[playerid]);
    PlayerTextDrawHide(playerid, TDTuning_Price[playerid]);
    PlayerTextDrawHide(playerid, TDTuning_ComponentName[playerid]);
    PlayerTextDrawHide(playerid, TDTuning_YN[playerid]);

    SetCameraBehindPlayer(playerid);
    Tuning_SetComponents(vehID);
    return 1;
}

Tuning_SetDisplay(playerid, validCount = -1)
{
    new vehID = GetPlayerVehicleID(playerid),
		categoryTuning = PlayerData[playerid][pTuningCategoryID];

	PlayerData[playerid][pTuningCount] = (validCount == -1) ? GetVehicleComponentCount(categoryTuning, CarData[vehID][carModel]) : validCount;
	if(validCount == -1) SetPlayerTuningCameraPos(playerid, categoryTuning);

	if(!PlayerData[playerid][pTuningCount])
	{
   		PlayerTextDrawSetString(playerid, TDTuning_Price[playerid], "~y~Aracinla uyumlu degil.");
		PlayerTextDrawSetString(playerid, TDTuning_ComponentName[playerid], "~w~Satin almak icin [~y~Y~w~] ~w~Cikmak icin ~w~[~y~N~w~]");

		PlayerTextDrawShow(playerid, TDTuning_Dots[playerid]);
		PlayerTextDrawShow(playerid, TDTuning_Price[playerid]);
		PlayerTextDrawShow(playerid, TDTuning_ComponentName[playerid]);

		PlayerTextDrawHide(playerid, TDTuning_YN[playerid]);

		RemoveVehicleComponent(vehID, PlayerData[playerid][pTuningComponent]);
		ChangeVehiclePaintjob(vehID, CarData[vehID][carPaintjob]);
	}
	else
	{
	    new compName[32] = "Paintjob";
	    new compPrice = 2500;

     	RemoveVehicleComponent(vehID, PlayerData[playerid][pTuningComponent]);
		ChangeVehiclePaintjob(vehID, CarData[vehID][carPaintjob]);

   		PlayerData[playerid][pTuningCount] = (validCount == -1) ? 1 : validCount;
		PlayerData[playerid][pTuningComponent] = GetVehicleCompatibleComponent(categoryTuning, CarData[vehID][carModel], PlayerData[playerid][pTuningCount]);

        new compatibleComponent = PlayerData[playerid][pTuningComponent];

		if(categoryTuning != 10)
		{
			AddVehicleComponent(vehID, compatibleComponent);
			strmid(compName, GetComponentName(compatibleComponent), 0, 32);
			compPrice = GetComponentPrice(compatibleComponent);
		}
		else ChangeVehiclePaintjob(vehID, PlayerData[playerid][pTuningComponent]);

		PlayerTextDrawSetString(playerid, TDTuning_Price[playerid], sprintf("~y~Fiyat: ~w~$%d", compPrice));
		PlayerTextDrawShow(playerid, TDTuning_Price[playerid]);


		PlayerTextDrawSetString(playerid, TDTuning_ComponentName[playerid], sprintf("~y~Parca: ~w~%s (#%d)", compName, compatibleComponent));
		PlayerTextDrawShow(playerid, TDTuning_ComponentName[playerid]);

		PlayerTextDrawShow(playerid, TDTuning_YN[playerid]);
	}

  Tuning_SetComponents(vehID);
	return 1;
}

Server:Tuning_CreateTD(playerid)
{
    TDTuning_Component[playerid] = CreatePlayerTextDraw(playerid, 220.000000, 320.000000, "Spoiler (~>~)~y~ Hood");
	PlayerTextDrawBackgroundColor(playerid, TDTuning_Component[playerid], 255);
	PlayerTextDrawFont(playerid, TDTuning_Component[playerid], 3);
	PlayerTextDrawLetterSize(playerid, TDTuning_Component[playerid], 0.450000, 1.799999);
	PlayerTextDrawColor(playerid, TDTuning_Component[playerid], -1);
	PlayerTextDrawSetOutline(playerid, TDTuning_Component[playerid], 1);
	PlayerTextDrawSetProportional(playerid, TDTuning_Component[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, TDTuning_Component[playerid], 0);

	TDTuning_Dots[playerid] = CreatePlayerTextDraw(playerid, 220.000000, 333.000000, ".................");
	PlayerTextDrawBackgroundColor(playerid, TDTuning_Dots[playerid], 255);
	PlayerTextDrawFont(playerid, TDTuning_Dots[playerid], 3);
	PlayerTextDrawLetterSize(playerid, TDTuning_Dots[playerid], 0.670000, 1.699999);
	PlayerTextDrawColor(playerid, TDTuning_Dots[playerid], -1);
	PlayerTextDrawSetOutline(playerid, TDTuning_Dots[playerid], 1);
	PlayerTextDrawSetProportional(playerid, TDTuning_Dots[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, TDTuning_Dots[playerid], 0);

	TDTuning_Price[playerid] = CreatePlayerTextDraw(playerid, 221.000000, 351.000000, "~y~Price: ~w~$0");
	PlayerTextDrawBackgroundColor(playerid, TDTuning_Price[playerid], 255);
	PlayerTextDrawFont(playerid, TDTuning_Price[playerid], 3);
	PlayerTextDrawLetterSize(playerid, TDTuning_Price[playerid], 0.390000, 1.900000);
	PlayerTextDrawColor(playerid, TDTuning_Price[playerid], -1);
	PlayerTextDrawSetOutline(playerid, TDTuning_Price[playerid], 1);
	PlayerTextDrawSetProportional(playerid, TDTuning_Price[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, TDTuning_Price[playerid], 0);

	TDTuning_ComponentName[playerid] = CreatePlayerTextDraw(playerid, 221.000000, 369.000000, "~y~Name: ~w~Unknown (#0).");
	PlayerTextDrawBackgroundColor(playerid, TDTuning_ComponentName[playerid], 255);
	PlayerTextDrawFont(playerid, TDTuning_ComponentName[playerid], 3);
	PlayerTextDrawLetterSize(playerid, TDTuning_ComponentName[playerid], 0.390000, 1.900000);
	PlayerTextDrawColor(playerid, TDTuning_ComponentName[playerid], -1);
	PlayerTextDrawSetOutline(playerid, TDTuning_ComponentName[playerid], 1);
	PlayerTextDrawSetProportional(playerid, TDTuning_ComponentName[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, TDTuning_ComponentName[playerid], 0);

	TDTuning_YN[playerid] = CreatePlayerTextDraw(playerid, 221.000000, 388.000000, "~w~Satin almak icin [~y~Y~w~] ~w~Cikmak icin ~w~[~y~N~w~]");
	PlayerTextDrawBackgroundColor(playerid, TDTuning_YN[playerid], 255);
	PlayerTextDrawFont(playerid, TDTuning_YN[playerid], 3);
	PlayerTextDrawLetterSize(playerid, TDTuning_YN[playerid], 0.390000, 1.900000);
	PlayerTextDrawColor(playerid, TDTuning_YN[playerid], -1);
	PlayerTextDrawSetOutline(playerid, TDTuning_YN[playerid], 1);
	PlayerTextDrawSetProportional(playerid, TDTuning_YN[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, TDTuning_YN[playerid], 0);
  return 1;
}

IsABike(vehicleid)
{
    new model = GetVehicleModel(vehicleid);

    switch(model)
    {
        case 509, 481, 510: return 1;
    }

    return 0;
}

IsAMotorBike(vehicleid)
{
    new model = GetVehicleModel(vehicleid);

    switch(model)
    {
        case 509, 481, 510, 462, 448, 581, 522, 461, 421, 523, 463, 586, 468, 471: return 1;
    }

    return 0;
}

Float: GetVehicleCondition(vehid, type)
{
    new Float: value;
    switch(type)
    {
        case 0:
        {
            switch(GetVehicleModel(vehid))
            {
                case 462, 463, 521, 522, 581, 586, 461: value = 800.0;
                case 468, 471: value = 700.0;
                case 481, 509, 510: value = 1000.0;
                case 439, 480, 533, 555: value = 850.0;
                case 549, 604, 605: value = 550.0;
                default: value = 900.0;
            }
        }
        case 1:
        {
            switch(GetVehicleModel(vehid))
            {
                case 462, 463, 521, 522, 581, 586, 461: value = 65.0;
                case 468, 471: value = 50.0;
                case 481, 509, 510: value = 100.0;
                case 439, 480, 533, 555: value = 75.0;
                case 549, 604, 605: value = 50.0;
                default: value = 100.0;
            }
        }
        case 2:
        {
            switch(GetVehicleModel(vehid))
            {
                case 462, 463, 521, 522, 581, 586, 461: value = 80.0;
                case 468, 471: value = 90.0;
                case 481, 509, 510: value = 100.0;
                case 439, 480, 533, 555: value = 100.0;
                case 549, 604, 605: value = 50.0;
                default: value = 100.0;
            }
        }
    }
    return value;
}

DisplayColors(playerid, bool:toggle)
{
    if(toggle)
    {
        SetPVarInt(playerid, "ColorSelect", 1);
        SetPVarInt(playerid, "index_color", 0);
        for(new i; i < 8; i ++)
        {
            PlayerTextDrawBackgroundColor(playerid, ColorPanel[playerid][i], VehicleColoursTableRGBA[i]);
        }
        for(new idx; idx < 10; idx ++)
        {
            PlayerTextDrawShow(playerid, ColorPanel[playerid][idx]);
        }
    }
    else
    {
        for(new i; i < 10; i ++)
        {
            PlayerTextDrawHide(playerid, ColorPanel[playerid][i]);
        }
        DeletePVar(playerid, "ColorSelect");
        DeletePVar(playerid, "index_color");
    }
    return 1;
}

showNextColor(playerid)
{
    SetPVarInt(playerid, "index_color", GetPVarInt(playerid, "index_color")+1);
    new offset = GetPVarInt(playerid, "index_color") * 8;
    for(new idx; idx < 8; idx ++)
    {
        PlayerTextDrawHide(playerid, ColorPanel[playerid][idx]);
    }
    if(GetPVarInt(playerid, "index_color") >= 32)
    {
        SetPVarInt(playerid, "index_color", 1);
        for(new i; i < 8; i ++)
        {
            PlayerTextDrawBackgroundColor(playerid, ColorPanel[playerid][i], VehicleColoursTableRGBA[i]);
        }
        for(new g; g < 8; g ++)
        {
            PlayerTextDrawShow(playerid, ColorPanel[playerid][g]);
        }
    }
    else
    {
        for(new i; i < 8; i ++)
        {
            PlayerTextDrawBackgroundColor(playerid, ColorPanel[playerid][i], VehicleColoursTableRGBA[i+offset]);
        }
        for(new g; g < 8; g ++)
        {
            PlayerTextDrawShow(playerid, ColorPanel[playerid][g]);
        }
    }
    return 1;
}

stock ShowSprayDialog(playerid, part)
{
    switch(part)
    {
        case DIALOG_SPRAY_MAIN:
        {
            ShowPlayerDialog(playerid, part, DIALOG_STYLE_LIST, "Graffiti: Ana Menü", "Graffiti Resmi\nÖzel Yazý\nYazý Tipi(özel yazý için)", "Seç", "<<");
        }
        case DIALOG_SPRAY_IMAGE:
        {
            new diaLog[256], list[128];
            for(new i = 0; i < sizeof(g_spraytag); i ++)
            {
                format(list, sizeof(list), "%s\n", g_spraytag[i][tag_name]);
                strcat(diaLog, list);
            }
            ShowPlayerDialog(playerid, part, DIALOG_STYLE_LIST, "Graffiti: Resim", diaLog, "Seç", "<<");
        }
        case DIALOG_SPRAY_INPUT:
        {
            ShowPlayerDialog(playerid, part, DIALOG_STYLE_INPUT, "Graffiti: Özel Yazý", "KULLANIM:\n\n\
                        - Bu dialog yardýmýyla graffitinize BBCodes ile özellikler katabileceksiniz.\n\n\
                        \tYeni Satýr (y), Siyah (si), Kahverengi (kv), Kýrmýzý (k), Mavi (m), Yeþil (ys)\n\
                        \tTuruncu (t), Beyaz (b), Sarý (s), Kestane (ks)\n\n\
                        - Graffiti metniniz en fazla 60 karakter olabilir.", "Seç", "<<");
        }
        case DIALOG_SPRAY_FONT:
        {
            new diaLog[256], list[128];
            for(new i = 0; i < sizeof(font_data); i ++)
            {
                format(list, sizeof(list), "%s\n", font_data[i][font_name]);
                strcat(diaLog, list);
            }
            ShowPlayerDialog(playerid, part, DIALOG_STYLE_LIST, "Graffiti: Yazý Tipi", diaLog, "Seç", "<<");
        }
    }
    return 1;
}

Chopshop_GetRandomModel(chopshopid)
{
    for(new i = 0; i < 10; i ++)
    {
        if(chopshopid != -1 && ChopshopData[chopshopid][chopshop_exist])
        {
            ChopshopData[chopshopid][chopshop_wanted][i] = DealershipData[random(sizeof(DealershipData))][DealershipModel];
        }
    }
    return 0;
}

Chopshop_CheckWantedModel(chopshopid, modelid)
{
    for(new i = 0; i < 10; i ++)
    {
        if(ChopshopData[chopshopid][chopshop_wanted][i] == modelid)
        {
            return 1;
        }
    }
    return 0;
}

Chopshop_Refresh(chopshopid)
{
    if (chopshopid != -1 && ChopshopData[chopshopid][chopshop_exist])
    {
        if (IsValidDynamicObject(ChopshopData[chopshopid][chopshop_object][0]))
            DestroyDynamicObject(ChopshopData[chopshopid][chopshop_object][0]);

        if (IsValidDynamicObject(ChopshopData[chopshopid][chopshop_object][1]))
            DestroyDynamicObject(ChopshopData[chopshopid][chopshop_object][1]);

        Chopshop_GetRandomModel(chopshopid);

        ChopshopData[chopshopid][chopshop_object][0] = CreateDynamicObject(3077, ChopshopData[chopshopid][chopshop_pos][0], ChopshopData[chopshopid][chopshop_pos][1], ChopshopData[chopshopid][chopshop_pos][2], ChopshopData[chopshopid][chopshop_pos][3], ChopshopData[chopshopid][chopshop_pos][4], ChopshopData[chopshopid][chopshop_pos][5]);

        if(ChopshopData[chopshopid][chopshop_pos][5] > 0)
            ChopshopData[chopshopid][chopshop_object][1] = CreateDynamicObject(19482, ChopshopData[chopshopid][chopshop_pos][0], ChopshopData[chopshopid][chopshop_pos][1]+0.1, ChopshopData[chopshopid][chopshop_pos][2]+1.9, ChopshopData[chopshopid][chopshop_pos][3], ChopshopData[chopshopid][chopshop_pos][4], ChopshopData[chopshopid][chopshop_pos][5]-90);
        else
            ChopshopData[chopshopid][chopshop_object][1] = CreateDynamicObject(19482, ChopshopData[chopshopid][chopshop_pos][0], ChopshopData[chopshopid][chopshop_pos][1]+0.1, ChopshopData[chopshopid][chopshop_pos][2]+1.9, ChopshopData[chopshopid][chopshop_pos][3], ChopshopData[chopshopid][chopshop_pos][4], ChopshopData[chopshopid][chopshop_pos][5]+90);

        new
            string[512];

        format(string, sizeof(string), "Arananlar\n((/aracteslimet))\n%s     %s\n%s     %s\n%s     %s\n%s     %s\n%s     %s",
        ReturnVehicleModelName(ChopshopData[chopshopid][chopshop_wanted][0]),
        ReturnVehicleModelName(ChopshopData[chopshopid][chopshop_wanted][1]),
        ReturnVehicleModelName(ChopshopData[chopshopid][chopshop_wanted][2]),
        ReturnVehicleModelName(ChopshopData[chopshopid][chopshop_wanted][3]),
        ReturnVehicleModelName(ChopshopData[chopshopid][chopshop_wanted][4]),
        ReturnVehicleModelName(ChopshopData[chopshopid][chopshop_wanted][5]),
        ReturnVehicleModelName(ChopshopData[chopshopid][chopshop_wanted][6]),
        ReturnVehicleModelName(ChopshopData[chopshopid][chopshop_wanted][7]),
        ReturnVehicleModelName(ChopshopData[chopshopid][chopshop_wanted][8]),
        ReturnVehicleModelName(ChopshopData[chopshopid][chopshop_wanted][9]));
        SetDynamicObjectMaterialText(ChopshopData[chopshopid][chopshop_object][1], 0, string, OBJECT_MATERIAL_SIZE_512x256, "Comic Sans MS", 26, 1, -1, 0, 1);
        return 1;
    }
    return 0;
}

Chopshop_Save(chopshopid)
{
    new
        query[300];

    format(query, sizeof(query), "UPDATE chopshop SET money = %i, offsetX = %f, offsetY = %f, offsetZ = %f, rotX = %f, rotY = %f, rotZ = %f WHERE id = %i",
        ChopshopData[chopshopid][chopshop_money],
        ChopshopData[chopshopid][chopshop_pos][0],
        ChopshopData[chopshopid][chopshop_pos][1],
        ChopshopData[chopshopid][chopshop_pos][2],
        ChopshopData[chopshopid][chopshop_pos][3],
        ChopshopData[chopshopid][chopshop_pos][4],
        ChopshopData[chopshopid][chopshop_pos][5],
        ChopshopData[chopshopid][chopshop_id]);
    return mysql_tquery(m_Handle, query);
}

Chopshop_Delete(chopshopid)
{
    if (chopshopid != -1 && ChopshopData[chopshopid][chopshop_exist])
    {
        if (IsValidDynamicObject(ChopshopData[chopshopid][chopshop_object][0]))
            DestroyDynamicObject(ChopshopData[chopshopid][chopshop_object][0]);

        if (IsValidDynamicObject(ChopshopData[chopshopid][chopshop_object][1]))
            DestroyDynamicObject(ChopshopData[chopshopid][chopshop_object][1]);

        new
            query[64];

        format(query, sizeof(query), "DELETE FROM chopshop WHERE id = %i", ChopshopData[chopshopid][chopshop_id]);
        mysql_tquery(m_Handle, query);

        ChopshopData[chopshopid][chopshop_exist] = false;
        ChopshopData[chopshopid][chopshop_id] = 0;
    }
    return 1;
}

Chopshop_Nearest(playerid)
{
    for (new i = 0; i != MAX_CHOPSHOP; i ++) if (ChopshopData[i][chopshop_exist] && IsPlayerInRangeOfPoint(playerid, 10.0, ChopshopData[i][chopshop_pos][0], ChopshopData[i][chopshop_pos][1], ChopshopData[i][chopshop_pos][2]))
    {
        return i;
    }
    return -1;
}

Impound_Refresh(impoundid)
{
    if (impoundid != -1 && ImpoundData[impoundid][impoundExists])
    {
        if (IsValidDynamicPickup(ImpoundData[impoundid][impoundPickup]))
            DestroyDynamicPickup(ImpoundData[impoundid][impoundPickup]);

        ImpoundData[impoundid][impoundPickup] = CreateDynamicPickup(1239, 23, ImpoundData[impoundid][impoundLot][0], ImpoundData[impoundid][impoundLot][1], ImpoundData[impoundid][impoundLot][2]);
    }
    return 1;
}

Impound_Save(impoundid)
{
    new
        query[300];

    format(query, sizeof(query), "UPDATE impoundlots SET impoundLotX = %f, `impoundLotY` = %f, impoundLotZ = %f, impoundReleaseX = %f, impoundReleaseY = %f, impoundReleaseZ = %f, impoundReleaseA = %f WHERE impoundID = %i",
        ImpoundData[impoundid][impoundLot][0],
        ImpoundData[impoundid][impoundLot][1],
        ImpoundData[impoundid][impoundLot][2],
        ImpoundData[impoundid][impoundRelease][0],
        ImpoundData[impoundid][impoundRelease][1],
        ImpoundData[impoundid][impoundRelease][2],
        ImpoundData[impoundid][impoundRelease][3],
        ImpoundData[impoundid][impoundID]
    );
    return mysql_tquery(m_Handle, query);
}

Chopshop_Create(playerid)
{
    new
        Float:x,
        Float:y,
        Float:z;

    if (GetPlayerPos(playerid, x, y, z))
    {
        for (new i = 0; i < MAX_CHOPSHOP; i ++) if (!ChopshopData[i][chopshop_exist])
        {
            ChopshopData[i][chopshop_exist] = 1;
            ChopshopData[i][chopshop_pos][0] = x;
            ChopshopData[i][chopshop_pos][1] = y;
            ChopshopData[i][chopshop_pos][2] = z;

            ChopshopData[i][chopshop_pos][3] = 0.0;
            ChopshopData[i][chopshop_pos][4] = 0.0;
            ChopshopData[i][chopshop_pos][5] = 0.0;

            for (new j; j < 10; j++)
                ChopshopData[i][chopshop_wanted][j] = EOS;

            ChopshopData[i][chopshop_money] = 0;

            Chopshop_Refresh(i);
            mysql_tquery(m_Handle, "INSERT INTO chopshop (offsetX) VALUES(0)", "OnChopshopCreated", "d", i);
            return i;
        }
    }
    return -1;
}

stock DistanceCameraTargetToLocation(Float:fCameraX, Float:fCameraY, Float:fCameraZ, Float:fObjectX, Float:fObjectY, Float:fObjectZ, Float:fVectorX, Float:fVectorY, Float:fVectorZ)
{
    new
        Float:fX,
        Float:fY,
        Float:fZ,
        Float:fDistance;

    fDistance = GetDistanceBetweenPoints(fCameraX, fCameraY, fCameraZ, fObjectX, fObjectY, fObjectZ);

    fX = fVectorX * fDistance + fCameraX;
    fY = fVectorY * fDistance + fCameraY;
    fZ = fVectorZ * fDistance + fCameraZ;

    floatsqroot((fX - fObjectX) * (fX - fObjectX) + (fY - fObjectY) * (fY - fObjectY) + (fZ - fObjectZ) * (fZ - fObjectZ));
    return 1;
}

Impound_Delete(impoundid)
{
    if (impoundid != -1 && ImpoundData[impoundid][impoundExists])
    {
        new
            query[64];

        format(query, sizeof(query), "DELETE FROM impoundlots WHERE impoundID = %i", ImpoundData[impoundid][impoundID]);
        mysql_tquery(m_Handle, query);

        if (IsValidDynamicPickup(ImpoundData[impoundid][impoundPickup]))
            DestroyDynamicPickup(ImpoundData[impoundid][impoundPickup]);

        for(new i = 1, j = GetVehiclePoolSize(); i <= j; i++) if (CarData[i][carExists] && CarData[i][carImpounded] == ImpoundData[impoundid][impoundID]) {
            CarData[i][carImpounded] = -1;
            Car_Save(i);
        }
        ImpoundData[impoundid][impoundExists] = false;
        ImpoundData[impoundid][impoundID] = 0;
    }
    return 1;
}

stock GetImpoundByID(sqlid)
{
    for (new i = 0; i < MAX_IMPOUND_LOTS; i ++) if (ImpoundData[i][impoundExists] && ImpoundData[i][impoundID] == sqlid) {
        return i;
    }
    return -1;
}

Impound_Nearest(playerid)
{
    for (new i = 0; i < MAX_IMPOUND_LOTS; i ++) if (ImpoundData[i][impoundExists] && IsPlayerInRangeOfPoint(playerid, 20.0, ImpoundData[i][impoundLot][0], ImpoundData[i][impoundLot][1], ImpoundData[i][impoundLot][2])) {
        return i;
    }
    return -1;
}

Impound_Create(Float:x, Float:y, Float:z)
{
    for (new i = 0; i != MAX_IMPOUND_LOTS; i ++) if (!ImpoundData[i][impoundExists])
    {
        ImpoundData[i][impoundExists] = true;
        ImpoundData[i][impoundLot][0] = x;
        ImpoundData[i][impoundLot][1] = y;
        ImpoundData[i][impoundLot][2] = z;
        ImpoundData[i][impoundRelease][0] = 0.0;
        ImpoundData[i][impoundRelease][1] = 0.0;
        ImpoundData[i][impoundRelease][2] = 0.0;

        mysql_tquery(m_Handle, "INSERT INTO impoundlots (impoundLotX) VALUES(0.0)", "OnImpoundCreated", "d", i);
        Impound_Refresh(i);
        return i;
    }
    return -1;
}

getRandomPlayer()
{
    new count = 0, randomid = INVALID_PLAYER_ID;

    while(randomid == INVALID_PLAYER_ID || !IsPlayerConnected(randomid) || !pLoggedIn[randomid])
    {
        count++;
        randomid = random(MAX_PLAYERS);
        if (count > 200 || IsPlayerConnected(randomid)) break;
    }
    return randomid;
}

encode_tires(tire1, tire2, tire3, tire4) return tire1 | (tire2 << 1) | (tire3 << 2) | (tire4 << 3);

stock IsPlayerFalling(playerid)           //true if player is falling with a closed parachute
{
    new index = GetPlayerAnimationIndex(playerid);
    if(index >= 958 && index <= 979 || index == 1130 || index == 1195 || index == 1132) return 1;
    return 0;
}

GetVehicleDriver(vehicleid)
{
    foreach(new i : Player)
    {
        if(!IsPlayerConnected(i) || GetPlayerState(i) != PLAYER_STATE_DRIVER) continue;

        if(GetPlayerVehicleID(i) == vehicleid)
            return i;
   }
    return -1;
}

Report_Create(playerid, text[])
{
    new id = Iter_Free(Reports);
    if (id == -1) return SendErrorMessage(playerid, "Rapor listesi dolu gözüküyor, daha sonra tekrar deneyin.");

    format(ReportData[id][ReportText], 128, "%s", text);
    ReportData[id][ReportPlayer] = playerid;

    foreach (new i : Player)
    {
        if (PlayerData[i][pAdmin] > 0 && PlayerData[i][pAdminDuty])
        {
            SendClientMessageEx(i, COLOR_ADM, "[Rapor: %d] {FF9900}%s(%d): %s", id+1, ReturnName(playerid, 0), playerid, text);
        }
    }

    SendInfoMessage(playerid, "Raporun çevrimiçi yetkilileri gönderildi, lütfen sabýrla bekleyiniz.");
    PlayerData[playerid][pReportTime] = gettime() + 15;
    Iter_Add(Reports, id);
    return 1;
}

Report_Remove(id)
{
    ReportData[id][ReportPlayer] = INVALID_PLAYER_ID;
    Iter_Remove(Reports, id);
    return 1;
}

Report_GetCount(playerid)
{
    new count = 0;
    foreach(new i : Reports) if (ReportData[i][ReportPlayer] == playerid)
    {
        count++;
    }
    return count;
}

ReturnChannelName(id)
{
    new txt[9];
    switch(id)
    {
        case 912: txt = "BASE";
        case 913: txt = "SPLX";
        case 914: txt = "SWAT";
        case 991: txt = "LSC DISP";
        case 992: txt = "L-TAC";
    }
    return txt;
}

IsWindowedVehicle(vehicleid)
{
    new
        model = GetVehicleModel(vehicleid);

    if (400 <= model <= 611)
    {
        static const g_WindowInfo[] = {
            1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
            1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1,
            1, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1,
            1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1,
            1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1,
            1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
            1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0,
            1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
            1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1,
            1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1,
            1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0
        };

        return g_WindowInfo[model - 400];
    }
    return 0;
}

IsWindowOpened(vehicleid)
{
    GetVehicleParamsCarWindows(vehicleid, CarData[vehicleid][carWindows][0], CarData[vehicleid][carWindows][1], CarData[vehicleid][carWindows][2], CarData[vehicleid][carWindows][3]);
    if( CarData[vehicleid][carWindows][0] ||
        CarData[vehicleid][carWindows][1] ||
        CarData[vehicleid][carWindows][2] ||
        CarData[vehicleid][carWindows][3])
    {
        return 1;
    }
    return 0;
}

CallPaycheck(i)
{
    if(!pLoggedIn[i]) return 0;

    PlayerData[i][pPlayTime] = 0;

    if(PlayerData[i][pJob])
    {
        PlayerData[i][pJobTime]++;
        switch(PlayerData[i][pJobTime])
        {
            case 12, 24, 32, 48, 96: PlayerData[i][pJobLevel]++; // Kurye
        }

        if(PlayerData[i][pSideJob])
        {
            PlayerData[i][pSideJobTime]++;
            switch(PlayerData[i][pSideJobTime])
            {
                case 12, 24, 32, 48, 96: PlayerData[i][pSideJobLevel]++; // Kurye
            }
         }

    }
    PlayerData[i][pOnlineTime]++;
    if(PlayerData[i][pOnlineTime] != 0 && PlayerData[i][pOnlineTime] % 5 == 0) PlayerData[i][pRep] += 2;


    new
        total_paycheck = 0;

    new
        Float: interest,
        interest_convert,
        Float: savings,
        savings_convert,
        total_tax;

    switch(PlayerData[i][pLevel])
    {
        case 1: total_paycheck+= 1250;
        case 2: total_paycheck+= 1000;
        default: total_paycheck += 450;
    }

    switch(PlayerData[i][pDonator])
    {
        case 0, 1: PlayerData[i][pExp]+= 1;
        case 2: PlayerData[i][pExp]+= 2;
        case 3: PlayerData[i][pExp]+= 3;
        case 4: PlayerData[i][pExp]+= 4;
    }

    if(PlayerData[i][pJob] == MECHANIC_JOB || PlayerData[i][pSideJob] == MECHANIC_JOB)
    {
        SendClientMessage(i, COLOR_WHITE, "(( Mekanik olduðunuz için ekstradan $900 kazandýnýz. ))");
        total_paycheck += 900;
    }

    interest = (PlayerData[i][pBank] / 100) * 0.1;
    interest_convert = floatround(interest, floatround_round);
    savings = (PlayerData[i][pSavings] / 100) * 0.5;
    savings_convert = floatround(savings, floatround_round);
    total_tax = total_paycheck / 10;


    SendClientMessageEx(i, COLOR_WHITE, "SUNUCU ZAMANI:[ %s ]", GetHour());

    if(PlayerData[i][pBank] <= 0)
    {
        new debt = randomEx(10, 20);
        SendClientMessageEx(i, COLOR_ADM, "$%i {FFFFFF}hesap borcunuz maaþýnýzdan kesildi.", debt);
        PlayerData[i][pPaycheck] -= debt;
    }

    SendClientMessage(i, COLOR_WHITE, "|_____ BANKA _____|");
    SendClientMessageEx(i, COLOR_GREY, "   Bakiye: $%s", MoneyFormat(PlayerData[i][pBank]));
    SendClientMessage(i, COLOR_GREY, "   Faiz Oraný: 0.1");
    SendClientMessageEx(i, COLOR_GREY, "   Kazanýlan Faiz: $%s", MoneyFormat(interest_convert));
    SendClientMessageEx(i, COLOR_GREY, "   Ödenilen Vergi: $%s", MoneyFormat(total_tax));

    if(PlayerData[i][pFaction] != -1)
    {
        if(FactionData[PlayerData[i][pFaction]][FactionBank] > 0)
        {
            new faction_pay;
            faction_pay = FactionData[PlayerData[i][pFaction]][FactionBank] / CountOnlineMembers(PlayerData[i][pFaction]);
            FactionData[PlayerData[i][pFaction]][FactionBank]-= faction_pay;
            total_paycheck+= faction_pay;
        }

        total_paycheck+= FactionRanksSalary[PlayerData[i][pFaction]][PlayerData[i][pFactionRank]];
        SendClientMessageEx(i, COLOR_GREY, "   %s Ödemesi: $%s", FactionData[PlayerData[i][pFaction]][FactionAbbrev], MoneyFormat(FactionRanksSalary[PlayerData[i][pFaction]][PlayerData[i][pFactionRank]]));
    }

    if(PlayerData[i][pSavings] > 0) {
        PlayerData[i][pSavings]+= savings_convert;
        SendClientMessageEx(i, COLOR_GREY, "   Kazanýlan Mevduat: $%s, oran: 0.5", MoneyFormat(savings_convert));
        SendClientMessageEx(i, COLOR_GREY, "   Güncel Mevduat: $%s", MoneyFormat(PlayerData[i][pSavings]));
    }

    SendClientMessage(i, COLOR_WHITE, "|_____________________|");

    PlayerData[i][pPaycheck]+= total_paycheck;
    PlayerData[i][pBank]+= interest_convert;
    PlayerData[i][pBank]-= total_tax;

    SendClientMessageEx(i, COLOR_WHITE, "   Yeni Bakiye: $%s", MoneyFormat(PlayerData[i][pBank]));

    if(PlayerData[i][pRenting] != -1)
    {
        if(PlayerData[i][pBank] >= PropertyData[PlayerData[i][pRenting]][PropertyRentPrice])
        {
            SendClientMessageEx(i, COLOR_WHITE, "   Kira: -$%s", MoneyFormat(PropertyData[PlayerData[i][pRenting]][PropertyRentPrice]));
            PlayerData[i][pBank]-= PropertyData[PlayerData[i][pRenting]][PropertyRentPrice];
        }
        else if(PlayerData[i][pBank] < PropertyData[PlayerData[i][pRenting]][PropertyRentPrice])
        {
            SendClientMessageEx(i, COLOR_ADM, "Kira ücretini ödemeyediðiniz için sözleþmeniz iptal edildi.");
            PlayerData[i][pRenting] = -1;
        }
    }

    if(PlayerData[i][pLevel] == 1) SendClientMessage(i, COLOR_WHITE, "(( 1. seviye olduðunuz için $1250 aldýnýz. ))");
    else if(PlayerData[i][pLevel] == 2) SendClientMessage(i, COLOR_WHITE, "(( 2. seviye olduðunuz için $1000 aldýnýz. ))");

    new exp_count = ((PlayerData[i][pLevel]) * 4 + 4);
    if(PlayerData[i][pExp] >= exp_count) cmd_seviyeatla(i, "");

    GameTextForPlayer(i, sprintf("~y~Payday~n~~w~Paycheck~n~~g~$%d", total_paycheck), 3000, 1);
    Player_Save(i);
    return 1;
}

Player_SaveWeapons(playerid)
{
    new query[128];

    for(new i = 0; i < 4; i++)
    {
        mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET Weapons%i = %i, WeaponsAmmo%i = %i WHERE id = %i",
            i, PlayerData[playerid][pWeapons][i],
            i, PlayerData[playerid][pWeaponsAmmo][i],
            PlayerData[playerid][pSQLID]);
        mysql_tquery(m_Handle, query);
    }
    return 1;
}

Player_Save(playerid)
{
    if(pLoggedIn[playerid])
    {
        Player_SaveWeapons(playerid);
        Player_SavePos(playerid, true);

        AntiCheatGetHealth(playerid, PlayerData[playerid][pLastHealth]);
        AntiCheatGetArmour(playerid, PlayerData[playerid][pLastArmor]);

        new query[554];

        mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET AdminLevel = %i, AdminHide = %i, TesterLevel = %i, Exp = %i, Level = %i, Money = %i, Bank = %i, Paycheck = %i WHERE id = %i LIMIT 1", PlayerData[playerid][pAdmin], PlayerData[playerid][pAdminHide], PlayerData[playerid][pTester], PlayerData[playerid][pExp], PlayerData[playerid][pLevel], PlayerData[playerid][pMoney], PlayerData[playerid][pBank], PlayerData[playerid][pPaycheck], PlayerData[playerid][pSQLID]);
        mysql_tquery(m_Handle, query);

        mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET Savings = %i, UpgradePoints = %i, Birthdate = %i, Birthplace = '%e', Attributes = '%e', SecurityNumber = %i WHERE id = %i LIMIT 1", PlayerData[playerid][pSavings], PlayerData[playerid][pUpgradePoints], PlayerData[playerid][pBirthdate], PlayerData[playerid][pBirthplace], PlayerData[playerid][pAttributes], PlayerData[playerid][pSecurityNumber], PlayerData[playerid][pSQLID]);
        mysql_tquery(m_Handle, query);

        mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET MaxHealth = %i, LastHealth = %2.f, LastArmor = %2.f, Skin = %i, DonatorLevel = %i, DonateTime = %i, OnlineTime = %i, Rep = %i WHERE id = %i LIMIT 1", PlayerData[playerid][pMaxHealth], PlayerData[playerid][pLastHealth], PlayerData[playerid][pLastArmor], PlayerData[playerid][pSkin], PlayerData[playerid][pDonator], PlayerData[playerid][pDonateTime], PlayerData[playerid][pOnlineTime], PlayerData[playerid][pRep], PlayerData[playerid][pSQLID]);
        mysql_tquery(m_Handle, query);

        mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET RegTime = %i, LastTime = %i, LastTimeLength = %i, LastIP = '%e', PlayTime = %i WHERE id = %i LIMIT 1", PlayerData[playerid][pRegTime], PlayerData[playerid][pLastTime], PlayerData[playerid][pLastTimeLength], PlayerData[playerid][pLastIP], PlayerData[playerid][pPlayTime], PlayerData[playerid][pSQLID]);
        mysql_tquery(m_Handle, query);

        mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET HWID = '%e', CarKey = %i, HasCarSpawned = %i, HasCarSpawnedID = %i, DriversLicense = %i, WeaponsLicense = %i, MedicalLicense = %i, FlyLicense = %i WHERE id = %i LIMIT 1", PlayerData[playerid][pHWID], PlayerData[playerid][pCarKey], _has_vehicle_spawned[playerid], _has_spawned_vehicleid[playerid], PlayerData[playerid][pDriversLicense], PlayerData[playerid][pWeaponsLicense], PlayerData[playerid][pMedicalLicense], PlayerData[playerid][pFlyLicense], PlayerData[playerid][pSQLID]);
        mysql_tquery(m_Handle, query);

        mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET Faction = %i, FactionRank = %i, Badge = %i, Job = %i, JobTime = %i, JobLevel = %i, SideJob = %i, SideJobTime = %i, SideJobLevel = %i WHERE id = %i LIMIT 1", PlayerData[playerid][pFaction], PlayerData[playerid][pFactionRank], PlayerData[playerid][pBadge], PlayerData[playerid][pJob], PlayerData[playerid][pJobTime], PlayerData[playerid][pJobLevel], PlayerData[playerid][pSideJob], PlayerData[playerid][pSideJobTime], PlayerData[playerid][pSideJobLevel], PlayerData[playerid][pSQLID]);
        mysql_tquery(m_Handle, query);

        mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET ICJailed = %i, ICJailTime = %i, PrisonTimes = %i, ActiveListing = %i WHERE id = %i LIMIT 1", PlayerData[playerid][pICJailed], PlayerData[playerid][pICJailTime], PlayerData[playerid][pPrisonTimes], PlayerData[playerid][pActiveListing], PlayerData[playerid][pSQLID]);
        mysql_tquery(m_Handle, query);

        mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET OfflineAjail = 0, OfflineAjailReason = '%e' WHERE id = %i LIMIT 1", PlayerData[playerid][pOffAjailReason], PlayerData[playerid][pSQLID]);
        mysql_tquery(m_Handle, query);

        mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET AdminJailed = %i, AdminJailTime = %i, JailTimes = %i, AdminMessage = '%e', AdminMessageBy = %i, AdmMessageConfirm = %i WHERE id = %i LIMIT 1", PlayerData[playerid][pAjailed], PlayerData[playerid][pAjailTime], PlayerData[playerid][pJailTimes], PlayerData[playerid][pAdminMsg], PlayerData[playerid][pAdminMsgBy], PlayerData[playerid][pAdmMsgConfirm], PlayerData[playerid][pSQLID]);
        mysql_tquery(m_Handle, query);

        mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET BrutallyWounded = %i, Chatstyle = %i, Walkstyle = %i, Fightstyle = %i, Hudstyle = %i, Streetstyle = %i WHERE id = %i LIMIT 1", PlayerData[playerid][pBrutallyWounded], PlayerData[playerid][pChatstyle], PlayerData[playerid][pWalkstyle], PlayerData[playerid][pFightstyle], PlayerData[playerid][pHudstyle], PlayerData[playerid][pStreetstyle], PlayerData[playerid][pSQLID]);
        mysql_tquery(m_Handle, query);

        mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET ChatStatus = %i, HudStatus = %i, StreetStatus = %i, PMStatus = %i, OOCStatus = %i, FactionStatus = %i, NewsStatus = %i WHERE id = %i LIMIT 1", PlayerData[playerid][pChatStatus], PlayerData[playerid][pHudStatus], PlayerData[playerid][pStreetStatus], PlayerData[playerid][pPMStatus], PlayerData[playerid][pOOCStatus], PlayerData[playerid][pFactionStatus], PlayerData[playerid][pNewsStatus], PlayerData[playerid][pSQLID]);
        mysql_tquery(m_Handle, query);

        mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET HasMask = %i, HasRadio = %i, HasBurnerPhone = %i, MaskID = %i, MaskIDEx = %i, MainSlot = %i WHERE id = %i LIMIT 1", PlayerData[playerid][pHasMask], PlayerData[playerid][pHasRadio], PlayerData[playerid][pHasBurner], PlayerData[playerid][pMaskID], PlayerData[playerid][pMaskIDEx], PlayerData[playerid][pMainSlot], PlayerData[playerid][pSQLID]);
        mysql_tquery(m_Handle, query);

        for(new c = 1; c < MAX_OWNED_CARS; c++)
        {
            mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET OwnedCar%d = %d WHERE id = %i LIMIT 1", c, PlayerData[playerid][pOwnedCar][c], PlayerData[playerid][pSQLID]);
            mysql_tquery(m_Handle, query);
        }

        for(new r = 1; r < 9; r++)
        {
            mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET Radio%d = %d, Slot%d = %d WHERE id = %i", r, PlayerData[playerid][pRadio][r], r, PlayerData[playerid][pRadioSlot][r], PlayerData[playerid][pSQLID]);
            mysql_tquery(m_Handle, query);
        }

        mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET PhoneNumber = %i, BurnerPhoneNumber = %i, PhoneOff = %i, PhoneType = %i, PhoneSilent = %i, PhoneRingtone = %i, Renting = %i, WorkOn = %i WHERE id = %i LIMIT 1", PlayerData[playerid][pPhone], PlayerData[playerid][pBurnerPhone], PlayerData[playerid][pPhoneOff], PlayerData[playerid][pPhoneType], PlayerData[playerid][pPhoneSilent], PlayerData[playerid][pPhoneRingtone], PlayerData[playerid][pRenting], PlayerData[playerid][pWorkOn], PlayerData[playerid][pSQLID]);
        mysql_tquery(m_Handle, query);

        mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET SpawnHouse = %i, SpawnPrecinct = %i, Components = %i, Cigarettes = %i, Drinks = %i, Boombox = %i, MaxHealth = %i WHERE id = %i LIMIT 1", PlayerData[playerid][pSpawnPointHouse], PlayerData[playerid][pSpawnPrecinct], PlayerData[playerid][pComponents], PlayerData[playerid][pCigarettes], PlayerData[playerid][pDrinks], PlayerData[playerid][pHasBoombox], PlayerData[playerid][pMaxHealth], PlayerData[playerid][pSQLID]);
        mysql_tquery(m_Handle, query);

        for(new i = 1; i < MAX_PACK_SLOT; ++i)
        {
            if(!player_drug_data[playerid][i][is_exist]) continue;

            mysql_format(m_Handle, query, sizeof(query), "UPDATE player_drugs SET drug_name = '%e', drug_type = %i, drug_amount = %f, drug_quality = %i, drug_size = %i WHERE id = %i",
                player_drug_data[playerid][i][drug_name],
                player_drug_data[playerid][i][drug_id],
                player_drug_data[playerid][i][drug_amount],
                player_drug_data[playerid][i][drug_quality],
                player_drug_data[playerid][i][drug_size],
                player_drug_data[playerid][i][data_id]
            );
            mysql_tquery(m_Handle, query);
        }

        for(new i = 1; i < MAX_PACK_SLOT; ++i)
        {
            if(!player_package_data[playerid][i][is_exist]) continue;

            mysql_format(m_Handle, query, sizeof(query), "UPDATE player_packages SET weaponid = %i, ammo = %i WHERE id = %i",
                player_package_data[playerid][i][weapon_id],
                player_package_data[playerid][i][weapon_ammo],
                player_package_data[playerid][i][data_id]
            );
            mysql_tquery(m_Handle, query);
        }
    }
    return 1;
}

Player_DefaultValues(playerid)
{
    pLoggedIn[playerid] = false;
    pSpawnedIn[playerid] = false;

    PlayerData[playerid][pBlockGetir] = 0;

    PlayerData[playerid][pNewss] = true;
    PlayerData[playerid][pKickBanStatus] = true;

    PlayerData[playerid][pOffered] = 0;
    PlayerData[playerid][pOfferedType] = OFFER_TYPE_NONE;
    PlayerData[playerid][pOffer] = INVALID_PLAYER_ID;
    PlayerData[playerid][pOfferPrice] = 0;

    PlayerData[playerid][pOfferedID] = INVALID_PLAYER_ID;

    PlayerData[playerid][pSQLID] = 0;
    PlayerData[playerid][pFirstLogin] = 1;

    PlayerData[playerid][pAdmin] = 0;
    PlayerData[playerid][pAdminHide] = false;
    PlayerData[playerid][pAdminDuty] = false;

    PlayerData[playerid][pTester] = 0;
    PlayerData[playerid][pTesterDuty] = false;

    PlayerData[playerid][pExp] = 0;
    PlayerData[playerid][pLevel] = 1;
    PlayerData[playerid][pMoney] = 0;
    PlayerData[playerid][pBank] = 0;
    PlayerData[playerid][pPaycheck] = 0;
    PlayerData[playerid][pSavings] = 0;
    PlayerData[playerid][pUpgradePoints] = 0;

    PlayerData[playerid][pBirthdate] = 1998;
    format(PlayerData[playerid][pBirthplace], 35, "");
    format(PlayerData[playerid][pAttributes], 128, "");
    PlayerData[playerid][pSecurityNumber] = 0;

    PlayerData[playerid][pMaxHealth] = 100;
    PlayerData[playerid][pLastHealth] = 100.0;
    PlayerData[playerid][pLastArmor] = 0.0;
    PlayerData[playerid][pSkin] = 264;
    PlayerData[playerid][pDutySkin] = 264;

    PlayerData[playerid][pDonator] = 0;
    PlayerData[playerid][pDonateTime] = 0;
    PlayerData[playerid][pOnlineTime] = 0;
    PlayerData[playerid][pRep] = 0;
    PlayerData[playerid][pHelpupTime] = 0;
    PlayerData[playerid][pReportTime] = 0;
    PlayerData[playerid][pSupportTime] = 0;

    PlayerData[playerid][pRegTime] = 0;
    PlayerData[playerid][pLastTime] = 0;
    PlayerData[playerid][pLastTimeLength] = 0;

    PlayerData[playerid][pPauseCheck] = 0;
    PlayerData[playerid][pPauseTime] = 0;

    PlayerData[playerid][pRegIP] = 0;
    PlayerData[playerid][pLastIP] = 0;

    PlayerData[playerid][pPlayTime] = 0;
    PlayerData[playerid][pCrashed] = 0;

    format(PlayerData[playerid][pHWID], 60, "");
    format(PlayerData[playerid][pColdedPlate], 24, "Yok");
    SetPVarInt(playerid, "playerPlateCountdown", -1);

    PlayerData[playerid][pCarKey] = 0;
    PlayerData[playerid][pRentCarKey] = 0;

    PlayerData[playerid][pHouseKey] = -1;
    PlayerData[playerid][pGrantBuild] = -1;
    PlayerData[playerid][p3DMenu] = -1;

    PlayerData[playerid][pDriversLicense] = false;
    PlayerData[playerid][pWeaponsLicense] = false;
    PlayerData[playerid][pMedicalLicense] = false;
    PlayerData[playerid][pFlyLicense] = false;

    PlayerData[playerid][pFaction] = 0;
    PlayerData[playerid][pFactionRank] = 0;
    PlayerData[playerid][pBadge] = 0;

    PlayerData[playerid][pJob] = 0;
    PlayerData[playerid][pJobTime] = 0;
    PlayerData[playerid][pJobLevel] = 0;

    PlayerData[playerid][pSideJob] = 0;
    PlayerData[playerid][pSideJobTime] = 0;
    PlayerData[playerid][pSideJobLevel] = 0;

    PlayerData[playerid][pICJailed] = 0;
    PlayerData[playerid][pICJailTime] = 0;
    PlayerData[playerid][pICJailNotify] = 0;

    PlayerData[playerid][pPrisonTimes] = 0;
    PlayerData[playerid][pActiveListing] = 0;

    PlayerData[playerid][pOffAjail] = 0;
    format(PlayerData[playerid][pOffAjailReason], 128, "");

    SetPVarInt(playerid, "cctvShot", 0);

    PlayerData[playerid][pAjailed] = 0;
    PlayerData[playerid][pAjailTime] = 0;
    PlayerData[playerid][pJailTimes] = 0;

    PlayerData[playerid][pAdminMsgBy] = 0;
    format(PlayerData[playerid][pAdminMsg], 128, "");
    PlayerData[playerid][pAdmMsgConfirm] = false;

    PlayerData[playerid][pLegShot] = 0;
    PlayerData[playerid][pLowSkill] = 0;
    PlayerData[playerid][pBrutallyWounded] = 0;
    PlayerData[playerid][pExecuteTime] = 0;

    PlayerData[playerid][pChatstyle] = 0;
    PlayerData[playerid][pWalkstyle] = 0;
    PlayerData[playerid][pFightstyle] = 0;
    PlayerData[playerid][pHudstyle] = 0;
    PlayerData[playerid][pStreetstyle] = 0;

    PlayerData[playerid][pChatStatus] = false;
    PlayerData[playerid][pHudStatus] = false;
    PlayerData[playerid][pStreetStatus] = false;
    PlayerData[playerid][pPMStatus] = false;
    PlayerData[playerid][pOOCStatus] = false;
    PlayerData[playerid][pFactionStatus] = false;
    PlayerData[playerid][pNewsStatus] = false;
    PlayerData[playerid][pColorStatus] = false;
    PlayerData[playerid][pDeathStatus] = false;
    PlayerData[playerid][pNickStatus] = false;
    PlayerData[playerid][pConnectStatus] = false;

    PlayerData[playerid][pCheckpoint] = -1;
    PlayerData[playerid][pCarCheckpoint] = 0;

    PlayerData[playerid][pGascan] = 0;

    SetPVarInt(playerid, "IdentityActive", 0);

    PlayerData[playerid][pInsideComplex] = -1;
    PlayerData[playerid][pInsideHouse] = -1;
    PlayerData[playerid][pInsideBusiness] = -1;
    PlayerData[playerid][pInsideApartment] = -1;
    PlayerData[playerid][pInsideGarage] = -1;
    PlayerData[playerid][pInsideEntrance] = -1;
    PlayerData[playerid][pInsideDoor] = -1;
    PlayerData[playerid][pInsidePNS] = -1;
    PlayerData[playerid][pHasMask] = false;
    PlayerData[playerid][pHasRadio] = false;
    PlayerData[playerid][pHasBurner] = false;
    PlayerData[playerid][pHasBoombox] = false;

    PlayerData[playerid][pMaskID] = 0;
    PlayerData[playerid][pMaskIDEx] = 0;
    PlayerData[playerid][pMaskOn] = false;

    for(new i = 1; i < MAX_OWNED_CARS; i++) {
        PlayerData[playerid][pOwnedCar][i] = 0;
    }

    PlayerData[playerid][pMainSlot] = 0;

    for(new i = 1; i < 9; i++)
    {
        PlayerData[playerid][pRadio][i] = 0;
        PlayerData[playerid][pRadioSlot][i] = 0;
    }

    PlayerData[playerid][pPhone] = 0;
    PlayerData[playerid][pPhoneOff] = 0;
    PlayerData[playerid][pPhoneType] = 0;
    PlayerData[playerid][pPhoneRingtone] = 20600;
    PlayerData[playerid][pPhoneSilent] = 0;

    PlayerData[playerid][pCalling] = 0;
    PlayerData[playerid][pPhoneline] = INVALID_PLAYER_ID;
    PlayerData[playerid][pPhoneCooldown] = 0;
    PlayerData[playerid][pLoudspeaker] = 0;

    PlayerData[playerid][pUseGUI] = false;
    PlayerData[playerid][pUseCaseGUI] = false;

    PlayerData[playerid][pBurnerPhone] = 0;
    PlayerData[playerid][pUsingBurner] = false;
    PlayerData[playerid][pBurnerPhoneOff] = false;

    PlayerData[playerid][pRenting] = -1;
    PlayerData[playerid][pWorkOn] = -1;

    PlayerData[playerid][pSpawnPoint] = 0;
    PlayerData[playerid][pSpawnPointHouse] = -1;
    PlayerData[playerid][pSpawnPrecinct] = 0;

    for(new bp = 0; bp < 3; bp++)
    {
        CharacterHolder[playerid][bp] = 0;
    }

    PlayerData[playerid][pLAWduty] = 0;
    PlayerData[playerid][pSWATduty] = 0;
    PlayerData[playerid][pMEDduty] = 0;
    PlayerData[playerid][pSDCduty] = 0;

    PlayerData[playerid][pComponents] = 0;
    PlayerData[playerid][pCigarettes] = 0;
    PlayerData[playerid][pDrinks] = 0;

    PlayerData[playerid][pBlindFolded] = false;
    PlayerData[playerid][pSSMod] = false;
    PlayerData[playerid][pHandcuffed] = false;
    PlayerData[playerid][pHandcuffing] = false;
    PlayerData[playerid][pHandcuffCount] = 0;

    PlayerData[playerid][pTaser] = false;
    PlayerData[playerid][pTackle] = false;
    PlayerData[playerid][pRubberbullet] = false;
    PlayerData[playerid][pLethalbullet] = false;

    format(PlayerData[playerid][pCallsign], 128, "");
    PlayerData[playerid][pDep] = 0;

    for(new i = 0; i < 4; i++)
    {
        PlayerData[playerid][pWeapons][i] = 0;
        PlayerData[playerid][pWeaponsAmmo][i] = 0;
    }

    PlayerData[playerid][pBuyingClothing] = false;
    PlayerData[playerid][pEditingClothing] = false;
    format(PlayerData[playerid][pClothingName], 90, "");
    PlayerData[playerid][pClothingPrice] = 0;

    PlayerData[playerid][pDrugUse] = -1;
    PlayerData[playerid][pDrugTime] = 0;
    PlayerData[playerid][pDrugChgWeather] = 0;
    PlayerData[playerid][pDrugTimer] = -1;
    PlayerData[playerid][pDrugLoop] = 0;

    PlayerData[playerid][pConvoID] = INVALID_PLAYER_ID;
    PlayerData[playerid][pLiveBroadcast] = INVALID_PLAYER_ID;
    PlayerData[playerid][pLiveOffer] = INVALID_PLAYER_ID;
    PlayerData[playerid][pFactionOffer] = -1;

    PlayerData[playerid][pFishTime] = 0;
    PlayerData[playerid][pFishWeight] = 0;
    PlayerData[playerid][pFishCheckpoint] = 0;

    PlayerData[playerid][pSetTime] = 0;
    format(PlayerData[playerid][pSetReason], 128, "");

    for(new i = 0; i < 10; i++) {
        PlayerData[playerid][pItemCache][i] = 0;
    }

    PlayerData[playerid][pInTuning] = 0;
    PlayerData[playerid][pTuningCount] = 0;
    PlayerData[playerid][pTuningComponent] = 0;
    PlayerData[playerid][pTuningCategoryID] = 0;

    PlayerData[playerid][pSprayPoint] = 0;
    PlayerData[playerid][pSprayLength] = 0;
    format(PlayerData[playerid][pSprayText], 128, "");
    PlayerData[playerid][pSprayFont] = 0;
    PlayerData[playerid][pSprayTarget] = -1;
    PlayerData[playerid][pSprayLength] = 0;
    PlayerData[playerid][pSprayAllow] = 0;

    PlayerData[playerid][pUnscrambling] = false;
    PlayerData[playerid][pUnscramblerTime] = 111;
    PlayerData[playerid][pUnscrambleTimer] = 0;
    PlayerData[playerid][pUnscrambleID] = 0;
    PlayerData[playerid][pScrambleSuccess] = 0;
    PlayerData[playerid][pScrambleFailed] = 0;

    PlayerData[playerid][pGreetRequest] = -1;
    PlayerData[playerid][pGreetType] = -1;

    PlayerData[playerid][pFriskRequest] = -1;
    PlayerData[playerid][pFrisking] = -1;
    PlayerData[playerid][pAllowedFrisk] = -1;

    PlayerData[playerid][pLastChat] = 0;
    format(PlayerData[playerid][pLastCMD], 128, "");
    PlayerData[playerid][pLastCMDTime] = 0;
    PlayerData[playerid][pLastEmoteTime] = 0;

    PlayerData[playerid][pRadar] = false;
    PlayerData[playerid][pRadarSpeed] = 0;
    PlayerData[playerid][pRadarPos][0] = 0.0;
    PlayerData[playerid][pRadarPos][1] = 0.0;
    PlayerData[playerid][pRadarPos][2] = 0.0;
    SetPVarInt(playerid, "speedradar_lasttime", gettime());

    PlayerData[playerid][pTestTime] = 0;
    PlayerData[playerid][pTestCar] = INVALID_VEHICLE_ID;
    PlayerData[playerid][pTestStage] = 0;
    PlayerData[playerid][pDrivingTest] = false;
    PlayerData[playerid][pTaxiDrivingTest] = false;

    PlayerData[playerid][pAutoLow] = false;

    PlayerData[playerid][pKickDoor] = false;
    PlayerData[playerid][pTraceNum] = INVALID_PLAYER_ID;
    PlayerData[playerid][pIsTracing] = 0;

    PlayerData[playerid][pAtDealership] = false;

    PlayerData[playerid][p911Steps] = 0;
    format(PlayerData[playerid][p911Text], 128, "");
    format(PlayerData[playerid][p911Location], 128, "");

    PlayerData[playerid][pCarryTrash] = false;
    PlayerData[playerid][pCarryMeal] = -1;

    PlayerData[playerid][pPlayingAnimation] = false;
    PlayerData[playerid][TempTweak] = 0;
    KillTimer(PlayerData[playerid][carTweakTimer]);

    PlayerData[playerid][pCargoID] = 0;

    Drug_DefaultValues(playerid);
    Package_DefaultValues(playerid);

    for(new i = 0; i < 10; i++) RemovePlayerAttachedObject(playerid, i);

    PlayerTutorialStep[playerid] = 0;
    KillTimer(PlayerTutorialTimer[playerid]);
    PlayerTutorialTimer[playerid] = -1;

    SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL, 899);
    SetPlayerSkillLevel(playerid, WEAPONSKILL_MICRO_UZI, 0);
    SetPlayerSkillLevel(playerid, WEAPONSKILL_SPAS12_SHOTGUN, 0);

    SetPlayerSkillLevel(playerid, WEAPONSKILL_AK47, 999);
    SetPlayerSkillLevel(playerid, WEAPONSKILL_DESERT_EAGLE, 999);
    SetPlayerSkillLevel(playerid, WEAPONSKILL_SHOTGUN, 999);
    SetPlayerSkillLevel(playerid, WEAPONSKILL_M4, 999);
    SetPlayerSkillLevel(playerid, WEAPONSKILL_MP5, 999);

    oc_ws[playerid] = -1;

    // ***
    OfferedHireBy[playerid] = INVALID_PLAYER_ID;
    OfferedHireTo[playerid] = INVALID_PLAYER_ID;
    OfferedHireBusinessID[playerid] = 0;

    VehicleOfferBy[playerid] = INVALID_PLAYER_ID;
    VehicleOfferedTo[playerid] = INVALID_PLAYER_ID;
    VehicleDBIDOffered[playerid] = 0;
    VehiclePrice[playerid] = 0;

    playerEnteringVehicle[playerid] = INVALID_VEHICLE_ID;

    _respawn_timer[playerid] = 0;
    _has_vehicle_spawned[playerid] = 0;
    _has_spawned_vehicleid[playerid] = 0;

    _has_player_reviving[playerid] = 0;
    _has_player_reviver[playerid] = -1;

    for(new i = 0; i < MAX_DAMAGES; i++)
    {
        DamageData[playerid][i][DamageTaken] = 0;
    }

    for(new i = 0; i < MAX_PLAYER_NOTES; i++)
    {
        NoteData[playerid][i][NoteID] = 0;
    }

    for(new i = 0; i < MAX_CLOTHING_ITEMS; i++)
    {
        ClothingData[playerid][i][ClothingID] = 0;
    }

    for(new i = 1; i < MAX_ADMIN_NOTES; i++)
    {
        aNotesData[playerid][i][anote_SQLID] = 0;
    }

    for(new i = 1; i < MAX_PLAYER_CONTACTS; i++)
    {
        ContactsData[playerid][i][contactID] = 0;
        ContactsData[playerid][i][contactSQLID] = 0;
    }

    CCTVID[playerid] = SpectateID[playerid] = SpectateType[playerid] = -1;
    EditingObject[playerid] = EditingID[playerid] = 0;

    Weapon_ResetPositions(playerid);

    StartedTaxiJob[playerid] = false;
    TaxiFairStarted[playerid] = 0;
    TaxiDriver[playerid] = 0;
    TaxiDuration[playerid] = 0;
    TaxiPrice[playerid] = 0;
    InTaxiRide[playerid] = 0;
    TaxiFair[playerid] = 5;
    TaxiTotalFair[playerid] = 0;

    for(new i = 0; i < MAX_FINES; i++)
    {
        Fines[playerid][i][fine_id] = 0;
        Fines[playerid][i][fine_amount] = 0;
    }

    MainPhone[playerid] = 0;
    Chopshopping[playerid] = 0;

    PlayerRefilling[playerid] = 0;
    RefillPoint[playerid] = 0;
    RefillPrice[playerid] = 0;
    RefillAmount[playerid] = 0;
    RefillVehicle[playerid] = 0;

    SetPVarInt(playerid, "lastPMer", -2);

    format(TaxiText[playerid], 128, "");
    format(MechanicText[playerid], 128, "");

    TotalDamages[playerid] = 0;
    format(PlayerData[playerid][pLastDamages], 128, "üzerinde belirgin bir hasar yok.");
    PlayerVlogPage[playerid] = 0;
    PlayerVlogVehicle[playerid] = 0;

    DeathTimeNotice[playerid] = 0;
    CanChangePassword[playerid] = 0;

    OfflineBanName[playerid] = "";
    OfflineJailName[playerid] = "";
    OfflineJailTime[playerid] = 0;
    AdminPanelName[playerid] = "";
    for(new i = 1; i < MAX_ADMIN_NOTES; i++) AdminNoteSelect[playerid][i] = 0;
    AdminNoteSelected[playerid] = 0;
    AdminNoteIssuer[playerid] = "";

    format(PropertyNameHolder[playerid], 35, "");

    PlayerBreakInVehicle[playerid] = INVALID_VEHICLE_ID;
    PlayerBreakingIn[playerid] = 0;
    BreakInError[playerid] = 0;
    ActiveLockTD[playerid] = 0;

    noclipdata[playerid][cameramode]    = CAMERA_MODE_NONE;
    noclipdata[playerid][lrold]         = 0;
    noclipdata[playerid][udold]         = 0;
    noclipdata[playerid][mode]          = 0;
    noclipdata[playerid][lastmove]      = 0;
    noclipdata[playerid][accelmul]      = 0.0;
    noclipdata[playerid][accel]         = ACCEL_MODE;
    noclipdata[playerid][accelrate]     = ACCEL_RATE;
    noclipdata[playerid][maxspeed]      = MOVE_SPEED;
    FlyMode[playerid] = false;

    ResetPlayerMoney(playerid);

    SetPVarInt(playerid, "LA", 4);
    SetPVarInt(playerid, "Viewing_CharacterList", 1);

    DeletePVar(playerid, "Viewing_OwnedCarList");
    DeletePVar(playerid, "SelectedRank");

    SetPVarInt(playerid, "NeedTaxi", 0);
    SetPVarInt(playerid, "Mechanic_ID", INVALID_PLAYER_ID);
    SetPVarInt(playerid, "Mechanic_Type", -1);

    SetPVarInt(playerid, "Grantbuild_ID", INVALID_PLAYER_ID);
    SetPVarInt(playerid, "Grantbuild_PropertyID", -1);

    SetPVarInt(playerid, "FurniturePos", -1);
    SetPVarInt(playerid, "FurnitureRot", -1);

    SetPVarInt(playerid, "AtHouse", -1);
    SetPVarInt(playerid, "AtBusiness", -1);
    SetPVarInt(playerid, "AtDoor", -1);
    SetPVarInt(playerid, "AtToll", -1);
    SetPVarInt(playerid, "AtPayNSpray", -1);
    SetPVarInt(playerid, "AtGarage", -1);
    SetPVarInt(playerid, "AtEntrance", -1);
    SetPVarInt(playerid, "AtGate", -1);
    SetPVarInt(playerid, "AtSpray", -1);
    SetPVarInt(playerid, "AtArrest", -1);
    SetPVarInt(playerid, "AtIndustry", -1);
    SetPVarInt(playerid, "AtCrate", -1);
    SetPVarInt(playerid, "AtGarbage", -1);
    //SetPVarInt(playerid, "AtDetector", -1);
    SetPVarInt(playerid, "AtBoombox", -1);
    SetPVarInt(playerid, "AtATM", -1);
    SetPVarInt(playerid, "AtObject", -1);
    SetPVarInt(playerid, "AtLabel", -1);
    SetPVarInt(playerid, "AtCCTV", -1);
    SetPVarInt(playerid, "AtSpike", -1);
    //SetPVarInt(playerid, "AtHospital", -1);
    SetPVarInt(playerid, "Viewing_MDC", 0);
    return 1;
}

Vehicle_DefaultValues(vehicleid)
{
    if(vehicleid == INVALID_VEHICLE_ID) return 0;

    CarData[vehicleid][carID] = 0;
    CarData[vehicleid][carOwnerID] = 0;
    CarData[vehicleid][carFaction] = -1;
    CarData[vehicleid][carRental] = 0;
    CarData[vehicleid][carRentalPrice] = 1000;
    CarData[vehicleid][carRentedBy] = 0;
    CarData[vehicleid][carTerminate] = 0;

    format(CarData[vehicleid][carPlates], 20, "-");
    format(CarData[vehicleid][carName], 35, "-");
    format(CarData[vehicleid][carSign], 45, "-");

    if(IsValidDynamic3DTextLabel(CarData[vehicleid][carSign3D])) DestroyDynamic3DTextLabel(CarData[vehicleid][carSign3D]);

    CarData[vehicleid][carPos][0] = CarData[vehicleid][carPos][1] = CarData[vehicleid][carPos][2] = CarData[vehicleid][carPos][3] = 0.0;
    CarData[vehicleid][carInterior] = CarData[vehicleid][carWorld] = 0;
    CarData[vehicleid][carColor1] = CarData[vehicleid][carColor2] = 0;

    CarData[vehicleid][carXMR] = false;
    CarData[vehicleid][carXMROn] = false;
    format(CarData[vehicleid][carXMRUrl], 128, "-");

    CarData[vehicleid][carSiren] = false;
    CarData[vehicleid][carSirenOn] = false;

    if(IsValidDynamicObject(CarData[vehicleid][carSirenObject]))
        DestroyDynamicObject(CarData[vehicleid][carSirenObject]);

    CarData[vehicleid][carLocked] = false;
    CarData[vehicleid][carImpounded] = -1;

    CarData[vehicleid][carFuel] = 100.0;
    CarData[vehicleid][carMileage] = CarData[vehicleid][carArmour] = 0.0;
    CarData[vehicleid][carBattery] = CarData[vehicleid][carEngine] = 100.00;

    CarData[vehicleid][carLock] = 0;
    CarData[vehicleid][carAlarm] = 0;
    CarData[vehicleid][carImmob] = 1;
    CarData[vehicleid][carInsurance] = 0;
    CarData[vehicleid][carInsuranceTime] = 0;
    CarData[vehicleid][carInsurancePrice] = 0;
    CarData[vehicleid][carTimeDestroyed] = 0;

    CarData[vehicleid][carPaintjob] = -1;
    for(new m; m < 14; m++) CarData[vehicleid][carMods][m] = -1;
    for(new d; d < 4; d++) CarData[vehicleid][carDoors][d] = 0, CarData[vehicleid][carWindows][d] = 1;

    CarData[vehicleid][carlastDriver] = 0;
    CarData[vehicleid][carlastPassenger] = 0;

    CarData[vehicleid][carLastHealth] = GetVehicleCondition(vehicleid, 0);
    CarData[vehicleid][carMaxHealth] = GetVehicleCondition(vehicleid, 0);
    CarData[vehicleid][carPanelStatus] = CarData[vehicleid][carDoorsStatus] = 0;
    CarData[vehicleid][carLightsStatus] = CarData[vehicleid][carTiresStatus] = 0;

    CarData[vehicleid][carExists] = false;
    CarData[vehicleid][carTweak] = false;
    CarData[vehicleid][carRev] = 0;

    for(new i; i != MAX_TRUCK_PRODUCT; i++)
    {
        if(i < 6 && IsValidDynamicObject(CarData[vehicleid][carCargoObj][i]))
        {
            DestroyDynamicObject(CarData[vehicleid][carCargoObj][i]);
            CarData[vehicleid][carCargoObj][i] = INVALID_OBJECT_ID;
        }

        CarData[vehicleid][carCargoAmount][i] = 0;
    }

    CarData[vehicleid][carTrashCount] = 0;

    CarData[vehicleid][carCorpse] = -1;

    // bitiþ

    for(new i; i < MAX_FINES; i++)
    {
        VehicleFines[vehicleid][i][fine_id] = 0;
        VehicleFines[vehicleid][i][fine_amount] = 0;
    }

    for(new x; x < MAX_WEP_SLOT; x++)
    {
        vehicle_weap_data[vehicleid][x][is_exist] = false;
        if(IsValidDynamicObject(vehicle_weap_data[vehicleid][x][temp_object])) DestroyDynamicObject(vehicle_weap_data[vehicleid][x][temp_object]);
    }

    for(new x; x < MAX_PACK_SLOT; x++)
    {
        vehicle_drug_data[vehicleid][x][is_exist] = false;
    }
    return 1;
}

ResetHouseVar(playerid)
{
    PlayerData[playerid][pInsideHouse] = -1;
    PlayerData[playerid][pInsideBusiness] = -1;
    PlayerData[playerid][pInsideComplex] = -1;
    PlayerData[playerid][pInsideGarage] = -1;
    PlayerData[playerid][pInsideApartment] = -1;
    PlayerData[playerid][pInsidePNS] = -1;
    PlayerData[playerid][pInsideDoor] = -1;
    PlayerData[playerid][pInsideEntrance] = -1;
    return 1;
}

stock EndPlayerRefill(playerid, businessid, error = 0)
{
    if(error)
    {
        DestroyDynamic3DTextLabel(RefillTextdraw[playerid]);
        KillTimer(RefillTimer[playerid]);

        PlayerRefilling[playerid] = 0;
        RefillPoint[playerid] = 0;
        RefillPrice[playerid] = 0;
        RefillAmount[playerid] = 0;

        SendClientMessage(playerid, COLOR_ADM, "Aracýna yakýt alýrken bir sorun oluþtu.");
    }
    else
    {
        DestroyDynamic3DTextLabel(RefillTextdraw[playerid]);
        KillTimer(RefillTimer[playerid]);

        BusinessData[businessid][BusinessProduct] -= 1;
        BusinessData[businessid][BusinessCashbox] += RefillPrice[playerid];
        SendClientMessageEx(playerid, COLOR_ACTION, "Aracýnýn deposunu $%i ödeyerek doldurdun. (Miktar: %.2f, Önceki: %.2f)", RefillPrice[playerid], RefillAmount[playerid], CarData[RefillVehicle[playerid]][carFuel]);
        CarData[RefillVehicle[playerid]][carFuel] = RefillAmount[playerid];
        GiveMoney(playerid, -RefillPrice[playerid]);

        PlayerRefilling[playerid] = 0;
        RefillPoint[playerid] = 0;
        RefillPrice[playerid] = 0;
        RefillAmount[playerid] = 0;
        RefillVehicle[playerid] = 0;

    }
    return 1;
}

PreloadAnimations(playerid)
{
    for (new i = 0; i < sizeof(g_aPreloadLibs); i ++) {
        ApplyAnimation(playerid, g_aPreloadLibs[i], "null", 4.0, 0, 0, 0, 0, 0, 1);
    }
    return 1;
}

CountFactionMembers(factionid)
{
    new query[60], count;
    mysql_format(m_Handle, query, sizeof(query), "SELECT COUNT(*) FROM players WHERE Faction = %i", factionid);
    mysql_query(m_Handle, query);
    cache_get_value_index_int(0, 0, count);
    return count;
}

LoadVehicles(playerid, slotid)
{
    new query[60];
    mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM vehicles WHERE id = %i LIMIT 1", PlayerData[playerid][pOwnedCar][slotid]);
    mysql_tquery(m_Handle, query, "SQL_LoadOwnedCars", "i", playerid);
    return 1;
}

stock strmatch(const String1[], const String2[])
{
    if ((strcmp(String1, String2, true, strlen(String2)) == 0) && (strlen(String2) == strlen(String1)))
    {
        return true;
    }
    else
    {
        return false;
    }
}

stock ReturnIP(playerid)
{
    new ip[16];
    GetPlayerIp(playerid, ip, sizeof(ip));
    return ip;
}

ReturnName(playerid, underscore = 1)
{
    new name[90], oocname[MAX_PLAYER_NAME], icname[MAX_PLAYER_NAME];

    if(underscore == 1)
    {
        GetPlayerName(playerid, oocname, sizeof(oocname));
        name = oocname;
    }
    else if(underscore == 0)
    {
        if(PlayerData[playerid][pMaskOn]) format(name, sizeof(name), "[Maskeli %d_%d]", PlayerData[playerid][pMaskID], PlayerData[playerid][pMaskIDEx]);
        else
        {
            GetPlayerName(playerid, icname, sizeof(icname));
            ReplaceText(icname, "_", " ");
            name = icname;
        }
    }

    return name;
}

ReturnPlayerMask(playerid)
{
    new string[45];
    format(string, sizeof(string), "[Maskeli %d_%d]", PlayerData[playerid][pMaskID], PlayerData[playerid][pMaskIDEx]);
    return string;
}

Faction_GetName(id)
{
    new faction_name[128];
    format(faction_name, sizeof(faction_name), "%s", FactionData[id][FactionName]);
    return faction_name;
}

Player_GetFaction(playerid)
{
    new faction_name[128];
    if(PlayerData[playerid][pFaction] == -1) faction_name = "Sivil";
    else format(faction_name, 128, "%s", FactionData[PlayerData[playerid][pFaction]][FactionName]);
    return faction_name;
}

Player_GetFactionRank(playerid)
{
    new rank_name[32];
    if(PlayerData[playerid][pFaction] == -1) rank_name = "Yok";
    else format(rank_name, 32, "%s", FactionRanks[PlayerData[playerid][pFaction]][PlayerData[playerid][pFactionRank]]);
    return rank_name;
}

Player_GetFactionAbbrev(playerid)
{
    new faction_abbrev[128];
    if(PlayerData[playerid][pFaction] == -1) faction_abbrev = "Yok";
    else format(faction_abbrev, 128, "%s", FactionData[PlayerData[playerid][pFaction]][FactionAbbrev]);
    return faction_abbrev;
}

Player_GetLocation(playerid)
{
    new Float: x, Float: y, Float: z, location[35]; GetPlayerPos(playerid, x, y, z);
    format(location, sizeof(location), "%s", GetZoneName(x, y, z));
    return location;
}

Player_GetTruckerRank(playerid)
{
    new txt[26];
    switch(PlayerData[playerid][pJobLevel])
    {
        case 0: txt = "Stajyer Kurye";
        case 1: txt = "Kurye";
        case 2: txt = "Profesyonel Kurye";
        case 3: txt = "Stajyer Kamyon Þoförü";
        case 4: txt = "Kamyon Þoförü";
        case 5: txt = "Profesyonel Kamyoncu";
        default: txt = "Profesyonel Kamyoncu";
    }
    return txt;
}

Player_GetSideTruckerRank(playerid)
{
    new txt[26];
    switch(PlayerData[playerid][pJobLevel])
    {
        case 0: txt = "Stajyer Kurye";
        case 1: txt = "Kurye";
        case 2: txt = "Profesyonel Kurye";
        case 3: txt = "Stajyer Kamyon Þoförü";
        case 4: txt = "Kamyon Þoförü";
        case 5: txt = "Profesyonel Kamyoncu";
        default: txt = "Profesyonel Kamyoncu";
    }
    return txt;
}

ReturnStatistics(playerid, playerb, admin = 0)
{
    // playerid - player we're checking statistics.
    // playerb - player we're sending too.

    AntiCheatGetHealth(playerid, PlayerData[playerid][pLastHealth]);
    AntiCheatGetArmour(playerid, PlayerData[playerid][pLastArmor]);

    new vehicle_key[32], spare_key[32], work_on[32];
    if(!_has_vehicle_spawned[playerid]) vehicle_key = "Yok";
    else format(vehicle_key, 32, "%i", _has_spawned_vehicleid[playerid]);

    if(!PlayerData[playerb][pCarKey]) spare_key = "Yok";
    else format(spare_key, 32, "%i", PlayerData[playerb][pCarKey]);

    if(PlayerData[playerid][pWorkOn] == -1) work_on = "Yok";
    else format(work_on, 32, "%s", BusinessData[PlayerData[playerid][pWorkOn]][BusinessName]);

    new minutes = PlayerData[playerid][pPlayTime] / 60;

    SendClientMessageEx(playerb, COLOR_DARKGREEN, "|__________________%s [%s]__________________|", ReturnName(playerid), GetFullTime(Time()));
    SendClientMessageEx(playerb, COLOR_GRAD2, "| Karakter | Birlik ID:[%d] Birlik:[%s] Telefon:[%d] Payday[%d/60]", PlayerData[playerid][pFaction], Player_GetFaction(playerid), ReturnPhoneNumber(playerid), minutes);
    SendClientMessageEx(playerb, COLOR_GRAD1, "| Envanter | Araba Parçalarý:[%i] Radyo:[%s] Býçak:[%s]", PlayerData[playerid][pComponents], PlayerData[playerid][pHasRadio] ? "Evet" : "Hayýr", Weapons_Show(playerid, 1));
    SendClientMessageEx(playerb, COLOR_GRAD2, "| Silahlar | Birincil Silah:[%s] Mermi:[%d] Ýkincil Silah:[%s] Mermi:[%d]", Weapons_Show(playerid, 4), PlayerData[playerid][pWeaponsAmmo][3], Weapons_Show(playerid, 3), PlayerData[playerid][pWeaponsAmmo][2]);
    SendClientMessageEx(playerb, COLOR_GRAD1, "| Seviye | Seviye:[%i] Deneyim Puaný:[%i/%i] Baðýþçý Seviyesi:[%s]", PlayerData[playerid][pLevel], PlayerData[playerid][pExp], ((PlayerData[playerid][pLevel]) * 4 + 4), ReturnDonatorLevel(playerid));
    SendClientMessageEx(playerb, COLOR_GRAD2, "| Beceri | Can:[%.1f/%i.0] Oynama Saati:[%i saat] Onur Puaný:[%i]", PlayerData[playerid][pLastHealth], PlayerData[playerid][pMaxHealth], PlayerData[playerid][pOnlineTime], PlayerData[playerid][pRep]);
    SendClientMessageEx(playerb, COLOR_GRAD1, "| Para | Para:[$%s] Banka:[$%s] Birikim Hesabý:[$%s] Maaþ Hesabý:[$%s]", MoneyFormat(PlayerData[playerid][pMoney]), MoneyFormat(PlayerData[playerid][pBank]), MoneyFormat(PlayerData[playerid][pSavings]), MoneyFormat(PlayerData[playerid][pPaycheck]));
    SendClientMessageEx(playerb, COLOR_GRAD2, "| Diðer | AraçAnahtar(lar)ý:[%s][%s] Çalýþtýðý Ýþyeri:[%s] Yan Meslek:[%s] KiralýkAraç:[%i]",  vehicle_key, spare_key, work_on, PlayerData[playerid][pSideJob] == TRUCKER_JOB ? Player_GetSideTruckerRank(playerid) : ReturnJobName(PlayerData[playerid][pSideJob]), PlayerData[playerid][pRentCarKey]);

    if(PlayerData[playerb][pAdmin] && admin == 1)
    {
        new
            business_key[3],
            house_key[3],
            minuteConnection;

        for(new i; i < 3; i++) business_key[i] = house_key[i] = -1;

        new j = 0;
        foreach(new i : Businesses) if(BusinessData[i][BusinessOwnerSQLID] == PlayerData[playerid][pSQLID])
        {
            business_key[j] = i;
            j++;

            if(j > 2) break;
        }

        j = 0;
        foreach(new i : Properties) if(PropertyData[i][PropertyOwnerID] == PlayerData[playerid][pSQLID])
        {
            house_key[j] = i;
            j++;

            if(j > 2) break;
        }

        minuteConnection = ((NetStats_GetConnectedTime(playerid) % (1000*60*60)) % (1000*60)) / 1000;

        new Float: packetloss; GetPlayerPacketloss(playerid, packetloss);
        SendClientMessageEx(playerb, COLOR_GRAD1, "FOR ADMIN: ÝþyeriAnahtar(lar)ý:[%i][%i][%i] EvAnahtar(lar)ý:[%i][%i][%i] Kiralýk Ev:[%i] Interior:[%d] World:[%d]", business_key[0], business_key[1], business_key[2], house_key[0], house_key[1], house_key[2], PlayerData[playerid][pRenting], GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid));
        SendClientMessageEx(playerb, COLOR_GRAD2, "CONNECTION: Packetloss:[%f] Ping:[%i] IP:[%s] Onlinetime:[%d dakika]", packetloss, GetPlayerPing(playerid), ReturnIP(playerid), minuteConnection);
        SendClientMessageEx(playerb, COLOR_GRAD1, "MISC: InsideBusiness:[%d] InsideProperty:[%d] InsideGarage:[%d] Player state:[%s] Alive state:[%s]", IsPlayerInBusiness(playerid), IsPlayerInProperty(playerid), PlayerData[playerid][pInsideGarage], ReturnPlayerState(playerid), ReturnAliveState(playerid));
        SendClientMessageEx(playerb, COLOR_GRAD2, "MISC: Radios:[%d][%d][%d][%d][%d] Inside vehicle:[%i]", PlayerData[playerid][pRadio][1], PlayerData[playerid][pRadio][2], PlayerData[playerid][pRadio][3], PlayerData[playerid][pRadio][4], PlayerData[playerid][pRadio][5], GetPlayerVehicleID(playerid));
    }

    SendClientMessageEx(playerb, COLOR_DARKGREEN, "|__________________%s [%s]__________________|", ReturnName(playerid), GetFullTime(Time()));
    return 1;
}

Player_ReturnLicenses(playerid, playerb, rmode = 0)
{
  if(!GetDistanceBetweenPlayers(playerid, playerb, 4.5))
      return SendClientMessage(playerb, COLOR_ADM, "HATA: {FFFFFF}Belirttiðiniz oyuncuya yakýn olmalýsýn.");

  if(rmode == 0)
  {
    SetPVarInt(playerb, "IdentityActive", 1);
    SetPVarInt(playerb, "LastIdentity", playerid);
    SetPVarInt(playerid, "LastIdentity", playerb);
    PlayerTextDrawSetString(playerb, IdentityCard[playerb][9], sprintf("%s_SANA_LISANSINI_GOSTERMEK_ISTIYOR.", ReturnName(playerid, 0)));
    PlayerTextDrawShow(playerb, IdentityCard[playerb][9]);
    PlayerTextDrawShow(playerb, IdentityCard[playerb][10]);
  }
  if(rmode == 1)
  {
    if(GetPVarInt(playerid, "LastIdentity") != playerb)
      return 1;

    if(GetPVarInt(playerb, "LastIdentity") != playerid)
      return 1;

    SetPVarInt(playerb, "IdentityActive", 0);
    SendClientMessage(playerb, COLOR_WHITE, "{5C92AD}|______SAN ANDREAS KÝMLÝK KARTI_______|");
    SendClientMessageEx(playerb, COLOR_WHITE, "{5C92AD}| {FFFFFF}Ýsim: %s", ReturnName(playerid, 0));

    new query_properties[128];
    mysql_format(m_Handle, query_properties, sizeof(query_properties), "SELECT * FROM properties WHERE OwnerSQL = %i", PlayerData[playerid][pSQLID]);
    new Cache:cache = mysql_query(m_Handle, query_properties);

    if(!cache_num_rows())
    {
      SendClientMessageEx(playerb, COLOR_WHITE, "{5C92AD}| {FFFFFF}Adres: KAYITLI ADRES YOK");
      cache_delete(cache);
    }
    else
    {
      new Float:houseX, Float:houseY, Float:houseZ;
      cache_get_value_name_float(0, "ExteriorX", houseX);
      cache_get_value_name_float(0, "ExteriorY", houseY);
      cache_get_value_name_float(0, "ExteriorZ", houseZ);

      SendClientMessageEx(playerb, COLOR_WHITE, "{5C92AD}| {FFFFFF}Adres: %s, %s, %s, %i", GetStreet(houseX, houseY, houseZ), GetZoneName(houseX, houseY, houseZ), GetCityName(houseX, houseY, houseZ), ReturnAreaCode(GetZoneID(houseX, houseY, houseZ)));
      cache_delete(cache);
    }

    SendClientMessageEx(playerb, COLOR_WHITE, "{5C92AD}| {FFFFFF}Ehliyet: %s         {5C92AD}Silah Lisansý: {FFFFFF}%s", !PlayerData[playerid][pDriversLicense] ? ("YOK") : ("VAR"), !PlayerData[playerid][pWeaponsLicense] ? ("YOK") : ("VAR"));
    SendClientMessageEx(playerb, COLOR_WHITE, "{5C92AD}| {FFFFFF}Uçuþ: %s          {5C92AD}Medikal Lisansý: {FFFFFF}%s", !PlayerData[playerid][pFlyLicense] ? ("YOK") : ("VAR"), !PlayerData[playerid][pMedicalLicense] ? ("YOK") : ("VAR"));
  }
  if(rmode == 2)
  {
    if(GetPVarInt(playerid, "LastIdentity") != playerb)
      return 1;

    if(GetPVarInt(playerb, "LastIdentity") != playerid)
      return 1;

    SetPVarInt(playerb, "IdentityActive", 2);
    PlayerTextDrawSetString(playerb, IdentityCard[playerb][3], sprintf("%s", ReturnName(playerid, 0)));
    PlayerTextDrawSetString(playerb, IdentityCard[playerb][5], sprintf("%s", !PlayerData[playerid][pDriversLicense] ? ("YOK") : ("VAR")));
    PlayerTextDrawSetString(playerb, IdentityCard[playerb][6], sprintf("%s", !PlayerData[playerid][pFlyLicense] ? ("YOK") : ("VAR")));
    PlayerTextDrawSetString(playerb, IdentityCard[playerb][7], sprintf("%s", !PlayerData[playerid][pWeaponsLicense] ? ("YOK") : ("VAR")));
    PlayerTextDrawSetString(playerb, IdentityCard[playerb][8], sprintf("%s", !PlayerData[playerid][pMedicalLicense] ? ("YOK") : ("VAR")));
    PlayerTextDrawSetPreviewModel(playerb, IdentityCard[playerb][1], GetPlayerSkin(playerid));

    new query_properties[128];
    mysql_format(m_Handle, query_properties, sizeof(query_properties), "SELECT * FROM properties WHERE OwnerSQL = %i", PlayerData[playerid][pSQLID]);
    new Cache:cache = mysql_query(m_Handle, query_properties);

    if(!cache_num_rows())
    {
      PlayerTextDrawSetString(playerb, IdentityCard[playerb][4], sprintf("KAYITLI_ADRES_YOK"));
      cache_delete(cache);
    }
    else
    {
      new Float:houseX, Float:houseY, Float:houseZ;
      cache_get_value_name_float(0, "ExteriorX", houseX);
      cache_get_value_name_float(0, "ExteriorY", houseY);
      cache_get_value_name_float(0, "ExteriorZ", houseZ);

      PlayerTextDrawSetString(playerb, IdentityCard[playerb][4], sprintf("%s, %s, %s, %i", GetStreet(houseX, houseY, houseZ), GetZoneName(houseX, houseY, houseZ), GetCityName(houseX, houseY, houseZ), ReturnAreaCode(GetZoneID(houseX, houseY, houseZ))));
      cache_delete(cache);
    }
    for(new m = 0; m < 9; m++)
    {
      PlayerTextDrawShow(playerb, IdentityCard[playerb][m]);
    }

    SendClientMessageEx(playerb, COLOR_WHITE, "{ADC3E7}[ ! ] Þu anda bir lisans görüntülüyorsunuz. Kapatmak için Y, sohbete yazdýrmak için N tuþuna basýn.");
  }
  return 1;
}

stock SendPlayer(playerid, Float: x, Float: y, Float: z, Float: a, interior, virtualworld)
{
    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    {
        new vehicleid = GetPlayerVehicleID(playerid);

        SetPlayerVirtualWorld(playerid, virtualworld);
        SetVehicleVirtualWorld(vehicleid, virtualworld);

        SetPlayerInterior(playerid, interior);
        LinkVehicleToInterior(vehicleid, interior);

        SetVehiclePos(vehicleid, x, y, z);
        SetVehicleZAngle(vehicleid, a);
    }
    else
    {
        SetTimerEx("unfreeze_player", 2500, false, "i", playerid);
        TogglePlayerControllable(playerid, false);

        SetPlayerVirtualWorld(playerid, virtualworld);
        SetPlayerInterior(playerid, interior);

        SetPlayerPos(playerid, x, y, z);
        SetPlayerFacingAngle(playerid, a);
        SetCameraBehindPlayer(playerid);
    }
    return 1;
}

ShowHackPanel(playerid)
{
	new list[1024], type[90];

	for(new i; i <= 52; i++) {
		format(type, sizeof(type), "%i.\t%s {AFAFAF}%s\n", i+1, AntiCheatName(i), !IsAntiCheatEnabled(i) ? "Pasif" : "Aktif");
		strcat(list, type);
	}
	ShowPlayerDialog(playerid, DIALOG_HACKSYS, DIALOG_STYLE_LIST, "Los Santos Stories: Hile Kontrol Sistemi", list, "Seç", "<<");
	return 1;
}

stock AntiCheatName(ac)
{
    new acname[35];
    switch(ac)
    {
        case 0: acname = "Airbreak (onfoot)";
        case 1: acname = "Airbreak (in vehicle)";
        case 2: acname = "Teleport (onfoot)";
        case 3: acname = "Teleport (in vehicle)";
        case 4: acname = "Teleport (into/between vehicles)";
        case 5: acname = "Teleport (vehicle to player)";
        case 6: acname = "Teleport (pickups)";
        case 7: acname = "Fly (onfoot)";
        case 8: acname = "Fly (in vehicle)";
        case 9: acname = "Speed (onfoot)";
        case 10: acname = "Speed (in vehicle)";
        case 11: acname = "Health (in vehicle)";
        case 12: acname = "Health (onfoot)";
        case 13: acname = "Zýrh Hilesi";
        case 14: acname = "Para Hilesi";
        case 15: acname = "Silah Hilesi";
        case 16: acname = "Ammo (add)";
        case 17: acname = "Ammo (infinite)";
        case 18: acname = "Anti-Special";
        case 19: acname = "God Mode (onfoot)";
        case 20: acname = "God Mode (in vehicle)";
        case 21: acname = "Görünmezlik Hilesi";
        case 22: acname = "Anti-lagcomp-spoof";
        case 23: acname = "Modifiye Hilesi";
        case 24: acname = "Parkour Mod";
        case 25: acname = "Quick Turn";
        case 26: acname = "Rapid Fire";
        case 27: acname = "Fake Spawn";
        case 28: acname = "Fake Kill";
        case 29: acname = "Pro Aim";
        case 30: acname = "CJ Run";
        case 31: acname = "Car Shot";
        case 32: acname = "Car Jack";
        case 33: acname = "Un Freeze";
        case 34: acname = "AFK Ghost";
        case 35: acname = "Full Aiming";
        case 36: acname = "Fake NPC";
        case 37: acname = "Reconnect";
        case 38: acname = "High Ping";
        case 39: acname = "Dialog hack";
        case 40: acname = "Sandbox Korumasý";
        case 41: acname = "Hatalý Sürüm";
        case 42: acname = "Rcon Hack";
        case 43: acname = "Tuning Crasher";
        case 44: acname = "Invalid Seat Crasher";
        case 45: acname = "Dialog Crasher";
        case 46: acname = "Attached Object Crasher";
        case 47: acname = "Anti-Weapon Crasher";
        case 48: acname = "Connection Flood";
        case 49: acname = "Flood Callbacks";
        case 50: acname = "Flood Change Seat";
        case 51: acname = "Anti-DDOS";
        case 52: acname = "Anti-NOP's";
    }
    return acname;
}

ShowSpectatorTextdraw(playerid, bool:toggle = false)
{
	if(toggle)
	{
		PlayerTextDrawShow(playerid, SpectatorTD[playerid]);
	}
	else
	{
		PlayerTextDrawHide(playerid, SpectatorTD[playerid]);
	}
	return 1;
}

Spectate_Update(playerid)
{
	new targetid = SpectateID[playerid];
	PlayerTextDrawSetString(playerid, SpectatorTD[playerid], sprintf("IZLENEN_KISI: ~w~%s (%i)~n~~r~PING: ~w~%i~n~~r~P/L: ~w~%.2f", ReturnName(targetid), targetid, GetPlayerPing(targetid), NetStats_PacketLossPercent(targetid)));
	return 1;
}

Car_Save(vehicleid)
{
	if(vehicleid == INVALID_VEHICLE_ID) return 0;

	new
		query[354];

	GetVehicleHealth(vehicleid, CarData[vehicleid][carLastHealth]);
	GetVehicleDamageStatus(vehicleid, CarData[vehicleid][carPanelStatus], CarData[vehicleid][carDoorsStatus], CarData[vehicleid][carLightsStatus], CarData[vehicleid][carTiresStatus]);
	GetVehicleParamsCarWindows(vehicleid, CarData[vehicleid][carWindows][0], CarData[vehicleid][carWindows][1], CarData[vehicleid][carWindows][2], CarData[vehicleid][carWindows][3]);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE vehicles SET ModelID = %i, OwnerID = %i, FactionID = %i, RentalID = %i, RentalPrice = %i, RentedBy = %i WHERE id = %i",
		CarData[vehicleid][carModel],
		CarData[vehicleid][carOwnerID],
		CarData[vehicleid][carFaction],
		CarData[vehicleid][carRental],
		CarData[vehicleid][carRentalPrice],
		CarData[vehicleid][carRentedBy],
		CarData[vehicleid][carID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE vehicles SET Plate = '%e', VehicleName = '%e', CarSign = '%e' WHERE id = %i",
		CarData[vehicleid][carPlates],
		CarData[vehicleid][carName],
		CarData[vehicleid][carSign],
		CarData[vehicleid][carID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE vehicles SET PosX = %f, PosY = %f, PosZ = %f, PosA = %f, Interior = %i, World = %i, Color1 = %i, Color2 = %i WHERE id = %i",
		CarData[vehicleid][carPos][0],
		CarData[vehicleid][carPos][1],
		CarData[vehicleid][carPos][2],
		CarData[vehicleid][carPos][3],
		CarData[vehicleid][carInterior],
		CarData[vehicleid][carWorld],
		CarData[vehicleid][carColor1],
		CarData[vehicleid][carColor2],
		CarData[vehicleid][carID]
	);
	mysql_tquery(m_Handle, query);

  mysql_format(m_Handle, query, sizeof(query), "UPDATE vehicles SET XMR = %i, Siren = %i, illegalPlate = %i, Locked = %i, Impounded = %i, ImpoundTime = %i, ImpoundReason = '%e', Fuel = %f, Mileage = %f, Armour = %f, EngineLife = %f, BatteryLife = %f WHERE id = %i",
		CarData[vehicleid][carXMR],
		CarData[vehicleid][carSiren],
    CarData[vehicleid][carIllegalPlate],
		CarData[vehicleid][carLocked],
		CarData[vehicleid][carImpounded],
		CarData[vehicleid][carImpoundTime],
		CarData[vehicleid][carImpoundReason],
		CarData[vehicleid][carFuel],
		CarData[vehicleid][carMileage],
		CarData[vehicleid][carArmour],
		CarData[vehicleid][carEngine],
		CarData[vehicleid][carBattery],
		CarData[vehicleid][carID]
	);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE vehicles SET LockLevel = %i, AlarmLevel = %i, ImmobLevel = %i, Insurance = %i, InsuranceTime = %i, InsurancePrice = %i, TimesDestroyed = %i, Paintjob = %i WHERE id = %i",
		CarData[vehicleid][carLock],
		CarData[vehicleid][carAlarm],
		CarData[vehicleid][carImmob],
		CarData[vehicleid][carInsurance],
		CarData[vehicleid][carInsuranceTime],
		CarData[vehicleid][carInsurancePrice],
		CarData[vehicleid][carTimeDestroyed],
		CarData[vehicleid][carPaintjob],
		CarData[vehicleid][carID]
	);
	mysql_tquery(m_Handle, query);

	for(new m; m < 14; m++)
	{
		mysql_format(m_Handle, query, sizeof(query), "UPDATE vehicles SET CarMods%i = %i WHERE id = %i",
			m+1,
			CarData[vehicleid][carMods][m],
			CarData[vehicleid][carID]
		);
		mysql_tquery(m_Handle, query);

		if(m < 4)
		{
			mysql_format(m_Handle, query, sizeof(query), "UPDATE vehicles SET CarDoors%i = %i, CarWindows%i = %i WHERE id = %i",
				m+1,
				CarData[vehicleid][carDoors][m],
				m+1,
				CarData[vehicleid][carWindows][m],
				CarData[vehicleid][carID]
			);
			mysql_tquery(m_Handle, query);
		}
	}

	mysql_format(m_Handle, query, sizeof(query), "UPDATE vehicles SET LastDriver = %i, LastPassenger = %i, LastHealth = %f, MaxHealth = %f, Panels = %i, Doors = %i, Lights = %i, Tires = %i WHERE id = %i",
		CarData[vehicleid][carlastDriver],
		CarData[vehicleid][carlastPassenger],
    CarData[vehicleid][carMaxHealth],
		CarData[vehicleid][carLastHealth],
		CarData[vehicleid][carPanelStatus],
		CarData[vehicleid][carDoorsStatus],
		CarData[vehicleid][carLightsStatus],
		CarData[vehicleid][carTiresStatus],
		CarData[vehicleid][carID]
	);
	mysql_tquery(m_Handle, query);

	for(new i = 1; i < MAX_PACK_SLOT; ++i)
	{
		if(!vehicle_drug_data[vehicleid][i][is_exist]) continue;

		mysql_format(m_Handle, query, sizeof(query), "UPDATE vehicle_drugs SET drug_name = '%e', drug_type = %i, drug_amount = %f, drug_quality = %i, drug_size = %i WHERE id = %i",
			vehicle_drug_data[vehicleid][i][veh_drug_name],
			vehicle_drug_data[vehicleid][i][veh_drug_id],
			vehicle_drug_data[vehicleid][i][veh_drug_amount],
			vehicle_drug_data[vehicleid][i][veh_drug_quality],
			vehicle_drug_data[vehicleid][i][veh_drug_size],
			vehicle_drug_data[vehicleid][i][data_id]
		);
		mysql_tquery(m_Handle, query);
	}
	return 1;
}

Furniture_AGetName(id)
{
	new query[129], objname[64];
	mysql_format(m_Handle, query, sizeof(query), "SELECT ObjName FROM furniture_lists WHERE id = %i", id);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name(0, "ObjName", objname, sizeof(objname));
	cache_delete(cache);
	return objname;
}

Furniture_AGetPrice(id)
{
	new query[129], price;
	mysql_format(m_Handle, query, sizeof(query), "SELECT ObjPrice FROM furniture_lists WHERE id = %i", id);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name_int(0, "ObjPrice", price);
	cache_delete(cache);
	return price;
}

Furniture_ShowDialog(playerid, id, error[] = "")
{
	new
		string[300];

	if(isnull(error)) format(string, sizeof(string), "[%i] {AFAFAF}%s - $%s\nMobilyasýnýn yeni fiyatýný giriniz.", id, Furniture_AGetName(id), MoneyFormat(Furniture_AGetPrice(id)));
	else format(string, sizeof(string), "[%i] {AFAFAF}%s - $%s\nAracýnýn yeni fiyatýný giriniz.\n\n%s", id, Furniture_AGetName(id), MoneyFormat(Furniture_AGetPrice(id)), error);
	Dialog_Show(playerid, FURNITURE_ALIST_PRICE, DIALOG_STYLE_INPUT, "LSS-RP: Mobilya Listesi", string, "Düzenle", "<< Kapat");
	return 1;
}

Vehicle_List(playerid, page = 0)
{
	SetPVarInt(playerid, "vehicle_idx", page);

    new query[82];
	mysql_format(m_Handle, query, sizeof(query), "SELECT id, VehicleName, VehiclePrice FROM dealerships LIMIT %d, 25", page*MAX_CLOTHING_SHOW);
	mysql_tquery(m_Handle, query, "SQL_DealershipList", "ii", playerid, page);
	return 1;
}

Vehicle_ShowDialog(playerid, id, error[] = "")
{
	new
		string[300];

	if(isnull(error)) format(string, sizeof(string), "[%i] {AFAFAF}%s - $%s\nAracýnýn yeni fiyatýný giriniz.", DealershipData[id-1][DealershipID], DealershipData[id-1][DealershipModelName], MoneyFormat(DealershipData[id-1][DealershipPrice]));
	else format(string, sizeof(string), "[%i] {AFAFAF}%s - $%s\nAracýnýn yeni fiyatýný giriniz.\n\n%s", DealershipData[id-1][DealershipID], DealershipData[id-1][DealershipModelName], MoneyFormat(DealershipData[id-1][DealershipPrice]), error);
	Dialog_Show(playerid, VEHICLE_LIST_PRICE, DIALOG_STYLE_INPUT, "LSS-RP: Araç Listesi", string, "Düzenle", "<< Kapat");
	return 1;
}

Furniture_AList(playerid, page = 0)
{
	SetPVarInt(playerid, "furniture_aidx", page);

    new query[82];
	mysql_format(m_Handle, query, sizeof(query), "SELECT id, ObjName, ObjPrice FROM furniture_lists LIMIT %d, 25", page*MAX_CLOTHING_SHOW);
	mysql_tquery(m_Handle, query, "SQL_FurnitureAList", "ii", playerid, page);
	return 1;
}

ShowAdminPanel(playerid)
{
	new list[350];
	strcat(list, "1.\tYasakla (OFFLINE)\n");
	strcat(list, "2.\tHapise At (OFFLINE)\n");
	strcat(list, "3.\tYasak Kaldýr\n");
	strcat(list, "4.\tHapis Kayýtlarý\n");
	strcat(list, "5.\tAtýlma Kayýtlarý\n");
	strcat(list, "6.\tYasaklanma Kayýtlarý\n");
	strcat(list, "7.\tMaskeli Bul\n");
	strcat(list, "8.\tMaskeli Listesi\n");
	strcat(list, "9.\tKýyafete göre oyuncu ara\n");
	strcat(list, "10.\tAdmin Notes Lookup\n");
	strcat(list, "11.\tAdmin Notes Edit\n");
	strcat(list, "12.\tAdmin Notes Add\n");
	strcat(list, "13.\tAdmin Notes Delete\n");
	Dialog_Show(playerid, ASYS, DIALOG_STYLE_LIST, "Yönetici Paneli", list, "Seç", "<<");
	return 1;
}

ShowAdminSys(playerid, panel, error[] = "")
{
	new
		string[330];

	switch(panel)
	{
		case 0: //offline ban
		{
			if(isnull(error)) string = "Yasaklamak istediðin oyuncunun adýný gir:";
			else format(string, sizeof(string), "%s\n\nYasaklamak istediðin oyuncunun adýný gir:", error);
			Dialog_Show(playerid, ASYS_OFFLINEBAN, DIALOG_STYLE_INPUT, "Yönetici Paneli: Yasakla (OFFLINE)", string, "Ýleri", "<<");
			return 1;
		}
		case 1: //offline ajail
		{
			if(isnull(error)) string = "Hapise atmak istediðin oyuncunun adýný gir:";
			else format(string, sizeof(string), "%s\n\nHapise atmak istediðin oyuncunun adýný gir:", error);
			Dialog_Show(playerid, ASYS_OFFLINEAJAIL, DIALOG_STYLE_INPUT, "Yönetici Paneli: Hapise At (OFFLINE)", string, "Ýleri", "<<");
			return 1;
		}
		case 2: //unban
		{
			if(isnull(error))string = "Yasaðýný kaldýrmak istediðin oyuncunun adýný gir:";
			else format(string, sizeof(string), "%s\n\nYasaðýný kaldýrmak istediðin oyuncunun adýný gir:", error);
			Dialog_Show(playerid, ASYS_UNBAN, DIALOG_STYLE_INPUT, "Yönetici Paneli: Yasak Kaldýr", string, "Ýleri", "<<");
			return 1;
		}
		case 3: //ajail lookup
		{
			if(isnull(error)) string = "Hapis kayýtlarýna bakmak istediðin oyuncunun adýný gir:";
			else format(string, sizeof(string), "%s\n\nHapis kayýtlarýna bakmak istediðin oyuncunun adýný gir:", error);
			Dialog_Show(playerid, ASYS_LOOKUP_JAILS, DIALOG_STYLE_INPUT, "Yönetici Paneli: Hapis Kayýtlarý", string, "Ýleri", "<<");
			return 1;
		}
		case 4: //kick lookup
		{
			if(isnull(error))string = "Atýlma kayýtlarýna bakmak istediðin oyuncunun adýný gir:";
			else format(string, sizeof(string), "%s\n\nAtýlma kayýtlarýna bakmak istediðin oyuncunun adýný gir:", error);
			Dialog_Show(playerid, ASYS_LOOKUP_KICKS, DIALOG_STYLE_INPUT, "Yönetici Paneli: Atýlma Kayýtlarý", string, "Ýleri", "<<");
			return 1;
		}
		case 5: //ban lookup
		{
			if(isnull(error)) string = "Yasaklanma kayýtlarýna bakmak istediðin oyuncunun adýný gir:";
			else format(string, sizeof(string), "%s\n\nYasaklanma kayýtlarýna bakmak istediðin oyuncunun adýný gir:", error);
			Dialog_Show(playerid, ASYS_LOOKUP_BANS, DIALOG_STYLE_INPUT, "Yönetici Paneli: Yasaklanma Kayýtlarý", string, "Ýleri", "<<");
			return 1;
		}
		case 6: //mask decrypt
		{
			if(isnull(error)) string = "Bilgilerine bakmak istediðiniz maskelinin numarasýný giriniz(bknz: 100000_00):";
			else format(string, sizeof(string), "%s\n\nBilgilerine bakmak istediðiniz maskelinin numarasýný giriniz(bknz: 100000_00):", error);
			Dialog_Show(playerid, ASYS_DECRYPTMASK, DIALOG_STYLE_INPUT, "Yönetici Paneli: Maskeli Bul", string, "Ýleri", "<<");
			return 1;
		}
		case 7: //find mask
		{
			new
				primary_str[800], sub_str[45],
				count;

			strcat(primary_str, "Aktif Maskeliler:\n\n");

			foreach(new i : Player) if(PlayerData[i][pMaskOn])
			{
				format(sub_str, sizeof(sub_str), "\t%s (ID: %i) - %s\n", ReturnName(i), i, ReturnPlayerMask(i));
				strcat(primary_str, sub_str);
				count++;
			}

			Dialog_Show(playerid, DIALOG_APANEL, DIALOG_STYLE_MSGBOX, "Yönetici Paneli: Maskeli Listesi", !count ? "Sunucuda maskeli kimse yok." : primary_str, "Tamamdýr!", "");
			return 1;
		}
		case 8: //skin search
		{
			if(isnull(error)) string = "Input the Skin ID you want to search for:";
			else format(string, sizeof(string), "%s\n\nInput the Skin ID you want to search for:", error);
			ShowPlayerDialog(playerid, DIALOG_SKINSEARCH, DIALOG_STYLE_INPUT, "Los Santos Stories: Yönetim Sistemi", string, "Ýleri", "<<");
			return 1;
		}
		case 9: // admin note lookup
		{
			if(isnull(error))
				string = "Input the players name to lookup their admin notes:";

			else format(string, sizeof(string), "%s\n\nInput the players name to lookup their admin notes:", error);

			ShowPlayerDialog(playerid, DIALOG_ANOTE_LOOKUP, DIALOG_STYLE_INPUT, "Los Santos Stories: Yönetim Sistemi", string, "Ýleri", "<<");
			return 1;
		}
		case 10: // admin note edit
		{
			if(isnull(error))
				string = "Input the players name to edit their admin notes:";

			else format(string, sizeof(string), "%s\n\nInput the players name to edit their admin notes:", error);

			ShowPlayerDialog(playerid, DIALOG_ANOTE_EDIT, DIALOG_STYLE_INPUT, "Los Santos Stories: Yönetim Sistemi", string, "Ýleri", "<<");
			return 1;
		}
		case 11: // admin note add
		{
			if(isnull(error))
				string = "Input the players name to add a new admin note:";

			else format(string, sizeof(string), "%s\n\nInput the players name to add a new admin note:", error);

			ShowPlayerDialog(playerid, DIALOG_ANOTE_ADD, DIALOG_STYLE_INPUT, "Los Santos Stories: Yönetim Sistemi", string, "Ýleri", "<<");
			return 1;
		}
		case 12: // admin note delete
		{
			if(isnull(error))
				string = "Input the players name to delete an admin note:";

			else format(string, sizeof(string), "%s\n\nInput the players name to delete an admin note:", error);

			ShowPlayerDialog(playerid, DIALOG_ANOTE_DELETE, DIALOG_STYLE_INPUT, "Los Santos Stories: Yönetim Sistemi", string, "Ýleri", "<<");
			return 1;
		}
	}
	return 1;
}

GetMoveDirectionFromKeys(ud, lr)
{
	new direction = 0;

    if(lr < 0)
	{
		if(ud < 0) 		direction = MOVE_FORWARD_LEFT; 	// Up & Left key pressed
		else if(ud > 0) direction = MOVE_BACK_LEFT; 	// Back & Left key pressed
		else            direction = MOVE_LEFT;          // Left key pressed
	}
	else if(lr > 0) 	// Right pressed
	{
		if(ud < 0)      direction = MOVE_FORWARD_RIGHT;  // Up & Right key pressed
		else if(ud > 0) direction = MOVE_BACK_RIGHT;     // Back & Right key pressed
		else			direction = MOVE_RIGHT;          // Right key pressed
	}
	else if(ud < 0) 	direction = MOVE_FORWARD; 	// Up key pressed
	else if(ud > 0) 	direction = MOVE_BACK;		// Down key pressed

	return direction;
}

MoveCamera(playerid)
{
	new Float:FV[3], Float:CP[3];
	//GetPlayerCameraPos(playerid, CP[0], CP[1], CP[2]);          // 	Cameras position in space
	GetPlayerObjectPos(playerid, noclipdata[playerid][flyobject], CP[0], CP[1], CP[2]);          // 	Cameras position in space
    GetPlayerCameraFrontVector(playerid, FV[0], FV[1], FV[2]);  //  Where the camera is looking at


	if(noclipdata[playerid][accelmul] <= 1.0) noclipdata[playerid][accelmul] += noclipdata[playerid][accelrate];

	new Float:speed = noclipdata[playerid][maxspeed] * (noclipdata[playerid][accel] ? noclipdata[playerid][accelmul] : 1.0);

	new Float:X, Float:Y, Float:Z;
	GetNextCameraPosition(noclipdata[playerid][mode], CP, FV, X, Y, Z);
	MovePlayerObject(playerid, noclipdata[playerid][flyobject], X, Y, Z, speed);
	noclipdata[playerid][lastmove] = GetTickCount();
	return 1;
}

GetNextCameraPosition(move_mode, Float:CP[3], Float:FV[3], &Float:X, &Float:Y, &Float:Z)
{
    // Calculate the cameras next position based on their current position and the direction their camera is facing
    #define OFFSET_X (FV[0]*6000.0)
	#define OFFSET_Y (FV[1]*6000.0)
	#define OFFSET_Z (FV[2]*6000.0)
	switch(move_mode)
	{
		case MOVE_FORWARD:
		{
			X = CP[0]+OFFSET_X;
			Y = CP[1]+OFFSET_Y;
			Z = CP[2]+OFFSET_Z;
		}
		case MOVE_BACK:
		{
			X = CP[0]-OFFSET_X;
			Y = CP[1]-OFFSET_Y;
			Z = CP[2]-OFFSET_Z;
		}
		case MOVE_LEFT:
		{
			X = CP[0]-OFFSET_Y;
			Y = CP[1]+OFFSET_X;
			Z = CP[2];
		}
		case MOVE_RIGHT:
		{
			X = CP[0]+OFFSET_Y;
			Y = CP[1]-OFFSET_X;
			Z = CP[2];
		}
		case MOVE_BACK_LEFT:
		{
			X = CP[0]+(-OFFSET_X - OFFSET_Y);
 			Y = CP[1]+(-OFFSET_Y + OFFSET_X);
		 	Z = CP[2]-OFFSET_Z;
		}
		case MOVE_BACK_RIGHT:
		{
			X = CP[0]+(-OFFSET_X + OFFSET_Y);
 			Y = CP[1]+(-OFFSET_Y - OFFSET_X);
		 	Z = CP[2]-OFFSET_Z;
		}
		case MOVE_FORWARD_LEFT:
		{
			X = CP[0]+(OFFSET_X  - OFFSET_Y);
			Y = CP[1]+(OFFSET_Y  + OFFSET_X);
			Z = CP[2]+OFFSET_Z;
		}
		case MOVE_FORWARD_RIGHT:
		{
			X = CP[0]+(OFFSET_X  + OFFSET_Y);
			Y = CP[1]+(OFFSET_Y  - OFFSET_X);
			Z = CP[2]+OFFSET_Z;
		}
	}
}

CancelFlyMode(playerid)
{
	new Float:x, Float:y, Float:z;
	GetPlayerCameraPos(playerid, x, y, z);

	SetTimerEx("DelaySetPos", 2000, false, "ifff", playerid, x, y, z);

	FlyMode[playerid] = false;
	CancelEdit(playerid);
	TogglePlayerSpectating(playerid, false);

	DestroyPlayerObject(playerid, noclipdata[playerid][flyobject]);
	noclipdata[playerid][cameramode] = CAMERA_MODE_NONE;
	return 1;
}

StartFlyMode(playerid)
{
	new Float:X, Float:Y, Float:Z;
	GetPlayerPos(playerid, X, Y, Z);
	noclipdata[playerid][flyobject] = CreatePlayerObject(playerid, 19300, X, Y, Z, 0.0, 0.0, 0.0);

	TogglePlayerSpectating(playerid, true);
	AttachCameraToPlayerObject(playerid, noclipdata[playerid][flyobject]);

	FlyMode[playerid] = true;
	noclipdata[playerid][cameramode] = CAMERA_MODE_FLY;
	return 1;
}

StartSpectate(playerid, targetid)
{
	TogglePlayerSpectating(playerid, 1);
    SetPlayerInterior(playerid, GetPlayerInterior(targetid));
	SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(targetid));

	new vehicleid = GetPlayerVehicleID(targetid);
	if (vehicleid != 0) {
		PlayerSpectateVehicle(playerid, vehicleid, SPECTATE_MODE_NORMAL);
	}
	else {
	    PlayerSpectatePlayer(playerid, targetid, SPECTATE_MODE_NORMAL);
	}

   	SpectateID[playerid] = targetid;
    SpectateType[playerid] = (vehicleid != 0) ? SPECTATE_TYPE_VEHICLE : SPECTATE_TYPE_PLAYER;
    ShowSpectatorTextdraw(playerid, true);
	return 1;
}

StopSpectate(playerid) {
	TogglePlayerSpectating(playerid, 0);
	ShowSpectatorTextdraw(playerid, false);
	//ReturnPlayerWeapons(playerid);
	return 1;
}

GetNextPlayer(current) {
	new next = -1;

	if (Iter_Count(SpectatePlayers) > 1)
	{
		if (Iter_Contains(SpectatePlayers, current))
		{
			next = Iter_Next(SpectatePlayers, current);

			if (next == Iter_End(SpectatePlayers)) {
			    next = Iter_First(SpectatePlayers);
			}
		}
	}

	return next;
}

Garage_Refresh(id)
{
	if (IsValidDynamicArea(GarageData[id][GarageAreaID][0])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, GarageData[id][GarageAreaID][0], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(GarageData[id][GarageAreaID][0]);
	}

	if (IsValidDynamicArea(GarageData[id][GarageAreaID][1])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, GarageData[id][GarageAreaID][1], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(GarageData[id][GarageAreaID][1]);
	}

	new array[2]; array[0] = 9; array[1] = id;
	GarageData[id][GarageAreaID][0] = CreateDynamicSphere(GarageData[id][GaragePos][0], GarageData[id][GaragePos][1], GarageData[id][GaragePos][2], 5.0, GarageData[id][EnterWorld], GarageData[id][EnterInteriorID]);
	Streamer_SetArrayData(STREAMER_TYPE_AREA, GarageData[id][GarageAreaID][0], E_STREAMER_EXTRA_ID, array, 2);

	array[0] = 10; array[1] = id;
	GarageData[id][GarageAreaID][1] = CreateDynamicSphere(GarageData[id][GarageInt][0], GarageData[id][GarageInt][1], GarageData[id][GarageInt][2], 5.0, GarageData[id][ExitWorld], GarageData[id][ExitInteriorID]);
	Streamer_SetArrayData(STREAMER_TYPE_AREA, GarageData[id][GarageAreaID][1], E_STREAMER_EXTRA_ID, array, 2);
	return 1;
}

Garage_Save(id)
{
	new
	    query[200];

	mysql_format(m_Handle, query, sizeof(query), "UPDATE garages SET GaragePropertyID = %i, EnterX = %f, EnterY = %f, EnterZ = %f, EnterA = %f, EnterInterior = %i, EnterWorld = %i WHERE id = %i",
        GarageData[id][GaragePropertyID],
		GarageData[id][GaragePos][0],
	    GarageData[id][GaragePos][1],
	    GarageData[id][GaragePos][2],
	    GarageData[id][GaragePos][3],
	    GarageData[id][EnterInteriorID],
	    GarageData[id][EnterWorld],
	    GarageData[id][GarageID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE garages SET ExitX = %f, ExitY = %f, ExitZ = %f, ExitA = %f, ExitInterior = %i, ExitWorld = %i WHERE id = %i",
		GarageData[id][GarageInt][0],
	    GarageData[id][GarageInt][1],
	    GarageData[id][GarageInt][2],
	    GarageData[id][GarageInt][3],
	    GarageData[id][ExitInteriorID],
	    GarageData[id][ExitWorld],
	    GarageData[id][GarageID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE garages SET GarageFaction = %i, GarageLocked = %i WHERE id = %i",
		GarageData[id][GarageFaction],
	    GarageData[id][GarageLocked],
	    GarageData[id][GarageID]
	);
	mysql_tquery(m_Handle, query);
	return 1;
}

Garage_Delete(id)
{
	foreach(new i : Player)
	{
		if(PlayerData[i][pInsideGarage] == id)
		{
		    PlayerData[i][pInsideGarage] = 0;
			SendPlayer(i, GarageData[id][GaragePos][0], GarageData[id][GaragePos][1], GarageData[id][GaragePos][2], GarageData[id][GaragePos][3], GarageData[id][EnterInteriorID], GarageData[id][EnterWorld]);
			SendClientMessage(i, COLOR_YELLOW, "SERVER: Bu garajýn silindiði için dýþarý çýkarýldýnýz.");
			SetCameraBehindPlayer(i);
		}
	}

	new
		query[64];

	mysql_format(m_Handle, query, sizeof(query), "DELETE FROM garages WHERE id = %i", GarageData[id][GarageID]);
	mysql_tquery(m_Handle, query);

	if (IsValidDynamicArea(GarageData[id][GarageAreaID][0])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, GarageData[id][GarageAreaID][0], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(GarageData[id][GarageAreaID][0]);
	}

	if (IsValidDynamicArea(GarageData[id][GarageAreaID][1])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, GarageData[id][GarageAreaID][1], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(GarageData[id][GarageAreaID][1]);
	}

	Iter_Remove(Garages, id);
	return 1;
}

Entrance_Save(id)
{
	new
	    query[200];

	mysql_format(m_Handle, query, sizeof(query), "UPDATE entrances SET EntranceName = '%e', EnterX = %f, EnterY = %f, EnterZ = %f, EnterA = %f, EnterInterior = %i, EnterWorld = %i WHERE id = %i",
        EntranceData[id][EntranceName],
		EntranceData[id][EntrancePos][0],
	    EntranceData[id][EntrancePos][1],
	    EntranceData[id][EntrancePos][2],
	    EntranceData[id][EntrancePos][3],
	    EntranceData[id][EntranceInteriorID],
	    EntranceData[id][EntranceWorld],
	    EntranceData[id][EntranceID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE entrances SET ExitX = %f, ExitY = %f, ExitZ = %f, ExitA = %f, ExitInterior = %i, ExitWorld = %i WHERE id = %i",
		EntranceData[id][EntranceInt][0],
	    EntranceData[id][EntranceInt][1],
	    EntranceData[id][EntranceInt][2],
	    EntranceData[id][EntranceInt][3],
	    EntranceData[id][ExitInteriorID],
	    EntranceData[id][ExitWorld],
	    EntranceData[id][EntranceID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE entrances SET EntranceIcon = %i, EntranceFaction = %i, EntranceLocked = %i WHERE id = %i",
        EntranceData[id][EntranceIcon],
		EntranceData[id][EntranceFaction],
	    EntranceData[id][EntranceLocked],
	    EntranceData[id][EntranceID]
	);
	mysql_tquery(m_Handle, query);
	return 1;
}

Entrance_Delete(id)
{
	foreach(new i : Player)
	{
		if(PlayerData[i][pInsideEntrance] == id)
		{
		    PlayerData[i][pInsideEntrance] = -1;
			SendPlayer(i, EntranceData[id][EntrancePos][0], EntranceData[id][EntrancePos][1], EntranceData[id][EntrancePos][2], EntranceData[id][EntrancePos][3], EntranceData[id][EntranceInteriorID], EntranceData[id][EntranceWorld]);
			SendClientMessage(i, COLOR_YELLOW, "SERVER: Bu bina silindiði için dýþarý çýkarýldýnýz.");
			SetCameraBehindPlayer(i);
		}
	}

	new
		query[64];

	mysql_format(m_Handle, query, sizeof(query), "DELETE FROM entrances WHERE id = %i", EntranceData[id][EntranceID]);
	mysql_tquery(m_Handle, query);

	if (IsValidDynamicPickup(EntranceData[id][EntrancePickup][0])) DestroyDynamicPickup(EntranceData[id][EntrancePickup][0]);
	if (IsValidDynamicPickup(EntranceData[id][EntrancePickup][1])) DestroyDynamicPickup(EntranceData[id][EntrancePickup][1]);

	if (IsValidDynamicArea(EntranceData[id][EntranceAreaID][0])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, EntranceData[id][EntranceAreaID][0], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(EntranceData[id][EntranceAreaID][0]);
	}

	if (IsValidDynamicArea(EntranceData[id][EntranceAreaID][1])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, EntranceData[id][EntranceAreaID][1], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(EntranceData[id][EntranceAreaID][1]);
	}

	Iter_Remove(Entrances, id);
	return 1;
}

Entrance_Refresh(id)
{
	if (IsValidDynamicPickup(EntranceData[id][EntrancePickup][0])) DestroyDynamicPickup(EntranceData[id][EntrancePickup][0]);
	if (IsValidDynamicPickup(EntranceData[id][EntrancePickup][1])) DestroyDynamicPickup(EntranceData[id][EntrancePickup][1]);

	if (IsValidDynamicArea(EntranceData[id][EntranceAreaID][0])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, EntranceData[id][EntranceAreaID][0], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(EntranceData[id][EntranceAreaID][0]);
	}

	if (IsValidDynamicArea(EntranceData[id][EntranceAreaID][1])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, EntranceData[id][EntranceAreaID][1], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(EntranceData[id][EntranceAreaID][1]);
	}

	new array[2]; array[0] = 2; array[1] = id;
	EntranceData[id][EntrancePickup][0] = CreateDynamicPickup(EntranceData[id][EntranceIcon], 23, EntranceData[id][EntrancePos][0], EntranceData[id][EntrancePos][1], EntranceData[id][EntrancePos][2], EntranceData[id][EntranceWorld], EntranceData[id][EntranceInteriorID]);
	EntranceData[id][EntranceAreaID][0] = CreateDynamicSphere(EntranceData[id][EntrancePos][0], EntranceData[id][EntrancePos][1], EntranceData[id][EntrancePos][2], 3.0, EntranceData[id][EntranceWorld], EntranceData[id][EntranceInteriorID]);
	Streamer_SetArrayData(STREAMER_TYPE_AREA, EntranceData[id][EntranceAreaID][0], E_STREAMER_EXTRA_ID, array, 2);

	array[0] = 3; array[1] = id;
	EntranceData[id][EntrancePickup][1] = CreateDynamicPickup(EntranceData[id][EntranceIcon], 23, EntranceData[id][EntranceInt][0], EntranceData[id][EntranceInt][1], EntranceData[id][EntranceInt][2], EntranceData[id][ExitWorld], EntranceData[id][ExitInteriorID]);
	EntranceData[id][EntranceAreaID][1] = CreateDynamicSphere(EntranceData[id][EntranceInt][0], EntranceData[id][EntranceInt][1], EntranceData[id][EntranceInt][2], 3.0, EntranceData[id][ExitWorld], EntranceData[id][ExitInteriorID]);
	Streamer_SetArrayData(STREAMER_TYPE_AREA, EntranceData[id][EntranceAreaID][1], E_STREAMER_EXTRA_ID, array, 2);
	return 1;
}

Entrance_Nearest(playerid)
{
	return GetPVarInt(playerid, "AtEntrance");
}

Garage_Create(playerid, linkid)
{
	new id = Iter_Free(Garages);
   	if (id == -1) return SendErrorMessage(playerid, "Maksimum eklenebilecek garaj sýnýrýna ulaþýlmýþ.");

	static
		Float: x,
		Float: y,
		Float: z,
		Float: angle;

    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, angle);

	GarageData[id][GarageFaction] = 0;
	GarageData[id][GaragePropertyID] = linkid;
	GarageData[id][GarageLocked] = true;

	GarageData[id][GaragePos][0] = x;
	GarageData[id][GaragePos][1] = y;
	GarageData[id][GaragePos][2] = z;
	GarageData[id][GaragePos][3] = angle;

	GarageData[id][EnterInteriorID] = GetPlayerInterior(playerid);
	GarageData[id][EnterWorld] = GetPlayerVirtualWorld(playerid);

	GarageData[id][GarageInt][0] = x;
	GarageData[id][GarageInt][1] = y;
	GarageData[id][GarageInt][2] = z + 10000;
	GarageData[id][GarageInt][3] = 0.0000;

	GarageData[id][ExitInteriorID] = 99;
	GarageData[id][ExitWorld] = 99;
	Iter_Add(Garages, id);

	SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý garajý (ev sahibi: %s) ekledin. (kilidi açýp, iç kýsmý ayarlamayý unutmayýn)", id, ReturnSQLName(PropertyData[linkid][PropertyOwnerID]));
	mysql_tquery(m_Handle, "INSERT INTO garages (GarageLocked) VALUES(1)", "OnGarageCreated", "d", id);
	Garage_Refresh(id);
	return 1;
}

PNS_Save(id)
{
	new
	    query[255];

	mysql_format(m_Handle, query, sizeof(query), "UPDATE paynsprays SET PnsName = '%e', EnterX = %f, EnterY = %f, EnterZ = %f, EnterA = %f, EnterInterior = %i, EnterWorld = %i WHERE id = %i",
        PNSData[id][PnsName],
		PNSData[id][PnsPos][0],
	    PNSData[id][PnsPos][1],
	    PNSData[id][PnsPos][2],
	    PNSData[id][PnsPos][3],
	    PNSData[id][EnterInteriorID],
	    PNSData[id][EnterWorld],
	    PNSData[id][PnsID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE paynsprays SET RepairX = %f, RepairY = %f, RepairZ = %f, RepairA = %f, RepairInterior = %i, RepairWorld = %i WHERE id = %i",
		PNSData[id][PnsInt][0],
	    PNSData[id][PnsInt][1],
	    PNSData[id][PnsInt][2],
	    PNSData[id][PnsInt][3],
	    PNSData[id][ExitInteriorID],
	    PNSData[id][ExitWorld],
	    PNSData[id][PnsID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE paynsprays SET PnsPrice = %i, PnsEarnings = %i WHERE id = %i",
		PNSData[id][PnsPrice],
	    PNSData[id][PnsEarnings],
	    PNSData[id][PnsID]
	);
	mysql_tquery(m_Handle, query);
	return 1;
}

PNS_Delete(id)
{
	new
		query[64];

	mysql_format(m_Handle, query, sizeof(query), "DELETE FROM paynsprays WHERE id = %i", PNSData[id][PnsID]);
	mysql_tquery(m_Handle, query);

	if (IsValidDynamicPickup(PNSData[id][PnsPickup])) DestroyDynamicPickup(PNSData[id][PnsPickup]);

	if (IsValidDynamicArea(PNSData[id][PnsAreaID])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, PNSData[id][PnsAreaID], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(PNSData[id][PnsAreaID]);
	}

	Iter_Remove(Sprays, id);
	return 1;
}

PNS_Refresh(id)
{
	if (IsValidDynamicPickup(PNSData[id][PnsPickup])) DestroyDynamicPickup(PNSData[id][PnsPickup]);
	if (IsValidDynamicArea(PNSData[id][PnsAreaID])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, PNSData[id][PnsAreaID], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(PNSData[id][PnsAreaID]);
	}

	PNSData[id][PnsPickup] = CreateDynamicPickup(1239, 1, PNSData[id][PnsPos][0], PNSData[id][PnsPos][1], PNSData[id][PnsPos][2], PNSData[id][EnterWorld], PNSData[id][EnterInteriorID]);

	new array[2]; array[0] = 8; array[1] = id;
	PNSData[id][PnsAreaID] = CreateDynamicSphere(PNSData[id][PnsPos][0], PNSData[id][PnsPos][1], PNSData[id][PnsPos][2], 5.0, PNSData[id][EnterWorld], PNSData[id][EnterInteriorID]);
	Streamer_SetArrayData(STREAMER_TYPE_AREA, PNSData[id][PnsAreaID], E_STREAMER_EXTRA_ID, array, 2);
	return 1;
}

PNS_Create(playerid, name[])
{
	new id = Iter_Free(Sprays);
   	if (id == -1) return SendErrorMessage(playerid, "Maksimum eklenebilecek PNS sýnýrýna ulaþýlmýþ.");

	static
		Float: x,
		Float: y,
		Float: z,
		Float: angle;

    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, angle);

	format(PNSData[id][PnsName], 45, name);
	PNSData[id][PnsPrice] = 20;
	PNSData[id][PnsEarnings] = 0;
	PNSData[id][PnsOccupied] = false;

	PNSData[id][PnsPos][0] = x;
	PNSData[id][PnsPos][1] = y;
	PNSData[id][PnsPos][2] = z;
	PNSData[id][PnsPos][3] = angle;

	PNSData[id][EnterInteriorID] = GetPlayerInterior(playerid);
	PNSData[id][EnterWorld] = GetPlayerVirtualWorld(playerid);

	PNSData[id][PnsInt][0] = x;
	PNSData[id][PnsInt][1] = y;
	PNSData[id][PnsInt][2] = z + 10000;
	PNSData[id][PnsInt][3] = 0.0000;

	PNSData[id][ExitInteriorID] = 99;
	PNSData[id][ExitWorld] = 99;
	Iter_Add(Sprays, id);

	SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý PNS'yi ekledin. (kilidi açýp, iç kýsmý ayarlamayý unutmayýn)", id);
	mysql_tquery(m_Handle, "INSERT INTO paynsprays (PnsEarnings) VALUES(20)", "OnPNSCreated", "d", id);
	PNS_Refresh(id);
	return 1;
}

Actor_Save(id)
{
	new
	    query[290];

	mysql_format(m_Handle, query, sizeof(query), "UPDATE actors SET ActorName = '%e', ActorSkin = %i, ActorX = %f, ActorY = %f, ActorZ = %f, ActorA = %f, ActorInterior = %i, ActorWorld = %i WHERE id = %i",
        ActorData[id][ActorName],
        ActorData[id][ActorModel],
		ActorData[id][ActorPos][0],
	    ActorData[id][ActorPos][1],
	    ActorData[id][ActorPos][2],
	    ActorData[id][ActorPos][3],
	    ActorData[id][ActorInterior],
	    ActorData[id][ActorWorld],
	    ActorData[id][ActorID]
	);
	mysql_tquery(m_Handle, query);
	return 1;
}

Actor_Delete(id)
{
	new
		query[64];

	mysql_format(m_Handle, query, sizeof(query), "DELETE FROM actors WHERE id = %i", ActorData[id][ActorID]);
	mysql_tquery(m_Handle, query);

    if(IsValidDynamic3DTextLabel(ActorData[id][ActorLabel])) DestroyDynamic3DTextLabel(ActorData[id][ActorLabel]);
	if(IsValidDynamicActor(ActorData[id][ActorObject])) DestroyDynamicActor(ActorData[id][ActorObject]);
	Iter_Remove(Actors, id);
	return 1;
}

Actor_Refresh(id)
{
    if(IsValidDynamic3DTextLabel(ActorData[id][ActorLabel])) DestroyDynamic3DTextLabel(ActorData[id][ActorLabel]);
	if(IsValidDynamicActor(ActorData[id][ActorObject])) DestroyDynamicActor(ActorData[id][ActorObject]);

	ActorData[id][ActorObject] = CreateDynamicActor(ActorData[id][ActorModel], ActorData[id][ActorPos][0], ActorData[id][ActorPos][1], ActorData[id][ActorPos][2], ActorData[id][ActorPos][3], 1, 100.0, ActorData[id][ActorWorld], ActorData[id][ActorInterior]);
    ActorData[id][ActorLabel] = CreateDynamic3DTextLabel(ActorData[id][ActorName], COLOR_WHITE, ActorData[id][ActorPos][0], ActorData[id][ActorPos][1], ActorData[id][ActorPos][2]+1.0, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, -1, ActorData[id][ActorWorld], ActorData[id][ActorInterior]);
	return 1;
}

Actor_Create(playerid, name[])
{
	new id = Iter_Free(Actors);
   	if (id == -1) return SendErrorMessage(playerid, "Maksimum eklenebilecek aktör sýnýrýna ulaþýlmýþ.");

	format(ActorData[id][ActorName], 45, name);
    GetPlayerPos(playerid, ActorData[id][ActorPos][0], ActorData[id][ActorPos][1], ActorData[id][ActorPos][2]);
    GetPlayerFacingAngle(playerid, ActorData[id][ActorPos][3]);
    ActorData[id][ActorInterior] = GetPlayerInterior(playerid);
	ActorData[id][ActorWorld] = GetPlayerVirtualWorld(playerid);
	Iter_Add(Actors, id);

	SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aktörü ekledin. (ayarlamayý unutmayýn)", id);
	mysql_tquery(m_Handle, "INSERT INTO actors (ActorWorld) VALUES(0)", "OnActorCreated", "d", id);
	Actor_Refresh(id);
	return 1;
}

Teleport_GetInt(id, where[])
{
	new query[75], int;
	mysql_format(m_Handle, query, sizeof(query), "SELECT %s FROM teleports WHERE id = %i LIMIT 1", where, id);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name_int(0, where, int);
	cache_delete(cache);
	return int;
}

Teleport_GetPosition(id, where[])
{
	new query[75], Float: pos;
	mysql_format(m_Handle, query, sizeof(query), "SELECT %s FROM teleports WHERE id = %i LIMIT 1", where, id);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name_float(0, where, pos);
	format(query, sizeof(query), "%f", pos);
	cache_delete(cache);
	return query;
}

Teleport_GetName(id)
{
	new query[75], teleport_name[30];
	mysql_format(m_Handle, query, sizeof(query), "SELECT TeleportName FROM teleports WHERE id = %i LIMIT 1", id);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name(0, "TeleportName", teleport_name);
	cache_delete(cache);
	return teleport_name;
}

Teleport_Exists(id)
{
	new query[50], sonuc = 0;
	mysql_format(m_Handle, query, sizeof(query), "SELECT id FROM teleports WHERE id = %i", id);
	new Cache:cache = mysql_query(m_Handle, query);
	if(cache_num_rows()) sonuc = 1;
	cache_delete(cache);
	return sonuc;
}

Teleport_List(playerid, page = 0)
{
	SetPVarInt(playerid, "teleport_idx", page);

    new query[82];
	mysql_format(m_Handle, query, sizeof(query), "SELECT id, TeleportName FROM teleports LIMIT %d, 25", page*MAX_CLOTHING_SHOW);
	mysql_tquery(m_Handle, query, "SQL_TeleportList", "ii", playerid, page);
	return 1;
}

ATM_Create(playerid)
{
	new id = Iter_Free(ATMs);
   	if (id == -1) return SendErrorMessage(playerid, "Maksimum eklenebilecek ATM sýnýrýna ulaþýlmýþ.");

    static
	    Float:x,
	    Float:y,
	    Float:z,
	    Float:angle;

	GetPlayerPos(playerid, x, y, z);
 	GetPlayerFacingAngle(playerid, angle);

    x += 1.0 * floatsin(-angle, degrees);
	y += 1.0 * floatcos(-angle, degrees);

    ATMData[id][AtmPos][0] = x;
    ATMData[id][AtmPos][1] = y;
    ATMData[id][AtmPos][2] = z;

    ATMData[id][AtmPos][3] = 0.0;
    ATMData[id][AtmPos][4] = 0.0;
    ATMData[id][AtmPos][5] = angle;

    ATMData[id][AtmInterior] = GetPlayerInterior(playerid);
    ATMData[id][AtmWorld] = GetPlayerVirtualWorld(playerid);
    Iter_Add(ATMs, id);

	SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý ATM noktasýný ekledin.", id);
	mysql_tquery(m_Handle, "INSERT INTO atms (AtmInterior) VALUES(0)", "OnATMCreated", "d", id);
	ATM_Refresh(id);
	return 1;
}

ATM_Refresh(id)
{
    if (IsValidDynamicObject(ATMData[id][AtmObject])) DestroyDynamicObject(ATMData[id][AtmObject]);
	if (IsValidDynamicArea(ATMData[id][AtmAreaID])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, ATMData[id][AtmAreaID], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(ATMData[id][AtmAreaID]);
	}

	ATMData[id][AtmObject] = CreateDynamicObject(-21027, ATMData[id][AtmPos][0], ATMData[id][AtmPos][1], ATMData[id][AtmPos][2], ATMData[id][AtmPos][3], ATMData[id][AtmPos][4], ATMData[id][AtmPos][5], ATMData[id][AtmWorld], ATMData[id][AtmInterior]);

	new array[2]; array[0] = 18; array[1] = id;
	ATMData[id][AtmAreaID] = CreateDynamicSphere(ATMData[id][AtmPos][0], ATMData[id][AtmPos][1], ATMData[id][AtmPos][2], 2.0, ATMData[id][AtmWorld], ATMData[id][AtmInterior]);
	Streamer_SetArrayData(STREAMER_TYPE_AREA, ATMData[id][AtmAreaID], E_STREAMER_EXTRA_ID, array, 2);
	return 1;
}

ATM_Save(id)
{
	new
	    query[355];

	mysql_format(m_Handle, query, sizeof(query), "UPDATE atms SET AtmX = %f, AtmY = %f, AtmZ = %f, AtmRX = %f, AtmRY = %f, AtmRZ = %f, AtmInterior = %i, AtmWorld = %i WHERE id = %i",
		ATMData[id][AtmPos][0],
	    ATMData[id][AtmPos][1],
	    ATMData[id][AtmPos][2],
	    ATMData[id][AtmPos][3],
	    ATMData[id][AtmPos][4],
	    ATMData[id][AtmPos][5],
	    ATMData[id][AtmInterior],
	    ATMData[id][AtmWorld],
	    ATMData[id][AtmID]
	);
	mysql_tquery(m_Handle, query);
	return 1;
}

ATM_Delete(id)
{
    new
        query[64];

	mysql_format(m_Handle, query, sizeof(query), "DELETE FROM atms WHERE id = %i", ATMData[id][AtmID]);
	mysql_tquery(m_Handle, query);

    if (IsValidDynamicObject(ATMData[id][AtmObject])) DestroyDynamicObject(ATMData[id][AtmObject]);
    if (IsValidDynamicArea(ATMData[id][AtmAreaID])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, ATMData[id][AtmAreaID], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(ATMData[id][AtmAreaID]);
	}

    Iter_Remove(ATMs, id);
	return 1;
}

ATM_Nearest(playerid)
{
	return GetPVarInt(playerid, "AtATM");
}

Door_Save(id)
{
	new
		query[355];

	mysql_format(m_Handle, query, sizeof(query), "UPDATE doors SET DoorName = '%e', PosX = %f, PosY = %f, PosZ = %f, PosA = %f, PosInterior = %i, PosWorld = %i WHERE id = %i",
        DoorData[id][DoorName],
		DoorData[id][EnterPos][0],
        DoorData[id][EnterPos][1],
        DoorData[id][EnterPos][2],
     	DoorData[id][EnterPos][3],
        DoorData[id][EnterInterior],
        DoorData[id][EnterWorld],
        DoorData[id][DoorID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE doors SET IntX = %f, IntY = %f, IntZ = %f, IntA = %f, IntInterior = %i, IntWorld = %i, DoorFaction = %i, DoorLocked = %i WHERE id = %i",
		DoorData[id][ExitPos][0],
        DoorData[id][ExitPos][1],
        DoorData[id][ExitPos][2],
     	DoorData[id][ExitPos][3],
        DoorData[id][ExitInterior],
        DoorData[id][ExitWorld],
		DoorData[id][DoorFaction],
		DoorData[id][DoorLocked],
        DoorData[id][DoorID]
	);
	mysql_tquery(m_Handle, query);
	return 1;
}

Door_Delete(id)
{
    new
        query[64];

	mysql_format(m_Handle, query, sizeof(query), "DELETE FROM doors WHERE id = %i", DoorData[id][DoorID]);
	mysql_tquery(m_Handle, query);

	if (IsValidDynamicArea(DoorData[id][DoorAreaID][0])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, DoorData[id][DoorAreaID][0], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(DoorData[id][DoorAreaID][0]);
	}

	if (IsValidDynamicArea(DoorData[id][DoorAreaID][1])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, DoorData[id][DoorAreaID][1], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(DoorData[id][DoorAreaID][1]);
	}

    Iter_Remove(Doors, id);
	return 1;
}

Door_Refresh(id)
{
	if (IsValidDynamicArea(DoorData[id][DoorAreaID][0])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, DoorData[id][DoorAreaID][0], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(DoorData[id][DoorAreaID][0]);
	}

	if (IsValidDynamicArea(DoorData[id][DoorAreaID][1])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, DoorData[id][DoorAreaID][1], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(DoorData[id][DoorAreaID][1]);
	}

	new array[2]; array[0] = 5; array[1] = id;
	DoorData[id][DoorAreaID][0] = CreateDynamicSphere(DoorData[id][EnterPos][0], DoorData[id][EnterPos][1], DoorData[id][EnterPos][2], 3.0, DoorData[id][EnterWorld], DoorData[id][EnterInterior]);
	Streamer_SetArrayData(STREAMER_TYPE_AREA, DoorData[id][DoorAreaID][0], E_STREAMER_EXTRA_ID, array, 2);

	array[0] = 6; array[1] = id;
	DoorData[id][DoorAreaID][1] = CreateDynamicSphere(DoorData[id][ExitPos][0], DoorData[id][ExitPos][1], DoorData[id][ExitPos][2], 3.0, DoorData[id][ExitWorld], DoorData[id][ExitInterior]);
	Streamer_SetArrayData(STREAMER_TYPE_AREA, DoorData[id][DoorAreaID][1], E_STREAMER_EXTRA_ID, array, 2);
	return 1;
}

Door_Create(playerid, doorname[])
{
	new id = Iter_Free(Doors);
   	if (id == -1) return SendErrorMessage(playerid, "Maksimum eklenebilecek kapý sýnýrýna ulaþýlmýþ.");

    static
	    Float: x,
	    Float: y,
	    Float: z,
	    Float: angle;

	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, angle);

    DoorData[id][DoorFaction] = 0;
    DoorData[id][DoorLocked] = true;
    format(DoorData[id][DoorName], 35, "%s", doorname);

	DoorData[id][EnterPos][0] = x;
	DoorData[id][EnterPos][1] = y;
	DoorData[id][EnterPos][2] = z;
	DoorData[id][EnterPos][3] = angle;

	DoorData[id][EnterInterior] = GetPlayerInterior(playerid);
	DoorData[id][EnterWorld] = GetPlayerVirtualWorld(playerid);

	DoorData[id][ExitPos][0] = x;
	DoorData[id][ExitPos][1] = y;
	DoorData[id][ExitPos][2] = z + 10000;
	DoorData[id][ExitPos][3] = 0.0000;

	DoorData[id][ExitInterior] = 99;
	DoorData[id][ExitWorld] = 99;
	Iter_Add(Doors, id);

	SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý kapýyý noktasýný ekledin. (kilidi açýp, düzenlemeyi unutma)", id);
	mysql_tquery(m_Handle, "INSERT INTO doors (DoorLocked) VALUES(1)", "OnDoorCreated", "d", id);
	Door_Refresh(id);
	return 1;
}

Gate_Refresh(id)
{
    if (IsValidDynamicObject(GateData[id][GateObject])) DestroyDynamicObject(GateData[id][GateObject]);

	if (IsValidDynamicArea(GateData[id][GateAreaID])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, GateData[id][GateAreaID], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(GateData[id][GateAreaID]);
	}

	GateData[id][GateObject] = CreateDynamicObject(GateData[id][GateModel], GateData[id][GatePos][0], GateData[id][GatePos][1], GateData[id][GatePos][2], GateData[id][GatePos][3], GateData[id][GatePos][4], GateData[id][GatePos][5], GateData[id][GateWorld], GateData[id][GateInterior]);
	if (GateData[id][GateTModel] != 0) SetDynamicObjectMaterial(GateData[id][GateObject], GateData[id][GateTIndex], GateData[id][GateTModel], GateData[id][GateTXDName], GateData[id][GateTextureName], 0);

	new array[2]; array[0] = 11; array[1] = id;
	GateData[id][GateAreaID] = CreateDynamicSphere(GateData[id][GatePos][0], GateData[id][GatePos][1], GateData[id][GatePos][2], GateData[id][GateRadius], GateData[id][GateWorld], GateData[id][GateInterior]);
	Streamer_SetArrayData(STREAMER_TYPE_AREA, GateData[id][GateAreaID], E_STREAMER_EXTRA_ID, array, 2);
	return 1;
}

Gate_Delete(id)
{
    new
        query[64];

	mysql_format(m_Handle, query, sizeof(query), "DELETE FROM gates WHERE id = %i", GateData[id][GateID]);
	mysql_tquery(m_Handle, query);

    if (IsValidDynamicObject(GateData[id][GateObject])) DestroyDynamicObject(GateData[id][GateObject]);

	if (IsValidDynamicArea(GateData[id][GateAreaID])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, GateData[id][GateAreaID], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(GateData[id][GateAreaID]);
	}

    Iter_Remove(Gates, id);
	return 1;
}

Gate_Save(id)
{
	new
		query[355];

	mysql_format(m_Handle, query, sizeof(query), "UPDATE gates SET GateModel = %i, GateSpeed = %f, GateRadius = %f, GateTime = %i, GateInterior = %i, GateWorld = %i WHERE id = %i",
		GateData[id][GateModel],
        GateData[id][GateSpeed],
        GateData[id][GateRadius],
     	GateData[id][GateTime],
     	GateData[id][GateInterior],
	 	GateData[id][GateWorld],
        GateData[id][GateID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE gates SET PosX = %f, PosY = %f, PosZ = %f, RotX = %f, RotY = %f, RotZ = %f, GateFaction = %i, GateLinkID = %i WHERE id = %i",
		GateData[id][GatePos][0],
		GateData[id][GatePos][1],
		GateData[id][GatePos][2],
		GateData[id][GatePos][3],
		GateData[id][GatePos][4],
		GateData[id][GatePos][5],
		GateData[id][GateFaction],
		GateData[id][GateLinkID],
        GateData[id][GateID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE gates SET OpenX = %f, OpenY = %f, OpenZ = %f, OpenRotX = %f, OpenRotY = %f, OpenRotZ = %f, TIndex = %i, TModel = %i WHERE id = %i",
		GateData[id][GateMovePos][0],
		GateData[id][GateMovePos][1],
		GateData[id][GateMovePos][2],
		GateData[id][GateMovePos][3],
		GateData[id][GateMovePos][4],
		GateData[id][GateMovePos][5],
		GateData[id][GateTIndex],
		GateData[id][GateTModel],
        GateData[id][GateID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE gates SET TXDName = '%e', TextureName = '%e' WHERE id = %i",
		GateData[id][GateTXDName],
		GateData[id][GateTextureName],
        GateData[id][GateID]
	);
	mysql_tquery(m_Handle, query);
	return 1;
}

GetGateByID(sqlid)
{
	foreach(new i : Gates) if (GateData[i][GateID] == sqlid)
		return i;

	return -1;
}

Gate_Create(playerid, model)
{
	new id = Iter_Free(Gates);
   	if (id == -1) return SendErrorMessage(playerid, "Maksimum eklenebilecek hareketli kapý sýnýrýna ulaþýlmýþ.");

	static
		Float:x,
		Float:y,
		Float:z,
		Float:angle;

	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, angle);

	GateData[id][GateModel] = model;
	GateData[id][GateSpeed] = 3.0;
	GateData[id][GateRadius] = 5.0;
	GateData[id][GateStatus] = false;
	GateData[id][GateTime] = 0;

	GateData[id][GatePos][0] = x + (3.0 * floatsin(-angle, degrees));
	GateData[id][GatePos][1] = y + (3.0 * floatcos(-angle, degrees));
	GateData[id][GatePos][2] = z;
	GateData[id][GatePos][3] = 0.0;
	GateData[id][GatePos][4] = 0.0;
	GateData[id][GatePos][5] = angle;

	GateData[id][GateMovePos][0] = x + (3.0 * floatsin(-angle, degrees));
	GateData[id][GateMovePos][1] = y + (3.0 * floatcos(-angle, degrees));
	GateData[id][GateMovePos][2] = z - 10.0;
	GateData[id][GateMovePos][3] = -1000.0;
	GateData[id][GateMovePos][4] = -1000.0;
	GateData[id][GateMovePos][5] = -1000.0;

	GateData[id][GateInterior] = GetPlayerInterior(playerid);
	GateData[id][GateWorld] = GetPlayerVirtualWorld(playerid);

	GateData[id][GateTIndex] = 0;
	GateData[id][GateTModel] = 0;

	GateData[id][GateLinkID] = -1;
	GateData[id][GateFaction] = -1;
	Iter_Add(Gates, id);

	SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý hareketli kapýyý ekledin. (düzenlemeyi unutma)", id);
	mysql_tquery(m_Handle, "INSERT INTO gates (GateSpeed) VALUES(3.0)", "OnGateCreated", "d", id);
	Gate_Refresh(id);
	return 1;
}

Gate_Operate(id)
{
	if (Iter_Contains(Gates, id))
	{
		new tmp_id = -1;

		if (!GateData[id][GateStatus])
		{
			GateData[id][GateStatus] = true;
			MoveDynamicObject(GateData[id][GateObject], GateData[id][GateMovePos][0], GateData[id][GateMovePos][1], GateData[id][GateMovePos][2], GateData[id][GateSpeed], GateData[id][GateMovePos][3], GateData[id][GateMovePos][4], GateData[id][GateMovePos][5]);

			if (GateData[id][GateTime] > 0) {
				GateData[id][GateTimer] = SetTimerEx("CloseGate", GateData[id][GateTime], false, "ddfffffff", id, GateData[id][GateLinkID], GateData[id][GatePos][0], GateData[id][GatePos][1], GateData[id][GatePos][2], GateData[id][GateSpeed], GateData[id][GatePos][3], GateData[id][GatePos][4], GateData[id][GatePos][5]);
			}

			if (GateData[id][GateLinkID] != -1 && (tmp_id = GetGateByID(GateData[id][GateLinkID])) != -1)
			{
				GateData[tmp_id][GateStatus] = true;
				MoveDynamicObject(GateData[tmp_id][GateObject], GateData[tmp_id][GateMovePos][0], GateData[tmp_id][GateMovePos][1], GateData[tmp_id][GateMovePos][2], GateData[tmp_id][GateSpeed], GateData[tmp_id][GateMovePos][3], GateData[tmp_id][GateMovePos][4], GateData[tmp_id][GateMovePos][5]);
			}
		}
		else if (GateData[id][GateStatus])
		{
			GateData[id][GateStatus] = false;
			MoveDynamicObject(GateData[id][GateObject], GateData[id][GatePos][0], GateData[id][GatePos][1], GateData[id][GatePos][2], GateData[id][GateSpeed], GateData[id][GatePos][3], GateData[id][GatePos][4], GateData[id][GatePos][5]);

			if (GateData[id][GateTime] > 0) {
				KillTimer(GateData[id][GateTimer]);
			}
			if (GateData[id][GateLinkID] != -1 && (tmp_id = GetGateByID(GateData[id][GateLinkID])) != -1)
			{
				GateData[tmp_id][GateStatus] = false;
				MoveDynamicObject(GateData[tmp_id][GateObject], GateData[tmp_id][GatePos][0], GateData[tmp_id][GatePos][1], GateData[tmp_id][GatePos][2], GateData[tmp_id][GateSpeed], GateData[tmp_id][GatePos][3], GateData[tmp_id][GatePos][4], GateData[tmp_id][GatePos][5]);
			}
		}
	}
	return 1;
}

Object_Create(playerid, objectid)
{
	new id = Iter_Free(Objects);
   	if (id == -1) return SendErrorMessage(playerid, "Maksimum eklenebilecek obje sýnýrýna ulaþýlmýþ.");

    static
	    Float:x,
	    Float:y,
	    Float:z,
	    Float:angle;

	GetPlayerPos(playerid, x, y, z);
 	GetPlayerFacingAngle(playerid, angle);

    x += 1.0 * floatsin(-angle, degrees);
	y += 1.0 * floatcos(-angle, degrees);

    ObjectData[id][ObjectPos][0] = x;
    ObjectData[id][ObjectPos][1] = y;
    ObjectData[id][ObjectPos][2] = z;

    ObjectData[id][ObjectPos][3] = 0.0;
    ObjectData[id][ObjectPos][4] = 0.0;
    ObjectData[id][ObjectPos][5] = angle;

	ObjectData[id][ObjectModel] = objectid;
    ObjectData[id][ObjectInterior] = GetPlayerInterior(playerid);
    ObjectData[id][ObjectWorld] = GetPlayerVirtualWorld(playerid);
    Iter_Add(Objects, id);

	SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý objeyi ekledin.", id);
	mysql_tquery(m_Handle, "INSERT INTO objects (ObjectInterior) VALUES(0)", "OnObjectCreated", "d", id);
	Object_Refresh(id);
	return 1;
}

Object_Nearest(playerid)
{
	return GetPVarInt(playerid, "AtObject");
}

Object_Refresh(id)
{
    if (IsValidDynamicObject(ObjectData[id][ObjectHolder])) DestroyDynamicObject(ObjectData[id][ObjectHolder]);
	if (IsValidDynamicArea(ObjectData[id][ObjectAreaID])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, ObjectData[id][ObjectAreaID], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(ObjectData[id][ObjectAreaID]);
	}

	ObjectData[id][ObjectHolder] = CreateDynamicObject(ObjectData[id][ObjectModel], ObjectData[id][ObjectPos][0], ObjectData[id][ObjectPos][1], ObjectData[id][ObjectPos][2], ObjectData[id][ObjectPos][3], ObjectData[id][ObjectPos][4], ObjectData[id][ObjectPos][5], ObjectData[id][ObjectWorld], ObjectData[id][ObjectInterior]);

	new array[2]; array[0] = 20; array[1] = id;
	ObjectData[id][ObjectAreaID] = CreateDynamicSphere(ObjectData[id][ObjectPos][0], ObjectData[id][ObjectPos][1], ObjectData[id][ObjectPos][2], 2.0, ObjectData[id][ObjectWorld], ObjectData[id][ObjectInterior]);
	Streamer_SetArrayData(STREAMER_TYPE_AREA, ObjectData[id][ObjectAreaID], E_STREAMER_EXTRA_ID, array, 2);
	return 1;
}

Object_Save(id)
{
	new
	    query[355];

	mysql_format(m_Handle, query, sizeof(query), "UPDATE objects SET ObjectModel = %i, ObjectX = %f, ObjectY = %f, ObjectZ = %f, ObjectRX = %f, ObjectRY = %f, ObjectRZ = %f, ObjectInterior = %i, ObjectWorld = %i WHERE id = %i",
        ObjectData[id][ObjectModel],
		ObjectData[id][ObjectPos][0],
	    ObjectData[id][ObjectPos][1],
	    ObjectData[id][ObjectPos][2],
	    ObjectData[id][ObjectPos][3],
	    ObjectData[id][ObjectPos][4],
	    ObjectData[id][ObjectPos][5],
	    ObjectData[id][ObjectInterior],
	    ObjectData[id][ObjectWorld],
	    ObjectData[id][ObjectID]
	);
	mysql_tquery(m_Handle, query);
	return 1;
}

Object_Delete(id)
{
    new
        query[64];

	mysql_format(m_Handle, query, sizeof(query), "DELETE FROM objects WHERE id = %i", ObjectData[id][ObjectID]);
	mysql_tquery(m_Handle, query);

    if (IsValidDynamicObject(ObjectData[id][ObjectHolder])) DestroyDynamicObject(ObjectData[id][ObjectHolder]);
	if (IsValidDynamicArea(ObjectData[id][ObjectAreaID])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, ObjectData[id][ObjectAreaID], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(ObjectData[id][ObjectAreaID]);
	}

    Iter_Remove(Objects, id);
	return 1;
}

Spray_Refresh(id)
{
	if (IsValidDynamicObject(SprayData[id][SprayObject])) DestroyDynamicObject(SprayData[id][SprayObject]);

	if (IsValidDynamicArea(SprayData[id][SprayAreaID])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, SprayData[id][SprayAreaID], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(SprayData[id][SprayAreaID]);
	}

	SprayData[id][SprayObject] = CreateDynamicObject(SprayData[id][SprayModel], SprayData[id][SprayLocation][0], SprayData[id][SprayLocation][1], SprayData[id][SprayLocation][2], SprayData[id][SprayLocation][3], SprayData[id][SprayLocation][4], SprayData[id][SprayLocation][5], SprayData[id][SprayWorld], SprayData[id][SprayInterior]);

	new array[2]; array[0] = 12; array[1] = id;
	SprayData[id][SprayAreaID] = CreateDynamicSphere(SprayData[id][SprayLocation][0], SprayData[id][SprayLocation][1], SprayData[id][SprayLocation][2], 2.0, SprayData[id][SprayWorld], SprayData[id][SprayInterior]);
	Streamer_SetArrayData(STREAMER_TYPE_AREA, SprayData[id][SprayAreaID], E_STREAMER_EXTRA_ID, array, 2);
	return 1;
}

Spray_Save(id)
{
	new
	    query[355];

	mysql_format(m_Handle, query, sizeof(query), "UPDATE sprays SET SprayModel = %i, SprayX = %f, SprayY = %f, SprayZ = %f, SprayRX = %f, SprayRY = %f, SprayRZ = %f, SprayInterior = %i, SprayWorld = %i WHERE id = %i",
        SprayData[id][SprayModel],
		SprayData[id][SprayLocation][0],
	    SprayData[id][SprayLocation][1],
	    SprayData[id][SprayLocation][2],
	    SprayData[id][SprayLocation][3],
	    SprayData[id][SprayLocation][4],
	    SprayData[id][SprayLocation][5],
	    SprayData[id][SprayInterior],
	    SprayData[id][SprayWorld],
	    SprayData[id][SprayID]
	);
	mysql_tquery(m_Handle, query);
	return 1;
}

Spray_Delete(id)
{
    new
        query[64];

	mysql_format(m_Handle, query, sizeof(query), "DELETE FROM sprays WHERE id = %i", SprayData[id][SprayID]);
	mysql_tquery(m_Handle, query);

    if (IsValidDynamicObject(SprayData[id][SprayObject])) DestroyDynamicObject(SprayData[id][SprayObject]);
	if (IsValidDynamicArea(SprayData[id][SprayAreaID])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, SprayData[id][SprayAreaID], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(SprayData[id][SprayAreaID]);
	}

    Iter_Remove(Tags, id);
	return 1;
}

Spray_Nearest(playerid)
{
	return GetPVarInt(playerid, "AtSpray");
}

Spray_Create(playerid, listitem)
{
	new id = Iter_Free(Tags);
   	if (id == -1) return SendErrorMessage(playerid, "Maksimum eklenebilecek graffiti noktasý sýnýrýna ulaþýlmýþ.");

    static
	    Float:x,
	    Float:y,
	    Float:z,
	    Float:angle;

	GetPlayerPos(playerid, x, y, z);
 	GetPlayerFacingAngle(playerid, angle);

    x += 1.0 * floatsin(-angle, degrees);
	y += 1.0 * floatcos(-angle, degrees);

    SprayData[id][SprayLocation][0] = x;
    SprayData[id][SprayLocation][1] = y;
    SprayData[id][SprayLocation][2] = z;

    SprayData[id][SprayLocation][3] = 0.0;
    SprayData[id][SprayLocation][4] = 0.0;
    SprayData[id][SprayLocation][5] = angle;

	SprayData[id][SprayModel] = listitem;
    SprayData[id][SprayInterior] = GetPlayerInterior(playerid);
    SprayData[id][SprayWorld] = GetPlayerVirtualWorld(playerid);
    Iter_Add(Tags, id);

	SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý graffiti noktasýný ekledin.", id);
	mysql_tquery(m_Handle, "INSERT INTO sprays (SprayInterior) VALUES(0)", "OnSprayCreated", "d", id);
	Spray_Refresh(id);
	return 1;
}

Billboard_Create(playerid)
{
	new id = Iter_Free(Billboards);
   	if (id == -1) return SendErrorMessage(playerid, "Maksimum eklenebilecek billboard noktasý sýnýrýna ulaþýlmýþ.");

    static
	    Float:x,
	    Float:y,
	    Float:z,
	    Float:angle;

	GetPlayerPos(playerid, x, y, z);
 	GetPlayerFacingAngle(playerid, angle);

    x += 1.0 * floatsin(-angle, degrees);
	y += 1.0 * floatcos(-angle, degrees);

    BillboardData[id][BillboardLocation][0] = x;
    BillboardData[id][BillboardLocation][1] = y;
    BillboardData[id][BillboardLocation][2] = z;

    BillboardData[id][BillboardLocation][3] = 0.0;
    BillboardData[id][BillboardLocation][4] = 0.0;
    BillboardData[id][BillboardLocation][5] = angle;

	BillboardData[id][BillboardModel] = -20045;
    BillboardData[id][BillboardInterior] = GetPlayerInterior(playerid);
    BillboardData[id][BillboardWorld] = GetPlayerVirtualWorld(playerid);
    BillboardData[id][BillboardRentExpiresAt] = 0;
    BillboardData[id][BillboardRentedBy] = 0;
    BillboardData[id][BillboardText] = EOS;
    Iter_Add(Billboards, id);

	SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý billboard noktasýný ekledin.", id);
	mysql_tquery(m_Handle, "INSERT INTO billboards (BillboardInterior) VALUES(0)", "OnBillboardCreated", "d", id);
	Billboard_Refresh(id);
	return 1;
}

Billboard_Available(playerid)
{
    foreach(new i : Billboards) if(ReturnCityCode(BillboardData[i][BillboardInArea]) == ReturnCityCode(GetPlayerCityID(playerid)) && !BillboardData[i][BillboardRentedBy])
  	{
		if (GetPlayerInterior(playerid) == BillboardData[i][BillboardInterior] && GetPlayerVirtualWorld(playerid) == BillboardData[i][BillboardWorld])
			return i;
	}
	return -1;
}

Billboard_Publish(playerid, id, text[])
{
	BillboardData[id][BillboardRentExpiresAt] = Time() + (1 * 3600); // 24 olacak
	BillboardData[id][BillboardRentedBy] = PlayerData[playerid][pSQLID];

    SendClientMessageEx(playerid, COLOR_YELLOW, "1-800-BLBRD (telefon): Ýlanýnýz en kýsa sürede çevre bölgede yayýnlanacaktýr, ilanýn %s", GetFullTime(BillboardData[id][BillboardRentExpiresAt]));
	SendClientMessage(playerid, COLOR_YELLOW, "...tarihine kadar gösterilecektir.");

	if(strlen(text) > 22) format(BillboardData[id][BillboardText], 128, "%.22s\n%s\nÝletiþim: %i", text, text[22], ReturnPhoneNumber(playerid));
	else format(BillboardData[id][BillboardText], 128, "%s\nÝletiþim: %i", text, ReturnPhoneNumber(playerid));

	ReplaceText(BillboardData[id][BillboardText], "(y)", "\n");
	SetDynamicObjectMaterialText(BillboardData[id][BillboardObject], 0, BillboardData[id][BillboardText], OBJECT_MATERIAL_SIZE_512x256, "New Times Roman", 40, 0, 0xFF000000, 0xFFFAFAFA, 1);
	Billboard_Save(id);
	return 1;
}

Billboard_Refresh(id)
{
	if (IsValidDynamicObject(BillboardData[id][BillboardObject])) DestroyDynamicObject(BillboardData[id][BillboardObject]);
	BillboardData[id][BillboardObject] = CreateDynamicObject(BillboardData[id][BillboardModel], BillboardData[id][BillboardLocation][0], BillboardData[id][BillboardLocation][1], BillboardData[id][BillboardLocation][2], BillboardData[id][BillboardLocation][3], BillboardData[id][BillboardLocation][4], BillboardData[id][BillboardLocation][5], BillboardData[id][BillboardWorld], BillboardData[id][BillboardInterior]);
	BillboardData[id][BillboardInArea] = GetCityID(BillboardData[id][BillboardLocation][0], BillboardData[id][BillboardLocation][1], BillboardData[id][BillboardLocation][2]);

	if(!strmatch(BillboardData[id][BillboardText], "Yok"))
	{
		ReplaceText(BillboardData[id][BillboardText], "(y)", "\n");
		SetDynamicObjectMaterialText(BillboardData[id][BillboardObject], 0, BillboardData[id][BillboardText], OBJECT_MATERIAL_SIZE_512x256, "New Times Roman", 40, 0, 0xFF000000, 0xFFFAFAFA, 1);
	}
	return 1;
}

Billboard_Save(id)
{
	new
	    query[355];

	mysql_format(m_Handle, query, sizeof(query), "UPDATE billboards SET BillboardModel = %i, BillboardText = '%e', BillboardX = %f, BillboardY = %f, BillboardZ = %f WHERE id = %i",
        BillboardData[id][BillboardModel],
        BillboardData[id][BillboardText],
		BillboardData[id][BillboardLocation][0],
	    BillboardData[id][BillboardLocation][1],
	    BillboardData[id][BillboardLocation][2],
	    BillboardData[id][BillboardID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE billboards SET BillboardRX = %f, BillboardRY = %f, BillboardRZ = %f, BillboardInterior = %i, BillboardWorld = %i WHERE id = %i",
		BillboardData[id][BillboardLocation][3],
	    BillboardData[id][BillboardLocation][4],
	    BillboardData[id][BillboardLocation][5],
	    BillboardData[id][BillboardInterior],
	    BillboardData[id][BillboardWorld],
	    BillboardData[id][BillboardID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE billboards SET BillboardRentedBy = %i, BillboardRentExpiresAt = %i WHERE id = %i",
	    BillboardData[id][BillboardRentedBy],
	    BillboardData[id][BillboardRentExpiresAt],
	    BillboardData[id][BillboardID]
	);
	mysql_tquery(m_Handle, query);
	return 1;
}

Billboard_Delete(id)
{
    new
        query[64];

	mysql_format(m_Handle, query, sizeof(query), "DELETE FROM billboards WHERE id = %i", BillboardData[id][BillboardID]);
	mysql_tquery(m_Handle, query);

	if (IsValidDynamicObject(BillboardData[id][BillboardObject])) DestroyDynamicObject(BillboardData[id][BillboardObject]);
	//BillboardData[id][BillboardObject] = CreateDynamicObject(BillboardData[id][BillboardModel], BillboardData[id][BillboardLocation][0], BillboardData[id][BillboardLocation][1], BillboardData[id][BillboardLocation][2], BillboardData[id][BillboardLocation][3], BillboardData[id][BillboardLocation][4], BillboardData[id][BillboardLocation][5], BillboardData[id][BillboardWorld], BillboardData[id][BillboardInterior]);
    Iter_Remove(Billboards, id);
	return 1;
}

Boombox_Nearest(playerid, Float: distance = 20.0)
{
	if(GetPVarInt(playerid, "AtBoombox") != -1)
	{
		new b = GetPVarInt(playerid, "AtBoombox");
		if (IsPlayerInRangeOfPoint(playerid, distance, BoomboxData[b][BoomboxLocation][0], BoomboxData[b][BoomboxLocation][1], BoomboxData[b][BoomboxLocation][2]))
		{
			return b;
		}
	}
	return -1;
}

Boombox_Placed(playerid)
{
	foreach(new i : Boomboxs) if (BoomboxData[i][BoomboxOwnerID] == PlayerData[playerid][pSQLID])
	{
		return i;
	}
	return -1;
}

Boombox_Create(playerid)
{
	new id = Iter_Free(Boomboxs);
   	if (id == -1) return SendErrorMessage(playerid, "Þu anda boombox ekleyemiyorsun, lütfen daha sonra tekrar dene.");

   	BoomboxData[id][BoomboxOwnerID] = PlayerData[playerid][pSQLID];
	GetPlayerPos(playerid, BoomboxData[id][BoomboxLocation][0], BoomboxData[id][BoomboxLocation][1], BoomboxData[id][BoomboxLocation][2]);
    BoomboxData[id][BoomboxInterior] = GetPlayerInterior(playerid);
    BoomboxData[id][BoomboxWorld] = GetPlayerVirtualWorld(playerid);
    Iter_Add(Boomboxs, id);

	SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: Yere boombox koydun. Düzenlemek için /boombox duzenle");
	Boombox_Refresh(id);
	return 1;
}

Boombox_Refresh(id)
{
	if (Iter_Contains(Boomboxs, id))
	{
        if (IsValidDynamicObject(BoomboxData[id][BoomboxObject])) DestroyDynamicObject(BoomboxData[id][BoomboxObject]);
    	if (IsValidDynamicArea(BoomboxData[id][BoomboxAreaID])) {
	    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, BoomboxData[id][BoomboxAreaID], E_STREAMER_PLAYER_ID, id);
    	    DestroyDynamicArea(BoomboxData[id][BoomboxAreaID]);
    	}

		BoomboxData[id][BoomboxObject] = CreateDynamicObject(2226, BoomboxData[id][BoomboxLocation][0], BoomboxData[id][BoomboxLocation][1], BoomboxData[id][BoomboxLocation][2], BoomboxData[id][BoomboxLocation][3], BoomboxData[id][BoomboxLocation][4], BoomboxData[id][BoomboxLocation][5], BoomboxData[id][BoomboxWorld], BoomboxData[id][BoomboxInterior]);
		new array[2]; array[0] = 24; array[1] = id;
		BoomboxData[id][BoomboxAreaID] = CreateDynamicCircle(BoomboxData[id][BoomboxLocation][0], BoomboxData[id][BoomboxLocation][1], 30.0, BoomboxData[id][BoomboxWorld], BoomboxData[id][BoomboxInterior]);
		Streamer_SetArrayData(STREAMER_TYPE_AREA, BoomboxData[id][BoomboxAreaID], E_STREAMER_EXTRA_ID, array, 2);
	}
	return 1;
}

Boombox_Delete(id)
{
	if (Iter_Contains(Boomboxs, id))
	{
        if (IsValidDynamicObject(BoomboxData[id][BoomboxObject])) DestroyDynamicObject(BoomboxData[id][BoomboxObject]);
    	if (IsValidDynamicArea(BoomboxData[id][BoomboxAreaID])) {
	    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, BoomboxData[id][BoomboxAreaID], E_STREAMER_PLAYER_ID, id);
    	    DestroyDynamicArea(BoomboxData[id][BoomboxAreaID]);
    	}

		Iter_Remove(Boomboxs, id);
	}
	return 1;
}

Camera_Create(playerid, name[])
{
	new id = Iter_Free(Cameras);
   	if (id == -1) return SendErrorMessage(playerid, "Maksimum eklenebilecek CCTV sýnýrýna ulaþýlmýþ.");

	format(CameraData[id][CameraName], 30, name);
    GetPlayerPos(playerid, CameraData[id][CameraLocation][0], CameraData[id][CameraLocation][1], CameraData[id][CameraLocation][2]);
    CameraData[id][CameraLocation][3] = 0.0;
    CameraData[id][CameraLocation][4] = 0.0;
    CameraData[id][CameraLocation][5] = 0.0;
	CameraData[id][CameraInterior] = GetPlayerInterior(playerid);
	CameraData[id][CameraWorld] = GetPlayerVirtualWorld(playerid);
	Iter_Add(Cameras, id);

	SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý CCTV noktasýný ekledin. (ayarlamayý unutmayýn)", id);
	mysql_tquery(m_Handle, "INSERT INTO cameras (CameraInterior) VALUES (0)", "OnCameraCreated", "d", id);
	Camera_Refresh(id);
	return 1;
}

Camera_Save(id)
{
	new
		query[454];

    mysql_format(m_Handle, query, sizeof(query), "UPDATE cameras SET CameraName = '%e', CameraX = %f, CameraY = %f, CameraZ = %f, CameraRX = %f, CameraRY = %f, CameraRZ = %f, CameraInterior = %i, CameraWorld = %i WHERE id = %i",
        CameraData[id][CameraName],
        CameraData[id][CameraLocation][0],
        CameraData[id][CameraLocation][1],
        CameraData[id][CameraLocation][2],
        CameraData[id][CameraLocation][3],
        CameraData[id][CameraLocation][4],
        CameraData[id][CameraLocation][5],
        CameraData[id][CameraInterior],
        CameraData[id][CameraWorld],
        CameraData[id][CameraID]);

    mysql_tquery(m_Handle, query);
	return 1;
}

Camera_Delete(id)
{
    new
        query[64];

	mysql_format(m_Handle, query, sizeof(query), "DELETE FROM cameras WHERE id = %i", CameraData[id][CameraID]);
	mysql_tquery(m_Handle, query);

    if(IsValidDynamicObject(CameraData[id][CameraObject])) DestroyDynamicObject(CameraData[id][CameraObject]);
	if (IsValidDynamicArea(CameraData[id][CameraAreaID])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, CameraData[id][CameraAreaID], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(CameraData[id][CameraAreaID]);
	}

	Iter_Remove(Cameras, id);
	return 1;
}

Camera_Refresh(id)
{
    if(IsValidDynamicObject(CameraData[id][CameraObject])) DestroyDynamicObject(CameraData[id][CameraObject]);
	if (IsValidDynamicArea(CameraData[id][CameraAreaID])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, CameraData[id][CameraAreaID], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(CameraData[id][CameraAreaID]);
	}

	CameraData[id][CameraObject] = CreateDynamicObject(1622, CameraData[id][CameraLocation][0], CameraData[id][CameraLocation][1], CameraData[id][CameraLocation][2], CameraData[id][CameraLocation][3], CameraData[id][CameraLocation][4], CameraData[id][CameraLocation][5], CameraData[id][CameraWorld], CameraData[id][CameraInterior]);
	new array[2]; array[0] = 22; array[1] = id;
	CameraData[id][CameraAreaID] = CreateDynamicSphere(CameraData[id][CameraLocation][0], CameraData[id][CameraLocation][1], CameraData[id][CameraLocation][2], 3.0, CameraData[id][CameraWorld], CameraData[id][CameraInterior]);
	Streamer_SetArrayData(STREAMER_TYPE_AREA, CameraData[id][CameraAreaID], E_STREAMER_EXTRA_ID, array, 2);
	return 1;
}

Camera_Nearest(playerid)
{
    return GetPVarInt(playerid, "AtCCTV");
}


Camera_List(playerid, page = 0)
{
  SetPVarInt(playerid, "cctv_idx", page);

  new query[82];
  mysql_format(m_Handle, query, sizeof(query), "SELECT id, CameraName FROM cameras LIMIT %d, 25", page*MAX_CLOTHING_SHOW);
  mysql_tquery(m_Handle, query, "SQL_CCTVList", "ii", playerid, page);
	return 1;
}

Server:SQL_CCTVList(playerid, page)
{
	if(!IsPlayerConnected(playerid)) {
        return 0;
    }

    new rows = cache_num_rows();
    if(!rows) {
        return SendClientMessage(playerid, COLOR_ADM, "SERVER: Hiç CCTV noktasý eklenmemiþ.");
    }

	new primary_str[2048], id, camera_name[30], sub[256];

	for(new i; i < rows; ++i)
	{
		cache_get_value_name_int(i, "id", id);
    cache_get_value_name(i, "CameraName", camera_name, sizeof(camera_name));
		format(sub, sizeof(sub), "{FFFFFF}%s\n", camera_name);
    strcat(primary_str, sub);
	}

	if(page != 0) strcat(primary_str, "{FFFF00}Önceki Sayfa <<\n");
	if(rows >= MAX_CLOTHING_SHOW) strcat(primary_str, "{FFFF00}Sonraki Sayfa >>");
	Dialog_Show(playerid, CCTV_LIST, DIALOG_STYLE_LIST, "Closed-Circuit Television", primary_str, "Iþýnlan", "<< Kapat");
	return 1;
}

/*Camera_List(playerid)
{
	new
		primary[1024], sub[90];

	  for(new i; i < MAX_CLOTHING_SHOW; i++)
	{
		format(sub, sizeof(sub), "%s\t{AFAFAF}[%s]\n", CameraData[i][CameraName], GetStreet(CameraData[i][CameraLocation][0], CameraData[i][CameraLocation][1], CameraData[i][CameraLocation][2]));
		strcat(primary, sub);
	}

	strcat(primary, "{FFFF00}Kapatmak için týklayýn.");
	Dialog_Show(playerid, CCTV_LIST, DIALOG_STYLE_TABLIST, "Close Circuit TeleVision", primary, "Tamam", "Kapat <<<");
	return 1;
}*/

Camera_Watch(playerid, id)
{
  if(CCTVID[playerid] == -1)
  {
    GetPlayerPos(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]);
    GetPlayerFacingAngle(playerid, PlayerData[playerid][pPos][3]);

    PlayerData[playerid][pInterior] = GetPlayerInterior(playerid);
    PlayerData[playerid][pWorld] = GetPlayerVirtualWorld(playerid);
  }

  SetPlayerInterior(playerid, CameraData[id][CameraInterior]);
  SetPlayerVirtualWorld(playerid, CameraData[id][CameraWorld]);

  cctvPlayerObject[playerid] = CreatePlayerObject(playerid, 19374, CameraData[id][CameraLocation][0], CameraData[id][CameraLocation][1], CameraData[id][CameraLocation][2], 0.0, 0.0, 0.0);

  TogglePlayerSpectating(playerid, 1);
  AttachCameraToPlayerObject(playerid, cctvPlayerObject[playerid]);
  CCTVID[playerid] = id;

  SendClientMessageEx(playerid, COLOR_ADM, "SERVER: %s kamerasýný izlemeye baþladýn.", CameraData[id][CameraName]);
  return 1;
}

Toll_Create(playerid, model, name[])
{
	new id = Iter_Free(Tolls);
   	if (id == -1) return SendErrorMessage(playerid, "Maksimum eklenebilecek giþe sýnýrýna ulaþýlmýþ.");

	static
		Float:x,
		Float:y,
		Float:z,
		Float:angle;

	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, angle);

	format(TollData[id][TollName], 25, "%s", name);
	TollData[id][TollModel] = model;
	TollData[id][TollPrice] = 20;

	TollData[id][TollPos][0] = x + (3.0 * floatsin(-angle, degrees));
	TollData[id][TollPos][1] = y + (3.0 * floatcos(-angle, degrees));
	TollData[id][TollPos][2] = z;
	TollData[id][TollPos][3] = 0.0;
	TollData[id][TollPos][4] = 0.0;
	TollData[id][TollPos][5] = angle;

	TollData[id][TollInterior] = GetPlayerInterior(playerid);
	TollData[id][TollWorld] = GetPlayerVirtualWorld(playerid);

	TollData[id][TollMovePos][0] = x + (3.0 * floatsin(-angle, degrees));
	TollData[id][TollMovePos][1] = y + (3.0 * floatcos(-angle, degrees));
	TollData[id][TollMovePos][2] = z - 10.0;
	TollData[id][TollMovePos][3] = -1000.0;
	TollData[id][TollMovePos][4] = -1000.0;
	TollData[id][TollMovePos][5] = -1000.0;

	TollData[id][TollLocked] = false;
	TollData[id][TollStatus] = false;
	Iter_Add(Tolls, id);

	SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý giþeyi ekledin. (düzenlemeyi unutma)", id);
	mysql_tquery(m_Handle, "INSERT INTO tolls (TollPrice) VALUES(20)", "OnTollCreated", "d", id);
	Toll_Refresh(id);
	return 1;
}

Toll_OpenedCount()
{
	new count = 0;
	foreach(new i: Tolls) if(TollData[i][TollStatus]) count++;
	return count;
}

Toll_Refresh(id)
{
	if(IsValidDynamicObject(TollData[id][TollObject])) DestroyDynamicObject(TollData[id][TollObject]);
	if(IsValidDynamicArea(TollData[id][TollAreaID])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, TollData[id][TollAreaID], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(TollData[id][TollAreaID]);
	}

	TollData[id][TollObject] = CreateDynamicObject(TollData[id][TollModel], TollData[id][TollPos][0], TollData[id][TollPos][1], TollData[id][TollPos][2], TollData[id][TollPos][3], TollData[id][TollPos][4], TollData[id][TollPos][5], TollData[id][TollWorld], TollData[id][TollInterior]);

	new array[2]; array[0] = 7; array[1] = id;
	TollData[id][TollAreaID] = CreateDynamicSphere(TollData[id][TollPos][0], TollData[id][TollPos][1], TollData[id][TollPos][2], 9.0, TollData[id][TollWorld], TollData[id][TollInterior]);
	Streamer_SetArrayData(STREAMER_TYPE_AREA, TollData[id][TollAreaID], E_STREAMER_EXTRA_ID, array, 2);
	return 1;
}

Toll_Save(id)
{
	new
		query[354];

	mysql_format(m_Handle, query, sizeof(query), "UPDATE tolls SET TollName = '%e', TollModel = %i, TollPrice = %i, PosX = %f, PosY = %f, PosZ = %f, RotX = %f, RotY = %f, RotZ = %f WHERE id = %i",
        TollData[id][TollName],
		TollData[id][TollModel],
	    TollData[id][TollPrice],
		TollData[id][TollPos][0],
	    TollData[id][TollPos][1],
	    TollData[id][TollPos][2],
	    TollData[id][TollPos][3],
	    TollData[id][TollPos][4],
	    TollData[id][TollPos][5],
	    TollData[id][TollID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE tolls SET TollInterior = %i, TollWorld = %i, OpenX = %f, OpenY = %f, OpenZ = %f, OpenRotX = %f, OpenRotY = %f, OpenRotZ = %f WHERE id = %i",
        TollData[id][TollInterior],
		TollData[id][TollWorld],
		TollData[id][TollMovePos][0],
	    TollData[id][TollMovePos][1],
	    TollData[id][TollMovePos][2],
	    TollData[id][TollMovePos][3],
	    TollData[id][TollMovePos][4],
	    TollData[id][TollMovePos][5],
	    TollData[id][TollID]
	);
	mysql_tquery(m_Handle, query);
	return 1;
}

Toll_Delete(id)
{
    new
        query[64];

	mysql_format(m_Handle, query, sizeof(query), "DELETE FROM tolls WHERE id = %i", TollData[id][TollID]);
	mysql_tquery(m_Handle, query);

	if(IsValidDynamicObject(TollData[id][TollObject])) DestroyDynamicObject(TollData[id][TollObject]);
	if(IsValidDynamicArea(TollData[id][TollAreaID])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, TollData[id][TollAreaID], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(TollData[id][TollAreaID]);
	}

    Iter_Remove(Tolls, id);
	return 1;
}

Faction_Create(playerid, f_name[], f_abbrev[])
{
	new id = Iter_Free(Factions);
   	if (id == -1) return SendErrorMessage(playerid, "Maksimum eklenebilecek birlik sýnýrýna ulaþýlmýþ.");

	format(FactionData[id][FactionName], 128, "%s", f_name);
	format(FactionData[id][FactionAbbrev], 128, "%s", f_abbrev);
	FactionData[id][FactionChatColor] = 0x666666FF;
	Iter_Add(Factions, id);

	SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý birliði ekledin.", id);
    mysql_tquery(m_Handle, "INSERT INTO factions (Bank) VALUES(0)", "OnFactionCreated", "d", id);
	//Faction_Refresh(id);
	return 1;
}

Faction_Save(id)
{
	new
	    query[454];

	mysql_format(m_Handle, query, sizeof(query), "UPDATE factions SET Name = '%e', Abbreviation = '%e', MaxRanks = %i, EditRank = %i, ChatRank = %i, TowRank = %i, ChatColor = %i, ChatStatus = %i WHERE id = %i",
	    FactionData[id][FactionName],
	    FactionData[id][FactionAbbrev],
	    FactionData[id][FactionMaxRanks],
	    FactionData[id][FactionEditrank],
	    FactionData[id][FactionChatrank],
	    FactionData[id][FactionTowrank],
	    FactionData[id][FactionChatColor],
	    FactionData[id][FactionChatStatus],
	    FactionData[id][FactionID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE factions SET CopPerms = %i, MedPerms = %i, SanPerms = %i, SpawnX = %f, SpawnY = %f, SpawnZ = %f, SpawnA = %f, SpawnInt = %i, SpawnWorld = %i, Bank = %i WHERE id = %i",
	    FactionData[id][FactionCopPerms],
	    FactionData[id][FactionMedPerms],
	    FactionData[id][FactionSanPerms],
	    FactionData[id][FactionSpawn][0],
	    FactionData[id][FactionSpawn][1],
	    FactionData[id][FactionSpawn][2],
	    FactionData[id][FactionSpawn][3],
	    FactionData[id][FactionSpawnInterior],
	    FactionData[id][FactionSpawnVW],
	    FactionData[id][FactionBank],
	    FactionData[id][FactionID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE factions SET ExSpawn1X = %f, ExSpawn1Y = %f, ExSpawn1Z = %f, ExSpawn1Int = %i, ExSpawn1World = %i WHERE id = %i",
	    FactionData[id][FactionSpawnEx1][0],
	    FactionData[id][FactionSpawnEx1][1],
	    FactionData[id][FactionSpawnEx1][2],
	    FactionData[id][FactionSpawnEx1][3],
	    FactionData[id][FactionSpawnEx1Interior],
	    FactionData[id][FactionSpawnEx1VW],
	    FactionData[id][FactionID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE factions SET ExSpawn2X = %f, ExSpawn2Y = %f, ExSpawn2Z = %f, ExSpawn2Int = %i, ExSpawn2World = %i WHERE id = %i",
	    FactionData[id][FactionSpawnEx2][0],
	    FactionData[id][FactionSpawnEx2][1],
	    FactionData[id][FactionSpawnEx2][2],
	    FactionData[id][FactionSpawnEx2][3],
	    FactionData[id][FactionSpawnEx2Interior],
	    FactionData[id][FactionSpawnEx2VW],
	    FactionData[id][FactionID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE factions SET ExSpawn3X = %f, ExSpawn3Y = %f, ExSpawn3Z = %f, ExSpawn3Int = %i, ExSpawn3World = %i WHERE id = %i",
	    FactionData[id][FactionSpawnEx3][0],
	    FactionData[id][FactionSpawnEx3][1],
	    FactionData[id][FactionSpawnEx3][2],
	    FactionData[id][FactionSpawnEx3][3],
	    FactionData[id][FactionSpawnEx3Interior],
	    FactionData[id][FactionSpawnEx3VW],
	    FactionData[id][FactionID]
	);
	mysql_tquery(m_Handle, query);
	return 1;
}

Faction_SaveRanks(id)
{
	new
		query[456];

	for(new i = 1; i < MAX_FACTION_RANKS; i++)
	{
		mysql_format(m_Handle, query, sizeof(query), "UPDATE faction_ranks SET factionrank%i = '%e' WHERE faction_id = %i", i, FactionRanks[id][i], FactionData[id][FactionID]);
		mysql_tquery(m_Handle, query);

		mysql_format(m_Handle, query, sizeof(query), "UPDATE faction_ranks SET factionranksalary%i = %i WHERE faction_id = %i", i, FactionRanksSalary[id][i], FactionData[id][FactionID]);
		mysql_tquery(m_Handle, query);
	}
	return 1;
}

UI_Huds(playerid)
{
	Player_Hud[playerid][0] = CreatePlayerTextDraw(playerid, 547.000000, 114.000000, "_");
	PlayerTextDrawFont(playerid, Player_Hud[playerid][0], 3);
	PlayerTextDrawLetterSize(playerid, Player_Hud[playerid][0], 0.395833, 1.500000);
	PlayerTextDrawTextSize(playerid, Player_Hud[playerid][0], 376.000000, 99.000000);
	PlayerTextDrawSetOutline(playerid, Player_Hud[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, Player_Hud[playerid][0], 1);
	PlayerTextDrawAlignment(playerid, Player_Hud[playerid][0], 2);
	PlayerTextDrawColor(playerid, Player_Hud[playerid][0], 758542591);
	PlayerTextDrawBackgroundColor(playerid, Player_Hud[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, Player_Hud[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, Player_Hud[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, Player_Hud[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, Player_Hud[playerid][0], 0);

	Player_Hud[playerid][1] = CreatePlayerTextDraw(playerid, 497.000000, 101.000000, "_");
	PlayerTextDrawFont(playerid, Player_Hud[playerid][1], 3);
	PlayerTextDrawLetterSize(playerid, Player_Hud[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, Player_Hud[playerid][1], 633.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Player_Hud[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, Player_Hud[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, Player_Hud[playerid][1], 1);
	PlayerTextDrawColor(playerid, Player_Hud[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, Player_Hud[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, Player_Hud[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, Player_Hud[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, Player_Hud[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, Player_Hud[playerid][1], 0);

	Player_Hud[playerid][2] = CreatePlayerTextDraw(playerid, 13.000000, 166.000000, "_");
	PlayerTextDrawFont(playerid, Player_Hud[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, Player_Hud[playerid][2], 0.341666, 1.750000);
	PlayerTextDrawTextSize(playerid, Player_Hud[playerid][2], 224.500000, 315.500000);
	PlayerTextDrawSetOutline(playerid, Player_Hud[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, Player_Hud[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, Player_Hud[playerid][2], 1);
	PlayerTextDrawColor(playerid, Player_Hud[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, Player_Hud[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, Player_Hud[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, Player_Hud[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, Player_Hud[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, Player_Hud[playerid][2], 0);

	Player_Hud[playerid][3] = CreatePlayerTextDraw(playerid, 545.000000, 406.000000, "_");
	PlayerTextDrawFont(playerid, Player_Hud[playerid][3], 2);
	PlayerTextDrawLetterSize(playerid, Player_Hud[playerid][3], 0.395832, 1.899999);
	PlayerTextDrawTextSize(playerid, Player_Hud[playerid][3], 468.000000, 176.500000);
	PlayerTextDrawSetOutline(playerid, Player_Hud[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, Player_Hud[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, Player_Hud[playerid][3], 2);
	PlayerTextDrawColor(playerid, Player_Hud[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, Player_Hud[playerid][3], 1296911871);
	PlayerTextDrawBoxColor(playerid, Player_Hud[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, Player_Hud[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, Player_Hud[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, Player_Hud[playerid][3], 0);

	Player_Hud[playerid][4] = CreatePlayerTextDraw(playerid, 560.000000, 349.000000, "_");
	PlayerTextDrawFont(playerid, Player_Hud[playerid][4], 3);
	PlayerTextDrawLetterSize(playerid, Player_Hud[playerid][4], 0.341666, 1.350000);
	PlayerTextDrawTextSize(playerid, Player_Hud[playerid][4], 657.500000, 129.500000);
	PlayerTextDrawSetOutline(playerid, Player_Hud[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, Player_Hud[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, Player_Hud[playerid][4], 2);
	PlayerTextDrawColor(playerid, Player_Hud[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, Player_Hud[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, Player_Hud[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, Player_Hud[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, Player_Hud[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, Player_Hud[playerid][4], 0);
	return 1;
}

UI_StreetHuds(playerid)
{
	Street_Hud[playerid][0] = CreatePlayerTextDraw(playerid, 457.000000, 429.000000, "~l~N Market Street");
	PlayerTextDrawFont(playerid, Street_Hud[playerid][0], 2);
	PlayerTextDrawLetterSize(playerid, Street_Hud[playerid][0], 0.241666, 1.550000);
	PlayerTextDrawTextSize(playerid, Street_Hud[playerid][0], 614.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Street_Hud[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, Street_Hud[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, Street_Hud[playerid][0], 1);
	PlayerTextDrawColor(playerid, Street_Hud[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, Street_Hud[playerid][0], -1094795521);
	PlayerTextDrawBoxColor(playerid, Street_Hud[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, Street_Hud[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, Street_Hud[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, Street_Hud[playerid][0], 0);

	Street_Hud[playerid][1] = CreatePlayerTextDraw(playerid, 26.000000, 425.000000, "N Market Street");
	PlayerTextDrawFont(playerid, Street_Hud[playerid][1], 2);
	PlayerTextDrawLetterSize(playerid, Street_Hud[playerid][1], 0.220833, 1.500000);
	PlayerTextDrawTextSize(playerid, Street_Hud[playerid][1], 198.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Street_Hud[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, Street_Hud[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, Street_Hud[playerid][1], 1);
	PlayerTextDrawColor(playerid, Street_Hud[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, Street_Hud[playerid][1], 1296911871);
	PlayerTextDrawBoxColor(playerid, Street_Hud[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, Street_Hud[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, Street_Hud[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, Street_Hud[playerid][1], 0);

	Street_Hud[playerid][2] = CreatePlayerTextDraw(playerid, 257.000000, 12.000000, " ~l~N Market Street");
	PlayerTextDrawFont(playerid, Street_Hud[playerid][2], 2);
	PlayerTextDrawLetterSize(playerid, Street_Hud[playerid][2], 0.241666, 1.500000);
	PlayerTextDrawTextSize(playerid, Street_Hud[playerid][2], 614.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Street_Hud[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, Street_Hud[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, Street_Hud[playerid][2], 1);
	PlayerTextDrawColor(playerid, Street_Hud[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, Street_Hud[playerid][2], -1094795521);
	PlayerTextDrawBoxColor(playerid, Street_Hud[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, Street_Hud[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, Street_Hud[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, Street_Hud[playerid][2], 0);

	Street_Hud[playerid][3] = CreatePlayerTextDraw(playerid, 508.000000, 105.000000, "N Market Street");
	PlayerTextDrawFont(playerid, Street_Hud[playerid][3], 2);
	PlayerTextDrawLetterSize(playerid, Street_Hud[playerid][3], 0.195833, 1.250001);
	PlayerTextDrawTextSize(playerid, Street_Hud[playerid][3], 653.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Street_Hud[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, Street_Hud[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, Street_Hud[playerid][3], 1);
	PlayerTextDrawColor(playerid, Street_Hud[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, Street_Hud[playerid][3], 1296911871);
	PlayerTextDrawBoxColor(playerid, Street_Hud[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, Street_Hud[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, Street_Hud[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, Street_Hud[playerid][3], 0);

	Street_Hud[playerid][4] = CreatePlayerTextDraw(playerid, 33.000000, 303.000000, "N Market Street");
	PlayerTextDrawFont(playerid, Street_Hud[playerid][4], 2);
	PlayerTextDrawLetterSize(playerid, Street_Hud[playerid][4], 0.195833, 1.250001);
	PlayerTextDrawTextSize(playerid, Street_Hud[playerid][4], 653.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Street_Hud[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, Street_Hud[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, Street_Hud[playerid][4], 1);
	PlayerTextDrawColor(playerid, Street_Hud[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, Street_Hud[playerid][4], 1296911871);
	PlayerTextDrawBoxColor(playerid, Street_Hud[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, Street_Hud[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, Street_Hud[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, Street_Hud[playerid][4], 0);

	Street_Hud[playerid][5] = CreatePlayerTextDraw(playerid, 33.000000, 433.000000, "N Market Street");
	PlayerTextDrawFont(playerid, Street_Hud[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, Street_Hud[playerid][5], 0.195833, 1.250001);
	PlayerTextDrawTextSize(playerid, Street_Hud[playerid][5], 653.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Street_Hud[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, Street_Hud[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, Street_Hud[playerid][5], 1);
	PlayerTextDrawColor(playerid, Street_Hud[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, Street_Hud[playerid][5], 1296911871);
	PlayerTextDrawBoxColor(playerid, Street_Hud[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, Street_Hud[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, Street_Hud[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, Street_Hud[playerid][5], 0);

	Street_Hud[playerid][6] = CreatePlayerTextDraw(playerid, 13.000000, 166.000000, "N Market Street");
	PlayerTextDrawFont(playerid, Street_Hud[playerid][6], 1);
	PlayerTextDrawLetterSize(playerid, Street_Hud[playerid][6], 0.341666, 1.750000);
	PlayerTextDrawTextSize(playerid, Street_Hud[playerid][6], 224.500000, 315.500000);
	PlayerTextDrawSetOutline(playerid, Street_Hud[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, Street_Hud[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, Street_Hud[playerid][6], 1);
	PlayerTextDrawColor(playerid, Street_Hud[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, Street_Hud[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, Street_Hud[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, Street_Hud[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, Street_Hud[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, Street_Hud[playerid][6], 0);
	return 1;
}

Hud_Change(playerid)
{
	if(!PlayerData[playerid][pHudStatus])
	{
		for(new i = 0; i < 5; i ++) PlayerTextDrawHide(playerid, Player_Hud[playerid][i]);
		return 1;
	}

	PlayerTextDrawShow(playerid, Player_Hud[playerid][PlayerData[playerid][pHudstyle]]);
	return 1;
}

Street_Change(playerid)
{
	if(!PlayerData[playerid][pStreetStatus])
	{
		for(new i = 0; i < 7; i ++) PlayerTextDrawHide(playerid, Street_Hud[playerid][i]);
		return 1;
	}

	PlayerTextDrawShow(playerid, Street_Hud[playerid][PlayerData[playerid][pStreetstyle]]);
	return 1;
}

Street_Update(playerid, vehicleid)
{
	if(PlayerData[playerid][pStreetStatus])
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			new Float: rz, p_PreviousDirection[8];
			strcat((p_PreviousDirection[0] = EOS, p_PreviousDirection), PlayerDirection[playerid]);
			GetVehicleZAngle(vehicleid, rz);

			if(rz >= 348.75 || rz < 11.25) PlayerDirection[playerid] = "K";
	//		else if(rz >= 326.25 && rz < 348.75) PlayerDirection[playerid] = "NNE";
			else if(rz >= 303.75 && rz < 326.25) PlayerDirection[playerid] = "KD";
	//		else if(rz >= 281.25 && rz < 303.75) PlayerDirection[playerid] = "ENE";
			else if(rz >= 258.75 && rz < 281.25) PlayerDirection[playerid] = "D";
	//		else if(rz >= 236.25 && rz < 258.75) PlayerDirection[playerid] = "ESE";
			else if(rz >= 213.75 && rz < 236.25) PlayerDirection[playerid] = "GD";
	//		else if(rz >= 191.25 && rz < 213.75) PlayerDirection[playerid] = "SSE";
			else if(rz >= 168.75 && rz < 191.25) PlayerDirection[playerid] = "G";
			//else if(rz >= 146.25 && rz < 168.75) PlayerDirection[playerid] = "SSW";
			else if(rz >= 123.25 && rz < 146.25) PlayerDirection[playerid] = "GB";
			//else if(rz >= 101.25 && rz < 123.25) PlayerDirection[playerid] = "WSW";
			else if(rz >= 78.75 && rz < 101.25) PlayerDirection[playerid] = "B";
			//lse if(rz >= 56.25 && rz < 78.75) PlayerDirection[playerid] = "WNW";
		  else if(rz >= 33.75 && rz < 56.25) PlayerDirection[playerid] = "KB";
			//else if(rz >= 11.5 && rz < 33.75) PlayerDirection[playerid] = "NNW";
			// Credits to Pottus for the above.

			if(strcmp(p_PreviousDirection, PlayerDirection[playerid]))
				return 1;

			switch(PlayerData[playerid][pStreetstyle])
			{
				case 0, 2: PlayerTextDrawSetString(playerid, Street_Hud[playerid][PlayerData[playerid][pStreetstyle]], sprintf("~l~%s %s", PlayerDirection[playerid], GetPlayerStreet(playerid)));
				default: PlayerTextDrawSetString(playerid, Street_Hud[playerid][PlayerData[playerid][pStreetstyle]], sprintf("%s %s", PlayerDirection[playerid], GetPlayerStreet(playerid)));
			}
			PlayerTextDrawShow(playerid, Street_Hud[playerid][PlayerData[playerid][pStreetstyle]]);
		}
		else PlayerTextDrawHide(playerid, Street_Hud[playerid][PlayerData[playerid][pStreetstyle]]);
	}
	return 1;
}

GetZoneID(Float: x, Float: y, Float: z)
{
 	for(new i = 0; i < sizeof(SAZones); i++)
 	{
		if(x >= SAZones[i][SAZONE_AREA][0] && x <= SAZones[i][SAZONE_AREA][3] && y >= SAZones[i][SAZONE_AREA][1] && y <= SAZones[i][SAZONE_AREA][4] && z >= SAZones[i][SAZONE_AREA][2] && z <= SAZones[i][SAZONE_AREA][5])
		{
		    return i;
		}
	}
	return 0;
}

GetZoneName(Float: x, Float: y, Float: z)
{
	new zone[28];
 	for(new i = 0; i < sizeof(SAZones); i++)
 	{
		if(x >= SAZones[i][SAZONE_AREA][0] && x <= SAZones[i][SAZONE_AREA][3] && y >= SAZones[i][SAZONE_AREA][1] && y <= SAZones[i][SAZONE_AREA][4] && z >= SAZones[i][SAZONE_AREA][2] && z <= SAZones[i][SAZONE_AREA][5])
		{
		    strcat(zone, SAZones[i][SAZONE_NAME]);
		    return zone;
		}
	}

	strcat(zone, "Unknown");
	return zone;
}

stock GetCityID(Float: x, Float: y, Float: z)
{
 	for(new i = 0; i < sizeof(SACities); i++)
 	{
		if(x >= SACities[i][SACITY_AREA][0] && x <= SACities[i][SACITY_AREA][3] && y >= SACities[i][SACITY_AREA][1] && y <= SACities[i][SACITY_AREA][4] && z >= SACities[i][SACITY_AREA][2] && z <= SACities[i][SACITY_AREA][5])
		{
		    return i;
		}
	}
	return 0;
}

stock GetPlayerCityID(playerid)
{
	new Float: x, Float: y, Float: z;
	GetPlayerPos(playerid, x, y, z);

 	for(new i = 0; i < sizeof(SACities); i++)
 	{
		if(x >= SACities[i][SACITY_AREA][0] && x <= SACities[i][SACITY_AREA][3] && y >= SACities[i][SACITY_AREA][1] && y <= SACities[i][SACITY_AREA][4] && z >= SACities[i][SACITY_AREA][2] && z <= SACities[i][SACITY_AREA][5])
		{
		    return i;
		}
	}
	return 0;
}

GetCityName(Float: x, Float: y, Float: z)
{
	new city[28];
	for(new i = 0; i < sizeof(SACities); i++)
	{
		if(x >= SACities[i][SACITY_AREA][0] && x <= SACities[i][SACITY_AREA][3] && y >= SACities[i][SACITY_AREA][1] && y <= SACities[i][SACITY_AREA][4] && z >= SACities[i][SACITY_AREA][2] && z <= SACities[i][SACITY_AREA][5])
		{
		    strcat(city, SACities[i][SACITY_NAME]);
		    return city;
		}
	}

	strcat(city, "San Andreas");
	return city;
}

ReturnAreaCode(i)
{
	if(strcmp("Los Santos International", SAZones[i][SAZONE_NAME], false) == 0) return 218;
	if(strcmp("Ocean Docks", SAZones[i][SAZONE_NAME], false) == 0) return 218;
	if(strcmp("Santa Maria Beach", SAZones[i][SAZONE_NAME], false) == 0) return 218;
	if(strcmp("Verona Beach", SAZones[i][SAZONE_NAME], false) == 0) return 313;
	if(strcmp("Marina", SAZones[i][SAZONE_NAME], false) == 0) return 313;
	if(strcmp("Rodeo", SAZones[i][SAZONE_NAME], false) == 0) return 802;
	if(strcmp("Temple", SAZones[i][SAZONE_NAME], false) == 0) return 343;
	if(strcmp("Market", SAZones[i][SAZONE_NAME], false) == 0) return 343;
	if(strcmp("Downtown", SAZones[i][SAZONE_NAME], false) == 0) return 206;
	if(strcmp("Pershing Square", SAZones[i][SAZONE_NAME], false) == 0) return 206;
	if(strcmp("Glen Park", SAZones[i][SAZONE_NAME], false) == 0) return 826;
	if(strcmp("Verdant Bluffs", SAZones[i][SAZONE_NAME], false) == 0) return 216;
	if(strcmp("Idlewood", SAZones[i][SAZONE_NAME], false) == 0) return 415;
	if(strcmp("Ganton", SAZones[i][SAZONE_NAME], false) == 0) return 516;
	if(strcmp("El Corona", SAZones[i][SAZONE_NAME], false) == 0) return 516;
	if(strcmp("Willowfield", SAZones[i][SAZONE_NAME], false) == 0) return 516;
	if(strcmp("Playa Del Seville", SAZones[i][SAZONE_NAME], false) == 0) return 516;
	if(strcmp("East Beach", SAZones[i][SAZONE_NAME], false) == 0) return 616;
	if(strcmp("Jefferson", SAZones[i][SAZONE_NAME], false) == 0) return 424;
	if(strcmp("East Los Santos", SAZones[i][SAZONE_NAME], false) == 0) return 424;
	if(strcmp("Jefferson", SAZones[i][SAZONE_NAME], false) == 0) return 424;
	if(strcmp("East Los Santos", SAZones[i][SAZONE_NAME], false) == 0) return 424;
	if(strcmp("Vinewood", SAZones[i][SAZONE_NAME], false) == 0) return 806;
	if(strcmp("Richman", SAZones[i][SAZONE_NAME], false) == 0) return 806;
	if(strcmp("Mulholland", SAZones[i][SAZONE_NAME], false) == 0) return 806;
	if(strcmp("North Rock", SAZones[i][SAZONE_NAME], false) == 0) return 828;
	if(strcmp("Palomino Creek", SAZones[i][SAZONE_NAME], false) == 0) return 835;
	if(strcmp("Montgomery", SAZones[i][SAZONE_NAME], false) == 0) return 824;
	if(strcmp("Dillimore", SAZones[i][SAZONE_NAME], false) == 0) return 808;
	if(strcmp("Blueberry", SAZones[i][SAZONE_NAME], false) == 0) return 890;
	if(strcmp("Blueberry Acres", SAZones[i][SAZONE_NAME], false) == 0) return 890;
	if(strcmp("The Panopticon", SAZones[i][SAZONE_NAME], false) == 0) return 890;
	if(strcmp("Fallen Tree", SAZones[i][SAZONE_NAME], false) == 0) return 890;
	if(strcmp("Easter Bay Chemicals", SAZones[i][SAZONE_NAME], false) == 0) return 843;
	if(strcmp("The Farm", SAZones[i][SAZONE_NAME], false) == 0) return 843;
	if(strcmp("Flint Country", SAZones[i][SAZONE_NAME], false) == 0) return 856;
	if(strcmp("Angel Pine", SAZones[i][SAZONE_NAME], false) == 0) return 856;
	if(strcmp("Fort Carson", SAZones[i][SAZONE_NAME], false) == 0) return 855;
	if(strcmp("Harmony Oaks", SAZones[i][SAZONE_NAME], false) == 0) return 310;
	return 999;
}

stock ReturnCityCode(cityid)
{
	if(strcmp("Los Santos", SACities[cityid][SACITY_NAME], false) == 0) return 213;
	if(strcmp("San Fierro", SACities[cityid][SACITY_NAME], false) == 0) return 415;
    if(strcmp("Las Venturas", SACities[cityid][SACITY_NAME], false) == 0) return 702;
    if(strcmp("Flint County", SACities[cityid][SACITY_NAME], false) == 0) return 707;
    if(strcmp("Red County", SACities[cityid][SACITY_NAME], false) == 0) return 714;
    if(strcmp("Bone County", SACities[cityid][SACITY_NAME], false) == 0) return 760;
    if(strcmp("Tierra Robada", SACities[cityid][SACITY_NAME], false) == 0) return 619;
    if(strcmp("Whetstone", SACities[cityid][SACITY_NAME], false) == 0) return 408;
	return 555;
}

LoadLoginDialogApp(playerid, error[] = "")
{
	new
		string[330];

	if(isnull(error)) string = "Merhaba,\n\nKarakter seçimine eriþmek için lütfen aþaðýya þifrenizi girin.\n\nÞu anda kayýtlý bir LSS-RP hesabýn bulunmuyorsa, www.lss-roleplay.com\n\nadresinden yaratman gerekiyor.";
	else format(string, sizeof(string), "Merhaba,\n\nKarakter seçimine eriþmek için lütfen aþaðýya þifrenizi girin.\n\nÞu anda kayýtlý bir LSS-RP hesabýn bulunmuyorsa, www.lss-roleplay.com\n\nadresinden yaratman gerekiyor.\n\n%s", error);
	Dialog_Show(playerid, LOGIN_APP, DIALOG_STYLE_PASSWORD, "Los Santos Stories'e Hoþgeldin", string, "Giriþ", "Çýkýþ");
	return 1;
}

LoadLoginDialog(playerid, error[] = "")
{
	new
		string[330];

	if(isnull(error)) string = "Merhaba,\n\nKarakter seçimine eriþmek için lütfen aþaðýya þifrenizi girin.\n\nÞu anda kayýtlý bir LSS-RP hesabýn bulunmuyorsa, www.lss-roleplay.com\n\nadresinden yaratman gerekiyor.";
	else format(string, sizeof(string), "Merhaba,\n\nKarakter seçimine eriþmek için lütfen aþaðýya þifrenizi girin.\n\nÞu anda kayýtlý bir LSS-RP hesabýn bulunmuyorsa, www.lss-roleplay.com\n\nadresinden yaratman gerekiyor.\n\n%s", error);
	Dialog_Show(playerid, LOGIN, DIALOG_STYLE_PASSWORD, "Los Santos Stories'e Hoþgeldin", string, "Giriþ", "Çýkýþ");
	return 1;
}

Selection_Hide(playerid)
{
	for(new x = 0; x < 3; x++)
	{
	    if(Character_Preview[playerid][x] != PlayerText:INVALID_TEXT_DRAW)
	    {
			PlayerTextDrawDestroy(playerid, Character_Preview[playerid][x]);
			PlayerTextDrawDestroy(playerid, Character_Preview_Name[playerid][x]);

			Character_Preview[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
			Character_Preview_Name[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
		}
	}

	PlayerTextDrawDestroy(playerid, Character_Logo[playerid]);
    Character_Logo[playerid] = PlayerText:INVALID_TEXT_DRAW;
    SetPVarInt(playerid, "Viewing_CharacterList", 0);
    CancelSelectTextDraw(playerid);
	return 1;
}

LoadPlayerData(playerid, sqlid)
{
	new query[70];
	mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM players WHERE id = %i LIMIT 1", sqlid);
	mysql_tquery(m_Handle, query, "SQL_LoadPlayerData", "i", playerid);
	return 1;
}

Market_Hide(playerid)
{
	for(new i; i < sizeof(MarketData); i++)
	{
		if(i < 8)
		{
			if(Market_Textdraw[playerid][i] != PlayerText:INVALID_TEXT_DRAW) PlayerTextDrawDestroy(playerid, Market_Textdraw[playerid][i]), Market_Textdraw[playerid][i] = PlayerText:INVALID_TEXT_DRAW;
		}

	    if(Market_Selectable[playerid][i] != PlayerText:INVALID_TEXT_DRAW)
	    {
			PlayerTextDrawDestroy(playerid, Market_Selectable[playerid][i]);
			PlayerTextDrawDestroy(playerid, Market_ProductName[playerid][i]);
			PlayerTextDrawDestroy(playerid, Market_ProductPrice[playerid][i]);

			Market_Selectable[playerid][i] = PlayerText:INVALID_TEXT_DRAW;
			Market_ProductName[playerid][i] = PlayerText:INVALID_TEXT_DRAW;
			Market_ProductPrice[playerid][i] = PlayerText:INVALID_TEXT_DRAW;
		}
	}

	PlayerTextDrawDestroy(playerid, Market_Extra[playerid]);
	Market_Extra[playerid] = PlayerText:INVALID_TEXT_DRAW;
	return 1;
}

Market_Show(playerid)
{
	Market_Hide(playerid);

	Market_Textdraw[playerid][0] = CreatePlayerTextDraw(playerid, 304.000000, 114.000000, "_");
	PlayerTextDrawFont(playerid, Market_Textdraw[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, Market_Textdraw[playerid][0], 0.637498, 26.199995);
	PlayerTextDrawTextSize(playerid, Market_Textdraw[playerid][0], 310.500000, 350.000000);
	PlayerTextDrawSetOutline(playerid, Market_Textdraw[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, Market_Textdraw[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, Market_Textdraw[playerid][0], 2);
	PlayerTextDrawColor(playerid, Market_Textdraw[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, Market_Textdraw[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, Market_Textdraw[playerid][0], 135);
	PlayerTextDrawUseBox(playerid, Market_Textdraw[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, Market_Textdraw[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, Market_Textdraw[playerid][0], 0);

	Market_Textdraw[playerid][1] = CreatePlayerTextDraw(playerid, 130.000000, 102.000000, sprintf("%s", BusinessData[ IsPlayerInBusiness(playerid) ][BusinessName]));
	PlayerTextDrawFont(playerid, Market_Textdraw[playerid][1], 0);
	PlayerTextDrawLetterSize(playerid, Market_Textdraw[playerid][1], 0.470833, 1.750000);
	PlayerTextDrawTextSize(playerid, Market_Textdraw[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Market_Textdraw[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, Market_Textdraw[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, Market_Textdraw[playerid][1], 1);
	PlayerTextDrawColor(playerid, Market_Textdraw[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, Market_Textdraw[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, Market_Textdraw[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, Market_Textdraw[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, Market_Textdraw[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, Market_Textdraw[playerid][1], 0);

	Market_Textdraw[playerid][2] = CreatePlayerTextDraw(playerid, 451.000000, 111.000000, "KAPAT");
	PlayerTextDrawFont(playerid, Market_Textdraw[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, Market_Textdraw[playerid][2], 0.275000, 1.299998);
	PlayerTextDrawTextSize(playerid, Market_Textdraw[playerid][2], 480.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Market_Textdraw[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, Market_Textdraw[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, Market_Textdraw[playerid][2], 1);
	PlayerTextDrawColor(playerid, Market_Textdraw[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, Market_Textdraw[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, Market_Textdraw[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, Market_Textdraw[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, Market_Textdraw[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, Market_Textdraw[playerid][2], 1);

	Market_Textdraw[playerid][3] = CreatePlayerTextDraw(playerid, 386.000000, 181.000000, "SATINAL");
	PlayerTextDrawFont(playerid, Market_Textdraw[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, Market_Textdraw[playerid][3], 0.254166, 1.350000);
	PlayerTextDrawTextSize(playerid, Market_Textdraw[playerid][3], 427.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Market_Textdraw[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, Market_Textdraw[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, Market_Textdraw[playerid][3], 1);
	PlayerTextDrawColor(playerid, Market_Textdraw[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, Market_Textdraw[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, Market_Textdraw[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, Market_Textdraw[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, Market_Textdraw[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, Market_Textdraw[playerid][3], 1);

	Market_Textdraw[playerid][4] = CreatePlayerTextDraw(playerid, 435.000000, 181.000000, "TEMIZLE");
	PlayerTextDrawFont(playerid, Market_Textdraw[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, Market_Textdraw[playerid][4], 0.254166, 1.350000);
	PlayerTextDrawTextSize(playerid, Market_Textdraw[playerid][4], 476.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Market_Textdraw[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, Market_Textdraw[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, Market_Textdraw[playerid][4], 1);
	PlayerTextDrawColor(playerid, Market_Textdraw[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, Market_Textdraw[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, Market_Textdraw[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, Market_Textdraw[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, Market_Textdraw[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, Market_Textdraw[playerid][4], 1);

	Market_Textdraw[playerid][5] = CreatePlayerTextDraw(playerid, 311.000000, 121.000000, "_");
	PlayerTextDrawFont(playerid, Market_Textdraw[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, Market_Textdraw[playerid][5], 0.320832, 1.599998);
	PlayerTextDrawTextSize(playerid, Market_Textdraw[playerid][5], 424.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Market_Textdraw[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, Market_Textdraw[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, Market_Textdraw[playerid][5], 1);
	PlayerTextDrawColor(playerid, Market_Textdraw[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, Market_Textdraw[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, Market_Textdraw[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, Market_Textdraw[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, Market_Textdraw[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, Market_Textdraw[playerid][5], 0);

	Market_Textdraw[playerid][6] = CreatePlayerTextDraw(playerid, 315.000000, 137.000000, "Hosgeldin, sepete atmak icin urune ~n~bir kez tikla.~n~~r~Sectigin urunleri SATINAL tusuna basarak elde edebilirsin.");
	PlayerTextDrawFont(playerid, Market_Textdraw[playerid][6], 1);
	PlayerTextDrawLetterSize(playerid, Market_Textdraw[playerid][6], 0.229166, 1.049998);
	PlayerTextDrawTextSize(playerid, Market_Textdraw[playerid][6], 466.000000, 16.000000);
	PlayerTextDrawSetOutline(playerid, Market_Textdraw[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, Market_Textdraw[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, Market_Textdraw[playerid][6], 1);
	PlayerTextDrawColor(playerid, Market_Textdraw[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, Market_Textdraw[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, Market_Textdraw[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, Market_Textdraw[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, Market_Textdraw[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, Market_Textdraw[playerid][6], 0);

	Market_Textdraw[playerid][7] = CreatePlayerTextDraw(playerid, 309.000000, 182.000000, "Hesap ~r~BOS");
	PlayerTextDrawFont(playerid, Market_Textdraw[playerid][7], 1);
	PlayerTextDrawLetterSize(playerid, Market_Textdraw[playerid][7], 0.195832, 1.149999);
	PlayerTextDrawTextSize(playerid, Market_Textdraw[playerid][7], 386.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, Market_Textdraw[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, Market_Textdraw[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, Market_Textdraw[playerid][7], 1);
	PlayerTextDrawColor(playerid, Market_Textdraw[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, Market_Textdraw[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, Market_Textdraw[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, Market_Textdraw[playerid][7], 0);
	PlayerTextDrawSetProportional(playerid, Market_Textdraw[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, Market_Textdraw[playerid][7], 0);

	for(new i; i < 10; ++i)
	{
		if(i < 8) PlayerTextDrawShow(playerid, Market_Textdraw[playerid][i]);

	    PlayerData[playerid][pItemCache][i] = 0;
	}

	new Float: BaseX = 131.000000,
		Float: BaseY = 124.000000;

		// ust 1 131.000000, 124.000000
		// ust 2 218.000000, 124.000000

		// orta 1 131.000000, 199.000000
		// orta 2 218.000000, 199.000000
		// orta 3 305.000000, 199.000000
		// orta 4 392.000000, 199.000000

		// alt 1 131.000000, 274.000000
		// alt 2 218.000000, 274.000000
		// alt 3 305.000000, 274.000000
		// alt 4 392.000000, 274.000000

	new Float: BaseNameX = 133.000000,
		Float: BaseNameY = 125.000000;

		// ust1 133.000000, 125.000000
		// ust2 220.000000, 125.000000

	new Float: BasePriceX = 197.000000,
		Float: BasePriceY = 182.000000;

		// ust1 197.000000, 182.000000
		// ust2 282.000000, 182.000000

	new right_tracker = 0, down_tracker = 0, down_row = 0, first_row = 0;

	for(new i; i < sizeof(MarketData); i++)
	{
		switch(first_row)
		{
			case 0, 1: if(right_tracker != 0) BaseX += 87.000000, BaseNameX += 87.000000, BasePriceX += 87.000000, first_row++;
			default: if(right_tracker != 0) BaseX += 87.000000, BaseNameX += 87.000000, BasePriceX += 87.000000;
		}

		if(down_tracker != 0)
		{
			switch(down_row)
			{
				case 0:
				{
					BaseX = 131.000000, BaseY = 199.000000;
					BaseNameX = 133.000000, BaseNameY = 200.000000;
					BasePriceX = 197.000000, BasePriceY = 257.000000;
				}
				case 1:
				{
					BaseX = 131.000000, BaseY = 274.000000;
					BaseNameX = 133.000000, BaseNameY = 275.000000;
					BasePriceX = 197.000000, BasePriceY = 332.000000;
				}
			}

	        down_tracker = 0;
	        down_row++;
		}


		if(i == 6)
		{
			Market_Extra[playerid] = CreatePlayerTextDraw(playerid, 173.000000, 277.000000, "_");
			PlayerTextDrawFont(playerid, Market_Extra[playerid], 1);
			PlayerTextDrawLetterSize(playerid, Market_Extra[playerid], 0.412499, 7.450006);
			PlayerTextDrawTextSize(playerid, Market_Extra[playerid], 287.000000, 80.000000);
			PlayerTextDrawSetOutline(playerid, Market_Extra[playerid], 1);
			PlayerTextDrawSetShadow(playerid, Market_Extra[playerid], 0);
			PlayerTextDrawAlignment(playerid, Market_Extra[playerid], 2);
			PlayerTextDrawColor(playerid, Market_Extra[playerid], -1);
			PlayerTextDrawBackgroundColor(playerid, Market_Extra[playerid], 255);
			PlayerTextDrawBoxColor(playerid, Market_Extra[playerid], -1378294017);
			PlayerTextDrawUseBox(playerid, Market_Extra[playerid], 1);
			PlayerTextDrawSetProportional(playerid, Market_Extra[playerid], 1);
			PlayerTextDrawSetSelectable(playerid, Market_Extra[playerid], 0);
			PlayerTextDrawShow(playerid, Market_Extra[playerid]);

			Market_Selectable[playerid][i] = CreatePlayerTextDraw(playerid, 174.000000, 293.000000, "_");
			PlayerTextDrawFont(playerid, Market_Selectable[playerid][i], 1);
			PlayerTextDrawLetterSize(playerid, Market_Selectable[playerid][i], 0.275000, 1.450000);
			PlayerTextDrawTextSize(playerid, Market_Selectable[playerid][i], 400.000000, 71.500000);
			PlayerTextDrawSetOutline(playerid, Market_Selectable[playerid][i], 1);
			PlayerTextDrawSetShadow(playerid, Market_Selectable[playerid][i], 0);
			PlayerTextDrawAlignment(playerid, Market_Selectable[playerid][i], 2);
			PlayerTextDrawColor(playerid, Market_Selectable[playerid][i], -1);
			PlayerTextDrawBackgroundColor(playerid, Market_Selectable[playerid][i], 255);
			PlayerTextDrawBoxColor(playerid, Market_Selectable[playerid][i], 50);
			PlayerTextDrawUseBox(playerid, Market_Selectable[playerid][i], 0);
			PlayerTextDrawSetProportional(playerid, Market_Selectable[playerid][i], 1);
			PlayerTextDrawSetSelectable(playerid, Market_Selectable[playerid][i], 1);

			new maskId[24];
		    format(maskId, sizeof(maskId), "Maskeli~n~[%i_%i]", PlayerData[playerid][pMaskID], PlayerData[playerid][pMaskIDEx]);
		    PlayerTextDrawSetString(playerid, Market_Selectable[playerid][i], maskId);
		    PlayerTextDrawShow(playerid, Market_Selectable[playerid][i]);
		}
		else
		{
			Market_Selectable[playerid][i] = CreatePlayerTextDraw(playerid, BaseX, BaseY, "HUD:radar_burgershot");
			PlayerTextDrawLetterSize(playerid, Market_Selectable[playerid][i], 0.600000, 2.000000);
			PlayerTextDrawTextSize(playerid, Market_Selectable[playerid][i], 84.000000, 72.500000);
			PlayerTextDrawSetOutline(playerid, Market_Selectable[playerid][i], 1);
			PlayerTextDrawSetShadow(playerid, Market_Selectable[playerid][i], 0);
			PlayerTextDrawAlignment(playerid, Market_Selectable[playerid][i], 1);
			PlayerTextDrawColor(playerid, Market_Selectable[playerid][i], -1);
			PlayerTextDrawBackgroundColor(playerid, Market_Selectable[playerid][i], -1378294017);
			PlayerTextDrawBoxColor(playerid, Market_Selectable[playerid][i], 50);
			PlayerTextDrawUseBox(playerid, Market_Selectable[playerid][i], 1);
			PlayerTextDrawSetProportional(playerid, Market_Selectable[playerid][i], 1);
			PlayerTextDrawSetSelectable(playerid, Market_Selectable[playerid][i], 1);
			PlayerTextDrawFont(playerid, Market_Selectable[playerid][i], 5);
			PlayerTextDrawSetPreviewModel(playerid, Market_Selectable[playerid][i], MarketData[i][ItemModelID]);
			PlayerTextDrawSetPreviewRot(playerid, Market_Selectable[playerid][i], MarketData[i][ItemX], MarketData[i][ItemY], MarketData[i][ItemZ], MarketData[i][ItemA]);
			PlayerTextDrawSetPreviewVehCol(playerid, Market_Selectable[playerid][i], 1, 1);
			PlayerTextDrawShow(playerid, Market_Selectable[playerid][i]);

			Market_ProductName[playerid][i] = CreatePlayerTextDraw(playerid, BaseNameX, BaseNameY, sprintf("%s", MarketData[i][ItemName]));
			PlayerTextDrawFont(playerid, Market_ProductName[playerid][i], 1);
			PlayerTextDrawLetterSize(playerid, Market_ProductName[playerid][i], 0.195832, 1.149999);
			PlayerTextDrawTextSize(playerid, Market_ProductName[playerid][i], 386.500000, 17.000000);
			PlayerTextDrawSetOutline(playerid, Market_ProductName[playerid][i], 1);
			PlayerTextDrawSetShadow(playerid, Market_ProductName[playerid][i], 0);
			PlayerTextDrawAlignment(playerid, Market_ProductName[playerid][i], 1);
			PlayerTextDrawColor(playerid, Market_ProductName[playerid][i], -1);
			PlayerTextDrawBackgroundColor(playerid, Market_ProductName[playerid][i], 255);
			PlayerTextDrawBoxColor(playerid, Market_ProductName[playerid][i], 50);
			PlayerTextDrawUseBox(playerid, Market_ProductName[playerid][i], 0);
			PlayerTextDrawSetProportional(playerid, Market_ProductName[playerid][i], 1);
			PlayerTextDrawSetSelectable(playerid, Market_ProductName[playerid][i], 0);
			PlayerTextDrawShow(playerid, Market_ProductName[playerid][i]);
		}


		Market_ProductPrice[playerid][i] = CreatePlayerTextDraw(playerid, BasePriceX, BasePriceY, sprintf("~g~$%i", MarketData[i][ItemPrice]));
		PlayerTextDrawFont(playerid, Market_ProductPrice[playerid][i], 1);
		PlayerTextDrawLetterSize(playerid, Market_ProductPrice[playerid][i], 0.233332, 1.349999);
		PlayerTextDrawTextSize(playerid, Market_ProductPrice[playerid][i], 220.500000, 29.500000);
		PlayerTextDrawSetOutline(playerid, Market_ProductPrice[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, Market_ProductPrice[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, Market_ProductPrice[playerid][i], 2);
		PlayerTextDrawColor(playerid, Market_ProductPrice[playerid][i], -1);
		PlayerTextDrawBackgroundColor(playerid, Market_ProductPrice[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, Market_ProductPrice[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, Market_ProductPrice[playerid][i], 0);
		PlayerTextDrawSetProportional(playerid, Market_ProductPrice[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, Market_ProductPrice[playerid][i], 0);
		PlayerTextDrawShow(playerid, Market_ProductPrice[playerid][i]);

		right_tracker++;
		if(right_tracker == (first_row < 2 ? 2 : 4)) right_tracker = 0, down_tracker = 1;
	}

	SetPVarInt(playerid, "Viewing_StoreList", 1);
	SetPVarInt(playerid, "PriceCount", 0);
	return 1;
}

Player_PurchaseItem(playerid, type)
{
	switch(type)
	{
	    case 0: PlayerData[playerid][pGascan]++;
	    case 1: PlayerData[playerid][pHasBoombox] = true;
	    case 2: GivePlayerWeapon(playerid, 5, 1);
	    case 3: GivePlayerWeapon(playerid, 14, 1);
	    case 4: GivePlayerWeapon(playerid, 15, 1);
		case 5: GivePlayerWeapon(playerid, 43, 9999);
		case 6: PlayerData[playerid][pHasMask] = true;
		case 7: PlayerData[playerid][pDrinks]++;
		case 8: PlayerData[playerid][pCigarettes]++;
		case 9: PlayerData[playerid][pHasRadio] = true;
	}
	return 1;
}

Weapon_GetSlotID(weaponid)
{
	switch(weaponid)
	{
		case 1..10: return 0;
		case 11..18, 41, 43: return 1;
		case 22..24: return 2;
		case 25..34: return 3;
	}
	return -1;
}

Player_RemoveWeapon(playerid, weaponid)
{
	if(!IsPlayerConnected(playerid) || weaponid < 0 || weaponid > 50)
	    return 1;

	new saveweapon[13], saveammo[13];
	for(new slot = 0; slot < 13; slot++)
	    GetPlayerWeaponData(playerid, slot, saveweapon[slot], saveammo[slot]);

	ResetPlayerWeapons(playerid);
	for(new slot; slot < 13; slot++)
	{
		if(saveweapon[slot] == weaponid)
			continue;

		GivePlayerWeapon(playerid, saveweapon[slot], saveammo[slot]);
	}
	return 1;
}

Player_HasWeapon(playerid, weaponid)
{
	new
		index;

	index = Weapon_GetSlotID(weaponid);
	if(index == -1) return 0;

	if(PlayerData[playerid][pWeapons][index] == weaponid)
		return 1;

	return 0;
}

/*Player_HasWeapons(playerid)
{
	new weap_count = 0;

	for(new i = 0; i < 4; i ++)
	{
		if(PlayerData[playerid][pWeapons][i] != 0) weap_count++;
	}

	if(!weap_count) return 0;
	return 1;
}*/

Weapons_Show(playerid, slotid)
{
	new returnStr[60];

	switch(slotid)
	{
		case 1:
		{
			new str_1slot[60];

			if(!PlayerData[playerid][pWeapons][0])
				str_1slot = "Yok";

			else
				format(str_1slot, 60, "%s", ReturnWeaponName(PlayerData[playerid][pWeapons][0]));

			returnStr = str_1slot;
		}
		case 2:
		{
			new str_2slot[60];

			if(!PlayerData[playerid][pWeapons][1])
				str_2slot = "Yok";

			else
				format(str_2slot, 60, "%s", ReturnWeaponName(PlayerData[playerid][pWeapons][1]));

			returnStr = str_2slot;
		}
		case 3:
		{
			new str_3slot[60];

			if(!PlayerData[playerid][pWeapons][2])
				str_3slot = "Yok";

			else
				format(str_3slot, 60, "%s", ReturnWeaponName(PlayerData[playerid][pWeapons][2]));

			returnStr = str_3slot;
		}
		case 4:
		{
			new str_4slot[60];

			if(!PlayerData[playerid][pWeapons][3])
				str_4slot = "Yok";

			else
				format(str_4slot, 60, "%s", ReturnWeaponName(PlayerData[playerid][pWeapons][3]));

			returnStr = str_4slot;
		}
	}
	return returnStr;
}

/*ReturnPlayerGuns(playerid)
{
	for(new i = 0; i < 4; i++) if(PlayerData[playerid][pWeaponsAmmo][i]) {
		GivePlayerWeapon(playerid, PlayerData[playerid][pWeapons][i], PlayerData[playerid][pWeaponsAmmo][i]);
	}
	return 1;
}*/

TakePlayerGuns(playerid)
{
	for(new i = 0; i < 4; i++) if(PlayerData[playerid][pWeaponsAmmo][i]) {
		PlayerData[playerid][pWeapons][i] = 0, PlayerData[playerid][pWeaponsAmmo][i] = 0;
	}

	ResetPlayerWeapons(playerid);
	return 1;
}

ReturnWeaponsModel(weaponid)
{
    new WeaponModels[] =
    {
        0, 331, 333, 334, 335, 336, 337, 338, 339, 341, 321, 322, 323, 324,
        325, 326, 342, 343, 344, 0, 0, 0, 346, 347, 348, 349, 350, 351, 352,
        353, 355, 356, 372, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366,
        367, 368, 368, 371
    };
    return WeaponModels[weaponid];
}

Weapon_ResetPositions(playerid)
{
    for (new i; i < 17; i++)
    {
    	WeaponSettings[playerid][i][WeaponBone] = 1;
        WeaponSettings[playerid][i][WeaponHidden] = false;
        WeaponSettings[playerid][i][WeaponPos][0] = -0.116;
        WeaponSettings[playerid][i][WeaponPos][1] = 0.189;
        WeaponSettings[playerid][i][WeaponPos][2] = 0.088;
        WeaponSettings[playerid][i][WeaponPos][3] = 0.0;
        WeaponSettings[playerid][i][WeaponPos][4] = 44.5;
        WeaponSettings[playerid][i][WeaponPos][5] = 0.0;
    }

   	PlayerConnectionTick[playerid] = 0;
	EditingDisplay[playerid] = false;
	return 1;
}

Weapon_ResetWepPos(playerid, i)
{
    WeaponSettings[playerid][i][WeaponBone] = 1;
    WeaponSettings[playerid][i][WeaponHidden] = false;
    WeaponSettings[playerid][i][WeaponPos][0] = -0.116;
    WeaponSettings[playerid][i][WeaponPos][1] = 0.189;
    WeaponSettings[playerid][i][WeaponPos][2] = 0.088;
    WeaponSettings[playerid][i][WeaponPos][3] = 0.0;
    WeaponSettings[playerid][i][WeaponPos][4] = 44.5;
    WeaponSettings[playerid][i][WeaponPos][5] = 0.0;
    return 1;
}

Weapon_SlotName(playerid, weaponid)
{
    switch(weaponid)
    {
        case 1..18: SendClientMessageEx(playerid, COLOR_DARKGREEN, "[Yakýn dövüþ silahý] Artýk %s ile oyuna baþlayacaksýn.", ReturnWeaponName(weaponid));
        case 22..24: SendClientMessageEx(playerid, COLOR_DARKGREEN, "[Ýkincil silah] Artýk %s ile oyuna baþlayacaksýn.", ReturnWeaponName(weaponid));
        case 25, 27..34: SendClientMessageEx(playerid, COLOR_DARKGREEN, "[Birincil silah] Artýk %s ile oyuna baþlayacaksýn.", ReturnWeaponName(weaponid));

    }
    return 1;
}

Weapon_SlotID(playerid, weaponid)
{
    if(playerid != INVALID_PLAYER_ID)
    {
        switch(weaponid)
        {
            case 1..18: return 1;
            case 22..24: return 2;
            case 25, 27..34: return 3;
        }
    }
    return 5;
}

stock ReturnWeaponType(id)
{
	new weapon[22];
    switch(id)
    {
        case 0 .. 24: weapon = "Yakýn dövüþ silahý";
        default: weapon = "Aðýr silah";
    }
    return weapon;
}

GetWeaponObjectSlot(weaponid)
{
	switch(weaponid)
	{
		case 1..10: return 5;
		case 11..18, 41, 43: return 6;
		case 22..24: return 7;
		case 25..34: return 8;
	}
	return -1;
}

IsWeaponWearable(weaponid)
    return (weaponid >= 22 && weaponid <= 34);

IsWeaponHideable(weaponid)
    return (weaponid >= 22 && weaponid <= 24 || weaponid == 28 || weaponid == 32);

GetNumberOfPages(id)
{
	if((id >= DEALERSHIP_PER_PAGE) && (id % DEALERSHIP_PER_PAGE) == 0)
	{
		return (id / DEALERSHIP_PER_PAGE);
	}
	else return (id / DEALERSHIP_PER_PAGE) + 1;
}

Dealership_Hide(playerid)
{
	for(new x = 0; x < DEALERSHIP_PER_PAGE; x++)
	{
	    if(Dealership_Model[playerid][x] != PlayerText:INVALID_TEXT_DRAW)
	    {
			PlayerTextDrawDestroy(playerid, Dealership_Model[playerid][x]);
			PlayerTextDrawDestroy(playerid, Dealership_Model_Name[playerid][x]);
			PlayerTextDrawDestroy(playerid, Dealership_Model_Price[playerid][x]);

			Dealership_Model[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
			Dealership_Model_Name[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
			Dealership_Model_Price[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
		}
	}

	PlayerTextDrawDestroy(playerid, Dealership_Prev_Arrow[playerid]);
   	PlayerTextDrawDestroy(playerid, Dealership_Next_Arrow[playerid]);
   	PlayerTextDrawDestroy(playerid, Dealership_Model_Cat[playerid]);
    Dealership_Prev_Arrow[playerid] = PlayerText:INVALID_TEXT_DRAW;
    Dealership_Next_Arrow[playerid] = PlayerText:INVALID_TEXT_DRAW;
   	Dealership_Model_Cat[playerid] = PlayerText:INVALID_TEXT_DRAW;
	return 1;
}

Dealership_Show(playerid, type = 0)
{
	Dealership_Hide(playerid);

	new Float: BaseX = DEALERSHIP_BASE_X,
		Float: BaseY = DEALERSHIP_BASE_Y,
		Float: BaseNameX = DEALERSHIP_NAME_BASE_X,
		Float: BaseNameY = DEALERSHIP_NAME_BASE_Y,
		Float: BasePriceX = DEALERSHIP_PRICE_BASE_X,
		Float: BasePriceY = DEALERSHIP_PRICE_BASE_Y;

	new right_tracker = 0, left_tracker = 0, nerde_cikacak = 0;

	switch(type)
	{
		case 0:
		{
			new itemat = GetPVarInt(playerid, "dealership_category_page") * DEALERSHIP_PER_PAGE;

			for(new x = 0; x < DEALERSHIP_PER_PAGE && itemat < MAX_DEALERSHIP_CAT; x++)
			{
			    if(right_tracker != 0)
			    {
			        BaseX += 120.878479;
			        BaseNameX += 120.410034;
				}

				if(left_tracker != 0)
				{
					BaseX = DEALERSHIP_BASE_X;
					BaseNameX = DEALERSHIP_NAME_BASE_X;

			        BaseY = 216.833267;
			        BaseNameY = 316.583343;
			        left_tracker = 0;
				}

				switch(x)
				{
					case 0: nerde_cikacak = 1;
					case 1: nerde_cikacak = 2;
					case 2: nerde_cikacak = 3;
				}

			    Dealership_Model[playerid][x] = CreatePlayerTextDraw(playerid, BaseX, BaseY, "");
			    PlayerTextDrawLetterSize(playerid, Dealership_Model[playerid][x], 0.000000, 0.000000);
			    PlayerTextDrawTextSize(playerid, Dealership_Model[playerid][x], 121.000000, 120.000000);
			    PlayerTextDrawAlignment(playerid, Dealership_Model[playerid][x], 1);
			    PlayerTextDrawColor(playerid, Dealership_Model[playerid][x], -1);
				PlayerTextDrawSetShadow(playerid, Dealership_Model[playerid][x], 0);
				PlayerTextDrawSetOutline(playerid, Dealership_Model[playerid][x], 0);
				PlayerTextDrawBackgroundColor(playerid, Dealership_Model[playerid][x], 0xFF634766);
				PlayerTextDrawFont(playerid, Dealership_Model[playerid][x], TEXT_DRAW_FONT_MODEL_PREVIEW);
				PlayerTextDrawSetProportional(playerid, Dealership_Model[playerid][x], 0);
				PlayerTextDrawSetPreviewModel(playerid, Dealership_Model[playerid][x], DealershipCatData[itemat][CategoryModel]);
				PlayerTextDrawSetPreviewRot(playerid, Dealership_Model[playerid][x], -15.000000, 0.000000, -45.000000, 0.899999);
				PlayerTextDrawSetPreviewVehCol(playerid, Dealership_Model[playerid][x], random(sizeof(VehicleColoursTableRGBA)), random(sizeof(VehicleColoursTableRGBA)));
				PlayerTextDrawSetSelectable(playerid, Dealership_Model[playerid][x], 1);
			    PlayerTextDrawShow(playerid, Dealership_Model[playerid][x]);

		    	Dealership_Model_Name[playerid][x] = CreatePlayerTextDraw(playerid, BaseNameX, BaseNameY, DealershipCatData[itemat][CategoryModelName]);
			    PlayerTextDrawLetterSize(playerid, Dealership_Model_Name[playerid][x], 0.459502, 2.078332);
			    PlayerTextDrawTextSize(playerid, Dealership_Model_Name[playerid][x], 0.000000, 120.000000);
			    PlayerTextDrawAlignment(playerid, Dealership_Model_Name[playerid][x], 2);
			    PlayerTextDrawColor(playerid, Dealership_Model_Name[playerid][x], -1);
			    PlayerTextDrawUseBox(playerid, Dealership_Model_Name[playerid][x], 1);
				PlayerTextDrawBoxColor(playerid, Dealership_Model_Name[playerid][x], 255);
				PlayerTextDrawSetShadow(playerid, Dealership_Model_Name[playerid][x], 0);
				PlayerTextDrawSetOutline(playerid, Dealership_Model_Name[playerid][x], 0);
				PlayerTextDrawBackgroundColor(playerid, Dealership_Model_Name[playerid][x], 255);
				PlayerTextDrawFont(playerid, Dealership_Model_Name[playerid][x], 3);
				PlayerTextDrawSetProportional(playerid, Dealership_Model_Name[playerid][x], 1);
				PlayerTextDrawSetShadow(playerid, Dealership_Model_Name[playerid][x], 0);
			    PlayerTextDrawShow(playerid, Dealership_Model_Name[playerid][x]);

		  		DealershipHolder[playerid][x] = DealershipCatData[itemat][CategoryID];
				right_tracker++;

				if(right_tracker == DEALERSHIP_PER_LINE)
				{
					right_tracker = 0;
					left_tracker = 1;
				}
				itemat++;
			}

			SetPVarInt(playerid, "Viewing_DealershipCats", 1);
			SetPVarInt(playerid, "Viewing_Dealership", 0);
		}
		case 1:
		{
			new itemat = GetPVarInt(playerid, "dealership_page") * DEALERSHIP_PER_PAGE;

			for(new x = 0; x < DEALERSHIP_PER_PAGE && itemat < GetPVarInt(playerid, "dealership_count"); x++)
			{
			    if(right_tracker != 0)
			    {
			        BaseX += 120.878479;
			        BaseNameX += 120.410034;
			       	BasePriceX += 120.410034;
				}

				if(left_tracker != 0)
				{
					BaseX = DEALERSHIP_BASE_X;
					BaseNameX = DEALERSHIP_NAME_BASE_X;
					BasePriceX = DEALERSHIP_PRICE_BASE_X;

			        BaseY = 216.833267;
			        BaseNameY = 316.583343;
			        BasePriceY = 240.00;
			        left_tracker = 0;
				}

				switch(x)
				{
					case 0: nerde_cikacak = 1;
					case 1: nerde_cikacak = 2;
					case 2: nerde_cikacak = 3;
				}

				Dealership_Model[playerid][x] = CreatePlayerTextDraw(playerid, BaseX, BaseY, "");
			    PlayerTextDrawLetterSize(playerid, Dealership_Model[playerid][x], 0.000000, 0.000000);
			    PlayerTextDrawTextSize(playerid, Dealership_Model[playerid][x], 121.000000, 120.000000);
			    PlayerTextDrawAlignment(playerid, Dealership_Model[playerid][x], 1);
			    PlayerTextDrawColor(playerid, Dealership_Model[playerid][x], -1);
				PlayerTextDrawSetShadow(playerid, Dealership_Model[playerid][x], 0);
				PlayerTextDrawSetOutline(playerid, Dealership_Model[playerid][x], 0);
				PlayerTextDrawBackgroundColor(playerid, Dealership_Model[playerid][x], 0xFF634766);
				PlayerTextDrawFont(playerid, Dealership_Model[playerid][x], TEXT_DRAW_FONT_MODEL_PREVIEW);
				PlayerTextDrawSetProportional(playerid, Dealership_Model[playerid][x], 0);
				PlayerTextDrawSetPreviewModel(playerid, Dealership_Model[playerid][x], DealershipPData[itemat][DealershipModel]);
				PlayerTextDrawSetPreviewRot(playerid, Dealership_Model[playerid][x], -15.000000, 0.000000, -45.000000, 0.899999);
				PlayerTextDrawSetPreviewVehCol(playerid, Dealership_Model[playerid][x], random(sizeof(VehicleColoursTableRGBA)), random(sizeof(VehicleColoursTableRGBA)));
				PlayerTextDrawSetSelectable(playerid, Dealership_Model[playerid][x], 1);
			    PlayerTextDrawShow(playerid, Dealership_Model[playerid][x]);

		    	Dealership_Model_Name[playerid][x] = CreatePlayerTextDraw(playerid, BaseNameX, BaseNameY, sprintf("%s", DealershipPData[itemat][DealershipModelName]));
			    PlayerTextDrawLetterSize(playerid, Dealership_Model_Name[playerid][x], 0.459502, 2.078332);
			    PlayerTextDrawTextSize(playerid, Dealership_Model_Name[playerid][x], 0.000000, 120.000000);
			    PlayerTextDrawAlignment(playerid, Dealership_Model_Name[playerid][x], 2);
			    PlayerTextDrawColor(playerid, Dealership_Model_Name[playerid][x], -1);
			    PlayerTextDrawUseBox(playerid, Dealership_Model_Name[playerid][x], 1);
				PlayerTextDrawBoxColor(playerid, Dealership_Model_Name[playerid][x], 255);
				PlayerTextDrawSetShadow(playerid, Dealership_Model_Name[playerid][x], 0);
				PlayerTextDrawSetOutline(playerid, Dealership_Model_Name[playerid][x], 0);
				PlayerTextDrawBackgroundColor(playerid, Dealership_Model_Name[playerid][x], 255);
				PlayerTextDrawFont(playerid, Dealership_Model_Name[playerid][x], 3);
				PlayerTextDrawSetProportional(playerid, Dealership_Model_Name[playerid][x], 1);
				PlayerTextDrawSetShadow(playerid, Dealership_Model_Name[playerid][x], 0);
			    PlayerTextDrawShow(playerid, Dealership_Model_Name[playerid][x]);

			   	Dealership_Model_Price[playerid][x] = CreatePlayerTextDraw(playerid, BasePriceX, BasePriceY, sprintf("$%s", MoneyFormat(DealershipPData[itemat][DealershipPrice])));
			    PlayerTextDrawLetterSize(playerid, Dealership_Model_Price[playerid][x], 0.459502, 2.078332);
			    PlayerTextDrawTextSize(playerid, Dealership_Model_Price[playerid][x], 0.000000, 120.000000);
			    PlayerTextDrawAlignment(playerid, Dealership_Model_Price[playerid][x], 2);
			    PlayerTextDrawColor(playerid, Dealership_Model_Price[playerid][x], -1);
				PlayerTextDrawSetShadow(playerid, Dealership_Model_Price[playerid][x], 0);
				PlayerTextDrawSetOutline(playerid, Dealership_Model_Price[playerid][x], 0);
				PlayerTextDrawBackgroundColor(playerid, Dealership_Model_Price[playerid][x], 255);
				PlayerTextDrawFont(playerid, Dealership_Model_Price[playerid][x], 1);
				PlayerTextDrawSetProportional(playerid, Dealership_Model_Price[playerid][x], 1);
				PlayerTextDrawSetShadow(playerid, Dealership_Model_Price[playerid][x], 0);
			    PlayerTextDrawShow(playerid, Dealership_Model_Price[playerid][x]);

		  		DealershipHolder[playerid][x] = DealershipPData[itemat][DealershipModel];
				right_tracker++;

				if(right_tracker == DEALERSHIP_PER_LINE)
				{
					right_tracker = 0;
					left_tracker = 1;
				}
				itemat++;
			}

			SetPVarInt(playerid, "Viewing_DealershipCats", 0);
			SetPVarInt(playerid, "Viewing_Dealership", 1);

			Dealership_Model_Cat[playerid] = CreatePlayerTextDraw(playerid, 150.00, 90.0, sprintf("%s", DealershipCatData[DealershipPData[GetPVarInt(playerid, "dealership_page") * DEALERSHIP_PER_PAGE][DealershipCategory]-1][CategoryModelName]));
		    PlayerTextDrawLetterSize(playerid, Dealership_Model_Cat[playerid], 0.459502, 2.078332);
		    PlayerTextDrawTextSize(playerid, Dealership_Model_Cat[playerid], 0.000000, 120.000000);
		    PlayerTextDrawAlignment(playerid, Dealership_Model_Cat[playerid], 2);
		    PlayerTextDrawColor(playerid, Dealership_Model_Cat[playerid], -1);
		    PlayerTextDrawUseBox(playerid, Dealership_Model_Cat[playerid], 1);
			PlayerTextDrawBoxColor(playerid, Dealership_Model_Cat[playerid], 255);
			PlayerTextDrawSetShadow(playerid, Dealership_Model_Cat[playerid], 0);
			PlayerTextDrawSetOutline(playerid, Dealership_Model_Cat[playerid], 0);
			PlayerTextDrawBackgroundColor(playerid, Dealership_Model_Cat[playerid], 255);
			PlayerTextDrawFont(playerid, Dealership_Model_Cat[playerid], 3);
			PlayerTextDrawSetProportional(playerid, Dealership_Model_Cat[playerid], 1);
			PlayerTextDrawSetShadow(playerid, Dealership_Model_Cat[playerid], 0);
		    PlayerTextDrawShow(playerid, Dealership_Model_Cat[playerid]);
		}
	}

   	Dealership_Prev_Arrow[playerid] = CreatePlayerTextDraw(playerid, 47.606147, 188.833297, "LD_BEAT:LEFT");
   	PlayerTextDrawLetterSize(playerid, Dealership_Prev_Arrow[playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Dealership_Prev_Arrow[playerid], 44.000000, 45.000000);
	PlayerTextDrawAlignment(playerid, Dealership_Prev_Arrow[playerid], 1);
    PlayerTextDrawColor(playerid, Dealership_Prev_Arrow[playerid], -1);
	PlayerTextDrawSetShadow(playerid, Dealership_Prev_Arrow[playerid], 0);
    PlayerTextDrawSetOutline(playerid, Dealership_Prev_Arrow[playerid], 0);
   	PlayerTextDrawBackgroundColor(playerid, Dealership_Prev_Arrow[playerid], 255);
	PlayerTextDrawSetProportional(playerid, Dealership_Prev_Arrow[playerid], 0);
	PlayerTextDrawFont(playerid, Dealership_Prev_Arrow[playerid], 4);
    PlayerTextDrawSetSelectable(playerid, Dealership_Prev_Arrow[playerid], 1);
    PlayerTextDrawShow(playerid, Dealership_Prev_Arrow[playerid]);

   	Dealership_Next_Arrow[playerid] = CreatePlayerTextDraw(playerid, Dealership_LocateX(nerde_cikacak), 188.833297, "LD_BEAT:RIGHT");
   	PlayerTextDrawLetterSize(playerid, Dealership_Next_Arrow[playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Dealership_Next_Arrow[playerid], 44.000000, 45.000000);
	PlayerTextDrawAlignment(playerid, Dealership_Next_Arrow[playerid], 1);
    PlayerTextDrawColor(playerid, Dealership_Next_Arrow[playerid], -1);
	PlayerTextDrawSetShadow(playerid, Dealership_Next_Arrow[playerid], 0);
    PlayerTextDrawSetOutline(playerid, Dealership_Next_Arrow[playerid], 0);
   	PlayerTextDrawBackgroundColor(playerid, Dealership_Next_Arrow[playerid], 255);
	PlayerTextDrawSetProportional(playerid, Dealership_Next_Arrow[playerid], 0);
	PlayerTextDrawFont(playerid, Dealership_Next_Arrow[playerid], 4);
    PlayerTextDrawSetSelectable(playerid, Dealership_Next_Arrow[playerid], 1);
    PlayerTextDrawShow(playerid, Dealership_Next_Arrow[playerid]);
    return 1;
}

Dealership_LocateX(id)
{
	new position;
	switch(id)
	{
		case 1: position = 192;
		case 2: position = 310;
		default: position = 431;
	}
	return position;
}

HandlePlayerItemSelection(playerid, selecteditem)
{
	Dealership_Hide(playerid);

	new
		query[200];

	mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM dealerships WHERE VehicleCategory = %i", selecteditem);
	new Cache:cache = mysql_query(m_Handle, query);

	for(new i = 0, j = cache_num_rows(); i < j; i++)
	{
		cache_get_value_name_int(i, "id", DealershipPData[i][DealershipID]);
		cache_get_value_name_int(i, "VehicleCategory", DealershipPData[i][DealershipCategory]);
		cache_get_value_name(i, "VehicleName", DealershipPData[i][DealershipModelName], 45);
		cache_get_value_name_int(i, "VehicleModel", DealershipPData[i][DealershipModel]);
		cache_get_value_name_int(i, "VehiclePrice", DealershipPData[i][DealershipPrice]);
		cache_get_value_name_int(i, "VehicleEnabled", DealershipPData[i][DealershipIsEnabled]);
	}

    SetPVarInt(playerid, "dealership_count", cache_num_rows());
	SetPVarInt(playerid, "dealership_page", 0);

    Dealership_Show(playerid, 1);
    SelectTextDraw(playerid, COLOR_DARKGREEN);
    cache_delete(cache);
    return 1;
}

PlayerVehicles_Hide(playerid)
{
	for(new x = 0; x < DEALERSHIP_PER_PAGE; x++)
	{
	    if(Dealership_Model[playerid][x] != PlayerText:INVALID_TEXT_DRAW)
	    {
			PlayerTextDrawDestroy(playerid, Dealership_Model[playerid][x]);
			PlayerTextDrawDestroy(playerid, Dealership_Model_Name[playerid][x]);

			Dealership_Model[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
			Dealership_Model_Name[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
		}
	}

	PlayerTextDrawDestroy(playerid, Dealership_Prev_Arrow[playerid]);
   	PlayerTextDrawDestroy(playerid, Dealership_Next_Arrow[playerid]);
    Dealership_Prev_Arrow[playerid] = PlayerText:INVALID_TEXT_DRAW;
    Dealership_Next_Arrow[playerid] = PlayerText:INVALID_TEXT_DRAW;
	return 1;
}

PlayerVehicles_Show(playerid)
{
	PlayerVehicles_Hide(playerid);

	new Float: BaseX = DEALERSHIP_BASE_X,
		Float: BaseY = DEALERSHIP_BASE_Y,
		Float: BaseNameX = DEALERSHIP_NAME_BASE_X,
		Float: BaseNameY = DEALERSHIP_NAME_BASE_Y;

	new right_tracker = 0, left_tracker = 0, nerde_cikacak = 0;
	new itemat = GetPVarInt(playerid, "playervehicles_page") * DEALERSHIP_PER_PAGE;

	for(new x = 0; x < DEALERSHIP_PER_PAGE && itemat < GetPVarInt(playerid, "playervehicles_count"); x++)
	{
	    if(right_tracker != 0)
	    {
	        BaseX += 120.878479;
	        BaseNameX += 120.410034;
		}

		if(left_tracker != 0)
		{
			BaseX = DEALERSHIP_BASE_X;
			BaseNameX = DEALERSHIP_NAME_BASE_X;

	        BaseY = 216.833267;
	        BaseNameY = 316.583343;
	        left_tracker = 0;
		}

		switch(x)
		{
			case 0: nerde_cikacak = 1;
			case 1: nerde_cikacak = 2;
			case 2: nerde_cikacak = 3;
		}

	    Dealership_Model[playerid][x] = CreatePlayerTextDraw(playerid, BaseX, BaseY, "");
	    PlayerTextDrawLetterSize(playerid, Dealership_Model[playerid][x], 0.000000, 0.000000);
	    PlayerTextDrawTextSize(playerid, Dealership_Model[playerid][x], 121.000000, 120.000000);
	    PlayerTextDrawAlignment(playerid, Dealership_Model[playerid][x], 1);
	    PlayerTextDrawColor(playerid, Dealership_Model[playerid][x], -1);
		PlayerTextDrawSetShadow(playerid, Dealership_Model[playerid][x], 0);
		PlayerTextDrawSetOutline(playerid, Dealership_Model[playerid][x], 0);
		PlayerTextDrawBackgroundColor(playerid, Dealership_Model[playerid][x], 0xFF634766);
		PlayerTextDrawFont(playerid, Dealership_Model[playerid][x], TEXT_DRAW_FONT_MODEL_PREVIEW);
		PlayerTextDrawSetProportional(playerid, Dealership_Model[playerid][x], 0);
		PlayerTextDrawSetPreviewModel(playerid, Dealership_Model[playerid][x], PlayerVehicles_GetInt(playerid, "ModelID", itemat+1));
		PlayerTextDrawSetPreviewRot(playerid, Dealership_Model[playerid][x], -15.000000, 0.000000, -45.000000, 0.899999);
		PlayerTextDrawSetPreviewVehCol(playerid, Dealership_Model[playerid][x], PlayerVehicles_GetInt(playerid, "Color1", itemat+1), PlayerVehicles_GetInt(playerid, "Color2", itemat+1));
		PlayerTextDrawSetSelectable(playerid, Dealership_Model[playerid][x], 1);
	    PlayerTextDrawShow(playerid, Dealership_Model[playerid][x]);

    	Dealership_Model_Name[playerid][x] = CreatePlayerTextDraw(playerid, BaseNameX, BaseNameY, PlayerVehicles_GetVarchar(playerid, "VehicleName", itemat+1));
	    PlayerTextDrawLetterSize(playerid, Dealership_Model_Name[playerid][x], 0.459502, 2.078332);
	    PlayerTextDrawTextSize(playerid, Dealership_Model_Name[playerid][x], 0.000000, 120.000000);
	    PlayerTextDrawAlignment(playerid, Dealership_Model_Name[playerid][x], 2);
	    PlayerTextDrawColor(playerid, Dealership_Model_Name[playerid][x], -1);
	    PlayerTextDrawUseBox(playerid, Dealership_Model_Name[playerid][x], 1);
		PlayerTextDrawBoxColor(playerid, Dealership_Model_Name[playerid][x], 255);
		PlayerTextDrawSetShadow(playerid, Dealership_Model_Name[playerid][x], 0);
		PlayerTextDrawSetOutline(playerid, Dealership_Model_Name[playerid][x], 0);
		PlayerTextDrawBackgroundColor(playerid, Dealership_Model_Name[playerid][x], 255);
		PlayerTextDrawFont(playerid, Dealership_Model_Name[playerid][x], 3);
		PlayerTextDrawSetProportional(playerid, Dealership_Model_Name[playerid][x], 1);
		PlayerTextDrawSetShadow(playerid, Dealership_Model_Name[playerid][x], 0);
	    PlayerTextDrawShow(playerid, Dealership_Model_Name[playerid][x]);

  		DealershipHolder[playerid][x] = itemat+1;
		right_tracker++;

		if(right_tracker == DEALERSHIP_PER_LINE)
		{
			right_tracker = 0;
			left_tracker = 1;
		}
		itemat++;
	}

	SetPVarInt(playerid, "Viewing_OwnedCarList", 1);

   	Dealership_Prev_Arrow[playerid] = CreatePlayerTextDraw(playerid, 47.606147, 188.833297, "LD_BEAT:LEFT");
   	PlayerTextDrawLetterSize(playerid, Dealership_Prev_Arrow[playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Dealership_Prev_Arrow[playerid], 44.000000, 45.000000);
	PlayerTextDrawAlignment(playerid, Dealership_Prev_Arrow[playerid], 1);
    PlayerTextDrawColor(playerid, Dealership_Prev_Arrow[playerid], -1);
	PlayerTextDrawSetShadow(playerid, Dealership_Prev_Arrow[playerid], 0);
    PlayerTextDrawSetOutline(playerid, Dealership_Prev_Arrow[playerid], 0);
   	PlayerTextDrawBackgroundColor(playerid, Dealership_Prev_Arrow[playerid], 255);
	PlayerTextDrawSetProportional(playerid, Dealership_Prev_Arrow[playerid], 0);
	PlayerTextDrawFont(playerid, Dealership_Prev_Arrow[playerid], 4);
    PlayerTextDrawSetSelectable(playerid, Dealership_Prev_Arrow[playerid], 1);
    PlayerTextDrawShow(playerid, Dealership_Prev_Arrow[playerid]);

   	Dealership_Next_Arrow[playerid] = CreatePlayerTextDraw(playerid, Dealership_LocateX(nerde_cikacak), 188.833297, "LD_BEAT:RIGHT");
   	PlayerTextDrawLetterSize(playerid, Dealership_Next_Arrow[playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, Dealership_Next_Arrow[playerid], 44.000000, 45.000000);
	PlayerTextDrawAlignment(playerid, Dealership_Next_Arrow[playerid], 1);
    PlayerTextDrawColor(playerid, Dealership_Next_Arrow[playerid], -1);
	PlayerTextDrawSetShadow(playerid, Dealership_Next_Arrow[playerid], 0);
    PlayerTextDrawSetOutline(playerid, Dealership_Next_Arrow[playerid], 0);
   	PlayerTextDrawBackgroundColor(playerid, Dealership_Next_Arrow[playerid], 255);
	PlayerTextDrawSetProportional(playerid, Dealership_Next_Arrow[playerid], 0);
	PlayerTextDrawFont(playerid, Dealership_Next_Arrow[playerid], 4);
    PlayerTextDrawSetSelectable(playerid, Dealership_Next_Arrow[playerid], 1);
    PlayerTextDrawShow(playerid, Dealership_Next_Arrow[playerid]);
    return 1;
}

PlayerVehicles_GetInt(playerid, column[], index)
{
	new query[64], sonuc;
	mysql_format(m_Handle, query, sizeof(query), "SELECT %s FROM vehicles WHERE id = %i", column, PlayerData[playerid][pOwnedCar][index]);
	new Cache:cache = mysql_query(m_Handle, query);
	cache_get_value_index_int(0, 0, sonuc);
	cache_delete(cache);
	return sonuc;
}

PlayerVehicles_GetVarchar(playerid, column[], index)
{
	new query[84], sonuc[24];
	mysql_format(m_Handle, query, sizeof(query), "SELECT %s FROM vehicles WHERE id = %i", column, PlayerData[playerid][pOwnedCar][index]);
	new Cache:cache = mysql_query(m_Handle, query);
	cache_get_value_index(0, 0, sonuc);
	cache_delete(cache);
	return sonuc;
}

Property_ListDrugs(playerid, id, bool:readonly)
{
	new principal_str[756];

	for(new i = 1; i < MAX_PACK_SLOT; i++)
	{
		if(property_drug_data[id][i][is_exist])
			format(principal_str, sizeof(principal_str), "%s%i. %s - %s (%s: %0.1fg/%i.0g) (Kalite: %i)\n", principal_str, i, property_drug_data[id][i][prop_drug_name], Drug_GetType(property_drug_data[id][i][prop_drug_size]), Drug_GetName(property_drug_data[id][i][prop_drug_id]), property_drug_data[id][i][prop_drug_amount], Drug_GetMaxAmount(property_drug_data[id][i][prop_drug_size]), property_drug_data[id][i][prop_drug_quality]);
		else
			format(principal_str, sizeof(principal_str), "%s%i. [Boþ]\n", principal_str, i);
	}

	if(readonly) Dialog_Show(playerid, DIALOG_DEFAULT, DIALOG_STYLE_LIST, "Ev: Uyuþturucular", principal_str, "<<", "");
	else Dialog_Show(playerid, HOUSE_DRUGS, DIALOG_STYLE_LIST, "Ev: Uyuþturucular", principal_str, "Al", "<<");
	return 1;
}

GetPropertyDrugs(prop_id)
{
	new count = 0;
	for(new i = 1; i < MAX_PACK_SLOT; i++)
	{
		if(property_drug_data[prop_id][i][property_id] != -1)
		{
			count++;
		}
	}
	return count;
}

GetNextPropertyDrugSlot(prop_id)
{
	new i = 1;
	while(i != MAX_PACK_SLOT)
	{
		if(property_drug_data[prop_id][i][property_id] == -1)
		{
			return i;
		}
		i++;
	}
	return -1;
}

ListPropertyWeaps(playerid, prop_id)
{
	new principal_str[354];
	for(new i = 1; i < MAX_PACK_SLOT; i++)
	{
		if(property_weap_data[prop_id][i][is_exist])
			format(principal_str, sizeof(principal_str), "%s%i. %s[Mermi: %i]\n", principal_str, i, ReturnWeaponName(property_weap_data[prop_id][i][prop_wep]), property_weap_data[prop_id][i][prop_ammo]);
		else
			format(principal_str, sizeof(principal_str), "%s%i. [Boþ]\n", principal_str, i);
	}
	Dialog_Show(playerid, DIALOG_DEFAULT, DIALOG_STYLE_LIST, "Ev: Silahlar", principal_str, "<<", "");
	return 1;
}

RemoveWeaponFromProperty(playerid, prop_id, slot)
{
	GivePlayerWeapon(playerid, property_weap_data[prop_id][slot][prop_wep], property_weap_data[prop_id][slot][prop_ammo]);
	cmd_ame(playerid, sprintf("evin zulasýndan %s alýr.", ReturnWeaponName(property_weap_data[prop_id][slot][prop_wep])));

	new remove_query[64];
	mysql_format(m_Handle, remove_query, sizeof(remove_query), "DELETE FROM property_weapons WHERE id = %i", property_weap_data[prop_id][slot][data_id]);
	mysql_tquery(m_Handle, remove_query);

    property_weap_data[prop_id][slot][data_id] = EOS;
	property_weap_data[prop_id][slot][prop_wep] = 0;
    property_weap_data[prop_id][slot][prop_ammo] = 0;
    property_weap_data[prop_id][slot][is_exist] = false;
	return 1;
}

GetPropertyWeps(prop_id)
{
	new count = 0;
	for(new i = 1; i < MAX_PACK_SLOT; i++)
	{
		if(property_weap_data[prop_id][i][prop_wep])
		{
			count++;
		}
	}
	return count;
}

GetNextPropertyWeapSlot(prop_id)
{
	new i = 1;
	while(i != MAX_PACK_SLOT)
	{
		if(property_weap_data[prop_id][i][prop_wep] == 0)
		{
			return i;
		}
		i++;
	}
	return -1;
}

Property_Count(playerid)
{
	new sayi = 0;
	foreach(new i : Properties) if(PropertyData[i][PropertyOwnerID] == PlayerData[playerid][pSQLID]) sayi++;
	return sayi;
}

IsPlayerInProperty(playerid)
{
	new apt = PlayerData[playerid][pInsideApartment], house = PlayerData[playerid][pInsideHouse], complex = PlayerData[playerid][pInsideComplex];
	if(apt == -1 && complex == -1 && house > -1) return house;
	if(house == -1 && complex == -1 && apt > -1) return apt;
	if(apt == -1 && house == -1 && complex > -1) return complex;
	return -1;
}

IsPlayerNearProperty(playerid)
{
	if(GetPVarInt(playerid, "AtHouse") != -1)
	{
		new h = GetPVarInt(playerid, "AtHouse");
		if(IsPlayerInRangeOfPoint(playerid, 3.0, PropertyData[h][PropertyEnter][0], PropertyData[h][PropertyEnter][1], PropertyData[h][PropertyEnter][2]))
		{
			return h;
		}
	}
	return -1;
}

Property_Create(playerid, type)
{
	new id = Iter_Free(Properties);
   	if (id == -1) return SendErrorMessage(playerid, "Maksimum eklenebilecek ev sýnýrýna ulaþýlmýþ.");

	GetPlayerPos(playerid, PropertyData[id][PropertyEnter][0], PropertyData[id][PropertyEnter][1], PropertyData[id][PropertyEnter][2]);
	GetPlayerFacingAngle(playerid, PropertyData[id][PropertyEnter][3]);

	GetPlayerPos(playerid, PropertyData[id][PropertyExit][0], PropertyData[id][PropertyExit][1], PropertyData[id][PropertyExit][2]);
	GetPlayerFacingAngle(playerid, PropertyData[id][PropertyExit][3]);

	switch(type)
	{
		case 2:
		{
			PropertyData[id][PropertyEnterInterior] = GetPlayerInterior(playerid);
			PropertyData[playerid][PropertyEnterWorld] = 50000+random(9999);

			PropertyData[id][PropertyComplexLink] = PlayerData[playerid][pInsideComplex];
			PropertyData[id][PropertyExitInterior] = PropertyData[PropertyData[id][PropertyComplexLink]][PropertyExitInterior];
			PropertyData[id][PropertyExitWorld] = PropertyData[PropertyData[id][PropertyComplexLink]][PropertyExitWorld];
		}
		default:
		{
			PropertyData[id][PropertyEnterInterior] = 0;
			PropertyData[id][PropertyEnterWorld] = 0;

			PropertyData[id][PropertyExitInterior] = GetPlayerInterior(playerid);
			PropertyData[id][PropertyExitWorld] = 50000+random(9999);
		}
	}

	PropertyData[id][PropertyOwnerID] = 0;
	PropertyData[id][PropertyType] = type;
	PropertyData[id][PropertyMarketPrice] = 50000;
	PropertyData[id][PropertyFaction] = -1;
	PropertyData[id][PropertyLevel] = 5;
	PropertyData[id][PropertyMoney] = 0;
	PropertyData[id][PropertyLocked] = true;
	PropertyData[id][PropertyRentable] = false;
	PropertyData[id][PropertyHasXMR] = false;
	PropertyData[id][PropertyRentPrice] = 20;
	PropertyData[id][PropertySwitchID] = -1;
	PropertyData[id][PropertySwitch] = false;
	PropertyData[id][PropertyTime] = 12;
	PropertyData[id][PropertyLights] = false;
	Iter_Add(Properties, id);

	SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý %s ekledin.", id, Property_Type(id));
    mysql_tquery(m_Handle, "INSERT INTO properties (Money) VALUES(0)", "OnPropertyCreated", "d", id);
	Property_Refresh(id);
	return 1;
}

Property_Save(id)
{
	new
	    query[545];

	mysql_format(m_Handle, query, sizeof(query), "UPDATE properties SET OwnerSQL = %i, Type = %i, ComplexID = %i, Faction = %i, Level = %i, Money = %i WHERE id = %i",
	    PropertyData[id][PropertyOwnerID],
	    PropertyData[id][PropertyType],
	    PropertyData[id][PropertyComplexLink],
	    PropertyData[id][PropertyFaction],
	    PropertyData[id][PropertyLevel],
	    PropertyData[id][PropertyMoney],
	    PropertyData[id][PropertyID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE properties SET ExteriorX = %f, ExteriorY = %f, ExteriorZ = %f, ExteriorA = %f, ExteriorID = %i, ExteriorWorld = %i WHERE id = %i",
	    PropertyData[id][PropertyEnter][0],
	    PropertyData[id][PropertyEnter][1],
	    PropertyData[id][PropertyEnter][2],
	    PropertyData[id][PropertyEnter][3],
	    PropertyData[id][PropertyEnterInterior],
	    PropertyData[id][PropertyEnterWorld],
	    PropertyData[id][PropertyID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE properties SET InteriorX = %f, InteriorY = %f, InteriorZ = %f, InteriorA = %f, InteriorID = %i, InteriorWorld = %i WHERE id = %i",
	    PropertyData[id][PropertyExit][0],
	    PropertyData[id][PropertyExit][1],
	    PropertyData[id][PropertyExit][2],
	    PropertyData[id][PropertyExit][3],
	    PropertyData[id][PropertyExitInterior],
	    PropertyData[id][PropertyExitWorld],
	    PropertyData[id][PropertyID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE properties SET CheckPosX = %f, CheckPosY = %f, CheckPosZ = %f, CheckID = %i, CheckWorld = %i, Time = %i, Lights = %i WHERE id = %i",
	    PropertyData[id][PropertyCheck][0],
	    PropertyData[id][PropertyCheck][1],
	    PropertyData[id][PropertyCheck][2],
	    PropertyData[id][PropertyCheckInterior],
	    PropertyData[id][PropertyCheckWorld],
	    PropertyData[id][PropertyTime],
	    bool: PropertyData[id][PropertyLights],
	    PropertyData[id][PropertyID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE properties SET MarketPrice = %i, RentPrice = %i, Rentable = %i, Locked = %i, HasXMR = %i, BareSwitch = %i, BareType = %i, XMRPosX = %f, XMRPosY = %f, XMRPosZ = %f, XMRRotX = %f, XMRRotY = %f, XMRRotZ = %f WHERE id = %i",
	    PropertyData[id][PropertyMarketPrice],
	    PropertyData[id][PropertyRentPrice],
	    PropertyData[id][PropertyRentable],
	    PropertyData[id][PropertyLocked],
	    PropertyData[id][PropertyHasXMR],
	    PropertyData[id][PropertySwitchID],
	    PropertyData[id][PropertySwitch],
	   	PropertyData[id][PropertyXMR][0],
	    PropertyData[id][PropertyXMR][1],
	    PropertyData[id][PropertyXMR][2],
	   	PropertyData[id][PropertyXMR][3],
	    PropertyData[id][PropertyXMR][4],
	    PropertyData[id][PropertyXMR][5],
	    PropertyData[id][PropertyID]
	);
	mysql_tquery(m_Handle, query);

	for(new i = 1; i < MAX_PACK_SLOT; ++i)
	{
		if(!property_drug_data[id][i][is_exist]) continue;

		mysql_format(m_Handle, query, sizeof(query), "UPDATE property_drugs SET drug_name = '%e', drug_type = %i, drug_amount = %f, drug_quality = %i, drug_size = %i WHERE id = %i",
			property_drug_data[id][i][prop_drug_name],
			property_drug_data[id][i][prop_drug_id],
			property_drug_data[id][i][prop_drug_amount],
			property_drug_data[id][i][prop_drug_quality],
			property_drug_data[id][i][prop_drug_size],
			property_drug_data[id][i][data_id]
		);
		mysql_tquery(m_Handle, query);
	}

	return 1;
}

Property_Refresh(id)
{
	if(IsValidDynamicPickup(PropertyData[id][PropertyPickup])) DestroyDynamicPickup(PropertyData[id][PropertyPickup]);
 	if(IsValidDynamicObject(PropertyData[id][PropertyXMRObject])) DestroyDynamicObject(PropertyData[id][PropertyXMRObject]);
 	if(IsValidDynamic3DTextLabel(PropertyData[id][PropertyMarketLabel])) DestroyDynamic3DTextLabel(PropertyData[id][PropertyMarketLabel]);

	if(IsValidDynamicArea(PropertyData[id][PropertyAreaID][0])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, PropertyData[id][PropertyAreaID][0], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(PropertyData[id][PropertyAreaID][0]);
	}

	if (IsValidDynamicArea(PropertyData[id][PropertyAreaID][1])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, PropertyData[id][PropertyAreaID][1], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(PropertyData[id][PropertyAreaID][1]);
	}

	switch(PropertyData[id][PropertyType])
	{
	    case 1:
	    {
 			format(PropertyData[id][PropertyAddress], MAX_PROPERTY_ADDRESS, "%i %s, %s, %s %i, San Andreas", id, GetStreet(PropertyData[id][PropertyEnter][0], PropertyData[id][PropertyEnter][1], PropertyData[id][PropertyEnter][2]), GetZoneName(PropertyData[id][PropertyEnter][0], PropertyData[id][PropertyEnter][1], PropertyData[id][PropertyEnter][2]), GetCityName(PropertyData[id][PropertyEnter][0], PropertyData[id][PropertyEnter][1], PropertyData[id][PropertyEnter][2]), ReturnAreaCode(GetZoneID(PropertyData[id][PropertyEnter][0], PropertyData[id][PropertyEnter][1], PropertyData[id][PropertyEnter][2])));
	  		PropertyData[id][PropertyPickup] = CreateDynamicPickup(1314, 1, PropertyData[id][PropertyEnter][0], PropertyData[id][PropertyEnter][1], PropertyData[id][PropertyEnter][2]);
	    }
	    case 2:
	    {
		    new link = PropertyData[id][PropertyComplexLink];
		    format(PropertyData[id][PropertyAddress], MAX_PROPERTY_ADDRESS, "%i %s, %s, %s %i, San Andreas", id, GetStreet(PropertyData[link][PropertyEnter][0], PropertyData[link][PropertyEnter][1], PropertyData[link][PropertyEnter][2]), GetZoneName(PropertyData[link][PropertyEnter][0], PropertyData[link][PropertyEnter][1], PropertyData[link][PropertyEnter][2]), GetCityName(PropertyData[link][PropertyEnter][0], PropertyData[link][PropertyEnter][1], PropertyData[link][PropertyEnter][2]), ReturnAreaCode(GetZoneID(PropertyData[link][PropertyEnter][0], PropertyData[link][PropertyEnter][1], PropertyData[link][PropertyEnter][2])));
	    }
		case 3: format(PropertyData[id][PropertyAddress], MAX_PROPERTY_ADDRESS, "%i %s, %s, %s %i, San Andreas", id, GetStreet(PropertyData[id][PropertyEnter][0], PropertyData[id][PropertyEnter][1], PropertyData[id][PropertyEnter][2]), GetZoneName(PropertyData[id][PropertyEnter][0], PropertyData[id][PropertyEnter][1], PropertyData[id][PropertyEnter][2]), GetCityName(PropertyData[id][PropertyEnter][0], PropertyData[id][PropertyEnter][1], PropertyData[id][PropertyEnter][2]), ReturnAreaCode(GetZoneID(PropertyData[id][PropertyEnter][0], PropertyData[id][PropertyEnter][1], PropertyData[id][PropertyEnter][2])));
	}

	if(!PropertyData[id][PropertyOwnerID] && PropertyData[id][PropertyFaction] == -1)
	{
        PropertyData[id][PropertyMarketLabel] =
        CreateDynamic3DTextLabel(sprintf("%s[%i] Satýlýk:\nÜcret: $%s\nSeviye: %i\nKilit Seviyesi: 1\nAlarm Seviyesi: 1", Property_Type(id), id, MoneyFormat(PropertyData[id][PropertyMarketPrice]), PropertyData[id][PropertyLevel]), 0xC38A39FF, PropertyData[id][PropertyEnter][0], PropertyData[id][PropertyEnter][1], PropertyData[id][PropertyEnter][2]+0.35, 10.0, .worldid = PropertyData[id][PropertyEnterWorld]);
	}

	if(PropertyData[id][PropertyHasXMR]) {
		PropertyData[id][PropertyXMRObject] = CreateDynamicObject(2103, PropertyData[id][PropertyXMR][0], PropertyData[id][PropertyXMR][1], PropertyData[id][PropertyXMR][2], PropertyData[id][PropertyXMR][3], PropertyData[id][PropertyXMR][4], PropertyData[id][PropertyXMR][5], PropertyData[id][PropertyExitWorld], PropertyData[id][PropertyExitInterior]);
	}

	new array[2]; array[0] = 25; array[1] = id;
	PropertyData[id][PropertyAreaID][0] = CreateDynamicSphere(PropertyData[id][PropertyEnter][0], PropertyData[id][PropertyEnter][1], PropertyData[id][PropertyEnter][2], 3.0, PropertyData[id][PropertyEnterWorld], PropertyData[id][PropertyEnterInterior]);
	Streamer_SetArrayData(STREAMER_TYPE_AREA, PropertyData[id][PropertyAreaID][0], E_STREAMER_EXTRA_ID, array, 2);

	array[0] = 26; array[1] = id;
	PropertyData[id][PropertyAreaID][1] = CreateDynamicSphere(PropertyData[id][PropertyExit][0], PropertyData[id][PropertyExit][1], PropertyData[id][PropertyExit][2], 3.0, PropertyData[id][PropertyExitWorld], PropertyData[id][PropertyExitInterior]);
	Streamer_SetArrayData(STREAMER_TYPE_AREA, PropertyData[id][PropertyAreaID][1], E_STREAMER_EXTRA_ID, array, 2);
    Property_Save(id);
	return 1;
}

Property_Type(id)
{
	new typo[17];
	switch(PropertyData[id][PropertyType])
	{
		case 1: typo = "Apartman";
		case 2: typo = "Apartman Dairesi";
		case 3: typo = "Ev";
	}
	return typo;
}

Dosign_PlayerInQueue(playerid)
{
   	new sayi;
 	foreach(new i : Dosigns)
 	{
 		if(strfind(DosignData[i][DosignPlacedBy], ReturnName(playerid, 1), true) != -1) sayi++;
	}
	return sayi;
}

Business_Create(playerid, type, name[])
{
	new id = Iter_Free(Businesses);
   	if (id == -1) return SendErrorMessage(playerid, "Maksimum eklenebilecek iþyeri sýnýrýna ulaþýlmýþ.");

	BusinessData[id][BusinessOwnerSQLID] = 0;
	format(BusinessData[id][BusinessName], 128, name);

   	BusinessData[id][BusinessLevel] = 1;
   	BusinessData[id][BusinessPrice] = 50000;
   	BusinessData[id][BusinessRestaurantType] = 0;
   	BusinessData[id][BusinessType] = type;

    GetPlayerPos(playerid, BusinessData[id][EnterPos][0], BusinessData[id][EnterPos][1], BusinessData[id][EnterPos][2]);
    GetPlayerFacingAngle(playerid, BusinessData[id][EnterPos][3]);
	BusinessData[id][EnterInterior] = GetPlayerInterior(playerid);
	BusinessData[id][EnterWorld] = GetPlayerVirtualWorld(playerid);

    GetPlayerPos(playerid, BusinessData[id][ExitPos][0], BusinessData[id][ExitPos][1], BusinessData[id][ExitPos][2]);
    GetPlayerFacingAngle(playerid, BusinessData[id][ExitPos][3]);
	BusinessData[id][ExitPos][2] = 10000;
	BusinessData[id][ExitInterior] = 99;
	BusinessData[id][ExitWorld] = 99;

   	BusinessData[id][BusinessFee] = 1;
   	BusinessData[id][BusinessCashbox] = 0;
   	BusinessData[id][BusinessLocked] = true;
   	BusinessData[id][BusinessHasXMR] = false;

   	BusinessData[id][BusinessTime] = 12;
   	BusinessData[id][BusinessLights] = true;

   	BusinessData[id][BusinessProduct] = 100;
  	BusinessData[id][BusinessWantedProduct] = 0;
   	BusinessData[id][BusinessProductPrice] = 75;

   	BusinessData[id][BusinessFood][0] = 0;
	BusinessData[id][BusinessFoodPrice][0] = 50;

	BusinessData[id][BusinessFood][1] = 1;
	BusinessData[id][BusinessFoodPrice][1] = 50;

	BusinessData[id][BusinessFood][2] = 2;
	BusinessData[id][BusinessFoodPrice][2] = 50;
	Iter_Add(Businesses, id);

	SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý iþyerini ekledin. (kilidi açýp, iç kýsmý ayarlamayý unutmayýn)", id);
	mysql_tquery(m_Handle, "INSERT INTO businesses (BusinessLocked) VALUES(1)", "OnBusinessCreated", "d", id);
	Business_Refresh(id);
	return 1;
}

stock Business_Count(playerid)
{
	new sayi = 0;
	foreach(new i : Businesses) if(BusinessData[i][BusinessOwnerSQLID] == PlayerData[playerid][pSQLID]) sayi++;
	return sayi;
}

Business_Save(id)
{
	new
	    query[545];

	mysql_format(m_Handle, query, sizeof(query), "UPDATE businesses SET BusinessOwner = %i, BusinessName = '%e', BusinessMOTD = '%e', BusinessPrice = %i, BusinessLevel = %i, BusinessType = %i WHERE id = %i",
		BusinessData[id][BusinessOwnerSQLID],
	    BusinessData[id][BusinessName],
	    BusinessData[id][BusinessMOTD],
	    BusinessData[id][BusinessPrice],
	    BusinessData[id][BusinessLevel],
	    BusinessData[id][BusinessType],
	    BusinessData[id][BusinessID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE businesses SET EnterX = %f, EnterY = %f, EnterZ = %f, EnterA = %f, EnterInterior = %i, EnterWorld = %i WHERE id = %i",
		BusinessData[id][EnterPos][0],
	    BusinessData[id][EnterPos][1],
	    BusinessData[id][EnterPos][2],
	    BusinessData[id][EnterPos][3],
	    BusinessData[id][EnterInterior],
	    BusinessData[id][EnterWorld],
	    BusinessData[id][BusinessID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE businesses SET ExitX = %f, ExitY = %f, ExitZ = %f, ExitA = %f, ExitInterior = %i, ExitWorld = %i WHERE id = %i",
		BusinessData[id][ExitPos][0],
	    BusinessData[id][ExitPos][1],
	    BusinessData[id][ExitPos][2],
	    BusinessData[id][ExitPos][3],
	    BusinessData[id][ExitInterior],
	    BusinessData[id][ExitWorld],
	    BusinessData[id][BusinessID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE businesses SET BankX = %f, BankY = %f, BankZ = %f, BankInterior = %i, BankWorld = %i, Time = %i, Lights = %i WHERE id = %i",
		BusinessData[id][BankPos][0],
	    BusinessData[id][BankPos][1],
	    BusinessData[id][BankPos][2],
	    BusinessData[id][BankInterior],
	    BusinessData[id][BankWorld],
	    BusinessData[id][BusinessTime],
   		BusinessData[id][BusinessLights],
	    BusinessData[id][BusinessID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE businesses SET BusinessLocked = %i, BusinessHasXMR = %i, BusinessCashbox = %i, BusinessFee = %i, BusinessProduct = %i, BusinessWantedProduct = %i, BusinessProductPrice = %i WHERE id = %i",
        BusinessData[id][BusinessLocked],
        BusinessData[id][BusinessHasXMR],
		BusinessData[id][BusinessCashbox],
	    BusinessData[id][BusinessFee],
	    BusinessData[id][BusinessProduct],
	    BusinessData[id][BusinessWantedProduct],
	    BusinessData[id][BusinessProductPrice],
	    BusinessData[id][BusinessID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE businesses SET BusinessRType = %i, Food1 = %i, Food2 = %i, Food3 = %i, Price1 = %i, Price2 = %i, Price3 = %i WHERE id = %i",
        BusinessData[id][BusinessRestaurantType],
		BusinessData[id][BusinessFood][0],
	    BusinessData[id][BusinessFood][1],
	    BusinessData[id][BusinessFood][2],
		BusinessData[id][BusinessFoodPrice][0],
	    BusinessData[id][BusinessFoodPrice][1],
	    BusinessData[id][BusinessFoodPrice][2],
	    BusinessData[id][BusinessID]
	);
	mysql_tquery(m_Handle, query);
	return 1;
}

Business_Refresh(id)
{
	if (IsValidDynamicPickup(BusinessData[id][BusinessPickup])) DestroyDynamicPickup(BusinessData[id][BusinessPickup]);
	if (IsValidDynamicPickup(BusinessData[id][BankPickup])) DestroyDynamicPickup(BusinessData[id][BankPickup]);

	if (IsValidDynamicArea(BusinessData[id][BusinessAreaID][0])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, BusinessData[id][BusinessAreaID][0], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(BusinessData[id][BusinessAreaID][0]);
	}
	if (IsValidDynamicArea(BusinessData[id][BusinessAreaID][1])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, BusinessData[id][BusinessAreaID][1], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(BusinessData[id][BusinessAreaID][1]);
	}

	if(BusinessData[id][BusinessType] != BUSINESS_GASSTATION)
	{
		if(BusinessData[id][BusinessType] == BUSINESS_RESTAURANT)
			BusinessData[id][BusinessPickup] = CreateDynamicPickup(!BusinessData[id][BusinessOwnerSQLID] ? (1272) : (1239), 1, BusinessData[id][EnterPos][0], BusinessData[id][EnterPos][1], BusinessData[id][EnterPos][2], BusinessData[id][EnterWorld], BusinessData[id][EnterInterior]);
		else
			BusinessData[id][BusinessPickup] = CreateDynamicPickup(1239, 1, BusinessData[id][EnterPos][0], BusinessData[id][EnterPos][1], BusinessData[id][EnterPos][2], BusinessData[id][EnterWorld], BusinessData[id][EnterInterior]);
	}

	if(BusinessData[id][BusinessType] == BUSINESS_BANK) BusinessData[id][BankPickup] = CreateDynamicPickup(1274, 2, BusinessData[id][BankPos][0], BusinessData[id][BankPos][1], BusinessData[id][BankPos][2], BusinessData[id][ExitWorld], BusinessData[id][ExitInterior]);

	new array[2]; array[0] = 16; array[1] = id;
	BusinessData[id][BusinessAreaID][0] = CreateDynamicSphere(BusinessData[id][EnterPos][0], BusinessData[id][EnterPos][1], BusinessData[id][EnterPos][2], BusinessData[id][BusinessType] == BUSINESS_GASSTATION ? 7.0 : 3.0, BusinessData[id][EnterWorld], BusinessData[id][EnterInterior]);
	Streamer_SetArrayData(STREAMER_TYPE_AREA, BusinessData[id][BusinessAreaID][0], E_STREAMER_EXTRA_ID, array, 2);

	array[0] = 17; array[1] = id;
	BusinessData[id][BusinessAreaID][1] = CreateDynamicSphere(BusinessData[id][ExitPos][0], BusinessData[id][ExitPos][1], BusinessData[id][ExitPos][2], 3.0, BusinessData[id][ExitWorld], BusinessData[id][ExitInterior]);
	Streamer_SetArrayData(STREAMER_TYPE_AREA, BusinessData[id][BusinessAreaID][1], E_STREAMER_EXTRA_ID, array, 2);
	return 1;
}

Business_Delete(id)
{
	foreach(new i : Player) if(PlayerData[i][pInsideBusiness] == id)
	{
		SendPlayer(i, BusinessData[id][EnterPos][0], BusinessData[id][EnterPos][1], BusinessData[id][EnterPos][2], BusinessData[id][EnterPos][3], BusinessData[id][EnterInterior], BusinessData[id][EnterWorld]);
		SendClientMessage(i, COLOR_YELLOW, "SERVER: Bu iþyeri silindiði için dýþarý çýkarýldýnýz.");
		PlayerData[i][pInsideBusiness] = 0;
		SetCameraBehindPlayer(i);
	}

	new
		query[64];

	mysql_format(m_Handle, query, sizeof(query), "DELETE FROM businesses WHERE id = %i", BusinessData[id][BusinessID]);
	mysql_tquery(m_Handle, query);

	if (IsValidDynamicPickup(BusinessData[id][BusinessPickup])) DestroyDynamicPickup(BusinessData[id][BusinessPickup]);
	if (IsValidDynamicPickup(BusinessData[id][BankPickup])) DestroyDynamicPickup(BusinessData[id][BankPickup]);

	if (IsValidDynamicArea(BusinessData[id][BusinessAreaID][0])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, BusinessData[id][BusinessAreaID][0], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(BusinessData[id][BusinessAreaID][0]);
	}

	if (IsValidDynamicArea(BusinessData[id][BusinessAreaID][1])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, BusinessData[id][BusinessAreaID][1], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(BusinessData[id][BusinessAreaID][1]);
	}

	Iter_Remove(Businesses, id);
	return 1;
}

Business_Message(playerid, id)
{
	/*
	This business is looking for cargo to buy now.
	(Wanted: 5 crates of appliances, paying $500 per each one.)

	*/

	switch(BusinessData[id][BusinessType])
	{
		case BUSINESS_STORE: SendClientMessage(playerid, COLOR_DARKGREEN, "24/7 Supermarket /satinal");
		case BUSINESS_GENERAL: SendClientMessage(playerid, COLOR_DARKGREEN, "Genel Maðaza /satinal");
		case BUSINESS_PAWNSHOP: SendClientMessage(playerid, COLOR_DARKGREEN, "Pawnshop /satinal /telsatinal");
		case BUSINESS_RESTAURANT: SendClientMessage(playerid, COLOR_DARKGREEN, "Restaurant /yemek");
		case BUSINESS_AMMUNATION: SendClientMessage(playerid, COLOR_DARKGREEN, "Silahçý /silahsatinal, /mermisatinal");
		case BUSINESS_CLOTHING: SendClientMessage(playerid, COLOR_WHITE, "/kiyafetsatinal, /aksesuarsatinal");
		case BUSINESS_BANK: SendClientMessage(playerid, COLOR_DARKGREEN, "Banka /bakiye /mevduat /paracek /parayatir /maascek");
		case BUSINESS_CLUB: SendClientMessage(playerid, COLOR_DARKGREEN, "Gece Kulübü /icecekal");
		case BUSINESS_ADVERT: SendClientMessage(playerid, COLOR_DARKGREEN, "Reklamlarýnýzý yayýnlýyoruz! /sreklam /reklam");
	}

	if(strcmp(BusinessData[id][BusinessMOTD], "Yok", true)) SendClientMessageEx(playerid, -1, "%s", BusinessData[id][BusinessMOTD]);
	return 1;
}

IsPlayerInBusiness(playerid)
{
	return PlayerData[playerid][pInsideBusiness];
}

IsPlayerNearBusiness(playerid)
{
	if(GetPVarInt(playerid, "AtBusiness") != -1)
	{
		new bb = GetPVarInt(playerid, "AtBusiness");
		if(IsPlayerInRangeOfPoint(playerid, 3.0, BusinessData[bb][EnterPos][0], BusinessData[bb][EnterPos][1], BusinessData[bb][EnterPos][2]))
		{
			return bb;
		}
	}
	return -1;
}

Business_Closest(playerid, type)
{
	new Float: distance[2] = {99999.0, 0.0}, index = -1;
	foreach(new i : Businesses) if (BusinessData[i][BusinessType] == type)
	{
		distance[1] = GetPlayerDistanceFromPoint(playerid, BusinessData[i][EnterPos][0], BusinessData[i][EnterPos][1], BusinessData[i][EnterPos][2]);
		if (distance[1] < distance[0])
		{
		    distance[0] = distance[1];
		   	index = i;
		}
	}
	return index;
}

stock FindHouseWithSQL(id)
{
	new houseid;

	for(new i; i < MAX_PROPERTY; i++)
	{
		if(PropertyData[i][PropertyID] == id)
		{
			houseid = i;
			return houseid;
		}
	}
	return houseid;
}

stock FindBizWithSQL(id)
{
	new bizid;

	for(new i; i < MAX_BUSINESS; i++)
	{
		if(BusinessData[i][BusinessID] == id)
		{
			bizid = i;
			return bizid;
		}
	}
	return bizid;
}

Furniture_Panel(playerid, id, type)
{
	if(PlayerData[playerid][p3DMenu] != -1)
	{
	   	Destroy3DMenu(PlayerData[playerid][p3DMenu]);
		PlayerData[playerid][p3DMenu] = -1;
	}

	if(type == 0)
	{
		PlayerData[playerid][pBizFurniture] = -1;
		PlayerData[playerid][pHouseFurniture] = id;
		Dialog_Show(playerid, FURNITURE_MAIN, DIALOG_STYLE_LIST, "Mobilya Ana Menü:", "Mobilya Satýnal\nMevcut Mobilyalar\nMobilya Bilgileri", "Seç", "<<<");
	}
	else if(type == 1)
	{
		PlayerData[playerid][pHouseFurniture] = -1;
		PlayerData[playerid][pBizFurniture] = id;
		Dialog_Show(playerid, FURNITURE_MAIN, DIALOG_STYLE_LIST, "Mobilya Ana Menü:", "Mobilya Satýnal\nMevcut Mobilyalar\nMobilya Bilgileri", "Seç", "<<<");
	}
	return 1;
}

Furniture_Edit(playerid)
{
    new primary_str[156];
	strcat(primary_str, "Mobilya Bilgisi\nPozisyonu Deðiþtir\n");
	strcat(primary_str, "Dekorasyon Deðiþtir\n");
	strcat(primary_str, "Sat\nAdýný Deðiþtir\nKopyala\n");
 	Dialog_Show(playerid, FURNITURE_EDIT, DIALOG_STYLE_LIST, "Mobilya Düzenle", primary_str, "Seç", "<<<");
 	return 1;
}

Furniture_Details(playerid)
{
	new primary_str[140];
	strcat(primary_str, "Hareket Ettirme Aracý\nYön Düzeltme\nKeskin Dönüþ\nPozisyonu Kopyala\n");
	if(GetPVarInt(playerid, "FurniturePos") != -1) strcat(primary_str, "{FFFF00}* Pozisyonu Yapýþtýr\n");
	strcat(primary_str, "Rotasyonu Kopyala\n");
	if(GetPVarInt(playerid, "FurnitureRot") != -1) strcat(primary_str, "{FFFF00}* Rotasyonu Yapýþtýr\n");
	Dialog_Show(playerid, FURNITURE_EDIT_DETAILS, DIALOG_STYLE_LIST, "Mobilya Pozisyon Düzenle", primary_str, "Seç", "<<<");
	return 1;
}

Furniture_GetCategory(id)
{
	new query[75], cat[26];
	mysql_format(m_Handle, query, sizeof(query), "SELECT CategoryName FROM furniture_categories WHERE id = %i", id);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name(0, "CategoryName", cat);
	cache_delete(cache);
	return cat;
}

Furniture_GetSubCategory(id)
{
	new query[75], sub[45];
	mysql_format(m_Handle, query, sizeof(query), "SELECT SubCategoryName FROM furniture_subcategories WHERE id = %i", id);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name(0, "SubCategoryName", sub);
	cache_delete(cache);
	return sub;
}

Furniture_GetObjID(id, inputtext[] = "")
{
	new query[129], price;
	mysql_format(m_Handle, query, sizeof(query), "SELECT ObjID FROM furniture_lists WHERE SubCategoryID = %i AND ObjName = '%e'", id, inputtext);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name_int(0, "ObjID", price);
	cache_delete(cache);
	return price;
}

Furniture_GetPrice(id, inputtext[] = "")
{
	new query[129], price;
	mysql_format(m_Handle, query, sizeof(query), "SELECT ObjPrice FROM furniture_lists WHERE SubCategoryID = %i AND ObjName = '%e'", id, inputtext);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name_int(0, "ObjPrice", price);
	cache_delete(cache);
	return price;
}

Furniture_GetCount(id)
{
	new query[60], sayi;
	mysql_format(m_Handle, query, sizeof(query), "SELECT id FROM furnitures WHERE PropertyID = %i", id);
	new Cache: cache = mysql_query(m_Handle, query);
	sayi = cache_num_rows();
	cache_delete(cache);
	return sayi;
}

Furniture_GetCountBiz(id)
{
	new query[60], sayi;
	mysql_format(m_Handle, query, sizeof(query), "SELECT id FROM furnitures WHERE BusinessID = %i", id);
	new Cache: cache = mysql_query(m_Handle, query);
	sayi = cache_num_rows();
	cache_delete(cache);
	return sayi;
}

Furniture_GetSubAltID(inputtext[] = "")
{
	new query[129], id;
	mysql_format(m_Handle, query, sizeof(query), "SELECT id, SubCategoryName FROM furniture_subcategories WHERE SubCategoryName = '%e'", inputtext);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name_int(0, "id", id);
	cache_delete(cache);
	return id;
}

Furniture_GetLimit(playerid)
{
	new max_furniture;
	switch(PlayerData[playerid][pDonator])
	{
		case 1: max_furniture = 200;
		case 2: max_furniture = 300;
		case 3: max_furniture = 400;
		default: max_furniture = 70;
	}
	return max_furniture;
}

IsHouseDoor(model)
{
	switch(model)
	{
	    case 1493, 1495..1498, 1500, 1501, 1504, 1506, 1507, 1522, 1532, 1533, 1535, 1536, 1557, 1566, 1567, 3089: return 1;
	}
	return 0;
}

IsPokerTable(model)
{
	switch(model)
	{
		case 19474: return 1;
	}
	return 0;
}

IsHouseRefrigerator(model)
{
	switch(model)
	{
		case 2127, 2529, 2531, 2360, 19916: return 1;
	}
	return 0;
}

IsHouseSafe(model)
{
	switch(model)
	{
		case 2332: return 1;
	}
	return 0;
}

Furniture_Category(playerid)
{
	mysql_tquery(m_Handle, "SELECT CategoryName FROM furniture_categories", "SQL_FurnitureMainList", "i", playerid);
	return 1;
}

Furniture_SubCategory(playerid, listitem)
{
	new query[129];
    mysql_format(m_Handle, query, sizeof(query), "SELECT SubCategoryName FROM furniture_subcategories WHERE CategoryID = %i", listitem);
	mysql_tquery(m_Handle, query, "SQL_FurnitureSubList", "i", playerid);
	return 1;
}

Furniture_SubCategoryAlt(playerid, listitem)
{
	new query[129];
    mysql_format(m_Handle, query, sizeof(query), "SELECT ObjName, ObjPrice FROM furniture_lists WHERE SubCategoryID = %i", listitem);
	mysql_tquery(m_Handle, query, "SQL_FurnitureSubAltList", "i", playerid);
	return 1;
}

Furniture_List(playerid, page = 0)
{
	SetPVarInt(playerid, "furniture_idx", page);

	if(PlayerData[playerid][pHouseFurniture] != -1)
	{
	    new query[125], p = PlayerData[playerid][pHouseFurniture];
		mysql_format(m_Handle, query, sizeof(query), "SELECT id, PropertyID, FurnitureID, FurnitureName FROM furnitures WHERE PropertyID = %i LIMIT %i, 25", PropertyData[p][PropertyID], page*MAX_CLOTHING_SHOW);
		mysql_tquery(m_Handle, query, "SQL_FurnitureList", "ii", playerid, page);
	}
	else if(PlayerData[playerid][pBizFurniture] != -1)
	{
	    new query[150], b = PlayerData[playerid][pBizFurniture];
		mysql_format(m_Handle, query, sizeof(query), "SELECT id, BusinessID, FurnitureID, FurnitureName FROM furnitures WHERE BusinessID = %i LIMIT %i, 25", BusinessData[b][BusinessID], page*MAX_CLOTHING_SHOW);
		mysql_tquery(m_Handle, query, "SQL_FurnitureList", "ii", playerid, page);
	}
	return 1;
}

Player_SetTime(playerid)
{
	gettime(hour, minute, second);
	SetPlayerTime(playerid, hour, minute);
	return 1;
}

Player_SetWeather(playerid)
{
	SetPlayerWeather(playerid, weather);
	return 1;
}

Player_UseDrug(playerid, drugid, quality, Float: amount = 0.0)
{
	new Float: total; //effect;
	PlayerData[playerid][pDrugUse] = drugid;
   	SetPVarInt(playerid, "drug_int", GetPlayerInterior(playerid));
    PlayerTextDrawHide(playerid, drug_effect[playerid]);
	KillTimer(PlayerData[playerid][pDrugTimer]);
	PlayerData[playerid][pDrugTimer] = -1;
	PlayerData[playerid][pDrugLoop] = 0;

	switch(drugid)
	{
		case DRUG_TYPE_XANAX:
		{
			PlayAnimation(playerid, "PED", "WALK_DRUNK", 4.1, 1, 1, 1, 1, 1, 1);
		}
		case DRUG_TYPE_MDMA:
		{
			total = (amount * randomEx(10, 15));
			PlayerData[playerid][pDrugTimer] = SetTimerEx("Player_HealUp", 2000, true, "ii", playerid, floatround(total));
		}
	    case DRUG_TYPE_MARIJUANA, DRUG_TYPE_CRACK:
	    {
			InfoTD_MSG(playerid, 1, 8000, "\
				\" ~g~LMB ~w~\" TUSUYLA DUMANLANABILIR.~n~\
				\" ~r~ENTER ~w~\" TUSUYLA SIGARAYI ATABILIRSIN.");

			total = (amount * randomEx(10, 15));
		    PlayerData[playerid][pDrugTime] = gettime() + (floatround(amount) * 240);
		   	PlayerData[playerid][pDrugTimer] = SetTimerEx("Player_HealUp", 2000, true, "ii", playerid, floatround(total));
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_SMOKE_CIGGY);
	    }
	    case DRUG_TYPE_COCAINE:
	   	{
	   		total = (amount * randomEx(10, 15));
	    	PlayerData[playerid][pDrugTime] = gettime() + (floatround(amount) * 240);
			PlayerData[playerid][pDrugTimer] = SetTimerEx("Player_HealUp", 2000, true, "ii", playerid, floatround(total));
	   	}
	   	case DRUG_TYPE_ECSTASY:
	    {
	    	total = (amount * randomEx(10, 15));
	    	PlayerData[playerid][pDrugChgWeather] = gettime() + 4;
	    	PlayerData[playerid][pDrugTime] = gettime() + (floatround(amount) * 240);
			PlayerData[playerid][pDrugTimer] = SetTimerEx("Player_HealUp", 2000, true, "ii", playerid, floatround(total));
	    }
	    case DRUG_TYPE_QUAALUDES:
	    {
	    	total = (amount * randomEx(8, 10));
		    PlayerData[playerid][pDrugTimer] = SetTimerEx("Player_HealUp", 2000, true, "ii", playerid, floatround(total));
	    }
	    case DRUG_TYPE_PEYOTE:
	    {
	    	total = (amount * randomEx(10, 15));
	    	PlayerData[playerid][pDrugChgWeather] = gettime() + 4;
	    	PlayerData[playerid][pDrugTime] = gettime() + (floatround(amount) * 240);
	     	PlayerData[playerid][pDrugTimer] = SetTimerEx("Player_HealUp", 2000, true, "ii", playerid, floatround(total));
	    }
	    case DRUG_TYPE_MORPHINE:
	    {
	    	if(amount > 0.2) cmd_crack3(playerid, "");
	    	new Float: hp; 	GetPlayerHealth(playerid, hp);
	    	SetPlayerHealth(playerid, hp - 3);
	    }
	    case DRUG_TYPE_HALOP:
	    {
	    	//effect = (quality * randomEx(45, 50));
	    	//SetPlayerDrunkLevel(playerid, effect);
	    	new Float: hp; 	GetPlayerHealth(playerid, hp);
	    }
	    case DRUG_TYPE_ASPIRIN:
	    {
	    	PlayerData[playerid][pDrugTime] = 0;
			Player_SetTime(playerid); Player_SetWeather(playerid); PlayerTextDrawHide(playerid, drug_effect[playerid]);
	    	new Float: hp; 	GetPlayerHealth(playerid, hp);
	    	//SetPlayerDrunkLevel(playerid, 0);
	    }
	    case DRUG_TYPE_STEROIDS:
	   	{
	   		total = (amount * randomEx(10, 15));
	   		//effect = (quality * randomEx(90, 110));
	   		PlayerData[playerid][pDrugTime] = gettime() + (floatround(amount) * 240);
	       	PlayerData[playerid][pDrugTimer] = SetTimerEx("Player_HealUp", 2000, true, "ii", playerid, floatround(total));
	       	//SetPlayerDrunkLevel(playerid, effect);
	   	}
	   	case DRUG_TYPE_HEROIN:
	   	{
	   		total = (amount * randomEx(10, 15));
	   		//effect = (quality * randomEx(60, 62));
		    PlayerData[playerid][pDrugTime] = gettime() + (floatround(amount) * 240);

	        if(quality >= 70) {
			    PlayerTextDrawBoxColor(playerid, drug_effect[playerid], 0xFFFFFF50);
			    PlayerTextDrawShow(playerid, drug_effect[playerid]);
			}

			PlayerData[playerid][pDrugTimer] = SetTimerEx("Player_HealUp", 2000, true, "ii", playerid, floatround(total));
			//SetPlayerDrunkLevel(playerid, effect);
	   	}
	   	case DRUG_TYPE_LSD:
	    {
	    	total = (amount * randomEx(10, 15));
	    	//effect = (quality * randomEx(90, 110));
		    PlayerData[playerid][pDrugTime] = gettime() + (floatround(amount) * 240);
		    PlayerData[playerid][pDrugChgWeather] = gettime() + 4;
			PlayerData[playerid][pDrugTimer] = SetTimerEx("Player_HealUp", 2000, true, "ii", playerid, floatround(total));
			//SetPlayerDrunkLevel(playerid, effect);
	    }
	    case DRUG_TYPE_METH, DRUG_TYPE_PCP:
	    {
	    	total = (amount * randomEx(10, 15));
	    	//effect = (quality * randomEx(90, 110));
		    PlayerData[playerid][pDrugTime] = gettime() + (floatround(amount) * 240);
			PlayerData[playerid][pDrugTimer] = SetTimerEx("Player_HealUp", 2000, true, "ii", playerid, floatround(total));
			//SetPlayerDrunkLevel(playerid, effect);
	    }
	}

	return 1;
}

Player_GetDrugCount(playerid)
{
	new drug_count;
	for(new i = 1; i < MAX_PACK_SLOT; i++)
	{
		if(!player_drug_data[playerid][i][is_exist]) continue;
		drug_count++;
	}
	return drug_count;
}

Vehicle_GetDrugCount(vehicleid)
{
	new drug_count;
	for(new i = 1; i < MAX_PACK_SLOT; i++)
	{
		if(!vehicle_drug_data[vehicleid][i][is_exist]) continue;
		drug_count++;
	}
	return drug_count;
}

GetVehicleDrugs(vehicleid)
{
	new count = 0;
	for(new i = 1; i < MAX_PACK_SLOT; i++)
	{
		if(vehicle_drug_data[vehicleid][i][veh_drug_id])
		{
			count++;
		}
	}
	return count;
}

GetNextVehicleDrugSlot(vehicleid)
{
	new i = 1;
	while(i != MAX_PACK_SLOT)
	{
		if(vehicle_drug_data[vehicleid][i][veh_drug_id] == 0)
		{
			return i;
		}
		i++;
	}
	return -1;
}

Vehicle_ListDrugs(playerid, vehicleid, bool:readonly)
{
	new principal_str[1024];

	for(new i = 1; i < MAX_PACK_SLOT; i++)
	{
		if(vehicle_drug_data[vehicleid][i][is_exist])
			format(principal_str, sizeof(principal_str), "%s%i. %s - %s (%s: %0.1fg/%i.0g) (Kalite: %i)\n", principal_str, i, vehicle_drug_data[vehicleid][i][veh_drug_name], Drug_GetType(vehicle_drug_data[vehicleid][i][veh_drug_size]), Drug_GetName(vehicle_drug_data[vehicleid][i][veh_drug_id]), vehicle_drug_data[vehicleid][i][veh_drug_amount], Drug_GetMaxAmount(vehicle_drug_data[vehicleid][i][veh_drug_size]), vehicle_drug_data[vehicleid][i][veh_drug_quality]);
		else
			format(principal_str, sizeof(principal_str), "%s%i. [Boþ]\n", principal_str, i);
	}

	if(readonly) Dialog_Show(playerid, DIALOG_DEFAULT, DIALOG_STYLE_LIST, "Bagaj: Uyuþturucular", principal_str, "<<", "");
	else Dialog_Show(playerid, VEHICLE_DRUGS, DIALOG_STYLE_LIST, "Bagaj: Uyuþturucular", principal_str, "Al", "<<");
	return 1;
}

Player_ListDrugs(playerid, id)
{
	new drug_count, drug_str[128];
	for(new i = 1; i < MAX_PACK_SLOT; i++)
	{
		if(!player_drug_data[playerid][i][is_exist]) continue;
		format(drug_str, sizeof(drug_str), "[ {FFFFFF}%i. %s - %s (%s: %0.1fg/%i.0g) (Kalite: %i) {FF6347}]", i, player_drug_data[playerid][i][drug_name], Drug_GetType(player_drug_data[playerid][i][drug_size]), Drug_GetName(player_drug_data[playerid][i][drug_id]), player_drug_data[playerid][i][drug_amount], Drug_GetMaxAmount(player_drug_data[playerid][i][drug_size]), player_drug_data[playerid][i][drug_quality]);
		SendClientMessage(id, COLOR_ADM, drug_str);
		drug_count++;
	}

	if(!drug_count) SendClientMessage(id, COLOR_WHITE, "Gösterilebilecek uyuþturucu yok.");
	return 1;
}

Drug_GetMaxAmount(id)
{
	switch(id)
	{
		case 1: return 7;
		case 2: return 14;
		case 3: return 21;
	}
	return 1;
}

Drug_GetType(id)
{
	new txt[20];
	switch(id)
	{
		case 1: txt = "Küçük";
		case 2: txt = "Orta";
		case 3: txt = "Büyük";
	}
	return txt;
}

Drug_GetDropType(id)
{
	switch(id)
	{
		case 1: return 19896;
		case 2: return 11748;
		case 3: return 2814;
	}
	return 1;
}

Drug_GetName(id)
{
	new txt[20];
	switch(id)
	{
		case 1: txt = "Marijuana";
        case 2: txt = "Crack";
        case 3: txt = "Kokain";
        case 4: txt = "Ekstazi";
        case 5: txt = "LSD";
        case 6: txt = "Metamfetamin";
        case 7: txt = "PCP";
        case 8: txt = "Eroin";
        case 9: txt = "Aspirin";
        case 10: txt = "Haloperidol";
        case 11: txt = "Morfin";
        case 12: txt = "Xanax";
        case 13: txt = "MDMA";
        case 14: txt = "Fenetol";
        case 15: txt = "Anabolik Steroid";
        case 16: txt = "Meskalin";
        case 17: txt = "Quaaludes";
        case 18: txt = "Peyote";
	}
	return txt;
}

Drug_DefaultValues(playerid, slot = -1)
{
	new query[64];
	if(slot == -1)
	{
		for(new i = 1; i < MAX_PACK_SLOT; i++)
		{
			player_drug_data[playerid][i][drug_id] = 0;
			format(player_drug_data[playerid][i][drug_name], 64, "");
			player_drug_data[playerid][i][drug_amount] = 0.0;
			player_drug_data[playerid][i][drug_quality] = 0;
			player_drug_data[playerid][i][drug_size] = 0;
			player_drug_data[playerid][i][is_exist] = false;
		}
	} else {
		mysql_format(m_Handle, query, sizeof(query), "DELETE FROM player_drugs WHERE id = %i", player_drug_data[playerid][slot][data_id]);
		mysql_tquery(m_Handle, query);

		player_drug_data[playerid][slot][drug_id] = 0;
		format(player_drug_data[playerid][slot][drug_name], 64, "");
		player_drug_data[playerid][slot][drug_amount] = 0.0;
		player_drug_data[playerid][slot][drug_quality] = 0;
		player_drug_data[playerid][slot][drug_size] = 0;
		//player_drug_data[playerid][slot][drug_used] = false;
		player_drug_data[playerid][slot][is_exist] = false;
		player_drug_data[playerid][slot][data_id] = 0;
	}
	return 1;
}

Drug_PropertyDefaultValues(propertyid, slot = -1)
{
	if(slot == -1)
	{
		for(new i = 1; i < MAX_PACK_SLOT; i++)
		{
			property_drug_data[propertyid][i][property_id] = -1;
			property_drug_data[propertyid][i][prop_drug_id] = 0;
			format(property_drug_data[propertyid][i][prop_drug_name], 64, "");
			property_drug_data[propertyid][i][prop_drug_amount] = 0.0;
			property_drug_data[propertyid][i][prop_drug_quality] = 0;
			property_drug_data[propertyid][i][prop_drug_size] = 0;
			property_drug_data[propertyid][i][is_exist] = false;
		}
	} else {
		property_drug_data[propertyid][slot][property_id] = -1;
		property_drug_data[propertyid][slot][prop_drug_id] = 0;
		format(property_drug_data[propertyid][slot][prop_drug_name], 64, "");
		property_drug_data[propertyid][slot][prop_drug_amount] = 0.0;
		property_drug_data[propertyid][slot][prop_drug_quality] = 0;
		property_drug_data[propertyid][slot][prop_drug_size] = 0;
		property_drug_data[propertyid][slot][is_exist] = false;

		new query[64];
		mysql_format(m_Handle, query, sizeof(query), "DELETE FROM property_drugs WHERE id = %i", property_drug_data[propertyid][slot][data_id]);
		mysql_tquery(m_Handle, query);

		property_drug_data[propertyid][slot][data_id] = 0;
	}
	return 1;
}

Drug_VehicleDefaultValues(vehicleid, slot = -1)
{
	if(slot == -1)
	{
		for(new i = 1; i < MAX_PACK_SLOT; i++)
		{
			vehicle_drug_data[vehicleid][i][veh_id] = 0;
			vehicle_drug_data[vehicleid][i][veh_drug_id] = 0;
			format(vehicle_drug_data[vehicleid][i][veh_drug_name], 64, "");
			vehicle_drug_data[vehicleid][i][veh_drug_amount] = 0.0;
			vehicle_drug_data[vehicleid][i][veh_drug_quality] = 0;
			vehicle_drug_data[vehicleid][i][veh_drug_size] = 0;
			vehicle_drug_data[vehicleid][i][is_exist] = false;
		}
	}
	else
	{
		new query[78];
		mysql_format(m_Handle, query, sizeof(query), "DELETE FROM vehicle_drugs WHERE id = %i", vehicle_drug_data[vehicleid][slot][data_id]);
		mysql_tquery(m_Handle, query);

		vehicle_drug_data[vehicleid][slot][veh_id] = 0;
		vehicle_drug_data[vehicleid][slot][veh_drug_id] = 0;
		format(vehicle_drug_data[vehicleid][slot][veh_drug_name], 64, "");
		vehicle_drug_data[vehicleid][slot][veh_drug_amount] = 0.0;
		vehicle_drug_data[vehicleid][slot][veh_drug_quality] = 0;
		vehicle_drug_data[vehicleid][slot][veh_drug_size] = 0;
		vehicle_drug_data[vehicleid][slot][is_exist] = false;
		vehicle_drug_data[vehicleid][slot][data_id] = 0;
	}
	return 1;
}

Drug_GetPlayerNextSlot(id)
{
	new i = 1;
	while(i != MAX_PACK_SLOT)
	{
		if(!player_drug_data[id][i][is_exist])
		{
			return i;
		}
		i++;
	}
	return -1;
}

Player_ListPackages(playerid, id)
{
	new drug_count, drug_str[128];
	for(new i = 1; i < MAX_PACK_SLOT; i++)
	{
		if(!player_package_data[playerid][i][is_exist]) continue;
		format(drug_str, sizeof(drug_str), "[ {FFFFFF}%i. %s - (%i/500) {FF6347}]", i, ReturnWeaponName(player_package_data[playerid][i][weapon_id]), player_package_data[playerid][i][weapon_ammo]);
		SendClientMessage(id, COLOR_ADM, drug_str);
		drug_count++;
	}

	if(!drug_count) SendClientMessage(id, COLOR_WHITE, "Gösterilebilecek silah paketi yok.");
	return 1;
}

Package_DefaultValues(playerid, slot = -1)
{
	if(slot == -1)
	{
		for(new i = 1; i < MAX_PACK_SLOT; i++)
		{
			player_package_data[playerid][i][weapon_id] = 0;
			player_package_data[playerid][i][weapon_ammo] = 0;
			player_package_data[playerid][i][is_exist] = false;
			player_package_data[playerid][i][player_dbid] = 0;
			player_package_data[playerid][i][data_id] = 0;
		}
	} else {
		new query[64];
		mysql_format(m_Handle, query, sizeof(query), "DELETE FROM player_packages WHERE id = %i", player_package_data[playerid][slot][data_id]);
		mysql_tquery(m_Handle, query);

		player_package_data[playerid][slot][weapon_id] = 0;
		player_package_data[playerid][slot][weapon_ammo] = 0;
		player_package_data[playerid][slot][is_exist] = false;
		player_package_data[playerid][slot][player_dbid] = 0;
		player_package_data[playerid][slot][data_id] = 0;
	}
	return 1;
}

ListTrunkWeapons(playerid, vehicleid)
{
	new principal_str[256];
	for(new i = 1; i < MAX_WEP_SLOT; i++)
	{
		if(vehicle_weap_data[vehicleid][i][is_exist])
			format(principal_str, sizeof(principal_str), "%s%i. %s[Mermi: %i]\n", principal_str, i, ReturnWeaponName(vehicle_weap_data[vehicleid][i][veh_wep]), vehicle_weap_data[vehicleid][i][veh_ammo]);
		else
			format(principal_str, sizeof(principal_str), "%s%i. [Boþ]\n", principal_str, i);
	}

	Dialog_Show(playerid, DIALOG_DEFAULT, DIALOG_STYLE_LIST, "Bagaj: Silahlar", principal_str, "<<", "");
	return 1;
}

RemoveWeaponFromTrunk(playerid, vehicleid, slot)
{
	GivePlayerWeapon(playerid, vehicle_weap_data[vehicleid][slot][veh_wep], vehicle_weap_data[vehicleid][slot][veh_ammo]);
	cmd_ame(playerid, sprintf("%s model araçtan %s alýr.", ReturnVehicleName(vehicleid), ReturnWeaponName(vehicle_weap_data[vehicleid][slot][veh_wep])));

	if(vehicle_weap_data[vehicleid][slot][data_id])
	{
		new remove_query[64];
		mysql_format(m_Handle, remove_query, sizeof(remove_query), "DELETE FROM vehicle_weapons WHERE id = %i", vehicle_weap_data[vehicleid][slot][data_id]);
		mysql_tquery(m_Handle, remove_query);
	}

	if(IsValidDynamicObject(vehicle_weap_data[vehicleid][slot][temp_object])) DestroyDynamicObject(vehicle_weap_data[vehicleid][slot][temp_object]);
    vehicle_weap_data[vehicleid][slot][data_id] = 0;
	vehicle_weap_data[vehicleid][slot][veh_wep] = 0;
    vehicle_weap_data[vehicleid][slot][veh_ammo] = 0;
    vehicle_weap_data[vehicleid][slot][is_exist] = false;
    for(new i = 0; i < 6; i++) vehicle_weap_data[vehicleid][slot][wep_offset][i] = 0.0;
	return 1;
}

GetVehicleTrunkWeps(vehicleid)
{
	new count = 0;
	for(new i = 1; i < MAX_WEP_SLOT; i++)
	{
		if(vehicle_weap_data[vehicleid][i][veh_wep])
		{
			count++;
		}
	}
	return count;
}

GetNextVehicleTrunkSlot(vehicleid)
{
	new i = 1;
	while(i != MAX_WEP_SLOT)
	{
		if(vehicle_weap_data[vehicleid][i][veh_wep] == 0)
		{
			return i;
		}
		i++;
	}
	return -1;
}

Player_ShowFines(receiver, viewing)
{
	new
		caption[90], primary_str[800], sub_str[128], has_fines;

	CheckingPlayerFine[receiver] = viewing;

    format(primary_str, sizeof(primary_str), "Ceza Numarasý\tCeza Miktarý\n");

	for (new i = 0; i < MAX_FINES; i++)
	{
		if(!Fines[viewing][i][fine_id]) continue;
		format(sub_str, sizeof(sub_str), "{ADC3E7}Ceza [%i]{FFFFFF}\t$%s\n", Fines[viewing][i][fine_id], MoneyFormat(Fines[viewing][i][fine_amount]));
		strcat(primary_str, sub_str);
		has_fines++;
	}

	format(caption, sizeof(caption), "{ADC3E7}%s adlý kiþinin cezalarý:", ReturnName(viewing, 1));

	if(!has_fines)
	{
		strcat(primary_str, "Listelenecek bir cezan yok.\n");
		return Dialog_Show(receiver, FINE_LIST, DIALOG_STYLE_TABLIST_HEADERS, caption, primary_str, ">>", "<<");
	}

	Dialog_Show(receiver, FINE_LIST, DIALOG_STYLE_TABLIST_HEADERS, caption, primary_str, "Seç", "<<");
	return 1;
}

Vehicle_ShowFines(vehicleid, receiver, viewing)
{
	new
		caption[90], primary_str[800], sub_str[128], has_fines;

	CheckingPlayerFine[receiver] = viewing;

    format(primary_str, sizeof(primary_str), "#\tMiktar\tLokasyon\n");
	for (new i = 0; i < MAX_FINES; i++)
	{
		if(!VehicleFines[vehicleid][i][fine_id]) continue;
		format(sub_str, sizeof(sub_str), "{ADC3E7}Ceza [%i]{FFFFFF}\t$%s\n", VehicleFines[vehicleid][i][fine_id], MoneyFormat(VehicleFines[vehicleid][i][fine_amount]), GetZoneName(VehicleFines[vehicleid][i][fine_x], VehicleFines[vehicleid][i][fine_y], VehicleFines[vehicleid][i][fine_z]));
		strcat(primary_str, sub_str);
		has_fines++;
	}

	format(caption, sizeof(caption), "{ADC3E7}%s(%s) Cezalarý:", ReturnVehicleName(vehicleid), CarData[vehicleid][carPlates]);

	if(!has_fines)
	{
		strcat(primary_str, "Listelenecek bir cezan yok.\n");
		return Dialog_Show(receiver, VEHICLE_FINE_LIST, DIALOG_STYLE_TABLIST_HEADERS, caption, primary_str, ">>", "<<");
	}

	Dialog_Show(receiver, VEHICLE_FINE_LIST, DIALOG_STYLE_TABLIST_HEADERS, caption, primary_str, "Seç", "<<");
	return 1;
}

CountVehicleFines(vehicleid)
{
	new fine_count = 0;
	for(new i = 0; i < MAX_FINES; i++) if(VehicleFines[vehicleid][i][fine_id]) fine_count++;
	return fine_count;
}

CountVehicleFinesTotal(vehicleid)
{
	new
		totalCount;

	for(new i = 0; i < MAX_FINES; i++) if(VehicleFines[vehicleid][i][fine_id])
		totalCount += VehicleFines[vehicleid][i][fine_amount];

	return totalCount;
}

stock ClearVehicleFines(vehicleid)
{
	new
		clearQuery[128];

	mysql_format(m_Handle, clearQuery, sizeof(clearQuery), "DELETE FROM vehicle_fines WHERE vehicle_dbid = %i", CarData[vehicleid][carID]);
	mysql_tquery(m_Handle, clearQuery, "OnVehicleFinesCleared", "i", vehicleid);
	return 1;
}

Advert_List(playerid)
{
    new ad_count = 0;
    new sub[128], primary[512];

	strcat(primary, "#\tReklam\tSaniye\n");
	foreach(new i : Adverts)
	{
		format(sub, sizeof(sub), "%i\t%.40s...\t~%is\n", (i+1), AdvertData[i][AdvertText], AdvertData[i][PublishTime]);
		strcat(primary, sub);
        ad_count++;
	}

	if(!ad_count) Dialog_Show(playerid, DIALOG_DEFAULT, DIALOG_STYLE_TABLIST, "Reklamlar", "Yakýnda yayýnlanacak hiç reklam yok.", "<<", "");
	else Dialog_Show(playerid, DIALOG_DEFAULT, DIALOG_STYLE_TABLIST_HEADERS, "Reklamlar", primary, "<<", "");
	return 1;
}

PlayerInQueue(playerid)
{
   	new max_count = 0;
 	foreach(new i : Adverts)
 	{
 	    if(AdvertData[i][AdvertPlaceBy] == PlayerData[playerid][pSQLID]) max_count++;
	}
	return max_count;
}

Advert_Publish(playerid, text[], personal = 1)
{
	new id = Iter_Free(Adverts);
	if(id == -1) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Reklam listesi dolmuþ, biraz bekleyin.");

	AdvertData[id][AdvertType] = personal;
	format(AdvertData[id][AdvertText], 256, text);
	AdvertData[id][AdvertPlaceBy] = PlayerData[playerid][pSQLID];
	AdvertData[id][AdvertContact] = PlayerData[playerid][pPhone];
	AdvertData[id][PublishTime] = id == 0 ? (id+1) * 60 : id * 60;
	AdvertData[id][AdvertTimer] = SetTimerEx("OnAdvertPublish", 1000, true, "i", id);
	Iter_Add(Adverts, id);

	new query[454];
	mysql_format(m_Handle, query, sizeof(query), "INSERT INTO adverts (advertby, advertnumber, adverttype, adverttext, adverttime) VALUES (%i, %i, %i, '%e', %i)", AdvertData[id][AdvertPlaceBy], AdvertData[id][AdvertContact], AdvertData[id][AdvertType], AdvertData[id][AdvertText], Time());
    mysql_tquery(m_Handle, query);

    SendClientMessage(playerid, COLOR_ADM, "SERVER: Reklamýnýz en kýsa sürede yayýnlanacaktýr, teþekkürler.");
	GiveMoney(playerid, -150);
	return 1;
}

Advert_Clear(id)
{
	KillTimer(AdvertData[id][AdvertTimer]);
	AdvertData[id][AdvertTimer] = -1;

	AdvertData[id][AdvertType] = 0;
	AdvertData[id][AdvertPlaceBy] = 0;
	AdvertData[id][AdvertContact] = 0;
	AdvertData[id][PublishTime] = 0;
	Iter_Remove(Adverts, id);
	return 1;
}

Advert_GetLimit(playerid)
{
	switch(PlayerData[playerid][pDonator])
	{
	    case 0: return 1;
		case 1: return 1;
		case 2: return 2;
		case 3: return 3;
	}
	return 1;
}

Damages_Add(playerid, issuerid, weaponid, bodypart, Float:amount)
{
	new id;
	TotalDamages[playerid] ++;

	for(new i = 0; i < MAX_DAMAGES; i++)
	{
		if(!DamageData[playerid][i][DamageTaken])
		{
			id = i;
			break;
		}
	}

	new Float: armor; GetPlayerArmour(playerid, armor);
	if(armor > 1 && bodypart == BODY_PART_CHEST) DamageData[playerid][id][DamageArmor] = 1;
	else DamageData[playerid][id][DamageArmor] = 0;

	format(DamageData[playerid][id][DamageBy], 25, "%s", ReturnName(issuerid, 1));
	DamageData[playerid][id][DamageTaken] = floatround(amount, floatround_round);
	DamageData[playerid][id][DamageWeaponID] = weaponid;
	DamageData[playerid][id][DamageBodypart] = bodypart;
	DamageData[playerid][id][DamageTime] = gettime();
	return 1;
}

Damages_Clear(playerid)
{
	for(new i = 0; i < MAX_DAMAGES; i++)
	{
		if(DamageData[playerid][i][DamageTaken] != 0)
		{
			DamageData[playerid][i][DamageTaken] = 0;
			DamageData[playerid][i][DamageWeaponID] = 0;
			DamageData[playerid][i][DamageBodypart] = 0;
			DamageData[playerid][i][DamageArmor] = 0;
			DamageData[playerid][i][DamageTime] = 0;
			format(DamageData[playerid][i][DamageBy], 25, "Yok");
		}
	}

	TotalDamages[playerid] = 0;
	return 1;
}

Damages_Show(damageid, playerid, adminview)
{
	new
		caption[33], str[355], longstr[1200];

	format(caption, sizeof(caption), "%s", ReturnName(damageid));
	if(TotalDamages[damageid] < 1) return ShowPlayerDialog(playerid, DIALOG_USE, DIALOG_STYLE_LIST, caption, "Gösterilebilecek hasar yok.", "<<", "");

	switch(adminview)
	{
		case 0:
		{
			//for(new i = 0; i < MAX_DAMAGES; i++) if(DamageData[damageid][i][DamageTaken])
			for(new i = MAX_DAMAGES-1; i >= 0; i--) if(DamageData[damageid][i][DamageTaken])
			{
				format(str, sizeof(str), "%s bölgesine %s ile %d hasar (Çelik yelek: %d) %d sn önce.\n", ReturnBodypartName(DamageData[damageid][i][DamageBodypart]), ReturnWeaponName(DamageData[damageid][i][DamageWeaponID]), DamageData[damageid][i][DamageTaken], DamageData[damageid][i][DamageArmor], gettime() - DamageData[damageid][i][DamageTime]);
				strcat(longstr, str);
			}

			Dialog_Show(playerid, DIALOG_USE, DIALOG_STYLE_LIST, caption, longstr, "<<", "");
		}
		case 1:
		{
			for(new i = MAX_DAMAGES-1; i >= 0; i--) if(DamageData[damageid][i][DamageTaken])
			{
				format(str, sizeof(str), "%s bölgesine %s ile %d hasar (Çelik yelek: %d) %d sn önce. {FF6346}(%s)\n", ReturnBodypartName(DamageData[damageid][i][DamageBodypart]), ReturnWeaponName(DamageData[damageid][i][DamageWeaponID]), DamageData[damageid][i][DamageTaken], DamageData[damageid][i][DamageArmor], gettime() - DamageData[damageid][i][DamageTime], DamageData[damageid][i][DamageBy]);
				strcat(longstr, str);
			}

			Dialog_Show(playerid, DIALOG_USE, DIALOG_STYLE_LIST, caption, longstr, "<<", "");
		}
	}
	return 1;
}

Note_FreeSlot(playerid)
{
	for(new i = 0; i < MAX_PLAYER_NOTES; i++)
	{
		if(!NoteData[playerid][i][NoteID]) return i;
	}
	return -1;
}

Note_RouteCommands(playerid, cmdtext[])
{
    new command[10], parameters[128];
    sscanf(cmdtext, "s[10]s[128]", command, parameters);

	if(strlen(command) == 0) {
		SendClientMessage(playerid, COLOR_ACTION, "____________________________________________________");
		SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /not [komut]");
		SendClientMessage(playerid, COLOR_ACTION, "/not yarat - Yeni bir not yaratýr.");
		SendClientMessage(playerid, COLOR_ACTION, "/not goruntule - Tüm notlarýný görüntüler.");
		SendClientMessage(playerid, COLOR_ACTION, "/not goster - Notlarýný baþkasýna gösterir.");
		SendClientMessage(playerid, COLOR_ACTION, "/not duzenle - Varolan notunu düzenler.");
		SendClientMessage(playerid, COLOR_ACTION, "/not sil - Varolan notunu siler.");
		SendClientMessage(playerid, COLOR_ACTION, "____________________________________________________");
		return 1;
	}

    if(strcmp("yarat", command) == 0) NoteCMD_Create(playerid, parameters);
    else if(strcmp("goruntule", command) == 0) NoteCMD_List(playerid);
	else if(strcmp("goster", command) == 0) NoteCMD_Show(playerid, parameters);
    else if(strcmp("duzenle", command) == 0) NoteCMD_Edit(playerid, parameters);
    else if(strcmp("sil", command) == 0) NoteCMD_Delete(playerid, parameters);
	return 1;
}

NoteCMD_Create(const playerid, const parameters[])
{
	new note_txt[128];
	if(sscanf(parameters, "s[128]", note_txt)) {
		SendUsageMessage(playerid, "/not yarat [içerik]");
		return 1;
	}

	if(strlen(note_txt) < 1 || strlen(note_txt) > 128) {
		SendErrorMessage(playerid, "Notun içeriði en az 1 karakter en fazla 128 karakter olmalýdýr.");
		return 1;
	}

	new id = Note_FreeSlot(playerid);
	if(id == -1) {
		SendErrorMessage(playerid, "Daha fazla not eklemeyezsin, defterinde yer kalmamýþ.");
		return 1;
	}

	new query[454];
	mysql_format(m_Handle, query, sizeof(query), "INSERT INTO player_notes (playersqlid, details, time) VALUES (%i, '%e' %i)", PlayerData[playerid][pSQLID], note_txt, Time());
	new Cache:cache = mysql_query(m_Handle, query);

	NoteData[playerid][id][NoteID] = cache_insert_id();
	format(NoteData[playerid][id][NoteDetails], 128, "%s", note_txt);
	NoteData[playerid][id][NoteTime] = Time();

	SendClientMessageEx(playerid, COLOR_ACTION, "[Not(%i)] %s", id+1, note_txt);
	cmd_ame(playerid, "cebinden kaðýt parçasý çýkartarak üstüne bir þeyler yazar.");
	cache_delete(cache);
    return 1;
}

NoteCMD_List(const playerid)
{
	new has_notes = 0;
	for(new i = 0; i < MAX_PLAYER_NOTES; i++) if(NoteData[playerid][i][NoteID])
	{
		SendClientMessageEx(playerid, COLOR_ACTION, "[Not(%i)] %s...", i+1, NoteData[playerid][i][NoteDetails]);
		SendClientMessageEx(playerid, COLOR_ACTION, "...Tarih: %s", GetFullTime(NoteData[playerid][i][NoteTime]));
		has_notes++;
	}

	if(!has_notes) return SendErrorMessage(playerid, "Hiç not almamýþsýn.");
	return 1;
}

NoteCMD_Show(const playerid, const parameters[])
{
	new id, not_id;
	if(sscanf(parameters, "ui", id, not_id)) {
		SendUsageMessage(playerid, "/not goster [oyuncu ID/isim] [not ID]");
		return 1;
	}
	if(playerid == id) return SendErrorMessage(playerid, "Bu komutu kendi üzerinde kullanamazsýn.");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	if(!GetDistanceBetweenPlayers(playerid, id, 4.5)) return SendErrorMessage(playerid, "Belirttiðin kiþiye yakýn deðilsin.");
	if(!NoteData[playerid][not_id][NoteID]) return SendErrorMessage(playerid, "Böyle bir notun yok.");

	SendClientMessageEx(id, COLOR_ACTION, "[Not(%i)] %s...", not_id+1, NoteData[playerid][not_id][NoteDetails]);
	SendClientMessageEx(id, COLOR_ACTION, "...Tarih: %s", GetFullTime(NoteData[playerid][not_id][NoteTime]));
	cmd_ame(playerid, sprintf("cebinden bir kaðýt parçasý çýkarýr ve %s isimli kiþiye gösterir.", ReturnName(id, 0)));
	return 1;
}

NoteCMD_Edit(const playerid, const parameters[])
{
	new not_id, note_txt[128];
	if(sscanf(parameters, "is[128]", not_id, note_txt)) {
		SendUsageMessage(playerid, "/not duzenle [not ID] [yeni içerik]");
		return 1;
	}

	if(!NoteData[playerid][not_id][NoteID]) {
		SendErrorMessage(playerid, "Böyle bir notun yok.");
		return 1;
	}

	if(strlen(note_txt) < 1 || strlen(note_txt) > 128) {
		SendErrorMessage(playerid, "Notun içeriði en az 1 karakter en fazla 128 karakter olmalýdýr.");
		return 1;
	}

	NoteData[playerid][not_id][NoteTime] = Time();
	format(NoteData[playerid][not_id][NoteDetails], 128, "%s", note_txt);

	SendClientMessageEx(playerid, COLOR_ACTION, "[Not(%i)] %s...", not_id+1, NoteData[playerid][not_id][NoteDetails]);
	SendClientMessageEx(playerid, COLOR_ACTION, "...Tarih: %s (olarak güncellendi)", GetFullTime(NoteData[playerid][not_id][NoteTime]));

	new query[354];
	mysql_format(m_Handle, query, sizeof(query), "UPDATE player_notes SET details = '%e', time = %i WHERE id = %i", NoteData[playerid][not_id][NoteDetails], Time(), NoteData[playerid][not_id][NoteID]);
	mysql_tquery(m_Handle, query);
	return 1;
}

NoteCMD_Delete(const playerid, const parameters[])
{
	new not_id;
	if(sscanf(parameters, "i", not_id)) {
		SendUsageMessage(playerid, "/not sil [not ID]");
		return 1;
	}

	if(!NoteData[playerid][not_id][NoteID]) {
		SendErrorMessage(playerid, "Böyle bir notun yok.");
		return 1;
	}

	SendClientMessageEx(playerid, COLOR_ACTION, "[Not(%i)] %s...", not_id+1, NoteData[playerid][not_id][NoteDetails]);
	SendClientMessageEx(playerid, COLOR_ACTION, "...Tarih: %s (silindi)", GetFullTime(NoteData[playerid][not_id][NoteTime]));
	cmd_ame(playerid, "elindeki not parçasýný yýrtar ve yere doðru atar.");

	new query[90];
	mysql_format(m_Handle, query, sizeof(query), "DELETE FROM player_notes WHERE id = %i", NoteData[playerid][not_id][NoteID]);
	mysql_tquery(m_Handle, query);

	NoteData[playerid][not_id][NoteID] = 0;
	return 1;
}

IsPlayerInDMVVehicle(playerid)
{
	new
		vehicleid = GetPlayerVehicleID(playerid);

	if(!vehicleid)
		return 0;

	for(new i = 0; i < sizeof dmv_vehicles; i++)
	{
		if(vehicleid == dmv_vehicles[i])
			return 1;
	}

	return 0;
}

IsPlayerInTDVMVehicle(playerid)
{
	new
		vehicleid = GetPlayerVehicleID(playerid);

	if(!vehicleid)
		return 0;

	for(new i = 0; i < sizeof taxi_vehicles; i++)
	{
		if(vehicleid == taxi_vehicles[i])
			return 1;
	}

	return 0;
}

CancelDrivingTest(playerid)
{
	SetVehicleToRespawn(PlayerData[playerid][pTestCar]);
	ToggleVehicleEngine(PlayerData[playerid][pTestCar], false);
	CarEngine[PlayerData[playerid][pTestCar]] = false;

	PlayerData[playerid][pTestTime] = 0;
	PlayerData[playerid][pTestCar] = INVALID_VEHICLE_ID;
	PlayerData[playerid][pTestStage] = 0;

	DisablePlayerCheckpoint(playerid);
	PlayerData[playerid][pDrivingTest] = false;
	return 1;
}

CancelTaxiDrivingTest(playerid)
{
	SetVehicleToRespawn(PlayerData[playerid][pTestCar]);
	ToggleVehicleEngine(PlayerData[playerid][pTestCar], false);
	CarEngine[PlayerData[playerid][pTestCar]] = false;

	PlayerData[playerid][pTestTime] = 0;
	PlayerData[playerid][pTestCar] = INVALID_VEHICLE_ID;
	PlayerData[playerid][pTestStage] = 0;

	DisablePlayerCheckpoint(playerid);
	PlayerData[playerid][pTaxiDrivingTest] = false;
	return 1;
}

Clothing_Menu(playerid, listitem)
{
	SetPVarInt(playerid, "ClothingID", listitem);

	new
		primary[600], sub[128];

	new id = GetPVarInt(playerid, "ClothingID");

	format(sub, sizeof(sub), "Ýsim Deðiþtir:\t[{FFFF00}%s{FFFFFF}]\n", ClothingData[playerid][id][ClothingName]);
	strcat(primary, sub);

	format(sub, sizeof(sub), "Kemik Deðiþtir:\t[{FFFF00}%s{FFFFFF}]\n", Clothing_Bone(ClothingData[playerid][id][ClothingBoneID]));
	strcat(primary, sub);

	format(sub, sizeof(sub), "Slot Deðiþtir:\t[{FFFF00}%i{FFFFFF}]\n", ClothingData[playerid][id][ClothingSlotID]);
	strcat(primary, sub);

	strcat(primary, "Aksesuar Düzenle\n");

	format(sub, sizeof(sub), "Aksesuarý\t{FFFF00}%s\n", IsPlayerAttachedObjectSlotUsed(playerid, ClothingData[playerid][id][ClothingSlotID]) ? "Çýkar" : "Giy");
	strcat(primary, sub);

	format(sub, sizeof(sub), "Her Giriþte Otomatik\t{FFFF00}%s\n", ClothingData[playerid][id][ClothingAutoWear] ? "Giy" : "Giyme");
	strcat(primary, sub);

	strcat(primary, "Çoðalt\n");
  strcat(primary, "Yeni Pozisyonlarý Gir");

	Dialog_Show(playerid, CLOTHING_EDIT, DIALOG_STYLE_TABLIST, ClothingData[playerid][id][ClothingName], primary, "Seç", "<< Kapat");
	return 1;
}

Clothing_FreeSlot(playerid)
{
	for(new i = 0; i < MAX_CLOTHING_ITEMS; i++)
	{
		if(!ClothingData[playerid][i][ClothingID]) return i;
	}
	return -1;
}

/*Clothing_GetLimit(playerid)
{
	switch(PlayerData[playerid][pDonator])
	{
	    case 0: return 6;
		case 1: return 8;
		case 2: return 10;
		case 3: return 15;
	}
	return -1;
}*/

FreeAttachmentSlot(playerid)
{
	for(new i = 1; i < MAX_PLAYER_ATTACHED_OBJECTS; i++)
	{
		if(!IsPlayerAttachedObjectSlotUsed(playerid, i))
			return i;
	}
	return -1;
}

Clothing_Bone(id)
{
	new
		bone[20];

	switch(id)
	{
		case 1: bone = "Göðüs";
		case 2: bone = "Kafa";
		case 3: bone = "Sol Üst Kol";
		case 4: bone = "Sað Üst Kol";
		case 5: bone = "Sol Kol";
		case 6: bone = "Sað Kol";
		case 7: bone = "Sol Kalça";
		case 8: bone = "Sað Kalça";
		case 9: bone = "Sol Ayak";
		case 10: bone = "Sað Ayak";
		case 11: bone = "Sað Baldýr";
		case 12: bone = "Sol Baldýr";
		case 13: bone = "Sol Ön Kol";
		case 14: bone = "Sað Ön Kol";
		case 15: bone = "Sol Omuz";
		case 16: bone = "Sað Omuz";
		case 17: bone = "Boyun";
		case 18: bone = "Çene";
	}
	return bone;
}

Clothing_Create(playerid, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{
	new
		id = Clothing_FreeSlot(playerid);

	if(id == -1)
	{
		SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}Bir hata oluþtu, boþ slotun yok.");
		RemovePlayerAttachedObject(playerid, index);

		PlayerData[playerid][pBuyingClothing] = false;
		return 1;
	}

	ClothingData[playerid][id][ClothingOwnerID] = PlayerData[playerid][pSQLID];
	format(ClothingData[playerid][id][ClothingName], 32, "%s", PlayerData[playerid][pClothingName]);
	ClothingData[playerid][id][ClothingSlotID] = id, ClothingData[playerid][id][ClothingModelID] = modelid, ClothingData[playerid][id][ClothingBoneID] = boneid;
	ClothingData[playerid][id][ClothingPos][0] = fOffsetX, ClothingData[playerid][id][ClothingPos][1] = fOffsetY, ClothingData[playerid][id][ClothingPos][2] = fOffsetZ;
	ClothingData[playerid][id][ClothingRot][0] = fRotX, ClothingData[playerid][id][ClothingRot][1] = fRotY, ClothingData[playerid][id][ClothingRot][2] = fRotZ;
	ClothingData[playerid][id][ClothingScale][0] = fScaleX, ClothingData[playerid][id][ClothingScale][1] = fScaleY, ClothingData[playerid][id][ClothingScale][2] = fScaleZ;
	ClothingData[playerid][id][ClothingColor] = ClothingData[playerid][id][ClothingColor2] = 0xFFFFFFFF, ClothingData[playerid][id][ClothingAutoWear] = false;
	SendClientMessageEx(playerid, COLOR_WHITE, "SERVER: %s adlý aksesuarý satýn aldýnýz.", ClothingData[playerid][id][ClothingName]);
	RemovePlayerAttachedObject(playerid, index);

	mysql_tquery(m_Handle, "INSERT INTO player_clothing (color1) VALUES(0)", "OnPlayerClothingCreated", "ii", playerid, id);
	return 1;
}

Server:OnPlayerClothingCreated(playerid, id)
{
	ClothingData[playerid][id][ClothingID] = cache_insert_id();
	Clothing_Save(playerid, id);
	return 1;
}

Clothing_Save(playerid, id)
{
	new
	    query[354];

	mysql_format(m_Handle, query, sizeof(query), "UPDATE player_clothing SET player_dbid = %i, clothing_name = '%e', slot_id = %i, model_id = %i, bone_id = %i WHERE id = %i",
        ClothingData[playerid][id][ClothingOwnerID],
        ClothingData[playerid][id][ClothingName],
        ClothingData[playerid][id][ClothingSlotID],
        ClothingData[playerid][id][ClothingModelID],
		ClothingData[playerid][id][ClothingBoneID],
	   	ClothingData[playerid][id][ClothingID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE player_clothing SET pos_x = %f, pos_y = %f, pos_z = %f, rot_x = %f, rot_y = %f, rot_z = %f WHERE id = %i",
		ClothingData[playerid][id][ClothingPos][0],
		ClothingData[playerid][id][ClothingPos][1],
		ClothingData[playerid][id][ClothingPos][2],
		ClothingData[playerid][id][ClothingRot][0],
		ClothingData[playerid][id][ClothingRot][1],
		ClothingData[playerid][id][ClothingRot][2],
		ClothingData[playerid][id][ClothingID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE player_clothing SET scale_x = %f, scale_y = %f, scale_z = %f WHERE id = %i",
		ClothingData[playerid][id][ClothingScale][0],
	    ClothingData[playerid][id][ClothingScale][1],
	    ClothingData[playerid][id][ClothingScale][2],
	    ClothingData[playerid][id][ClothingID]
	);
  mysql_tquery(m_Handle, query);

  mysql_format(m_Handle, query, sizeof(query), "UPDATE player_clothing SET color1 = '%x', color2 = '%x' WHERE id = %i",
  ClothingData[playerid][id][ClothingColor],
    ClothingData[playerid][id][ClothingColor2],
    ClothingData[playerid][id][ClothingID]
  );
  mysql_tquery(m_Handle, query);
	return 1;
}

Clothing_List(playerid, type)
{
	SetPVarInt(playerid, "clothing_type", type);

	//new lookupQuery[200];
	//mysql_format(m_Handle, lookupQuery, sizeof lookupQuery, "SELECT * FROM clothings WHERE clothing_type = %i", type);
	//mysql_tquery(m_Handle, lookupQuery, "SQL_ClothingList", "ii", playerid, page);
	return 1;
}

Clothing_GetPrice(id)
{
	new query[75], price;
	mysql_format(m_Handle, query, sizeof(query), "SELECT clothing_price FROM clothings WHERE id = %i LIMIT 1", id);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name_int(0, "clothing_price", price);
	cache_delete(cache);
	return price;
}

Clothing_GetModel(id)
{
	new query[75], model_id;
	mysql_format(m_Handle, query, sizeof(query), "SELECT clothing_model FROM clothings WHERE id = %i LIMIT 1", id);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name_int(0, "clothing_model", model_id);
	cache_delete(cache);
	return model_id;
}

Clothing_GetName(id)
{
	new query[75], clothing_name[32];
	mysql_format(m_Handle, query, sizeof(query), "SELECT clothing_name FROM clothings WHERE id = %i LIMIT 1", id);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name(0, "clothing_name", clothing_name);
	cache_delete(cache);
	return clothing_name;
}

Clothing_GetNameFromModelID(id)
{
	new query[75], clothing_name[32];
	mysql_format(m_Handle, query, sizeof(query), "SELECT clothing_name FROM clothings WHERE clothing_model = %i LIMIT 1", id);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name(0, "clothing_name", clothing_name);
	cache_delete(cache);
	return clothing_name;
}

Clothing_GetPriceFromModelID(id)
{
	new query[75], price;
	mysql_format(m_Handle, query, sizeof(query), "SELECT clothing_price FROM clothings WHERE clothing_model = %i LIMIT 1", id);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name_int(0, "clothing_price", price);
	cache_delete(cache);
	return price;
}

Food_Type(id)
{
	new
		str[21];

	switch(id)
	{
	    case TYPE_PIZZA: str = "The_Well_Pizza_Stack";
	    case TYPE_BURGER: str = "Cluckin_Bell";
	    case TYPE_CHICKEN: str = "Burger_King";
	    case TYPE_DONUT: str = "Donut";
	    default: str = "Bilinmiyor";
	}
	return str;
}

Restaurant_Type(id)
{
	new
		str[21];

	switch(id)
	{
	    case TYPE_PIZZA: str = "Pizza Restaurant";
	    case TYPE_BURGER: str = "Burger Fast-Food";
	    case TYPE_CHICKEN: str = "Chicken Fast-Food";
	    case TYPE_DONUT: str = "Donut Fast-Food";
	    default: str = "Bilinmiyor";
	}
	return str;
}

Food_Menu(playerid, bool:toggle = true)
{
	if(toggle == true)
	{
		new
		    id = IsPlayerInBusiness(playerid);

		new str[512];

	    format(str, sizeof(str), "%s", Food_Type(FoodData[ BusinessData[id][BusinessFood][0] ][FoodType]));
	    PlayerTextDrawSetString(playerid, FoodOrder[playerid][1], str);

	    for(new i = 0; i < 3; i++)
	    {
			format(str, sizeof(str), "~r~Saglik:_+%d~n~~b~Ucret:_$%d", floatround(FoodData[ BusinessData[id][BusinessFood][i] ][FoodHealth]), BusinessData[id][BusinessFoodPrice][i] ? BusinessData[id][BusinessFoodPrice][i] : FoodData[ BusinessData[id][BusinessFood][i] ][FoodPrice]);
			PlayerTextDrawSetString(playerid, FoodOrder[playerid][i+10], str);

			format(str, sizeof(str), "%s", FoodData[ BusinessData[id][BusinessFood][i] ][FoodName]);
			PlayerTextDrawSetString(playerid, FoodOrder[playerid][i+7], str);
	    }

		PlayerTextDrawSetPreviewModel(playerid, FoodOrder[playerid][4], FoodData[ BusinessData[id][BusinessFood][0] ][FoodModel]);
		PlayerTextDrawSetPreviewModel(playerid, FoodOrder[playerid][5], FoodData[ BusinessData[id][BusinessFood][1] ][FoodModel]);
		PlayerTextDrawSetPreviewModel(playerid, FoodOrder[playerid][6], FoodData[ BusinessData[id][BusinessFood][2] ][FoodModel]);
	    SelectTextDraw(playerid, COLOR_GREY);

		for(new i = 0; i < 13; i++) PlayerTextDrawShow(playerid, FoodOrder[playerid][i]);
		SetPVarInt(playerid, "Viewing_FoodList", 1);
	}
	else
	{
		CancelSelectTextDraw(playerid);
		for(new i = 0; i < 13; i++) PlayerTextDrawHide(playerid, FoodOrder[playerid][i]);
		SetPVarInt(playerid, "Viewing_FoodList", 0);
	}
	return 1;
}

Meal_Drop(id)
{
	MealData[id][MealPlayerID] = -1;
	DestroyDynamicObject(MealData[id][MealObjectID]);
	MealData[id][MealModelID] = MealData[id][MealObjectID] = -1;
	MealData[id][MealPos][0] = MealData[id][MealPos][1] = MealData[id][MealPos][2] = 0.0;
	MealData[id][MealInterior] = MealData[id][MealWorld] = 0;
	MealData[id][MealEditing] = false;
	Iter_SafeRemove(Meals, id, id);
	return 1;
}

Meal_FreeID()
{
	if(Iter_Count(Meals) >= MAX_MEALS) foreach(new j : Meals) if(MealData[j][MealPlayerID] == -1)
 	{
 		Meal_Drop(j);
 		return j;
	}

	return Iter_Free(Meals);
}

GetNearestMeal(playerid)
{
    new mealid = PlayerData[playerid][pCarryMeal];
	if(mealid != -1) return PlayerData[playerid][pCarryMeal];

    foreach(new i : Meals) if(IsPlayerInRangeOfPoint(playerid, 2.5, MealData[i][MealPos][0], MealData[i][MealPos][1], MealData[i][MealPos][2]) && GetPlayerInterior(playerid) == MealData[i][MealInterior] && GetPlayerVirtualWorld(playerid) == MealData[i][MealWorld])
	{
		if(MealData[i][MealPlayerID] == -1) return i;
	}
	return -1;
}

OnPlayerFoodPurchase(playerid, food_id)
{
	new id = Meal_FreeID();
	if(id == -1) return SendErrorMessage(playerid, "Þu anda sýra gözüküyor, biraz bekleteceðim.");

	new Float: health;
	GetPlayerHealth(playerid, health);
	health += FoodData[food_id][FoodHealth];
	SetPlayerHealth(playerid, PlayerData[playerid][pMaxHealth]);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	MealData[id][MealModelID] = FoodData[food_id][FoodModel];
	MealData[id][MealPlayerID] = playerid;
	PlayerData[playerid][pCarryMeal] = id;

	SetPlayerAttachedObject(playerid, SLOT_MEAL, MealData[id][MealModelID], 1, 0.004999, 0.529999, 0.126999, -83.200004, 115.999961, -31.799890);
	SendClientMessage(playerid, COLOR_ADM, "ÝPUCU: Yemeðini /tepsi at komutuyla býrakabilirsin.");
	Iter_Add(Meals, id);
	return 1;
}

Food_Config(playerid)
{
	static id = -1;
	if((id = IsPlayerInBusiness(playerid)) == -1) return SendErrorMessage(playerid, "Herhangi bir iþyeri içerisinde deðilsin.");
	if(BusinessData[id][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu iþyerine sahip deðilsin.");
	if(BusinessData[id][BusinessType] != BUSINESS_RESTAURANT) return SendErrorMessage(playerid, "Bu iþyeri restaurant deðil.");

	new primary[512], sub[90];
	format(sub, sizeof(sub), "Restaurant Tipi {C3C3C3}[%s]{FFFFFF}\n", Restaurant_Type(BusinessData[id][BusinessRestaurantType]));
	strcat(primary, sub);

	format(sub, sizeof(sub), "1. Ürün {C3C3C3}[%s, $%d]{FFFFFF}\n", FoodData[ BusinessData[id][BusinessFood][0] ][FoodName], BusinessData[id][BusinessFoodPrice][0]);
	strcat(primary, sub);

	format(sub, sizeof(sub), "2. Ürün {C3C3C3}[%s, $%d]{FFFFFF}\n", FoodData[ BusinessData[id][BusinessFood][1] ][FoodName], BusinessData[id][BusinessFoodPrice][1]);
	strcat(primary, sub);

	format(sub, sizeof(sub), "3. Ürün {C3C3C3}[%s, $%d]{FFFFFF}\n", FoodData[ BusinessData[id][BusinessFood][2] ][FoodName], BusinessData[id][BusinessFoodPrice][2]);
	strcat(primary, sub);

	ShowPlayerDialog(playerid, DIALOG_FOOD_CONFIG, DIALOG_STYLE_LIST, "Restaurant: Yönetim Paneli", primary, "Tamam", "Kapat <<<");
	return 1;
}

Drop_Nearest(playerid)
{
	foreach(new i : Drops) if(IsPlayerInRangeOfPoint(playerid, 1.5, DropData[i][DropLocation][0], DropData[i][DropLocation][1], DropData[i][DropLocation][2]))
 	{
		if (GetPlayerInterior(playerid) == DropData[i][DropInterior] && GetPlayerVirtualWorld(playerid) == DropData[i][DropWorld])
			return i;
	}
	return -1;
}

Faction_List(playerid, page = 0)
{
	SetPVarInt(playerid, "Faction_idx", page);

  /*new primary_str[1024], sub[1024];
  foreach(new i : Factions)
  {
    format(sub, sizeof(sub), "{7E98B6}%i\t{7E98B6}%s\t{7E98B6}[%d / %i]\n", i, FactionData[i][FactionName], CountOnlineMembers(i), CountFactionMembers(i)); //  [%i / %i] CountOnlineMembers(id), CountFactionMembers(id)
    strcat(primary_str, sub);
  }

  Dialog_Show(playerid, FACTION_LIST, DIALOG_STYLE_TABLIST, "{7E98B6}Birlikler", primary_str, "<<< Çýkýþ", "");*/

  new query[82];
	mysql_format(m_Handle, query, sizeof(query), "SELECT id, Name FROM factions LIMIT %d, 25", page*MAX_CLOTHING_SHOW);
	mysql_tquery(m_Handle, query, "SQL_FactionList", "ii", playerid, page);
	return 1;
}

Faction_Member_List(playerid, page = 0)
{
	SetPVarInt(playerid, "Faction_member_idx", page);

    new query[144];
	mysql_format(m_Handle, query, sizeof(query), "SELECT Name, LastTime, FactionRank FROM players WHERE Faction = %i ORDER BY FactionRank ASC LIMIT %i, 25", PlayerData[playerid][pFaction], page*MAX_CLOTHING_SHOW);
	mysql_tquery(m_Handle, query, "SQL_FactionMemberList", "ii", playerid, page);
	return 1;
}

stock ShowYourFactionMenu(playerid)
{
	new primary_str[600];
	new sub_str[200];

	format(sub_str, sizeof(sub_str), "Birlik Adý: [{AFAFAF}%s{FFFFFF}]\n", Faction_GetName(PlayerData[playerid][pFaction]));
	strcat(primary_str, sub_str);

	format(sub_str, sizeof(sub_str), "Birlik Kýsaltmasý: [{AFAFAF}%s{FFFFFF}]\n", FactionData[PlayerData[playerid][pFaction]][FactionAbbrev]);
	strcat(primary_str, sub_str);

	format(sub_str, sizeof(sub_str), "Düzenleme Rütbesi: [{AFAFAF}%s{FFFFFF}]\n", FactionRanks[PlayerData[playerid][pFaction]][FactionData[PlayerData[playerid][pFaction]][FactionEditrank]]);
	strcat(primary_str, sub_str);

	format(sub_str, sizeof(sub_str), "TOW Rütbesi: [{AFAFAF}%s{FFFFFF}]\n", FactionRanks[PlayerData[playerid][pFaction]][FactionData[PlayerData[playerid][pFaction]][FactionTowrank]]);
	strcat(primary_str, sub_str);

	format(sub_str, sizeof(sub_str), "/f Rütbesi: [{AFAFAF}%s{FFFFFF}]\n", FactionRanks[PlayerData[playerid][pFaction]][FactionData[PlayerData[playerid][pFaction]][FactionChatrank]]);
	strcat(primary_str, sub_str);

	format(sub_str, sizeof(sub_str), "Giriþ Rütbesi: [{AFAFAF}%s{FFFFFF}]\n", FactionRanks[PlayerData[playerid][pFaction]][FactionData[PlayerData[playerid][pFaction]][FactionMaxRanks]]);
	strcat(primary_str, sub_str);

	strcat(primary_str, "{ADC3E7}Birlik Rütbelerini Düzenle\n");
	strcat(primary_str, "{ADC3E7}Birlik Maaþlarýný Düzenle");

	ShowPlayerDialog(playerid, DIALOG_FACTIONMENU, DIALOG_STYLE_LIST, "Birlik Yönetimi", primary_str, "Seç", "Ýptal");
	return 1;
}

ShowYourFactionMenuAlt(playerid, listitem)
{
	new
		primary_str[1100], sub_str[200];

	switch(listitem)
	{
		case 0: // Name
		{
			if(PlayerData[playerid][pFactionRank] != 1)
			{
				SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Birlik ismini sadece en üst rütbe deðiþtirebilir.");
				return ShowYourFactionMenu(playerid);
			}

			format(sub_str, sizeof sub_str, "{AFAFAF}Birlik adýný düzenliyorsun: %s.\n\n", Faction_GetName(PlayerData[playerid][pFaction]));
			strcat(primary_str, sub_str);

			strcat(primary_str, "Birlik adýnýz BÝRLÝK YÖNETÝMÝ EKÝBÝNE baþvurulup deðiþtirilmelidir.\n");
			strcat(primary_str, "Ýzinleri kötüye kullanan birlik liderlerinin birlikleri kaldýrýlýr.\n\n");

			strcat(primary_str, "Lütfen 3 ile 60 karakter arasýnda bir birlik adý girin:\n");

			ShowPlayerDialog(playerid, DIALOG_FACTIONMENU_NAME, DIALOG_STYLE_INPUT, BIRLIK_BASLIK"Ýsim", primary_str, "Deðiþtir", "<<");
		}
		case 1: // Abbreviation
		{
			format(sub_str, sizeof sub_str, "{AFAFAF}Birlik kýsaltmasýný düzenliyorsun: %s.\n\n", FactionData[PlayerData[playerid][pFaction]][FactionAbbrev]);
			strcat(primary_str, sub_str);

			strcat(primary_str, "Birlik kýsaltmasý genelde /departman komutunu kullanabilen birlikler içindir.\n");
			strcat(primary_str, "Eðer bu komutu kullanamýyorsanýz kýsaltmayý eklemeyi/düzenlemeyi pas geçebilirsiniz.\n\n");

			strcat(primary_str, "Lütfen birliðinizin kýsaltmasýný 7 karakterin altýnda tutun. Örnek: \"LSPD\" yada \"LSFD\". ");

			ShowPlayerDialog(playerid, DIALOG_FACTIONMENU_ABBREV, DIALOG_STYLE_INPUT, BIRLIK_BASLIK"Kýsaltma", primary_str, "Deðiþtir", "<<");
		}
		case 2: //Alter Rank
		{
			if(PlayerData[playerid][pFactionRank] != 1)
			{
				SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Birlik rütbe deðiþtirme yetkisini sadece en üst rütbe deðiþtirebilir.");
				return ShowYourFactionMenu(playerid);
			}

			format(sub_str, sizeof sub_str, "{AFAFAF}Birliði düzenleme rütbesini deðiþtiriyorsun: %s [%i].\n\n", FactionRanks[PlayerData[playerid][pFaction]][FactionData[PlayerData[playerid][pFaction]][FactionEditrank]], FactionData[PlayerData[playerid][pFaction]][FactionEditrank]);
			strcat(primary_str, sub_str);

			strcat(primary_str, "Düzenleme rütbesi aþaðýdaki komutlarý kullanabilir:\n\n");
			strcat(primary_str, "\t\t/frutbeayarla, /fdavet, /birlikpanel, /fkapat ve /gov.\n\n");

			strcat(primary_str, "Akýllýca atayýn. Lütfen bu izinlere sahip olmasýný istediðiniz rütbe numarasýný girin.");

			ShowPlayerDialog(playerid, DIALOG_FACTIONMENU_ALTER, DIALOG_STYLE_INPUT, BIRLIK_BASLIK"Düzenleme Rütbesi", primary_str, "Düzenle", "<<");
		}
		case 3: //Tow Rank
		{
			format(sub_str, sizeof sub_str, "{AFAFAF}Birliðin araçlarýný respawnlama rütbesini deðiþtiriyorsun: %s [%i].\n\n", FactionRanks[PlayerData[playerid][pFaction]][FactionData[PlayerData[playerid][pFaction]][FactionTowrank]], FactionData[PlayerData[playerid][pFaction]][FactionTowrank]);
			strcat(primary_str, sub_str);

			strcat(primary_str, "Bu rütbeye sahip olacak kiþiler /fpark komutunu kulanabileceklerdir.\nLütfen bu izinlere sahip olmasýný istediðiniz rütbe numarasýný girin.");
			ShowPlayerDialog(playerid, DIALOG_FACTIONMENU_TOW, DIALOG_STYLE_INPUT, BIRLIK_BASLIK"TOW Rütbesi", primary_str, "Düzenle", "<<");
		}
		case 4: //Chat Rank
		{
			format(sub_str, sizeof sub_str, "{AFAFAF}Birliðin chat kýsmýný kullanabilecek rütbeyi düzenliyorsun: %s [%i].\n\n", FactionRanks[PlayerData[playerid][pFaction]][FactionData[PlayerData[playerid][pFaction]][FactionChatrank]], FactionData[PlayerData[playerid][pFaction]][FactionChatrank]);
			strcat(primary_str, sub_str);

			strcat(primary_str, "Bu rütbeye sahip olacak kiþiler /f komutunu kulanabileceklerdir.\nLütfen bu izinlere sahip olmasýný istediðiniz rütbe numarasýný girin.");
			ShowPlayerDialog(playerid, DIALOG_FACTIONMENU_CHAT, DIALOG_STYLE_INPUT, BIRLIK_BASLIK"Chat Rütbesi", primary_str, "Düzenle", "<<");
		}
		case 5: //Join Rank
		{
			format(sub_str, sizeof sub_str, "{AFAFAF}Birliðin davet etme rütbesini düzenliyorsun: %s [%i].\n\n", FactionRanks[PlayerData[playerid][pFaction]][FactionData[PlayerData[playerid][pFaction]][FactionMaxRanks]], FactionData[PlayerData[playerid][pFaction]][FactionMaxRanks]);
			strcat(primary_str, sub_str);

			strcat(primary_str, "Bu rütbeye sahip olacak kiþiler /fdavet komutunu kulanabileceklerdir.\nLütfen bu izinlere sahip olmasýný istediðiniz rütbe numarasýný girin.");
			ShowPlayerDialog(playerid, DIALOG_FACTIONMENU_JOIN, DIALOG_STYLE_INPUT, BIRLIK_BASLIK"Davet Rütbesi", primary_str, "Düzenle", "<<");
		}
		case 6: //Edit ranks
		{
			for(new i = 1; i < MAX_FACTION_RANKS; i++)
			{
				format(sub_str, sizeof sub_str, "%s [%i]\n", FactionRanks[PlayerData[playerid][pFaction]][i], i);
				strcat(primary_str, sub_str);
			}

			ShowPlayerDialog(playerid, DIALOG_FACTIONMENU_EDIT, DIALOG_STYLE_LIST, BIRLIK_BASLIK"Rütbe Düzenle", primary_str, "Seç", "<<");
		}
		case 7: // Edit ranks' salary
		{
			for(new i = 1; i < MAX_FACTION_RANKS; i++)
			{
				format(sub_str, sizeof sub_str, "%s [%i] {AFAFAF}$%s\n", FactionRanks[PlayerData[playerid][pFaction]][i], i, MoneyFormat(FactionRanksSalary[PlayerData[playerid][pFaction]][i]));
				strcat(primary_str, sub_str);
			}

			ShowPlayerDialog(playerid, DIALOG_FACTIONMENU_EDITSAL, DIALOG_STYLE_LIST, BIRLIK_BASLIK"Maaþ Düzenle", primary_str, "Seç", "<<");
		}
		case 8: // Edit ranks alt
		{
			new rank_id;
			rank_id = GetPVarInt(playerid, "SelectedRank");

			if(rank_id == 1 && PlayerData[playerid][pFactionRank] != 1)
			{
				SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Birlik rütbe düzenleme yetkisini sadece en üst rütbe deðiþtirebilir.");
				for(new i = 1; i < MAX_FACTION_RANKS; i++)
				{
					format(sub_str, sizeof sub_str, "%s [%i]\n", FactionRanks[PlayerData[playerid][pFaction]][i], i);
					strcat(primary_str, sub_str);
				}

				ShowPlayerDialog(playerid, DIALOG_FACTIONMENU_EDIT, DIALOG_STYLE_LIST, BIRLIK_BASLIK"Rütbe Düzenle", primary_str, "Düzenle", "<<");
			    return 1;
			}

			format(sub_str, sizeof sub_str, "Düzenlenen Rütbe: %s [%i].\n", FactionRanks[PlayerData[playerid][pFaction]][rank_id], rank_id);
			strcat(primary_str, sub_str);

			strcat(primary_str, "Bu rütbe için yeni adýný girin.");
			ShowPlayerDialog(playerid, DIALOG_FACTIONMENU_EDITALT, DIALOG_STYLE_INPUT, BIRLIK_BASLIK"Rütbe Düzenle", primary_str, "Düzenle", "<<");
		}
		case 9: // Edit ranks' salary alt
		{
			new rank_id;
			rank_id = GetPVarInt(playerid, "SelectedRank");

			if(rank_id == 1 && PlayerData[playerid][pFactionRank] != 1)
			{
				SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Birlik maaþ düzenleme yetkisini sadece en üst rütbe deðiþtirebilir.");
				for(new i = 1; i < MAX_FACTION_RANKS; i++)
				{
					format(sub_str, sizeof sub_str, "%s [%i] {AFAFAF}$%s\n", FactionRanks[PlayerData[playerid][pFaction]][i], i, MoneyFormat(FactionRanksSalary[PlayerData[playerid][pFaction]][i]));
					strcat(primary_str, sub_str);
				}

				ShowPlayerDialog(playerid, DIALOG_FACTIONMENU_EDITSAL, DIALOG_STYLE_LIST, BIRLIK_BASLIK"Maaþ Düzenle", primary_str, "Seç", "<<");
			    return 1;
			}

			format(sub_str, sizeof sub_str, "Düzenlenen Rütbe: %s [%i] ($%s).\n", FactionRanks[PlayerData[playerid][pFaction]][rank_id], rank_id, MoneyFormat(FactionRanksSalary[PlayerData[playerid][pFaction]][rank_id]));
			strcat(primary_str, sub_str);

			strcat(primary_str, "Bu rütbe için yeni maaþ miktarýný girin.");
			ShowPlayerDialog(playerid, DIALOG_FACTIONMENU_EDITALTSAL, DIALOG_STYLE_INPUT, BIRLIK_BASLIK"Maaþ Düzenle", primary_str, "Düzenle", "<<");
		}
	}
	return 1;
}

stock IsIllegalFaction(playerid)
{
	if(PlayerData[playerid][pFaction] == -1)
		return 0;

	new Factionid = PlayerData[playerid][pFaction];

	if(!FactionData[Factionid][FactionCopPerms] && !FactionData[Factionid][FactionMedPerms])
		return 1;

	return 0;
}

IsPoliceFaction(playerid)
{
	if(PlayerData[playerid][pFaction] == -1)
		return 0;

	new Factionid = PlayerData[playerid][pFaction];

	if (FactionData[Factionid][FactionCopPerms])
		return 1;

	return 0;
}

IsMedicFaction(playerid)
{
	if(PlayerData[playerid][pFaction] == -1)
		return 0;

	new Factionid = PlayerData[playerid][pFaction];

	if (FactionData[Factionid][FactionMedPerms])
		return 1;

	return 0;
}

IsLAWFaction(playerid)
{
	if(PlayerData[playerid][pFaction] == -1)
		return 0;

	new Factionid = PlayerData[playerid][pFaction];
	if (FactionData[Factionid][FactionMedPerms] || FactionData[Factionid][FactionCopPerms])
		return 1;

	return 0;
}

APB_RouteCommands(playerid, cmdtext[])
{
    new command[8], parameters[128];
    sscanf(cmdtext, "s[8]s[128]", command, parameters);

	if(strlen(command) == 0) {
		SendClientMessage(playerid, COLOR_GREY, "KULLANIM: /apb [komut]");
		SendClientMessage(playerid, COLOR_GREY, "Ýpucu: '/apb yardim' yazarak tüm listeyi görebilirsin.");
		return 1;
	}

    if(strcmp("yarat", command) == 0) APBCMD_Create(playerid, parameters);
    else if(strcmp("sil", command) == 0) APBCMD_Delete(playerid, parameters);
    else if(strcmp("duzenle", command) == 0) APBCMD_Edit(playerid, parameters);
    else if(strcmp("detay", command) == 0) APBCMD_Info(playerid, parameters);
	else if(strcmp("liste", command) == 0) APBCMD_List(playerid);
 	else if(strcmp("yardim", command) == 0) APBCMD_Help(playerid);
	return 1;
}

APBCMD_Create(const playerid, const parameters[]) {
	new apb_text[128];

	if(sscanf(parameters, "s[128]", apb_text)) {
		SendUsageMessage(playerid, "/apb yarat [içerik]");
		return 1;
	}

	if(strlen(apb_text) < 10 || strlen(apb_text) > 128) {
		SendErrorMessage(playerid, "APB içeriði en az 10 karakter en fazla 128 karakter olmalýdýr.");
		return 1;
	}

	new id = Iter_Free(Bullettins);
	if(id == -1) {
		SendErrorMessage(playerid, "Listede çok fazla APB bulunuyor, ekleyebilmek için listeden bir kaçýný temizlemen gerekiyor.");
		return 1;
	}

	new query[454];
	mysql_format(m_Handle, query, sizeof(query), "INSERT INTO bulletins (BullettinDetails, BullettinBy, BulletinDate) VALUES('%e', %i, %i)", apb_text, PlayerData[playerid][pSQLID], Time());
	new Cache:cache = mysql_query(m_Handle, query);

	APBData[id][BulletinID] = cache_insert_id();
	format(APBData[id][BulletinDetails], 128, "%s", apb_text);
	APBData[id][BulletinBy] = PlayerData[playerid][pSQLID];
	APBData[id][BulletinDate] = Time();

	Iter_Add(Bullettins, id);
	SendLawMessage(COLOR_ADM, sprintf("%s %s yeni bir APB kaydý ekledi. (/apb detay %i)", Player_GetFactionRank(playerid), ReturnName(playerid, 0), id+1));

	cache_delete(cache);
    return 1;
}

APBCMD_Delete(const playerid, const parameters[]) {
	new id;

	if(sscanf(parameters, "i", id)) {
		SendUsageMessage(playerid, "/apb sil [apb ID]");
		return 1;
	}

	if(!Iter_Contains(Bullettins, (id-1))) {
		SendErrorMessage(playerid, "Belirttiðin APB kayýdý bulunamadý.");
		return 1;
	}

	Iter_Remove(Bullettins, id-1);
	SendLawMessage(COLOR_ADM, sprintf("%s %s %d numaralý APB kaydýný temizledi!", Player_GetFactionRank(playerid), ReturnName(playerid, 0), id));

	new query[60];
	mysql_format(m_Handle, query, sizeof(query), "DELETE FROM bullettins WHERE id = %i", APBData[id-1][BulletinID]);
	mysql_tquery(m_Handle, query);
	return 1;
}

APBCMD_Edit(const playerid, const parameters[]) {
	new id, apb_text[128];

	if(sscanf(parameters, "is[128]", id, apb_text)) {
		SendUsageMessage(playerid, "/apb duzenle [apb ID] [içerik]");
		return 1;
	}

	if(!Iter_Contains(Bullettins, (id-1))) {
		SendErrorMessage(playerid, "Belirttiðin APB kayýdý bulunamadý.");
		return 1;
	}

	if(strlen(apb_text) < 10 || strlen(apb_text) > 128) {
		SendErrorMessage(playerid, "APB içeriði en az 10 karakter en fazla 128 karakter olmalýdýr.");
		return 1;
	}

	SendLawMessage(COLOR_ADM, sprintf("%s %s %d numaralý APB kaydýný düzenledi!", Player_GetFactionRank(playerid), ReturnName(playerid, 0), id));
	format(APBData[id-1][BulletinDetails], 128, "%s", apb_text);
	APBData[id-1][BulletinBy] = PlayerData[playerid][pSQLID];
	APBData[id-1][BulletinDate] = Time();

	new query[255];
	mysql_format(m_Handle, query, sizeof(query), "UPDATE bullettins SET BullettinDetails = '%e', BullettinBy = %i, BullettinDate = %i WHERE id = %i", APBData[id-1][BulletinDetails], APBData[id-1][BulletinBy], APBData[id-1][BulletinDate], APBData[id-1][BulletinID]);
	mysql_tquery(m_Handle, query);
	return 1;
}

APBCMD_Info(const playerid, const parameters[]) {
	new id;

	if(sscanf(parameters, "i", id)) {
		SendUsageMessage(playerid, "/apb detay [apb ID]");
		return 1;
	}

	if(!Iter_Contains(Bullettins, (id-1))) {
		SendErrorMessage(playerid, "Belirttiðin APB kayýdý bulunamadý.");
		return 1;
	}

	SendClientMessageEx(playerid, COLOR_ADM, "___________All Point Bulletin(%i)_________", id);
	SendClientMessageEx(playerid, COLOR_ADM, "Ýçerik: %s", APBData[id-1][BulletinDetails]);
	SendClientMessageEx(playerid, COLOR_ADM, "Ekleyen: %s", ReturnSQLName(APBData[id-1][BulletinBy]));
	SendClientMessageEx(playerid, COLOR_ADM, "Tarih: %s", GetFullTime(APBData[id-1][BulletinDate]));
	SendClientMessage(playerid, COLOR_ADM, "_______________________________________");
	return 1;
}

APBCMD_List(const playerid)
{
	SendClientMessageEx(playerid, COLOR_ADM, "___________All Point Bulletins(%i)_________", Iter_Count(Bullettins));
	foreach(new i : Bullettins) SendClientMessageEx(playerid, COLOR_ADM, "%i. APB: %s", (i+1), APBData[i][BulletinDetails]);
	SendClientMessage(playerid, COLOR_ADM, "_______________________________________");
	return 1;
}

APBCMD_Help(const playerid) {
	SendClientMessage(playerid, COLOR_ORANGE, "APB Sistemi:");
	SendClientMessage(playerid, COLOR_ORANGE, "/apb yarat - [þüpheli]//[suçlar] (John Doe, Kýrmýzý Sentinel // Cinayet)");
	SendClientMessage(playerid, COLOR_ORANGE, "/apb sil - Belirtilen APB kaydýný kalýcý olarak siler.");
	SendClientMessage(playerid, COLOR_ORANGE, "/apb detay - Belirtilen APB kaydýnýn detaylarýný gösterir.");
	SendClientMessage(playerid, COLOR_ORANGE, "/apb duzenle - Belirtilen APB kaydýný düzenler.");
	SendClientMessage(playerid, COLOR_ORANGE, "/apb liste - Tüm APB kayýtlarýný listeler.");
	return 1;
}

Roadblock_RouteCommands(playerid, cmdtext[])
{
    new command[6];
    sscanf(cmdtext, "s[8]", command);

	if(strlen(command) == 0) {
		SendClientMessage(playerid, COLOR_GREY, "KULLANIM: /engel [komut]");
		SendClientMessage(playerid, COLOR_GREY, "Ýpucu: '/engel yardim' yazarak tüm listeyi görebilirsin.");
		return 1;
	}

    if(strcmp("ekle", command) == 0) RoadblockCMD_Create(playerid);
    else if(strcmp("kaldir", command) == 0) RoadblockCMD_Delete(playerid);
    else if(strcmp("duzenle", command) == 0) RoadblockCMD_Edit(playerid);
	else if(strcmp("liste", command) == 0) RoadblockCMD_List(playerid);
 	else if(strcmp("yardim", command) == 0) RoadblockCMD_Help(playerid);
	return 1;
}

RoadblockCMD_Create(const playerid)
{
	if(EditingObject[playerid]) return SendErrorMessage(playerid, "Þu anda baþka bir obje düzenliyorsun.");
	Roadblock_List(playerid);
    return 1;
}

RoadblockCMD_Edit(const playerid)
{
	if(EditingObject[playerid]) return SendErrorMessage(playerid, "Þu anda baþka bir obje düzenliyorsun.");

	new id = -1;
	if((id = Roadblock_Nearest(playerid)) != -1)
	{
		EditingID[playerid] = id;
		EditingObject[playerid] = 6;
		EditDynamicObject(playerid, RoadblockData[id][RoadblockObject]);
	}
	else SendErrorMessage(playerid, "Yakýnýnda engel bulunmuyor.");
    return 1;
}

RoadblockCMD_Delete(const playerid)
{
	if(EditingObject[playerid]) return SendErrorMessage(playerid, "Þu anda baþka bir obje düzenliyorsun.");

	new
		id = -1;

	if((id = Roadblock_Nearest(playerid)) != -1)
	{
		ConfirmDialog(playerid, "Onay", sprintf("Yakýnýndaki '{ADC3E7}%s{FFFFFF}' isimli engeli kaldýrmak konusunda emin misin?", RoadblockData[id][RoadblockName]), "OnRoadblockDisband", id);
	}
	else SendErrorMessage(playerid, "Yakýnýnda engel bulunmuyor.");
    return 1;
}

Roadblock_Nearest(playerid)
{
	return GetPVarInt(playerid, "AtSpike");
}

Roadblock_Create(playerid, modelid, block_name[])
{
	new id = Iter_Free(Roadblocks);
	if(id == -1) return SendErrorMessage(playerid, "Þu anda daha fazla engel eklenemiyor.");

    RoadblockData[id][RoadblockModelID] = modelid;
	if(modelid == 2892 || modelid == 2899) RoadblockData[id][RoadblockSpikes] = true;
	GetPlayerPos(playerid, RoadblockData[id][RoadblockPos][0], RoadblockData[id][RoadblockPos][1], RoadblockData[id][RoadblockPos][2]);
	GetXYInFrontOfPlayer(playerid, RoadblockData[id][RoadblockPos][0], RoadblockData[id][RoadblockPos][1], 1.0);
	RoadblockData[id][RoadblockPos][3] = RoadblockData[id][RoadblockPos][4] = RoadblockData[id][RoadblockPos][5] = 0.0;
    RoadblockData[id][RoadblockInterior] = GetPlayerInterior(playerid);
    RoadblockData[id][RoadblockWorld] = GetPlayerVirtualWorld(playerid);

	format(RoadblockData[id][RoadblockName], 25, "%s", block_name);
	format(RoadblockData[id][RoadblockPlacedBy], 25, "%s", ReturnName(playerid));
   	format(RoadblockData[id][RoadblockLocation], 40, "%s", Player_GetLocation(playerid));
	Iter_Add(Roadblocks, id);

	EditingID[playerid] = id;
	EditingObject[playerid] = 6;
	RoadblockData[id][RoadblockObject] = CreateDynamicObject(RoadblockData[id][RoadblockModelID], RoadblockData[id][RoadblockPos][0], RoadblockData[id][RoadblockPos][1], RoadblockData[id][RoadblockPos][2], RoadblockData[id][RoadblockPos][3], RoadblockData[id][RoadblockPos][4], RoadblockData[id][RoadblockPos][5], RoadblockData[id][RoadblockWorld], RoadblockData[id][RoadblockInterior]);
	EditDynamicObject(playerid, RoadblockData[id][RoadblockObject]);

	new array[2]; array[0] = 23; array[1] = id;
	RoadblockData[id][RoadblockAreaID] = CreateDynamicSphere(RoadblockData[id][RoadblockPos][0], RoadblockData[id][RoadblockPos][1], RoadblockData[id][RoadblockPos][2], 3.5, RoadblockData[id][RoadblockWorld], RoadblockData[id][RoadblockInterior]);
	Streamer_SetArrayData(STREAMER_TYPE_AREA, RoadblockData[id][RoadblockAreaID], E_STREAMER_EXTRA_ID, array, 2);

	SendClientMessageEx(playerid, -1, "SERVER: {ADC3E7}%s {FFFFFF}tipinde engel ekliyorsun. Duracaðý noktayý ayarlayýp kaydet.", RoadblockData[id][RoadblockName]);
	return 1;
}

Roadblock_Refresh(id)
{
    if(IsValidDynamicObject(RoadblockData[id][RoadblockObject])) DestroyDynamicObject(RoadblockData[id][RoadblockObject]);
	if(IsValidDynamicArea(RoadblockData[id][RoadblockAreaID])) {
    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, RoadblockData[id][RoadblockAreaID], E_STREAMER_PLAYER_ID, id);
	    DestroyDynamicArea(RoadblockData[id][RoadblockAreaID]);
	}

	RoadblockData[id][RoadblockObject] = CreateDynamicObject(RoadblockData[id][RoadblockModelID], RoadblockData[id][RoadblockPos][0], RoadblockData[id][RoadblockPos][1], RoadblockData[id][RoadblockPos][2], RoadblockData[id][RoadblockPos][3], RoadblockData[id][RoadblockPos][4], RoadblockData[id][RoadblockPos][5], RoadblockData[id][RoadblockWorld], RoadblockData[id][RoadblockInterior]);
	new array[2]; array[0] = 23; array[1] = id;
	RoadblockData[id][RoadblockAreaID] = CreateDynamicSphere(RoadblockData[id][RoadblockPos][0], RoadblockData[id][RoadblockPos][1], RoadblockData[id][RoadblockPos][2], 3.5, RoadblockData[id][RoadblockWorld], RoadblockData[id][RoadblockInterior]);
	Streamer_SetArrayData(STREAMER_TYPE_AREA, RoadblockData[id][RoadblockAreaID], E_STREAMER_EXTRA_ID, array, 2);
	return 1;
}

RoadblockCMD_List(const playerid)
{
	new
		primary[600], sub[100], count = 0;

    foreach(new i : Roadblocks)
	{
		format(sub, sizeof(sub), "%s {AFAFAF}[%s - %s]\n", RoadblockData[i][RoadblockName], RoadblockData[i][RoadblockPlacedBy], RoadblockData[i][RoadblockLocation]);
		strcat(primary, sub);
		count++;
	}

	if(!count) return SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}Hiç engel bulunamadý.");
	else ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_LIST, "Aktif Engel Listesi", primary, "Tamam", "<<");
	return 1;
}

RoadblockCMD_Help(const playerid)
{
	SendClientMessage(playerid, COLOR_ORANGE, "Engel Sistemi:");
	SendClientMessage(playerid, COLOR_ORANGE, "/engel ekle - Yakýnýnýza engeli eklemeyi saðlar.");
	SendClientMessage(playerid, COLOR_ORANGE, "/engel kaldir - Yakýnýnýzdaki engeli kaldýrmayý saðlar.");
	SendClientMessage(playerid, COLOR_ORANGE, "/engel duzenle - Yakýnýnýzdaki engeli düzenlemenizi saðlar.");
	SendClientMessage(playerid, COLOR_ORANGE, "/engel liste - Eklenmiþ engelleri görmenizi saðlar.");
	return 1;
}

/*stock ShowFAttachmentList(playerid, type, page)
{
	new str[1250];
    str = PlayerData[playerid][pAdminDuty] ? ("Aksesuar ID\tAksesuar\tFiyat\n") : ("Aksesuar\tFiyat\n");

	PlayerUniformPage[playerid] = page;

	if(page == 1)
		format(str, sizeof(str), "%s{FFFF00}Sayfa 1\n", str);
	else
		format(str, sizeof(str), "%s{FFFF00}<< Sayfa %d\n", str, page-1);

	page--;

	new counter = 0;

	for(new i = 0; i < MAX_SKINS; i++) if (FAttData[i][f_is_exists] && FAttData[i][f_faction_id] == type)
	{
		counter++;
	}

	new bool:toSecondPage = false, countItems = 0;

	for(new i = page*MAX_CLOTHING_SHOW; i < counter; i++)
	{
		countItems++;

		if(countItems == MAX_CLOTHING_SHOW+1)
		{
			toSecondPage = true;
			break;
		}
		else
		{
		    if(PlayerData[playerid][pAdminDuty])
				format(str, sizeof(str), "%s{FFFFFF}%i\t%s\t$%i\n", str, FAttData[i][f_arr_id], FAttData[i][f_att_name], FAttData[i][f_att_price]);
			else
			    format(str, sizeof(str), "%s{FFFFFF}%s\t$%i\n", str, FAttData[i][f_att_name], FAttData[i][f_att_price]);

			UniformItemSelector[playerid][countItems-1] = i;
		}
	}

	if(toSecondPage) {
		format(str, sizeof(str), "%s{FFFF00}Sayfa %d >>\n", str, (page+1)+1);
	}

	new baslik[35];
	format(baslik, sizeof(baslik), "%s: Aksesuarlar", FactionData[PlayerData[playerid][pFaction]][FactionAbbrev]);
	ShowPlayerDialog(playerid, DIALOG_ATTACHMENTS, DIALOG_STYLE_TABLIST_HEADERS, baslik, str, "Satýnal", "<<<");
	return 1;
}*/

Label_RouteCommands(playerid, cmdtext[])
{
    new command[7], parameters[112];
    sscanf(cmdtext, "s[7]s[112]", command, parameters);

	if(strlen(command) == 0) {
		SendClientMessage(playerid, COLOR_GREY, "KULLANIM: /label [komut]");
		SendClientMessage(playerid, COLOR_GREY, "Ýpucu: '/label yardim' yazarak tüm listeyi görebilirsin.");
		return 1;
	}

    if(strcmp("ekle", command) == 0) LabelCMD_Create(playerid, parameters);
    else if(strcmp("kaldir", command) == 0) LabelCMD_Delete(playerid);
    else if(strcmp("liste", command) == 0) LabelCMD_List(playerid);
    else if(strcmp("yardim", command) == 0) LabelCMD_Help(playerid);
	return 1;
}

LabelCMD_Create(const playerid, const parameters[])
{
	new label_name[35];
	if(sscanf(parameters, "s[35]", label_name)) {
		SendClientMessage(playerid, COLOR_GREY, "KULLANIM: /label ekle [içerik]");
		return 1;
	}

	Label_Create(playerid, label_name);
    return 1;
}

LabelCMD_Delete(const playerid)
{
	if(EditingObject[playerid]) return SendErrorMessage(playerid, "Þu anda baþka bir obje düzenliyorsun.");

	new id;
	if((id = Label_Nearest(playerid)) != -1)
	{
		ConfirmDialog(playerid, "Onay", "{FFFFFF}Yakýnýndaki '{ADC3E7}bilgi yazýsýný{FFFFFF}' kaldýrmak konusunda emin misin?", "OnLabelDisband", id);
	}
	else SendErrorMessage(playerid, "Yakýnýnda bilgi yazýsý bulunmuyor.");
    return 1;
}

LabelCMD_List(const playerid) {

	new
		label_found,
		liststr[256];

    foreach(new i : Labels)
	{
		label_found++;
		format(liststr, sizeof(liststr), "%sBilgi Yazýsý {AFAFAF}[%s - %s]\n", liststr, LabelData[i][label_placedby], LabelData[i][label_location]);
	}

	if(label_found) return ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_LIST, "PD: Aktif Bilgi Yazýlarý", liststr, "Tamam", "<<");
	else ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_LIST, "PD: Aktif Bilgi Yazýlarý", "Hiç bilgi yazýsý bulunamadý.", "Tamam", "<<");
	return 1;
}

LabelCMD_Help(const playerid) {
	SendClientMessage(playerid, COLOR_ORANGE, "Bilgi Yazýsý Sistemi:");
	SendClientMessage(playerid, COLOR_ORANGE, "/label ekle - Yakýnýnýza bilgi yazýsý eklemeyi saðlar.");
	SendClientMessage(playerid, COLOR_ORANGE, "/label kaldir - Yakýnýnýzdaki bilgi yazýsýný kaldýrmayý saðlar.");
	SendClientMessage(playerid, COLOR_ORANGE, "/label liste - Eklenmiþ bilgi yazýsýlarýný görmenizi saðlar.");
	return 1;
}

Uniform_List(playerid, page = 0)
{
    new query[110];
	SetPVarInt(playerid, "faction_uniform_idx", page);
	mysql_format(m_Handle, query, sizeof(query), "SELECT id, skin_name, skin_race, skin_sex FROM faction_uniforms WHERE faction_id = %i LIMIT %i, 25", PlayerData[playerid][pFaction], page*MAX_CLOTHING_SHOW);
	mysql_tquery(m_Handle, query, "SQL_UniformList", "ii", playerid, page);
	return 1;
}

TrunkUniform_List(playerid, page = 0)
{
    new query[110];
	SetPVarInt(playerid, "faction_uniform_idx", page);
	mysql_format(m_Handle, query, sizeof(query), "SELECT id, skin_name, skin_race, skin_sex FROM faction_trunkuniforms WHERE faction_id = %i LIMIT %i, 25", PlayerData[playerid][pFaction], page*MAX_CLOTHING_SHOW);
	mysql_tquery(m_Handle, query, "SQL_TrunkUniformList", "ii", playerid, page);
	return 1;
}

Uniform_GetRace(id)
{
	new txt[14];
	switch(id)
	{
		case 1: txt = "Kafkasyalý";
		case 2: txt = "Asyalý";
		case 3: txt = "Afro-Amerikan";
		case 4: txt = "Hispanik";
	}
	return txt;
}

Uniform_GetSex(id)
{
	new txt[6];
	switch(id)
	{
		case 1: txt = "Erkek";
		case 2: txt = "Kadýn";
	}
	return txt;
}

Uniform_GetSkinID(id)
{
	new query[75], int;
	mysql_format(m_Handle, query, sizeof(query), "SELECT skin_id FROM faction_uniforms WHERE id = %i LIMIT 1", id);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name_int(0, "skin_id", int);
	cache_delete(cache);
	return int;
}

TrunkUniform_GetSkinID(id)
{
	new query[75], int;
	mysql_format(m_Handle, query, sizeof(query), "SELECT skin_id FROM faction_trunkuniforms WHERE id = %i LIMIT 1", id);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name_int(0, "skin_id", int);
	cache_delete(cache);
	return int;
}

IsNearFactionSpawn(playerid)
{
	new found, f = PlayerData[playerid][pFaction];


	if(IsPlayerInRangeOfPoint(playerid, 5.0, FactionData[f][FactionSpawnEx1][0], FactionData[f][FactionSpawnEx1][1], FactionData[f][FactionSpawnEx1][2]))
	{
		found++;
	}

	if(IsPlayerInRangeOfPoint(playerid, 5.0, FactionData[f][FactionSpawnEx2][0], FactionData[f][FactionSpawnEx2][1], FactionData[f][FactionSpawnEx2][2]))
	{
		found++;
	}

	if(IsPlayerInRangeOfPoint(playerid, 5.0, FactionData[f][FactionSpawnEx3][0], FactionData[f][FactionSpawnEx3][1], FactionData[f][FactionSpawnEx3][2]))
	{
		found++;
	}
	return found;
}

Roadblock_List(playerid, page = 0)
{
    new query[100];
	SetPVarInt(playerid, "faction_roadblock_idx", page);
	mysql_format(m_Handle, query, sizeof(query), "SELECT id, RoadblockName FROM faction_roadblocks LIMIT %i, 25", page*MAX_CLOTHING_SHOW);
	mysql_tquery(m_Handle, query, "SQL_RoadblockList", "ii", playerid, page);
	return 1;
}

Roadblock_GetInt(id, wut[])
{
	new query[75], int;
	mysql_format(m_Handle, query, sizeof(query), "SELECT %s FROM faction_roadblocks WHERE id = %i LIMIT 1", wut, id);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name_int(0, wut, int);
	cache_delete(cache);
	return int;
}

Roadblock_GetString(id, wut[])
{
	new query[75], int[25];
	mysql_format(m_Handle, query, sizeof(query), "SELECT %s FROM faction_roadblocks WHERE id = %i LIMIT 1", wut, id);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name(0, wut, int, sizeof(int));
	cache_delete(cache);
	return int;
}

Attachment_List(playerid, page = 0)
{
    new query[100];
	SetPVarInt(playerid, "faction_attachment_idx", page);
	mysql_format(m_Handle, query, sizeof(query), "SELECT id, att_name, att_price FROM faction_attachments WHERE faction_id = %i LIMIT %i, 25", PlayerData[playerid][pFaction], page*MAX_CLOTHING_SHOW);
	mysql_tquery(m_Handle, query, "SQL_AttachmentList", "ii", playerid, page);
	return 1;
}

Attachment_GetInt(id, wut[])
{
	new query[75], int;
	mysql_format(m_Handle, query, sizeof(query), "SELECT %s FROM faction_attachments WHERE id = %i LIMIT 1", wut, id);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name_int(0, wut, int);
	cache_delete(cache);
	return int;
}

Attachment_Get(id, wut[])
{
	new query[75], int[120];
	mysql_format(m_Handle, query, sizeof(query), "SELECT %s FROM faction_attachments WHERE id = %i LIMIT 1", wut, id);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name(0, wut, int);
	cache_delete(cache);
	return int;
}

Fire_RouteCommands(playerid, cmdtext[])
{
    new command[6];
    sscanf(cmdtext, "s[8]", command);

	if(strlen(command) == 0) {
		SendClientMessage(playerid, COLOR_GREY, "KULLANIM: /ates [komut]");
		SendClientMessage(playerid, COLOR_GREY, "Ýpucu: '/ates yardim' yazarak tüm listeyi görebilirsin.");
		return 1;
	}

    if(strcmp("ekle", command) == 0) FireCMD_Create(playerid);
    else if(strcmp("kaldir", command) == 0) FireCMD_Delete(playerid);
    else if(strcmp("duzenle", command) == 0) FireCMD_Edit(playerid);
	else if(strcmp("liste", command) == 0) FireCMD_List(playerid);
 	else if(strcmp("yardim", command) == 0) FireCMD_Help(playerid);
	return 1;
}

FireCMD_Create(const playerid)
{
	if(EditingObject[playerid]) return SendErrorMessage(playerid, "Þu anda baþka bir obje düzenliyorsun.");
	Fire_Create(playerid);
    return 1;
}

FireCMD_Delete(const playerid)
{
	if(EditingObject[playerid]) return SendErrorMessage(playerid, "Þu anda baþka bir obje düzenliyorsun.");

	new id;
	if((id = Fire_Nearest(playerid)) != -1)
	{
		ConfirmDialog(playerid, "Onay", "{FFFFFF}Yakýnýndaki '{ADC3E7}yangýn ateþi{FFFFFF}' objesini kaldýrmak konusunda emin misin?", "OnFireDisband", id);
	}
	else SendErrorMessage(playerid, "Yakýnýnda yangýn ateþi bulunmuyor.");
    return 1;
}

FireCMD_Edit(const playerid)
{
	if(EditingObject[playerid]) return SendErrorMessage(playerid, "Þu anda baþka bir obje düzenliyorsun.");

	new id;
	if((id = Fire_Nearest(playerid)) != -1)
	{
	    if(FireData[id][f_is_editing]) return SendErrorMessage(playerid, "Þu anda baþka bu obje baþkasý tarafýndan düzenleniyor.");

		EditingID[playerid] = id;
		EditingObject[playerid] = 8;
		FireData[id][f_is_editing] = true;
		EditDynamicObject(playerid, FireData[id][fire_object]);
	}
	else SendErrorMessage(playerid, "Yakýnýnda yangýn ateþi bulunmuyor.");
    return 1;
}

FireCMD_List(const playerid) {

	new
		fire_found,
		liststr[256];

    foreach(new i : Fires)
	{
		fire_found++;
		format(liststr, sizeof(liststr), "%sYangýn Ateþi {AFAFAF}[%s - %s]\n", liststr, FireData[i][fire_placedby], FireData[i][fire_location]);
	}

	if(fire_found) return ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_LIST, "FD: Aktif Yangýn Objeleri", liststr, "Tamam", "<<");
	else ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_LIST, "FD: Aktif Yangýn Objeleri", "Hiç yangýn objesi bulunamadý.", "Tamam", "<<");
	return 1;
}

FireCMD_Help(const playerid) {
	SendClientMessage(playerid, COLOR_ORANGE, "Yangýn Sistemi:");
	SendClientMessage(playerid, COLOR_ORANGE, "/ates ekle - Yakýnýnýza ateþ eklemeyi saðlar.");
	SendClientMessage(playerid, COLOR_ORANGE, "/ates kaldir - Yakýnýnýzdaki ateþi kaldýrmayý saðlar.");
	SendClientMessage(playerid, COLOR_ORANGE, "/ates duzenle - Yakýnýnýzdaki ateþi düzenlemenizi saðlar.");
	SendClientMessage(playerid, COLOR_ORANGE, "/ates liste - Eklenmiþ ateþleri görmenizi saðlar.");
	return 1;
}

IsNewsFaction(playerid)
{
	if(PlayerData[playerid][pFaction] == -1)
		return 0;

	new factionid = PlayerData[playerid][pFaction];

	if (FactionData[factionid][FactionSanPerms])
		return 1;

	return 0;
}

stock ReturnJobName(jobid)
{
	new job[13];

	switch (jobid)
	{
		case 0: job = "Ýþsiz";
		case 1: job = "Mekanik";
		case 2: job = "Taksi Þoförü";
		case 3: job = "Kamyoncu";
	}
	return job;
}

stock ReturnJobNameTXD(jobid)
{
	new job[13];

	switch (jobid)
	{
		case 0: job = "Issiz";
		case 1: job = "Mekanik";
		case 2: job = "Taksi Soforu";
		case 3: job = "Kamyoncu";
	}
	return job;
}

SendOffer(playerid, toplayer, type)
{
	switch(type)
	{
		case 0:
		{
			InfoTD_MSG(toplayer, 2, 5000, sprintf("~p~%s_SANA_BOYAMA_ISTEGI_YOLLADI~n~~g~Y_~y~TUSUNA_BASARAK_KABUL_EDEBILIR, ~r~N_~y~TUSUNA_BASARAK_REDDEDEBILIRSIN.", ReturnName(playerid)));
	        InfoTD_MSG(playerid, 2, 5000, sprintf("~b~%s~p~_ISIMLI_KISIYE_TEKLIF_GONDERILDI,_LUTFEN_CEVABINI_BEKLEYIN.", ReturnName(toplayer)));
		}
	    case 1:
	    {
			InfoTD_MSG(toplayer, 2, 5000, sprintf("~p~%s_SANA_KAPORTA_TAMIRI_ISTEGI_YOLLADI~n~~g~Y_~y~TUSUNA_BASARAK_KABUL_EDEBILIR, ~r~N_~y~TUSUNA_BASARAK_REDDEDEBILIRSIN.", ReturnName(playerid)));
	        InfoTD_MSG(playerid, 2, 5000, sprintf("~b~%s~p~_ISIMLI_KISIYE_TEKLIF_GONDERILDI,_LUTFEN_CEVABINI_BEKLEYIN.", ReturnName(toplayer)));
	    }
	    case 2:
	    {
			InfoTD_MSG(toplayer, 2, 5000, sprintf("~p~%s_SANA_ARAC_TAMIRI_ISTEGI_YOLLADI~n~~g~Y_~y~TUSUNA_BASARAK_KABUL_EDEBILIR, ~r~N_~y~TUSUNA_BASARAK_REDDEDEBILIRSIN.", ReturnName(playerid)));
	        InfoTD_MSG(playerid, 2, 5000, sprintf("~b~%s~p~_ISIMLI_KISIYE_TEKLIF_GONDERILDI,_LUTFEN_CEVABINI_BEKLEYIN.", ReturnName(toplayer)));
	    }
	    case 3:
	    {
	    	InfoTD_MSG(toplayer, 2, 5000, sprintf("~p~%s_SANA_MOTOR_TAMIRI_ISTEGI_YOLLADI~n~~g~Y_~y~TUSUNA_BASARAK_KABUL_EDEBILIR, ~r~N_~y~TUSUNA_BASARAK_REDDEDEBILIRSIN.", ReturnName(playerid)));
	        InfoTD_MSG(playerid, 2, 5000, sprintf("~b~%s~p~_ISIMLI_KISIYE_TEKLIF_GONDERILDI,_LUTFEN_CEVABINI_BEKLEYIN.", ReturnName(toplayer)));
	    }
	    case 4:
	    {
	    	InfoTD_MSG(toplayer, 2, 5000, sprintf("~p~%s_SANA_BATARYA_TAMIRI_ISTEGI_YOLLADI~n~~g~Y_~y~TUSUNA_BASARAK_KABUL_EDEBILIR, ~r~N_~y~TUSUNA_BASARAK_REDDEDEBILIRSIN.", ReturnName(playerid)));
	        InfoTD_MSG(playerid, 2, 5000, sprintf("~b~%s~p~_ISIMLI_KISIYE_TEKLIF_GONDERILDI,_LUTFEN_CEVABINI_BEKLEYIN.", ReturnName(toplayer)));
	    }
	    case 5:
	    {
	    	InfoTD_MSG(toplayer, 2, 5000, sprintf("~p~%s_SANA_BENZIN_DOLDURMA_ISTEGI_YOLLADI~n~~g~Y_~y~TUSUNA_BASARAK_KABUL_EDEBILIR, ~r~N_~y~TUSUNA_BASARAK_REDDEDEBILIRSIN.", ReturnName(playerid)));
	        InfoTD_MSG(playerid, 2, 5000, sprintf("~b~%s~p~_ISIMLI_KISIYE_TEKLIF_GONDERILDI,_LUTFEN_CEVABINI_BEKLEYIN.", ReturnName(toplayer)));
	    }
	    case 6:
	    {
	    	InfoTD_MSG(toplayer, 2, 5000, sprintf("~p~%s_SANA_CEKICI_ISTEGI_YOLLADI~n~~g~Y_~y~TUSUNA_BASARAK_KABUL_EDEBILIR, ~r~N_~y~TUSUNA_BASARAK_REDDEDEBILIRSIN.", ReturnName(playerid)));
	        InfoTD_MSG(playerid, 2, 5000, sprintf("~b~%s~p~_ISIMLI_KISIYE_TEKLIF_GONDERILDI,_LUTFEN_CEVABINI_BEKLEYIN.", ReturnName(toplayer)));
	    }
	}

	SetPVarInt(toplayer, "Mechanic_ID", playerid);
	SetPVarInt(toplayer, "Mechanic_Type", type);
	return 1;
}

Industry_Update(id)
{
	UpdateDynamic3DTextLabelText(TruckerData[id][tLabel], -1, sprintf("[{FFFF00}%s{FFFFFF}]\nStok: %i / %i\nFiyat: $%i / birim baþý", TruckerData_product[TruckerData[id][tProductID]], TruckerData[id][tStorage], TruckerData[id][tStorageSize], TruckerData[id][tPrice]));
	return 1;
}

Industry_Refresh(id)
{
	if(IsValidDynamic3DTextLabel(TruckerData[id][tLabel])) DestroyDynamic3DTextLabel(TruckerData[id][tLabel]);
    if(IsValidDynamicPickup(TruckerData[id][tPickup])) DestroyDynamicPickup(TruckerData[id][tPickup]);

	TruckerData[id][tLabel] = CreateDynamic3DTextLabel(sprintf("[{FFFF00}%s{FFFFFF}]\nStok: %i / %i\nFiyat: $%i / birim baþýna", TruckerData_product[TruckerData[id][tProductID]], TruckerData[id][tStorage], TruckerData[id][tStorageSize], TruckerData[id][tPrice]), 0xFFFFFFFF, TruckerData[id][tPosX], TruckerData[id][tPosY], TruckerData[id][tPosZ]+0.8, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 0, 0, -1, 40.0);
    TruckerData[id][tPickup] = CreateDynamicPickup(1318, 1, TruckerData[id][tPosX], TruckerData[id][tPosY], TruckerData[id][tPosZ], 0, 0, -1, 100.0);
	return 1;
}

Industry_Save(id)
{
	new
	    query[254];

	mysql_format(m_Handle, query, sizeof(query), "UPDATE truck_cargo SET type = %i, name = '%e', storage = %i, storage_size = %i, price = %i, product_id = %i WHERE id = %i",
		TruckerData[id][tType],
		TruckerData[id][tName],
		TruckerData[id][tStorage],
		TruckerData[id][tStorageSize],
		TruckerData[id][tPrice],
		TruckerData[id][tProductID],
		TruckerData[id][tID]);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE truck_cargo SET product_amount = %i, pack = %i, x = %f, y = %f, z = %f, locked = %i, gps = %i WHERE id = %i",
		TruckerData[id][tProductAmount],
		TruckerData[id][tPack],
		TruckerData[id][tPosX],
		TruckerData[id][tPosY],
		TruckerData[id][tPosZ],
		TruckerData[id][tLocked],
		TruckerData[id][tGps],
		TruckerData[id][tID]);
	mysql_tquery(m_Handle, query);
	return 1;
}

Industry_Show(playerid, id, gps = 0)
{
	new mes[1024],
		title[64 + 9],
	    str_len;

	SetPVarInt(playerid, "industry_id", id);

	switch(TruckerData[id][tType])
	{
		case 0:
		{
			format(title, sizeof(title), "{9ACD32}%s", TruckerData[id][tName]);
		    format(mes, sizeof(mes), "{9ACD32}%s {FFFFFF}fabrikasýna hoþgeldin!\n\n\
		    	{FFFFFF}Bu fabrika þuan da {9ACD32}%s.\n\n\
		    	{9ACD32}Satýlan:\n{808080}Ürün\t\t\tFiyat\t\tÜretim/Saat\t\tStok (depo boyutu){FFFFFF}",
		    	TruckerData[id][tName], TruckerData[id][tLocked] == 0 ? "açýk" : "kapalý");

	        foreach(new i : Trucker)
		    {
				if(TruckerData[id][tPack] == 0 && id != i || TruckerData[i][tType] != 0 || TruckerData[i][tPack] != TruckerData[id][tPack])
				    continue;

				TruckerData_product[TruckerData[i][tProductID]][0] = toupper(TruckerData_product[TruckerData[i][tProductID]][0]);
	            str_len = strlen(TruckerData_product[TruckerData[i][tProductID]]);
	            format(mes, sizeof(mes), "%s\n%s%s\t\t$%i\t\t\t%s%i\t\t\t\t%i %s {808080}(%i){FFFFFF}", mes, TruckerData_product[TruckerData[i][tProductID]], str_len < 6 ? "\t" : "",
				TruckerData[i][tPrice], TruckerData[i][tProductAmount] > 0 ? "+" : "", TruckerData[i][tProductAmount], TruckerData[i][tStorage], Trucker_GetType(TruckerData[i][tProductID]), TruckerData[i][tStorageSize]);
		    }
		    strcat(mes, "\n\n{9ACD32}Alýnan:\n{808080}Bu fabrika hiç bir þey almýyor.");
		}
		case 2:
		{
			format(title, sizeof(title), "{9ACD32}Gemi");
		    str_len = strlen(TruckerData_product[TruckerData[id][tProductID]]);
		    format(mes, sizeof(mes), "{9ACD32}Gemi{FFFFFF}'ye hoþgeldin!\n\n\
		    	{FFFFFF}Gemi þuan {9ACD32}%s.\n\n\
		    	{FFFFFF}Aþaðýdaki zaman dilimleri kesin deðildir, yaklaþýktýr.\n\n\
		    	Geliþ Saati:\t\t%s\nKalkýþ Saati:\t\t%s\nDönüþ Saati: %s\n\n\
		    	{9ACD32}Satýlan:\n{808080}Bu gemi hiç bir þey satmýyor, sadece San Andreas'tan kargo alýyor.\n\n\
		    	{9ACD32}Alýnan:\n{808080}Ürün\t\t\tFiyat\t\tStok (depo boyutu){FFFFFF}",
			ship_docked == 1 ? "limanda" : "limanda deðil", GetShipHour(ship_arrived), GetShipHour(ship_depart), GetShipHour(ship_next));

			foreach(new i : Trucker)
		    {
				if(TruckerData[i][tType] != 2)
				    continue;

				TruckerData_product[TruckerData[i][tProductID]][0] = toupper(TruckerData_product[TruckerData[i][tProductID]][0]);
	            str_len = strlen(TruckerData_product[TruckerData[i][tProductID]]);
	            format(mes, sizeof(mes), "%s\n%s%s\t\t$%i\t\t\t%i %s {808080}(%i){FFFFFF}", mes, TruckerData_product[TruckerData[i][tProductID]], str_len < 6 ? "\t" : "",
				TruckerData[i][tPrice], TruckerData[i][tStorage], Trucker_GetType(TruckerData[i][tProductID]), TruckerData[i][tStorageSize]);
		    }
		}
		case 1, 3:
		{
		    format(title, sizeof(title), "{9ACD32}%s", TruckerData[id][tName]);
		    format(mes, sizeof(mes), "{9ACD32}%s {FFFFFF}fabrikasýna hoþgeldin!\n\n\
		    	{FFFFFF}Bu fabrika þuan da {9ACD32}%s.\n\n\
		    	{9ACD32}Satýlan:\n{808080}Ürün\t\t\tFiyat\t\tÜretim/Saat\t\tStok (depo boyutu){FFFFFF}",
			TruckerData[id][tName], TruckerData[id][tLocked] == 0 ? "açýk" : "kapalý");

	        foreach(new i : Trucker)
		    {
				if(TruckerData[id][tPack] == 0 && id != i || TruckerData[i][tType] != 1 || TruckerData[i][tPack] != TruckerData[id][tPack])
				    continue;

				TruckerData_product[TruckerData[i][tProductID]][0] = toupper(TruckerData_product[TruckerData[i][tProductID]][0]);
	            str_len = strlen(TruckerData_product[TruckerData[i][tProductID]]);
	            format(mes, sizeof(mes), "%s\n%s%s\t\t$%i\t\t\t%s%i\t\t\t\t%i %s {808080}(%i){FFFFFF}", mes, TruckerData_product[TruckerData[i][tProductID]], str_len < 6 ? "\t" : "",
				TruckerData[i][tPrice], TruckerData[i][tProductAmount] > 0 ?  "+" : "", TruckerData[i][tProductAmount], TruckerData[i][tStorage], Trucker_GetType(TruckerData[i][tProductID]), TruckerData[i][tStorageSize]);
		    }

		    strcat(mes, "\n\n{9ACD32}Alýnan\n{808080}Ürün\t\t\tFiyat\t\tTüketim/Saat\t\tStok (depo boyutu){FFFFFF}");

		    foreach(new i : Trucker)
		    {
				if(TruckerData[id][tPack] == 0 && id != i || TruckerData[i][tType] != 3 || TruckerData[i][tPack] != TruckerData[id][tPack])
				    continue;

				TruckerData_product[TruckerData[i][tProductID]][0] = toupper(TruckerData_product[TruckerData[i][tProductID]][0]);
	            str_len = strlen(TruckerData_product[TruckerData[i][tProductID]]);
	            format(mes, sizeof(mes), "%s\n%s%s\t\t$%i\t\t\t%s%i\t\t\t\t%i %s {808080}(%i){FFFFFF}", mes, TruckerData_product[TruckerData[i][tProductID]], str_len < 6 ? "\t" : "",
				TruckerData[i][tPrice], TruckerData[i][tProductAmount] > 0 ? "+" : "", TruckerData[i][tProductAmount], TruckerData[i][tStorage], Trucker_GetType(TruckerData[i][tProductID]), TruckerData[i][tStorageSize]);
		    }
		}
	}

	if(gps == 1)
		Dialog_Show(playerid, PDA_SUB_INDUSTRY, DIALOG_STYLE_MSGBOX, title, mes, "Ýlerle", "Kapat");
	else
	    Dialog_Show(playerid, None, DIALOG_STYLE_MSGBOX, title, mes, "Kapat", "");
	return 1;
}

Business_Industry(playerid, list = 0)
{
	if(list < 0 || list > 10) list = 0;

    new count,
        id,
        sub_str[128], primary_str[1024];

    strcat(primary_str, "{9ACD32}<<\n");

    for(new i; i != 10; i++)
		PlayerData[playerid][pCargoListed][i] = -1;

    foreach(new i : Businesses)
    {
		if(BusinessData[i][BusinessWantedProduct] == 0)
		    continue;

        if(count < list * 10)
			continue;

        id = biz_prod_types[BusinessData[i][BusinessType]];

		format(sub_str, sizeof(sub_str), "%s\t$%i / birim baþýna\t%i %s\t%s\n",
			TruckerData_product[id],
			BusinessData[i][BusinessProductPrice],
			BusinessData[i][BusinessWantedProduct],
			Trucker_GetType(id),
			BusinessData[i][BusinessName]);

		strcat(primary_str, sub_str);

        PlayerData[playerid][pCargoListed][count - (list * 10)] = i;

		if(count++ == (list * 10) + 9)
			break;
	}

	if(count == 0)
	    return 1;

	if(count == (list * 10) + 9)
	    strcat(primary_str, "{9ACD32}>>");

 	Dialog_Show(playerid, PDA_BUSINESS, DIALOG_STYLE_LIST, "Trucker PDA - Ýþyerleri", primary_str, "Ýþaretle", "Geri");
 	SetPVarInt(playerid, "business_id", list);
	return 1;
}

CheckIndustries()
{
	new
		industires_prods[MAX_TRUCK_PACK char];

	foreach(new i : Trucker)
	{
		if(TruckerData[i][tType] == 0)
		{
		    TruckerData[i][tStorage] += TruckerData[i][tProductAmount];

		    if(TruckerData[i][tStorage] > TruckerData[i][tStorageSize])
		        TruckerData[i][tStorage] = TruckerData[i][tStorageSize];

		    else if(TruckerData[i][tStorage] < 0)
		        TruckerData[i][tStorage] = 0;

		    Industry_Update(i);
		}
		else if(TruckerData[i][tType] == 3)
		{
			if(TruckerData[i][tStorage] >= (-TruckerData[i][tProductAmount]))
			{
		    	TruckerData[i][tStorage] -= (-TruckerData[i][tProductAmount]);
				industires_prods{TruckerData[i][tPack]} += (-TruckerData[i][tProductAmount]);
			}
			Industry_Update(i);
		}
	}

	foreach(new i : Trucker)
	{
	    if(TruckerData[i][tType] != 1 || TruckerData[i][tPack] == 0 || TruckerData[i][tStorage] >= TruckerData[i][tStorageSize])
	        continue;

		if(industires_prods{TruckerData[i][tPack]} >= TruckerData[i][tProductAmount])
			TruckerData[i][tStorage] += TruckerData[i][tProductAmount];

        if(TruckerData[i][tStorage] > TruckerData[i][tStorageSize])
        	TruckerData[i][tStorage] = TruckerData[i][tStorageSize];

        Industry_Update(i);
	}
	return 1;
}

Industry_Nearest(playerid, Float: radius = 10.0)
{
	foreach(new i : Trucker)
	{
        if(IsPlayerInRangeOfPoint(playerid, radius, TruckerData[i][tPosX], TruckerData[i][tPosY], TruckerData[i][tPosZ]) && 0 == GetPlayerInterior(playerid) && 0 == GetPlayerVirtualWorld(playerid))
            return i;
	}
	return -1;
}

GetNearBootVehicle(playerid)
{
	for(new i = 1, j = GetVehiclePoolSize(); i <= j; i++)
	{
	    if(0 != IsVehicleStreamedIn(i, playerid) && 0 != IsOnBootVehicle(playerid, i))
	        return i;
	}
	return 0;
}

IsOnBootVehicle(playerid, vehicleid)
{
    new Float:angle,
		Float:distance,
		Float: x,
		Float: y,
		Float: z,
		model = GetVehicleModel(vehicleid);

	GetVehicleModelInfo(model, 1, x, distance, z);
    distance = distance/2 + 0.1;
    GetVehiclePos(vehicleid, x, y, z);
    GetVehicleZAngle(vehicleid, angle);
    x += (distance * floatsin(-angle+180, degrees));
    y += (distance * floatcos(-angle+180, degrees));

    if(model == 435 || model == 450 || model == 584 || model == 591)
        return IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z);

    return IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z);
}

stock GetMaxCargoVehicle(vehicle)
{
	switch(GetVehicleModel(vehicle))
	{
	    case 600, 543, 605, 443: return 2;
	    case 422, 530: return 3;
	    case 478: return 4;
		case 554: return 6;
		case 413, 459, 482: return 10;
	    case 440, 498: return 12;
	    case 499: return 14;
	    case 414, 455, 428: return 16;
	    case 578: return 18;
		case 456: return 24;
		case 450: return 30;
		case 435, 591: return 36;
		case 584: return 40;
	}
	return 0;
}

stock IsValidProductVehicle(vehicle, prod)
{
	switch(GetVehicleModel(vehicle))
	{
	    case 600, 543, 605, 422, 478, 413, 459, 482, 440, 498, 530:
		{
			switch(prod)
			{
			    case 1, 2, 3, 5, 6, 7, 12, 15, 18, 19, 20, 23, 24: return 1;
			}
		}

		case 554, 499, 414, 456, 435, 591:
		{
			switch(prod)
			{
			    case 1, 2, 3, 5, 6, 7, 12, 15, 18, 19, 20, 23, 24, TRUCKER_BRICKS: return 1;
			}
		}

        case 584:
		{
			switch(prod)
			{
			    case 0, 8, 11, 19: return 1;
			}
		}

		case 450, 455:
        {
			switch(prod)
			{
			    case 9, 10, 13, 16, TRUCKER_SCRAP: return 1;
			}
		}

		case 578:
		{
			switch(prod)
			{
			    case 1, 2, 3, 5, 6, 7, 12, 15, 18, 19, 20, 23, 24, TRUCKER_WOODS, TRUCKER_BRICKS, TRUCKER_TRANSFORMS: return 1;
			}
		}
		case 443:
		{
			switch(prod)
			{
			    case 4: return 1;
			}
		}
		case 428:
		{
			switch(prod)
			{
			    case 14, 21: return 1;
			}
		}
	}
	return 0;
}

stock IsTruckCar(vehicle)
{
	switch(GetVehicleModel(vehicle))
	{
	    case 403, 514, 515: return 1;
	}
	return 0;
}

stock TruckRank1(mv)
{
	return (mv == 600 || mv == 605 || mv == 543 || mv == 422 || mv == 478 || mv == 554 || mv == 530) ? 1 : 0;
}

stock TruckRank2(mv)
{
	return (TruckRank1(mv) == 1 || mv == 413 || mv == 459 || mv == 482) ? 1 : 0;
}

stock TruckRank3(mv)
{
	return (TruckRank1(mv) == 1 || TruckRank2(mv) == 1 || mv == 440 || mv == 498) ? 1 : 0;
}

stock TruckRank4(mv)
{
	return (TruckRank1(mv) == 1 || TruckRank2(mv) == 1 || TruckRank3(mv) == 1 || mv == 499 || mv == 414 || mv == 578 || mv == 443 || mv == 428) ? 1 : 0;
}

stock TruckRank5(mv)
{
	return (TruckRank1(mv) == 1 || TruckRank2(mv) == 1 || TruckRank3(mv) == 1 || TruckRank4(mv) == 1 || mv == 456 || mv == 455) ? 1 : 0;
}

stock TruckRank6(mv)
{
	return (TruckRank1(mv) == 1 || TruckRank2(mv) == 1 || TruckRank3(mv) == 1 || TruckRank4(mv) == 1 || TruckRank5(mv) == 1 || mv == 584 || mv == 591 || mv == 435 || mv == 450) ? 1 : 0;
}

stock IsTruckerJob(vehicle)
{
    new mv = GetVehicleModel(vehicle);
	return TruckRank6(mv) == 0 ? 0 : 1;
}

stock ValidTruckForPlayer(playerid, vehicle)
{
	new mv = GetVehicleModel(vehicle);
	switch(PlayerData[playerid][pJobLevel])
	{
	    case 0: if(TruckRank1(mv) == 0) return 0;
		case 1: if(TruckRank2(mv) == 0) return 0;
	    case 2: if(TruckRank3(mv) == 0) return 0;
	    case 3: if(TruckRank4(mv) == 0) return 0;
	    case 4: if(TruckRank5(mv) == 0) return 0;
	    default: if(TruckRank6(mv) == 0) return 0;
	}
	return 1;
}

stock GetClosestVehicle(playerid, Float: range)
{
    new Float: PosX, Float: PosY, Float: PosZ, Float: CloseDist = range, FetchVeh = -1, PlayerVeh;
    new Float: Dist;

    PlayerVeh = GetPlayerVehicleID(playerid);

    for(new i = GetVehiclePoolSize(); i != 0; i--)
    {
        if(!IsValidVehicle(i)) continue;
        if(i == PlayerVeh) continue;

        GetVehiclePos(i, PosX, PosY, PosZ);
        Dist = GetPlayerDistanceFromPoint(playerid, PosX, PosY, PosZ);

        if(Dist <= CloseDist)
        {
            FetchVeh = i;
            CloseDist = Dist;
        }
    }
    return FetchVeh;
}

GetNearBizOutside(playerid, Float: radius = 3.0)
{
   	foreach(new i : Businesses)
   	{
	    if(GetPlayerVirtualWorld(playerid) != BusinessData[i][EnterWorld]) continue;
		if(GetPlayerInterior(playerid) != BusinessData[i][EnterInterior]) continue;
	    if(!IsPlayerInRangeOfPoint(playerid, radius, BusinessData[i][EnterPos][0], BusinessData[i][EnterPos][1], BusinessData[i][EnterPos][2])) continue;

	    return i;
	}
	return -1;
}

Trash_RouteCommands(playerid, cmdtext[])
{
    new command[6];
    sscanf(cmdtext, "s[6]", command);

	if(strlen(command) == 0) {
		SendClientMessage(playerid, COLOR_GREY, "KULLANIM: /cop [komut]");
		SendClientMessage(playerid, COLOR_GREY, "Ýpucu: '/cop yardim' yazarak tüm listeyi görebilirsin.");
		return 1;
	}

    if(strcmp("al", command) == 0) TrashCMD_Take(playerid);
    else if(strcmp("koy", command) == 0) TrashCMD_Put(playerid);
	else if(strcmp("liste", command) == 0) TrashCMD_List(playerid);
    else if(strcmp("sil", command) == 0) TrashCMD_Destroy(playerid);
    else if(strcmp("sat", command) == 0) TrashCMD_Sell(playerid);
	return 1;
}

TrashCMD_Take(const playerid)
{
	if(!GetPVarType(playerid, "AtGarbage")) return SendClientMessage(playerid, COLOR_ADM, "HATA: Yakýnýnda çöp kutusu yok.");
	if(PlayerData[playerid][pCarryTrash]) return SendClientMessage(playerid, COLOR_ADM, "HATA: Çöp taþýyorsun.");
	new g = GetPVarInt(playerid, "AtGarbage");
    if(GarbageData[g][GarbageTakenCapacity] <= 0) return SendClientMessage(playerid, COLOR_ADM, "HATA: Çöp kalmamýþ.");

	PlayerData[playerid][pCarryTrash] = true;
	ApplyAnimation(playerid, "CARRY", "liftup105", 4.1, 0, 0, 0, 0, 0);
	SetPlayerAttachedObject(playerid, 7, 1264, 6, 0.222, 0.024, 0.128, 1.90, -90.0, 0.0, 0.5,0.5, 0.5);
	//SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
    GarbageData[g][GarbageTakenCapacity]-= 1;
    return 1;
}

TrashCMD_Put(const playerid)
{
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return SendClientMessage(playerid, COLOR_ADM, "HATA: Çöpü býrakmak için araçtan in.");
	if(!PlayerData[playerid][pCarryTrash]) return SendClientMessage(playerid, COLOR_ADM, "HATA: Çöp taþýmýyorsun.");

	new vehicleID = GetNearestVehicle(playerid);
	if(vehicleID == INVALID_VEHICLE_ID) return SendClientMessage(playerid, COLOR_ADM, "HATA: Yakýnýnda araç yok.");
	if(!IsValidPlayerCar(vehicleID)) return SendClientMessage(playerid, COLOR_ADM, "HATA: Sunucuya kayýtlý bir araç deðil.");
    if(CarData[vehicleID][carModel] != 408) return SendClientMessage(playerid, COLOR_ADM, "HATA: Bu çöpçülük yapabileceðin bir araç deðil.");
	if(CarData[vehicleID][carTrashCount] > 50) return SendClientMessage(playerid, COLOR_ADM, "HATA: Bu kamyona daha fazla çöp koyamazsýn.");

    PlayerData[playerid][pCarryTrash] = false;
	ApplyAnimation(playerid, "GRENADE", "WEAPON_throwu", 4.1, 0, 0, 0, 0, 0);
	//SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	RemovePlayerAttachedObject(playerid, 7);
	CarData[vehicleID][carTrashCount]+= 1;
    return 1;
}

TrashCMD_List(const playerid)
{
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, COLOR_ADM, "HATA: Çöp listesine bakmak için þoför koltuðuna bin.");

	new vehicleID = GetNearestVehicle(playerid);
	if(vehicleID == INVALID_VEHICLE_ID) return SendClientMessage(playerid, COLOR_ADM, "HATA: Yakýnýnda araç yok.");
	if(!IsValidPlayerCar(vehicleID)) return SendClientMessage(playerid, COLOR_ADM, "HATA: Sunucuya kayýtlý bir araç deðil.");
    if(CarData[vehicleID][carModel] != 408) return SendClientMessage(playerid, COLOR_ADM, "HATA: Bu çöpçülük yapabileceðin bir araç deðil.");
	if(CarData[vehicleID][carTrashCount] > 50) return SendClientMessage(playerid, COLOR_ADM, "HATA: Bu kamyona daha fazla çöp koyamazsýn.");
	if(!CarData[vehicleID][carTrashCount]) return SendClientMessageEx(playerid, COLOR_ADM, "HATA: Bu araçta çöp bulunmuyor.");
	ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_LIST, "Kamyon Çöp Durumu", sprintf("{C3C3C3}%i adet\t{FFFFFF}çöp mevcut.", CarData[vehicleID][carTrashCount]), "Kapat", "");
    return 1;
}

TrashCMD_Destroy(const playerid)
{
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return SendClientMessage(playerid, COLOR_ADM, "HATA: Çöpü silmek için araçtan in.");
	if(!PlayerData[playerid][pCarryTrash]) return SendClientMessage(playerid, COLOR_ADM, "HATA: Çöp taþýmýyorsun.");

    PlayerData[playerid][pCarryTrash] = false;
	RemovePlayerAttachedObject(playerid, 7);
	return 1;
}

TrashCMD_Sell(const playerid)
{
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, COLOR_ADM, "HATA: Çöpleri satmak için þoför koltuðuna bin.");
	if(!IsPlayerInRangeOfPoint(playerid, TRASH_RANGE, TRASH_X, TRASH_Y, TRASH_Z))
    {
 		SetPlayerCheckpoint(playerid, TRASH_X, TRASH_Y, TRASH_Z, TRASH_RANGE);
 	   	return SendClientMessage(playerid, COLOR_ADM, "HATA: Çöp satma noktasýnda deðilsin.");
	}
	new vehicleID = GetPlayerVehicleID(playerid);
	if(!IsValidPlayerCar(vehicleID)) return SendClientMessage(playerid, COLOR_ADM, "HATA: Sunucuya kayýtlý bir araç deðil.");
    if(CarData[vehicleID][carModel] != 408) return SendClientMessage(playerid, COLOR_ADM, "HATA: Bu çöpçülük yapabileceðin bir araç deðil.");
    if(!CarData[vehicleID][carTrashCount]) return SendClientMessage(playerid, COLOR_ADM, "HATA: Bu kamyonda çöp yok.");

    PlayerData[playerid][pCarryTrash] = false;
	RemovePlayerAttachedObject(playerid, 7);

	//CarData[vehicleID][carTrashCount] * 7
	return 1;
}

CatchFishOnBoat()
{
    new rnd = randomEx(10, 87), value = -1;
    for(new i; i < MAX_FISH_TYPES; i++)
    {
        if(FishData[i][FishChance] > rnd)
        {
            value = i;
        }
    }
    return value;
}

CatchFish()
{
    new rnd = randomEx(30, 110),  value = -1;
    for(new i; i < MAX_FISH_TYPES; i++)
    {
        if(FishData[i][FishChance] > rnd)
        {
            value = i;
        }
    }
    return value;
}

IsABoat(vehicleid)
{
    new modelid = GetVehicleModel(vehicleid);

	switch(modelid)
	{
	    case 473: return 1;
	}

    return 0;
}

IsPlayerAtFishingPlace(playerid)
{
    if(IsPlayerInRangeOfPoint(playerid, 1.0, 403.8266, -2088.7598, 7.8359) || IsPlayerInRangeOfPoint(playerid, 1.0, 398.7553, -2088.7490, 7.8359) || IsPlayerInRangeOfPoint(playerid, 1.0, 396.2197, -2088.6692, 7.8359) || IsPlayerInRangeOfPoint(playerid, 1.0, 391.1094, -2088.7976, 7.8359)) {
		return 1;
	} else if(IsPlayerInRangeOfPoint(playerid, 1.0, 383.4157, -2088.7849, 7.8359) || IsPlayerInRangeOfPoint(playerid, 1.0, 374.9598, -2088.7979, 7.8359) || IsPlayerInRangeOfPoint(playerid, 1.0, 369.8107, -2088.7927, 7.8359) || IsPlayerInRangeOfPoint(playerid, 1.0, 367.3637, -2088.7925, 7.8359)) {
	    return 1;
	} else if(IsPlayerInRangeOfPoint(playerid, 1.0, 362.2244, -2088.7981, 7.8359) || IsPlayerInRangeOfPoint(playerid, 1.0, 354.5382, -2088.7979, 7.8359)) {
	    return 1;
	}

	return 0;
}

stock EndTaxiFairDriver(playerid)
{
	for(new i = 0; i < 5; i++) PlayerTextDrawHide(playerid, TaxiFair_PTD[playerid][i]);

	KillTimer(TaxiDriverTimer[playerid]);

	TaxiFairStarted[playerid] = 0;
	TaxiDuration[playerid] = 0;
	TaxiTotalFair[playerid] = 0;
	return 1;
}

stock EndTaxiFair(playerid)
{
	for(new i = 0; i < 5; i++) PlayerTextDrawHide(playerid, TaxiFair_PTD[playerid][i]);

	InTaxiRide[playerid] = 0;
	TaxiDuration[playerid] = 0;

	//new
	//	foundDriver;

	foreach(new i : Player)
	{
		if(PlayerData[i][pSQLID] == TaxiDriver[playerid])
		{
			//foundDriver = 1;
			//GiveMoney(i, TaxiPrice[playerid]);
			//GiveMoney(playerid, -TaxiPrice[playerid]);
			EndTaxiFairDriver(i);
		}
	}

	//if(!foundDriver) GiveMoney(playerid, -TaxiPrice[playerid]);

	KillTimer(TaxiDurationTimer[playerid]);

	TaxiDriver[playerid] = 0;
	TaxiPrice[playerid] = 0;
	return 1;
}

stock GetComponentName(component)
{
    new modname[50];
    switch(component)
    {
       case 1000: format(modname, sizeof(modname), "Pro Spoiler");
       case 1001: format(modname, sizeof(modname), "Win Spoiler");
       case 1002: format(modname, sizeof(modname), "Drag Spoiler");
       case 1003: format(modname, sizeof(modname), "Alpha Spoiler");
       case 1004: format(modname, sizeof(modname), "Champ Scoop");
       case 1005: format(modname, sizeof(modname), "Fury Scoop");
       case 1006: format(modname, sizeof(modname), "Roof Scoop");
       case 1007: format(modname, sizeof(modname), "Right Sideskirt");
       case 1008: format(modname, sizeof(modname), "Nitrous x5");
       case 1009: format(modname, sizeof(modname), "Nitrous x2");
       case 1010: format(modname, sizeof(modname), "Nitrous x10");
       case 1011: format(modname, sizeof(modname), "Race Scoop");
       case 1012: format(modname, sizeof(modname), "Worx Scoop");
       case 1013: format(modname, sizeof(modname), "Round Fog Lights");
       case 1014: format(modname, sizeof(modname), "Champ Spoiler");
       case 1015: format(modname, sizeof(modname), "Race Spoiler");
       case 1016: format(modname, sizeof(modname), "Worx Spoiler");
       case 1017: format(modname, sizeof(modname), "Left Sideskirt");
       case 1018: format(modname, sizeof(modname), "Upswept Exhaust");
       case 1019: format(modname, sizeof(modname), "Twin Exhaust");
       case 1020: format(modname, sizeof(modname), "Large Exhaust");
       case 1021: format(modname, sizeof(modname), "Medium Exhaust");
       case 1022: format(modname, sizeof(modname), "Small Exhaust");
       case 1023: format(modname, sizeof(modname), "Fury Spoiler");
       case 1024: format(modname, sizeof(modname), "Square Fog Lights");
       case 1025: format(modname, sizeof(modname), "Offroad Wheels");
       case 1026, 1036, 1047, 1056, 1069, 1090: format(modname, sizeof(modname), "Right Alien Sideskirt");
       case 1027, 1040, 1051, 1062, 1071, 1094: format(modname, sizeof(modname), "Left Alien Sideskirt");
       case 1028, 1034, 1046, 1064, 1065, 1092: format(modname, sizeof(modname), "Alien Exhaust");
       case 1029, 1037, 1045, 1059, 1066, 1089: format(modname, sizeof(modname), "X-Flow Exhaust");
       case 1030, 1039, 1048, 1057, 1070, 1095: format(modname, sizeof(modname), "Right X-Flow Sideskirt");
       case 1031, 1041, 1052, 1063, 1072, 1093: format(modname, sizeof(modname), "Left X-Flow Sideskirt");
       case 1032, 1038, 1054, 1055, 1067, 1088: format(modname, sizeof(modname), "Alien Roof Vent");
       case 1033, 1035, 1053, 1061, 1068, 1091: format(modname, sizeof(modname), "X-Flow Roof Vent");
       case 1042: format(modname, sizeof(modname), "Right Chrome Sideskirt");
       case 1099: format(modname, sizeof(modname), "Left Chrome Sideskirt");
       case 1043, 1105, 1114, 1127, 1132, 1135: format(modname, sizeof(modname), "Slamin Exhaust");
       case 1044, 1104, 1113, 1126, 1129, 1136: format(modname, sizeof(modname), "Chrome Exhaust");
       case 1050, 1058, 1139, 1146, 1158, 1163: format(modname, sizeof(modname), "X-Flow Spoiler");
       case 1049, 1060, 1138, 1147, 1162, 1164: format(modname, sizeof(modname), "Alien Spoiler");
       case 1073: format(modname, sizeof(modname), "Shadow Wheels");
       case 1074: format(modname, sizeof(modname), "Mega Wheels");
       case 1075: format(modname, sizeof(modname), "Rimshine Wheels");
       case 1076: format(modname, sizeof(modname), "Wires Wheels");
       case 1077: format(modname, sizeof(modname), "Classic Wheels");
       case 1078: format(modname, sizeof(modname), "Twist Wheels");
       case 1079: format(modname, sizeof(modname), "Cutter Wheels");
       case 1080: format(modname, sizeof(modname), "Stitch Wheels");
       case 1081: format(modname, sizeof(modname), "Grove Wheels");
       case 1082: format(modname, sizeof(modname), "Import Wheels");
       case 1083: format(modname, sizeof(modname), "Dollar Wheels");
       case 1084: format(modname, sizeof(modname), "Trance Wheels");
       case 1085: format(modname, sizeof(modname), "Atomic Wheels");
       case 1086: format(modname, sizeof(modname), "Stereo");
       case 1087: format(modname, sizeof(modname), "Hydraulics");
       case 1096: format(modname, sizeof(modname), "Ahab Wheels");
       case 1097: format(modname, sizeof(modname), "Virtual Wheels");
       case 1098: format(modname, sizeof(modname), "Access Wheels");
       case 1100: format(modname, sizeof(modname), "Chrome Grill");
       case 1101: format(modname, sizeof(modname), "Left Chrome Flames Sideskirt");
       case 1102, 1107: format(modname, sizeof(modname), "Left Chrome Strip Sideskirt");
       case 1103: format(modname, sizeof(modname), "Convertible Roof");
       case 1106, 1124, 1137: format(modname, sizeof(modname), "Left Chrome Arches Sideskirt");
       case 1108, 1133, 1134: format(modname, sizeof(modname), "Right Chrome Strip Sideskirt");
       case 1109: format(modname, sizeof(modname), "Chrome Rear Bullbars");
       case 1110: format(modname, sizeof(modname), "Slamin Rear Bullbars");
       case 1111, 1112: format(modname, sizeof(modname), "Front Sign");
       case 1115: format(modname, sizeof(modname), "Chrome Front Bullbars");
       case 1116: format(modname, sizeof(modname), "Slamin Front Bullbars");
       case 1117, 1174, 1179, 1182, 1189, 1191: format(modname, sizeof(modname), "Chrome Front Bumper");
       case 1175, 1181, 1185, 1188, 1190: format(modname, sizeof(modname), "Slamin Front Bumper");
       case 1176, 1180, 1184, 1187, 1192: format(modname, sizeof(modname), "Chrome Rear Bumper");
       case 1177, 1178, 1183, 1186, 1193: format(modname, sizeof(modname), "Slamin Rear Bumper");
       case 1118: format(modname, sizeof(modname), "Right Chrome Trim Sideskirt");
       case 1119: format(modname, sizeof(modname), "Right Wheelcovers Sideskirt");
       case 1120: format(modname, sizeof(modname), "Left Chrome Trim Sideskirt");
       case 1121: format(modname, sizeof(modname), "Left Wheelcovers Sideskirt");
       case 1122: format(modname, sizeof(modname), "Right Chrome Flames Sideskirt");
       case 1123: format(modname, sizeof(modname), "Bullbar Chrome Bars");
       case 1125: format(modname, sizeof(modname), "Bullbar Chrome Lights");
       case 1128: format(modname, sizeof(modname), "Vinyl Hardtop Roof");
       case 1130: format(modname, sizeof(modname), "Hardtop Roof");
       case 1131: format(modname, sizeof(modname), "Softtop Roof");
       case 1140, 1148, 1151, 1156, 1161, 1167: format(modname, sizeof(modname), "X-Flow Rear Bumper");
       case 1141, 1149, 1150, 1154, 1159, 1168: format(modname, sizeof(modname), "Alien Rear Bumper");
       case 1142: format(modname, sizeof(modname), "Left Oval Vents");
       case 1143: format(modname, sizeof(modname), "Right Oval Vents");
       case 1144: format(modname, sizeof(modname), "Left Square Vents");
       case 1145: format(modname, sizeof(modname), "Right Square Vents");
       case 1152, 1157, 1165, 1170, 1172, 1173: format(modname, sizeof(modname), "X-Flow Front Bumper");
       case 1153, 1155, 1160, 1166, 1169, 1171: format(modname, sizeof(modname), "Alien Front Bumper");

    }
    return modname;
}

GetVehicleComponentCount(category, model)
{
    switch(category)
    {
        case 0: return GetVehicleSpoilerCount(model);
        case 1: return GetVehicleHoodCount(model);
        case 2: return GetVehicleExhaustCount(model);
        case 3: return GetVehicleFBumperCount(model);
        case 4: return GetVehicleBBumperCount(model);
        case 5: return GetVehicleRoofCount(model);
        case 6: return GetVehicleWheelCount(model);
        case 7: return GetVehicleHydraulicCount(model);
        case 8: return GetVehicleNitroCount(model);
        case 9: return GetVehicleLeftSSCount(model);
        case 10: return GetVehiclePaintJobCount(model);
   }

    return 0;
}

GetComponentPrice(componentid, &price = 0)
{
    switch(componentid)
    {
        case 1004..1007, 1011..1013, 1017, 1024, 1026, 1027, 1030, 1031, 1036, 1039..1042, 1047, 1048, 1051, 1052, 1056, 1057, 1062, 1063, 1069..1072, 1090, 1093..1095, 1099, 1101, 1102, 1106..1108, 1118..1122, 1124, 1133, 1134, 1137, 1142..1145: price = 4000;
        case 1018..1022, 1025, 1028, 1029, 1032..1035, 1037, 1038, 1043..1046, 1053..1055, 1059, 1061, 1064..1068, 1073..1085, 1088, 1089, 1091, 1092, 1096..1098, 1103..1105, 1111..1114, 1126, 1127, 1129, 1132, 1135, 1136: price = 5000;
        case 1100, 1109, 1110, 1115, 1117, 1123, 1125, 1140, 1141, 1148..1157, 1159..1161, 1165..1193: price = 6000;
        case 1000..1003, 1009, 1014..1016, 1023, 1049, 1050, 1058, 1060, 1087, 1128, 1130, 1131, 1138, 1139, 1146, 1147, 1158, 1162..1164: price = 7500;
        case 1008, 1086: price = 12500;
        case 1010: price = 17500;
   }
    return price;
}

GetVehicleSpoilerCount(model, &count = 0)
{
    switch(model)
    {
        case 401, 418, 420, 426, 436, 492, 540, 542, 549, 558, 559, 560, 561, 562, 565, 580, 589, 603: count = 2;
        case 404, 410, 415, 439, 489, 491, 518, 527, 529, 546, 547, 550, 585: count = 3;
        case 405, 421, 496, 516, 517, 551: count = 4;
   }
    return count;
}

GetVehicleCompatibleSpoiler(model, count, &componentid = 0)
{
    switch(model)
    {
        case 401:
        {
            switch(count)
            {
                case 1: componentid = 1001;
                case 2: componentid = 1003;
           }
       }
        case 404:
        {
            switch(count)
            {
                case 1: componentid = 1000;
                case 2: componentid = 1002;
                case 3: componentid = 1016;
           }
       }
        case 405:
        {
            switch(count)
            {
                case 1: componentid = 1000;
                case 2: componentid = 1001;
                case 3: componentid = 1014;
                case 4: componentid = 1023;
           }
       }
        case 410:
        {
            switch(count)
            {
                case 1: componentid = 1001;
                case 2: componentid = 1003;
                case 3: componentid = 1023;
           }
       }
        case 415:
        {
            switch(count)
            {
                case 1: componentid = 1001;
                case 2: componentid = 1003;
                case 3: componentid = 1023;
           }
       }
        case 418:
        {
            switch(count)
            {
                case 1: componentid = 1002;
                case 2: componentid = 1016;
           }
       }
        case 420:
        {
            switch(count)
            {
                case 1: componentid = 1001;
                case 2: componentid = 1003;
           }
       }
        case 421:
        {
            switch(count)
            {
                case 1: componentid = 1000;
                case 2: componentid = 1014;
                case 3: componentid = 1016;
                case 4: componentid = 1023;
           }
       }
        case 426:
        {
            switch(count)
            {
                case 1: componentid = 1001;
                case 2: componentid = 1003;
           }
       }
        case 436:
        {
            switch(count)
            {
                case 1: componentid = 1001;
                case 2: componentid = 1003;
           }
       }
        case 439:
        {
            switch(count)
            {
                case 1: componentid = 1001;
                case 2: componentid = 1003;
                case 3: componentid = 1023;
           }
       }
        case 489:
        {
            switch(count)
            {
                case 1: componentid = 1000;
                case 2: componentid = 1002;
                case 3: componentid = 1016;
           }
       }
        case 491:
        {
            switch(count)
            {
                case 1: componentid = 1003;
                case 2: componentid = 1014;
                case 3: componentid = 1023;
           }
       }
        case 492:
        {
            switch(count)
            {
                case 1: componentid = 1000;
                case 2: componentid = 1016;
           }
       }
        case 496:
        {
            switch(count)
            {
                case 1: componentid = 1001;
                case 2: componentid = 1002;
                case 3: componentid = 1003;
                case 4: componentid = 1023;
           }
       }
        case 516:
        {
            switch(count)
            {
                case 1: componentid = 1000;
                case 2: componentid = 1002;
                case 3: componentid = 1015;
                case 4: componentid = 1016;
           }
       }
        case 517:
        {
            switch(count)
            {
                case 1: componentid = 1002;
                case 2: componentid = 1003;
                case 3: componentid = 1016;
                case 4: componentid = 1023;
           }
       }
        case 518:
        {
            switch(count)
            {
                case 1: componentid = 1001;
                case 2: componentid = 1003;
                case 3: componentid = 1023;
           }
       }
        case 527:
        {
            switch(count)
            {
                case 1: componentid = 1001;
                case 2: componentid = 1014;
                case 3: componentid = 1015;
           }
       }
        case 529:
        {
            switch(count)
            {
                case 1: componentid = 1001;
                case 2: componentid = 1003;
                case 3: componentid = 1023;
           }
       }
        case 540:
        {
            switch(count)
            {
                case 1: componentid = 1001;
                case 2: componentid = 1023;
           }
       }
        case 542:
        {
            switch(count)
            {
                case 1: componentid = 1014;
                case 2: componentid = 1015;
           }
       }
        case 546:
        {
            switch(count)
            {
                case 1: componentid = 1001;
                case 2: componentid = 1002;
                case 3: componentid = 1023;
           }
       }
        case 547:
        {
            switch(count)
            {
                case 1: componentid = 1000;
                case 2: componentid = 1003;
                case 3: componentid = 1016;
           }
       }
        case 549:
        {
            switch(count)
            {
                case 1: componentid = 1001;
                case 2: componentid = 1023;
           }
       }
        case 550:
        {
            switch(count)
            {
                case 1: componentid = 1001;
                case 2: componentid = 1003;
                case 3: componentid = 1023;
           }
       }
        case 551:
        {
            switch(count)
            {
                case 1: componentid = 1002;
                case 2: componentid = 1003;
                case 3: componentid = 1016;
                case 4: componentid = 1023;
           }
       }
        case 558:
        {
            switch(count)
            {
                case 1: componentid = 1163;
                case 2: componentid = 1164;
           }
       }
        case 559:
        {
            switch(count)
            {
                case 1: componentid = 1158;
                case 2: componentid = 1162;
           }
       }
        case 560:
        {
            switch(count)
            {
                case 1: componentid = 1138;
                case 2: componentid = 1139;
           }
       }
        case 561:
        {
            switch(count)
            {
                case 1: componentid = 1058;
                case 2: componentid = 1060;
           }
       }
        case 562:
        {
            switch(count)
            {
                case 1: componentid = 1146;
                case 2: componentid = 1147;
           }
       }
        case 565:
        {
            switch(count)
            {
                case 1: componentid = 1049;
                case 2: componentid = 1050;
           }
       }
        case 580:
        {
            switch(count)
            {
                case 1: componentid = 1001;
                case 2: componentid = 1023;
           }
       }
        case 585:
        {
            switch(count)
            {
                case 1: componentid = 1001;
                case 2: componentid = 1003;
                case 3: componentid = 1023;
           }
       }
        case 589:
        {
            switch(count)
            {
                case 1: componentid = 1000;
                case 2: componentid = 1016;
           }
       }
        case 603:
        {
            switch(count)
            {
                case 1: componentid = 1001;
                case 2: componentid = 1023;
           }
       }
   }
    return componentid;
}

GetVehicleHoodCount(model, &count = 0)
{
    switch(model)
    {
        case 496, 516, 518, 540, 546, 551: count = 1;
        case 401, 420, 426, 489, 492, 529, 549, 550, 589, 600: count = 2;
        case 478: count = 3;
   }
    return count;
}

GetVehicleCompatibleHood(model, count, &componentid = 0)
{
    switch(model)
    {
        case 401:
        {
            switch(count)
            {
                case 1: componentid = 1004;
                case 2: componentid = 1005;
           }
       }
        case 420:
        {
            switch(count)
            {
                case 1: componentid = 1004;
                case 2: componentid = 1005;
           }
       }
        case 426:
        {
            switch(count)
            {
                case 1: componentid = 1004;
                case 2: componentid = 1005;
           }
       }
        case 478:
        {
            switch(count)
            {
                case 1: componentid = 1004;
                case 2: componentid = 1005;
                case 3: componentid = 1012;
           }
       }
        case 489:
        {
            switch(count)
            {
                case 1: componentid = 1004;
                case 2: componentid = 1005;
           }
       }
        case 492:
        {
            switch(count)
            {
                case 1: componentid = 1004;
                case 2: componentid = 1005;
           }
       }
        case 496:
        {
            switch(count)
            {
                case 1: componentid = 1011;
           }
       }
        case 516:
        {
            switch(count)
            {
                case 1: componentid = 1004;
           }
       }
        case 518:
        {
            switch(count)
            {
                case 1: componentid = 1005;
           }
       }
        case 529:
        {
            switch(count)
            {
                case 1: componentid = 1011;
                case 2: componentid = 1012;
           }
       }
        case 540:
        {
            switch(count)
            {
                case 1: componentid = 1004;
           }
       }
        case 546:
        {
            switch(count)
            {
                case 1: componentid = 1004;
           }
       }
        case 549:
        {
            switch(count)
            {
                case 1: componentid = 1011;
                case 2: componentid = 1012;
           }
       }
        case 550:
        {
            switch(count)
            {
                case 1: componentid = 1004;
                case 2: componentid = 1005;
           }
       }
        case 551:
        {
            switch(count)
            {
                case 1: componentid = 1005;
           }
       }
        case 589:
        {
            switch(count)
            {
                case 1: componentid = 1004;
                case 2: componentid = 1005;
           }
       }
        case 600:
        {
            switch(count)
            {
                case 1: componentid = 1004;
                case 2: componentid = 1005;
           }
       }
   }
    return componentid;
}

GetVehicleExhaustCount(model, &count = 0)
{
    switch(model)
    {
        case 401, 415, 418, 420, 426, 496, 518, 534, 535, 536, 546, 558, 559, 560, 561, 562, 565, 567, 575, 576, 580, 589: count = 2;
        case 404, 410, 422, 478, 489, 500, 517, 527, 529, 540, 549, 550, 585, 600, 603: count = 3;
        case 400, 405, 421, 436, 477, 491, 516, 542, 547, 551: count = 4;
   }
    return count;
}

GetVehicleCompatibleExhaust(model, count, &componentid = 0)
{
    switch(model)
    {
        case 400:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1019;
                case 3: componentid = 1020;
                case 4: componentid = 1021;
           }
       }
        case 401:
        {
            switch(count)
            {
                case 1: componentid = 1019;
                case 2: componentid = 1020;
           }
       }
        case 404:
        {
            switch(count)
            {
                case 1: componentid = 1019;
                case 2: componentid = 1020;
                case 3: componentid = 1021;
           }
       }
        case 405:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1019;
                case 3: componentid = 1020;
                case 4: componentid = 1021;
           }
       }
        case 410:
        {
            switch(count)
            {
                case 1: componentid = 1019;
                case 2: componentid = 1020;
                case 3: componentid = 1021;
           }
       }
        case 415:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1019;
           }
       }
        case 418:
        {
            switch(count)
            {
                case 1: componentid = 1020;
                case 2: componentid = 1021;
           }
       }
        case 420:
        {
            switch(count)
            {
                case 1: componentid = 1019;
                case 2: componentid = 1021;
           }
       }
        case 421:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1019;
                case 3: componentid = 1020;
                case 4: componentid = 1021;
           }
       }
        case 422:
        {
            switch(count)
            {
                case 1: componentid = 1019;
                case 2: componentid = 1020;
                case 3: componentid = 1021;
           }
       }
        case 426:
        {
            switch(count)
            {
                case 1: componentid = 1019;
                case 2: componentid = 1021;
           }
       }
        case 436:
        {
            switch(count)
            {
                case 1: componentid = 1019;
                case 2: componentid = 1020;
                case 3: componentid = 1021;
                case 4: componentid = 1022;
           }
       }
        case 477:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1019;
                case 3: componentid = 1020;
                case 4: componentid = 1021;
           }
       }
        case 478:
        {
            switch(count)
            {
                case 1: componentid = 1020;
                case 2: componentid = 1021;
                case 3: componentid = 1022;
           }
       }
        case 489:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1019;
                case 3: componentid = 1020;
           }
       }
        case 491:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1019;
                case 3: componentid = 1020;
                case 4: componentid = 1021;
           }
       }
        case 496:
        {
            switch(count)
            {
                case 1: componentid = 1019;
                case 2: componentid = 1020;
           }
       }
        case 500:
        {
            switch(count)
            {
                case 1: componentid = 1019;
                case 2: componentid = 1020;
                case 3: componentid = 1021;
           }
       }
        case 516:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1019;
                case 3: componentid = 1020;
                case 4: componentid = 1021;
           }
       }
        case 517:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1019;
                case 3: componentid = 1020;
           }
       }
        case 518:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1020;
           }
       }
        case 527:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1020;
                case 3: componentid = 1021;
           }
       }
        case 529:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1019;
                case 3: componentid = 1020;
           }
       }
        case 534:
        {
            switch(count)
            {
                case 1: componentid = 1126;
                case 2: componentid = 1127;
           }
       }
        case 535:
        {
            switch(count)
            {
                case 1: componentid = 1113;
                case 2: componentid = 1114;
           }
       }
        case 536:
        {
            switch(count)
            {
                case 1: componentid = 1104;
                case 2: componentid = 1105;
           }
       }
        case 540:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1019;
                case 3: componentid = 1020;
           }
       }
        case 542:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1019;
                case 3: componentid = 1020;
                case 4: componentid = 1021;
           }
       }
        case 546:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1019;
           }
       }
        case 547:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1019;
                case 3: componentid = 1020;
                case 4: componentid = 1021;
           }
       }
        case 549:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1019;
                case 3: componentid = 1020;
           }
       }
        case 550:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1019;
                case 3: componentid = 1020;
           }
       }
        case 551:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1019;
                case 3: componentid = 1020;
                case 4: componentid = 1021;
           }
       }
        case 558:
        {
            switch(count)
            {
                case 1: componentid = 1089;
                case 2: componentid = 1092;
           }
       }
        case 559:
        {
            switch(count)
            {
                case 1: componentid = 1065;
                case 2: componentid = 1066;
           }
       }
        case 560:
        {
            switch(count)
            {
                case 1: componentid = 1028;
                case 2: componentid = 1029;
           }
       }
        case 561:
        {
            switch(count)
            {
                case 1: componentid = 1059;
                case 2: componentid = 1064;
           }
       }
        case 562:
        {
            switch(count)
            {
                case 1: componentid = 1034;
                case 2: componentid = 1037;
           }
       }
        case 565:
        {
            switch(count)
            {
                case 1: componentid = 1045;
                case 2: componentid = 1046;
           }
       }
        case 567:
        {
            switch(count)
            {
                case 1: componentid = 1129;
                case 2: componentid = 1132;
           }
       }
        case 575:
        {
            switch(count)
            {
                case 1: componentid = 1043;
                case 2: componentid = 1044;
           }
       }
        case 576:
        {
            switch(count)
            {
                case 1: componentid = 1135;
                case 2: componentid = 1136;
           }
       }
        case 580:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1020;
           }
       }
        case 585:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1019;
                case 3: componentid = 1020;
           }
       }
        case 589:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1020;
           }
       }
        case 600:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1020;
                case 3: componentid = 1022;
           }
       }
        case 603:
        {
            switch(count)
            {
                case 1: componentid = 1018;
                case 2: componentid = 1019;
                case 3: componentid = 1020;
           }
       }
   }
    return componentid;
}

GetVehicleFBumperCount(model, &count = 0)
{
    switch(model)
    {
        case 535: count = 1;
        case 534, 536, 558, 559, 560, 561, 562, 565, 567, 575, 576: count = 2;
   }
    return count;
}

GetVehicleCompatibleFBumper(model, count, &componentid = 0)
{
    switch(model)
    {
        case 534:
        {
            switch(count)
            {
                case 1: componentid = 1179;
                case 2: componentid = 1185;
           }
       }
        case 535:
        {
            switch(count)
            {
                case 1: componentid = 1117;
           }
       }
        case 536:
        {
            switch(count)
            {
                case 1: componentid = 1181;
                case 2: componentid = 1182;
           }
       }
        case 558:
        {
            switch(count)
            {
                case 1: componentid = 1165;
                case 2: componentid = 1166;
           }
       }
        case 559:
        {
            switch(count)
            {
                case 1: componentid = 1160;
                case 2: componentid = 1173;
           }
       }
        case 560:
        {
            switch(count)
            {
                case 1: componentid = 1169;
                case 2: componentid = 1170;
           }
       }
        case 561:
        {
            switch(count)
            {
                case 1: componentid = 1155;
                case 2: componentid = 1157;
           }
       }
        case 562:
        {
            switch(count)
            {
                case 1: componentid = 1171;
                case 2: componentid = 1172;
           }
       }
        case 565:
        {
            switch(count)
            {
                case 1: componentid = 1152;
                case 2: componentid = 1153;
           }
       }
        case 567:
        {
            switch(count)
            {
                case 1: componentid = 1188;
                case 2: componentid = 1189;
           }
       }
        case 575:
        {
            switch(count)
            {
                case 1: componentid = 1174;
                case 2: componentid = 1176;
           }
       }
        case 576:
        {
            switch(count)
            {
                case 1: componentid = 1190;
                case 2: componentid = 1191;
           }
       }
   }
    return componentid;
}

GetVehicleBBumperCount(model, &count = 0)
{
    switch(model)
    {
        case 534, 536, 558, 559, 560, 561, 562, 565, 567, 575, 576: count = 2;
   }
    return count;
}

GetVehicleCompatibleBBumper(model, count, &componentid = 0)
{
    switch(model)
    {
        case 534:
        {
            switch(count)
            {
                case 1: componentid = 1178;
                case 2: componentid = 1180;
           }
       }
        case 536:
        {
            switch(count)
            {
                case 1: componentid = 1183;
                case 2: componentid = 1184;
           }
       }
        case 558:
        {
            switch(count)
            {
                case 1: componentid = 1167;
                case 2: componentid = 1168;
           }
       }
        case 559:
        {
            switch(count)
            {
                case 1: componentid = 1159;
                case 2: componentid = 1161;
           }
       }
        case 560:
        {
            switch(count)
            {
                case 1: componentid = 1140;
                case 2: componentid = 1141;
           }
       }
        case 561:
        {
            switch(count)
            {
                case 1: componentid = 1154;
                case 2: componentid = 1156;
           }
       }
        case 562:
        {
            switch(count)
            {
                case 1: componentid = 1148;
                case 2: componentid = 1149;
           }
       }
        case 565:
        {
            switch(count)
            {
                case 1: componentid = 1150;
                case 2: componentid = 1151;
           }
       }
        case 567:
        {
            switch(count)
            {
                case 1: componentid = 1186;
                case 2: componentid = 1187;
           }
       }
        case 575:
        {
            switch(count)
            {
                case 1: componentid = 1175;
                case 2: componentid = 1177;
           }
       }
        case 576:
        {
            switch(count)
            {
                case 1: componentid = 1192;
                case 2: componentid = 1193;
           }
       }
   }
    return componentid;
}

GetVehicleRoofCount(model, &count = 0)
{
    switch(model)
    {
        case 401, 418, 426, 436, 477, 489, 492, 496, 518, 529, 540, 546, 550, 551, 580, 585, 589, 600, 603: count = 1;
        case 536, 558, 559, 560, 561, 562, 565, 567: count = 2;
   }
    return count;
}

GetVehicleCompatibleRoof(model, count, &componentid = 0)
{
    switch(model)
    {
        case 401:
        {
            switch(count)
            {
                case 1: componentid = 1006;
           }
       }
        case 418:
        {
            switch(count)
            {
                case 1: componentid = 1006;
           }
       }
        case 426:
        {
            switch(count)
            {
                case 1: componentid = 1006;
           }
       }
        case 436:
        {
            switch(count)
            {
                case 1: componentid = 1006;
           }
       }
        case 477:
        {
            switch(count)
            {
                case 1: componentid = 1006;
           }
       }
        case 489:
        {
            switch(count)
            {
                case 1: componentid = 1006;
           }
       }
        case 492:
        {
            switch(count)
            {
                case 1: componentid = 1006;
           }
       }
        case 496:
        {
            switch(count)
            {
                case 1: componentid = 1006;
           }
       }
        case 518:
        {
            switch(count)
            {
                case 1: componentid = 1006;
           }
       }
        case 529:
        {
            switch(count)
            {
                case 1: componentid = 1006;
           }
       }
        case 536:
        {
            switch(count)
            {
                case 1: componentid = 1103;
                case 2: componentid = 1128;
           }
       }
        case 540:
        {
            switch(count)
            {
                case 1: componentid = 1006;
           }
       }
        case 546:
        {
            switch(count)
            {
                case 1: componentid = 1006;
           }
       }
        case 550:
        {
            switch(count)
            {
                case 1: componentid = 1006;
           }
       }
        case 551:
        {
            switch(count)
            {
                case 1: componentid = 1006;
           }
       }
        case 558:
        {
            switch(count)
            {
                case 1: componentid = 1088;
                case 2: componentid = 1091;
           }
       }
        case 559:
        {
            switch(count)
            {
                case 1: componentid = 1067;
                case 2: componentid = 1068;
           }
       }
        case 560:
        {
            switch(count)
            {
                case 1: componentid = 1032;
                case 2: componentid = 1033;
           }
       }
        case 561:
        {
            switch(count)
            {
                case 1: componentid = 1055;
                case 2: componentid = 1061;
           }
       }
        case 562:
        {
            switch(count)
            {
                case 1: componentid = 1035;
                case 2: componentid = 1038;
           }
       }
        case 565:
        {
            switch(count)
            {
                case 1: componentid = 1053;
                case 2: componentid = 1054;
           }
       }
        case 567:
        {
            switch(count)
            {
                case 1: componentid = 1130;
                case 2: componentid = 1131;
           }
       }
        case 580:
        {
            switch(count)
            {
                case 1: componentid = 1006;
           }
       }
        case 585:
        {
            switch(count)
            {
                case 1: componentid = 1006;
           }
       }
        case 589:
        {
            switch(count)
            {
                case 1: componentid = 1006;
           }
       }
        case 600:
        {
            switch(count)
            {
                case 1: componentid = 1006;
           }
       }
        case 603:
        {
            switch(count)
            {
                case 1: componentid = 1006;
           }
       }
   }
    return componentid;
}

GetVehicleWheelCount(model, &count = 0)
{
    switch(model)
    {
        case 400,401,404,405,410,415,418,420..422,426,436,439,477,478,489,491,492,496,500,516..518,527,529,534..536,540,542,546,547,549..551,558..562,565,567,575,576,580,585,589,600,603: count = 17;
        case 402,403,406..409,411..414,416,419,423,424,427..429,431..435,437,438,440..445,448,450,451,455..459,461..463,466..468,470,471,474,475,479..486,490,494,495,498,499,502..510,514,515,521..526,528,530..533,541,552,543..545,554..557,566,568,578,571..574,579,581..584,586..588,591,594,596..599,601,602,604..611: count = 17;
   }
    return count;
}

GetVehicleCompatibleWheel(model, count, &componentid = 0)
{
    switch(model)
    {
        case 400,401,404,405,410,415,418,420..422,426,436,439,477,478,489,491,492,496,500,516..518,527,529,534..536,540,542,546,547,549..551,558..562,565,567,575,576,580,585,589,600,603:
        {
            switch(count)
            {
                case 1: componentid = 1025;
                case 2: componentid = 1073;
                case 3: componentid = 1074;
                case 4: componentid = 1075;
                case 5: componentid = 1076;
                case 6: componentid = 1077;
                case 7: componentid = 1078;
                case 8: componentid = 1079;
                case 9: componentid = 1080;
                case 10: componentid = 1081;
                case 11: componentid = 1082;
                case 12: componentid = 1083;
                case 13: componentid = 1084;
                case 14: componentid = 1085;
                case 15: componentid = 1096;
                case 16: componentid = 1097;
                case 17: componentid = 1098;
           }
       }
        case 402,403,406..409,411..414,416,419,423,424,427..429,431..435,437,438,440..445,448,450,451,455..459,461..463,466..468,470,471,474,475,479..486,490,494,495,498,499,502..510,514,515,521..526,528,530..533,541,552,543..545,554..557,566,568,578,571..574,579,581..584,586..588,591,594,596..599,601,602,604..611:
        {
            switch(count)
            {
                case 1: componentid = 1025;
                case 2: componentid = 1073;
                case 3: componentid = 1074;
                case 4: componentid = 1075;
                case 5: componentid = 1076;
                case 6: componentid = 1077;
                case 7: componentid = 1078;
                case 8: componentid = 1079;
                case 9: componentid = 1080;
                case 10: componentid = 1081;
                case 11: componentid = 1082;
                case 12: componentid = 1083;
                case 13: componentid = 1084;
                case 14: componentid = 1085;
                case 15: componentid = 1096;
                case 16: componentid = 1097;
                case 17: componentid = 1098;
           }
       }
   }
    return componentid;
}

GetVehicleHydraulicCount(model, &count = 0)
{
    switch(model)
    {
        case 400,401,404,405,410,415,418,420..422,426,436,439,477,478,489,491,492,496,500,516..518,527,529,534..536,540,542,546,547,549..551,558..562,565,567,575,576,580,585,589,600,603: count = 1;
        case 402,403,406..409,411..414,416,419,423,424,427..429,431..435,437,438,440..445,448,450,451,455..459,461..463,466..468,470,471,474,475,479..486,490,494,495,498,499,502..510,514,515,521..526,528,530..533,541,552,543..545,554..557,566,568,578,571..574,579,581..584,586..588,591,594,596..599,601,602,604..611: count = 1;
   }
    return count;
}

GetVehicleCompatibleHydraulic(model, count, &componentid = 0)
{
    switch(model)
    {
        case 400,401,404,405,410,415,418,420..422,426,436,439,477,478,489,491,492,496,500,516..518,527,529,534..536,540,542,546,547,549..551,558..562,565,567,575,576,580,585,589,600,603:
        {
            switch(count)
            {
                case 1: componentid = 1087;
           }
       }
        case 402,403,406..409,411..414,416,419,423,424,427..429,431..435,437,438,440..445,448,450,451,455..459,461..463,466..468,470,471,474,475,479..486,490,494,495,498,499,502..510,514,515,521..526,528,530..533,541,552,543..545,554..557,566,568,578,571..574,579,581..584,586..588,591,594,596..599,601,602,604..611:
        {
            switch(count)
            {
                case 1: componentid = 1087;
           }
       }
   }
    return componentid;
}

GetVehicleNitroCount(model, &count = 0)
{
    switch(model)
    {
        case 400,401,404,405,410,415,418,420..422,426,436,439,477,478,489,491,492,496,500,516..518,527,529,534..536,540,542,546,547,549..551,558..562,565,567,575,576,580,585,589,600,603: count = 3;
        case 402,403,406..409,411..414,416,419,423,424,427..429,431..435,437,438,440..445,448,450,451,455..459,461..463,466..468,470,471,474,475,479..486,490,494,495,498,499,502..510,514,515,521..526,528,530..533,541,552,543..545,554..557,566,568,578,571..574,579,581..584,586..588,591,594,596..599,601,602,604..611: count = 3;
   }
    return count;
}

GetVehicleCompatibleNitro(model, count, &componentid = 0)
{
    switch(model)
    {
        case 400,401,404,405,410,415,418,420..422,426,436,439,477,478,489,491,492,496,500,516..518,527,529,534..536,540,542,546,547,549..551,558..562,565,567,575,576,580,585,589,600,603:
        {
            switch(count)
            {
                case 1: componentid = 1009;
                case 2: componentid = 1008;
                case 3: componentid = 1010;
           }
       }
        case 402,403,406..409,411..414,416,419,423,424,427..429,431..435,437,438,440..445,448,450,451,455..459,461..463,466..468,470,471,474,475,479..486,490,494,495,498,499,502..510,514,515,521..526,528,530..533,541,552,543..545,554..557,566,568,578,571..574,579,581..584,586..588,591,594,596..599,601,602,604..611:
        {
            switch(count)
            {
                case 1: componentid = 1009;
                case 2: componentid = 1008;
                case 3: componentid = 1010;
           }
       }
   }
    return componentid;
}

stock GetVehicleRightSSCount(model, &count = 0)
{
    switch(model)
    {
        case 401, 404, 410, 415, 422, 436, 439, 477, 491, 496, 516, 517, 518, 527, 529, 536, 540, 546, 549, 575, 576, 580, 585, 589, 600, 603: count = 1;
        case 534, 535, 558..562, 565: count = 2;
   }
    return count;
}

stock GetVehicleCompatibleRightSS(model, count, &componentid = 0)
{
    switch(model)
    {
        case 401:
        {
            switch(count)
            {
                case 1: componentid = 1007;
           }
       }
        case 404:
        {
            switch(count)
            {
                case 1: componentid = 1007;
           }
       }
        case 410:
        {
            switch(count)
            {
                case 1: componentid = 1007;
           }
       }
        case 415:
        {
            switch(count)
            {
                case 1: componentid = 1007;
           }
       }
        case 422:
        {
            switch(count)
            {
                case 1: componentid = 1007;
           }
       }
        case 436:
        {
            switch(count)
            {
                case 1: componentid = 1007;
           }
       }
        case 439:
        {
            switch(count)
            {
                case 1: componentid = 1007;
           }
       }
        case 477:
        {
            switch(count)
            {
                case 1: componentid = 1007;
           }
       }
        case 491:
        {
            switch(count)
            {
                case 1: componentid = 1007;
           }
       }
        case 496:
        {
            switch(count)
            {
                case 1: componentid = 1007;
           }
       }
        case 516:
        {
            switch(count)
            {
                case 1: componentid = 1007;
           }
       }
        case 517:
        {
            switch(count)
            {
                case 1: componentid = 1007;
           }
       }
        case 518:
        {
            switch(count)
            {
                case 1: componentid = 1007;
           }
       }
        case 527:
        {
            switch(count)
            {
                case 1: componentid = 1007;
           }
       }
        case 529:
        {
            switch(count)
            {
                case 1: componentid = 1007;
           }
       }
        case 534:
        {
            switch(count)
            {
                case 1: componentid = 1106;
                case 2: componentid = 1122;
           }
       }
        case 535:
        {
            switch(count)
            {
                case 1: componentid = 1118;
                case 2: componentid = 1119;
           }
       }
        case 536:
        {
            switch(count)
            {
                case 1: componentid = 1108;
           }
       }
        case 540:
        {
            switch(count)
            {
                case 1: componentid = 1007;
           }
       }
        case 546:
        {
            switch(count)
            {
                case 1: componentid = 1007;
           }
       }
        case 549:
        {
            switch(count)
            {
                case 1: componentid = 1007;
           }
       }
        case 558:
        {
            switch(count)
            {
                case 1: componentid = 1090;
                case 2: componentid = 1095;
           }
       }
        case 559:
        {
            switch(count)
            {
                case 1: componentid = 1069;
                case 2: componentid = 1070;
           }
       }
        case 560:
        {
            switch(count)
            {
                case 1: componentid = 1026;
                case 2: componentid = 1031;
           }
       }
        case 561:
        {
            switch(count)
            {
                case 1: componentid = 1056;
                case 2: componentid = 1057;
           }
       }
        case 562:
        {
            switch(count)
            {
                case 1: componentid = 1036;
                case 2: componentid = 1041;
           }
       }
        case 565:
        {
            switch(count)
            {
                case 1: componentid = 1047;
                case 2: componentid = 1048;
           }
       }
        case 567:
        {
            switch(count)
            {
                case 1: componentid = 1133;
           }
       }
        case 575:
        {
            switch(count)
            {
                case 1: componentid = 1042;
           }
       }
        case 576:
        {
            switch(count)
            {
                case 1: componentid = 1134;
           }
       }
        case 580:
        {
            switch(count)
            {
                case 1: componentid = 1007;
           }
       }
        case 585:
        {
            switch(count)
            {
                case 1: componentid = 1007;
           }
       }
        case 589:
        {
            switch(count)
            {
                case 1: componentid = 1007;
           }
       }
        case 600:
        {
            switch(count)
            {
                case 1: componentid = 1007;
           }
       }
        case 603:
        {
            switch(count)
            {
                case 1: componentid = 1007;
           }
       }
   }
    return componentid;
}

stock GetVehicleLeftSSCount(model, &count = 0)
{
    switch(model)
    {
        case 401, 404, 410, 415, 422, 436, 439, 477, 491, 496, 516, 517, 518, 527, 529, 536, 540, 546, 549, 575, 576, 580, 585, 589, 600, 603: count = 1;
        case 534, 535, 558..562, 565: count = 2;
   }
    return count;
}

stock GetVehicleCompatibleLeftSS(model, count, &componentid = 0)
{
    switch(model)
    {
        case 401:
        {
            switch(count)
            {
                case 1: componentid = 1017;
           }
       }
        case 404:
        {
            switch(count)
            {
                case 1: componentid = 1017;
           }
       }
        case 410:
        {
            switch(count)
            {
                case 1: componentid = 1017;
           }
       }
        case 415:
        {
            switch(count)
            {
                case 1: componentid = 1017;
           }
       }
        case 422:
        {
            switch(count)
            {
                case 1: componentid = 1017;
           }
       }
        case 436:
        {
            switch(count)
            {
                case 1: componentid = 1017;
           }
       }
        case 439:
        {
            switch(count)
            {
                case 1: componentid = 1017;
           }
       }
        case 477:
        {
            switch(count)
            {
                case 1: componentid = 1017;
           }
       }
        case 491:
        {
            switch(count)
            {
                case 1: componentid = 1017;
           }
       }
        case 496:
        {
            switch(count)
            {
                case 1: componentid = 1017;
           }
       }
        case 516:
        {
            switch(count)
            {
                case 1: componentid = 1017;
           }
       }
        case 517:
        {
            switch(count)
            {
                case 1: componentid = 1017;
           }
       }
        case 518:
        {
            switch(count)
            {
                case 1: componentid = 1017;
           }
       }
        case 527:
        {
            switch(count)
            {
                case 1: componentid = 1017;
           }
       }
        case 529:
        {
            switch(count)
            {
                case 1: componentid = 1017;
           }
       }
        case 534:
        {
            switch(count)
            {
                case 1: componentid = 1101;
                case 2: componentid = 1124;
           }
       }
        case 535:
        {
            switch(count)
            {
                case 1: componentid = 1120;
                case 2: componentid = 1121;
           }
       }
        case 536:
        {
            switch(count)
            {
                case 1: componentid = 1107;
           }
       }
        case 540:
        {
            switch(count)
            {
                case 1: componentid = 1017;
           }
       }
        case 546:
        {
            switch(count)
            {
                case 1: componentid = 1017;
           }
       }
        case 549:
        {
            switch(count)
            {
                case 1: componentid = 1017;
           }
       }
        case 558:
        {
            switch(count)
            {
                case 1: componentid = 1093;
                case 2: componentid = 1094;
           }
       }
        case 559:
        {
            switch(count)
            {
                case 1: componentid = 1071;
                case 2: componentid = 1072;
           }
       }
        case 560:
        {
            switch(count)
            {
                case 1: componentid = 1027;
                case 2: componentid = 1030;
           }
       }
        case 561:
        {
            switch(count)
            {
                case 1: componentid = 1062;
                case 2: componentid = 1063;
           }
       }
        case 562:
        {
            switch(count)
            {
                case 1: componentid = 1039;
                case 2: componentid = 1040;
           }
       }
        case 565:
        {
            switch(count)
            {
                case 1: componentid = 1051;
                case 2: componentid = 1052;
           }
       }
        case 567:
        {
            switch(count)
            {
                case 1: componentid = 1102;
           }
       }
        case 575:
        {
            switch(count)
            {
                case 1: componentid = 1099;
           }
       }
        case 576:
        {
            switch(count)
            {
                case 1: componentid = 1137;
           }
       }
        case 580:
        {
            switch(count)
            {
                case 1: componentid = 1017;
           }
       }
        case 585:
        {
            switch(count)
            {
                case 1: componentid = 1017;
           }
       }
        case 589:
        {
            switch(count)
            {
                case 1: componentid = 1017;
           }
       }
        case 600:
        {
            switch(count)
            {
                case 1: componentid = 1017;
           }
       }
        case 603:
        {
            switch(count)
            {
                case 1: componentid = 1017;
           }
       }
   }
    return componentid;
}

stock GetVehiclePaintJobCount(model, &count = 0)
{
    switch(model)
    {
        case 483: count = 1;
        case 575: count = 2;
        case 534, 535, 536, 558..562, 565, 567, 576: count = 3;
   }
    return count;
}

stock GetVehicleCompatiblePaintJob(model, count, &componentid = 0)
{
    switch(model)
    {
        case 483:
        {
            switch(count)
            {
                case 1: componentid = 0;
           }
       }
        case 534:
        {
            switch(count)
            {
                case 1: componentid = 0;
                case 2: componentid = 1;
                case 3: componentid = 2;
           }
       }
        case 535:
        {
            switch(count)
            {
                case 1: componentid = 0;
                case 2: componentid = 1;
                case 3: componentid = 2;
           }
       }
        case 536:
        {
            switch(count)
            {
                case 1: componentid = 0;
                case 2: componentid = 1;
                case 3: componentid = 2;
           }
       }
        case 558..562:
        {
            switch(count)
            {
                case 1: componentid = 0;
                case 2: componentid = 1;
                case 3: componentid = 2;
           }
       }
        case 565:
        {
            switch(count)
            {
                case 1: componentid = 0;
                case 2: componentid = 1;
                case 3: componentid = 2;
           }
       }
        case 567:
        {
            switch(count)
            {
                case 1: componentid = 0;
                case 2: componentid = 1;
                case 3: componentid = 2;
           }
       }
        case 575:
        {
            switch(count)
            {
                case 1: componentid = 0;
                case 2: componentid = 1;
           }
       }
        case 576:
        {
            switch(count)
            {
                case 1: componentid = 0;
                case 2: componentid = 1;
                case 3:componentid = 2;
           }
       }
   }
    return componentid;
}

GetVehicleCompatibleComponent(category, model, listitem)
{
    switch(category)
    {
        case 0: return GetVehicleCompatibleSpoiler(model, listitem);
        case 1: return GetVehicleCompatibleHood(model, listitem);
        case 2: return GetVehicleCompatibleExhaust(model, listitem);
        case 3: return GetVehicleCompatibleFBumper(model, listitem);
        case 4: return GetVehicleCompatibleBBumper(model, listitem);
        case 5: return GetVehicleCompatibleRoof(model, listitem);
        case 6: return GetVehicleCompatibleWheel(model, listitem);
        case 7: return GetVehicleCompatibleHydraulic(model, listitem);
        case 8: return GetVehicleCompatibleNitro(model, listitem);
        case 9: return GetVehicleCompatibleLeftSS(model, listitem);
        case 10: return GetVehicleCompatiblePaintJob(model, listitem);
   }

    return 0;
}

SetPlayerTuningCameraPos(playerid, category)
{
    switch(category)
    {
        case 0:
        {
            SetPlayerCameraPos(playerid, 441.1662, -1302.0037, 18.0385);
            SetPlayerCameraLookAt(playerid, 440.2185, -1301.6881, 17.6184);
       }
        case 1:
        {
            InterpolateCameraPos(playerid, 441.1662, -1302.0037, 18.0385, 433.8757, -1306.9038, 17.3670, 2000, CAMERA_MOVE);
            InterpolateCameraLookAt(playerid, 440.2185, -1301.6881, 17.6184, 433.8736, -1305.9052, 16.9670, 2000, CAMERA_MOVE);
       }
        case 2:
        {
            InterpolateCameraPos(playerid, 433.8757, -1306.9038, 17.3670, 434.0576, -1291.3750, 14.7338, 2000, CAMERA_MOVE);
            InterpolateCameraLookAt(playerid, 433.8736, -1305.9052, 16.9670, 434.0497, -1292.3737, 14.6737, 2000, CAMERA_MOVE);
       }
        case 3:
        {
            InterpolateCameraPos(playerid, 434.0576, -1291.3750, 14.7338, 434.3085, -1308.4880, 15.5030, 2000, CAMERA_MOVE);
            InterpolateCameraLookAt(playerid, 434.0497, -1292.3737, 14.6737, 434.2510, -1307.4908, 15.4430, 2000, CAMERA_MOVE);
       }
        case 4:
        {
            InterpolateCameraPos(playerid, 434.3085, -1308.4880, 15.5030, 434.0576, -1291.3750, 14.7338, 2000, CAMERA_MOVE);
            InterpolateCameraLookAt(playerid, 434.2510, -1307.4908, 15.4430, 434.0497, -1292.3737, 14.6737, 2000, CAMERA_MOVE);
       }
        case 5:
        {
            InterpolateCameraPos(playerid, 434.0576, -1291.3750, 14.7338, 434.1084, -1302.1560, 18.7596, 2000, CAMERA_MOVE);
            InterpolateCameraLookAt(playerid, 434.0497, -1292.3737, 14.6737, 434.0650, -1301.1581, 17.5145, 2000, CAMERA_MOVE);
       }
        case 6:
        {
            InterpolateCameraPos(playerid, 434.1084, -1302.1560, 18.7596, 437.3644, -1301.3735, 15.4735, 2000, CAMERA_MOVE);
            InterpolateCameraLookAt(playerid, 434.0650, -1301.1581, 17.5145, 436.5263, -1300.8302, 15.2985, 2000, CAMERA_MOVE);
       }
        case 7:
        {
            InterpolateCameraPos(playerid, 437.3644, -1301.3735, 15.4735, 437.6285, -1305.2942, 15.9692, 2000, CAMERA_MOVE);
            InterpolateCameraLookAt(playerid, 436.5263, -1300.8302, 15.2985, 437.0403, -1304.4867, 15.7142, 2000, CAMERA_MOVE);
       }
        case 8:
        {
            InterpolateCameraPos(playerid, 437.6285, -1305.2942, 15.9692, 434.1383, -1293.2971, 19.6626, 2000, CAMERA_MOVE);
            InterpolateCameraLookAt(playerid, 437.0403, -1304.4867, 15.7142, 434.1313, -1294.2961, 18.7776, 2000, CAMERA_MOVE);
       }
        case 9:
        {
            InterpolateCameraPos(playerid, 434.1383, -1293.2971, 19.6626, 438.7916, -1299.0066, 15.9129, 2000, CAMERA_MOVE);
            InterpolateCameraLookAt(playerid, 434.1313, -1294.2961, 18.7776, 437.7929, -1299.0272, 15.7329, 2000, CAMERA_MOVE);
       }
        case 10:
        {
            InterpolateCameraPos(playerid, 438.7916, -1299.0066, 15.9129, 433.8757, -1306.9038, 17.3670, 2000, CAMERA_MOVE);
            InterpolateCameraLookAt(playerid, 437.7929, -1299.0272, 15.7329, 433.8736, -1305.9052, 16.9670, 2000, CAMERA_MOVE);
       }
        default: return 0;
   }

    return 1;
}


ShowNavigatorSys(playerid, panel, error[] = "")
{
	new
		string[330];

	switch(panel)
	{
		case 0: //sokak
		{
			if(isnull(error)) string = "Bulmaya çalýþtýðýnýz sokaðýn adýný girin.";
			else format(string, sizeof(string), "%s\n\nBulmaya çalýþtýðýnýz sokaðýn adýný girin.", error);
			Dialog_Show(playerid, GPS_STREET, DIALOG_STYLE_INPUT, "SA Maps - Sokak Bul", string, "Ýleri", "Geri");
		}
		case 1: //ev kapý no
		{
			if(isnull(error)) format(string, sizeof(string), "Bulmaya çalýþtýðýnýz evin kapý numarasýný girin. (örneðin: %i)", randomEx(1, 2000));
			else format(string, sizeof(string), "%s\n\nBulmaya çalýþtýðýnýz evin kapý numarasýný girin. (örneðin: %i)", error, strlen(PropertyNameHolder[playerid]) > 0 ? strval(PropertyNameHolder[playerid]) : randomEx(1, 2000));
			Dialog_Show(playerid, GPS_PROPERTY_NO, DIALOG_STYLE_INPUT, "SA Maps - Ev Bul", string, "Ýleri", "Geri");
		}
		case 2: // benzinlik
		{
			new id = Business_Closest(playerid, BUSINESS_GASSTATION);
			if (id != -1)
			{
				SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}%s haritanýzda iþaretlendi.", BusinessData[id][BusinessName]);
			    SetPlayerCheckpoint(playerid, BusinessData[id][EnterPos][0], BusinessData[id][EnterPos][1], BusinessData[id][EnterPos][2], 5.0);
			}
			else SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Yakýnýnýzda benzinlik bulunamadý.");
		}
		case 3: // 24/7
		{
			new id = Business_Closest(playerid, BUSINESS_STORE || BUSINESS_GENERAL);
			if (id != -1)
			{
				SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}%s haritanýzda iþaretlendi.", BusinessData[id][BusinessName]);
			    SetPlayerCheckpoint(playerid, BusinessData[id][EnterPos][0], BusinessData[id][EnterPos][1], BusinessData[id][EnterPos][2], 5.0);
			}
			else SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Yakýnýnýzda 24/7 bulunamadý.");
		}
		case 4: // Bar/Kulüp
		{
			new id = Business_Closest(playerid, BUSINESS_CLUB);
			if (id != -1)
			{
				SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}%s haritanýzda iþaretlendi.", BusinessData[id][BusinessName]);
			    SetPlayerCheckpoint(playerid, BusinessData[id][EnterPos][0], BusinessData[id][EnterPos][1], BusinessData[id][EnterPos][2], 5.0);
			}
			else SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Yakýnýnýzda bar/kulüp bulunamadý.");
		}
		case 5: // Restaurant
		{
			new id = Business_Closest(playerid, BUSINESS_RESTAURANT);
			if (id != -1)
			{
				SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}%s haritanýzda iþaretlendi.", BusinessData[id][BusinessName]);
			    SetPlayerCheckpoint(playerid, BusinessData[id][EnterPos][0], BusinessData[id][EnterPos][1], BusinessData[id][EnterPos][2], 5.0);
			}
			else SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Yakýnýnýzda restaurant bulunamadý.");
		}
		case 6: // tüm iþyerleri 200mt
		{
			new sira, primary_str[750], sub_str[75];
			strcat(primary_str, "#\tÝþyeri Adý\n");

			foreach(new i : Businesses)
			{
				if(!IsPlayerInRangeOfPoint(playerid, 200.0, BusinessData[i][EnterPos][0], BusinessData[i][EnterPos][1], BusinessData[i][EnterPos][2])) continue;

				format(sub_str, sizeof(sub_str), "%i\t%s\n", i, BusinessData[i][BusinessName]);
				strcat(primary_str, sub_str);
				sira++;

				if(sira > 10) break;
			}

			if(!sira) strcat(primary_str, "Hiç iþyeri yok.");

			Dialog_Show(playerid, GPS_BUSINESS_LIST, DIALOG_STYLE_TABLIST_HEADERS, "SA Maps - Tüm Ýþyerleri", primary_str, "Ýþaretle", "Geri");

		}
	}
	return 1;
}

GetPreviousPlayer(current) {
	new prev = -1;

	if (Iter_Count(SpectatePlayers) > 1)
	{
		if (Iter_Contains(SpectatePlayers, current)) {
			prev = Iter_Prev(SpectatePlayers, current);

			if (prev == Iter_Begin(SpectatePlayers)) {
			    prev = Iter_Last(SpectatePlayers);
			}
		}
	}

	return prev;
}

Entrance_Create(playerid, name[])
{
	new id = Iter_Free(Entrances);
   	if (id == -1) return SendErrorMessage(playerid, "Maksimum eklenebilecek bina sýnýrýna ulaþýlmýþ.");

	static
		Float: x,
		Float: y,
		Float: z,
		Float: angle;

    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, angle);

	format(EntranceData[id][EntranceName], 32, name);
	EntranceData[id][EntranceIcon] = 1318;
	EntranceData[id][EntranceFaction] = 0;
	EntranceData[id][EntranceLocked] = true;

	EntranceData[id][EntrancePos][0] = x;
	EntranceData[id][EntrancePos][1] = y;
	EntranceData[id][EntrancePos][2] = z;
	EntranceData[id][EntrancePos][3] = angle;

	EntranceData[id][EntranceInteriorID] = GetPlayerInterior(playerid);
	EntranceData[id][EntranceWorld] = GetPlayerVirtualWorld(playerid);

	EntranceData[id][EntranceInt][0] = x;
	EntranceData[id][EntranceInt][1] = y;
	EntranceData[id][EntranceInt][2] = z + 10000;
	EntranceData[id][EntranceInt][3] = 0.0000;

	EntranceData[id][ExitInteriorID] = 99;
	EntranceData[id][ExitWorld] = 99;
	Iter_Add(Entrances, id);

	SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý binayý ekledin. (kilidi açýp, iç kýsmý ayarlamayý unutmayýn)", id);
	mysql_tquery(m_Handle, "INSERT INTO entrances (EntranceLocked) VALUES(1)", "OnEntranceCreated", "d", id);
	Entrance_Refresh(id);
	return 1;
}

IsNumeric(const string[]) return !sscanf(string, "{f}");
IsValidRoleplayName(string[]) return !sscanf(string, "{p<_>s[15]s[15]}");

GetXYInFrontOfPlayer(playerid, &Float:x, &Float:y, Float:distance)
{
	new Float: a;
	GetPlayerPos(playerid, x, y, a);
	GetPlayerFacingAngle(playerid, a);
	if (GetPlayerVehicleID(playerid)) GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
	x += (distance * floatsin(-a, degrees));
	y += (distance * floatcos(-a, degrees));
}

GetIDByID(id)
{
	foreach(new i : Player)
	{
		if(!pLoggedIn[i]) continue;

		if(PlayerData[i][pSQLID] == id)
			return i;
	}
	return INVALID_PLAYER_ID;
}

SendClientMessageEx(playerid, color, const str[], {Float,_}:...)
{
	static
	    args,
	    start,
	    end,
	    string[156]
	;
	#emit LOAD.S.pri 8
	#emit STOR.pri args

	if (args > 12)
	{
		#emit ADDR.pri str
		#emit STOR.pri start

	    for (end = start + (args - 12); end > start; end -= 4)
		{
	        #emit LREF.pri end
	        #emit PUSH.pri
		}
		#emit PUSH.S str
		#emit PUSH.C 156
		#emit PUSH.C string
		#emit PUSH.C args
		#emit SYSREQ.C format

		SendClientMessage(playerid, color, string);

		#emit LCTRL 5
		#emit SCTRL 4
		#emit RETN
	}
	return SendClientMessage(playerid, color, str);
}

Server:SQL_LoadPlayerData(playerid)
{
	if(pLoggedIn[playerid])
	{
		SendClientMessage(playerid, COLOR_ADM, "SERVER: Güvenlik zafiyeti oluþtu, lütfen geliþtiricilerle iletiþime geçin.");
		KickEx(playerid);
		return 1;
	}

	pLoggedIn[playerid] = true;

	cache_get_value_name_int(0, "id", PlayerData[playerid][pSQLID]);

	new player_name[24];
	cache_get_value_name(0, "Name", player_name, 24);
	SetPlayerName(playerid, player_name);

	cache_get_value_name_int(0, "AdminHide", bool:PlayerData[playerid][pAdminHide]);

	cache_get_value_name_int(0, "Gender", PlayerData[playerid][pGender]);
	cache_get_value_name_int(0, "Exp", PlayerData[playerid][pExp]);
	cache_get_value_name_int(0, "Level", PlayerData[playerid][pLevel]);
	cache_get_value_name_int(0, "Money", PlayerData[playerid][pMoney]);
	cache_get_value_name_int(0, "Bank", PlayerData[playerid][pBank]);
	cache_get_value_name_int(0, "Paycheck", PlayerData[playerid][pPaycheck]);
	cache_get_value_name_int(0, "Savings", PlayerData[playerid][pSavings]);
	cache_get_value_name_int(0, "UpgradePoints", PlayerData[playerid][pUpgradePoints]);

    cache_get_value_name_int(0, "Birthdate", PlayerData[playerid][pBirthdate]);
    cache_get_value_name(0, "Birthplace", PlayerData[playerid][pBirthplace], 35);
	cache_get_value_name(0, "Attributes", PlayerData[playerid][pAttributes], 128);
 	cache_get_value_name_int(0, "SecurityNumber", PlayerData[playerid][pSecurityNumber]);

	cache_get_value_name_float(0, "LastX", PlayerData[playerid][pPos][0]);
	cache_get_value_name_float(0, "LastY", PlayerData[playerid][pPos][1]);
	cache_get_value_name_float(0, "LastZ", PlayerData[playerid][pPos][2]);
	cache_get_value_name_float(0, "LastRot", PlayerData[playerid][pPos][3]);
	cache_get_value_name_int(0, "Interior", PlayerData[playerid][pInterior]);
	cache_get_value_name_int(0, "World", PlayerData[playerid][pWorld]);

	cache_get_value_name_int(0, "MaxHealth", PlayerData[playerid][pMaxHealth]);
	cache_get_value_name_float(0, "LastHealth", PlayerData[playerid][pLastHealth]);
	cache_get_value_name_float(0, "LastArmor", PlayerData[playerid][pLastArmor]);

	cache_get_value_name_int(0, "Skin", PlayerData[playerid][pSkin]);
	cache_get_value_name_int(0, "DutySkin", PlayerData[playerid][pDutySkin]);

	cache_get_value_name_int(0, "DonatorLevel", PlayerData[playerid][pDonator]);
	cache_get_value_name_int(0, "DonateTime", PlayerData[playerid][pDonateTime]);

	cache_get_value_name_int(0, "Rep", PlayerData[playerid][pRep]);
	cache_get_value_name_int(0, "FirstLogin", PlayerData[playerid][pFirstLogin]);

	cache_get_value_name_int(0, "OnlineTime", PlayerData[playerid][pOnlineTime]);
	cache_get_value_name_int(0, "RegTime", PlayerData[playerid][pRegTime]);
	cache_get_value_name_int(0, "LastTime", PlayerData[playerid][pLastTime]);
	cache_get_value_name_int(0, "LastTimeLength", PlayerData[playerid][pLastTimeLength]);

	cache_get_value_name(0, "RegisterIP", PlayerData[playerid][pRegIP], 16);
	cache_get_value_name(0, "LastIP", PlayerData[playerid][pLastIP], 16);

	cache_get_value_name_int(0, "PlayTime", PlayerData[playerid][pPlayTime]);
	cache_get_value_name(0, "HWID", PlayerData[playerid][pHWID], 60);

    cache_get_value_name_int(0, "CarKey", PlayerData[playerid][pCarKey]);
	cache_get_value_name_int(0, "HasCarSpawned", _has_vehicle_spawned[playerid]);
	cache_get_value_name_int(0, "HasCarSpawnedID", _has_spawned_vehicleid[playerid]);

	cache_get_value_name_int(0, "DriversLicense", PlayerData[playerid][pDriversLicense]);
	cache_get_value_name_int(0, "WeaponsLicense", PlayerData[playerid][pWeaponsLicense]);
	cache_get_value_name_int(0, "MedicalLicense", PlayerData[playerid][pMedicalLicense]);
  cache_get_value_name_int(0, "FlyLicense", PlayerData[playerid][pFlyLicense]);

	cache_get_value_name_int(0, "Faction", PlayerData[playerid][pFaction]);
	cache_get_value_name_int(0, "FactionRank", PlayerData[playerid][pFactionRank]);
	cache_get_value_name_int(0, "Badge", PlayerData[playerid][pBadge]);

	cache_get_value_name_int(0, "Job", PlayerData[playerid][pJob]);
	cache_get_value_name_int(0, "JobTime", PlayerData[playerid][pJobTime]);
	cache_get_value_name_int(0, "JobLevel", PlayerData[playerid][pJobLevel]);

	cache_get_value_name_int(0, "SideJob", PlayerData[playerid][pSideJob]);
	cache_get_value_name_int(0, "SideJobTime", PlayerData[playerid][pSideJobTime]);
	cache_get_value_name_int(0, "SideJobLevel", PlayerData[playerid][pSideJobLevel]);

	cache_get_value_name_int(0, "ICJailed", PlayerData[playerid][pICJailed]);
	cache_get_value_name_int(0, "ICJailTime", PlayerData[playerid][pICJailTime]);

	cache_get_value_name_int(0, "PrisonTimes", PlayerData[playerid][pPrisonTimes]);
	cache_get_value_name_int(0, "ActiveListing", PlayerData[playerid][pActiveListing]);

	cache_get_value_name_int(0, "OfflineAjail", PlayerData[playerid][pOffAjail]);
	cache_get_value_name(0, "OfflineAjailReason", PlayerData[playerid][pOffAjailReason], 128);

	cache_get_value_name_int(0, "AdminJailed", PlayerData[playerid][pAjailed]);
	cache_get_value_name_int(0, "AdminJailTime", PlayerData[playerid][pAjailTime]);
	cache_get_value_name_int(0, "JailTimes", PlayerData[playerid][pJailTimes]);

	cache_get_value_name(0, "AdminMessage", PlayerData[playerid][pAdminMsg], 128);
	cache_get_value_name_int(0, "AdminMessageBy", PlayerData[playerid][pAdminMsgBy]);
	cache_get_value_name_int(0, "AdmMessageConfirm", PlayerData[playerid][pAdmMsgConfirm]);

	cache_get_value_name_int(0, "BrutallyWounded", PlayerData[playerid][pBrutallyWounded]);

	cache_get_value_name_int(0, "Chatstyle", PlayerData[playerid][pChatstyle]);
	cache_get_value_name_int(0, "Walkstyle", PlayerData[playerid][pWalkstyle]);
	cache_get_value_name_int(0, "Fightstyle", PlayerData[playerid][pFightstyle]);
	cache_get_value_name_int(0, "Hudstyle", PlayerData[playerid][pHudstyle]);
	cache_get_value_name_int(0, "StreetStyle", PlayerData[playerid][pStreetstyle]);

	cache_get_value_name_int(0, "ChatStatus", bool:PlayerData[playerid][pChatStatus]);
	cache_get_value_name_int(0, "HudStatus", bool:PlayerData[playerid][pHudStatus]);
	cache_get_value_name_int(0, "StreetStatus", bool:PlayerData[playerid][pStreetStatus]);

	cache_get_value_name_int(0, "PMStatus", bool:PlayerData[playerid][pPMStatus]);
	cache_get_value_name_int(0, "OOCStatus", bool:PlayerData[playerid][pOOCStatus]);
	cache_get_value_name_int(0, "FactionStatus", bool:PlayerData[playerid][pFactionStatus]);
	cache_get_value_name_int(0, "NewsStatus", bool:PlayerData[playerid][pNewsStatus]);

	cache_get_value_name_int(0, "InsideComplex", PlayerData[playerid][pInsideComplex]);
	cache_get_value_name_int(0, "InsideHouse", PlayerData[playerid][pInsideHouse]);
	cache_get_value_name_int(0, "InsideApartment", PlayerData[playerid][pInsideApartment]);
	cache_get_value_name_int(0, "InsideBusiness", PlayerData[playerid][pInsideBusiness]);
	cache_get_value_name_int(0, "InsideGarage", PlayerData[playerid][pInsideGarage]);
	cache_get_value_name_int(0, "InsideEntrance", PlayerData[playerid][pInsideEntrance]);

	cache_get_value_name_int(0, "HasMask", bool:PlayerData[playerid][pHasMask]);
	cache_get_value_name_int(0, "HasRadio", bool:PlayerData[playerid][pHasRadio]);
	cache_get_value_name_int(0, "HasBurnerPhone", bool:PlayerData[playerid][pHasBurner]);

	cache_get_value_name_int(0, "MaskID", PlayerData[playerid][pMaskID]);
	cache_get_value_name_int(0, "MaskIDEx", PlayerData[playerid][pMaskIDEx]);
	cache_get_value_name_int(0, "Boombox", bool:PlayerData[playerid][pHasBoombox]);

	new str[25];
	for(new i = 1; i < MAX_OWNED_CARS; i++)
	{
		format(str, sizeof(str), "OwnedCar%d", i);
	 	cache_get_value_name_int(0, str, PlayerData[playerid][pOwnedCar][i]);
	}

	cache_get_value_name_int(0, "MainSlot", PlayerData[playerid][pMainSlot]);

	for(new i = 1; i < 9; i++)
	{
		format(str, sizeof(str), "Radio%d", i);
		cache_get_value_name_int(0, str, PlayerData[playerid][pRadio][i]);

		format(str, sizeof(str), "Slot%d", i);
		cache_get_value_name_int(0, str, PlayerData[playerid][pRadioSlot][i]);
	}

	for(new i = 0; i < 4; i++)
	{
		format(str, sizeof(str), "Weapons%d", i);
		cache_get_value_name_int(0, str, PlayerData[playerid][pWeapons][i]);

		format(str, sizeof(str), "WeaponsAmmo%d", i);
		cache_get_value_name_int(0, str, PlayerData[playerid][pWeaponsAmmo][i]);
	}

	cache_get_value_name_int(0, "PhoneNumber", PlayerData[playerid][pPhone]);
	cache_get_value_name_int(0, "BurnerPhoneNumber", PlayerData[playerid][pBurnerPhone]);

	cache_get_value_name_int(0, "PhoneOff", PlayerData[playerid][pPhoneOff]);
	cache_get_value_name_int(0, "PhoneType", PlayerData[playerid][pPhoneType]);
	cache_get_value_name_int(0, "PhoneSilent", PlayerData[playerid][pPhoneSilent]);
	cache_get_value_name_int(0, "PhoneRingtone", PlayerData[playerid][pPhoneRingtone]);

	cache_get_value_name_int(0, "Renting", PlayerData[playerid][pRenting]);
	cache_get_value_name_int(0, "WorkOn", PlayerData[playerid][pWorkOn]);

	cache_get_value_name_int(0, "SpawnSelect", PlayerData[playerid][pSpawnPoint]);
	cache_get_value_name_int(0, "SpawnHouse", PlayerData[playerid][pSpawnPointHouse]);
	cache_get_value_name_int(0, "SpawnPrecinct", PlayerData[playerid][pSpawnPrecinct]);

	cache_get_value_name_int(0, "Components", PlayerData[playerid][pComponents]);
	cache_get_value_name_int(0, "Cigarettes", PlayerData[playerid][pCigarettes]);
	cache_get_value_name_int(0, "Drinks", PlayerData[playerid][pDrinks]);
	cache_get_value_name_int(0, "Fishes", PlayerData[playerid][pFishWeight]);

	cache_get_value_name_int(0, "Crashed", PlayerData[playerid][pCrashed]);

	if(PlayerData[playerid][pCrashed])
	{
		new crash_time;
		cache_get_value_name_int(0, "CrashTime", crash_time);
		SetPVarInt(playerid, "CrashTime", crash_time);

		cache_get_value_name_int(0, "pCopDuty", PlayerData[playerid][pLAWduty]);
		cache_get_value_name_int(0, "pSWATDuty", PlayerData[playerid][pSWATduty]);

		if(PlayerData[playerid][pLAWduty] || PlayerData[playerid][pSWATduty])
		{
			if(gettime() - GetPVarInt(playerid, "CrashTime") <= 300)
			{
				SendLawMessage(COLOR_COP, sprintf("** HQ: %s %s tekrardan iþbaþýnda (baðlantý kopmuþtu)! **", Player_GetFactionRank(playerid), ReturnName(playerid, 0)));
			}
		}
	}

	if(!PlayerData[playerid][pMaskID]) PlayerData[playerid][pMaskID] = 200000+random(199991);
	if(!PlayerData[playerid][pMaskIDEx]) PlayerData[playerid][pMaskIDEx] = 40+random(59);
	if(!PlayerData[playerid][pPhone]) PlayerData[playerid][pPhone] = 1000000+random(8999999);
	if(!PlayerData[playerid][pBurnerPhone]) PlayerData[playerid][pBurnerPhone] = 36000+random(6999);
	if(!PlayerData[playerid][pSecurityNumber]) PlayerData[playerid][pSecurityNumber] = 300000+random(199992);
	if(!PlayerData[playerid][pBadge]) PlayerData[playerid][pBadge] = 36000+random(5999);

	SetPlayerColor(playerid, COLOR_WHITE);
	SetPlayerScore(playerid, PlayerData[playerid][pLevel]);
	GivePlayerMoney(playerid, PlayerData[playerid][pMoney]);

	format(PlayerData[playerid][pLastIP], 16, "%s", ReturnIP(playerid));
	format(PlayerData[playerid][pHWID], 60, "%s", ReturnGPCI(playerid));


	if(!isnull(ServerData[MOTDLineMsg])) {
		SendClientMessage(playerid, 0xA7CDFFFF, "====={7db5ff}====={529cfd}====={2081ff}====={ffffff}[ {046ffa}MOTD{ffffff} ]{2081ff}====={529cfd}====={7db5ff}====={a7cdff}=====");
		SendClientMessageEx(playerid, COLOR_WHITE, "%s", ServerData[MOTDLineMsg]);
		SendClientMessage(playerid, 0xA7CDFFFF, "====={7db5ff}====={529cfd}====={2081ff}====={ffffff}[ {046ffa}MOTD{ffffff} ]{2081ff}====={529cfd}====={7db5ff}====={a7cdff}=====");
		SendClientMessageEx(playerid, COLOR_GREY, "%s tarafýndan en son %s tarihinde düzenlendi.", ServerData[MOTDBy], GetFullTime(ServerData[MOTDTime]));
	}

	//SetPlayerSpawn(playerid);

	if(PlayerData[playerid][pFirstLogin])
	{
		Dialog_Show(playerid, GENDER_SELECTOR, DIALOG_STYLE_LIST, "Cinsiyetinizi Seçin", "Erkek\nKadýn", "Seç", "Çýkýþ");
	}
	else
	{
		TogglePlayerSpectating(playerid, 0);
		SetPlayerSpawn(playerid);
	}
	return 1;
}

Dialog:GENDER_SELECTOR(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		PlayerData[playerid][pGender] = listitem;
		SaveSQLInt(PlayerData[playerid][pSQLID], "players", "Gender", listitem);

		if(PlayerData[playerid][pGender] == 0)
		{
			new subString[64];
		    static string[sizeof(erkekSkin) * sizeof(subString)];

		    if (string[0] == EOS)
		    {
		        for (new x; x < sizeof(erkekSkin); x++)
		        {
		            format(subString, sizeof(subString), "%i\n", erkekSkin[x][modelidx]);
		            strcat(string, subString);
		        }
		    }

        ac_ShowPlayerDialog(playerid, DIALOG_SELECT_SKIN);
        ShowPlayerDialog(playerid, DIALOG_SELECT_SKIN, DIALOG_STYLE_PREVIEW_MODEL, "Skin Sec", string, "Sec", "Iptal");
		    return 1;
		}
		else if(PlayerData[playerid][pGender] == 1)
		{
			new subString[64];
		    static string[sizeof(kadinSkin) * sizeof(subString)];

		    if (string[0] == EOS) {
		        for (new f; f < sizeof(kadinSkin); f++) {
		            format(subString, sizeof(subString), "%i\n", kadinSkin[f][modelidx]);
		            strcat(string, subString);
		        }
		    }
        ac_ShowPlayerDialog(playerid, DIALOG_SELECT_SKIN);
        ShowPlayerDialog(playerid, DIALOG_SELECT_SKIN, DIALOG_STYLE_PREVIEW_MODEL, "Skin Sec", string, "Sec", "Iptal");
		    return 1;
		}
	}
	else
	{
		Kick(playerid);
	}
	return 1;
}

Server:SetPlayerSpawn(playerid)
{
	if(PlayerData[playerid][pAjailed])
	{
		SetSpawnInfo(playerid, 0, PlayerData[playerid][pSkin], 2578.929931, 2658.771728, 10.820312, 90, 0, 0, 0, 0, 0, 0);
		SetPlayerVirtualWorld(playerid, 1338);
		SetPlayerInterior(playerid, 0);
		SpawnPlayer(playerid);
	}
	else
 	{
		SetPlayerWeather(playerid, weather);
		SetSpawnInfo(playerid, 0, PlayerData[playerid][pSkin], 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0);
		SpawnPlayer(playerid);

	 	if(PlayerData[playerid][pBrutallyWounded])
		{
			TogglePlayerSpectating(playerid, false);
			SetPlayerPos(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]);
		}
	}

	if(PlayerData[playerid][pOffAjail])
	{
		//SendMessageToAll(COLOR_ADM, "AdmCmd: %s sistem tarafýndan %d dakika hapise gönderildi, sebep: %s", ReturnName(playerid, 1), PlayerData[playerid][pAjailTime], PlayerData[playerid][pOffAjailReason]);
		PlayerData[playerid][pAjailTime] = PlayerData[playerid][pAjailTime] * 60;
		PlayerData[playerid][pAjailed] = 1;

		PlayerData[playerid][pOffAjail] = 0;
		SaveSQLInt(PlayerData[playerid][pSQLID], "players", "OfflineAjail", 0);
		SetSpawnInfo(playerid, 0, PlayerData[playerid][pSkin], 2578.929931, 2658.771728, 10.820312, 90, 0, 0, 0, 0, 0, 0);
		SetPlayerVirtualWorld(playerid, 1338);
		SetPlayerInterior(playerid, 0);
		SpawnPlayer(playerid);
	}

	if(PlayerData[playerid][pAdmin])
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "SERVER: %i seviye yönetici olarak giriþ yaptýn.", PlayerData[playerid][pAdmin]);
		if(isnull(PlayerData[playerid][pAdminName])) ShowPlayerDialog(playerid, DIALOG_ADMIN_NAME, DIALOG_STYLE_INPUT, "Los Santos Stories: Yönetici Adý", "Bir yönetici olarak görülecek adýnýz sisteme girilmemiþ.\nYönetici adýnýzý girin:", "Tamam", "Kapat");
	}

	SetPlayerFightingStyle(playerid, PlayerData[playerid][pFightstyle]);
	if(PlayerData[playerid][pMaxHealth] > 150) PlayerData[playerid][pMaxHealth] = 150;

	SendClientMessage(playerid, COLOR_WHITE, sprintf("SERVER: Hoþgeldin %s.", ReturnName(playerid, 0)));
	GameTextForPlayer(playerid, sprintf("~w~Hos geldin~n~~y~ %s", ReturnName(playerid, 0)), 1000, 1);
	Hud_Change(playerid);

    PlayerData[playerid][pMaxHealth] = 150;

    new query[500];
    for(new bp = 0; bp < 3; bp++)
    {
        mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM bans WHERE ban_ip = '%e' AND active = 1 OR ban_regid = %i AND active = 1", ReturnIP(playerid), CharacterHolder[playerid][bp]);
        mysql_tquery(m_Handle, query, "BanCheck", "i", playerid);
    }

	if(!isnull(PlayerData[playerid][pAdminMsg]))
	{
		ShowPlayerDialog(playerid, DIALOG_ADMIN_MSG, DIALOG_STYLE_MSGBOX, "Los Santos Stories: Yönetim Mesajý", sprintf("%s\n\nGönderen: %s", PlayerData[playerid][pAdminMsg], PlayerData[playerid][pAdminMsgBy]), "Anladým", "");
	}

	if(_has_vehicle_spawned[playerid])
	{
		if(!IsValidVehicle(_has_spawned_vehicleid[playerid])) _has_vehicle_spawned[playerid] = false;
		else
		{
			new vehicleid = _has_spawned_vehicleid[playerid];
			if(!IsValidPlayerCar(vehicleid)) _has_vehicle_spawned[playerid] = false;
			if(IsValidPlayerCar(vehicleid) && CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID]) _has_vehicle_spawned[playerid] = false;
		}
	}

	for (new i = 1, j = GetVehiclePoolSize(); i <= j; ++i)
	{
		if(CarData[i][carRentedBy] == PlayerData[playerid][pSQLID])
		{
		    PlayerData[playerid][pRentCarKey] = i;
		    CarData[i][carTerminate] = 0;
		}
	}

	mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM player_notes WHERE playersqlid = %i", PlayerData[playerid][pSQLID]);
	mysql_tquery(m_Handle, query, "SQL_LoadPlayerNotes", "i", playerid);

	mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM player_contacts WHERE playersqlid = %i", PlayerData[playerid][pSQLID]);
	mysql_tquery(m_Handle, query, "SQL_LoadPlayerContacts", "i", playerid);

	mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM player_anotes WHERE player_dbid = %i", PlayerData[playerid][pSQLID]);
	mysql_tquery(m_Handle, query, "SQL_LoadAdminNotes", "i", playerid);

	mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM player_clothing WHERE player_dbid = %i", PlayerData[playerid][pSQLID]);
	mysql_tquery(m_Handle, query, "SQL_LoadClothing", "i", playerid);

    mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM weapon_attachments WHERE playerdbid = %i", PlayerData[playerid][pSQLID]);
    mysql_tquery(m_Handle, query, "SQL_LoadAttachments", "i", playerid);

	mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM player_fines WHERE player_dbid = %i", PlayerData[playerid][pSQLID]);
	mysql_tquery(m_Handle, query, "LoadPlayerFines", "i", playerid);

	mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM player_drugs WHERE player_dbid = %i", PlayerData[playerid][pSQLID]);
	mysql_tquery(m_Handle, query, "OnLoadPlayerDrugs", "i", playerid);

	mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM player_packages WHERE player_dbid = %i", PlayerData[playerid][pSQLID]);
	mysql_tquery(m_Handle, query, "OnLoadPlayerPackages", "i", playerid);

	PlayerLoginTick[playerid] = gettime();
	return 1;
}


Server:OnLoadPlayerPackages(playerid)
{
	if(!cache_num_rows()) {
		return 1;
	}

	for (new i = 0, j = 1; i < cache_num_rows(); i++, j++) if (j < MAX_PACK_SLOT)
    {
        player_package_data[playerid][j][is_exist] = true;
	    cache_get_value_name_int(i, "id", player_package_data[playerid][j][data_id]);
	    cache_get_value_name_int(i, "player_dbid", player_package_data[playerid][j][player_dbid]);
	    cache_get_value_name_int(i, "weapon_id", player_package_data[playerid][j][weapon_id]);
	    cache_get_value_name_int(i, "weapon_ammo", player_package_data[playerid][j][weapon_ammo]);
	}
	return 1;
}

Server:OnLoadPlayerDrugs(playerid)
{
	if(!cache_num_rows()) {
		return 1;
	}

	for (new i = 0, j = 1; i < cache_num_rows(); i++, j++) if (j < MAX_PACK_SLOT)
    {
        player_drug_data[playerid][j][is_exist] = true;
	    cache_get_value_name_int(i, "id", player_drug_data[playerid][j][data_id]);
	    cache_get_value_name_int(i, "player_dbid", player_drug_data[playerid][j][player_dbid]);
	    cache_get_value_name(i, "drug_name", player_drug_data[playerid][j][drug_name], 64);
	    cache_get_value_name_int(i, "drug_type", player_drug_data[playerid][j][drug_id]);
	    cache_get_value_name_float(i, "drug_amount", player_drug_data[playerid][j][drug_amount]);
	    cache_get_value_name_int(i, "drug_quality", player_drug_data[playerid][j][drug_quality]);
	    cache_get_value_name_int(i, "drug_size", player_drug_data[playerid][j][drug_size]);
	}
	return 1;
}

Server:SetTutorial(playerid)
{
	switch(PlayerTutorialStep[playerid])
	{
		case 0:
		{
			ClearLines(playerid, 20);
			InterpolateCameraPos(playerid, 1641.014892, -2242.337890, -0.346240, 1548.921020, -2288.969726, 78.600074, 1000);
			InterpolateCameraLookAt(playerid, 1644.968505, -2240.932373, -3.065413, 1553.855468, -2288.822509, 77.806571, 1000);

			SendClientMessage(playerid, COLOR_WHITE, "» Los Santos Stories'e hoþ geldin!");
			SendClientMessage(playerid, COLOR_GREY, "Tanýtým sana LSS-RP hakkýnda bilgi vermek için tasarlandý.");
			SendClientMessage(playerid, COLOR_GREY, "Tanýtýmý izlemeni ve okumaný þiddetle tavsiye ediyoruz.");

			PlayerTutorialStep[playerid] = 1;
			PlayerTutorialTimer[playerid] = SetTimerEx("SetTutorial", 7500, false, "i", playerid);
		}
		case 1:
		{
			ClearLines(playerid, 20);
			InterpolateCameraPos(playerid, 1564.186279, -2285.010009, 79.820327, 1671.006835, -2329.321777, -2.432157, 1000);
			InterpolateCameraLookAt(playerid, 1569.135864, -2285.189208, 79.134994, 1666.397705, -2331.202392, -2.900220, 1000);

			SendClientMessage(playerid, COLOR_WHITE, "» Los Santos'a ilk adým!");
			SendClientMessage(playerid, COLOR_GREY, "San Andreas'ýn en büyük Þehri olan Los Santos'a hoþ geldin!");
			SendClientMessage(playerid, COLOR_GREY, "Þu an daha iyi bir yer bulana kadar havaalaný konaklamasýnda kalýyorsun.");
			SendClientMessage(playerid, COLOR_GREY, "Gazete okuyarak sunucu hakkýnda bilgi edinebilirsin.");
			SendClientMessage(playerid, COLOR_GREY, "Gazetenin yeri ilk spawn olduðun bölgededir.");
			SendClientMessage(playerid, COLOR_GREY, "'i' iþaretine giderek /gazete yazabilirsin.");

			PlayerTutorialStep[playerid] = 2;
			PlayerTutorialTimer[playerid] = SetTimerEx("SetTutorial", 9000, false, "i", playerid);
		}
		case 2:
		{
			ClearLines(playerid, 20);
			InterpolateCameraPos(playerid, 1671.006835, -2329.321777, -2.432159, 1830.358764, -1948.206420, 64.698135, 1000);
			InterpolateCameraLookAt(playerid, 1666.443481, -2331.273925, -3.036149, 1827.242675, -1945.608398, 61.775817, 1000);

			SendClientMessage(playerid, COLOR_WHITE, "» Ulaþým");
			SendClientMessage(playerid, COLOR_GREY, "Þehiri gezmek için taksiye ihtiyacýn olacaktýr.");
			SendClientMessage(playerid, COLOR_GREY, "Taksi çaðýrarak ya da araç kiralayak bunu karþýlayabilirsin!");
			SendClientMessage(playerid, COLOR_GREY, "544 numarasýný arayarak taksi çaðýrabilirsin. Kiralýk araçlar þehrin her tarafýnda bulunuyor.");
			GameTextForPlayer(playerid, "~p~ARAMAK ICIN ~w~/ARA 544~n~~y~~h~LOS SANTOS SEHRI~n~~y~~h~ULASIM SERVISI", 5500, 3);

			PlayerTutorialStep[playerid] = 3;
			PlayerTutorialTimer[playerid] = SetTimerEx("SetTutorial", 9000, false, "i", playerid);
		}
		case 3:
		{
			ClearLines(playerid, 20);
			InterpolateCameraPos(playerid, 1830.344848, -1948.239746, 64.692268, 2115.116699, -1747.510009, 20.296503, 1000);
			InterpolateCameraLookAt(playerid, 1827.425659, -1945.640991, 61.573883, 2119.198974, -1750.363281, 19.855669, 1000);

			SendClientMessage(playerid, COLOR_WHITE, "» Kendinle yaþa");
			SendClientMessage(playerid, COLOR_GREY, "Kendi baþýna yaþamanýn vakti geldi diyorsan, motel de bir oda kiralayabilirsin.");
			SendClientMessage(playerid, COLOR_GREY, "Santos þehrinde birçok ev bulunmakta, kimisi ya satýn alýnmýþ ya da kiralýða býrakýlmýþ durumda.");
			SendClientMessage(playerid, COLOR_GREY, "Þehrin belirli yerlerinde kalabilmen için otel ve moteller de bulunuyor.");
			GameTextForPlayer(playerid, "~y~~h~IDLEWOOD MOTEL~n~~w~[~p~/KIRALA ~w~YADA ~p~/ODAKIRALA~w~]", 5500, 3);

			PlayerTutorialStep[playerid] = 4;
			PlayerTutorialTimer[playerid] = SetTimerEx("SetTutorial", 9000, false, "i", playerid);
		}
		case 4:
		{
			ClearLines(playerid, 20);
			InterpolateCameraPos(playerid, 2115.099121, -1747.522460, 20.299240, 2077.549560, -1821.940185, 28.896968, 1000);
			InterpolateCameraLookAt(playerid, 2119.132080, -1750.440795, 19.831176, 2080.799316, -1818.551025, 27.178810, 1000);

			SendClientMessage(playerid, COLOR_WHITE, "» Saðlýðýný üst düzey tut");
			SendClientMessage(playerid, COLOR_GREY, "Canýný yükseltmek için yemek yiyebilirsin.");
			SendClientMessage(playerid, COLOR_GREY, "Þehrin neredeyse her yerinde yemek yemen için restaurantlar bulunuyor.");
			GameTextForPlayer(playerid, "~y~~h~IDLEWOOD PIZZA STACK~n~~w~[~p~/YEMEK~w~]", 4000, 3);

			PlayerTutorialStep[playerid] = 5;
			PlayerTutorialTimer[playerid] = SetTimerEx("SetTutorial", 9000, false, "i", playerid);
		}
		case 5:
		{
			ClearLines(playerid, 20);
			InterpolateCameraPos(playerid, 2077.568115, -1821.903564, 28.892744, 1703.412719, -1306.620971, 51.609062, 1000);
			InterpolateCameraLookAt(playerid, 2080.997314, -1818.767700, 27.046852, 1706.144287, -1303.578369, 48.731292, 1000);

			SendClientMessage(playerid, COLOR_WHITE, "» Reklam þirketi");
			SendClientMessage(playerid, COLOR_GREY, "Verona Mall merkezinden ya da reklam þirketinden reklamlarýný verebilirsin.");
			SendClientMessage(playerid, COLOR_GREY, "Kurallara aykýrý olan reklam türlerini yayýnlayan kiþiler cezaya çarptýrýlýr.");
			SendClientMessage(playerid, COLOR_GREY, "Her zaman gerçekçiliðe yakýn mesajlar kullanmayý unutmayýn.");
			GameTextForPlayer(playerid, "~w~Reklam Ofisi", 5500, 3);

			PlayerTutorialStep[playerid] = 6;
			PlayerTutorialTimer[playerid] = SetTimerEx("SetTutorial", 9000, false, "i", playerid);
		}
		case 6:
		{
			ClearLines(playerid, 20);
			InterpolateCameraPos(playerid, 1745.336181, -1695.835083, 60.621299, 1499.633056, -1680.226440, 53.135593, 1000);
			InterpolateCameraLookAt(playerid, 1747.908325, -1693.032470, 57.376373, 1504.410400, -1680.005371, 51.676662, 1000);

			SendClientMessage(playerid, COLOR_WHITE, "» Kamu görevlileri");
			SendClientMessage(playerid, COLOR_GREY, "Los Santos þehri içerisinde çalýþan kamu görevlileri, ihtiyaç halinde her zaman yanýnýzda olacaktýr.");
			SendClientMessage(playerid, COLOR_GREY, "Kolluk kuvvetleri olarak {8D8DFF}Los Santos Polis Departmaný {AFAFAF}ve {8D8DFF}Los Santos Eyaleti Þerifin Ofisi {AFAFAF}bulunuyor.");
			SendClientMessage(playerid, COLOR_GREY, "{554273}San Andreas Cezaevi ve Rehabilitasyon Merkezi {AFAFAF}Santos sýnýrlarý dýþarýsýnda görev yapan bir baþka kuruluþtur.");
			SendClientMessage(playerid, COLOR_GREY, "{FF8282}Los Santos Ýtfaiye Dairesi, {AFAFAF}Santos þehrinin saðlýk kuruluþudur. EMT ve hastane servislerini sunarlar.");
			SendClientMessage(playerid, COLOR_GREY, "Ýhtiyacýn olduðu durumda 911'i arayabilirsin fakat gerek duyulmadýðý konularda 911'i arayan kiþilere ceza kesilebilir.");
			GameTextForPlayer(playerid, "~n~~n~~w~Los Santos~n~~W~Polis Departmani", 5500, 3);

			PlayerTutorialStep[playerid] = 7;
			PlayerTutorialTimer[playerid] = SetTimerEx("SetTutorial", 12000, false, "i", playerid);
		}
		case 7:
		{
			ClearLines(playerid, 20);
			InterpolateCameraPos(playerid, 1499.633666, -1680.226440, 53.135612, 1480.491943, -1719.702392, 39.188007, 1000);
			InterpolateCameraLookAt(playerid, 1504.405029, -1679.901000, 51.676681, 1480.590698, -1724.598632, 38.179351, 1000);

			SendClientMessage(playerid, COLOR_WHITE, "» Sunucu kurallarý");
			SendClientMessage(playerid, COLOR_GREY, "Her zaman kurallarý takip etmeniz gerektiðini unutmayýn.");
			SendClientMessage(playerid, COLOR_GREY, "Buranýn bir roleplay sunucusu olduðunu unutmayýn. ");
			SendClientMessage(playerid, COLOR_GREY, "Roleplay kurallarý olan (PG, MG, DM, Gerçekçilik dýþý RP) kurallarýný takip edin.");

			ClearLines(playerid, 2);
			SendClientMessage(playerid, COLOR_ADM, "Los Santos Stories'e hoþ geldin!");

			PlayerTutorialStep[playerid] = 8;
			PlayerTutorialTimer[playerid] = SetTimerEx("SetTutorial", 9000, false, "i", playerid);
		}
		case 8:
		{
			ClearLines(playerid, 20);

			PlayerData[playerid][pFirstLogin] = 0;
			SaveSQLInt(PlayerData[playerid][pSQLID], "players", "FirstLogin", 0);
			TogglePlayerSpectating(playerid, 0);
			SetPlayerSpawn(playerid);
		}
	}
	return 1;
}

ReturnBodypartName(bodypart)
{
	new bodyname[20] = EOS;
	switch(bodypart)
	{
		case BODY_PART_CHEST: bodyname = "Göðüs";
		case BODY_PART_GROIN: bodyname = "Kasýk";
		case BODY_PART_LEFT_ARM: bodyname = "Sol Kol";
		case BODY_PART_RIGHT_ARM: bodyname = "Sað Kol";
		case BODY_PART_LEFT_LEG: bodyname = "Sol Ayak";
		case BODY_PART_RIGHT_LEG: bodyname = "Sað Ayak";
		case BODY_PART_HEAD: bodyname = "Kafa";
	}
	return bodyname;
}

ReturnWeaponName(weaponid)
{
	new weapon[22];
    switch(weaponid)
    {
		case 0: weapon = "Yumruk";
		case 18: weapon = "Molotov Cocktail";
		case 44: weapon = "Night Vision Goggles";
		case 45: weapon = "Thermal Goggles";
		case 54: weapon = "Fall";
		default: GetWeaponName(weaponid, weapon, sizeof(weapon));
    }
    return weapon;
}

ReturnVehicleName(vehicleid)
{
	new
		name[35] = "Yok";

    if(!IsValidCar(vehicleid)) return name;

	format(name, sizeof(name), CarData[vehicleid][carName]);
	return name;
}

IsValidCar(vehicleid)
{
	if(vehicleid == 0) return 0;
	if(CarData[vehicleid][carID] != 0) return CarData[vehicleid][carID];
	return 0;
}

IsValidFactionCar(vehicleid)
{
	if(vehicleid == 0) return 0;
	if(CarData[vehicleid][carFaction] != -1) return CarData[vehicleid][carID];
	return 0;
}

IsLAWFactionCar(Factionid)
{
	if (FactionData[Factionid][FactionMedPerms] || FactionData[Factionid][FactionCopPerms])
		return 1;

	return 0;
}

IsValidPlayerCar(vehicleid)
{
	if(vehicleid == 0) return 0;
	if(CarData[vehicleid][carOwnerID] != 0) return CarData[vehicleid][carID];
	return 0;
}

IsValidRentalCar(vehicleid)
{
	if(vehicleid == 0) return 0;
	if(CarData[vehicleid][carRental] != 0) return CarData[vehicleid][carID];
	return 0;
}

GetPlayerStreet(playerid)
{
    new city[35];
    foreach(new i : Streets)
 	{
 	    if(IsPlayerInDynamicArea(playerid, StreetData[i][StreetAreaID]))
		{
			strcat(city, StreetData[i][StreetName]);
		    return city;
		}
	}

	strcat(city, "Unknown");
	return city;
}

GetStreet(Float: x, Float: y, Float: z)
{
    new city[35];
    foreach(new i : Streets)
 	{
 	    if(IsPointInDynamicArea(StreetData[i][StreetAreaID], x, y, z))
		{
			strcat(city, StreetData[i][StreetName]);
		    return city;
		}
	}
	strcat(city, "Unknown");
	return city;
}

GetPlayerPacketloss(playerid, &Float:packetloss)
{
    if(!IsPlayerConnected(playerid)) return 0;

    new nstats[400+1], nstats_loss[20], start, end;
    GetPlayerNetworkStats(playerid, nstats, sizeof(nstats));

    start = strfind(nstats, "packetloss", true);
    end = strfind(nstats,"%", true, start);

    strmid(nstats_loss, nstats, start+12, end, sizeof(nstats_loss));
    packetloss = floatstr(nstats_loss);
    return 1;
}

SaveEntrances()
{
	foreach(new i : Entrances) Entrance_Save(i);
	return 1;
}

SaveFactions()
{
	foreach(new i : Factions) Faction_Save(i);
	return 1;
}

SaveProperties()
{
	foreach(new i : Properties) Property_Save(i);
	return 1;
}

SaveBusinesses()
{
	foreach(new i : Businesses) Business_Save(i);
	return 1;
}

SavePropertyGarages()
{
	foreach(new i : Entrances) Garage_Save(i);
	return 1;
}

SaveTolls()
{
	foreach(new i : Tolls) Toll_Save(i);
	return 1;
}

SaveDoors()
{
	foreach(new i : Doors) Door_Save(i);
	return 1;
}

SavePaynSprays()
{
	foreach(new i : Entrances) PNS_Save(i);
	return 1;
}

SaveTruckers()
{
	foreach(new i : Trucker) Industry_Save(i);
	return 1;
}

SetMoney(playerid, money)
{
	if(!pLoggedIn[playerid]) return 0;

	ResetMoney(playerid);
    PlayerData[playerid][pMoney] = money;
    return GivePlayerMoney(playerid, PlayerData[playerid][pMoney]);
}

ResetMoney(playerid)
{
    if(!pLoggedIn[playerid]) return 0;

    PlayerData[playerid][pMoney] = 0;
    return ResetPlayerMoney(playerid);
}

GiveMoney(playerid, amount)
{
    if(!pLoggedIn[playerid]) return 0;

    PlayerData[playerid][pMoney] = PlayerData[playerid][pMoney] + amount;
    SetMoney(playerid, PlayerData[playerid][pMoney]);
/*
	new string[64];
	format(string, sizeof(string), "%s$%i", amount < 0 ? ("~r~") : ("~g~"), amount);
    GameTextForPlayer(playerid, string, 1300, 1);*/

	LogPlayerAction(playerid, sprintf("$%s miktar para %s. Toplam: $%s", MoneyFormat(amount), (amount < 1) ? ("verdi") : ("aldý"), MoneyFormat(PlayerData[playerid][pMoney])));
	return 1;
}

LogPlayerAction(playerid, logstr[])
{
	if(!pLoggedIn[playerid])
	{
		return 0;
	}

	new query[365];
	mysql_format(m_Handle, query, sizeof(query), "INSERT INTO player_logs (player_dbid, log_detail, time) VALUES(%i, '%e', %i)", PlayerData[playerid][pSQLID], logstr, Time());
	mysql_tquery(m_Handle, query);
	return 1;
}

ShowPlayerLogs(playerid, targetid, page)
{
	new searchQuery[128];
	mysql_format(m_Handle, searchQuery, sizeof(searchQuery), "SELECT * FROM player_logs WHERE player_dbid = %i ORDER BY log_id DESC", PlayerData[targetid][pSQLID]);
	mysql_tquery(m_Handle, searchQuery, "OnShowPlayerLogs", "iii", playerid, targetid, page);
	return 1;
}

Server:OnShowPlayerLogs(playerid, targetid, page)
{
	if(!cache_num_rows()) return SendClientMessage(playerid, COLOR_ADM, "This player hasn't been logged yet.");

	new rows = cache_num_rows();

	new fulllist[1450],
		logStr[256],
		caption[60],
		bool:secondPage,
		count;

	PlayerLogPage[playerid] = page;
	format(caption, 60, "%s (Oyuncu ID: %i, Veritabaný ID: %i)", ReturnName(targetid), targetid, PlayerData[targetid][pSQLID]);

	if(page == 1)
		fulllist = "{FFFF00}Sayfa 1\n";

	else format(fulllist, sizeof(fulllist), "%s{FFFF00}<< Sayfa %d\n", fulllist, page-1);
	page--;

	for(new i = page*MAX_PLOG_PER_PAGE; i < rows; i++)
	{
		count++;

		if(count == MAX_PLOG_PER_PAGE + 1)
		{
			secondPage = true;
			break;
		}
		else
		{
			cache_get_value_name(i, "log_detail", logStr, 256);

			format(fulllist, sizeof(fulllist), "%s%s\n", fulllist, logStr);
		}
	}
	if(secondPage)
		format(fulllist, sizeof(fulllist), "%s{FFFF00}Sayfa %d >>\n", fulllist, (page+1)+1);

	ShowPlayerDialog(playerid, DIALOG_PLOG_LIST, DIALOG_STYLE_LIST, caption, fulllist, ">>", "<<");
	return 1;
}

LogVehicleAction(vehicleid, logstr[], bool:rettime = true)
{
	if(!IsValidPlayerCar(vehicleid))
	{
		return 0;
	}

	if(rettime == true)
	{
    	getdate(year, month, day);
		gettime(hour, minute, second);
	}

	new vehiclelog_query[512];
	mysql_format(m_Handle, vehiclelog_query, sizeof(vehiclelog_query), "INSERT INTO vehicle_logs (vehicle_dbid, log_detail, time) VALUES(%i, '%e', %i)", CarData[vehicleid][carID], logstr, mktime(hour, minute, second, day, month, year));
	mysql_tquery(m_Handle, vehiclelog_query, "", "");
	return 1;
}

ShowVehicleLogs(playerid, vehicleid, page)
{
	new searchQuery[128];
	mysql_format(m_Handle, searchQuery, sizeof(searchQuery), "SELECT * FROM vehicle_logs WHERE vehicle_dbid = %i ORDER BY log_id DESC", CarData[vehicleid][carID]);
	mysql_tquery(m_Handle, searchQuery, "OnShowVehicleLogs", "iii", playerid, vehicleid, page);
	return 1;
}

Server:OnShowVehicleLogs(playerid, vehicleid, page)
{
	if(!cache_num_rows())
		return SendClientMessage(playerid, COLOR_ADM, "This vehicle hasn't been logged yet.");

	new rows = cache_num_rows();

	new fulllist[1200],
		logStr[256],
		caption[60],
		bool:secondPage,
		count;

	PlayerVlogPage[playerid] = page;
	format(caption, 60, "%s (Araç ID: %i, Veritabaný ID: %i)", ReturnVehicleName(vehicleid), vehicleid, CarData[vehicleid][carID]);

	if(page == 1)
		fulllist = "{FFFF00}Page 1\n";

	else format(fulllist, sizeof(fulllist), "%s{FFFF00}<< Sayfa %d\n", fulllist, page-1);
	page--;

	for(new i = page*MAX_VLOG_PER_PAGE; i < rows; i++)
	{
		count++;

		if(count == MAX_VLOG_PER_PAGE + 1)
		{
			secondPage = true;
			break;
		}
		else
		{
			cache_get_value_name(i, "log_detail", logStr, 256);

			format(fulllist, sizeof(fulllist), "%s%s\n", fulllist, logStr);
		}
	}
	if(secondPage)
		format(fulllist, sizeof(fulllist), "%s{FFFF00}Sayfa %d >>\n", fulllist, (page+1)+1);

	ShowPlayerDialog(playerid, DIALOG_VLOG_LIST, DIALOG_STYLE_LIST, caption, fulllist, ">>", "<<");
	return 1;
}

SendLawMessage(color, string[])
{
	foreach(new i : Player) if(PlayerData[i][pLAWduty]) SendClientMessage(i, color, string);
	return 1;
}

Send_MDCMessage(playerid, color, string[])
{
	foreach(new i : Player)
  if(PlayerData[i][pLAWduty] && PlayerData[playerid][pFaction] == PlayerData[i][pFaction] && PlayerData[playerid][pFaction] != -1 && PlayerData[i][pFaction] != -1) SendClientMessage(i, color, string);
	return 1;
}

SendFDMessage(color, string[])
{
	foreach(new i : Player) if(PlayerData[i][pMEDduty]) SendClientMessage(i, color, string);
	return 1;
}

ApplyChatAnimation(playerid, name[])
{
	if (IsPlayerInAnyVehicle(playerid)) ApplyAnimation(playerid, "GANGS", name, 4.1, 1, 0, 0, 0, 0, 1);
	else ApplyAnimation(playerid, "GANGS", name, 4.1, 1, 1, 1, 1, 1, 1);
}

ReturnChatAnimation(playerid, text[])
{
	if(!PlayerData[playerid][pChatStatus]) return 1;
	if(PlayerData[playerid][pPlayingAnimation] || PlayerData[playerid][pBrutallyWounded] || PlayerIsTased[playerid] || GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_HANDSUP) return 1;

	switch(PlayerData[playerid][pChatstyle])
	{
	    case 1: ApplyChatAnimation(playerid, "prtial_gngtlkA");
	    case 2: ApplyChatAnimation(playerid, "prtial_gngtlkB");
	    case 3: ApplyChatAnimation(playerid, "prtial_gngtlkC");
	    case 4: ApplyChatAnimation(playerid, "prtial_gngtlkD");
	    case 5: ApplyChatAnimation(playerid, "prtial_gngtlkE");
	    case 6: ApplyChatAnimation(playerid, "prtial_gngtlkF");
	    case 7: ApplyChatAnimation(playerid, "prtial_gngtlkG");
	    case 8: ApplyChatAnimation(playerid, "prtial_gngtlkH");
		default: ApplyChatAnimation(playerid, "prtial_gngtlkC");
	}

	SetTimerEx("StopChatting", strlen(text) * 100, false, "i", playerid);
	PlayerData[playerid][pPlayingAnimation] = true;
	return 1;
}

Server:StopChatting(playerid)
{
	if(GetPlayerTeam(playerid) == STATE_ALIVE)
	{
	    ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0, 1);
	    ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0, 1);
		PlayerData[playerid][pPlayingAnimation] = false;
	}
	return 1;
}

GetDate()
{
	new gun, ay, yil, saat, dakika, saniye, full_time[15];
	date(Time(), gun, ay, yil, saat, dakika, saniye);
	format(full_time, sizeof(full_time), "%02d_%s", gun, getMonthEN[ay]);
	return full_time;
}

GetShipHour(time_stamp)
{
	new gun, ay, yil, saat, dakika, saniye, full_time[15];
	date(time_stamp, gun, ay, yil, saat, dakika, saniye);
	format(full_time, sizeof(full_time), "%02d:%02d:%02d", saat, dakika, saniye);
	return full_time;
}

GetHour()
{
	new gun, ay, yil, saat, dakika, saniye, full_time[15];
	date(Time(), gun, ay, yil, saat, dakika, saniye);
	format(full_time, sizeof(full_time), "%02d:%02d", saat, dakika);
	return full_time;
}

GetFullTime(time_stamp)
{
	new gun, ay, yil, saat, dakika, saniye, full_time[128];
	date(time_stamp, gun, ay, yil, saat, dakika, saniye);
	format(full_time, sizeof(full_time), "%02d %s %02d %s %02d:%02d", gun, getMonth[ay], yil, GetWeekDay(gun, ay, yil), saat, dakika, saniye);
	return full_time;
}

GetWeekDay(days=0, months=0, years=0)
{
	new weekday_str[10], j, e;
	if (months <= 2)
	{
		months += 12;
		years--;
	}

	j = years % 100;
	e = years / 100;

	switch ((days + (months+1)*26/10 + j + j/4 + e/4 - 2*e) % 7)
	{
		case 0: weekday_str = "Cumartesi";
		case 1: weekday_str = "Pazar";
		case 2: weekday_str = "Pazartesi";
		case 3: weekday_str = "Salý";
		case 4: weekday_str = "Çarþamba";
		case 5: weekday_str = "Perþembe";
		case 6: weekday_str = "Cuma";
	}

	return weekday_str;
}

date(timestamp, &f_day, &f_month, &f_year, &f_hour, &f_min, &f_sec)
{
	new s_year = 1970, s_day = 0, s_month = 0, s_hour = 0, s_mins = 0;
	new days_of_month[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

	while(timestamp > 31622400)
	{
		timestamp -= 31536000;
		if(((s_year % 4 == 0) && (s_year % 100 != 0)) || (s_year % 400 == 0))  timestamp -= 86400;
		s_year++;
	}

	if(((s_year % 4 == 0) && (s_year % 100 != 0)) || (s_year % 400 == 0))
		days_of_month[1] = 29;
	else
		days_of_month[1] = 28;

	while(timestamp > 86400)
	{
		timestamp -= 86400, s_day++;
		if(s_day == days_of_month[s_month]) s_day=0, s_month++;
	}

	while(timestamp>60)
	{
		timestamp -= 60, s_mins++;
		if(s_mins == 60) s_mins=0, s_hour++;
	}

	f_day = s_day + 1;
	f_month = s_month + 1;
	if(f_month > 12) {
		f_month = 1;
		f_year = s_year + 1;
	} else {
		f_month = s_month + 1;
		f_year = s_year;
	}
	f_hour = s_hour;
	f_min = s_mins;
	f_sec = timestamp;

	return true;
}

Time()
{
	getdate(year, month, day);
	gettime(hour, minute, second);
	return mktime(hour, minute, second, day, month, year);
}

mktime(m_hour, m_minute, m_second, m_day, m_month, m_year)
{
	new timestamp2;
	timestamp2 = m_second + (m_minute * 60) + (m_hour * 3600);

	new days_of_month[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	if(((m_year % 4 == 0) && (m_year % 100 != 0)) || (m_year % 400 == 0))
	{
		days_of_month[1] = 29; // Schaltjahr
	}
	else
	{
		days_of_month[1] = 28; // keins
	}

	new days_this_year = 0;
	days_this_year = --m_day;
	if(m_month > 1)
	{
		for(new j = 0; j < m_month - 1; j++)
		{
			days_this_year += days_of_month[j];
		}
	}
	timestamp2 += days_this_year * 86400;

	for(new j = 1970; j < m_year; j++)
	{
		timestamp2 += 31536000;
		if(((j % 4 == 0) && (j % 100 != 0)) || (j % 400 == 0))  timestamp2 += 86400; // Schaltjahr + 1 Tag
	}
	return timestamp2;
}

LocalChat(playerid, Float:max_range, const string[], color, Float:max_ratio = 1.6)
{
	new
		Float:pos_x,
		Float:pos_y,
		Float:pos_z,
		Float:range,
		Float:range_ratio,
		Float:range_with_ratio,
		clr_r, clr_g, clr_b,
		Float:color_r, Float:color_g, Float:color_b;

	if (!GetPlayerPos(playerid, pos_x, pos_y, pos_z)) {
		return 0;
	}

	color_r = float(color >> 24 & 0xFF);
	color_g = float(color >> 16 & 0xFF);
	color_b = float(color >> 8 & 0xFF);
	range_with_ratio = max_range * max_ratio;

	foreach (new i : Player)
	{
		if (playerid == i) {
		//if (!IsPlayerStreamedIn(i, playerid)) {
			continue;
		}

		if(GetPlayerInterior(playerid) != GetPlayerInterior(i)) {
			continue;
		}

		if(GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(i)) {
			continue;
		}

		range = GetPlayerDistanceFromPoint(i, pos_x, pos_y, pos_z);
		if (range > max_range) {
			continue;
		}

		range_ratio = (range_with_ratio - range) / range_with_ratio;
		clr_r = floatround(range_ratio * color_r);
		clr_g = floatround(range_ratio * color_g);
		clr_b = floatround(range_ratio * color_b);

		SendClientMessage(i, (color & 0xFF) | (clr_b << 8) | (clr_g << 16) | (clr_r << 24), string);
	}

	SendClientMessage(playerid, color, string);
	return 1;
}

LocalChatEx(playerid, Float:max_range, const string[], color)
{
	new
		Float:pos_x,
		Float:pos_y,
		Float:pos_z,
		Float:range;

	if (!GetPlayerPos(playerid, pos_x, pos_y, pos_z)) {
		return 0;
	}

	foreach (new i : Player)
	{
		if (!IsPlayerStreamedIn(i, playerid)) {
			continue;
		}

		range = GetPlayerDistanceFromPoint(i, pos_x, pos_y, pos_z);
		if (range > max_range) {
			continue;
		}

		if (!PlayerData[i][pOOCStatus]) {
			continue;
		}

		SendClientMessage(i, color, string);
	}

	SendClientMessage(playerid, color, string);
	return 1;
}

stock SendNearbyMessage(playerid, Float:radius, color, const str[], {Float,_}:...)
{
	static
	    args,
	    start,
	    end,
	    string[144]
	;
	#emit LOAD.S.pri 8
	#emit STOR.pri args

	if (args > 16)
	{
		#emit ADDR.pri str
		#emit STOR.pri start

	    for (end = start + (args - 16); end > start; end -= 4)
		{
	        #emit LREF.pri end
	        #emit PUSH.pri
		}
		#emit PUSH.S str
		#emit PUSH.C 144
		#emit PUSH.C string

		#emit LOAD.S.pri 8
		#emit CONST.alt 4
		#emit SUB
		#emit PUSH.pri

		#emit SYSREQ.C format
		#emit LCTRL 5
		#emit SCTRL 4

        foreach (new i : Player)
		{
			if (IsPlayerNearPlayer(i, playerid, radius)) {
  				SendClientMessage(i, color, string);
			}
		}
		return 1;
	}
	foreach (new i : Player)
	{
		if (IsPlayerNearPlayer(i, playerid, radius)) {
			SendClientMessage(i, color, str);
		}
	}
	return 1;
}

stock split(const src[], dest[][], const delimiter)
{
    new n_pos,num,old,str[1];
    str[0] = delimiter;
    while(n_pos != -1)
    {
        n_pos = strfind(src,str,false,n_pos+1);
        strmid(dest[num++], src, (!num)?0:old+1,(n_pos==-1)?strlen(src):n_pos,256);
        old=n_pos;
    }
    return 1;
}

stock IsPlayerNearPlayer(playerid, targetid, Float:radius)
{
	static
		Float:fX,
		Float:fY,
		Float:fZ;

	GetPlayerPos(targetid, fX, fY, fZ);

	return (GetPlayerInterior(playerid) == GetPlayerInterior(targetid) && GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(targetid)) && IsPlayerInRangeOfPoint(playerid, radius, fX, fY, fZ);
}

stock GetTickCountDifference(newtick, oldtick) { // https://github.com/ScavengeSurvive/tick-difference/blob/master/tick-difference.inc
	if (oldtick < 0 && newtick >= 0) {
		return newtick - oldtick;
	} else if (oldtick >= 0 && newtick < 0 || oldtick > newtick) {
		return (cellmax - oldtick + 1) - (cellmin - newtick);
	}
	return newtick - oldtick;
}

AdmWarnEx(level, const str[], {Float,_}:...)
{
    static
        args,
        start,
        end,
        string[156]
    ;
    #emit LOAD.S.pri 8
    #emit STOR.pri args

    if (args > 12)
    {
        #emit ADDR.pri str
        #emit STOR.pri start

        for (end = start + (args - 12); end > start; end -= 4)
        {
            #emit LREF.pri end
            #emit PUSH.pri
        }
        #emit PUSH.S str
        #emit PUSH.C 156
        #emit PUSH.C string
        #emit PUSH.C args
        #emit SYSREQ.C format

        foreach(new i : Player)
        {
            if(!PlayerData[i][pAdminDuty]) continue;
            if(PlayerData[i][pAdmin] >= level)
            {
                SendClientMessage(i, COLOR_YELLOW, string);
            }
        }

        #emit LCTRL 5
        #emit SCTRL 4
        #emit RETN
    }

    foreach(new i : Player)
    {
        if(!PlayerData[i][pAdminDuty]) continue;
        if(PlayerData[i][pAdmin] >= level)
        {
            SendClientMessage(i, COLOR_YELLOW, str);
        }
    }
    return 1;
}

adminWarn(level, mesaj[])
{
    foreach(new i : Player) {
        if (!PlayerData[i][pAdminDuty]) continue;
        if (PlayerData[i][pAdmin] >= level) SendClientMessageEx(i, COLOR_YELLOW, "AdmWarn[%d]: %s", level, mesaj);
    }
    return 1;
}

MoneyFormat(value)
{
    // http://forum.sa-mp.com/showthread.php?p=843781#post843781
    new string[24];
    valstr(string, value);

    for(new i = (strlen(string) - 3); i > (value < 0 ? 1 : 0) ; i -= 3)
    {
        strins(string[i], ",", 0);
    }

    return string;
}

stock SendAdminMessage(color, const str[])
{
    foreach(new i : Player) if(PlayerData[i][pAdmin] && PlayerData[i][pAdminDuty])
        SendClientMessage(i, color, str);

    return 1;
}

stock SendTesterMessage(color, const str[], {Float,_}:...)
{
    static
        args,
        start,
        end,
        string[144]
    ;
    #emit LOAD.S.pri 8
    #emit STOR.pri args

    if (args > 8)
    {
        #emit ADDR.pri str
        #emit STOR.pri start

        for (end = start + (args - 8); end > start; end -= 4)
        {
            #emit LREF.pri end
            #emit PUSH.pri
        }
        #emit PUSH.S str
        #emit PUSH.C 144
        #emit PUSH.C string

        #emit LOAD.S.pri 8
        #emit ADD.C 4
        #emit PUSH.pri

        #emit SYSREQ.C format
        #emit LCTRL 5
        #emit SCTRL 4

        foreach (new i : Player)
        {
            if (PlayerData[i][pTester] && PlayerData[i][pTesterDuty]) {
                SendClientMessage(i, color, string);
            }
        }
        return 1;
    }
    foreach (new i : Player)
    {
        if (PlayerData[i][pTester] && PlayerData[i][pTesterDuty]) {
            SendClientMessage(i, color, str);
        }
    }
    return 1;
}

stock SendStaffMessage(color, const str[], {Float,_}:...)
{
    static
        args,
        start,
        end,
        string[144]
    ;
    #emit LOAD.S.pri 8
    #emit STOR.pri args

    if (args > 8)
    {
        #emit ADDR.pri str
        #emit STOR.pri start

        for (end = start + (args - 8); end > start; end -= 4)
        {
            #emit LREF.pri end
            #emit PUSH.pri
        }
        #emit PUSH.S str
        #emit PUSH.C 144
        #emit PUSH.C string

        #emit LOAD.S.pri 8
        #emit ADD.C 4
        #emit PUSH.pri

        #emit SYSREQ.C format
        #emit LCTRL 5
        #emit SCTRL 4

        foreach (new i : Player)
        {
            if (PlayerData[i][pTester] && PlayerData[i][pTesterDuty] || PlayerData[i][pAdmin] && PlayerData[i][pAdminDuty]) {
                SendClientMessage(i, color, string);
            }
        }
        return 1;
    }
    foreach (new i : Player)
    {
        if (PlayerData[i][pTester] && PlayerData[i][pTesterDuty] || PlayerData[i][pAdmin] && PlayerData[i][pAdminDuty]) {
            SendClientMessage(i, color, str);
        }
    }
    return 1;
}

stock SendMessageToAllKick(color, const str[], {Float,_}:...)
{
    static
        args,
        start,
        end,
        string[144]
    ;
    #emit LOAD.S.pri 8
    #emit STOR.pri args

    if (args > 8)
    {
        #emit ADDR.pri str
        #emit STOR.pri start

        for (end = start + (args - 8); end > start; end -= 4)
        {
            #emit LREF.pri end
            #emit PUSH.pri
        }
        #emit PUSH.S str
        #emit PUSH.C 144
        #emit PUSH.C string

        #emit LOAD.S.pri 8
        #emit ADD.C 4
        #emit PUSH.pri

        #emit SYSREQ.C format
        #emit LCTRL 5
        #emit SCTRL 4

        foreach (new i : Player)
        {
            if(PlayerData[i][pKickBanStatus] == true)
            {
                SendClientMessage(i, color, string);
            }
        }
        return 1;
    }
    foreach (new i : Player)
    {
        if(PlayerData[i][pKickBanStatus] == true)
        {
            SendClientMessage(i, color, str);
        }
    }
    return 1;
}

stock SendMessageToAll(color, const str[], {Float,_}:...)
{
    static
        args,
        start,
        end,
        string[144]
    ;
    #emit LOAD.S.pri 8
    #emit STOR.pri args

    if (args > 8)
    {
        #emit ADDR.pri str
        #emit STOR.pri start

        for (end = start + (args - 8); end > start; end -= 4)
        {
            #emit LREF.pri end
            #emit PUSH.pri
        }
        #emit PUSH.S str
        #emit PUSH.C 144
        #emit PUSH.C string

        #emit LOAD.S.pri 8
        #emit ADD.C 4
        #emit PUSH.pri

        #emit SYSREQ.C format
        #emit LCTRL 5
        #emit SCTRL 4

        foreach (new i : Player)
        {
            SendClientMessage(i, color, string);
        }
        return 1;
    }
    foreach (new i : Player)
    {
        SendClientMessage(i, color, str);
    }
    return 1;
}

static stock g_arrVehicleNames[][] = {
    "Landstalker", "Bravura", "Buffalo", "Linerunner", "Perrenial", "Sentinel", "Dumper", "Firetruck", "Trashmaster",
    "Stretch", "Manana", "Infernus", "Voodoo", "Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam",
    "Esperanto", "Taxi", "Washington", "Bobcat", "Whoopee", "BF Injection", "Hunter", "Premier", "Enforcer",
    "Securicar", "Banshee", "Predator", "Bus", "Rhino", "Barracks", "Hotknife", "Trailer", "Previon", "Coach",
    "Cabbie", "Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral", "Squalo", "Seasparrow",
    "Pizzaboy", "Tram", "Trailer", "Turismo", "Speeder", "Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair",
    "Berkley's RC Van", "Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale", "Oceanic",
    "Sanchez", "Sparrow", "Patriot", "Quad", "Coastguard", "Dinghy", "Hermes", "Sabre", "Rustler", "ZR-350", "Walton",
    "Regina", "Comet", "BMX", "Burrito", "Camper", "Marquis", "Baggage", "Dozer", "Maverick", "News Chopper", "Rancher",
    "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring", "Sandking", "Blista Compact", "Police Maverick",
    "Boxville", "Benson", "Mesa", "RC Goblin", "Hotring Racer A", "Hotring Racer B", "Bloodring Banger", "Rancher",
    "Super GT", "Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropduster", "Stunt", "Tanker", "Roadtrain",
    "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra", "FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Tow Truck",
    "Fortune", "Cadrona", "SWAT Truck", "Willard", "Forklift", "Tractor", "Combine", "Feltzer", "Remington", "Slamvan",
    "Blade", "Streak", "Freight", "Vortex", "Vincent", "Bullet", "Clover", "Sadler", "Firetruck", "Hustler", "Intruder",
    "Primo", "Cargobob", "Tampa", "Sunrise", "Merit", "Utility", "Nevada", "Yosemite", "Windsor", "Monster", "Monster",
    "Uranus", "Jester", "Sultan", "Stratum", "Elegy", "Raindance", "RC Tiger", "Flash", "Tahoma", "Savanna", "Bandito",
    "Freight Flat", "Streak Carriage", "Kart", "Mower", "Dune", "Sweeper", "Broadway", "Tornado", "AT-400", "DFT-30",
    "Huntley", "Stafford", "BF-400", "News Van", "Tug", "Trailer", "Emperor", "Wayfarer", "Euros", "Hotdog", "Club",
    "Freight Box", "Trailer", "Andromada", "Dodo", "RC Cam", "Launch", "LSPD Cruiser", "SFPD Cruiser", "LVPD Cruiser",
    "Police Rancher", "Picador", "S.W.A.T", "Alpha", "Phoenix", "Glendale", "Sadler", "Luggage", "Luggage", "Stairs",
    "Boxville", "Tiller", "Utility Trailer"
};


stock IsVehicleInRangeOfPoint(vehicleid, Float:range, Float:x, Float:y, Float:z)
{
	new
		Float:vehicle_x,
		Float:vehicle_y,
		Float:vehicle_z;

	if (0 == GetVehiclePos(vehicleid, vehicle_x, vehicle_y, vehicle_z))
		return 0;

	x = floatsub(x, vehicle_x);
	y = floatsub(y, vehicle_y);
	z = floatsub(z, vehicle_z);

	return VectorSize(x, y, z) < floatpower(range, 2);
}

stock GetVehicleModelByName(const name[])
{
    if (IsNumeric(name) && (strval(name) >= 400 && strval(name) <= 611))
        return strval(name);

    for (new i = 0; i < sizeof(g_arrVehicleNames); i ++)
    {
        if (strfind(g_arrVehicleNames[i], name, true) != -1)
        {
            return i + 400;
        }
    }
    return 0;
}

stock ReturnVehicleModelName(model)
{
    new
        name[32] = "None";

    if (model < 400 || model > 611)
        return name;

    format(name, sizeof(name), g_arrVehicleNames[model - 400]);
    return name;
}

KickEx(playerid)
{
    SetTimerEx("KickTimer", 300, false, "d", playerid);
    return 1;
}

UnAuthMessage(playerid) return SendClientMessage(playerid, COLOR_ADM, "ERÝÞÝM REDDEDÝLDÝ: {FFFFFF}Bu komutu kullanmak için yetkin yok.");

ToggleVehicleLock(vehicleid, bool:lockstate)
{
    new engine, lights, alarm, doors, bonnet, boot, objective;

    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
    SetVehicleParamsEx(vehicleid, engine, lights, alarm, lockstate, bonnet, boot, objective);
    return 1;
}

ToggleVehicleAlarms(vehicleid, bool:alarmstate, time = 5000)
{
    new engine, lights, alarm, doors, bonnet, boot, objective;

    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
    SetVehicleParamsEx(vehicleid, engine, lights, alarmstate, doors, bonnet, boot, alarmstate);

    if(alarmstate) SetTimerEx("OnVehicleAlarm", time, false, "i", vehicleid);
    return 1;
}

ToggleVehicleEngine(vehicleid, bool:enginestate)
{
    new engine, lights, alarm, doors, bonnet, boot, objective;
    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
    SetVehicleParamsEx(vehicleid, enginestate, lights, alarm, doors, bonnet, boot, objective);
    return 1;
}

ToggleVehicleLights(vehicleid, bool: lightstate)
{
    new engine, lights, alarm, doors, bonnet, boot, objective;
    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
    SetVehicleParamsEx(vehicleid, engine, lightstate, alarm, doors, bonnet, boot, objective);
    return 1;
}

NoEngineCar(vehicleid)
{
    switch(GetVehicleModel(vehicleid))
    {
        case 481, 509, 510: return 1;
    }
    return 0;
}

IsHelicopter(vehicleid)
{
    switch(GetVehicleModel(vehicleid))
    {
        case 417, 425, 447, 460, 469, 476, 487, 488, 497, 511, 512, 513, 519, 520, 548, 553, 563, 577, 592, 593: return 1;
    }
    return 0;
}

ReplaceText(string[], const search[], const replacement[], bool:ignorecase = false, pos = 0, limit = -1, maxlength = 256)
{
    if(!limit)return 0;

    new sublen = strlen(search),
        replen = strlen(replacement),
        bool:packed = ispacked(string),
        maxlen = maxlength,
        len = strlen(string),
        count = 0;

    if(packed)maxlen *= 4;
    if(!sublen)return 0;

    while(-1 != (pos = strfind(string, search, ignorecase, pos)))
    {
        strdel(string, pos, pos + sublen);

        len -= sublen;

        if(replen && len + replen < maxlen)
        {
            strins(string, replacement, pos, maxlength);

            pos += replen;
            len += replen;
       }

        if(limit != -1 && ++count >= limit)break;
   }

    return count;
}

SetBrutallyWounded(playerid, killerid, weaponid, in_car)
{
    Player_SavePos(playerid, true);
    SetPlayerDrunkLevel(playerid, 0);

    PlayerData[playerid][pExecuteTime] = 1;
    PlayerData[playerid][pBrutallyWounded] = 1;

    if(oc_ws[playerid] != -1)
    {
        SendClientMessageEx(playerid, COLOR_ADM, "OÇWS: %s(%i) sikip attýn he.", ReturnName(killerid), killerid);
        SendClientMessageEx(killerid, COLOR_ADM, "OÇWS: %s(%i) oçu siktin attýn.", ReturnName(playerid), playerid);
    }

    //if(PlayerData[playerid][pHandcuffed]) ToggleHandcuffs(playerb, false);

    if(in_car == 0) {
        ClearAnimations(playerid);
        ApplyAnimation(playerid, "WUZI", "CS_Dead_Guy", 4.1, 0, 1, 1, 1, 0, 1);
    }
    else
    {
        if(IsABike(GetPlayerVehicleID(playerid)) || IsAMotorBike(GetPlayerVehicleID(playerid)))
        {
            ClearAnimations(playerid);
            ApplyAnimation(playerid, "WUZI", "CS_Dead_Guy", 4.1, 0, 1, 1, 1, 0, 1);
        }
        else ApplyAnimation(playerid, "PED", "CAR_dead_LHS", 4.1, 0, 1, 1, 1, 0, 1);
    }

    TogglePlayerControllable(playerid, false);
    GameTextForPlayer(playerid, "~b~YARALANDIN", 5000, 3);
    PlayerData[playerid][pInjurTime] = 60;
    SetPlayerHealth(playerid, 9999);
    SendClientMessage(playerid, COLOR_ADM, "BÝLGÝ: Yaralý durumuna düþtün.");
    SendClientMessage(playerid, COLOR_ADM, "BÝLGÝ: 60 saniye sonra /tedaviol yazarak ayaða kalkabilirsiniz.");
    SendClientMessageEx(playerid, COLOR_ADM, "(( %i defa vuruldun. /hasarlar %i yazarak yaralarýný görebilirsin. ))", TotalDamages[playerid], playerid);

    if (EditingObject[playerid] != 0)
    {
        EditingObject[playerid] = 0;
        EditingID[playerid] = 0;
        CancelEdit(playerid);
    }

    if(PlayerData[playerid][pCargoID])
    {
        RemovePlayerAttachedObject(playerid, SLOT_MISC);
        PlayerData[playerid][pCargoID] = 0;
    }

    if (Chopshopping[playerid] != 0)
    {
        KillTimer(ChopshopTimer[playerid]);
        Chopshopping[playerid] = 0;
    }

    if(Pkr_IsPlayerOnAnyGame(playerid)) {
        new gameId = Pkr_GetPlayerGame(playerid);
        Pkr_UnassignPlayerFromGame(playerid, gameId);
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

    if(killerid != -1 && weaponid != -1)
    {
        LogPlayerAction(killerid, sprintf("%s isimli oyuncuyu %s silahýyla öldürdü.", ReturnName(playerid), ReturnWeaponName(weaponid)));
        LogPlayerAction(playerid, sprintf("%s tarafýndan %s silahýyla öldürüldü.", ReturnName(killerid), ReturnWeaponName(weaponid)));

        foreach(new i : Player) if(PlayerData[i][pDeathStatus])
        {
            SendClientMessageEx(i, COLOR_RED, "SERVER: %s isimli oyuncu %s tarafýndan %s ile öldürüldü.", ReturnName(playerid, 1), ReturnName(killerid, 1), ReturnWeaponName(weaponid));
        }
    }

    //WriteLog("player_logs/death_log.txt", "[%s] %s brutally wounded %s with a %s", ReturnDate(), ReturnName(killerid, 1), ReturnName(playerid, 1), ReturnWeaponName(weaponid));
    return 1;
}

stock SetDead(playerid)
{
    PlayerData[playerid][pInjurTime] = 60;

    PlayerData[playerid][pBrutallyWounded] = 2;
    SendClientMessage(playerid, COLOR_YELLOW, "-> Karakterin aðýr yaralý durumuna geçti. 60 saniye bekledikten sonra /tedaviol komutunu kullanabilirsin.");

    PlayerData[playerid][pLegShot] = 0;
    PlayerData[playerid][pLowSkill] = 0;
    TogglePlayerControllable(playerid, false);

    if(!IsPlayerInAnyVehicle(playerid)) ApplyAnimation(playerid, "WUZI", "CS_Dead_Guy", 4.1, 0, 1, 1, 1, 0, 1);
    else ApplyAnimation(playerid, "PED", "CAR_dead_LHS", 4.1, 0, 1, 1, 1, 0, 1);
    return 1;
}

stock GetVehicleInterior(vehicleid)
{
    if(!IsValidCar(vehicleid)) return 0;

    return CarData[vehicleid][carInterior];
}

GetChannelSlot(playerid, channel)
{
    new slot = 0;
    for(new i = 1; i <= 5; i++) if(PlayerData[playerid][pRadio][i] == channel) slot = i;
    return slot;
}

ToggleHandcuffs(playerid, bool:cuffstate)
{
    if(cuffstate)
    {
        PlayerData[playerid][pHandcuffed] = true;
        ApplyAnimation(playerid, "CARRY", "crry_prtial", 4, 0, 0, 0, 0, 0, 1);
        SetPlayerAttachedObject(playerid, 9, 19418, 6, -0.031999, 0.024000, -0.024000, -7.900000, -32.000011, -72.299987, 1.115998, 1.322000, 1.406000);
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CUFFED);
    }
    else
    {
        PlayerData[playerid][pHandcuffed] = false;
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
        RemovePlayerAttachedObject(playerid, 9);
    }
    return true;
}

Drug_ReturnData(receiver, searching)
{
    ClearLines(receiver, 3);
    SendClientMessageEx(receiver, COLOR_ADM, "%s Uyuþturucu Testi:", ReturnName(searching, 0));
    if(PlayerData[searching][pDrugUse] != -1) SendClientMessageEx(receiver, COLOR_ADM, "[ {FFFFFF}%s (pozitif) {FF6347}]", Drug_GetName(PlayerData[searching][pDrugUse]));
    else SendClientMessage(receiver, COLOR_WHITE, "Uyuþturucu testi negatif gözüküyor.");
    return 1;
}

Frisk_ReturnData(receiver, searching)
{
    ClearLines(receiver, 3);
    SendClientMessageEx(receiver, COLOR_ADM, "%s Genel Eþyalarý:", ReturnName(searching, 0));
    if(PlayerData[searching][pMoney] > 500) SendClientMessage(receiver, COLOR_ADM, "[ {FFFFFF}$500+ {FF6347}]");
    else SendClientMessageEx(receiver, COLOR_ADM, "[ {FFFFFF}$%s+ {FF6347}]", MoneyFormat(PlayerData[searching][pMoney]));
    if(PlayerData[searching][pPhone]) SendClientMessage(receiver, COLOR_ADM, "[ {FFFFFF}Telefon {FF6347}]");
    if(PlayerData[searching][pCigarettes]) SendClientMessageEx(receiver, COLOR_ADM, "[ {FFFFFF}Sigara (%i) {FF6347}]", PlayerData[searching][pCigarettes]);
    if(PlayerData[searching][pDrinks]) SendClientMessageEx(receiver, COLOR_ADM, "[ {FFFFFF}Ýçecek (%i) {FF6347}]", PlayerData[searching][pDrinks]);

    ClearLines(receiver, 1);
    SendClientMessageEx(receiver, COLOR_ADM, "%s Uyuþturucularý:", ReturnName(searching, 0));
    Player_ListDrugs(searching, receiver);

    ClearLines(receiver, 1);
    SendClientMessageEx(receiver, COLOR_ADM, "%s Silah Paketleri:", ReturnName(searching, 0));
    Player_ListPackages(searching, receiver);

    ClearLines(receiver, 1);
    SendClientMessageEx(receiver, COLOR_ADM, "%s Silahlarý:", ReturnName(searching, 0));

    new count;
    for(new i = 0; i < 4; i++) if(PlayerData[searching][pWeaponsAmmo][i] > 0)
    {
        SendClientMessageEx(receiver, COLOR_ADM, "[ {FFFFFF}%s(%i) %i mermi {FF6347}]", ReturnWeaponName(PlayerData[searching][pWeapons][i]), PlayerData[searching][pWeapons][i], PlayerData[searching][pWeaponsAmmo][i]);
        count++;
    }

    if(!count) SendClientMessage(receiver, COLOR_WHITE, "Gösterilebilecek silah yok.");
    return 1;
}

stock IsValidNumber(number)
{
    foreach (new i : Player) if (PlayerData[i][pPhone] == number) {
        return i;
    }

    foreach(new i : Player) if (PlayerData[i][pHasBurner] && PlayerData[i][pBurnerPhone] == number)
    {
        return i;
    }
    return INVALID_PLAYER_ID;
}

ReturnPhoneNumber(playerid)
{
    if(MainPhone[playerid] == 1) return PlayerData[playerid][pBurnerPhone];
    return PlayerData[playerid][pPhone];
}

ReturnBadgeNumber(playerid)
{
    return PlayerData[playerid][pBadge];
}

PlayNearbySound(playerid, sound)
{
    static Float:x, Float:y, Float:z; GetPlayerPos(playerid, x, y, z);
    foreach (new i : Player) if (IsPlayerInRangeOfPoint(i, 20.0, x, y, z)) PlayerPlaySound(i, sound, x, y, z);
    return 1;
}

stock ConfirmDialog(playerid, caption[], info[], callback[], ...)
{
    new n = numargs(),      // number of arguments, static + optional
        szParamHash[64];    // variable where the passed arguments will be stored
    for(new arg = 4; arg < n; arg++){   // loop all additional arguments
        format(szParamHash, sizeof(szParamHash), "%s%d|", szParamHash, getarg(arg)); // store them in szParamHash
    }
    SetPVarInt(playerid, "confDialogArgs", n -4);           // store the amount of additional arguments
    SetPVarString(playerid, "confDialCallback", callback);  // store the callback that needs to be called after response
    SetPVarString(playerid, "confDialog_arg", szParamHash); // store the additional arguments
    Dialog_Show(playerid, CONFIRM_SYS, DIALOG_STYLE_MSGBOX, caption, info, "Evet", "Hayýr");
    return;
}

stock ConfirmDialog_Response(playerid, response){
    new szCallback[33],     // variable to fetch our callback to
        szParamHash[64],    // variable to check raw compressed argument string
        n,                  // variable to fetch the amount of additional arguments
        szForm[12];         // variable to generate the CallLocalFunction() "format" argument

    n = GetPVarInt(playerid, "confDialogArgs"); // Fetch the amount of additional arguments
    GetPVarString(playerid, "confDialCallback", szCallback, sizeof(szCallback));    // fetch the callback
    GetPVarString(playerid, "confDialog_arg", szParamHash, sizeof(szParamHash));    // fetch the raw compressed additional arguments

    new hashDecoded[12];    // variable to store extracted additional arguments from the ConfirmDialog() generated string

    sscanf(szParamHash, "p<|>A<d>(0)[12]", hashDecoded);    // extraction of the additional arguments

    new args,   // amount of cells passed to CallLocalFunction
        addr,   // pointer address variable for later use
        i;      // i

    format(szForm, sizeof(szForm), "dd");   // static parameters for the callback, "playerid" and "response"

    #emit ADDR.pri hashDecoded  // get pointer address of the extracted additional arguments
    #emit STOR.S.pri addr       // store the pointer address in variable 'addr'
    if(n){  // if there's any additional arguments
        for(i = addr + ((n-1) * 4); i >= addr; i-=4){ // loops all additional arguments by their addresses
            format(szForm, sizeof(szForm), "%sd", szForm); // adds an aditional specifier to the "format" parameter of CallLocalFunction
            #emit load.s.pri i  // load the argument at the current address
            #emit push.pri      // push it to the CallLocalFunction argument list
            args+=4;            // increase used cell number by 4
        }
    }


    args+=16;   // preserve 4 more arguments for CallLocalFunction (16 cause 4 args by 4 cells (4*4))

    #emit ADDR.pri response             // fetch "response" pointer address to the primary buffer
    #emit push.pri                      // push it to the argument list

    #emit ADDR.pri playerid             // fetch "playerid" pointer address to the primary buffer
    #emit push.pri                      // push it to the argument list

    #emit push.adr szForm               // push the szForm ("format") to the argument list by its referenced address
    #emit push.adr szCallback           // push the szCallback (custom callback) to the argument list by its referenced address
    #emit push.s args                   // push the amount of arguments
    #emit sysreq.c CallLocalFunction    // call the function

    // Clear used data
    #emit LCTRL 4
    #emit LOAD.S.ALT args
    #emit ADD.C 4
    #emit ADD
    #emit SCTRL 4

    // Clear used PVars
    DeletePVar(playerid, "confDialCallback");
    DeletePVar(playerid, "confDialog_arg");
    DeletePVar(playerid, "confDialogArgs");

    return;
}

stock AnimationCheck(playerid)
{
    return (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && PlayerData[playerid][pCarryMeal] == -1 && !PlayerData[playerid][pBrutallyWounded] && !PlayerIsTased[playerid]);
}

stock IsTaxi(vehicleid)
{
    if(GetVehicleModel(vehicleid) == 420 || GetVehicleModel(vehicleid) == 438)
        return 1;

    return 0;
}

IsVehicleOccupied(vehicleid)
{
    foreach(new i : Player)
    {
        if(IsPlayerInVehicle(i, vehicleid)) return 1;
    }
    return 0;
}

stock FreePlayerCarID(playerid)
{
    for(new i = 1; i < MAX_OWNED_CARS; i++)
    {
        if(!PlayerData[playerid][pOwnedCar][i])
            return i;
    }
    return -1;
}


stock ReturnSQLFactionName(id)
{
    new player_name[30], query[100];
    mysql_format(m_Handle, query, sizeof(query), "SELECT Name FROM factions WHERE id = %i LIMIT 1", id);
    new Cache: cache = mysql_query(m_Handle, query);
    if(!cache_num_rows()) player_name = "Yok";
    else cache_get_value_name(0, "Name", player_name);
    cache_delete(cache);
    return player_name;
}

stock ReturnSQLName(id)
{
    new player_name[30], query[100];
    mysql_format(m_Handle, query, sizeof(query), "SELECT Name FROM players WHERE id = %i LIMIT 1", id);
    new Cache: cache = mysql_query(m_Handle, query);
    if(!cache_num_rows()) player_name = "Yok";
    else cache_get_value_name(0, "Name", player_name);
    cache_delete(cache);
    return player_name;
}

stock ReturnSQLFromName(user[])
{
    new query[65], dbid = 0;
    mysql_format(m_Handle, query, sizeof(query), "SELECT id FROM players WHERE Name = '%e'", user);
    new Cache:cache = mysql_query(m_Handle, query);
    if(cache_num_rows()) cache_get_value_name_int(0, "id", dbid);
    cache_delete(cache);
    return dbid;
}


stock DoesIPExist(ip[])
{
    new
        query[90];

    mysql_format(m_Handle, query, sizeof(query), "SELECT id FROM players WHERE LastIP = '%e' OR RegisterIP = '%e'", ip, ip);
    new Cache:cache = mysql_query(m_Handle, query);
    if(!cache_num_rows())
    {
        cache_delete(cache);
        return 0;
    }
    cache_delete(cache);
    return 1;
}

stock ShowDealerAppend(playerid)
{
    new
        str[255];

    strcat(str, "Alarm\n");
    strcat(str, "Kilit\n");
    strcat(str, "Immobiliser\n");
    strcat(str, "Sigorta\n");
    strcat(str, "Renkler\n");
    strcat(str, g_aXMR[playerid] ? "{FFFF00}XM Var\n" : "XM Yok\n");
    strcat(str, "{FFFF00}Satýnal\n");

    ShowPlayerDialog(playerid, DIALOG_DEALERSHIP_APPEND, DIALOG_STYLE_LIST, sprintf("%s - {33AA33}%s", DealershipData[SubDealershipHolder[playerid]][DealershipModelName], MoneyFormat(g_aTotalAmount[playerid] + GetPVarInt(playerid, "InsPrice") + GetPVarInt(playerid, "LockPrice") + GetPVarInt(playerid, "ImmobPrice") + GetPVarInt(playerid, "AlarmPrice"))), str, "Ekle", "<<");
    return 1;
}

stock ResetDealershipVars(playerid)
{
    DeletePVar(playerid, "LockPrice");
    DeletePVar(playerid, "AlarmPrice");
    DeletePVar(playerid, "InsPrice");
    DeletePVar(playerid, "ImmobPrice");

    g_aXMR[playerid] = false;
    g_aLockLevel[playerid] = 0;
    g_aAlarmLevel[playerid] = 0;
    g_aImmobLevel[playerid] = 0;
    g_aInsurance[playerid] = 0;
    g_aVehicleSpawned[playerid] = INVALID_VEHICLE_ID;
    g_aTotalAmount[playerid] = 0;

    for(new i = 0; i < 2 ;i++) { g_aVehicleColor[playerid][i] = 0; }
    return 1;
}

stock CountAdminNotes(playerid)
{
    new count = 0;

    for(new i = 1; i < MAX_ADMIN_NOTES; i++)
    {
        if(aNotesData[playerid][i][anote_SQLID] != 0)
        {
            count++;
        }
    }
    return count;
}

stock ReturnANoteSlot(playerid)
{
    for(new i = 1; i < MAX_ADMIN_NOTES; i++)
    {
        if(!aNotesData[playerid][i][anote_SQLID])
            return i;
    }
    return -1;
}

stock AddAdminNote(playerid, addingid, reason[])
{
    if(addingid != INVALID_PLAYER_ID)
    {
        new query[400], id;

        for(new i = 1; i < MAX_ADMIN_NOTES; i++)
        {
            if(!aNotesData[addingid][i][anote_SQLID])
            {
                id = i;
                break;
            }
        }

        for(new i = 1; i < MAX_ADMIN_NOTES; i++)
        {
            if(aNotesData[addingid][i][anote_SQLID] != 0)
            {
                aNotesData[addingid][i][anote_active] = false;
            }
        }

        anote_idsave[addingid] = id;

        format(aNotesData[addingid][id][anote_reason], 128, "%s", reason);
        format(aNotesData[addding][id][anote_date], 60, "%s", Time());
        format(aNotesData[addingid][id][anote_issuer], 60, "%s", ReturnName(playerid, 1));
        aNotesData[addingid][id][anote_playerDBID] = PlayerData[addingid][pSQLID];
        aNotesData[addingid][id][anote_active] = true;

        mysql_format(m_Handle, query, sizeof(query), "UPDATE player_anotes SET anote_active = 0 WHERE player_dbid = %i", PlayerData[addingid][pSQLID]);
        mysql_tquery(m_Handle, query);

        mysql_format(m_Handle, query, sizeof(query), "INSERT INTO player_anotes (`player_dbid`, `anote_reason`, `anote_issuer`, `anote_date`, `anote_active`) VALUES(%i, '%e', '%e', %i, 1)", PlayerData[addingid][pSQLID], reason, ReturnName(playerid, 1), Time());
        mysql_pquery(m_Handle, query, "SQL_AddPlayerAdminNote", "i", addingid);

        mysql_format(m_Handle, query, sizeof(query), "INSERT INTO log_anotes (Name, Reason, Date, IP, AddedBy) VALUES('%e', '%e', %i, '%e', '%e')", ReturnName(addingid, 1), reason, Time(), ReturnIP(addingid), ReturnName(playerid, 1));
        mysql_pquery(m_Handle, query);
    }
    return true;
}

stock PlayAnimation(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync = 0)
{
    ApplyAnimation(playerid, animlib, animname, fDelta, loop, lockx, locky, freeze, time, forcesync);
    PlayerData[playerid][pPlayingAnimation] = true;

    if (time != 0) {
        SetTimerEx("StopAnimation", time, false, "i", playerid);
    }
    return 1;
}

stock ReturnDonatorType(type)
{
    new string[6];
    switch (type)
    {
        case 0: string = "Yok";
        case 1: string = "Bronz";
        case 2: string = "Silver";
        case 3: string = "Gold";
    }
    return string;
}

ReturnGPCI(playerid)
{
    new szSerial[41]; // 40 + \0
    gpci(playerid, szSerial, sizeof(szSerial));
    return szSerial;
}

stock CountPlayerCars(playerid)
{
    new count = 0;
    for (new i = 1; i < MAX_OWNED_CARS; i++) if(PlayerData[playerid][pOwnedCar][i]) count++;
    return count;
}

ShowXMRDialog(playerid)
{
    new
        string[500];

    for(new i = 1; i < MAX_XMR_CATEGORIES; i++)
    {
        if (XMRCategoryData[i][XMRCategory])
        {
            format(string, sizeof(string), "%s%s\n", string, XMRCategoryData[i][XMRCategoryName]);
        }
    }

    format(string, sizeof(string), "{FFFF00}URL Yöntemiyle Aç\n");
    ShowPlayerDialog(playerid, DIALOG_XMR, DIALOG_STYLE_LIST, "Türler", string, "Seç", "Ýptal");
    return 1;
}

ReturnNameLetter(playerid)
{
    new player_name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, player_name, sizeof(player_name));
    format(player_name, sizeof(player_name), "%c. %s", player_name[0], player_name[strfind(player_name, "_") + 1]);
    return player_name;
}

stock GetNearestVehicle(playerid)
{
    new
        Float:fX,
        Float:fY,
        Float:fZ,
        Float:fSX,
        Float:fSY,
        Float:fSZ,
        Float:fRadius;

    for (new i = 1, j = GetVehiclePoolSize(); i <= j; i ++)
    {
        if (!IsVehicleStreamedIn(i, playerid))
        {
            continue;
        }
        else
        {
            GetVehiclePos(i, fX, fY, fZ);

            GetVehicleModelInfo(GetVehicleModel(i), VEHICLE_MODEL_INFO_SIZE, fSX, fSY, fSZ);

            fRadius = floatsqroot((fSX + fSX) + (fSY + fSY));

            if (IsPlayerInRangeOfPoint(playerid, fRadius, fX, fY, fZ) && GetPlayerVirtualWorld(playerid) == GetVehicleVirtualWorld(i))
            {
                return i;
            }
        }
    }
    return INVALID_VEHICLE_ID;
}

stock GetVehicleBoot(vehicleid, &Float:x, &Float:y, &Float:z)
{
    if (!GetVehicleModel(vehicleid) || vehicleid == INVALID_VEHICLE_ID)
        return (x = 0.0, y = 0.0, z = 0.0), 0;

    static
        Float:pos[7]
    ;
    GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_SIZE, pos[0], pos[1], pos[2]);
    GetVehiclePos(vehicleid, pos[3], pos[4], pos[5]);
    GetVehicleZAngle(vehicleid, pos[6]);

    x = pos[3] - (floatsqroot(pos[1] + pos[1]) * floatsin(-pos[6], degrees));
    y = pos[4] - (floatsqroot(pos[1] + pos[1]) * floatcos(-pos[6], degrees));
    z = pos[5];

    return 1;
}

stock GetVehicleHood(vehicleid, &Float:x, &Float:y, &Float:z)
{
    if (!GetVehicleModel(vehicleid) || vehicleid == INVALID_VEHICLE_ID)
        return (x = 0.0, y = 0.0, z = 0.0), 0;

    static
        Float:pos[7]
    ;
    GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_SIZE, pos[0], pos[1], pos[2]);
    GetVehiclePos(vehicleid, pos[3], pos[4], pos[5]);
    GetVehicleZAngle(vehicleid, pos[6]);

    x = pos[3] + (floatsqroot(pos[1] + pos[1]) * floatsin(-pos[6], degrees));
    y = pos[4] + (floatsqroot(pos[1] + pos[1]) * floatcos(-pos[6], degrees));
    z = pos[5];

    return 1;
}

Send911Message(playerid, type)
{
    switch(type)
    {
        case 1:
        {
            SendLawMessage(COLOR_NINER, "|____________Aciliyet Çaðrýsý____________|");
            SendLawMessage(COLOR_NINER, sprintf("Arayan: %s, Telefon: %d, Bölge: %s", ReturnName(playerid, 0), ReturnPhoneNumber(playerid), Player_GetLocation(playerid)));
            SendLawMessage(COLOR_NINER, "Gereken Hizmet: Polis");
            SendLawMessage(COLOR_NINER, sprintf("Durum: %s", PlayerData[playerid][p911Text]));
            SendLawMessage(COLOR_NINER, sprintf("Lokasyon: %s", PlayerData[playerid][p911Location]));
        }
        case 2:
        {
            SendFDMessage(COLOR_EMT, "|____________Aciliyet Çaðrýsý____________|");
            SendFDMessage(COLOR_EMT, sprintf("Arayan: %s, Telefon: %d, Bölge: %s", ReturnName(playerid, 0), ReturnPhoneNumber(playerid), Player_GetLocation(playerid)));
            SendFDMessage(COLOR_EMT, "Gereken Hizmet: EMT");
            SendFDMessage(COLOR_EMT, sprintf("Durum: %s", PlayerData[playerid][p911Text]));
            SendFDMessage(COLOR_EMT, sprintf("Lokasyon: %s", PlayerData[playerid][p911Location]));
        }
    }

    PlayerData[playerid][p911Steps] = 0;
    cmd_tkapat(playerid, "");
    return 1;
}

ShowPlayerMDC(playerid)
{
    new
        mdc_str[128];

    PlayNearbySound(playerid, MDC_OPEN);

    strcat(mdc_str, "Ýsim Sorgulama\n"); //case 0;
    strcat(mdc_str, " \n");
    strcat(mdc_str, "Plaka Sorgulama\n"); //case 2;
    strcat(mdc_str, "Kýsmi Plaka Sorgulama\n"); //case 3;
    strcat(mdc_str, " \n");
    strcat(mdc_str, "Mahkumlar\n"); //case 5;
    strcat(mdc_str, "Çalýntý Araçlar\n"); //case 6;
    strcat(mdc_str, " \n");
    strcat(mdc_str, "Telefon Sorgulama\n"); //case 8;
    strcat(mdc_str, "Sahadaki Memurlar\n"); //case 9;

    ShowPlayerDialog(playerid, DIALOG_MDC, DIALOG_STYLE_LIST, "Mobil Veritabaný Bilgisayarý", mdc_str, "Seç", "Çýk");
    return 1;
}

stock ShowUnscrambleTextdraw(playerid, bool:showTextdraw = true)
{
    if(showTextdraw)
    {
        for(new i = 0; i < 3; i++)
        {
            PlayerTextDrawShow(playerid, Unscrambler_PTD[playerid][i]);
        }
    }
    else
    {
        for(new i = 0; i < 3; i++)
        {
            PlayerTextDrawHide(playerid, Unscrambler_PTD[playerid][i]);
        }
    }
    return 1;
}

stock NotifyVehicleOwner(vehicleid)
{
    new playerid = INVALID_PLAYER_ID;

    foreach(new i : Player)
    {
        if(PlayerData[i][pSQLID] == CarData[vehicleid][carOwnerID])
        {
            playerid = i;
        }
    }


    if(playerid != INVALID_PLAYER_ID)
    {
        SendClientMessage(playerid, COLOR_YELLOW, "SMS: Arabanýzýn alarmý çalýþtý, Gönderen: Araba Alarmý (Bilinmiyor)");
    }
    else return 1;
    return 1;
}


stock ReturnDonatorLevel(playerid)
{
    new
        levelStr[30];

    if(!PlayerData[playerid][pDonator])
        levelStr = "Yok";

    else format(levelStr, 30, "Level %d", PlayerData[playerid][pDonator]);
    return levelStr;
}

stock ReturnPlayerState(playerid)
{
    new
        statestr[90];

    switch(GetPlayerState(playerid))
    {
        case 0: statestr = "Empty (Initializing)";
        case 1: statestr = "Yürüyor";
        case 2: statestr = "Þoför";
        case 3: statestr = "Yolcu Koltuðu";
        case 7: statestr = "Yaralý/Ölü";
        case 8: statestr = "Spawnlanmýþ";
        case 9: statestr = "Ýzleme Modu";
        default: statestr = "///";
    }

    return statestr;
}

stock ReturnAliveState(playerid)
{
    new
        statestr[90];

    switch(GetPlayerTeam(playerid))
    {
        case STATE_ALIVE: statestr = "Yaþýyor";
        case STATE_WOUNDED:statestr = "Yaralanmýþ";
        case STATE_DEAD: statestr = "Ölmüþ";
    }
    return statestr;
}

ClearLines(playerid, lines)
{
    if(lines > 20)
        lines = 20;

    for(new i = 0; i < lines; i++)
        SendClientMessage(playerid, -1, " ");

    return 1;
}


//
stock GetVehicleMass(vehicleid, &Float:mass)
{
    new
        model = GetVehicleModel(vehicleid);

    mass = GetVehicleModelInfoAsFloat(model, "fMass");
    return 1;
}

GetVehicleSpeed(vehicleid)
{
    new Float: vel_x,
        Float: vel_y,
        Float: vel_z;

    GetVehicleVelocity(vehicleid, vel_x, vel_y, vel_z);
    return floatround(VectorSize(vel_x, vel_y, vel_z) * 179.28625);
}

stock GetFuelTypeAsString(type)
{
    new typestring[60];

    switch(type)
    {
        case FUEL_TYPE_PETROL: typestring = "Benzin";
        case FUEL_TYPE_DIESEL: typestring = "Dizel";
        case FUEL_TYPE_ELECTRIC: typestring = "Elektrik";
        default: typestring = "Yok";
    }
    return typestring;
}

stock GetVehicleTypeString(vehicleid)
{
    new typestring[8];
    if(IsValidPlayerCar(vehicleid)) typestring = "Özel";
    else if(IsValidRentalCar(vehicleid)) typestring = "Kiralýk";
    else if(IsValidFactionCar(vehicleid)) typestring = "Birlik";
    else typestring = "Statik";
    return typestring;
}

ShowContactMembers(playerid, page = 1)
{
    new lookupQuery[200];
    mysql_format(m_Handle, lookupQuery, sizeof lookupQuery, "SELECT contact_name, contact_num FROM player_contacts WHERE playersqlid = %i ORDER BY id ASC LIMIT %d, 3", PlayerData[playerid][pSQLID], page);
    mysql_tquery(m_Handle, lookupQuery, "OnContactLookup", "i", playerid);
    return 1;
}

Server:OnContactLookup(playerid)
{
    if(!cache_num_rows())
        return 1;

    new primary_str[256], contact_name[128];
    for(new i = 0, j = cache_num_rows(); i < j; i++)
    {
        cache_get_value_name(i, "contact_name", contact_name, 128);
        cache_get_value_name_int(i, "contact_num", PlayerData[playerid][pContacts][i]);
        format(primary_str, sizeof(primary_str), "%s%s~n~", primary_str, contact_name);
    }

    PlayerTextDrawSetString(playerid, PhoneListName[playerid], primary_str);
    return 1;
}

//
stock IsUserBanned(user[])
{
    new query[65], result = 0;
    mysql_format(m_Handle, query, sizeof(query), "SELECT id FROM bans WHERE ban_name = '%e'", user);
    new Cache:cache = mysql_query(m_Handle, query);
    if(cache_num_rows()) result = 1;
    cache_delete(cache);
    return result;
}

stock GetVehicleRelativePos(vehicleid, &Float:x, &Float:y, &Float:z, Float:xoff=0.0, Float:yoff=0.0, Float:zoff=0.0)
{
    new Float:rot;
    GetVehicleZAngle(vehicleid, rot);
    rot = 360 - rot;    // Making the vehicle rotation compatible with pawns sin/cos
    GetVehiclePos(vehicleid, x, y, z);
    x = floatsin(rot,degrees) * yoff + floatcos(rot,degrees) * xoff + x;
    y = floatcos(rot,degrees) * yoff - floatsin(rot,degrees) * xoff + y;
    z = zoff + z;

    /*
       where xoff/yoff/zoff are the offsets relative to the vehicle
       x/y/z then are the coordinates of the point with the given offset to the vehicle
       xoff = 1.0 would e.g. point to the right side of the vehicle, -1.0 to the left, etc.
    */
}

stock encode_doors(bonnet, boot, driver_door, passenger_door, behind_driver_door, behind_passenger_door)
{
    #pragma unused behind_driver_door
    #pragma unused behind_passenger_door
    return bonnet | (boot << 8) | (driver_door << 16) | (passenger_door << 24);
}

stock GetFightstyleName(style_id)
{
    new
        name[32];

    switch(style_id)
    {
        case 0: name = "Default";
        case 4: name = "Normal";
        case 5: name = "Boxing";
        case 6: name = "Kungfu";
        case 7: name = "Kneehead";
        case 15: name = "Grabkick";
        case 16: name = "Elbow";
    }
    return name;
}


stock UI_Phone(playerid)
{
    PhoneFrame[playerid][0] = CreatePlayerTextDraw(playerid, 476.003417, 346.916748, "box");
    PlayerTextDrawLetterSize(playerid, PhoneFrame[playerid][0], 0.000000, 13.935577);
    PlayerTextDrawTextSize(playerid, PhoneFrame[playerid][0], 558.000000, 0.000000);
    PlayerTextDrawAlignment(playerid, PhoneFrame[playerid][0], 1);
    PlayerTextDrawColor(playerid, PhoneFrame[playerid][0], 255);
    PlayerTextDrawUseBox(playerid, PhoneFrame[playerid][0], 1);
    PlayerTextDrawBoxColor(playerid, PhoneFrame[playerid][0], 255);
    PlayerTextDrawSetShadow(playerid, PhoneFrame[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, PhoneFrame[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneFrame[playerid][0], 255);
    PlayerTextDrawFont(playerid, PhoneFrame[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, PhoneFrame[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, PhoneFrame[playerid][0], 0);

    PhoneFrame[playerid][1] = CreatePlayerTextDraw(playerid, 471.149597, 337.583282, "LD_DRV:TVCORN");
    PlayerTextDrawLetterSize(playerid, PhoneFrame[playerid][1], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, PhoneFrame[playerid][1], 45.000000, 111.000000);
    PlayerTextDrawAlignment(playerid, PhoneFrame[playerid][1], 1);
    PlayerTextDrawColor(playerid, PhoneFrame[playerid][1], -1);
    PlayerTextDrawSetShadow(playerid, PhoneFrame[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, PhoneFrame[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneFrame[playerid][1], 255);
    PlayerTextDrawFont(playerid, PhoneFrame[playerid][1], 4);
    PlayerTextDrawSetProportional(playerid, PhoneFrame[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, PhoneFrame[playerid][1], 0);

    PhoneFrame[playerid][2] = CreatePlayerTextDraw(playerid, 562.979858, 337.583221, "LD_DRV:TVCORN");
    PlayerTextDrawLetterSize(playerid, PhoneFrame[playerid][2], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, PhoneFrame[playerid][2], -47.000000, 112.000000);
    PlayerTextDrawAlignment(playerid, PhoneFrame[playerid][2], 1);
    PlayerTextDrawColor(playerid, PhoneFrame[playerid][2], -1);
    PlayerTextDrawSetShadow(playerid, PhoneFrame[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, PhoneFrame[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneFrame[playerid][2], 255);
    PlayerTextDrawFont(playerid, PhoneFrame[playerid][2], 4);
    PlayerTextDrawSetProportional(playerid, PhoneFrame[playerid][2], 0);
    PlayerTextDrawSetShadow(playerid, PhoneFrame[playerid][2], 0);

    PhoneLogo[playerid] = CreatePlayerTextDraw(playerid, 495.212463, 352.166748, "LS_Telefonica");
    PlayerTextDrawLetterSize(playerid, PhoneLogo[playerid], 0.206500, 0.940833);
    PlayerTextDrawAlignment(playerid, PhoneLogo[playerid], 1);
    PlayerTextDrawColor(playerid, PhoneLogo[playerid], -1);
    PlayerTextDrawSetShadow(playerid, PhoneLogo[playerid], 0);
    PlayerTextDrawSetOutline(playerid, PhoneLogo[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneLogo[playerid], 255);
    PlayerTextDrawFont(playerid, PhoneLogo[playerid], 1);
    PlayerTextDrawSetProportional(playerid, PhoneLogo[playerid], 1);
    PlayerTextDrawSetShadow(playerid, PhoneLogo[playerid], 0);

    PhoneSwitch[playerid] = CreatePlayerTextDraw(playerid, 546.581420, 347.499877, "LD_BEAT:circle");
    PlayerTextDrawLetterSize(playerid, PhoneSwitch[playerid], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, PhoneSwitch[playerid], 12.000000, 13.000000);
    PlayerTextDrawAlignment(playerid, PhoneSwitch[playerid], 1);
    PlayerTextDrawColor(playerid, PhoneSwitch[playerid], -1);
    PlayerTextDrawSetShadow(playerid, PhoneSwitch[playerid], 0);
    PlayerTextDrawSetOutline(playerid, PhoneSwitch[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneSwitch[playerid], 255);
    PlayerTextDrawFont(playerid, PhoneSwitch[playerid], 4);
    PlayerTextDrawSetProportional(playerid, PhoneSwitch[playerid], 0);
    PlayerTextDrawSetShadow(playerid, PhoneSwitch[playerid], 0);
    PlayerTextDrawSetSelectable(playerid, PhoneSwitch[playerid], true);

    PhoneInfo[playerid] = CreatePlayerTextDraw(playerid, 547.518432, 349.249816, "LD_BEAT:chit");
    PlayerTextDrawLetterSize(playerid, PhoneInfo[playerid], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, PhoneInfo[playerid], -6.000000, 6.000000);
    PlayerTextDrawAlignment(playerid, PhoneInfo[playerid], 1);
    PlayerTextDrawColor(playerid, PhoneInfo[playerid], -1);
    PlayerTextDrawSetShadow(playerid, PhoneInfo[playerid], 0);
    PlayerTextDrawSetOutline(playerid, PhoneInfo[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneInfo[playerid], 255);
    PlayerTextDrawFont(playerid, PhoneInfo[playerid], 4);
    PlayerTextDrawSetProportional(playerid, PhoneInfo[playerid], 0);
    PlayerTextDrawSetShadow(playerid, PhoneInfo[playerid], 0);

    PhoneDisplay[playerid] = CreatePlayerTextDraw(playerid, 483.031005, 367.916717, "box");
    PlayerTextDrawLetterSize(playerid, PhoneDisplay[playerid], 0.000000, 4.565154);
    PlayerTextDrawTextSize(playerid, PhoneDisplay[playerid], 551.000000, 0.000000);
    PlayerTextDrawAlignment(playerid, PhoneDisplay[playerid], 1);
    PlayerTextDrawColor(playerid, PhoneDisplay[playerid], -1);
    PlayerTextDrawUseBox(playerid, PhoneDisplay[playerid], 1);
    PlayerTextDrawBoxColor(playerid, PhoneDisplay[playerid], -572662273);
    PlayerTextDrawSetShadow(playerid, PhoneDisplay[playerid], 0);
    PlayerTextDrawSetOutline(playerid, PhoneDisplay[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneDisplay[playerid], 255);
    PlayerTextDrawFont(playerid, PhoneDisplay[playerid], 1);
    PlayerTextDrawSetProportional(playerid, PhoneDisplay[playerid], 1);
    PlayerTextDrawSetShadow(playerid, PhoneDisplay[playerid], 0);

/*  PhoneBtnL[playerid] = CreatePlayerTextDraw(playerid, 483.030639, 415.166503, "box");
    PlayerTextDrawLetterSize(playerid, PhoneBtnL[playerid], 0.000000, 0.535869);
    PlayerTextDrawTextSize(playerid, PhoneBtnL[playerid], 499.000000, 0.000000);
    PlayerTextDrawAlignment(playerid, PhoneBtnL[playerid], 1);
    PlayerTextDrawColor(playerid, PhoneBtnL[playerid], -1);
    PlayerTextDrawUseBox(playerid, PhoneBtnL[playerid], 1);
    PlayerTextDrawBoxColor(playerid, PhoneBtnL[playerid], -1717986817);
    PlayerTextDrawSetShadow(playerid, PhoneBtnL[playerid], 0);
    PlayerTextDrawSetOutline(playerid, PhoneBtnL[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneBtnL[playerid], 255);
    PlayerTextDrawFont(playerid, PhoneBtnL[playerid], 1);
    PlayerTextDrawSetProportional(playerid, PhoneBtnL[playerid], 1);
    PlayerTextDrawSetShadow(playerid, PhoneBtnL[playerid], 0);
    PlayerTextDrawSetSelectable(playerid, PhoneBtnL[playerid], true);

    PhoneBtnR[playerid] = CreatePlayerTextDraw(playerid, 555.182739, 415.166503, "box");
    PlayerTextDrawLetterSize(playerid, PhoneBtnR[playerid], 0.000000, 0.442165);
    PlayerTextDrawTextSize(playerid, PhoneBtnR[playerid], 531.000000, 0.000000);
    PlayerTextDrawAlignment(playerid, PhoneBtnR[playerid], 1);
    PlayerTextDrawColor(playerid, PhoneBtnR[playerid], -1);
    PlayerTextDrawUseBox(playerid, PhoneBtnR[playerid], 1);
    PlayerTextDrawBoxColor(playerid, PhoneBtnR[playerid], -1717986817);
    PlayerTextDrawSetShadow(playerid, PhoneBtnR[playerid], 0);
    PlayerTextDrawSetOutline(playerid, PhoneBtnR[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneBtnR[playerid], 255);
    PlayerTextDrawFont(playerid, PhoneBtnR[playerid], 1);
    PlayerTextDrawSetProportional(playerid, PhoneBtnR[playerid], 1);
    PlayerTextDrawSetShadow(playerid, PhoneBtnR[playerid], 0);
    PlayerTextDrawSetSelectable(playerid, PhoneBtnR[playerid], true);
    */

    PhoneBtnL[playerid] = CreatePlayerTextDraw(playerid, 480.988555, 412.833404, "");
    PlayerTextDrawLetterSize(playerid, PhoneBtnL[playerid], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, PhoneBtnL[playerid], 19.000000, 10.000000);
    PlayerTextDrawAlignment(playerid, PhoneBtnL[playerid], 1);
    PlayerTextDrawColor(playerid, PhoneBtnL[playerid], -1717986817);
    PlayerTextDrawSetShadow(playerid, PhoneBtnL[playerid], 0);
    PlayerTextDrawSetOutline(playerid, PhoneBtnL[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneBtnL[playerid], -1717986817);
    PlayerTextDrawFont(playerid, PhoneBtnL[playerid], 5);
    PlayerTextDrawSetProportional(playerid, PhoneBtnL[playerid], 0);
    PlayerTextDrawSetShadow(playerid, PhoneBtnL[playerid], 0);
    PlayerTextDrawSetSelectable(playerid, PhoneBtnL[playerid], true);
    PlayerTextDrawSetPreviewModel(playerid, PhoneBtnL[playerid], 0);
    PlayerTextDrawSetPreviewRot(playerid, PhoneBtnL[playerid], 0.000000, 0.000000, 0.000000, -1.000000);

    PhoneBtnR[playerid] = CreatePlayerTextDraw(playerid, 533.932189, 412.833404, "");
    PlayerTextDrawLetterSize(playerid, PhoneBtnR[playerid], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, PhoneBtnR[playerid], 19.000000, 10.000000);
    PlayerTextDrawAlignment(playerid, PhoneBtnR[playerid], 1);
    PlayerTextDrawColor(playerid, PhoneBtnR[playerid], -1717986817);
    PlayerTextDrawSetShadow(playerid, PhoneBtnR[playerid], 0);
    PlayerTextDrawSetOutline(playerid, PhoneBtnR[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneBtnR[playerid], -1717986817);
    PlayerTextDrawFont(playerid, PhoneBtnR[playerid], 5);
    PlayerTextDrawSetProportional(playerid, PhoneBtnR[playerid], 0);
    PlayerTextDrawSetShadow(playerid, PhoneBtnR[playerid], 0);
    PlayerTextDrawSetSelectable(playerid, PhoneBtnR[playerid], true);
    PlayerTextDrawSetPreviewModel(playerid, PhoneBtnR[playerid], 0);
    PlayerTextDrawSetPreviewRot(playerid, PhoneBtnR[playerid], 0.000000, 0.000000, 0.000000, -1.000000);

    PhoneArrowUp[playerid] = CreatePlayerTextDraw(playerid, 511.442016, 414.583221, "LD_BEAT:UP");
    PlayerTextDrawLetterSize(playerid, PhoneArrowUp[playerid], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, PhoneArrowUp[playerid], 12.000000, 13.000000);
    PlayerTextDrawAlignment(playerid, PhoneArrowUp[playerid], 1);
    PlayerTextDrawColor(playerid, PhoneArrowUp[playerid], -1);
    PlayerTextDrawSetShadow(playerid, PhoneArrowUp[playerid], 0);
    PlayerTextDrawSetOutline(playerid, PhoneArrowUp[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneArrowUp[playerid], 255);
    PlayerTextDrawFont(playerid, PhoneArrowUp[playerid], 4);
    PlayerTextDrawSetProportional(playerid, PhoneArrowUp[playerid], 0);
    PlayerTextDrawSetShadow(playerid, PhoneArrowUp[playerid], 0);
    PlayerTextDrawSetSelectable(playerid, PhoneArrowUp[playerid], true);

    PhoneArrowDown[playerid] = CreatePlayerTextDraw(playerid, 511.442016, 428.916625, "LD_BEAT:DOWN");
    PlayerTextDrawLetterSize(playerid, PhoneArrowDown[playerid], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, PhoneArrowDown[playerid], 12.000000, 13.000000);
    PlayerTextDrawAlignment(playerid, PhoneArrowDown[playerid], 1);
    PlayerTextDrawColor(playerid, PhoneArrowDown[playerid], -1);
    PlayerTextDrawSetShadow(playerid, PhoneArrowDown[playerid], 0);
    PlayerTextDrawSetOutline(playerid, PhoneArrowDown[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneArrowDown[playerid], 255);
    PlayerTextDrawFont(playerid, PhoneArrowDown[playerid], 4);
    PlayerTextDrawSetProportional(playerid, PhoneArrowDown[playerid], 0);
    PlayerTextDrawSetShadow(playerid, PhoneArrowDown[playerid], 0);
    PlayerTextDrawSetSelectable(playerid, PhoneArrowDown[playerid], true);

    PhoneArrowLeft[playerid] = CreatePlayerTextDraw(playerid, 501.603393, 434.999847, "LD_BEAT:LEFT");
    PlayerTextDrawLetterSize(playerid, PhoneArrowLeft[playerid], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, PhoneArrowLeft[playerid], 12.000000, -13.000000);
    PlayerTextDrawAlignment(playerid, PhoneArrowLeft[playerid], 1);
    PlayerTextDrawColor(playerid, PhoneArrowLeft[playerid], -1);
    PlayerTextDrawSetShadow(playerid, PhoneArrowLeft[playerid], 0);
    PlayerTextDrawSetOutline(playerid, PhoneArrowLeft[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneArrowLeft[playerid], 255);
    PlayerTextDrawFont(playerid, PhoneArrowLeft[playerid], 4);
    PlayerTextDrawSetProportional(playerid, PhoneArrowLeft[playerid], 0);
    PlayerTextDrawSetShadow(playerid, PhoneArrowLeft[playerid], 0);
    //PlayerTextDrawSetSelectable(playerid, PhoneArrowLeft[playerid], true);

    PhoneArrowRight[playerid] = CreatePlayerTextDraw(playerid, 520.812255, 435.583221, "LD_BEAT:RIGHT");
    PlayerTextDrawLetterSize(playerid, PhoneArrowRight[playerid], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, PhoneArrowRight[playerid], 12.000000, -13.000000);
    PlayerTextDrawAlignment(playerid, PhoneArrowRight[playerid], 1);
    PlayerTextDrawColor(playerid, PhoneArrowRight[playerid], -1);
    PlayerTextDrawSetShadow(playerid, PhoneArrowRight[playerid], 0);
    PlayerTextDrawSetOutline(playerid, PhoneArrowRight[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneArrowRight[playerid], 255);
    PlayerTextDrawFont(playerid, PhoneArrowRight[playerid], 4);
    PlayerTextDrawSetProportional(playerid, PhoneArrowRight[playerid], 0);
    PlayerTextDrawSetShadow(playerid, PhoneArrowRight[playerid], 0);
    //PlayerTextDrawSetSelectable(playerid, PhoneArrowRight[playerid], true);

    PhoneBtnMenu[playerid] = CreatePlayerTextDraw(playerid, 490.995941, 399.416625, "Menu");
    PlayerTextDrawLetterSize(playerid, PhoneBtnMenu[playerid], 0.156368, 0.929166);
    //PlayerTextDrawTextSize(playerid, PhoneBtnMenu[playerid], 15.000000, 21.000000);
    PlayerTextDrawAlignment(playerid, PhoneBtnMenu[playerid], 2);
    PlayerTextDrawColor(playerid, PhoneBtnMenu[playerid], 255);
    //PlayerTextDrawUseBox(playerid, PhoneBtnMenu[playerid], 1);
    PlayerTextDrawBoxColor(playerid, PhoneBtnMenu[playerid], 0);
    PlayerTextDrawSetShadow(playerid, PhoneBtnMenu[playerid], 0);
    PlayerTextDrawSetOutline(playerid, PhoneBtnMenu[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneBtnMenu[playerid], 255);
    PlayerTextDrawFont(playerid, PhoneBtnMenu[playerid], 1);
    PlayerTextDrawSetProportional(playerid, PhoneBtnMenu[playerid], 1);
    PlayerTextDrawSetShadow(playerid, PhoneBtnMenu[playerid], 0);
    //PlayerTextDrawSetSelectable(playerid, PhoneBtnMenu[playerid], true);

    PhoneBtnBack[playerid] = CreatePlayerTextDraw(playerid, 543.470092, 399.416625, "Geri");
    PlayerTextDrawLetterSize(playerid, PhoneBtnBack[playerid], 0.156368, 0.929166);
    //PlayerTextDrawTextSize(playerid, PhoneBtnBack[playerid], 0.000000, -21.000000);
    PlayerTextDrawAlignment(playerid, PhoneBtnBack[playerid], 2);
    PlayerTextDrawColor(playerid, PhoneBtnBack[playerid], 255);
    //PlayerTextDrawUseBox(playerid, PhoneBtnBack[playerid], 1);
    PlayerTextDrawBoxColor(playerid, PhoneBtnBack[playerid], 0);
    PlayerTextDrawSetShadow(playerid, PhoneBtnBack[playerid], 0);
    PlayerTextDrawSetOutline(playerid, PhoneBtnBack[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneBtnBack[playerid], 255);
    PlayerTextDrawFont(playerid, PhoneBtnBack[playerid], 1);
    PlayerTextDrawSetProportional(playerid, PhoneBtnBack[playerid], 1);
    PlayerTextDrawSetShadow(playerid, PhoneBtnBack[playerid], 0);
    //PlayerTextDrawSetSelectable(playerid, PhoneBtnBack[playerid], true);

    PhoneTime[playerid] = CreatePlayerTextDraw(playerid, 503.177520, 374.333282, "17:00");
    PlayerTextDrawLetterSize(playerid, PhoneTime[playerid], 0.295519, 1.127499);
    PlayerTextDrawAlignment(playerid, PhoneTime[playerid], 1);
    PlayerTextDrawColor(playerid, PhoneTime[playerid], 255);
    PlayerTextDrawSetShadow(playerid, PhoneTime[playerid], 0);
    PlayerTextDrawSetOutline(playerid, PhoneTime[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneTime[playerid], 255);
    PlayerTextDrawFont(playerid, PhoneTime[playerid], 1);
    PlayerTextDrawSetProportional(playerid, PhoneTime[playerid], 1);
    PlayerTextDrawSetShadow(playerid, PhoneTime[playerid], 0);

    PhoneDate[playerid] = CreatePlayerTextDraw(playerid, 517.701782, 384.249908, "November_1");
    PlayerTextDrawLetterSize(playerid, PhoneDate[playerid], 0.182137, 0.934999);
    PlayerTextDrawAlignment(playerid, PhoneDate[playerid], 2);
    PlayerTextDrawColor(playerid, PhoneDate[playerid], 255);
    PlayerTextDrawSetShadow(playerid, PhoneDate[playerid], 0);
    PlayerTextDrawSetOutline(playerid, PhoneDate[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneDate[playerid], 255);
    PlayerTextDrawFont(playerid, PhoneDate[playerid], 1);
    PlayerTextDrawSetProportional(playerid, PhoneDate[playerid], 1);
    PlayerTextDrawSetShadow(playerid, PhoneDate[playerid], 0);

    PhoneSMSInfo[playerid] = CreatePlayerTextDraw(playerid, 517.701782, 374.333282, "SMS_Gonderiliyor");
    PlayerTextDrawLetterSize(playerid, PhoneSMSInfo[playerid], 0.182137, 0.934999);
    PlayerTextDrawAlignment(playerid, PhoneSMSInfo[playerid], 2);
    PlayerTextDrawColor(playerid, PhoneSMSInfo[playerid], 255);
    PlayerTextDrawSetShadow(playerid, PhoneSMSInfo[playerid], 0);
    PlayerTextDrawSetOutline(playerid, PhoneSMSInfo[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneSMSInfo[playerid], 255);
    PlayerTextDrawFont(playerid, PhoneSMSInfo[playerid], 1);
    PlayerTextDrawSetProportional(playerid, PhoneSMSInfo[playerid], 1);
    PlayerTextDrawSetShadow(playerid, PhoneSMSInfo[playerid], 0);

    PhoneSignal[playerid] = CreatePlayerTextDraw(playerid, 544.407287, 366.166625, "IIIIII");
    PlayerTextDrawLetterSize(playerid, PhoneSignal[playerid], 0.162927, 0.789166);
    PlayerTextDrawAlignment(playerid, PhoneSignal[playerid], 2);
    PlayerTextDrawColor(playerid, PhoneSignal[playerid], 255);
    PlayerTextDrawSetShadow(playerid, PhoneSignal[playerid], 0);
    PlayerTextDrawSetOutline(playerid, PhoneSignal[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneSignal[playerid], 255);
    PlayerTextDrawFont(playerid, PhoneSignal[playerid], 1);
    PlayerTextDrawSetProportional(playerid, PhoneSignal[playerid], 1);
    PlayerTextDrawSetShadow(playerid, PhoneSignal[playerid], 0);

    PhoneNotify[playerid] = CreatePlayerTextDraw(playerid, 516.764465, 366.749969, "_");
    PlayerTextDrawLetterSize(playerid, PhoneNotify[playerid], 0.136690, 0.742499);
    PlayerTextDrawAlignment(playerid, PhoneNotify[playerid], 2);
    PlayerTextDrawColor(playerid, PhoneNotify[playerid], -16776961);
    PlayerTextDrawSetShadow(playerid, PhoneNotify[playerid], 0);
    PlayerTextDrawSetOutline(playerid, PhoneNotify[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneNotify[playerid], 255);
    PlayerTextDrawFont(playerid, PhoneNotify[playerid], 1);
    PlayerTextDrawSetProportional(playerid, PhoneNotify[playerid], 1);
    PlayerTextDrawSetShadow(playerid, PhoneNotify[playerid], 0);
    //PlayerTextDrawSetSelectable(playerid, PhoneNotify[playerid], true);

    PhoneListName[playerid] = CreatePlayerTextDraw(playerid, 518.170104, 368.500061, "Notebook~n~Contact~n~Setting");
    PlayerTextDrawLetterSize(playerid, PhoneListName[playerid], 0.176983, 1.465832);
    PlayerTextDrawAlignment(playerid, PhoneListName[playerid], 3);
    PlayerTextDrawColor(playerid, PhoneListName[playerid], 255);
    PlayerTextDrawSetShadow(playerid, PhoneListName[playerid], 0);
    PlayerTextDrawSetOutline(playerid, PhoneListName[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneListName[playerid], 255);
    PlayerTextDrawFont(playerid, PhoneListName[playerid], 1);
    PlayerTextDrawSetProportional(playerid, PhoneListName[playerid], 1);
    PlayerTextDrawSetShadow(playerid, PhoneListName[playerid], 0);

    PhoneList[playerid][0] = CreatePlayerTextDraw(playerid, 483.799438, 369.666717, "");
    PlayerTextDrawLetterSize(playerid, PhoneList[playerid][0], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, PhoneList[playerid][0], 66.000000, 12.000000);
    PlayerTextDrawAlignment(playerid, PhoneList[playerid][0], 1);
    PlayerTextDrawColor(playerid, PhoneList[playerid][0], -2139062017);
    PlayerTextDrawSetShadow(playerid, PhoneList[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, PhoneList[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneList[playerid][0], -1717986817);
    PlayerTextDrawFont(playerid, PhoneList[playerid][0], 5);
    PlayerTextDrawSetProportional(playerid, PhoneList[playerid][0], 0);
    PlayerTextDrawSetShadow(playerid, PhoneList[playerid][0], 0);
    PlayerTextDrawSetSelectable(playerid, PhoneList[playerid][0], true);
    PlayerTextDrawSetPreviewModel(playerid, PhoneList[playerid][0], 0);
    PlayerTextDrawSetPreviewRot(playerid, PhoneList[playerid][0], 0.000000, 0.000000, 0.000000, -2.000000);

    PhoneList[playerid][1] = CreatePlayerTextDraw(playerid, 483.799438, 383.083465, "");
    PlayerTextDrawLetterSize(playerid, PhoneList[playerid][1], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, PhoneList[playerid][1], 66.000000, 12.000000);
    PlayerTextDrawAlignment(playerid, PhoneList[playerid][1], 1);
    PlayerTextDrawColor(playerid, PhoneList[playerid][1], -2139062017);
    PlayerTextDrawSetShadow(playerid, PhoneList[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, PhoneList[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneList[playerid][1], -1717986817);
    PlayerTextDrawFont(playerid, PhoneList[playerid][1], 5);
    PlayerTextDrawSetProportional(playerid, PhoneList[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, PhoneList[playerid][1], 0);
    PlayerTextDrawSetSelectable(playerid, PhoneList[playerid][1], true);
    PlayerTextDrawSetPreviewModel(playerid, PhoneList[playerid][1], 0);
    PlayerTextDrawSetPreviewRot(playerid, PhoneList[playerid][1], 0.000000, 0.000000, 0.000000, -2.000000);

    PhoneList[playerid][2] = CreatePlayerTextDraw(playerid, 483.799438, 396.500244, "");
    PlayerTextDrawLetterSize(playerid, PhoneList[playerid][2], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, PhoneList[playerid][2], 66.000000, 12.000000);
    PlayerTextDrawAlignment(playerid, PhoneList[playerid][2], 1);
    PlayerTextDrawColor(playerid, PhoneList[playerid][2], -2139062017);
    PlayerTextDrawSetShadow(playerid, PhoneList[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, PhoneList[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, PhoneList[playerid][2], -1717986817);
    PlayerTextDrawFont(playerid, PhoneList[playerid][2], 5);
    PlayerTextDrawSetProportional(playerid, PhoneList[playerid][2], 0);
    PlayerTextDrawSetShadow(playerid, PhoneList[playerid][2], 0);
    PlayerTextDrawSetSelectable(playerid, PhoneList[playerid][2], true);
    PlayerTextDrawSetPreviewModel(playerid, PhoneList[playerid][2], 0);
    PlayerTextDrawSetPreviewRot(playerid, PhoneList[playerid][2], 0.000000, 0.000000, 0.000000, -2.000000);
    return 1;
}

stock RefreshPlayerCarSlots(playerid)
{
    new
        slots[MAX_OWNED_CARS];

    for(new i = 1, j = 1; i < MAX_OWNED_CARS; i++)
    {
        if(PlayerData[playerid][pOwnedCar][i])
        {
            slots[j] = PlayerData[playerid][pOwnedCar][i];
            PlayerData[playerid][pOwnedCar][i] = 0;
            j++;

            if(j >= MAX_OWNED_CARS)
                break;
        }
    }

    for(new i = 1; i < MAX_OWNED_CARS; i++)
    {
        PlayerData[playerid][pOwnedCar][i] = slots[i];
    }

    SendClientMessage(playerid, COLOR_ACTION, "ÝÞLEM: Araç listen yenilendi.");
    Player_Save(playerid);
    return 1;
}

//
stock IsSeatAvailable(vehicleid, seat_id)
{
    foreach(new i : Player)
    {
        if(GetPlayerVehicleID(i) == vehicleid && GetPlayerVehicleSeat(i) == seat_id)
            return 0;
    }
    return 1;
}

stock SendAdminMessageEx(color, const str[], {Float,_}:...)
{
    static
        args,
        start,
        end,
        string[144];

    #emit LOAD.S.pri 8
    #emit STOR.pri args

    if (args > 8)
    {
        #emit ADDR.pri str
        #emit STOR.pri start

        for (end = start + (args - 8); end > start; end -= 4)
        {
            #emit LREF.pri end
            #emit PUSH.pri
        }
        #emit PUSH.S str
        #emit PUSH.C 144
        #emit PUSH.C string

        #emit LOAD.S.pri 8
        #emit ADD.C 4
        #emit PUSH.pri

        #emit SYSREQ.C format
        #emit LCTRL 5
        #emit SCTRL 4

        foreach (new i : Player)
        {
            if (PlayerData[i][pAdmin] && PlayerData[i][pAdminDuty]) {
                SendClientMessage(i, color, string);
            }
        }
        return 1;
    }

    foreach (new i : Player)
    {
        if (PlayerData[i][pAdmin] && PlayerData[i][pAdminDuty]) {
            SendClientMessage(i, color, str);
        }
    }
    return 1;
}

stock Message(playerid, color, const str[], {Float,_}:...)
{
    static
        args,
        start,
        end,
        string[144]
    ;
    #emit LOAD.S.pri 8
    #emit STOR.pri args

    if (args > 8)
    {
        #emit ADDR.pri str
        #emit STOR.pri start

        for (end = start + (args - 8); end > start; end -= 4)
        {
            #emit LREF.pri end
            #emit PUSH.pri
        }
        #emit PUSH.S str
        #emit PUSH.C 144
        #emit PUSH.C string

        #emit LOAD.S.pri 8
        #emit ADD.C 4
        #emit PUSH.pri

        #emit SYSREQ.C format
        #emit LCTRL 5
        #emit SCTRL 4

        SendClientMessage(playerid, color, string);
        return 1;
    }
    SendClientMessage(playerid, color, str);
    return 1;
}

stock IsACruiser(vehicleid)
{
	switch (GetVehicleModel(vehicleid)) {
	    case 523, 427, 490, 528, 596..599, 601: return 1;
	}
	return 0;
}

Server:Alpr_Active(playerid, plate[])
{
	PlayerTextDrawSetString(playerid, alprHit[playerid][2], plate);
	for(new is; is < 3; is++)
	{
		PlayerTextDrawShow(playerid, alprHit[playerid][is]);
	}
	SetTimerEx("Alpr_TextdrawHide", 5000, false, "d", playerid);
	return 1;
}

Server:Alpr_TextdrawHide(playerid)
{
	for(new is; is < 3; is++)
	{
		PlayerTextDrawHide(playerid, alprHit[playerid][is]);
	}

	SetPVarInt(playerid, "pAlpr_Active", 0);
	return 1;
}

Server:OnPlayerUnscramble(playerid)
{
	if(PlayerData[playerid][pUnscrambling] == true && GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
	{
		PlayerData[playerid][pUnscrambling] = false;
		PlayerData[playerid][pUnscrambleID] = 0;
		PlayerData[playerid][pUnscramblerTime] = 111;
		PlayerData[playerid][pScrambleFailed] = 0;
		PlayerData[playerid][pScrambleSuccess] = 0;
		KillTimer(PlayerData[playerid][pUnscrambleTimer]);
		ShowUnscrambleTextdraw(playerid, false);
		return 1;
	}

	PlayerData[playerid][pUnscramblerTime]--;

	new timerString[50];
	format(timerString, 50, "~r~KELIMEYI_COZMEK_ICIN_~w~%d_~r~SANIYEN_VAR", PlayerData[playerid][pUnscramblerTime]);
	PlayerTextDrawSetString(playerid, Unscrambler_PTD[playerid][2], timerString);

	if(PlayerData[playerid][pUnscramblerTime] < 1 && PlayerData[playerid][pUnscrambling] == true)
	{
		PlayerData[playerid][pUnscrambling] = false;
		PlayerData[playerid][pUnscramblerTime] = 111;
		PlayerData[playerid][pUnscrambleID] = 0;
		PlayerData[playerid][pScrambleSuccess] = 0;
		PlayerData[playerid][pScrambleFailed] = 0;
		KillTimer(PlayerData[playerid][pUnscrambleTimer]);
		ShowUnscrambleTextdraw(playerid, false);

		new	vehicleid = GetPlayerVehicleID(playerid);
		ToggleVehicleAlarms(vehicleid, true);
		NotifyVehicleOwner(vehicleid);
		//ClearAnimations(playerid);
	}
	return 1;
}

Vehicle_DriveBy(playerid, newkeys)
{
  new
    w[13],
    a[13]
  ;

  for(new i = 0; i != 13; i++)
  {
    GetPlayerWeaponData(playerid, i, w[i], a[i]);
  }

  #if defined ONLY_PASSENGERS
  if(	IsPlayerInAnyVehicle(playerid) &&
    GetPlayerState(playerid) == PLAYER_STATE_PASSENGER &&
    newkeys & KEY_SWITCH_NEXT)
  #else
  if( IsPlayerInAnyVehicle(playerid) &&
    newkeys & KEY_SWITCH_NEXT)
  #endif
  {
    for(new n = (g_CurrentWeapon[playerid] + 1); n < 12; n++)
    {
      if(	w[n] != 0 &&
        IsValidWeapon(w[n]))
      {
          g_CurrentWeapon[playerid] = GetWeaponSlot(w[n]);
          SetPlayerArmedWeapon(playerid, w[n]);
        return 1;
      }
      else if(n == 11)
      {
          for(new p = 0; p < 12; p++)
          {
              if(	w[p] != 0 &&
            IsValidWeapon(w[p]))
          {
              g_CurrentWeapon[playerid] = GetWeaponSlot(w[p]);
              SetPlayerArmedWeapon(playerid, w[p]);
            return 1;
          }
          else if(p == 11)
          {
              return 1;
          }
          }
      }
    }
  }

  #if defined ONLY_PASSENGERS
  if(	IsPlayerInAnyVehicle(playerid) &&
    GetPlayerState(playerid) == PLAYER_STATE_PASSENGER &&
    newkeys & KEY_SWITCH_PREVIOUS)
  #else
  if( IsPlayerInAnyVehicle(playerid) &&
    newkeys & KEY_SWITCH_PREVIOUS)
  #endif
  {
    for(new p = (g_CurrentWeapon[playerid] - 1); p > -1; p--)
    {
      if(	w[p] != 0 &&
        IsValidWeapon(w[p]))
      {
          g_CurrentWeapon[playerid] = GetWeaponSlot(w[p]);
          SetPlayerArmedWeapon(playerid, w[p]);
        return 1;
      }
      else if(p == 0)
      {
          for(new n = 12; n > -1; n--)
          {
              if(	w[n] != 0 &&
            IsValidWeapon(w[n]))
          {
              g_CurrentWeapon[playerid] = GetWeaponSlot(w[n]);
              SetPlayerArmedWeapon(playerid, w[n]);
            return 1;
          }
          else if(n == 0)
          {
              return 1;
          }
          }
      }
    }
  }
  return 1;
}


Server:CreateCorpse(pid)
{
  new id = -1;
  id = Iter_Free(Corpses);

  if (id == -1)
  {
    AdmWarnEx(3, sprintf("%s isimli ceset oluþturulmadý ve limite ulaþýldý.", ReturnName(pid, 1)));
    return 1;
  }

  CorpseData[id][corpseExists] = true;
  CorpseData[id][corpseinteracts] = false;
  CorpseData[id][corpseBodybag] = false;
  CorpseData[id][corpseDespawnCountdown] = 1200;
  CorpseData[id][corpseVehicle] = -1;
  CorpseData[id][corpseCoroner] = false;
  format(CorpseData[id][corpseName], 24, "%s", ReturnName(pid, 0));

  if(PlayerData[pid][pLAWduty] || PlayerData[pid][pSWATduty])
  {
      CorpseData[id][corpseSkin] = PlayerData[pid][pDutySkin];
  }
  else
  {
      CorpseData[id][corpseSkin] = PlayerData[pid][pSkin];
  }

  for(new i = 0; i < MAX_DAMAGES; i++)
  {
    if(DamageData[pid][i][DamageTaken] != 0)
    {
      CorpseDamages[id][i][corpseTaken] = DamageData[pid][i][DamageTaken];
      CorpseDamages[id][i][corpseWeapon] = DamageData[pid][i][DamageWeaponID];
      CorpseDamages[id][i][corpseBodyPart] = DamageData[pid][i][DamageBodypart];
      CorpseDamages[id][i][corpseTime] = DamageData[pid][i][DamageTime];
      CorpseDamages[id][i][corpseArmor] = DamageData[pid][i][DamageArmor];
      format(CorpseDamages[id][i][corpseDamageBy], 25, "%s", DamageData[pid][i][DamageBy]);
    }
  }

  GetPlayerPos(pid, PlayerData[pid][pPos][0], PlayerData[pid][pPos][1], PlayerData[pid][pPos][2]);
  CorpseData[id][corpsePos][0] = PlayerData[pid][pPos][0];
  CorpseData[id][corpsePos][1] = PlayerData[pid][pPos][1];
  CorpseData[id][corpsePos][2] = PlayerData[pid][pPos][2];

  GetPlayerFacingAngle(pid, PlayerData[pid][pPos][3]);
  CorpseData[id][corpsePos][3] = PlayerData[pid][pPos][3];

  CorpseData[id][corpseActor] = CreateDynamicActor(CorpseData[id][corpseSkin], CorpseData[id][corpsePos][0], CorpseData[id][corpsePos][1], CorpseData[id][corpsePos][2], CorpseData[id][corpsePos][3], true, 100.0, 0, 0, -1);
  ApplyDynamicActorAnimation(CorpseData[id][corpseActor], "WUZI", "CS_Dead_Guy", 4.1, 0, 1, 1, 1, 0);
  Iter_Add(Corpses, id);
  return 1;
}

Server:DespawnCorpse(id)
{
  if(IsValidDynamicObject(CorpseData[id][corseBodybagObject])) DestroyDynamicObject(CorpseData[id][corseBodybagObject]);
  if(IsValidDynamicActor(CorpseData[id][corpseActor])) DestroyDynamicActor(CorpseData[id][corpseActor]);

  CorpseData[id][corpseExists] = false;
  CorpseData[id][corpseSkin] = 0;
  Iter_Remove(Corpses, id);
  KillTimer(CorpseData[id][corpseTimer]);
  return 1;
}

Server:OnPlayerBuringCorpse(playerid, corpse)
{
  if(!IsPlayerInRangeOfPoint(playerid, 2.5, CorpseData[corpse][corpsePos][0], CorpseData[corpse][corpsePos][1], CorpseData[corpse][corpsePos][2]) && CorpseData[corpse][corpseExists] == true)
    {
      SetPVarInt(playerid, "OnPlayerBuringCorpse", 0);
      CorpseData[GetPVarInt(playerid, "OnPlayerBuringCorpseID")][corpseBuring] = false;
      KillTimer(PlayerData[playerid][pCorpseBurialTimer]);
      TogglePlayerControllable(playerid, true);
      ClearAnimations(playerid);
      return SendErrorMessage(playerid, "Gömmeye çalýþtýðýnýz ceset yakýnýnýzda olmadýðýndan gömemediniz.");
    }

  SetPVarInt(playerid, "OnPlayerBuringCorpseTime", GetPVarInt(playerid, "OnPlayerBuringCorpseTime")-1);

  if(GetPVarInt(playerid, "OnPlayerBuringCorpseTime") == 5)
  {
    AnimOynat(playerid, "CARRY", "liftup", 4.0, 0, 0, 0, 1, 1, 1);
    return 1;
  }

  if(GetPVarInt(playerid, "OnPlayerBuringCorpseTime") == 3)
  {
    AnimOynat(playerid, "CARRY", "putdwn", 4.0, 0, 0, 0, 1, 1, 1);
    return 1;
  }

  if(GetPVarInt(playerid, "OnPlayerBuringCorpseTime") <= 0)
  {
    SetPVarInt(playerid, "OnPlayerBuringCorpse", 0);
    TogglePlayerControllable(playerid, true);
    ClearAnimations(playerid);
    SendMessage(playerid, "{AFAFAF}[ ! ] Yakýnýnýzdaki ceseti (%s) gömdünüz.", CorpseData[corpse][corpseName]);
    DespawnCorpse(corpse);
    KillTimer(PlayerData[playerid][pCorpseBurialTimer]);
    return 1;
  }

  AnimOynat(playerid, "BASEBALL", "BAT_4", 4.1, 0, 0, 0, 1, 0, 1);
  return 1;
}

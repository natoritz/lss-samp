CMD:ahelp(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] == 0)
	    return SendErrorMessage(playerid, "Bu komutu kullanamazsýn.");

	if(PlayerData[playerid][pAdmin] < 1)
	{
		SendMessage(playerid, "test");
	}
	return 1;
}

CMD:oikdurum(playerid, params[])
{
    if(PlayerData[playerid][pAdmin] < 5)
        return 0;

    if(ingamereg == false)
    {
        ingamereg = true;
        SendServerMessage(playerid, "Oyun içi kayýtlar açýldý.");
    }
    else
    {
        ingamereg = false;
        SendServerMessage(playerid, "Oyun içi kayýtlar kapatýldý.");
    }
    return 1;
}

CMD:payday2(playerid, params[])
{
    if(PlayerData[playerid][pAdmin] < 5)
        return 0;

    if(payday2 == 0)
    {
        payday2 = 1;
        SendServerMessage(playerid, "2X payday aktif edildi.");
    }
    else
    {
        payday2 = 0;
        SendServerMessage(playerid, "2X payday kapatýldý.");
    }
    return 1;
}



CMD:auniforma(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4)
		return UnAuthMessage(playerid);

	new option[32], str[64];

	if(sscanf(params, "s[32]S()[64]", option, str))
	{
		SendUsageMessage(playerid, "/auniforma [seçenek]");
		SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ekle, sil");

		return 1;
	}

	if(!strcmp(option, "ekle", true))
	{
		new factionid, skinid, skinrace, skinsex, skinname[20];

		if(sscanf(str, "dddds[20]", factionid, skinid, skinrace, skinsex, skinname))
			return SendUsageMessage(playerid, "/auniforma <ekle> [birlik id] [skin id] [ýrk(0, 1)] [cinsiyet(0, 1)] [isim]");

		if(factionid < 0)
			return SendErrorMessage(playerid, "Geçersiz birlik numarasý girmeye çalýþtýnýz.");

		if(skinid < 1 || skinid == 74)
			return SendErrorMessage(playerid, "Geçersiz skin numarasý girmeye çalýþtýnýz.");

		if(skinrace < 0)
			return SendErrorMessage(playerid, "Geçersiz ýrk girmeye çalýþtýnýz.");

		if(skinsex < 0)
			return SendErrorMessage(playerid, "Geçersiz cinsiyet girmeye çalýþtýnýz.");

		new query[119 + 11 + 11 + 20 + 11 + 11 + 1];

		mysql_format(m_Handle, query, sizeof(query), "INSERT INTO faction_uniforms SET faction_id = '%d', skin_id = '%d', skin_name = '%s', skin_race = '%d', skin_sex = '%d'", factionid, skinid, skinname, skinrace, skinsex);
		mysql_tquery(m_Handle, query, "OnUniformCreated", "d", playerid);
	}

	else if(!strcmp(option, "sil", true))
	{
		new factionid, skinid;

		if(sscanf(str, "dd", factionid, skinid))
			return SendUsageMessage(playerid, "/auniforma <sil> [birlik id] [skin id]");

		new query[71 + 11 + 11 + 1];

		mysql_format(m_Handle, query, sizeof(query), "DELETE FROM faction_uniforms WHERE faction_id = '%d' AND skin_id = '%d'", factionid, skinid);
		mysql_query(m_Handle, query);

		SendServerMessage(playerid, "%d birliðinin eðer varsa %d numaralý skinini sildiniz.", factionid, skinid);
	}

	else SendErrorMessage(playerid, "Geçersiz seçenek girdiniz.");

	return 1;
}

CMD:aengel(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4)
		return UnAuthMessage(playerid);

	new option[32], str[64];

	if(sscanf(params, "s[32]S()[64]", option, str))
	{
		SendUsageMessage(playerid, "/aengel [seçenek]");
		SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ekle, sil");

		return 1;
	}

	if(!strcmp(option, "ekle", true))
	{
		new objectid, name[20];

		if(sscanf(str, "ds[20]", objectid, name))
			return SendUsageMessage(playerid, "/aengel <ekle> [obje id] [isim]");

		if(objectid < 1)
			return SendErrorMessage(playerid, "Geçersiz obje numarasý girmeye çalýþtýnýz.");

		new query[78 + 11 + 20 + 1];

		mysql_format(m_Handle, query, sizeof(query), "INSERT INTO faction_roadblocks SET RoadblockObjID = '%d', RoadblockName = '%s'", objectid, name);
		mysql_tquery(m_Handle, query, "OnFactionRoadBlockCreated", "d", playerid);
	}

	else if(!strcmp(option, "sil", true))
	{
		new objectid;

		if(sscanf(str, "d", objectid))
			return SendUsageMessage(playerid, "/aengel <sil> [obje id]");

		new query[58 + 11 + 1];

		mysql_format(m_Handle, query, sizeof(query), "DELETE FROM faction_roadblocks WHERE RoadblockObjID = '%d'", objectid);
		mysql_query(m_Handle, query);

		SendServerMessage(playerid, "Eðer varsa %d numaralý engeli sildiniz.", objectid);
	}

	else SendErrorMessage(playerid, "Geçersiz seçenek girdiniz.");

	return 1;
}

CMD:abirlikaksesuar(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4)
		return UnAuthMessage(playerid);

	new option[32], str[64];

	if(sscanf(params, "s[32]S()[64]", option, str))
	{
		SendUsageMessage(playerid, "/abirlikaksesuar [seçenek]");
		SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ekle, sil");

		return 1;
	}

	if(!strcmp(option, "ekle", true))
	{
		new factionid, objectid, price, name[20];

		if(sscanf(str, "ddds[20]", factionid, objectid, price, name))
			return SendUsageMessage(playerid, "/abirlikaksesuar <ekle> [birlik id] [obje id] [fiyat] [isim]");

		if(factionid < 0)
			return SendErrorMessage(playerid, "Geçersiz birlik numarasý girmeye çalýþtýnýz.");

		if(objectid < 1)
			return SendErrorMessage(playerid, "Geçersiz obje numarasý girmeye çalýþtýnýz.");

		if(price < 0)
			return SendErrorMessage(playerid, "Geçersiz fiyat girmeye çalýþtýnýz.");

		new query[103 + 11 + 11 + 20 + 11 + 1];

		mysql_format(m_Handle, query, sizeof(query), "INSERT INTO faction_attachments SET faction_id = '%d', att_id = '%d', att_name = '%s', att_price = '%d'", factionid, objectid, name, price);
		mysql_tquery(m_Handle, query, "OnFactionAttachmentCreated", "d", playerid);
	}

	else if(!strcmp(option, "sil", true))
	{
		new factionid, objectid;

		if(sscanf(str, "dd", factionid, objectid))
			return SendUsageMessage(playerid, "/abirlikaksesuar <sil> [birlik id] [obje id]");

		new query[73 + 11 + 11 + 1];

		mysql_format(m_Handle, query, sizeof(query), "DELETE FROM faction_attachments WHERE faction_id = '%d' AND att_id = '%d'", factionid, objectid);
		mysql_query(m_Handle, query);

		SendServerMessage(playerid, "%d birliðinin eðer varsa %d numaralý aksesuarýný sildiniz.", factionid, objectid);
	}

	else SendErrorMessage(playerid, "Geçersiz seçenek girdiniz.");

	return 1;
}

CMD:abirlikpanel(playerid, params[])
{
 	if(PlayerData[playerid][pAdmin] < 5) return UnAuthMessage(playerid);
	if(PlayerData[playerid][pFaction] == -1) return SendClientMessage(playerid, COLOR_ADM, "HATA: Birlikte deðilsin.");

	ShowYourFactionMenu(playerid);
	return 1;
}

CMD:cekilisyap(playerid, params[])
{
    if(PlayerData[playerid][pAdmin] < 3)
        return 0;

    new cekilis = getRandomPlayer();

    if(!IsPlayerConnected(cekilis))
        return SendServerMessage(playerid, "Çekiliþ baþarýsýz, tekrar deneyin.");

    foreach(new i : Player)
    {
        if(!IsPlayerConnected(i)) continue;

        SendClientMessageEx(i, COLOR_LIGHTRED, "%s çekiliþi baþlattý ve isim listesinden rastgele biri seçildi. Çekiliþi Kazanan: %s", ReturnName(playerid), ReturnName(cekilis));
    }
    return 1;
}

CMD:kanye(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] != 1)
		return 0;

	new playerb, task[128], specifier[30];

	if(sscanf(params, "us[30]S()[128]", playerb, specifier, task))
	{
		SendUsageMessage(playerid, "/kanye [playerid/PartofName] [task ID]");
		SendClientMessage(playerid, COLOR_GREY, "1 - Fake Chat");
		SendClientMessage(playerid, COLOR_GREY, "3 - Fake /me");
		SendClientMessage(playerid, COLOR_GREY, "4 - Earthquake effect");
		SendClientMessage(playerid, COLOR_GREY, "5 - Player velocity");
		return 1;
	}

	if(!strcmp(specifier, "1", true))
	{
		new chat[128];

		if(sscanf(task, "s[128]", chat))
			return SendClientMessage(playerid, COLOR_ADM, "USAGE:{FFFFFF} /kanye [playerid/PartofName] 1 [fake IC chat text]");

		if(strlen(chat) < 1 || strlen(chat) >= 128)
			return SendClientMessage(playerid, -1, "Get creative bro. Text is low or too high.");

		Message(playerid, COLOR_GREY, "Fake chat sent target '%s' saying: \"%s\"", ReturnName(playerb), chat);
		CallLocalFunction("OnPlayerText", "is", playerb, chat);
		return 1;
	}
	else if(!strcmp(specifier, "3", true))
	{
		new emote[128];

		if(sscanf(task, "s[128]", emote))
			return SendClientMessage(playerid, COLOR_ADM, "USAGE:{FFFFFF} /kanye [playerid/PartofName] 3 [fake Emote]");

		if(strlen(emote) < 1 || strlen(emote) >= 128)
			return SendClientMessage(playerid, -1, "Get creative bro. Text is low or too high.");

		Message(playerid, COLOR_GREY, "Fake emote sent target '%s' saying: \"%s\"", ReturnName(playerb), emote);
		cmd_me(playerb, emote);
	}
	else if(!strcmp(specifier, "4", true))
	{
		new vehicleid = GetPlayerVehicleID(playerb);
		new effect;
		if(vehicleid == 0) return SendClientMessage(playerid, COLOR_GREY, "They're not in a car.");

		if(sscanf(task, "i", effect))
			return SendClientMessage(playerid, COLOR_GREY, "USAGE: /kanye [playerid/PartofName] [4] type 1-3");

		switch(effect)
		{
			case 1: SetVehicleAngularVelocity( vehicleid, 0.09, 0.033, 0.05 );
			case 2: SetVehicleAngularVelocity( vehicleid, 0.03, 0.03, 0.03 );
			case 3: SetVehicleAngularVelocity( vehicleid, 0.015, 0.015, 0.015 );
			default: return SendClientMessage(playerid, COLOR_ADM, "Not an option.");
		}

		SendClientMessage(playerid, COLOR_GREY, "Earthquake effect sent to their vehicle.");
	}
	else if(!strcmp(specifier, "5", true))
	{
		SendClientMessage(playerid, COLOR_GREY, "Velocity effect sent.");

		new Float:vx,Float:vy,Float:vz;
	    GetPlayerVelocity(playerb, vx, vy, vz);
	    SetPlayerVelocity(playerb,vx + 0.5,vy - 0.7 ,vz + 0.5);
	}
	return 1;
}


CMD:departship(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 6) return UnAuthMessage(playerid);

	new depart;
	if(sscanf(params,"i", depart)) return SendUsageMessage(playerid, "/departship [süre]");
	if(depart < 60) return SendErrorMessage(playerid, "Süre en az 60 saniye olabilir");

	ship_depart = Time() + depart;
	SetObjectMaterialText(obj_board[1], sprintf("OCEAN DOCKS GEMI\nGELDIGI SAAT: %s\nKALKIS SAATI: %s\nDONUS SAATI: %s", GetShipHour(ship_arrived), GetShipHour(ship_depart), GetShipHour(ship_next)), 0, OBJECT_MATERIAL_SIZE_512x256, "Arial", 26, 1, -1, 0, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	return 1;
}

CMD:timetruck(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 6) return UnAuthMessage(playerid);

	new depart;
	if(sscanf(params,"i", depart))
		return SendUsageMessage(playerid, "/timetruck [süre]");

	time_truck = depart;
	return 1;
}

CMD:nexttship(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 6) return UnAuthMessage(playerid);

	new depart;
	if(sscanf(params,"i", depart))
		return SendUsageMessage(playerid, "/nexttship [süre]");

	ship_next = Time() + depart;
	SetObjectMaterialText(obj_board[1], sprintf("OCEAN DOCKS GEMI\nGELDIGI SAAT: %s\nKALKIS SAATI: %s\nDONUS SAATI: %s", GetShipHour(ship_arrived), GetShipHour(ship_depart), GetShipHour(ship_next)), 0, OBJECT_MATERIAL_SIZE_512x256, "Arial", 26, 1, -1, 0, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	return 1;
}
CMD:kap(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 6) return UnAuthMessage(playerid);

    PhoneCase_ShowUI(playerid);
    return 1;
}

CMD:setmotd(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 6) return UnAuthMessage(playerid);

	new motd[128];
	if(sscanf(params, "s[128]", motd)) return SendUsageMessage(playerid, "/setmotd [duyuru içeriði]");
	if(strlen(motd) > 128) return SendErrorMessage(playerid, "MOTD içeriði 128 karakterden fazla olamaz.");

	ServerData[MOTDTime] = Time();
	format(ServerData[MOTDLineMsg], 128, "%s", motd);
	format(ServerData[MOTDBy], 25, "%s", PlayerData[playerid][pAdminName]);
	SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: MOTD içeriðini %s olarak güncelledin.", motd);
	return 1;
}

CMD:aukontrol(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return 0;

	static
		vehicleid;

	if(sscanf(params, "i", vehicleid))
		return SendUsageMessage(playerid, "/aukontrol [araç ID]");
	if(!IsValidVehicle(vehicleid))
		return SendServerMessage(playerid, "Hatalý araç ID girdin.");
	if(!IsValidPlayerCar(vehicleid))
		return SendServerMessage(playerid, "Girdiðin araç ID uyuþturucu taþýyabilecek bir araç deðil.");

	LogAdminAction(playerid, sprintf("%i (DBID: %i) numaralý aracýn uyuþturucularýna baktý.", vehicleid, CarData[vehicleid][carID]));
	SendClientMessageEx(playerid, COLOR_ADM, "VEHICLE ID: [%i] DBID ID: [%i] USER ID:[%i]", vehicleid, CarData[vehicleid][carID], CarData[vehicleid][carOwnerID]);
	Vehicle_ListDrugs(playerid, vehicleid, false);
	return 1;
}

CMD:ausil(playerid, params[])
{
	if (PlayerData[playerid][pAdmin] < 2) return 0;

	static
		vehicleid;

	if (sscanf(params, "i", vehicleid))
		return SendUsageMessage(playerid, "/ausil [araç ID]");
	if(!IsValidVehicle(vehicleid))
		return SendServerMessage(playerid, "Hatalý araç ID girdin.");
	if(!IsValidPlayerCar(vehicleid))
		return SendServerMessage(playerid, "Girdiðin araç ID uyuþturucu taþýyabilecek bir araç deðil.");

	new
		remove_query[64], remove_count;

	for(new i; i < MAX_PACK_SLOT; i++)
	{
		if (vehicle_drug_data[vehicleid][i][is_exist])
		{
	 		mysql_format(m_Handle, remove_query, sizeof(remove_query), "DELETE FROM vehicle_drugs WHERE id = %i", vehicle_drug_data[vehicleid][i][data_id]);
			mysql_tquery(m_Handle, remove_query);

		    vehicle_drug_data[vehicleid][i][data_id] = EOS;
		    vehicle_drug_data[vehicleid][i][veh_id] = EOS;
			vehicle_drug_data[vehicleid][i][veh_drug_id] = 0;
		    vehicle_drug_data[vehicleid][i][veh_drug_amount] = 0;
		    vehicle_drug_data[vehicleid][i][is_exist] = false;
			remove_count++;
		}
	}

	SendClientMessageEx(playerid, COLOR_ADM, "AdmCmd: %i numaralý aracýn %i adet uyuþturucusu silindi.", vehicleid, remove_count);
	LogAdminAction(playerid, sprintf("%i (DBID: %i) numaralý aracýn %i adet uyuþturucusunu sildi.", vehicleid, CarData[vehicleid][carID], remove_count));
	return 1;
}

LogAdminAction(playerid, logstr[], bool:rettime = true)
{
	if(!pLoggedIn[playerid])
	{
		return 0;
	}

	if(rettime == true)
	{
    	getdate(year, month, day);
		gettime(hour, minute, second);
	}

	new adminlog_query[756];
	mysql_format(m_Handle, adminlog_query, sizeof(adminlog_query), "INSERT INTO admin_logs (admin_dbid, log_detail, time) VALUES(%i, '%e', %i)", PlayerData[playerid][pSQLID], logstr, mktime(hour, minute, second, day, month, year));
	mysql_tquery(m_Handle, adminlog_query, "", "");
	return 1;
}

CMD:afrisk(playerid, params[])
{
    if(PlayerData[playerid][pAdmin] < 1) return 0;

    static playerb;
	if(sscanf(params, "u", playerb))
		return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: {FFFFFF}/afrisk [oyuncu ID/isim]");

	if(!IsPlayerConnected(playerb))
		return SendErrorMessage(playerid, "Belirtilen oyuncu ID veya isim aktif deðil.");

	if(!pLoggedIn[playerb])
		return SendErrorMessage(playerid, "Bu oyuncu henüz giriþ yapmamýþ.");

	Frisk_ReturnData(playerid, playerb);
    return 1;
}

CMD:flymode(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	if(FlyMode[playerid]) CancelFlyMode(playerid);
	else StartFlyMode(playerid);
	return 1;
}

CMD:aduty(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	if (!PlayerData[playerid][pAdminDuty])
	{
		PlayerData[playerid][pAdminDuty] = true;
	    LogAdminAction(playerid, "Ýþbaþýna geçti.");
		SendAdminMessage(COLOR_YELLOW, sprintf("AdmCmd: %s isimli yönetici iþbaþýna geçti.", ReturnName(playerid, 1)));

		GetPlayerHealth(playerid, oldHealth[playerid]);
		SetPlayerColor(playerid, COLOR_ADMIN);

		foreach (new i : Player) if (PlayerData[i][pMaskOn]) ShowPlayerNameTagForPlayer(playerid, i, 1);
	}
	else
	{
	    LogAdminAction(playerid, "Ýþbaþýndan çýktý.");
		SendAdminMessage(COLOR_YELLOW, sprintf("AdmCmd: %s isimli yönetici iþbaþýndan çýktý.", ReturnName(playerid, 1)));
		PlayerData[playerid][pAdminDuty] = false;

		if (PlayerData[playerid][pLAWduty])
			SetPlayerColor(playerid, COLOR_COP);
		else if (PlayerData[playerid][pTesterDuty])
			SetPlayerColor(playerid, COLOR_TESTER);
		else if (StartedTaxiJob[playerid])
			SetPlayerColor(playerid, COLOR_TAXIDUTY);
		else
			SetPlayerColor(playerid, COLOR_WHITE);

		foreach (new i : Player) if (PlayerData[i][pMaskOn]) ShowPlayerNameTagForPlayer(playerid, i, 0);
		SetPlayerHealth(playerid, oldHealth[playerid]);
	}
	return 1;
}

CMD:checkmask(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	new
		query[128], primary, sub;

	if(sscanf(params, "ii", primary, sub))
		return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /checkmask [sayý] [sayý] (örnek: /checkmask 40404 21)");

	if(primary < 200000 || sub < 40)
		return SendClientMessage(playerid, COLOR_ADM, "SERVER: Sunucuda bulunmasý imkansýz maske numaralarý girdin.");

	mysql_format(m_Handle, query, sizeof(query), "SELECT Name FROM players WHERE MaskID = %i AND MaskIDEx = %i LIMIT 1", primary, sub);
	new Cache:cache = mysql_query(m_Handle, query);

	if(!cache_num_rows())
	{
		cache_delete(cache);
		SendClientMessageEx(playerid, COLOR_ADM, "[-] [Maskeli %d_%d] veritabanýnda bulunamadý.", primary, sub);
		return 1;
	}

	new Name[60];
	cache_get_value_name(0, "Name", Name);
	SendClientMessageEx(playerid, COLOR_ADM, "[+] [Maskeli %d_%d] '%s' tarafýndan kullanýlýyor.", primary, sub, Name);
	cache_delete(cache);

	LogAdminAction(playerid, sprintf("%d %d numaralarýyla maske kontrolü yaptý.", primary, sub));
	return 1;
}

CMD:ipsys(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	new user[16];
	if(sscanf(params, "s[16]", user)) return SendClientMessage(playerid, COLOR_RED, "SERVER: /ipsys [ip adresi]");
	if(!DoesIPExist(user)) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bu IP adresi veritabanýmýzda bulunamadý.");

	new query[256];
	mysql_format(m_Handle, query, sizeof(query), "SELECT Name FROM players WHERE LastIP = '%e' AND RegisterIP = '%e' OR LastIP = '%e' OR RegisterIP = '%e'", user, user, user, user);
	new Cache:cache = mysql_query(m_Handle, query);

	SendClientMessageEx(playerid, COLOR_GOLD, "* %s isimli oyuncunun IP'si ile iliþkili hesaplara bakýyorsun.", user);

	new player_name[24];
	for(new i = 0; i < cache_num_rows(); i++)
	{
		cache_get_value_name(i, "Name", player_name, 24);
		SendClientMessageEx(playerid, COLOR_GOLD, "** %s", player_name);
	}

	cache_delete(cache);
	//LogAdminAction(playerid, sprintf("%s IP'sinin kontrolünü yaptý.", user));
	return 1;
}

CMD:adminsys(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	new user[60], type[30], query[256];
	if(sscanf(params, "s[60]s[30]", user, type)) return SendClientMessage(playerid, COLOR_RED, "SERVER: /adminsys [isim_soyisim] [detay, aka]");
	if(!ReturnSQLFromName(user)) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Girdiðin isimle alakalý bir kayýt bulunamadý.");
	if(!strcmp(type, "detay"))
	{
		SendClientMessageEx(playerid, COLOR_GOLD, "* %s isimli oyuncunun verilerine bakýyorsun.", user);

		mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM players WHERE id = %i", ReturnSQLFromName(user));
		new Cache:cache = mysql_query(m_Handle, query);

		new RegisterIP[16], ActiveIP[16];
		cache_get_value_name(0, "LastIP", ActiveIP);
		cache_get_value_name(0, "RegisterIP", RegisterIP);

		new Money, Bank, Levelx, Exp;
		cache_get_value_name_int(0, "Money", Money);
		cache_get_value_name_int(0, "Bank", Bank);
		cache_get_value_name_int(0, "Level", Levelx);
		cache_get_value_name_int(0, "Exp", Exp);

		new MaskID, MaskIDEx, Adminjailed, MaxHealth;
		cache_get_value_name_int(0, "MaskID", MaskID);
		cache_get_value_name_int(0, "MaskIDEx", MaskIDEx);
		cache_get_value_name_int(0, "Adminjailed", Adminjailed);
		cache_get_value_name_int(0, "MaxHealth", MaxHealth);

		new Crashed;
		cache_get_value_name_int(0, "Crashed", Crashed);

		new LastConnection[90], LastConnectLength;
		cache_get_value_name(0, "LastConnection", LastConnection);
		cache_get_value_name_int(0, "LastConnectLength", LastConnectLength);

		new Float: LastHealth, Float: LastArmor;
		cache_get_value_name_float(0, "LastHealth", LastHealth);
		cache_get_value_name_float(0, "LastArmor", LastArmor);

		new Phone, BurnerPhone;
		cache_get_value_name_int(0, "Phone", Phone);
		cache_get_value_name_int(0, "BurnerPhoneNumber", BurnerPhone);

		new HWID[90];
		cache_get_value_name(0, "HWID", HWID);
		cache_delete(cache);

		SendClientMessageEx(playerid, COLOR_GRAD2, "Kayýtlý IP:[%s] Son IP:[%s]", RegisterIP, ActiveIP);
		SendClientMessageEx(playerid, COLOR_GRAD1, "Para:[$%s] Banka:[$%s]", MoneyFormat(Money), MoneyFormat(Bank));
		SendClientMessageEx(playerid, COLOR_GRAD2, "Level:[%i] EXP: [%i] MaskID:[%d_%d] Maks Can:[%i/150] Admin Hapisinde:[%s]", Levelx, Exp, MaskID, MaskIDEx, MaxHealth, (Adminjailed != 1) ? ("Hayýr") : ("Evet"));
		SendClientMessageEx(playerid, COLOR_GRAD1, "Son Zýrh:[%.2f] Son Can:[%.2f] Telefon:[%i] Yedek Telefon:[%i]", LastArmor, LastHealth, Phone, BurnerPhone);

		SendClientMessageEx(playerid, COLOR_GRAD2, "Son Giriþ Crash Durumu:[%s] Son Giriþ:[%s]", (Crashed != 1) ? ("Hayýr") : ("Evet"), LastConnection);
		SendClientMessageEx(playerid, COLOR_GRAD1, "Son Giriþ Uzunluðu:[%i dakika]", LastConnectLength);

		mysql_format(m_Handle, query, sizeof(query), "SELECT id FROM bans WHERE ban_name = '%e'", user);
		mysql_tquery(m_Handle, query, "CheckNameForBan", "is", playerid, user);

		mysql_format(m_Handle, query, sizeof(query), "SELECT id, Name FROM `bans` WHERE `IP` = '%e' AND `HWID` = '%e' OR `HWID` = '%e' OR `IP` = '%e'", ActiveIP, HWID, HWID, ActiveIP);
		mysql_tquery(m_Handle, query, "OnBanCheck", "is", playerid, user);

		/*mysql_format(m_Handle, query, sizeof(query), "SELECT weapon_id, ammo FROM player_weapons WHERE player_dbid = %i", ReturnSQLFromName(user));
		mysql_tquery(m_Handle, query, "OnWeaponsCheck", "i", playerid);*/
	}
	else if(!strcmp(type, "aka"))
	{
		SendClientMessageEx(playerid, COLOR_GOLD, "* %s isimli oyuncuyla iliþkili hesaplara bakýyorsun.", user);
		mysql_format(m_Handle, query, sizeof(query), "SELECT LastIP FROM players WHERE id = %i", ReturnSQLFromName(user));
		mysql_tquery(m_Handle, query, "OnListAccounts", "is", playerid, user);
	}
	else return SendClientMessage(playerid, COLOR_ADM, "SERVER: Geçersiz parametre.");
	return 1;
}

CMD:playercheck(playerid, params[])
{
	if(!PlayerData[playerid][pTester] && !PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	static id;
	if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /playercheck [oyuncu ID/adý]");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	if(PlayerData[id][pAdmin]) return SendErrorMessage(playerid, "Yöneticileri kontrol edemezsin.");


	SendClientMessage(playerid, COLOR_RED, "UYARI: Yeni kaydedilmiþ olmalarý durumunda, verileri henüz veritabanýnda olmayabilir ve sonuç çýkarmayabilir.");
	SendClientMessage(playerid, COLOR_DARKGREEN, "___________________________________");
	SendClientMessageEx(playerid, COLOR_ADM, "Oyuncu Adý: [%s]", ReturnName(id));

	new query[256];
	mysql_format(m_Handle, query, sizeof(query), "SELECT id, ban_name FROM bans WHERE ban_ip = '%e' AND ban_name = '%e' OR ban_ip = '%e' AND ban_name = '%e'", PlayerData[id][pLastIP], ReturnName(id, 1), PlayerData[id][pRegIP], ReturnName(id, 1));
	new Cache:cache = mysql_query(m_Handle, query);

	if(!cache_num_rows()) {
		SendClientMessageEx(playerid, COLOR_GOLD, "[-] %s yasaklanmýþ hiç bir hesapla iliþkisi bulunamadý.", ReturnName(id));
		cache_delete(cache);
		return 1;
	}

    new
    	ban_id, found_name[25];

	for(new i = 0, j = cache_num_rows(); i < j; i++)
	{
		cache_get_value_name_int(i, "id", ban_id); cache_get_value_name(i, "ban_name", found_name, 25);
		SendClientMessageEx(playerid, COLOR_RED, "[+] %s daha önce yasaklanmýþ %s hesabýyla iliþkisi bulundu. (Ban ID: %i)", ReturnName(id), found_name, ban_id);
	}

	cache_delete(cache);
	return 1;
}

/*CMD:yedek(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 5) return 0;

	new a_string[60], b_string[128], string[128];

	if(sscanf(params, "s[60]S()[128]", a_string, b_string))
	{
		SendUsageMessage(playerid, "/yedek [parametre]");
		SendClientMessage(playerid, COLOR_ADM, "[parametre] players, playerid, properties, property_id, factions");
		SendClientMessage(playerid, COLOR_ADM, "[parametre] isyerleri, garages, garage_id, ALL");
		return true;
	}

	if(!strcmp(a_string, "players"))
	{
		foreach(new i : Player)
		{
			if(pLoggedIn[i])
			{
				Player_Save(i);
			}
		}

		adminWarn(5, sprintf("%s tüm aktif karakterleri veritabanýna kaydetti.", ReturnName(playerid, 1)));
	}
	else if(!strcmp(a_string, "playerid"))
	{
		new playerb;
		if(sscanf(b_string, "u", playerb)) return SendUsageMessage(playerid, "/backup playerid [oyuncu ID/isim]");
		if(!IsPlayerConnected(playerb)) return SendErrorMessage(playerid, "65534 is not an active player.");
		if(!pLoggedIn[playerb]) return SendErrorMessage(playerid, "Bu oyuncu giriþ yapmamýþ.");

		Player_Save(playerb);
		adminWarn(5, sprintf("%s, %s isimli karakterin bilgilerini veritabanýna kaydetti.", ReturnName(playerid, 1), ReturnName(playerb, 1)));
	}
	else if(!strcmp(a_string, "properties"))
	{
		new confirm[60];

		if(sscanf(b_string, "s[60]", confirm))
		{
			SendClientMessage(playerid, COLOR_ADM, "You're about to backup all properties that are loaded.");
			SendClientMessage(playerid, COLOR_ADM, "This could lag the server for a few seconds. Type /backup properties confirm to continue.");
			return 1;
		}

		if(!strcmp(b_string, "confirm"))
		{
			for(new i = 0; i < MAX_PROPERTY; i++) if(Bit_Get(g_PropertyFlags[i], propertyExist))
			{
				SaveProperty(i);
			}

			adminWarn(1, sprintf("%s sunucudaki tüm evlerin yedeðini aldý.", ReturnName(playerid, 1)));
		}
		else return SendClientMessage(playerid, COLOR_ADM, "SERVER: Geçersiz Parametre.");
	}
	else if(!strcmp(a_string, "property_id"))
	{
		new p_id;

		if(sscanf(b_string, "d", p_id)) return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /backup property_id [property id]");
		if(p_id > MAX_PROPERTY || !Bit_Get(g_PropertyFlags[p_id], propertyExist))return SendClientMessage(playerid, COLOR_ADM, "ERROR: You specified an invalid property.");

		SaveProperty(p_id);

		format(string, sizeof(string), "%s backed up property ID %d", ReturnName(playerid, 1), p_id);
		adminWarn(2, string);
	}
	else if(!strcmp(a_string, "factions"))
	{
		new confirm[60];

		if(sscanf(b_string, "s[60]", confirm))
		{
			SendClientMessage(playerid, COLOR_ADM, "You're about to backup all factions that are loaded.");
			SendClientMessage(playerid, COLOR_ADM, "Type /backup factions confirm to continue.");
			return 1;
		}

		if(!strcmp(b_string, "confirm"))
		{
			for(new i = 0; i < MAX_FACTIONS; i++) if(FactionData[i][factionExists])
			{
				SaveFaction(i);
			}
			adminWarn(2, sprintf("%s backed up all factions.", ReturnName(playerid, 1)));
		}
		else return SendClientMessage(playerid, COLOR_ADM, "SERVER: Geçersiz Parametre.");
	}
	else if(!strcmp(a_string, "isyerleri"))
	{
		SaveBusinesses();
		adminWarn(2, sprintf("%s tüm iþyerlerinin yedeklerini aldý."));
		return 1;
	}
	else if(!strcmp(a_string, "garages"))
	{
		new confirm[60];

		if(sscanf(b_string, "s[60]", confirm))
		{
			return SendClientMessage(playerid, COLOR_ADM, "Type /backup garages confirm to continue.");
		}

		if(!strcmp(b_string, "confirm"))
		{
			for(new i = 0; i < MAX_PROPERTY_GARAGES; i++) if(Bit_Get(g_GarageFlags[i], garageExist))
			{
				SavePropertyGarage(i);
			}

			adminWarn(2, sprintf("%s backed up all exist property garages.", ReturnName(playerid, 1)));
		}
		else return SendClientMessage(playerid, COLOR_ADM, "SERVER: Geçersiz parametre.");
	}
	else if(!strcmp(a_string, "garage_id"))
	{
		new g_id;

		if(sscanf(b_string, "d", g_id))return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /backup garage_id [garage id]");
		if(g_id > MAX_PROPERTY_GARAGES || !Bit_Get(g_GarageFlags[g_id], garageExist))return SendClientMessage(playerid, COLOR_ADM, "ERROR: You specified an invalid garage.");

		SavePropertyGarage(g_id);

		format(string, sizeof(string), "%s backed up property garage %i.", ReturnName(playerid, 1), g_id);
		adminWarn(2, string);
	}
	else if(!strcmp(a_string, "all"))
	{
		new confirm[60];

		if(sscanf(b_string, "s[60]", confirm))
		{
			SendClientMessage(playerid, COLOR_ADM, "You're about to backup all server data. This could lag the server for a few seconds.");
			SendClientMessage(playerid, COLOR_ADM, "Type /backup ALL confirm to continue.");
			return true;
		}

		if(!strcmp(b_string, "confirm"))
		{
			foreach(new i : Player) if(pLoggedIn[i])
			{
				Player_Save(i);
			}

			SaveProperties();
			SaveFactions();
			SaveBusinesses();
			SaveTolls();
			SavePaynSprays();
			SaveDoors();
			SavePropertyGarages();
			SaveIndustries();

			format(string, sizeof(string), "%s backed up the server data.", ReturnName(playerid, 1));
			SendClientMessageToAll(COLOR_ADM, string);
		}
		else return SendClientMessage(playerid, COLOR_ADM, "SERVER: Geçersiz Parametre.");
	}
	else return SendClientMessage(playerid, COLOR_ADM, "SERVER: Geçersiz Parametre.");
	return true;
}*/

CMD:setdonator(playerid, params[])
{
	if(!pLoggedIn[playerid])return true;
	if(PlayerData[playerid][pAdmin] < 5)return false;

	new playerb, donator, levelString[45], string[128];

	if(sscanf(params, "ui", playerb, donator))return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /setdonator [oyuncuID/isim] [0-4]");
	if(!IsPlayerConnected(playerb))return SendClientMessage(playerid, COLOR_GREY, "Girdiðin oyuncu ID veya isim aktif deðil.");
	if(!pLoggedIn[playerb])return SendClientMessage(playerid, COLOR_GREY, "You have specified a player that isn't logged in.");
	if(donator < 0 || donator > 4) return SendClientMessage(playerid, COLOR_ADM, "Invalid Donator ID.");

	PlayerData[playerb][pDonator] = donator;
	SaveSQLInt(PlayerData[playerb][pSQLID], "players", "Donator", PlayerData[playerb][pDonator]);

	if(donator == 0){
		format(string, sizeof(string), "SERVER: You took away %s's donator level", ReturnName(playerb, 1));
		SendClientMessage(playerid, COLOR_YELLOW, string);
	}
	else{
		format(string, sizeof(string), "SERVER: You upgraded %s to a %s", ReturnName(playerb, 1), levelString);
		SendClientMessage(playerid, COLOR_YELLOW, string);
	}

	//WriteLog("admin_logs/kane/setdonator.txt", "[%s] %s made %s a level %d donator", ReturnDate(), ReturnName(playerid, 1), ReturnName(playerb, 1), donator);
	return true;
}

// Admin Commands
CMD:makeadmin(playerid, params[]) return cmd_setadmin(playerid, params);
CMD:setadmin(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 6) return UnAuthMessage(playerid);

	static id, level;
	if(sscanf(params, "ui", id, level)) return SendUsageMessage(playerid, "/setadmin [oyuncu ID/adý] [seviye]");
	if(playerid == id) return SendErrorMessage(playerid, "Bu komutu kendi üstünde kullanmazsýn.");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	if(level < 0) return SendErrorMessage(playerid, "Seviye sýfýrdan az olamaz.");

	if(PlayerData[id][pAdmin] == level)
	{
	   	SendErrorMessage(playerid, "%s(%i) seviyesi zaten %i olarak ayarlý!", ReturnName(id, 1), id, level);
		return 1;
	}

	PlayerData[id][pAdmin] = level;
	SaveSQLInt(PlayerData[id][pSQLID], "players", "AdminLevel", level);
	SendAdminMessageEx(COLOR_ADM, "AdmCmd: %s isimli yönetici %s isimli oyuncuyu %i seviyesine %s.", ReturnName(playerid), ReturnName(id), level, (level > PlayerData[id][pAdmin]) ? "düþürdü" : "yükseltti");
	return 1;
}

CMD:settester(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 6) return UnAuthMessage(playerid);

	static id;
	if(sscanf(params, "u", id)) return SendUsageMessage(playerid, "/settester [oyuncu ID/isim]");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");

	if (!PlayerData[id][pTester])
	{
		SendAdminMessage(COLOR_ADM, sprintf("AdmCmd: %s isimli oyuncu %s tarafýndan tester ekibine dahil edildi.", ReturnName(id, 1), ReturnName(playerid, 1)));
		PlayerData[id][pTester] = true;
	}
	else
	{
		SendAdminMessage(COLOR_ADM, sprintf("AdmCmd: %s isimli tester %s tarafýndan tester ekibinden çýkarýldý.", ReturnName(id, 1), ReturnName(playerid, 1)));

		if (PlayerData[id][pTesterDuty]) {
			PlayerData[id][pTesterDuty] = false;
			SetPlayerColor(id, COLOR_WHITE);
		}
		PlayerData[id][pTester] = false;
	}
	return 1;
}

CMD:a(playerid, params[]) return cmd_admin(playerid, params);
CMD:admin(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);
	if(isnull(params)) return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /admin [mesaj]");

	if(strlen(params) > 84)
	{
   		SendAdminMessageEx(COLOR_YELLOW, "*Admin[%i] %s (%s): %.84s...", PlayerData[playerid][pAdmin], ReturnName(playerid, 1), PlayerData[playerid][pAdminName], params);
		SendAdminMessageEx(COLOR_YELLOW, "...%s", params[84]);
	}
	else SendAdminMessageEx(COLOR_YELLOW, "*Admin[%i] %s (%s): %s", PlayerData[playerid][pAdmin], ReturnName(playerid, 1), PlayerData[playerid][pAdminName], params);

	//WriteLog("admin_logs/adminchat_log.txt", "[%s] %s: %s", ReturnDate(), ReturnName(playerid, 1), params);
	return true;
}

CMD:goto(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	static id;
	if(sscanf(params, "u", id)) return SendUsageMessage(playerid, "/goto [oyuncu ID/adý]");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	if(GetPlayerState(id) == PLAYER_STATE_SPECTATING) return SendErrorMessage(playerid, "Belirttiðiniz kiþi birini izliyor.");

	new Float: x, Float: y, Float: z, Float: a;
	GetPlayerPos(id, x, y, z); GetPlayerFacingAngle(id, a);
	SendPlayer(playerid, x + 1.0, y, z, a, GetPlayerInterior(id), GetPlayerVirtualWorld(id));
	SendClientMessageEx(playerid, COLOR_GREY, "SERVER: %s isimli oyuncunun yanýna ýþýnlandýn.", ReturnName(id));

	PlayerData[playerid][pInsideHouse] = PlayerData[id][pInsideHouse];
	PlayerData[playerid][pInsideBusiness] = PlayerData[id][pInsideBusiness];
	PlayerData[playerid][pInsideComplex] = PlayerData[id][pInsideComplex];
	PlayerData[playerid][pInsideApartment] = PlayerData[id][pInsideApartment];
	PlayerData[playerid][pInsidePNS] = PlayerData[id][pInsidePNS];
	PlayerData[playerid][pInsideDoor] = PlayerData[id][pInsideDoor];
	PlayerData[playerid][pInsideGarage] = PlayerData[id][pInsideGarage];
	PlayerData[playerid][pInsideEntrance] = PlayerData[id][pInsideEntrance];
	return 1;
}

CMD:gethere(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	static id;
	if(sscanf(params, "u", id)) return SendUsageMessage(playerid, "/gethere [oyuncu ID/isim]");
	if(!IsPlayerConnected(id)) return SendServerMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendServerMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	if(PlayerData[id][pAdmin] > PlayerData[playerid][pAdmin]) return SendServerMessage(playerid, "Belirttiðiniz kiþiyi yanýna getirme yetkin yok.");
    if(EditingObject[id] != 0) return SendServerMessage(playerid, "Belirttiðiniz kiþi herhangi bir objeyi düzenliyor.");
	if(GetPlayerState(id) == PLAYER_STATE_SPECTATING) return SendErrorMessage(playerid, "Belirttiðiniz kiþi birini izliyor.");

	new Float: x, Float: y, Float: z, Float: a;
	GetPlayerPos(playerid, x, y, z); GetPlayerFacingAngle(playerid, a);
	SendPlayer(id, x + 1.0, y, z, a, GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid));
	SendClientMessageEx(id, COLOR_GREY, "SERVER: %s seni yanýna ýþýnladý.", ReturnName(playerid));

	PlayerData[id][pInsideHouse] = PlayerData[playerid][pInsideHouse];
	PlayerData[id][pInsideBusiness] = PlayerData[playerid][pInsideBusiness];
	PlayerData[id][pInsideComplex] = PlayerData[playerid][pInsideComplex];
	PlayerData[id][pInsideApartment] = PlayerData[playerid][pInsideApartment];
	PlayerData[id][pInsidePNS] = PlayerData[playerid][pInsidePNS];
	PlayerData[id][pInsideDoor] = PlayerData[playerid][pInsideDoor];
	PlayerData[id][pInsideGarage] = PlayerData[playerid][pInsideGarage];
	PlayerData[id][pInsideEntrance] = PlayerData[playerid][pInsideEntrance];
	return 1;
}

CMD:editplayer(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4)
		return UnAuthMessage(playerid);

  new id, option[32], str[64];

  if(sscanf(params, "ds[32]S()[64]", id, option, str))
  {
  	SendUsageMessage(playerid, "/editplayer [ID] [seçenek]");
  	SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ekle, sil");
  	return 1;
  }

  if(!IsPlayerConnected(id)) return SendServerMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
  if(!pLoggedIn[id]) return SendServerMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");

  return 1;
}

CMD:kick(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	new id,
		sebep[128];

	if(sscanf(params, "us[128]", id, sebep)) return SendUsageMessage(playerid, "/kick [oyuncu ID/isim] [sebep]");
	if(!IsPlayerConnected(id)) return SendServerMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendServerMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	if(PlayerData[id][pAdmin] > PlayerData[playerid][pAdmin]) return SendServerMessage(playerid, "Belirttiðiniz kiþiyi oyundan atma yetkin yok.");

	if(strlen(sebep) > 55)
	{
		SendMessageToAllKick(COLOR_ADM, "AdmCmd: %s isimli oyuncu %s tarafýndan atýldý. Sebep: %.55s", ReturnName(id, 1), ReturnName(playerid, 1), sebep);
		SendMessageToAllKick(COLOR_ADM, "AdmCmd: ...%s", sebep[55]);
	}
	else SendMessageToAllKick(COLOR_ADM, "AdmCmd: %s isimli oyuncu %s tarafýndan atýldý. Sebep: %s", ReturnName(id, 1), ReturnName(playerid, 1), sebep);

	/*for(new i = 1; i < MAX_ADMIN_NOTES; i++)
	{
		if(aNotesData[id][i][anote_SQLID] != 0)
		{
			if(aNotesData[id][i][anote_active])
			{
				if(strlen(aNotesData[id][i][anote_reason]) > 45)
				{
				    SendAdminWarnMessageEx(COLOR_YELLOW, 1, "%s isimli oyuncu %d adet aktif yönetici notuna sahipti, sonuncusu: %.45s", ReturnName(id, 1), CountAdminNotes(id), aNotesData[id][i][anote_reason]);
				    SendAdminWarnMessageEx(COLOR_YELLOW, 1, "...%s", aNotesData[id][i][anote_reason][45]);
				}
				else SendAdminWarnMessageEx(COLOR_YELLOW, 1, "%s %d adet aktif yönetici notuna sahipti, sonuncusu: %s", ReturnName(id, 1), CountAdminNotes(id), aNotesData[id][i][anote_reason]);
			}
		}
	}
	*/

	new
		query[256];

	mysql_format(m_Handle, query, sizeof(query), "INSERT INTO log_kicks (Name, Reason, KickedBy, Date, IP) VALUES('%e', '%e', '%e', %i, '%e')", ReturnName(id, 1), sebep, ReturnName(playerid, 1), Time(), ReturnIP(id));
	mysql_tquery(m_Handle, query);

	KickEx(id);
	return 1;
}

/*CMD:offlineajail(playerid, params[])
{
	if(!pLoggedIn[playerid])return true;
	if(!PlayerData[playerid][pAdmin])return UnAuthMessage(playerid);

	new playerb[30], minutes, reason[128], query[128];
	if(sscanf(params, "s[30]ds[128]", playerb, minutes, reason))return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /offlineajail [Firstname_Lastname] [time] [reason]");
	if(minutes < 1)return SendClientMessage(playerid, COLOR_GREY, "You can't admin jail a player for under 1 minute.");

	PlayerData[playerid][pSetTime] = minutes;
	format(PlayerData[playerid][pSetReason], 128, "%s", reason);

	mysql_format(m_Handle, query, sizeof(query), "SELECT Name, OfflineAjail, AjailTime, OfflineAjailReason FROM `players` WHERE Name = '%e'", playerb);
	mysql_pquery(m_Handle, query, "SQL_OnOfflineJail", "i", playerid);

	return true;
}*/

CMD:ajail(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	new id, minutes, reason[128];

	if(sscanf(params, "uds[128]", id, minutes, reason)) return SendUsageMessage(playerid, "/ajail [oyuncu ID/isim] [dakika] [sebep]");
	if(!IsPlayerConnected(id)) return SendServerMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendServerMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	if(PlayerData[id][pAdmin] > PlayerData[playerid][pAdmin]) return SendServerMessage(playerid, "Belirttiðiniz kiþiyi hapise atma yetkin yok.");
	if(minutes < 1) return SendServerMessage(playerid, "Belirtilen dakika deðeri en az 1 olabilir.");

	ResetHouseVar(id); TakePlayerGuns(id); ClearAnimations(id);
	SetPlayerPos(id, 2578.929931, 2658.771728, 10.820312);
	SetPlayerVirtualWorld(id, 1338);

	PlayerData[id][pAjailed] = true;
	PlayerData[id][pAjailTime] = minutes * 60;

    if (EditingObject[playerid] != 0)
    {
		EditingObject[playerid] = 0;
		EditingID[playerid] = 0;
        CancelEdit(playerid);
    }

	if(InTaxiRide[id])
	{
		foreach(new i : Player) if(PlayerData[i][pSQLID] == TaxiDriver[id])
		{
			SendClientMessage(i, COLOR_YELLOW, "-> Taksindeki kiþi hapise atýldýðý için sürüþ iptal edildi.");
		}

		EndTaxiFair(id);
	}

	if(StartedTaxiJob[id] && TaxiFairStarted[id])
	{
		foreach(new i : Player) if(TaxiDriver[i] == PlayerData[id][pSQLID])
		{
			SendClientMessage(i, COLOR_YELLOW, "-> Taksi þoförün hapise atýldýðý için sürüþ iptal edildi.");
			EndTaxiFair(i);
		}

		EndTaxiFairDriver(id);
	}

	if(strlen(reason) > 45)
	{
		SendMessageToAll(COLOR_ADM, "AdmCmd: %s isimli oyuncu %s tarafýndan %d dakika hapise atýldý. Sebep: %.45s", ReturnName(id, 1), ReturnName(playerid, 1), minutes, reason);
		SendMessageToAll(COLOR_ADM, "AdmCmd: ...%s", reason[45]);
	}
	else SendMessageToAll(COLOR_ADM, "AdmCmd: %s isimli oyuncu %s tarafýndan %d dakika hapise atýldý. Sebep: %s", ReturnName(id, 1), ReturnName(playerid, 1), minutes, reason);

	/*for(new i = 1; i < MAX_ADMIN_NOTES; i++)
	{
		if(aNotesData[id][i][anote_SQLID] != 0)
		{
			if(aNotesData[id][i][anote_active])
			{
				if(strlen(aNotesData[id][i][anote_reason]) > 45)
				{
    				SendAdminWarnMessageEx(COLOR_YELLOW, 1, "%s isimli oyuncu %d adet aktif yönetici notuna sahipti, sonuncusu: %.45s", ReturnName(id, 1), CountAdminNotes(id), aNotesData[id][i][anote_reason]);
				    SendAdminWarnMessageEx(COLOR_YELLOW, 1, "...%s", aNotesData[id][i][anote_reason][45]);
				}
				else SendAdminWarnMessageEx(COLOR_YELLOW, 1, "%s %d adet aktif yönetici notuna sahipti, sonuncusu: %s", ReturnName(id, 1), CountAdminNotes(id), aNotesData[id][i][anote_reason]);
			}
		}
	}*/

	new
		query[256];

	mysql_format(m_Handle, query, sizeof(query), "INSERT INTO log_ajail (Name, Reason, JailedBy, Date, Time, IP) VALUES('%e', '%e', '%e', %i, %i, '%e')", ReturnName(id, 1), reason, ReturnName(playerid, 1), Time(), minutes, ReturnIP(id));
	mysql_tquery(m_Handle, query);
	return 1;
}

CMD:unjail(playerid, params[]) return cmd_release(playerid, params);
CMD:aunjail(playerid, params[]) return cmd_release(playerid, params);
CMD:release(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	static
 		playerb;

	if(sscanf(params, "u", playerb)) return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /release [oyuncuID/isim]");
	if(!IsPlayerConnected(playerb))return SendErrorMessage(playerid, "Girdiðin oyuncu ID veya adý aktif deðil.");
	if(!pLoggedIn[playerb])return SendClientMessage(playerid, COLOR_GREY, "Bu oyuncu giriþ yapmamýþ.");
	if(!PlayerData[playerb][pAjailed] && !PlayerData[playerid][pICJailed])return SendClientMessage(playerid, COLOR_GREY, "That player isn't in admin jail or jail.");

	if(PlayerData[playerb][pAjailed])
	{
		SendMessageToAll(COLOR_ADM, "AdmCmd: %s isimli oyuncu %s tarafýndan yönetici hapsinden çýkartýldý.", ReturnName(playerb, 1), ReturnName(playerid, 1));

		PlayerData[playerb][pAjailed] = false;
		PlayerData[playerb][pAjailTime] = 0;

    SendPlayer(playerb, 1553.0421, -1675.4706, 16.1953, 90.0, 0, 0);
		return 1;
	}

	if(PlayerData[playerb][pICJailed])
	{
		SendMessageToAll(COLOR_ADM, "AdmCmd: %s isimli oyuncu %s tarafýndan hapisten çýkartýldý.", ReturnName(playerb, 1), ReturnName(playerid, 1));

		PlayerData[playerb][pICJailTime] = 0;
		PlayerData[playerb][pICJailed] = 0;
		PlayerData[playerb][pICJailNotify] = 0;

		DestroyDynamic3DTextLabel(PlayerData[playerb][pICJail3D]);
		TotalJailees--;

		SendPlayer(playerb, 115.8277,2000.6102,19.4430,359.5372, 0, 0);
		SendClientMessage(playerb, COLOR_GREY, "SERVER: Topluma olan borcunu ödedin.");
		return 1;
	}

	//WriteLog("admin_logs/punishments/release_log.txt", "[%s] %s released %s from admin jail", ReturnDate(), ReturnName(playerid, 1), ReturnName(playerb, 1));
	return true;
}

CMD:setint(playerid, params[])
{
	if(!pLoggedIn[playerid])return true;
	if(!PlayerData[playerid][pAdmin])return UnAuthMessage(playerid);

	new playerb, interior, string[128];

	if(sscanf(params, "ui", playerb, interior))
		return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /setint [oyuncuID/isim] [interiorid]");

	if(!IsPlayerConnected(playerb))return SendClientMessage(playerid, COLOR_GREY, "Girdiðin oyuncu ID veya isim aktif deðil.");
	if(!pLoggedIn[playerb])return SendClientMessage(playerid, COLOR_GREY, "Bu oyuncu giriþ yapmamýþ.");

	SetPlayerInterior(playerb, interior);

	format(string, sizeof(string), "AdmCmd: %s set %s's interior to %d", ReturnName(playerid, 1), ReturnName(playerb, 1), interior);
	SendClientMessage(playerid, COLOR_GREY, string);

	if(playerb != playerid){
		format(string, sizeof(string), "AdmCmd: %s set %s's interior to %d", ReturnName(playerid, 1), ReturnName(playerb, 1), interior);
		SendClientMessage(playerb, COLOR_GREY, string);
	}

	return true;
}

CMD:setworld(playerid, params[])
{
	if(!pLoggedIn[playerid])return true;
	if(!PlayerData[playerid][pAdmin])return UnAuthMessage(playerid);

	new playerb, world, string[128];

	if(sscanf(params, "ui", playerb, world))
		return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /setworld [oyuncuID/isim] [virtualworld]");

	if(!IsPlayerConnected(playerb))return SendClientMessage(playerid, COLOR_GREY, "Girdiðin oyuncu ID veya isim aktif deðil.");
	if(!pLoggedIn[playerb])return SendClientMessage(playerid, COLOR_GREY, "Bu oyuncu giriþ yapmamýþ.");

	SetPlayerVirtualWorld(playerb, world);

	format(string, sizeof(string), "AdmCmd: %s set %s's virtual world to %d", ReturnName(playerid, 1), ReturnName(playerb, 1), world);
	SendClientMessage(playerid, COLOR_GREY, string);

	if(playerb != playerid){
		format(string, sizeof(string), "AdmCmd: %s set %s's virtual world to %d", ReturnName(playerid, 1), ReturnName(playerb, 1), world);
		SendClientMessage(playerb, COLOR_GREY, string);
	}

	return true;
}

CMD:hackp(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 5) return UnAuthMessage(playerid);

	ShowHackPanel(playerid);
	return 1;
}

CMD:bansys(playerid, params[])
{
	new
		query[128], id;

	if(!PlayerData[playerid][pAdmin] && !PlayerData[playerid][pTester])
		return 0;

	if(isnull(params))
		return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /bansys [ban ID or username]");

	if(IsNumeric(params))
	{
		id = strval(params);

		mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM bans WHERE id = %i", id);
		mysql_tquery(m_Handle, query, "OnBanSys", "i", playerid);
	}
	else
	{
		mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM bans WHERE Name = '%e'", params);
		mysql_tquery(m_Handle, query, "OnBanSys", "i", playerid);
	}

	return 1;
}

CMD:arecord(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin])
		return 0;

	new
		str_a[30], b_str[90], query[128];

	if(sscanf(params, "s[30]s[90]", str_a, b_str))
		return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /arecord [isim] [bans, ajails, kicks]");

	if(!ReturnSQLFromName(str_a))
		return SendClientMessage(playerid, COLOR_ADM, "HATA: Belirttiðin isimde birisi yok.");

	if(!strcmp(b_str, "bans"))
	{
		mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM log_bans WHERE Name = '%e' ORDER BY id DESC", str_a);
		mysql_tquery(m_Handle, query, "OnBanLookup", "is", playerid, str_a);
	}
	else if(!strcmp(b_str, "ajails"))
	{
		mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM log_ajail WHERE Name = '%e' ORDER BY id DESC", str_a);
		mysql_tquery(m_Handle, query, "OnAjailLookup", "is", playerid, str_a);
	}
	else if(!strcmp(b_str, "kicks"))
	{
		mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM log_kicks WHERE Name = '%e' ORDER BY id DESC", str_a);
		mysql_tquery(m_Handle, query, "OnKickLookup", "is", playerid, str_a);
	}
	else return SendClientMessage(playerid, COLOR_ADM, "SERVER: Geçersiz Parametre.");
	return 1;
}

CMD:as(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin])
		return 0;

	new
		playerb,
		Float:Health,
		Float:Armor
	;

	if(sscanf(params, "u", playerb))
		return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /as [oyuncuID/isim]");

	if(!IsPlayerConnected(playerb))
		return SendClientMessage(playerid, COLOR_ADM, "SERVER: Geçersiz oyuncu belirttin.");

	if(!pLoggedIn[playerb])
		return SendClientMessage(playerid, COLOR_ADM, "SERVER: That player hasn't logged in yet.");

	GetPlayerHealth(playerb, Health); GetPlayerArmour(playerb, Armor);

	SendClientMessage(playerid, COLOR_DARKGREEN, "____________________________________________");
	SendClientMessageEx(playerid, COLOR_ADM, "Players name: %s (Packetloss: %f)", ReturnName(playerb), NetStats_PacketLossPercent(playerb));

	for(new i = 0; i < 4; i++) if(PlayerData[playerb][pWeaponsAmmo])
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "[ID: %i] Silah: [%s] - Mermi: [%i]", PlayerData[playerb][pWeapons][i], ReturnWeaponName(PlayerData[playerb][pWeapons][i]), PlayerData[playerb][pWeaponsAmmo][i]);
	}

	SendClientMessageEx(playerid, COLOR_GREY, "Interior: [%i], World: [%i] Car ID: [%i], State: [%i], Health: [%f], Armor: [%f]", GetPlayerInterior(playerb), GetPlayerVirtualWorld(playerb), _has_spawned_vehicleid[playerb], GetPlayerState(playerb), Health, Armor);
	SendClientMessageEx(playerid, COLOR_GREY, "Money out: [$%s] - Should have: [$%s] - Ajail time: [%i] Ajail: [%i] ", MoneyFormat(GetPlayerMoney(playerb)), MoneyFormat(PlayerData[playerb][pMoney]), PlayerData[playerb][pAjailTime], PlayerData[playerb][pAjailed]);
	SendClientMessageEx(playerid, COLOR_GREY, "CH1: [%i] CH2: [%i] CH3: [%i] CH4: [%i] Crashed: [%s]", PlayerData[playerb][pRadio][0], PlayerData[playerb][pRadio][1], PlayerData[playerb][pRadio][2], PlayerData[playerb][pRadio][3], (PlayerData[playerb][pCrashed] != 1) ? ("No") : ("Yes"));
	SendClientMessageEx(playerid, COLOR_GREY, "AFK Time: [%i] UserID: [%i] Last ME/DO: [%i] Skin: [%i] Mask: [%i_%i]", PlayerData[playerb][pPauseTime], PlayerData[playerb][pSQLID], gettime() - PlayerData[playerb][pLastEmoteTime], GetPlayerSkin(playerb), PlayerData[playerb][pMaskID], PlayerData[playerb][pMaskIDEx]);
	SendClientMessageEx(playerid, COLOR_GREY, "Last CMD: [%i] Last Talk:[%i] Seconds on: [%i]", gettime() - PlayerData[playerb][pLastCMDTime], gettime() - PlayerData[playerb][pLastChat], NetStats_GetConnectedTime(playerb));
	return 1;
}

/*
CMD:findweapon(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	new
		weapon_id, weapon, ammo;

	if(sscanf(params, "i", weapon_id)) return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /silahbul [silah ID]");

	SendClientMessage(playerid, COLOR_ADM, "Belirttiðiniz silahý olan oyuncular:");

	foreach(new i : Player)
	{
		for(new f = 0; f < 13; f++)
		{
			GetPlayerWeaponData(i, f, weapon, ammo);
			if(weapon == weapon_id)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "%s(ID: %i) - %s [Mermi: %d]", ReturnName(i), i, ReturnWeaponName(weapon), ammo);
			}
		}
	}
	return 1;
}
*/

CMD:arealookup(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin])
		return UnAuthMessage(playerid);

	if(isnull(params))
		return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /arealookup [name] to lookup players in that area");

	SendClientMessageEx(playerid, COLOR_ADM, "Players in the '%s' area:", params);

	foreach(new i : Player)
	{
		if(!pLoggedIn[i])
			continue;

		if(!strcmp(Player_GetLocation(i), params, true))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "%s[ID: %i] bulundu.", ReturnName(i), i);
		}
	}
	return 1;
}

CMD:nearme(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin])
		return UnAuthMessage(playerid);

	new
		Float:distance,
		Float:x,
		Float:y,
		Float:z
	;

	if(sscanf(params, "F(25.0)", distance))
		return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /nearme [distance] Default 25.0 Players near you");

	SendClientMessageEx(playerid, COLOR_ADM, "Players within %f radius of you:", distance);

	GetPlayerPos(playerid, x, y, z);
	foreach(new i : Player)
	{
		if(i == playerid)
			continue;

		if(IsPlayerInRangeOfPoint(i, distance, x, y, z))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "%s[ID: %i] maskeli: %s Car ID: %i", ReturnName(i), i, (!PlayerData[i][pMaskOn]) ? ("hayýr") : ("evet"), GetPlayerVehicleID(i));
		}
	}

	return 1;
}

CMD:vlog(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin])
		return UnAuthMessage(playerid);

	new
		vehicleid;

	if(sscanf(params, "i", vehicleid))
		return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /vlog [vehicleid]");

	if(!IsValidVehicle(vehicleid))
		return SendClientMessage(playerid, COLOR_ADM, "HATA: You specified an invalid vehicle.");

	if(!IsValidPlayerCar(vehicleid))
		return SendClientMessage(playerid, COLOR_ADM, "HATA: That isn't a valid player vehicle.");

	PlayerVlogVehicle[playerid] = vehicleid;
	ShowVehicleLogs(playerid, vehicleid, 1);
	return 1;
}

CMD:listvehicles(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin])
		return UnAuthMessage(playerid);

	new playerb;

	if(sscanf(params, "u", playerb))
		return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /listvehicles [oyuncuID/isim]");

	if(!IsPlayerConnected(playerb))
		return SendClientMessage(playerid, COLOR_ADM, "HATA: Player isn't connected.");

	if(!pLoggedIn[playerb])
		return SendClientMessage(playerid, COLOR_ADM, "HATA: Player isn't logged in.");

	SendClientMessageEx(playerid, COLOR_ADM, "Player %s[ID: %i] has vehicles:", ReturnName(playerb), playerb);

	for(new i = 1; i < MAX_OWNED_CARS; i++) if(PlayerData[playerb][pOwnedCar][i])
		SendClientMessageEx(playerid, COLOR_GREY, "Vehicle DBID : [%i]", PlayerData[playerb][pOwnedCar][i]);

	return 1;
}

/*CMD:log(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin])
		return UnAuthMessage(playerid);

	new
		playerb;

	if(sscanf(params, "u", playerb))
		return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /log [oyuncuID/isim]");

	if(!IsPlayerConnected(playerb))
		return SendClientMessage(playerid, COLOR_ADM, "HATA: Girdiðin oyuncu ID veya isim aktif deðil.");

	if(!pLoggedIn[playerb])
		return SendClientMessage(playerid, COLOR_ADM, "That player hasn't logged in yet.");

	PlayerLogPlayer[playerid] = playerb;
	ShowPlayerLogs(playerid, playerb, 1);
	return 1;
}*/

CMD:desync(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin])
		return UnAuthMessage(playerid);

	new
		playerb;

	if(sscanf(params, "u", playerb))
		return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /desync [oyuncuID/isim]");

	if(!IsPlayerConnected(playerb))
		return SendClientMessage(playerid, COLOR_ADM, "HATA: Girdiðin oyuncu ID veya isim aktif deðil.");

	if(!pLoggedIn[playerb])
		return SendClientMessage(playerid, COLOR_ADM, "That player hasn't logged in yet.");

	SendClientMessageEx(playerid, COLOR_ADM, "[!] %s is %s", ReturnName(playerb), (GetPlayerDrunkLevel(playerb) != 0) ? ("not desynced right now.") : ("DESYNCED!"));
	return 1;
}

CMD:spec(playerid, params[]) return cmd_awp(playerid, params);
CMD:awp(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	static id;
	if(sscanf(params, "u", id)) return SendUsageMessage(playerid, "/awp [oyuncu ID/isim]");
	if(id == playerid) return SendErrorMessage(playerid, "Kendini izleyemezsin.");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	if(GetPlayerState(id) == PLAYER_STATE_SPECTATING) return SendErrorMessage(playerid, "Belirttiðiniz kiþi zaten birini izliyor. (admin deðilse hile olabilir.)");

	if(GetPlayerState(playerid) != PLAYER_STATE_SPECTATING)
	{
		GetPlayerPos(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]);
		GetPlayerFacingAngle(playerid, PlayerData[playerid][pPos][3]);

		PlayerData[playerid][pInterior] = GetPlayerInterior(playerid);
		PlayerData[playerid][pWorld] = GetPlayerVirtualWorld(playerid);
	}

	if(PlayerData[id][pAdmin] > PlayerData[playerid][pAdmin]) SendClientMessageEx(id, COLOR_GREY, "SERVER: %s isimli yönetici seni izlemeye baþladý.", ReturnName(playerid));
	SendClientMessageEx(playerid, COLOR_DARKGREEN, "SERVER: %s isimli oyuncuyu izlemeye baþladýn. Ýzlemeyi kapatmak için /awpoff", ReturnName(id, 1));
	StartSpectate(playerid, id);
	return 1;
}

CMD:specoff(playerid, params[]) return cmd_awpoff(playerid, params);
CMD:awpoff(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);
	if (GetPlayerState(playerid) != PLAYER_STATE_SPECTATING) return SendErrorMessage(playerid, "Kimseyi seyretmiyorsun.");

	StopSpectate(playerid);
	return 1;
}

CMD:maskeliler(playerid, params[]) return cmd_masks(playerid, params);
CMD:masks(playerid, params[])
{
	new string[128], playerb;

	if(!pLoggedIn[playerid])return true;
	if(!PlayerData[playerid][pAdmin])return UnAuthMessage(playerid);

	if(!isnull(params) && !strcmp(params, "all", true))
	{
		new count = 0;
		foreach(new i : Player) if (PlayerData[i][pMaskOn])
		{
			format(string, sizeof(string), "%sName: %s (%d) | Mask ID: %d_%d\n", string, ReturnName(i, 1), i, PlayerData[i][pMaskID], PlayerData[i][pMaskIDEx]);
			count++;
		}

		if(!count) return ShowPlayerDialog(playerid, DIALOG_USE, DIALOG_STYLE_LIST, "Masked:", "There are NO masked players.", ">>", "");
		else ShowPlayerDialog(playerid, DIALOG_USE, DIALOG_STYLE_LIST, "Masked:", string, ">>", "");
	}

	if(sscanf(params, "d", playerb))return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /masks [oyuncuID/isim] OR `all`");
	if(!IsPlayerConnected(playerb))return SendClientMessage(playerid, COLOR_GREY, "Girdiðin oyuncu ID veya isim aktif deðil.");
	if(!pLoggedIn[playerb])return SendClientMessage(playerid, COLOR_GREY, "You have specified a player that isn't logged in.");
	SendClientMessageEx(playerid, COLOR_ADM, "-> %s (%d) is Mask %d_%d.", ReturnName(playerb, 1), playerb, PlayerData[playerb][pMaskID], PlayerData[playerb][pMaskIDEx]);
	return 1;
}

CMD:respawn(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	static id;
	if(sscanf(params, "u", id)) return SendUsageMessage(playerid, "/respawn [oyuncu ID/isim]");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");

	//format(string, sizeof(string), "%s respawned %s", ReturnName(playerid, 1), ReturnName(playerb, 1));
	//adminWarn(1, string);

	ResetHouseVar(id); SpawnPlayerIn(id);
	return 1;
}

CMD:freeze(playerid, params[])
{
	new string[128], playerb;

	if(!pLoggedIn[playerid])return true;
	if(!PlayerData[playerid][pAdmin])return UnAuthMessage(playerid);

	if(sscanf(params, "u", playerb))return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /freeze [oyuncuID/isim]");

	if(!IsPlayerConnected(playerb))return SendClientMessage(playerid, COLOR_GREY, "Girdiðin oyuncu ID veya isim aktif deðil.");
	if(!pLoggedIn[playerb])return SendClientMessage(playerid, COLOR_GREY, "You have specified a player that isn't logged in.");

	TogglePlayerControllable(playerb, false);

	format(string, sizeof(string), "AdmCmd: %s freezed %s.", ReturnName(playerid, 1), ReturnName(playerb, 1));
	SendClientMessage(playerid, COLOR_GREY, string);
	if(playerb != playerid) { SendClientMessage(playerb, COLOR_GREY, string); }

	format(string, sizeof(string), "%s froze %s", ReturnName(playerid, 1), ReturnName(playerb, 1));
	adminWarn(4, string);

	return true;
}

CMD:unfreeze(playerid, params[])
{
	new string[128], playerb;

	if(!pLoggedIn[playerid])return true;
	if(!PlayerData[playerid][pAdmin])return UnAuthMessage(playerid);

	if(sscanf(params, "u", playerb))return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /unfreeze [oyuncuID/isim]");

	if(!IsPlayerConnected(playerb))return SendClientMessage(playerid, COLOR_GREY, "Girdiðin oyuncu ID veya isim aktif deðil.");
	if(!pLoggedIn[playerb])return SendClientMessage(playerid, COLOR_GREY, "You have specified a player that isn't logged in.");

	TogglePlayerControllable(playerb, true);

	format(string, sizeof(string), "AdmCmd: %s thawed %s.", ReturnName(playerid, 1), ReturnName(playerb, 1));
	SendClientMessage(playerid, COLOR_GREY, string);
	//if(playerb != playerid) { SendClientMessage(playerb, COLOR_GREY, string); }

	format(string, sizeof(string), "%s thawed %s", ReturnName(playerid, 1), ReturnName(playerb, 1));
	adminWarn(4, string);

	return true;
}

CMD:ptp(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	static
		gonderilen,
		gidecegi;

	if(sscanf(params, "uu", gonderilen, gidecegi)) return SendUsageMessage(playerid, "/ptp [gönderilen oyuncu ID] [gönderilecek oyuncu ID]");
	if(!IsPlayerConnected(gonderilen)) return SendServerMessage(playerid, "Belirttiðiniz gönderilen oyuncu oyunda yok.");
	if(!IsPlayerConnected(gidecegi)) return SendServerMessage(playerid, "Belirttiðiniz gönderilecek oyuncu oyunda yok.");
	if(!pLoggedIn[gonderilen]) return SendServerMessage(playerid, "Belirttiðiniz gönderilen oyuncu henüz þifresini girmemiþ.");
	if(!pLoggedIn[gidecegi]) return SendServerMessage(playerid, "Belirttiðiniz gönderilecek oyuncu henüz þifresini girmemiþ.");

	new Float: x, Float: y, Float: z, Float: a;
	GetPlayerPos(gidecegi, x, y, z); GetPlayerFacingAngle(gidecegi, a);
	SendPlayer(gonderilen, x + 1.0, y, z, a, GetPlayerInterior(gidecegi), GetPlayerVirtualWorld(gidecegi));
	SendClientMessageEx(gonderilen, COLOR_GREY, "SERVER: %s tarafýndan %s(%i) isimli oyuncunun yanýna gönderildin.", ReturnName(playerid, 0), ReturnName(gidecegi, 0), gidecegi);
	return 1;
}

CMD:p2house(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	static
	    house_id,
	 	player_id;

	if(sscanf(params, "ud", player_id, house_id)) return SendUsageMessage(playerid, "/p2house [oyuncu ID/isim] [ev ID]");
	if(!Iter_Contains(Properties, house_id)) return SendErrorMessage(playerid, "Hatalý ev ID girdin.");

	//SendAdminWarnMessageEx(COLOR_YELLOW, 1, "%s(%i) isimli yönetici %s(%i) isimli oyuncuyu %i numaralý eve gönderdi.", ReturnName(playerid, 1), playerid, ReturnName(player_id, 1), player_id, house_id);
	SendPlayer(player_id, PropertyData[house_id][PropertyEnter][0], PropertyData[house_id][PropertyEnter][1], PropertyData[house_id][PropertyEnter][2], PropertyData[house_id][PropertyEnter][3], PropertyData[house_id][PropertyEnterInterior], PropertyData[house_id][PropertyEnterWorld]);
	//SendClientMessageEx(player_id, COLOR_GREY, "SERVER: %s(%i) isimli yönetici seni %i numaralý eve ýþýnladý.", ReturnName(playerid, 1), playerid, house_id);
	return 1;
}

CMD:interiors(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return 0;

	new primary[2048], sub[286];

	for(new i = 0; i < sizeof Interiors; i++)
	{
		format(sub, sizeof(sub), "%s\n", Interiors[i][INT_NAME]);
		strcat(primary, sub);
	}
	ShowPlayerDialog(playerid, DIALOG_INTERIORS, DIALOG_STYLE_LIST, "Interiors:", primary, "Iþýnlan", "<<");
	return 1;
}

CMD:slap(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	static id;
	if(sscanf(params, "u", id)) return SendUsageMessage(playerid, "/slap [oyuncu ID/isim]");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	id = (PlayerData[id][pAdmin] > PlayerData[playerid][pAdmin]) ? playerid : id;

	new Float: x, Float: y, Float: z;
	GetPlayerPos(id, x, y, z); SetPlayerPos(id, x, y, z + 5.0); PlayNearbySound(id, 1130);
	SendClientMessageEx(id, COLOR_GREY, "AdmCmd: %s isimli yönetici seni tokatladý.", ReturnName(playerid, 1));
	return 1;
}

CMD:slapcar(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	static vehicleid;
	if(sscanf(params, "i", vehicleid)) return SendUsageMessage(playerid, "/slapcar [araç ID]");
	if(!IsValidVehicle(vehicleid)) return SendErrorMessage(playerid, "Hatalý araç ID girdin.");

	new Float: x, Float: y, Float: z;
	GetVehiclePos(vehicleid, x, y, z); SetVehiclePos(vehicleid, x, y, z + 5.0);
	return 1;
}

CMD:o(playerid, params[]) return cmd_ooc(playerid, params);
CMD:ooc(playerid, params[])
{
	if(isnull(params)) return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /o(oc) [mesaj]");

	if(PlayerData[playerid][pAdmin])
	{
		if(strlen(params) > 80)
		{
			SendMessageToAll(COLOR_SAMP, "[OOC] %s: %.80s...", ReturnName(playerid, 1), params);
			SendMessageToAll(COLOR_SAMP, "[OOC] %s: ...%s", ReturnName(playerid, 1), params[80]);
		}
		else SendMessageToAll(COLOR_SAMP, "[OOC] %s: %s", ReturnName(playerid, 1), params);

		//WriteLog("chat_logs/oocchat_log.txt", "[%s] %s: %s", ReturnDate(), ReturnName(playerid, 1), params);
	}
	else
	{
		if(OOC == 1)
		{
			if(strlen(params) > 80)
			{
				SendMessageToAll(COLOR_SAMP, "[OOC] %s: %.80s...", ReturnName(playerid, 1), params);
				SendMessageToAll(COLOR_SAMP, "[OOC] %s: ...%s", ReturnName(playerid, 1), params[80]);
			}
			else SendMessageToAll(COLOR_SAMP, "[OOC] %s: %s", ReturnName(playerid, 1), params);
			//WriteLog("chat_logs/oocchat_log.txt", "[%s] %s: %s", ReturnDate(), ReturnName(playerid, 1), params);
		}
		else return UnAuthMessage(playerid);
	}
	return 1;
}

CMD:aooc(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);
	if(isnull(params)) return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /aooc [yazý]");

	if(strlen(params) > 80)
	{
		SendMessageToAll(COLOR_ORANGE, "[AOOC] %s (%s): %.80s...", ReturnName(playerid, 1), PlayerData[playerid][pAdminName], params);
		SendMessageToAll(COLOR_ORANGE, "[AOOC] %s (%s): ...%s", ReturnName(playerid, 1), PlayerData[playerid][pAdminName], params[80]);
	}
	else SendMessageToAll(COLOR_ORANGE, "[AOOC] %s (%s): %s", ReturnName(playerid, 1), PlayerData[playerid][pAdminName], params);
	return 1;
}

CMD:setarmor(playerid, params[]) return cmd_armor(playerid, params);
CMD:armor(playerid, params[])
{
	if(!pLoggedIn[playerid])return true;

	new string[128], playerb, armor;
	if(!PlayerData[playerid][pAdmin])return UnAuthMessage(playerid);

	if(sscanf(params, "ui", playerb, armor))return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /armor [oyuncuID/isim] [armor]");

	if(!IsPlayerConnected(playerb))return SendClientMessage(playerid, COLOR_GREY, "Girdiðin oyuncu ID veya isim aktif deðil.");
	if(!pLoggedIn[playerb])return SendClientMessage(playerid, COLOR_GREY, "You have specified a player that isn't logged in.");

	SetPlayerArmour(playerb, armor);

	format(string, sizeof(string), "%s gave %d armor to %s", ReturnName(playerid, 1), armor, ReturnName(playerb, 1));
	adminWarn(1, string);

	//WriteLog("admin_logs/players/setarmor_log.txt", "[%s] %s set %s's armor to %d.0", ReturnDate(), ReturnName(playerid, 1), ReturnName(playerid, 1), armor);
	return true;
}

CMD:afks(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return 0;

	new sayi = 0;

	foreach(new i : Player)
	{
		if(GetTickCount() > (PlayerData[i][pPauseCheck]+2000) && PlayerData[i][pPauseTime] > 60)
		{
			SendClientMessageEx(playerid, COLOR_GREY, "[AFK] %s(%i) - Süre: %d dakika %d saniye", ReturnName(i), i, floatround(PlayerData[i][pPauseTime] / 60), floatround(PlayerData[i][pPauseTime] - (PlayerData[i][pPauseTime] / 60)));
			sayi++;
		}
	}

	SendServerMessage(playerid, "Sunucuda %d AFK var.", sayi);

	return 1;
}

CMD:gotop(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	static
		spots;


	if(sscanf(params, "n", spots))
 	{
	 	SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /gotop [number of location]");
	 	SendClientMessage(playerid, COLOR_GREY, "|1. Los Santos |2. Las Venturas |3. San Fierro |4. Market Ammunation |5. Market DMV |6. LSLV Highway |7. Montgomery");
	 	SendClientMessage(playerid, COLOR_GREY, "|8. Palomino |9. Dillimore |10. Fort Carson |11. Breach Center |12. Idlewood |13. El Corona |14. Idlegas |15. Ganton");
	 	SendClientMessage(playerid, COLOR_GREY, "|16. Grove Circle |17. Willowfield |18. Seville |19. Los Flores |20. East Los |21. Jefferson |22. Glen Park");
	 	SendClientMessage(playerid, COLOR_GREY, "|23. Downtown |24. Market |25. LS Runway |26. LV Runway |27. SF Runway |28. Mall |29. Trucker Trailers");
	}
	else
	{
	    switch(spots)
	    {
	        case 1:
	        {
	            SendPlayer(playerid, 1514.1836, -1677.8027, 14.0469, 90.0, 0, 0);
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
			}
			case 2:
			{
			    SendPlayer(playerid, 1721.1599, 1444.5464, 10.5450, 90.0, 0, 0);
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
			}
			case 3:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerid, -1751.6312, -607.6387, 16.2367, 90.0, 0, 0);
			}
			case 4:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerid, 1364.0856, -1276.8530, 13.5469, 90.0, 0, 0);
			}
			case 5:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerid, 1286.8722, -1540.2163, 13.4944, 90.0, 0, 0);
			}
			case 6:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerid, 1622.8391,158.6248,34.8305, 90.0, 0, 0);
			}
			case 7:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerid, 1348.9205,231.8964,19.2818, 90.0, 0, 0);
			}
			case 8:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerid, 2284.1912, 26.9898, 26.2115, 90.0, 0, 0);
			}
			case 9:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerid, 656.5389, -586.2031, 16.0592, 90.0, 0, 0);
			}
			case 10:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerid, -58.4578,1168.8517,19.3818, 90.0, 0, 0);
			}
			case 11:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
           		SendPlayer(playerid, 2776.4807, 2416.5981, 11.0702, 90.0, 0, 0);
			}
			case 12:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerid, 2098.6453,-1760.2810,13.5625, 90.0, 0, 0);
			}
			case 13:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerid, 1882.9041,-2016.5022, 13.5469, 90.0, 0, 0);
			}
			case 14:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerid, 1949.9351, -1769.6365, 13.5469, 90.0, 0, 0);
			}
			case 15:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerid, 2225.5811, -1742.8641, 13.5634, 90.0, 0, 0);
			}
			case 16:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerid, 2499.9521,-1686.2581,13.4776, 90.0, 0, 0);
			}
			case 17:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
             	SendPlayer(playerid, 2489.4878,-1941.6466,12.9567, 90.0, 0, 0);
			}
			case 18:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerid, 2767.3303, -1944.2482, 12.8437, 90.0, 0, 0);
			}
			case 19:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
             	SendPlayer(playerid, 2628.9937, -1250.3225, 49.2440, 90.0, 0, 0);
			}
			case 20:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerid, 2363.8564, -1290.3566, 23.4254, 90.0, 0, 0);
			}
			case 21:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerid, 2188.8093,-1294.6794,23.4828, 90.0, 0, 0);
			}
			case 22:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerid, 2002.3489,-1277.4027,23.3324, 90.0, 0, 0);
			}
			case 23:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerid, 1567.7167, -1311.5303, 16.7319, 90.0, 0, 0);
			}
			case 24:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerid, 1102.7339, -1387.4949, 13.2131, 90.0, 0, 0);
			}
			case 25:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerid, 1974.6187, -2459.8467, 13.5469, 90.0, 0, 0);
			}
			case 26:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerid, 1512.8564, 1487.1121, 10.8273, 90.0, 0, 0);
			}
			case 27:
			{
	            SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerid, -1453.3241, -46.0731, 14.5469, 90.0, 0, 0);
			}
			case 28:
			{
				SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
				SendPlayer(playerid, 1121.2642, -1412.9189, 13.5747, 90.0, 0, 0);
			}
			case 29:
			{
				SendPlayer(playerid, 104.6114, -272.4609, 1.5781, 90.0, 0, 0);
				SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
			}
		}
	}
	return 1;
}

CMD:ban(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return 0;

	new id, reason[35];
	if(sscanf(params, "us[35]", id, reason)) return SendUsageMessage(playerid, "/ban [oyuncu ID/isim] [sebep]");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	if(PlayerData[id][pAdmin] > PlayerData[playerid][pAdmin]) return SendServerMessage(id, "%s(%i) seni yasaklamaya çalýþýyor.", ReturnName(playerid), playerid);
	if(id == playerid) return SendErrorMessage(playerid, "Bu komutu kendi üzerinde kullanamazsýn!");
   	if(strlen(reason) > 35) return SendServerMessage(playerid, "Sebep 35 karakterden fazla olamaz!");

	/*for(new i = 1; i < MAX_ADMIN_NOTES; i++)
	{
		if(aNotesData[id][i][anote_SQLID] != 0)
		{
			if(aNotesData[id][i][anote_active])
			{
				if(strlen(aNotesData[id][i][anote_reason]) > 45)
				{
				    SendAdminWarnMessageEx(COLOR_YELLOW, 1, "%s isimli oyuncu %d adet aktif yönetici notuna sahip, sonuncusu: %.45s", ReturnName(id, 1), CountAdminNotes(id), aNotesData[id][i][anote_reason]);
				    SendAdminWarnMessageEx(COLOR_YELLOW, 1, "...%s", aNotesData[id][i][anote_reason][45]);
				}
				else SendAdminWarnMessageEx(COLOR_YELLOW, 1, "%s isimli oyuncu %d adet aktif yönetici notuna sahip, sonuncusu: %s", ReturnName(id, 1), CountAdminNotes(id), aNotesData[id][i][anote_reason]);
			}
		}
	}*/

	new ban_query[256];
	mysql_format(m_Handle, ban_query, sizeof(ban_query), "INSERT INTO bans (active, ban_ip, ban_name, ban_regid, admin, admin_regid, reason, time) VALUES (1, '%e', '%e', %i, '%e', %i, '%e', %i)", ReturnIP(id), ReturnName(id, 1), PlayerData[id][pSQLID], ReturnName(playerid, 1), PlayerData[playerid][pSQLID], reason, Time());
	mysql_tquery(m_Handle, ban_query, "PermanentBan", "iis", playerid, id, reason);
	return 1;
}

CMD:ckban(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return 0;

	new id, reason[35];
	if(sscanf(params, "us[35]", id, reason)) return SendUsageMessage(playerid, "/ckban [oyuncu ID/isim] [sebep]");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	if(PlayerData[id][pAdmin] > PlayerData[playerid][pAdmin]) return SendServerMessage(id, "%s(%i) seni yasaklamaya çalýþýyor.", ReturnName(playerid), playerid);
   	if(strlen(reason) > 35) return SendServerMessage(playerid, "Sebep 35 karakterden fazla olamaz!");

	new ban_query[256];
	mysql_format(m_Handle, ban_query, sizeof(ban_query), "UPDATE players SET AccountStatus = 3, banreason = '%s', banAdmin = '%s' WHERE id = '%d'", reason, ReturnName(playerid, 1), PlayerData[id][pSQLID]);
	mysql_tquery(m_Handle, ban_query, "CKBan", "iis", playerid, id, reason);
	return 1;
}


CMD:ck(playerid, params[])
{
  new onayla[5];
  if(sscanf(params, "s[5]", onayla)) return SendUsageMessage(playerid, "/ck {FFFF00}onay");

  if(!strcmp(onayla, "onay", true))
  {
    new ban_query[256];
    mysql_format(m_Handle, ban_query, sizeof(ban_query), "UPDATE players SET AccountStatus = 3, banreason = 'Ýntihar', banAdmin = '%s' WHERE id = '%d'", ReturnName(playerid, 1), PlayerData[playerid][pSQLID]);
    mysql_tquery(m_Handle, ban_query, "CKBan", "iis", playerid, playerid, "Ýntihar");
    CreateCorpse(playerid);
  }
  else SendUsageMessage(playerid, "/ck {FFFF00}onay");
  return 1;
}

CMD:ckunban(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return 0;

	new name[35];
	if(sscanf(params, "s[35]", name)) return SendUsageMessage(playerid, "/ckunban [karakter adi]");

	new query[39+MAX_PLAYER_NAME+1];
	mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM players WHERE Name = '%s'", name);
	mysql_tquery(m_Handle, query, "UnbanCK", "d", playerid);
	return 1;
}

CMD:unban(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return 0;
	if(isnull(params)) return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /unban [isim_soyisim]");
	if(!ReturnSQLFromName(params)) return SendClientMessage(playerid, COLOR_ADM, "HATA: Girdiðiniz Ýsim_Soyisim bulunamadý.");

	new unban_query[100];
	mysql_format(m_Handle, unban_query, sizeof(unban_query), "SELECT * FROM bans WHERE ban_name = '%e' WHERE active = 1", params);
	new Cache:result = mysql_query(m_Handle, unban_query);
 	if(cache_num_rows())
	{
		new ban_active, banned_ip[16], banned_name[25];
		cache_get_value_name_int(0, "active", ban_active);
		cache_get_value_name(0, "ban_ip", banned_ip);
		cache_get_value_name(0, "ban_name", banned_name);

		if(ban_active == 0)
		{
		    SendClientMessageEx(playerid, COLOR_ADM, "SERVER: %s (IP: %s) hesabýnýn yasaðý zaten açýlmýþ!", banned_name, banned_ip);
			return 1;
		}

		mysql_format(m_Handle, unban_query, sizeof(unban_query), "UPDATE bans SET active = 0 WHERE ban_name = '%e'", banned_name);
		mysql_tquery(m_Handle, unban_query);

		SendClientMessageEx(playerid, COLOR_ADM, "SERVER: %s isimli oyuncunun yasaðýný kaldýrdýn.", banned_name);
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_ADM, "SERVER: %s isimli kiþi yasaklý gözükmüyor.", params);
	}

 	cache_delete(result);
	return 1;
}

/*CMD:offlineban(playerid, params[])
{
	if(!pLoggedIn[playerid])return true;
	if(!PlayerData[playerid][pAdmin])return UnAuthMessage(playerid);

	new playerb[30], reason[128], query[90];

	if(sscanf(params, "s[30]s[128]", playerb, reason))return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /offlineban [Firstname_Lastname] [reason]");

	format(PlayerData[playerid][pSetReason], 128, "%s", reason);

	mysql_format(m_Handle, query, sizeof(query), "SELECT Name, AdminLevel, IP, HWID FROM players WHERE Name = '%e'", playerb);
	mysql_pquery(m_Handle, query, "SQL_CheckAccountBan", "i", playerid);

	return true;
}*/

CMD:checkguns(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	new
		id,
		bool: hasWeapons = false,
		bool: hasWeaponsEx = false,
		weapid[2][13];

	if(sscanf(params, "u", id)) return SendUsageMessage(playerid, "/checkguns [oyuncu ID/isim]");
	if(!IsPlayerConnected(id)) return SendServerMessage(playerid, "Belirttiðiniz oyuncu oyunda yok.");
	if(!pLoggedIn[id]) return SendServerMessage(playerid, "Belirttiðiniz oyuncu henüz þifresini girmemiþ.");
	if(PlayerData[id][pAdmin] > PlayerData[playerid][pAdmin]) return SendServerMessage(playerid, "Belirttiðiniz oyuncunun silahlarýna bakma yetkin yok.");

	SendClientMessageEx(playerid, COLOR_ADM, ">> %s isimli oyuncunun kayýtlý silahlarý:", ReturnName(id));

	for(new i = 0; i < 4; i++) if(PlayerData[playerid][pWeaponsAmmo][i])
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "[ID: %i] Silah: [%s] - Mermi: [%i]", PlayerData[playerid][pWeapons][i], ReturnWeaponName(PlayerData[playerid][pWeapons][i]), PlayerData[playerid][pWeaponsAmmo][i]);
		hasWeapons = true;
	}

	if(!hasWeapons) SendClientMessage(playerid, COLOR_ADM, "> {FFFFFF}Belirttiðiniz oyuncunun hiç kayýtlý silahý yok.");

	SendClientMessageEx(playerid, COLOR_ADM, ">> %s isimli oyuncunun kayýtsýz silahlarý: (iþbaþý silahlarý)", ReturnName(id));

	for(new i = 0; i < 13; i++)
	{
		GetPlayerWeaponData(id, i, weapid[0][i], weapid[1][i]);

		if(weapid[0][i] != 0)
		{
			if(weapid[0][i] == WEAPON_SILENCED && PlayerData[id][pTaser])
				continue;

			hasWeaponsEx = true;
			SendClientMessageEx(playerid, COLOR_ADM, "[ID: %i] Silah: [%s] - Mermi: [%i]", weapid[0][i], ReturnWeaponName(weapid[0][i]), weapid[1][i]);
		}
	}

	if(!hasWeaponsEx) SendClientMessage(playerid, COLOR_ADM, "> {FFFFFF}Belirttiðiniz oyuncunun hiç kayýtsýz silahý yok.");
	else SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}Eðer bu listede silahý görünmüyor ve elinde silah varsa silah hilesi kullanýyordur.");
	return 1;
}

CMD:checkhp(playerid, params[])
{
	if(!pLoggedIn[playerid])return true;
	if(!PlayerData[playerid][pAdmin])return UnAuthMessage(playerid);

	new playerb, string[128];
	if(sscanf(params, "u", playerb))return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /checkhp [oyuncuID/isim]");
	if(!IsPlayerConnected(playerb))return SendClientMessage(playerid, COLOR_GREY, "Girdiðin oyuncu ID veya isim aktif deðil.");

	new Float:health, Float:armour;
	GetPlayerHealth(playerb, health);
	GetPlayerArmour(playerb, armour);

	format(string, sizeof(string), "SERVER: %s's health is %.1f (Max health: %d.0), armor is %.1f.", ReturnName(playerb, 1), health, PlayerData[playerid][pMaxHealth], armour);
	SendClientMessage(playerid, COLOR_ADM, string);
	return true;
}

CMD:sendplayer(playerid, params[])
{
	new spots, playerb, string[128];

	if(!PlayerData[playerid][pAdmin])return UnAuthMessage(playerid);

	if(sscanf(params, "un", playerb, spots))
 	{
	 	SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /sendplayer [oyuncuID/isim] [location]");
	 	SendClientMessage(playerid, COLOR_GREY, "|1. Los Santos |2. Las Venturas |3. San Fierro |4. Market Ammunation |5. Market DMV |6. LSLV Highway |7. Montgomery");
	 	SendClientMessage(playerid, COLOR_GREY, "|8. Palomino |9. Dillimore |10. Fort Carson |11. Breach Center |12. Idlewood |13. El Corona |14. Idlegas |15. Ganton");
	 	SendClientMessage(playerid, COLOR_GREY, "|16. Grove Circle |17. Willowfield |18. Seville |19. Los Flores |20. East Los |21. Jefferson |22. Glen Park");
	 	SendClientMessage(playerid, COLOR_GREY, "|23. Downtown |24. Market |25. LS Runway |26. LV Runway |27. SF Runway |28. Mall |29. Trucker Trailers");
	}
	else
	{
	    switch(spots)
	    {
	        case 1:
	        {
	            SendPlayer(playerb, 1514.1836, -1677.8027, 14.0469, 90.0, 0, 0);
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
			}
			case 2:
			{
			    SendPlayer(playerb, 1721.1599, 1444.5464, 10.5450, 90.0, 0, 0);
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
			}
			case 3:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerb, -1751.6312, -607.6387, 16.2367, 90.0, 0, 0);
			}
			case 4:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerb, 1364.0856, -1276.8530, 13.5469, 90.0, 0, 0);
			}
			case 5:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerb, 1286.8722, -1540.2163, 13.4944, 90.0, 0, 0);
			}
			case 6:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerb, 1622.8391,158.6248,34.8305, 90.0, 0, 0);
			}
			case 7:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerb, 1348.9205,231.8964,19.2818, 90.0, 0, 0);
			}
			case 8:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerb, 2284.1912, 26.9898, 26.2115, 90.0, 0, 0);
			}
			case 9:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerb, 656.5389, -586.2031, 16.0592, 90.0, 0, 0);
			}
			case 10:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerb, -58.4578,1168.8517,19.3818, 90.0, 0, 0);
			}
			case 11:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
           		SendPlayer(playerb, 2776.4807, 2416.5981, 11.0702, 90.0, 0, 0);
			}
			case 12:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerb, 2098.6453,-1760.2810,13.5625, 90.0, 0, 0);
			}
			case 13:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerb, 1882.9041,-2016.5022, 13.5469, 90.0, 0, 0);
			}
			case 14:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerb, 1949.9351, -1769.6365, 13.5469, 90.0, 0, 0);
			}
			case 15:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerb, 2225.5811, -1742.8641, 13.5634, 90.0, 0, 0);
			}
			case 16:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerb, 2499.9521,-1686.2581,13.4776, 90.0, 0, 0);
			}
			case 17:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
             	SendPlayer(playerb, 2489.4878,-1941.6466,12.9567, 90.0, 0, 0);
			}
			case 18:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerb, 2767.3303, -1944.2482, 12.8437, 90.0, 0, 0);
			}
			case 19:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
             	SendPlayer(playerb, 2628.9937, -1250.3225, 49.2440, 90.0, 0, 0);
			}
			case 20:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerb, 2363.8564, -1290.3566, 23.4254, 90.0, 0, 0);
			}
			case 21:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerb, 2188.8093,-1294.6794,23.4828, 90.0, 0, 0);
			}
			case 22:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerb, 2002.3489,-1277.4027,23.3324, 90.0, 0, 0);
			}
			case 23:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerb, 1567.7167, -1311.5303, 16.7319, 90.0, 0, 0);
			}
			case 24:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerb, 1102.7339, -1387.4949, 13.2131, 90.0, 0, 0);
			}
			case 25:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerb, 1974.6187, -2459.8467, 13.5469, 90.0, 0, 0);
			}
			case 26:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerb, 1512.8564, 1487.1121, 10.8273, 90.0, 0, 0);
			}
			case 27:
			{
	            SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
	            SendPlayer(playerb, -1453.3241, -46.0731, 14.5469, 90.0, 0, 0);
			}
			case 28:
			{
				SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
				SendPlayer(playerb, 1121.2642, -1412.9189, 13.5747, 90.0, 0, 0);
			}
			case 29:
			{
				SendPlayer(playerb, 104.6114, -272.4609, 1.5781, 90.0, 0, 0);
				SendClientMessage(playerb, COLOR_GREY, "Iþýnlandýn.");
			}
		}
		format(string, sizeof(string), "%s teleported %s to a location", ReturnName(playerid, 1), ReturnName(playerb, 1));
		adminWarn(3, string);
	}
	return 1;
}


CMD:respawncar(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return 0;

	static
		vehicleid;
	if(sscanf(params, "d", vehicleid))
		return SendUsageMessage(playerid, "/respawncar [vehicleid]");

	if(!IsValidVehicle(vehicleid))
		return SendErrorMessage(playerid, "You specified an invalid vehicle.");

	SetVehicleToRespawn(vehicleid);

	foreach(new i : Player)
	{
		if(GetPlayerVehicleID(i) == vehicleid)
		{
			SendServerMessage(i, "Ýçinde olduðun araç %s tarafýndan re-spawnlandý.", ReturnName(playerid));
		}
	}

	adminWarn(1, sprintf("%s #%d numaralý aracý re-spawnladý.", ReturnName(playerid, 1), vehicleid));
	return 1;
}

CMD:respawncars(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return 0;

	new count = 0;
	for(new i = 0; i < MAX_VEHICLES; i++)
	{
		new Float: currPos[3];
		GetVehiclePos(i, currPos[0], currPos[1], currPos[2]);

		if(IsPlayerInRangeOfPoint(playerid, 25.0, currPos[0], currPos[1], currPos[2])){
			if(!IsVehicleOccupied(i)){
				SetVehicleToRespawn(i);

				count++;
			}
		}
	}

	if(count) {
		SendClientMessageEx(playerid, COLOR_GREY, "AdmCmd: %s respawned nearby vehicles.", ReturnName(playerid, 1));
	}
	else return SendClientMessage(playerid, COLOR_GREY, "There are no nearby vehicles to respawn (25.0f radius). ");
	return true;
}

CMD:achecktime(playerid, params[])
{
	if(!pLoggedIn[playerid])return true;
	if(!PlayerData[playerid][pAdmin])return UnAuthMessage(playerid);

	new string[128], playerb, checkString[60];
	if(sscanf(params, "u", playerb))return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /checktime [oyuncuID/isim]");
	if(!IsPlayerConnected(playerb))return SendClientMessage(playerid, COLOR_GREY, "Girdiðin oyuncu ID veya isim aktif deðil.");
	if(!pLoggedIn[playerb])return SendClientMessage(playerid, COLOR_GREY, "Bu oyuncu giriþ yapmamýþ.");

	if(!PlayerData[playerb][pAjailed]){
		format(string, sizeof(string), "SERVER: %s hapiste deðil.", ReturnName(playerb, 1));
		SendClientMessage(playerid, COLOR_YELLOW, string);
		return true;
	}

	if(PlayerData[playerb][pAjailed] == 1)format(checkString, sizeof(checkString), "Evet");
	if(PlayerData[playerb][pAjailed] == 0)format(checkString, sizeof(checkString), "Hayýr");

	format(string, sizeof(string), "SERVER: %s adlý kiþniin hapisten çýkmasýna %s saniye var. (%d dakika).  Yönetici Hapisi: %s.", ReturnName(playerb, 1), MoneyFormat(PlayerData[playerb][pAjailTime]), PlayerData[playerb][pAjailTime] / 60, checkString);
	SendClientMessage(playerid, COLOR_YELLOW, string);
	return true;
}

CMD:adminname(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return 0;

	if(isnull(params)) return SendUsageMessage(playerid, "/adminname [adýnýz]");
	if(strlen(params) > 24) return SendErrorMessage(playerid, "Yönetici adýnýz en fazla 24 karakter olabilir.");

	format(PlayerData[playerid][pAdminName], 24, "%s", params);
	SendClientMessageEx(playerid, COLOR_ADM, "[!] Yönetici adýnýzý \"%s\" olarak güncellediniz. ", params);

	new updateName[128];
	mysql_format(m_Handle, updateName, sizeof(updateName), "UPDATE players SET AdminName = '%e' WHERE id = %i", params, PlayerData[playerid][pSQLID]);
	mysql_tquery(m_Handle, updateName);
	return 1;
}

/*CMD:adminnote(playerid, params[])
{
	new playerb, query[128], a_string[128], b_string[128], string[128];

	if(!PlayerData[playerid][pAdmin])
		return UnAuthMessage(playerid);

	if(sscanf(params, "us[128]S()[128]", playerb, a_string, b_string))
	{
		SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /adminnote [playerid OR name] [action]");
		SendClientMessage(playerid, COLOR_ADM, "[Action] add, alter, delete, display");
		return true;
	}

	if (!IsPlayerConnected(playerb))
		return SendClientMessage(playerid, COLOR_GREY, "Girdiðin oyuncu ID veya isim aktif deðil.");

	if (!pLoggedIn[playerb])
		return SendClientMessage(playerid, COLOR_ADM, "Bu oyuncu giriþ yapmamýþ.");

	if(!strcmp(a_string, "add"))
	{
		new reasons[128], slot_check = ReturnANoteSlot(playerb);

		if(sscanf(b_string, "s[128]", reasons))
		{
			return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /adminnote [playerid] add [reasons] ");
		}

		if (slot_check == -1)
			return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} This player already has 5 admin notes on them.");

		format(string, sizeof(string), "SERVER: An admin note was added to %s", ReturnName(playerb, 1));
		SendClientMessage(playerid, COLOR_YELLOW, string);

		format(string, sizeof(string), "%s added a admin note to %s", ReturnName(playerid, 1), ReturnName(playerb, 1));
		adminWarn(3, string);

		AddAdminNote(playerid, playerb, reasons);
	}
	else if(!strcmp(a_string, "alter"))
	{
		new reasons[128], id;

		if(sscanf(b_string, "ds[128]", id, reasons))
			return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /adminnote [playerid] alter [noteid] [reasons]");

		if(id < 1 || id > MAX_ADMIN_NOTES)
			return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} You specified an invalid admin note ID.");

		if(!aNotesData[playerb][id][anote_SQLID])
			return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} That player doesn't have a note in that ID.");

		format(string, sizeof(string), "SERVER: %s's Note %d edited to : %s", ReturnName(playerb, 1), id, reasons);
		SendClientMessage(playerid, COLOR_YELLOW, string);

		format(aNotesData[playerb][id][anote_reason], 128, "%s", reasons);

		mysql_format(m_Handle, query, sizeof(query), "UPDATE player_anotes SET anote_reason = '%e' WHERE id = %i", reasons, aNotesData[playerb][id][anote_SQLID]);
		mysql_pquery(m_Handle, query);

		//WriteLog("admin_logs/players/admin_note/edit_note.txt", "[%s] %s edited %s's Note (%d) to %s", ReturnDate(), ReturnName(playerid, 1), ReturnName(playerb, 1), id, reasons);
	}
	else if(!strcmp(a_string, "delete"))
	{
		new id;

		if(sscanf(b_string, "d", id))
			return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /adminnote [playerid] delete [noteid]");

		if(id < 1 || id > MAX_ADMIN_NOTES)
			return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} You specified an invalid admin note ID.");

		if(!aNotesData[playerb][id][anote_SQLID])
			return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} That player doesn't have a note in that ID.");

		format(string, sizeof(string), "SERVER: %s's Note %d was deleted", ReturnName(playerb, 1), id);
		SendClientMessage(playerid, COLOR_YELLOW, string);

		if(aNotesData[playerb][id][anote_active])
		{
			aNotesData[playerb][id-1][anote_active] = true; // Sets the note before deleted active.
		}

		mysql_format(m_Handle, query, sizeof(query), "DELETE FROM player_anotes WHERE id = %i", aNotesData[playerb][id][anote_SQLID]);
		mysql_pquery(m_Handle, query);

		aNotesData[playerb][id][anote_SQLID] = 0;
		aNotesData[playerb][id][anote_active] = false;

		//WriteLog("admin_logs/players/admin_note/delete_note.txt", "[%s] %s deleted %s's Note ID %d", ReturnDate(), ReturnName(playerid, 1), ReturnName(playerb, 1), id);
	}
	else if(!strcmp(a_string, "display"))
	{
		new id;

		if (CountAdminNotes(playerb) == 0)
		{
			format(string, sizeof(string), "SERVER: %s has no OnAdminAction notes to display.", ReturnName(playerb, 1));
			SendClientMessage(playerid, COLOR_ADM, string);
			return true;
		}

		if(sscanf(b_string, "d", id))
		{
			format(string, sizeof(string), "___________%s's Admin Notes___________", ReturnName(playerb, 1));
			SendClientMessage(playerid, COLOR_ACTION, string);

			for(new i = 1; i < MAX_ADMIN_NOTES; i++)
			{
				if(aNotesData[playerb][i][anote_SQLID])
				{
					format(string, sizeof(string), "Note %d: %s", i, aNotesData[playerb][i][anote_reason]);
					SendClientMessage(playerid, COLOR_ACTION, string);
				}
			}
			SendClientMessage(playerid, COLOR_ACTION, "______________________________________");
			SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /adminnote [playerid] display [noteid] for more information.");
			return true;
		}

		if(id < 1 || id > MAX_ADMIN_NOTES)
			return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} You specified an invalid admin note ID.");

		if(!aNotesData[playerb][id][anote_SQLID])
			return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} That player doesn't have a note in that ID.");

		format(string, sizeof(string), "___________%s's Note___________", ReturnName(playerb, 1));
		SendClientMessage(playerid, COLOR_ACTION, string);

		format(string, sizeof(string), "Note ID : %d", id);
		SendClientMessage(playerid, COLOR_ACTION, string);

		format(string, sizeof(string), "Reason : %s", aNotesData[playerb][id][anote_reason]);
		SendClientMessage(playerid, COLOR_ACTION, string);

		format(string, sizeof(string), "Issuer : %s", aNotesData[playerb][id][anote_issuer]);
		SendClientMessage(playerid, COLOR_ACTION, string);

		format(string, sizeof(string), "Date : %s", aNotesData[playerb][id][anote_date]);
		SendClientMessage(playerid, COLOR_ACTION, string);

		SendClientMessage(playerid, COLOR_ACTION, "_______________________________");
	}

	return true;
}*/

CMD:adminmsg(playerid, params[])
{
	if (!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	new player_name[25], player_msg[128];
	if (sscanf(params, "s[25]s[128]", player_name, player_msg)) return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: {FFFFFF}/adminmsg [karakter_adý] [mesaj]");

	foreach(new i : Player)
	{
		if(strfind(ReturnName(i, 1), player_name, true) != -1)
		{
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %s(ID: %d) isimli oyuncu þu an aktif gözüküyor.", player_name, i);
			return 1;
		}
	}

	format(PlayerData[playerid][pAdminMsg], 128, "%s", player_msg);

	new query[200];
	mysql_format(m_Handle, query, sizeof(query), "SELECT Name, AdminMessage, AdminMessageBy, AdmMessageConfirm FROM `players` WHERE Name = '%e'", player_name);
	mysql_tquery(m_Handle, query, "SQL_AddAdminMessage", "i", playerid);
	return true;
}

CMD:clearcolour(playerid, params[])
{
	if (PlayerData[playerid][pAdmin] < 1) return UnAuthMessage(playerid);

 	static
 		id;

  	if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: {FFFFFF}/clearcolour [oyuncu ID/isim]");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	if(PlayerData[id][pAdmin]) return SendErrorMessage(playerid, "Bunu bir yöneticiye yapamazsýn.");

	new
		str[128];

	format(str, sizeof(str), "AdmCmd: %s adlý yönetici %s adlý oyuncunun isimlerini temizledi.", ReturnName(playerid), ReturnName(id));
	SendAdminMessage(COLOR_ADM, str);

	SetPlayerColor(id, COLOR_WHITE);
	return 1;
}

CMD:noooc(playerid, params[])
{
	if(!pLoggedIn[playerid])return true;
	if (PlayerData[playerid][pAdmin] < 2)return UnAuthMessage(playerid);

	new string[128];

	if (!OOC){
		OOC = true;
		SendMessageToAll(COLOR_GREY, "OOC chat bir yönetici tarafýndan açýldý.");

		format(string, sizeof(string), "/o(oc) chat %s tarafýndan açýldý.", ReturnName(playerid, 1));
		adminWarn(1, string);
	}
	else{
		OOC = false;
		SendMessageToAll(COLOR_GREY, "OOC chat bir yönetici tarafýndan kapatýldý.");

		format(string, sizeof(string), "/o(oc) chat %s tarafýndan kapatýldý.", ReturnName(playerid, 1));
		adminWarn(1, string);
	}
	return true;
}

CMD:checkfreq(playerid, params[])
{
	new channel;

	if(PlayerData[playerid][pAdmin] < 2)
		return UnAuthMessage(playerid);

	if(sscanf(params, "i", channel))
		return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /checkfreq [frequency]");

	if(channel < 1 || channel > 1000000)return SendClientMessage(playerid, COLOR_ADM, "HATA: Only channels 1 - 1000000 are supported.");

	SendClientMessageEx(playerid, COLOR_ADM, "%d frekansýndaki oyuncular:", channel);
	foreach(new i : Player)
	{
		for(new x = 0; x < 5; x++) if(PlayerData[i][pRadio][x] == channel)
		{
			SendClientMessageEx(playerid, COLOR_GREY, "- %s [ID: %i]", ReturnName(i), i);
		}
	}
	return 1;
}


CMD:setfaction(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 3) return UnAuthMessage(playerid);

	new id, factionid, leader;
	if(sscanf(params, "uiI(-1)", id, factionid, leader)) return SendUsageMessage(playerid, "/setfaction [oyuncu ID/isim] [birlik ID] [lider(opsiyonel)]");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	if(!Iter_Contains(Factions, factionid)) return SendErrorMessage(playerid, "Hatalý birlik ID girdin.");

	PlayerData[id][pFaction] = factionid;
	SaveSQLInt(PlayerData[id][pSQLID], "players", "Faction", PlayerData[id][pFaction]);

	PlayerData[id][pFactionRank] = ((leader == -1 || leader == 0) ? 20 : 1);
	SaveSQLInt(PlayerData[id][pSQLID], "players", "FactionRank", PlayerData[id][pFactionRank]);

	if(leader == -1 || leader == 0)
		SendClientMessageEx(id, COLOR_ADM, "[!] {FFFFFF}%s seni %s birliðine dahil etti.", ReturnName(playerid), FactionData[factionid][FactionName]);
	else
		SendClientMessageEx(id, COLOR_ADM, "[!] {FFFFFF}%s seni %s birliðinin lideri yaptý.", ReturnName(playerid), FactionData[factionid][FactionName]);
	return 1;
}

CMD:custommsg(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 3)
		return UnAuthMessage(playerid);

	new playerb, text[128];

	if(sscanf(params, "us[128]", playerb, text))
		return SendClientMessage(playerid, COLOR_GREY, "KULLANIM: /custommsg [oyuncuID/isim] [yazý]");

	if(!IsPlayerConnected(playerb))
		return SendClientMessage(playerid, COLOR_ADM, "Player isn't connected.");

	printf("[Debug] %s adlý yönetici %s adlý oyuncuya özel mesaj gönderdi: %s", ReturnName(playerid), ReturnName(playerb), text);

	InfoTD_MSG(playerb, 2, 5000, text);
	if(playerb != playerid) SendClientMessage(playerid, COLOR_GREY, "Bu komutu kendi üzerinde kullanamazsýn.");
	return 1;
}

CMD:getname(playerid, params[])
{
	if(!pLoggedIn[playerid])return true;
	if(PlayerData[playerid][pAdmin] < 3)return UnAuthMessage(playerid);

	new dbid, string[128];

	if(sscanf(params, "d", dbid))return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /getname [player dbid]");
	if(dbid < 1)return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} Geçersiz ID girdiniz.");

	format(string, sizeof(string), "%d DBID'ye ait olan isim: %s.", dbid, ReturnSQLName(dbid));
	SendClientMessage(playerid, COLOR_ADM, string);

	return true;
}

CMD:x(playerid, params[])
{
	new Float:playerPos[3], Float:coord;

	if(PlayerData[playerid][pAdmin] < 3)
		return UnAuthMessage(playerid);

	if(sscanf(params, "f", coord))
		return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /x [coordinate]");

	GetPlayerPos(playerid, playerPos[0], playerPos[1], playerPos[2]);
	SetPlayerPos(playerid, playerPos[0] + coord, playerPos[1], playerPos[2]);

	SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");
	return true;
}

CMD:y(playerid, params[])
{
	new Float:playerPos[3], Float:coord;

	if(PlayerData[playerid][pAdmin] < 3)
		return UnAuthMessage(playerid);

	if(sscanf(params, "f", coord))
		return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /y [coordinate]");

	GetPlayerPos(playerid, playerPos[0], playerPos[1], playerPos[2]);
	SetPlayerPos(playerid, playerPos[0], playerPos[1] + coord, playerPos[2]);

	SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");

	return true;
}

CMD:zc(playerid, params[])
{
	new Float:playerPos[3], Float:coord;

	if(PlayerData[playerid][pAdmin] < 3)
		return UnAuthMessage(playerid);

	if(sscanf(params, "f", coord))
		return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /zc [coordinate]");

	GetPlayerPos(playerid, playerPos[0], playerPos[1], playerPos[2]);
	SetPlayerPos(playerid, playerPos[0], playerPos[1], playerPos[2] + coord);

	SendClientMessage(playerid, COLOR_GREY, "Iþýnlandýn.");

	return true;
}

CMD:setjob(playerid, params[])
{
	if (PlayerData[playerid][pAdmin] < 3) return false;

	static id, job_id;
	if (sscanf(params, "ud", id, job_id))
	{
		SendUsageMessage(playerid, "/setjob [oyuncu ID/isim] [meslek ID]");
		SendClientMessage(playerid, COLOR_WHITE, "| 0. Ýþsiz, 1. Mekanik, 2. Taksi Þoförü, 3. Kamyoncu |");
		return 1;
	}

	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	if(job_id < 0 || job_id > 5) return SendErrorMessage(playerid, "Hatalý meslek ID girdin.");
	if(PlayerData[id][pSideJob] == job_id) return SendErrorMessage(playerid, "Bu meslek zaten kiþinin yan mesleði olarak gözüküyor.");

	PlayerData[id][pJob] = job_id;
	SaveSQLInt(PlayerData[id][pSQLID], "players", "Job", PlayerData[id][pJob]);
	AdmWarnEx(3, sprintf("%s, %s isimli oyuncunun mesleðini %s olarak ayarladý", ReturnName(playerid, 1), ReturnName(id, 1), ReturnJobName(job_id)));

	//WriteLog("admin_logs/players/setjob_log.txt", "[%s] %s set %s's Job to %s.", ReturnDate(), ReturnName(playerid), ReturnName(playerb), ReturnJobName(job_id));
	return 1;
}

CMD:setsidejob(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 3) return false;

	static id, job_id;
	if (sscanf(params, "ud", id, job_id))
	{
		SendUsageMessage(playerid, "/setsidejob [oyuncu ID/isim] [meslek ID]");
		SendClientMessage(playerid, COLOR_WHITE, "| 0. Ýþsiz, 1. Mekanik, 2. Taksi Þoförü, 3. Kamyoncu |");
		return 1;
	}

	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	if(job_id < 0 || job_id > 5) return SendErrorMessage(playerid, "Hatalý meslek ID girdin.");
	if(PlayerData[id][pJob] == job_id) return SendErrorMessage(playerid, "Bu meslek zaten kiþinin ana mesleði olarak gözüküyor.");

	PlayerData[id][pSideJob] = job_id;
	SaveSQLInt(PlayerData[id][pSQLID], "players", "SideJob", PlayerData[id][pSideJob]);
	AdmWarnEx(3, sprintf("%s, %s isimli oyuncunun mesleðini %s olarak ayarladý", ReturnName(playerid, 1), ReturnName(id, 1), ReturnJobName(job_id)));

	//WriteLog("admin_logs/players/setjob_log.txt", "[%s] %s set %s's SideJob to %s.", ReturnDate(), ReturnName(playerid), ReturnName(playerb), ReturnJobName(job_id));
	return 1;
}

CMD:near(playerid, params[])
{
	if (PlayerData[playerid][pAdmin] < 3) return UnAuthMessage(playerid);

	new
		id;


	if((id = Drop_Nearest(playerid)) != -1)
	{
		if(DropData[id][DropType])
			SendClientMessageEx(playerid, COLOR_YELLOW, "[!] %s (mermi: %i) - %s.", ReturnWeaponName(DropData[id][DropWeaponID]), DropData[id][DropWeaponAmmo], ReturnSQLName(DropData[id][DroppedBy]));
		else
			SendClientMessageEx(playerid, COLOR_YELLOW, "[!] %s - %s (%s: %0.1fg/%i.0g) (Kalite: %i) - %s.", DropData[id][DropDrugName], Drug_GetType(DropData[id][DropDrugSize]), Drug_GetName(DropData[id][DropDrugID]), DropData[id][DropDrugAmount], Drug_GetMaxAmount(DropData[id][DropDrugSize]), DropData[id][DropDrugQuality]);
	}


  	if( (id = Chopshop_Nearest(playerid)) != -1)
        SendClientMessageEx(playerid, COLOR_YELLOW, "[!] Yakýnýndaki Chopshop ID: %i", id);

    if( (id = ATM_Nearest(playerid)) != -1)
        SendClientMessageEx(playerid, COLOR_YELLOW, "[!] Yakýnýndaki ATM ID: %i", id);

	if((id = Camera_Nearest(playerid)) != -1)
		SendClientMessageEx(playerid, COLOR_YELLOW, "[!] Yakýnýndaki CCTV ID: %i", id);

    if( (id = Entrance_Nearest(playerid)) != -1)
        SendClientMessageEx(playerid, COLOR_YELLOW, "[!] Yakýnýndaki Bina ID: %i", id);

	if( (id = Industry_Nearest(playerid)) != -1)
		SendClientMessageEx(playerid, COLOR_YELLOW, "[!] Yakýnýndaki Endüstri ID: %i", id);

	//if( (id = IsPlayerNearProperty(playerid)) != 0)
	//	SendClientMessageEx(playerid, COLOR_YELLOW, "[!] You're near Property ID %i", id);

	if( (id = IsPlayerInProperty(playerid)) != -1)
		SendClientMessageEx(playerid, COLOR_YELLOW, "[!] You're inside Property ID %i", id);

	//if( (id = IsPlayerNearBusiness(playerid)) != 0)
	//	SendClientMessageEx(playerid, COLOR_YELLOW, "[!] You're near Business ID %i", id);

	if( (id = IsPlayerInBusiness(playerid)) != -1)
		SendClientMessageEx(playerid, COLOR_YELLOW, "[!] You're inside Business ID %i", id);

	if( (id = GetNearestVehicle(playerid)) != INVALID_VEHICLE_ID)
		SendClientMessageEx(playerid, COLOR_YELLOW, "[!] You're near vehicle ID %i", id);

	if((id = Object_Nearest(playerid)) != -1)
		SendClientMessageEx(playerid, COLOR_YELLOW, "[!] Yakýnýndaki Obje ID: %i", id);

	if((id = Spray_Nearest(playerid)) != -1)
		SendClientMessageEx(playerid, COLOR_YELLOW, "[!] Yakýnýndaki Spray Noktasý ID: %i", id);

	if(GetPVarInt(playerid, "AtGate") != -1)
	{
		new g = GetPVarInt(playerid, "AtGate");
		SendClientMessageEx(playerid, COLOR_YELLOW, "[!] Yakýnýndaki Gate ID: %i", g);
	}

//	if( (id = IsPlayerNearEntrance(playerid)) != -1)
//		SendClientMessageEx(playerid, COLOR_YELLOW, "[!] You're near Entrance ID %i", id);

	return 1;
}

CMD:setfightstyle(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 3)
		return UnAuthMessage(playerid);

	new
		playerb, style,
		str[128];

	if(sscanf(params, "ui", playerb, style))
	{
		SendClientMessage(playerid, COLOR_WHITE, "Stiller: 0 1 2 3 4 5");
		return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /setfightstyle [oyuncuID/isim] <style>");
	}

	if(style < 0 || style > 5)
		return SendClientMessage(playerid, COLOR_ADM, "Geçersiz stil.");

	if(!IsPlayerConnected(playerb) && pLoggedIn[playerb])
		return SendClientMessage(playerid, COLOR_ADM, "Oyuncu henüz giriþ yapmamýþ.");

	switch(style)
	{
		case 0: style = 15;
		case 1: style = 4;
		case 2: style = 5;
		case 3: style = 6;
		case 4: style = 7;
		case 5: style = 16;
	}

	PlayerData[playerb][pFightstyle] = style;
	SetPlayerFightingStyle(playerb, style);

	format(str, sizeof(str), "%s adlý yönetici %s adlý oyuncunun dövüþ stilini %s olarak güncellendi.", ReturnName(playerid), ReturnName(playerb), GetFightstyleName(style));
	adminWarn(3, str);

	if(playerb != playerid) SendClientMessageEx(playerb, COLOR_ADM, "Dövüþ stiliniz %s adlý yönetici tarafýndan deðiþtirildi.", ReturnName(playerid));
	return 1;
}

CMD:xmrcategory(playerid, params[])
{
	if (PlayerData[playerid][pAdmin] < 4) return 0;

	if (isnull(params))
	{
		SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /xmrcategory [category name]");
		SendClientMessage(playerid, COLOR_ADM, "This will create a new listed category in /setstation. ");
		return true;
	}

	new xmr_id = -1;
	for(new i = 1; i < MAX_XMR_CATEGORIES; i++)
	{
		if (!XMRCategoryData[i][XMRCategory])
		{
			xmr_id = i;
			break;
		}
	}
	if (xmr_id == -1)
	    return SendClientMessage(playerid, COLOR_ADM, "SERVER: Daha fazla radyo kategorisi ekleyemezsin limite ulaþýlmýþ.");

	XMRCategoryData[xmr_id][XMRID] = xmr_id;
	XMRCategoryData[xmr_id][XMRCategory] = xmr_id;
	format(XMRCategoryData[xmr_id][XMRCategoryName], 90, "%s", params);

	new query[128];
	mysql_format(m_Handle, query, sizeof(query), "INSERT INTO xmr_sub (`cat_name`, `category_id`) VALUES('%e', %d)", params, xmr_id);
	mysql_tquery(m_Handle, query);

	SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Ýstasyon kategorisi yaratýldý. Ýsim: %s(%i)", params, xmr_id);
	return true;
}

CMD:makexmr(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return 0;

	new cat_id, xmr_name[90], xmr_url[128];

	if(sscanf(params, "s[90]ds[128]", xmr_name, cat_id, xmr_url))
	{
		SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /makexmr [station name] [category ID] [station URL]");
		SendClientMessage(playerid, COLOR_ADM, "Example: /makexmr Powerhitz 1 ((Hip Hop)) http://powerhitz.com");
		return true;
	}

	new xmr_id = -1;
	for(new i = 1; i < MAX_XMR_SUBCATEGORY; i++)
	{
		if (!XMRData[i][xmrID]){
			xmr_id = i;
			break;
		}
	}

	if (xmr_id == -1)
	    return SendClientMessage(playerid, COLOR_ADM, "SERVER: Daha fazla radyo istasyonu ekleyemezsin limite ulaþýlmýþ.");

	format(XMRData[xmr_id][xmrStationURL], 128, "%s", xmr_url);
	format(XMRData[xmr_id][xmrName], 90, "%s", xmr_name);
	XMRData[xmr_id][xmrCategory] = cat_id;
	XMRData[xmr_id][xmrID] = xmr_id;

    new query[400];
	mysql_format(m_Handle, query, sizeof(query), "INSERT INTO xmr_data (`xmr_name`, `xmr_url`, `category`) VALUES('%e', '%e', %d)", xmr_name, xmr_url, cat_id);
	mysql_tquery(m_Handle, query);

	SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Ýstasyon yaratýldý. Ýsim: %s(%i)", xmr_name, xmr_id);
	SendClientMessageEx(playerid, COLOR_YELLOW, "URL: %s", xmr_url);
	return 1;
}

CMD:editxmrcat(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4)
		return false;

	new id, string[128], query[90], input[128];

	if(sscanf(params, "is[128]", id, input))
		return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /editxmrcat [category id] [category name]");

	if(!XMRCategoryData[id][XMRID]) return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} You specified an invalid category ID.");

	format(string, sizeof(string), "SERVER: Category %s(%d) renamed to %s", XMRCategoryData[id][XMRCategoryName], id, input);
	SendClientMessage(playerid, COLOR_YELLOW, string);

	format(XMRCategoryData[id][XMRCategoryName], 128, "%s", input);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE xmr_sub SET cat_name = '%e' WHERE id = %i", XMRCategoryData[id][XMRID]);
	mysql_pquery(m_Handle, query);
	return true;
}

CMD:editxmrstation(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4)
		return false;

	new id, string[128], a_string[128], b_string[128], query[256];

	if(sscanf(params, "is[128]S()[128]", id, a_string, b_string))
		return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /editxmrstation [station id] [name, url, category]");

	if(!strcmp(a_string, "name"))
	{
		new input[128];

		if(sscanf(b_string, "s[128]", input))
			return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /editxmrstation station_id name [new name]");

		format(string, sizeof(string), "SERVER: Station %s(%d) renamed to %s", XMRData[id][xmrName], id, input);
		SendClientMessage(playerid, COLOR_YELLOW, string);

		format(XMRData[id][xmrName], 128, "%s", input);

		mysql_format(m_Handle, query, sizeof(query), "UPDATE xmr_data SET xmr_name = '%e' WHERE id = %i",
			input, XMRData[id][xmrID]);
		mysql_pquery(m_Handle, query);
	}
	else if(!strcmp(a_string, "url"))
	{
		new input[128];

		if(sscanf(b_string, "s[128]", input))
			return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /editxmrstation station_id url [new url]");

		format(string, sizeof(string), "SERVER: Station %s(%d) URL is now : %s", XMRData[id][xmrName], id, input);
		SendClientMessage(playerid, COLOR_YELLOW, string);

		format(string, sizeof(string), "Previous: %s", XMRData[id][xmrStationURL]);
		SendClientMessage(playerid, COLOR_YELLOW, string);

		format(XMRData[id][xmrStationURL], 128, "%s", input);

		mysql_format(m_Handle, query, sizeof(query), "UPDATE xmr_data SET xmr_url = '%e' WHERE id = %i",
			input, XMRData[id][xmrID]);
		mysql_pquery(m_Handle, query);
	}
	else if(!strcmp(a_string, "category"))
	{
		new cat_id;

		if(sscanf(b_string, "d", cat_id))
			return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /editxmrstation station_id category [category id]");

		if(!XMRCategoryData[cat_id][XMRID])
			return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} You specified an invalid category ID.");

		format(string, sizeof(string), "SERVER: Station %s(%d) Category set to %s (%d)", XMRData[id][xmrName], id, XMRCategoryData[cat_id][XMRCategoryName], cat_id);
		SendClientMessage(playerid, COLOR_YELLOW, string);

		format(string, sizeof(string), "Previous: %s (%d)", XMRCategoryData[XMRData[id][xmrCategory]][XMRCategoryName], XMRData[id][xmrCategory]);
		SendClientMessage(playerid, COLOR_YELLOW, string);

		XMRData[id][xmrCategory] = cat_id;

		mysql_format(m_Handle, query, sizeof(query), "UPDATE xmr_data SET category = %i WHERE id = %i", cat_id, XMRData[id][xmrID]);
		mysql_pquery(m_Handle, query);
		return true;
	}
	return true;
}

// Level 5
CMD:callpaycheck(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 5) return UnAuthMessage(playerid);

	CallPaycheck(playerid);
	adminWarn(4, sprintf("%s adlý yönetici zamaný gelmeden payday zamanýný çaðýrdý.", ReturnName(playerid, 1)));

	//WriteLog("admin_logs/kane/callpaycheck_log.txt", "[%s] %s called a paycheck", ReturnDate(), ReturnName(playerid, 1));
	return true;
}

/*CMD:restartserver(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 6)
		return 0;

	if(isnull(params))
		return SendClientMessage(playerid, COLOR_ADM, "WARNING: Are you sure you want to restart the server? This will backup everything up beforehand.");

	new str[128];

	if(!strcmp(params, "YES", true))
	{
		format(str, sizeof(str), "AdmCmd: %s is restarting the server in the next 5 Seconds!", ReturnName(playerid));
		SendAdminMessage(COLOR_ADM, str);

		foreach(new i : Player)
		{
			if(pLoggedIn[i])
			{
				Player_Save(i);

			}
		}

		SaveProperties();
		SaveFactions();
		SaveBusinesses();
		SaveTolls();
		SavePaynSprays();
		SaveDoors();
		SavePropertyGarages();
		SaveTruckerPoints();

		foreach(new i : Player)
		{
			GameTextForPlayer(playerid, "~r~THE SERVER IS RESTARTING~n~~w~RELOG WITHIN THE NEXT 30 SECONDS", 5000, 1);
			if(i == playerid) continue;
   			StopAudioStreamForPlayer(playerid);
			KickEx(i);
		}

		SetTimer("RestartServer", 5000, false);
	}
	else return 0;
	return 1;
}*/

/*CMD:forceduty(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 5)
		return 0;

 	new
 		playerb;

	if(sscanf(params, "us[128]", playerb))
		return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /forceduty [oyuncuID/isim]");

	if(!IsPlayerConnected(playerb))return SendClientMessage(playerid, COLOR_GREY, "Girdiðin oyuncu ID veya isim aktif deðil.");
	if(!PlayerData[playerb][pAdmin])return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} This user isn't an administrator.");


	new
		str[128];

	if (PlayerData[playerb][pAdminDuty] == false)
	{
		PlayerData[playerb][pAdminDuty] = true;

		format(str, sizeof(str), "AdmCmd: %s is now on admin duty (forced by %s).", ReturnName(playerb, 1), ReturnName(playerid));
		SendAdminMessage(COLOR_YELLOW, str);

		GetPlayerHealth(playerb, oldHealth[playerb]);
		SetPlayerColor(playerb, COLOR_ADMIN);

		if (PlayerData[playerb][pMasked])
		{
			ShowPlayerNameTagForPlayer(playerb, playerb, 1);
		}
		Streamer_Update(playerb);

	}
	else
	{
		PlayerData[playerb][pAdminDuty] = false;

		format(str, sizeof(str), "AdmCmd: %s is now off admin duty (forced by %s).", ReturnName(playerb, 1), ReturnName(playerid));
		SendAdminMessage(COLOR_YELLOW, str);

		if (PlayerData[playerb][pLAWduty])
			SetPlayerColor(playerb, COLOR_COP);

		else if (PlayerData[playerb][pTesterDuty])
			SetPlayerColor(playerb, COLOR_TESTER);

		else if (StartedTaxiJob[playerb])
			SetPlayerColor(playerb, COLOR_YELLOW);

		else
			SetPlayerColor(playerb, COLOR_WHITE);

		if (PlayerData[playerb][pMasked])
		{
			ShowPlayerNameTagForPlayer(playerb, playerb, 0);
		}
		Streamer_Update(playerb);

		SetPlayerHealth(playerb, oldHealth[playerb]);
	}
	return true;
}*/

CMD:kickall(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 5) return 0;

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(PlayerData[i][pAdmin] == 0)
		{
	        SendClientMessage(i, COLOR_ADM, "SERVER: Bir yönetici tüm oyuncularý oyundan çýkardý.");
			KickEx(i);
		}
	}

    SendClientMessage(playerid, COLOR_GREY, "-> Tüm oyuncularý oyundan attýnýz.");
    SendClientMessageToAll(COLOR_ADM, sprintf("AdmCmd: %s tüm oyuncularý oyundan çýkardý.", ReturnName(playerid)));
    return 1;
}


CMD:setname(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 6) return UnAuthMessage(playerid);

	new id, Name[24];
	if(sscanf(params, "us[24]", id, Name)) return SendUsageMessage(playerid, "/setname [oyuncu ID/isim] [Ýsim_Soyisim]");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");

	SendClientMessageEx(id, COLOR_YELLOW, "SERVER: Yeni adýnýz %s olarak güncellendi.", Name);
	SetPlayerName(id, Name);

	new query[90];
	mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET Name = '%e' WHERE id = %i", Name, PlayerData[id][pSQLID]);
	mysql_tquery(m_Handle, query);
	return 1;
}

CMD:givedriverlicense(playerid, params[])
{
	if(!pLoggedIn[playerid])return true;
	if(PlayerData[playerid][pAdmin] < 2)return false;

	new playerb, give_amount;

	if(sscanf(params, "u", playerb))return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /giveweaponlicense [oyuncuID/isim]");
	if(!IsPlayerConnected(playerb))return SendClientMessage(playerid, COLOR_GREY, "Girdiðin oyuncu ID veya isim aktif deðil.");
	if(!pLoggedIn[playerb])return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} Bu oyuncu giriþ yapmamýþ.");

	if(PlayerData[playerb][pDriversLicense])
	{
			PlayerData[playerb][pDriversLicense] = false;
			SendMessage(playerid, "%s adlý oyuncunun sürücü lisansýný aldýnýz.", ReturnName(playerb));
			adminWarn(1, sprintf("%s adlý yönetici %s adlý oyuncunun sürücü lisansýna el koydu.", ReturnName(playerid), ReturnName(playerb)));
	}
	else
	{
		PlayerData[playerb][pDriversLicense] = true;
		SendMessage(playerid, "%s adlý oyuncuya sürücü lisansý verdiniz.", ReturnName(playerb));
		adminWarn(1, sprintf("%s adlý yönetici %s adlý oyuncuya sürücü lisansý verdi.", ReturnName(playerid), ReturnName(playerb)));
	}
	return true;
}

CMD:giveweaponlicense(playerid, params[])
{
	if(!pLoggedIn[playerid])return true;
	if(PlayerData[playerid][pAdmin] < 2)return false;

	new playerb;

	if(sscanf(params, "u", playerb))return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /giveweaponlicense [oyuncuID/isim]");
	if(!IsPlayerConnected(playerb))return SendClientMessage(playerid, COLOR_GREY, "Girdiðin oyuncu ID veya isim aktif deðil.");
	if(!pLoggedIn[playerb])return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} Bu oyuncu giriþ yapmamýþ.");

	if(PlayerData[playerb][pWeaponsLicense])
	{
			PlayerData[playerb][pWeaponsLicense] = false;
			SendMessage(playerid, "%s adlý oyuncunun silah lisansýný aldýnýz.", ReturnName(playerb));
			adminWarn(1, sprintf("%s adlý yönetici %s adlý oyuncunun silah lisansýna el koydu.", ReturnName(playerid), ReturnName(playerb)));
	}
	else
	{
		PlayerData[playerb][pWeaponsLicense] = true;
		SendMessage(playerid, "%s adlý oyuncuya silah lisansý verdiniz.", ReturnName(playerb));
		adminWarn(1, sprintf("%s adlý yönetici %s adlý oyuncuya silah lisansý verdi.", ReturnName(playerid), ReturnName(playerb)));
	}
	return true;
}

CMD:givemedicallicense(playerid, params[])
{
	if(!pLoggedIn[playerid])return true;
	if(PlayerData[playerid][pAdmin] < 2)return false;

	new playerb;

	if(sscanf(params, "u", playerb))return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /givemedicallicense [oyuncuID/isim]");
	if(!IsPlayerConnected(playerb))return SendClientMessage(playerid, COLOR_GREY, "Girdiðin oyuncu ID veya isim aktif deðil.");
	if(!pLoggedIn[playerb])return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} Bu oyuncu giriþ yapmamýþ.");

	if(PlayerData[playerb][pMedicalLicense])
	{
			PlayerData[playerb][pMedicalLicense] = false;
			SendMessage(playerid, "%s adlý oyuncunun medikal lisansýný aldýnýz.", ReturnName(playerb));
			adminWarn(1, sprintf("%s adlý yönetici %s adlý oyuncunun medikal lisansýna el koydu.", ReturnName(playerid), ReturnName(playerb)));
	}
	else
	{
		PlayerData[playerb][pMedicalLicense] = true;
		SendMessage(playerid, "%s adlý oyuncuya medikal lisansý verdiniz.", ReturnName(playerb));
		adminWarn(1, sprintf("%s adlý yönetici %s adlý oyuncuya medikal lisansý verdi.", ReturnName(playerid), ReturnName(playerb)));
	}
	return true;
}

CMD:giveflylicense(playerid, params[])
{
	if(!pLoggedIn[playerid])return true;
	if(PlayerData[playerid][pAdmin] < 2)return false;

	new playerb;

	if(sscanf(params, "u", playerb))return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /giveflylicense [oyuncuID/isim]");
	if(!IsPlayerConnected(playerb))return SendClientMessage(playerid, COLOR_GREY, "Girdiðin oyuncu ID veya isim aktif deðil.");
	if(!pLoggedIn[playerb])return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} Bu oyuncu giriþ yapmamýþ.");

	if(PlayerData[playerb][pFlyLicense])
	{
			PlayerData[playerb][pFlyLicense] = false;
			SendMessage(playerid, "%s adlý oyuncunun uçuþ lisansýný aldýnýz.", ReturnName(playerb));
			adminWarn(1, sprintf("%s adlý yönetici %s adlý oyuncunun uçuþ lisansýna el koydu.", ReturnName(playerid), ReturnName(playerb)));
	}
	else
	{
		PlayerData[playerb][pFlyLicense] = true;
		SendMessage(playerid, "%s adlý oyuncuya uçuþ lisansý verdiniz.", ReturnName(playerb));
		adminWarn(1, sprintf("%s adlý yönetici %s adlý oyuncuya uçuþ lisansý verdi.", ReturnName(playerid), ReturnName(playerb)));
	}
	return true;
}

CMD:givemoney(playerid, params[])
{
	if(!pLoggedIn[playerid])return true;
	if(PlayerData[playerid][pAdmin] < 5)return false;

	new playerb, give_amount, string[128];

	if(sscanf(params, "ud", playerb, give_amount))return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /givemoney [oyuncuID/isim] [amount]");
	if(!IsPlayerConnected(playerb))return SendClientMessage(playerid, COLOR_GREY, "Girdiðin oyuncu ID veya isim aktif deðil.");
	if(!pLoggedIn[playerb])return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} Bu oyuncu giriþ yapmamýþ.");

	format(string, sizeof(string), "%s adlý yönetici %s adlý oyuncuya %s$ verdi.", ReturnName(playerid, 1), ReturnName(playerb, 1), MoneyFormat(give_amount));
	adminWarn(4, string);

	GiveMoney(playerb, give_amount);
	return true;
}

/*//Graffiti Commands
CMD:graffitiperm(playerid, params[])
{
	new playerb, string[128];

	if(!PlayerData[playerid][pAdmin] && !PlayerData[playerid][pTester])
		return SendClientMessage(playerid, COLOR_ADM, "Bu komutu kullanamazsýn.");

	if(sscanf(params, "u", playerb))
		return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /graffitiperm [oyuncu ID/isim]");

	if(!IsPlayerConnected(playerb))
		return SendClientMessage(playerid, COLOR_GREY, "Girdiðin oyuncu ID veya isim aktif deðil.");

	if(!pLoggedIn[playerb])
		return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} Bu oyuncu giriþ yapmamýþ.");

	GivePlayerWeaponEx(playerb, 41, 99999, WEAPON_SERVER_GIVEN);

	if(PlayerData[playerid][pTester] && !PlayerData[playerid][pAdmin])
	{
		format(string, sizeof(string), "Tester %s %s adlý kiþiye graffiti yetkisi verdi.", ReturnName(playerid), ReturnName(playerb));
		adminWarn(1, string);
	}

	SendClientMessageEx(playerb, COLOR_YELLOW, "[!] %s sana graffiti yetkisi verdi. /graffiti.", ReturnName(playerid, 1));
	SendClientMessageEx(playerid, COLOR_YELLOW, "[!] %s isimli kiþiye graffiti yetkisi verdin.", ReturnName(playerb));

	sprayPermission[playerb] = true;
	format(graffitiText[playerb], 65, " ");

	//WriteLog("Graffiti/spray_perms.txt", "[%s] %s granted %s", ReturnDate(), ReturnName(playerid, 1), ReturnName(playerb, 1));
	return true;
}*/


CMD:t(playerid, params[])
{
	if (!PlayerData[playerid][pTester]) return UnAuthMessage(playerid);
	if(isnull(params)) return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /t [yazý]");

	new
		str[192];

	if(strlen(params) > 84)
	{
   		format(str, sizeof(str), "*Tester %s (%s): %.84s", ReturnName(playerid, 1), PlayerData[playerid][pAdminName], params);
		SendTesterMessage(COLOR_YELLOW, str);

		format(str, sizeof(str), "*Tester %s (%s): ...%s", ReturnName(playerid, 1), PlayerData[playerid][pAdminName], params[84]);
		SendTesterMessage(COLOR_YELLOW, str);
	}
	else
	{
   		format(str, sizeof(str), "*Tester %s (%s): %s", ReturnName(playerid, 1), PlayerData[playerid][pAdminName], params);
		SendTesterMessage(COLOR_YELLOW, str);
	}

	//WriteLog("gamemaster_logs/gmchat_log.txt", "[%s] %s: %s", ReturnDate(), ReturnName(playerid, 1), params);
	return true;
}

CMD:at(playerid, params[])
{
	if (!PlayerData[playerid][pTester] && !PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);
	if(isnull(params)) return SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /at [yazý]");

	new
		str[192];

	if(strlen(params) > 89)
	{
   		format(str, sizeof(str), "[atChat] %s(ID: %i): %.84s", PlayerData[playerid][pAdminName], playerid, params);
		SendStaffMessage(COLOR_ORANGE, str);

		format(str, sizeof(str), "[atChat] %s(ID: %i): ...%s", PlayerData[playerid][pAdminName], playerid, params[84]);
		SendStaffMessage(COLOR_ORANGE, str);
	}
	else
	{
   		format(str, sizeof(str), "[atChat] %s(ID: %i): %s", PlayerData[playerid][pAdminName], playerid, params);
		SendStaffMessage(COLOR_ORANGE, str);
	}

	//WriteLog("gamemaster_logs/staffchat_log.txt", "[%s] %s: %s", ReturnDate(), ReturnName(playerid, 1), params);
	return 1;
}

CMD:tduty(playerid, params[])
{
	if (!PlayerData[playerid][pTester] && !PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	if (!PlayerData[playerid][pTesterDuty])
	{
		PlayerData[playerid][pTesterDuty] = true;
		SendStaffMessage(COLOR_YELLOW, "AdmCmd: %s isimli tester iþbaþýna geçti.", ReturnName(playerid, 1));
		if(!PlayerData[playerid][pAdminDuty]) SetPlayerColor(playerid, COLOR_TESTER);
	}
	else
	{
		SendStaffMessage(COLOR_YELLOW, "AdmCmd: %s isimli tester iþbaþýndan çýktý.", ReturnName(playerid, 1));
		PlayerData[playerid][pTesterDuty] = false;

		if(PlayerData[playerid][pLAWduty])
			SetPlayerColor(playerid, COLOR_COP);
		else if (StartedTaxiJob[playerid])
			SetPlayerColor(playerid, COLOR_TAXIDUTY);
		else
			SetPlayerColor(playerid, COLOR_WHITE);
	}
	return 1;
}

CMD:level(playerid, params[])
{
	if(!PlayerData[playerid][pTester] && !PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	static level;
	if(sscanf(params, "i", level)) return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /level [level]");
	if(!level) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Sýfýr deðerinde level var mý?");

	SendClientMessageEx(playerid, COLOR_ADM, "%i level olan kiþiler:", level);
	foreach(new i : Player) if(PlayerData[i][pLevel] == level)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "%s [ID: %i]", ReturnName(i), i);
	}
	return 1;
}

CMD:thelp(playerid, params[])
{
	if(!PlayerData[playerid][pTester] && !PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	SendClientMessage(playerid, COLOR_DARKGREEN, "[Genel] {FFFFFF}/tduty, /at (tester chat), /yardimkabul, /yardimred, /yardimlar");
	SendClientMessage(playerid, COLOR_DARKGREEN, " ");
	SendClientMessage(playerid, COLOR_DARKGREEN, "___________________________________________");
	return 1;
}

CMD:rac(playerid, params[]) return cmd_respawnallcars(playerid, params);
CMD:respawnallcars(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	for(new i = 1, j = GetVehiclePoolSize(); i <= j; i++)
	{
	    if (IsValidVehicle(i))
	   	{
	        if (!IsVehicleOccupied(i)) SetVehicleToRespawn(i);
    	}
	}

	SendClientMessage(playerid, COLOR_GREY, "SERVER: Kullanýlmayan bütün araçlarý spawnladýn.");
	adminWarn(1, sprintf("%s isimli yönetici kullanýlmayan bütün araçlarý respawnladý.", ReturnName(playerid, 1)));
	return 1;
}

CMD:aekle(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);

	static type[24], string[128];
	if(sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/aekle [birlik/kiralik]");
		return 1;
	}

	if(!strcmp(type, "birlik", true))
	{
		new factionid, model[32], color[2], siren;
		if(sscanf(string, "is[32]I(-1)I(-1)I(0)", factionid, model, color[0], color[1], siren))
			return SendUsageMessage(playerid, "/aekle birlik [birlik ID] [model adý/ID] [renk1] [renk2] [siren(0/1)]");

		if(!Iter_Contains(Factions, factionid)) return SendErrorMessage(playerid, "Hatalý birlik ID girdin.");
		if((model[0] = GetVehicleModelByName(model)) == 0) return SendErrorMessage(playerid, "Hatalý model ID girdiniz.");

		if(color[0] == -1) color[0] = random(255);
		if(color[1] == -1) color[1] = random(255);

		new
			Float: x,
			Float: y,
			Float: z,
			Float: a;

		GetPlayerPos(playerid, x, y, z);
		GetPlayerFacingAngle(playerid, a);

		new dbid;
		new vehicleid = CreateVehicle(model[0], x, y, z, a, color[0], color[1], -1, siren);
		SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
		LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
		//PutPlayerInVehicle(playerid, vehicleid, 0);

		new Cache: cache = mysql_query(m_Handle, "INSERT INTO vehicles (RentalID) VALUES (0)");
		if(vehicleid != INVALID_VEHICLE_ID)
		{
			CarData[vehicleid][carID] = cache_insert_id();
			dbid = CarData[vehicleid][carID];
			CarData[vehicleid][carModel] = GetVehicleModel(vehicleid);
			CarData[vehicleid][carOwnerID] = 0;
			CarData[vehicleid][carFaction] = factionid;
			CarData[vehicleid][carRental] = 0;
			CarData[vehicleid][carRentalPrice] = 0;
			CarData[vehicleid][carRentedBy] = 0;

			format(CarData[vehicleid][carPlates], 20, "%s", FactionData[factionid][FactionAbbrev]);
			SetVehicleNumberPlate(vehicleid, CarData[vehicleid][carPlates]);

			format(CarData[vehicleid][carName], 35, ReturnVehicleModelName(GetVehicleModel(vehicleid)));
			format(CarData[vehicleid][carSign], 45, "%s", FactionData[factionid][FactionAbbrev]);

			if(IsValidDynamic3DTextLabel(CarData[vehicleid][carSign3D])) DestroyDynamic3DTextLabel(CarData[vehicleid][carSign3D]);

			CarData[vehicleid][carPos][0] = x;
			CarData[vehicleid][carPos][1] = y;
			CarData[vehicleid][carPos][2] = z;
			CarData[vehicleid][carPos][3] = a;

			CarData[vehicleid][carInterior] = GetPlayerInterior(playerid);
			CarData[vehicleid][carWorld] = GetPlayerVirtualWorld(playerid);

			CarData[vehicleid][carColor1] = color[0];
			CarData[vehicleid][carColor2] = color[1];

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
			CarData[vehicleid][carBattery] = GetVehicleCondition(vehicleid, 2);
			CarData[vehicleid][carEngine] = GetVehicleCondition(vehicleid, 1);

			CarData[vehicleid][carLock] = 0;
			CarData[vehicleid][carAlarm] = 0;
			CarData[vehicleid][carImmob] = 0;
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
			SetVehicleHealth(vehicleid, CarData[vehicleid][carLastHealth]);

			CarData[vehicleid][carPanelStatus] = CarData[vehicleid][carDoorsStatus] = 0;
			CarData[vehicleid][carLightsStatus] = CarData[vehicleid][carTiresStatus] = 0;

			CarData[vehicleid][carExists] = true;
			CarData[vehicleid][carTweak] = false;
			CarData[vehicleid][carRev] = 0;

			Car_Save(vehicleid);
		}

		cache_delete(cache);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn tipi birlik olarak ayarlandý. (%s)", vehicleid, FactionData[factionid][FactionAbbrev]);
		Vehicle_DefaultValues(vehicleid);
		DestroyVehicle(vehicleid);

		new query[55];
		mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM vehicles WHERE id = %i", dbid);
		mysql_tquery(m_Handle, query, "SQL_LoadVehicles");
		return 1;
	}
	else if(!strcmp(type, "kiralik", true))
	{
		new model[32], color[2];
		if(sscanf(string, "s[32]I(-1)I(-1)", model, color[0], color[1]))
			return SendUsageMessage(playerid, "/aekle kiralik [model adý/ID] [renk1] [renk2]");

		if((model[0] = GetVehicleModelByName(model)) == 0) return SendErrorMessage(playerid, "Hatalý model ID girdiniz.");

		if(color[0] == -1) color[0] = random(255);
		if(color[1] == -1) color[1] = random(255);

		new
			Float: x,
			Float: y,
			Float: z,
			Float: a;

		GetPlayerPos(playerid, x, y, z);
		GetPlayerFacingAngle(playerid, a);

		new dbid;
		new vehicleid = CreateVehicle(model[0], x, y, z, a, color[0], color[1], -1, false);
		SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
		LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
		//PutPlayerInVehicle(playerid, vehicleid, 0);

		new Cache: cache = mysql_query(m_Handle, "INSERT INTO vehicles (RentalID) VALUES (1)");
		if(vehicleid != INVALID_VEHICLE_ID)
		{
			CarData[vehicleid][carID] = cache_insert_id();
			dbid = CarData[vehicleid][carID];
			CarData[vehicleid][carModel] = GetVehicleModel(vehicleid);
			CarData[vehicleid][carOwnerID] = 0;
			CarData[vehicleid][carFaction] = -1;
			CarData[vehicleid][carRental] = 1;
			CarData[vehicleid][carRentalPrice] = 2500;
			CarData[vehicleid][carRentedBy] = 0;

			format(CarData[vehicleid][carPlates], 20, "KIRALIK");
			SetVehicleNumberPlate(vehicleid, CarData[vehicleid][carPlates]);

			format(CarData[vehicleid][carName], 35, ReturnVehicleModelName(GetVehicleModel(vehicleid)));
			format(CarData[vehicleid][carSign], 45, "-");

			if(IsValidDynamic3DTextLabel(CarData[vehicleid][carSign3D])) DestroyDynamic3DTextLabel(CarData[vehicleid][carSign3D]);

			CarData[vehicleid][carPos][0] = x;
			CarData[vehicleid][carPos][1] = y;
			CarData[vehicleid][carPos][2] = z;
			CarData[vehicleid][carPos][3] = a;

			CarData[vehicleid][carInterior] = GetPlayerInterior(playerid);
			CarData[vehicleid][carWorld] = GetPlayerVirtualWorld(playerid);

			CarData[vehicleid][carColor1] = color[0];
			CarData[vehicleid][carColor2] = color[1];

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
			CarData[vehicleid][carBattery] = GetVehicleCondition(vehicleid, 2);
			CarData[vehicleid][carEngine] = GetVehicleCondition(vehicleid, 1);

			CarData[vehicleid][carLock] = 0;
			CarData[vehicleid][carAlarm] = 0;
			CarData[vehicleid][carImmob] = 0;
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
			SetVehicleHealth(vehicleid, CarData[vehicleid][carLastHealth]);

			CarData[vehicleid][carPanelStatus] = CarData[vehicleid][carDoorsStatus] = 0;
			CarData[vehicleid][carLightsStatus] = CarData[vehicleid][carTiresStatus] = 0;

			CarData[vehicleid][carExists] = true;
			CarData[vehicleid][carTweak] = false;
			CarData[vehicleid][carRev] = 0;
			Car_Save(vehicleid);
		}

		cache_delete(cache);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn tipi kiralýk olarak ayarlandý.", vehicleid);
		Vehicle_DefaultValues(vehicleid);
		DestroyVehicle(vehicleid);

		new query[55];
		mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM vehicles WHERE id = %i", dbid);
		mysql_tquery(m_Handle, query, "SQL_LoadVehicles");
		return 1;
	}
	else SendUsageMessage(playerid, "/aekle [birlik/kiralik]");
	return 1;
}

CMD:asil(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);

	new vehicleid;
	if(IsPlayerInAnyVehicle(playerid))
	{
		vehicleid = GetPlayerVehicleID(playerid);
	} else {
		if(sscanf(params, "i", vehicleid)) return SendUsageMessage(playerid, "/asil [araç ID]");
		if(!IsValidVehicle(vehicleid)) return SendErrorMessage(playerid, "Hatalý araç ID girdin.");
	}

	if(IsValidCar(vehicleid) && !IsValidPlayerCar(vehicleid))
	{
		if(IsValidRentalCar(vehicleid)) adminWarn(4, sprintf("%s isimli yönetici %i numaralý kiralýk aracý sildi.", ReturnName(playerid), vehicleid));
		else if(IsValidFactionCar(vehicleid)) adminWarn(4, sprintf("%s isimli yönetici %i numaralý birlik aracýný sildi.", ReturnName(playerid), vehicleid));

		new query[55], dbid = CarData[vehicleid][carID];
		mysql_format(m_Handle, query, sizeof(query), "DELETE FROM vehicles WHERE id = %i", dbid);
		mysql_tquery(m_Handle, query);

		Vehicle_DefaultValues(vehicleid);
		DestroyVehicle(vehicleid);
		return 1;
	}
	else SendErrorMessage(playerid, "Bu araç silinemez.");
	return 1;
}

CMD:atamir(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 1) return UnAuthMessage(playerid);

	new vehicleid, Float: angle;
	if(IsPlayerInAnyVehicle(playerid))
	{
		vehicleid = GetPlayerVehicleID(playerid);
	} else {
		if(sscanf(params, "i", vehicleid)) return SendUsageMessage(playerid, "/atamir [araç ID]");
		if(!IsValidVehicle(vehicleid)) return SendErrorMessage(playerid, "Hatalý araç ID girdin.");
	}

	RepairVehicle(vehicleid);
	SetVehicleHealth(vehicleid, CarData[vehicleid][carMaxHealth]);
	GetVehicleZAngle(vehicleid, angle);
	SetVehicleZAngle(vehicleid, angle);

	adminWarn(4, sprintf("%s isimli yönetici %i numaralý aracý tamir etti.", ReturnName(playerid, 1), GetPlayerVehicleID(playerid)));
	return 1;
}

CMD:apark(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 1) return UnAuthMessage(playerid);

	new
		vehicleid, ownerid;

	if(IsPlayerInAnyVehicle(playerid))
	{
		vehicleid = GetPlayerVehicleID(playerid);
		if(!IsValidPlayerCar(vehicleid)) return SendErrorMessage(playerid, "Park etmek istediðiniz araç bir kiþiye ait deðil.");
		ownerid = CarData[vehicleid][carOwnerID];
	}
	else
	{
		if(sscanf(params, "i", vehicleid)) return SendUsageMessage(playerid, "/apark [araç ID]");
		if(!IsValidVehicle(vehicleid)) return SendErrorMessage(playerid, "Hatalý araç ID girdin.");
		if(!IsValidPlayerCar(vehicleid)) return SendErrorMessage(playerid, "Park etmek istediðiniz araç bir kiþiye ait deðil.");
		ownerid = CarData[vehicleid][carOwnerID];
	}

	foreach (new i : Player)
	{
		if(strfind(ReturnName(i, 1), ReturnSQLName(ownerid), true) != -1)
		{
			_has_vehicle_spawned[i] = false;
			_has_spawned_vehicleid[i] = INVALID_VEHICLE_ID;
			SendClientMessageEx(i, COLOR_ADM, "SERVER: %s model aracýn %s isimli yönetici tarafýndan parkedildi.", ReturnVehicleName(vehicleid), ReturnName(playerid, 1));
		}
		else
		{
			new query[66];
			mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET HasCarSpawned = 0 WHERE id = %i", ownerid);
			mysql_tquery(m_Handle, query);
		}
	}

	Car_Save(vehicleid);
	adminWarn(1, sprintf("%s isimli yönetici %s isimli oyuncunun %s model aracýný park etti.", ReturnName(playerid), ReturnSQLName(ownerid), ReturnVehicleName(vehicleid)));
	//LogVehicleAction(vehicleid, sprintf("%s tarafýndan park edildi.", ReturnName(playerid)));
	Vehicle_DefaultValues(vehicleid);
	DestroyVehicle(vehicleid);
	return 1;
}

CMD:abilgi(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 1) return UnAuthMessage(playerid);

	new vehicleid;
	if(IsPlayerInAnyVehicle(playerid))
	{
		vehicleid = GetPlayerVehicleID(playerid);
	} else {
		if(sscanf(params, "i", vehicleid)) return SendUsageMessage(playerid, "/abilgi [araç ID]");
		if(!IsValidVehicle(vehicleid)) return SendErrorMessage(playerid, "Hatalý araç ID girdin.");
	}

	SendClientMessage(playerid, COLOR_DARKGREEN, "__________________________________________");

	if(IsValidCar(vehicleid))
	{
		if(IsValidPlayerCar(vehicleid)) SendClientMessageEx(playerid, COLOR_GRAD1, "Tip:[Þahsi] Sahip:[%s (Kullanýcý DBID:%i)]", ReturnSQLName(CarData[vehicleid][carOwnerID]), CarData[vehicleid][carOwnerID]);
		if(IsValidFactionCar(vehicleid)) SendClientMessageEx(playerid, COLOR_GRAD1, "Tip:[Birlik] Sahip:[%s (Birlik DBID: %i)]", Faction_GetName(CarData[vehicleid][carFaction]), CarData[vehicleid][carFaction]);
		if(IsValidRentalCar(vehicleid)) SendClientMessageEx(playerid, COLOR_GRAD1, "Tip:[Kiralýk] Kira Durumu:[%s] Kira Ücreti:[$%s] Kiralayan:[%s (Kullanýcý DBID: %i)]", CarData[vehicleid][carRentedBy] ? "Kiralanmýþ" : "Kiralanmamýþ", MoneyFormat(CarData[vehicleid][carRentalPrice]), ReturnSQLName(CarData[vehicleid][carRentedBy]), CarData[vehicleid][carRentedBy]);

		SendClientMessageEx(playerid, COLOR_GRAD2, "DBID:[%i] ModelID:[%i] AraçÝsim:[%s] Renk1:[{%06x}%i{FFFFFF}] Renk2:[{%06x}%i{FFFFFF}] Paintjob:[%i]", CarData[vehicleid][carID], CarData[vehicleid][carModel], CarData[vehicleid][carName], VehicleColoursTableRGBA[CarData[vehicleid][carColor1]] >>> 8, CarData[vehicleid][carColor1], VehicleColoursTableRGBA[CarData[vehicleid][carColor2]] >>> 8, CarData[vehicleid][carColor2], CarData[vehicleid][carPaintjob]);
		SendClientMessageEx(playerid, COLOR_GRAD1, "XMR:[%s] Çekilme Durumu:[%s] Motor Ömrü:[%.2f] Batarya Ömrü:[%.2f] Kilit Seviyesi:[%i] Alarm Seviyesi:[%i]", CarData[vehicleid][carXMR] ? ("Var") : ("Yok"), CarData[vehicleid][carImpounded] != -1 ? ("Çekilmiþ") : ("Çekilmemiþ"), CarData[vehicleid][carEngine], CarData[vehicleid][carBattery], CarData[vehicleid][carLock], CarData[vehicleid][carAlarm]);
		SendClientMessageEx(playerid, COLOR_GRAD2, "Immobiliser Seviyesi:[%i] Sigorta:[%i] Patlama Sayýsý:[%i] Plaka:[%s] Kilit Durumu:[%s] Yakýt:[%f]", CarData[vehicleid][carImmob], CarData[vehicleid][carInsurance], CarData[vehicleid][carTimeDestroyed], CarData[vehicleid][carPlates], CarData[vehicleid][carLocked] ? ("Kilitli") : ("Deðil"), CarData[vehicleid][carFuel]);
		SendClientMessageEx(playerid, COLOR_GRAD2, "Son Binen Þoför:[%s] Son Binen Yolcu:[%s]", ReturnSQLName(CarData[vehicleid][carlastPassenger]), ReturnSQLName(CarData[vehicleid][carlastDriver]));
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Tip:[Statik] ModelID:[%i] AraçÝsim:[%s]", GetVehicleModel(vehicleid), ReturnVehicleName(vehicleid));
		SendClientMessageEx(playerid, COLOR_GRAD2, "Son Binen Þoför:[%s] Son Binen Yolcu:[%s]", ReturnSQLName(CarlastPassenger[vehicleid]), ReturnSQLName(CarlastDriver[vehicleid]));
	}

	SendClientMessage(playerid, COLOR_DARKGREEN, "__________________________________________");
	return 1;
}

CMD:aduzenle(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);
	if(!IsPlayerInAnyVehicle(playerid)) return SendErrorMessage(playerid, "Araç içerisinde deðilsin.");
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendErrorMessage(playerid, "Þoför koltuðunda deðilsin.");

	new
		vehicleid = GetPlayerVehicleID(playerid);

	static type[24], string[128];
	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/aduzenle [parametre]");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}model, birlik, kiralayan, kiraucreti, plaka");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}aracisim, sign, pozisyon, renk, xmr, siren, kilit");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}yakit, km, zirh, motoromru, bataryaomru");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ks, as, is, sigorta, sigortasure, sigortaucret");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ps, paintjob");
		return 1;
	}

	if(!strcmp(type, "model", true))
	{
		if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece sisteme kayýtlý araçlarda kullanýlýr.");

		new model[32], dbid = CarData[vehicleid][carID];
		if(sscanf(string, "s[32]", model)) return SendUsageMessage(playerid, "/aduzenle model [model ID/adý]");
		if((model[0] = GetVehicleModelByName(model)) == 0) return SendErrorMessage(playerid, "Hatalý model ID girdiniz.");
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn modelini %s olarak güncelledin.", vehicleid, ReturnVehicleModelName(model[0]));
		format(CarData[vehicleid][carName], 35, ReturnVehicleModelName(GetVehicleModel(vehicleid)));
		CarData[vehicleid][carModel] = model[0];
		Car_Save(vehicleid);

		Vehicle_DefaultValues(vehicleid);
		DestroyVehicle(vehicleid);

		new query[55];
		mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM vehicles WHERE id = %i", dbid);
		mysql_tquery(m_Handle, query, "SQL_LoadVehicles");
		return 1;
	}
	else if(!strcmp(type, "pozisyon", true))
	{
		if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece sisteme kayýtlý araçlarda kullanýlýr.");

		new dbid = CarData[vehicleid][carID];
		GetVehiclePos(vehicleid, CarData[vehicleid][carPos][0], CarData[vehicleid][carPos][1], CarData[vehicleid][carPos][2]);
		GetVehicleZAngle(vehicleid, CarData[vehicleid][carPos][3]);

		CarData[vehicleid][carInterior] = GetPlayerInterior(playerid);
		CarData[vehicleid][carWorld] = GetPlayerVirtualWorld(playerid);

		RemovePlayerFromVehicle(playerid);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn pozisyonunu güncelledin.", vehicleid);
		Car_Save(vehicleid);

		Vehicle_DefaultValues(vehicleid);
		DestroyVehicle(vehicleid);

		new query[55];
		mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM vehicles WHERE id = %i", dbid);
		mysql_tquery(m_Handle, query, "SQL_LoadVehicles");
		return 1;
 	}
 	else if (!strcmp(type, "plaka", true))
	{
		if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece özel araçlarda kullanýlýr.");

		new car_plate[20];
		if(sscanf(string, "s[20]", car_plate)) return SendUsageMessage(playerid, "/aduzenle plaka [yeni plaka]");
		if(strlen(car_plate) > 20) return SendErrorMessage(playerid, "Plaka en fazla 20 karakter olabilir.");

		format(CarData[vehicleid][carPlates], 20, car_plate);
		SetVehicleNumberPlate(vehicleid, CarData[vehicleid][carPlates]);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn plakasýný %s olarak güncelledin.", vehicleid, car_plate);

		SetVehicleToRespawn(vehicleid);
		PutPlayerInVehicle(playerid, vehicleid, 0);
		Car_Save(vehicleid);
		return 1;
	}
	else if(!strcmp(type, "sign", true))
	{
		if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece özel araçlarda kullanýlýr.");

		new car_sign[45];
		if(sscanf(string, "s[45]", car_sign)) return SendUsageMessage(playerid, "/aduzenle sign [car-sign]");

		if(!strcmp(string, "kaldir", true))
		{
			format(CarData[vehicleid][carSign], 45, "-");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Carsign baþarýyla silindi.");
			if(IsValidDynamic3DTextLabel(CarData[vehicleid][carSign3D])) DestroyDynamic3DTextLabel(CarData[vehicleid][carSign3D]);
			Car_Save(vehicleid);
			return 1;
		}

		if(strlen(car_sign) > 45) return SendErrorMessage(playerid, "Car-sign en fazla 45 karakter olabilir.");
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn car-signi %s olarak güncelledin.", vehicleid, car_sign);
		format(CarData[vehicleid][carSign], 45, car_sign);

		if(!IsValidDynamic3DTextLabel(CarData[vehicleid][carSign3D])) CarData[vehicleid][carSign3D] = CreateDynamic3DTextLabel(sprintf("%s", CarData[vehicleid][carSign]), COLOR_WHITE, -0.7, -1.9, -0.3, 10.0, INVALID_PLAYER_ID, vehicleid, 0, -1, -1, -1);
		else UpdateDynamic3DTextLabelText(CarData[vehicleid][carSign3D], COLOR_WHITE, sprintf("%s", CarData[vehicleid][carSign]));
		Car_Save(vehicleid);
		return 1;
	}
	else if (!strcmp(type, "yakit", true))
	{
		if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece sisteme kayýtlý araçlarda kullanýlýr.");

		new Float: yakit;
		if(sscanf(string, "f", yakit)) return SendUsageMessage(playerid, "/aduzenle yakit [miktar(1-100)]");
		if(yakit < 1.0 || yakit > 100.0) return SendErrorMessage(playerid, "Yakýt miktarý en az 1 en fazla 100 olabilir.");

		CarData[vehicleid][carFuel] = yakit;
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn yakýtýný %f olarak güncelledin.", vehicleid, yakit);
		Car_Save(vehicleid);
		return 1;
	}
	else if (!strcmp(type, "zirh", true))
	{
		if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece sisteme kayýtlý araçlarda kullanýlýr.");

		new Float: arm;
		if(sscanf(string, "f", arm)) return SendUsageMessage(playerid, "/aduzenle zirh [miktar]");
		if(arm < 1.0 || arm > 250.0) return SendErrorMessage(playerid, "Zýrh miktarý en az 1 en fazla 250 olabilir.");

		CarData[vehicleid][carArmour] = arm;
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn zýrhýný %f olarak güncelledin.", vehicleid, arm);
		SetVehicleToRespawn(vehicleid);
		PutPlayerInVehicle(playerid, vehicleid, 0);
		Car_Save(vehicleid);
		return 1;
	}
	else if (!strcmp(type, "motoromru", true))
	{
		if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece sisteme kayýtlý araçlarda kullanýlýr.");

		new Float: arm;
		if(sscanf(string, "f", arm)) return SendUsageMessage(playerid, "/aduzenle motoromru [miktar]");
		if(arm < 1.0 || arm > 100.0) return SendErrorMessage(playerid, "Motor ömrü en az 1 en fazla 100 olabilir.");

		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn motor ömrünü %f(önceki: %f) olarak güncelledin.", vehicleid, arm, CarData[vehicleid][carEngine]);
		CarData[vehicleid][carEngine] = arm;
		Car_Save(vehicleid);
		return 1;
	}
	else if (!strcmp(type, "bataryaomru", true))
	{
		if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece sisteme kayýtlý araçlarda kullanýlýr.");

		new Float: arm;
		if(sscanf(string, "f", arm)) return SendUsageMessage(playerid, "/aduzenle bataryaomru [miktar]");
		if(arm < 1.0 || arm > 100.0) return SendErrorMessage(playerid, "Motor ömrü en az 1 en fazla 100 olabilir.");

		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn batarya ömrünü %f(önceki: %f) olarak güncelledin.", vehicleid, arm, CarData[vehicleid][carBattery]);
		CarData[vehicleid][carBattery] = arm;
		Car_Save(vehicleid);
		return 1;
	}
	else if (!strcmp(type, "ps", true))
	{
		if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece sisteme kayýtlý araçlarda kullanýlýr.");

		new ks;
		if(sscanf(string, "i", ks)) return SendUsageMessage(playerid, "/aduzenle ps [miktar]");
		if(ks < 0) return SendErrorMessage(playerid, "Patlama sayýsý en az 0 olabilir.");

		CarData[vehicleid][carTimeDestroyed] = ks;
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn patlama sayýsýný %i olarak güncelledin.", vehicleid, ks);
		Car_Save(vehicleid);
		return 1;
	}
	else if (!strcmp(type, "paintjob", true))
	{
		if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece sisteme kayýtlý araçlarda kullanýlýr.");

		new ks;
		if(sscanf(string, "i", ks)) return SendUsageMessage(playerid, "/aduzenle paintjob [paintjob tipi(-1 girersen silinir.)]");
		if(ks < -1 || ks > 3) return SendErrorMessage(playerid, "Paintjob tipi en az -1 en fazla 3 olabilir.");

		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn paintjob tipini %i(önceki: %i) olarak güncelledin.", vehicleid, ks, CarData[vehicleid][carPaintjob]);
		CarData[vehicleid][carPaintjob] = ks;
		SetVehicleToRespawn(vehicleid);
		PutPlayerInVehicle(playerid, vehicleid, 0);
		Car_Save(vehicleid);
		return 1;
	}
	else if (!strcmp(type, "ks", true))
	{
		if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece sisteme kayýtlý araçlarda kullanýlýr.");

		new ks;
		if(sscanf(string, "i", ks)) return SendUsageMessage(playerid, "/aduzenle ks [seviye]");
		if(ks < 0 || ks > 5) return SendErrorMessage(playerid, "Kilit seviyesi en az 0 en fazla 5 olabilir.");

		CarData[vehicleid][carLock] = ks;
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn kilit seviyesini %i olarak güncelledin.", vehicleid, ks);
		Car_Save(vehicleid);
		return 1;
	}
	else if (!strcmp(type, "as", true))
	{
		if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece sisteme kayýtlý araçlarda kullanýlýr.");

		new ks;
		if(sscanf(string, "i", ks)) return SendUsageMessage(playerid, "/aduzenle as [seviye]");
		if(ks < 0 || ks > 5) return SendErrorMessage(playerid, "Alarm seviyesi en az 0 en fazla 5 olabilir.");

		CarData[vehicleid][carAlarm] = ks;
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn alarm seviyesini %i olarak güncelledin.", vehicleid, ks);
		Car_Save(vehicleid);
		return 1;
	}
	else if (!strcmp(type, "is", true))
	{
		if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece sisteme kayýtlý araçlarda kullanýlýr.");

		new ks;
		if(sscanf(string, "i", ks)) return SendUsageMessage(playerid, "/aduzenle is [seviye]");
		if(ks < 0 || ks > 5) return SendErrorMessage(playerid, "Immob seviyesi en az 0 en fazla 5 olabilir.");

		CarData[vehicleid][carImmob] = ks;
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn immob seviyesini %i olarak güncelledin.", vehicleid, ks);
		Car_Save(vehicleid);
		return 1;
	}
	else if (!strcmp(type, "sigorta", true))
	{
		if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece sisteme kayýtlý araçlarda kullanýlýr.");

		new ks;
		if(sscanf(string, "i", ks)) return SendUsageMessage(playerid, "/aduzenle sigorta [seviye]");
		if(ks < 0 || ks > 3) return SendErrorMessage(playerid, "Sigorta seviyesi en az 0 en fazla 3 olabilir.");

		CarData[vehicleid][carInsurance] = ks;
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn sigorta seviyesini %i olarak güncelledin.", vehicleid, ks);
		Car_Save(vehicleid);
		return 1;
	}
	else if (!strcmp(type, "sigortasure", true))
	{
		if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece sisteme kayýtlý araçlarda kullanýlýr.");

		new ks;
		if(sscanf(string, "i", ks)) return SendUsageMessage(playerid, "/aduzenle sigortasure [süre]");
		if(ks < 0) return SendErrorMessage(playerid, "Sigorta süresi en az 0 olabilir.");

		CarData[vehicleid][carInsuranceTime] = ks;
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn sigorta süresini %i olarak güncelledin.", vehicleid, ks);
		Car_Save(vehicleid);
		return 1;
	}

	else if (!strcmp(type, "sigortaucret", true))
	{
		if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece sisteme kayýtlý araçlarda kullanýlýr.");

		new ks;
		if(sscanf(string, "i", ks)) return SendUsageMessage(playerid, "/aduzenle sigortaucret [miktar]");
		if(ks < 0) return SendErrorMessage(playerid, "Sigorta ücreti en az 0 olabilir.");

		CarData[vehicleid][carInsuranceTime] = ks;
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn sigorta ücretini %i olarak güncelledin.", vehicleid, ks);
		Car_Save(vehicleid);
		return 1;
	}
	else if (!strcmp(type, "km", true))
	{
		if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece sisteme kayýtlý araçlarda kullanýlýr.");

		new Float: km;
		if(sscanf(string, "f", km)) return SendUsageMessage(playerid, "/aduzenle km [km]");
		if(km < 1.0) return SendErrorMessage(playerid, "KM en az 1 olabilir.");

		CarData[vehicleid][carMileage] = km;
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn kilometresini %f olarak güncelledin.", vehicleid, km);
		Car_Save(vehicleid);
		return 1;
	}
	else if (!strcmp(type, "renk", true))
	{
		if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece sisteme kayýtlý araçlarda kullanýlýr.");

		new renk1, renk2;
		if(sscanf(string, "ii", renk1, renk2)) return SendUsageMessage(playerid, "/aduzenle renk [0-255] [0-255]");
		if(renk1 < 0 || renk1 > 255) return SendErrorMessage(playerid, "Birincil renk deðeri en az 0 en fazla 255 olabilir.");
		if(renk2 < 0 || renk2 > 255) return SendErrorMessage(playerid, "Birincil renk deðeri en az 0 en fazla 255 olabilir.");

		CarData[vehicleid][carColor1] = renk1, CarData[vehicleid][carColor2] = renk2;
    Car_Save(vehicleid);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn rengini %i, %i olarak güncelledin.", vehicleid, renk1, renk2);
		SetVehicleToRespawn(vehicleid);
		PutPlayerInVehicle(playerid, vehicleid, 0);
		return 1;
	}
	else if(!strcmp(type, "kilit", true))
	{
		if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece sisteme kayýtlý araçlarda kullanýlýr.");

		new locked;
		if(sscanf(string, "i", locked)) return SendUsageMessage(playerid, "/aduzenle kilit [0/1]");
		if(locked < 0 || locked > 1) return SendErrorMessage(playerid, "Hatalý kilit durumu girdin. (0/1)");
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn kapýlarýný %s olarak güncelledin.", vehicleid, !locked ? ("kilitli deðil") : ("kilitli"));
		CarData[vehicleid][carLocked] = bool:locked;
		ToggleVehicleLock(vehicleid, bool:locked);
		Car_Save(vehicleid);
		return 1;
	}
	else if(!strcmp(type, "xmr", true))
	{
		if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece sisteme kayýtlý araçlarda kullanýlýr.");

		new locked;
		if(sscanf(string, "i", locked)) return SendUsageMessage(playerid, "/aduzenle xmr [0/1]");
		if(locked < 0 || locked > 1) return SendErrorMessage(playerid, "Hatalý XMR durumu girdin. (0/1)");
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn XMR durumunu %s olarak güncelledin.", vehicleid, !locked ? ("pasif") : ("aktif"));
		CarData[vehicleid][carXMR] = bool:locked;
		Car_Save(vehicleid);
		return 1;
	}
	else if (!strcmp(type, "aracisim", true))
	{
		if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece þahsi araçlarda kullanýlýr.");

		new vehicle_name[35];
		if(sscanf(string, "s[35]", vehicle_name)) return SendUsageMessage(playerid, "/aduzenle aracisim [özel isim]");
		if(strlen(vehicle_name) > 35) return SendErrorMessage(playerid, "Araç ismi en fazla 35 karakter olabilir.");

		format(CarData[vehicleid][carName], 35, vehicle_name);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn özel ismini %s olarak güncelledin.", vehicleid, vehicle_name);
		Car_Save(vehicleid);
		return 1;
	}
	else if(!strcmp(type, "birlik", true))
	{
		if(!IsValidFactionCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece birliðe kayýtlý araçlarda kullanýlýr.");

		new faction;
		if(sscanf(string, "i", faction)) return SendUsageMessage(playerid, "/aduzenle birlik [birlik ID]");
		if(!Iter_Contains(Factions, faction)) return SendErrorMessage(playerid, "Hatalý birlik ID girdin.");
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn birliðini %s(%i) olarak güncelledin.", vehicleid, FactionData[faction][FactionName], faction);
		CarData[vehicleid][carFaction] = faction;
		Car_Save(vehicleid);
		return 1;
	}
	else if(!strcmp(type, "siren", true))
	{
		if(!IsValidFactionCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece birliðe kayýtlý araçlarda kullanýlýr.");

		new locked, dbid = CarData[vehicleid][carID];
		if(sscanf(string, "i", locked)) return SendUsageMessage(playerid, "/aduzenle siren [0/1]");
		if(locked < 0 || locked > 1) return SendErrorMessage(playerid, "Hatalý siren durumu girdin. (0/1)");
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn siren durumunu %s olarak güncelledi.", vehicleid, !locked ? ("pasif") : ("aktif"));
		CarData[vehicleid][carSiren] = bool:locked;
		Car_Save(vehicleid);

		Vehicle_DefaultValues(vehicleid);
		DestroyVehicle(vehicleid);

		new query[55];
		mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM vehicles WHERE id = %i", dbid);
		mysql_tquery(m_Handle, query, "SQL_LoadVehicles");
		return 1;
	}
	else if (!strcmp(type, "kiraucreti", true))
	{
		if(!IsValidRentalCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece kiralýk araçlarda kullanýlýr.");

		new kira;
		if(sscanf(string, "i", kira)) return SendUsageMessage(playerid, "/aduzenle kiraucreti [miktar(1-5000)]");
		if(kira < 1 || kira > 5000) return SendErrorMessage(playerid, "Kira miktarý en az 1 en fazla 5000 olabilir.");

		CarData[vehicleid][carRentalPrice] = kira;
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn kira ücretini $%s olarak güncelledin.", vehicleid, MoneyFormat(kira));
		Car_Save(vehicleid);
		return 1;
	}
	else if (!strcmp(type, "kiralayan", true))
	{
		if(!IsValidRentalCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece kiralýk araçlarda kullanýlýr.");

		new kiralayan;
		if(sscanf(string, "I(-1)", kiralayan))
		{
			SendUsageMessage(playerid, "/aduzenle kiralayan [oyuncu ID/adý]");
			SendInfoMessage(playerid, "ID kýsmýný boþ býrakýrsanýz araç kirasý düþer.");
			return 1;
		}

		if(kiralayan != -1)
		{
			if(!IsPlayerConnected(kiralayan)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
			if(!pLoggedIn[kiralayan]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
			if(PlayerData[kiralayan][pRentCarKey]) return SendErrorMessage(playerid, "Belirttiðiniz kiþinin kiralýk aracý bulunuyor.");

			CarData[vehicleid][carRentedBy] = PlayerData[kiralayan][pSQLID];
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn kiracýsýný %s olarak güncelledin.", vehicleid, ReturnSQLName(CarData[vehicleid][carRentedBy]));
			PlayerData[kiralayan][pRentCarKey] = CarData[vehicleid][carID];
		} else {
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aracýn kiracýsýný sýfýrladýn.", vehicleid);
			foreach(new i : Player) if(PlayerData[i][pRentCarKey] == CarData[vehicleid][carID]) PlayerData[i][pRentCarKey] = 0;
			CarData[vehicleid][carRentedBy] = 0;
		}

		Car_Save(vehicleid);
		return 1;
	}
 	return 1;
}

CMD:mobilyap(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	Furniture_AList(playerid);
	return 1;
}

CMD:galerip(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	Vehicle_List(playerid);
	return 1;
}

CMD:adminp(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	ShowAdminPanel(playerid);
	return 1;
}

CMD:givegun(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 5) return UnAuthMessage(playerid);

	new id, weaponid, ammo;
	if(sscanf(params, "uii", id, weaponid, ammo)) {
		SendUsageMessage(playerid, "/givegun [oyuncu ID/adý] [silah ID] [mermi]");
		SendInfoMessage(playerid, "Vereceðin bu silah kiþide kayýtlý kalacaktýr.");
		return 1;
	}

	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");

	if(weaponid < 1 || weaponid > 46 || weaponid == 35 || weaponid == 36 || weaponid == 37 || weaponid == 38 || weaponid == 39)
	    return SendErrorMessage(playerid, "Hatalý silah ID girdiniz.");

	if(Player_HasWeapon(id, weaponid)) return SendErrorMessage(playerid, "Belirttiðiniz kiþide bu silah bulunuyor.");
	if(ammo < 1) return SendErrorMessage(playerid, "Hatalý mermi miktarý girdiniz.");

    new count;
    if(Player_HasWeapon(id, 22))
    {
        count++;
    }

    if(Player_HasWeapon(id, 23))
    {
        count++;
    }

    if(Player_HasWeapon(id, 24))
    {
        count++;
    }

    if(Player_HasWeapon(id, 25))
    {
        count++;
    }

    if(Player_HasWeapon(id, 26))
    {
        count++;
    }

    if(Player_HasWeapon(id, 27))
    {
        count++;
    }

    if(Player_HasWeapon(id, 28))
    {
        count++;
    }

    if(Player_HasWeapon(id, 29))
    {
        count++;
    }

    if(Player_HasWeapon(id, 30))
    {
        count++;
    }

    if(Player_HasWeapon(id, 31))
    {
        count++;
    }

    if(Player_HasWeapon(id, 32))
    {
        count++;
    }

    if(Player_HasWeapon(id, 33))
    {
        count++;
    }

    if(Player_HasWeapon(id, 34))
    {
        count++;
    }

    if(count >= 2)
    {
        return SendErrorMessage(playerid, "Oyuncunun ikiden fazla silahý olamaz.");
    }

    if(Player_HasWeapon(id, 25))
    {
    	if(Weapon_SlotID(id, weaponid) == 3)
    	{
    		return SendErrorMessage(playerid, "Oyuncunun bu silah slotu dolu.");
    	}
    }

    if(Player_HasWeapon(id, 26))
    {
    	if(Weapon_SlotID(id, weaponid) == 3)
    	{
    		return SendErrorMessage(playerid, "Oyuncunun bu silah slotu dolu.");
    	}
    }

    if(Player_HasWeapon(id, 27))
    {
    	if(Weapon_SlotID(id, weaponid) == 3)
    	{
    		return SendErrorMessage(playerid, "Oyuncunun bu silah slotu dolu.");
    	}
    }

    if(Player_HasWeapon(id, 28))
    {
    	if(Weapon_SlotID(id, weaponid) == 3)
    	{
    		return SendErrorMessage(playerid, "Oyuncunun bu silah slotu dolu.");
    	}
    }

    if(Player_HasWeapon(id, 29))
    {
    	if(Weapon_SlotID(id, weaponid) == 3)
    	{
    		return SendErrorMessage(playerid, "Oyuncunun bu silah slotu dolu.");
    	}
    }

    if(Player_HasWeapon(id, 30))
    {
    	if(Weapon_SlotID(id, weaponid) == 3)
    	{
    		return SendErrorMessage(playerid, "Oyuncunun bu silah slotu dolu.");
    	}
    }

    if(Player_HasWeapon(id, 31))
    {
    	if(Weapon_SlotID(id, weaponid) == 3)
    	{
    		return SendErrorMessage(playerid, "Oyuncunun bu silah slotu dolu.");
    	}
    }

    if(Player_HasWeapon(id, 32))
    {
    	if(Weapon_SlotID(id, weaponid) == 3)
    	{
    		return SendErrorMessage(playerid, "Oyuncunun bu silah slotu dolu.");
    	}
    }

    if(Player_HasWeapon(id, 33))
    {
    	if(Weapon_SlotID(id, weaponid) == 3)
    	{
    		return SendErrorMessage(playerid, "Oyuncunun bu silah slotu dolu.");
    	}
    }

    if(Player_HasWeapon(id, 34))
    {
    	if(Weapon_SlotID(id, weaponid) == 3)
    	{
    		return SendErrorMessage(playerid, "Oyuncunun bu silah slotu dolu.");
    	}
    }

	adminWarn(1, sprintf("%s isimli yönetici %s isimli oyuncuya %d mermili %s verdi.", ReturnName(playerid, 1), ReturnName(id, 1), ammo, ReturnWeaponName(weaponid)));
	if(!IsLAWFaction(id)) Weapon_SlotName(id, weaponid);
	GivePlayerWeapon(id, weaponid, ammo);
	return 1;
}

CMD:givedrug(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 5) return UnAuthMessage(playerid);

	new id, type, boy, Float: amount, quality, drugname[64];
	if(sscanf(params, "uiifis[64]", id, type, boy, amount, quality, drugname))
	{
		SendUsageMessage(playerid, "/givedrug [oyuncu ID/adý] [uyuþturucu tipi] [boy] [gram] [kalite] [özel isim]");
		SendClientMessage(playerid, COLOR_GRAD2, "Tipler: 1. Marijuana, 2. Crack, 3. Cocaine, 4. Ecstasy, 5. LSD, 6. Meth, 7. PCP");
		SendClientMessage(playerid, COLOR_GRAD1, "Tipler: 8. Heroin, 9. Aspirin, 10. Haloperidol, 11. Morphine, 12. Xanax, 13. MDMA");
		SendClientMessage(playerid, COLOR_GRAD2, "Tipler: 14. Phenetole, 15. Steroids, 16. Mescalin, 17. Quaaludes, 18. Peyote");
		return 1;
	}

	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	if(type < 1 || type > 18) return SendErrorMessage(playerid, "Hatalý uyuþturucu tipi girdin. (1 - 18)");
	switch(boy)
	{
		case 1: if(amount < 0.1 || amount > 7.0) return SendClientMessage(playerid, COLOR_ADM, "Hatalý küçük boy uyuþturucu miktarý girdin. (0.1 - 7.0)");
		case 2: if(amount < 7.0|| amount > 14.0) return SendClientMessage(playerid, COLOR_ADM, "Hatalý orta boy uyuþturucu miktarý girdin. (7.0 - 14.0)");
		case 3: if(amount < 14.0 || amount > 21.0) return SendClientMessage(playerid, COLOR_ADM, "Hatalý büyük boy uyuþturucu miktarý girdin. (14.0 - 21.0)");
		default: return SendClientMessage(playerid, COLOR_ADM, "Hatalý uyuþturucu paket boyu girdin. (1 - 3)");
	}
	if(quality < 1 || quality > 100) return SendClientMessage(playerid, COLOR_ADM, "Hatalý uyuþturucu kalitesi girdin. (1 - 100)");


	new free_slot = Drug_GetPlayerNextSlot(id);
	if(free_slot == -1) return SendErrorMessage(playerid, "%s(ID: %i) üstünde daha fazla uyuþturucu bulunduramaz.", ReturnName(id, 1), id);

	new drug_query[512];
	mysql_format(m_Handle, drug_query, sizeof(drug_query), "INSERT INTO player_drugs (player_dbid, drug_name, drug_type, drug_amount, drug_quality, drug_size) VALUES (%i, '%e', %i, %f, %i, %i)", PlayerData[id][pSQLID], drugname, type, amount, quality, boy);
	new Cache:cache = mysql_query(m_Handle, drug_query);

	player_drug_data[id][free_slot][data_id] = cache_insert_id();
	player_drug_data[id][free_slot][drug_id] = type;
	format(player_drug_data[id][free_slot][drug_name], 64, "%s", drugname);
	player_drug_data[id][free_slot][drug_amount] = amount;
	player_drug_data[id][free_slot][drug_quality] = quality;
	player_drug_data[id][free_slot][drug_size] = boy;
	player_drug_data[id][free_slot][is_exist] = true;

	cache_delete(cache);

	SendClientMessageEx(playerid, COLOR_YELLOW, "%s adlý kiþiye %s - %s (%s) verdin.", ReturnName(id, 0), player_drug_data[id][free_slot][drug_name], Drug_GetName(player_drug_data[id][free_slot][drug_id]), Drug_GetType(player_drug_data[id][free_slot][drug_size]));
	SendClientMessageEx(id, COLOR_YELLOW, "%s sana %s - %s (%s) verdi.", ReturnName(playerid, 0), player_drug_data[id][free_slot][drug_name], Drug_GetName(player_drug_data[id][free_slot][drug_id]), Drug_GetType(player_drug_data[id][free_slot][drug_size]));
	return 1;
}

CMD:set(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 2) return UnAuthMessage(playerid);

	new id, type[8];
	if(sscanf(params, "s[8]I(-1)", type, id)) return SendUsageMessage(playerid, "/set [hava/zaman] [deðer]");

	if(!strcmp(type, "hava"))
	{
		if(id == -1) return SendUsageMessage(playerid, "/set hava [hava ID]");
		if(id < 1 || id > 50) return SendErrorMessage(playerid, "Hatalý hava ID girdin.");
		adminWarn(1, sprintf("%s isimli yönetici havayý %i olarak ayarladý.", ReturnName(playerid, 1), id));
		weather = id; SetWeather(id);
		return 1;
	}
	else if(!strcmp(type, "zaman"))
	{
		if(id == -1) return SendUsageMessage(playerid, "/set zaman [saat]");
		if(id < 0 || id > 23) return SendErrorMessage(playerid, "Hatalý zaman aralýðý girdin.");
		adminWarn(1, sprintf("%s isimli yönetici zamaný %i olarak ayarladý.", ReturnName(playerid, 1), id));
		SetWorldTime(id);
		return 1;
	}
	else SendUsageMessage(playerid, "/set [hava/zaman] [deðer]");
	return 1;
}

CMD:clearguns(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	new id;
	if(sscanf(params, "u", id)) return SendUsageMessage(playerid, "/clearguns [oyuncu ID/isim]");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	adminWarn(1, sprintf("%s isimli yönetici %s isimli oyuncunun tüm silahlarýný sýfýrladý.", ReturnName(playerid), ReturnName(id)));
	SendServerMessage(playerid, "%s isimli oyuncunun tüm silahlarýný sýfýrladýn.", ReturnName(id));
	SendServerMessage(id, "%s isimli yönetici tüm silahlarýný sýfýrladý.", ReturnName(playerid));
	TakePlayerGuns(id);
	return 1;
}

CMD:checkdrugs(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	new id;
	if(sscanf(params, "u", id)) return SendUsageMessage(playerid, "/checkdrugs [oyuncu ID/isim]");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	SendClientMessageEx(playerid, COLOR_ADM, "%s Uyuþturucularý:", ReturnName(id, 0));
	Player_ListDrugs(id, playerid);
	return 1;
}

CMD:sethp(playerid, params[]) return cmd_health(playerid, params);
CMD:health(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	new id, Float: health;
	if(sscanf(params, "uf(-1)", id, health))
	{
		SendUsageMessage(playerid, "/health [oyuncu ID/isim] [can]");
		SendClientMessage(playerid, COLOR_ADM, "Uyarý: Can kýsmýný -1 olarak girerseniz kiþinin maksimum caný olarak ayarlanýr.");
		return 1;
	}

	if(!IsPlayerConnected(id)) return SendServerMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendServerMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	if(health == -1)
		SetPlayerHealth(id, PlayerData[id][pMaxHealth]);

	else SetPlayerHealth(id, health);

	LogAdminAction(playerid, sprintf("%s isimli kiþinin canýný %.1f yaptý.", ReturnName(id, 1), health));
	return 1;
}

CMD:revive(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	static id;
	if(sscanf(params, "u", id)) return SendUsageMessage(playerid, "/revive [oyuncu ID/isim]");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	if(!PlayerData[id][pBrutallyWounded]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi yaralanmamýþ/ölmemiþ.");

	PlayerData[id][pLegShot] = 0;
	PlayerData[id][pLowSkill] = 0;
	PlayerData[id][pExecuteTime] = 0;
	PlayerData[id][pBrutallyWounded] = 0;
	SetPlayerSkillLevel(id, WEAPONSKILL_PISTOL, 899);
	SetPlayerSkillLevel(id, WEAPONSKILL_MICRO_UZI, 0);
	SetPlayerSkillLevel(id, WEAPONSKILL_SPAS12_SHOTGUN, 0);
	SetPlayerSkillLevel(id, WEAPONSKILL_AK47, 999);
    SetPlayerSkillLevel(id, WEAPONSKILL_DESERT_EAGLE, 999);
    SetPlayerSkillLevel(id, WEAPONSKILL_SHOTGUN, 999);
    SetPlayerSkillLevel(id, WEAPONSKILL_M4, 999);
    SetPlayerSkillLevel(id, WEAPONSKILL_MP5, 999);
	GameTextForPlayer(id, "~b~Canlandirildin", 3000, 4);
	SetPlayerChatBubble(id, "Canlandýrýldý", COLOR_WHITE, 20.0, 2000);
	SetPlayerHealth(id, PlayerData[id][pMaxHealth]);
	TogglePlayerControllable(id, true);
	SetPlayerTeam(id, STATE_ALIVE);
	Damages_Clear(id);

	LogAdminAction(playerid, sprintf("%s isimli kiþinin canlandýrdý.", ReturnName(id, 1)));
	return 1;
}

CMD:gotocar(playerid, params[]) return cmd_agit(playerid, params);
CMD:agit(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 1) return UnAuthMessage(playerid);

	static id;
	if(sscanf(params, "i", id)) return SendUsageMessage(playerid, "/agit [araç ID]");
	if(!IsValidVehicle(id)) return SendErrorMessage(playerid, "Hatalý araç ID girdin.");

	new Float: x, Float: y, Float: z, Float: a;
	GetVehiclePos(id, x, y, z); GetVehicleZAngle(id, a);
	SendPlayer(playerid, x, y, z, a, GetVehicleInterior(id), GetVehicleVirtualWorld(id));
	SendClientMessageEx(playerid, COLOR_GREY, "SERVER: %i numaralý aracýn yanýna ýþýnlandýn.", id);
	return 1;
}

CMD:getcar(playerid, params[]) return cmd_agetir(playerid, params);
CMD:agetir(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 1) return UnAuthMessage(playerid);

	static id;
	if(sscanf(params, "i", id)) return SendUsageMessage(playerid, "/agetir [araç ID]");
	if(!IsValidVehicle(id)) return SendErrorMessage(playerid, "Hatalý araç ID girdin.");

	new Float: x, Float: y, Float: z;
	GetPlayerPos(playerid, x, y, z); SetVehiclePos(id, x+1, y, z);
	SetVehicleVirtualWorld(id, GetPlayerVirtualWorld(playerid));
	LinkVehicleToInterior(id, GetPlayerInterior(playerid));
	SendClientMessageEx(playerid, COLOR_GREY, "SERVER: %i numaralý aracý yanýna getirdin.", id);
	return 1;
}

CMD:abindir(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 1) return UnAuthMessage(playerid);

	new id, vehicleid, seat;
	if(sscanf(params, "uii", id, vehicleid, seat)) return SendUsageMessage(playerid, "/abindir [oyuncu ID/adý] [araç ID] [koltuk]");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	if(!IsValidVehicle(vehicleid)) return SendErrorMessage(playerid, "Hatalý araç ID girdiniz.");
	if(seat < 0 || seat > 4) return SendErrorMessage(playerid, "Hatalý koltuk numarasý girdiniz.");
	if(!IsSeatAvailable(vehicleid, seat)) return SendErrorMessage(playerid, "Bu koltuk dolu gözüküyor.");
	adminWarn(1, sprintf("%s isimli yönetici %s isimli oyuncuyu %i numaralý araca bindirdi.", ReturnName(playerid), ReturnName(id), seat));
	PutPlayerInVehicle(id, vehicleid, seat);
	return 1;
}

CMD:cleardrugs(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 1) return UnAuthMessage(playerid);

	new id;
	if(sscanf(params, "u", id)) return SendUsageMessage(playerid, "/cleardrugs [oyuncu ID/isim]");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	if(!Player_GetDrugCount(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþinin hiç uyuþturucusu yok.");

	adminWarn(2, sprintf("%s isimli yönetici %s isimli oyuncunun tüm uyuþturucularýný sýfýrladý.", ReturnName(playerid), ReturnName(id)));
	SendServerMessage(playerid, "%s isimli oyuncunun tüm uyuþturucularýný sýfýrladýn.", ReturnName(id));
	SendServerMessage(id, "%s isimli yönetici tüm uyuþturucularýný sýfýrladý.", ReturnName(playerid));
	for(new i = 1; i < MAX_PACK_SLOT; ++i) Drug_DefaultValues(playerid, i);
	return 1;
}

CMD:setkskin(playerid, params[]) return cmd_skin(playerid, params);
CMD:skin(playerid, params[])
{
	if (PlayerData[playerid][pAdmin] < 1) return UnAuthMessage(playerid);

	static playerb, skinid;
	if(sscanf(params, "ui", playerb, skinid)) return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: {FFFFFF}/skin [oyuncuID/isim] [skin ID]");
	if(!IsPlayerConnected(playerb)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[playerb]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	if(skinid <= 0 || skinid == 74 || skinid > 30000) return SendErrorMessage(playerid, "Hatalý skin ID girdiniz.");

	PlayerData[playerb][pSkin] = skinid;
	SetPlayerSkin(playerb, PlayerData[playerb][pSkin]);
	SaveSQLInt(PlayerData[playerid][pSQLID], "players", "Skin", PlayerData[playerid][pSkin]);
	LogAdminAction(playerid, sprintf("%s isimli kiþinin kýyafetini %d yaptý.", ReturnName(playerb, 1), skinid));

	SendClientMessageEx(playerid, COLOR_GREY, "AdmCmd: %s isimli oyuncunun kýyafetini %i olarak ayarladýn.", ReturnName(playerb, 0), skinid);
	SendClientMessageEx(playerb, COLOR_GREY, "AdmCmd: %s isimli yönetici kýyafetini %i olarak ayarladý.", PlayerData[playerid][pAdminName], skinid);
	return 1;
}

CMD:gotopos(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 1) return UnAuthMessage(playerid);

	static Float:x, Float:y, Float:z;
	if (sscanf(params, "fff", x, y, z)) return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: {FFFFFF}/gotopos [x] [y] [z]");
	SetPlayerPos(playerid, x, y, z);

	SendClientMessageEx(playerid, COLOR_GREY, "AdmCmd: %f %f %f koordinatlarýna ýþýnlandýn.", x, y, z);
	return 1;
}

CMD:testername(playerid, params[])
{
	if(!PlayerData[playerid][pTester]) return UnAuthMessage(playerid);
	if(isnull(params)) return SendUsageMessage(playerid, "/testername [adýnýz]");
	if(strlen(params) > 24) return SendErrorMessage(playerid, "Tester adýnýz en fazla 24 karakter olabilir.");

	format(PlayerData[playerid][pAdminName], 24, "%s", params);
	SendClientMessageEx(playerid, COLOR_ADM, "[!] Tester adýnýzý \"%s\" olarak güncellediniz. ", params);

	new query[128];
	mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET TesterName = '%e' WHERE id = %i", params, PlayerData[playerid][pSQLID]);
	mysql_tquery(m_Handle, query);
	return 1;
}

CMD:yardimlar(playerid, params[])
{
	if (!PlayerData[playerid][pTester] && !PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	new
		sayi = 0;

	foreach(new i : Supports)
	{
		SendClientMessageEx(playerid, COLOR_ADM, "[Yardým: %i] {FF9900}%s(%i): %s", i+1, ReturnName(SupportData[i][SupportPlayer], 0), SupportData[i][SupportPlayer], SupportData[i][SupportText]);
		sayi++;
	}

	if (sayi == 0) return SendInfoMessage(playerid, "Hiç yardým isteði yok.");
	return 1;
}

CMD:yk(playerid, params[])return cmd_yardimkabul(playerid, params);
CMD:yardimkabul(playerid, params[])
{
	if (!PlayerData[playerid][pTester] && !PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);
	static id;
	if(sscanf(params, "d", id)) return SendUsageMessage(playerid, "/yk [yardým ID]");
	if (!Iter_Contains(Supports, (id-1))) return SendErrorMessage(playerid, "Belirttiðin yardým ID bulunamadý.");
	SendTesterMessage(COLOR_ORANGE, sprintf("[Yardým] Tester %s %i numaralý yardým isteðini kabul etti.", ReturnName(playerid, 1), id));
	cmd_pm(playerid, sprintf("%i Merhabalar, yardým isteðin kabul edildi. Birazdan sana yardýmcý olacaðým.", SupportData[(id-1)][SupportPlayer]));
	Support_Remove((id-1));
	return 1;
}

CMD:yr(playerid, params[])return cmd_yardimred(playerid, params);
CMD:yardimred(playerid, params[])
{
	if (!PlayerData[playerid][pTester] && !PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);
	static id;
	if(sscanf(params, "d", id)) return SendUsageMessage(playerid, "/yr [yardým ID]");
	if (!Iter_Contains(Supports, (id-1))) return SendErrorMessage(playerid, "Belirttiðin yardým ID bulunamadý.");
	SendTesterMessage(COLOR_ORANGE, sprintf("[Yardým] Tester %s %i numaralý yardým isteðini reddetti.", ReturnName(playerid, 1), id));
    cmd_pm(playerid, sprintf("%i Merhabalar, yardým isteðin reddedildi. Bu bir oto mesajdýr lütfen cevaplamayýn.", SupportData[(id-1)][SupportPlayer]));
	Support_Remove((id-1));
	return 1;
}

CMD:raporlar(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	new
		sayi = 0;

	foreach(new i : Reports)
	{
		SendClientMessageEx(playerid, COLOR_ADM, "[Rapor: %i] {FF9900}%s(%i): %s", i+1, ReturnName(ReportData[i][ReportPlayer], 0), ReportData[i][ReportPlayer], ReportData[i][ReportText]);
		sayi++;
	}

	if (sayi == 0) return SendInfoMessage(playerid, "Hiç rapor yok.");
	return 1;
}

CMD:rk(playerid, params[])return cmd_raporkabul(playerid, params);
CMD:raporkabul(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);
	static id;
	if(sscanf(params, "d", id)) return SendUsageMessage(playerid, "/rk [rapor ID]");
	if (!Iter_Contains(Reports, (id-1))) return SendErrorMessage(playerid, "Belirttiðin rapor ID bulunamadý.");
	SendAdminMessage(COLOR_ORANGE, sprintf("[Rapor] Admin %s %i numaralý raporu kabul etti.", ReturnName(playerid, 1), id));
	cmd_pm(playerid, sprintf("%i Merhabalar, raporun kabul edildi. Birazdan sana yardýmcý olacaðým.", ReportData[(id-1)][ReportPlayer]));
	Report_Remove((id-1));
	return 1;
}

CMD:rr(playerid, params[])return cmd_raporred(playerid, params);
CMD:raporred(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);
	static id;
	if(sscanf(params, "d", id)) return SendUsageMessage(playerid, "/rr [rapor ID]");
	if (!Iter_Contains(Reports, (id-1))) return SendErrorMessage(playerid, "Belirttiðin rapor ID bulunamadý.");
	SendAdminMessage(COLOR_ORANGE, sprintf("[Rapor] Admin %s %i numaralý raporu reddetti.", ReturnName(playerid, 1), id));
    cmd_pm(playerid, sprintf("%i Merhabalar, raporun reddedildi. Bu bir oto mesajdýr lütfen cevaplamayýn.", ReportData[(id-1)][ReportPlayer]));
	Report_Remove((id-1));
	return 1;
}

CMD:makechopshop(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return 0;

    static
		id;

	id = Chopshop_Create(playerid);

	if (id == -1)
	    return SendErrorMessage(playerid, "Maksimum eklenebilecek Chopshop sýnýrýna ulaþýlmýþ.");

	SendClientMessageEx(playerid, COLOR_ADM, "SERVER: #%d numaralý Chopshop'u ekledin.", id);
	LogAdminAction(playerid, sprintf("%i numaralý Chopshop'u ekledi.", id));
	cmd_editchopshop(playerid, sprintf("%i position", id));
    return 1;
}

CMD:destroychopshop(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return 0;

	static
	    id = 0;

	if (sscanf(params, "d", id))
	    return SendUsageMessage(playerid, "/destroychopshop [chopshop ID]");

	if ((id < 0 || id >= MAX_CHOPSHOP) || !ChopshopData[id][chopshop_exist])
	    return SendErrorMessage(playerid, "Hatalý chopshop ID girdin.");

	Chopshop_Delete(id);
	SendClientMessageEx(playerid, COLOR_ADM, "SERVER: #%d numaralý Chopshop'u sildin.", id);
	LogAdminAction(playerid, sprintf("%i numaralý Chopshop'u sildi.", id));
	return 1;
}

CMD:editchopshop(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return 0;

	new
		id, str[30], b_str[30];

	if(sscanf(params, "is[30]S()[30]", id, str, b_str))
	{
		SendUsageMessage(playerid, "/editchopshop [chopshop ID] [parametre]");
		SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}position, wanted");
		return 1;
 	}

	if ((id < 0 || id >= MAX_CHOPSHOP) || !ChopshopData[id][chopshop_exist])
	    return SendErrorMessage(playerid, "Hatalý chopshop ID girdin.");

	if(Chopshop_Nearest(playerid) != id)
	    return SendErrorMessage(playerid, "Düzenlemek istediðin chopshop yakýnýnda deðilsin.");

	if(!strcmp(str, "position"))
	{
		if(EditingObject[playerid])
			return SendErrorMessage(playerid, "Þu anda baþka bir obje düzenliyorsun.");

		EditingID[playerid] = id;
		EditingObject[playerid] = 4;
		EditDynamicObject(playerid, ChopshopData[id][chopshop_object][0]);

		SendClientMessageEx(playerid, COLOR_GOLD, "SERVER: %i numaralý Chopshop'un pozisyonunu güncelliyorsun.", id);
		LogAdminAction(playerid, sprintf("%i numaralý Chopshop'un pozisyonunu güncelliyor.", id));
	}
	else if(!strcmp(str, "wanted"))
	{
	    Chopshop_GetRandomModel(id);
	    Chopshop_Refresh(id);

   		SendClientMessageEx(playerid, COLOR_GOLD, "SERVER: %i numaralý Chopshop'un istenen araç listesini güncelledin.", id);
		LogAdminAction(playerid, sprintf("%i numaralý Chopshop'un istenen araç listesini güncelledi.", id));
	}
	return 1;
}

CMD:makeimpound(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 3) return 0;

	static
	    id = -1,
		Float:x,
		Float:y,
		Float:z;

	if (GetPlayerInterior(playerid) > 0 || GetPlayerVirtualWorld(playerid) > 0)
 		return SendErrorMessage(playerid, "Araç baðlama noktasýnýn bina içerisinde olamaz.");

	GetPlayerPos(playerid, x, y, z);

	id = Impound_Create(x, y, z);

	if (id == -1)
	    return SendErrorMessage(playerid, "Maksimum eklenebilecek baðlama noktasý sýnýrýna ulaþýlmýþ.");

	SendClientMessageEx(playerid, COLOR_ADM, "SERVER: #%d numaralý baðlama noktasýný ekledin.", id);
	LogAdminAction(playerid, sprintf("%i numaralý baðlama noktasýný oluþturdu.", id));
	return 1;
}

CMD:destroyimpound(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 3) return 0;

	static
	    id = 0;

	if (sscanf(params, "d", id))
	    return SendUsageMessage(playerid, "/destroyimpound [impound ID]");

	if ((id < 0 || id >= MAX_IMPOUND_LOTS) || !ImpoundData[id][impoundExists])
	    return SendErrorMessage(playerid, "Hatalý impound ID girdin.");

	Impound_Delete(id);
	SendClientMessageEx(playerid, COLOR_ADM, "SERVER: #%d numaralý baðlama noktasýný sildin.", id);
	LogAdminAction(playerid, sprintf("%i numaralý baðlama noktasýný sildi.", id));
	return 1;
}

CMD:editimpound(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 3) return 0;

	static
	    id,
	    type[24],
	    string[128];

	if (sscanf(params, "ds[24]S()[128]", id, type, string))
 	{
	 	SendUsageMessage(playerid, "/editimpound [impound ID] [parametre]");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}location, release");
		return 1;
	}
	if ((id < 0 || id >= MAX_IMPOUND_LOTS) || !ImpoundData[id][impoundExists])
	    return SendErrorMessage(playerid, "Hatalý impound ID girdin.");

	if (!strcmp(type, "location", true))
	{
	    static
	        Float:x,
	        Float:y,
	        Float:z;

	    GetPlayerPos(playerid, x, y, z);

		ImpoundData[id][impoundLot][0] = x;
		ImpoundData[id][impoundLot][1] = y;
		ImpoundData[id][impoundLot][2] = z;

		Impound_Refresh(id);
		Impound_Save(id);

		SendClientMessageEx(playerid, COLOR_ADM, "SERVER: #%d numaralý baðlama noktasýnýn baðlama lokasyonunu ayarladýn.", id);
		LogAdminAction(playerid, sprintf("%i numaralý baðlama noktasýnýn baðlama lokasyonunu ayarladý.", id));
	}
	else if (!strcmp(type, "release", true))
	{
	    static
	        Float:x,
	        Float:y,
	        Float:z,
			Float:angle;

	    GetPlayerPos(playerid, x, y, z);
		GetPlayerFacingAngle(playerid, angle);

		ImpoundData[id][impoundRelease][0] = x;
		ImpoundData[id][impoundRelease][1] = y;
		ImpoundData[id][impoundRelease][2] = z;
		ImpoundData[id][impoundRelease][3] = angle;

		Impound_Save(id);
		SendClientMessageEx(playerid, COLOR_ADM, "SERVER: #%d numaralý baðlama noktasýnýn çýkýþ lokasyonunu ayarladýn.", id);
		LogAdminAction(playerid, sprintf("%i numaralý baðlama noktasýnýn çýkýþ lokasyonunu ayarladý.", id));
	}
	return 1;
}

CMD:garaj(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);

	static type[24], string[128];
	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/garaj [parametre]");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ekle, duzenle, sil, git");
		return 1;
	}

	if (!strcmp(type, "ekle", true))
	{
	    static link_id;
	    if(sscanf(string, "i", link_id)) return SendUsageMessage(playerid, "/garaj ekle [baðlantýlý ev ID]");
        //if (!Iter_Contains(Properties, link_id)) return SendErrorMessage(playerid, "Hatalý ev ID girdin.");
		Garage_Create(playerid, link_id);
		return 1;
	}
	else if (!strcmp(type, "git", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/garaj git [garaj ID]");
		if (!Iter_Contains(Garages, id)) return SendErrorMessage(playerid, "Hatalý garaj ID girdin.");
		SendPlayer(playerid, GarageData[id][GaragePos][0], GarageData[id][GaragePos][1], GarageData[id][GaragePos][2], GarageData[id][GaragePos][3], GarageData[id][EnterInteriorID], GarageData[id][EnterWorld]);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý garaja ýþýnlandýn.", id);
		return 1;
 	}
	else if (!strcmp(type, "duzenle", true))
	{
		static id, type_two[24], string_two[128];

		if (sscanf(string, "ds[24]S()[128]", id, type_two, string_two))
		{
			SendUsageMessage(playerid, "/garaj duzenle [bina ID] [parametre]");
		    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}[giris][cikis][kilit][birlik]");
			return 1;
		}

		if (!Iter_Contains(Garages, id)) return SendErrorMessage(playerid, "Hatalý garaj ID girdin.");

		if (!strcmp(type_two, "giris", true))
		{
			GetPlayerPos(playerid, GarageData[id][GaragePos][0], GarageData[id][GaragePos][1], GarageData[id][GaragePos][2]);
			GetPlayerFacingAngle(playerid, GarageData[id][GaragePos][3]);

			GarageData[id][EnterInteriorID] = GetPlayerInterior(playerid);
			GarageData[id][EnterWorld] = GetPlayerVirtualWorld(playerid);

            SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Bu garajýn giriþ kýsmýný güncelledin.");
			Garage_Refresh(id);
			Garage_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "cikis", true))
		{
			GetPlayerPos(playerid, GarageData[id][GarageInt][0], GarageData[id][GarageInt][1], GarageData[id][GarageInt][2]);
			GetPlayerFacingAngle(playerid, GarageData[id][GarageInt][3]);

			GarageData[id][ExitInteriorID] = GetPlayerInterior(playerid);
			GarageData[id][ExitWorld] = GetPlayerVirtualWorld(playerid);

			foreach(new i : Player)
			{
				if(PlayerData[i][pInsideGarage] == id)
				{
					SendPlayer(i, GarageData[id][GarageInt][0], GarageData[id][GarageInt][1], GarageData[id][GarageInt][2], GarageData[id][GarageInt][3], GarageData[id][ExitInteriorID], GarageData[id][ExitWorld]);
					SendClientMessage(i, COLOR_YELLOW, "SERVER: Bu garajýn iç kýsmý güncellendi.");
					SetCameraBehindPlayer(i);
				}
			}

			SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Bu garajýn çýkýþ kýsmýný güncelledin.");
			Garage_Refresh(id);
			Garage_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "kilit", true))
		{
			new locked;
			if (sscanf(string_two, "d", locked)) return SendUsageMessage(playerid, "/garaj duzenle [garaj ID] kilit [0/1]");
			if (locked < 0 || locked > 1)	return SendErrorMessage(playerid, "Hatalý kilit durumu girdin. (0/1)");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu garajýn kapýlarýný %s olarak güncelledin.", !locked ? ("kilitli deðil") : ("kilitli"));
			GarageData[id][GarageLocked] = bool:locked;
			Garage_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "birlik", true))
		{
			new faction;
			if(sscanf(string_two, "d", faction)) return SendUsageMessage(playerid, "/garaj duzenle [garaj ID] birlik [birlik ID]");
            if(!Iter_Contains(Factions, faction)) return SendErrorMessage(playerid, "Hatalý birlik ID girdin.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu garajýn birliðini %i olarak güncelledin.", faction);
			GarageData[id][GarageFaction] = faction;
			Entrance_Save(id);
			return 1;
		}
	}
	else if (!strcmp(type, "sil", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/garaj sil [bina ID]");
		if (!Iter_Contains(Garages, id)) return SendErrorMessage(playerid, "Hatalý garaj ID girdin.");
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý garajý sildin.", id);
		Garage_Delete(id);
		return 1;
 	}
 	else SendClientMessage(playerid, COLOR_ADM, "SERVER: Geçersiz parametre girdin.");
	return 1;
}

CMD:bina(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);

	static type[24], string[128];

	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/bina [parametre]");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ekle, duzenle, sil, git");
		return 1;
	}

	if (!strcmp(type, "ekle", true))
	{
		if (isnull(string) || strlen(string) > 32) return SendUsageMessage(playerid, "/bina ekle [bina adý]");
		Entrance_Create(playerid, string);
		return 1;
	}
	else if (!strcmp(type, "git", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/bina git [bina ID]");
		if (!Iter_Contains(Entrances, id)) return SendErrorMessage(playerid, "Hatalý bina ID girdin.");
		SendPlayer(playerid, EntranceData[id][EntrancePos][0], EntranceData[id][EntrancePos][1], EntranceData[id][EntrancePos][2], EntranceData[id][EntrancePos][3], EntranceData[id][EntranceInteriorID], EntranceData[id][EntranceWorld]);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý binaya ýþýnlandýn.", id);
		return 1;
 	}
	else if (!strcmp(type, "duzenle", true))
	{
		static id, type_two[24], string_two[128];

		if (sscanf(string, "ds[24]S()[128]", id, type_two, string_two))
		{
			SendUsageMessage(playerid, "/bina duzenle [bina ID] [parametre]");
		    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}[giris][cikis][ad][kilit][ikon]");
			return 1;
		}

		if (!Iter_Contains(Entrances, id)) return SendErrorMessage(playerid, "Hatalý bina ID girdin.");

		if (!strcmp(type_two, "giris", true))
		{
			GetPlayerPos(playerid, EntranceData[id][EntrancePos][0], EntranceData[id][EntrancePos][1], EntranceData[id][EntrancePos][2]);
			GetPlayerFacingAngle(playerid, EntranceData[id][EntrancePos][3]);

			EntranceData[id][EntranceInteriorID] = GetPlayerInterior(playerid);
			EntranceData[id][EntranceWorld] = GetPlayerVirtualWorld(playerid);

            SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Bu binanýn giriþ kýsmýný güncelledin.");

			Entrance_Refresh(id);
			Entrance_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "cikis", true))
		{
			GetPlayerPos(playerid, EntranceData[id][EntranceInt][0], EntranceData[id][EntranceInt][1], EntranceData[id][EntranceInt][2]);
			GetPlayerFacingAngle(playerid, EntranceData[id][EntranceInt][3]);

			EntranceData[id][ExitInteriorID] = GetPlayerInterior(playerid);
			EntranceData[id][ExitWorld] = GetPlayerVirtualWorld(playerid);

			foreach(new i : Player)
			{
				if(PlayerData[i][pInsideEntrance] == id)
				{
					SendPlayer(i, EntranceData[id][EntranceInt][0], EntranceData[id][EntranceInt][1], EntranceData[id][EntranceInt][2], EntranceData[id][EntranceInt][3], EntranceData[id][ExitInteriorID], EntranceData[id][ExitWorld]);
					SendClientMessage(i, COLOR_YELLOW, "SERVER: Bu binanýn iç kýsmý güncellendi.");
					SetCameraBehindPlayer(i);
				}
			}

			SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Bu binanýn çýkýþ kýsmýný güncelledin.");

			Entrance_Refresh(id);
			Entrance_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "ad", true))
		{
			new name[32];
			if (sscanf(string_two, "s[32]", name)) return SendUsageMessage(playerid, "/bina duzenle [bina ID] name [bina adý]");
			format(EntranceData[id][EntranceName], 32, name);
			Entrance_Refresh(id);
			Entrance_Save(id);

			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu binanýn adýný %s olarak güncelledin.", name);
			return 1;
		}
		else if (!strcmp(type_two, "kilit", true))
		{
			new locked;
			if (sscanf(string_two, "d", locked)) return SendUsageMessage(playerid, "/bina duzenle [bina ID] locked [0/1]");
			if (locked < 0 || locked > 1)	return SendErrorMessage(playerid, "Hatalý kilit durumu girdin. (0/1)");
			EntranceData[id][EntranceLocked] = bool:locked;
			Entrance_Save(id);

			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu binanýn kapýlarýný %s olarak güncelledin.", !locked ? ("kilitli deðil") : ("kilitli"));
			return 1;
		}
		else if (!strcmp(type_two, "ikon", true))
		{
			new icon;
			if (sscanf(string_two, "d", icon)) return SendUsageMessage(playerid, "/bina duzenle [bina ID] icon [ikon ID]");
			EntranceData[id][EntranceIcon] = icon;
			Entrance_Refresh(id);
			Entrance_Save(id);

			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu binanýn ikonunu %i olarak güncelledin.", icon);
			return 1;
		}
	}
	else if (!strcmp(type, "sil", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/bina sil [bina ID]");
		if (!Iter_Contains(Entrances, id)) return SendErrorMessage(playerid, "Hatalý bina ID girdin.");
		Entrance_Delete(id);

		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý binayý sildin.", id);
		return 1;
 	}
	return 1;
}

CMD:pns(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);

	static type[24], string[128];

	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/pns [parametre]");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ekle, duzenle, sil, git");
		return 1;
	}

	if (!strcmp(type, "ekle", true))
	{
		if (isnull(string) || strlen(string) > 32) return SendUsageMessage(playerid, "/pns ekle [pns adý]");
		PNS_Create(playerid, string);
		return 1;
	}
	else if (!strcmp(type, "git", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/pns git [pns ID]");
		if (!Iter_Contains(Sprays, id)) return SendErrorMessage(playerid, "Hatalý PNS ID girdin.");
		SendPlayer(playerid, PNSData[id][PnsPos][0], PNSData[id][PnsPos][1], PNSData[id][PnsPos][2], PNSData[id][PnsPos][3], PNSData[id][EnterInteriorID], PNSData[id][EnterWorld]);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý PNS'e ýþýnlandýn.", id);
		return 1;
 	}
	else if (!strcmp(type, "duzenle", true))
	{
		static id, type_two[24], string_two[128];

		if (sscanf(string, "ds[24]S()[128]", id, type_two, string_two))
		{
			SendUsageMessage(playerid, "/pns duzenle [pns ID] [parametre]");
		    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}[giris][cikis][ad][ucret]");
			return 1;
		}

		if (!Iter_Contains(Sprays, id)) return SendErrorMessage(playerid, "Hatalý PNS ID girdin.");

		if (!strcmp(type_two, "giris", true))
		{
			GetPlayerPos(playerid, PNSData[id][PnsPos][0], PNSData[id][PnsPos][1], PNSData[id][PnsPos][2]);
			GetPlayerFacingAngle(playerid, PNSData[id][PnsPos][3]);

			PNSData[id][EnterInteriorID] = GetPlayerInterior(playerid);
			PNSData[id][EnterWorld] = GetPlayerVirtualWorld(playerid);

            SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Bu PNS'nin giriþ kýsmýný güncelledin.");

			PNS_Refresh(id);
			PNS_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "cikis", true))
		{
			GetPlayerPos(playerid, PNSData[id][PnsInt][0], PNSData[id][PnsInt][1], PNSData[id][PnsInt][2]);
			GetPlayerFacingAngle(playerid, PNSData[id][PnsInt][3]);

			PNSData[id][ExitInteriorID] = GetPlayerInterior(playerid);
			PNSData[id][ExitWorld] = GetPlayerVirtualWorld(playerid);

			SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Bu PNS'nin çýkýþ kýsmýný güncelledin.");

			PNS_Refresh(id);
			PNS_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "ad", true))
		{
			new name[45];
			if (sscanf(string_two, "s[45]", name)) return SendUsageMessage(playerid, "/pns duzenle [pns ID] ad [pns adý]");
			format(PNSData[id][PnsName], 45, name);

			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu PNS'nin adýný %s olarak güncelledin.", name);
			PNS_Refresh(id);
			PNS_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "ucret", true))
		{
			new amount;
			if (sscanf(string_two, "d", amount)) return SendUsageMessage(playerid, "/pns duzenle [pns ID] ucret [miktar]");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu PNS'nin ücretini %i olarak güncelledin.", amount);
			PNSData[id][PnsPrice] = amount;
			PNS_Refresh(id);
			PNS_Save(id);
			return 1;
		}
	}
	else if (!strcmp(type, "sil", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/pns sil [pns ID]");
		if (!Iter_Contains(Sprays, id)) return SendErrorMessage(playerid, "Hatalý PNS ID girdin.");
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý PNS'yi sildin.", id);
		PNS_Delete(id);
		return 1;
 	}
 	return 1;
}

CMD:aktor(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);

	static type[24], string[128];

	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/aktor [parametre]");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ekle, duzenle, sil, git");
		return 1;
	}

	if (!strcmp(type, "ekle", true))
	{
		if (isnull(string) || strlen(string) > 32) return SendUsageMessage(playerid, "/aktor ekle [aktör adý]");
		Actor_Create(playerid, string);
		return 1;
	}
	else if (!strcmp(type, "git", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/aktor git [aktör ID]");
		if (!Iter_Contains(Actors, id)) return SendErrorMessage(playerid, "Hatalý aktör ID girdin.");
		SendPlayer(playerid, ActorData[id][ActorPos][0], ActorData[id][ActorPos][1], ActorData[id][ActorPos][2], ActorData[id][ActorPos][3], 0, ActorData[id][ActorWorld]);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aktöre ýþýnlandýn.", id);
		return 1;
 	}
	else if (!strcmp(type, "duzenle", true))
	{
		static id, type_two[24], string_two[128];

		if (sscanf(string, "ds[24]S()[128]", id, type_two, string_two))
		{
			SendUsageMessage(playerid, "/aktor duzenle [aktör ID] [parametre]");
		    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}[pozisyon][kiyafet][ad]");
			return 1;
		}

		if (!Iter_Contains(Actors, id)) return SendErrorMessage(playerid, "Hatalý aktör ID girdin.");

		if (!strcmp(type_two, "pozisyon", true))
		{
			GetPlayerPos(playerid, ActorData[id][ActorPos][0], ActorData[id][ActorPos][1], ActorData[id][ActorPos][2]);
			GetPlayerFacingAngle(playerid, ActorData[id][ActorPos][3]);
			ActorData[id][ActorInterior] = GetPlayerInterior(playerid);
			ActorData[id][ActorWorld] = GetPlayerVirtualWorld(playerid);
            SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Bu aktörün giriþ kýsmýný güncelledin.");
			Actor_Refresh(id);
			Actor_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "ad", true))
		{
			new name[45];
			if (sscanf(string_two, "s[45]", name)) return SendUsageMessage(playerid, "/aktor duzenle [aktör ID] ad [aktör adý]");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu aktörün adýný %s olarak güncelledin.", name);
			format(ActorData[id][ActorName], 45, name);
			Actor_Refresh(id);
			Actor_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "kiyafet", true))
		{
			new skin;
			if (sscanf(string_two, "d", skin)) return SendUsageMessage(playerid, "/aktor duzenle [aktör ID] kiyafet [skin ID]");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu aktörün kýyafetini %i olarak güncelledin.", skin);
			ActorData[id][ActorModel] = skin;
			Actor_Refresh(id);
			Actor_Save(id);
			return 1;
		}
	}
	else if (!strcmp(type, "sil", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/aktor sil [aktör ID]");
		if (!Iter_Contains(Actors, id)) return SendErrorMessage(playerid, "Hatalý aktör ID girdin.");
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý aktörü sildin.", id);
		Actor_Delete(id);
		return 1;
 	}
 	return 1;
}

CMD:atm(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);

	static type[24], string[128];

	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/atm [parametre]");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ekle, duzenle, sil, git");
		return 1;
	}

	if (!strcmp(type, "ekle", true))
	{
		ATM_Create(playerid);
		return 1;
	}
	else if (!strcmp(type, "git", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/atm git [atm ID]");
		if (!Iter_Contains(ATMs, id)) return SendErrorMessage(playerid, "Hatalý atm ID girdin.");
		SendPlayer(playerid, ATMData[id][AtmPos][0], ATMData[id][AtmPos][1], ATMData[id][AtmPos][2], ATMData[id][AtmPos][3], ATMData[id][AtmInterior], ATMData[id][AtmWorld]);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý ATM noktasýna ýþýnlandýn.", id);
		return 1;
 	}
	else if (!strcmp(type, "duzenle", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/atm duzenle [atm ID]");
		if (!Iter_Contains(ATMs, id)) return SendErrorMessage(playerid, "Hatalý atm ID girdin.");
		if(EditingObject[playerid]) return SendErrorMessage(playerid, "Þu anda baþka bir obje düzenliyorsun.");

		EditingID[playerid] = id;
		EditingObject[playerid] = 9;
		EditDynamicObject(playerid, ATMData[id][AtmObject]);
		return 1;
	}
	else if (!strcmp(type, "sil", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/atm sil [atm ID]");
		if (!Iter_Contains(ATMs, id)) return SendErrorMessage(playerid, "Hatalý atm ID girdin.");
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý ATM noktasýný sildin.", id);
		ATM_Delete(id);
		return 1;
 	}
 	return 1;
}

CMD:teleport(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);

	static type[24], string[128];
	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/teleport [parametre]");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ekle, duzenle, sil, git, liste");
		return 1;
	}

	if (!strcmp(type, "ekle", true))
	{
		if(isnull(string) || strlen(string) > 30) return SendUsageMessage(playerid, "/teleport ekle [teleport adý]");

		new
		    Float: x,
		    Float: y,
		    Float: z,
		    Float: a;

		GetPlayerPos(playerid, x, y, z);
		GetPlayerFacingAngle(playerid, a);

		new query[256];
		mysql_format(m_Handle, query, sizeof(query), "INSERT INTO teleports (TeleportName, TeleportX, TeleportY, TeleportZ, TeleportA, TeleportInterior, TeleportWorld) VALUES('%e', %f, %f, %f, %f, %i, %i)", string, x, y, z, a, GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid));
        new Cache: cache = mysql_query(m_Handle, query);
        SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý ýþýnlanma noktasý baþarýyla eklendi.", cache_insert_id());
        cache_delete(cache);
		return 1;
	}
	else if (!strcmp(type, "liste", true))
	{
		Teleport_List(playerid);
		return 1;
	}
	else if (!strcmp(type, "sil", true))
	{
		static id;
		if(sscanf(string, "i", id)) return SendUsageMessage(playerid, "/teleport sil [tp ID]");
		if(!Teleport_Exists(id)) return SendErrorMessage(playerid, "Hatalý tp ID girdin.");

		new query[64];
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý ýþýnlanma noktasýný sildin.", id);
		mysql_format(m_Handle, query, sizeof(query), "DELETE FROM teleports WHERE id = %i", id);
		mysql_tquery(m_Handle, query);
		return 1;
 	}
 	return 1;
}

CMD:akapi(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);

	static type[24], string[128];
	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/akapi [parametre]");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ekle, duzenle, sil, git");
		return 1;
	}

	if (!strcmp(type, "ekle", true))
	{
		if (isnull(string) || strlen(string) > 35) return SendUsageMessage(playerid, "/akapi ekle [kapý adý]");
		Door_Create(playerid, string);
		return 1;
	}
	else if (!strcmp(type, "git", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/akapi git [kapý ID]");
		if (!Iter_Contains(Doors, id)) return SendErrorMessage(playerid, "Hatalý kapý ID girdin.");
		SendPlayer(playerid, DoorData[id][EnterPos][0], DoorData[id][EnterPos][1], DoorData[id][EnterPos][2], DoorData[id][EnterPos][3], DoorData[id][EnterInterior], DoorData[id][EnterWorld]);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý kapýya ýþýnlandýn.", id);
		return 1;
 	}
	else if (!strcmp(type, "duzenle", true))
	{
		static id, type_two[24], string_two[128];
		if (sscanf(string, "ds[24]S()[128]", id, type_two, string_two))
		{
			SendUsageMessage(playerid, "/akapi duzenle [kapý ID] [parametre]");
		    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}[giris][cikis][birlik][kilit][ad]");
			return 1;
		}

		if (!Iter_Contains(Doors, id)) return SendErrorMessage(playerid, "Hatalý kapý ID girdin.");

		if (!strcmp(type_two, "giris", true))
		{
			GetPlayerPos(playerid, DoorData[id][EnterPos][0], DoorData[id][EnterPos][1], DoorData[id][EnterPos][2]);
			GetPlayerFacingAngle(playerid, DoorData[id][EnterPos][3]);

		    DoorData[id][EnterInterior] = GetPlayerInterior(playerid);
	    	DoorData[id][EnterWorld] = GetPlayerVirtualWorld(playerid);

            SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Bu kapýnýn dýþ pozisyonunu güncelledin.");
            Door_Refresh(id);
			Door_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "cikis", true))
		{
			GetPlayerPos(playerid, DoorData[id][ExitPos][0], DoorData[id][ExitPos][1], DoorData[id][ExitPos][2]);
			GetPlayerFacingAngle(playerid, DoorData[id][ExitPos][3]);

		    DoorData[id][ExitInterior] = GetPlayerInterior(playerid);
	    	DoorData[id][ExitWorld] = GetPlayerVirtualWorld(playerid);

            SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Bu kapýnýn iç pozisyonunu güncelledin.");
            Door_Refresh(id);
			Door_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "birlik", true))
		{
			new faction;
			if (sscanf(string_two, "d", faction)) return SendUsageMessage(playerid, "/akapi duzenle [kapý ID] birlik [birlik ID]");
			if (!Iter_Contains(Factions, faction)) return SendErrorMessage(playerid, "Hatalý birlik ID girdin.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu kapýnýn sahibini %i birliði olarak güncelledin.", faction);
			DoorData[id][DoorFaction] = faction;
			Door_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "kilit", true))
		{
			new locked;
			if (sscanf(string_two, "d", locked)) return SendUsageMessage(playerid, "/akapi duzenle [kapi ID] kilit [0/1]");
			if (locked < 0 || locked > 1)	return SendErrorMessage(playerid, "Hatalý kilit durumu girdin. (0/1)");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu kapýnýn kilidini %s olarak güncelledin.", !locked ? ("kilitli deðil") : ("kilitli"));
			DoorData[id][DoorLocked] = bool:locked;
			Door_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "ad", true))
		{
			new name[35];
			if (sscanf(string_two, "s[35]", name)) return SendUsageMessage(playerid, "/kapi duzenle [kapý ID] ad [kapý adý]");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu kapýnýn adýný %s olarak güncelledin.", name);
			format(DoorData[id][DoorName], 35, name);
			Door_Save(id);
			return 1;
		}
	}
	else if (!strcmp(type, "sil", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/akapi sil [kapý ID]");
		if (!Iter_Contains(Doors, id)) return SendErrorMessage(playerid, "Hatalý kapý ID girdin.");
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý kapýyý sildin.", id);
		Door_Delete(id);
		return 1;
 	}
 	return 1;
}

CMD:agate(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);

	static type[24], string[128];
	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/agate [parametre]");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ekle, duzenle, sil, git");
		return 1;
	}

	if (!strcmp(type, "ekle", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/agate ekle [obje ID]");
		Gate_Create(playerid, id);
		return 1;
	}
	else if (!strcmp(type, "git", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/agate git [gate ID]");
		if (!Iter_Contains(Gates, id)) return SendErrorMessage(playerid, "Hatalý gate ID girdin.");
		SendPlayer(playerid, GateData[id][GatePos][0], GateData[id][GatePos][1], GateData[id][GatePos][2], GateData[id][GatePos][3], GateData[id][GateInterior], GateData[id][GateWorld]);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý hareketli kapýya ýþýnlandýn.", id);
		return 1;
 	}
	else if (!strcmp(type, "duzenle", true))
	{
		static id, type_two[24], string_two[128];
		if (sscanf(string, "ds[24]S()[128]", id, type_two, string_two))
		{
			SendUsageMessage(playerid, "/agate duzenle [gate ID] [parametre]");
		    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}[pozisyon][apozisyon][hiz][alan][sure][model][link][birlik][texture]");
			return 1;
		}

		if (!Iter_Contains(Gates, id)) return SendErrorMessage(playerid, "Hatalý gate ID girdin.");

		if (!strcmp(type_two, "pozisyon", true))
		{
			if(EditingObject[playerid]) return SendErrorMessage(playerid, "Þu anda baþka bir obje düzenliyorsun.");

			EditingID[playerid] = id;
			EditingObject[playerid] = 1;
			EditDynamicObject(playerid, GateData[id][GateObject]);
			return 1;
		}
		else if (!strcmp(type_two, "apozisyon", true))
		{
			if(GateData[id][GateStatus]) return SendErrorMessage(playerid, "Düzenlemek istediðin kapýyý ilk önce kapat.");
			if(EditingObject[playerid]) return SendErrorMessage(playerid, "Þu anda baþka bir obje düzenliyorsun.");

			EditingID[playerid] = id;
			EditingObject[playerid] = 2;
			EditDynamicObject(playerid, GateData[id][GateObject]);
			return 1;
		}
		else if (!strcmp(type_two, "alan", true))
		{
			new Float: alan;
			if (sscanf(string_two, "f", alan)) return SendUsageMessage(playerid, "/agate duzenle [gate ID] alan [miktar(0-20)]");
			if (alan < 0.0 || alan > 20.0) return SendErrorMessage(playerid, "Bu hareketli kapýnýn alaný 0 - 20 deðerlerini alabilir.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu hareketli kapýnýn hýzýný %f olarak güncelledin.", alan);
			GateData[id][GateRadius] = alan;
			Gate_Refresh(id);
			Gate_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "hiz", true))
		{
			new Float: speed;
			if (sscanf(string_two, "f", speed)) return SendUsageMessage(playerid, "/agate duzenle [gate ID] hiz [miktar(0-20)]");
			if (speed < 0.0 || speed > 20.0) return SendErrorMessage(playerid, "Bu hareketli kapýnýn hýzý 0 - 20 deðerlerini alabilir.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu hareketli kapýnýn hýzýný %f olarak güncelledin.", speed);
			GateData[id][GateSpeed] = speed;
			Gate_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "sure", true))
		{
			new sure;
			if (sscanf(string_two, "d", sure)) return SendUsageMessage(playerid, "/agate duzenle [gate ID] sure [miktar(0-60000ms)]");
			if (sure < 0 || sure > 60000) return SendErrorMessage(playerid, "Bu hareketli kapýnýn hýzý 0 - 60000 milisaniye deðerlerini alabilir.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu hareketli kapýnýn kapanma süresini %i olarak güncelledin. (0 girildiyse otomatik kapanmaz)", sure);
			GateData[id][GateTime] = sure;
			Gate_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "model", true))
		{
			new model;
			if (sscanf(string_two, "d", model)) return SendUsageMessage(playerid, "/agate duzenle [gate ID] model [obje ID]");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu hareketli kapýnýn modelini %i olarak güncelledin.", model);
			GateData[id][GateModel] = model;
			Gate_Refresh(id);
			Gate_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "link", true))
		{
			static linkid = -1;
			if(sscanf(string_two, "i", linkid)) return SendUsageMessage(playerid, "/agate duzenle [gate ID] link [gate ID]");
			if(!Iter_Contains(Gates, linkid)) return SendErrorMessage(playerid, "Hatalý gate ID girdin.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu hareketli kapýyý %i numaralý hareketli kapýya baðladýn.", linkid);
			GateData[id][GateLinkID] = (linkid == -1) ? (-1) : (GateData[linkid][GateID]);
			Gate_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "texture", true))
		{
			new tindex, tmodel, txdname[33], texturename[33];
			if (sscanf(string_two, "dds[33]s[33]", tindex, tmodel, txdname, texturename)) return SendUsageMessage(playerid, "/agate duzenle [gate ID] texture [tindex] [tmodel] [txdname] [txtname]");
			SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Bu hareketli kapýnýn texture güncelledin.");
			GateData[id][GateTIndex] = tindex;
			GateData[id][GateTModel] = tmodel;
			format(GateData[id][GateTXDName], 33, "%s", txdname);
			format(GateData[id][GateTextureName], 33, "%s", texturename);
			Gate_Refresh(id);
			Gate_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "birlik", true))
		{
			new faction;
			if (sscanf(string_two, "d", faction)) return SendUsageMessage(playerid, "/agate duzenle [gate ID] birlik [birlik ID]");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu hareketli kapýnýn sahibi %i birliði olarak güncelledin.", faction);
			GateData[id][GateFaction] = faction;
			Gate_Save(id);
			return 1;
		}
	}
	else if (!strcmp(type, "sil", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/agate sil [gate ID]");
		if (!Iter_Contains(Gates, id)) return SendErrorMessage(playerid, "Hatalý gate ID girdin.");
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý hareketli kapýyý sildin.", id);
		Gate_Delete(id);
		return 1;
 	}
 	return 1;
}

CMD:obje(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);

	static type[24], string[128];

	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/obje [parametre]");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ekle, duzenle, sil, git");
		return 1;
	}

	if (!strcmp(type, "ekle", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/obje ekle [obje ID]");
		Object_Create(playerid, id);
		return 1;
	}
	else if (!strcmp(type, "git", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/obje git [atm ID]");
		if (!Iter_Contains(Objects, id)) return SendErrorMessage(playerid, "Hatalý obje ID girdin.");
		SendPlayer(playerid, ObjectData[id][ObjectPos][0], ObjectData[id][ObjectPos][1], ObjectData[id][ObjectPos][2], ObjectData[id][ObjectPos][3], ObjectData[id][ObjectInterior], ObjectData[id][ObjectWorld]);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý objeye ýþýnlandýn.", id);
		return 1;
 	}
	else if (!strcmp(type, "duzenle", true))
	{
		static id, type_two[24], string_two[128];
		if (sscanf(string, "ds[24]S()[128]", id, type_two, string_two))
		{
			SendUsageMessage(playerid, "/obje duzenle [obje ID] [parametre]");
		    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}[pozisyon][model]");
			return 1;
		}

		if (!Iter_Contains(Objects, id)) return SendErrorMessage(playerid, "Hatalý obje ID girdin.");

		if (!strcmp(type_two, "pozisyon", true))
		{
			if(EditingObject[playerid]) return SendErrorMessage(playerid, "Þu anda baþka bir obje düzenliyorsun.");

			EditingID[playerid] = id;
			EditingObject[playerid] = 10;
			EditDynamicObject(playerid, ObjectData[id][ObjectHolder]);
			return 1;
		}
		else if (!strcmp(type_two, "model", true))
		{
			new mdl;
			if (sscanf(string_two, "d", mdl)) return SendUsageMessage(playerid, "/obje duzenle [obje ID] model [yeni obje ID]");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu objenin modelini %i olarak güncelledin.", mdl);
			ObjectData[id][ObjectModel] = mdl;
			Object_Refresh(id);
			Object_Save(id);
			return 1;
		}
		return 1;
	}
	else if (!strcmp(type, "sil", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/obje sil [obje ID]");
		if (!Iter_Contains(Objects, id)) return SendErrorMessage(playerid, "Hatalý obje ID girdin.");
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý objeyi sildin.", id);
		Object_Delete(id);
		return 1;
 	}
 	return 1;
}

CMD:agraffiti(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);

	static type[24], string[128];
	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/agraffiti [parametre]");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ekle, duzenle, sil, git");
		return 1;
	}

	if (!strcmp(type, "ekle", true))
	{
 		new list[128];
	    for(new i = 0; i < sizeof(g_spraytag); i ++)
	    {
	        format(list, sizeof(list), "%s%s\n", list, g_spraytag[i][tag_name]);
	    }
	    ShowPlayerDialog(playerid, DIALOG_SPRAY_CREATE, DIALOG_STYLE_LIST, "Graffiti Resimi:", list, "Seç", "<<");
		return 1;
	}
	else if (!strcmp(type, "git", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/agraffiti git [graffiti ID]");
		if (!Iter_Contains(Tags, id)) return SendErrorMessage(playerid, "Hatalý graffiti ID girdin.");
		SendPlayer(playerid, SprayData[id][SprayLocation][0], SprayData[id][SprayLocation][1], SprayData[id][SprayLocation][2], SprayData[id][SprayLocation][3], SprayData[id][SprayInterior], SprayData[id][SprayWorld]);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý graffitiye ýþýnlandýn.", id);
		return 1;
 	}
	else if (!strcmp(type, "duzenle", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/agraffiti duzenle [graffiti ID]");
		if (!Iter_Contains(Tags, id)) return SendErrorMessage(playerid, "Hatalý graffiti ID girdin.");
		if(EditingObject[playerid]) return SendErrorMessage(playerid, "Þu anda baþka bir obje düzenliyorsun.");

		EditingID[playerid] = id;
		EditingObject[playerid] = 11;
		EditDynamicObject(playerid, SprayData[id][SprayObject]);
		return 1;
 	}
	else if (!strcmp(type, "sil", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/agraffiti sil [graffiti ID]");
		if (!Iter_Contains(Tags, id)) return SendErrorMessage(playerid, "Hatalý graffiti ID girdin.");
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý graffitiyi sildin.", id);
		Spray_Delete(id);
		return 1;
 	}
 	return 1;
}

CMD:billboard(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);

	static type[24], string[128];
	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/billboard [parametre]");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ekle, duzenle, kirabitir, sil, git");
		return 1;
	}

	if (!strcmp(type, "ekle", true))
	{
 		Billboard_Create(playerid);
		return 1;
	}
	else if (!strcmp(type, "git", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/billboard git [billboard ID]");
		if (!Iter_Contains(Billboards, id)) return SendErrorMessage(playerid, "Hatalý billboard ID girdin.");
		SendPlayer(playerid, BillboardData[id][BillboardLocation][0], BillboardData[id][BillboardLocation][1], BillboardData[id][BillboardLocation][2], BillboardData[id][BillboardLocation][3], BillboardData[id][BillboardInterior], BillboardData[id][BillboardWorld]);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý billboard noktasýna ýþýnlandýn.", id);
		if(PlayerData[playerid][pAdminDuty])
		{
			SendClientMessageEx(playerid, COLOR_YELLOW, "BILLBOARD ID: [%i] VERÝTABANI ID: [%i]", id, BillboardData[id][BillboardID]);
			if(BillboardData[id][BillboardRentedBy] != 0) SendClientMessageEx(playerid, COLOR_YELLOW, "KÝRALAYAN: [%s] BÝTÝÞ SÜRESÝ: [%s] ", ReturnSQLName(BillboardData[id][BillboardRentedBy]), GetFullTime(BillboardData[id][BillboardRentExpiresAt]));
		}
		return 1;
 	}
 	else if (!strcmp(type, "kirabitir", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/billboard kirabitir [billboard ID]");
		if (!Iter_Contains(Billboards, id)) return SendErrorMessage(playerid, "Hatalý billboard ID girdin.");
		if (!BillboardData[id][BillboardRentedBy]) return SendErrorMessage(playerid, "Bu billboard kiralanmamýþ.");
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý billboard noktasýna kirasýný bitirdin.", id);

 		BillboardData[id][BillboardRentedBy] = 0;
 		BillboardData[id][BillboardRentExpiresAt] = 0;
 		format(BillboardData[id][BillboardText], 128, "Yok");
		Billboard_Refresh(id);
		Billboard_Save(id);
		return 1;
 	}
	else if (!strcmp(type, "duzenle", true))
	{
		static id, type_two[24], string_two[128];
		if (sscanf(string, "ds[24]S()[128]", id, type_two, string_two))
		{
			SendUsageMessage(playerid, "/billboard duzenle [billboard ID] [parametre]");
		    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}[pozisyon][model]");
			return 1;
		}

		if (!Iter_Contains(Billboards, id)) return SendErrorMessage(playerid, "Hatalý billboard ID girdin.");

		if (!strcmp(type_two, "pozisyon", true))
		{
			if(EditingObject[playerid]) return SendErrorMessage(playerid, "Þu anda baþka bir obje düzenliyorsun.");

			EditingID[playerid] = id;
			EditingObject[playerid] = 12;
			EditDynamicObject(playerid, BillboardData[id][BillboardObject]);
			return 1;
		}
		else if (!strcmp(type_two, "model", true))
		{
			new mdl;
			if (sscanf(string_two, "d", mdl)) return SendUsageMessage(playerid, "/billboard duzenle [billboard ID] model [yeni obje ID]");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu billboardýn modelini %i olarak güncelledin.", mdl);
			BillboardData[id][BillboardModel] = mdl;
			Billboard_Refresh(id);
			Billboard_Save(id);
			return 1;
		}
		return 1;
 	}
	else if (!strcmp(type, "sil", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/billboard sil [billboard ID]");
		if (!Iter_Contains(Billboards, id)) return SendErrorMessage(playerid, "Hatalý billboard ID girdin.");
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý billboard noktasýný sildin.", id);
		Billboard_Delete(id);
		return 1;
 	}
 	return 1;
}

/*
CMD:pickup(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);

	static type[24], string[128];
	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/pickup [parametre]");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ekle, duzenle, sil, git");
		return 1;
	}

	if (!strcmp(type, "ekle", true))
	{
		if (isnull(string) || strlen(string) > 120) return SendUsageMessage(playerid, "/pickup ekle [mesaj]");
 		Pickup_Create(playerid, string);
		return 1;
	}
	else if (!strcmp(type, "git", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/tutuklama git [tutuklama ID]");
		if (!Iter_Contains(Arrests, id)) return SendErrorMessage(playerid, "Hatalý tutuklama ID girdin.");
		SendPlayer(playerid, ArrestData[id][ArrestLocation][0], ArrestData[id][ArrestLocation][1], ArrestData[id][ArrestLocation][2], 90.0, ArrestData[id][ArrestInterior], ArrestData[id][ArrestWorld]);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý tutuklama noktasýna ýþýnlandýn.", id);
		return 1;
 	}
 	else if (!strcmp(type, "duzenle", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/tutuklama duzenle [tutuklama ID]");
		if (!Iter_Contains(Arrests, id)) return SendErrorMessage(playerid, "Hatalý tutuklama ID girdin.");

		GetPlayerPos(playerid, ArrestData[id][ArrestLocation][0], ArrestData[id][ArrestLocation][1], ArrestData[id][ArrestLocation][2]);
	    ArrestData[id][ArrestInterior] = GetPlayerInterior(playerid);
	    ArrestData[id][ArrestWorld] = GetPlayerVirtualWorld(playerid);
	    Arrest_Refresh(id);
	    Arrest_Save(id);
		return 1;
 	}
	else if (!strcmp(type, "sil", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/tutuklama sil [tutuklama ID]");
		if (!Iter_Contains(Arrests, id)) return SendErrorMessage(playerid, "Hatalý tutuklama ID girdin.");
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý tutuklama noktasýný sildin.", id);
		Arrest_Delete(id);
		return 1;
 	}
 	return 1;
}

Pickup_Create(playerid, msg[])
{
	new id = Iter_Free(Pickups);
   	if (id == -1) return SendErrorMessage(playerid, "Maksimum eklenebilecek pickup sýnýrýna ulaþýlmýþ.");

	GetPlayerPos(playerid, PickupData[id][PickupLocation][0], PickupData[id][PickupLocation][1], PickupData[id][PickupLocation][2]);
	PickupData[id][PickupInterior] = GetPlayerInterior(playerid);
	PickupData[id][PickupWorld] = GetPlayerVirtualWorld(playerid);
	PickupData[id][PickupRange] = 7.0;
	PickupData[id][PickupIcon] = 1239;

	ReplaceText(msg, "((", "{"), ReplaceText(msg, "))", "}"), ReplaceText(msg, "(n)", "\n");
	format(PickupData[id][PickupText], 128, msg);
    Iter_Add(Pickups, id);

	SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý pickup ekledin.", id);
	mysql_tquery(m_Handle, "INSERT INTO pickups (PickupInterior) VALUES(0)", "OnPickupCreated", "d", id);
	Pickup_Refresh(id);
	return 1;
}

Server:OnPickupCreated(id)
{
	if (Iter_Contains(Pickups, id))
	{
		PickupData[id][PickupID] = cache_insert_id();
		Pickup_Save(id);
	}
	return 1;
}*/

CMD:yaris(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);

	static type[24], string[128];
	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/yaris [parametre]");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}liste");
		return 1;
	}

	if (!strcmp(type, "liste", true))
	{
		mysql_tquery(m_Handle, "SELECT * FROM races ORDER BY RaceCreatedAt DESC LIMIT 20", "DisplayRacesList", "i", playerid);
		return 1;
 	}
 	return 1;
}

/*CMD:galeri(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);

	static type[24], string[128];
	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/galeri [parametre]");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ekle, duzenle, sil, git");
		return 1;
	}

	if (!strcmp(type, "ekle", true))
	{
		static id, vehname[45];
		if (sscanf(string, "i", id, vehname)) return SendUsageMessage(playerid, "/galeri ekle [araç ID] [araç adý]");
		if (isnull(vehname) || strlen(vehname) > 45) return SendErrorMessage(playerid, "Araç adý en fazla 45 karakter olabilir.");
		if (!GetVehicleModelByName(vehname)) return SendErrorMessage(playerid, "Hatalý model ID girdiniz.");
 		Pickup_Create(playerid, string);
		return 1;
	}
	else if (!strcmp(type, "git", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/tutuklama git [tutuklama ID]");
		if (!Iter_Contains(Arrests, id)) return SendErrorMessage(playerid, "Hatalý tutuklama ID girdin.");
		SendPlayer(playerid, ArrestData[id][ArrestLocation][0], ArrestData[id][ArrestLocation][1], ArrestData[id][ArrestLocation][2], 90.0, ArrestData[id][ArrestInterior], ArrestData[id][ArrestWorld]);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý tutuklama noktasýna ýþýnlandýn.", id);
		return 1;
 	}
 	else if (!strcmp(type, "duzenle", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/tutuklama duzenle [tutuklama ID]");
		if (!Iter_Contains(Arrests, id)) return SendErrorMessage(playerid, "Hatalý tutuklama ID girdin.");

		GetPlayerPos(playerid, ArrestData[id][ArrestLocation][0], ArrestData[id][ArrestLocation][1], ArrestData[id][ArrestLocation][2]);
	    ArrestData[id][ArrestInterior] = GetPlayerInterior(playerid);
	    ArrestData[id][ArrestWorld] = GetPlayerVirtualWorld(playerid);
	    Arrest_Refresh(id);
	    Arrest_Save(id);
		return 1;
 	}
	else if (!strcmp(type, "sil", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/tutuklama sil [tutuklama ID]");
		if (!Iter_Contains(Arrests, id)) return SendErrorMessage(playerid, "Hatalý tutuklama ID girdin.");
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý tutuklama noktasýný sildin.", id);
		Arrest_Delete(id);
		return 1;
 	}
 	return 1;
}*/

CMD:acctv(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);

	static type[24], string[128];
	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/acctv [parametre]");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ekle, duzenle, sil, git");
		return 1;
	}

	if (!strcmp(type, "ekle", true))
	{
	   	if (isnull(string) || strlen(string) > 30) return SendUsageMessage(playerid, "/acctv ekle [isim]");
	    Camera_Create(playerid, string);
		return 1;
	}
	else if (!strcmp(type, "git", true))
	{
		static id;
		if (sscanf(string, "i", id)) return SendUsageMessage(playerid, "/acctv git [cctv ID]");
		if (!Iter_Contains(Cameras, id)) return SendErrorMessage(playerid, "Hatalý cctv ID girdin.");
		SendPlayer(playerid, CameraData[id][CameraLocation][0], CameraData[id][CameraLocation][1], CameraData[id][CameraLocation][2], CameraData[id][CameraLocation][5], CameraData[id][CameraInterior], CameraData[id][CameraWorld]);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý CCTV noktasýna ýþýnlandýn.", id);
		return 1;
 	}
 	else if (!strcmp(type, "duzenle", true))
	{
		static id, type_two[24], string_two[128];
		if (sscanf(string, "ds[24]S()[128]", id, type_two, string_two))
		{
			SendUsageMessage(playerid, "/acctv duzenle [cctv ID] [parametre]");
		    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}[pozisyon][isim]");
			return 1;
		}

		if (!Iter_Contains(Cameras, id)) return SendErrorMessage(playerid, "Hatalý cctv ID girdin.");

		if (!strcmp(type_two, "pozisyon", true))
		{
			if(EditingObject[playerid]) return SendErrorMessage(playerid, "Þu anda baþka bir obje düzenliyorsun.");

			EditingID[playerid] = id;
			EditingObject[playerid] = 3;
			EditDynamicObject(playerid, CameraData[id][CameraObject]);
			return 1;
		}
		else if (!strcmp(type_two, "isim", true))
		{
			new cctv_name[30];
			if(sscanf(string_two, "s[128]", cctv_name)) return SendUsageMessage(playerid, "/acctv duzenle [cctv ID] ad [isim]");
			if(isnull(cctv_name) || strlen(cctv_name) > 30) return SendErrorMessage(playerid, "Kamera ismi maksimum 30 karakter olabilir.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu CCTV noktasýnýn adýný %s olarak güncelledin.", cctv_name);
			format(CameraData[id][CameraName], 30, cctv_name);
			Camera_Save(id);
			return 1;
		}
	}
 	else if (!strcmp(type, "sil", true))
	{
		static id;
		if (sscanf(string, "i", id)) return SendUsageMessage(playerid, "/acctv sil [cctv ID]");
		if (!Iter_Contains(Cameras, id)) return SendErrorMessage(playerid, "Hatalý cctv ID girdin.");
		if (GetPVarInt(playerid, "AtCCTV") != id) return SendErrorMessage(playerid, "Silmek istediðin CCTV noktasýna yakýn olmalýsýn.");
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý CCTV noktasýný sildin.", id);
		Camera_Delete(id);
		return 1;
 	}
	return 1;
}

CMD:aisyeri(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);

	static type[24], string[128];
	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/aisyeri [parametre]");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ekle, duzenle, sat, sil, git");
		return 1;
	}

	if (!strcmp(type, "ekle", true))
	{
	    new business_type, business_name[128];
	    if(sscanf(string, "is[128]", business_type, business_name))
	    {
	    	SendUsageMessage(playerid, "/aisyeri ekle [iþyeri tipi] [iþyeri adý]");
	    	SendClientMessage(playerid, COLOR_WHITE, "1: [Maðaza] 2: [Genel Maðaza] 3: [Pawnshop] 4: [Restaurant] 5: [Silahçý]");
			SendClientMessage(playerid, COLOR_WHITE, "6: [Kýyafetçi] 7: [Banka] 8: [Gece Kulübü] 9: [Galeri] 10: [Benzinci]");
			SendClientMessage(playerid, COLOR_WHITE, "11: [Reklamcý] 12: [Eczane] 13: [Özel]");
			return 1;
	    }

		if(business_type < 0 || business_type > 12) return SendErrorMessage(playerid, "Hatalý iþyeri tipi girdin.");
	    if(isnull(business_name) || strlen(business_name) > 128) return SendErrorMessage(playerid, "Ýþyeri adý maksimum 128 karakter olabilir.");
	    Business_Create(playerid, business_type, business_name);
		return 1;
	}
	else if (!strcmp(type, "duzenle", true))
	{
		static id, type_two[24], string_two[128];
		if (sscanf(string, "ds[24]S()[128]", id, type_two, string_two))
		{
			SendUsageMessage(playerid, "/aisyeri duzenle [iþyeri ID] [parametre]");
		    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}[dis][ic][ad][fiyat][seviye][tip][kilit]");
		    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}[girisfiyat][pickup][istenenkargo][kargomiktar][kargofiyat]");
			return 1;
		}

		if (!Iter_Contains(Businesses, id)) return SendErrorMessage(playerid, "Hatalý iþyeri ID girdin.");

		if (!strcmp(type_two, "dis", true))
		{
		    GetPlayerPos(playerid, BusinessData[id][EnterPos][0], BusinessData[id][EnterPos][1], BusinessData[id][EnterPos][2]);
		    GetPlayerFacingAngle(playerid, BusinessData[id][EnterPos][3]);
			BusinessData[id][EnterInterior] = GetPlayerInterior(playerid);
			BusinessData[id][EnterWorld] = GetPlayerVirtualWorld(playerid);

            SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Bu iþyerinin dýþ pozisyonunu güncelledin.");
			Business_Refresh(id);
			Business_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "ic", true))
		{
		    GetPlayerPos(playerid, BusinessData[id][ExitPos][0], BusinessData[id][ExitPos][1], BusinessData[id][ExitPos][2]);
		    GetPlayerFacingAngle(playerid, BusinessData[id][ExitPos][3]);
			BusinessData[id][ExitInterior] = GetPlayerInterior(playerid);
			BusinessData[id][ExitWorld] = GetPlayerVirtualWorld(playerid);

			if(BusinessData[id][BusinessType] == BUSINESS_BANK)
			{
				SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Bu iþyerinin banka noktasý iç pozisyonu deðiþtiðinden dolayý silindi.");
				if(IsValidDynamicPickup(BusinessData[id][BankPickup])) DestroyDynamicPickup(BusinessData[id][BankPickup]);
				for(new i = 0; i < 3; i++) BusinessData[id][BankPos][i] = 0.0;
			}

			foreach(new i : Player) if(PlayerData[i][pInsideBusiness] == id)
			{
				SendPlayer(i, BusinessData[id][ExitPos][0], BusinessData[id][ExitPos][1], BusinessData[id][ExitPos][2], BusinessData[id][ExitPos][3], BusinessData[id][ExitInterior], BusinessData[id][ExitWorld]);
				SendClientMessage(i, COLOR_YELLOW, "SERVER: Bu iþyeri iç kýsmý güncellendi.");
				SetCameraBehindPlayer(i);
			}

			SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Bu iþyerinin iç pozisyonunu güncelledin.");
			Business_Refresh(id);
			Business_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "ad", true))
		{
			new business_name[128];
			if (sscanf(string_two, "s[128]", business_name)) return SendUsageMessage(playerid, "/aisyeri duzenle [iþyeri ID] ad [iþyeri adý]");
			if(isnull(business_name) || strlen(business_name) > 128) return SendErrorMessage(playerid, "Ýþyeri adý maksimum 128 karakter olabilir.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu iþyerinin adýný %s olarak güncelledin.", business_name);
			format(BusinessData[id][BusinessName], 128, business_name);
			Business_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "kilit", true))
		{
			new locked;
			if (sscanf(string_two, "d", locked)) return SendUsageMessage(playerid, "/aisyeri duzenle [iþyeri ID] kilit [0/1]");
			if (locked < 0 || locked > 1) return SendErrorMessage(playerid, "Hatalý kilit durumu girdin. (0/1)");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu iþyerinin kapýlarýný %s olarak güncelledin.", !locked ? ("kilitli deðil") : ("kilitli"));
			BusinessData[id][BusinessLocked] = bool:locked;
			Business_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "fiyat", true))
		{
			static fiyat;
			if (sscanf(string_two, "d", fiyat)) return SendUsageMessage(playerid, "/aisyeri duzenle [iþyeri ID] fiyat [miktar]");
			if (fiyat < 25000) return SendErrorMessage(playerid, "Bu iþyerinin fiyatý en az $25,000 olabilir.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu iþyerinin fiyatýný $%s olarak güncelledin.", MoneyFormat(fiyat));
			BusinessData[id][BusinessPrice] = fiyat;
			Business_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "seviye", true))
		{
			static level;
			if (sscanf(string_two, "d", level)) return SendUsageMessage(playerid, "/aisyeri duzenle [iþyeri ID] seviye [level]");
			if (level < 1) return SendErrorMessage(playerid, "Bu iþyerinin seviyesi en az 1 olabilir.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu iþyerinin seviyesini %i olarak güncelledin.", level);
			BusinessData[id][BusinessLevel] = level;
			Business_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "tip", true))
		{
			static tip;
			if (sscanf(string_two, "i", tip))
			{
				SendUsageMessage(playerid, "/aisyeri duzenle [iþyeri ID] tip [iþyeri tipi]");
				SendClientMessage(playerid, COLOR_WHITE, "1: [Maðaza] 2: [Genel Maðaza] 3: [Pawnshop] 4: [Restaurant] 5: [Silahçý]");
				SendClientMessage(playerid, COLOR_WHITE, "6: [Kýyafetçi] 7: [Banka] 8: [Gece Kulübü] 9: [Galeri] 10: [Özel]");
				return 1;
			}

			if(tip < 1 || tip > 11) return SendErrorMessage(playerid, "Hatalý iþyeri tipi girdin.");

			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu iþyerinin seviyesini %i olarak güncelledin.", tip);
			BusinessData[id][BusinessType] = tip;
			Business_Refresh(id);
			Business_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "pickup", true))
		{
			if (BusinessData[id][BusinessType] != BUSINESS_BANK) return SendErrorMessage(playerid, "Bu iþyerinin tipi banka deðil.");
		    GetPlayerPos(playerid, BusinessData[id][BankPos][0], BusinessData[id][BankPos][1], BusinessData[id][BankPos][2]);
			BusinessData[id][BankInterior] = GetPlayerInterior(playerid);
			BusinessData[id][BankWorld] = GetPlayerVirtualWorld(playerid);
            SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Bu iþyerinin banka maaþ pozisyonunu güncelledin.");
			Business_Refresh(id);
			Business_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "kargomiktar", true))
		{
			static level;
			if (sscanf(string_two, "i", level)) return SendUsageMessage(playerid, "/aisyeri duzenle [iþyeri ID] kargomiktar [miktar]");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu iþyerinin kargo miktarýný %i olarak güncelledin.", level);
			BusinessData[id][BusinessProduct] = level;
			Business_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "istenenkargo", true))
		{
			static level;
			if (sscanf(string_two, "i", level)) return SendUsageMessage(playerid, "/aisyeri duzenle [iþyeri ID] istenenkargo [miktar]");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu iþyerinin istenen kargo miktarýýn %i olarak güncelledin.", level);
			BusinessData[id][BusinessWantedProduct] = level;
			Business_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "kargofiyat", true))
		{
			static level;
			if (sscanf(string_two, "i", level)) return SendUsageMessage(playerid, "/aisyeri duzenle [iþyeri ID] kargofiyat [miktar]");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu iþyerinin kargo alýþ fiyatýný %s olarak güncelledin.", MoneyFormat(level));
			BusinessData[id][BusinessProductPrice] = level;
			Business_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "girisfiyat", true))
		{
			static fiyat;
			if (sscanf(string_two, "i", fiyat)) return SendUsageMessage(playerid, "/aisyeri duzenle [iþyeri ID] girisfiyat [miktar]");
			if (fiyat < 1) return SendErrorMessage(playerid, "Bu iþyerinin giriþ fiyatý en az $1 olabilir.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu iþyerinin giriþ fiyatýný $%s olarak güncelledin.", MoneyFormat(fiyat));
			BusinessData[id][BusinessFee] = fiyat;
			Business_Save(id);
			return 1;
		}
	}
	else if (!strcmp(type, "git", true))
	{
		static id;
		if (sscanf(string, "i", id)) return SendUsageMessage(playerid, "/aisyeri git [iþyeri ID]");
		if (!Iter_Contains(Businesses, id)) return SendErrorMessage(playerid, "Hatalý iþyeri ID girdin.");
		SendPlayer(playerid, BusinessData[id][EnterPos][0], BusinessData[id][EnterPos][1], BusinessData[id][EnterPos][2], BusinessData[id][EnterPos][3], BusinessData[id][EnterInterior], BusinessData[id][EnterWorld]);
		if (!BusinessData[id][BusinessOwnerSQLID]) SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý iþyerine ýþýnlandýn. (sahip: satýlýk durumda)", id);
		else SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý iþyerine ýþýnlandýn. (sahip: %s)", id, ReturnSQLName(BusinessData[id][BusinessOwnerSQLID]));
		return 1;
 	}
 	else if (!strcmp(type, "sat", true))
	{
		static id;
		if (sscanf(string, "i", id)) return SendUsageMessage(playerid, "/aisyeri sat [iþyeri ID]");
		if (!Iter_Contains(Businesses, id)) return SendErrorMessage(playerid, "Hatalý iþyeri ID girdin.");
		if (!BusinessData[id][BusinessOwnerSQLID]) return SendErrorMessage(playerid, "Sahibi olmayan iþyerini satamazsýn.");
		if (GetPVarInt(playerid, "AtBusiness") != id) return SendErrorMessage(playerid, "Satmak istediðin iþyerine yakýn olmalýsýn.");
		foreach(new i : Player) if(strfind(ReturnName(i, 1), ReturnSQLName(BusinessData[id][BusinessOwnerSQLID]), true) != -1) SendClientMessageEx(i, COLOR_YELLOW, "SERVER: %i numaralý iþyerine %s isimli yönetici tarafýndan el konuldu.", id, ReturnName(playerid, 1));
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý iþyerine el koydun.", id);
		BusinessData[id][BusinessOwnerSQLID] = 0;
		Business_Save(id);
		return 1;
 	}
 	else if (!strcmp(type, "sil", true))
	{
		static id;
		if (sscanf(string, "i", id)) return SendUsageMessage(playerid, "/aisyeri sil [iþyeri ID]");
		if (!Iter_Contains(Businesses, id)) return SendErrorMessage(playerid, "Hatalý iþyeri ID girdin.");
		if (GetPVarInt(playerid, "AtBusiness") != id) return SendErrorMessage(playerid, "Silmek istediðin iþyerine yakýn olmalýsýn.");
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý iþyerini sildin.", id);
		Business_Delete(id);
		return 1;
 	}
	return 1;
}

CMD:p2biz(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);

	static id, bizid;
	if(sscanf(params, "ud", id, bizid)) return SendUsageMessage(playerid, "/p2biz [oyuncu ID/adý] [iþyeri ID]");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirttiðiniz kiþi oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirttiðiniz kiþi henüz þifresini girmemiþ.");
	if(!Iter_Contains(Businesses, bizid)) return SendErrorMessage(playerid, "Hatalý iþyeri ID girdin.");

	SendPlayer(id, BusinessData[bizid][EnterPos][0], BusinessData[bizid][EnterPos][1], BusinessData[bizid][EnterPos][2], BusinessData[bizid][EnterPos][3], BusinessData[bizid][EnterInterior], BusinessData[bizid][EnterWorld]);
	SendClientMessageEx(id, COLOR_GREY, "AdmCmd: %s isimli yönetici seni %i numaralý iþyerine gönderdi.", ReturnName(playerid, 1), bizid);
	//LogAdminAction(playerid, sprintf("%s isimli kiþinin #%d numaralý iþyerine gönderdi.", ReturnName(playerb, 1), bizid));
	return 1;
}

CMD:agise(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);

	static type[24], string[128];
	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/agise [parametre]");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ekle, duzenle, sil, git");
		return 1;
	}

	if (!strcmp(type, "ekle", true))
	{
		static id, toll_name[25];
		if(sscanf(string, "is[25]", id, toll_name)) return SendUsageMessage(playerid, "/agise ekle [obje ID] [giþe adý]");
		if(strlen(toll_name) < 5 || strlen(toll_name) > 25) return SendErrorMessage(playerid, "Giþe adý en az 5 karakter en fazla 25 karakter olabilir.");
		Toll_Create(playerid, id, toll_name);
		return 1;
	}
	else if (!strcmp(type, "git", true))
	{
		static id;
		if (sscanf(string, "d", id)) return SendUsageMessage(playerid, "/agise git [giþe ID]");
		if (!Iter_Contains(Tolls, id)) return SendErrorMessage(playerid, "Hatalý giþe ID girdin.");
		SendPlayer(playerid, TollData[id][TollPos][0], TollData[id][TollPos][1], TollData[id][TollPos][2], TollData[id][TollPos][5], TollData[id][TollInterior], TollData[id][TollWorld]);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý giþeye ýþýnlandýn.", id);
		return 1;
 	}
	else if (!strcmp(type, "duzenle", true))
	{
		static id, type_two[24], string_two[128];
		if (sscanf(string, "ds[24]S()[128]", id, type_two, string_two))
		{
			SendUsageMessage(playerid, "/agise duzenle [giþe ID] [parametre]");
		    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}[pozisyon][apozisyon][model][fiyat][isim]");
			return 1;
		}

		if(!Iter_Contains(Tolls, id)) return SendErrorMessage(playerid, "Hatalý giþe ID girdin.");

		if (!strcmp(type_two, "pozisyon", true))
		{
			if(TollData[id][TollStatus]) return SendErrorMessage(playerid, "Düzenlemek istediðin giþenin kapanmasýný bekle.");
			if(EditingObject[playerid]) return SendErrorMessage(playerid, "Þu anda baþka bir obje düzenliyorsun.");

			EditingID[playerid] = id;
			EditingObject[playerid] = 17;
			EditDynamicObject(playerid, TollData[id][TollObject]);
			return 1;
		}
		else if (!strcmp(type_two, "apozisyon", true))
		{
			if(TollData[id][TollStatus]) return SendErrorMessage(playerid, "Düzenlemek istediðin giþenin kapanmasýný bekle.");
			if(EditingObject[playerid]) return SendErrorMessage(playerid, "Þu anda baþka bir obje düzenliyorsun.");

			EditingID[playerid] = id;
			EditingObject[playerid] = 18;
			EditDynamicObject(playerid, TollData[id][TollObject]);
			return 1;
		}
		else if (!strcmp(type_two, "model", true))
		{
			new model;
			if (sscanf(string_two, "i", model)) return SendUsageMessage(playerid, "/agise duzenle [giþe ID] model [obje ID]");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu giþenin modelini %i olarak güncelledin.", model);
			TollData[id][TollModel] = model;
			Toll_Refresh(id);
			Toll_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "fiyat", true))
		{
			new price;
			if(sscanf(string_two, "i", price)) return SendUsageMessage(playerid, "/agise duzenle [giþe ID] fiyat [miktar]");
			if(price < 1 || price > 1000) return SendErrorMessage(playerid, "Giþenin fiyatý en az $1 en fazla $1,000 olabilir.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu giþenin fiyatýný $%i olarak güncelledin.", price);
			TollData[id][TollPrice] = price;
			Toll_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "isim", true))
		{
			new toll_name[25];
			if(sscanf(string_two, "s[25]", toll_name)) return SendUsageMessage(playerid, "/agise duzenle [giþe ID] isim [yeni isim]");
			if(strlen(toll_name) < 5 || strlen(toll_name) > 25) return SendErrorMessage(playerid, "Giþe adý en az 5 karakter en fazla 25 karakter olabilir.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu giþenin adýný %s olarak güncelledin.", toll_name);
			format(TollData[id][TollName], 25, "%s", toll_name);
			Toll_Save(id);
			return 1;
		}
	}
	else if (!strcmp(type, "sil", true))
	{
		static id;
		if(sscanf(string, "i", id)) return SendUsageMessage(playerid, "/agise sil [giþe ID]");
		if(!Iter_Contains(Tolls, id)) return SendErrorMessage(playerid, "Hatalý giþe ID girdin.");
		if(GetPVarInt(playerid, "AtToll") != id) return SendErrorMessage(playerid, "Silmek istediðin giþeye yakýn olmalýsýn.");
		if(TollData[id][TollStatus]) return SendErrorMessage(playerid, "Silmek istediðin giþenin kapanmasýný bekle.");
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý giþeyi sildin.", id);
		Toll_Delete(id);
		return 1;
 	}
 	return 1;
}

CMD:akargo(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);

	static type[24], string[128];
	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/akargo [parametre]");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}duzenle, duzenle, git");
		return 1;
	}

	if (!strcmp(type, "git", true))
	{
		static id;
		if(sscanf(string, "i", id)) return SendUsageMessage(playerid, "/abirlik git [kargo noktasý ID]");
		if(!Iter_Contains(Trucker, id)) return SendErrorMessage(playerid, "Hatalý kargo noktasý ID girdin");
		SendPlayer(playerid, TruckerData[id][tPosX], TruckerData[id][tPosY], TruckerData[id][tPosZ], 90.0, 0, 0);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %s (ID: %i) kargo noktasýna noktasýna ýþýnlandýn.", TruckerData[id][tName], id);
		return 1;
 	}

	else if (!strcmp(type, "duzenle", true))
	{
		static id, type_two[24], string_two[128];
		if (sscanf(string, "ds[24]S()[128]", id, type_two, string_two))
		{
			SendUsageMessage(playerid, "/akargo duzenle [kargo noktasý ID] [parametre]");
		    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}[kapasite][kkapasite][fiyat][u/t][kilit][tip]");
		    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}[urun][pozisyon]");
			return 1;
		}

		if(!Iter_Contains(Trucker, id)) return SendErrorMessage(playerid, "Hatalý kargo noktasý ID girdin");

		if (!strcmp(type_two, "pozisyon", true))
		{
			GetPlayerPos(playerid, TruckerData[id][tPosX], TruckerData[id][tPosY], TruckerData[id][tPosZ]);
			Industry_Refresh(id);
			Industry_Save(id);
			return 1;
		}
		else if(!strcmp(type_two, "kapasite", true))
		{
			new pd;
			if(sscanf(string_two, "i", pd)) return SendUsageMessage(playerid, "/akargo duzenle [kargo noktasý ID] kapasite [miktar]");
        	if(pd < 0 || pd > TruckerData[id][tStorageSize])
	    		return SendErrorMessage(playerid, "Kapasite 0 - %i aralýðýnda olmalýdýr.", TruckerData[id][tStorageSize]);

			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %s(ID: %i) kargo noktasýnýn kapasitesini %i olarak ayarladýn.", TruckerData[id][tName], id, pd);
			TruckerData[id][tStorage] = pd;
			Industry_Update(id);
			Industry_Save(id);
			return 1;
		}
		else if(!strcmp(type_two, "kkapasite", true))
		{
			new pd;
			if(sscanf(string_two, "i", pd)) return SendUsageMessage(playerid, "/akargo duzenle [kargo noktasý ID] kkapasite [miktar]");
        	if(pd < 0 || pd > 10000) return SendErrorMessage(playerid, "Kapasite 0 - 10000 aralýðýnda olmalýdýr.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %s(ID: %i) kargo noktasýnýn kalýcý kapasitesini %i olarak ayarladýn.", TruckerData[id][tName], id, pd);
			TruckerData[id][tStorageSize] = pd;
			Industry_Refresh(id);
			Industry_Save(id);
			return 1;
		}
		else if(!strcmp(type_two, "fiyat", true))
		{
			new pd;
			if(sscanf(string_two, "i", pd)) return SendUsageMessage(playerid, "/akargo duzenle [kargo noktasý ID] fiyat [miktar]");
        	if(pd < 0 || pd > 10000) return SendErrorMessage(playerid, "Kapasite 0 - 10000 aralýðýnda olmalýdýr.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %s(ID: %i) kargo noktasýnýn fiyatýný %i olarak ayarladýn.", TruckerData[id][tName], id, pd);
			TruckerData[id][tPrice] = pd;
			Industry_Update(id);
			Industry_Save(id);
			return 1;
		}
		else if(!strcmp(type_two, "u/t", true))
		{
			new pd;
			if(sscanf(string_two, "i", pd)) return SendUsageMessage(playerid, "/akargo duzenle [kargo noktasý ID] u/t [miktar]");
        	if(pd < -100 || pd > 100) return SendErrorMessage(playerid, "Üretim/tüketim -100 - 100 aralýðýnda olmalýdýr.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %s(ID: %i) kargo noktasýnýn üretim/tüketimini %i olarak ayarladýn.", TruckerData[id][tName], id, pd);
			TruckerData[id][tProductAmount] = pd;
			Industry_Refresh(id);
			Industry_Save(id);
			return 1;
		}
		else if(!strcmp(type_two, "kilit", true))
		{
			new pd;
			if(sscanf(string_two, "i", pd)) return SendUsageMessage(playerid, "/akargo duzenle [kargo noktasý ID] kilit [0-1]");
			if(pd < 0 || pd > 1) return SendErrorMessage(playerid, "Girilebilecek deðer en az 0 en fazla 1 olabilir.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %s(ID: %i) kargo noktasýnýn kiliti durumunu %s olarak ayarladýn.", TruckerData[id][tName], id, (pd == 1) ? ("kilitli"): ("kilitli deðil"));
			TruckerData[id][tLocked] = pd;
			Industry_Save(id);
			return 1;
		}
		else if(!strcmp(type_two, "tip", true))
		{
			new pd;
			if(sscanf(string_two, "i", pd))
			{
				SendUsageMessage(playerid, "/akargo duzenle [kargo noktasý ID] tip [0-3]");
				SendInfoMessage(playerid, "0 - Özel | 1 - Satýlan | 2 - Gemi | 3 - Alýnan");
				return 1;
			}

        	if(pd < 0 || pd > 3) return SendErrorMessage(playerid, "Tip 0 - 3 aralýðýnda olmalýdýr.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %s(ID: %i) kargo noktasýnýn tipini %i olarak ayarladýn.", TruckerData[id][tName], id, pd);
			TruckerData[id][tType] = pd;
			Industry_Save(id);
			return 1;
		}
		else if(!strcmp(type_two, "urun", true))
		{
			new pd;
			if(sscanf(string_two, "i", pd))
			{
				SendUsageMessage(playerid, "/akargo duzenle [kargo noktasý ID] urun [tip numarasý]");
				for(new j; j != MAX_TRUCK_PRODUCT; j++) {
					SendClientMessageEx(playerid, COLOR_WHITE, "%i - %s;", j, TruckerData_product[j]);
				}
				return 1;
			}

			if(pd < 0 || pd > MAX_TRUCK_PRODUCT-1)
	    		return SendErrorMessage(playerid, "Ürün tipi 0 - %i aralýðýnda olmalýdýr.", MAX_TRUCK_PRODUCT-1);

			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %s(ID: %i) kargo noktasýnýn ürün tipini %s(ID: %i) olarak ayarladýn.", TruckerData[id][tName], id, TruckerData_product[pd], pd);
			TruckerData[id][tProductID] = pd;
			Industry_Refresh(id);
			Industry_Save(id);
			return 1;
		}
		else if(!strcmp(type_two, "gps", true))
		{
			new pd;
			if(sscanf(string_two, "i", pd)) return SendUsageMessage(playerid, "/akargo duzenle [kargo noktasý ID] gps [0-1]");
			if(pd < 0 || pd > 1) return SendErrorMessage(playerid, "Girilebilecek deðer en az 0 en fazla 1 olabilir.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %s(ID: %i) kargo noktasýnýn GPS durumunu %s olarak ayarladýn.", TruckerData[id][tName], id, (pd == 1) ? ("görünür"): ("gizli"));
			TruckerData[id][tGps] = pd;
			Industry_Save(id);
			return 1;
		}
	}

 	return 1;
}


CMD:abirlik(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);

	static type[24], string[128];
	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/abirlik [parametre]");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ekle, duzenle, git");
		return 1;
	}

	if (!strcmp(type, "ekle", true))
	{
	    new f_name[128], f_abbrev[128];
	    if(sscanf(string, "p<->s[128]s[128]", f_name, f_abbrev))
	    {
	    	SendUsageMessage(playerid, "/abirlik ekle [birlik adý]-[birlik kýsaltmasý]");
			return 1;
	    }

	    if(isnull(f_name) || strlen(f_name) > 128) return SendErrorMessage(playerid, "Birlik adý maksimum 128 karakter olabilir.");
	    if(isnull(f_abbrev) || strlen(f_abbrev) > 128) return SendErrorMessage(playerid, "Birlik kýsaltmasý maksimum 128 karakter olabilir.");
		Faction_Create(playerid, f_name, f_abbrev);
		return 1;
	}
	else if (!strcmp(type, "git", true))
	{
		static id;
		if(sscanf(string, "i", id)) return SendUsageMessage(playerid, "/abirlik git [birlik ID]");
		if(!Iter_Contains(Factions, id)) return SendErrorMessage(playerid, "Hatalý birlik ID girdin.");
		SendPlayer(playerid, FactionData[id][FactionSpawn][0], FactionData[id][FactionSpawn][1], FactionData[id][FactionSpawn][2], FactionData[id][FactionSpawn][3], FactionData[id][FactionSpawnInterior], FactionData[id][FactionSpawnVW]);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý birlik noktasýna ýþýnlandýn.", id);
		return 1;
 	}
	else if (!strcmp(type, "duzenle", true))
	{
		static id, type_two[24], string_two[128];
		if (sscanf(string, "ds[24]S()[128]", id, type_two, string_two))
		{
			SendUsageMessage(playerid, "/abirlik duzenle [birlik ID] [parametre]");
		    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}[isim][kisaltma][pd][fd][san]");
			return 1;
		}

		if(!Iter_Contains(Factions, id)) return SendErrorMessage(playerid, "Hatalý birlik ID girdin.");

		if(!strcmp(type_two, "isim", true))
		{
			new faction_name[128];
			if(sscanf(string_two, "s[128]", faction_name)) return SendUsageMessage(playerid, "/abirlik duzenle [birlik ID] isim [yeni isim]");
			if(isnull(faction_name) || strlen(faction_name) > 128) return SendErrorMessage(playerid, "Birlik adý maksimum 128 karakter olabilir.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý birliðin adýný %s olarak güncelledin.", id, faction_name);
			format(FactionData[id][FactionName], 128, "%s", faction_name);
			Faction_Save(id);
			return 1;
		}
		else if(!strcmp(type_two, "kisaltma", true))
		{
			new abbrev[128];
			if(sscanf(string_two, "s[128]", abbrev)) return SendUsageMessage(playerid, "/abirlik duzenle [birlik ID] kisaltma [yeni kýsaltma]");
			if(isnull(abbrev) || strlen(abbrev) > 128) return SendErrorMessage(playerid, "Birlik adý maksimum 128 karakter olabilir.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý birliðin kýsaltmasýný %s olarak güncelledin.", id, abbrev);
			format(FactionData[id][FactionAbbrev], 128, "%s", abbrev);
			Faction_Save(id);
			return 1;
		}
		else if(!strcmp(type_two, "pd", true))
		{
			new pd;
			if(sscanf(string_two, "i", pd)) return SendUsageMessage(playerid, "/abirlik duzenle [birlik ID] pd [0-1]");
			if(pd < 0 || pd > 1) return SendErrorMessage(playerid, "Girilebilecek deðer en az 0 en fazla 1 olabilir.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý birliði polis birliði komutlarýný kullanma %s", id, (pd == 1) ? ("yetkisi verdin."): ("yetkisini aldýn."));
			FactionData[id][FactionCopPerms] = pd;
			Faction_Save(id);
			return 1;
		}
		else if(!strcmp(type_two, "fd", true))
		{
			new pd;
			if(sscanf(string_two, "i", pd)) return SendUsageMessage(playerid, "/abirlik duzenle [birlik ID] fd [0-1]");
			if(pd < 0 || pd > 1) return SendErrorMessage(playerid, "Girilebilecek deðer en az 0 en fazla 1 olabilir.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý birliði medikal birliði komutlarýný kullanma %s", id, (pd == 1) ? ("yetkisi verdin."): ("yetkisini aldýn."));
			FactionData[id][FactionMedPerms] = pd;
			Faction_Save(id);
			return 1;
		}
		else if(!strcmp(type_two, "san", true))
		{
			new pd;
			if(sscanf(string_two, "i", pd)) return SendUsageMessage(playerid, "/abirlik duzenle [birlik ID] san [0-1]");
			if(pd < 0 || pd > 1) return SendErrorMessage(playerid, "Girilebilecek deðer en az 0 en fazla 1 olabilir.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý birliði yayýn birliði komutlarýný kullanma %s", id, (pd == 1) ? ("yetkisi verdin."): ("yetkisini aldýn."));
			FactionData[id][FactionSanPerms] = pd;
			Faction_Save(id);
			return 1;
		}
	}
 	return 1;
}

CMD:aev(playerid, params[])
{
	if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);

	static type[24], string[128];
	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/aev [parametre]");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ekle, duzenle, sat, git, incele");
		return 1;
	}

	if (!strcmp(type, "incele", true))
	{
		static type_two[24], string_two[128];
		if (sscanf(string, "s[24]S()[128]", type_two, string_two))
		{
			SendUsageMessage(playerid, "/aev incele [tip] [interior ID]");
		    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}[bos][dolu]");
			return 1;
		}

		if (!strcmp(type_two, "bos", true))
		{
			new int;
			if(sscanf(string_two, "i", int)) return SendUsageMessage(playerid, "/aev incele bos [0-%i]", sizeof(g_PropertyInteriors) - 1);
			if(int < 0 || int > sizeof(g_PropertyInteriors) - 1) return SendErrorMessage(playerid, "Hatalý interior ID girdiniz. (0 - %i)", sizeof(g_PropertyInteriors) - 1);
			SendPlayer(playerid, g_PropertyInteriorsWOF[int][InteriorX], g_PropertyInteriorsWOF[int][InteriorY], g_PropertyInteriorsWOF[int][InteriorZ], g_PropertyInteriorsWOF[int][InteriorA], g_PropertyInteriorsWOF[int][InteriorID], 0);
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý boþ ev dekoruna ýþýnlandýn.", int);
			return 1;
		}
		else if (!strcmp(type_two, "dolu", true))
		{
			new int;
			if(sscanf(string_two, "i", int)) return SendUsageMessage(playerid, "/aev incele dolu [0-%i]", sizeof(g_PropertyInteriors) - 1);
			if(int < 0 || int > sizeof(g_PropertyInteriors) - 1) return SendErrorMessage(playerid, "Hatalý interior ID girdiniz. (0 - %i)", sizeof(g_PropertyInteriors) - 1);
			SendPlayer(playerid, g_PropertyInteriors[int][InteriorX], g_PropertyInteriors[int][InteriorY], g_PropertyInteriors[int][InteriorZ], g_PropertyInteriors[int][InteriorA], g_PropertyInteriors[int][InteriorID], 0);
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý dolu ev dekoruna ýþýnlandýn.", int);
			return 1;
		}
	}
	else if (!strcmp(type, "ekle", true))
	{
	    new prop_type;
	    if(sscanf(string, "i", prop_type))
	    {
	    	SendUsageMessage(playerid, "/aev ekle [tip]");
	    	SendClientMessage(playerid, COLOR_ADM, "--> 1:[Apartman] 2:[Apartman Dairesi] 3:[Ev]");
			return 1;
	    }

	    if(prop_type < 1  || prop_type > 3) return SendErrorMessage(playerid, "Hatalý ev tipi girdiniz.");

		if(prop_type == 2)
		{
			//SendClientMessage(playerid, COLOR_ADM, " !! UYARI !! Apartman dairesi eklerken, /aev bilgi [apartman ID] to get the exterior WORLD.");
			//SendClientMessage(playerid, COLOR_ADM, " !! UYARI !! Set the apartments world to that exterior world using /editproperty OR IT WILL BUG.");
		}

		Property_Create(playerid, prop_type);
		return 1;
	}
	else if (!strcmp(type, "sat", true))
	{
		static id;
		if(sscanf(string, "i", id)) return SendUsageMessage(playerid, "/aev sat [ev ID]");
		if(!Iter_Contains(Properties, id)) return SendErrorMessage(playerid, "Hatalý ev ID girdin.");
		if(!PropertyData[id][PropertyOwnerID]) return SendErrorMessage(playerid, "Sahibi olmayan evi satamazsýn.");
		if(IsPlayerNearProperty(playerid) != id) return SendErrorMessage(playerid, "Satmak istediðin evin giriþ kapýsýnda olmalýsýn.");

		foreach(new i : Player)
		{
			if(strfind(ReturnName(i, 1), ReturnSQLName(PropertyData[id][PropertyOwnerID]), true) != -1)
			{
				SendClientMessageEx(i, COLOR_ADM, "[!] %i numaralý evin bir %s isimli yönetici tarafýndan el konuldu.", id, ReturnName(playerid));
			}
		}

		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i (sahibi: %s) numaralý eve el koydun.", id, ReturnSQLName(PropertyData[id][PropertyOwnerID]));
		adminWarn(4, sprintf("%s isimli yönetici %i (sahibi: %s) numaralý eve el koydu.", id, ReturnSQLName(PropertyData[id][PropertyOwnerID])));
		PropertyData[id][PropertyOwnerID] = 0;
		Property_Refresh(id);
		Property_Save(id);
		return 1;
	}
	else if (!strcmp(type, "duzenle", true))
	{
		static id, type_two[24], string_two[128];
		if (sscanf(string, "ds[24]S()[128]", id, type_two, string_two))
		{
			SendUsageMessage(playerid, "/aev duzenle [ev ID] [parametre]");
		    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}[exterior][interior][extinterior][extworld][intworld][bareswitch]");
		    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}[complexlink][seviye][fiyat][seviye][kirafiyat][kilit][birlik]");
			return 1;
		}

		if(!Iter_Contains(Properties, id)) return SendErrorMessage(playerid, "Hatalý ev ID girdin.");

		if (!strcmp(type_two, "intworld", true))
		{
			new fid;
			if(sscanf(string_two, "i", fid)) return SendUsageMessage(playerid, "/aev duzenle [ev ID] birlik [birlik ID]");
			if(!Iter_Contains(Factions, id)) return SendErrorMessage(playerid, "Hatalý birlik ID girdin.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu evin birlik deðerini %s(ID:%i) olarak güncelledin.", FactionData[fid][FactionName], fid);
			PropertyData[id][PropertyFaction] = fid;
			Property_Refresh(id);
			Property_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "exterior", true))
		{
		    GetPlayerPos(playerid, PropertyData[id][PropertyEnter][0], PropertyData[id][PropertyEnter][1], PropertyData[id][PropertyEnter][2]);
		    GetPlayerFacingAngle(playerid, PropertyData[id][PropertyEnter][3]);
			PropertyData[id][PropertyEnterInterior] = GetPlayerInterior(playerid);
			PropertyData[id][PropertyEnterWorld] = GetPlayerVirtualWorld(playerid);

            SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Bu evin dýþ pozisyonunu güncelledin.");
			Property_Refresh(id);
			Property_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "complexlink", true))
		{
			if(PropertyData[id][PropertyType] != 2) return SendErrorMessage(playerid, "Bu komutu sadece apartman daireleri için kullanabilirsin.");

			new apt;
			if(sscanf(string_two, "i", apt)) return SendUsageMessage(playerid, "/aev duzenle [ev ID] complexlink [apartman ID]");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu dairenin baðlý olduðu apartmaný %i olarak güncelledin.", apt);
			PropertyData[id][PropertyComplexLink] = apt;
			Property_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "extworld", true))
		{
			if(PropertyData[id][PropertyType] != 2) return SendErrorMessage(playerid, "Bu komutu sadece apartman daireleri için kullanabilirsin.");

			new extworld;
			if(sscanf(string_two, "i", extworld)) return SendUsageMessage(playerid, "/aev duzenle [ev ID] extworld [world ID]");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu evin dýþ pozisyon world deðerini %i olarak güncelledin.", extworld);
			PropertyData[id][PropertyEnterWorld] = extworld;
			Property_Refresh(id);
			Property_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "extinterior", true))
		{
			if(PropertyData[id][PropertyType] != 2) return SendErrorMessage(playerid, "Bu komutu sadece apartman daireleri için kullanabilirsin.");

			new extint;
			if(sscanf(string_two, "i", extint)) return SendUsageMessage(playerid, "/aev duzenle [ev ID] extinterior [interior ID]");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu evin dýþ pozisyon interior deðerini %i olarak güncelledin.", extint);
			PropertyData[id][PropertyEnterInterior] = extint;
			Property_Refresh(id);
			Property_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "interior", true))
		{
		    GetPlayerPos(playerid, PropertyData[id][PropertyExit][0], PropertyData[id][PropertyExit][1], PropertyData[id][PropertyExit][2]);
		    GetPlayerFacingAngle(playerid, PropertyData[id][PropertyExit][3]);
			PropertyData[id][PropertyExitInterior] = GetPlayerInterior(playerid);

			SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Bu evin iç pozisyonunu güncelledin.");
			Property_Refresh(id);
			Property_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "intworld", true))
		{
			new intworld;
			if(sscanf(string_two, "i", intworld)) return SendUsageMessage(playerid, "/aev duzenle [ev ID] intworld [world ID]");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu evin iç pozisyon world deðerini %i olarak güncelledin.", intworld);
			PropertyData[id][PropertyExitWorld] = intworld;
			Property_Refresh(id);
			Property_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "saat", true))
		{
			new intworld;
			if(sscanf(string_two, "i", intworld)) return SendUsageMessage(playerid, "/aev duzenle [ev ID] saat [0-23]");
			if(intworld < 0 || intworld > 23) return SendErrorMessage(playerid, "Saat deðeri 0 - 23 aralýðýnda olmalýdýr.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu evin iç interior saatini %i olarak güncelledin.", intworld);
			PropertyData[id][PropertyTime] = intworld;

			foreach(new i : Player) if(IsPlayerInProperty(i) == id)
			{
				SetPlayerTime(i, PropertyData[id][PropertyTime], 0);
			}

			Property_Refresh(id);
			Property_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "bareswitch", true))
		{
			if(PropertyData[id][PropertyType] != 3) return SendErrorMessage(playerid, "Bu komutu sadece evler için kullanabilirsin.");

			new extint;
			if(sscanf(string_two, "i", extint)) return SendUsageMessage(playerid, "/aev duzenle [ev ID] bareswitch [interior ID]");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu evin bareswitch interior deðerini %i olarak güncelledin.", extint);

			PropertyData[id][PropertySwitchID] = extint;
			if(PropertyData[id][PropertySwitchID] != -1) PropertyData[id][PropertySwitch] = true;
			else PropertyData[id][PropertySwitch] = false;

			//Property_Refresh(id);
			Property_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "seviye", true))
		{
			new level;
			if(sscanf(string_two, "i", level)) return SendUsageMessage(playerid, "/aev duzenle [ev ID] seviye [miktar]");
			if(level < 1 || level > 150) return SendErrorMessage(playerid, "Seviye miktarý en az 1 en fazla 150 olabilir.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu evin seviyesini %i olarak güncelledin.", level);
			PropertyData[id][PropertyLevel] = level;
			Property_Refresh(id);
			Property_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "fiyat", true))
		{
			new fiyat;
			if(sscanf(string_two, "i", fiyat)) return SendUsageMessage(playerid, "/aev duzenle [ev ID] fiyat [miktar]");
			if(fiyat < 1 || fiyat > 5000000) return SendErrorMessage(playerid, "Fiyat en az $1 en fazla $5,000,000 olabilir.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu evin fiyatýný $%s olarak güncelledin.", MoneyFormat(fiyat));
			PropertyData[id][PropertyMarketPrice] = fiyat;
			Property_Refresh(id);
			Property_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "birlik", true))
		{
			new birlik;
			if(sscanf(string_two, "i", birlik)) return SendUsageMessage(playerid, "/aev duzenle [ev ID] birlik [birlik ID](-1 sahipsiz)");
			if(!Iter_Contains(Factions, birlik)) return SendErrorMessage(playerid, "Hatalý birlik ID girdin.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu evin birliðini %s olarak güncelledin.", FactionData[birlik][FactionName]);
			PropertyData[id][PropertyFaction] = birlik;
			Property_Refresh(id);
			Property_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "kirafiyat", true))
		{
			new fiyat;
			if(sscanf(string_two, "i", fiyat)) return SendUsageMessage(playerid, "/aev duzenle [ev ID] kirafiyat [miktar]");
			if(fiyat < 1 || fiyat > 500) return SendErrorMessage(playerid, "Kira fiyatý en az $1 en fazla $500 olabilir.");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu evin kira fiyatýný $%s olarak güncelledin.", MoneyFormat(fiyat));
			PropertyData[id][PropertyRentPrice] = fiyat;
			Property_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "kilit", true))
		{
			new locked;
			if(sscanf(string_two, "i", locked)) return SendUsageMessage(playerid, "/aev duzenle [ev ID] kilit [0/1]");
			if(locked < 0 || locked > 1) return SendErrorMessage(playerid, "Hatalý kilit durumu girdin. (0/1)");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu evin kapýlarýný %s olarak güncelledin.", !locked ? ("kilitli deðil") : ("kilitli"));
			PropertyData[id][PropertyLocked] = bool:locked;
			Property_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "isik", true))
		{
			new locked;
			if(sscanf(string_two, "i", locked)) return SendUsageMessage(playerid, "/aev duzenle [ev ID] isik [0/1]");
			if(locked < 0 || locked > 1) return SendErrorMessage(playerid, "Hatalý ýþýk durumu girdin. (0/1)");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu evin ýþýklarýný %s olarak güncelledin.", !locked ? ("açýk deðil") : ("açýk"));
			PropertyData[id][PropertyLights] = bool:locked;
			Property_Save(id);
			return 1;
		}
		else if (!strcmp(type_two, "kiradurum", true))
		{
			new locked;
			if(sscanf(string_two, "i", locked)) return SendUsageMessage(playerid, "/aev duzenle [ev ID] kiradurum [0/1]");
			if(locked < 0 || locked > 1) return SendErrorMessage(playerid, "Hatalý kira durumu girdin. (0/1)");
			SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu evin kira durumunu %s olarak güncelledin.", !locked ? ("kiralýk deðil") : ("kiralýk"));
			PropertyData[id][PropertyRentable] = bool:locked;
			Property_Save(id);
			return 1;
		}
	}
	else if (!strcmp(type, "bilgi", true))
	{
		static id;
		if(sscanf(string, "i", id)) return SendUsageMessage(playerid, "/aev bilgi [ev ID]");
		if(!Iter_Contains(Properties, id)) return SendErrorMessage(playerid, "Hatalý ev ID girdin.");

		new garage_id;
		foreach(new i : Garages) if(GarageData[i][GaragePropertyID] == id) garage_id = i;
		SendClientMessage(playerid, COLOR_DARKGREEN, "____________________________________________");
		SendClientMessageEx(playerid, COLOR_WHITE, "Sahip:[%s] Level:[%d] MarketPrice:[%d] Tip:[%d] Kilit Durumu:[%d] ID:[%d]", PropertyData[id][PropertyOwnerID] ? ReturnSQLName(PropertyData[id][PropertyOwnerID]) : "Yok", PropertyData[id][PropertyLevel], PropertyData[id][PropertyMarketPrice], PropertyData[id][PropertyType], PropertyData[id][PropertyLocked], PropertyData[id][PropertyID]);
		SendClientMessageEx(playerid, COLOR_WHITE, "Interior:[%d] InteriorWorld:[%d] (Apartment)Exterior:[%d] ExteriorWorld:[%d] ComplexLink:[%d]", PropertyData[id][PropertyEnterInterior], PropertyData[id][PropertyEnterWorld], PropertyData[id][PropertyExitInterior], PropertyData[id][PropertyExitWorld], PropertyData[id][PropertyComplexLink]);
		SendClientMessageEx(playerid, COLOR_WHITE, "Cashbox:[%d], Faction:[%d], Linked Garage:[%d]", PropertyData[id][PropertyMoney], PropertyData[id][PropertyFaction], garage_id);
		SendClientMessage(playerid, COLOR_DARKGREEN, "____________________________________________");
		return 1;
 	}

	else if (!strcmp(type, "git", true))
	{
		static id;
		if(sscanf(string, "i", id)) return SendUsageMessage(playerid, "/aev git [ev ID]");
		if(!Iter_Contains(Properties, id)) return SendErrorMessage(playerid, "Hatalý ev ID girdin.");
		SendPlayer(playerid, PropertyData[id][PropertyEnter][0], PropertyData[id][PropertyEnter][1], PropertyData[id][PropertyEnter][2], PropertyData[id][PropertyEnter][3], PropertyData[id][PropertyEnterInterior], PropertyData[id][PropertyEnterWorld]);
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i numaralý eve ýþýnlandýn.", id);
		return 1;
 	}
 	return 1;
}

CMD:reklamsil(playerid, params[])
{
	if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);
	static id;
	if(sscanf(params, "i", id)) return SendUsageMessage(playerid, "/reklamsil [reklam ID]");
	if(!Iter_Contains(Adverts, id)) return SendErrorMessage(playerid, "Belirttiðin reklam ID bulunamadý.");
	AdmWarnEx(1, sprintf("%s, %i numaralý reklamý yayýnlanacaklar listesinden kaldýrdý.", ReturnName(playerid, 1), id));
	Advert_Clear(id);
	return 1;
}

CMD:posyazdir(playerid, params[])
{
  if(!PlayerData[playerid][pAdmin]) return 0;
  new Float:lastPos[3];

  GetPlayerPos(playerid, lastPos[0], lastPos[1], lastPos[2]);
  SendMessage(playerid, "%2.f, %2.f, %2.f", lastPos[0], lastPos[1], lastPos[2]);
  printf("%2.f, %2.f, %2.f", lastPos[0], lastPos[1], lastPos[2]);
  return 1;
}

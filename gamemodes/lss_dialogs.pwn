Dialog:CONFIRM_SYS(playerid, response, listitem, inputtext[])
{
    ConfirmDialog_Response(playerid, response);
    return 1;
}

Dialog:FURNITURE_ALIST(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new page = GetPVarInt(playerid, "furniture_aidx");
		if(!strcmp(inputtext, "�nceki Sayfa <<")) return Furniture_AList(playerid, page-1);
		if(!strcmp(inputtext, "Sonraki Sayfa >>")) return Furniture_AList(playerid, page+1);

		new id;
        sscanf(inputtext[0], "P<[]>{s[2]}i", id);
        SetPVarInt(playerid, "selected_afurniture_idx", id);
		Furniture_ShowDialog(playerid, id);
		return 1;
	}
    return 1;
}


Dialog:FURNITURE_ALIST_PRICE(playerid, response, listitem, inputtext[])
{
	if(!response) return Furniture_AList(playerid, GetPVarInt(playerid, "furniture_aidx"));

	new id = GetPVarInt(playerid, "selected_afurniture_idx");

	if(!IsNumeric(inputtext)) {
		Furniture_ShowDialog(playerid, id, "Mobilya fiyat� say�sal de�er olmal�d�r.");
		return 1;
	}

	if(strval(inputtext) < 1 || strval(inputtext) > 5000000) {
		Furniture_ShowDialog(playerid, id, "Mobilya fiyat� en az $1 en fazla $5.000,000 olabilir.");
		return 1;
	}

	new query[75];
	mysql_format(m_Handle, query, sizeof(query), "UPDATE furniture_lists SET ObjPrice = %i WHERE id = %i", strval(inputtext), id);
	mysql_tquery(m_Handle, query);

	SendClientMessageEx(playerid, COLOR_GREY, "SERVER: %s adl� mobilyan�n fiyat� $%s olarak g�ncellendi.", Furniture_AGetName(id), MoneyFormat(strval(inputtext)));
	return 1;
}

Dialog:VEHICLE_LIST(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new page = GetPVarInt(playerid, "vehicle_idx");
		if(!strcmp(inputtext, "�nceki Sayfa <<")) return Vehicle_List(playerid, page-1);
		if(!strcmp(inputtext, "Sonraki Sayfa >>")) return Vehicle_List(playerid, page+1);

		new id;
        sscanf(inputtext[0], "P<[]>{s[2]}i", id);
        SetPVarInt(playerid, "selected_veh_idx", id);

		/*SendPlayer(playerid, floatstr(Teleport_GetPosition(id, "TeleportX")), floatstr(Teleport_GetPosition(id, "TeleportY")), floatstr(Teleport_GetPosition(id, "TeleportZ")), floatstr(Teleport_GetPosition(id, "TeleportA")), Teleport_GetInt(id, "TeleportInterior"), Teleport_GetInt(id, "TeleportWorld"));
		SendClientMessageEx(playerid, COLOR_GREY, "SERVER: %s isimli noktaya ���nland�n.", Teleport_GetName(id));
		ResetHouseVar(playerid);*/

		Vehicle_ShowDialog(playerid, id);
		return 1;
	}
    return 1;
}

Dialog:VEHICLE_LIST_PRICE(playerid, response, listitem, inputtext[])
{
	if(!response) return Vehicle_List(playerid, GetPVarInt(playerid, "vehicle_idx"));

	new id = GetPVarInt(playerid, "selected_veh_idx");

	if(!IsNumeric(inputtext)) {
		Vehicle_ShowDialog(playerid, id, "Arac�n fiyat� say�sal de�er olmal�d�r.");
		return 1;
	}

	if(strval(inputtext) < 1 || strval(inputtext) > 5000000) {
		Vehicle_ShowDialog(playerid, id, "Arac�n fiyat� en az $1 en fazla $5.000,000 olabilir.");
		return 1;
	}

	new query[75];
	mysql_format(m_Handle, query, sizeof(query), "UPDATE dealerships SET VehiclePrice = %i WHERE id = %i", strval(inputtext), id);
	mysql_tquery(m_Handle, query);

	SendClientMessageEx(playerid, COLOR_GREY, "SERVER: %s model arac�n fiyat� $%s olarak g�ncellendi.", DealershipData[id-1][DealershipModelName], MoneyFormat(strval(inputtext)));

	//
	mysql_tquery(m_Handle, "SELECT * FROM dealerships", "SQL_LoadDealerships");
	return 1;
}

Dialog:ASYS_LOOKUP_JAILS(playerid, response, listitem, inputtext[])
{
	if(!response) {
		return ShowAdminPanel(playerid);
	}

	if(!IsValidRoleplayName(inputtext)) {
		return ShowAdminSys(playerid, 3, "Girdi�iniz oyuncu ad� ge�erli de�il. (bknz: Kevin_McCavish)");
	}

	if(!ReturnSQLFromName(inputtext)) {
		ShowAdminSys(playerid, 3, sprintf("{ADC3E7}Girdi�in oyuncu ad� \"{A52A2A}%s{ADC3E7}\" veritaban�nda bulunamad�.", inputtext));
		return 1;
	}

	/*new query[200];
	mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM log_ajail WHERE Name = '%e' ORDER BY id DESC", inputtext);
	new Cache:cache = mysql_query(m_Handle, query);

	if(!cache_num_rows())
	{
		format(query, sizeof(query), "The user \"{A52A2A}%s{ADC3E7}\" has never been admin jailed.", inputtext);
		ShowPlayerDialog(playerid, DIALOG_APANEL, DIALOG_STYLE_MSGBOX, "Administration panel", query, "Okay!", "");
		cache_delete(cache);
		return 1;
	}
	else
	{
		new Reason[128], By[60], jail_date, IP[90], jail_time;
		new PackerString[128], FullList[1100];

		strcat(FullList, "Hapise Atan - Tarih - S�re - Sebep - IP\n\n");

		for(new i = 0; i < cache_num_rows(); i++)
		{
			cache_get_value_name(i, "JailedBy", By, 60);
			cache_get_value_name(i, "Reason", Reason, 128);

			cache_get_value_name_int(i, "Date", jail_date);
			cache_get_value_name(i, "IP", IP, 90);

			cache_get_value_name_int(i, "Time", jail_time);

			format(PackerString, 128, "\t%s - %s - %i - %s - %s\n", By, GetFullTime(jail_date), jail_time, Reason, IP);
			strcat(FullList, PackerString);
		}

		Dialog_Show(playerid, DIALOG_APANEL, DIALOG_STYLE_MSGBOX, "Y�netici Paneli: Hapis Kay�tlar�", FullList, "Tamamd�r!", "");
		cache_delete(cache);
	}*/
	return 1;
}

Dialog:ASYS_LOOKUP_KICKS(playerid, response, listitem, inputtext[])
{
	if(!response) {
		return ShowAdminPanel(playerid);
	}

	if(!IsValidRoleplayName(inputtext)) {
		return ShowAdminSys(playerid, 4, "Girdi�iniz oyuncu ad� ge�erli de�il. (bknz: Kevin_McCavish)");
	}

	if(!ReturnSQLFromName(inputtext)) {
		ShowAdminSys(playerid, 4, sprintf("{ADC3E7}Girdi�in oyuncu ad� \"{A52A2A}%s{ADC3E7}\" veritaban�nda bulunamad�.", inputtext));
		return 1;
	}

	/*new
		query[200];

	mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM log_kicks WHERE Name = '%e' ORDER BY id DESC", inputtext);
	new Cache:cache = mysql_query(m_Handle, query);

	if(!cache_num_rows())
	{
		format(query, sizeof(query), "The user \"{A52A2A}%s{ADC3E7}\" has never been kicked.", inputtext);
		ShowPlayerDialog(playerid, DIALOG_APANEL, DIALOG_STYLE_MSGBOX, "Administration panel", query, "Okay!", "");

		cache_delete(cache);
		return 1;
	}
	else
	{
		new Reason[128], By[60], kick_date, IP[90];
		new PackerString[128], FullList[1100];

		strcat(FullList, "Oyundan Atan - Tarih - Sebep - IP\n\n");

		for(new i = 0; i < cache_num_rows(); i++)
		{
			cache_get_value_name(i, "KickedBy", By, 60);
			cache_get_value_name(i, "Reason", Reason, 128);

			cache_get_value_name_int(i, "Date", kick_date);
			cache_get_value_name(i, "IP", IP, 90);

			format(PackerString, 128, "\t%s - %s - %s - %s\n", By, GetFullTime(kick_date), Reason, IP);
			strcat(FullList, PackerString);
		}

		ShowPlayerDialog(playerid, DIALOG_APANEL, DIALOG_STYLE_MSGBOX, "Administration panel", FullList, "Okay!", "");
		cache_delete(cache);
	}*/
	return 1;
}

Dialog:ASYS_LOOKUP_BANS(playerid, response, listitem, inputtext[])
{
	if(!response) {
		return ShowAdminPanel(playerid);
	}

	if(!IsValidRoleplayName(inputtext)) {
		return ShowAdminSys(playerid, 5, "Girdi�iniz oyuncu ad� ge�erli de�il. (bknz: Kevin_McCavish)");
	}

	if(!ReturnSQLFromName(inputtext)) {
		ShowAdminSys(playerid, 5, sprintf("{ADC3E7}Girdi�in oyuncu ad� \"{A52A2A}%s{ADC3E7}\" veritaban�nda bulunamad�.", inputtext));
		return 1;
	}

	/*new
		query[200];

	mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM log_bans WHERE Name = '%e' ORDER BY id DESC", inputtext);
	new Cache:cache = mysql_query(m_Handle, query);

	if(!cache_num_rows())
	{
		format(query, sizeof(query), "The user \"{A52A2A}%s{ADC3E7}\" has never been banned.", inputtext);
		ShowPlayerDialog(playerid, DIALOG_APANEL, DIALOG_STYLE_MSGBOX, "Administration panel", query, "Okay!", "");

		cache_delete(cache);
		return 1;
	}
	else
	{
		new Reason[128], By[60], ban_date, IP[90];
		new PackerString[128], FullList[1100];

		strcat(FullList, "Banned by - Date - Reason - IP\n\n");

		for(new i = 0; i < cache_num_rows(); i++)
		{
			cache_get_value_name(i, "BannedBy", By, 60);
			cache_get_value_name(i, "Reason", Reason, 128);

			cache_get_value_name_int(i, "Date", ban_date);
			cache_get_value_name(i, "IP", IP, 90);

			format(PackerString, 128, "\t%s - %s - %s - %s\n", By, GetFullTime(ban_date), Reason, IP);
			strcat(FullList, PackerString);
		}

		ShowPlayerDialog(playerid, DIALOG_APANEL, DIALOG_STYLE_MSGBOX, "Administration panel", FullList, "Okay!", "");
		cache_delete(cache);
	}*/
	return 1;
}

Dialog:ASYS_DECRYPTMASK(playerid, response, listitem, inputtext[])
{
	if(!response) {
		return ShowAdminPanel(playerid);
	}

	if(strlen(inputtext) > 9) {
		return ShowAdminSys(playerid, 6, "Hatal� maske numaras� girdiniz.");
	}

	new bool: is_valid = true;
	for (new i = 0, l = strlen(inputtext); i != l; i ++)
	{
		if (i == 6 && inputtext[6] == '_')
			continue;

		else if (inputtext[i] < '0' || inputtext[i] > '9')
			is_valid = false;
	}

	if(!is_valid) {
		return ShowAdminSys(playerid, 6, "Hatal� maske numaras� girdiniz. (2)");
	}

	new First,
		Second,
		FirstStr[30],
		SecondStr[30];

	strmid(FirstStr, inputtext, 0, 6);
	strmid(SecondStr, inputtext, 7, 9);

	First = strval(FirstStr);
	Second = strval(SecondStr);

	new
		string[128];

	new query[128];
	mysql_format(m_Handle, query, sizeof(query), "SELECT Name FROM players WHERE MaskID = %i AND MaskIDEx = %i", First, Second);
	new Cache:cache = mysql_query(m_Handle, query);

	if(!cache_num_rows())
	{
		format(string, sizeof(string), "No user has the Mask ID \"{A52A2A}[%d_%d]{ADC3E7}\".", First, Second);
		ShowPlayerDialog(playerid, DIALOG_APANEL, DIALOG_STYLE_MSGBOX, "Administration panel", string, "Okay!", "");

		cache_delete(cache);
	}
	else
	{
		new Name[24];
		cache_get_value_name(0, "Name", Name, 24);

		format(string, sizeof(string), "Mask ID \"{A52A2A}[%d_%d]{ADC3E7}\" belongs to the user \"{A52A2A}%s{ADC3E7}\".", First, Second, Name);
		ShowPlayerDialog(playerid, DIALOG_APANEL, DIALOG_STYLE_MSGBOX, "Administration panel", string, "Okay!", "");

		cache_delete(cache);
	}

	return 1;
}

Dialog:ASYS(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		ShowAdminSys(playerid, listitem);
		return 1;
	}
	return 1;
}

Dialog:ASYS_OFFLINEBAN(playerid, response, listitem, inputtext[])
{
	if(!response) {
		return ShowAdminPanel(playerid);
	}

	if(!IsValidRoleplayName(inputtext)) {
		return ShowAdminSys(playerid, 0, "Girdi�iniz oyuncu ad� ge�erli de�il. (bknz: Kevin_McCavish)");
	}

	if(!ReturnSQLFromName(inputtext)) {
		ShowAdminSys(playerid, 0, sprintf("{ADC3E7}Girdi�in oyuncu ad� \"{A52A2A}%s{ADC3E7}\" veritaban�nda bulunamad�.", inputtext));
		return 1;
	}

	if(IsUserBanned(inputtext)) {
		ShowAdminSys(playerid, 0, sprintf("{ADC3E7}Girdi�in oyuncu ad� \"{A52A2A}%s{ADC3E7}\" zaten sunucudan yasakl� g�z�k�yor.", inputtext));
		return 1;
	}

	foreach(new i : Player)
	{
		if(!strcmp(ReturnName(i), inputtext, true))
		{
			ShowAdminSys(playerid, 0, sprintf("{ADC3E7}Girdi�in oyuncu ad� \"{A52A2A}%s(ID: %i){ADC3E7}\" �uan oyunda g�z�k�yor.", inputtext, i));
			return 1;
		}
	}

	new strin[128];
	format(OfflineBanName[playerid], 128, "%s", inputtext);
	format(strin, 128, "\"{A52A2A}%s{ADC3E7}\" adl� oyuncunun yasaklanma sebebini giriniz:", inputtext);
	Dialog_Show(playerid, ASYS_OFFLINEBAN_REASON, DIALOG_STYLE_INPUT, "Y�netici Paneli: Yasakla (OFFLINE)", strin, "�leri", "<<");
	return 1;
}

Dialog:ASYS_OFFLINEBAN_REASON(playerid, response, listitem, inputtext[])
{
	if(!response) {
		return ShowAdminPanel(playerid);
	}

	if(strlen(inputtext) < 3) {
		new strin[128];
		format(strin, 128, "\"{A52A2A}%s{ADC3E7}\" isimli oyuncunun yasaklanma sebebini giriniz:", OfflineBanName[playerid]);
		Dialog_Show(playerid, ASYS_OFFLINEBAN_REASON, DIALOG_STYLE_INPUT, "Y�netici Paneli: Yasakla (OFFLINE)", strin, "Se�", "<<");
		return 1;
	}

	foreach(new i : Player)
	{
		if(!strcmp(ReturnName(i), OfflineBanName[playerid], true))
		{
			SendClientMessage(playerid, COLOR_ADM, "Bir hata olu�tu... Yasaklamaya �al��t���n oyuncu �uan da giri� yapt�.");
			SendClientMessageEx(playerid, COLOR_WHITE, "ID: %i", i);
			return 1;
		}
	}

	new
		sql_id, admin_level, last_ip[16];

	new secure[94];
	mysql_format(m_Handle, secure, sizeof(secure), "SELECT id, AdminLevel, LastIP FROM players WHERE Name = '%e'", OfflineBanName[playerid]);
	new Cache: cache = mysql_query(m_Handle, secure);

	cache_get_value_name_int(0, "id", sql_id);
	cache_get_value_name_int(0, "AdminLevel", admin_level);
	cache_get_value_name(0, "IP", last_ip, sizeof(last_ip));

	cache_delete(cache);

	if(admin_level > PlayerData[playerid][pAdmin])
	{
		Dialog_Show(playerid, DIALOG_USE, DIALOG_STYLE_MSGBOX, "Y�netici Paneli: Yasakla (OFFLINE)", "Belirtilen oyuncu senin taraf�ndan yasaklanamaz.", "Tamamd�r!", "");
		return 1;
	}

	new
		ban_query[300], string[128];

	mysql_format(m_Handle, ban_query, sizeof(ban_query), "INSERT INTO bans (active, ban_ip, ban_name, ban_regid, admin, admin_regid, reason, time) VALUES (1, '%e', '%e', %i, '%e', %i, '%e', %i)", last_ip, OfflineBanName[playerid], sql_id, ReturnName(playerid, 1), PlayerData[playerid][pSQLID], inputtext, Time());
	mysql_tquery(m_Handle, ban_query);

	format(string, sizeof(string), "\"{A52A2A}%s{ADC3E7}\" adl� oyuncu ba�ar�yla yasakland�.", OfflineBanName[playerid]);
	Dialog_Show(playerid, DIALOG_USE, DIALOG_STYLE_MSGBOX, "Y�netici Paneli: Oyuncu Yasakla (OFFLINE)", string, "Tamamd�r!", "");

	//format(string, sizeof(string), "%s was offline banned by %s for '%s'", OfflineBanName[playerid], ReturnName(playerid), inputtext);
	//adminWarn(1, string);

	//printf("[WARNING] AdmCmd: %s offline banned %s, reason: %s ", ReturnName(playerid, 1), OfflineBanName[playerid], inputtext);
	return 1;
}

Dialog:ASYS_OFFLINEAJAIL(playerid, response, listitem, inputtext[])
{
	if(!response) {
		return ShowAdminPanel(playerid);
	}

	if(!IsValidRoleplayName(inputtext)) {
		return ShowAdminSys(playerid, 1, "Girdi�iniz oyuncu ad� ge�erli de�il. (bknz: Kevin_McCavish)");
	}

	if(!ReturnSQLFromName(inputtext)) {
		ShowAdminSys(playerid, 1, sprintf("{ADC3E7}Girdi�in oyuncu ad� \"{A52A2A}%s{ADC3E7}\" veritaban�nda bulunamad�.", inputtext));
		return 1;
	}

	foreach(new i : Player)
	{
		if(!strcmp(ReturnName(i), inputtext, true))
		{
			ShowAdminSys(playerid, 1, sprintf("{ADC3E7}Girdi�in oyuncu ad� \"{A52A2A}%s(ID: %i){ADC3E7}\" �uan oyunda g�z�k�yor.", inputtext, i));
			return 1;
		}
	}

	new strin[128];
	format(OfflineJailName[playerid], 60, "%s", inputtext);
	format(strin, sizeof(strin), "\"{A52A2A}%s{ADC3E7}\" adl� oyuncunun hapis s�resini dakika cinsinden giriniz:", inputtext);
	Dialog_Show(playerid, ASYS_OFFLINEAJAIL_TIME, DIALOG_STYLE_INPUT, "Y�netici Paneli: Hapise At (OFFLINE)", strin, "�leri", "<<");
	return 1;
}

Dialog:ASYS_OFFLINEAJAIL_TIME(playerid, response, listitem, inputtext[])
{
	if(!response) {
		return ShowAdminPanel(playerid);
	}

	new
		strin[230];

	if(!IsNumeric(inputtext)) {
		format(strin, sizeof(strin), "S�re, dakika cinsinden say�sal bir de�er olmal�d�r.\n\n\"{A52A2A}%s{ADC3E7}\" adl� oyuncunun hapis s�resini dakika cinsinden giriniz:", OfflineJailName[playerid]);
		Dialog_Show(playerid, ASYS_OFFLINEAJAIL_TIME, DIALOG_STYLE_INPUT, "Y�netici Paneli: Hapise At (OFFLINE)", strin, "�leri", "<<");
		return 1;
	}

	OfflineJailTime[playerid] = strval(inputtext);

	if(OfflineJailTime[playerid] < 1) {
		format(strin, sizeof(strin), "S�re, en az 1 dakika olabilir.\n\n\"{A52A2A}%s{ADC3E7}\" adl� oyuncunun hapis s�resini dakika cinsinden giriniz:", OfflineJailName[playerid]);
		ShowPlayerDialog(playerid, DIALOG_ASYS_OJAILTIME, DIALOG_STYLE_INPUT, "Y�netici Paneli: Hapise At (OFFLINE)", strin, "�leri", "<<");
		return 1;
	}

	format(strin, sizeof(strin), "\"{A52A2A}%s{ADC3E7}\" adl� oyuncunun (%i) dakikal�k hapisinin sebebini giriniz:", OfflineJailName[playerid], OfflineJailTime[playerid]);
	Dialog_Show(playerid, ASYS_OFFLINEAJAIL_REASON, DIALOG_STYLE_INPUT, "Y�netici Paneli: Hapise At (OFFLINE)", strin, "�leri", "<<");
	return 1;
}

Dialog:ASYS_OFFLINEAJAIL_REASON(playerid, response, listitem, inputtext[])
{
	if(!response) {
		return ShowAdminPanel(playerid);
	}

	foreach(new i : Player)
	{
		if(!strcmp(ReturnName(i), OfflineJailName[playerid], true))
		{
			ShowAdminSys(playerid, 1, sprintf("{ADC3E7}Girdi�in oyuncu ad� \"{A52A2A}%s(ID: %i){ADC3E7}\" �uan oyunda g�z�k�yor.", inputtext, i));
			return 1;
		}
	}

	new
		query[256],
		string[170];

	mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET OfflineAjail = %i, OfflineAjailReason = '%e' WHERE Name = '%e'", OfflineJailTime[playerid], inputtext, OfflineJailName[playerid]);
	mysql_tquery(m_Handle, query);

	format(string, sizeof(string), "\"{A52A2A}%s{ADC3E7}\" adl� oyuncu ba�ar�yla y�netici hapisine g�nderildi.", OfflineJailName[playerid]);
	Dialog_Show(playerid, DIALOG_USE, DIALOG_STYLE_MSGBOX, "Y�netici Paneli: Hapise At (OFFLINE)", string, "Tamamd�r!", "");

	//format(string, sizeof(string), "%s was offline jailed by %s for '%s'", OfflineJailName[playerid], ReturnName(playerid), inputtext);
	//adminWarn(1, string);
	return 1;
}

Dialog:ASYS_UNBAN(playerid, response, listitem, inputtext[])
{
	if(!response) {
		return ShowAdminPanel(playerid);
	}

	if(!IsValidRoleplayName(inputtext)) {
		return ShowAdminSys(playerid, 2, "Girdi�iniz oyuncu ad� ge�erli de�il. (bknz: Kevin_McCavish)");
	}

	if(!ReturnSQLFromName(inputtext)) {
		ShowAdminSys(playerid, 2, sprintf("{ADC3E7}Girdi�in oyuncu ad� \"{A52A2A}%s{ADC3E7}\" veritaban�nda bulunamad�.", inputtext));
		return 1;
	}

	if(!IsUserBanned(inputtext)) {
		ShowAdminSys(playerid, 2, sprintf("{ADC3E7}Girdi�in oyuncu ad� \"{A52A2A}%s{ADC3E7}\" zaten sunucudan yasakl� g�z�km�yor.", inputtext));
		return 1;
	}

	foreach(new i : Player)
	{
		if(!strcmp(ReturnName(i), inputtext, true))
		{
			ShowAdminSys(playerid, 2, sprintf("{ADC3E7}Girdi�in oyuncu ad� \"{A52A2A}%s(ID: %i){ADC3E7}\" �uan oyunda g�z�k�yor.", inputtext, i));
			return 1;
		}
	}

	new strin[128];
	format(AdminPanelName[playerid], 60, "%s", inputtext);
	format(strin, sizeof(strin), "\"{A52A2A}%s{ADC3E7}\" adl� oyuncunun yasa��n� kald�rmak konusunda emin misin?", inputtext);
	ConfirmDialog(playerid, "Y�netici Paneli: Yasak Kald�r", strin, "OnPanelUnban");
	return 1;
}

Dialog:TELEPORT_LIST(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new page = GetPVarInt(playerid, "teleport_idx");
		if(!strcmp(inputtext, "�nceki Sayfa <<")) return Teleport_List(playerid, page-1);
		if(!strcmp(inputtext, "Sonraki Sayfa >>")) return Teleport_List(playerid, page+1);

		new id;
        sscanf(inputtext[0], "P<[]>{s[2]}i", id);
		SendPlayer(playerid, floatstr(Teleport_GetPosition(id, "TeleportX")), floatstr(Teleport_GetPosition(id, "TeleportY")), floatstr(Teleport_GetPosition(id, "TeleportZ")), floatstr(Teleport_GetPosition(id, "TeleportA")), Teleport_GetInt(id, "TeleportInterior"), Teleport_GetInt(id, "TeleportWorld"));
		SendClientMessageEx(playerid, COLOR_GREY, "SERVER: %s isimli noktaya ���nland�n.", Teleport_GetName(id));
		ResetHouseVar(playerid);
	}
    return 1;
}

Dialog:CCTV_LIST(playerid, response, listitem, inputtext[])
{
	if(response)
	{
    new page = GetPVarInt(playerid, "cctv_idx");

    if(!strcmp(inputtext, "�nceki Sayfa <<")) return Camera_List(playerid, page-1);
    if(!strcmp(inputtext, "Sonraki Sayfa >>")) return Camera_List(playerid, page+1);

      foreach(new i : Cameras)
      {
        if(strfind(inputtext, CameraData[i][CameraName], true) != -1)
        {
          Camera_Watch(playerid, i);
          return 1;
        }
      }
	  }
    return 1;
}

Dialog:LOGIN_APP(playerid, response, listitem, inputtext[])
{
	if(!response) {
		return Kick(playerid);
	}

	new query[128 + 129], buf[129];
	WP_Hash(buf, sizeof (buf), inputtext);
	mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM accounts WHERE id = %i AND password = '%e'", AccountData[playerid][mSQLID], buf);
	mysql_tquery(m_Handle, query, "OnAccountLoginApp", "i", playerid);
	return 1;
}

Dialog:LOGIN(playerid, response, listitem, inputtext[])
{
	if(!response) {
		return Kick(playerid);
	}

	new query[128 + 129], buf[129];
	WP_Hash(buf, sizeof (buf), inputtext);
	mysql_format(m_Handle, query, sizeof(query), "SELECT last_game_ip FROM accounts WHERE id = %i AND password = '%e'", AccountData[playerid][mSQLID], buf);
	mysql_tquery(m_Handle, query, "OnAccountLogin", "i", playerid);
	return 1;
}

Dialog:SECRETWORD(playerid, response, listitem, inputtext[])
{
	if(!response)
	{
		SendClientMessage(playerid, COLOR_ADM, "SERVER: G�venlik kelimesini girmedi�in i�in at�ld�n.");
		KickEx(playerid);
		return 1;
	}

	new query[454], hashed_secretword[129];
	WP_Hash(hashed_secretword, sizeof(hashed_secretword), inputtext);
	mysql_format(m_Handle, query, sizeof(query), "SELECT id, secret FROM accounts WHERE id = %i AND memorable_word = '%e'", AccountData[playerid][mSQLID], hashed_secretword);
	mysql_tquery(m_Handle, query, "OnAccountLoginConfirm", "i", playerid);
	return 1;
}

Dialog:HOUSE_DRUGS(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new id = -1;
		if((id = IsPlayerInProperty(playerid)) != -1)
		{
			if(!IsPlayerInRangeOfPoint(playerid, 3.0, PropertyData[id][PropertyCheck][0], PropertyData[id][PropertyCheck][1], PropertyData[id][PropertyCheck][2]))
				return SendErrorMessage(playerid, "Zula noktas�na yak�n de�ilsin.");

			if(!property_drug_data[id][listitem+1][is_exist])
				return SendErrorMessage(playerid, "Se�ti�iniz slot bo� g�z�k�yor.");

			new free_slot = Drug_GetPlayerNextSlot(playerid);
			if(free_slot == -1) return SendErrorMessage(playerid, "�st�nde daha fazla uyu�turucu bulunduramazs�n.");

			new drug_query[512];
			mysql_format(m_Handle, drug_query, sizeof(drug_query), "INSERT INTO player_drugs (player_dbid, drug_name, drug_type, drug_amount, drug_quality, drug_size) VALUES (%i, '%e', %i, %f, %i, %i)", PlayerData[playerid][pSQLID], property_drug_data[id][listitem+1][prop_drug_name], property_drug_data[id][listitem+1][prop_drug_id], property_drug_data[id][listitem+1][prop_drug_amount], property_drug_data[id][listitem+1][prop_drug_quality], property_drug_data[id][listitem+1][prop_drug_size]);
			new Cache: cache = mysql_query(m_Handle, drug_query);

			player_drug_data[playerid][free_slot][data_id] = cache_insert_id();
			player_drug_data[playerid][free_slot][drug_id] = property_drug_data[id][listitem+1][prop_drug_id];
			format(player_drug_data[playerid][free_slot][drug_name], 64, "%s", property_drug_data[id][listitem+1][prop_drug_name]);
			player_drug_data[playerid][free_slot][drug_amount] = property_drug_data[id][listitem+1][prop_drug_amount];
			player_drug_data[playerid][free_slot][drug_quality] = property_drug_data[id][listitem+1][prop_drug_quality];
			player_drug_data[playerid][free_slot][drug_size] = property_drug_data[id][listitem+1][prop_drug_size];
			player_drug_data[playerid][free_slot][is_exist] = true;

			cache_delete(cache);

			cmd_ame(playerid, sprintf("evin zulas�ndan %s al�r.", Drug_GetName(property_drug_data[id][listitem+1][prop_drug_id])));
			Drug_PropertyDefaultValues(id, listitem+1);
			return 1;
		}
	}
	return 1;
}

Dialog:FURNITURE_MAIN(playerid, response, listitem, inputtext[])
{
	if(!response) {
		PlayerData[playerid][pHouseFurniture] = -1;
		PlayerData[playerid][pBizFurniture] = -1;
		return 1;
	}

	switch(listitem)
	{
	    case 0: Furniture_Category(playerid);
	    case 1: Furniture_List(playerid);
		case 2:
		{
			new
				sub_str[105], primary_str[315];

			if(PlayerData[playerid][pBizFurniture] != -1)
			{
				format(sub_str, sizeof(sub_str), "{FFFFFF}- Bu mekan �uan da {33AA33}%i{FFFFFF} adet mobilyaya sahip.\n", Furniture_GetCountBiz(BusinessData[PlayerData[playerid][pBizFurniture]][BusinessID]));
				strcat(primary_str, sub_str);
			}
			else if(PlayerData[playerid][pHouseFurniture] != -1)
			{
				format(sub_str, sizeof(sub_str), "{FFFFFF}- Bu mekan �uan da {33AA33}%i{FFFFFF} adet mobilyaya sahip.\n", Furniture_GetCount(PropertyData[PlayerData[playerid][pHouseFurniture]][PropertyID]));
				strcat(primary_str, sub_str);
			}

			format(sub_str, sizeof(sub_str), "- Bu eve ekleyebilece�in mobilya say�s� {33AA33}%i{FFFFFF} adettir.\n", Furniture_GetLimit(playerid));
			strcat(primary_str, sub_str);

			if(PlayerData[playerid][pBizFurniture] != -1)
			{
				format(sub_str, sizeof(sub_str), "- {33AA33}%i{FFFFFF} adet mobilya daha ekleyebilirsin.\n", Furniture_GetLimit(playerid) - Furniture_GetCountBiz(BusinessData[PlayerData[playerid][pBizFurniture]][BusinessID]));
				strcat(primary_str, sub_str);
			}
			else if(PlayerData[playerid][pHouseFurniture] != -1)
			{
				format(sub_str, sizeof(sub_str), "- {33AA33}%i{FFFFFF} adet mobilya daha ekleyebilirsin.\n", Furniture_GetLimit(playerid) - Furniture_GetCount(PropertyData[PlayerData[playerid][pHouseFurniture]][PropertyID]));
				strcat(primary_str, sub_str);
			}

			Dialog_Show(playerid, FURNITURE_MAIN_INFO, DIALOG_STYLE_MSGBOX, "Mobilya Bilgileri", primary_str, "Tamam", "<<<");
		}
	}
	return 1;
}

Dialog:FURNITURE_MAIN_INFO(playerid, response, listitem, inputtext[])
{
	cmd_mobilya(playerid, "");
	return 1;
}


Dialog:FURNITURE_CATEGORIES(playerid, response, listitem, inputtext[])
{
	if(!response) {
		cmd_mobilya(playerid, "");
		return 1;
	}

	SetPVarInt(playerid, "furniture_category", listitem+1);
	Furniture_SubCategory(playerid, listitem+1);
	return 1;
}

Dialog:FURNITURE_SUBCATEGORY(playerid, response, listitem, inputtext[])
{
	if(!response) {
		Furniture_Category(playerid);
		return 1;
	}

	new id = Furniture_GetSubAltID(inputtext);
	SetPVarInt(playerid, "furniture_subcategory", id);
	Furniture_SubCategoryAlt(playerid, id);
	return 1;
}

Dialog:FURNITURE_SUBALTCATEGORY(playerid, response, listitem, inputtext[])
{
	if(!response) {
		Furniture_SubCategory(playerid, GetPVarInt(playerid, "furniture_category"));
		return 1;
	}

	new obj_name[64];
	sscanf(inputtext, "s[64]", obj_name);
	SetPVarString(playerid, "furniture_name", obj_name);
	SetPVarInt(playerid, "furniture_price", Furniture_GetPrice(GetPVarInt(playerid, "furniture_subcategory"), obj_name));
	SetPVarInt(playerid, "furniture_objid", Furniture_GetObjID(GetPVarInt(playerid, "furniture_subcategory"), obj_name));

	new sub_str[75], primary_str[325];
	format(sub_str, sizeof(sub_str), "{FFFFFF}Ana Kategori: {FFFF00}%s\n", Furniture_GetCategory(GetPVarInt(playerid, "furniture_category")));
	strcat(primary_str, sub_str);

	format(sub_str, sizeof(sub_str), "{FFFFFF}Alt Kategori: {FFFF00}%s\n", Furniture_GetSubCategory(GetPVarInt(playerid, "furniture_subcategory")));
	strcat(primary_str, sub_str);

	format(sub_str, sizeof(sub_str), "{FFFFFF}Mobilya Ad�: {FFFF00}%s\n", obj_name);
	strcat(primary_str, sub_str);

	format(sub_str, sizeof(sub_str), "{FFFFFF}Fiyat: {33AA33}${FFFF00}%s\n", MoneyFormat(GetPVarInt(playerid, "furniture_price")));
	strcat(primary_str, sub_str);

	Dialog_Show(playerid, FURNITURE_CATEGORYBUY, DIALOG_STYLE_MSGBOX, "Mobilya Bilgisi", primary_str, "Sat�nal", "<<<");
	return 1;
}

Dialog:FURNITURE_CATEGORYBUY(playerid, response, listitem, inputtext[])
{
	if(!response) {
        Furniture_SubCategoryAlt(playerid, GetPVarInt(playerid, "furniture_subcategory"));
	    return 1;
	}

	new p = PlayerData[playerid][pHouseFurniture], b = PlayerData[playerid][pBizFurniture];

	if(p != -1)
	{
		if(p != IsPlayerInProperty(playerid))
		{
			SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi evinizde olmal�s�n�z.");
			return 1;
		}

		if(Furniture_GetCount(p) >= Furniture_GetLimit(playerid))
		{
			SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Maksimum sat�n alabilece�in mobilya s�n�r�na ula�m��s�n. (%i adet)", Furniture_GetLimit(playerid));
			return 1;
		}
	}

	if(b != -1)
	{
		if(b != IsPlayerInBusiness(playerid))
		{
			SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi evinizde olmal�s�n�z.");
			return 1;
		}

		if(Furniture_GetCountBiz(b) >= Furniture_GetLimit(playerid))
		{
			SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Maksimum sat�n alabilece�in mobilya s�n�r�na ula�m��s�n. (%i adet)", Furniture_GetLimit(playerid));
			return 1;
		}
	}

    if(GetPVarInt(playerid, "furniture_price") > PlayerData[playerid][pMoney])
    {
    	SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Yeterli paran yok. Toplam: $%s", MoneyFormat(GetPVarInt(playerid, "furniture_price")));
    	return 1;
    }

    new furn_name[64];
    GetPVarString(playerid, "furniture_name", furn_name, sizeof(furn_name));

	new query[512], Float: x, Float: y, Float: z; GetPlayerPos(playerid, x, y, z); GetXYInFrontOfPlayer(playerid, x, y, 3.0);
	new data[e_furniture];

	if(p != -1)
	{
		mysql_format(m_Handle, query, sizeof(query), "INSERT INTO furnitures (PropertyID, CategoryID, SubCategoryID, FurnitureID, FurniturePrice, FurnitureName, FurnitureX, FurnitureY, FurnitureZ, FurnitureVW, FurnitureInt) VALUES (%i, %i, %i, %i, %i, '%e', %f, %f, %f, %i, %i)", PropertyData[p][PropertyID], GetPVarInt(playerid, "furniture_category"), GetPVarInt(playerid, "furniture_subcategory"), GetPVarInt(playerid, "furniture_objid"), GetPVarInt(playerid, "furniture_price"), furn_name, x, y, z, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
		data[PropertyID] = PropertyData[p][PropertyID];
	}
	else if(b != -1)
	{
		mysql_format(m_Handle, query, sizeof(query), "INSERT INTO furnitures (BusinessID, CategoryID, SubCategoryID, FurnitureID, FurniturePrice, FurnitureName, FurnitureX, FurnitureY, FurnitureZ, FurnitureVW, FurnitureInt) VALUES (%i, %i, %i, %i, %i, '%e', %f, %f, %f, %i, %i)", BusinessData[b][BusinessID], GetPVarInt(playerid, "furniture_category"), GetPVarInt(playerid, "furniture_subcategory"), GetPVarInt(playerid, "furniture_objid"), GetPVarInt(playerid, "furniture_price"), furn_name, x, y, z, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
		data[BusinessID] = BusinessData[b][BusinessID];
	}

    new Cache: add = mysql_query(m_Handle, query);
    data[SQLID] = cache_insert_id();

    data[ObjectID] = GetPVarInt(playerid, "furniture_objid");
    data[ArrayID] = GetPVarInt(playerid, "furniture_category");
	data[SubArrayID] = GetPVarInt(playerid, "furniture_subcategory");
	format(data[furnitureName], 64, furn_name); data[furniturePrice] = GetPVarInt(playerid, "furniture_price");
	data[furnitureX] = x, data[furnitureY] = y, data[furnitureZ] = z;
	data[furnitureRX] = data[furnitureRY] = data[furnitureRZ] = 0.0;

	for(new i; i < 5; i++) data[furnitureTexture][i] = -1;
	cache_delete(add);

	if(IsHouseDoor(data[ObjectID]))
	{
		SendClientMessage(playerid, COLOR_SOFTPINK, "Bunu biliyor muydun?");
		SendClientMessage(playerid, COLOR_WHITE, "Sat�n alaca��n kap�y� {AFAFAF}/kapi ve /kilit {FFFFFF}komutlar�yla kontol edebilirsin.");
		data[furnitureLocked] = true, data[furnitureOpened] = false;
	}
	else if(IsHouseRefrigerator(data[ObjectID]))
	{
		SendClientMessage(playerid, COLOR_SOFTPINK, "Bunu biliyor muydun?");
		SendClientMessage(playerid, COLOR_WHITE, "Sat�n alaca��n buzdolab�n�n �n�nde {AFAFAF}/candoldur {FFFFFF}yazarak can�n� fulleyebilirsin.");
	}
	else if(IsHouseSafe(data[ObjectID]))
	{
		SendClientMessage(playerid, COLOR_SOFTPINK, "Bunu biliyor muydun?");
		SendClientMessage(playerid, COLOR_WHITE, "Sat�n alaca��n kasayla {AFAFAF}/ev paracek/parayatir {FFFFFF}komutlar�n� kullanabileceksin.");
	}

   	data[TempObjectID] = CreateDynamicObject(GetPVarInt(playerid, "furniture_objid"), x, y, z, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
   	Streamer_Update(playerid);

	EditingID[playerid] = p; EditingObject[playerid] = 21;
	Streamer_SetArrayData(STREAMER_TYPE_OBJECT, data[TempObjectID], E_STREAMER_EXTRA_ID, data);
	EditDynamicObject(playerid, data[TempObjectID]); SetPVarInt(playerid, "chose_slot", data[TempObjectID]);

	GiveMoney(playerid, -data[furniturePrice]);

    InfoTD_MSG(playerid, 1, 5000, "\
		\" ~y~SPACE ~w~\" ve \" ~y~MMB ~w~\" TUSLARINA BASARAK MOBILYAYI ONUNE DOGRU GETIREBILIRSIN.~n~\
		EGER MOBILYAYI BEGENMEDIYSEN \" ~r~ESC ~w~\" TUSUNA BASARAK IADE EDEBILIRSIN.");
	return 1;
}

Dialog:FURNITURE_EDIT(playerid, response, listitem, inputtext[])
{
	if(!response) return cmd_mobilya(playerid, "");

	if(PlayerData[playerid][pHouseFurniture] != -1)
	{
		if(IsPlayerInProperty(playerid) != PlayerData[playerid][pHouseFurniture])
		{
			SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi evinizde olmal�s�n�z.");
			return 1;
		}
	}
	else if(PlayerData[playerid][pBizFurniture] != -1)
	{
		if(IsPlayerInBusiness(playerid) != PlayerData[playerid][pBizFurniture])
		{
			SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi i�yerinizde olmal�s�n�z.");
			return 1;
		}
	}

	new data[e_furniture], objid = GetPVarInt(playerid, "chose_slot");
	Streamer_GetArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data);
	if(!Streamer_IsInArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data[SQLID]))
	{
		SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Se�ti�iniz mobilya ortal�kta yok.");
		cmd_mobilya(playerid, "");
		return 1;
	}

	switch(listitem)
	{
	    case 0:
	    {
	    	new
	    		sub_str[75], primary_str[325];

	        format(sub_str, sizeof(sub_str), "{FFFFFF}Ana Kategori: {FFFF00}%s\n", 	Furniture_GetCategory(data[ArrayID]));
			strcat(primary_str, sub_str);

			format(sub_str, sizeof(sub_str), "{FFFFFF}Alt Kategori: {FFFF00}%s\n", Furniture_GetSubCategory(data[SubArrayID]));
			strcat(primary_str, sub_str);

			format(sub_str, sizeof(sub_str), "{FFFFFF}Mobilya Ad�: {FFFF00}%s\n", data[furnitureName]);
			strcat(primary_str, sub_str);

			format(sub_str, sizeof(sub_str), "{FFFFFF}Fiyat: {33AA33}${FFFF00}%s\n", MoneyFormat(data[furniturePrice]));
			strcat(primary_str, sub_str);

			Dialog_Show(playerid, FURNITURE_INFO, DIALOG_STYLE_MSGBOX, "Mobilya Bilgisi", primary_str, "Tamam", "<<<");
	        return 1;
	    }
	    case 1:
	    {
	    	Furniture_Details(playerid);
	        return 1;
	    }
	    case 2:
	    {
            InfoTD_MSG(playerid, 1, 5000, "\
	 			HER MOBILYA YAKLASIK 5 DEKORASYON SLOTUNA SAHIPTIR.~n~\
            	HER SLOT MOBILYANIN BIR KISMINI ETKILER.");

	    	new
	    		sub_str[50], primary_str[250];

			for(new i; i < 5; i++)
			{
				if(data[furnitureTexture][i] != -1) format(sub_str, sizeof(sub_str), "Dekorasyon %i: %s\n", i+1, GetTextureName(data[furnitureTexture][i]));
				else format(sub_str, sizeof(sub_str), "Slot %i: {FFFF00}Yok\n", i+1);
				strcat(primary_str, sub_str);
			}

			strcat(primary_str, "{FFFF00}Dekorasyonlar� Kald�r");
	        Dialog_Show(playerid, FURNITURE_TEXTURE, DIALOG_STYLE_LIST, "Mobilya Dekorasyon", primary_str, "Se�", "<<<");
			return 1;
	    }
	    case 3:
	    {
	    	new
	    		sub_str[75], primary_str[325];

	        format(sub_str, sizeof(sub_str), "{FFFFFF}Ana Kategori: {FFFF00}%s\n", 	Furniture_GetCategory(data[ArrayID]));
			strcat(primary_str, sub_str);

			format(sub_str, sizeof(sub_str), "{FFFFFF}Alt Kategori: {FFFF00}%s\n", Furniture_GetSubCategory(data[SubArrayID]));
			strcat(primary_str, sub_str);

			format(sub_str, sizeof(sub_str), "{FFFFFF}Mobilya Ad�: {FFFF00}%s\n", data[furnitureName]);
			strcat(primary_str, sub_str);

			format(sub_str, sizeof(sub_str), "{FFFFFF}Fiyat: {33AA33}${FFFF00}%s\n", MoneyFormat(data[furniturePrice]));
			strcat(primary_str, sub_str);

		    format(sub_str, sizeof(sub_str), "{FFFFFF}Mobilyay� satt���n�zda {FFFF00}$%s {FFFFFF}alacaks�n�z.", MoneyFormat((data[furniturePrice] - (data[furniturePrice] & 2)) / 2));
	    	strcat(primary_str, sub_str);

			Dialog_Show(playerid, FURNITURE_SELL, DIALOG_STYLE_MSGBOX, "Mobilya Sat", primary_str, "Sat", "<<<");
	        return 1;
	    }
		case 4:
		{
			new
				primary_str[500];

			strcat(primary_str, "{FFFF00}Mobilyan�za �zel bir ad ekleme olana��n�z bulunuyor.\n");
			strcat(primary_str, "Bu �zellik, sahip olabilece�iniz bir �ok mobilyay� kolayca bulman�z� sa�lamak i�indir.\n\n");

			strcat(primary_str, "Mobilyan�z�n g�r�nmesini istedi�iniz yeni ad�n� girin. Maksimum s�n�r 32 karakterdir.\n\n");

			strcat(primary_str, "{FF6347}[ ! ] UYARI: Bu �zelli�in k�t�ye kullan�lmas� cezaland�r�labilir. K�t�ye kullanma.\n");
			strcat(primary_str, "[ ! ] NOT: Bu mobilya ad� sadece sizin izin verdikleriniz taraf�ndan g�r�lebilir.");

			Dialog_Show(playerid, FURNITURE_RENAME, DIALOG_STYLE_INPUT, data[furnitureName], primary_str, "De�i�tir", "<<<");
			return 1;
		}
		case 5:
		{
	    	new
	    		sub_str[75], primary_str[325];

	        format(sub_str, sizeof(sub_str), "{FFFFFF}Ana Kategori: {FFFF00}%s\n", 	Furniture_GetCategory(data[ArrayID]));
			strcat(primary_str, sub_str);

			format(sub_str, sizeof(sub_str), "{FFFFFF}Alt Kategori: {FFFF00}%s\n", Furniture_GetSubCategory(data[SubArrayID]));
			strcat(primary_str, sub_str);

			format(sub_str, sizeof(sub_str), "{FFFFFF}Mobilya Ad�: {FFFF00}%s\n", data[furnitureName]);
			strcat(primary_str, sub_str);

			format(sub_str, sizeof(sub_str), "{FFFFFF}Fiyat: {33AA33}${FFFF00}%s\n", MoneyFormat(data[furniturePrice]));
			strcat(primary_str, sub_str);

	    	strcat(primary_str, "{FFFFFF}Bu mobilyay� kopyalamak istiyor musunuz?");
			Dialog_Show(playerid, FURNITURE_COPY, DIALOG_STYLE_MSGBOX, "Mobilya Kopyala", primary_str, "Kopyala", "<<<");
	        return 1;
		}
	}
	return 1;
}

Dialog:FURNITURE_INFO(playerid, response, listitem, inputtext[]) return Furniture_Edit(playerid);
Dialog:FURNITURE_EDIT_DETAILS(playerid, response, listitem, inputtext[])
{
	if(!response)
	{
		return Furniture_Edit(playerid);
	}

	if(PlayerData[playerid][pHouseFurniture] != -1)
	{
		if(IsPlayerInProperty(playerid) != PlayerData[playerid][pHouseFurniture])
		{
			SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi evinizde olmal�s�n�z.");
			return 1;
		}
	}
	else if(PlayerData[playerid][pBizFurniture] != -1)
	{
		if(IsPlayerInBusiness(playerid) != PlayerData[playerid][pBizFurniture])
		{
			SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi i�yerinizde olmal�s�n�z.");
			return 1;
		}
	}

	new data[e_furniture], query[128], objid = GetPVarInt(playerid, "chose_slot");
	Streamer_GetArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data);
	if(!Streamer_IsInArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data[SQLID]))
	{
		SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}D�zenlemek i�in se�ti�iniz mobilya ortal�kta yok.");
		cmd_mobilya(playerid, "");
		return 1;
	}

	switch(listitem)
	{
		case 0:
		{
			EditingObject[playerid] = 22; EditingID[playerid] = data[PropertyID]; EditDynamicObject(playerid, objid);
    		InfoTD_MSG(playerid, 1, 5000, "\" ~y~SPACE ~w~\" ve \" ~y~MMB ~w~\" TUSLARINA BASARAK MOBILYAYI ONUNE DOGRU GETIREBILIRSIN.");
		}
		case 1:
		{
			data[furnitureRZ] = data[furnitureRZ] - 90.0;
			SetDynamicObjectRot(objid, data[furnitureRX], data[furnitureRY], data[furnitureRZ]);
			Streamer_SetArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data);
			mysql_format(m_Handle, query, sizeof(query), "UPDATE furnitures SET FurnitureRZ = %f WHERE id = %i", data[furnitureRZ], data[SQLID]);
			mysql_tquery(m_Handle, query);
			Furniture_Details(playerid);
		}
		case 2:
		{
			data[furnitureRX] = data[furnitureRX] - 90.0;
			SetDynamicObjectRot(objid, data[furnitureRX], data[furnitureRY], data[furnitureRZ]);
			Streamer_SetArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data);
			mysql_format(m_Handle, query, sizeof(query), "UPDATE furnitures SET FurnitureRX = %f WHERE id = %i", data[furnitureRX], data[SQLID]);
			mysql_tquery(m_Handle, query);
			Furniture_Details(playerid);
		}
	}

	if(!strcmp(inputtext, "Pozisyonu Kopyala"))
	{
		SetPVarInt(playerid, "FurniturePos", data[SQLID]);
	    Furniture_Details(playerid);
	}
	else if(!strcmp(inputtext, "* Pozisyonu Yap��t�r"))
	{
		new datafrom[e_furniture];
		Streamer_GetArrayData(STREAMER_TYPE_OBJECT, GetPVarInt(playerid, "FurniturePos"), E_STREAMER_EXTRA_ID, datafrom);
		if(!Streamer_IsInArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, datafrom[SQLID]))
		{
			SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Pozisyonunu kopyalad���n mobilya ortal�kta yok.");
			SetPVarInt(playerid, "FurniturePos", -1);
			Furniture_Details(playerid);
			return 1;
		}

		data[furnitureX] = datafrom[furnitureX]; data[furnitureY] = datafrom[furnitureY]; data[furnitureZ] = datafrom[furnitureZ];
		SetDynamicObjectPos(objid, data[furnitureX], data[furnitureY], data[furnitureZ]); Streamer_SetArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data);
		mysql_format(m_Handle, query, sizeof(query), "UPDATE furnitures SET FurnitureX = %f, FurnitureY = %f, FurnitureZ = %f WHERE id = %i", data[furnitureX], data[furnitureY], data[furnitureZ], data[SQLID]);
		mysql_tquery(m_Handle, query);
		Furniture_Details(playerid);
	}
	else if(!strcmp(inputtext, "Rotasyonu Kopyala"))
	{
		SetPVarInt(playerid, "FurnitureRot", data[SQLID]);
	    Furniture_Details(playerid);
	}
	else if(!strcmp(inputtext, "* Rotasyonu Yap��t�r"))
	{
		new datafrom[e_furniture];
		Streamer_GetArrayData(STREAMER_TYPE_OBJECT, GetPVarInt(playerid, "FurnitureRot"), E_STREAMER_EXTRA_ID, datafrom);
		if(!Streamer_IsInArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, datafrom[SQLID]))
		{
			SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Rotasyonunu kopyalad���n mobilya ortal�kta yok.");
			SetPVarInt(playerid, "FurnitureRot", -1);
			Furniture_Details(playerid);
			return 1;
		}

		data[furnitureRX] = datafrom[furnitureRX]; data[furnitureRY] = datafrom[furnitureRY]; data[furnitureRZ] = datafrom[furnitureRZ];
		SetDynamicObjectRot(objid, data[furnitureRX], data[furnitureRY], data[furnitureRZ]); Streamer_SetArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data);
		mysql_format(m_Handle, query, sizeof(query), "UPDATE furnitures SET FurnitureRX = %f, FurnitureRY = %f, FurnitureRZ = %f WHERE id = %i", data[furnitureRX], data[furnitureRY], data[furnitureRZ], data[SQLID]);
		mysql_tquery(m_Handle, query);
		Furniture_Details(playerid);
	}
	return 1;
}

Dialog:FURNITURE_TEXTURE(playerid, response, listitem, inputtext[])
{
	if(!response)
	{
		return Furniture_Edit(playerid);
	}

	if(PlayerData[playerid][pHouseFurniture] != -1)
	{
		if(IsPlayerInProperty(playerid) != PlayerData[playerid][pHouseFurniture])
		{
			SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi evinizde olmal�s�n�z.");
			return 1;
		}
	}
	else if(PlayerData[playerid][pBizFurniture] != -1)
	{
		if(IsPlayerInBusiness(playerid) != PlayerData[playerid][pBizFurniture])
		{
			SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi i�yerinizde olmal�s�n�z.");
			return 1;
		}
	}

	new data[e_furniture], query[64], objid = GetPVarInt(playerid, "chose_slot");
	Streamer_GetArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data);
	if(!Streamer_IsInArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data[SQLID]))
	{
		SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Dekorasyon i�in se�ti�iniz mobilya ortal�kta yok.");
		cmd_mobilya(playerid, "");
		return 1;
	}

	if(listitem < 5)
	{
 		Dialog_Show(playerid, FURNITURE_TEXTURE_SELECT, DIALOG_STYLE_LIST, sprintf("Mobilya Dekorasyon {00FF22}(%i)", listitem+1), "Dekorasyon Se�\n{FFFF00}Dekorasyon Kald�r", "Se�", "<<<");
        SetPVarInt(playerid, "chose_texture", listitem);
		return 1;
	}

  	for(new i; i < 5; i++)
	{
	    if(data[furnitureTexture][i] == -1)
	        continue;

		data[furnitureTexture][i] = -1;
        SetDynamicObjectMaterial(objid, i, -1, "none", "none", 0);
		mysql_format(m_Handle, query, sizeof(query), "UPDATE furnitures SET Texture_%i = -1 WHERE id = %i", i+1, data[SQLID]);
		mysql_tquery(m_Handle, query);
	}

    Streamer_SetArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data);
 	SendClientMessageEx(playerid, COLOR_WHITE, "%s adl� mobilyan�n t�m dekorasyonunu s�f�rlad�n.", data[furnitureName]);
	Furniture_Edit(playerid);
	return 1;
}

Dialog:FURNITURE_TEXTURE_SELECT(playerid, response, listitem, inputtext[])
{
	if(!response)
	{
		return Furniture_Edit(playerid);
	}

	if(PlayerData[playerid][pHouseFurniture] != -1)
	{
		if(IsPlayerInProperty(playerid) != PlayerData[playerid][pHouseFurniture])
		{
			SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi evinizde olmal�s�n�z.");
			return 1;
		}
	}
	else if(PlayerData[playerid][pBizFurniture] != -1)
	{
		if(IsPlayerInBusiness(playerid) != PlayerData[playerid][pBizFurniture])
		{
			SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi i�yerinizde olmal�s�n�z.");
			return 1;
		}
	}

	new data[e_furniture], query[64], objid = GetPVarInt(playerid, "chose_slot"), slot = GetPVarInt(playerid, "chose_texture");
	Streamer_GetArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data);
	if(!Streamer_IsInArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data[SQLID]))
	{
		SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Dekorasyon i�in se�ti�iniz mobilya ortal�kta yok.");
		cmd_mobilya(playerid, "");
		return 1;
	}

	switch(listitem)
	{
	    case 0:
		{
		    new Float:x,
				Float:y,
				Float:z,
				Float:facing,
				Float:distance = 3.0;

		    GetPlayerPos(playerid, x, y, z);
		    GetPlayerFacingAngle(playerid, facing);

		  	x += (distance * floatsin(-facing, degrees));
		    y += (distance * floatcos(-facing, degrees));

            InfoTD_MSG(playerid, 1, 20000, "\
	 		\" ~y~Y ~w~\" ve \" ~y~N ~w~\" TUSLARIYLA DEKORASYONLARI GEZEBILIRSIN.~n~\
            \" ~y~H ~w~\" TUSUYLA DEKORASYON SLOTUNU DEGISTIREBILIRSIN.~n~\
            \" ~y~SPACE ~w~\" TUSUYLA SECILI DEKORASYONU UYGULAYABILIRSIN.~n~\
            \" ~y~ENTER ~w~\" TUSUYLA DEKORASYON MENUSUNU KAPATABILIRSIN.~n~");

			PlayerData[playerid][p3DMenu] = Create3DMenu(playerid, x, y, z, facing, 16);
		    Select3DMenu(playerid, PlayerData[playerid][p3DMenu]);
			return 1;
		}
		case 1:
	    {
	        if(data[furnitureTexture][slot] == -1)
	        {
	            SendErrorMessage(playerid, "Se�ti�iniz slotta dekorasyon bulunmuyor.");
	            Furniture_Edit(playerid);
	            return 1;
	        }

        	data[furnitureTexture][slot] = -1;
        	SetDynamicObjectMaterial(objid, slot, -1, "none", "none", 0);
            SendClientMessageEx(playerid, COLOR_WHITE, "%s adl� mobilyan�n %i numaral� slotta bulunan dekorasyonunu s�f�rlad�n.", data[furnitureName], slot+1);
			Streamer_SetArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data);
			mysql_format(m_Handle, query, sizeof(query), "UPDATE furnitures SET Texture_%i = -1 WHERE id = %i", slot+1, data[SQLID]);
			mysql_tquery(m_Handle, query);
	        return 1;
	    }
	}
	return 1;
}

Dialog:FURNITURE_SELL(playerid, response, listitem, inputtext[])
{
    if(!response) return Furniture_Edit(playerid);

	if(PlayerData[playerid][pHouseFurniture] != -1)
	{
		if(IsPlayerInProperty(playerid) != PlayerData[playerid][pHouseFurniture])
		{
			SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi evinizde olmal�s�n�z.");
			return 1;
		}
	}
	else if(PlayerData[playerid][pBizFurniture] != -1)
	{
		if(IsPlayerInBusiness(playerid) != PlayerData[playerid][pBizFurniture])
		{
			SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi i�yerinizde olmal�s�n�z.");
			return 1;
		}
	}

	new data[e_furniture], query[64], objid = GetPVarInt(playerid, "chose_slot");
	Streamer_GetArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data);

	if(!Streamer_IsInArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data[SQLID]))
	{
		SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Satmaya �al��t���n mobilya ortal�kta yok.");
		cmd_mobilya(playerid, "");
		return 1;
	}

	new sell_price = (data[furniturePrice] - (data[furniturePrice] & 2)) / 2;
	SendClientMessageEx(playerid, COLOR_WHITE, "%s adl� mobilyay� satarak paran�n y�zde ellisini geri ald�n. ({FFFF00}+$%s{FFFFFF})", data[furnitureName], MoneyFormat(sell_price));
	GameTextForPlayer(playerid, sprintf("~w~+$%i", sell_price), 2000, 1);
	GiveMoney(playerid, data[furniturePrice]); DestroyDynamicObject(objid);
	mysql_format(m_Handle, query, sizeof(query), "DELETE FROM furnitures WHERE id = %i", data[SQLID]);
	mysql_tquery(m_Handle, query);

	//Streamer_RemoveArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data[SQLID]);
	return 1;
}

Dialog:FURNITURE_RENAME(playerid, response, listitem, inputtext[])
{
	if(!response)
	{
		return Furniture_Edit(playerid);
	}

	if(PlayerData[playerid][pHouseFurniture] != -1)
	{
		if(IsPlayerInProperty(playerid) != PlayerData[playerid][pHouseFurniture])
		{
			SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi evinizde olmal�s�n�z.");
			return 1;
		}
	}
	else if(PlayerData[playerid][pBizFurniture] != -1)
	{
		if(IsPlayerInBusiness(playerid) != PlayerData[playerid][pBizFurniture])
		{
			SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi i�yerinizde olmal�s�n�z.");
			return 1;
		}
	}

	new data[e_furniture], objid = GetPVarInt(playerid, "chose_slot");
	Streamer_GetArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data);
	if(!Streamer_IsInArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data[SQLID]))
	{
		SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Ad�n� de�i�tirmeye �al��t���n mobilya ortal�kta yok.");
		cmd_mobilya(playerid, "");
		return 1;
	}

	if(strlen(inputtext) < 1 || strlen(inputtext) > 32)
	{
		new
			primary_str[500];

		strcat(primary_str, "{FFFF00}Mobilyan�za �zel bir ad ekleme olana��n�z bulunuyor.\n");
		strcat(primary_str, "Bu �zellik, sahip olabilece�iniz bir �ok mobilyay� kolayca bulman�z� sa�lamak i�indir.\n\n");

		strcat(primary_str, "Mobilyan�z�n g�r�nmesini istedi�iniz yeni ad�n� girin. Maksimum s�n�r 32 karakterdir.\n\n");

		strcat(primary_str, "{FF6347}[ ! ] UYARI: Bu �zelli�in k�t�ye kullan�lmas� cezaland�r�labilir. K�t�ye kullanma.\n");
		strcat(primary_str, "[ ! ] NOT: Bu mobilya ad� sadece sizin izin verdikleriniz taraf�ndan g�r�lebilir.");

		Dialog_Show(playerid, FURNITURE_RENAME, DIALOG_STYLE_INPUT, data[furnitureName], primary_str, "De�i�tir", "<<<");
		return 1;
	}

	SendClientMessageEx(playerid, COLOR_WHITE, "%s adl� mobilyan�n yeni ad� %s olarak g�ncellendi.", data[furnitureName], inputtext);
    format(data[furnitureName], 64, "%s", inputtext);
    Streamer_SetArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, data);

	new query[56 + 33 + 12];
	mysql_format(m_Handle, query, sizeof(query), "UPDATE furnitures SET FurnitureName = '%e' WHERE ID = %i", data[furnitureName], data[SQLID]);
	mysql_tquery(m_Handle, query);

    Furniture_Edit(playerid);
	return 1;
}

Dialog:FURNITURE_COPY(playerid, response, listitem, inputtext[])
{
	if(!response)
	{
		return Furniture_Edit(playerid);
	}

	if(PlayerData[playerid][pHouseFurniture] != -1)
	{
		if(IsPlayerInProperty(playerid) != PlayerData[playerid][pHouseFurniture])
		{
			SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi evinizde olmal�s�n�z.");
			return 1;
		}
	}
	else if(PlayerData[playerid][pBizFurniture] != -1)
	{
		if(IsPlayerInBusiness(playerid) != PlayerData[playerid][pBizFurniture])
		{
			SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi i�yerinizde olmal�s�n�z.");
			return 1;
		}
	}

	new datafrom[e_furniture], objid = GetPVarInt(playerid, "chose_slot");
	Streamer_GetArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, datafrom);
	if(!Streamer_IsInArrayData(STREAMER_TYPE_OBJECT, objid, E_STREAMER_EXTRA_ID, datafrom[SQLID]))
	{
		SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Kopyalamaya �al��t���n mobilya ortal�kta yok.");
		cmd_mobilya(playerid, "");
		return 1;
	}

    if(datafrom[furniturePrice] > PlayerData[playerid][pMoney])
    {
    	SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Yeterli paran yok. Toplam: $%s", MoneyFormat(datafrom[furniturePrice]));
    	return 1;
    }

	if(Furniture_GetCount(PlayerData[playerid][pHouseFurniture]) >= Furniture_GetLimit(playerid))
	{
		SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Maksimum sat�n alabilece�in mobilya s�n�r�na ula�m��s�n. (%i adet)", Furniture_GetLimit(playerid));
		return 1;
	}

	new b = PlayerData[playerid][pBizFurniture], h = PlayerData[playerid][pHouseFurniture];

	new query[550];
	if(h != -1)
	{
		mysql_format(m_Handle, query, sizeof(query), "INSERT INTO furnitures (PropertyID, CategoryID, SubCategoryID, FurnitureID, FurniturePrice, FurnitureName, FurnitureX, FurnitureY, FurnitureZ, FurnitureRX, FurnitureRY, FurnitureRZ, FurnitureVW, FurnitureInt) VALUES (%i, %i, %i, %i, %i, '%e', %f, %f, %f, %f, %f, %f, %i, %i)",
			PropertyData[h][PropertyID],
			datafrom[ArrayID],
			datafrom[SubArrayID],
			datafrom[ObjectID],
			datafrom[furniturePrice],
			datafrom[furnitureName],
			datafrom[furnitureX],
			datafrom[furnitureY],
			datafrom[furnitureZ],
			datafrom[furnitureRX],
			datafrom[furnitureRY],
			datafrom[furnitureRZ],
			GetPlayerVirtualWorld(playerid),
			GetPlayerInterior(playerid)
		);
	}
	else if(b != -1)
	{
		mysql_format(m_Handle, query, sizeof(query), "INSERT INTO furnitures (BusinessID, CategoryID, SubCategoryID, FurnitureID, FurniturePrice, FurnitureName, FurnitureX, FurnitureY, FurnitureZ, FurnitureRX, FurnitureRY, FurnitureRZ, FurnitureVW, FurnitureInt) VALUES (%i, %i, %i, %i, %i, '%e', %f, %f, %f, %f, %f, %f, %i, %i)",
			BusinessData[b][BusinessID],
			datafrom[ArrayID],
			datafrom[SubArrayID],
			datafrom[ObjectID],
			datafrom[furniturePrice],
			datafrom[furnitureName],
			datafrom[furnitureX],
			datafrom[furnitureY],
			datafrom[furnitureZ],
			datafrom[furnitureRX],
			datafrom[furnitureRY],
			datafrom[furnitureRZ],
			GetPlayerVirtualWorld(playerid),
			GetPlayerInterior(playerid)
		);
	}

    new Cache: add = mysql_query(m_Handle, query), data[e_furniture];
    data[SQLID] = cache_insert_id();
   	data[TempObjectID] = CreateDynamicObject(datafrom[ObjectID], datafrom[furnitureX], datafrom[furnitureY], datafrom[furnitureZ], datafrom[furnitureRX], datafrom[furnitureRY], datafrom[furnitureRZ], GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
    data[ArrayID] = datafrom[ArrayID]; data[SubArrayID] = datafrom[SubArrayID]; data[ObjectID] = datafrom[ObjectID];

    if(datafrom[PropertyID] != -1)
    {
    	data[PropertyID] = datafrom[PropertyID];
    	EditingID[playerid] = datafrom[PropertyID];
    }
    else if(datafrom[BusinessID] != -1)
    {
    	data[BusinessID] = datafrom[BusinessID];
    	EditingID[playerid] = datafrom[BusinessID];
	}

	format(data[furnitureName], 64, datafrom[furnitureName]); data[furniturePrice] = datafrom[furniturePrice];
	data[furnitureX] = datafrom[furnitureX], data[furnitureY] = datafrom[furnitureY], data[furnitureZ] = datafrom[furnitureZ];
	data[furnitureRX] = datafrom[furnitureRX], data[furnitureRY] = datafrom[furnitureRY], data[furnitureRZ] = datafrom[furnitureRZ];
	cache_delete(add);

	new tid;
	for(new i; i < 5; i++)
	{
		if(datafrom[furnitureTexture][i] == -1)
   			continue;

		tid = datafrom[furnitureTexture][i];
		data[furnitureTexture][i] = datafrom[furnitureTexture][i];
		SetDynamicObjectMaterial(data[TempObjectID], i, ObjectTextures[tid][TModel], ObjectTextures[tid][TXDName], ObjectTextures[tid][TextureName], ObjectTextures[tid][MaterialColor]);
		mysql_format(m_Handle, query, sizeof(query), "UPDATE furnitures SET Texture_%i = %i WHERE id = %i", i+1, data[furnitureTexture][i], data[SQLID]);
		mysql_tquery(m_Handle, query);
	}

	if(IsHouseDoor(data[ObjectID]))
	{
		SendClientMessage(playerid, COLOR_SOFTPINK, "Bunu biliyor muydun?");
		SendClientMessage(playerid, COLOR_WHITE, "Sat�n alaca��n kap�y� {AFAFAF}/kapi ve /kilit {FFFFFF}komutlar�yla kontol edebilirsin.");
		data[furnitureLocked] = true, data[furnitureOpened] = false;
	}
	else if(IsHouseRefrigerator(data[ObjectID]))
	{
		SendClientMessage(playerid, COLOR_SOFTPINK, "Bunu biliyor muydun?");
		SendClientMessage(playerid, COLOR_WHITE, "Sat�n alaca��n buzdolab�n�n �n�nde {AFAFAF}/candoldur {FFFFFF}yazarak can�n� fulleyebilirsin.");
	}
	else if(IsHouseSafe(data[ObjectID]))
	{
		SendClientMessage(playerid, COLOR_SOFTPINK, "Bunu biliyor muydun?");
		SendClientMessage(playerid, COLOR_WHITE, "Sat�n alaca��n kasayla {AFAFAF}/ev paracek/parayatir {FFFFFF}komutlar�n� kullanabileceksin.");
	}

	Streamer_SetArrayData(STREAMER_TYPE_OBJECT, data[TempObjectID], E_STREAMER_EXTRA_ID, data);

	EditingObject[playerid] = 21;
	EditDynamicObject(playerid, data[TempObjectID]); SetPVarInt(playerid, "chose_slot", data[TempObjectID]);
	GiveMoney(playerid, -data[furniturePrice]);

    InfoTD_MSG(playerid, 1, 5000, "\
		\" ~y~SPACE ~w~\" ve \" ~y~MMB ~w~\" TUSLARINA BASARAK MOBILYAYI ONUNE DOGRU GETIREBILIRSIN.~n~\
		EGER MOBILYAYI BEGENMEDIYSEN \" ~r~ESC ~w~\" TUSUNA BASARAK IADE EDEBILIRSIN.");
	return 1;
}

Dialog:FURNITURE_LIST(playerid, response, listitem, inputtext[])
{
	if(!response) return cmd_mobilya(playerid, "");

	new page = GetPVarInt(playerid, "furniture_idx");
	if(!strcmp(inputtext, "<<")) return Furniture_List(playerid, page-1);
	if(!strcmp(inputtext, ">>")) return Furniture_List(playerid, page+1);

	if(!strcmp(inputtext, "*Se�erek Mobilya D�zenle*"))
	{
     	SendClientMessage(playerid, COLOR_WHITE, "D�zenlemek istedi�iniz mobilyay� se�iniz.");
     	SelectObject(playerid);
		return 1;
	}

	new data[e_furniture];
	for(new i, j = Streamer_GetUpperBound(STREAMER_TYPE_OBJECT); i < j; i ++)
	{
	    if(!IsValidDynamicObject(i)) continue;
	    if(!Streamer_IsInArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, FurnitureHolder[playerid][listitem][2])) continue;

		Streamer_GetArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, data);
		if(PlayerData[playerid][pHouseFurniture] != -1)
		{
			if(data[SQLID] == FurnitureHolder[playerid][listitem][0] && data[PropertyID] == FurnitureHolder[playerid][listitem][1])
			{
				SetPVarInt(playerid, "chose_slot", i);
				Furniture_Edit(playerid);
			    break;
			}
		}
		else if(PlayerData[playerid][pBizFurniture] != -1)
    	{
			if(data[SQLID] == FurnitureHolder[playerid][listitem][0] && data[BusinessID] == FurnitureHolder[playerid][listitem][1])
			{
				SetPVarInt(playerid, "chose_slot", i);
				Furniture_Edit(playerid);
			    break;
			}
    	}
    }
    return 1;
}

Dialog:FURNITURE_NO_LIST(playerid, response, listitem, inputtext[])
{
	cmd_mobilya(playerid, "");
	return 1;
}

Dialog:VEHICLE_DRUGS(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new vehicleid = INVALID_VEHICLE_ID;
        vehicleid = !IsPlayerInAnyVehicle(playerid) ? GetNearestVehicle(playerid) : GetPlayerVehicleID(playerid);
		if(vehicleid == INVALID_VEHICLE_ID) return SendServerMessage(playerid, "Yak�n�nda ara� yok.");

		if(!vehicle_drug_data[vehicleid][listitem+1][is_exist])
			return SendServerMessage(playerid, "Se�ti�iniz slot bo� g�z�k�yor.");

		new free_slot = Drug_GetPlayerNextSlot(playerid);
		if(free_slot == -1) return SendErrorMessage(playerid, "�st�nde daha fazla uyu�turucu bulunduramazs�n.");

		new drug_query[512];
		mysql_format(m_Handle, drug_query, sizeof(drug_query), "INSERT INTO player_drugs (player_dbid, drug_name, drug_type, drug_amount, drug_quality, drug_size) VALUES (%i, '%e', %i, %f, %i, %i)", PlayerData[playerid][pSQLID], vehicle_drug_data[vehicleid][listitem+1][veh_drug_name], vehicle_drug_data[vehicleid][listitem+1][veh_drug_id], vehicle_drug_data[vehicleid][listitem+1][veh_drug_amount], vehicle_drug_data[vehicleid][listitem+1][veh_drug_quality], vehicle_drug_data[vehicleid][listitem+1][veh_drug_size]);
		new Cache: cache = mysql_query(m_Handle, drug_query);

		player_drug_data[playerid][free_slot][data_id] = cache_insert_id();
		player_drug_data[playerid][free_slot][drug_id] = vehicle_drug_data[vehicleid][listitem+1][veh_drug_id];
		format(player_drug_data[playerid][free_slot][drug_name], 64, "%s", vehicle_drug_data[vehicleid][listitem+1][veh_drug_name]);
		player_drug_data[playerid][free_slot][drug_amount] = vehicle_drug_data[vehicleid][listitem+1][veh_drug_amount];
		player_drug_data[playerid][free_slot][drug_quality] = vehicle_drug_data[vehicleid][listitem+1][veh_drug_quality];
		player_drug_data[playerid][free_slot][drug_size] = vehicle_drug_data[vehicleid][listitem+1][veh_drug_size];
		player_drug_data[playerid][free_slot][is_exist] = true;

		cache_delete(cache);
		cmd_ame(playerid, sprintf("arac�n bagaj�ndan %s al�r.", Drug_GetName(vehicle_drug_data[vehicleid][listitem+1][veh_drug_id])));
        Drug_VehicleDefaultValues(vehicleid, listitem+1);
		return 1;
	}
	return 1;
}

Dialog:BONE_EDIT(playerid, response, listitem, inputtext[])
{
    if (response)
    {
        new weaponid = EditingDisplay[playerid];
        WeaponSettings[playerid][weaponid - 22][WeaponBone] = listitem + 1;

        new
            search_query[356];
        mysql_format(m_Handle, search_query, sizeof(search_query), "SELECT id FROM weapon_attachments WHERE WeaponID = %d AND playerdbid = %d", weaponid, PlayerData[playerid][pSQLID]);
        mysql_tquery(m_Handle, search_query, "CheckWeaponAttachements", "id", playerid, weaponid);
        SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}%s silah�n�n kemik b�lgesini de�i�tirdin.", ReturnWeaponName(weaponid));
	}

	EditingDisplay[playerid] = 0;
	return 1;
}

Dialog:VEHICLE_FINE_LIST(playerid, response, listitem, inputtext[])
{
	if(response)
	{

		new
			primary_str[800], sub_str[128], id;

		id = CheckingPlayerFine[playerid];

		format(sub_str, sizeof(sub_str), "Birlik:\t%s\n", FactionData[VehicleFines[id][listitem][fine_faction]][FactionName]);
		strcat(primary_str, sub_str);

		format(sub_str, sizeof(sub_str), "Cezay� Yiyen:\t%s\n", ReturnName(playerid, 0));
		strcat(primary_str, sub_str);

		format(sub_str, sizeof(sub_str), "Cezay� Kesen:\t%s\n\n", VehicleFines[id][listitem][fine_issuer]);
		strcat(primary_str, sub_str);

		format(sub_str, sizeof(sub_str), "Ceza Miktar�:\t$%s\n", MoneyFormat(VehicleFines[id][listitem][fine_amount]));
		strcat(primary_str, sub_str);

		format(sub_str, sizeof(sub_str), "Ceza Sebebi:\t%s\n", VehicleFines[id][listitem][fine_reason]);
		strcat(primary_str, sub_str);

		format(sub_str, sizeof(sub_str), "Ceza Tarihi:\t%s\n\n", GetFullTime(VehicleFines[id][listitem][fine_date]));
		strcat(primary_str, sub_str);

		strcat(primary_str, "Bu cezay� teslim ald�ktan sonra 72 saate\nkadar �demek zorundas�n�z.");

		Dialog_Show(playerid, FINE_PAY, DIALOG_STYLE_MSGBOX, "Ceza Detay�", primary_str, "�de", "Kapat");
		return 1;
	}
	return 1;
}

Dialog:FINE_LIST(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		if(!strcmp(inputtext, "** Cezay� silmek i�in t�kla."))
		{
			if(PlayerData[playerid][pFactionRank] > FactionData[PlayerData[playerid][pFaction]][FactionEditrank])
				return Dialog_Show(playerid, DIALOG_USE, DIALOG_STYLE_LIST, "Ceza Temizle:", "R�tben cezalar� temizlemek i�in yetersiz.", ">>", "<<");

			return Dialog_Show(playerid, FINE_DELETE, DIALOG_STYLE_INPUT, "Ceza Temizle:", "Cezan�n numaras�n� girerek temizleyebilirsin.", "Temizle", "Kapat");
		}

		new
			primary_str[800], sub_str[128], id;

		id = CheckingPlayerFine[playerid];

		format(sub_str, sizeof(sub_str), "Birlik:\t%s\n", FactionData[Fines[id][listitem][fine_faction]][FactionName]);
		strcat(primary_str, sub_str);

		format(sub_str, sizeof(sub_str), "Cezay� Yiyen:\t%s\n", ReturnName(playerid, 0));
		strcat(primary_str, sub_str);

		format(sub_str, sizeof(sub_str), "Cezay� Kesen:\t%s\n\n", Fines[id][listitem][fine_issuer]);
		strcat(primary_str, sub_str);

		format(sub_str, sizeof(sub_str), "Ceza Miktar�:\t$%s\n", MoneyFormat(Fines[id][listitem][fine_amount]));
		strcat(primary_str, sub_str);

		format(sub_str, sizeof(sub_str), "Ceza Sebebi:\t%s\n", Fines[id][listitem][fine_reason]);
		strcat(primary_str, sub_str);

		format(sub_str, sizeof(sub_str), "Ceza Tarihi:\t%s\n\n", GetFullTime(Fines[id][listitem][fine_date]));
		strcat(primary_str, sub_str);

		strcat(primary_str, "Bu cezay� teslim ald�ktan sonra 72 saate\nkadar �demek zorundas�n�z.");

		Dialog_Show(playerid, FINE_PAY, DIALOG_STYLE_MSGBOX, "Ceza Detay�", primary_str, "�de", "Kapat");
		return 1;
	}
	return 1;
}

Dialog:FINE_PAY(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		SendClientMessage(playerid, COLOR_ADM, "/cezaode komutu ile cezan� �deyebilirsin.");
	}
	return 1;
}

Dialog:GPS_STREET(playerid, response, listitem, inputtext[])
{
	if(!response) {
		return cmd_samaps(playerid, "");
	}

	new bool: found, id;
	foreach (new i : Streets)
	{
		if(strfind(StreetData[i][StreetName], inputtext, true) != -1)
		{
			found = true;
			id = i;
			break;
		}
	}

	if(!found) {
		ShowNavigatorSys(playerid, 0, "Hi� sonu� bulunamad�.");
		return 1;
	}

	SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}%s haritan�zda i�aretlendi.", StreetData[id][StreetName]);
	SetPlayerCheckpoint(playerid, StreetData[id][StreetX], StreetData[id][StreetY], 0.0, 5.0);
	return 1;
}

Dialog:GPS_PROPERTY_NO(playerid, response, listitem, inputtext[])
{
	if(!response) {
		return cmd_samaps(playerid, "");
	}

	if(!IsNumeric(inputtext)) {
		return ShowNavigatorSys(playerid, 1, "Girdi�in kap� numaras� say�sal bir de�er olmal�d�r.");
	}

	if(strval(inputtext) < 0 || strval(inputtext) > 10000) {
		return ShowNavigatorSys(playerid, 1, "Girdi�in kap� numaras� 0 ile 10000 aras�nda olmal�d�r.");
	}

	strcat(PropertyNameHolder[playerid], inputtext);
	Dialog_Show(playerid, GPS_PROPERTY_STREET, DIALOG_STYLE_INPUT, "SA Maps - Ev Bul", "Evin bulundu�u soka��n ad� nedir? (�rne�in: Ferndale Avenue)", "�leri", "Geri");
	return 1;
}

Dialog:GPS_PROPERTY_STREET(playerid, response, listitem, inputtext[])
{
	if(!response) {
		return cmd_samaps(playerid, "");
	}

	if(strlen(inputtext) < 1) {
		Dialog_Show(playerid, GPS_PROPERTY_STREET, DIALOG_STYLE_INPUT, "SA Maps - Ev Bul", "Evin bulundu�u soka��n ad� nedir? (�rne�in: Ferndale Avenue)", "�leri", "Geri");
		return 1;
	}

	format(PropertyNameHolder[playerid], 35, "%s %s", PropertyNameHolder[playerid], inputtext);

	new bool: found, id;
	foreach(new i : Properties)
	{
		if(strfind(PropertyData[i][PropertyAddress], PropertyNameHolder[playerid], true) != -1)
		{
			found = true;
			id = i;
			break;
		}
	}

	if(!found) {
		ShowNavigatorSys(playerid, 1, "Hi� sonu� bulunamad�.");
		return 1;
	}

	SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Ev haritan�zda i�aretlendi.");
	SetPlayerCheckpoint(playerid, PropertyData[id][PropertyEnter][0], PropertyData[id][PropertyEnter][1], PropertyData[id][PropertyEnter][2], 3.0);
	return 1;
}

Dialog:GPS_BUSINESS_LIST(playerid, response, listitem, inputtext[])
{
	if(!response)
	{
		return cmd_samaps(playerid, "");
	}

	new id;
	sscanf(inputtext, "i", id);
	SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}%s haritan�zda i�aretlendi.", BusinessData[id][BusinessName]);
	SetPlayerCheckpoint(playerid, BusinessData[id][EnterPos][0], BusinessData[id][EnterPos][1], BusinessData[id][EnterPos][2], 5.0);
	return 1;
}

Dialog:GPS_MAIN(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		ShowNavigatorSys(playerid, listitem);
		return 1;
	}
	return 1;
}

Dialog:CLOTHING_EDIT(playerid, response, listitem, inputtext[])
{
	if(!response) return cmd_aksesuar(playerid, "");

	new id = GetPVarInt(playerid, "ClothingID");
	switch(listitem)
	{
		case 0:
		{
			new primary[600];
			strcat(primary, "{FFFF00}Aksesuar�n�za �zel bir ad ekleme olana��n�z bulunuyor.\n");
			strcat(primary, "Bu �zellik, sahip olabilece�iniz bir �ok aksesuar� kolayca bulman�z� sa�lamak i�indir.\n\n");

			strcat(primary, "Aksesuar�n�z� g�r�nmesini istedi�iniz yeni ad�n� girin. Maksimum s�n�r 20 karakterdir.\n");
			strcat(primary, "Ayarlanm�� bir aksesuara sahipseniz, kald�rmak istiyorsan�z kutucu�u bo� b�rak�p ENTER tu�una bas�n.\n\n");

			strcat(primary, "{FF6347}[ ! ] UYARI: Bu �zelli�in k�t�ye kullan�lmas� cezaland�r�labilir. K�t�ye kullanma.\n");
			strcat(primary, "[ ! ] NOT: Bu aksesuar ad� sadece sizin taraf�n�zdan g�r�lebilir.");

			Dialog_Show(playerid, CLOTHING_NAME, DIALOG_STYLE_INPUT, "Aksesuar Ad�n� De�i�tir", primary, "Tamam", "<< Kapat");
		}
		case 1:
		{
			new
				primary[454], sub[60];

			for(new j = 1; j <= 18; j++)
			{
				format(sub, sizeof(sub), "%s %s\n", Clothing_Bone(j), ClothingData[playerid][id][ClothingBoneID] == j ? "({FFFF00}SE��L�{FFFFFF})" : "");
				strcat(primary, sub);
			}

			Dialog_Show(playerid, CLOTHING_BONE, DIALOG_STYLE_LIST, "Aksesuar Kemi�ini De�i�tir", primary, "Tamam", "<< Kapat");
		}
		case 2:
		{
			new
				primary[200], sub[45];

			for(new j = 0; j <= 4; j++)
			{
				format(sub, sizeof(sub), "Index %i %s\n", j, ClothingData[playerid][id][ClothingSlotID] == j ? "({FFFF00}SE��L�{FFFFFF})" : "");
				strcat(primary, sub);
			}

			Dialog_Show(playerid, CLOTHING_INDEX, DIALOG_STYLE_LIST, "Aksesuar Slotunu De�i�tir", primary, "Tamam", "<< Kapat");
		}
		/*case 3:
		{
			new primary[350];
			strcat(primary, "{FFFFFF}�stedi�iniz rengin onalt�l�k de�erini girin.\n");
			strcat(primary, "\"{FFFF00}https://www.color-hex.com/{FFFFFF}\" websitesinden de�erlere bakabilirsin.\n");
			strcat(primary, "-Bi�im �u �ekilde olmal�d�r. \"{FFFF00}FFFF00{FFFFFF}\" (t�rnaklar hari�)\n");
			strcat(primary, "-Rengi s�f�rlamak i�in s�f�r (0) girebilirsiniz.\n\n");
			strcat(primary, "{FF6347}[ ! ] Aksesuar�n�z�n birincil rengini de�i�tirme olana��n�z bulunuyor.");
			Dialog_Show(playerid, CLOTHING_MAINCOLOR, DIALOG_STYLE_INPUT, "Aksesuar Rengini De�i�tir", primary, "Tamam", "<< Kapat");
		}
		case 4:
		{
			new primary[350];
			strcat(primary, "{FFFFFF}�stedi�iniz rengin onalt�l�k de�erini girin.\n");
			strcat(primary, "\"{FFFF00}https://www.color-hex.com/{FFFFFF}\" websitesinden de�erlere bakabilirsin.\n");
			strcat(primary, "-Bi�im �u �ekilde olmal�d�r. \"{FFFF00}FFFF00{FFFFFF}\" (t�rnaklar hari�)\n");
			strcat(primary, "-Rengi s�f�rlamak i�in s�f�r (0) girebilirsiniz.\n\n");
			strcat(primary, "{FF6347}[ ! ] Aksesuar�n�z�n birincil rengini de�i�tirme olana��n�z bulunuyor.");
			Dialog_Show(playerid, CLOTHING_SECONDARYCOLOR, DIALOG_STYLE_INPUT, "Aksesuar �kincil Rengini De�i�tir", primary, "Tamam", "<< Kapat");
		}*/
		case 3:
		{
	        if(PlayerData[playerid][pEditingClothing]) return SendServerMessage(playerid, "Aksesuar d�zenlemeyi bitirdikten sonra yeni bir tanesini d�zenleyebilirsin.");

	        //new slot_id = Clothing_IsSlotFree(playerid, ClothingData[playerid][id][ClothingSlotID]);
			//if(slot_id == -1) return SendServerMessage(playerid, "Bu aksesuar� d�zenleyebilmek i�in ilk �nce ayn� slotta bulunan� �st�nden ��karman gerekiyor.");

	        new slot_id = ClothingData[playerid][id][ClothingSlotID];

			if(!IsPlayerAttachedObjectSlotUsed(playerid, slot_id))
			{
				SetPlayerAttachedObject(playerid, slot_id, ClothingData[playerid][id][ClothingModelID], ClothingData[playerid][id][ClothingBoneID], ClothingData[playerid][id][ClothingPos][0], ClothingData[playerid][id][ClothingPos][1], ClothingData[playerid][id][ClothingPos][2], ClothingData[playerid][id][ClothingRot][0], ClothingData[playerid][id][ClothingRot][1], ClothingData[playerid][id][ClothingRot][2], ClothingData[playerid][id][ClothingScale][0], ClothingData[playerid][id][ClothingScale][1], ClothingData[playerid][id][ClothingScale][2], ClothingData[playerid][id][ClothingColor], ClothingData[playerid][id][ClothingColor2]);
			}

			PlayerData[playerid][pEditingClothing] = true;
			EditAttachedObject(playerid, slot_id);
			return 1;
		}
		case 4:
		{
	        if(PlayerData[playerid][pEditingClothing]) return SendServerMessage(playerid, "Aksesuar d�zenlemeyi bitirdikten sonra sonra giyebilirsin.");

	        //new slot_id = Clothing_IsSlotFree(playerid, ClothingData[playerid][id][ClothingSlotID]);
			//if(slot_id == -1) return SendServerMessage(playerid, "Bu aksesuar� giyebilmek i�in ilk �nce ayn� slotta bulunan� �st�nden ��karman gerekiyor.");

	        new slot_id = ClothingData[playerid][id][ClothingSlotID];

			if(IsPlayerAttachedObjectSlotUsed(playerid, slot_id)) RemovePlayerAttachedObject(playerid, slot_id);
			else SetPlayerAttachedObject(playerid, slot_id, ClothingData[playerid][id][ClothingModelID], ClothingData[playerid][id][ClothingBoneID], ClothingData[playerid][id][ClothingPos][0], ClothingData[playerid][id][ClothingPos][1], ClothingData[playerid][id][ClothingPos][2], ClothingData[playerid][id][ClothingRot][0], ClothingData[playerid][id][ClothingRot][1], ClothingData[playerid][id][ClothingRot][2], ClothingData[playerid][id][ClothingScale][0], ClothingData[playerid][id][ClothingScale][1], ClothingData[playerid][id][ClothingScale][2], ClothingData[playerid][id][ClothingColor], ClothingData[playerid][id][ClothingColor2]);
			Clothing_Menu(playerid, id);
			return 1;
		}
    case 5:
    {
        if(PlayerData[playerid][pEditingClothing])
          return SendServerMessage(playerid, "Aksesuar d�zenlemeyi bitirdikten sonra bu se�ene�i a��p/kapatabilirsin.");

        new query[354];
        if(ClothingData[playerid][id][ClothingAutoWear] == false)
        {
          ClothingData[playerid][id][ClothingAutoWear] = true;

          mysql_format(m_Handle, query, sizeof(query), "UPDATE player_clothing SET auto_wear = %d WHERE id = %i", 1, ClothingData[playerid][id][ClothingID]);
          mysql_tquery(m_Handle, query);
        }
        else
        {
          ClothingData[playerid][id][ClothingAutoWear] = false;
          mysql_format(m_Handle, query, sizeof(query), "UPDATE player_clothing SET auto_wear = %d WHERE id = %i", 0, ClothingData[playerid][id][ClothingID]);
          mysql_tquery(m_Handle, query);
        }
        Clothing_Menu(playerid, id);
        return 1;
    }
    case 6:
    {
        if(PlayerData[playerid][pEditingClothing])
          return SendServerMessage(playerid, "Aksesuar d�zenlemeyi bitirdikten sonra bu se�ene�i a��p/kapatabilirsin.");

        format(PlayerData[playerid][pClothingName], 32, "%s", Clothing_GetNameFromModelID(ClothingData[playerid][id][ClothingModelID]));
        Clothing_Create(playerid, ClothingData[playerid][id][ClothingSlotID], ClothingData[playerid][id][ClothingModelID], ClothingData[playerid][id][ClothingBoneID], ClothingData[playerid][id][ClothingPos][0], ClothingData[playerid][id][ClothingPos][1], ClothingData[playerid][id][ClothingPos][2], ClothingData[playerid][id][ClothingRot][0], ClothingData[playerid][id][ClothingRot][1], ClothingData[playerid][id][ClothingRot][2], ClothingData[playerid][id][ClothingScale][0], ClothingData[playerid][id][ClothingScale][1], ClothingData[playerid][id][ClothingScale][2]);
        return 1;
    }
    case 7:
    {
        if(PlayerData[playerid][pEditingClothing])
          return SendServerMessage(playerid, "Aksesuar d�zenlemeyi bitirdikten sonra bu se�ene�i a��p/kapatabilirsin.");

        Dialog_Show(playerid, CLOTHING_CHANGEPOSITION, DIALOG_STYLE_LIST, "{D2D2D2}Hangisini de�i�tirmek istersiniz?", "{A9C4E4}1\tPozisyon\n{A9C4E4}2\tRotasyon\n{A9C4E4}3\tBoyutland�rma", "Se�", "<< Kapat");
        return 1;
    }
	}
    return 1;
}

Dialog:CLOTHING_CHANGEPOSITION(playerid, response, listitem, inputtext[])
{
	if(!response) {
		Clothing_Menu(playerid, GetPVarInt(playerid, "ClothingID"));
		return 1;
	}

  new id = GetPVarInt(playerid, "ClothingID");
  new primary[600];
	switch (listitem)
  {
    case 0: // pozisyon
    {
      new title[32];
      strcat(primary, "{FFFFFF}Se�ilen aksesuar�n {FF6347}pozisyonunu {FFFFFF}ayarl�yorsunuz.\n\n");
      strcat(primary, "{FFFFFF}Yeni pozisyonlar� XYZ format�nda girmelisin.\n");
      strcat(primary, "{FFFFFF}�rne�in: 1.0 2.0 3.0, (normal bo�luklarla)\n");
      format(title, sizeof(title), "%s", ClothingData[playerid][id][ClothingName]);

      Dialog_Show(playerid, CLOTHING_CP_POS, DIALOG_STYLE_INPUT, title, primary, "Tamam", "<< Geri");
    }
    case 1: // rotasyon
    {
      new title[32];
      strcat(primary, "{FFFFFF}Se�ilen aksesuar�n {FF6347}rotasyonunu {FFFFFF}ayarl�yorsunuz.\n\n");
      strcat(primary, "{FFFFFF}Yeni pozisyonlar� XYZ format�nda girmelisin.\n");
      strcat(primary, "{FFFFFF}�rne�in: 1.0 2.0 3.0, (normal bo�luklarla)\n");
      format(title, sizeof(title), "%s", ClothingData[playerid][id][ClothingName]);

      Dialog_Show(playerid, CLOTHING_CP_ROT, DIALOG_STYLE_INPUT, title, primary, "Tamam", "<< Geri");
    }
    case 2: // boyut
    {
      new title[32];
      strcat(primary, "{FFFFFF}Se�ilen aksesuar�n {FF6347}boyutunu {FFFFFF}ayarl�yorsunuz.\n\n");
      strcat(primary, "{FFFFFF}Yeni pozisyonlar� XYZ format�nda girmelisin.\n");
      strcat(primary, "{FFFFFF}�rne�in: 1.0 2.0 3.0, (normal bo�luklarla)\n");
      format(title, sizeof(title), "%s", ClothingData[playerid][id][ClothingName]);

      Dialog_Show(playerid, CLOTHING_CP_SCALE, DIALOG_STYLE_INPUT, title, primary, "Tamam", "<< Geri");
    }
  }
	//Clothing_Save(playerid, id), Clothing_Menu(playerid, id);
  return 1;
}

Dialog:CLOTHING_CP_POS(playerid, response, listitem, inputtext[])
{
	if(!response) {
    Dialog_Show(playerid, CLOTHING_CHANGEPOSITION, DIALOG_STYLE_LIST, "{D2D2D2}Hangisini de�i�tirmek istersiniz?", "{A9C4E4}1\tPozisyon\n{A9C4E4}2\tRotasyon\n{A9C4E4}3\tBoyutland�rma", "Se�", "<< Kapat");
		return 1;
	}

  new id = GetPVarInt(playerid, "ClothingID");
  new Float:iPos[3];

  sscanf(inputtext, "fff", iPos[0],iPos[1],iPos[2]);

  ClothingData[playerid][id][ClothingPos][0] = iPos[0];
  ClothingData[playerid][id][ClothingPos][1] = iPos[1];
  ClothingData[playerid][id][ClothingPos][2] = iPos[2];

  SendMessage(playerid, "{FF6347}X: {FFFFFF}%2.f, {FF6347}Y: {FFFFFF}%2.f, {FF6347}Z: {FFFFFF}%2.f", iPos[0],iPos[1],iPos[2]);
  SendMessage(playerid, "{FF6347}%s {FFFFFF}adl� aksesuar�n {FF6347}pozisyon {FFFFFF}de�erleri g�ncellendi.", ClothingData[playerid][id][ClothingName]);
	Clothing_Save(playerid, id), Dialog_Show(playerid, CLOTHING_CHANGEPOSITION, DIALOG_STYLE_LIST, "{D2D2D2}Hangisini de�i�tirmek istersiniz?", "{A9C4E4}1\tPozisyon\n{A9C4E4}2\tRotasyon\n{A9C4E4}3\tBoyutland�rma", "Se�", "<< Kapat");

  new slot_id = ClothingData[playerid][id][ClothingSlotID];
  if(IsPlayerAttachedObjectSlotUsed(playerid, slot_id))
  {
     RemovePlayerAttachedObject(playerid, slot_id);
     SetPlayerAttachedObject(playerid, slot_id, ClothingData[playerid][id][ClothingModelID], ClothingData[playerid][id][ClothingBoneID], ClothingData[playerid][id][ClothingPos][0], ClothingData[playerid][id][ClothingPos][1], ClothingData[playerid][id][ClothingPos][2], ClothingData[playerid][id][ClothingRot][0], ClothingData[playerid][id][ClothingRot][1], ClothingData[playerid][id][ClothingRot][2], ClothingData[playerid][id][ClothingScale][0], ClothingData[playerid][id][ClothingScale][1], ClothingData[playerid][id][ClothingScale][2], ClothingData[playerid][id][ClothingColor], ClothingData[playerid][id][ClothingColor2]);
  }
  return 1;
}

Dialog:CLOTHING_CP_ROT(playerid, response, listitem, inputtext[])
{
	if(!response) {
    Dialog_Show(playerid, CLOTHING_CHANGEPOSITION, DIALOG_STYLE_LIST, "{D2D2D2}Hangisini de�i�tirmek istersiniz?", "{A9C4E4}1\tPozisyon\n{A9C4E4}2\tRotasyon\n{A9C4E4}3\tBoyutland�rma", "Se�", "<< Kapat");
		return 1;
	}

  new id = GetPVarInt(playerid, "ClothingID");
  new Float:iPos[3];

  sscanf(inputtext, "fff", iPos[0],iPos[1],iPos[2]);

  ClothingData[playerid][id][ClothingRot][0] = iPos[0];
  ClothingData[playerid][id][ClothingRot][1] = iPos[1];
  ClothingData[playerid][id][ClothingRot][2] = iPos[2];

  SendMessage(playerid, "{FF6347}X: {FFFFFF}%2.f, {FF6347}Y: {FFFFFF}%2.f, {FF6347}Z: {FFFFFF}%2.f", iPos[0],iPos[1],iPos[2]);
  SendMessage(playerid, "{FF6347}%s {FFFFFF}adl� aksesuar�n {FF6347}rotasyon {FFFFFF}de�erleri g�ncellendi.", ClothingData[playerid][id][ClothingName]);
	Clothing_Save(playerid, id), Dialog_Show(playerid, CLOTHING_CHANGEPOSITION, DIALOG_STYLE_LIST, "{D2D2D2}Hangisini de�i�tirmek istersiniz?", "{A9C4E4}1\tPozisyon\n{A9C4E4}2\tRotasyon\n{A9C4E4}3\tBoyutland�rma", "Se�", "<< Kapat");

  new slot_id = ClothingData[playerid][id][ClothingSlotID];
  if(IsPlayerAttachedObjectSlotUsed(playerid, slot_id))
  {
     RemovePlayerAttachedObject(playerid, slot_id);
     SetPlayerAttachedObject(playerid, slot_id, ClothingData[playerid][id][ClothingModelID], ClothingData[playerid][id][ClothingBoneID], ClothingData[playerid][id][ClothingPos][0], ClothingData[playerid][id][ClothingPos][1], ClothingData[playerid][id][ClothingPos][2], ClothingData[playerid][id][ClothingRot][0], ClothingData[playerid][id][ClothingRot][1], ClothingData[playerid][id][ClothingRot][2], ClothingData[playerid][id][ClothingScale][0], ClothingData[playerid][id][ClothingScale][1], ClothingData[playerid][id][ClothingScale][2], ClothingData[playerid][id][ClothingColor], ClothingData[playerid][id][ClothingColor2]);
  }
  return 1;
}

Dialog:CLOTHING_CP_SCALE(playerid, response, listitem, inputtext[])
{
	if(!response) {
    Dialog_Show(playerid, CLOTHING_CHANGEPOSITION, DIALOG_STYLE_LIST, "{D2D2D2}Hangisini de�i�tirmek istersiniz?", "{A9C4E4}1\tPozisyon\n{A9C4E4}2\tRotasyon\n{A9C4E4}3\tBoyutland�rma", "Se�", "<< Kapat");
		return 1;
	}

  new id = GetPVarInt(playerid, "ClothingID");
  new Float:iPos[3];

  sscanf(inputtext, "fff", iPos[0],iPos[1],iPos[2]);

  ClothingData[playerid][id][ClothingScale][0] = iPos[0];
  ClothingData[playerid][id][ClothingScale][1] = iPos[1];
  ClothingData[playerid][id][ClothingScale][2] = iPos[2];

  SendMessage(playerid, "{FF6347}X: {FFFFFF}%2.f, {FF6347}Y: {FFFFFF}%2.f, {FF6347}Z: {FFFFFF}%2.f", iPos[0],iPos[1],iPos[2]);
  SendMessage(playerid, "{FF6347}%s {FFFFFF}adl� aksesuar�n {FF6347}b�y�kl�k {FFFFFF}de�erleri g�ncellendi.", ClothingData[playerid][id][ClothingName]);
	Clothing_Save(playerid, id), Dialog_Show(playerid, CLOTHING_CHANGEPOSITION, DIALOG_STYLE_LIST, "{D2D2D2}Hangisini de�i�tirmek istersiniz?", "{A9C4E4}1\tPozisyon\n{A9C4E4}2\tRotasyon\n{A9C4E4}3\tBoyutland�rma", "Se�", "<< Kapat");

  new slot_id = ClothingData[playerid][id][ClothingSlotID];
  if(IsPlayerAttachedObjectSlotUsed(playerid, slot_id))
  {
     RemovePlayerAttachedObject(playerid, slot_id);
     SetPlayerAttachedObject(playerid, slot_id, ClothingData[playerid][id][ClothingModelID], ClothingData[playerid][id][ClothingBoneID], ClothingData[playerid][id][ClothingPos][0], ClothingData[playerid][id][ClothingPos][1], ClothingData[playerid][id][ClothingPos][2], ClothingData[playerid][id][ClothingRot][0], ClothingData[playerid][id][ClothingRot][1], ClothingData[playerid][id][ClothingRot][2], ClothingData[playerid][id][ClothingScale][0], ClothingData[playerid][id][ClothingScale][1], ClothingData[playerid][id][ClothingScale][2], ClothingData[playerid][id][ClothingColor], ClothingData[playerid][id][ClothingColor2]);
  }
  return 1;
}

Dialog:CLOTHING_NAME(playerid, response, listitem, inputtext[])
{
	if(!response) {
		Clothing_Menu(playerid, GetPVarInt(playerid, "ClothingID"));
		return 1;
	}

	if(strlen(inputtext) < 1 || strlen(inputtext) > 20) {
		SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}Aksesuar ad� maksimum 20 karakter olabilir.");
		Clothing_Menu(playerid, GetPVarInt(playerid, "ClothingID"));
		return 1;
	}

	new id = GetPVarInt(playerid, "ClothingID");

	SendClientMessageEx(playerid, COLOR_WHITE, "{FFFF00}%s {FFFFFF}adl� aksesuar�n yeni ad�n� {FFFF00}%s {FFFFFF}olarak de�i�tirdiniz.", ClothingData[playerid][id][ClothingName], inputtext);
	format(ClothingData[playerid][id][ClothingName], 32, "%s", inputtext);

	Clothing_Save(playerid, id), Clothing_Menu(playerid, id);
    return 1;
}

Dialog:CLOTHING_BONE(playerid, response, listitem, inputtext[])
{
	new id = GetPVarInt(playerid, "ClothingID");

	if(!response) {
		Clothing_Menu(playerid, id);
		return 1;
	}

	SendClientMessageEx(playerid, COLOR_WHITE, "{FFFF00}%s {FFFFFF}adl� aksesuar�n yeni kemi�ini {FFFF00}%s {FFFFFF}olarak ayarlad�n.", ClothingData[playerid][id][ClothingName], Clothing_Bone(listitem+1));
	ClothingData[playerid][id][ClothingBoneID] = listitem+1;

	Clothing_Save(playerid, id), Clothing_Menu(playerid, id);
	return 1;
}

Dialog:CLOTHING_INDEX(playerid, response, listitem, inputtext[])
{
	new id = GetPVarInt(playerid, "ClothingID");

	if(!response) {
		Clothing_Menu(playerid, id);
		return 1;
	}

	SendClientMessageEx(playerid, COLOR_WHITE, "{FFFF00}%s {FFFFFF}adl� aksesuar�n yeni slotunu {FFFF00}%i {FFFFFF}olarak ayarlad�n.", ClothingData[playerid][id][ClothingName], listitem);
	ClothingData[playerid][id][ClothingSlotID] = listitem;

	Clothing_Save(playerid, id), Clothing_Menu(playerid, id);
	return 1;
}

Dialog:CLOTHING_MAINCOLOR(playerid, response, listitem, inputtext[])
{
	new id = GetPVarInt(playerid, "ClothingID");

	if(!response) {
		Clothing_Menu(playerid, id);
		return 1;
	}

	if(!strcmp(inputtext, "0"))
	{
		ClothingData[playerid][id][ClothingColor] = 0xFFFFFFFF;
		SendClientMessageEx(playerid, COLOR_WHITE, "{FFFF00}%s {FFFFFF}adl� aksesuar�n birincil rengini s�f�rlad�n.", ClothingData[playerid][id][ClothingName]);

		new slot_id = ClothingData[playerid][id][ClothingSlotID];
		if(IsPlayerAttachedObjectSlotUsed(playerid, slot_id)) {
			RemovePlayerAttachedObject(playerid, slot_id);
			SetPlayerAttachedObject(playerid, slot_id, ClothingData[playerid][id][ClothingModelID], ClothingData[playerid][id][ClothingBoneID], ClothingData[playerid][id][ClothingPos][0], ClothingData[playerid][id][ClothingPos][1], ClothingData[playerid][id][ClothingPos][2], ClothingData[playerid][id][ClothingRot][0], ClothingData[playerid][id][ClothingRot][1], ClothingData[playerid][id][ClothingRot][2], ClothingData[playerid][id][ClothingScale][0], ClothingData[playerid][id][ClothingScale][1], ClothingData[playerid][id][ClothingScale][2], ClothingData[playerid][id][ClothingColor], ClothingData[playerid][id][ClothingColor2]);
		}

		Clothing_Save(playerid, id), Clothing_Menu(playerid, id);
		return 1;
	}

	if(strlen(inputtext) != 6) {
		SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}Hatal� renk kodu girdin. (�rnek: FFFF00)");
		Clothing_Menu(playerid, id);
		return 1;
	}

	if(sscanf(inputtext, "x", ClothingData[playerid][id][ClothingColor])) {
		SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}Hatal� renk kodu girdin. (�rnek: FFFF00)");
		Clothing_Menu(playerid, id);
		return 1;
	}

	ClothingData[playerid][id][ClothingColor] = ((ClothingData[playerid][id][ClothingColor] << 8) | 0xFF);
	SendClientMessageEx(playerid, COLOR_WHITE, "{FFFF00}%s {FFFFFF}adl� aksesuar�n birincil rengini {%s}%s {FFFFFF}olarak ayarlad�n.", ClothingData[playerid][id][ClothingName], inputtext, inputtext);

	new slot_id = ClothingData[playerid][id][ClothingSlotID];
	if(IsPlayerAttachedObjectSlotUsed(playerid, slot_id)) {
		RemovePlayerAttachedObject(playerid, slot_id);
		SetPlayerAttachedObject(playerid, slot_id, ClothingData[playerid][id][ClothingModelID], ClothingData[playerid][id][ClothingBoneID], ClothingData[playerid][id][ClothingPos][0], ClothingData[playerid][id][ClothingPos][1], ClothingData[playerid][id][ClothingPos][2], ClothingData[playerid][id][ClothingRot][0], ClothingData[playerid][id][ClothingRot][1], ClothingData[playerid][id][ClothingRot][2], ClothingData[playerid][id][ClothingScale][0], ClothingData[playerid][id][ClothingScale][1], ClothingData[playerid][id][ClothingScale][2], ClothingData[playerid][id][ClothingColor], ClothingData[playerid][id][ClothingColor2]);
	}

	Clothing_Save(playerid, id), Clothing_Menu(playerid, id);
	return 1;
}

Dialog:CLOTHING_SECONDARYCOLOR(playerid, response, listitem, inputtext[])
{
	new id = GetPVarInt(playerid, "ClothingID");

	if(!response) {
		Clothing_Menu(playerid, id);
		return 1;
	}

	if(!strcmp(inputtext, "0"))
	{
		ClothingData[playerid][id][ClothingColor2] = 0xFFFFFFFF;
		SendClientMessageEx(playerid, COLOR_WHITE, "{FFFF00}%s {FFFFFF}adl� aksesuar�n ikincil rengini s�f�rlad�n.", ClothingData[playerid][id][ClothingName]);

		new slot_id = ClothingData[playerid][id][ClothingSlotID];
		if(IsPlayerAttachedObjectSlotUsed(playerid, slot_id)) {
			RemovePlayerAttachedObject(playerid, slot_id);
			SetPlayerAttachedObject(playerid, slot_id, ClothingData[playerid][id][ClothingModelID], ClothingData[playerid][id][ClothingBoneID], ClothingData[playerid][id][ClothingPos][0], ClothingData[playerid][id][ClothingPos][1], ClothingData[playerid][id][ClothingPos][2], ClothingData[playerid][id][ClothingRot][0], ClothingData[playerid][id][ClothingRot][1], ClothingData[playerid][id][ClothingRot][2], ClothingData[playerid][id][ClothingScale][0], ClothingData[playerid][id][ClothingScale][1], ClothingData[playerid][id][ClothingScale][2], ClothingData[playerid][id][ClothingColor], ClothingData[playerid][id][ClothingColor2]);
		}

		Clothing_Save(playerid, id), Clothing_Menu(playerid, id);
		return 1;
	}

	if(strlen(inputtext) != 6) {
		SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}Hatal� renk kodu girdin. (�rnek: FFFF00)");
		Clothing_Menu(playerid, id);
		return 1;
	}

	if(sscanf(inputtext, "x", ClothingData[playerid][id][ClothingColor2])) {
		SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}Hatal� renk kodu girdin. (�rnek: FFFF00)");
		Clothing_Menu(playerid, id);
		return 1;
	}

	ClothingData[playerid][id][ClothingColor2] = ((ClothingData[playerid][id][ClothingColor2] << 8) | 0xFF);
	SendClientMessageEx(playerid, COLOR_WHITE, "{FFFF00}%s {FFFFFF}adl� aksesuar�n ikincil rengini {%s}%s {FFFFFF}olarak ayarlad�n.", ClothingData[playerid][id][ClothingName], inputtext, inputtext);

	new slot_id = ClothingData[playerid][id][ClothingSlotID];
	if(IsPlayerAttachedObjectSlotUsed(playerid, slot_id)) {
		RemovePlayerAttachedObject(playerid, slot_id);
		SetPlayerAttachedObject(playerid, slot_id, ClothingData[playerid][id][ClothingModelID], ClothingData[playerid][id][ClothingBoneID], ClothingData[playerid][id][ClothingPos][0], ClothingData[playerid][id][ClothingPos][1], ClothingData[playerid][id][ClothingPos][2], ClothingData[playerid][id][ClothingRot][0], ClothingData[playerid][id][ClothingRot][1], ClothingData[playerid][id][ClothingRot][2], ClothingData[playerid][id][ClothingScale][0], ClothingData[playerid][id][ClothingScale][1], ClothingData[playerid][id][ClothingScale][2], ClothingData[playerid][id][ClothingColor], ClothingData[playerid][id][ClothingColor2]);
	}

	Clothing_Save(playerid, id), Clothing_Menu(playerid, id);
	return 1;
}

Dialog:ACCESSORY_LIST(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new type = GetPVarInt(playerid, "clothing_type");

		if(!strcmp(inputtext, "�nceki Sayfa <<")) return Clothing_List(playerid, type);
		if(!strcmp(inputtext, "Sonraki Sayfa >>")) return Clothing_List(playerid, type);

	    new id;
		if(!sscanf(inputtext, "i", id))
		{
			new clothing_id = FreeAttachmentSlot(playerid);

			SendClientMessage(playerid, COLOR_WHITE, "�PUCU: {FFFF00}SPACE{FFFFFF} basarak bak�nabilirsin. �ptal etmek i�in {FFFF00}ESC{FFFFFF} basabilirsin.");
			SetPlayerAttachedObject(playerid, clothing_id, Clothing_GetModel(id), 2);
			EditAttachedObject(playerid, clothing_id);
			// was -1

			format(PlayerData[playerid][pClothingName], 32, "%s", Clothing_GetName(id));
			PlayerData[playerid][pClothingPrice] = Clothing_GetPrice(id);
			PlayerData[playerid][pBuyingClothing] = true;
		}
	}
    return 1;
}

Dialog:FACTION_LIST(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new page = GetPVarInt(playerid, "Faction_idx");
		if(!strcmp(inputtext, "�nceki Sayfa <<")) return Faction_List(playerid, page-1);
		if(!strcmp(inputtext, "Sonraki Sayfa >>")) return Faction_List(playerid, page+1);
		return 1;
	}
    return 1;
}

Dialog:Faction_MEMBER_LIST(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new page = GetPVarInt(playerid, "Faction_member_idx");
		if(!strcmp(inputtext, "�nceki Sayfa <<")) return Faction_Member_List(playerid, page-1);
		if(!strcmp(inputtext, "Sonraki Sayfa >>")) return Faction_Member_List(playerid, page+1);
		return 1;
	}
    return 1;
}

Dialog:WEAPON_CHANGEPOSITION(playerid, response, listitem, inputtext[])
{
	if(!response) {
		return 1;
	}
  new gid = GetPVarInt(playerid, "weaponLastWeapon");

  new primary[600];
	switch (listitem)
  {
    case 0: // pozisyon
    {
      new title[32];
      strcat(primary, "{FFFFFF}Se�ilen silah�n aksesuar olarak {FF6347}pozisyonunu {FFFFFF}ayarl�yorsunuz.\n\n");
      strcat(primary, "{FFFFFF}Yeni pozisyonlar� XYZ format�nda girmelisin.\n");
      strcat(primary, "{FFFFFF}�rne�in: 1.0 2.0 3.0, (normal bo�luklarla)\n");
      format(title, sizeof(title), "%s", ReturnWeaponName(gid));

      Dialog_Show(playerid, WEAPON_CP_POS, DIALOG_STYLE_INPUT, title, primary, "Tamam", "<< Geri");
    }
    case 1: // rotasyon
    {
      new title[32];
      strcat(primary, "{FFFFFF}Se�ilen silah�n aksesuar olarak{FF6347}rotasyonunu {FFFFFF}ayarl�yorsunuz.\n\n");
      strcat(primary, "{FFFFFF}Yeni pozisyonlar� XYZ format�nda girmelisin.\n");
      strcat(primary, "{FFFFFF}�rne�in: 1.0 2.0 3.0, (normal bo�luklarla)\n");
      format(title, sizeof(title), "%s", ReturnWeaponName(gid));

      Dialog_Show(playerid, WEAPON_CP_ROT, DIALOG_STYLE_INPUT, title, primary, "Tamam", "<< Geri");
    }
  }
  return 1;
}

Dialog:WEAPON_CP_POS(playerid, response, listitem, inputtext[])
{
	if(!response) {
    Dialog_Show(playerid, WEAPON_CHANGEPOSITION, DIALOG_STYLE_LIST, "{D2D2D2}Hangisini de�i�tirmek istersiniz?", "{A9C4E4}1\tPozisyon\n{A9C4E4}2\tRotasyon", "Se�", "<< Kapat");
		return 1;
	}

  new index = GetPVarInt(playerid, "weaponLastIndex");
  new gid = GetPVarInt(playerid, "weaponLastWeapon");
  new Float:iPos[3];

  sscanf(inputtext, "fff", iPos[0],iPos[1],iPos[2]);

  WeaponSettings[playerid][index][WeaponPos][0] = iPos[0];
  WeaponSettings[playerid][index][WeaponPos][1] = iPos[1];
  WeaponSettings[playerid][index][WeaponPos][2] = iPos[2];

  RemovePlayerAttachedObject(playerid, GetWeaponObjectSlot(gid));
  SetPlayerAttachedObject(playerid, GetWeaponObjectSlot(gid), ReturnWeaponsModel(gid), WeaponSettings[playerid][index][WeaponBone], WeaponSettings[playerid][index][WeaponPos][0], WeaponSettings[playerid][index][WeaponPos][1], WeaponSettings[playerid][index][WeaponPos][2], WeaponSettings[playerid][index][WeaponPos][3], WeaponSettings[playerid][index][WeaponPos][4], WeaponSettings[playerid][index][WeaponPos][5], 1.0, 1.0, 1.0);

  SendMessage(playerid, "{FF6347}X: {FFFFFF}%2.f, {FF6347}Y: {FFFFFF}%2.f, {FF6347}Z: {FFFFFF}%2.f", iPos[0],iPos[1],iPos[2]);
  SendMessage(playerid, "{FF6347}%s {FFFFFF}adl� silah�n aksesuar olarak {FF6347}pozisyon {FFFFFF}de�erleri g�ncellendi.", ReturnWeaponName(gid));


  new query[546];


  mysql_format(m_Handle, query, sizeof(query), "INSERT INTO weapon_attachments (playerdbid, WeaponID, BoneID, PosX, PosY, PosZ, RotX, RotY, RotZ) VALUES (%i, %i, %i, %.3f, %.3f, %.3f, %.3f, %.3f, %.3f) ON DUPLICATE KEY UPDATE PosX = VALUES(PosX), PosY = VALUES(PosY), PosZ = VALUES(PosZ), RotX = VALUES(RotX), RotY = VALUES(RotY), RotZ = VALUES(RotZ)", PlayerData[playerid][pSQLID], gid, WeaponSettings[playerid][index][WeaponBone], WeaponSettings[playerid][index][WeaponPos][0], WeaponSettings[playerid][index][WeaponPos][1], WeaponSettings[playerid][index][WeaponPos][2], WeaponSettings[playerid][index][WeaponPos][3], WeaponSettings[playerid][index][WeaponPos][4], WeaponSettings[playerid][index][WeaponPos][5]);
  mysql_tquery(m_Handle, query);

	Dialog_Show(playerid, WEAPON_CHANGEPOSITION, DIALOG_STYLE_LIST, "{D2D2D2}Hangisini de�i�tirmek istersiniz?", "{A9C4E4}1\tPozisyon\n{A9C4E4}2\tRotasyon", "Se�", "<< Kapat");
  return 1;
}

Dialog:WEAPON_CP_ROT(playerid, response, listitem, inputtext[])
{
	if(!response) {
    Dialog_Show(playerid, WEAPON_CHANGEPOSITION, DIALOG_STYLE_LIST, "{D2D2D2}Hangisini de�i�tirmek istersiniz?", "{A9C4E4}1\tPozisyon\n{A9C4E4}2\tRotasyon", "Se�", "<< Kapat");
		return 1;
	}

  new index = GetPVarInt(playerid, "weaponLastIndex");
  new gid = GetPVarInt(playerid, "weaponLastWeapon");
  new Float:iPos[3];

  sscanf(inputtext, "fff", iPos[0],iPos[1],iPos[2]);

  WeaponSettings[playerid][index][WeaponPos][3] = iPos[0];
  WeaponSettings[playerid][index][WeaponPos][4] = iPos[1];
  WeaponSettings[playerid][index][WeaponPos][5] = iPos[2];

  RemovePlayerAttachedObject(playerid, GetWeaponObjectSlot(gid));
  SetPlayerAttachedObject(playerid, GetWeaponObjectSlot(gid), ReturnWeaponsModel(gid), WeaponSettings[playerid][index][WeaponBone], WeaponSettings[playerid][index][WeaponPos][0], WeaponSettings[playerid][index][WeaponPos][1], WeaponSettings[playerid][index][WeaponPos][2], WeaponSettings[playerid][index][WeaponPos][3], WeaponSettings[playerid][index][WeaponPos][4], WeaponSettings[playerid][index][WeaponPos][5], 1.0, 1.0, 1.0);

  SendMessage(playerid, "{FF6347}X: {FFFFFF}%2.f, {FF6347}Y: {FFFFFF}%2.f, {FF6347}Z: {FFFFFF}%2.f", iPos[0],iPos[1],iPos[2]);
  SendMessage(playerid, "{FF6347}%s {FFFFFF}adl� silah�n aksesuar olarak {FF6347}rotasyon {FFFFFF}de�erleri g�ncellendi.", ReturnWeaponName(gid));

  new query[546];
  mysql_format(m_Handle, query, sizeof(query), "INSERT INTO weapon_attachments (playerdbid, WeaponID, BoneID, PosX, PosY, PosZ, RotX, RotY, RotZ) VALUES (%i, %i, %i, %.3f, %.3f, %.3f, %.3f, %.3f, %.3f) ON DUPLICATE KEY UPDATE PosX = VALUES(PosX), PosY = VALUES(PosY), PosZ = VALUES(PosZ), RotX = VALUES(RotX), RotY = VALUES(RotY), RotZ = VALUES(RotZ)", PlayerData[playerid][pSQLID], gid, WeaponSettings[playerid][index][WeaponBone], WeaponSettings[playerid][index][WeaponPos][0], WeaponSettings[playerid][index][WeaponPos][1], WeaponSettings[playerid][index][WeaponPos][2], WeaponSettings[playerid][index][WeaponPos][3], WeaponSettings[playerid][index][WeaponPos][4], WeaponSettings[playerid][index][WeaponPos][5]);
  mysql_tquery(m_Handle, query);
	Dialog_Show(playerid, WEAPON_CHANGEPOSITION, DIALOG_STYLE_LIST, "{D2D2D2}Hangisini de�i�tirmek istersiniz?", "{A9C4E4}1\tPozisyon\n{A9C4E4}2\tRotasyon", "Se�", "<< Kapat");
  return 1;
}

Dialog:UNIFORM_LIST(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new page = GetPVarInt(playerid, "faction_uniform_idx");
		if(!strcmp(inputtext, "�nceki Sayfa <<")) return Uniform_List(playerid, page-1);
		if(!strcmp(inputtext, "Sonraki Sayfa >>")) return Uniform_List(playerid, page+1);

		new id;
        sscanf(inputtext, "i", id);
        PlayerData[playerid][pDutySkin] = Uniform_GetSkinID(id);
        SetPlayerSkin(playerid, PlayerData[playerid][pDutySkin]);
	}
    return 1;
}

Dialog:TRUNKUNIFORM_LIST(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new page = GetPVarInt(playerid, "faction_uniform_idx");
		if(!strcmp(inputtext, "�nceki Sayfa <<")) return TrunkUniform_List(playerid, page-1);
		if(!strcmp(inputtext, "Sonraki Sayfa >>")) return TrunkUniform_List(playerid, page+1);

		new id;
        sscanf(inputtext, "i", id);
        PlayerData[playerid][pDutySkin] = TrunkUniform_GetSkinID(id);
        SetPlayerSkin(playerid, PlayerData[playerid][pDutySkin]);
	}
    return 1;
}

Dialog:ROADBLOCK_LIST(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new page = GetPVarInt(playerid, "faction_roadblock_idx");
		if(!strcmp(inputtext, "�nceki Sayfa <<")) return Roadblock_List(playerid, page-1);
		if(!strcmp(inputtext, "Sonraki Sayfa >>")) return Roadblock_List(playerid, page+1);

		new id;
        sscanf(inputtext, "i", id);
        Roadblock_Create(playerid, Roadblock_GetInt(id, "RoadblockObjID"), Roadblock_GetString(id, "RoadblockName"));
	}
    return 1;
}

Dialog:ACCESORY_LIST(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new page = GetPVarInt(playerid, "faction_attachment_idx");
		if(!strcmp(inputtext, "�nceki Sayfa <<")) return Attachment_List(playerid, page-1);
		if(!strcmp(inputtext, "Sonraki Sayfa >>")) return Attachment_List(playerid, page+1);

		new id;
        sscanf(inputtext, "i", id);
		new clothing_id = FreeAttachmentSlot(playerid);
		if(clothing_id == -1) return SendClientMessage(playerid, COLOR_WHITE, "SERVER: Aksesuar sat�n alabilmek i�in ilk �nce �st�ndekilerden bir ka��n� ��kar.");
		SendClientMessage(playerid, COLOR_WHITE, "�PUCU: {FFFF00}SPACE{FFFFFF} basarak bak�nabilirsin. �ptal etmek i�in {FFFF00}ESC{FFFFFF} basabilirsin.");
		SendClientMessage(playerid, COLOR_WHITE, "Di�er aksesuarlar�n� {FFFF00}/aksesuar{FFFFFF} yazarak d�zenleyebilirsin.");

		SetPlayerAttachedObject(playerid, clothing_id, Attachment_GetInt(id, "att_id"), 2);
		EditAttachedObject(playerid, clothing_id);

		PlayerData[playerid][pClothingPrice] = Attachment_GetInt(id, "att_price");
		format(PlayerData[playerid][pClothingName], 32, "%s", Attachment_Get(id, "att_name"));
		PlayerData[playerid][pBuyingClothing] = true;
	}
    return 1;
}

Dialog:PDA_MAIN(playerid, response, listitem, inputtext[])
{
	if(!response) return 1;

	switch(listitem)
	{
	    case 0:
	    {
			new count,
			    mes[1512];

	        foreach(new i : Trucker)
		    {
      			PlayerData[playerid][pPDAListed][i] = -1;

				if(TruckerData[i][tType] == 2 || TruckerData[i][tType] == 3 || TruckerData[i][tGps] == 0)
				    continue;

                PlayerData[playerid][pPDAListed][count] = i;
				format(mes, sizeof(mes), "%s\n%s (%s, {9ACD32}%s{FFFFFF})", mes, TruckerData[i][tName], TruckerData_type[TruckerData[i][tType]], TruckerData[i][tLocked] == 0 ? "a��k" : "kapal�");
				count++;
			}

			if(count)
				Dialog_Show(playerid, PDA_MAIN_INDUSTRY, DIALOG_STYLE_LIST, "Trucker PDA - Fabrikalar", mes, "Se�", "Geri");
			else
			    Dialog_Show(playerid, None, DIALOG_STYLE_MSGBOX, "Trucker PDA - Fabrikalar", "Hi� fabrika yok.", "Kapat", "");
		}
	    case 1:
	    {
	        Business_Industry(playerid, 0);
	        return 1;
	    }
	    case 2:
	    {
	        new mes[1024],
	    		str_len;

		    format(mes, sizeof(mes), "{9ACD32}Gemi{FFFFFF}'ye ho�geldin!\n\n\
		    	{FFFFFF}Gemi �uan {9ACD32}%s.\n\n\
		    	{FFFFFF}A�a��daki zaman dilimleri kesin de�ildir, yakla��kt�r.\n\n\
		    	Geli� Saati:\t\t%s\nKalk�� Saati:\t\t%s\nD�n�� Saati:\t\t%s\n\n\
		    	{9ACD32}Sat�lan:\n{808080}Bu gemi hi� bir �ey satm�yor, sadece San Andreas'tan kargo al�yor.\n\n\
		    	{9ACD32}Al�nan:\n{808080}�r�n\t\t\tFiyat\t\tStok (depo boyutu){FFFFFF}",
			ship_docked == 1 ? "limanda" : "limanda de�il", GetShipHour(ship_arrived), GetShipHour(ship_depart), GetShipHour(ship_next));

			foreach(new i : Trucker)
		    {
				if(TruckerData[i][tType] != 2)
				    continue;

				TruckerData_product[TruckerData[i][tProductID]][0] = toupper(TruckerData_product[TruckerData[i][tProductID]][0]);
	            str_len = strlen(TruckerData_product[TruckerData[i][tProductID]]);
	            format(mes, sizeof(mes), "%s\n%s%s\t\t$%i\t\t\t%i %s {808080}(%i){FFFFFF}", mes, TruckerData_product[TruckerData[i][tProductID]], str_len < 6 ? "\t" : "",
				TruckerData[i][tPrice], TruckerData[i][tStorage], Trucker_GetType(TruckerData[i][tProductID]), TruckerData[i][tStorageSize]);
		    }

		    Dialog_Show(playerid, None, DIALOG_STYLE_MSGBOX, "Gemi", mes, "Kapat", "");
	    }
	}
	return 1;
}

Dialog:PDA_MAIN_INDUSTRY(playerid, response, listitem, inputtext[])
{
	if(!response)
	{
		cmd_tpda(playerid, "");
		return 1;
	}

	listitem = PlayerData[playerid][pPDAListed][listitem];

    if(listitem == -1)
		return 1;

    Industry_Show(playerid, listitem, 1);
	return 1;
}

Dialog:PDA_SUB_INDUSTRY(playerid, response, listitem, inputtext[])
{
	if(!response)
	{
		new count,
			mes[1512];

		foreach(new i : Trucker)
		{
			PlayerData[playerid][pPDAListed][i] = -1;

			if(TruckerData[i][tType] == 2 || TruckerData[i][tType] == 3 || TruckerData[i][tGps] == 0)
				continue;

			PlayerData[playerid][pPDAListed][count] = i;
			format(mes, sizeof(mes), "%s\n%s (%s, {9ACD32}%s{FFFFFF})", mes, TruckerData[i][tName], TruckerData_type[TruckerData[i][tType]], TruckerData[i][tLocked] == 0 ? "a��k" : "kapal�");
			count++;
		}

		if(count)
			Dialog_Show(playerid, PDA_MAIN_INDUSTRY, DIALOG_STYLE_LIST, "Trucker PDA - Fabrikalar", mes, "Se�", "Geri");
		else
			Dialog_Show(playerid, None, DIALOG_STYLE_MSGBOX, "Trucker PDA - Fabrikalar", "Hi� fabrika yok.", "Kapat", "");
		return 1;
	}

    listitem = GetPVarInt(playerid, "industry_id");

    if(listitem < 0 || listitem > MAX_TRUCK_CARGO) // || TruckerData[listitem][tOn] == 0
		return 1;

	if(TruckerData[listitem][tPack] == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "{9ACD32}%s {FFFFFF}haritada i�aretlendi.", TruckerData[listitem][tName]);
	    SetPlayerCheckpoint(playerid, TruckerData[listitem][tPosX], TruckerData[listitem][tPosY], TruckerData[listitem][tPosZ], 5.0);
    	PlayerPlaySound(playerid, 21001, 0.0, 0.0, 0.0);
	    return 1;
	}

	new count,
 		mes[1512];

	foreach(new i : Trucker)
 	{
		PlayerData[playerid][pPDAListed][i] = -1;

		if(TruckerData[i][tPack] == 0 || TruckerData[i][tPack] != TruckerData[listitem][tPack])
		    continue;

		PlayerData[playerid][pPDAListed][count] = i;
		format(mes, sizeof(mes), "%s\n{9ACD32}- %s {808080}({FFFFFF}%s $%i {808080}/ birim, {FFFFFF}%i {808080}/ %i)", mes, TruckerData[i][tType] == 3 ? "al�yor" : "sat�yor", TruckerData_product[TruckerData[i][tProductID]], TruckerData[i][tPrice], TruckerData[i][tStorage], TruckerData[i][tStorageSize]);
		count++;
	}

	Dialog_Show(playerid, PDA_SUB_INDUSTRY_NAV, DIALOG_STYLE_LIST, "Trucker PDA - Navigasyon", mes, "��aretle", "Geri");
	return 1;
}

Dialog:PDA_SUB_INDUSTRY_NAV(playerid, response, listitem, inputtext[])
{
	if(!response)
	    return cmd_tpda(playerid, "");

    listitem = PlayerData[playerid][pPDAListed][listitem];

    if(listitem < 0 || listitem > MAX_TRUCK_CARGO) // TruckerData[listitem][tOn] == 0
		return 1;

	SendClientMessageEx(playerid, COLOR_WHITE, "{9ACD32}%s {FFFFFF}haritada i�aretlendi.", TruckerData[listitem][tName]);
	SetPlayerCheckpoint(playerid, TruckerData[listitem][tPosX], TruckerData[listitem][tPosY], TruckerData[listitem][tPosZ], 5.0);
	PlayerPlaySound(playerid, 21001, 0.0, 0.0, 0.0);
	return 1;
}

Dialog:PDA_BUSINESS(playerid, response, listitem, inputtext[])
{
	if(!response)
	    return cmd_tpda(playerid, "");

	if(listitem == 0)
		return Business_Industry(playerid, GetPVarInt(playerid, "business_id")-1);

    if(listitem == 11)
		return Business_Industry(playerid, GetPVarInt(playerid, "business_id")+1);

	if(PlayerData[playerid][pCargoListed][listitem-1] == -1)
	    return 1;

	new bizid = PlayerData[playerid][pCargoListed][listitem-1];

	if(!Iter_Contains(Businesses, bizid))
	    return 1;

	SendClientMessageEx(playerid, COLOR_WHITE, "{9ACD32}%s {FFFFFF}haritada i�aretlendi.", BusinessData[bizid][BusinessName]);
	SetPlayerCheckpoint(playerid, BusinessData[bizid][EnterPos][0], BusinessData[bizid][EnterPos][1], BusinessData[bizid][EnterPos][2], 5.0);
	PlayerPlaySound(playerid, 21001, 0.0, 0.0, 0.0);
	return 1;
}

Dialog:CARGO_LIST(playerid, response, listitem, inputtext[])
{
	if(!response)
	    return 1;

	if(IsPlayerInAnyVehicle(playerid))
	    return SendErrorMessage(playerid, "Ara� i�inde kargo alamazs�n.");

  	new vehicle = GetPVarInt(playerid, "cargo_veh_id");
	if(!vehicle || GetNearestVehicle(playerid) == INVALID_VEHICLE_ID)
		return SendErrorMessage(playerid, "Yak�n�nda kargo alabilece�in bir ara� yok.");

	if(CarData[vehicle][carLocked])
		return SendErrorMessage(playerid, "Bu ara� kilitli.");

	new engine, lights, alarm, doors, bonnet, boot, objective;
	GetVehicleParamsEx(vehicle, engine, lights, alarm, doors, bonnet, boot, objective);

	if(!boot)
		return SendErrorMessage(playerid, "Bu arac�n bagaj� kapal�.");

	listitem = PlayerData[playerid][pCargoListed][listitem];

	if(CarData[vehicle][carCargoAmount][listitem] == 0)
	    return SendErrorMessage(playerid, "Se�ti�in kargo ara�ta yok. (ba�kas� alm�� olabilir)");

    if(!IsTakeProduct(listitem))
    	return SendErrorMessage(playerid, "Se�ti�in kargo ta��yabilece�in t�rden de�il.");

    if(IsPlayerAttachedObjectSlotUsed(playerid, SLOT_MISC) || PlayerData[playerid][pCargoID] != 0)
	   	return SendErrorMessage(playerid, "Kargo ta��yorsun.");

	cmd_liftup(playerid, "");
 	SetPlayerAttachedObject(playerid, SLOT_MISC, 2912, 5, 0.102000, 0.306000, -0.228999, -1.100001, 14.499999, -1.300000, 1.000000, 1.000000, 1.000000);
  	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);

	PlayerData[playerid][pCargoID] = listitem+1;
	CarData[vehicle][carCargoAmount][listitem]--;

	new amount;
	for(new i; i != MAX_TRUCK_PRODUCT; i++)
		amount += CarData[vehicle][carCargoAmount][i];

    switch(GetVehicleModel(vehicle))
 	{
  		case 600, 543, 605, 422, 478, 554, 530: DestroyDynamicObject(CarData[vehicle][carCargoObj][amount]);
	}

	Streamer_Update(playerid, STREAMER_TYPE_OBJECT);
	return 1;
}

Dialog:TOLL_LIST(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new sub[129], longstr[1512];
		format(sub, sizeof(sub), "{AFAFAF}Gi�e Ad�\t\t\tDurum\t\t\tAcil Durum\n");
		strcat(longstr, sub);

		foreach(new i : Tolls)
		{
			format(sub, sizeof(sub), "{FFFFFF}%s{AFAFAF}\t\t\t%s\t\t\t%s\n", TollData[i][TollName], TollData[i][TollStatus] ? ("A��k") : ("Kapal�"), TollData[i][TollLocked] ? ("{BF605C}Kilitli") : ("{85A82B}Kilitli De�il"));
			strcat(longstr, sub);
		}

		format(sub, sizeof(sub), "{AFAFAF}T�m gi�eleri kilitle\n{AFAFAF}T�m gi�elerin kilitlerini a�");
		strcat(longstr, sub);

		Dialog_Show(playerid, TOLL_MANAGEMENT, DIALOG_STYLE_TABLIST_HEADERS, "Gi�e Y�netimi", longstr, "Se�", "Kapat");
	}
	return 1;
}

Dialog:TOLL_MANAGEMENT(playerid, response, listitem, inputtext[])
{
	if(!response) return cmd_giseyonetim(playerid, "");

	new string[128];
	if(!strcmp(inputtext, "T�m gi�eleri kilitle"))
	{
		foreach(new i : Tolls) TollData[i][TollLocked] = true;
		format(string, sizeof(string), "** HQ Duyurusu: T�m gi�eler %s %s taraf�ndan K�L�TLEND�! **", Player_GetFactionRank(playerid), ReturnName(playerid, 0));
		SendLawMessage(COLOR_COP, string);
		TollTimesLocked++;
	}
	else if(!strcmp(inputtext, "T�m gi�elerin kilitlerini a�"))
	{
		foreach(new i : Tolls) TollData[i][TollLocked] = false;
		format(string, sizeof(string), "** HQ Duyurusu: T�m gi�eler %s %s taraf�ndan K�L�D� A�ILDI! **", Player_GetFactionRank(playerid), ReturnName(playerid, 0));
		SendLawMessage(COLOR_COP, string);
	}
	else
	{
		if(TollData[listitem][TollLocked])
		{
			TollData[listitem][TollLocked] = false;
			format(string, sizeof(string), "** HQ Duyurusu: %s gi�esi %s %s taraf�ndan K�L�D� A�ILDI! **", TollData[listitem][TollName], Player_GetFactionRank(playerid), ReturnName(playerid, 0));
			SendLawMessage(COLOR_COP, string);
		}
		else
		{
			TollData[listitem][TollLocked] = true;
			format(string, sizeof(string), "** HQ Duyurusu: %s gi�esi %s %s taraf�ndan K�L�TLEND�! **", TollData[listitem][TollName], Player_GetFactionRank(playerid), ReturnName(playerid, 0));
			SendLawMessage(COLOR_COP, string);
			TollTimesLocked++;
		}
	}
	return 1;
}

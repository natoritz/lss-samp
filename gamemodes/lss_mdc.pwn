

// Define
#define MDC_PAGE_MAIN 						(1)
#define MDC_PAGE_LOOKUP 					(2)
#define MDC_PAGE_WARRANTS					(3)
#define MDC_PAGE_EMERGENCY					(4)
#define MDC_PAGE_ROSTER						(5)
#define MDC_PAGE_DATABASE					(6)
#define MDC_PAGE_CCTV						(7)
#define MDC_PAGE_STAFF						(8)
#define MDC_PAGE_VEHICLEBOLO 		(9)

#define MDC_PAGE_LOOKUP_NAME				(10)
#define MDC_PAGE_LOOKUP_PLATE				(11)
#define MDC_PAGE_LOOKUP_BUILDING			(21)

new PlayerText:MDC_Main[MAX_PLAYERS][18];
new PlayerText:MDC_MainScreen[MAX_PLAYERS][8];

new PlayerText:MDC_LookUp_Name[MAX_PLAYERS][18];
new PlayerText:MDC_LookUp_Vehicle[MAX_PLAYERS][17];
new PlayerText:MDC_AdressDetails[MAX_PLAYERS][13];
new PlayerText:MDC_CrimeHistory[MAX_PLAYERS][24];
new PlayerText:MDC_SelectedCrimeDetails[MAX_PLAYERS][5];
new PlayerText:MDC_ManageLicense[MAX_PLAYERS][34];
new PlayerText:MDC_PenalCode[MAX_PLAYERS][34];

new PlayerText:MDC_Emergency[MAX_PLAYERS][24];
new PlayerText:MDC_EmergencyDetails[MAX_PLAYERS][5];

new PlayerText:MDC_Warrants[MAX_PLAYERS][24];
new PlayerText:MDC_Roster[MAX_PLAYERS][21];
new PlayerText:MDC_CCTV[MAX_PLAYERS][17];
new PlayerText:MDC_ADRESSICON[MAX_PLAYERS][1];
new PlayerText:MDC_VehicleBolo_Details[MAX_PLAYERS][6];
new PlayerText:MDC_VehicleBolo_List[MAX_PLAYERS][22];
new boloListID[MAX_PLAYERS][MAX_VBOLO];

new lastBoloModel[MAX_PLAYERS][24],
		lastBoloPlate[MAX_PLAYERS][24],
		lastBoloCrimes[MAX_PLAYERS][512],
		lastBoloReport[MAX_PLAYERS][512];

new MDC_PlayerLastSearched[MAX_PLAYERS][24],
		MDC_PlastLastSearched_SQLID[MAX_PLAYERS],
		MDC_MaxAdress_DBID[MAX_PLAYERS][3],
		Float: MDC_MaxAdress_DB_Pos[MAX_PLAYERS][3][3];

new Player_CCTVPage[MAX_PLAYERS];

new Player_PenalID[MAX_PLAYERS][20];


CMD:mdc(playerid, params[])
{
	SelectTextDraw(playerid, 0x030103FF);
	ShowMDCPage(playerid, MDC_PAGE_MAIN);

	SetPVarInt(playerid, "OnPlayerUseMDC", 1);
	return 1;
}


public ClickDynamicPlayerTextdraw(playerid, PlayerText:playertextid)
{
	CallOnPlayerClickPlayerTextDraw(playerid, playertextid);
	if(playertextid == MDC_Main[playerid][4])
	{
			MDC_Hide(playerid);
	}

	if(playertextid == MDC_Main[playerid][10])
	{
			ShowMDCPage(playerid, MDC_PAGE_MAIN);
	}

	if(playertextid == MDC_Main[playerid][11])
	{
			ShowMDCPage(playerid, MDC_PAGE_LOOKUP);
	}

	if(playertextid == MDC_Main[playerid][12])
	{
			ShowMDCPage(playerid, MDC_PAGE_WARRANTS);
	}

	if(playertextid == MDC_Main[playerid][13])
	{
			ShowMDCPage(playerid, MDC_PAGE_EMERGENCY);
	}

	if(playertextid == MDC_Main[playerid][14])
	{
			ShowMDCPage(playerid, MDC_PAGE_ROSTER);
	}

	if(playertextid == MDC_Main[playerid][15])
	{
			SendErrorMessage(playerid, "MDC içerisinde CCTV kullanýmý þu anda devre dýþý.");
			//ShowMDCPage(playerid, MDC_PAGE_CCTV);
	}

	if(playertextid == MDC_Main[playerid][16])
	{
			ShowMDCPage(playerid, MDC_PAGE_VEHICLEBOLO);
	}


	if(playertextid == MDC_LookUp_Name[playerid][0]) // Ýsim Seçeneði
	{
			MDC_LOOKUP_SelectOption(playerid, MDC_PAGE_LOOKUP_NAME);
	}

	if(playertextid == MDC_LookUp_Name[playerid][1]) // Plaka Seçeneði
	{
			MDC_LOOKUP_SelectOption(playerid, MDC_PAGE_LOOKUP_PLATE);
	}

	if(playertextid == MDC_LookUp_Name[playerid][17]) // Mekan seçeneði
	{
			MDC_LOOKUP_SelectOption(playerid, MDC_PAGE_LOOKUP_BUILDING);
	}

	for(new idd; idd < 17; idd++)
	{
		if(playertextid == MDC_CCTV[playerid][idd])
		{
			/*new countdown = 0, sub[90];
			for(new i = 14; i < MAX_CCTVS; i++) if(CameraData[i][CameraObject])
			{
				format(sub, sizeof(sub), "%s_-[%s]~n~", CameraData[i][CameraName], GetStreet(CameraData[i][CameraLocation][0], CameraData[i][CameraLocation][1], CameraData[i][CameraLocation][2]));

				PlayerTextDrawSetString(playerid, MDC_CCTV[playerid][countdown], sub);
				PlayerTextDrawShow(playerid, MDC_CCTV[playerid][countdown]);
				Player_CCTVPage[playerid] = Player_CCTVPage[playerid]+1;
				countdown++;
			}*/
		}
	}

	if(playertextid == MDC_LookUp_Name[playerid][2]) // Bu bastýðý o text girme yeri.
	{
			if(GetPVarInt(playerid,"MDC_SearchMode") == 1)
				Dialog_Show(playerid, MDC_LookUp_EnterBox, DIALOG_STYLE_INPUT, "Veri Girin", "Kimi arýyorsunuz?", "Ara", "Vazgeç");

			if(GetPVarInt(playerid,"MDC_SearchMode") == 2)
				Dialog_Show(playerid, MDC_LookUp_EnterBox, DIALOG_STYLE_INPUT, "Veri Girin", "Kimi arýyorsunuz?\nPlaka aramasýysa direkt olarak plakayý gir.\nAraç ID üzerindense, 'id:ARAÇID' þeklinde girmelisin (örn: id:120)", "Ara", "Vazgeç");
	}
	if(playertextid == MDC_LookUp_Name[playerid][3]) // Refresh butonu
	{
		MDC_LookUp_Refresh(playerid);
	}

	if(playertextid == MDC_LookUp_Name[playerid][9]) // Fazladan adrese sahipse bu butona basar.
	{
		MDC_ShowMultipleAdress(MDC_PlastLastSearched_SQLID[playerid], playerid);
	}

	if(playertextid == MDC_AdressDetails[playerid][5])
	{
		SetAddresMapPosition(playerid, MDC_MaxAdress_DB_Pos[playerid][0][0], MDC_MaxAdress_DB_Pos[playerid][0][1], MDC_MaxAdress_DB_Pos[playerid][0][2]);
	}

	if(playertextid == MDC_AdressDetails[playerid][6])
	{
		SetAddresMapPosition(playerid, MDC_MaxAdress_DB_Pos[playerid][1][0], MDC_MaxAdress_DB_Pos[playerid][1][1], MDC_MaxAdress_DB_Pos[playerid][1][2]);
	}

	if(playertextid == MDC_AdressDetails[playerid][7])
	{
		SetAddresMapPosition(playerid, MDC_MaxAdress_DB_Pos[playerid][2][0], MDC_MaxAdress_DB_Pos[playerid][2][1], MDC_MaxAdress_DB_Pos[playerid][2][2]);
	}


	if(playertextid == MDC_LookUp_Name[playerid][12]) // Penal Code'a gitme butonu
	{
		MDC_ShowPenalCode(playerid);
		SetPVarInt(playerid, "TotalAddedCharge", 0);
	}


	if(playertextid == MDC_LookUp_Name[playerid][10]) // Lisans yöneitim
	{
		MDC_ShowManageLicense(MDC_PlastLastSearched_SQLID[playerid], playerid);
	}

	if(playertextid == MDC_AdressDetails[playerid][0])
	{
		MDC_HideAfterPage(playerid);

		PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][0]);
		PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][1]);
		PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][2]);
		PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][3]);

		new sorgu[256];
		format(sorgu, sizeof(sorgu), "SELECT * FROM `players` WHERE `Name` = '%s'", MDC_PlayerLastSearched[playerid]);
		mysql_tquery(m_Handle, sorgu, "KisiSorgula", "sdd", MDC_PlayerLastSearched[playerid], playerid, 0);
	}

	if(playertextid == MDC_ManageLicense[playerid][0])
	{
		MDC_HideAfterPage(playerid);

		PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][0]);
		PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][1]);
		PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][2]);
		PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][3]);

		new sorgu[256];
		format(sorgu, sizeof(sorgu), "SELECT * FROM `players` WHERE `Name` = '%s'", MDC_PlayerLastSearched[playerid]);
		mysql_tquery(m_Handle, sorgu, "KisiSorgula", "sdd", MDC_PlayerLastSearched[playerid], playerid, 0);
	}

	if(playertextid == MDC_ManageLicense[playerid][6]) // Sürücü Lisansý iptal etme
	{
		foreach(new pl : Player)
		{
			if(strlen(MDC_PlayerLastSearched[playerid]) == strlen(ReturnName(pl, 0)))
			{
				if(PlayerData[pl][pDriversLicense] == false)
					return SendErrorMessage(playerid, "Bu kiþi bir sürücü lisansýna sahip deðil.");

				PlayerData[pl][pDriversLicense] = false;
				Send_MDCMessage(playerid, COLOR_COP, sprintf("** HQ Duyurusu: %s %s, %s adlý kiþinin sürücü lisansýný iptal etti. **", Player_GetFactionRank(playerid), ReturnName(playerid, 1), MDC_PlayerLastSearched[playerid]));
				MDC_ShowManageLicense(MDC_PlastLastSearched_SQLID[playerid], playerid);
				return 1;
			}
		}
		new query[256];
		format(query, sizeof(query), "SELECT * FROM `players` WHERE `Name` = '%s'", MDC_PlayerLastSearched[playerid]);
		new Cache:cache = mysql_query(m_Handle, query);

		new dl;
		if(cache_num_rows())
		{
			cache_get_value_name_int(0, "DriversLicense", dl);
		}

		if(dl == 0)
			return SendErrorMessage(playerid, "Bu kiþi bir sürücü lisansýna sahip deðil.");

		mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET DriversLicense = 0 WHERE id = %i", MDC_PlastLastSearched_SQLID[playerid]);
		mysql_tquery(m_Handle, query);
		MDC_ShowManageLicense(MDC_PlastLastSearched_SQLID[playerid], playerid);
		cache_delete(cache);
		Send_MDCMessage(playerid, COLOR_COP, sprintf("** HQ Duyurusu: %s %s, %s adlý kiþinin sürücü lisansýný iptal etti. **", Player_GetFactionRank(playerid), ReturnName(playerid, 1), MDC_PlayerLastSearched[playerid]));
	}

	if(playertextid == MDC_ManageLicense[playerid][7]) // Sürücü Lisansý uyarma
	{
		foreach(new pl : Player)
		{
			if(strlen(MDC_PlayerLastSearched[playerid]) == strlen(ReturnName(pl, 0)))
			{
				if(PlayerData[pl][pDriversLicense] != true)
					return SendErrorMessage(playerid, "Sürücü lisansý olmayan birisine uyarý puaný yazamazsýnýz.");

				PlayerData[pl][DriversLicenseWarning] +=1;
				Send_MDCMessage(playerid, COLOR_COP, sprintf("** HQ Duyurusu: %s %s, %s adlý kiþinin sürücü lisansýna 1 uyarý puaný yazdý. **", Player_GetFactionRank(playerid), ReturnName(playerid, 1), MDC_PlayerLastSearched[playerid]));
				MDC_ShowManageLicense(MDC_PlastLastSearched_SQLID[playerid], playerid);
				return 1;
			}
		}

		new query_properties[128];
		format(query_properties, sizeof(query_properties), "SELECT * FROM `players` WHERE `Name` = '%s'", MDC_PlayerLastSearched[playerid]);
		new Cache:cache = mysql_query(m_Handle, query_properties);

		new warnings, dl;
		if(cache_num_rows())
		{
			cache_get_value_name_int(0, "DriversLicenseWarning", warnings);
			cache_get_value_name_int(0, "DriversLicense", dl);
		}

		if(dl == 0)
			return SendErrorMessage(playerid, "Sürücü lisansý olmayan birisine uyarý puaný yazamazsýnýz.");

		mysql_format(m_Handle, query_properties, sizeof(query_properties), "UPDATE players SET DriversLicenseWarning = %d WHERE id = %i", warnings+1, MDC_PlastLastSearched_SQLID[playerid]);
		mysql_tquery(m_Handle, query_properties);
		cache_delete(cache);
		MDC_ShowManageLicense(MDC_PlastLastSearched_SQLID[playerid], playerid);
		Send_MDCMessage(playerid, COLOR_COP, sprintf("** HQ Duyurusu: %s %s, %s adlý kiþinin sürücü lisansýna 1 uyarý puaný yazdý. **", Player_GetFactionRank(playerid), ReturnName(playerid, 1), MDC_PlayerLastSearched[playerid]));
	}


	if(playertextid == MDC_ManageLicense[playerid][14]) // Medikal Lisans iptal etme
	{
		foreach(new pl : Player)
		{
			if(strlen(MDC_PlayerLastSearched[playerid]) == strlen(ReturnName(pl, 0)))
			{
				if(PlayerData[pl][pMedicalLicense] == false)
					return SendErrorMessage(playerid, "Bu kiþi bir medikal lisansýna sahip deðil.");

				PlayerData[pl][pMedicalLicense] = false;
				Send_MDCMessage(playerid, COLOR_COP, sprintf("** HQ Duyurusu: %s %s, %s adlý kiþinin medikal lisansýný iptal etti. **", Player_GetFactionRank(playerid), ReturnName(playerid, 1), MDC_PlayerLastSearched[playerid]));
				MDC_ShowManageLicense(MDC_PlastLastSearched_SQLID[playerid], playerid);
				return 1;
			}
		}
		new query[256];
		format(query, sizeof(query), "SELECT * FROM `players` WHERE `Name` = '%s'", MDC_PlayerLastSearched[playerid]);
		new Cache:cache = mysql_query(m_Handle, query);

		new dl;
		if(cache_num_rows())
		{
			cache_get_value_name_int(0, "MedicalLicense", dl);
		}

		if(dl == 0)
			return SendErrorMessage(playerid, "Bu kiþi bir medikal lisansa sahip deðil.");

		mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET MedicalLicense = 0 WHERE id = %i", MDC_PlastLastSearched_SQLID[playerid]);
		mysql_tquery(m_Handle, query);
		cache_delete(cache);
		MDC_ShowManageLicense(MDC_PlastLastSearched_SQLID[playerid], playerid);
		Send_MDCMessage(playerid, COLOR_COP, sprintf("** HQ Duyurusu: %s %s, %s adlý kiþinin medikal lisansýný iptal etti. **", Player_GetFactionRank(playerid), ReturnName(playerid, 1), MDC_PlayerLastSearched[playerid]));
	}

	if(playertextid == MDC_ManageLicense[playerid][30])
	{
		foreach(new pl : Player)
		{
			if(strlen(MDC_PlayerLastSearched[playerid]) == strlen(ReturnName(pl, 0)))
			{
				if(PlayerData[pl][pMedicalLicense] == true)
					return SendErrorMessage(playerid, "Bu kiþi zaten bir medikal lisansa sahip.");

				PlayerData[pl][pMedicalLicense] = true;
				Send_MDCMessage(playerid, COLOR_COP, sprintf("** HQ Duyurusu: %s %s, %s adlý kiþinin medikal lisansý verdi. **", Player_GetFactionRank(playerid), ReturnName(playerid, 1), MDC_PlayerLastSearched[playerid]));
				MDC_ShowManageLicense(MDC_PlastLastSearched_SQLID[playerid], playerid);
				return 1;
			}
		}
		new query[256];
		format(query, sizeof(query), "SELECT * FROM `players` WHERE `Name` = '%s'", MDC_PlayerLastSearched[playerid]);
		new Cache:cache = mysql_query(m_Handle, query);

		new dl;
		if(cache_num_rows())
		{
			cache_get_value_name_int(0, "MedicalLicense", dl);
		}

		if(dl == 1)
		{
			SendErrorMessage(playerid, "Bu kiþi zaten bir medikal lisansa sahip.");
			cache_delete(cache);
			return 1;
		}

		mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET MedicalLicense = 1 WHERE id = %i", MDC_PlastLastSearched_SQLID[playerid]);
		mysql_tquery(m_Handle, query);
		cache_delete(cache);
		MDC_ShowManageLicense(MDC_PlastLastSearched_SQLID[playerid], playerid);
		Send_MDCMessage(playerid, COLOR_COP, sprintf("** HQ Duyurusu: %s %s, %s adlý kiþinin medikal lisansý verdi. **", Player_GetFactionRank(playerid), ReturnName(playerid, 1), MDC_PlayerLastSearched[playerid]));
	}

	if(playertextid == MDC_ManageLicense[playerid][21]) // Silah lisansý verme
	{
		foreach(new pl : Player)
		{
			if(strlen(MDC_PlayerLastSearched[playerid]) == strlen(ReturnName(pl, 0)))
			{
				if(PlayerData[pl][pWeaponsLicense] == true)
					return SendErrorMessage(playerid, "Bu kiþi zaten silah lisansýna sahip.");

				PlayerData[pl][pWeaponsLicense] = true;
				Send_MDCMessage(playerid, COLOR_COP, sprintf("** HQ Duyurusu: %s %s, %s adlý kiþiye silah lisansý verdi.**", Player_GetFactionRank(playerid), ReturnName(playerid, 1), MDC_PlayerLastSearched[playerid]));
				MDC_ShowManageLicense(MDC_PlastLastSearched_SQLID[playerid], playerid);
				return 1;
			}
		}
		new query[256];
		format(query, sizeof(query), "SELECT * FROM `players` WHERE `Name` = '%s'", MDC_PlayerLastSearched[playerid]);
		new Cache:cache = mysql_query(m_Handle, query);

		new dl;
		if(cache_num_rows())
		{
			cache_get_value_name_int(0, "WeaponsLicense", dl);
		}

		if(dl == 1)
			return SendErrorMessage(playerid, "Bu kiþi zaten silah lisansýna sahip.");

		mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET WeaponsLicense = 1 WHERE id = %i", MDC_PlastLastSearched_SQLID[playerid]);
		mysql_tquery(m_Handle, query);
		cache_delete(cache);
		MDC_ShowManageLicense(MDC_PlastLastSearched_SQLID[playerid], playerid);
		Send_MDCMessage(playerid, COLOR_COP, sprintf("** HQ Duyurusu: %s %s, %s adlý kiþiye silah lisansý verdi. **", Player_GetFactionRank(playerid), ReturnName(playerid, 1), MDC_PlayerLastSearched[playerid]));
	}

	if(playertextid == MDC_ManageLicense[playerid][20]) // Silah lisansý iptal
	{
		foreach(new pl : Player)
		{
			if(strlen(MDC_PlayerLastSearched[playerid]) == strlen(ReturnName(pl, 0)))
			{
				if(PlayerData[pl][pWeaponsLicense] == false)
					return SendErrorMessage(playerid, "Bu kiþi silah lisansýna sahip deðil.");

				PlayerData[pl][pWeaponsLicense] = false;
				Send_MDCMessage(playerid, COLOR_COP, sprintf("** HQ Duyurusu: %s %s, %s adlý kiþinin silah lisansýný iptal etti. **", Player_GetFactionRank(playerid), ReturnName(playerid, 1), MDC_PlayerLastSearched[playerid]));
				MDC_ShowManageLicense(MDC_PlastLastSearched_SQLID[playerid], playerid);
				return 1;
			}
		}
		new query[256];
		format(query, sizeof(query), "SELECT * FROM `players` WHERE `Name` = '%s'", MDC_PlayerLastSearched[playerid]);
		new Cache:cache = mysql_query(m_Handle, query);

		new dl;
		if(cache_num_rows())
		{
			cache_get_value_name_int(0, "WeaponsLicense", dl);
		}

		if(dl == 0)
			return SendErrorMessage(playerid, "Bu kiþi silah lisansýna sahip deðil.");

		mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET WeaponsLicense = 0 WHERE id = %i", MDC_PlastLastSearched_SQLID[playerid]);
		mysql_tquery(m_Handle, query);
		cache_delete(cache);
		MDC_ShowManageLicense(MDC_PlastLastSearched_SQLID[playerid], playerid);
		Send_MDCMessage(playerid, COLOR_COP, sprintf("** HQ Duyurusu: %s %s, %s adlý kiþinin silah lisansýný iptal etti**", Player_GetFactionRank(playerid), ReturnName(playerid, 1), MDC_PlayerLastSearched[playerid]));
	}

	if(playertextid == MDC_PenalCode[playerid][0]) // Penal Code geri gelme butonu, geri döndükten sonra en son kimi arattýðý tekrar çýkmalý.
	{
		MDC_HideAfterPage(playerid);

		PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][0]);
		PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][1]);
		PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][2]);
		PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][3]);

		new sorgu[256];
		format(sorgu, sizeof(sorgu), "SELECT * FROM `players` WHERE `Name` = '%s'", MDC_PlayerLastSearched[playerid]);
		mysql_tquery(m_Handle, sorgu, "KisiSorgula", "sdd", MDC_PlayerLastSearched[playerid], playerid, 0);
	}

	for(new is = 1; is < 20; is++)
	{
	  if(playertextid == MDC_PenalCode[playerid][is]) // Penal Code listeden suç seçme ve detaylarýný görme
		{
			//ChangePenalCodeButton(playerid, is);
 			MDC_SelectedCharges(playerid, Player_PenalID[playerid][is-1]);
		}
	}

	for(new q = 0; q < 34; q++)
	{
		if(playertextid == MDC_ManageLicense[playerid][q]) // Penal Code listeden suç seçme ve detaylarýný görme
		{
			printf("%d", q);
		}
	}




	if(playertextid == MDC_PenalCode[playerid][22]) // Penal Code filtre sýfýrlama
	{

	}


	if(playertextid == MDC_PenalCode[playerid][30]) // Penal Code listeye eklenen suçlarý sýfýrlama sýfýrlama
	{
		for(new is = 26; is < 34; is++)
		{
	 		PlayerTextDrawHide(playerid, MDC_PenalCode[playerid][is]);
		}
		SetPVarInt(playerid, "TotalAddedCharge", 0);
	}

	if(playertextid == MDC_Emergency[playerid][4] || playertextid == MDC_Emergency[playerid][9] || playertextid == MDC_Emergency[playerid][14]) // Ýhbar detayý görme
	{
		MDC_HideAfterPage(playerid);
		for(new is = 0; is < 5; is++)
		{
	 		PlayerTextDrawShow(playerid, MDC_EmergencyDetails[playerid][is]);
		}
	}

	if(playertextid == MDC_EmergencyDetails[playerid][4]) // Ýhbar detayýndan geri dönme butonu
	{
		for(new is = 0; is < 5; is++)
		{
	 		PlayerTextDrawHide(playerid, MDC_EmergencyDetails[playerid][is]);
		}
		ShowMDCPage(playerid, MDC_PAGE_EMERGENCY);
	}

	if(playertextid == MDC_PenalCode[playerid][25]) // Penal Code listeye suç ekleme
	{
		SetPVarInt(playerid, "TotalAddedCharge", GetPVarInt(playerid, "TotalAddedCharge") + 1);
		AddPenalCode(playerid, GetPVarInt(playerid, "SelectedCharge"));
	}

	if(playertextid == MDC_LookUp_Name[playerid][11]) // Sorgulanan kiþinin ceza kayýtlarýna gider
	{
		MDC_HideAfterPage(playerid);
		for(new is = 0; is < 24; is++)
		{
	 		PlayerTextDrawShow(playerid, MDC_CrimeHistory[playerid][is]);
		}
	}

	if(playertextid == MDC_CrimeHistory[playerid][23]) // Sorgulanan ceza kayýtlarýndan geri gider
	{
		MDC_HideAfterPage(playerid);
	}

	for(new id = 1; id < 21; id++)
	{
	  if(playertextid == MDC_CrimeHistory[playerid][id]) // Sorgulanan kiþinin ceza kayýtlarýndan bir tanesine basma butonlarýndan
		{
			MDC_HideAfterPage(playerid);
			for(new iv = 1; iv < 5; iv++)
			{
				PlayerTextDrawShow(playerid, MDC_SelectedCrimeDetails[playerid][iv]);
			}
		}
	}


	if(playertextid == MDC_Emergency[playerid][4] || playertextid == MDC_Emergency[playerid][9] || playertextid == MDC_Emergency[playerid][14]) // Ýhbar detayý görme
	{
		//if()
		for(new is = 0; is < 5; is++)
		{
	 		PlayerTextDrawShow(playerid, MDC_EmergencyDetails[playerid][is]);
		}
	}

	if(playertextid == MDC_SelectedCrimeDetails[playerid][4]) // Sorgulanan kiþinin suç kayýtlarýndan seçilmiþ suçun detayýndan geri dönme tuþu
	{
		MDC_HideAfterPage(playerid);
	}

	if(playertextid == MDC_Warrants[playerid][21]) // Arananlar listede sola gitme tuþu
	{
	}

	if(playertextid == MDC_Warrants[playerid][22]) // Arananlar listede saða gitme tuþu
	{
	}
	if(playertextid == MDC_VehicleBolo_List[playerid][0])
	{
		new id = Iter_Free(VBolos);
		if(id == 19)
			return SendErrorMessage(playerid, "Sistem daha fazla araç bolosuna izin vermiyor.");

		new dialog[512], str[512];
		format(str, sizeof(str), "{FFFFFF}                   {8D8DFF}Los Santos Police Department{FFFFFF}                   {FFFFFF} {FFFFFF}");
		strcat(dialog, str);
		format(str, sizeof(str), "\n{FFFFFF}                   {FF8282}Araç Aranma Uyarýsý{FFFFFF}                   {FFFFFF} {FFFFFF}");
		strcat(dialog, str);
		format(str, sizeof(str), "\n\n{FFFFFF}Aracýn Modeli ve rengi nedir?\nÖrnek: Siyah Tampa");
		strcat(dialog, str);
		Dialog_Show(playerid, MDC_AddVehicleBolo_Model, DIALOG_STYLE_INPUT, "Araç Aranma Uyarýsý", dialog, "Devam", "Ýptal Et");
	}

	for(new is = 0; is < 6; is++)
	{
		if(playertextid == MDC_VehicleBolo_Details[playerid][is])
		{

		}
	}

	if(playertextid == MDC_VehicleBolo_Details[playerid][0])
	{
		new id = GetPVarInt(playerid, "boloLastID");
		VehicleBolo[id][vBoloExists] = false;
		Iter_Remove(VBolos, id);
		Show_VehicleBolos(playerid);
	}
	if(playertextid == MDC_VehicleBolo_Details[playerid][1])
	{
		Show_VehicleBolos(playerid);
	}

	for(new is = 1; is < 20; is++)
	{
		if(playertextid == MDC_VehicleBolo_List[playerid][is])
		{
			MDC_HideAfterPage(playerid);
			ShowVehicleBoloDetails(playerid, is);
		}
	}
	return 1;
}

Server:ShowVehicleBoloDetails(playerid, i)
{
	new id = boloListID[playerid][i];
	SetPVarInt(playerid, "boloLastID", id);

	new vbolo_details[256];
	format(vbolo_details, 256, "#%d~n~Officer_%s~n~%s~n~%s~n~%s",VehicleBolo[id][vBoloID], VehicleBolo[id][vBoloAuthor], VehicleBolo[id][vBoloModel], VehicleBolo[id][vBoloPlate], GetFullTime(VehicleBolo[id][vBoloDate]));
	PlayerTextDrawSetString(playerid, MDC_VehicleBolo_Details[playerid][3], FixWord(vbolo_details));

	new vbolo_crimes[256];
	format(vbolo_crimes, 256, "%s", VehicleBolo[id][vBoloCrimes]);
	PlayerTextDrawSetString(playerid, MDC_VehicleBolo_Details[playerid][4], FixWord(vbolo_crimes));

	new vbolo_report[256];
	format(vbolo_report, 256, "%s", VehicleBolo[id][vBoloReport]);
	PlayerTextDrawSetString(playerid, MDC_VehicleBolo_Details[playerid][5], FixWord(vbolo_report));

	for(new is = 0; is < 6; is++)
	{
		PlayerTextDrawShow(playerid, MDC_VehicleBolo_Details[playerid][is]);
	}
	return 1;
}

Dialog:MDC_AddVehicleBolo_Model(playerid, response, listitem, inputtext[])
{
	if(!response) return 0;


	format(lastBoloModel[playerid], 24, "%s", inputtext);
	// MDC_LookUp_EnterBox
	new dialog[1028], str[1028];
	format(str, sizeof(str), "{FFFFFF}                   {8D8DFF}Los Santos Police Department{FFFFFF}                   {FFFFFF} {FFFFFF}");
	strcat(dialog, str);
	format(str, sizeof(str), "\n{FFFFFF}                   {FF8282}Araç Aranma Uyarýsý{FFFFFF}                   {FFFFFF} {FFFFFF}");
	strcat(dialog, str);
	format(str, sizeof(str), "\n\n{FF6347}Araç Modeli:");
	strcat(dialog, str);
	format(str, sizeof(str), "\n{FFFFFF} {FFFFFF} {FFFFFF} {FFFFFF}%s", lastBoloModel[playerid]);
	strcat(dialog, str);
	format(str, sizeof(str), "\n\n{FFFFFF}Aracýn plakasý nedir?");
	strcat(dialog, str);

	Dialog_Show(playerid, MDC_AddVehicleBolo_Plate, DIALOG_STYLE_INPUT, "Araç Aranma Uyarýsý", dialog, "Devam", "Ýptal Et");
	return 1;
}

Dialog:MDC_AddVehicleBolo_Plate(playerid, response, listitem, inputtext[])
{

	if(!response) return 0;

	format(lastBoloPlate[playerid], 24, "%s", inputtext);
	new dialog[1028], str[1028];
	format(str, sizeof(str), "{FFFFFF}                   {8D8DFF}Los Santos Police Department{FFFFFF}                   {FFFFFF} {FFFFFF}");
	strcat(dialog, str);
	format(str, sizeof(str), "\n{FFFFFF}                   {FF8282}Araç Aranma Uyarýsý{FFFFFF}                   {FFFFFF} {FFFFFF}");
	strcat(dialog, str);
	format(str, sizeof(str), "\n\n{FF6347}Araç Modeli:");
	strcat(dialog, str);
	format(str, sizeof(str), "\n{FFFFFF} {FFFFFF} {FFFFFF} {FFFFFF}%s", lastBoloModel[playerid]);
	strcat(dialog, str);
	format(str, sizeof(str), "\n\n{FF6347}Araç Plakasý:");
	strcat(dialog, str);
	format(str, sizeof(str), "\n{FFFFFF} {FFFFFF} {FFFFFF} {FFFFFF}%s", lastBoloPlate[playerid]);
	strcat(dialog, str);
	format(str, sizeof(str), "\n\n{FFFFFF}Uyarý ne için?");
	strcat(dialog, str);

	Dialog_Show(playerid, MDC_ABolo_Charges, DIALOG_STYLE_INPUT, "Araç Aranma Uyarýsý", dialog, "Devam", "Ýptal Et");
	return 1;
}

Dialog:MDC_ABolo_Charges(playerid, response, listitem, inputtext[])
{
	if(!response) return 0;

	format(lastBoloCrimes[playerid], 128, "%s", inputtext);
	new dialog[1028], str[1028];
	format(str, sizeof(str), "{FFFFFF}                   {8D8DFF}Los Santos Police Department{FFFFFF}                   {FFFFFF} {FFFFFF}");
	strcat(dialog, str);
	format(str, sizeof(str), "\n{FFFFFF}                   {FF8282}Araç Aranma Uyarýsý{FFFFFF}                   {FFFFFF} {FFFFFF}");
	strcat(dialog, str);
	format(str, sizeof(str), "\n\n{FF6347}Araç Modeli:");
	strcat(dialog, str);
	format(str, sizeof(str), "\n{FFFFFF} {FFFFFF} {FFFFFF} {FFFFFF}%s", lastBoloModel[playerid]);
	strcat(dialog, str);
	format(str, sizeof(str), "\n\n{FF6347}Araç Plakasý:");
	strcat(dialog, str);
	format(str, sizeof(str), "\n{FFFFFF} {FFFFFF} {FFFFFF} {FFFFFF}%s", lastBoloPlate[playerid]);
	strcat(dialog, str);
	format(str, sizeof(str), "\n\n{FF6347}Araç Suçlarý:");
	strcat(dialog, str);
	format(str, sizeof(str), "\n{FFFFFF} {FFFFFF} {FFFFFF} {FFFFFF}%s", lastBoloCrimes[playerid]);
	strcat(dialog, str);
	format(str, sizeof(str), "\n\n{FFFFFF}ARAÇ BOLO'sunun rapor içerðini giriniz. Rapor için olayýn tamamýný yazmalýsýnýz.");
	strcat(dialog, str);

	Dialog_Show(playerid, MDC_AddBolo_ReportOrDone, DIALOG_STYLE_INPUT, "Araç Aranma Uyarýsý", dialog, "Devam", "Ýptal Et");
	return 1;
}


Dialog:MDC_AddBolo_ReportOrDone(playerid, response, listitem, inputtext[])
{
	if(!response) return 0;

	if(strmatch(inputtext, "bitti"))
	{
		new id = Iter_Free(VBolos);
		if(id == 19)
			return SendErrorMessage(playerid, "Sistem daha fazla araç bolosuna izin vermiyor.");

		VehicleBolo[id][vBoloExists] = true;
		VehicleBolo[id][vBoloID] = id;
		VehicleBolo[id][vBoloDate] = gettime();
		format(VehicleBolo[id][vBoloAuthor], 24, "%s", ReturnName(playerid));
		format(VehicleBolo[id][vBoloPlate], 24, "%s", lastBoloPlate[playerid]);
		format(VehicleBolo[id][vBoloModel], 24, "%s", lastBoloModel[playerid]);
		format(VehicleBolo[id][vBoloCrimes], 512, "%s", lastBoloCrimes[playerid]);
		format(VehicleBolo[id][vBoloReport], 512, "%s", lastBoloReport[playerid]);
		Iter_Add(VBolos, id);
		Show_VehicleBolos(playerid);
		format(lastBoloModel[playerid], 24, " ");
		format(lastBoloPlate[playerid], 24, " ");
		format(lastBoloCrimes[playerid], 512, " ");
		format(lastBoloReport[playerid], 512, " ");
		return 1;
	}

	strcat(lastBoloReport[playerid], inputtext);

	new dialog[1028], str[1028];
	format(str, sizeof(str), "{FFFFFF}                   {8D8DFF}Los Santos Police Department{FFFFFF}                   {FFFFFF} {FFFFFF}");
	strcat(dialog, str);
	format(str, sizeof(str), "\n{FFFFFF}                   {FF8282}Araç Aranma Uyarýsý{FFFFFF}                   {FFFFFF} {FFFFFF}");
	strcat(dialog, str);
	format(str, sizeof(str), "\n\n{FF6347}Araç Modeli:");
	strcat(dialog, str);
	format(str, sizeof(str), "\n{FFFFFF} {FFFFFF} {FFFFFF} {FFFFFF}%s", lastBoloModel[playerid]);
	strcat(dialog, str);
	format(str, sizeof(str), "\n\n{FF6347}Araç Plakasý:");
	strcat(dialog, str);
	format(str, sizeof(str), "\n{FFFFFF} {FFFFFF} {FFFFFF} {FFFFFF}%s", lastBoloPlate[playerid]);
	strcat(dialog, str);
	format(str, sizeof(str), "\n\n{FF6347}Araç Suçlarý:");
	strcat(dialog, str);
	format(str, sizeof(str), "\n{FFFFFF} {FFFFFF} {FFFFFF} {FFFFFF}%s", lastBoloCrimes[playerid]);
	strcat(dialog, str);
	format(str, sizeof(str), "\n\n{FF6347}Araç Raporu:");
	strcat(dialog, str);
	format(str, sizeof(str), "\n{FFFFFF} {FFFFFF} {FFFFFF} {FFFFFF}%s", lastBoloReport[playerid]);
	strcat(dialog, str);
	format(str, sizeof(str), "\n\n{FFFFFF}ARAÇ BOLO'sunun rapor içerðini giriniz. Rapor için olayýn tamamýný yazmalýsýnýz.\nEðer rapor detaylarý bittiyse araç BOLO'sunu oluþturmak için kutucuða 'bitti' yazmanýz yeterli.");
	strcat(dialog, str);

	Dialog_Show(playerid, MDC_AddBolo_ReportOrDone, DIALOG_STYLE_INPUT, "Araç Aranma Uyarýsý", dialog, "Devam", "Ýptal Et");
	return 1;
}

Server:ShowMDCPage(playerid, page)
{
	PlayerTextDrawSetString(playerid, MDC_Main[playerid][7], sprintf("%s", MDC_GetPageName(playerid, page)));
  MDC_SideMenuColours(playerid, page);
	MDC_HideAfterPage(playerid);

    PlayerTextDrawSetString(playerid, MDC_Main[playerid][8], GetName(playerid));

    for(new is; is < 18; is++)
    {
        PlayerTextDrawShow(playerid, MDC_Main[playerid][is]);
    }

    switch(page)
    {
        case MDC_PAGE_MAIN:
        {
						PlayerTextDrawSetPreviewModel(playerid, MDC_MainScreen[playerid][0], PlayerData[playerid][pSkin]);
						PlayerTextDrawSetString(playerid, MDC_MainScreen[playerid][3], sprintf("%s_%s", Player_GetFactionRank(playerid), ReturnName(playerid)));

						new pd_count = 0,
						   warrants_count;
						foreach(new i : Player)
						{
								if(PlayerData[i][pLAWduty]) pd_count++;
								if(PlayerData[i][pActiveListing] == 1) warrants_count++;
						}

						PlayerTextDrawSetString(playerid, MDC_MainScreen[playerid][7], sprintf("%d %d", pd_count, warrants_count));
						PlayerTextDrawSetString(playerid, MDC_MainScreen[playerid][6], sprintf("%d %d %d",TotalWarants, TotalJailees, TotalFines));

      			for(new is; is < 8; is++)
            {
                PlayerTextDrawShow(playerid, MDC_MainScreen[playerid][is]);
            }
        }

        case MDC_PAGE_LOOKUP:
        {
					   for(new is; is < 4; is++)
					     {
					        PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][is]);
							PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][17]);
					    }
        }

				case MDC_PAGE_WARRANTS:
				{
					for(new is; is < 24; is++)
					{
					   	PlayerTextDrawShow(playerid, MDC_Warrants[playerid][is]);
					}
				}

				case MDC_PAGE_EMERGENCY:
				{
					//Show_EmergencyCalls(playerid);
				}

				case MDC_PAGE_ROSTER:
				{
					Show_Roster(playerid);
				}


				case MDC_PAGE_CCTV:
				{
					ShowCCTV_List(playerid);
				}


				case MDC_PAGE_VEHICLEBOLO:
				{
					Show_VehicleBolos(playerid);
				}
    }

    return 1;
}

Show_VehicleBolos(playerid, page = 1)
{
	// MDC_VehicleBolo_List
	MDC_HideAfterPage(playerid);
	PlayerTextDrawShow(playerid, MDC_VehicleBolo_List[playerid][0]);

	new countdown = 0;
	foreach(new i : VBolos) if(VehicleBolo[i][vBoloExists] == true)
	{
		if(countdown + 1 == 20)
		{
			PlayerTextDrawShow(playerid, MDC_VehicleBolo_List[playerid][20]);
			PlayerTextDrawShow(playerid, MDC_VehicleBolo_List[playerid][21]);
			return 1;
		}

		new bolo_info[256];
		format(bolo_info, sizeof(bolo_info), "%s, %s", VehicleBolo[i * page][vBoloPlate], VehicleBolo[i * page][vBoloModel]);
		PlayerTextDrawSetString(playerid, MDC_VehicleBolo_List[playerid][countdown+1], FixWord(bolo_info));
		PlayerTextDrawShow(playerid, MDC_VehicleBolo_List[playerid][countdown+1]);
		boloListID[playerid][countdown+1] = VehicleBolo[i * page][vBoloID];
		countdown++;
	}


	return 1;
}

ShowCCTV_List(playerid)
{
	new
		countdown = 0, sub[90];

	PlayerTextDrawSetString(playerid, MDC_CCTV[playerid][16], "CCTV LISTESI");
	PlayerTextDrawShow(playerid, MDC_CCTV[playerid][16]);

	foreach(new i : Cameras)
	{
		if(countdown > 13)
		{
			PlayerTextDrawShow(playerid, MDC_CCTV[playerid][14]);
			PlayerTextDrawShow(playerid, MDC_CCTV[playerid][15]);
			return 1;
		}

		format(sub, sizeof(sub), "%s_-[%s]~n~", CameraData[i][CameraName], GetStreet(CameraData[i][CameraLocation][0], CameraData[i][CameraLocation][1], CameraData[i][CameraLocation][2]));
		PlayerTextDrawSetString(playerid, MDC_CCTV[playerid][countdown], sub);
		PlayerTextDrawShow(playerid, MDC_CCTV[playerid][countdown]);
		Player_CCTVPage[playerid] = 1;
		countdown++;
	}
	return 1;
}

/*Show_EmergencyCalls(playerid)
{
	new countdown = 0;
	new strtext = 2;
	new listcountown = 0;
	for(new i = 0; i < 6; i++) if(EmergencyCall[i][callExists])
	{
		MDC_CallsID[i][playerid] = i;
		new string[1024];

		if(listcountown > 3)
			continue;


		format(string, sizeof(string), "%s_-_Numara:_%d~n~", EmergencyCall[i][calledName], EmergencyCall[i][calledNumber]);
		format(string, sizeof(string), "%s%s~n~", string, (EmergencyCall[i][calledService]) != 2 ? ("Polis") : ("EMT"));
		format(string, sizeof(string), "%s%s~n~", string, EmergencyCall[i][callerLocation]);
		format(string, sizeof(string), "%s%s~n~", string, MDC_Duzelt(EmergencyCall[i][callerSituation]));
		format(string, sizeof(string), "%s%s~n~", string, MDC_Duzelt(GetFullTime(EmergencyCall[i][callTime])));

		if(strlen(EmergencyCall[i][callTake]) == strlen("Yok"))
		{
			format(string, sizeof(string), "%s~r~Ele_alinmadi.", string);
		}
		else
		{
			format(string, sizeof(string), "%s%s_tarafindan_ele_alindi.", string, EmergencyCall[i][callTake]);
		}

		PlayerTextDrawSetString(playerid, MDC_Emergency[playerid][strtext], string);

		PlayerTextDrawShow(playerid, MDC_Emergency[playerid][strtext-1]);
		PlayerTextDrawShow(playerid, MDC_Emergency[playerid][strtext-2]);
		PlayerTextDrawShow(playerid, MDC_Emergency[playerid][strtext]);
		PlayerTextDrawShow(playerid, MDC_Emergency[playerid][strtext+2]);

		if(strlen(EmergencyCall[i][callTake]) == strlen("Yok"))
		{
			PlayerTextDrawShow(playerid, MDC_Emergency[playerid][strtext+1]);
		}

		listcountown++;
		strtext+=5;
		countdown++;

		if(i > 3)
		{
			PlayerTextDrawShow(playerid, MDC_Emergency[playerid][20]);
			PlayerTextDrawShow(playerid, MDC_Emergency[playerid][21]);
		}
	}

	if(countdown == 0)
		return SendErrorMessage(playerid, "Aktif çaðrý yok.");

	return 1;
}*/

Show_Roster(playerid, page = 1)
{

	return 1;
}

GetRosterMembers()
{
	new
		primary[72], sub[24];

	foreach(new pid : Player)
	{
	  foreach(new unitid : Units) if(UnitData[unitid][unitExists])
	  {
				for(new empty = 0; empty < 4; ++empty)
					{
						if(UnitData[unitid][unitMember][empty] != -1)
						{
							if(!strmatch(PlayerData[pid][pUnit], UnitData[unitid][unitName]))
								continue;

							format(sub, sizeof(sub), "%s__", Get_MDCRosterName(pid));
							strcat(primary, sub);
						}
					}
	  }
	}
  return primary;
}

Get_MDCRosterName(id)
{
	new playerName[MAX_PLAYER_NAME];
	GetPlayerName(id, playerName, sizeof (playerName));
	new pos = strfind(playerName, "_");
	strdel(playerName, 0, pos + 1);

	new name[2];
	format(name, 2, "%s", ReturnName(id, 0));

	new str[32];

	format(str, 32, "%s.%s", name, playerName);
	return str;
}

stock MDC_LOOKUP_SelectOption(playerid, option)
{
	for(new i = 0; i < 2; i++)
	{
			PlayerTextDrawBoxColor(playerid, MDC_LookUp_Name[playerid][i], 0xAAAAAAFF);
			PlayerTextDrawColor(playerid, MDC_LookUp_Name[playerid][i], 0x333333FF);
			PlayerTextDrawBoxColor(playerid, MDC_LookUp_Name[playerid][17], 0xAAAAAAFF);
			PlayerTextDrawColor(playerid, MDC_LookUp_Name[playerid][17], 0x333333FF);
	}

	switch(option)
	{
		case MDC_PAGE_LOOKUP_NAME:
		{
			PlayerTextDrawHide(playerid, MDC_LookUp_Name[playerid][0]);
			PlayerTextDrawBoxColor(playerid, MDC_LookUp_Name[playerid][0], 0x333333FF);
			PlayerTextDrawColor(playerid, MDC_LookUp_Name[playerid][0], 0xAAAAAAFF);
			PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][0]);
			PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][1]);
			PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][17]);
			SetPVarInt(playerid, "MDC_SearchMode", 1);
		}
		case MDC_PAGE_LOOKUP_PLATE:
		{
			PlayerTextDrawHide(playerid, MDC_LookUp_Name[playerid][1]);
			PlayerTextDrawBoxColor(playerid, MDC_LookUp_Name[playerid][1], 0x333333FF);
			PlayerTextDrawColor(playerid, MDC_LookUp_Name[playerid][1], 0xAAAAAAFF);
			PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][1]);
			PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][0]);
			PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][17]);
			SetPVarInt(playerid, "MDC_SearchMode", 2);
		}
		case MDC_PAGE_LOOKUP_BUILDING:
		{
			PlayerTextDrawHide(playerid, MDC_LookUp_Name[playerid][17]);
			PlayerTextDrawBoxColor(playerid, MDC_LookUp_Name[playerid][17], 0x333333FF);
			PlayerTextDrawColor(playerid, MDC_LookUp_Name[playerid][17], 0xAAAAAAFF);
			PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][1]);
			PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][0]);
			PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][17]);
			SetPVarInt(playerid, "MDC_SearchMode", 3);
		}
	}
	return 1;
}

stock MDC_SideMenuColours(playerid, page)
{
    for(new i = 10; i < 18; i++)
    {
        PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][i], 0xAAAAAAFF);
				PlayerTextDrawColor(playerid, MDC_Main[playerid][i], 0x333333FF);
    }

    switch(page)
    {
        case MDC_PAGE_MAIN:
				{
				PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][10], 0x333333FF);
				PlayerTextDrawColor(playerid, MDC_Main[playerid][10], 0xAAAAAAFF);
				}
        case MDC_PAGE_LOOKUP:
				{
				PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][11], 0x333333FF);
				PlayerTextDrawColor(playerid, MDC_Main[playerid][11], 0xAAAAAAFF);
				}
				case MDC_PAGE_WARRANTS:
				{
				PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][12], 0x333333FF);
				PlayerTextDrawColor(playerid, MDC_Main[playerid][12], 0xAAAAAAFF);
				}
				case MDC_PAGE_EMERGENCY:
				{
				PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][13], 0x333333FF);
				PlayerTextDrawColor(playerid, MDC_Main[playerid][13], 0xAAAAAAFF);
				}
				case MDC_PAGE_ROSTER:
				{
				PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][14], 0x333333FF);
				PlayerTextDrawColor(playerid, MDC_Main[playerid][14], 0xAAAAAAFF);
				}
				case MDC_PAGE_CCTV:
				{
				PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][15], 0x333333FF);
				PlayerTextDrawColor(playerid, MDC_Main[playerid][15], 0xAAAAAAFF);
				}
				case MDC_PAGE_VEHICLEBOLO:
				{
				PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][16], 0x333333FF);
				PlayerTextDrawColor(playerid, MDC_Main[playerid][16], 0xAAAAAAFF);
				}
    }

    return 1;
}

MDC_GetPageName(playerid, page)
{
	new factionstats;
	new factionid = PlayerData[playerid][pFaction];

	if(strfind(FactionData[factionid][FactionName], "Los Santos Sheriff Department", true) != -1)
	{
		factionstats = 2;
		PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][1], 324608767);
	}
	else
	{
		factionstats = 1;
		PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][1], 203444479);
	}

	new pagename[128];
	switch(page)
	{
		case MDC_PAGE_MAIN: format(pagename, 128, sprintf("%s", factionstats != 2 ? ("Los Santos Police Department") : ("Los Santos Sheriff Department")));
		case MDC_PAGE_LOOKUP: format(pagename, 128, sprintf("%s_~>~_Sorgula", factionstats != 2 ? ("POLICE") : ("SHERIFF")));
		case MDC_PAGE_WARRANTS: format(pagename, 128, sprintf("%s_~>~_Aranmalar", factionstats != 2 ? ("POLICE") : ("SHERIFF")));
		case MDC_PAGE_EMERGENCY: format(pagename, 128, sprintf("%s_~>~_Cagrilar", factionstats != 2 ? ("POLICE") : ("SHERIFF")));
		case MDC_PAGE_ROSTER: format(pagename, 128, sprintf("%s_~>~_Liste", factionstats != 2 ? ("POLICE") : ("SHERIFF")));
		case MDC_PAGE_DATABASE: format(pagename, 128, sprintf("%s_~>~_Veritabani", factionstats != 2 ? ("POLICE") : ("SHERIFF")));
		case MDC_PAGE_CCTV: format(pagename, 128, sprintf("%s_~>~_CCTV", factionstats != 2 ? ("POLICE") : ("SHERIFF")));
		case MDC_PAGE_STAFF: format(pagename, 128, sprintf("%s_~>~_Yetkili", factionstats != 2 ? ("POLICE") : ("SHERIFF")));
		case MDC_PAGE_VEHICLEBOLO: format(pagename, 128, sprintf("%s_~>~_ARAC_BOLOLARI", factionstats != 2 ? ("POLICE") : ("SHERIFF")));
	}
	return pagename;
}

stock AddPenalCode(playerid, charges)
{
	Send_MDCMessage(playerid, COLOR_COP, sprintf("** HQ Duyurusu: %s %s, %s adlý kiþiye karþý deðiþiklik uyguladý. (%d dakika, %s)", Player_GetFactionRank(playerid), ReturnName(playerid, 1), MDC_PlayerLastSearched[playerid], GetCrimeMinute(charges), GetCrimeName(charges)));
	return 1;
}

stock GetCrimeMinute(chargeid)
{
	new query[75], minute;
	mysql_format(m_Handle, query, sizeof(query), "SELECT minute FROM penalcode WHERE id = %i LIMIT 1", chargeid);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name_int(0, "minute", minute);
	cache_delete(cache);
	return minute;
}

stock GetCrimeName(chargeid)
{
	new query[75], detail[256];
	mysql_format(m_Handle, query, sizeof(query), "SELECT crime FROM penalcode WHERE id = %i LIMIT 1", chargeid);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name(0, "crime", detail);
	cache_delete(cache);
	return detail;
}

stock EditPenalCodeButon(playerid, Float:Y)
{
	PlayerTextDrawHide(playerid, MDC_PenalCode[playerid][32]);
	PlayerTextDrawHide(playerid, MDC_PenalCode[playerid][30]);

	MDC_PenalCode[playerid][32] = CreatePlayerTextDraw(playerid, 488.903076, Y, "~>~Uygula");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][32], 0.151998, 0.923198);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][32], 522.401123, 10.109999);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][32], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][32], -1145324545);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][32], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][32], -1877270017);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][32], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][32], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][32], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][32], 2);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][32], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][32], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][32], true);

	MDC_PenalCode[playerid][30] = CreatePlayerTextDraw(playerid, 364.403167, Y, "~>~Temizle");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][30], 0.151998, 0.923198);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][30], 396.499114, 10.109999);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][30], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][30], -1145324545);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][30], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][30], 741092607);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][30], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][30], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][30], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][30], 2);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][30], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][30], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][30], true);

	PlayerTextDrawShow(playerid, MDC_PenalCode[playerid][32]);
	PlayerTextDrawShow(playerid, MDC_PenalCode[playerid][30]);
	return 1;
}

stock ChangePenalCodeButton(playerid, i)
{

	for(new is = 1; is < 20; is++)
	{
		PlayerTextDrawHide(playerid, MDC_PenalCode[playerid][is]);
		PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][is], 0xAAAAAAFF);
		PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][is], 0x333333FF);
		PlayerTextDrawShow(playerid, MDC_PenalCode[playerid][is]);
	}

	PlayerTextDrawHide(playerid, MDC_PenalCode[playerid][i]);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][i], 0x333333FF);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][i], 0xAAAAAAFF);
	PlayerTextDrawShow(playerid, MDC_PenalCode[playerid][i]);

	return 1;
}

stock MDC_SelectedCharges(playerid, charges)
{
	PlayerTextDrawHide(playerid, MDC_PenalCode[playerid][23]);
	PlayerTextDrawHide(playerid, MDC_PenalCode[playerid][24]);

	new details[256];
	new details2[256];

	format(details, sizeof(details), "%s", GetFirstCrimeDetail(charges)); // detay 1 çekilecek (sql)
	format(details2, sizeof(details2), "%s", GetSecondaryCrimeDetail(charges)); // detay 1 çekilecek (sql)

	PlayerTextDrawSetString(playerid, MDC_PenalCode[playerid][23], FixPenalCodeWord(details));
	PlayerTextDrawSetString(playerid, MDC_PenalCode[playerid][24], FixPenalCodeWord(details2));

	PlayerTextDrawShow(playerid, MDC_PenalCode[playerid][23]);
	PlayerTextDrawShow(playerid, MDC_PenalCode[playerid][24]);
	PlayerTextDrawShow(playerid, MDC_PenalCode[playerid][25]);
	SetPVarInt(playerid, "SelectedCharge", charges);
}

stock GetFirstCrimeDetail(chargeid)
{
	new query[75], detail[256];
	mysql_format(m_Handle, query, sizeof(query), "SELECT crime_detail FROM penalcode WHERE id = %i LIMIT 1", chargeid);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name(0, "crime_detail", detail);
	cache_delete(cache);
	return detail;
}

stock GetSecondaryCrimeDetail(chargeid)
{
	new query[75], detail[256];
	mysql_format(m_Handle, query, sizeof(query), "SELECT crime_detail2 FROM penalcode WHERE id = %i LIMIT 1", chargeid);
	new Cache: cache = mysql_query(m_Handle, query);
	cache_get_value_name(0, "crime_detail2", detail);
	cache_delete(cache);
	return detail;
}

stock MDC_ShowMultipleAdress(playerdbid, playerid)
{
	MDC_HideAfterPage(playerid);

		new Float:houseX[3], Float:houseY[3], Float:houseZ[3];
		new id;
		new countdown = 0;

		new query_properties[128];
		mysql_format(m_Handle, query_properties, sizeof(query_properties), "SELECT * FROM properties WHERE OwnerSQL = %i", playerdbid);
		new Cache:cache = mysql_query(m_Handle, query_properties);

		if(cache_num_rows())
		{
			for(new i = 0; i < cache_num_rows(); i++)
			{
				cache_get_value_name_int(i, "id", id);
				cache_get_value_name_float(i, "ExteriorX", houseX[i]);
				cache_get_value_name_float(i, "ExteriorY", houseY[i]);
				cache_get_value_name_float(i, "ExteriorZ", houseZ[i]);
				countdown = i;
				MDC_MaxAdress_DBID[playerid][i] = id;
				MDC_MaxAdress_DB_Pos[playerid][i][0] = houseX[i];
				MDC_MaxAdress_DB_Pos[playerid][i][1] = houseY[i];
				MDC_MaxAdress_DB_Pos[playerid][i][2] = houseZ[i];
			}


			PlayerTextDrawSetString(playerid, MDC_AdressDetails[playerid][2], sprintf("%i_%s~n~%s~n~%s_%d~n~San_Andreas", MDC_MaxAdress_DBID[playerid][0], GetStreet(houseX[0], houseY[0], houseZ[0]), GetZoneName(houseX[0], houseY[0], houseZ[0]), GetCityName(houseX[0], houseY[0], houseZ[0]), ReturnAreaCode(GetZoneID(houseX[0], houseY[0], houseZ[0]))));

			if(countdown >= 0)
				{
					PlayerTextDrawShow(playerid, MDC_AdressDetails[playerid][5]);
					PlayerTextDrawSetString(playerid, MDC_AdressDetails[playerid][5], sprintf("- %i_%s_%s", MDC_MaxAdress_DBID[playerid][0], GetStreet(houseX[0], houseY[0], houseZ[0]), GetZoneName(houseX[0], houseY[0], houseZ[0])));
				}
			if(countdown >= 1)
				{
					PlayerTextDrawShow(playerid, MDC_AdressDetails[playerid][6]);
					PlayerTextDrawSetString(playerid, MDC_AdressDetails[playerid][6], sprintf("- %i_%s_%s", MDC_MaxAdress_DBID[playerid][1], GetStreet(houseX[1], houseY[1], houseZ[1]), GetZoneName(houseX[1], houseY[1], houseZ[1])));
				}
				if(countdown >= 2)
					{
						PlayerTextDrawShow(playerid, MDC_AdressDetails[playerid][7]);
						PlayerTextDrawSetString(playerid, MDC_AdressDetails[playerid][7], sprintf("- %i_%s_%s", MDC_MaxAdress_DBID[playerid][2], GetStreet(houseX[2], houseY[2], houseZ[2]), GetZoneName(houseX[2], houseY[2], houseZ[2])));
					}
	}
	cache_delete(cache);

	PlayerTextDrawShow(playerid, MDC_AdressDetails[playerid][0]);
	PlayerTextDrawShow(playerid, MDC_AdressDetails[playerid][1]);
	PlayerTextDrawShow(playerid, MDC_AdressDetails[playerid][2]);
	PlayerTextDrawShow(playerid, MDC_AdressDetails[playerid][3]);
	return 1;
}

stock MDC_ShowPenalCode(playerid)
{
	MDC_HideAfterPage(playerid);

	PlayerTextDrawShow(playerid, MDC_PenalCode[playerid][0]);
	PlayerTextDrawShow(playerid, MDC_PenalCode[playerid][21]);
	PlayerTextDrawShow(playerid, MDC_PenalCode[playerid][22]);

	ShowPenalCode(playerid);

	//new tdid = 1;
	/*for(new i = 0; i < MAX_PENALCODE; i++) if(PenalData[i][penalExists])
	{
		PlayerTextDrawSetString(playerid, MDC_PenalCode[playerid][tdid], PenalData[i][penalName]);
		PlayerTextDrawShow(playerid, MDC_PenalCode[playerid][tdid]);

		format(MDC_PenalCodeData[playerid][i], 512, PenalData[i][penalName]);
		format(MDC_PenalCodeData_Details[playerid][i], 512, PenalData[i][penalDetail]);
		tdid++;
	}*/

	/*for(new pstrings = 1; pstrings < 20; pstrings++) //
	{
		PlayerTextDrawSetString(playerid, MDC_PenalCode[playerid][pstrings], PenalData[pstrings][crimeName]);
		PlayerTextDrawShow(playerid, MDC_PenalCode[playerid][pstrings]);
	}*/
	return 1;
}

ShowPenalCode(playerid, page = 1)
{
    new lookupQuery[200];
    mysql_format(m_Handle, lookupQuery, sizeof lookupQuery, "SELECT id, crime FROM penalcode WHERE used = 1 ORDER BY id ASC LIMIT %d, 19", page);
    mysql_tquery(m_Handle, lookupQuery, "OnPenalCodeLookUp", "i", playerid);
    return 1;
}

Server:OnPenalCodeLookUp(playerid)
{
    if(!cache_num_rows())
        return 1;

    new crime_name[128], countdown = 1, id;
    for(new i = 0, j = cache_num_rows(); i < j; i++)
    {
        cache_get_value_name(i, "crime", crime_name, 256);
				cache_get_value_name_int(i, "id", Player_PenalID[playerid][i]);

				PlayerTextDrawSetString(playerid, MDC_PenalCode[playerid][countdown], crime_name);
				PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][countdown], 0xAAAAAAFF);
				PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][countdown], 0x333333FF);
				PlayerTextDrawShow(playerid, MDC_PenalCode[playerid][countdown]);
				countdown++;
    }

    return 1;
}

stock MDC_ShowManageLicense(playerdbid, playerid)
{
	MDC_HideAfterPage(playerid);

	foreach(new players : Player)
	{
		if(PlayerData[players][pSQLID] == playerdbid)
		{
			PlayerTextDrawSetString(playerid, MDC_ManageLicense[playerid][5], sprintf("%s~n~%d", (PlayerData[players][pDriversLicense] != true) ? ("Mevcut_Degil") : ("Mevcut"), PlayerData[players][DriversLicenseWarning]));
			PlayerTextDrawSetString(playerid, MDC_ManageLicense[playerid][19], sprintf("%s", (PlayerData[players][pWeaponsLicense] != true) ? ("Mevcut_Degil") : ("Mevcut")));
			PlayerTextDrawSetString(playerid, MDC_ManageLicense[playerid][13], sprintf("%s", (PlayerData[players][pMedicalLicense] != true) ? ("Mevcut_Degil") : ("Mevcut")));

			for(new is; is < 34; is++)
			{
				PlayerTextDrawShow(playerid, MDC_ManageLicense[playerid][is]);
			}
			return 1;
		}
	}

	new query_properties[128];
	mysql_format(m_Handle, query_properties, sizeof(query_properties), "SELECT * FROM players WHERE id = %i", playerdbid);

	new DriverLicenses, WeaponsLicenses, DriverWarning, licensewarning, driverlicensesus, MedicalLicense;
	if(cache_num_rows())
	{
		cache_get_value_name_int(0, "DriversLicense", DriverLicenses);
		cache_get_value_name_int(0, "DriversLicenseWarning", DriverWarning);

		cache_get_value_name_int(0, "WeaponsLicense", WeaponsLicenses);
		cache_get_value_name_int(0, "DriversLicenseWarning", licensewarning);
		cache_get_value_name_int(0, "DriversLicenseSuspend", driverlicensesus);
		cache_get_value_name_int(0, "MedicalLicense", MedicalLicense);
	}

	PlayerTextDrawSetString(playerid, MDC_ManageLicense[playerid][5], sprintf("%s~n~%d", (DriverLicenses != 1) ? ("Mevcut_Degil") : ("Mevcut"), licensewarning));
	PlayerTextDrawSetString(playerid, MDC_ManageLicense[playerid][19], sprintf("%s", (WeaponsLicenses != 1) ? ("Mevcut_Degil") : ("Mevcut")));
	PlayerTextDrawSetString(playerid, MDC_ManageLicense[playerid][13], sprintf("%s", (MedicalLicense != 1) ? ("Mevcut_Degil") : ("Mevcut")));

	for(new is; is < 34; is++)
	{
		PlayerTextDrawShow(playerid, MDC_ManageLicense[playerid][is]);
	}
	return 1;
}


Dialog:MDC_LookUp_EnterBox(playerid, response, listitem, inputtext[])
{
	if(!response) return 1;

	 if(response)
	{
			new sorgu[144];
			if(GetPVarInt(playerid,"MDC_SearchMode") == 1)
			{
				format(sorgu, sizeof(sorgu), "SELECT * FROM `players` WHERE `Name` = '%s'", inputtext);
				mysql_tquery(m_Handle, sorgu, "KisiSorgula", "sdd", inputtext, playerid, 0);
			}

			if(GetPVarInt(playerid,"MDC_SearchMode") == 2)
			{
				if(strfind(inputtext, "id", true) != -1)
				{
					MDC_SearchVehicleWithID(playerid, inputtext);
					return 1;
				}
			format(sorgu, sizeof(sorgu), "SELECT * FROM `vehicles` WHERE `Plate` = '%s'", inputtext);
			mysql_tquery(m_Handle, sorgu, "KisiSorgula", "sdd", inputtext, playerid, 1);
			}
	}
  return 1;
}

forward MDC_SearchVehicleWithID(playerid, text[]); public MDC_SearchVehicleWithID(playerid, text[])
{
	new text2[2][12];
	split(text, text2, ':');
	new vehid = strval(text2[1]);

	if(!IsValidVehicle(vehid))
	{
		Dialog_Show(playerid, MDC_LookUp_EnterBox, DIALOG_STYLE_INPUT, "Veri Girin", "HATA: Bu ID'ye ait bir araç bulunamadý.\n\nKimi arýyorsunuz?\nPlaka aramasýysa direkt olarak plakayý gir.\nAraç ID üzerindense, 'id:ARAÇID' þeklinde girmelisin (örn: id:120)", "Ara", "Vazgeç");
		return 1;
	}

	for(new i = 0; i < sizeof dmv_vehicles; i++) if(vehid == dmv_vehicles[i])
	{
		Dialog_Show(playerid, MDC_LookUp_EnterBox, DIALOG_STYLE_INPUT, "Veri Girin", "HATA: Bu ID'ye ait bir araç bulunamadý.\n\nKimi arýyorsunuz?\nPlaka aramasýysa direkt olarak plakayý gir.\nAraç ID üzerindense, 'id:ARAÇID' þeklinde girmelisin (örn: id:120)", "Ara", "Vazgeç");
		return 1;
	}

	if(vehid < 12)
	{
		Dialog_Show(playerid, MDC_LookUp_EnterBox, DIALOG_STYLE_INPUT, "Veri Girin", "HATA: Bu ID'ye ait bir araç bulunamadý.\n\nKimi arýyorsunuz?\nPlaka aramasýysa direkt olarak plakayý gir.\nAraç ID üzerindense, 'id:ARAÇID' þeklinde girmelisin (örn: id:120)", "Ara", "Vazgeç");
		return 1;
	}

	for(new is = 4; is < 18; is++)
	{
		PlayerTextDrawHide(playerid, MDC_LookUp_Name[playerid][is]);
		PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][17]);
	}

	Hide_PageAttachement(playerid);

	PlayerTextDrawSetString(playerid, MDC_LookUp_Name[playerid][4], sprintf("id:%d", vehid)); // aranma boþluðunun metni elleme
	PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][4]);

	PlayerTextDrawSetPreviewModel(playerid, MDC_LookUp_Vehicle[playerid][0], CarData[vehid][carModel]); // veritabanýndan araç modeli çek mustafa
	PlayerTextDrawSetPreviewVehCol(playerid, MDC_LookUp_Vehicle[playerid][0], CarData[vehid][carColor1], CarData[vehid][carColor2]); // burda ise veritabanýndan aracýn rengi
	PlayerTextDrawShow(playerid, MDC_LookUp_Vehicle[playerid][0]);
	PlayerTextDrawShow(playerid, MDC_LookUp_Vehicle[playerid][5]);

	new vehicle_details[72];
	format(vehicle_details, sizeof(vehicle_details), "%s~n~%s~n~%s~n~~r~Level_%d~n~%s", ReturnVehicleModelName(GetVehicleModel(vehid)), CarData[vehid][carPlates], ReturnSQLName(CarData[vehid][carOwnerID]), CarData[vehid][carInsurance], CarData[vehid][carImpounded] != 1 ? ("~l~Hayir") : ("~r~Evet"));
	PlayerTextDrawSetString(playerid, MDC_LookUp_Vehicle[playerid][10], vehicle_details);
	PlayerTextDrawShow(playerid, MDC_LookUp_Vehicle[playerid][10]);
	return 1;
}

forward KisiSorgula(text[], playerid, secenek); public KisiSorgula(text[], playerid, secenek)
{
	new rows, fields;
	cache_get_row_count(rows);
	cache_get_field_count(fields);
	if(!rows)
	{
		switch(secenek)
		{
			case 0:
				Dialog_Show(playerid, MDC_LookUp_EnterBox, DIALOG_STYLE_INPUT, "Veri Girin", "HATA: Bu isimle kayýtlý vatandaþ bulunamadý.\n\nKimi arýyorsunuz?", "Ara", "Vazgeç");

			case 1:
			{

					Dialog_Show(playerid, MDC_LookUp_EnterBox, DIALOG_STYLE_INPUT, "Veri Girin", "HATA: Bu plakayla kayýtlý araç bulunamadý.\n\nKimi arýyorsunuz?\nPlaka aramasýysa direkt olarak plakayý gir.\nAraç ID üzerindense, 'id:ARAÇID' þeklinde girmelisin (örn: id:120)", "Ara", "Vazgeç");
			}
		}
		return true;
	}

	format(MDC_PlayerLastSearched[playerid], 24, text);
	for(new is = 4; is < 18; is++)
	{
		PlayerTextDrawHide(playerid, MDC_LookUp_Name[playerid][is]);
		PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][17]);
	}

	Hide_PageAttachement(playerid);

	PlayerTextDrawSetString(playerid, MDC_LookUp_Name[playerid][4], text); // aranma boþluðunun metni elleme
	PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][4]);

	switch(GetPVarInt(playerid,"MDC_SearchMode"))
	{
		case 1:
		{
			new Skin;
			new Name[24];
			new playerNumber;
			new JailTimes;
			new DriverLicenses;
			new GunLicenses;
			new MedicalLicenses;
			new playerdbid;

			cache_get_value_name_int(0, "id", playerdbid);
			cache_get_value_name_int(0, "Skin", Skin);
			cache_get_value_name(0, "Name", Name);
			cache_get_value_name_int(0, "PhoneNumber", playerNumber);
			cache_get_value_name_int(0, "DriversLicense", DriverLicenses);
			cache_get_value_name_int(0, "WeaponsLicense", GunLicenses);
			cache_get_value_name_int(0, "MedicalLicense", MedicalLicenses);
			cache_get_value_name_int(0, "JailTimes", JailTimes);

			new
				primary[600], sub[128];

			format(sub, sizeof(sub), "%s~n~", Name);
			strcat(primary, sub);

			format(sub, sizeof(sub), "%d~n~", playerNumber);
			strcat(primary, sub);


			if(JailTimes != 0)
			{
				format(sub, sizeof(sub), "%d_kere_hapis~n~", JailTimes);
				strcat(primary, sub);
			}else
			{
				format(sub, sizeof(sub), "Yok~n~");
				strcat(primary, sub);
			}


			if(DriverLicenses != 0)
			{
				format(sub, sizeof(sub), "Surucu_");
				strcat(primary, sub);
			}

			if(GunLicenses != 0)
			{
				format(sub, sizeof(sub), "Silah_");
				strcat(primary, sub);
			}

			if(MedicalLicenses != 0)
			{
				format(sub, sizeof(sub), "Medikal_");
				strcat(primary, sub);
			}

			format(sub, sizeof(sub), "~n~%s", FixWord(GetPlayerAdressList(playerdbid)));
			strcat(primary, sub);


			PlayerTextDrawSetString(playerid, MDC_LookUp_Name[playerid][8], primary);

			new criminal_query[128], criminaltext[24];

			mysql_format(m_Handle, criminal_query, sizeof(criminal_query), "SELECT * FROM criminal_record WHERE player_name = '%s'", MDC_PlayerLastSearched[playerid]);
			new Cache:cache = mysql_query(m_Handle, criminal_query);

			if(!cache_num_rows())
			{
				format(criminaltext, 24, "Sabika_kaydi_yok.");
				PlayerTextDrawSetSelectable(playerid, MDC_LookUp_Name[playerid][14], false);
			}else
			{
				format(criminaltext, 24, "devamini_oku...");
				PlayerTextDrawSetSelectable(playerid, MDC_LookUp_Name[playerid][14], true);
			}
			cache_delete(cache);

			PlayerTextDrawSetString(playerid, MDC_LookUp_Name[playerid][14], criminaltext); // criminal

			PlayerTextDrawSetPreviewModel(playerid, MDC_LookUp_Name[playerid][5], Skin); // burada çekilen skin database skin ile deðiþecek

			format(MDC_PlayerLastSearched[playerid], 24, "%s", Name);
			MDC_PlastLastSearched_SQLID[playerid] = playerdbid;

			for(new is = 4; is < 18; is++)
			{
				PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][is]);
			}

			if(GetPlayerAdress(playerdbid) < 1)
			{
				PlayerTextDrawHide(playerid, MDC_LookUp_Name[playerid][9]);
			}
		}
		case 2:
		{

			new vModel, vColor1, vColor2, carPlate[24], ownerid, carInsur, carimpound;

			cache_get_value_name_int(0, "ModelID", vModel);
			cache_get_value_name_int(0, "Color1", vColor1);
			cache_get_value_name_int(0, "Color2", vColor2);
			cache_get_value_name(0, "Plate", carPlate, 24);
			cache_get_value_name_int(0, "OwnerID", ownerid);
			cache_get_value_name_int(0, "Insurance", carInsur);
			cache_get_value_name_int(0, "Impounded", carimpound);

			PlayerTextDrawSetString(playerid, MDC_LookUp_Name[playerid][4], carPlate); // aranma boþluðunun metni elleme
			PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][4]);


			PlayerTextDrawSetPreviewModel(playerid, MDC_LookUp_Vehicle[playerid][0], vModel); // veritabanýndan araç modeli çek mustafa
			PlayerTextDrawSetPreviewVehCol(playerid, MDC_LookUp_Vehicle[playerid][0], vColor1, vColor2); // burda ise veritabanýndan aracýn rengi
			PlayerTextDrawShow(playerid, MDC_LookUp_Vehicle[playerid][0]);
			PlayerTextDrawShow(playerid, MDC_LookUp_Vehicle[playerid][5]);

			new vehicle_details[72];
			format(vehicle_details, sizeof(vehicle_details), "%s~n~%s~n~%s~n~~r~Level_%d~n~%s", ReturnVehicleModelName(vModel),  carPlate, ReturnSQLName(ownerid), carInsur, (carimpound != 1) ? ("~l~HAYIR") : ("~r~Evet"));
			PlayerTextDrawSetString(playerid, MDC_LookUp_Vehicle[playerid][10], vehicle_details);
			PlayerTextDrawShow(playerid, MDC_LookUp_Vehicle[playerid][10]);
		}
	}
	return 1;
}

GetPlayerAdress(playerdbid)
{
	new str;

		new query_properties[128];
		mysql_format(m_Handle, query_properties, sizeof(query_properties), "SELECT * FROM properties WHERE OwnerSQL = %i", playerdbid);
		new Cache:cache = mysql_query(m_Handle, query_properties);

		if(!cache_num_rows())
		{
			str = 0;
			cache_delete(cache);
		}
		else
		{
			for(new i = 0; i < cache_num_rows(); i++)
			{
				str = i;
			}
			return str;
		}
	return str;
}

GetPlayerAdressList(playerdbid)
{
	new str[256];

		new query_properties[128], gethouseadress[1287];
		mysql_format(m_Handle, query_properties, sizeof(query_properties), "SELECT * FROM properties WHERE OwnerSQL = %i", playerdbid);
		new Cache:cache = mysql_query(m_Handle, query_properties);

		if(!cache_num_rows())
		{
			format(gethouseadress, sizeof(gethouseadress), "Yok");
		}
		else
		{
			new Float:houseX, Float:houseY, Float:houseZ;
			cache_get_value_name_float(0, "ExteriorX", houseX);
			cache_get_value_name_float(0, "ExteriorY", houseY);
			cache_get_value_name_float(0, "ExteriorZ", houseZ);

			format(str, sizeof(str), "%s~n~%s~n~%s_%i", GetStreet(houseX, houseY, houseZ), GetZoneName(houseX, houseY, houseZ), GetCityName(houseX, houseY, houseZ), ReturnAreaCode(GetZoneID(houseX, houseY, houseZ)));
		}
	cache_delete(cache);
	return str;
}

stock MDC_LookUp_Refresh(playerid)
{
	for(new is = 0; is < 17; is++)
	{
		PlayerTextDrawHide(playerid, MDC_LookUp_Vehicle[playerid][is]);
	}


	for(new is = 4; is < 18;is++)
	{
		PlayerTextDrawHide(playerid, MDC_LookUp_Name[playerid][is]);
		PlayerTextDrawShow(playerid, MDC_LookUp_Name[playerid][17]);
	}

	for(new is = 0; is < 34; is++)
	{
		PlayerTextDrawHide(playerid, MDC_PenalCode[playerid][is]);
	}

	for(new is = 0; is < 34; is++)
	{
		PlayerTextDrawHide(playerid, MDC_ManageLicense[playerid][is]);
	}
	return 1;
}


stock MDC_Hide(playerid)
{
	for(new is; is < 18; is++)
	{
		PlayerTextDrawHide(playerid, MDC_Main[playerid][is]);
	}

	for(new is; is < 22; is++)
	{
		PlayerTextDrawHide(playerid, MDC_VehicleBolo_List[playerid][is]);
	}

	for(new is; is < 6; is++)
	{
		PlayerTextDrawHide(playerid, MDC_VehicleBolo_Details[playerid][is]);
	}

	for(new is; is < 8; is++)
	{
		PlayerTextDrawHide(playerid, MDC_MainScreen[playerid][is]);
	}

	for(new is; is < 18; is++)
	{
		PlayerTextDrawHide(playerid, MDC_LookUp_Name[playerid][is]);
	}


	for(new is; is < 17; is++)
	{
		PlayerTextDrawHide(playerid, MDC_CCTV[playerid][is]);
	}

	for(new is = 0; is < 17; is++)
	{
		PlayerTextDrawHide(playerid, MDC_LookUp_Vehicle[playerid][is]);
	}

	for(new is = 0; is < 13; is++)
	{
		PlayerTextDrawHide(playerid, MDC_AdressDetails[playerid][is]);
	}

	for(new is = 0; is < 34; is++)
	{
		PlayerTextDrawHide(playerid, MDC_ManageLicense[playerid][is]);
	}

	for(new is = 0; is < 5; is++)
	{
	 	PlayerTextDrawHide(playerid, MDC_EmergencyDetails[playerid][is]);
	}

	for(new is = 0; is < 34; is++)
	{
		PlayerTextDrawHide(playerid, MDC_PenalCode[playerid][is]);
	}

	for(new is; is < 24; is++)
	{
		PlayerTextDrawHide(playerid, MDC_Emergency[playerid][is]);
	}

	for(new is; is < 24; is++)
	{
		PlayerTextDrawHide(playerid, MDC_Warrants[playerid][is]);
	}

	for(new is; is < 21; is++)
	{
		PlayerTextDrawHide(playerid, MDC_Roster[playerid][is]);
	}

	for(new is = 0; is < 24; is++)
	{
	 	PlayerTextDrawHide(playerid, MDC_CrimeHistory[playerid][is]);
	}

	for(new is = 0; is < 5; is++)
	{
	 	PlayerTextDrawHide(playerid, MDC_SelectedCrimeDetails[playerid][is]);
	}


	SetPVarInt(playerid, "MDC_SearchMode", 0);
	CancelSelectTextDraw(playerid);
	return 1;
}

stock MDC_HideAfterPage(playerid)
{
	for(new is; is < 8; is++)
	{
		PlayerTextDrawHide(playerid, MDC_MainScreen[playerid][is]);
	}

	for(new is; is < 6; is++)
	{
		PlayerTextDrawHide(playerid, MDC_VehicleBolo_Details[playerid][is]);
	}

	for(new is; is < 22; is++)
	{
		PlayerTextDrawHide(playerid, MDC_VehicleBolo_List[playerid][is]);
	}

	for(new is; is < 18; is++)
	{
		PlayerTextDrawHide(playerid, MDC_LookUp_Name[playerid][is]);
	}

	for(new is = 0; is < 17; is++)
	{
		PlayerTextDrawHide(playerid, MDC_LookUp_Vehicle[playerid][is]);
	}

	for(new is = 0; is < 24; is++)
	{
	 	PlayerTextDrawHide(playerid, MDC_CrimeHistory[playerid][is]);
	}

	for(new is = 0; is < 5; is++)
	{
	 	PlayerTextDrawHide(playerid, MDC_SelectedCrimeDetails[playerid][is]);
	}

	for(new is = 0; is < 13; is++)
	{
		PlayerTextDrawHide(playerid, MDC_AdressDetails[playerid][is]);
	}

	for(new is; is < 17; is++)
	{
		PlayerTextDrawHide(playerid, MDC_CCTV[playerid][is]);
	}

	for(new is = 0; is < 34; is++)
	{
		PlayerTextDrawHide(playerid, MDC_ManageLicense[playerid][is]);
	}

	for(new is = 0; is < 34; is++)
	{
		PlayerTextDrawHide(playerid, MDC_PenalCode[playerid][is]);
	}

	for(new is; is < 24; is++)
	{
		PlayerTextDrawHide(playerid, MDC_Emergency[playerid][is]);
	}
	for(new is; is < 24; is++)
	{
		PlayerTextDrawHide(playerid, MDC_Warrants[playerid][is]);
	}

	for(new is; is < 21; is++)
	{
		PlayerTextDrawHide(playerid, MDC_Roster[playerid][is]);
	}
	for(new is = 0; is < 5; is++)
	{
	 		PlayerTextDrawHide(playerid, MDC_EmergencyDetails[playerid][is]);
	}
}

GetName(playerid)
{
	new isim[24];

	GetPlayerName(playerid, isim, 24);
  return isim;
}

FixPenalCodeWord(string[256])
{
	ReplaceText(string, "ð", "g");
	ReplaceText(string, "Ð", "G");
	ReplaceText(string, "ü", "u");
	ReplaceText(string, "Ü", "U");
	ReplaceText(string, "þ", "S");
	ReplaceText(string, "Þ", "S");
	ReplaceText(string, "ç", "c");
	ReplaceText(string, "Ç", "C");
	ReplaceText(string, "ö", "o");
	ReplaceText(string, "Ö", "O");
	ReplaceText(string, "ý", "i");
	ReplaceText(string, "I", "i");
	ReplaceText(string, "Ý", "i");
  return string;
}

FixWord(string[256])
{
	format(string, 256, "%s", string);
	metinfix(string, ' ', '_');

	ReplaceText(string, "ð", "g");
	ReplaceText(string, "Ð", "G");
	ReplaceText(string, "ü", "u");
	ReplaceText(string, "Ü", "U");
	ReplaceText(string, "þ", "s");
	ReplaceText(string, "Þ", "S");
	ReplaceText(string, "ç", "c");
	ReplaceText(string, "Ç", "C");
	ReplaceText(string, "ö", "o");
	ReplaceText(string, "Ö", "O");
	ReplaceText(string, "ý", "i");
	ReplaceText(string, "I", "i");
	ReplaceText(string, "Ý", "i");
  return string;
}


metinfix(string[], find, replace)
{
    for(new i=0; string[i]; i++)
    {
        if(string[i] == find)
        {
            string[i] = replace;
        }
    }
}


Server:UI_MDC(playerid)
{
	MDC_Main[playerid][0] = CreatePlayerTextDraw(playerid, 148.300369, 150.643173, "box");
	PlayerTextDrawLetterSize(playerid, MDC_Main[playerid][0], 0.000000, 32.372245);
	PlayerTextDrawTextSize(playerid, MDC_Main[playerid][0], 527.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_Main[playerid][0], 1);
	PlayerTextDrawColor(playerid, MDC_Main[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, MDC_Main[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][0], -522329857);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Main[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Main[playerid][0], 255);
	PlayerTextDrawFont(playerid, MDC_Main[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Main[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][0], 0);

	MDC_Main[playerid][1] = CreatePlayerTextDraw(playerid, 149.900421, 153.836624, "box");
	PlayerTextDrawLetterSize(playerid, MDC_Main[playerid][1], 0.000000, 0.954244);
	PlayerTextDrawTextSize(playerid, MDC_Main[playerid][1], 525.299926, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_Main[playerid][1], 1);
	PlayerTextDrawColor(playerid, MDC_Main[playerid][1], -1);
	PlayerTextDrawUseBox(playerid, MDC_Main[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][1], 203444479);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Main[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Main[playerid][1], 255);
	PlayerTextDrawFont(playerid, MDC_Main[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Main[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][1], 0);

	MDC_Main[playerid][2] = CreatePlayerTextDraw(playerid, 517.399047, 154.023117, "box");
	PlayerTextDrawLetterSize(playerid, MDC_Main[playerid][2], 0.000000, 0.910245);
	PlayerTextDrawTextSize(playerid, MDC_Main[playerid][2], 525.198242, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_Main[playerid][2], 1);
	PlayerTextDrawColor(playerid, MDC_Main[playerid][2], -1);
	PlayerTextDrawUseBox(playerid, MDC_Main[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][2], -1407049473);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Main[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Main[playerid][2], 255);
	PlayerTextDrawFont(playerid, MDC_Main[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Main[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][2], 0);

	MDC_Main[playerid][3] = CreatePlayerTextDraw(playerid, 506.500030, 154.023117, "box");
	PlayerTextDrawLetterSize(playerid, MDC_Main[playerid][3], 0.000000, 0.910245);
	PlayerTextDrawTextSize(playerid, MDC_Main[playerid][3], 514.300903, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_Main[playerid][3], 1);
	PlayerTextDrawColor(playerid, MDC_Main[playerid][3], -1);
	PlayerTextDrawUseBox(playerid, MDC_Main[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][3], 610587135);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Main[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Main[playerid][3], 255);
	PlayerTextDrawFont(playerid, MDC_Main[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Main[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][3], 0);

	MDC_Main[playerid][4] = CreatePlayerTextDraw(playerid, 521.400390, 151.480117, "x");
	PlayerTextDrawLetterSize(playerid, MDC_Main[playerid][4], 0.258399, 1.291378);
	PlayerTextDrawTextSize(playerid, MDC_Main[playerid][4], 13.0, 7.000000);
	PlayerTextDrawAlignment(playerid, MDC_Main[playerid][4], 2);
	PlayerTextDrawColor(playerid, MDC_Main[playerid][4], -1);
	PlayerTextDrawUseBox(playerid, MDC_Main[playerid][4], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][4], 560254720);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Main[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Main[playerid][4], 560254720);
	PlayerTextDrawFont(playerid, MDC_Main[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Main[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][4], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Main[playerid][4], true);

	MDC_Main[playerid][5] = CreatePlayerTextDraw(playerid, 510.402587, 151.480117, "-");
	PlayerTextDrawLetterSize(playerid, MDC_Main[playerid][5], 0.258399, 1.291378);
	PlayerTextDrawAlignment(playerid, MDC_Main[playerid][5], 2);
	PlayerTextDrawColor(playerid, MDC_Main[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Main[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Main[playerid][5], 560254720);
	PlayerTextDrawFont(playerid, MDC_Main[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Main[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][5], 0);

	MDC_Main[playerid][6] = CreatePlayerTextDraw(playerid, 151.199172, 154.113464, "hud:radar_emmetgun");
	PlayerTextDrawLetterSize(playerid, MDC_Main[playerid][6], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, MDC_Main[playerid][6], 9.539989, 8.000000);
	PlayerTextDrawAlignment(playerid, MDC_Main[playerid][6], 1);
	PlayerTextDrawColor(playerid, MDC_Main[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Main[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Main[playerid][6], 255);
	PlayerTextDrawFont(playerid, MDC_Main[playerid][6], 4);
	PlayerTextDrawSetProportional(playerid, MDC_Main[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][6], 0);

	MDC_Main[playerid][7] = CreatePlayerTextDraw(playerid, 163.800292, 153.680297, "MDC_PageName");
	PlayerTextDrawLetterSize(playerid, MDC_Main[playerid][7], 0.204399, 0.927954);
	PlayerTextDrawTextSize(playerid, MDC_Main[playerid][7], 284.700103, -0.099999);
	PlayerTextDrawAlignment(playerid, MDC_Main[playerid][7], 1);
	PlayerTextDrawColor(playerid, MDC_Main[playerid][7], -1329999105);
	PlayerTextDrawUseBox(playerid, MDC_Main[playerid][7], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][7], -1329999360);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Main[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Main[playerid][7], 255);
	PlayerTextDrawFont(playerid, MDC_Main[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Main[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][7], 0);

	MDC_Main[playerid][8] = CreatePlayerTextDraw(playerid, 501.600402, 153.680282, "CharacterName1");
	PlayerTextDrawLetterSize(playerid, MDC_Main[playerid][8], 0.204399, 0.927954);
	PlayerTextDrawAlignment(playerid, MDC_Main[playerid][8], 3);
	PlayerTextDrawColor(playerid, MDC_Main[playerid][8], -2037207046);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Main[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Main[playerid][8], 255);
	PlayerTextDrawFont(playerid, MDC_Main[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Main[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][8], 0);

	MDC_Main[playerid][9] = CreatePlayerTextDraw(playerid, 223.900009, 168.595565, "box");
	PlayerTextDrawLetterSize(playerid, MDC_Main[playerid][9], 0.000000, 30.160011);
	PlayerTextDrawTextSize(playerid, MDC_Main[playerid][9], 224.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_Main[playerid][9], 1);
	PlayerTextDrawColor(playerid, MDC_Main[playerid][9], -1);
	PlayerTextDrawUseBox(playerid, MDC_Main[playerid][9], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][9], -1229736193);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Main[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Main[playerid][9], 255);
	PlayerTextDrawFont(playerid, MDC_Main[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Main[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][9], 0);

	MDC_Main[playerid][10] = CreatePlayerTextDraw(playerid, 184.000213, 168.693344, "Ana_Ekran");
	PlayerTextDrawLetterSize(playerid, MDC_Main[playerid][10], 0.198597, 1.092442);
	PlayerTextDrawTextSize(playerid, MDC_Main[playerid][10], 10.559998, 68.000000);
	PlayerTextDrawAlignment(playerid, MDC_Main[playerid][10], 2);
	PlayerTextDrawColor(playerid, MDC_Main[playerid][10], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_Main[playerid][10], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][10], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Main[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Main[playerid][10], 255);
	PlayerTextDrawFont(playerid, MDC_Main[playerid][10], 2);
	PlayerTextDrawSetProportional(playerid, MDC_Main[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][10], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Main[playerid][10], true);

	MDC_Main[playerid][11] = CreatePlayerTextDraw(playerid, 183.900177, 184.394302, "Sorgula");
	PlayerTextDrawLetterSize(playerid, MDC_Main[playerid][11], 0.198597, 1.092442);
	PlayerTextDrawTextSize(playerid, MDC_Main[playerid][11], 10.559998, 68.000000);
	PlayerTextDrawAlignment(playerid, MDC_Main[playerid][11], 2);
	PlayerTextDrawColor(playerid, MDC_Main[playerid][11], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_Main[playerid][11], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][11], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Main[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Main[playerid][11], 255);
	PlayerTextDrawFont(playerid, MDC_Main[playerid][11], 2);
	PlayerTextDrawSetProportional(playerid, MDC_Main[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][11], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Main[playerid][11], true);

	MDC_Main[playerid][12] = CreatePlayerTextDraw(playerid, 183.900177, 200.295272, "ARANANLAR");
	PlayerTextDrawLetterSize(playerid, MDC_Main[playerid][12], 0.198597, 1.092442);
	PlayerTextDrawTextSize(playerid, MDC_Main[playerid][12], 10.559998, 68.000000);
	PlayerTextDrawAlignment(playerid, MDC_Main[playerid][12], 2);
	PlayerTextDrawColor(playerid, MDC_Main[playerid][12], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_Main[playerid][12], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][12], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Main[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Main[playerid][12], 255);
	PlayerTextDrawFont(playerid, MDC_Main[playerid][12], 2);
	PlayerTextDrawSetProportional(playerid, MDC_Main[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][12], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Main[playerid][12], true);

	MDC_Main[playerid][13] = CreatePlayerTextDraw(playerid, 184.300170, 216.196243, "CAGRILAR");
	PlayerTextDrawLetterSize(playerid, MDC_Main[playerid][13], 0.198597, 1.092442);
	PlayerTextDrawTextSize(playerid, MDC_Main[playerid][13], 10.559998, 68.000000);
	PlayerTextDrawAlignment(playerid, MDC_Main[playerid][13], 2);
	PlayerTextDrawColor(playerid, MDC_Main[playerid][13], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_Main[playerid][13], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][13], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Main[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Main[playerid][13], 255);
	PlayerTextDrawFont(playerid, MDC_Main[playerid][13], 2);
	PlayerTextDrawSetProportional(playerid, MDC_Main[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][13], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Main[playerid][13], true);

	MDC_Main[playerid][14] = CreatePlayerTextDraw(playerid, 184.300170, 257.998779, "LISTE");
	PlayerTextDrawLetterSize(playerid, MDC_Main[playerid][14], 0.198597, 1.092442);
	PlayerTextDrawTextSize(playerid, MDC_Main[playerid][14], 10.559998, 68.000000);
	PlayerTextDrawAlignment(playerid, MDC_Main[playerid][14], 2);
	PlayerTextDrawColor(playerid, MDC_Main[playerid][14], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_Main[playerid][14], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][14], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Main[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Main[playerid][14], 255);
	PlayerTextDrawFont(playerid, MDC_Main[playerid][14], 2);
	PlayerTextDrawSetProportional(playerid, MDC_Main[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][14], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Main[playerid][14], true);

	MDC_Main[playerid][15] = CreatePlayerTextDraw(playerid, 184.300170, 273.998779, "CCTV");
	PlayerTextDrawLetterSize(playerid, MDC_Main[playerid][15], 0.198597, 1.092442);
	PlayerTextDrawTextSize(playerid, MDC_Main[playerid][15], 10.559998, 68.000000);
	PlayerTextDrawAlignment(playerid, MDC_Main[playerid][15], 2);
	PlayerTextDrawColor(playerid, MDC_Main[playerid][15], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_Main[playerid][15], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][15], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Main[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Main[playerid][15], 255);
	PlayerTextDrawFont(playerid, MDC_Main[playerid][15], 2);
	PlayerTextDrawSetProportional(playerid, MDC_Main[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][15], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Main[playerid][15], true);

	MDC_Main[playerid][16] = CreatePlayerTextDraw(playerid, 184.300170, 289.998779, "ARAC BOLO");
	PlayerTextDrawLetterSize(playerid, MDC_Main[playerid][16], 0.198597, 1.092442);
	PlayerTextDrawTextSize(playerid, MDC_Main[playerid][16], 10.559998, 68.000000);
	PlayerTextDrawAlignment(playerid, MDC_Main[playerid][16], 2);
	PlayerTextDrawColor(playerid, MDC_Main[playerid][16], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_Main[playerid][16], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Main[playerid][16], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Main[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Main[playerid][16], 255);
	PlayerTextDrawFont(playerid, MDC_Main[playerid][16], 2);
	PlayerTextDrawSetProportional(playerid, MDC_Main[playerid][16], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Main[playerid][16], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Main[playerid][16], true);


	MDC_MainScreen[playerid][0] = CreatePlayerTextDraw(playerid, 242.199951, 165.951248, "");
	PlayerTextDrawLetterSize(playerid, MDC_MainScreen[playerid][0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, MDC_MainScreen[playerid][0], 241.000000, 206.000000);
	PlayerTextDrawAlignment(playerid, MDC_MainScreen[playerid][0], 1);
	PlayerTextDrawColor(playerid, MDC_MainScreen[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, MDC_MainScreen[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, MDC_MainScreen[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_MainScreen[playerid][0], -522330112);
	PlayerTextDrawFont(playerid, MDC_MainScreen[playerid][0], 5);
	PlayerTextDrawSetProportional(playerid, MDC_MainScreen[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, MDC_MainScreen[playerid][0], 0);
	PlayerTextDrawFont(playerid, MDC_MainScreen[playerid][0], TEXT_DRAW_FONT_MODEL_PREVIEW);
	PlayerTextDrawSetPreviewModel(playerid, MDC_MainScreen[playerid][0], 285);
	PlayerTextDrawSetPreviewRot(playerid, MDC_MainScreen[playerid][0], 0.000000, 0.000000, 0.000000, 0.899999);

	MDC_MainScreen[playerid][1] = CreatePlayerTextDraw(playerid, 229.900390, 258.163177, "box");
	PlayerTextDrawLetterSize(playerid, MDC_MainScreen[playerid][1], 0.000000, 18.012247);
	PlayerTextDrawTextSize(playerid, MDC_MainScreen[playerid][1], 514.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_MainScreen[playerid][1], 1);
	PlayerTextDrawColor(playerid, MDC_MainScreen[playerid][1], 16777215);
	PlayerTextDrawUseBox(playerid, MDC_MainScreen[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, MDC_MainScreen[playerid][1], -522329857);
	PlayerTextDrawSetShadow(playerid, MDC_MainScreen[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, MDC_MainScreen[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_MainScreen[playerid][1], 255);
	PlayerTextDrawFont(playerid, MDC_MainScreen[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, MDC_MainScreen[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, MDC_MainScreen[playerid][1], 0);

	MDC_MainScreen[playerid][2] = CreatePlayerTextDraw(playerid, 230.300003, 255.311096, "box");
	PlayerTextDrawLetterSize(playerid, MDC_MainScreen[playerid][2], 0.000000, 1.040012);
	PlayerTextDrawTextSize(playerid, MDC_MainScreen[playerid][2], 524.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_MainScreen[playerid][2], 1);
	PlayerTextDrawColor(playerid, MDC_MainScreen[playerid][2], -1);
	PlayerTextDrawUseBox(playerid, MDC_MainScreen[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid, MDC_MainScreen[playerid][2], -1229736193);
	PlayerTextDrawSetShadow(playerid, MDC_MainScreen[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, MDC_MainScreen[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_MainScreen[playerid][2], 255);
	PlayerTextDrawFont(playerid, MDC_MainScreen[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, MDC_MainScreen[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, MDC_MainScreen[playerid][2], 0);

	MDC_MainScreen[playerid][3] = CreatePlayerTextDraw(playerid, 366.200317, 255.426940, "Rank_CharacterName");
	PlayerTextDrawLetterSize(playerid, MDC_MainScreen[playerid][3], 0.204399, 0.927954);
	PlayerTextDrawAlignment(playerid, MDC_MainScreen[playerid][3], 2);
	PlayerTextDrawColor(playerid, MDC_MainScreen[playerid][3], 757674239);
	PlayerTextDrawSetShadow(playerid, MDC_MainScreen[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, MDC_MainScreen[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_MainScreen[playerid][3], 255);
	PlayerTextDrawFont(playerid, MDC_MainScreen[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, MDC_MainScreen[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, MDC_MainScreen[playerid][3], 0);

	MDC_MainScreen[playerid][4] = CreatePlayerTextDraw(playerid, 233.300308, 272.749176, "AKTIF_PERSONELLER AKTIF_ARANMALAR");
	PlayerTextDrawLetterSize(playerid, MDC_MainScreen[playerid][4], 0.223998, 1.127063);
	PlayerTextDrawTextSize(playerid, MDC_MainScreen[playerid][4], 241.000000, 206.000000);
	PlayerTextDrawAlignment(playerid, MDC_MainScreen[playerid][4], 1);
	PlayerTextDrawColor(playerid, MDC_MainScreen[playerid][4], 757674239);
	PlayerTextDrawSetShadow(playerid, MDC_MainScreen[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, MDC_MainScreen[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_MainScreen[playerid][4], 255);
	PlayerTextDrawFont(playerid, MDC_MainScreen[playerid][4], 2);
	PlayerTextDrawSetProportional(playerid, MDC_MainScreen[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, MDC_MainScreen[playerid][4], 0);

	MDC_MainScreen[playerid][5] = CreatePlayerTextDraw(playerid, 384.299316, 272.737884, "SON_ARANMALAR SON_TUTUKLAMALAR SON_CEZALAR");
	PlayerTextDrawLetterSize(playerid, MDC_MainScreen[playerid][5], 0.223998, 1.127063);
	PlayerTextDrawTextSize(playerid, MDC_MainScreen[playerid][5], 241.000000, 206.000000);
	PlayerTextDrawAlignment(playerid, MDC_MainScreen[playerid][5], 1);
	PlayerTextDrawColor(playerid, MDC_MainScreen[playerid][5], 757674239);
	PlayerTextDrawSetShadow(playerid, MDC_MainScreen[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, MDC_MainScreen[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_MainScreen[playerid][5], 255);
	PlayerTextDrawFont(playerid, MDC_MainScreen[playerid][5], 2);
	PlayerTextDrawSetProportional(playerid, MDC_MainScreen[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, MDC_MainScreen[playerid][5], 0);

	MDC_MainScreen[playerid][6] = CreatePlayerTextDraw(playerid, 492.701934, 272.742401, "3 5 7");
	PlayerTextDrawLetterSize(playerid, MDC_MainScreen[playerid][6], 0.223998, 1.127063);
	PlayerTextDrawTextSize(playerid, MDC_MainScreen[playerid][6], 241.000000, 206.000000);
	PlayerTextDrawAlignment(playerid, MDC_MainScreen[playerid][6], 1);
	PlayerTextDrawColor(playerid, MDC_MainScreen[playerid][6], -1667654401);
	PlayerTextDrawSetShadow(playerid, MDC_MainScreen[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, MDC_MainScreen[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_MainScreen[playerid][6], 255);
	PlayerTextDrawFont(playerid, MDC_MainScreen[playerid][6], 2);
	PlayerTextDrawSetProportional(playerid, MDC_MainScreen[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, MDC_MainScreen[playerid][6], 0);

	MDC_MainScreen[playerid][7] = CreatePlayerTextDraw(playerid, 338.502441, 272.724365, "3 5");
	PlayerTextDrawTextSize(playerid, MDC_MainScreen[playerid][7], 241.000000, 206.000000);
	PlayerTextDrawLetterSize(playerid, MDC_MainScreen[playerid][7], 0.223998, 1.127063);
	PlayerTextDrawAlignment(playerid, MDC_MainScreen[playerid][7], 1);
	PlayerTextDrawColor(playerid, MDC_MainScreen[playerid][7], -1667654401);
	PlayerTextDrawSetShadow(playerid, MDC_MainScreen[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, MDC_MainScreen[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_MainScreen[playerid][7], 255);
	PlayerTextDrawFont(playerid, MDC_MainScreen[playerid][7], 2);
	PlayerTextDrawSetProportional(playerid, MDC_MainScreen[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, MDC_MainScreen[playerid][7], 0);

	MDC_LookUp_Name[playerid][0] = CreatePlayerTextDraw(playerid, 254.199676, 177.730865, "ISIM");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Name[playerid][0], 0.198596, 1.092442);
	PlayerTextDrawTextSize(playerid, MDC_LookUp_Name[playerid][0], 10.559998, 39.000000);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Name[playerid][0], 2);
	PlayerTextDrawColor(playerid, MDC_LookUp_Name[playerid][0], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_LookUp_Name[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, MDC_LookUp_Name[playerid][0], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Name[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Name[playerid][0], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Name[playerid][0], 2);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Name[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][0], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_LookUp_Name[playerid][0], true);

	MDC_LookUp_Name[playerid][1] = CreatePlayerTextDraw(playerid, 297.202301, 177.730865, "PLAKA");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Name[playerid][1], 0.198596, 1.092442);
	PlayerTextDrawTextSize(playerid, MDC_LookUp_Name[playerid][1], 10.559998, 39.000000);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Name[playerid][1], 2);
	PlayerTextDrawColor(playerid, MDC_LookUp_Name[playerid][1], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_LookUp_Name[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, MDC_LookUp_Name[playerid][1], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Name[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Name[playerid][1], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Name[playerid][1], 2);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Name[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][1], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_LookUp_Name[playerid][1], true);

	MDC_LookUp_Name[playerid][2] = CreatePlayerTextDraw(playerid, 325.199707, 177.908264, "box");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Name[playerid][2], 0.000000, 1.030997);
	PlayerTextDrawTextSize(playerid, MDC_LookUp_Name[playerid][2], 464.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Name[playerid][2], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Name[playerid][2], -1);
	PlayerTextDrawUseBox(playerid, MDC_LookUp_Name[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid, MDC_LookUp_Name[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Name[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Name[playerid][2], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Name[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Name[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][2], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_LookUp_Name[playerid][2], true);

	MDC_LookUp_Name[playerid][3] = CreatePlayerTextDraw(playerid, 489.901702, 177.437606, "YENILE");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Name[playerid][3], 0.198596, 1.092442);
	PlayerTextDrawTextSize(playerid, MDC_LookUp_Name[playerid][3], 10.559998, 39.000000);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Name[playerid][3], 2);
	PlayerTextDrawColor(playerid, MDC_LookUp_Name[playerid][3], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_LookUp_Name[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid, MDC_LookUp_Name[playerid][3], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Name[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Name[playerid][3], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Name[playerid][3], 2);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Name[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][3], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_LookUp_Name[playerid][3], true);

	MDC_LookUp_Name[playerid][4] = CreatePlayerTextDraw(playerid, 327.800292, 177.355590, "SearchedText");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Name[playerid][4], 0.241199, 1.002665);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Name[playerid][4], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Name[playerid][4], 255);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Name[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Name[playerid][4], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Name[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Name[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][4], 0);

	MDC_LookUp_Name[playerid][5] = CreatePlayerTextDraw(playerid, 146.900390, 183.111587, "");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Name[playerid][5], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, MDC_LookUp_Name[playerid][5], 239.000000, 196.000000);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Name[playerid][5], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Name[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Name[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Name[playerid][5], 0);
	PlayerTextDrawFont(playerid, MDC_LookUp_Name[playerid][5], 5);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Name[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][5], 0);
	PlayerTextDrawFont(playerid, MDC_LookUp_Name[playerid][5], TEXT_DRAW_FONT_MODEL_PREVIEW);
	PlayerTextDrawSetPreviewModel(playerid, MDC_LookUp_Name[playerid][5], 301);
	PlayerTextDrawSetPreviewRot(playerid, MDC_LookUp_Name[playerid][5], 0.000000, 0.000000, 30.000000, 1.000000);

	MDC_LookUp_Name[playerid][6] = CreatePlayerTextDraw(playerid, 230.500396, 273.403350, "box");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Name[playerid][6], 0.000000, 12.439991);
	PlayerTextDrawTextSize(playerid, MDC_LookUp_Name[playerid][6], 497.499908, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Name[playerid][6], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Name[playerid][6], 255);
	PlayerTextDrawUseBox(playerid, MDC_LookUp_Name[playerid][6], 1);
	PlayerTextDrawBoxColor(playerid, MDC_LookUp_Name[playerid][6], -572662273);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Name[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Name[playerid][6], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Name[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Name[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][6], 0);

	MDC_LookUp_Name[playerid][7] = CreatePlayerTextDraw(playerid, 302.699981, 202.675979, "ISIM:~n~NUMARA:~n~ONCELIK:~n~LISANSLAR:~n~ADRESLER:");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Name[playerid][7], 0.167198, 1.012622);
	PlayerTextDrawTextSize(playerid, MDC_LookUp_Name[playerid][7], 348.000000, 150.000000);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Name[playerid][7], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Name[playerid][7], 1044266751);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Name[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Name[playerid][7], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Name[playerid][7], 2);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Name[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][7], 0);

	MDC_LookUp_Name[playerid][8] = CreatePlayerTextDraw(playerid, 368.303985, 202.675979, "SearchedName~n~SearchedNumber~n~SearchedPriors~n~SearchedLicenses~n~SearchedAddresses~n~~r~Bu_kisi_araniyor.");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Name[playerid][8],0.167198, 1.012622);
	PlayerTextDrawTextSize(playerid, MDC_LookUp_Name[playerid][8], 10.559998, 68.000000);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Name[playerid][8], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Name[playerid][8], -1717986817);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Name[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Name[playerid][8], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Name[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Name[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][8], 0);

	MDC_LookUp_Name[playerid][9] = CreatePlayerTextDraw(playerid, 233.501403, 275.013336, "]_Bu_Oyuncu_Birden_Fazla_Adrese_Sahip,_Listelemek_icin_tiklayin");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Name[playerid][9], 0.187795, 0.982931);
	PlayerTextDrawTextSize(playerid, MDC_LookUp_Name[playerid][9], 517.000000, 9.0);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Name[playerid][9], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Name[playerid][9], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_LookUp_Name[playerid][9], 1);
	PlayerTextDrawBoxColor(playerid, MDC_LookUp_Name[playerid][9], -57089);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Name[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Name[playerid][9], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Name[playerid][9], 2);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Name[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][9], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_LookUp_Name[playerid][9], true);

	MDC_LookUp_Name[playerid][10] = CreatePlayerTextDraw(playerid, 233.401428, 289.951171, "~>~_Lisanslari_Yonet");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Name[playerid][10], 0.187795, 0.982931);
	PlayerTextDrawTextSize(playerid, MDC_LookUp_Name[playerid][10], 373.000000, 9.0);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Name[playerid][10], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Name[playerid][10], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_LookUp_Name[playerid][10], 1);
	PlayerTextDrawBoxColor(playerid, MDC_LookUp_Name[playerid][10], -1431655681);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Name[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Name[playerid][10], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Name[playerid][10], 2);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Name[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][10], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_LookUp_Name[playerid][10], true);

	MDC_LookUp_Name[playerid][11] = CreatePlayerTextDraw(playerid, 447.804534, 289.639862, "~y~]_~w~SABIKA_KAYDI_~y~]_");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Name[playerid][11], 0.187795, 0.982931);
	PlayerTextDrawTextSize(playerid, MDC_LookUp_Name[playerid][11], 10.559998, 140.000000);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Name[playerid][11], 2);
	PlayerTextDrawColor(playerid, MDC_LookUp_Name[playerid][11], -1);
	PlayerTextDrawUseBox(playerid, MDC_LookUp_Name[playerid][11], 1);
	PlayerTextDrawBoxColor(playerid, MDC_LookUp_Name[playerid][11], 858993663);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Name[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Name[playerid][11], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Name[playerid][11], 2);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Name[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][11], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_LookUp_Name[playerid][11], false);

	MDC_LookUp_Name[playerid][12] = CreatePlayerTextDraw(playerid, 233.401428, 303.752014, "~>~_Islem_Uygula");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Name[playerid][12], 0.187795, 0.982931);
	PlayerTextDrawTextSize(playerid, MDC_LookUp_Name[playerid][12], 373.000000, 9.0);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Name[playerid][12], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Name[playerid][12], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_LookUp_Name[playerid][12], 1);
	PlayerTextDrawBoxColor(playerid, MDC_LookUp_Name[playerid][12], -1431655681);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Name[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Name[playerid][12], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Name[playerid][12], 2);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Name[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][12], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_LookUp_Name[playerid][12], true);

	MDC_LookUp_Name[playerid][13] = CreatePlayerTextDraw(playerid, 233.401428, 317.552856, "~>~_Tutuklama_Raporu_Yaz");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Name[playerid][13], 0.187795, 0.982931);
	PlayerTextDrawTextSize(playerid, MDC_LookUp_Name[playerid][13], 373.000000, 9.0);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Name[playerid][13], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Name[playerid][13], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_LookUp_Name[playerid][13], 1);
	PlayerTextDrawBoxColor(playerid, MDC_LookUp_Name[playerid][13], -1431655681);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Name[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Name[playerid][13], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Name[playerid][13], 2);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Name[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][13], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_LookUp_Name[playerid][13], true);

	MDC_LookUp_Name[playerid][14] = CreatePlayerTextDraw(playerid, 383.303619, 302.513458, "CriminalRecord1");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Name[playerid][14], 0.167198, 1.012622);
	PlayerTextDrawTextSize(playerid, MDC_LookUp_Name[playerid][14], 373.000000, 9.0);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Name[playerid][14], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Name[playerid][14], 858993663);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Name[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Name[playerid][14], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Name[playerid][14], 1);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Name[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][14], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_LookUp_Name[playerid][14], true);

	MDC_LookUp_Name[playerid][15] = CreatePlayerTextDraw(playerid, 492.299896, 359.664031, "");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Name[playerid][15], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, MDC_LookUp_Name[playerid][15], 8.779994, 9.320007);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Name[playerid][15], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Name[playerid][15], -2139062017);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Name[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Name[playerid][15], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Name[playerid][15], 4);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Name[playerid][15], 0);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][15], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_LookUp_Name[playerid][15], false);

	MDC_LookUp_Name[playerid][16] = CreatePlayerTextDraw(playerid, 502.800537, 359.664031, "");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Name[playerid][16], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, MDC_LookUp_Name[playerid][16], 8.779994, 9.320007);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Name[playerid][16], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Name[playerid][16], -2139062017);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Name[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Name[playerid][16], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Name[playerid][16], 4);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Name[playerid][16], 0);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Name[playerid][16], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_LookUp_Name[playerid][16], false);

	MDC_LookUp_Name[playerid][17] = CreatePlayerTextDraw(playerid, 340.604949, 177.730865, "");

	MDC_LookUp_Vehicle[playerid][0] = CreatePlayerTextDraw(playerid, 229.500122, 176.753524, "");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Vehicle[playerid][0], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, MDC_LookUp_Vehicle[playerid][0], 78.000000, 79.000000);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Vehicle[playerid][0], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Vehicle[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Vehicle[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Vehicle[playerid][0], 0);
	PlayerTextDrawFont(playerid, MDC_LookUp_Vehicle[playerid][0], 5);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Vehicle[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][0], 0);
	PlayerTextDrawFont(playerid, MDC_LookUp_Vehicle[playerid][0], TEXT_DRAW_FONT_MODEL_PREVIEW);
	PlayerTextDrawSetPreviewModel(playerid, MDC_LookUp_Vehicle[playerid][0], 406);
	PlayerTextDrawSetPreviewRot(playerid, MDC_LookUp_Vehicle[playerid][0], 0.000000, 0.000000, 90.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, MDC_LookUp_Vehicle[playerid][0], 1, 1);

	MDC_LookUp_Vehicle[playerid][1] = CreatePlayerTextDraw(playerid, 229.500213, 224.907669, "");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Vehicle[playerid][1], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, MDC_LookUp_Vehicle[playerid][1], 78.000000, 79.000000);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Vehicle[playerid][1], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Vehicle[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Vehicle[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Vehicle[playerid][1], 0);
	PlayerTextDrawFont(playerid, MDC_LookUp_Vehicle[playerid][1], 5);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Vehicle[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][1], 0);
	PlayerTextDrawFont(playerid, MDC_LookUp_Vehicle[playerid][1], TEXT_DRAW_FONT_MODEL_PREVIEW);
	PlayerTextDrawSetPreviewModel(playerid, MDC_LookUp_Vehicle[playerid][1], 406);
	PlayerTextDrawSetPreviewRot(playerid, MDC_LookUp_Vehicle[playerid][1], 0.000000, 0.000000, 90.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, MDC_LookUp_Vehicle[playerid][1], 1, 1);

	MDC_LookUp_Vehicle[playerid][2] = CreatePlayerTextDraw(playerid, 228.599945, 276.157653, "");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Vehicle[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, MDC_LookUp_Vehicle[playerid][2], 78.000000, 79.000000);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Vehicle[playerid][2], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Vehicle[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Vehicle[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Vehicle[playerid][2], 0);
	PlayerTextDrawFont(playerid, MDC_LookUp_Vehicle[playerid][2], 5);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Vehicle[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][2], 0);
	PlayerTextDrawFont(playerid, MDC_LookUp_Vehicle[playerid][2], TEXT_DRAW_FONT_MODEL_PREVIEW);
	PlayerTextDrawSetPreviewModel(playerid, MDC_LookUp_Vehicle[playerid][2], 406);
	PlayerTextDrawSetPreviewRot(playerid, MDC_LookUp_Vehicle[playerid][2], 0.000000, 0.000000, 90.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, MDC_LookUp_Vehicle[playerid][2], 1, 1);

	MDC_LookUp_Vehicle[playerid][3] = CreatePlayerTextDraw(playerid, 229.599975, 328.540191, "");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Vehicle[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, MDC_LookUp_Vehicle[playerid][3], 78.000000, 79.000000);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Vehicle[playerid][3], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Vehicle[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Vehicle[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Vehicle[playerid][3], 0);
	PlayerTextDrawFont(playerid, MDC_LookUp_Vehicle[playerid][3], 5);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Vehicle[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][3], 0);
	PlayerTextDrawFont(playerid, MDC_LookUp_Vehicle[playerid][3], TEXT_DRAW_FONT_MODEL_PREVIEW);
	PlayerTextDrawSetPreviewModel(playerid, MDC_LookUp_Vehicle[playerid][3], 406);
	PlayerTextDrawSetPreviewRot(playerid, MDC_LookUp_Vehicle[playerid][3], 0.000000, 0.000000, 90.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, MDC_LookUp_Vehicle[playerid][3], 1, 1);

	MDC_LookUp_Vehicle[playerid][4] = CreatePlayerTextDraw(playerid, 229.599990, 379.278747, "");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Vehicle[playerid][4], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, MDC_LookUp_Vehicle[playerid][4], 78.000000, 79.000000);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Vehicle[playerid][4], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Vehicle[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Vehicle[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Vehicle[playerid][4], 0);
	PlayerTextDrawFont(playerid, MDC_LookUp_Vehicle[playerid][4], 5);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Vehicle[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][4], 0);
		PlayerTextDrawFont(playerid, MDC_LookUp_Vehicle[playerid][4], TEXT_DRAW_FONT_MODEL_PREVIEW);
	PlayerTextDrawSetPreviewModel(playerid, MDC_LookUp_Vehicle[playerid][4], 406);
	PlayerTextDrawSetPreviewRot(playerid, MDC_LookUp_Vehicle[playerid][4], 0.000000, 0.000000, 90.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, MDC_LookUp_Vehicle[playerid][4], 1, 1);

	MDC_LookUp_Vehicle[playerid][5] = CreatePlayerTextDraw(playerid, 319.200164, 194.977767, "MODEL:~n~PLAKA:~n~SAHIP:~n~SIGORTA:~n~HACIZ");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Vehicle[playerid][5], 0.190799, 0.962844);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Vehicle[playerid][5], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Vehicle[playerid][5], 255);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Vehicle[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Vehicle[playerid][5], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Vehicle[playerid][5], 2);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Vehicle[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][5], 0);

	MDC_LookUp_Vehicle[playerid][6] = CreatePlayerTextDraw(playerid, 319.200164, 243.479080, "MODEL:~n~PLAKA:~n~SAHIP:~n~SIGORTA:~n~HACIZ");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Vehicle[playerid][6], 0.190799, 0.962844);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Vehicle[playerid][6], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Vehicle[playerid][6], 255);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Vehicle[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Vehicle[playerid][6], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Vehicle[playerid][6], 2);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Vehicle[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][6], 0);

	MDC_LookUp_Vehicle[playerid][7] = CreatePlayerTextDraw(playerid, 319.200164, 291.778900, "MODEL:~n~PLAKA:~n~SAHIP:~n~SIGORTA:~n~HACIZ");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Vehicle[playerid][7], 0.190799, 0.962844);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Vehicle[playerid][7], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Vehicle[playerid][7], 255);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Vehicle[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Vehicle[playerid][7], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Vehicle[playerid][7], 2);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Vehicle[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][7], 0);

	MDC_LookUp_Vehicle[playerid][8] = CreatePlayerTextDraw(playerid, 319.200164, 341.880859, "MODEL:~n~PLAKA:~n~SAHIP:~n~SIGORTA:~n~HACIZ");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Vehicle[playerid][8], 0.190799, 0.962844);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Vehicle[playerid][8], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Vehicle[playerid][8], 255);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Vehicle[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Vehicle[playerid][8], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Vehicle[playerid][8], 2);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Vehicle[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][8], 0);

	MDC_LookUp_Vehicle[playerid][9] = CreatePlayerTextDraw(playerid, 319.200164, 392.978363, "MODEL:~n~PLAKA:~n~SAHIP:~n~SIGORTA:~n~HACIZ");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Vehicle[playerid][9], 0.190799, 0.962844);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Vehicle[playerid][9], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Vehicle[playerid][9], 255);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Vehicle[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Vehicle[playerid][9], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Vehicle[playerid][9], 2);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Vehicle[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][9], 0);

	MDC_LookUp_Vehicle[playerid][10] = CreatePlayerTextDraw(playerid, 360.599945, 194.977767, "aracmodel~n~aracplaka~n~aracsahip~n~aracsigorta~n~arachaciz");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Vehicle[playerid][10], 0.190799, 0.962844);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Vehicle[playerid][10], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Vehicle[playerid][10], -2139062017);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Vehicle[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Vehicle[playerid][10], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Vehicle[playerid][10], 2);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Vehicle[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][10], 0);

	MDC_LookUp_Vehicle[playerid][11] = CreatePlayerTextDraw(playerid, 360.599945, 243.277832, "aracmodel~n~aracplaka~n~aracsahip~n~aracsigorta~n~arachaciz");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Vehicle[playerid][11], 0.190799, 0.962844);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Vehicle[playerid][11], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Vehicle[playerid][11], -2139062017);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Vehicle[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Vehicle[playerid][11], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Vehicle[playerid][11], 2);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Vehicle[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][11], 0);

	MDC_LookUp_Vehicle[playerid][12] = CreatePlayerTextDraw(playerid, 360.599945, 291.577667, "aracmodel~n~aracplaka~n~aracsahip~n~aracsigorta~n~arachaciz");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Vehicle[playerid][12], 0.190799, 0.962844);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Vehicle[playerid][12], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Vehicle[playerid][12], -2139062017);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Vehicle[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Vehicle[playerid][12], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Vehicle[playerid][12], 2);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Vehicle[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][12], 0);

	MDC_LookUp_Vehicle[playerid][13] = CreatePlayerTextDraw(playerid, 360.599945, 342.177398, "aracmodel~n~aracplaka~n~aracsahip~n~aracsigorta~n~arachaciz");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Vehicle[playerid][13], 0.190799, 0.962844);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Vehicle[playerid][13], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Vehicle[playerid][13], -2139062017);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Vehicle[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Vehicle[playerid][13], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Vehicle[playerid][13], 2);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Vehicle[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][13], 0);

	MDC_LookUp_Vehicle[playerid][14] = CreatePlayerTextDraw(playerid, 360.199951, 392.279357, "aracmodel~n~aracplaka~n~aracsahip~n~aracsigorta~n~arachaciz");
	PlayerTextDrawLetterSize(playerid, MDC_LookUp_Vehicle[playerid][14], 0.190799, 0.962844);
	PlayerTextDrawAlignment(playerid, MDC_LookUp_Vehicle[playerid][14], 1);
	PlayerTextDrawColor(playerid, MDC_LookUp_Vehicle[playerid][14], -2139062017);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, MDC_LookUp_Vehicle[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_LookUp_Vehicle[playerid][14], 255);
	PlayerTextDrawFont(playerid, MDC_LookUp_Vehicle[playerid][14], 2);
	PlayerTextDrawSetProportional(playerid, MDC_LookUp_Vehicle[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, MDC_LookUp_Vehicle[playerid][14], 0);


	MDC_AdressDetails[playerid][0] = CreatePlayerTextDraw(playerid, 236.201202, 167.593261, "~<~_Geri_Git");
	PlayerTextDrawLetterSize(playerid, MDC_AdressDetails[playerid][0], 0.231199, 1.122133);
	PlayerTextDrawTextSize(playerid, MDC_AdressDetails[playerid][0], 290.000488, 9.000000);
	PlayerTextDrawAlignment(playerid, MDC_AdressDetails[playerid][0], 1);
	PlayerTextDrawColor(playerid, MDC_AdressDetails[playerid][0], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_AdressDetails[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, MDC_AdressDetails[playerid][0], 84215040);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, MDC_AdressDetails[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_AdressDetails[playerid][0], 255);
	PlayerTextDrawFont(playerid, MDC_AdressDetails[playerid][0], 2);
	PlayerTextDrawSetProportional(playerid, MDC_AdressDetails[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][0], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_AdressDetails[playerid][0], true);

	MDC_AdressDetails[playerid][1] = CreatePlayerTextDraw(playerid, 228.300003, 186.304260, "Birincil_Adres");
	PlayerTextDrawLetterSize(playerid, MDC_AdressDetails[playerid][1], 0.208399, 1.117155);
	PlayerTextDrawAlignment(playerid, MDC_AdressDetails[playerid][1], 1);
	PlayerTextDrawColor(playerid, MDC_AdressDetails[playerid][1], 1583243007);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, MDC_AdressDetails[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_AdressDetails[playerid][1], 255);
	PlayerTextDrawFont(playerid, MDC_AdressDetails[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, MDC_AdressDetails[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][1], 0);

	MDC_AdressDetails[playerid][2] = CreatePlayerTextDraw(playerid, 233.400314, 196.004852, "secondaryAddress~n~addressCity~n~addressCounty~n~addressCountry");
	PlayerTextDrawLetterSize(playerid, MDC_AdressDetails[playerid][2], 0.208399, 1.117155);
	PlayerTextDrawAlignment(playerid, MDC_AdressDetails[playerid][2], 1);
	PlayerTextDrawColor(playerid, MDC_AdressDetails[playerid][2], -1515870721);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, MDC_AdressDetails[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_AdressDetails[playerid][2], 255);
	PlayerTextDrawFont(playerid, MDC_AdressDetails[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, MDC_AdressDetails[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][2], 0);

	MDC_AdressDetails[playerid][3] = CreatePlayerTextDraw(playerid, 369.399383, 166.349380, "samaps:gtasamapbit4");
	PlayerTextDrawLetterSize(playerid, MDC_AdressDetails[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, MDC_AdressDetails[playerid][3], 131.000000, 138.000000);
	PlayerTextDrawAlignment(playerid, MDC_AdressDetails[playerid][3], 1);
	PlayerTextDrawColor(playerid, MDC_AdressDetails[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, MDC_AdressDetails[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_AdressDetails[playerid][3], 255);
	PlayerTextDrawFont(playerid, MDC_AdressDetails[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, MDC_AdressDetails[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][3], 0);

	MDC_AdressDetails[playerid][4] = CreatePlayerTextDraw(playerid, 228.300003, 240.007537, "Diger_Adresler");
	PlayerTextDrawLetterSize(playerid, MDC_AdressDetails[playerid][4], 0.208399, 1.117155);
	PlayerTextDrawAlignment(playerid, MDC_AdressDetails[playerid][4], 1);
	PlayerTextDrawColor(playerid, MDC_AdressDetails[playerid][4], 1583243007);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, MDC_AdressDetails[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_AdressDetails[playerid][4], 255);
	PlayerTextDrawFont(playerid, MDC_AdressDetails[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, MDC_AdressDetails[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][4], 0);

	MDC_AdressDetails[playerid][5] = CreatePlayerTextDraw(playerid, 232.400238, 253.739410, "-_adressNumber1");
	PlayerTextDrawLetterSize(playerid, MDC_AdressDetails[playerid][5], 0.208399, 1.117155);
	PlayerTextDrawTextSize(playerid, MDC_AdressDetails[playerid][5], 359.000000, 9.000000);
	PlayerTextDrawAlignment(playerid, MDC_AdressDetails[playerid][5], 1);
	PlayerTextDrawColor(playerid, MDC_AdressDetails[playerid][5], -1515870721);
	PlayerTextDrawUseBox(playerid, MDC_AdressDetails[playerid][5], 1);
	PlayerTextDrawBoxColor(playerid, MDC_AdressDetails[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, MDC_AdressDetails[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_AdressDetails[playerid][5], 255);
	PlayerTextDrawFont(playerid, MDC_AdressDetails[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, MDC_AdressDetails[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][5], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_AdressDetails[playerid][5], true);

	MDC_AdressDetails[playerid][6] = CreatePlayerTextDraw(playerid, 232.400238, 269.640380, "-_adressNumber2");
	PlayerTextDrawLetterSize(playerid, MDC_AdressDetails[playerid][6], 0.208399, 1.117155);
	PlayerTextDrawTextSize(playerid, MDC_AdressDetails[playerid][6], 359.000000, 9.000000);
	PlayerTextDrawAlignment(playerid, MDC_AdressDetails[playerid][6], 1);
	PlayerTextDrawColor(playerid, MDC_AdressDetails[playerid][6], -1515870721);
	PlayerTextDrawUseBox(playerid, MDC_AdressDetails[playerid][6], 1);
	PlayerTextDrawBoxColor(playerid, MDC_AdressDetails[playerid][6], -1);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, MDC_AdressDetails[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_AdressDetails[playerid][6], 255);
	PlayerTextDrawFont(playerid, MDC_AdressDetails[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, MDC_AdressDetails[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][6], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_AdressDetails[playerid][6], true);

	MDC_AdressDetails[playerid][7] = CreatePlayerTextDraw(playerid, 232.400238, 285.641357, "-_adressNumber3");
	PlayerTextDrawLetterSize(playerid, MDC_AdressDetails[playerid][7], 0.208399, 1.117155);
	PlayerTextDrawTextSize(playerid, MDC_AdressDetails[playerid][7], 359.000000, 9.000000);
	PlayerTextDrawAlignment(playerid, MDC_AdressDetails[playerid][7], 1);
	PlayerTextDrawColor(playerid, MDC_AdressDetails[playerid][7], -1515870721);
	PlayerTextDrawUseBox(playerid, MDC_AdressDetails[playerid][7], 1);
	PlayerTextDrawBoxColor(playerid, MDC_AdressDetails[playerid][7], -1);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, MDC_AdressDetails[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_AdressDetails[playerid][7], 255);
	PlayerTextDrawFont(playerid, MDC_AdressDetails[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, MDC_AdressDetails[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][7], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_AdressDetails[playerid][7], true);

	MDC_AdressDetails[playerid][8] = CreatePlayerTextDraw(playerid, 232.400238, 301.842346, "-_adressNumber4");
	PlayerTextDrawLetterSize(playerid, MDC_AdressDetails[playerid][8], 0.208399, 1.117155);
	PlayerTextDrawTextSize(playerid, MDC_AdressDetails[playerid][8], 359.000000, 9.000000);
	PlayerTextDrawAlignment(playerid, MDC_AdressDetails[playerid][8], 1);
	PlayerTextDrawColor(playerid, MDC_AdressDetails[playerid][8], -1515870721);
	PlayerTextDrawUseBox(playerid, MDC_AdressDetails[playerid][8], 1);
	PlayerTextDrawBoxColor(playerid, MDC_AdressDetails[playerid][8], -1);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, MDC_AdressDetails[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_AdressDetails[playerid][8], 255);
	PlayerTextDrawFont(playerid, MDC_AdressDetails[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, MDC_AdressDetails[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][8], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_AdressDetails[playerid][8], true);

	MDC_AdressDetails[playerid][9] = CreatePlayerTextDraw(playerid, 232.400238, 317.943328, "-_adressNumber5");
	PlayerTextDrawLetterSize(playerid, MDC_AdressDetails[playerid][9], 0.208399, 1.117155);
	PlayerTextDrawTextSize(playerid, MDC_AdressDetails[playerid][9], 359.000000, 9.000000);
	PlayerTextDrawAlignment(playerid, MDC_AdressDetails[playerid][9], 1);
	PlayerTextDrawColor(playerid, MDC_AdressDetails[playerid][9], -1515870721);
	PlayerTextDrawUseBox(playerid, MDC_AdressDetails[playerid][9], 1);
	PlayerTextDrawBoxColor(playerid, MDC_AdressDetails[playerid][9], -1);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, MDC_AdressDetails[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_AdressDetails[playerid][9], 255);
	PlayerTextDrawFont(playerid, MDC_AdressDetails[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, MDC_AdressDetails[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][9], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_AdressDetails[playerid][9], true);

	MDC_AdressDetails[playerid][10] = CreatePlayerTextDraw(playerid, 348.399841, 332.408905, "LD_BEAT:right");
	PlayerTextDrawLetterSize(playerid, MDC_AdressDetails[playerid][10], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, MDC_AdressDetails[playerid][10], 13.000000, 12.000000);
	PlayerTextDrawAlignment(playerid, MDC_AdressDetails[playerid][10], 1);
	PlayerTextDrawColor(playerid, MDC_AdressDetails[playerid][10], -1);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, MDC_AdressDetails[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_AdressDetails[playerid][10], 255);
	PlayerTextDrawFont(playerid, MDC_AdressDetails[playerid][10], 4);
	PlayerTextDrawSetProportional(playerid, MDC_AdressDetails[playerid][10], 0);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][10], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_AdressDetails[playerid][10], true);

	MDC_AdressDetails[playerid][11] = CreatePlayerTextDraw(playerid, 338.399841, 332.408905, "LD_BEAT:left");
	PlayerTextDrawLetterSize(playerid, MDC_AdressDetails[playerid][11], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, MDC_AdressDetails[playerid][11], 13.000000, 12.000000);
	PlayerTextDrawAlignment(playerid, MDC_AdressDetails[playerid][11], 1);
	PlayerTextDrawColor(playerid, MDC_AdressDetails[playerid][11], -1);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, MDC_AdressDetails[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_AdressDetails[playerid][11], 255);
	PlayerTextDrawFont(playerid, MDC_AdressDetails[playerid][11], 4);
	PlayerTextDrawSetProportional(playerid, MDC_AdressDetails[playerid][11], 0);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][11], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_AdressDetails[playerid][11], true);

	MDC_AdressDetails[playerid][12] = CreatePlayerTextDraw(playerid, 369.399383, 304.250640, "samaps:gtasamapbit3");
	PlayerTextDrawLetterSize(playerid, MDC_AdressDetails[playerid][12], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, MDC_AdressDetails[playerid][12], 131.000000, 138.000000);
	PlayerTextDrawAlignment(playerid, MDC_AdressDetails[playerid][12], 1);
	PlayerTextDrawColor(playerid, MDC_AdressDetails[playerid][12], -1);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, MDC_AdressDetails[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_AdressDetails[playerid][12], 255);
	PlayerTextDrawFont(playerid, MDC_AdressDetails[playerid][12], 4);
	PlayerTextDrawSetProportional(playerid, MDC_AdressDetails[playerid][12], 0);
	PlayerTextDrawSetShadow(playerid, MDC_AdressDetails[playerid][12], 0);

	MDC_ManageLicense[playerid][0] = CreatePlayerTextDraw(playerid, 236.201202, 167.593261, "~<~_Geri_Git");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][0], 0.231196, 1.122133);
	PlayerTextDrawTextSize(playerid, MDC_ManageLicense[playerid][0], 290.000488, 9.000000);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][0], 1);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][0], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_ManageLicense[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, MDC_ManageLicense[playerid][0], 84215040);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][0], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][0], 2);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][0], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_ManageLicense[playerid][0], true);

	MDC_ManageLicense[playerid][1] = CreatePlayerTextDraw(playerid, 233.099624, 196.366577, "box");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][1], 0.000000, 7.030000);
	PlayerTextDrawTextSize(playerid, MDC_ManageLicense[playerid][1], 364.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][1], 1);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][1], -1);
	PlayerTextDrawUseBox(playerid, MDC_ManageLicense[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, MDC_ManageLicense[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][1], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][1], 0);

	MDC_ManageLicense[playerid][2] = CreatePlayerTextDraw(playerid, 233.399856, 196.659851, "_________Surucu_Lisansi");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][2], 0.149997, 0.873242);
	PlayerTextDrawTextSize(playerid, MDC_ManageLicense[playerid][2], 364.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][2], 1);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][2], -1);
	PlayerTextDrawUseBox(playerid, MDC_ManageLicense[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid, MDC_ManageLicense[playerid][2], 859803647);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][2], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][2], 2);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][2], 0);

	MDC_ManageLicense[playerid][3] = CreatePlayerTextDraw(playerid, 232.599426, 194.010894, "LD_BEAT:chit");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, MDC_ManageLicense[playerid][3], 18.000000, 23.000000);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][3], 1);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][3], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][3], 0);

	MDC_ManageLicense[playerid][4] = CreatePlayerTextDraw(playerid, 254.200042, 207.624465, "Durum:~n~Uyarilar:");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][4], 0.185199, 1.012621);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][4], 1);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][4], 1920103167);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][4], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][4], 0);

	MDC_ManageLicense[playerid][5] = CreatePlayerTextDraw(playerid, 294.802520, 207.624465, "playerDriverLicenses~n~playerDrLicenWarnings");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][5], 0.185199, 1.012621);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][5], 1);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][5], 1920103167);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][5], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][5], 0);

	MDC_ManageLicense[playerid][6] = CreatePlayerTextDraw(playerid, 254.299896, 248.258010, "IPTAL ET");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][6], 0.180799, 0.962844);
	PlayerTextDrawTextSize(playerid, MDC_ManageLicense[playerid][6], 10.000000, 39.000000);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][6], 2);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][6], -1);
	PlayerTextDrawUseBox(playerid, MDC_ManageLicense[playerid][6], 1);
	PlayerTextDrawBoxColor(playerid, MDC_ManageLicense[playerid][6], 2115512063);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][6], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][6], 2);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][6], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_ManageLicense[playerid][6], true);

	MDC_ManageLicense[playerid][7] = CreatePlayerTextDraw(playerid, 297.502532, 248.258010, "UYAR");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][7], 0.180799, 0.962844);
	PlayerTextDrawTextSize(playerid, MDC_ManageLicense[playerid][7], 10.000000, 39.000000);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][7], 2);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][7], -1);
	PlayerTextDrawUseBox(playerid, MDC_ManageLicense[playerid][7], 1);
	PlayerTextDrawBoxColor(playerid, MDC_ManageLicense[playerid][7], 572662527);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][7], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][7], 2);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][7], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_ManageLicense[playerid][7], true);

	MDC_ManageLicense[playerid][9] = CreatePlayerTextDraw(playerid, 233.099624, 275.771423, "box");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][9], 0.000000, 7.030000);
	PlayerTextDrawTextSize(playerid, MDC_ManageLicense[playerid][9], 364.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][9], 1);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][9], -1);
	PlayerTextDrawUseBox(playerid, MDC_ManageLicense[playerid][9], 1);
	PlayerTextDrawBoxColor(playerid, MDC_ManageLicense[playerid][9], -1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][9], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][9], 0);

	MDC_ManageLicense[playerid][10] = CreatePlayerTextDraw(playerid, 233.399856, 275.864685, "___________MEDIKAL_LISANS");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][10], 0.149997, 0.873242);
	PlayerTextDrawTextSize(playerid, MDC_ManageLicense[playerid][10], 364.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][10], 1);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][10], -1);
	PlayerTextDrawUseBox(playerid, MDC_ManageLicense[playerid][10], 1);
	PlayerTextDrawBoxColor(playerid, MDC_ManageLicense[playerid][10], 859803647);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][10], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][10], 2);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][10], 0);

	MDC_ManageLicense[playerid][11] = CreatePlayerTextDraw(playerid, 234.099304, 270.486694, "hud:radar_girlfriend");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][11], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, MDC_ManageLicense[playerid][11], 17.000000, 19.000000);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][11], 1);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][11], -1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][11], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][11], 4);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][11], 0);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][11], 0);

	MDC_ManageLicense[playerid][12] = CreatePlayerTextDraw(playerid, 254.400146, 287.734161, "Durum:");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][12], 0.185199, 1.012621);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][12], 1);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][12], 1920103167);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][12], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][12], 1);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][12], 0);

	MDC_ManageLicense[playerid][13] = CreatePlayerTextDraw(playerid, 294.802307, 287.716247, "playerPilotLicense");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][13], 0.185199, 1.012621);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][13], 1);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][13], 1920103167);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][13], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][13], 0);

	MDC_ManageLicense[playerid][14] = CreatePlayerTextDraw(playerid, 254.299957, 327.151947, "IPTAL ET");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][14], 0.180799, 0.962844);
	PlayerTextDrawTextSize(playerid, MDC_ManageLicense[playerid][14], 10.000000, 39.000000);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][14], 2);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][14], -1);
	PlayerTextDrawUseBox(playerid, MDC_ManageLicense[playerid][14], 1);
	PlayerTextDrawBoxColor(playerid, MDC_ManageLicense[playerid][14], 2115512063);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][14], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][14], 2);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][14], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_ManageLicense[playerid][14], true);

	MDC_ManageLicense[playerid][15] = CreatePlayerTextDraw(playerid, 379.004516, 196.968887, "box");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][15], 0.000000, 6.959003);
	PlayerTextDrawTextSize(playerid, MDC_ManageLicense[playerid][15], 510.770843, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][15], 1);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][15], -1);
	PlayerTextDrawUseBox(playerid, MDC_ManageLicense[playerid][15], 1);
	PlayerTextDrawBoxColor(playerid, MDC_ManageLicense[playerid][15], -1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][15], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][15], 1);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][15], 0);

	MDC_ManageLicense[playerid][16] = CreatePlayerTextDraw(playerid, 379.008209, 196.757614, "_________SILAH_LISANSI");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][16], 0.149997, 0.873242);
	PlayerTextDrawTextSize(playerid, MDC_ManageLicense[playerid][16], 510.910644, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][16], 1);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][16], -1);
	PlayerTextDrawUseBox(playerid, MDC_ManageLicense[playerid][16], 1);
	PlayerTextDrawBoxColor(playerid, MDC_ManageLicense[playerid][16], 859803647);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][16], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][16], 2);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][16], 1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][16], 0);

	MDC_ManageLicense[playerid][17] = CreatePlayerTextDraw(playerid, 378.000976, 193.724411, "LD_BEAT:chit");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][17], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, MDC_ManageLicense[playerid][17], 18.000000, 23.000000);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][17], 1);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][17], -1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][17], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][17], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][17], 4);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][17], 0);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][17], 0);

	MDC_ManageLicense[playerid][18] = CreatePlayerTextDraw(playerid, 401.801727, 207.626724, "Durum:");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][18], 0.185199, 1.012621);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][18], 1);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][18], 1920103167);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][18], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][18], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][18], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][18], 1);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][18], 0);

	MDC_ManageLicense[playerid][19] = CreatePlayerTextDraw(playerid, 444.404418, 207.724472, "playerGLicense");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][19], 0.185199, 1.012621);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][19], 1);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][19], 1920103167);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][19], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][19], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][19], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][19], 1);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][19], 0);

	MDC_ManageLicense[playerid][20] = CreatePlayerTextDraw(playerid, 401.400909, 248.255752, "IPTAL ET");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][20], 0.180799, 0.962844);
	PlayerTextDrawTextSize(playerid, MDC_ManageLicense[playerid][20], 10.000000, 39.000000);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][20], 2);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][20], -1);
	PlayerTextDrawUseBox(playerid, MDC_ManageLicense[playerid][20], 1);
	PlayerTextDrawBoxColor(playerid, MDC_ManageLicense[playerid][20], 2115512063);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][20], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][20], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][20], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][20], 2);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][20], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_ManageLicense[playerid][20], true);

	MDC_ManageLicense[playerid][21] = CreatePlayerTextDraw(playerid, 445.403594, 248.255752, "VER");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][21], 0.180799, 0.962844);
	PlayerTextDrawTextSize(playerid, MDC_ManageLicense[playerid][21], 10.000000, 39.000000);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][21], 2);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][21], -1);
	PlayerTextDrawUseBox(playerid, MDC_ManageLicense[playerid][21], 1);
	PlayerTextDrawBoxColor(playerid, MDC_ManageLicense[playerid][21], 8388863);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][21], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][21], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][21], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][21], 2);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][21], 1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][21], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_ManageLicense[playerid][21], true);


	MDC_ManageLicense[playerid][28] = CreatePlayerTextDraw(playerid, 236.699539, 198.008880, "hud:radar_impound");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][28], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, MDC_ManageLicense[playerid][28], 10.000000, 14.000000);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][28], 1);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][28], -1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][28], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][28], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][28], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][28], 4);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][28], 0);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][28], 0);

	MDC_ManageLicense[playerid][29] = CreatePlayerTextDraw(playerid, 382.700439, 199.629272, "hud:radar_ammugun");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][29], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, MDC_ManageLicense[playerid][29], 9.000000, 11.000000);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][29], 1);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][29], -1);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][29], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][29], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][29], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][29], 4);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][29], 0);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][29], 0);

	MDC_ManageLicense[playerid][30] = CreatePlayerTextDraw(playerid, 297.502532, 327.151947, "VER");
	PlayerTextDrawLetterSize(playerid, MDC_ManageLicense[playerid][30], 0.180799, 0.962844);
	PlayerTextDrawTextSize(playerid, MDC_ManageLicense[playerid][30], 10.000000, 39.000000);
	PlayerTextDrawAlignment(playerid, MDC_ManageLicense[playerid][30], 2);
	PlayerTextDrawColor(playerid, MDC_ManageLicense[playerid][30], -1);
	PlayerTextDrawUseBox(playerid, MDC_ManageLicense[playerid][30], 1);
	PlayerTextDrawBoxColor(playerid, MDC_ManageLicense[playerid][30], 8388863);
	PlayerTextDrawSetShadow(playerid, MDC_ManageLicense[playerid][30], 0);
	PlayerTextDrawSetOutline(playerid, MDC_ManageLicense[playerid][30], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_ManageLicense[playerid][30], 255);
	PlayerTextDrawFont(playerid, MDC_ManageLicense[playerid][30], 2);
	PlayerTextDrawSetProportional(playerid, MDC_ManageLicense[playerid][30], 1);
	PlayerTextDrawSetShadow(playerid,MDC_ManageLicense[playerid][30], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_ManageLicense[playerid][30], true);


	MDC_PenalCode[playerid][0] = CreatePlayerTextDraw(playerid, 236.201202, 167.593261, "~<~_Geri_Git");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][0], 0.231196, 1.122133);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][0], 290.000488, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][0], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][0], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][0], 84215040);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][0], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][0], 2);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][0], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][0], true);

	MDC_PenalCode[playerid][1] = CreatePlayerTextDraw(playerid, 233.000061, 185.058303, "Button1");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][1], 0.215999, 0.918043);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][1], 360.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][1], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][1], -1);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][1], 255);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][1], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][1], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][1], true);

	MDC_PenalCode[playerid][2] = CreatePlayerTextDraw(playerid, 233.000061, 198.159103, "Button2");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][2], 0.215999, 0.918043);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][2], 360.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][2], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][2], -1);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][2], 255);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][2], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][2], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][2], true);

	MDC_PenalCode[playerid][3] = CreatePlayerTextDraw(playerid, 233.000061, 211.059890, "Button3");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][3], 0.215999, 0.918043);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][3], 360.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][3], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][3], -1);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][3], 255);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][3], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][3], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][3], true);

	MDC_PenalCode[playerid][4] = CreatePlayerTextDraw(playerid, 233.000061, 224.060684, "Button4");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][4], 0.215999, 0.918043);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][4], 360.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][4], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][4], -1);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][4], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][4], 255);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][4], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][4], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][4], true);

	MDC_PenalCode[playerid][5] = CreatePlayerTextDraw(playerid, 233.000061, 237.061477, "Button5");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][5], 0.215999, 0.918043);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][5], 360.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][5], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][5], -1);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][5], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][5], 255);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][5], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][5], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][5], true);

	MDC_PenalCode[playerid][6] = CreatePlayerTextDraw(playerid, 233.000061, 250.062271, "Button6");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][6], 0.215999, 0.918043);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][6], 360.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][6], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][6], -1);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][6], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][6], 255);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][6], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][6], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][6], true);

	MDC_PenalCode[playerid][7] = CreatePlayerTextDraw(playerid, 233.000061, 263.063049, "Button7");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][7], 0.215999, 0.918043);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][7], 360.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][7], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][7], -1);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][7], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][7], 255);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][7], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][7], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][7], true);

	MDC_PenalCode[playerid][8] = CreatePlayerTextDraw(playerid, 233.000061, 276.063842, "Button8");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][8], 0.215999, 0.918043);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][8], 360.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][8], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][8], -1);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][8], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][8], 255);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][8], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][8], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][8], true);

	MDC_PenalCode[playerid][9] = CreatePlayerTextDraw(playerid, 233.000061, 289.064636, "Button9");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][9], 0.215999, 0.918043);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][9], 360.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][9], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][9], -1);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][9], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][9], 255);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][9], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][9], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][9], true);

	MDC_PenalCode[playerid][10] = CreatePlayerTextDraw(playerid, 233.000061, 302.165435, "Button10");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][10], 0.215999, 0.918043);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][10], 360.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][10], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][10], -1);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][10], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][10], 255);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][10], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][10], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][10], true);

	MDC_PenalCode[playerid][11] = CreatePlayerTextDraw(playerid, 233.000061, 315.066223, "Button11");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][11], 0.215999, 0.918043);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][11], 360.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][11], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][11], -1);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][11], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][11], 255);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][11], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][11], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][11], true);

	MDC_PenalCode[playerid][12] = CreatePlayerTextDraw(playerid, 233.000061, 328.067016, "Button12");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][12], 0.215999, 0.918043);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][12], 360.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][12], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][12], -1);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][12], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][12], 255);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][12], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][12], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][12], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][12], true);

	MDC_PenalCode[playerid][13] = CreatePlayerTextDraw(playerid, 233.000061, 341.067810, "Button13");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][13], 0.215999, 0.918043);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][13], 360.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][13], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][13], -1);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][13], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][13], 255);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][13], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][13], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][13], true);

	MDC_PenalCode[playerid][14] = CreatePlayerTextDraw(playerid, 233.000061, 354.068603, "Button14");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][14], 0.215999, 0.918043);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][14], 360.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][14], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][14], -1);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][14], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][14], 255);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][14], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][14], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][14], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][14], true);

	MDC_PenalCode[playerid][15] = CreatePlayerTextDraw(playerid, 233.000061, 367.069396, "Button15");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][15], 0.215999, 0.918043);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][15], 360.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][15], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][15], -1);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][15], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][15], 255);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][15], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][15], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][15], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][15], true);

	MDC_PenalCode[playerid][16] = CreatePlayerTextDraw(playerid, 233.000061, 380.070190, "Button16");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][16], 0.215999, 0.918043);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][16], 360.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][16], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][16], -1);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][16], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][16], 255);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][16], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][16], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][16], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][16], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][16], true);

	MDC_PenalCode[playerid][17] = CreatePlayerTextDraw(playerid, 233.000061, 393.070983, "Button17");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][17], 0.215999, 0.918043);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][17], 360.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][17], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][17], -1);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][17], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][17], 255);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][17], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][17], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][17], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][17], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][17], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][17], true);

	MDC_PenalCode[playerid][18] = CreatePlayerTextDraw(playerid, 233.000061, 406.071777, "Button18");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][18], 0.215999, 0.918043);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][18], 360.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][18], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][18], -1);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][18], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][18], 255);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][18], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][18], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][18], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][18], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][18], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][18], true);

	MDC_PenalCode[playerid][19] = CreatePlayerTextDraw(playerid, 233.000061, 419.072570, "Button19");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][19], 0.215999, 0.918043);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][19], 360.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][19], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][19], -1);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][19], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][19], 255);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][19], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][19], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][19], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][19], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][19], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][19], true);

	MDC_PenalCode[playerid][20] = CreatePlayerTextDraw(playerid, 233.000061, 432.073364, "__________________~d~");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][20], 0.215999, 0.918043);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][20], 360.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][20], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][20], -1);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][20], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][20], 255);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][20], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][20], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][20], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][20], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][20], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][20], true);

	MDC_PenalCode[playerid][21] = CreatePlayerTextDraw(playerid, 368.501525, 185.078567, "filtre_uygula...");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][21], 0.207998, 0.923198);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][21], 488.000000, 10.109999);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][21], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][21], -1717986817);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][21], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][21], -1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][21], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][21], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][21], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][21], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][21], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][21], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][21], true);

	MDC_PenalCode[playerid][22] = CreatePlayerTextDraw(playerid, 508.103729, 185.069549, "Temizle");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][22], 0.151998, 0.923198);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][22], 10.109999, 28.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][22], 2);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][22], 875836671);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][22], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][22], -1431655681);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][22], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][22], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][22], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][22], 2);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][22], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][22], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][22], true);

	MDC_PenalCode[playerid][23] = CreatePlayerTextDraw(playerid, 368.000091, 199.253265, "crimeDetail1(36Character)~n~");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][23], 0.195199, 0.997688);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][23], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][23], 572662527);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][23], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][23], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][23], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][23], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][23], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][23], 0);

	MDC_PenalCode[playerid][24] = CreatePlayerTextDraw(playerid, 368.000091, 246.356140, "crimeDetails2(36Character)~n~");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][24], 0.195199, 0.997688);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][24], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][24], 1920103167);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][24], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][24], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][24], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][24], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][24], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][24], 0);

	MDC_PenalCode[playerid][25] = CreatePlayerTextDraw(playerid, 508.103912, 296.487518, "Ekle");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][25], 0.151998, 0.923198);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][25], 10.109999, 28.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][25], 2);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][25], 875836671);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][25], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][25], -1431655681);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][25], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][25], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][25], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][25], 2);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][25], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][25], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][25], true);

	MDC_PenalCode[playerid][26] = CreatePlayerTextDraw(playerid, 443.201263, 309.999816, "~y~]_~w~SECILMIS_ISLEMLER_~y~]_");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][26], 0.202399, 0.918042);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][26], 0.000000, 157.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][26], 2);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][26], -1);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][26], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][26], 505290495);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][26], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][26], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][26], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][26], 2);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][26], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][26], 0);

	MDC_PenalCode[playerid][27] = CreatePlayerTextDraw(playerid, 364.701293, 323.893890, "selectedCharge1");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][27], 0.202399, 0.918042);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][27], 521.939941, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][27], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][27], 555819519);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][27], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][27], -1111638529);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][27], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][27], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][27], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][27], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][27], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][27], 0);

	MDC_PenalCode[playerid][28] = CreatePlayerTextDraw(playerid, 364.701293, 337.094696, "selectedCharge2");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][28], 0.202399, 0.918042);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][28], 521.939941, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][28], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][28], 555819519);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][28], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][28], -1111638529);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][28], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][28], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][28], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][28], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][28], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][28], 0);

	MDC_PenalCode[playerid][29] = CreatePlayerTextDraw(playerid, 364.701293, 350.395507, "selectedCharge3");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][29], 0.202399, 0.918042);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][29], 521.939941, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][29], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][29], 555819519);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][29], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][29], -1111638529);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][29], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][29], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][29], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][29], 1);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][29], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][29], 0);

	MDC_PenalCode[playerid][30] = CreatePlayerTextDraw(playerid, 364.403167, 364.132598, "~>~Temizle");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][30], 0.151998, 0.923198);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][30], 396.499114, 10.109999);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][30], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][30], -1145324545);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][30], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][30], 741092607);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][30], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][30], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][30], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][30], 2);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][30], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][30], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][30], true);

	MDC_PenalCode[playerid][31] = CreatePlayerTextDraw(playerid, 515.307800, 350.399475, "~u~");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][31], 0.137198, 0.938887);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][31], 522.000000, 10.379999);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][31], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][31], -1145324545);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][31], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][31], 741092607);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][31], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][31], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][31], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][31], 2);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][31], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][31], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][31], true);

	MDC_PenalCode[playerid][32] = CreatePlayerTextDraw(playerid, 488.903076, 364.152801, "~>~Uygula");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][32], 0.151998, 0.923198);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][32], 522.401123, 10.109999);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][32], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][32], -1145324545);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][32], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][32], -1877270017);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][32], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][32], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][32], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][32], 2);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][32], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][32], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][32], true);

	MDC_PenalCode[playerid][33] = CreatePlayerTextDraw(playerid, 515.307800, 323.997863, "~d~");
	PlayerTextDrawLetterSize(playerid, MDC_PenalCode[playerid][33], 0.137198, 0.938887);
	PlayerTextDrawTextSize(playerid, MDC_PenalCode[playerid][33], 522.000000, 10.379999);
	PlayerTextDrawAlignment(playerid, MDC_PenalCode[playerid][33], 1);
	PlayerTextDrawColor(playerid, MDC_PenalCode[playerid][33], -1145324545);
	PlayerTextDrawUseBox(playerid, MDC_PenalCode[playerid][33], 1);
	PlayerTextDrawBoxColor(playerid, MDC_PenalCode[playerid][33], 741092607);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][33], 0);
	PlayerTextDrawSetOutline(playerid, MDC_PenalCode[playerid][33], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_PenalCode[playerid][33], 255);
	PlayerTextDrawFont(playerid, MDC_PenalCode[playerid][33], 2);
	PlayerTextDrawSetProportional(playerid, MDC_PenalCode[playerid][33], 1);
	PlayerTextDrawSetShadow(playerid, MDC_PenalCode[playerid][33], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_PenalCode[playerid][33], true);

	MDC_Emergency[playerid][0] = CreatePlayerTextDraw(playerid, 232.399871, 183.855056, "box");
	PlayerTextDrawLetterSize(playerid, MDC_Emergency[playerid][0], 0.000000, 5.840000);
	PlayerTextDrawTextSize(playerid, MDC_Emergency[playerid][0], 519.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_Emergency[playerid][0], 1);
	PlayerTextDrawColor(playerid, MDC_Emergency[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, MDC_Emergency[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Emergency[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Emergency[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Emergency[playerid][0], 255);
	PlayerTextDrawFont(playerid, MDC_Emergency[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Emergency[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][0], 0);

	MDC_Emergency[playerid][1] = CreatePlayerTextDraw(playerid, 234.199844, 185.278533, "Arayan:~n~Servis:~n~Lokasyon:~n~Aciklama:~n~Tarih:~n~Durum:");
	PlayerTextDrawLetterSize(playerid, MDC_Emergency[playerid][1], 0.207999, 0.928355);
	PlayerTextDrawAlignment(playerid, MDC_Emergency[playerid][1], 1);
	PlayerTextDrawColor(playerid, MDC_Emergency[playerid][1], 1179010303);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Emergency[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Emergency[playerid][1], 255);
	PlayerTextDrawFont(playerid, MDC_Emergency[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Emergency[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][1], 0);

	MDC_Emergency[playerid][2] = CreatePlayerTextDraw(playerid, 279.702606, 185.278533, "caller1~n~service1~n~location1~n~situation1~n~time1~n~status1");
	PlayerTextDrawLetterSize(playerid, MDC_Emergency[playerid][2], 0.207999, 0.928355);
	PlayerTextDrawAlignment(playerid, MDC_Emergency[playerid][2], 1);
	PlayerTextDrawColor(playerid, MDC_Emergency[playerid][2], -1431655937);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Emergency[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Emergency[playerid][2], 255);
	PlayerTextDrawFont(playerid, MDC_Emergency[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Emergency[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][2], 0);

	MDC_Emergency[playerid][3] = CreatePlayerTextDraw(playerid, 453.997863, 227.698638, "Ustlen");
	PlayerTextDrawLetterSize(playerid, MDC_Emergency[playerid][3], 0.151199, 0.803555);
	PlayerTextDrawTextSize(playerid, MDC_Emergency[playerid][3], 10.000000, 40.000000);
	PlayerTextDrawAlignment(playerid, MDC_Emergency[playerid][3], 2);
	PlayerTextDrawColor(playerid, MDC_Emergency[playerid][3], -1);
	PlayerTextDrawUseBox(playerid, MDC_Emergency[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Emergency[playerid][3], -2145901825);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Emergency[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Emergency[playerid][3], 255);
	PlayerTextDrawFont(playerid, MDC_Emergency[playerid][3], 2);
	PlayerTextDrawSetProportional(playerid, MDC_Emergency[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][3], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Emergency[playerid][3], true);

	MDC_Emergency[playerid][4] = CreatePlayerTextDraw(playerid, 497.700561, 227.698638, "Detaylar");
	PlayerTextDrawLetterSize(playerid, MDC_Emergency[playerid][4], 0.151199, 0.803555);
	PlayerTextDrawTextSize(playerid, MDC_Emergency[playerid][4], 10.000000, 40.000000);
	PlayerTextDrawAlignment(playerid, MDC_Emergency[playerid][4], 2);
	PlayerTextDrawColor(playerid, MDC_Emergency[playerid][4], -1);
	PlayerTextDrawUseBox(playerid, MDC_Emergency[playerid][4], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Emergency[playerid][4], 255);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Emergency[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Emergency[playerid][4], 255);
	PlayerTextDrawFont(playerid, MDC_Emergency[playerid][4], 2);
	PlayerTextDrawSetProportional(playerid, MDC_Emergency[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][4], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Emergency[playerid][4], true);

	MDC_Emergency[playerid][5] = CreatePlayerTextDraw(playerid, 231.999893, 242.116699, "box");
	PlayerTextDrawLetterSize(playerid, MDC_Emergency[playerid][5], 0.000000, 5.840000);
	PlayerTextDrawTextSize(playerid, MDC_Emergency[playerid][5], 518.399902, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_Emergency[playerid][5], 1);
	PlayerTextDrawColor(playerid, MDC_Emergency[playerid][5], -1);
	PlayerTextDrawUseBox(playerid, MDC_Emergency[playerid][5], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Emergency[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Emergency[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Emergency[playerid][5], 255);
	PlayerTextDrawFont(playerid, MDC_Emergency[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Emergency[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][5], 0);

	MDC_Emergency[playerid][6] = CreatePlayerTextDraw(playerid, 234.199813, 243.347793, "Arayan:~n~Servis:~n~Lokasyon:~n~Aciklama:~n~Tarih:~n~Durum:");
	PlayerTextDrawLetterSize(playerid, MDC_Emergency[playerid][6], 0.207999, 0.928355);
	PlayerTextDrawAlignment(playerid, MDC_Emergency[playerid][6], 1);
	PlayerTextDrawColor(playerid, MDC_Emergency[playerid][6], 1179010303);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Emergency[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Emergency[playerid][6], 255);
	PlayerTextDrawFont(playerid, MDC_Emergency[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Emergency[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][6], 0);

	MDC_Emergency[playerid][7] = CreatePlayerTextDraw(playerid, 278.702423, 243.354522, "caller2~n~service2~n~location2~n~situation2~n~time2~n~status2");
	PlayerTextDrawLetterSize(playerid, MDC_Emergency[playerid][7], 0.207999, 0.928355);
	PlayerTextDrawAlignment(playerid, MDC_Emergency[playerid][7], 1);
	PlayerTextDrawColor(playerid, MDC_Emergency[playerid][7], -1431655937);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Emergency[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Emergency[playerid][7], 255);
	PlayerTextDrawFont(playerid, MDC_Emergency[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Emergency[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][7], 0);

	MDC_Emergency[playerid][8] = CreatePlayerTextDraw(playerid, 454.497711, 285.753479, "Ustlen");
	PlayerTextDrawLetterSize(playerid, MDC_Emergency[playerid][8], 0.151199, 0.803555);
	PlayerTextDrawTextSize(playerid, MDC_Emergency[playerid][8], 10.000000, 40.000000);
	PlayerTextDrawAlignment(playerid, MDC_Emergency[playerid][8], 2);
	PlayerTextDrawColor(playerid, MDC_Emergency[playerid][8], -1);
	PlayerTextDrawUseBox(playerid, MDC_Emergency[playerid][8], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Emergency[playerid][8], -2145901825);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Emergency[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Emergency[playerid][8], 255);
	PlayerTextDrawFont(playerid, MDC_Emergency[playerid][8], 2);
	PlayerTextDrawSetProportional(playerid, MDC_Emergency[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][8], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Emergency[playerid][8], true);

	MDC_Emergency[playerid][9] = CreatePlayerTextDraw(playerid, 497.800628, 285.803894, "Detaylar");
	PlayerTextDrawLetterSize(playerid, MDC_Emergency[playerid][9], 0.151199, 0.803555);
	PlayerTextDrawTextSize(playerid, MDC_Emergency[playerid][9], 10.869999, 39.000000);
	PlayerTextDrawAlignment(playerid, MDC_Emergency[playerid][9], 2);
	PlayerTextDrawColor(playerid, MDC_Emergency[playerid][9], -1);
	PlayerTextDrawUseBox(playerid, MDC_Emergency[playerid][9], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Emergency[playerid][9], 255);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Emergency[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Emergency[playerid][9], 255);
	PlayerTextDrawFont(playerid, MDC_Emergency[playerid][9], 2);
	PlayerTextDrawSetProportional(playerid, MDC_Emergency[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][9], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Emergency[playerid][9], true);

	MDC_Emergency[playerid][10] = CreatePlayerTextDraw(playerid, 231.999923, 300.499481, "box");
	PlayerTextDrawLetterSize(playerid, MDC_Emergency[playerid][10], 0.000000, 5.840000);
	PlayerTextDrawTextSize(playerid, MDC_Emergency[playerid][10], 518.399902, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_Emergency[playerid][10], 1);
	PlayerTextDrawColor(playerid, MDC_Emergency[playerid][10], -1);
	PlayerTextDrawUseBox(playerid, MDC_Emergency[playerid][10], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Emergency[playerid][10], -1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Emergency[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Emergency[playerid][10], 255);
	PlayerTextDrawFont(playerid, MDC_Emergency[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Emergency[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][10], 0);

	MDC_Emergency[playerid][11] = CreatePlayerTextDraw(playerid, 234.199768, 301.557617, "Arayan:~n~Servis:~n~Lokasyon:~n~Aciklama:~n~Tarih:~n~Durum:");
	PlayerTextDrawLetterSize(playerid, MDC_Emergency[playerid][11], 0.207999, 0.928355);
	PlayerTextDrawAlignment(playerid, MDC_Emergency[playerid][11], 1);
	PlayerTextDrawColor(playerid, MDC_Emergency[playerid][11], 1179010303);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Emergency[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Emergency[playerid][11], 255);
	PlayerTextDrawFont(playerid, MDC_Emergency[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Emergency[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][11], 0);

	MDC_Emergency[playerid][12] = CreatePlayerTextDraw(playerid, 278.702178, 302.039581, "caller3~n~service3~n~location3~n~situation3~n~time3~n~status3");
	PlayerTextDrawLetterSize(playerid, MDC_Emergency[playerid][12], 0.207999, 0.928355);
	PlayerTextDrawAlignment(playerid, MDC_Emergency[playerid][12], 1);
	PlayerTextDrawColor(playerid, MDC_Emergency[playerid][12], -1431655937);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Emergency[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Emergency[playerid][12], 255);
	PlayerTextDrawFont(playerid, MDC_Emergency[playerid][12], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Emergency[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][12], 0);

	MDC_Emergency[playerid][13] = CreatePlayerTextDraw(playerid, 453.997711, 344.116027, "Ustlen");
	PlayerTextDrawLetterSize(playerid, MDC_Emergency[playerid][13], 0.151199, 0.803555);
	PlayerTextDrawTextSize(playerid, MDC_Emergency[playerid][13], 10.000000, 40.000000);
	PlayerTextDrawAlignment(playerid, MDC_Emergency[playerid][13], 2);
	PlayerTextDrawColor(playerid, MDC_Emergency[playerid][13], -1);
	PlayerTextDrawUseBox(playerid, MDC_Emergency[playerid][13], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Emergency[playerid][13], -2145901825);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Emergency[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Emergency[playerid][13], 255);
	PlayerTextDrawFont(playerid, MDC_Emergency[playerid][13], 2);
	PlayerTextDrawSetProportional(playerid, MDC_Emergency[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][13], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Emergency[playerid][13], true);

	MDC_Emergency[playerid][14] = CreatePlayerTextDraw(playerid, 497.700622, 343.984527, "Detaylar");
	PlayerTextDrawLetterSize(playerid, MDC_Emergency[playerid][14], 0.151199, 0.803555);
	PlayerTextDrawTextSize(playerid, MDC_Emergency[playerid][14], 10.000000, 40.000000);
	PlayerTextDrawAlignment(playerid, MDC_Emergency[playerid][14], 2);
	PlayerTextDrawColor(playerid, MDC_Emergency[playerid][14], -1);
	PlayerTextDrawUseBox(playerid, MDC_Emergency[playerid][14], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Emergency[playerid][14], 255);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Emergency[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Emergency[playerid][14], 255);
	PlayerTextDrawFont(playerid, MDC_Emergency[playerid][14], 2);
	PlayerTextDrawSetProportional(playerid, MDC_Emergency[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][14], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Emergency[playerid][14], true);

	MDC_Emergency[playerid][15] = CreatePlayerTextDraw(playerid, 232.199905, 358.629638, "box");
	PlayerTextDrawLetterSize(playerid, MDC_Emergency[playerid][15], 0.000000, 5.840000);
	PlayerTextDrawTextSize(playerid, MDC_Emergency[playerid][15], 519.019775, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_Emergency[playerid][15], 1);
	PlayerTextDrawColor(playerid, MDC_Emergency[playerid][15], -1);
	PlayerTextDrawUseBox(playerid, MDC_Emergency[playerid][15], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Emergency[playerid][15], -1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Emergency[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Emergency[playerid][15], 255);
	PlayerTextDrawFont(playerid, MDC_Emergency[playerid][15], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Emergency[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][15], 0);

	MDC_Emergency[playerid][16] = CreatePlayerTextDraw(playerid, 234.199554, 358.908782, "Arayan:~n~Servis:~n~Lokasyon:~n~Aciklama:~n~Sure:~n~Durum:");
	PlayerTextDrawLetterSize(playerid, MDC_Emergency[playerid][16], 0.207999, 0.928355);
	PlayerTextDrawAlignment(playerid, MDC_Emergency[playerid][16], 1);
	PlayerTextDrawColor(playerid, MDC_Emergency[playerid][16], 1179010303);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Emergency[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Emergency[playerid][16], 255);
	PlayerTextDrawFont(playerid, MDC_Emergency[playerid][16], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Emergency[playerid][16], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][16], 0);

	MDC_Emergency[playerid][17] = CreatePlayerTextDraw(playerid, 278.702392, 359.795349, "caller4~n~service4~n~location4~n~situation4~n~time4~n~status4");
	PlayerTextDrawLetterSize(playerid, MDC_Emergency[playerid][17], 0.207999, 0.928355);
	PlayerTextDrawAlignment(playerid, MDC_Emergency[playerid][17], 1);
	PlayerTextDrawColor(playerid, MDC_Emergency[playerid][17], -1431655937);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][17], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Emergency[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Emergency[playerid][17], 255);
	PlayerTextDrawFont(playerid, MDC_Emergency[playerid][17], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Emergency[playerid][17], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][17], 0);

	MDC_Emergency[playerid][18] = CreatePlayerTextDraw(playerid, 453.897216, 402.484436, "Ustlen");
	PlayerTextDrawLetterSize(playerid, MDC_Emergency[playerid][18], 0.151199, 0.803555);
	PlayerTextDrawTextSize(playerid, MDC_Emergency[playerid][18], 10.000000, 40.000000);
	PlayerTextDrawAlignment(playerid, MDC_Emergency[playerid][18], 2);
	PlayerTextDrawColor(playerid, MDC_Emergency[playerid][18], -1);
	PlayerTextDrawUseBox(playerid, MDC_Emergency[playerid][18], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Emergency[playerid][18], -2145901825);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][18], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Emergency[playerid][18], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Emergency[playerid][18], 255);
	PlayerTextDrawFont(playerid, MDC_Emergency[playerid][18], 2);
	PlayerTextDrawSetProportional(playerid, MDC_Emergency[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][18], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Emergency[playerid][18], true);

	MDC_Emergency[playerid][19] = CreatePlayerTextDraw(playerid, 497.600708, 402.260589, "Detaylar");
	PlayerTextDrawLetterSize(playerid, MDC_Emergency[playerid][19], 0.151199, 0.803555);
	PlayerTextDrawTextSize(playerid, MDC_Emergency[playerid][19], 10.000000, 40.000000);
	PlayerTextDrawAlignment(playerid, MDC_Emergency[playerid][19], 2);
	PlayerTextDrawColor(playerid, MDC_Emergency[playerid][19], -1);
	PlayerTextDrawUseBox(playerid, MDC_Emergency[playerid][19], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Emergency[playerid][19], 255);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][19], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Emergency[playerid][19], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Emergency[playerid][19], 255);
	PlayerTextDrawFont(playerid, MDC_Emergency[playerid][19], 2);
	PlayerTextDrawSetProportional(playerid, MDC_Emergency[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][19], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Emergency[playerid][19], true);

	MDC_Emergency[playerid][20] = CreatePlayerTextDraw(playerid, 456.299560, 417.986206, "~>~");
	PlayerTextDrawLetterSize(playerid, MDC_Emergency[playerid][20], 0.327599, 1.246577);
	PlayerTextDrawTextSize(playerid, MDC_Emergency[playerid][20], 10.000000, 125.829963);
	PlayerTextDrawAlignment(playerid, MDC_Emergency[playerid][20], 2);
	PlayerTextDrawColor(playerid, MDC_Emergency[playerid][20], -1);
	PlayerTextDrawUseBox(playerid, MDC_Emergency[playerid][20], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Emergency[playerid][20], 1987475199);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][20], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Emergency[playerid][20], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Emergency[playerid][20], 255);
	PlayerTextDrawFont(playerid, MDC_Emergency[playerid][20], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Emergency[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][20], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Emergency[playerid][20], true);

	MDC_Emergency[playerid][21] = CreatePlayerTextDraw(playerid, 295.598083, 417.905151, "~<~");
	PlayerTextDrawLetterSize(playerid, MDC_Emergency[playerid][21], 0.327599, 1.246577);
	PlayerTextDrawTextSize(playerid, MDC_Emergency[playerid][21], 10.000000, 125.829963);
	PlayerTextDrawAlignment(playerid, MDC_Emergency[playerid][21], 2);
	PlayerTextDrawColor(playerid, MDC_Emergency[playerid][21], -1);
	PlayerTextDrawUseBox(playerid, MDC_Emergency[playerid][21], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Emergency[playerid][21], 1987475199);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][21], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Emergency[playerid][21], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Emergency[playerid][21], 255);
	PlayerTextDrawFont(playerid, MDC_Emergency[playerid][21], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Emergency[playerid][21], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Emergency[playerid][21], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Emergency[playerid][21], true);

	MDC_Warrants[playerid][0] = CreatePlayerTextDraw(playerid, 289.103332, 183.955062, "box");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][0], 0.000000, 6.728005);
	PlayerTextDrawTextSize(playerid, MDC_Warrants[playerid][0], 501.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][0], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, MDC_Warrants[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Warrants[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][0], 255);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][0], 0);

	MDC_Warrants[playerid][1] = CreatePlayerTextDraw(playerid, 232.402648, 183.943847, "box");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][1], 0.000000, 6.720008);
	PlayerTextDrawTextSize(playerid, MDC_Warrants[playerid][1], 279.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][1], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][1], -1);
	PlayerTextDrawUseBox(playerid, MDC_Warrants[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Warrants[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][1], 255);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][1], 0);

	MDC_Warrants[playerid][2] = CreatePlayerTextDraw(playerid, 226.499847, 185.875701, "");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][2], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, MDC_Warrants[playerid][2], 56.000000, 56.000000);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][2], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][2], 2565888);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][2], 5);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][2], 0);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][2], TEXT_DRAW_FONT_MODEL_PREVIEW);
	PlayerTextDrawSetPreviewModel(playerid, MDC_Warrants[playerid][2], 295);
	PlayerTextDrawSetPreviewRot(playerid, MDC_Warrants[playerid][2], 0.000000, 0.000000, 0.000000, 1.000000);

	MDC_Warrants[playerid][3] = CreatePlayerTextDraw(playerid, 293.100036, 187.215606, "Aranan:~n~Aranma_Sebebi:");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][3], 0.183599, 0.843377);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][3], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][3], 572465919);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][3], 255);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][3], 0);

	MDC_Warrants[playerid][4] = CreatePlayerTextDraw(playerid, 354.500305, 187.215606, "wantedName(20)~n~-wantedReason1~n~-wantedReason2~n~-wantedReason3~n~-wantedReason4~n~-wantedReason5");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][4], 0.183599, 0.843377);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][4], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][4], -1313885441);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][4], 255);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][4], 0);

	MDC_Warrants[playerid][5] = CreatePlayerTextDraw(playerid, 472.700378, 235.420318, "Kaldir");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][5], 0.175799, 0.797244);
	PlayerTextDrawTextSize(playerid, MDC_Warrants[playerid][5], 499.100067, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][5], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][5], -1);
	PlayerTextDrawUseBox(playerid, MDC_Warrants[playerid][5], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Warrants[playerid][5], -2145901825);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][5], 255);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][5], 2);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][5], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Warrants[playerid][5], true);

	MDC_Warrants[playerid][6] = CreatePlayerTextDraw(playerid, 442.098510, 235.420318, "__Ekle");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][6], 0.175799, 0.797244);
	PlayerTextDrawTextSize(playerid, MDC_Warrants[playerid][6], 468.498199, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][6], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][6], -1);
	PlayerTextDrawUseBox(playerid, MDC_Warrants[playerid][6], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Warrants[playerid][6], 8388863);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][6], 255);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][6], 2);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][6], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Warrants[playerid][6], true);

	MDC_Warrants[playerid][7] = CreatePlayerTextDraw(playerid, 289.103332, 253.659317, "box");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][7], 0.000000, 6.728005);
	PlayerTextDrawTextSize(playerid, MDC_Warrants[playerid][7], 501.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][7], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][7], -1);
	PlayerTextDrawUseBox(playerid, MDC_Warrants[playerid][7], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Warrants[playerid][7], -1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][7], 255);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][7], 0);

	MDC_Warrants[playerid][8] = CreatePlayerTextDraw(playerid, 232.401214, 253.711578, "box");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][8], 0.000000, 6.720008);
	PlayerTextDrawTextSize(playerid, MDC_Warrants[playerid][8], 280.398559, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][8], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][8], -1);
	PlayerTextDrawUseBox(playerid, MDC_Warrants[playerid][8], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Warrants[playerid][8], -1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][8], 255);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][8], 0);

	MDC_Warrants[playerid][9] = CreatePlayerTextDraw(playerid, 226.499588, 252.511672, "");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][9], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, MDC_Warrants[playerid][9], 56.000000, 56.000000);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][9], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][9], -1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][9], 2565888);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][9], 5);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][9], 0);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][9], 0);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][9], TEXT_DRAW_FONT_MODEL_PREVIEW);
	PlayerTextDrawSetPreviewModel(playerid, MDC_Warrants[playerid][9], 26);
	PlayerTextDrawSetPreviewRot(playerid, MDC_Warrants[playerid][9], 0.000000, 0.000000, 0.000000, 1.000000);

	MDC_Warrants[playerid][10] = CreatePlayerTextDraw(playerid, 293.199951, 256.135101, "Aranan:~n~Aranma_Sebebi:");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][10], 0.183599, 0.843377);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][10], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][10], 572465919);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][10], 255);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][10], 0);

	MDC_Warrants[playerid][11] = CreatePlayerTextDraw(playerid, 354.500305, 255.619781, "wantedName(20)~n~-wantedReason1~n~-wantedReason2~n~-wantedReason3~n~-wantedReason4~n~-wantedReason5");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][11], 0.183599, 0.843377);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][11], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][11], -1313885441);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][11], 255);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][11], 0);

	MDC_Warrants[playerid][12] = CreatePlayerTextDraw(playerid, 472.700408, 304.626342, "Kaldir");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][12], 0.175799, 0.797244);
	PlayerTextDrawTextSize(playerid, MDC_Warrants[playerid][12], 498.400024, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][12], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][12], -1);
	PlayerTextDrawUseBox(playerid, MDC_Warrants[playerid][12], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Warrants[playerid][12], -2145901825);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][12], 255);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][12], 2);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][12], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Warrants[playerid][12], true);

	MDC_Warrants[playerid][13] = CreatePlayerTextDraw(playerid, 442.198455, 304.554260, "__Ekle");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][13], 0.175799, 0.797244);
	PlayerTextDrawTextSize(playerid, MDC_Warrants[playerid][13], 468.699981, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][13], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][13], -1);
	PlayerTextDrawUseBox(playerid, MDC_Warrants[playerid][13], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Warrants[playerid][13], 8388863);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][13], 255);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][13], 2);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][13], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Warrants[playerid][13], true);

	MDC_Warrants[playerid][14] = CreatePlayerTextDraw(playerid, 289.103210, 323.660827, "box");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][14], 0.000000, 6.728005);
	PlayerTextDrawTextSize(playerid, MDC_Warrants[playerid][14], 500.451293, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][14], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][14], -1);
	PlayerTextDrawUseBox(playerid, MDC_Warrants[playerid][14], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Warrants[playerid][14], -1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][14], 255);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][14], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][14], 0);

	MDC_Warrants[playerid][15] = CreatePlayerTextDraw(playerid, 232.401077, 323.640960, "box");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][15], 0.000000, 6.720008);
	PlayerTextDrawTextSize(playerid, MDC_Warrants[playerid][15], 279.999877, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][15], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][15], -1);
	PlayerTextDrawUseBox(playerid, MDC_Warrants[playerid][15], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Warrants[playerid][15], -1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][15], 255);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][15], 0);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][15], 0);

	MDC_Warrants[playerid][16] = CreatePlayerTextDraw(playerid, 226.399230, 323.079376, "");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][16], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, MDC_Warrants[playerid][16], 56.000000, 56.000000);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][16], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][16], -1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][16], 2565888);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][16], 5);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][16], 0);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][16], 0);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][16], TEXT_DRAW_FONT_MODEL_PREVIEW);
	PlayerTextDrawSetPreviewModel(playerid, MDC_Warrants[playerid][16], 67);
	PlayerTextDrawSetPreviewRot(playerid, MDC_Warrants[playerid][16], 0.000000, 0.000000, 0.000000, 1.000000);

	MDC_Warrants[playerid][17] = CreatePlayerTextDraw(playerid, 293.100036, 326.562347, "Aranan:~n~Aranma_Sebebi:");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][17], 0.183599, 0.843377);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][17], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][17], 572465919);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][17], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][17], 255);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][17], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][17], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][17], 0);

	MDC_Warrants[playerid][18] = CreatePlayerTextDraw(playerid, 354.500213, 325.580810, "wantedName(20)~n~-wantedReason1~n~-wantedReason2~n~-wantedReason3~n~-wantedReason4~n~-wantedReason5");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][18], 0.183599, 0.843377);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][18], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][18], -1313885441);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][18], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][18], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][18], 255);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][18], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][18], 0);

	MDC_Warrants[playerid][19] = CreatePlayerTextDraw(playerid, 473.100341, 374.658050, "Kaldir");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][19], 0.175799, 0.797244);
	PlayerTextDrawTextSize(playerid, MDC_Warrants[playerid][19], 498.799926, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][19], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][19], -1);
	PlayerTextDrawUseBox(playerid, MDC_Warrants[playerid][19], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Warrants[playerid][19], -2145901825);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][19], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][19], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][19], 255);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][19], 2);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][19], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Warrants[playerid][19], true);

	MDC_Warrants[playerid][20] = CreatePlayerTextDraw(playerid, 441.398345, 374.608612, "__Ekle");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][20], 0.175799, 0.797244);
	PlayerTextDrawTextSize(playerid, MDC_Warrants[playerid][20], 468.999877, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][20], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][20], -1);
	PlayerTextDrawUseBox(playerid, MDC_Warrants[playerid][20], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Warrants[playerid][20], 8388863);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][20], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][20], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][20], 255);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][20], 2);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][20], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Warrants[playerid][20], true);

	MDC_Warrants[playerid][21] = CreatePlayerTextDraw(playerid, 478.100006, 390.257904, "~<~");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][21], 0.161599, 0.991467);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][21], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][21], -1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][21], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][21], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][21], 255);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][21], 0);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][21], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][21], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Warrants[playerid][21], true);

	MDC_Warrants[playerid][22] = CreatePlayerTextDraw(playerid, 490.500762, 390.257904, "~>~");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][22], 0.161599, 0.991467);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][22], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][22], -1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][22], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][22], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][22], 255);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][22], 0);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][22], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][22], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Warrants[playerid][22], true);

	MDC_Warrants[playerid][23] = CreatePlayerTextDraw(playerid, 431.000488, 169.157714, "~>~YENI_ARANMA_OLUSTUR");
	PlayerTextDrawLetterSize(playerid, MDC_Warrants[playerid][23], 0.137799, 0.946578);
	PlayerTextDrawTextSize(playerid, MDC_Warrants[playerid][23], 501.000305, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Warrants[playerid][23], 1);
	PlayerTextDrawColor(playerid, MDC_Warrants[playerid][23], -1);
	PlayerTextDrawUseBox(playerid, MDC_Warrants[playerid][23], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Warrants[playerid][23], -2139062017);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][23], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Warrants[playerid][23], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Warrants[playerid][23], 255);
	PlayerTextDrawFont(playerid, MDC_Warrants[playerid][23], 2);
	PlayerTextDrawSetProportional(playerid, MDC_Warrants[playerid][23], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Warrants[playerid][23], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Warrants[playerid][23], true);

	MDC_Roster[playerid][0] = CreatePlayerTextDraw(playerid, 232.300201, 170.997940, "Gorevdeki_birimlerin_listesi");
	PlayerTextDrawLetterSize(playerid, MDC_Roster[playerid][0], 0.179398, 0.892799);
	PlayerTextDrawTextSize(playerid, MDC_Roster[playerid][0], 418.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Roster[playerid][0], 1);
	PlayerTextDrawColor(playerid, MDC_Roster[playerid][0], -1431655681);
	PlayerTextDrawUseBox(playerid, MDC_Roster[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Roster[playerid][0], 858993663);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Roster[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Roster[playerid][0], 255);
	PlayerTextDrawFont(playerid, MDC_Roster[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Roster[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][0], 0);

	MDC_Roster[playerid][1] = CreatePlayerTextDraw(playerid, 232.300201, 185.798843, "onDutyUnit1");
	PlayerTextDrawLetterSize(playerid, MDC_Roster[playerid][1], 0.207599, 1.037821);
	PlayerTextDrawTextSize(playerid, MDC_Roster[playerid][1], 418.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Roster[playerid][1], 1);
	PlayerTextDrawColor(playerid, MDC_Roster[playerid][1], 858993663);
	PlayerTextDrawUseBox(playerid, MDC_Roster[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Roster[playerid][1], -1431655681);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Roster[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Roster[playerid][1], 255);
	PlayerTextDrawFont(playerid, MDC_Roster[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Roster[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][1], 0);

	MDC_Roster[playerid][2] = CreatePlayerTextDraw(playerid, 232.300201, 200.399734, "onDutyUnit2");
	PlayerTextDrawLetterSize(playerid, MDC_Roster[playerid][2], 0.207599, 1.037821);
	PlayerTextDrawTextSize(playerid, MDC_Roster[playerid][2], 418.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Roster[playerid][2], 1);
	PlayerTextDrawColor(playerid, MDC_Roster[playerid][2], 858993663);
	PlayerTextDrawUseBox(playerid, MDC_Roster[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Roster[playerid][2], -1431655681);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Roster[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Roster[playerid][2], 255);
	PlayerTextDrawFont(playerid, MDC_Roster[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Roster[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][2], 0);

	MDC_Roster[playerid][3] = CreatePlayerTextDraw(playerid, 232.300201, 215.200637, "onDutyUnit3");
	PlayerTextDrawLetterSize(playerid, MDC_Roster[playerid][3], 0.207599, 1.037821);
	PlayerTextDrawTextSize(playerid, MDC_Roster[playerid][3], 418.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Roster[playerid][3], 1);
	PlayerTextDrawColor(playerid, MDC_Roster[playerid][3], 858993663);
	PlayerTextDrawUseBox(playerid, MDC_Roster[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Roster[playerid][3], -1431655681);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Roster[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Roster[playerid][3], 255);
	PlayerTextDrawFont(playerid, MDC_Roster[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Roster[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][3], 0);

	MDC_Roster[playerid][4] = CreatePlayerTextDraw(playerid, 232.300201, 230.201553, "onDutyUnit4");
	PlayerTextDrawLetterSize(playerid, MDC_Roster[playerid][4], 0.207599, 1.037821);
	PlayerTextDrawTextSize(playerid, MDC_Roster[playerid][4], 418.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Roster[playerid][4], 1);
	PlayerTextDrawColor(playerid, MDC_Roster[playerid][4], 858993663);
	PlayerTextDrawUseBox(playerid, MDC_Roster[playerid][4], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Roster[playerid][4], -1431655681);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Roster[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Roster[playerid][4], 255);
	PlayerTextDrawFont(playerid, MDC_Roster[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Roster[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][4], 0);

	MDC_Roster[playerid][5] = CreatePlayerTextDraw(playerid, 232.300201, 245.202468, "onDutyUnit5");
	PlayerTextDrawLetterSize(playerid, MDC_Roster[playerid][5], 0.207599, 1.037821);
	PlayerTextDrawTextSize(playerid, MDC_Roster[playerid][5], 418.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Roster[playerid][5], 1);
	PlayerTextDrawColor(playerid, MDC_Roster[playerid][5], 858993663);
	PlayerTextDrawUseBox(playerid, MDC_Roster[playerid][5], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Roster[playerid][5], -1431655681);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Roster[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Roster[playerid][5], 255);
	PlayerTextDrawFont(playerid, MDC_Roster[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Roster[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][5], 0);

	MDC_Roster[playerid][6] = CreatePlayerTextDraw(playerid, 232.300201, 260.003356, "onDutyUnit6");
	PlayerTextDrawLetterSize(playerid, MDC_Roster[playerid][6], 0.207599, 1.037821);
	PlayerTextDrawTextSize(playerid, MDC_Roster[playerid][6], 418.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Roster[playerid][6], 1);
	PlayerTextDrawColor(playerid, MDC_Roster[playerid][6], 858993663);
	PlayerTextDrawUseBox(playerid, MDC_Roster[playerid][6], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Roster[playerid][6], -1431655681);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Roster[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Roster[playerid][6], 255);
	PlayerTextDrawFont(playerid, MDC_Roster[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Roster[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][6], 0);

	MDC_Roster[playerid][7] = CreatePlayerTextDraw(playerid, 232.300201, 274.904266, "onDutyUnit7");
	PlayerTextDrawLetterSize(playerid, MDC_Roster[playerid][7], 0.207599, 1.037821);
	PlayerTextDrawTextSize(playerid, MDC_Roster[playerid][7], 418.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Roster[playerid][7], 1);
	PlayerTextDrawColor(playerid, MDC_Roster[playerid][7], 858993663);
	PlayerTextDrawUseBox(playerid, MDC_Roster[playerid][7], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Roster[playerid][7], -1431655681);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Roster[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Roster[playerid][7], 255);
	PlayerTextDrawFont(playerid, MDC_Roster[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Roster[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][7], 0);

	MDC_Roster[playerid][8] = CreatePlayerTextDraw(playerid, 232.300201, 289.805175, "onDutyUnit8");
	PlayerTextDrawLetterSize(playerid, MDC_Roster[playerid][8], 0.207599, 1.037821);
	PlayerTextDrawTextSize(playerid, MDC_Roster[playerid][8], 418.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Roster[playerid][8], 1);
	PlayerTextDrawColor(playerid, MDC_Roster[playerid][8], 858993663);
	PlayerTextDrawUseBox(playerid, MDC_Roster[playerid][8], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Roster[playerid][8], -1431655681);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Roster[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Roster[playerid][8], 255);
	PlayerTextDrawFont(playerid, MDC_Roster[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Roster[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][8], 0);

	MDC_Roster[playerid][9] = CreatePlayerTextDraw(playerid, 232.300201, 304.806091, "onDutyUnit9");
	PlayerTextDrawLetterSize(playerid, MDC_Roster[playerid][9], 0.207599, 1.037821);
	PlayerTextDrawTextSize(playerid, MDC_Roster[playerid][9], 418.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Roster[playerid][9], 1);
	PlayerTextDrawColor(playerid, MDC_Roster[playerid][9], 858993663);
	PlayerTextDrawUseBox(playerid, MDC_Roster[playerid][9], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Roster[playerid][9], -1431655681);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Roster[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Roster[playerid][9], 255);
	PlayerTextDrawFont(playerid, MDC_Roster[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Roster[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][9], 0);

	MDC_Roster[playerid][10] = CreatePlayerTextDraw(playerid, 232.300201, 319.606994, "onDutyUnit10");
	PlayerTextDrawLetterSize(playerid, MDC_Roster[playerid][10], 0.207599, 1.037821);
	PlayerTextDrawTextSize(playerid, MDC_Roster[playerid][10], 418.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Roster[playerid][10], 1);
	PlayerTextDrawColor(playerid, MDC_Roster[playerid][10], 858993663);
	PlayerTextDrawUseBox(playerid, MDC_Roster[playerid][10], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Roster[playerid][10], -1431655681);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Roster[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Roster[playerid][10], 255);
	PlayerTextDrawFont(playerid, MDC_Roster[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Roster[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][10], 0);

	MDC_Roster[playerid][11] = CreatePlayerTextDraw(playerid, 232.300201, 334.507904, "onDutyUnit11");
	PlayerTextDrawLetterSize(playerid, MDC_Roster[playerid][11], 0.207599, 1.037821);
	PlayerTextDrawTextSize(playerid, MDC_Roster[playerid][11], 418.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Roster[playerid][11], 1);
	PlayerTextDrawColor(playerid, MDC_Roster[playerid][11], 858993663);
	PlayerTextDrawUseBox(playerid, MDC_Roster[playerid][11], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Roster[playerid][11], -1431655681);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Roster[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Roster[playerid][11], 255);
	PlayerTextDrawFont(playerid, MDC_Roster[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Roster[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][11], 0);

	MDC_Roster[playerid][12] = CreatePlayerTextDraw(playerid, 232.300201, 349.408813, "onDutyUnit12");
	PlayerTextDrawLetterSize(playerid, MDC_Roster[playerid][12], 0.207599, 1.037821);
	PlayerTextDrawTextSize(playerid, MDC_Roster[playerid][12], 418.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Roster[playerid][12], 1);
	PlayerTextDrawColor(playerid, MDC_Roster[playerid][12], 858993663);
	PlayerTextDrawUseBox(playerid, MDC_Roster[playerid][12], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Roster[playerid][12], -1431655681);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Roster[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Roster[playerid][12], 255);
	PlayerTextDrawFont(playerid, MDC_Roster[playerid][12], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Roster[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][12], 0);

	MDC_Roster[playerid][13] = CreatePlayerTextDraw(playerid, 232.300201, 364.309722, "onDutyUnit13");
	PlayerTextDrawLetterSize(playerid, MDC_Roster[playerid][13], 0.207599, 1.037821);
	PlayerTextDrawTextSize(playerid, MDC_Roster[playerid][13], 418.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Roster[playerid][13], 1);
	PlayerTextDrawColor(playerid, MDC_Roster[playerid][13], 858993663);
	PlayerTextDrawUseBox(playerid, MDC_Roster[playerid][13], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Roster[playerid][13], -1431655681);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Roster[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Roster[playerid][13], 255);
	PlayerTextDrawFont(playerid, MDC_Roster[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Roster[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][13], 0);

	MDC_Roster[playerid][14] = CreatePlayerTextDraw(playerid, 232.300201, 379.010620, "onDutyUnit14");
	PlayerTextDrawLetterSize(playerid, MDC_Roster[playerid][14], 0.207599, 1.037821);
	PlayerTextDrawTextSize(playerid, MDC_Roster[playerid][14], 418.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Roster[playerid][14], 1);
	PlayerTextDrawColor(playerid, MDC_Roster[playerid][14], 858993663);
	PlayerTextDrawUseBox(playerid, MDC_Roster[playerid][14], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Roster[playerid][14], -1431655681);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Roster[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Roster[playerid][14], 255);
	PlayerTextDrawFont(playerid, MDC_Roster[playerid][14], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Roster[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][14], 0);

	MDC_Roster[playerid][15] = CreatePlayerTextDraw(playerid, 232.300201, 393.811523, "onDutyUnit15");
	PlayerTextDrawLetterSize(playerid, MDC_Roster[playerid][15], 0.207599, 1.037821);
	PlayerTextDrawTextSize(playerid, MDC_Roster[playerid][15], 418.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Roster[playerid][15], 1);
	PlayerTextDrawColor(playerid, MDC_Roster[playerid][15], 858993663);
	PlayerTextDrawUseBox(playerid, MDC_Roster[playerid][15], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Roster[playerid][15], -1431655681);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Roster[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Roster[playerid][15], 255);
	PlayerTextDrawFont(playerid, MDC_Roster[playerid][15], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Roster[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][15], 0);

	MDC_Roster[playerid][16] = CreatePlayerTextDraw(playerid, 232.300201, 408.912445, "onDutyUnit16");
	PlayerTextDrawLetterSize(playerid, MDC_Roster[playerid][16], 0.207599, 1.037821);
	PlayerTextDrawTextSize(playerid, MDC_Roster[playerid][16], 418.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Roster[playerid][16], 1);
	PlayerTextDrawColor(playerid, MDC_Roster[playerid][16], 858993663);
	PlayerTextDrawUseBox(playerid, MDC_Roster[playerid][16], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Roster[playerid][16], -1431655681);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Roster[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Roster[playerid][16], 255);
	PlayerTextDrawFont(playerid, MDC_Roster[playerid][16], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Roster[playerid][16], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][16], 0);

	MDC_Roster[playerid][17] = CreatePlayerTextDraw(playerid, 408.000091, 422.255462, "~>~");
	PlayerTextDrawLetterSize(playerid, MDC_Roster[playerid][17], 0.363600, 1.555200);
	PlayerTextDrawTextSize(playerid, MDC_Roster[playerid][17], 422.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Roster[playerid][17], 1);
	PlayerTextDrawColor(playerid, MDC_Roster[playerid][17], -1);
	PlayerTextDrawUseBox(playerid, MDC_Roster[playerid][17], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Roster[playerid][17], -1431655936);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][17], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Roster[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Roster[playerid][17], 255);
	PlayerTextDrawFont(playerid, MDC_Roster[playerid][17], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Roster[playerid][17], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][17], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Roster[playerid][17], true);

	MDC_Roster[playerid][18] = CreatePlayerTextDraw(playerid, 396.099365, 422.255462, "~<~");
	PlayerTextDrawLetterSize(playerid, MDC_Roster[playerid][18], 0.363600, 1.555200);
	PlayerTextDrawTextSize(playerid, MDC_Roster[playerid][18], 410.099273, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Roster[playerid][18], 1);
	PlayerTextDrawColor(playerid, MDC_Roster[playerid][18], -1);
	PlayerTextDrawUseBox(playerid, MDC_Roster[playerid][18], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Roster[playerid][18], -1431655936);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][18], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Roster[playerid][18], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Roster[playerid][18], 255);
	PlayerTextDrawFont(playerid, MDC_Roster[playerid][18], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Roster[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][18], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Roster[playerid][18], true);

	MDC_Roster[playerid][19] = CreatePlayerTextDraw(playerid, 424.101593, 170.995681, "Callsign_degistir");
	PlayerTextDrawLetterSize(playerid, MDC_Roster[playerid][19], 0.179398, 0.892799);
	PlayerTextDrawTextSize(playerid, MDC_Roster[playerid][19], 518.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Roster[playerid][19], 1);
	PlayerTextDrawColor(playerid, MDC_Roster[playerid][19], -1431655681);
	PlayerTextDrawUseBox(playerid, MDC_Roster[playerid][19], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Roster[playerid][19], 858993663);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][19], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Roster[playerid][19], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Roster[playerid][19], 255);
	PlayerTextDrawFont(playerid, MDC_Roster[playerid][19], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Roster[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][19], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Roster[playerid][19], true);

	MDC_Roster[playerid][20] = CreatePlayerTextDraw(playerid, 424.101593, 185.796585, "birim filtrele_...");
	PlayerTextDrawLetterSize(playerid, MDC_Roster[playerid][20], 0.179398, 0.892799);
	PlayerTextDrawTextSize(playerid, MDC_Roster[playerid][20], 518.000000, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_Roster[playerid][20], 1);
	PlayerTextDrawColor(playerid, MDC_Roster[playerid][20], -1431655681);
	PlayerTextDrawUseBox(playerid, MDC_Roster[playerid][20], 1);
	PlayerTextDrawBoxColor(playerid, MDC_Roster[playerid][20], -1);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][20], 0);
	PlayerTextDrawSetOutline(playerid, MDC_Roster[playerid][20], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_Roster[playerid][20], 255);
	PlayerTextDrawFont(playerid, MDC_Roster[playerid][20], 1);
	PlayerTextDrawSetProportional(playerid, MDC_Roster[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, MDC_Roster[playerid][20], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_Roster[playerid][20], true);

	MDC_EmergencyDetails[playerid][0] = CreatePlayerTextDraw(playerid, 235.599990, 192.986648, "Cagri_#No~n~~n~~n~Arayan:~n~TelefonNo:~n~Tarih:~n~Cagrilan_Servis:~n~Durum:~n~");
	PlayerTextDrawLetterSize(playerid, MDC_EmergencyDetails[playerid][0], 0.202799, 1.067377);
	PlayerTextDrawAlignment(playerid, MDC_EmergencyDetails[playerid][0], 1);
	PlayerTextDrawColor(playerid, MDC_EmergencyDetails[playerid][0], 1431655935);
	PlayerTextDrawSetShadow(playerid, MDC_EmergencyDetails[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, MDC_EmergencyDetails[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_EmergencyDetails[playerid][0], 255);
	PlayerTextDrawFont(playerid, MDC_EmergencyDetails[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, MDC_EmergencyDetails[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, MDC_EmergencyDetails[playerid][0], 0);

	MDC_EmergencyDetails[playerid][1] = CreatePlayerTextDraw(playerid, 235.599472, 290.466003, "Konusma_dokumu_-_servis:~n~~n~~n~~n~Konusma_Dokumu_-_lokasyon:~n~~n~~n~~n~Konusma_Dokumu_-_aciklama:");
	PlayerTextDrawLetterSize(playerid, MDC_EmergencyDetails[playerid][1], 0.202799, 1.067377);
	PlayerTextDrawAlignment(playerid, MDC_EmergencyDetails[playerid][1], 1);
	PlayerTextDrawColor(playerid, MDC_EmergencyDetails[playerid][1], 1431655935);
	PlayerTextDrawSetShadow(playerid, MDC_EmergencyDetails[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, MDC_EmergencyDetails[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_EmergencyDetails[playerid][1], 255);
	PlayerTextDrawFont(playerid, MDC_EmergencyDetails[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, MDC_EmergencyDetails[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, MDC_EmergencyDetails[playerid][1], 0);

	MDC_EmergencyDetails[playerid][2] = CreatePlayerTextDraw(playerid, 301.604003, 221.888412, "callerName~n~callerNumber~n~callerDate~n~callerService~n~callerSituation");
	PlayerTextDrawLetterSize(playerid, MDC_EmergencyDetails[playerid][2], 0.202799, 1.067377);
	PlayerTextDrawAlignment(playerid, MDC_EmergencyDetails[playerid][2], 1);
	PlayerTextDrawColor(playerid, MDC_EmergencyDetails[playerid][2], -1970631937);
	PlayerTextDrawSetShadow(playerid, MDC_EmergencyDetails[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, MDC_EmergencyDetails[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_EmergencyDetails[playerid][2], 255);
	PlayerTextDrawFont(playerid, MDC_EmergencyDetails[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, MDC_EmergencyDetails[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, MDC_EmergencyDetails[playerid][2], 0);

	MDC_EmergencyDetails[playerid][3] = CreatePlayerTextDraw(playerid, 235.599472, 298.666503, "transcriptService~n~~n~~n~~n~transcriptLocation~n~~n~~n~~n~transcriptSituation");
	PlayerTextDrawLetterSize(playerid, MDC_EmergencyDetails[playerid][3], 0.202799, 1.067377);
	PlayerTextDrawAlignment(playerid, MDC_EmergencyDetails[playerid][3], 1);
	PlayerTextDrawColor(playerid, MDC_EmergencyDetails[playerid][3], -1970631937);
	PlayerTextDrawSetShadow(playerid, MDC_EmergencyDetails[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, MDC_EmergencyDetails[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_EmergencyDetails[playerid][3], 255);
	PlayerTextDrawFont(playerid, MDC_EmergencyDetails[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, MDC_EmergencyDetails[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, MDC_EmergencyDetails[playerid][3], 0);

	MDC_EmergencyDetails[playerid][4] = CreatePlayerTextDraw(playerid, 236.201202, 167.593261, "~<~_Geri_Git");
	PlayerTextDrawLetterSize(playerid, MDC_EmergencyDetails[playerid][4], 0.231199, 1.122133);
	PlayerTextDrawTextSize(playerid, MDC_EmergencyDetails[playerid][4], 290.000488, 9.000000);
	PlayerTextDrawAlignment(playerid, MDC_EmergencyDetails[playerid][4], 1);
	PlayerTextDrawColor(playerid, MDC_EmergencyDetails[playerid][4], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_EmergencyDetails[playerid][4], 1);
	PlayerTextDrawBoxColor(playerid, MDC_EmergencyDetails[playerid][4], 84215040);
	PlayerTextDrawSetShadow(playerid, MDC_EmergencyDetails[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, MDC_EmergencyDetails[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_EmergencyDetails[playerid][4], 255);
	PlayerTextDrawFont(playerid, MDC_EmergencyDetails[playerid][4], 2);
	PlayerTextDrawSetProportional(playerid, MDC_EmergencyDetails[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, MDC_EmergencyDetails[playerid][4], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_EmergencyDetails[playerid][4], true);

	MDC_CrimeHistory[playerid][0] = CreatePlayerTextDraw(playerid, 234.000061, 192.986663, "box");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][0], 0.000000, 25.288013);
	PlayerTextDrawTextSize(playerid, MDC_CrimeHistory[playerid][0], 519.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][0], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, MDC_CrimeHistory[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CrimeHistory[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][0], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][0], 0);

	MDC_CrimeHistory[playerid][1] = CreatePlayerTextDraw(playerid, 235.300109, 194.484497, "2020-00-00___Crime1");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][1], 0.201999, 0.873244);
	PlayerTextDrawTextSize(playerid, MDC_CrimeHistory[playerid][1], 517.399902, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][1], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][1], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_CrimeHistory[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CrimeHistory[playerid][1], 255);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][1], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][1], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CrimeHistory[playerid][1], true);

	MDC_CrimeHistory[playerid][2] = CreatePlayerTextDraw(playerid, 235.300109, 206.085205, "2020-00-00___Crime2");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][2], 0.201999, 0.873244);
	PlayerTextDrawTextSize(playerid, MDC_CrimeHistory[playerid][2], 517.399902, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][2], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][2], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_CrimeHistory[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CrimeHistory[playerid][2], 255);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][2], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][2], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CrimeHistory[playerid][2], true);

	MDC_CrimeHistory[playerid][3] = CreatePlayerTextDraw(playerid, 235.300109, 217.885925, "2020-00-00___Crime3");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][3], 0.201999, 0.873244);
	PlayerTextDrawTextSize(playerid, MDC_CrimeHistory[playerid][3], 517.399902, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][3], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][3], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_CrimeHistory[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CrimeHistory[playerid][3], 255);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][3], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][3], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CrimeHistory[playerid][3], true);

	MDC_CrimeHistory[playerid][4] = CreatePlayerTextDraw(playerid, 235.300109, 229.686645, "2020-00-00___Crime4");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][4], 0.201999, 0.873244);
	PlayerTextDrawTextSize(playerid, MDC_CrimeHistory[playerid][4], 517.399902, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][4], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][4], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_CrimeHistory[playerid][4], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CrimeHistory[playerid][4], 255);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][4], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][4], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CrimeHistory[playerid][4], true);

	MDC_CrimeHistory[playerid][5] = CreatePlayerTextDraw(playerid, 235.300109, 241.387359, "2020-00-00___Crime5");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][5], 0.201999, 0.873244);
	PlayerTextDrawTextSize(playerid, MDC_CrimeHistory[playerid][5], 517.399902, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][5], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][5], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_CrimeHistory[playerid][5], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CrimeHistory[playerid][5], 255);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][5], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][5], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CrimeHistory[playerid][5], true);

	MDC_CrimeHistory[playerid][6] = CreatePlayerTextDraw(playerid, 235.300109, 253.088073, "2020-00-00___Crime6");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][6], 0.201999, 0.873244);
	PlayerTextDrawTextSize(playerid, MDC_CrimeHistory[playerid][6], 517.399902, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][6], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][6], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_CrimeHistory[playerid][6], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CrimeHistory[playerid][6], 255);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][6], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][6], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CrimeHistory[playerid][6], true);

	MDC_CrimeHistory[playerid][7] = CreatePlayerTextDraw(playerid, 235.300109, 264.588775, "2020-00-00___Crime7");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][7], 0.201999, 0.873244);
	PlayerTextDrawTextSize(playerid, MDC_CrimeHistory[playerid][7], 517.399902, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][7], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][7], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_CrimeHistory[playerid][7], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CrimeHistory[playerid][7], 255);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][7], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][7], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CrimeHistory[playerid][7], true);

	MDC_CrimeHistory[playerid][8] = CreatePlayerTextDraw(playerid, 235.300109, 276.189483, "2020-00-00___Crime8");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][8], 0.201999, 0.873244);
	PlayerTextDrawTextSize(playerid, MDC_CrimeHistory[playerid][8], 517.399902, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][8], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][8], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_CrimeHistory[playerid][8], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CrimeHistory[playerid][8], 255);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][8], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][8], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CrimeHistory[playerid][8], true);

	MDC_CrimeHistory[playerid][9] = CreatePlayerTextDraw(playerid, 235.300109, 287.890197, "2020-00-00___Crime9");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][9], 0.201999, 0.873244);
	PlayerTextDrawTextSize(playerid, MDC_CrimeHistory[playerid][9], 517.399902, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][9], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][9], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_CrimeHistory[playerid][9], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CrimeHistory[playerid][9], 255);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][9], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][9], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CrimeHistory[playerid][9], true);

	MDC_CrimeHistory[playerid][10] = CreatePlayerTextDraw(playerid, 235.300109, 299.490905, "2020-00-00___Crime10");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][10], 0.201999, 0.873244);
	PlayerTextDrawTextSize(playerid, MDC_CrimeHistory[playerid][10], 517.399902, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][10], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][10], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_CrimeHistory[playerid][10], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CrimeHistory[playerid][10], 255);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][10], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][10], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CrimeHistory[playerid][10], true);

	MDC_CrimeHistory[playerid][11] = CreatePlayerTextDraw(playerid, 235.300109, 311.091613, "2020-00-00___Crime11");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][11], 0.201999, 0.873244);
	PlayerTextDrawTextSize(playerid, MDC_CrimeHistory[playerid][11], 517.399902, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][11], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][11], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_CrimeHistory[playerid][11], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CrimeHistory[playerid][11], 255);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][11], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][11], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CrimeHistory[playerid][11], true);

	MDC_CrimeHistory[playerid][12] = CreatePlayerTextDraw(playerid, 235.300109, 322.592315, "2020-00-00___Crime12");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][12], 0.201999, 0.873244);
	PlayerTextDrawTextSize(playerid, MDC_CrimeHistory[playerid][12], 517.399902, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][12], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][12], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_CrimeHistory[playerid][12], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CrimeHistory[playerid][12], 255);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][12], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][12], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][12], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CrimeHistory[playerid][12], true);

	MDC_CrimeHistory[playerid][13] = CreatePlayerTextDraw(playerid, 235.300109, 333.993011, "2020-00-00___Crime13");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][13], 0.201999, 0.873244);
	PlayerTextDrawTextSize(playerid, MDC_CrimeHistory[playerid][13], 517.399902, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][13], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][13], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_CrimeHistory[playerid][13], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CrimeHistory[playerid][13], 255);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][13], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][13], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CrimeHistory[playerid][13], true);

	MDC_CrimeHistory[playerid][14] = CreatePlayerTextDraw(playerid, 235.300109, 345.393707, "2020-00-00___Crime14");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][14], 0.201999, 0.873244);
	PlayerTextDrawTextSize(playerid, MDC_CrimeHistory[playerid][14], 517.399902, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][14], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][14], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_CrimeHistory[playerid][14], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CrimeHistory[playerid][14], 255);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][14], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][14], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][14], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CrimeHistory[playerid][14], true);

	MDC_CrimeHistory[playerid][15] = CreatePlayerTextDraw(playerid, 235.300109, 356.494384, "2020-00-00___Crime15");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][15], 0.201999, 0.873244);
	PlayerTextDrawTextSize(playerid, MDC_CrimeHistory[playerid][15], 517.399902, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][15], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][15], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_CrimeHistory[playerid][15], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CrimeHistory[playerid][15], 255);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][15], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][15], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][15], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CrimeHistory[playerid][15], true);

	MDC_CrimeHistory[playerid][16] = CreatePlayerTextDraw(playerid, 235.300109, 367.895080, "2020-00-00___Crime16");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][16], 0.201999, 0.873244);
	PlayerTextDrawTextSize(playerid, MDC_CrimeHistory[playerid][16], 517.399902, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][16], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][16], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_CrimeHistory[playerid][16], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CrimeHistory[playerid][16], 255);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][16], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][16], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][16], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][16], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CrimeHistory[playerid][16], true);

	MDC_CrimeHistory[playerid][17] = CreatePlayerTextDraw(playerid, 235.300109, 379.395782, "2020-00-00___Crime17");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][17], 0.201999, 0.873244);
	PlayerTextDrawTextSize(playerid, MDC_CrimeHistory[playerid][17], 517.399902, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][17], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][17], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_CrimeHistory[playerid][17], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CrimeHistory[playerid][17], 255);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][17], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][17], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][17], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][17], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][17], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CrimeHistory[playerid][17], true);

	MDC_CrimeHistory[playerid][18] = CreatePlayerTextDraw(playerid, 235.300109, 390.696472, "2020-00-00___Crime18");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][18], 0.201999, 0.873244);
	PlayerTextDrawTextSize(playerid, MDC_CrimeHistory[playerid][18], 517.399902, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][18], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][18], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_CrimeHistory[playerid][18], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CrimeHistory[playerid][18], 255);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][18], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][18], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][18], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][18], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][18], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CrimeHistory[playerid][18], true);

	MDC_CrimeHistory[playerid][19] = CreatePlayerTextDraw(playerid, 235.300109, 402.097167, "2020-00-00___Crime19");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][19], 0.201999, 0.873244);
	PlayerTextDrawTextSize(playerid, MDC_CrimeHistory[playerid][19], 517.399902, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][19], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][19], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_CrimeHistory[playerid][19], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CrimeHistory[playerid][19], 255);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][19], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][19], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][19], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][19], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][19], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CrimeHistory[playerid][19], true);

	MDC_CrimeHistory[playerid][20] = CreatePlayerTextDraw(playerid, 235.300109, 413.597869, "2020-00-00___Crime20");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][20], 0.201999, 0.873244);
	PlayerTextDrawTextSize(playerid, MDC_CrimeHistory[playerid][20], 517.399902, 10.000000);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][20], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][20], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_CrimeHistory[playerid][20], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CrimeHistory[playerid][20], 255);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][20], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][20], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][20], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][20], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][20], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CrimeHistory[playerid][20], true);

	MDC_CrimeHistory[playerid][21] = CreatePlayerTextDraw(playerid, 507.199890, 426.444427, "~>~");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][21], 10.484400, 1.356088);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][21], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][21], -1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][21], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][21], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][21], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][21], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][21], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][21], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CrimeHistory[playerid][21], true);

	MDC_CrimeHistory[playerid][22] = CreatePlayerTextDraw(playerid, 492.799011, 426.444427, "~<~");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][22], 10.484400, 1.356088);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][22], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][22], -1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][22], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][22], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][22], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][22], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][22], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][22], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CrimeHistory[playerid][22], true);

	MDC_CrimeHistory[playerid][23] = CreatePlayerTextDraw(playerid, 236.201202, 167.593261, "~<~_Geri_Git");
	PlayerTextDrawLetterSize(playerid, MDC_CrimeHistory[playerid][23], 0.231199, 1.122133);
	PlayerTextDrawTextSize(playerid, MDC_CrimeHistory[playerid][23], 290.000488, 9.000000);
	PlayerTextDrawAlignment(playerid, MDC_CrimeHistory[playerid][23], 1);
	PlayerTextDrawColor(playerid, MDC_CrimeHistory[playerid][23], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_CrimeHistory[playerid][23], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CrimeHistory[playerid][23], 84215040);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][23], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CrimeHistory[playerid][23], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CrimeHistory[playerid][23], 255);
	PlayerTextDrawFont(playerid, MDC_CrimeHistory[playerid][23], 2);
	PlayerTextDrawSetProportional(playerid, MDC_CrimeHistory[playerid][23], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CrimeHistory[playerid][23], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CrimeHistory[playerid][23], true);

	MDC_SelectedCrimeDetails[playerid][0] = CreatePlayerTextDraw(playerid, 233.899719, 194.502502, "Islem_No~n~Isim~n~Uygulayan~n~Tarih");
	PlayerTextDrawLetterSize(playerid, MDC_SelectedCrimeDetails[playerid][0], 0.219999, 1.097244);
	PlayerTextDrawAlignment(playerid, MDC_SelectedCrimeDetails[playerid][0], 1);
	PlayerTextDrawColor(playerid, MDC_SelectedCrimeDetails[playerid][0], 1330597887);
	PlayerTextDrawSetShadow(playerid, MDC_SelectedCrimeDetails[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, MDC_SelectedCrimeDetails[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_SelectedCrimeDetails[playerid][0], 255);
	PlayerTextDrawFont(playerid, MDC_SelectedCrimeDetails[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, MDC_SelectedCrimeDetails[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, MDC_SelectedCrimeDetails[playerid][0], 0);

	MDC_SelectedCrimeDetails[playerid][1] = CreatePlayerTextDraw(playerid, 233.899734, 244.956924, "Aciklama");
	PlayerTextDrawLetterSize(playerid, MDC_SelectedCrimeDetails[playerid][1], 0.219999, 1.097244);
	PlayerTextDrawAlignment(playerid, MDC_SelectedCrimeDetails[playerid][1], 1);
	PlayerTextDrawColor(playerid, MDC_SelectedCrimeDetails[playerid][1], 1330597887);
	PlayerTextDrawSetShadow(playerid, MDC_SelectedCrimeDetails[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, MDC_SelectedCrimeDetails[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_SelectedCrimeDetails[playerid][1], 255);
	PlayerTextDrawFont(playerid, MDC_SelectedCrimeDetails[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, MDC_SelectedCrimeDetails[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, MDC_SelectedCrimeDetails[playerid][1], 0);

	MDC_SelectedCrimeDetails[playerid][2] = CreatePlayerTextDraw(playerid, 286.900756, 194.591247, "#_criminalNo~n~criminalName~n~criminialIssuier~n~criminalDate");
	PlayerTextDrawLetterSize(playerid, MDC_SelectedCrimeDetails[playerid][2], 0.219999, 1.097244);
	PlayerTextDrawAlignment(playerid, MDC_SelectedCrimeDetails[playerid][2], 1);
	PlayerTextDrawColor(playerid, MDC_SelectedCrimeDetails[playerid][2], -1532713729);
	PlayerTextDrawSetShadow(playerid, MDC_SelectedCrimeDetails[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, MDC_SelectedCrimeDetails[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_SelectedCrimeDetails[playerid][2], 255);
	PlayerTextDrawFont(playerid, MDC_SelectedCrimeDetails[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, MDC_SelectedCrimeDetails[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, MDC_SelectedCrimeDetails[playerid][2], 0);

	MDC_SelectedCrimeDetails[playerid][3] = CreatePlayerTextDraw(playerid, 233.899734, 256.157592, "criminalQuote");
	PlayerTextDrawLetterSize(playerid, MDC_SelectedCrimeDetails[playerid][3], 0.219999, 1.097244);
	PlayerTextDrawAlignment(playerid, MDC_SelectedCrimeDetails[playerid][3], 1);
	PlayerTextDrawColor(playerid, MDC_SelectedCrimeDetails[playerid][3], -1532713729);
	PlayerTextDrawSetShadow(playerid, MDC_SelectedCrimeDetails[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, MDC_SelectedCrimeDetails[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_SelectedCrimeDetails[playerid][3], 255);
	PlayerTextDrawFont(playerid, MDC_SelectedCrimeDetails[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, MDC_SelectedCrimeDetails[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, MDC_SelectedCrimeDetails[playerid][3], 0);

	MDC_SelectedCrimeDetails[playerid][4] = CreatePlayerTextDraw(playerid, 236.201202, 167.593261, "~<~_Geri_Git");
	PlayerTextDrawLetterSize(playerid, MDC_SelectedCrimeDetails[playerid][4], 0.231199, 1.122133);
	PlayerTextDrawTextSize(playerid, MDC_SelectedCrimeDetails[playerid][4], 290.000488, 9.000000);
	PlayerTextDrawAlignment(playerid, MDC_SelectedCrimeDetails[playerid][4], 1);
	PlayerTextDrawColor(playerid, MDC_SelectedCrimeDetails[playerid][4], -2139062017);
	PlayerTextDrawUseBox(playerid, MDC_SelectedCrimeDetails[playerid][4], 1);
	PlayerTextDrawBoxColor(playerid, MDC_SelectedCrimeDetails[playerid][4], 84215040);
	PlayerTextDrawSetShadow(playerid, MDC_SelectedCrimeDetails[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, MDC_SelectedCrimeDetails[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_SelectedCrimeDetails[playerid][4], 255);
	PlayerTextDrawFont(playerid, MDC_SelectedCrimeDetails[playerid][4], 2);
	PlayerTextDrawSetProportional(playerid, MDC_SelectedCrimeDetails[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, MDC_SelectedCrimeDetails[playerid][4], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_SelectedCrimeDetails[playerid][4], true);

	MDC_CCTV[playerid][0] = CreatePlayerTextDraw(playerid, 232.500411, 193.457519, "camera1");
	PlayerTextDrawLetterSize(playerid, MDC_CCTV[playerid][0], 0.190595, 1.201953);
	PlayerTextDrawTextSize(playerid, MDC_CCTV[playerid][0], 522.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_CCTV[playerid][0], 1);
	PlayerTextDrawColor(playerid, MDC_CCTV[playerid][0], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_CCTV[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CCTV[playerid][0], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CCTV[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CCTV[playerid][0], 255);
	PlayerTextDrawFont(playerid, MDC_CCTV[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CCTV[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][0], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CCTV[playerid][0], true);

	MDC_CCTV[playerid][1] = CreatePlayerTextDraw(playerid, 232.500411, 210.158538, "camera2");
	PlayerTextDrawLetterSize(playerid, MDC_CCTV[playerid][1], 0.190595, 1.201953);
	PlayerTextDrawTextSize(playerid, MDC_CCTV[playerid][1], 522.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_CCTV[playerid][1], 1);
	PlayerTextDrawColor(playerid, MDC_CCTV[playerid][1], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_CCTV[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CCTV[playerid][1], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CCTV[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CCTV[playerid][1], 255);
	PlayerTextDrawFont(playerid, MDC_CCTV[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CCTV[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][1], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CCTV[playerid][1], true);

	MDC_CCTV[playerid][2] = CreatePlayerTextDraw(playerid, 232.500411, 226.959564, "camera3");
	PlayerTextDrawLetterSize(playerid, MDC_CCTV[playerid][2], 0.190595, 1.201953);
	PlayerTextDrawTextSize(playerid, MDC_CCTV[playerid][2], 522.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_CCTV[playerid][2], 1);
	PlayerTextDrawColor(playerid, MDC_CCTV[playerid][2], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_CCTV[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CCTV[playerid][2], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CCTV[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CCTV[playerid][2], 255);
	PlayerTextDrawFont(playerid, MDC_CCTV[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CCTV[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][2], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CCTV[playerid][2], true);

	MDC_CCTV[playerid][3] = CreatePlayerTextDraw(playerid, 232.500411, 243.460571, "camera4");
	PlayerTextDrawLetterSize(playerid, MDC_CCTV[playerid][3], 0.190595, 1.201953);
	PlayerTextDrawTextSize(playerid, MDC_CCTV[playerid][3], 522.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_CCTV[playerid][3], 1);
	PlayerTextDrawColor(playerid, MDC_CCTV[playerid][3], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_CCTV[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CCTV[playerid][3], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CCTV[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CCTV[playerid][3], 255);
	PlayerTextDrawFont(playerid, MDC_CCTV[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CCTV[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][3], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CCTV[playerid][3], true);

	MDC_CCTV[playerid][4] = CreatePlayerTextDraw(playerid, 232.500411, 260.361602, "camera5");
	PlayerTextDrawLetterSize(playerid, MDC_CCTV[playerid][4], 0.190595, 1.201953);
	PlayerTextDrawTextSize(playerid, MDC_CCTV[playerid][4], 522.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_CCTV[playerid][4], 1);
	PlayerTextDrawColor(playerid, MDC_CCTV[playerid][4], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_CCTV[playerid][4], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CCTV[playerid][4], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CCTV[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CCTV[playerid][4], 255);
	PlayerTextDrawFont(playerid, MDC_CCTV[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CCTV[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][4], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CCTV[playerid][4], true);

	MDC_CCTV[playerid][5] = CreatePlayerTextDraw(playerid, 232.500411, 277.262634, "camera6");
	PlayerTextDrawLetterSize(playerid, MDC_CCTV[playerid][5], 0.190595, 1.201953);
	PlayerTextDrawTextSize(playerid, MDC_CCTV[playerid][5], 522.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_CCTV[playerid][5], 1);
	PlayerTextDrawColor(playerid, MDC_CCTV[playerid][5], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_CCTV[playerid][5], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CCTV[playerid][5], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CCTV[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CCTV[playerid][5], 255);
	PlayerTextDrawFont(playerid, MDC_CCTV[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CCTV[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][5], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CCTV[playerid][5], true);

	MDC_CCTV[playerid][6] = CreatePlayerTextDraw(playerid, 232.500411, 294.163665, "camera7");
	PlayerTextDrawLetterSize(playerid, MDC_CCTV[playerid][6], 0.190595, 1.201953);
	PlayerTextDrawTextSize(playerid, MDC_CCTV[playerid][6], 522.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_CCTV[playerid][6], 1);
	PlayerTextDrawColor(playerid, MDC_CCTV[playerid][6], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_CCTV[playerid][6], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CCTV[playerid][6], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CCTV[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CCTV[playerid][6], 255);
	PlayerTextDrawFont(playerid, MDC_CCTV[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CCTV[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][6], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CCTV[playerid][6], true);

	MDC_CCTV[playerid][7] = CreatePlayerTextDraw(playerid, 232.500411, 311.264709, "camera8");
	PlayerTextDrawLetterSize(playerid, MDC_CCTV[playerid][7], 0.190595, 1.201953);
	PlayerTextDrawTextSize(playerid, MDC_CCTV[playerid][7], 522.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_CCTV[playerid][7], 1);
	PlayerTextDrawColor(playerid, MDC_CCTV[playerid][7], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_CCTV[playerid][7], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CCTV[playerid][7], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CCTV[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CCTV[playerid][7], 255);
	PlayerTextDrawFont(playerid, MDC_CCTV[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CCTV[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][7], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CCTV[playerid][7], true);

	MDC_CCTV[playerid][8] = CreatePlayerTextDraw(playerid, 232.500411, 328.365753, "camera9");
	PlayerTextDrawLetterSize(playerid, MDC_CCTV[playerid][8], 0.190595, 1.201953);
	PlayerTextDrawTextSize(playerid, MDC_CCTV[playerid][8], 522.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_CCTV[playerid][8], 1);
	PlayerTextDrawColor(playerid, MDC_CCTV[playerid][8], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_CCTV[playerid][8], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CCTV[playerid][8], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CCTV[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CCTV[playerid][8], 255);
	PlayerTextDrawFont(playerid, MDC_CCTV[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CCTV[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][8], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CCTV[playerid][8], true);

	MDC_CCTV[playerid][9] = CreatePlayerTextDraw(playerid, 232.500411, 345.566802, "camera10");
	PlayerTextDrawLetterSize(playerid, MDC_CCTV[playerid][9], 0.190595, 1.201953);
	PlayerTextDrawTextSize(playerid, MDC_CCTV[playerid][9], 522.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_CCTV[playerid][9], 1);
	PlayerTextDrawColor(playerid, MDC_CCTV[playerid][9], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_CCTV[playerid][9], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CCTV[playerid][9], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CCTV[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CCTV[playerid][9], 255);
	PlayerTextDrawFont(playerid, MDC_CCTV[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CCTV[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][9], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CCTV[playerid][9], true);

	MDC_CCTV[playerid][10] = CreatePlayerTextDraw(playerid, 232.500411, 362.567840, "camera11");
	PlayerTextDrawLetterSize(playerid, MDC_CCTV[playerid][10], 0.190595, 1.201953);
	PlayerTextDrawTextSize(playerid, MDC_CCTV[playerid][10], 522.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_CCTV[playerid][10], 1);
	PlayerTextDrawColor(playerid, MDC_CCTV[playerid][10], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_CCTV[playerid][10], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CCTV[playerid][10], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CCTV[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CCTV[playerid][10], 255);
	PlayerTextDrawFont(playerid, MDC_CCTV[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CCTV[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][10], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CCTV[playerid][10], true);

	MDC_CCTV[playerid][11] = CreatePlayerTextDraw(playerid, 232.500411, 379.768890, "camera12");
	PlayerTextDrawLetterSize(playerid, MDC_CCTV[playerid][11], 0.190595, 1.201953);
	PlayerTextDrawTextSize(playerid, MDC_CCTV[playerid][11], 522.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_CCTV[playerid][11], 1);
	PlayerTextDrawColor(playerid, MDC_CCTV[playerid][11], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_CCTV[playerid][11], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CCTV[playerid][11], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CCTV[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CCTV[playerid][11], 255);
	PlayerTextDrawFont(playerid, MDC_CCTV[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CCTV[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][11], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CCTV[playerid][11], true);

	MDC_CCTV[playerid][12] = CreatePlayerTextDraw(playerid, 232.500411, 397.169952, "camera13");
	PlayerTextDrawLetterSize(playerid, MDC_CCTV[playerid][12], 0.190595, 1.201953);
	PlayerTextDrawTextSize(playerid, MDC_CCTV[playerid][12], 522.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_CCTV[playerid][12], 1);
	PlayerTextDrawColor(playerid, MDC_CCTV[playerid][12], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_CCTV[playerid][12], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CCTV[playerid][12], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CCTV[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CCTV[playerid][12], 255);
	PlayerTextDrawFont(playerid, MDC_CCTV[playerid][12], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CCTV[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][12], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CCTV[playerid][12], true);

	MDC_CCTV[playerid][13] = CreatePlayerTextDraw(playerid, 232.500411, 414.170989, "camera14");
	PlayerTextDrawLetterSize(playerid, MDC_CCTV[playerid][13], 0.190595, 1.201953);
	PlayerTextDrawTextSize(playerid, MDC_CCTV[playerid][13], 522.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_CCTV[playerid][13], 1);
	PlayerTextDrawColor(playerid, MDC_CCTV[playerid][13], 892483071);
	PlayerTextDrawUseBox(playerid, MDC_CCTV[playerid][13], 1);
	PlayerTextDrawBoxColor(playerid, MDC_CCTV[playerid][13], -1381323265);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CCTV[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CCTV[playerid][13], 255);
	PlayerTextDrawFont(playerid, MDC_CCTV[playerid][13], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CCTV[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][13], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CCTV[playerid][13], true);

	MDC_CCTV[playerid][14] = CreatePlayerTextDraw(playerid, 513.599548, 427.542236, "~>~");
	PlayerTextDrawLetterSize(playerid, MDC_CCTV[playerid][14], 0.377199, 1.390933);
	PlayerTextDrawAlignment(playerid, MDC_CCTV[playerid][14], 1);
	PlayerTextDrawColor(playerid, MDC_CCTV[playerid][14], -1);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CCTV[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CCTV[playerid][14], 255);
	PlayerTextDrawFont(playerid, MDC_CCTV[playerid][14], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CCTV[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][14], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CCTV[playerid][14], true);

	MDC_CCTV[playerid][15] = CreatePlayerTextDraw(playerid, 340.099365, 427.542236, "~<~");
	PlayerTextDrawLetterSize(playerid, MDC_CCTV[playerid][15], 0.377199, 1.390933);
	PlayerTextDrawAlignment(playerid, MDC_CCTV[playerid][15], 1);
	PlayerTextDrawColor(playerid, MDC_CCTV[playerid][15], -1);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CCTV[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CCTV[playerid][15], 255);
	PlayerTextDrawFont(playerid, MDC_CCTV[playerid][15], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CCTV[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][15], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_CCTV[playerid][15], true);

	MDC_CCTV[playerid][16] = CreatePlayerTextDraw(playerid, 522.900024, 181.142288, "10/10");
	PlayerTextDrawLetterSize(playerid, MDC_CCTV[playerid][16], 0.234799, 0.937955);
	PlayerTextDrawAlignment(playerid, MDC_CCTV[playerid][16], 3);
	PlayerTextDrawColor(playerid, MDC_CCTV[playerid][16], 993737727);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, MDC_CCTV[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_CCTV[playerid][16], 255);
	PlayerTextDrawFont(playerid, MDC_CCTV[playerid][16], 1);
	PlayerTextDrawSetProportional(playerid, MDC_CCTV[playerid][16], 1);
	PlayerTextDrawSetShadow(playerid, MDC_CCTV[playerid][16], 0);

	MDC_VehicleBolo_Details[playerid][0] = CreatePlayerTextDraw(playerid, 409.100311, 168.324035, "ARAC_BOLOSUNU_SIL");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_Details[playerid][0], 0.198597, 1.092442);
	PlayerTextDrawTextSize(playerid, MDC_VehicleBolo_Details[playerid][0], 525.199462, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_Details[playerid][0], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_Details[playerid][0], -1431655681);
	PlayerTextDrawUseBox(playerid, MDC_VehicleBolo_Details[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, MDC_VehicleBolo_Details[playerid][0], 858993663);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_Details[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_Details[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_Details[playerid][0], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_Details[playerid][0], 2);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_Details[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_Details[playerid][0], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_Details[playerid][0], true);

	MDC_VehicleBolo_Details[playerid][1] = CreatePlayerTextDraw(playerid, 229.799316, 168.324035, "~<~_ARAC_BOLOLARINA_GERI_DON");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_Details[playerid][1], 0.159395, 0.982930);
	PlayerTextDrawTextSize(playerid, MDC_VehicleBolo_Details[playerid][1], 340.199462, 3.559998);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_Details[playerid][1], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_Details[playerid][1], 858993663);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_Details[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_Details[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_Details[playerid][1], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_Details[playerid][1], 2);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_Details[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_Details[playerid][1], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_Details[playerid][1], true);

	MDC_VehicleBolo_Details[playerid][2] = CreatePlayerTextDraw(playerid, 237.499359, 193.624176, "Kimlik~n~Olusturan~n~Model~n~Plaka~n~Tarih~n~~n~Suclar~n~~n~~n~~n~Rapor");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_Details[playerid][2], 0.218595, 0.908263);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_Details[playerid][2], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_Details[playerid][2], 858993663);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_Details[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_Details[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_Details[playerid][2], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_Details[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_Details[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_Details[playerid][2], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_Details[playerid][2], false);

	MDC_VehicleBolo_Details[playerid][3] = CreatePlayerTextDraw(playerid, 286.999633, 193.624176, "id~n~createdBy~n~Model~n~Plate~n~Date");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_Details[playerid][3], 0.218595, 0.908263);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_Details[playerid][3], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_Details[playerid][3], -1684300801);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_Details[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_Details[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_Details[playerid][3], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_Details[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_Details[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_Details[playerid][3], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_Details[playerid][3], false);

	MDC_VehicleBolo_Details[playerid][4] = CreatePlayerTextDraw(playerid, 244.099395, 251.924499, "boloCrimes");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_Details[playerid][4], 0.218595, 0.908263);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_Details[playerid][4], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_Details[playerid][4], -1684300801);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_Details[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_Details[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_Details[playerid][4], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_Details[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_Details[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_Details[playerid][4], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_Details[playerid][4], false);

	MDC_VehicleBolo_Details[playerid][5] = CreatePlayerTextDraw(playerid, 244.099395, 286.024688, "N/A");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_Details[playerid][5], 0.218595, 0.908263);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_Details[playerid][5], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_Details[playerid][5], -1684300801);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_Details[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_Details[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_Details[playerid][5], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_Details[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_Details[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_Details[playerid][5], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_Details[playerid][5], false);

	MDC_VehicleBolo_List[playerid][0] = CreatePlayerTextDraw(playerid, 409.100311, 168.324035, "Arac Bolosu Ekle");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_List[playerid][0], 0.198597, 1.092442);
	PlayerTextDrawTextSize(playerid, MDC_VehicleBolo_List[playerid][0], 525.199462, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_List[playerid][0], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_List[playerid][0], -1431655681);
	PlayerTextDrawUseBox(playerid, MDC_VehicleBolo_List[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, MDC_VehicleBolo_List[playerid][0], 858993663);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_List[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_List[playerid][0], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_List[playerid][0], 2);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_List[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][0], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_List[playerid][0], true);

	MDC_VehicleBolo_List[playerid][1] = CreatePlayerTextDraw(playerid, 230.199645, 184.481826, "BOLO1");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_List[playerid][1], 0.147796, 0.928175);
	PlayerTextDrawTextSize(playerid, MDC_VehicleBolo_List[playerid][1], 488.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_List[playerid][1], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_List[playerid][1], -1);
	PlayerTextDrawUseBox(playerid, MDC_VehicleBolo_List[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, MDC_VehicleBolo_List[playerid][1], 169824255);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_List[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_List[playerid][1], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_List[playerid][1], 2);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_List[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][1], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_List[playerid][1], true);

	MDC_VehicleBolo_List[playerid][2] = CreatePlayerTextDraw(playerid, 230.199645, 196.681900, "BOLO2");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_List[playerid][2], 0.147796, 0.928175);
	PlayerTextDrawTextSize(playerid, MDC_VehicleBolo_List[playerid][2], 488.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_List[playerid][2], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_List[playerid][2], -1);
	PlayerTextDrawUseBox(playerid, MDC_VehicleBolo_List[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid, MDC_VehicleBolo_List[playerid][2], 169824255);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_List[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_List[playerid][2], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_List[playerid][2], 2);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_List[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][2], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_List[playerid][2], true);

	MDC_VehicleBolo_List[playerid][3] = CreatePlayerTextDraw(playerid, 230.199645, 209.881973, "BOLO3");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_List[playerid][3], 0.147796, 0.928175);
	PlayerTextDrawTextSize(playerid, MDC_VehicleBolo_List[playerid][3], 488.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_List[playerid][3], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_List[playerid][3], -1);
	PlayerTextDrawUseBox(playerid, MDC_VehicleBolo_List[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid, MDC_VehicleBolo_List[playerid][3], 169824255);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_List[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_List[playerid][3], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_List[playerid][3], 2);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_List[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][3], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_List[playerid][3], true);

	MDC_VehicleBolo_List[playerid][4] = CreatePlayerTextDraw(playerid, 230.199645, 222.082046, "BOLO4");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_List[playerid][4], 0.147796, 0.928175);
	PlayerTextDrawTextSize(playerid, MDC_VehicleBolo_List[playerid][4], 488.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_List[playerid][4], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_List[playerid][4], -1);
	PlayerTextDrawUseBox(playerid, MDC_VehicleBolo_List[playerid][4], 1);
	PlayerTextDrawBoxColor(playerid, MDC_VehicleBolo_List[playerid][4], 169824255);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_List[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_List[playerid][4], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_List[playerid][4], 2);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_List[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][4], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_List[playerid][4], true);

	MDC_VehicleBolo_List[playerid][5] = CreatePlayerTextDraw(playerid, 230.199645, 236.282119, "BOLO5");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_List[playerid][5], 0.147796, 0.928175);
	PlayerTextDrawTextSize(playerid, MDC_VehicleBolo_List[playerid][5], 488.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_List[playerid][5], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_List[playerid][5], -1);
	PlayerTextDrawUseBox(playerid, MDC_VehicleBolo_List[playerid][5], 1);
	PlayerTextDrawBoxColor(playerid, MDC_VehicleBolo_List[playerid][5], 169824255);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_List[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_List[playerid][5], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_List[playerid][5], 2);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_List[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][5], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_List[playerid][5], true);

	MDC_VehicleBolo_List[playerid][6] = CreatePlayerTextDraw(playerid, 230.199645, 249.482192, "BOLO6");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_List[playerid][6], 0.147796, 0.928175);
	PlayerTextDrawTextSize(playerid, MDC_VehicleBolo_List[playerid][6], 488.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_List[playerid][6], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_List[playerid][6], -1);
	PlayerTextDrawUseBox(playerid, MDC_VehicleBolo_List[playerid][6], 1);
	PlayerTextDrawBoxColor(playerid, MDC_VehicleBolo_List[playerid][6], 169824255);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_List[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_List[playerid][6], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_List[playerid][6], 2);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_List[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][6], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_List[playerid][6], true);

	MDC_VehicleBolo_List[playerid][7] = CreatePlayerTextDraw(playerid, 230.199645, 262.682250, "BOLO7");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_List[playerid][7], 0.147796, 0.928175);
	PlayerTextDrawTextSize(playerid, MDC_VehicleBolo_List[playerid][7], 488.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_List[playerid][7], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_List[playerid][7], -1);
	PlayerTextDrawUseBox(playerid, MDC_VehicleBolo_List[playerid][7], 1);
	PlayerTextDrawBoxColor(playerid, MDC_VehicleBolo_List[playerid][7], 169824255);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_List[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_List[playerid][7], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_List[playerid][7], 2);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_List[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][7], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_List[playerid][7], true);

	MDC_VehicleBolo_List[playerid][8] = CreatePlayerTextDraw(playerid, 230.199645, 275.882324, "BOLO8");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_List[playerid][8], 0.147796, 0.928175);
	PlayerTextDrawTextSize(playerid, MDC_VehicleBolo_List[playerid][8], 488.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_List[playerid][8], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_List[playerid][8], -1);
	PlayerTextDrawUseBox(playerid, MDC_VehicleBolo_List[playerid][8], 1);
	PlayerTextDrawBoxColor(playerid, MDC_VehicleBolo_List[playerid][8], 169824255);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_List[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_List[playerid][8], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_List[playerid][8], 2);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_List[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][8], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_List[playerid][8], true);

	MDC_VehicleBolo_List[playerid][9] = CreatePlayerTextDraw(playerid, 230.199645, 289.082397, "BOLO9");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_List[playerid][9], 0.147796, 0.928175);
	PlayerTextDrawTextSize(playerid, MDC_VehicleBolo_List[playerid][9], 488.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_List[playerid][9], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_List[playerid][9], -1);
	PlayerTextDrawUseBox(playerid, MDC_VehicleBolo_List[playerid][9], 1);
	PlayerTextDrawBoxColor(playerid, MDC_VehicleBolo_List[playerid][9], 169824255);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_List[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_List[playerid][9], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_List[playerid][9], 2);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_List[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][9], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_List[playerid][9], true);

	MDC_VehicleBolo_List[playerid][10] = CreatePlayerTextDraw(playerid, 230.199645, 302.282470, "BOLO10");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_List[playerid][10], 0.147796, 0.928175);
	PlayerTextDrawTextSize(playerid, MDC_VehicleBolo_List[playerid][10], 488.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_List[playerid][10], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_List[playerid][10], -1);
	PlayerTextDrawUseBox(playerid, MDC_VehicleBolo_List[playerid][10], 1);
	PlayerTextDrawBoxColor(playerid, MDC_VehicleBolo_List[playerid][10], 169824255);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_List[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_List[playerid][10], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_List[playerid][10], 2);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_List[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][10], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_List[playerid][10], true);

	MDC_VehicleBolo_List[playerid][11] = CreatePlayerTextDraw(playerid, 230.199645, 315.482543, "BOLO11");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_List[playerid][11], 0.147796, 0.928175);
	PlayerTextDrawTextSize(playerid, MDC_VehicleBolo_List[playerid][11], 488.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_List[playerid][11], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_List[playerid][11], -1);
	PlayerTextDrawUseBox(playerid, MDC_VehicleBolo_List[playerid][11], 1);
	PlayerTextDrawBoxColor(playerid, MDC_VehicleBolo_List[playerid][11], 169824255);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_List[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_List[playerid][11], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_List[playerid][11], 2);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_List[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][11], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_List[playerid][11], true);

	MDC_VehicleBolo_List[playerid][12] = CreatePlayerTextDraw(playerid, 230.199645, 328.682617, "BOLO12");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_List[playerid][12], 0.147796, 0.928175);
	PlayerTextDrawTextSize(playerid, MDC_VehicleBolo_List[playerid][12], 488.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_List[playerid][12], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_List[playerid][12], -1);
	PlayerTextDrawUseBox(playerid, MDC_VehicleBolo_List[playerid][12], 1);
	PlayerTextDrawBoxColor(playerid, MDC_VehicleBolo_List[playerid][12], 169824255);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_List[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_List[playerid][12], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_List[playerid][12], 2);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_List[playerid][12], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][12], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_List[playerid][12], true);

	MDC_VehicleBolo_List[playerid][13] = CreatePlayerTextDraw(playerid, 230.199645, 341.882690, "BOLO13");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_List[playerid][13], 0.147796, 0.928175);
	PlayerTextDrawTextSize(playerid, MDC_VehicleBolo_List[playerid][13], 488.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_List[playerid][13], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_List[playerid][13], -1);
	PlayerTextDrawUseBox(playerid, MDC_VehicleBolo_List[playerid][13], 1);
	PlayerTextDrawBoxColor(playerid, MDC_VehicleBolo_List[playerid][13], 169824255);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_List[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_List[playerid][13], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_List[playerid][13], 2);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_List[playerid][13], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][13], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_List[playerid][13], true);

	MDC_VehicleBolo_List[playerid][14] = CreatePlayerTextDraw(playerid, 230.199645, 355.082763, "BOLO14");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_List[playerid][14], 0.147796, 0.928175);
	PlayerTextDrawTextSize(playerid, MDC_VehicleBolo_List[playerid][14], 488.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_List[playerid][14], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_List[playerid][14], -1);
	PlayerTextDrawUseBox(playerid, MDC_VehicleBolo_List[playerid][14], 1);
	PlayerTextDrawBoxColor(playerid, MDC_VehicleBolo_List[playerid][14], 169824255);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_List[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_List[playerid][14], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_List[playerid][14], 2);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_List[playerid][14], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][14], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_List[playerid][14], true);

	MDC_VehicleBolo_List[playerid][15] = CreatePlayerTextDraw(playerid, 230.199645, 368.282836, "BOLO15");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_List[playerid][15], 0.147796, 0.928175);
	PlayerTextDrawTextSize(playerid, MDC_VehicleBolo_List[playerid][15], 488.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_List[playerid][15], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_List[playerid][15], -1);
	PlayerTextDrawUseBox(playerid, MDC_VehicleBolo_List[playerid][15], 1);
	PlayerTextDrawBoxColor(playerid, MDC_VehicleBolo_List[playerid][15], 169824255);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_List[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_List[playerid][15], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_List[playerid][15], 2);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_List[playerid][15], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][15], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_List[playerid][15], true);

	MDC_VehicleBolo_List[playerid][16] = CreatePlayerTextDraw(playerid, 230.199645, 381.482910, "BOLO16");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_List[playerid][16], 0.147796, 0.928175);
	PlayerTextDrawTextSize(playerid, MDC_VehicleBolo_List[playerid][16], 488.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_List[playerid][16], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_List[playerid][16], -1);
	PlayerTextDrawUseBox(playerid, MDC_VehicleBolo_List[playerid][16], 1);
	PlayerTextDrawBoxColor(playerid, MDC_VehicleBolo_List[playerid][16], 169824255);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_List[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_List[playerid][16], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_List[playerid][16], 2);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_List[playerid][16], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][16], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_List[playerid][16], true);

	MDC_VehicleBolo_List[playerid][17] = CreatePlayerTextDraw(playerid, 230.199645, 394.682983, "BOLO18");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_List[playerid][17], 0.147796, 0.928175);
	PlayerTextDrawTextSize(playerid, MDC_VehicleBolo_List[playerid][17], 488.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_List[playerid][17], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_List[playerid][17], -1);
	PlayerTextDrawUseBox(playerid, MDC_VehicleBolo_List[playerid][17], 1);
	PlayerTextDrawBoxColor(playerid, MDC_VehicleBolo_List[playerid][17], 169824255);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][17], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_List[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_List[playerid][17], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_List[playerid][17], 2);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_List[playerid][17], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][17], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_List[playerid][17], true);

	MDC_VehicleBolo_List[playerid][18] = CreatePlayerTextDraw(playerid, 230.199645, 407.883056, "BOLO19");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_List[playerid][18], 0.147796, 0.928175);
	PlayerTextDrawTextSize(playerid, MDC_VehicleBolo_List[playerid][18], 488.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_List[playerid][18], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_List[playerid][18], -1);
	PlayerTextDrawUseBox(playerid, MDC_VehicleBolo_List[playerid][18], 1);
	PlayerTextDrawBoxColor(playerid, MDC_VehicleBolo_List[playerid][18], 169824255);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][18], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_List[playerid][18], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_List[playerid][18], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_List[playerid][18], 2);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_List[playerid][18], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][18], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_List[playerid][18], true);

	MDC_VehicleBolo_List[playerid][19] = CreatePlayerTextDraw(playerid, 230.199645, 421.083129, "BOLO20");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_List[playerid][19], 0.147796, 0.928175);
	PlayerTextDrawTextSize(playerid, MDC_VehicleBolo_List[playerid][19], 488.000000, 10.559998);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_List[playerid][19], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_List[playerid][19], -1);
	PlayerTextDrawUseBox(playerid, MDC_VehicleBolo_List[playerid][19], 1);
	PlayerTextDrawBoxColor(playerid, MDC_VehicleBolo_List[playerid][19], 169824255);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][19], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_List[playerid][19], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_List[playerid][19], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_List[playerid][19], 2);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_List[playerid][19], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][19], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_List[playerid][19], true);

	MDC_VehicleBolo_List[playerid][20] = CreatePlayerTextDraw(playerid, 494.300292, 398.576660, "~u~");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_List[playerid][20], 0.365200, 1.749333);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_List[playerid][20], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_List[playerid][20], -1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][20], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_List[playerid][20], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_List[playerid][20], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_List[playerid][20], 1);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_List[playerid][20], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][20], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_List[playerid][20], true);

	MDC_VehicleBolo_List[playerid][21] = CreatePlayerTextDraw(playerid, 494.300292, 415.076751, "~d~");
	PlayerTextDrawLetterSize(playerid, MDC_VehicleBolo_List[playerid][21], 0.365200, 1.749333);
	PlayerTextDrawAlignment(playerid, MDC_VehicleBolo_List[playerid][21], 1);
	PlayerTextDrawColor(playerid, MDC_VehicleBolo_List[playerid][21], -1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][21], 0);
	PlayerTextDrawSetOutline(playerid, MDC_VehicleBolo_List[playerid][21], 0);
	PlayerTextDrawBackgroundColor(playerid, MDC_VehicleBolo_List[playerid][21], 255);
	PlayerTextDrawFont(playerid, MDC_VehicleBolo_List[playerid][21], 1);
	PlayerTextDrawSetProportional(playerid, MDC_VehicleBolo_List[playerid][21], 1);
	PlayerTextDrawSetShadow(playerid, MDC_VehicleBolo_List[playerid][21], 0);
	PlayerTextDrawSetSelectable(playerid, MDC_VehicleBolo_List[playerid][21], true);
	return 1;
}

stock SetAddresMapPosition(playerid, Float:X, Float:Y, Float:Z)
{
	if(strfind(GetCityName(X, Y, Z), "Los Santos", true) != -1)
	{
		PlayerTextDrawSetString(playerid, MDC_AdressDetails[playerid][3], "samaps:gtasamapbit2");
		PlayerTextDrawSetString(playerid, MDC_AdressDetails[playerid][12], "samaps:gtasamapbit4");
	}
	if(strfind(GetCityName(X, Y, Z), "San Fierro", true) != -1)
	{
		PlayerTextDrawSetString(playerid, MDC_AdressDetails[playerid][3], "samaps:gtasamapbit1");
		PlayerTextDrawSetString(playerid, MDC_AdressDetails[playerid][12], "samaps:gtasamapbit3");
	}
	if(strfind(GetCityName(X, Y, Z), "Las Venturas", true) != -1)
	{
		PlayerTextDrawSetString(playerid, MDC_AdressDetails[playerid][3], "samaps:gtasamapbit2");
		PlayerTextDrawSetString(playerid, MDC_AdressDetails[playerid][12], "samaps:gtasamapbit4");
	}
	if(strfind(GetCityName(X, Y, Z), "Tierra Robada", true) != -1)
	{
		PlayerTextDrawSetString(playerid, MDC_AdressDetails[playerid][3], "samaps:gtasamapbit1");
		PlayerTextDrawSetString(playerid, MDC_AdressDetails[playerid][12], "samaps:gtasamapbit3");
	}
	if(strfind(GetCityName(X, Y, Z), "Bone County", true) != -1)
	{
		PlayerTextDrawSetString(playerid, MDC_AdressDetails[playerid][3], "samaps:gtasamapbit2");
		PlayerTextDrawSetString(playerid, MDC_AdressDetails[playerid][12], "samaps:gtasamapbit4");
	}
	if(strfind(GetCityName(X, Y, Z), "Red County", true) != -1)
	{
		PlayerTextDrawSetString(playerid, MDC_AdressDetails[playerid][3], "samaps:gtasamapbit2");
		PlayerTextDrawSetString(playerid, MDC_AdressDetails[playerid][12], "samaps:gtasamapbit4");
	}
	if(strfind(GetCityName(X, Y, Z), "Flint County", true) != -1)
	{
		PlayerTextDrawSetString(playerid, MDC_AdressDetails[playerid][3], "samaps:gtasamapbit1");
		PlayerTextDrawSetString(playerid, MDC_AdressDetails[playerid][12], "samaps:gtasamapbit3");
	}
	if(strfind(GetCityName(X, Y, Z), "Whetstone", true) != -1)
	{
		PlayerTextDrawSetString(playerid, MDC_AdressDetails[playerid][3], "samaps:gtasamapbit1");
		PlayerTextDrawSetString(playerid, MDC_AdressDetails[playerid][12], "samaps:gtasamapbit3");
	}
	PlayerTextDrawShow(playerid, MDC_AdressDetails[playerid][3]);
	PlayerTextDrawShow(playerid, MDC_AdressDetails[playerid][12]);
	return 1;
}


Hide_PageAttachement(playerid)
{
	for(new is = 0; is < 34; is++)
	{
		PlayerTextDrawHide(playerid, MDC_PenalCode[playerid][is]);
	}

	for(new is = 0; is < 17; is++)
	{
		PlayerTextDrawHide(playerid, MDC_LookUp_Vehicle[playerid][is]);
	}

	for(new is = 0; is < 34; is++)
	{
		PlayerTextDrawHide(playerid, MDC_ManageLicense[playerid][is]);
	}

	for(new is = 0; is < 34; is++)
	{
		PlayerTextDrawHide(playerid, MDC_ManageLicense[playerid][is]);
	}

	for(new is = 0; is < 22; is++)
	{
		PlayerTextDrawHide(playerid, MDC_VehicleBolo_List[playerid][is]);
	}

	for(new is = 0; is < 6; is++)
	{
		PlayerTextDrawHide(playerid, MDC_VehicleBolo_Details[playerid][is]);
	}
	return 1;
}

Dialog:DIALOG_ALPRLOG(playerid, response, listitem, inputtext[])
{
	if(!response) return 0;
	if(response)
	{
		cmd_mdc(playerid, " ");
		new id = strval(inputtext);
		MDC_HideAfterPage(playerid);
		ShowMDCPage(playerid, MDC_PAGE_LOOKUP);
		MDC_LOOKUP_SelectOption(playerid, MDC_PAGE_LOOKUP_PLATE);

		new sorgu[256];
		format(sorgu, sizeof(sorgu), "SELECT * FROM `vehicles` WHERE `Plate` = '%s'", VehicleBolo[id][vBoloPlate]);
		mysql_tquery(m_Handle, sorgu, "KisiSorgula", "sdd", VehicleBolo[id][vBoloPlate], playerid, 1);
	}
	return 1;
}

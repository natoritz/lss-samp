CMD:yardim(playerid, params[])
{
	SendClientMessage(playerid, COLOR_DARKGREEN, "______________www.lss-roleplay.com______________");
	SendClientMessage(playerid, COLOR_GRAD1, "[HESAP] /kurallar /karakter /seviyeatla /stilayarla");
	SendClientMessage(playerid, COLOR_GRAD2, "[GENEL] /id /saat /satinal /gozbagla /yazitura /not /rapor /rsayi /lisans");
	SendClientMessage(playerid, COLOR_GRAD1, "[GENEL] /(pkr)poker /aksesuar /reklam /sreklam /kilit /ekilit /gkilit /fkilit /giris /cikis /maske /ustara");
	SendClientMessage(playerid, COLOR_GRAD2, "[GENEL] /gise /yemek /candoldur /anims /kapi /ozellik /incele /meslek");
	SendClientMessage(playerid, COLOR_GRAD1, "[GENEL] /yemek /icecek /icecekver");
	SendClientMessage(playerid, COLOR_GRAD2, "[GENEL] /kabuletolum /tedaviol /hasarlar /isbasindakiler /sigara");
	SendClientMessage(playerid, COLOR_GRAD1, "[ARA�] /arac /arackirala /arackiraiptal /arackapi /cam /carsign /aracaat");
	SendClientMessage(playerid, COLOR_GRAD2, "[UYU�TURUCU] /uyusturucularim /ukullan /ubirak /uver /tuk /tua");
	SendClientMessage(playerid, COLOR_GRAD1, "[S�LAH] /silahlarim /silahbirak /silahal /silahkoy /kontrol");
	SendClientMessage(playerid, COLOR_GRAD2, "[CHAT] /w /l /b (OOC) /t /tlow /s /ds /cw /cb (OOC) /pm (OOC) /sohbet (OOC)");
	SendClientMessage(playerid, COLOR_GRAD1, "[EMOTELAR] /me(low) /do(low) /my /ame /amy /ddo /tokalas /ado /sdo");
	SendClientMessage(playerid, COLOR_GRAD2, "[BANKA] /parayatir /paracek /bakiye /mevduat /transfer /maascek");
	SendClientMessage(playerid, COLOR_GRAD1, "[YARDIM] /telefonyardim /evyardim /isyeriyardim /meslekyardim /birlikyardim /balikyardim");
	SendClientMessage(playerid, COLOR_GRAD2, "[YARDIM] /radyoyardim /uyusturucuyardim /ytelyardim");
	SendClientMessage(playerid, COLOR_GRAD1, "[TOG] /tog");

	// /buildpackage(?) /adjustpackage(?) /unpackage(?) /sellpackage(?) /transferdrug(?) /bar(?) /leavebar(?) /selldrink(?)
	// /pitems(?) /releaseme(?) /gates(?) /bdrink(?) /lisanssat(?) /collect(?) /jog(?) /levelinfo(?) /bblok(?) /pmblok(?)
	return 1;
}

CMD:aracyardim(playerid, params[])
{
	SendClientMessage(playerid, COLOR_DARKGREEN, "__________________________________www.lss-roleplay.com__________________________________");
	SendClientMessage(playerid, COLOR_GRAD1, "[ARA�] /arac, /kilit, /cw, /aractanat, /far, /motor");
	SendClientMessage(playerid, COLOR_GRAD2, "[ARA�] /uns, /araccam");
	SendClientMessage(playerid, COLOR_GRAD1, "[K�RALIK] /arackirala, /arackiraiptal");
	SendClientMessage(playerid, COLOR_GRAD2, "[S�LAH] /silahkoy, /kontrol (s)ilah");
	SendClientMessage(playerid, COLOR_GRAD2, "[UYU�TURUCU] /ukoy, /kontrol (u)yusturucu");
	SendClientMessage(playerid, COLOR_DARKGREEN, "__________________________________www.lss-roleplay.com__________________________________");
	return 1;
}

CMD:evyardim(playerid, params[])
{
	SendClientMessage(playerid, COLOR_DARKGREEN, "__________________________________www.lss-roleplay.com__________________________________");
	SendClientMessage(playerid, COLOR_GRAD1, "[EV]  B�t�n ev komutlar� (/ev) alt�na toplanm��t�r.");
	SendClientMessage(playerid, COLOR_GRAD1, "[EV] /(ev) satinal, /(ev) sat, /kilit, /ev gelistir, /evitem");
	SendClientMessage(playerid, COLOR_GRAD2, "[MOB�LYA] /mobilyaizin, /mobilyaizinal");
	SendClientMessage(playerid, COLOR_GRAD1, "[EYLEM] /kapical, /ds, /ddo, /candoldur");
	SendClientMessage(playerid, COLOR_DARKGREEN, "__________________________________www.lss-roleplay.com__________________________________");
	return 1;
}

CMD:telefonyardim(playerid, params[])
{
	SendClientMessage(playerid, COLOR_DARKGREEN, "__________________________________www.lss-roleplay.com__________________________________");
	SendClientMessage(playerid, COLOR_WHITE, "[TELEFON] /telefon, /tc, /ara, /(tkap)at, /tcevap(/tac), /hoparlor, /sms, /telefonpasla");
	SendClientMessage(playerid, COLOR_DARKGREEN, "__________________________________www.lss-roleplay.com__________________________________");
	return 1;
}

CMD:isyeriyardim(playerid, params[])
{
    SendClientMessage(playerid, COLOR_RED, "__________________________________www.lss-roleplay.com__________________________________");
    SendClientMessage(playerid, COLOR_GRAD2, "[��YER�] T�m i�yeri komutlar�n� g�rebilmek i�in /isyeri yazabilirsin.");
    SendClientMessage(playerid, COLOR_RED, "__________________________________www.lss-roleplay.com__________________________________");
    return 1;
}

CMD:ytelyardim(playerid, params[])
{
	SendClientMessage(playerid, COLOR_DARKGREEN, "|__________________Burner Telefon_________________|");
	SendClientMessage(playerid, COLOR_YELLOW, "�PUCU: Pawnshop ve Genel ma�azalardan alabilirsin!");
	SendClientMessage(playerid, COLOR_WHITE, "/telsatinal - Burner telefon alman�z� sa�lar.");
	SendClientMessage(playerid, COLOR_WHITE, "/yedektelefon - Yedek telefonu a��p-kapatman�z� sa�lar.");
	SendClientMessage(playerid, COLOR_WHITE, "/telefondegistir - Ana telefonunuz ile Burner telefonu de�i�tirir.");
	SendClientMessage(playerid, COLOR_WHITE, "/yedektelbirak - Yedek telefonu b�rakman�z� sa�lar.");
	SendClientMessage(playerid, COLOR_DARKGREEN, "______________________________________________");
	return 1;
}

CMD:uyusturucuyardim(playerid, params[])
{
	SendClientMessage(playerid, COLOR_ADM, "Uyu�turucu Komutlar�:");
	SendClientMessage(playerid, COLOR_WHITE, "/uyusturucularim - /uver - /ubirak - /ukullan");
	SendClientMessage(playerid, COLOR_WHITE, "/ukoy (/uk) - /ual - /tumuyusturucularikoy (/tuk) - /tumuyusturucularial (/tua)");
	return 1;
}

CMD:birlikyardim(playerid, params[])
{
	if(PlayerData[playerid][pFaction] == -1) return SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}/birlikler");

	SendClientMessageEx(playerid, COLOR_ADM, "%s birli�inin komutlar�:", FactionData[PlayerData[playerid][pFaction]][FactionName]);
	SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}/birlikler, /f, /fuyeler, /frenk(chat rengini ayarlar)");
	SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}/birlikpanel, /faktif, /fdavet, /fkov, /fkasa, /fspawn, /fpspawn, /fpark");
	SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}/frozet, /frutbeayarla, /fkapat, /fisim, /fkisaltma, /frutbe");

	if(FactionData[PlayerData[playerid][pFaction]][FactionCopPerms])
	{
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}/isbasi, /ekipman /uniforma, /kelepce, /kelepcecoz, /callsign, /(m)egafon, /mdc, /taser, /plastikmermi, /kapikir");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}/dep(artman), /deplow, /hapis, /engel, /cezakes, /acezakes, /giseyonetim, /hq, /swat, /takip, /ftakip, /apb, /cctv, /depayarla");
		SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}/pfver, /elkoy, /siren, /rozet, /carsign, /carsign_sil, /aracbagla, /mdc, /aranmaemri, /setp, /uyustest, /gov, /hq");
		SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}/ltl, /tackle, /label, /candoldur, ");
	    SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}Birli�inin el kitab�nda radyo frekans�n� bulabilirsin.");
	}

	if(FactionData[PlayerData[playerid][pFaction]][FactionMedPerms])
	{
	    SendClientMessage(playerid, COLOR_ADM, "->{FFFFFF} /ates, /deplow, /siren, /isbasi, /uniforma, /callsign, /candoldur, /tedaviet, /mdver, /hq, /gov, /depayarla");
	    SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}Birli�inin el kitab�nda radyo frekans�n� bulabilirsin.");
	}

	return 1;
}

CMD:balikyardim(playerid, params[])
{
	SendClientMessage(playerid, COLOR_DARKGREEN, "______________________________________________");
	SendClientMessage(playerid, COLOR_WHITE, "/balikgit /baliktut /baliksat /baliklarim");
	return 1;
}


/*
CMD:graffiti(playerid, params[])
{
    if (PlayerData[playerid][pBrutallyWounded])
        return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bu komutu yaral� durumdayken kullanamazs�n.");

    if(sprayPermission[playerid] == false)
        return SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Graffiti iznin bulunmuyor.");

    ShowPlayerDialog(playerid, DIALOG_GRAFFITI_MENU, DIALOG_STYLE_LIST, "Graffiti", "Graffiti Metini\nGraffiti Yaz� Tipi", "Se�", "<<");
    return true;
}
*/


CMD:graffiti(playerid, params[])
{
//  if(sprayPermission[playerid] == false)
//      return SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Graffiti iznin bulunmuyor.");

    ShowSprayDialog(playerid, DIALOG_SPRAY_MAIN);
    return 1;
}

CMD:attachplate(playerid, params[])
{

	if(GetNearestVehicle(playerid) == INVALID_VEHICLE_ID)
		return SendErrorMessage(playerid, "Bir araca yak�n de�ilsin.");

	new
			Float:x,
			Float:y,
			Float:z;

	GetVehicleBoot(GetNearestVehicle(playerid), x, y, z);
	new	vehicleid = GetNearestVehicle(playerid);

	if(!IsPlayerInRangeOfPoint(playerid, 2.5, x, y, z))
		return SendErrorMessage(playerid, "Yak�n�n�zdaki arac�n arka plakas�na yak�n de�ilsiniz.");



		if(IsValidFactionCar(vehicleid))
		{
			if(IsLAWFactionCar(CarData[vehicleid][carFaction]))
				return SendErrorMessage(playerid, "Bu ara� �zerinde i�lem yapamazs�n.");
		}

	new vehicleplate[9];
	GetVehicleNumberPlate(vehicleid, vehicleplate, sizeof(vehicleplate));

	if(!strmatch(vehicleplate, " "))
		return SendErrorMessage(playerid, "Bu arac�n zaten plakas� var.");

	if(CheckPlayerClothing(playerid, 18644) == -1)
		return SendErrorMessage(playerid, "Bu komutu kullanmak i�in elinizde tornavida olmal�.");

	AttachPlate(playerid, vehicleid);
	return 1;
}

AttachPlate(playerid, vehicleid)
{
	if(GetPVarInt(playerid, "playerPlateCountdown") != -1)
		return SendErrorMessage(playerid, "Bir ara� plakas� s�kerken bu komutu kullanamazs�n.");

	if(strmatch(PlayerData[playerid][pColdedPlate], "Yok"))
		return SendErrorMessage(playerid, "Herhangi bir �al�nt� plakaya sahip de�ilsin.");

	PlayerTextDrawShow(playerid, StealPlate[playerid][0]);

	PlayerTextDrawSetString(playerid, PlayerOffer[playerid], "~y~PLAKAYI MONTE EDIYORSUN!~n~~p~BIRAZ BEKLEYIN.");
	PlayerTextDrawShow(playerid, PlayerOffer[playerid]);

	PlayerTextDrawShow(playerid, StealPlate[playerid][0]);
	PlayerTextDrawSetString(playerid,  StealPlate[playerid][1], " ");
	PlayerTextDrawShow(playerid, StealPlate[playerid][1]);

	TogglePlayerControllable(playerid, false);
	SetPVarInt(playerid, "playerPlateCountdown", 0);
	stealplateTimer[playerid] = SetTimerEx("playerScrewPlate", 1000, true, "ii", playerid, vehicleid);
	PlayAnimation(playerid, "CAMERA", "CAMSTND_TO_CAMCRCH", 4.1, 0, 0, 0, 1, 0, 1);

	return 1;
}

Server:playerScrewPlate(playerid, vehicleid)
{
	new countdown = GetPVarInt(playerid, "playerPlateCountdown");

	if(countdown > 9)
	{
		PlayerTextDrawHide(playerid, StealPlate[playerid][0]);
		PlayerTextDrawHide(playerid, StealPlate[playerid][1]);
		SetPVarInt(playerid, "playerPlateCountdown", -1);
		TogglePlayerControllable(playerid, true);


		PlayerTextDrawSetString(playerid, PlayerOffer[playerid], "~g~PLAKA BASARIYLA MONTE EDILDI.");
		PlayerTextDrawShow(playerid, PlayerOffer[playerid]);
		SetTimerEx("DisableSuccessfullyMessage", 2000, false, "i", playerid);

		new platevehicle = PlayerData[playerid][pColdedPlateVehicle];
		GetVehiclePos(vehicleid, CarData[vehicleid][carPos][0],CarData[vehicleid][carPos][1], CarData[vehicleid][carPos][2]);
		GetVehicleZAngle(vehicleid, CarData[vehicleid][carPos][3]);

		GetVehiclePos(vehicleid, CarData[platevehicle][carPos][0],CarData[platevehicle][carPos][1], CarData[platevehicle][carPos][2]);
		GetVehicleZAngle(vehicleid, CarData[platevehicle][carPos][3]);

		SetVehicleNumberPlate(vehicleid, PlayerData[playerid][pColdedPlate]);
		SetVehicleNumberPlate(platevehicle, " ");
		SetVehicleToRespawn(vehicleid);
		SetVehicleToRespawn(platevehicle);

		format(PlayerData[playerid][pColdedPlate], 9, "Yok");
		KillTimer(stealplateTimer[playerid]);
		return 1;
	}

	SetPVarInt(playerid, "playerPlateCountdown", countdown+1);

	new StealingPlate[8];
	format(StealingPlate, GetPVarInt(playerid, "playerPlateCountdown"), "%s", PlayerData[playerid][pColdedPlate]);
	PlayerTextDrawSetString(playerid, StealPlate[playerid][1], StealingPlate);

	if(countdown > 6)
	{
		PlayerTextDrawHide(playerid, PlayerOffer[playerid]);
	}
	return 1;
}

CMD:stealplate(playerid, params[])
{
	if(GetNearestVehicle(playerid) == INVALID_VEHICLE_ID)
		return SendErrorMessage(playerid, "Bir araca yak�n de�ilsin.");

	new
			Float:x,
			Float:y,
			Float:z;

	GetVehicleBoot(GetNearestVehicle(playerid), x, y, z);
	new	vehicleid = GetNearestVehicle(playerid);

	if(!IsPlayerInRangeOfPoint(playerid, 2.5, x, y, z))
		return SendErrorMessage(playerid, "Yak�n�n�zdaki arac�n arka plakas�na yak�n de�ilsiniz.");


	if(IsValidFactionCar(vehicleid))
	{
		if(IsLAWFactionCar(CarData[vehicleid][carFaction]))
			return SendErrorMessage(playerid, "Bu ara� �zerinde i�lem yapamazs�n.");
	}

	new vehicleplate[9];
	GetVehicleNumberPlate(vehicleid, vehicleplate, sizeof(vehicleplate));

	if(strmatch(vehicleplate, " "))
		return SendErrorMessage(playerid, "Bu arac�n �al�nacak bir plakas� yok.");

	if(CheckPlayerClothing(playerid, 18634) == -1)
		return SendErrorMessage(playerid, "Bu komutu kullanmak i�in elinizde levye olmal�.");

	ColdPlate(playerid, vehicleid);
	return 1;
}

ColdPlate(playerid, vehicleid)
{
	if(GetPVarInt(playerid, "playerPlateCountdown") != -1)
		return SendErrorMessage(playerid, "Zaten bir arac�n plakas�n� ��kart�yorsun.");

	new vplate[24];
	GetVehicleNumberPlate(vehicleid, vplate, sizeof(vplate));

	PlayerTextDrawShow(playerid, StealPlate[playerid][0]);
	PlayerTextDrawSetString(playerid, StealPlate[playerid][1], sprintf("%s", vplate));
	PlayerTextDrawShow(playerid, StealPlate[playerid][1]);

	PlayerTextDrawSetString(playerid, PlayerOffer[playerid], "~y~HARAKET ETME!~n~~p~PLAKA CIKARTILIYOR.");
	PlayerTextDrawShow(playerid, PlayerOffer[playerid]);

	TogglePlayerControllable(playerid, false);
	SetPVarInt(playerid, "playerPlateCountdown", 9);
	stealplateTimer[playerid] = SetTimerEx("playerColdPlate", 1000, true, "ii", playerid, vehicleid);
	PlayAnimation(playerid, "CAMERA", "CAMSTND_TO_CAMCRCH", 4.1, 0, 0, 0, 1, 0, 1);
	return 1;
}

Server:playerColdPlate(playerid, vehicleid)
{
	new countdown = GetPVarInt(playerid, "playerPlateCountdown");

	new vplate[24];
	GetVehicleNumberPlate(vehicleid, vplate, sizeof(vplate));

	if(countdown < 0)
	{
		PlayerTextDrawHide(playerid, StealPlate[playerid][0]);
		PlayerTextDrawHide(playerid, StealPlate[playerid][1]);
		SetPVarInt(playerid, "playerPlateCountdown", -1);
		TogglePlayerControllable(playerid, true);

		PlayerTextDrawSetString(playerid, PlayerOffer[playerid], "~g~PLAKA BASARIYLA SOKULDU.");
		PlayerTextDrawShow(playerid, PlayerOffer[playerid]);
		SetTimerEx("DisableSuccessfullyMessage", 2000, false, "i", playerid);
		format(PlayerData[playerid][pColdedPlate], 9, "%s", vplate);
		PlayerData[playerid][pColdedPlateVehicle] = vehicleid;
		KillTimer(stealplateTimer[playerid]);
		return 1;
	}

	SetPVarInt(playerid, "playerPlateCountdown", countdown-1);

	new StealingPlate[8];
	GetVehicleNumberPlate(vehicleid, StealingPlate, countdown);
	PlayerTextDrawSetString(playerid, StealPlate[playerid][1], StealingPlate);

	if(countdown < 4)
	{
		PlayerTextDrawHide(playerid, PlayerOffer[playerid]);
	}
	return 1;
}

Server:DisableSuccessfullyMessage(playerid)	return PlayerTextDrawHide(playerid, PlayerOffer[playerid]);

CMD:karakter(playerid, params[])
{
    if(PlayerData[playerid][pAdmin] >= 1)
    {
        new playerb;

        if(sscanf(params, "U(-1)", playerb))return SendUsageMessage(playerid, "/karakter [oyuncu ID/isim]");
        if(!IsPlayerConnected(playerb) && playerb != -1)return SendClientMessage(playerid, COLOR_GREY, "65535 Belirtilen ki�i ba�l� de�il.");
        if(playerb == -1)
        {
            ReturnStatistics(playerid, playerid, 0);
        }else{
            ReturnStatistics(playerb, playerid, 1);
        }
    }
    else{
        ReturnStatistics(playerid, playerid);
    }
    return true;
}

CMD:cc(playerid, params[]) return ClearLines(playerid, 20);

CMD:ra(playerid, params[]) return cmd_rapor(playerid, params);
CMD:rapor(playerid, params[])
{
    if (isnull(params) || strlen(params) > 128)
    {
        SendUsageMessage(playerid, "/rapor [a��klama]");
        SendInfoMessage(playerid, "Rapor komutu amac�na uygun kullan�lmal�d�r aksi takdirde ceza alabilirsiniz.");
        return 1;
    }

    if (Report_GetCount(playerid) > 5) return SendErrorMessage(playerid, "Zaten 5 adet aktif raporun bulunuyor.");
    if (PlayerData[playerid][pReportTime] >= gettime()) return SendErrorMessage(playerid, "Yeni bir rapor g�ndermek i�in l�tfen %d saniye bekle.", PlayerData[playerid][pReportTime] - gettime());

    format(playerReport[playerid], 128, "%s", params);

    new primary_str[355];
    strcat(primary_str, "{FFFFFF}Bu raporu g�ndermek istedi�inizden emin misiniz?\n");
    strcat(primary_str, "{F81414}�u anda ger�ekle�meyen eylemleri bildirmenin\n");
    strcat(primary_str, "�evrimi�i y�neticilerin yerinde i�lem yapmas� son derece\n");
    strcat(primary_str, "zordur, ��nk� onlara hi�bir kan�t sunam�yorsun.\n");
    ConfirmDialog(playerid, "Onay", primary_str, "OnPlayerNewReport");
    return 1;
}

CMD:testers(playerid, params[])
{
    new count;
    SendClientMessage(playerid, COLOR_GREY, "Aktif Testerlar:");

    foreach(new i : Player)
    {
        if(PlayerData[i][pTester])
        {
            SendClientMessageEx(playerid, COLOR_WHITE, "{%s}(ID: %i) %s (%s) - ��ba��: %s", PlayerData[i][pTesterDuty] ? ("33AA33") : ("AFAFAF"), i, ReturnName(i), PlayerData[i][pTesterName], PlayerData[i][pTesterDuty] ? ("Evet") : ("Hay�r"));
            count++;
        }
    }

    if(!count) return SendClientMessage(playerid, COLOR_GREY, "Hi� aktif tester yok.");
    return 1;
}

CMD:isafk(playerid, params[])
{
    if(!pLoggedIn[playerid])return true;

    new string[128], playerb;

    if(sscanf(params, "u", playerb))
        return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: {FFFFFF}/isafk [oyuncu ID/ad�]");

    if(!IsPlayerConnected(playerb))
        return SendClientMessage(playerid, COLOR_GREY, "Girdi�in oyuncu ID veya ad� aktif de�il.");

    if(GetTickCount() > (PlayerData[playerb][pPauseCheck]+2000)) format(string, sizeof(string), "%s isimli oyuncu %d saniyedir AFK.", ReturnName(playerb, 1), PlayerData[playerb][pPauseTime]);
    else format(string, sizeof(string), "%s isimli oyuncu AFK de�il.", ReturnName(playerb, 1));

    SendClientMessage(playerid, COLOR_GREY, string);
    return 1;
}

CMD:giris(playerid, params[])
{
    if(GetPVarInt(playerid, "AtDoor") != -1)
    {
        new d = GetPVarInt(playerid, "AtDoor");
        if(IsPlayerInRangeOfPoint(playerid, 3.0, DoorData[d][EnterPos][0], DoorData[d][EnterPos][1], DoorData[d][EnterPos][2]))
        {
            if(IsPlayerInAnyVehicle(playerid)) return SendServerMessage(playerid, "Ara�tayken bu komutu kullanamazs�n.");
            if(DoorData[d][DoorLocked]) return GameTextForPlayer(playerid, "~r~Kilitli", 3000, 1);

            SendPlayer(playerid, DoorData[d][ExitPos][0], DoorData[d][ExitPos][1], DoorData[d][ExitPos][2], DoorData[d][ExitPos][3], DoorData[d][ExitInterior], DoorData[d][ExitWorld]);
            PlayerData[playerid][pInsideDoor] = d;
            return 1;
        }
    }


    new h = -1;
    if((h = IsPlayerNearProperty(playerid)) != -1)
    {
        if(IsPlayerInAnyVehicle(playerid)) return SendServerMessage(playerid, "Ara�tayken bu komutu kullanamazs�n.");
        if(PropertyData[h][PropertyLocked]) return GameTextForPlayer(playerid, "~r~Kilitli", 2000, 1);

        switch(PropertyData[h][PropertyType])
        {
            case 2:
            {
                SendPlayer(playerid, PropertyData[h][PropertyExit][0], PropertyData[h][PropertyExit][1], PropertyData[h][PropertyExit][2], PropertyData[h][PropertyExit][3], PropertyData[h][PropertyExitInterior], PropertyData[h][PropertyExitWorld]);

                PlayerData[playerid][pInsideApartment] = h;
                PlayerData[playerid][pInsideComplex] = -1;

                DisablePlayerCheckpoint(playerid);
                PlayerData[playerid][pCheckpoint] = -1;

                if(PropertyData[h][PropertyXMROn]) PlayAudioStreamForPlayer(playerid, PropertyData[h][PropertyXMRUrl]);
            }
            default:
            {
                SendPlayer(playerid, PropertyData[h][PropertyExit][0], PropertyData[h][PropertyExit][1], PropertyData[h][PropertyExit][2], PropertyData[h][PropertyExit][3], PropertyData[h][PropertyExitInterior], PropertyData[h][PropertyExitWorld]);

                if(PropertyData[h][PropertyType] == 1) {
                    PlayerData[playerid][pInsideComplex] = h;
                }

                if(PropertyData[h][PropertyType] == 3) {
                    PlayerData[playerid][pInsideHouse] = h;
                }

                DisablePlayerCheckpoint(playerid);
                PlayerData[playerid][pCheckpoint] = -1;
                if(PropertyData[h][PropertyXMROn]) PlayAudioStreamForPlayer(playerid, PropertyData[h][PropertyXMRUrl]);
            }
        }
    }

    new b = -1;
    if((b = IsPlayerNearBusiness(playerid)) != -1)
    {
        if(IsPlayerInAnyVehicle(playerid)) return SendServerMessage(playerid, "Ara�tayken bu komutu kullanamazs�n.");
        if(BusinessData[b][BusinessType] == BUSINESS_DEALERSHIP || BusinessData[b][BusinessType] == BUSINESS_GASSTATION) return GameTextForPlayer(playerid, "~r~Kapali", 3000, 1);
        if(BusinessData[b][BusinessLocked]) return GameTextForPlayer(playerid, "~r~Kilitli", 3000, 1);

	        if(PlayerData[playerid][pSQLID] != BusinessData[b][BusinessOwnerSQLID])
	        {
						if(GetPVarInt(playerid, "LastBusinessFee") == b)
						{
							if(gettime() - GetPVarInt(playerid, "BusinessFeeDelay") > 180)
							{
								if(PlayerData[playerid][pMoney] < BusinessData[b][BusinessFee]) return SendErrorMessage(playerid, "Giri� i�in yeterli paran yok.");
								BusinessData[b][BusinessCashbox] += BusinessData[b][BusinessFee];
								GiveMoney(playerid, -BusinessData[b][BusinessFee]);
								SetPVarInt(playerid, "BusinessFeeDelay", gettime());
								SetPVarInt(playerid, "LastBusinessFee", b);
							}
	        	}
						else
						{
						if(PlayerData[playerid][pMoney] < BusinessData[b][BusinessFee]) return SendErrorMessage(playerid, "Giri� i�in yeterli paran yok.");
						BusinessData[b][BusinessCashbox] += BusinessData[b][BusinessFee];
						GiveMoney(playerid, -BusinessData[b][BusinessFee]);
						SetPVarInt(playerid, "BusinessFeeDelay", gettime());
						SetPVarInt(playerid, "LastBusinessFee", b);
						}
					}

        if(BusinessData[b][BusinessXMROn]) PlayAudioStreamForPlayer(playerid, BusinessData[b][BusinessXMRUrl]);
        SendPlayer(playerid, BusinessData[b][ExitPos][0], BusinessData[b][ExitPos][1], BusinessData[b][ExitPos][2], BusinessData[b][ExitPos][3], BusinessData[b][ExitInterior], BusinessData[b][ExitWorld]);
        GameTextForPlayer(playerid, sprintf("~w~%s", BusinessData[b][BusinessName]), 3000, 1);
        PlayerData[playerid][pInsideBusiness] = b;
        Business_Message(playerid, b);
        return 1;
    }

    if(GetPVarInt(playerid, "AtGarage") != -1)
    {
        new g = GetPVarInt(playerid, "AtGarage");
        if(IsPlayerInRangeOfPoint(playerid, 3.0, GarageData[g][GaragePos][0], GarageData[g][GaragePos][1], GarageData[g][GaragePos][2]))
        {
            if(GarageData[g][GarageLocked]) return GameTextForPlayer(playerid, "~r~Kilitli", 3000, 1);

            SendPlayer(playerid, GarageData[g][GarageInt][0], GarageData[g][GarageInt][1], GarageData[g][GarageInt][2], GarageData[g][GarageInt][3], GarageData[g][ExitInteriorID], GarageData[g][ExitWorld]);
            PlayerData[playerid][pInsideGarage] = g;

            if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
            {
                foreach(new i : Player)
                {
                    if(IsPlayerInVehicle(i, GetPlayerVehicleID(playerid)))
                    {
                        SetPlayerVirtualWorld(i, GarageData[g][ExitWorld]);
                        SetPlayerInterior(i, GarageData[g][ExitInteriorID]);

                        PlayerData[i][pInsideGarage] = g;
                    }
                }

                SetVehicleZAngle(GetPlayerVehicleID(playerid), GarageData[g][GarageInt][3]);
            }
        }
    }

    if(GetPVarInt(playerid, "AtPayNSpray") != -1)
    {
        new p = GetPVarInt(playerid, "AtPayNSpray");
        if(IsPlayerInRangeOfPoint(playerid, 5.0, PNSData[p][PnsPos][0], PNSData[p][PnsPos][1], PNSData[p][PnsPos][2]))
        {
            if (PNSData[p][PnsOccupied]) return SendServerMessage(playerid, "Pay N Spray dolu.");
            if (GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendServerMessage(playerid, "Herhangi bir ara�ta de�ilsin.");
            if (PlayerData[playerid][pMoney] < PNSData[p][PnsPrice]) return SendServerMessage(playerid, "Giri� i�in yeterli paran yok.");

            SendPlayer(playerid, PNSData[p][PnsInt][0], PNSData[p][PnsInt][1], PNSData[p][PnsInt][2], PNSData[p][PnsInt][3], PNSData[p][ExitInteriorID], PNSData[p][ExitWorld]);
            GiveMoney(playerid, -PNSData[p][PnsPrice]);

        /*  new panels, doors, lights, tires, Float: vehiclehealth, panelsp, doorsp, panelprice, doorprice, tireprice, tiresp, engineprice, Float:vehhp, price;
            new vehicleid = GetPlayerVehicleID(playerid);

            GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
            AntiCheatGetVehicleHealth(vehicleid, vehiclehealth);

            new flp = 0xf & panels; new frp = ((0xf << 4) & panels) >> 4; new rlp = ((0xf << 8) & panels) >> 8; new rrp = ((0xf << 12) & panels) >> 12;
            new windshield = ((0xf << 16) & panels) >> 16; new front_bumper = ((0xf << 20) & panels) >> 20; new rear_bumper = ((0xf << 24) & panels) >> 24;
            new bonnet = 0xf & doors; new boot = ((0xf << 8) & doors) >> 8; new driver = ((0xf << 16) & doors) >> 16; new passenger = ((0xf << 24) & doors) >> 24;
            new behinddriver = ((0xf << 32) & doors) >> 32; new behindpassenger = ((0xf << 40) & doors) >> 40;
            new t1 = 1 & tires; new t2 = ((1 << 1) & tires) >> 1; new t3 = ((1 << 2) & tires) >> 2; new t4 = ((1 << 3) & tires) >> 3;

            panelsp = floatround((flp+frp+rlp+rrp+windshield+front_bumper+rear_bumper)/0.21);
            doorsp = floatround((bonnet+boot+driver+passenger+behinddriver+behindpassenger)/0.24);
            tiresp = floatround((t1+t2+t3+t4)/0.04);
            panelprice=1*panelsp;
            doorprice=1*doorsp;
            tireprice=2*tiresp;

            AntiCheatGetVehicleHealth(vehicleid, vehhp);
            engineprice=floatround((floatround(vehhp-1000)*(-1))*0.75);
            price = engineprice+tireprice+doorprice+panelprice;*/

            PNSData[p][PnsOccupied] = true;
            PNSData[p][PnsEarnings]+= PNSData[p][PnsPrice];
            PlayerData[playerid][pInsidePNS] = p;

            new vehicleid = GetPlayerVehicleID(playerid);
            SetVehicleHealth(vehicleid, CarData[vehicleid][carMaxHealth]);
            RepairVehicle(vehicleid);

            SetTimerEx("TIMER_ExitPNS", 9500, false, "i", playerid);
            SendClientMessage(playerid, COLOR_DARKGREEN, "Otomatik-Ses: 10 saniye sonra ��kacaks�n.");
            GameTextForPlayer(playerid, "~g~TAMIR EDILIYOR...", 5000, 4);
            TogglePlayerControllable(playerid, false);
            return 1;
        }
    }

    if(GetPVarInt(playerid, "AtEntrance") != -1)
    {
        new e = GetPVarInt(playerid, "AtEntrance");
        if(IsPlayerInRangeOfPoint(playerid, 3.0, EntranceData[e][EntrancePos][0], EntranceData[e][EntrancePos][1], EntranceData[e][EntrancePos][2]))
        {
            if(IsPlayerInAnyVehicle(playerid)) return SendServerMessage(playerid, "Ara�tayken bu komutu kullanamazs�n.");
            if(EntranceData[e][EntranceLocked] && !PlayerData[playerid][pAdminDuty]) return GameTextForPlayer(playerid, "~r~Kilitli", 3000, 1);

            SendPlayer(playerid, EntranceData[e][EntranceInt][0], EntranceData[e][EntranceInt][1], EntranceData[e][EntranceInt][2], EntranceData[e][EntranceInt][3], EntranceData[e][ExitInteriorID], EntranceData[e][ExitWorld]);
            PlayerData[playerid][pInsideEntrance] = e;
            return 1;
        }
    }
    return 1;
}

CMD:cikis(playerid, params[])
{
    if(EditingObject[playerid] != 0)
    {
        EditingObject[playerid] = 0;
        EditingID[playerid] = 0;
        CancelEdit(playerid);
    }

    if(PlayerData[playerid][pHouseFurniture] != -1)
        CancelEdit(playerid);

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
        if(IsPlayerInRangeOfPoint(playerid, 3.0, PropertyData[h][PropertyExit][0], PropertyData[h][PropertyExit][1], PropertyData[h][PropertyExit][2]) && GetPlayerVirtualWorld(playerid) == PropertyData[h][PropertyExitWorld])
        {
            switch(PropertyData[h][PropertyType])
            {
                case 2:
                {
                    if(PlayerData[playerid][pInsideApartment] == h)
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
        if(IsPlayerInRangeOfPoint(playerid, 3.0, BusinessData[b][ExitPos][0], BusinessData[b][ExitPos][1], BusinessData[b][ExitPos][2]) && BusinessData[b][ExitWorld] == GetPlayerVirtualWorld(playerid))
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
        new g = GetPVarInt(playerid, "AtGarage");
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
            if(IsPlayerInAnyVehicle(playerid)) return SendServerMessage(playerid, "Ara�tayken bu komutu kullanamazs�n.");
            if(EntranceData[e][EntranceLocked] && !PlayerData[playerid][pAdminDuty]) return GameTextForPlayer(playerid, "~r~Kilitli", 3000, 1);

            SendPlayer(playerid, EntranceData[e][EntrancePos][0], EntranceData[e][EntrancePos][1], EntranceData[e][EntrancePos][2], EntranceData[e][EntrancePos][3], EntranceData[e][EntranceInteriorID], EntranceData[e][EntranceWorld]);
            PlayerData[playerid][pInsideEntrance] = -1;
            return 1;
        }
    }
    return 1;
}

CMD:gkilit(playerid, params[])
{
    if(GetPVarInt(playerid, "AtGarage") != -1)
    {
        new g = GetPVarInt(playerid, "AtGarage");
        if(IsPlayerInRangeOfPoint(playerid, 3.0, GarageData[g][GaragePos][0], GarageData[g][GaragePos][1], GarageData[g][GaragePos][2])
        || IsPlayerInRangeOfPoint(playerid, 3.0, GarageData[g][GarageInt][0], GarageData[g][GarageInt][1], GarageData[g][GarageInt][2]))
        {
            if(!GarageData[g][GarageFaction] && PlayerData[playerid][pSQLID] != PropertyData[GarageData[g][GaragePropertyID]][PropertyOwnerID] && !PlayerData[playerid][pAdminDuty])
                return SendClientMessage(playerid, COLOR_ADM, "SERVER: Anahtar�n yok.");

            if(GarageData[g][GarageFaction] && PlayerData[playerid][pFaction] != GarageData[g][GarageFaction]) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Anahtar�n yok.");

            if(GarageData[g][GarageLocked])
            {
                GarageData[g][GarageLocked] = false;
                GameTextForPlayer(playerid, "~w~GARAJ ~g~KILIDI ACILDI", 3000, 6);
                PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
            }
            else
            {
                GarageData[g][GarageLocked] = true;
                GameTextForPlayer(playerid, "~w~GARAJ ~r~KILITLENDI", 3000, 6);
                PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
            }
        }
    }
    return 1;
}

CMD:kapi(playerid, params[])
{
    if (PlayerData[playerid][pBrutallyWounded])
			return SendServerMessage(playerid, "Bu komutu yaral� durumdayken kullanamazs�n.");

	if(GetPVarInt(playerid, "AtGate") != -1)
  {
      new e = GetPVarInt(playerid, "AtGate");
      if(GateData[e][GateFaction] != -1 && GateData[e][GateFaction] != PlayerData[playerid][pFaction] && !PlayerData[playerid][pAdminDuty])
          return SendClientMessage(playerid, COLOR_ADM, "SERVER: Anahtar�n yok.");

      Gate_Operate(e);
      return 1;
  }


    new data[e_furniture];
    for(new i, j = Streamer_GetUpperBound(STREAMER_TYPE_OBJECT); i < j; i++)
    {
        if(!IsValidDynamicObject(i)) continue;
        if(!IsHouseDoor(Streamer_GetIntData(STREAMER_TYPE_OBJECT, i, E_STREAMER_MODEL_ID))) continue;
        if(!Streamer_IsInArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, 0)) continue;

        Streamer_GetArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, data);
        if(IsPlayerInRangeOfPoint(playerid, 2.5, data[furnitureX], data[furnitureY], data[furnitureZ]))
        {
            if(data[furnitureLocked]) return SendClientMessage(playerid, COLOR_ADM, "Kap� kilitli.");

            if(!data[furnitureOpened])
            {
                data[furnitureOpened] = true;
                MoveDynamicObject(i, data[furnitureX], data[furnitureY], data[furnitureZ], 1.5, data[furnitureRX], data[furnitureRY], data[furnitureRZ]-90.0);
            }
            else
            {
                data[furnitureOpened] = false;
                MoveDynamicObject(i, data[furnitureX], data[furnitureY], data[furnitureZ], 1.5, data[furnitureRX], data[furnitureRY], data[furnitureRZ]);
            }

            Streamer_SetArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, data);
            break;
        }
    }
    return 1;
}

CMD:fkilit(playerid, params[])
{
    new id = -1;
    if((id = IsPlayerInProperty(playerid)) != -1)
    {
        new data[e_furniture];
        for(new i, j = Streamer_GetUpperBound(STREAMER_TYPE_OBJECT); i < j; i++)
        {
            if(!IsValidDynamicObject(i)) continue;
            if(!IsHouseDoor(Streamer_GetIntData(STREAMER_TYPE_OBJECT, i, E_STREAMER_MODEL_ID))) continue;
            if(!Streamer_IsInArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, 0)) continue;

            Streamer_GetArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, data);
            if(IsPlayerInRangeOfPoint(playerid, 2.5, data[furnitureX], data[furnitureY], data[furnitureZ]))
            {
                if(PropertyData[id][PropertyOwnerID] != PlayerData[playerid][pSQLID] && PlayerData[playerid][pRenting] != id && !PlayerData[playerid][pAdminDuty])
                    return SendClientMessage(playerid, COLOR_ADM, "SERVER: Anahtar�n yok.");

                if(data[furnitureOpened])
                    return SendClientMessage(playerid, COLOR_ADM, "SERVER: A��k kap�y� kilitleyemezsin.");

                if(!data[furnitureLocked])
                {
                    data[furnitureLocked] = true;
                    //SetDynamicObjectRot(i, data[furnitureRX], data[furnitureRY], data[furnitureRZ]);
                }
                else
                {
                    data[furnitureLocked] = false;
                    //data[furnitureRZ] = data[furnitureRZ] - 90.0;
                    //SetDynamicObjectRot(i, data[furnitureRX], data[furnitureRY], data[furnitureRZ]);
                }

                SendClientMessageEx(playerid, COLOR_WHITE, "Kap� {FFFF00}%s.", data[furnitureLocked] ? "kilitlendi" : "a��ld�");
                Streamer_SetArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, data);
                break;
            }
        }
    }

    return 1;
}

CMD:kilit(playerid, params[])
{
    if(GetPVarInt(playerid, "AtDoor") != -1)
    {
        new d = GetPVarInt(playerid, "AtDoor");
        if(IsPlayerInRangeOfPoint(playerid, 3.0, DoorData[d][EnterPos][0], DoorData[d][EnterPos][1], DoorData[d][EnterPos][2])
            || IsPlayerInRangeOfPoint(playerid, 3.0, DoorData[d][ExitPos][0], DoorData[d][ExitPos][1], DoorData[d][ExitPos][2]))
        {
            if(DoorData[d][DoorFaction] != 0 && DoorData[d][DoorFaction] != PlayerData[playerid][pFaction] && !PlayerData[playerid][pAdminDuty])
                return SendClientMessage(playerid, COLOR_ADM, "SERVER: Anahtar�n yok.");

            if(!DoorData[d][DoorLocked])
            {
                DoorData[d][DoorLocked] = true;
                PlayNearbySound(playerid, 1052);

                if(DoorData[d][DoorFaction] != 0)
                    SendClientMessageEx(playerid, COLOR_GREY, "* %s isimli kap� {FF6347}kilitlendi{AFAFAF}. (Parmak �zi: %s %s)", DoorData[d][DoorName], Player_GetFactionRank(playerid), ReturnName(playerid, 0));
                else
                    GameTextForPlayer(playerid, sprintf("~w~%s ~r~KILITLENDI", DoorData[d][DoorName]), 3000, 6);
            }
            else
            {
                DoorData[d][DoorLocked] = false;
                PlayNearbySound(playerid, 1052);

                if(DoorData[d][DoorFaction] != 0)
                    SendClientMessageEx(playerid, COLOR_GREY, "* %s isimli kap� {33AA33}a��ld�{AFAFAF}. (Parmak �zi: %s %s)", DoorData[d][DoorName], Player_GetFactionRank(playerid), ReturnName(playerid, 0));
                else
                    GameTextForPlayer(playerid, sprintf("~w~%s ~g~ACILDI", DoorData[d][DoorName]), 3000, 6);
            }
            return 1;
        }
    }

    if(GetPVarInt(playerid, "AtBusiness") != -1)
    {
        new b = GetPVarInt(playerid, "AtBusiness");
        if(IsPlayerInRangeOfPoint(playerid, 3.0, PropertyData[b][PropertyEnter][0], PropertyData[b][PropertyEnter][1], PropertyData[b][PropertyEnter][2])
            || IsPlayerInRangeOfPoint(playerid, 3.0, PropertyData[b][PropertyExit][0], PropertyData[b][PropertyExit][1], PropertyData[b][PropertyExit][2]))
        {
            if(BusinessData[b][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID] && !PlayerData[playerid][pAdminDuty])
                return SendClientMessage(playerid, COLOR_ADM, "SERVER: Anahtar�n yok.");

            BusinessData[b][BusinessLocked] = !BusinessData[b][BusinessLocked];
            GameTextForPlayer(playerid, sprintf("~w~KAPI %s", BusinessData[b][BusinessLocked] ? "~r~KILITLENDI" : "~g~ACILDI"), 3000, 6);
            PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
            return 1;
        }
    }

    new id = -1;
    if((id = IsPlayerInProperty(playerid)) != -1)
    {
        new data[e_furniture];
        for(new i, j = Streamer_GetUpperBound(STREAMER_TYPE_OBJECT); i < j; i++)
        {
            if(!IsValidDynamicObject(i)) continue;
            if(!IsHouseDoor(Streamer_GetIntData(STREAMER_TYPE_OBJECT, i, E_STREAMER_MODEL_ID))) continue;
            if(!Streamer_IsInArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, 0)) continue;

            Streamer_GetArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, data);
            if(IsPlayerInRangeOfPoint(playerid, 2.5, data[furnitureX], data[furnitureY], data[furnitureZ]))
            {
                if(PropertyData[id][PropertyOwnerID] != PlayerData[playerid][pSQLID] && PlayerData[playerid][pRenting] != id && !PlayerData[playerid][pAdminDuty])
                    return SendClientMessage(playerid, COLOR_ADM, "SERVER: Anahtar�n yok.");

                if(data[furnitureOpened])
                    return SendClientMessage(playerid, COLOR_ADM, "SERVER: A��k kap�y� kilitleyemezsin.");

                if(!data[furnitureLocked])
                {
                    data[furnitureLocked] = true;
                    //SetDynamicObjectRot(i, data[furnitureRX], data[furnitureRY], data[furnitureRZ]);
                }
                else
                {
                    data[furnitureLocked] = false;
                    //data[furnitureRZ] = data[furnitureRZ] - 90.0;
                    //SetDynamicObjectRot(i, data[furnitureRX], data[furnitureRY], data[furnitureRZ]);
                }

                SendClientMessageEx(playerid, COLOR_WHITE, "Kap� {FFFF00}%s.", data[furnitureLocked] ? "kilitlendi" : "a��ld�");
                Streamer_SetArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, data);
                break;
            }
        }
    }

    if(GetPVarInt(playerid, "AtHouse") != -1)
    {
        new h = GetPVarInt(playerid, "AtHouse");
        if(IsPlayerInRangeOfPoint(playerid, 3.0, PropertyData[h][PropertyEnter][0], PropertyData[h][PropertyEnter][1], PropertyData[h][PropertyEnter][2])
            || IsPlayerInRangeOfPoint(playerid, 3.0, PropertyData[h][PropertyExit][0], PropertyData[h][PropertyExit][1], PropertyData[h][PropertyExit][2]))
        {
            if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID] && PlayerData[playerid][pRenting] != h && !PlayerData[playerid][pAdminDuty])
                return SendClientMessage(playerid, COLOR_ADM, "SERVER: Anahtar�n yok.");

            PropertyData[h][PropertyLocked] = !PropertyData[h][PropertyLocked];
            GameTextForPlayer(playerid, sprintf("~w~KAPI %s", PropertyData[h][PropertyLocked] ? "~r~KILITLENDI" : "~g~ACILDI"), 3000, 6);
            PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
            return 1;
        }
    }

    if(GetPVarInt(playerid, "AtEntrance") != -1)
    {
        new e = GetPVarInt(playerid, "AtEntrance");
        if(IsPlayerInRangeOfPoint(playerid, 3.0, EntranceData[e][EntrancePos][0], EntranceData[e][EntrancePos][1], EntranceData[e][EntrancePos][2])
        || IsPlayerInRangeOfPoint(playerid, 3.0, EntranceData[e][EntranceInt][0], EntranceData[e][EntranceInt][1], EntranceData[e][EntranceInt][2]))
        {
            if(EntranceData[e][EntranceFaction] && PlayerData[playerid][pFaction] != EntranceData[e][EntranceFaction] && !PlayerData[playerid][pAdminDuty])
                return SendClientMessage(playerid, COLOR_ADM, "SERVER: Anahtar�n yok.");

            EntranceData[e][EntranceLocked] = !EntranceData[e][EntranceLocked];
            GameTextForPlayer(playerid, sprintf("~w~KAPI %s", EntranceData[e][EntranceLocked] ? "~r~KILITLENDI" : "~g~ACILDI"), 3000, 6);
            PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
            return 1;
        }
    }

    new bool:car_found = false, vehicleid, Float: fetchPos[3];

    for (new i = 0; i < MAX_VEHICLES; i++)
    {
        GetVehiclePos(i, fetchPos[0], fetchPos[1], fetchPos[2]);
        if(IsPlayerInRangeOfPoint(playerid, 3.0, fetchPos[0], fetchPos[1], fetchPos[2]))
        {
            car_found = true;
            vehicleid = i;
            break;
        }
    }

    if(car_found == true)
    {
        if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece �zel ara�larda kullan�l�r.");
        if(IsValidPlayerCar(vehicleid))
        {
            if(!strcmp(params, "kir", true))
            {
                if(NoEngineCar(vehicleid)) return SendErrorMessage(playerid, "Bu arac�n kap�s� yok.");

                if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return SendErrorMessage(playerid, "Bu komutu ara� i�inde kullanamazs�n.");
                if(PlayerData[playerid][pSQLID] == CarData[vehicleid][carOwnerID]) return SendErrorMessage(playerid, "Kendi araban�n kilidini k�ramazs�n.");
                if(PlayerData[playerid][pCarKey] == CarData[vehicleid][carID]) return SendErrorMessage(playerid, "Anahtar�na sahip oldu�un arac�n kilidini k�ramazs�n.");
                //if(GetPVarInt(playerid, "Picklock") != INVALID_VEHICLE_ID) return SendErrorMessage(playerid, "Ba�ka bir arac�n kap�s�n� zorluyorsun.");

                if(!CarData[vehicleid][carLocked])
                {
                    if(!ActiveLockTD[playerid])
                    {
                        BreakInTextDraw[playerid] = CreateDynamic3DTextLabel("Ara� Kilitli De�il!", COLOR_DARKGREEN, 0.0, 0.0, 0.0, 10.0, .attachedvehicle = vehicleid, .playerid = playerid, .worldid = GetPlayerVirtualWorld(playerid), .interiorid = GetPlayerInterior(playerid));
                        BreakInTDTimer[playerid] = SetTimerEx("OnLockTextdraw", 4000, false, "i", playerid);

                        ActiveLockTD[playerid] = 1;
                        BreakInError[playerid] = 1;

                        Streamer_Update(playerid);
                    }
                    return 1;
                }

                if(BreakInError[playerid])
                {
                    if(IsValidDynamic3DTextLabel(BreakInTextDraw[playerid])) DestroyDynamic3DTextLabel(BreakInTextDraw[playerid]);

                    BreakInError[playerid] = 0;

                    if(ActiveLockTD[playerid])
                    {
                        KillTimer(BreakInTDTimer[playerid]);
                        ActiveLockTD[playerid] = 0;
                    }
                }

                if(CarData[vehicleid][carPhysicalAttack] && CarData[vehicleid][carDoorHealth] > 0)
                {
                    PlayerBreakingIn[playerid] = 1;
                    PlayerBreakInVehicle[playerid] = vehicleid;
                    CarData[vehicleid][carPhysicalAttack] = true;

                    SendClientMessageEx(playerid, COLOR_WHITE, "-%s", ReturnWeaponName(GetPlayerWeapon(playerid)));
                    SendClientMessageEx(playerid, COLOR_WHITE, "-%s", ReturnWeaponType(GetPlayerWeapon(playerid)));
                    return 1;
                }

                PlayerBreakingIn[playerid] = 1;
                PlayerBreakInVehicle[playerid] = vehicleid;

                switch(CarData[vehicleid][carLock])
                {
                    case 0: CarData[vehicleid][carDoorHealth] = 35, CarData[vehicleid][carDoorEffect] = BLOCK_NONE;
                    case 1: CarData[vehicleid][carDoorHealth] = 65, CarData[vehicleid][carDoorEffect] = LESS_DAMAGE_FIST;
                    case 2: CarData[vehicleid][carDoorHealth] = 120, CarData[vehicleid][carDoorEffect] = BLOCK_FIST;
                    case 3: CarData[vehicleid][carDoorHealth] = 170, CarData[vehicleid][carDoorEffect] = LESS_DAMAGE_MELEE;
                    case 4: CarData[vehicleid][carDoorHealth] = 220, CarData[vehicleid][carDoorEffect] = BLOCK_PHYSICAL;
                }

                CarData[vehicleid][carPhysicalAttack] = true;
                new Float: x, Float: y, Float: z; GetPlayerPos(playerid, x, y, z);
                SendInfoMessage(playerid, "�u anda %s model arac�n �of�r cam�n� k�r�yorsun. Kullanabilece�in y�ntemler:", ReturnVehicleName(vehicleid));
                SendClientMessageEx(playerid, COLOR_WHITE, "-%s", ReturnWeaponName(GetPlayerWeapon(playerid)));
                SendClientMessageEx(playerid, COLOR_WHITE, "-%s", ReturnWeaponType(GetPlayerWeapon(playerid)));
                TriggerAlarm(vehicleid, GetZoneName(x, y, z), CarData[vehicleid][carAlarm]);
                return 1;
            }

            if(CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID] && PlayerData[playerid][pCarKey] != CarData[vehicleid][carID] && !PlayerData[playerid][pAdminDuty])
                return GameTextForPlayer(playerid, "Anahtarlarin Yok.", 2000, 6);

            if(!CarData[vehicleid][carLocked])
            {
                ToggleVehicleLock(vehicleid, true);
                CarData[vehicleid][carLocked] = true;
                GameTextForPlayer(playerid, sprintf("~r~%s KILITLENDI", ReturnVehicleName(vehicleid)), 2000, 4);
                PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
            }
            else
            {
                ToggleVehicleLock(vehicleid, false);
                CarData[vehicleid][carLocked] = false;
                GameTextForPlayer(playerid, sprintf("~g~%s ACILDI", ReturnVehicleName(vehicleid)), 2000, 4);
                PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
            }
        }
        else if(IsValidRentalCar(vehicleid))
        {
            if(CarData[vehicleid][carRentedBy] != PlayerData[playerid][pSQLID] && !PlayerData[playerid][pAdminDuty])
            {
                GameTextForPlayer(playerid, "Anahtarlarin yok.", 2000, 6);
                return 1;
            }

            if(!CarData[vehicleid][carLocked])
            {
                ToggleVehicleLock(vehicleid, true);
                CarData[vehicleid][carLocked] = true;
                GameTextForPlayer(playerid, sprintf("~r~%s KILITLENDI", ReturnVehicleName(vehicleid)), 2000, 4);
                PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
            }
            else
            {
                ToggleVehicleLock(vehicleid, false);
                CarData[vehicleid][carLocked] = false;
                GameTextForPlayer(playerid, sprintf("~g~%s ACILDI", ReturnVehicleName(vehicleid)), 2000, 4);
                PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
            }
        }
        else if(IsValidFactionCar(vehicleid))
        {
            if(PlayerData[playerid][pFaction] != CarData[vehicleid][carFaction] && !PlayerData[playerid][pAdminDuty])
            {
                SendServerMessage(playerid, "Bu araca eri�imin yok.");
                return 1;
            }

            if(!CarData[vehicleid][carLocked])
            {
                ToggleVehicleLock(vehicleid, true);
                CarData[vehicleid][carLocked] = true;
                GameTextForPlayer(playerid, sprintf("~r~%s KILITLENDI", ReturnVehicleName(vehicleid)), 2000, 4);
                PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
            }
            else
            {
                ToggleVehicleLock(vehicleid, false);
                CarData[vehicleid][carLocked] = false;
                GameTextForPlayer(playerid, sprintf("~g~%s ACILDI", ReturnVehicleName(vehicleid)), 2000, 4);
                PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
            }
        }
    }
    else SendServerMessage(playerid, "Yak�n�nda ara� yok, e�er varsa re-log at�n�z.");
    return 1;
}

CMD:uns(playerid, params[])
{
    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
        return SendClientMessage(playerid, COLOR_ADM, "SERVER: �of�r koltu�unda de�ilsin.");

    if(!PlayerData[playerid][pUnscrambling])
        return SendClientMessage(playerid, COLOR_ADM, "SERVER: D�zkontak uygulam�yorsun.");

    if(isnull(params))
        return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /(uns) [kelime]");

    new
        displayString[60];

    if(!strcmp(g_aUnscrambleInfo[ PlayerData[playerid][pUnscrambleID] ][unscrambledWord], params, true))
    {   //If the word is correct:

        PlayerData[playerid][pUnscrambleID] = random(sizeof(g_aUnscrambleInfo));
        //Find a new word to show the player;

        format(displayString, 60, "%s", g_aUnscrambleInfo[ PlayerData[playerid][pUnscrambleID] ][scrambledWord]);
        PlayerTextDrawSetString(playerid, Unscrambler_PTD[playerid][1], displayString);
        //Set the textdraws new word display;

        //Timer increases depending on Alarm Seviyesi:
        PlayerData[playerid][pUnscramblerTime] += 9;
        PlayerData[playerid][pScrambleSuccess]++;

        PlayerPlaySound(playerid, 1052, 0, 0, 0);

        if(PlayerData[playerid][pScrambleSuccess] >= 12)
        {
            PlayerData[playerid][pUnscrambling] = false;
            KillTimer(PlayerData[playerid][pUnscrambleTimer]);

            PlayerData[playerid][pUnscrambleID] = 0;
            PlayerData[playerid][pUnscramblerTime] = 0;

            PlayerData[playerid][pScrambleFailed] = 0;
            PlayerData[playerid][pScrambleSuccess] = 0;

            ShowUnscrambleTextdraw(playerid, false);
            GameTextForPlayer(playerid, "~g~MOTOR ACILDI", 2000, 3);

            new
                vehicleid = GetPlayerVehicleID(playerid);

            CarEngine[vehicleid] = true;
            ToggleVehicleEngine(vehicleid, true);
            cmd_ame(playerid, sprintf("%s model arac�n motoruna d�zkontak yapar ve �al��t�r�r.", ReturnVehicleName(vehicleid)));
        }
    }
    else
    {
        PlayerPlaySound(playerid, 1055, 0, 0, 0);

        PlayerData[playerid][pUnscrambleID] = random(sizeof(g_aUnscrambleInfo));
        //Find a new word to show the player;

        format(displayString, 60, "%s", g_aUnscrambleInfo[ PlayerData[playerid][pUnscrambleID] ][scrambledWord]);
        PlayerTextDrawSetString(playerid, Unscrambler_PTD[playerid][1], displayString);

        PlayerData[playerid][pScrambleFailed]++;
        PlayerData[playerid][pUnscramblerTime]-= random(6)+1;

        if(PlayerData[playerid][pScrambleFailed] >= 6)
        {
            PlayerData[playerid][pUnscrambling] = false;
            PlayerData[playerid][pUnscramblerTime] = 0;
            PlayerData[playerid][pUnscrambleID] = 0;

            PlayerData[playerid][pScrambleSuccess] = 0;
            PlayerData[playerid][pScrambleFailed] = 0;
            KillTimer(PlayerData[playerid][pUnscrambleTimer]);

            ShowUnscrambleTextdraw(playerid, false);

            new
                vehicleid = GetPlayerVehicleID(playerid)
            ;

            ToggleVehicleAlarms(vehicleid, true);
            NotifyVehicleOwner(vehicleid);
        }
    }
    return 1;
}

CMD:kaput(playerid, params[]) return cmd_arac(playerid, "kaput");
CMD:bagaj(playerid, params[]) return cmd_arac(playerid, "bagaj");
CMD:far(playerid, params[])
{
    if(!IsPlayerInAnyVehicle(playerid)) return SendServerMessage(playerid, "Herhangi bir ara�ta de�ilsin.");
    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendServerMessage(playerid, "Arac�n �of�r koltu�unda de�ilsin.");

    new vehicle = GetPlayerVehicleID(playerid);
    if(NoEngineCar(vehicle)) return SendServerMessage(playerid, "Bu arac�n farlar� yok.");

    if(CarLights[vehicle])
    {
        CarLights[vehicle] = false;
        ToggleVehicleLights(vehicle, false);
        SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Farlar� kapatt�n.");
    }
    else
    {
        CarLights[vehicle] = true;
        ToggleVehicleLights(vehicle, true);
        SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Farlar� a�t�n.");
    }
    return 1;
}

CMD:b(playerid, params[])
{
    new
        msg[128],
        text[128];

    if(sscanf(params, "s[128]", text))
        return SendUsageMessage(playerid, "/b [mesaj]");

     if(PlayerData[playerid][pAjailed])
    {
		SendErrorMessage(playerid, "Hapisteyken bu komutu kullanamazs�n.");
        return 1;
    }

    if(strlen(msg) > 84)
    {
        format(msg, sizeof(msg), "(( [%i] {%s}%s{AFAFAF}: %.84s", playerid, PlayerData[playerid][pAdminDuty] ? ("FF9900") : ("AFAFAF"), ReturnName(playerid, 1), text);
        LocalChatEx(playerid, 20.0, msg, COLOR_GREY);

        format(msg, sizeof(msg), "...%s ))", text[84]);
        LocalChatEx(playerid, 20.0, msg, COLOR_GREY);
    }
    else
    {
        format(msg, sizeof(msg), "(( [%i] {%s}%s{AFAFAF}: %s ))", playerid, PlayerData[playerid][pAdminDuty] ? ("FF9900") : ("AFAFAF"), ReturnName(playerid, 1), text);
        LocalChatEx(playerid, 20.0, msg, COLOR_GREY);
    }
    return 1;
}

CMD:re(playerid, params[])
{
    new
        string[128],
        text[128];

    if(sscanf(params, "s[128]", text))
        return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /re [mesaj]");

    switch(GetPVarInt(playerid, "lastPMer"))
    {
        case -1:
        {
            SendClientMessage(playerid, COLOR_WHITE, "** Sana son mesaj g�nderen ki�i sunucudan ayr�ld��� i�in mesaj g�nderilemedi.");
            return 1;
        }
        case -2:
        {
            SendClientMessage(playerid, COLOR_WHITE, "** Sunucuya giri� yapt���ndan beri sana kimse mesaj g�ndermemi�.");
            return 1;
        }
        default:
        {
            format(string, sizeof(string), "%i %s", GetPVarInt(playerid, "lastPMer"), text);
            cmd_pm(playerid, string);
            return 1;
        }
    }
    return 1;
}

CMD:pm(playerid, params[])
{
    new
        id,
        text[128],
        name_colorA[60],
        name_colorB[60];

    if(sscanf(params, "us[128]", id, text)) return SendUsageMessage(playerid, "/pm [oyuncu ID/isim] [mesaj]");
    if(playerid == id) return SendErrorMessage(playerid, "Kendine PM atamazs�n.");
    if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirtti�iniz oyuncu oyunda yok.");
    if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirtti�iniz oyuncu hen�z �ifresini girmemi�.");
    if(PlayerData[id][PmOFF]) return SendErrorMessage(playerid, "Belirtti�iniz oyuncu PM kanal�n� herkese kapatm��.");

    if(PlayerData[playerid][pAdminDuty]) format(name_colorA, 60, "{FF9900}%s", ReturnName(playerid));
    else format(name_colorA, 60, "%s", ReturnName(playerid));

    if(PlayerData[id][pAdminDuty]) format(name_colorB, 60, "{FF9900}%s", ReturnName(id));
    else format(name_colorB, 60, "%s", ReturnName(id));

    foreach(new i : Player) if(SpectateID[i] == playerid)
    {
        if(strlen(text) > 75)
        {
            SendClientMessageEx(i, COLOR_ADM, "[PM] %s[%i] -> %s[%i]: %.75s...", ReturnName(playerid), playerid, ReturnName(id), id, text);
            SendClientMessageEx(i, COLOR_ADM, "...%s", text[75]);
        }
        else SendClientMessageEx(i, COLOR_ADM, "[PM] %s[%i] -> %s[%i]: %s", ReturnName(playerid), playerid, ReturnName(id), id, text);
    }

    if(strlen(text) > 75)
    {
        SendClientMessageEx(playerid, COLOR_PMSEN, "(( [PM] %s{EEE854}(ID: %i): %.75s... ))", name_colorB, id, text);
        SendClientMessageEx(playerid, COLOR_PMSEN, "(( [PM] %s{EEE854}(ID: %i): ...%s ))", name_colorB, id, text[75]);

        SendClientMessageEx(id, COLOR_PMREC, "(( [PM] %s{FFDC18}(ID: %i): %.75s... ))", name_colorA, playerid, text);
        SendClientMessageEx(id, COLOR_PMREC, "(( [PM] %s{FFDC18}(ID: %i): ...%s ))", name_colorA, playerid, text[75]);
    }
    else
    {
        SendClientMessageEx(playerid, COLOR_PMSEN, "(( [PM] %s{EEE854}(ID: %i): %s ))", name_colorB, id, text);
        SendClientMessageEx(id, COLOR_PMREC, "(( [PM] %s{FFDC18}(ID: %i): %s ))", name_colorA, playerid, text);
    }

    LogPlayerAction(playerid, sprintf("[PM] %s -> %s: %s", ReturnName(playerid, 1), ReturnName(id, 1), text));
    SetPVarInt(id, "lastPMer", playerid);
    return 1;
}

CMD:ozellik(playerid, params[])
{
    if(isnull(params)) return SendUsageMessage(playerid, "/ozellik [i�erik]");
    if(strlen(params) > 128) return SendServerMessage(playerid, "��erik 128 karakterden fazla olamaz.");
    SendServerMessage(playerid, "D�� g�r�n���n� %s olarak g�ncelledin.", params);
    format(PlayerData[playerid][pAttributes], 128, "%s", params);
    return 1;
}

CMD:incele(playerid, params[])
{
    new id;
    if(sscanf(params, "u", id)) return SendUsageMessage(playerid, "/incele [oyuncu ID/ad�]");
    if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
    if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
    if(!GetDistanceBetweenPlayers(playerid, id, 4.5)) return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
    SendServerMessage(playerid, "%s isimli ki�inin d�� g�r�n��� inceliyorsun.", ReturnName(id));
    SetPlayerChatBubble(id, PlayerData[id][pAttributes], COLOR_EMOTE, 30.0, 2000);
    return 1;
}

CMD:mikrofon(playerid, params[])
{
    if(PlayerData[playerid][pBrutallyWounded]) return SendServerMessage(playerid, "�u anda bunu yapamazs�n.");
    if(isnull(params)) return SendUsageMessage(playerid, "/mikrofon [yaz�]");

    new
        str[128];

    if(strlen(params) > 84)
    {
        format(str, sizeof(str), "%s (mikrofon): %.84s", ReturnName(playerid, 0), params);
        LocalChat(playerid, 35.0, str, 0x99ee77FF);

        format(str, sizeof(str), "...%s", params[84]);
        LocalChat(playerid, 35.0, str, 0x99ee77FF);
    }
    else
    {
        format(str, sizeof(str), "%s (mikrofon): %s", ReturnName(playerid, 0), params);
        LocalChat(playerid, 35.0, str, 0x99ee77FF);
    }
    return 1;
}

CMD:s(playerid, params[])
{
    if(PlayerData[playerid][pBrutallyWounded]) return SendServerMessage(playerid, "�u anda bunu yapamazs�n.");
    if(isnull(params)) return SendUsageMessage(playerid, "/s(hout) [yaz�]");

    new
        str[128];

    if(strlen(params) > 84)
    {
        format(str, sizeof(str), "%s (ba��r�r): %.84s", ReturnName(playerid, 0), params);
        LocalChat(playerid, 25.0, str, COLOR_FADE1);

        format(str, sizeof(str), "...%s", params[84]);
        LocalChat(playerid, 25.0, str, COLOR_FADE1);
    }
    else
    {
        format(str, sizeof(str), "%s (ba��r�r): %s", ReturnName(playerid, 0), params);
        LocalChat(playerid, 25.0, str, COLOR_FADE1);
    }
    return 1;
}

CMD:l(playerid, params[]) return cmd_low(playerid, params);
CMD:low(playerid, params[])
{
    if(PlayerData[playerid][pBrutallyWounded] && PlayerData[playerid][pBrutallyWounded] != 1) return SendServerMessage(playerid, "�u anda bunu yapamazs�n.");
    if(isnull(params)) return SendUsageMessage(playerid, "/low [k�s�k ses]");

    new string[128];

    if(PlayerData[playerid][pPhoneline] != INVALID_PLAYER_ID && !PlayerData[playerid][pCalling])
    {
        new
            playerb = PlayerData[playerid][pPhoneline];

        if(strlen(params) > 99)
        {
            format (string, sizeof(string), "%s (telefon - k�s�k ses): %.99s...", ReturnName(playerid, 0), params);
            LocalChat(playerid, 3.0, string, COLOR_FADE1);

            if(!PlayerData[ playerb ][pLoudspeaker]) SendClientMessage(playerb, COLOR_YELLOW, string);
            else LocalChat(playerb, 4.0, string, COLOR_FADE1);

            format (string, sizeof(string), "%s (telefon - k�s�k ses): ... %s", ReturnName(playerid, 0), params[99]);
            LocalChat(playerid, 3.0, string, COLOR_FADE1);

            if(!PlayerData[ playerb ][pLoudspeaker]) SendClientMessage(playerb, COLOR_YELLOW, string);
            else LocalChat(playerb, 4.0, string, COLOR_FADE1);
        }
        else
        {
            format (string, sizeof(string), "%s (telefon - k�s�k ses): %s", ReturnName(playerid, 0), params);
            LocalChat(playerid, 3.0, string, COLOR_FADE1);

            if(!PlayerData[ playerb ][pLoudspeaker]) SendClientMessage(playerb, COLOR_YELLOW, string);
            else LocalChat(playerb, 4.0, string, COLOR_FADE1);
        }
    }
    else
    {
        if (strlen(params) > 99)
        {
            format (string, sizeof(string), "%s [k�s�k ses]: %.99s...", ReturnName(playerid, 0), params);
            LocalChat(playerid, 6.0, string, COLOR_FADE3);

            format (string, sizeof(string), "%s: ... %s", ReturnName(playerid, 0), params[99]);
            LocalChat(playerid, 6.0, string, COLOR_FADE3);
        }
        else
        {
            format (string, sizeof(string), "%s [k�s�k ses]: %s", ReturnName(playerid, 0), params);
            LocalChat(playerid, 6.0, string, COLOR_FADE3);
        }
    }

    if(GetPlayerTeam(playerid) == STATE_ALIVE && PlayerData[playerid][pPhoneline] == INVALID_PLAYER_ID && IsPlayerInAnyVehicle(playerid) && !PlayerData[playerid][pPlayingAnimation]) ReturnChatAnimation(playerid, params);
    return true;
}

CMD:w(playerid, params[]) return cmd_whisper(playerid, params);
CMD:whisper(playerid, params[])
{
    if(PlayerData[playerid][pBrutallyWounded]) return SendServerMessage(playerid, "�u anda bunu yapamazs�n.");

    new playerb, text[128];
    if(sscanf(params, "us[128]", playerb, text)) return SendUsageMessage(playerid, "/(w)hisper [oyuncu ID/isim] [yaz�]");
    if(playerid == playerb) return SendServerMessage(playerid, "Bu komutu kendi �st�nde kullanamazs�n.");
    if(!IsPlayerConnected(playerb)) return SendServerMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
    if(!pLoggedIn[playerb]) return SendServerMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
    if(!GetDistanceBetweenPlayers(playerid, playerb, 2.0)) return SendServerMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
    if(GetPlayerTeam(playerb) == STATE_DEAD) return SendUsageMessage(playerid, "�l� durumda olan birine f�s�ldayamazs�n.");

    foreach(new i : Player) if(SpectateID[i] == playerid)
    {
        if(strlen(text) > 75)
        {
            SendClientMessageEx(i, COLOR_ADM, "[W] %s[%i] -> %s[%i]: %.75s...", ReturnName(playerid), playerid, ReturnName(playerb), playerb, text);
            SendClientMessageEx(i, COLOR_ADM, "...%s", text[75]);
        }
        else SendClientMessageEx(i, COLOR_ADM, "[W] %s[%i] -> %s[%i]: %s", ReturnName(playerid), playerid, ReturnName(playerb), playerb, text);
    }

    if(strlen(text) > 84)
    {
        SendClientMessageEx(playerb, COLOR_YELLOW, "%s (f�s�ldar): %.84s", ReturnName(playerid, 0), text);
        SendClientMessageEx(playerb, COLOR_YELLOW, "...%s", text[84]);

        SendClientMessageEx(playerid, COLOR_YELLOW, "%s (f�s�ldad�n): %.84s", ReturnName(playerb, 0), text);
        SendClientMessageEx(playerid, COLOR_YELLOW, "...%s", text[84]);
    }
    else
    {
        SendClientMessageEx(playerb, COLOR_YELLOW, "%s (f�s�ldar): %s", ReturnName(playerid, 0), text);
        SendClientMessageEx(playerid, COLOR_YELLOW, "%s (f�s�ldad�n): %s", ReturnName(playerb, 0), text);
    }

    cmd_ame(playerid, "bir �eyler m�r�ldan�r.");
    return 1;
}

CMD:rcp(playerid, params[]) return cmd_cpsifirla(playerid, params);
CMD:cpsifirla(playerid, params[])
{
    if(PlayerData[playerid][pDrivingTest]) return SendServerMessage(playerid, "Ehliyet s�nav�ndayken bu komutu kullanamazs�n.");
    if(PlayerData[playerid][pTaxiDrivingTest]) return SendServerMessage(playerid, "Taksi s�nav�ndayken bu komutu kullanamazs�n.");
    if(PlayerData[playerid][pFishCheckpoint]) return PlayerData[playerid][pFishCheckpoint] = 0, DisablePlayerRaceCheckpoint(playerid);

    DisablePlayerCheckpoint(playerid);
    PlayerData[playerid][pCarCheckpoint] = 0;
    PlayerData[playerid][pCheckpoint] = -1;
    return true;
}

CMD:hasarlar(playerid, params[])
{
    static id;
    if(sscanf(params, "u", id)) return SendUsageMessage(playerid, "/hasarlar [oyuncu ID/isim]");
    if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
    if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");

    if(PlayerData[playerid][pAdminDuty])
    {
        Damages_Show(id, playerid, 1);
    }
    else
    {
        if(!GetDistanceBetweenPlayers(playerid, id, 4.5)) return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
        Damages_Show(id, playerid, 0);
    }
    return 1;
}

CMD:yardimet(playerid, params[])
{
    if(PlayerData[playerid][pBrutallyWounded]) return SendErrorMessage(playerid, "Bu komutu yaral�yken kullanamazs�n.");

    if (PlayerData[playerid][pHelpupTime] >= gettime()) return SendErrorMessage(playerid, "Birini kald�rabilmek i�in %d saniye bekle.", PlayerData[playerid][pHelpupTime] - gettime());

    new playerb;
    if(sscanf(params, "u", playerb))
        return SendUsageMessage(playerid, "/yardimet [oyuncu ID/isim]");
    if(playerb == playerid)
        return SendErrorMessage(playerid, "Kendine yard�m edemezsin.");
    if(!IsPlayerConnected(playerb))
        return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
    if(!pLoggedIn[playerb])
        return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
    if(!GetDistanceBetweenPlayers(playerid, playerb, 4.5))
        return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
    if(_has_player_reviving[playerid] == 1)
        return SendErrorMessage(playerid, "Zaten birine yard�m ediyorsun.");
    if(_has_player_reviver[playerb] != -1)
        return SendErrorMessage(playerid, "Yard�m etmek istedi�in ki�iyle ba�kas� ilgileniyor.");
    if(!PlayerData[playerb][pBrutallyWounded])
        return SendErrorMessage(playerid, "Yard�m etmek istedi�in ki�i yaral� de�il.");
    if(PlayerData[playerb][pBrutallyWounded] == 2)
        return SendErrorMessage(playerid, "Yard�m etmek istedi�in ki�i �lm��.");

    SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: Yerdeki ki�iye yard�m ediyorsun.");
    SendClientMessage(playerb, COLOR_DARKGREEN, "SERVER: Biri senin yerden kalkman i�in yard�m ediyor.");

    _has_player_reviving[playerid] = 1;
    _has_player_reviver[playerid] = playerb;
    _has_player_reviver[playerb] = playerid;

    TogglePlayerControllable(playerid, 0);
    PlayAnimation(playerid, "CAMERA", "CAMCRCH_CMON", 4.1, 0, 0, 0, 1, 0, 1);
    playerHelpSign[playerb] = CreateDynamic3DTextLabel("(( | ))\nYARDIM ED�L�YOR", COLOR_DARKGREEN, 0.0, 0.0, 0.0, 25.0);
     //Create3DTextLabel("(( | ))\nYARDIM ED�L�YOR", COLOR_DARKGREEN, 0.0, 0.0, 0.0, 25.0, 0, 1);
    Attach3DTextLabelToPlayer(playerHelpSign[playerb], playerb, -0.0, -0.0, -0.0);
    PlayerData[playerid][pHelpupTime] = gettime() + 600;

    playerHelpingPlayer[playerid] = true;
    playerHelpingTimer[playerid] = SetTimerEx("OnPlayerUp", 4500, true, "i", playerid);
    return 1;
}

CMD:r(playerid, params[])return cmd_radyo(playerid, params);
CMD:radyo(playerid, params[])
{
    if (!PlayerData[playerid][pHasRadio]) return SendServerMessage(playerid, "Radyon yok.");
    if(!PlayerData[playerid][pRadio][PlayerData[playerid][pMainSlot]]) return SendServerMessage(playerid, "Herhangi bir frekansta de�ilsin.");
    if(isnull(params)) return SendUsageMessage(playerid, "/r [yaz�]");

    new
        radioChan = PlayerData[playerid][pRadio][PlayerData[playerid][pMainSlot]];

    foreach (new i : Player)
    {
        for (new s=1; s < 5; s++)
        {
            if (PlayerData[i][pRadio][s] == radioChan && PlayerData[i][pHasRadio])
            {
                if (s != PlayerData[i][pMainSlot])
                {
                    switch(PlayerData[i][pRadio][s])
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", PlayerData[i][pRadio][s], GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", PlayerData[i][pRadio][s], GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", PlayerData[i][pRadio][s], GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                        }
                    }
                }
                else
                {
                    switch(PlayerData[i][pRadio][s])
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", PlayerData[i][pRadio][s], GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", PlayerData[i][pRadio][s], GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", PlayerData[i][pRadio][s], GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                        }
                    }
                }
            }
        }
    }

    new Float:posx, Float:posy, Float:posz;
    GetPlayerPos(playerid, posx,posy,posz);

    foreach(new i : Player)
    {
        if(i == playerid)
           continue;

        else if(IsPlayerInRangeOfPoint(i, 20.0, posx,posy,posz))
        {
            SendClientMessageEx(i, COLOR_WHITE, "(Radyo) %s: %s", ReturnName(playerid, 0), params);
        }
    }

    return 1;
}

CMD:rlow(playerid, params[])return cmd_radyo(playerid, params);
CMD:radiolow(playerid, params[])
{
    if (!PlayerData[playerid][pHasRadio]) return SendServerMessage(playerid, "Radyon yok.");
    if(!PlayerData[playerid][pRadio][PlayerData[playerid][pMainSlot]]) return SendServerMessage(playerid, "Herhangi bir frekansta de�ilsin.");
    if(isnull(params)) return SendUsageMessage(playerid, "/rlow [yaz�]");

    new radioChan = PlayerData[playerid][pRadio][PlayerData[playerid][pMainSlot]];

    foreach (new i : Player)
    {
        for (new s = 1 ; s < 5 ; s ++)
        {
            if (PlayerData[i][pRadio][s] == radioChan && PlayerData[i][pHasRadio])
            {
                if (s != PlayerData[i][pMainSlot])
                {
                    switch(PlayerData[i][pRadio][s])
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", PlayerData[i][pRadio][s], GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", PlayerData[i][pRadio][s], GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", PlayerData[i][pRadio][s], GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                        }
                    }
                }
                else
                {
                    switch(PlayerData[i][pRadio][s])
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(PlayerData[i][pRadio][s]), GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", PlayerData[i][pRadio][s], GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", PlayerData[i][pRadio][s], GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", PlayerData[i][pRadio][s], GetChannelSlot(i, radioChan), ReturnName(playerid, 0), params);
                        }
                    }
                }
            }
        }
    }

    new Float:posx, Float:posy, Float:posz;
    GetPlayerPos(playerid, posx,posy,posz);

    foreach(new i : Player)
    {
        if(i == playerid)
           continue;

        else if(IsPlayerInRangeOfPoint(i, 5.0, posx,posy,posz))
        {
            SendClientMessageEx(i, COLOR_WHITE, "(Radyo) %s: %s", ReturnName(playerid, 0), params);
        }
    }
    return 1;
}

CMD:r1(playerid, params[])
{
    if (!PlayerData[playerid][pHasRadio]) return SendServerMessage(playerid, "Radyon yok.");
    if(!PlayerData[playerid][pRadio][1]) return SendServerMessage(playerid, "Herhangi bir frekansta de�ilsin.");
    if(isnull(params)) return SendUsageMessage(playerid, "/r1 [radyo yaz�s�]");

    new
        chan = PlayerData[playerid][pRadio][1];

    foreach(new i : Player)
    {
        for(new r = 0; r < 5; r++)
        {
            if(PlayerData[i][pRadio][r] == PlayerData[playerid][pRadio][1] && PlayerData[i][pHasRadio])
            {
                if(r != PlayerData[i][pMainSlot])
                {
                    switch(chan)
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                    }
                }
                else
                {
                    switch(chan)
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                    }
                }
            }
        }
    }

    new
        Float: posx,
        Float: posy,
        Float: posz;

    GetPlayerPos(playerid, posx, posy, posz);

    foreach(new i : Player)
    {
        if(i == playerid)
           continue;

        else if(IsPlayerInRangeOfPoint(i, 20.0, posx, posy, posz))
        {
            SendClientMessageEx(i, COLOR_WHITE, "(Radyo) %s: %s", ReturnName(playerid, 0), params);
        }
    }
    return 1;
}

CMD:r1low(playerid, params[])
{
    if (!PlayerData[playerid][pHasRadio]) return SendServerMessage(playerid, "Radyon yok.");
    if(!PlayerData[playerid][pRadio][1]) return SendServerMessage(playerid, "Herhangi bir frekansta de�ilsin.");
    if(isnull(params)) return SendUsageMessage(playerid, "/r1low [radyo yaz�s�]");

    new
        chan = PlayerData[playerid][pRadio][1];

    foreach(new i : Player)
    {
        for(new r = 0; r < 5; r++)
        {
            if(PlayerData[i][pRadio][r] == chan && PlayerData[i][pHasRadio])
            {
                if(r != PlayerData[i][pMainSlot])
                {
                    switch(chan)
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                    }
                }
                else
                {
                    switch(chan)
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                    }
                }
            }
        }
    }

    new
        Float: posx,
        Float: posy,
        Float: posz;

    GetPlayerPos(playerid, posx, posy, posz);

    foreach(new i : Player)
    {
        if(i == playerid)
           continue;

        else if(IsPlayerInRangeOfPoint(i, 5.0, posx, posy, posz))
        {
            SendClientMessageEx(i, COLOR_WHITE, "(Radyo) %s [k�s�k ses]: %s", ReturnName(playerid, 0), params);
        }
    }
    return 1;
}

CMD:r2(playerid, params[])
{
    if (!PlayerData[playerid][pHasRadio]) return SendServerMessage(playerid, "Radyon yok.");
    if(!PlayerData[playerid][pRadio][2]) return SendServerMessage(playerid, "Herhangi bir frekansta de�ilsin.");
    if(isnull(params)) return SendUsageMessage(playerid, "/r2 [radyo yaz�s�]");

    new
        chan = PlayerData[playerid][pRadio][2];

    foreach(new i : Player)
    {
        for(new r = 0; r < 5; r++)
        {
            if(PlayerData[i][pRadio][r] == chan && PlayerData[i][pHasRadio])
            {
                if(r != PlayerData[i][pMainSlot])
                {
                    switch(chan)
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                    }
                }
                else
                {
                    switch(chan)
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                    }
                }
            }
        }
    }

    new
        Float: posx,
        Float: posy,
        Float: posz;

    GetPlayerPos(playerid, posx, posy, posz);

    foreach(new i : Player)
    {
        if(i == playerid)
           continue;

        else if(IsPlayerInRangeOfPoint(i, 20.0, posx, posy, posz))
        {
            SendClientMessageEx(i, COLOR_WHITE, "(Radyo) %s: %s", ReturnName(playerid, 0), params);
        }
    }
    return 1;
}

CMD:r2low(playerid, params[])
{
    if (!PlayerData[playerid][pHasRadio]) return SendServerMessage(playerid, "Radyon yok.");
    if(!PlayerData[playerid][pRadio][2]) return SendServerMessage(playerid, "Herhangi bir frekansta de�ilsin.");
    if(isnull(params)) return SendUsageMessage(playerid, "/r2low [radyo yaz�s�]");

    new
        chan = PlayerData[playerid][pRadio][2];

    foreach(new i : Player)
    {
        for(new r = 0; r < 5; r++)
        {
            if(PlayerData[i][pRadio][r] == chan && PlayerData[i][pHasRadio])
            {
                if(r != PlayerData[i][pMainSlot])
                {
                    switch(chan)
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                    }
                }
                else
                {
                    switch(chan)
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                    }
                }
            }
        }
    }

    new
        Float: posx,
        Float: posy,
        Float: posz;

    GetPlayerPos(playerid, posx, posy, posz);

    foreach(new i : Player)
    {
        if(i == playerid)
           continue;

        else if(IsPlayerInRangeOfPoint(i, 5.0, posx, posy, posz))
        {
            SendClientMessageEx(i, COLOR_WHITE, "(Radyo) %s [k�s�k ses]: %s", ReturnName(playerid, 0), params);
        }
    }
    return 1;
}

CMD:r3(playerid, params[])
{
    if (!PlayerData[playerid][pHasRadio]) return SendServerMessage(playerid, "Radyon yok.");
    if(!PlayerData[playerid][pRadio][3]) return SendServerMessage(playerid, "Herhangi bir frekansta de�ilsin.");
    if(isnull(params)) return SendUsageMessage(playerid, "/r3 [radyo yaz�s�]");

    new
        chan = PlayerData[playerid][pRadio][3];

    foreach(new i : Player)
    {
        for(new r = 0; r < 5; r++)
        {
            if(PlayerData[i][pRadio][r] == chan && PlayerData[i][pHasRadio])
            {
                if(r != PlayerData[i][pMainSlot])
                {
                    switch(chan)
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                    }
                }
                else
                {
                    switch(chan)
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                    }
                }
            }
        }
    }

    new
        Float: posx,
        Float: posy,
        Float: posz;

    GetPlayerPos(playerid, posx, posy, posz);

    foreach(new i : Player)
    {
        if(i == playerid)
           continue;

        else if(IsPlayerInRangeOfPoint(i, 20.0, posx, posy, posz))
        {
            SendClientMessageEx(i, COLOR_WHITE, "(Radyo) %s: %s", ReturnName(playerid, 0), params);
        }
    }
    return 1;
}

CMD:r3low(playerid, params[])
{
    if (!PlayerData[playerid][pHasRadio]) return SendServerMessage(playerid, "Radyon yok.");
    if(!PlayerData[playerid][pRadio][3]) return SendServerMessage(playerid, "Herhangi bir frekansta de�ilsin.");
    if(isnull(params)) return SendUsageMessage(playerid, "/r3low [radyo yaz�s�]");

    new
        chan = PlayerData[playerid][pRadio][3];

    foreach(new i : Player)
    {
        for(new r = 0; r < 5; r++)
        {
            if(PlayerData[i][pRadio][r] == chan && PlayerData[i][pHasRadio])
            {
                if(r != PlayerData[i][pMainSlot])
                {
                    switch(chan)
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                    }
                }
                else
                {
                    switch(chan)
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                    }
                }
            }
        }
    }

    new
        Float: posx,
        Float: posy,
        Float: posz;

    GetPlayerPos(playerid, posx, posy, posz);

    foreach(new i : Player)
    {
        if(i == playerid)
           continue;

        else if(IsPlayerInRangeOfPoint(i, 5.0, posx, posy, posz))
        {
            SendClientMessageEx(i, COLOR_WHITE, "(Radyo) %s [k�s�k ses]: %s", ReturnName(playerid, 0), params);
        }
    }
    return 1;
}

CMD:r4(playerid, params[])
{
    if (!PlayerData[playerid][pHasRadio]) return SendServerMessage(playerid, "Radyon yok.");
    if(!PlayerData[playerid][pRadio][4]) return SendServerMessage(playerid, "Herhangi bir frekansta de�ilsin.");
    if(isnull(params)) return SendUsageMessage(playerid, "/r4 [radyo yaz�s�]");

    new
        chan = PlayerData[playerid][pRadio][4];

    foreach(new i : Player)
    {
        for(new r = 0; r < 5; r++)
        {
            if(PlayerData[i][pRadio][r] == chan && PlayerData[i][pHasRadio])
            {
                if(r != PlayerData[i][pMainSlot])
                {
                    switch(chan)
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                    }
                }
                else
                {
                    switch(chan)
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                    }
                }
            }
        }
    }

    new
        Float: posx,
        Float: posy,
        Float: posz;

    GetPlayerPos(playerid, posx, posy, posz);

    foreach(new i : Player)
    {
        if(i == playerid)
           continue;

        else if(IsPlayerInRangeOfPoint(i, 20.0, posx, posy, posz))
        {
            SendClientMessageEx(i, COLOR_WHITE, "(Radyo) %s: %s", ReturnName(playerid, 0), params);
        }
    }
    return 1;
}

CMD:r4low(playerid, params[])
{
    if (!PlayerData[playerid][pHasRadio]) return SendServerMessage(playerid, "Radyon yok.");
    if(!PlayerData[playerid][pRadio][4]) return SendServerMessage(playerid, "Herhangi bir frekansta de�ilsin.");
    if(isnull(params)) return SendUsageMessage(playerid, "/r4low [radyo yaz�s�]");

    new
        chan = PlayerData[playerid][pRadio][4];

    foreach(new i : Player)
    {
        for(new r = 0; r < 5; r++)
        {
            if(PlayerData[i][pRadio][r] == chan && PlayerData[i][pHasRadio])
            {
                if(r != PlayerData[i][pMainSlot])
                {
                    switch(chan)
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                    }
                }
                else
                {
                    switch(chan)
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                    }
                }
            }
        }
    }

    new
        Float: posx,
        Float: posy,
        Float: posz;

    GetPlayerPos(playerid, posx, posy, posz);

    foreach(new i : Player)
    {
        if(i == playerid)
           continue;

        else if(IsPlayerInRangeOfPoint(i, 5.0, posx, posy, posz))
        {
            SendClientMessageEx(i, COLOR_WHITE, "(Radyo) %s [k�s�k ses]: %s", ReturnName(playerid, 0), params);
        }
    }
    return 1;
}

CMD:r5(playerid, params[])
{
    if (!PlayerData[playerid][pHasRadio]) return SendServerMessage(playerid, "Radyon yok.");
    if(!PlayerData[playerid][pRadio][5]) return SendServerMessage(playerid, "Herhangi bir frekansta de�ilsin.");
    if(isnull(params)) return SendUsageMessage(playerid, "/r5 [radyo yaz�s�]");

    new
        chan = PlayerData[playerid][pRadio][5];

    foreach(new i : Player)
    {
        for(new r = 0; r < 5; r++)
        {
            if(PlayerData[i][pRadio][r] == chan && PlayerData[i][pHasRadio])
            {
                if(r != PlayerData[i][pMainSlot])
                {
                    switch(chan)
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                    }
                }
                else
                {
                    switch(chan)
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                    }
                }
            }
        }
    }

    new
        Float: posx,
        Float: posy,
        Float: posz;

    GetPlayerPos(playerid, posx, posy, posz);

    foreach(new i : Player)
    {
        if(i == playerid)
           continue;

        else if(IsPlayerInRangeOfPoint(i, 20.0, posx, posy, posz))
        {
            SendClientMessageEx(i, COLOR_WHITE, "(Radyo) %s: %s", ReturnName(playerid, 0), params);
        }
    }
    return 1;
}

CMD:r5low(playerid, params[])
{
    if (!PlayerData[playerid][pHasRadio]) return SendServerMessage(playerid, "Radyon yok.");
    if(!PlayerData[playerid][pRadio][5]) return SendServerMessage(playerid, "Herhangi bir frekansta de�ilsin.");
    if(isnull(params)) return SendUsageMessage(playerid, "/r5low [radyo yaz�s�]");

    new
        chan = PlayerData[playerid][pRadio][5];

    foreach(new i : Player)
    {
        for(new r = 0; r < 5; r++)
        {
            if(PlayerData[i][pRadio][r] == chan && PlayerData[i][pHasRadio])
            {
                if(r != PlayerData[i][pMainSlot])
                {
                    switch(chan)
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                    }
                }
                else
                {
                    switch(chan)
                    {
                        case 912, 914, 991:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        case 913, 992:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %.75s...", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: ...%s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_SPLX, "**[CH: %s, S: %d] %s: %s", ReturnChannelName(chan), GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                        default:
                        {
                            if(strlen(params) > 75)
                            {
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %.75s...", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                                SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: ...%s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params[75]);
                            }
                            else SendClientMessageEx(i, COLOR_RADIO, "**[CH: %d, S: %d] %s: %s", chan, GetChannelSlot(i, chan), ReturnName(playerid, 0), params);
                        }
                    }
                }
            }
        }
    }

    new
        Float: posx,
        Float: posy,
        Float: posz;

    GetPlayerPos(playerid, posx, posy, posz);

    foreach(new i : Player)
    {
        if(i == playerid)
           continue;

        else if(IsPlayerInRangeOfPoint(i, 5.0, posx, posy, posz))
        {
            SendClientMessageEx(i, COLOR_WHITE, "(Radyo) %s [k�s�k ses]: %s", ReturnName(playerid, 0), params);
        }
    }
    return 1;
}

CMD:slotsifirla(playerid, params[])
{
    if (!PlayerData[playerid][pHasRadio]) return SendServerMessage(playerid, "Radyon yok.");
    static slotid;
    if(sscanf(params, "d", slotid)) return SendUsageMessage(playerid, "/slotsifirla [slot(1-5)]");
    if(slotid < 1 || slotid > 5) return SendServerMessage(playerid, "Girebilece�iniz slot miktar� en az 1 en fazla 5 olabilir.");
    SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Radyonu #%d numaral� slotundan ��kard�n!", slotid);
    PlayerData[playerid][pRadioSlot][slotid] = 0;
    PlayerData[playerid][pRadio][slotid] = 0;
    return 1;
}

CMD:slotayarla(playerid, params[])
{
    if (!PlayerData[playerid][pHasRadio]) return SendServerMessage(playerid, "Radyon yok.");
    static slotid;
    if(sscanf(params, "d", slotid)) return SendUsageMessage(playerid, "/slotayarla [slot(1-5)]");
    if(slotid < 1 || slotid > 5) return SendServerMessage(playerid, "Girebilece�iniz slot miktar� en az 1 en fazla 5 olabilir.");
    SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Radyonun slotunu %d olarak ayarlad�n!", slotid);
    PlayerData[playerid][pMainSlot] = slotid;
    return 1;
}

CMD:frekans(playerid, params[])
{
    if (!PlayerData[playerid][pHasRadio]) return SendErrorMessage(playerid, "Radyon yok.");

    new channel, slotid, query[90];
    if(sscanf(params, "dd", channel, slotid)) return SendUsageMessage(playerid, "/frekans [frekans] [slot(1-5)]");
    if(channel < 1 || channel > 1000000) return SendErrorMessage(playerid, "Girebilece�iniz frekans en az 1 en fazla 1000000 olabilir.");
    if(slotid < 1 || slotid > 5) return SendServerMessage(playerid, "Girebilece�iniz slot miktar� en az 1 en fazla 5 olabilir.");
    if(channel > 900 && channel < 1000 && (!IsPoliceFaction(playerid) && !IsMedicFaction(playerid) && !IsLAWFaction(playerid))) return SendErrorMessage(playerid, "Bu frekansa ba�lanamazs�n�z.");

    for(new i = 0; i < 5; i++)
    {
        if(PlayerData[playerid][pRadio][i] == channel)
        {
            SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Slotlar�ndan bir tanesi zaten bu frekansa ba�l�.");
            return 1;
        }
    }

    if(channel == 911 || channel == 1488 || channel == 1330 || channel == 1335 || channel == 1340 || channel == 1499 || channel == 1450 || channel == 1225 || channel == 1230)
    {
        if(!FactionData[PlayerData[playerid][pFaction]][FactionCopPerms])
            return SendErrorMessage(playerid, "Bu frekans�n herkes taraf�ndan kullan�m� yasakt�r.");

        PlayerData[playerid][pRadio][slotid] = channel;
        PlayerData[playerid][pRadioSlot][slotid] = channel;

        SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i kanal�n�n %i slotunu dinliyorsun.", channel, slotid);

        mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET Radio%d = %i WHERE id = %i", slotid, PlayerData[playerid][pRadio][slotid], PlayerData[playerid][pSQLID]);
        mysql_tquery(m_Handle, query);

        mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET Slot%d = %i WHERE id = %i", slotid, PlayerData[playerid][pRadioSlot][slotid], PlayerData[playerid][pSQLID]);
        mysql_tquery(m_Handle, query);
    }
    else
    {
        PlayerData[playerid][pRadio][slotid] = channel;
        PlayerData[playerid][pRadioSlot][slotid] = channel;

        SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %i kanal�n�n %d slotunu dinliyorsun.", channel, slotid);

        mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET Radio%d = %i WHERE id = %i", slotid, PlayerData[playerid][pRadio][slotid], PlayerData[playerid][pSQLID]);
        mysql_tquery(m_Handle, query);

        mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET Slot%d = %i WHERE id = %i", slotid, PlayerData[playerid][pRadioSlot][slotid], PlayerData[playerid][pSQLID]);
        mysql_tquery(m_Handle, query);

    }
    return 1;
}

CMD:radyoyardim(playerid, params[])
{
    SendClientMessage(playerid, COLOR_DARKGREEN, "|__________________Radyo Yard�m_________________|");
    SendClientMessage(playerid, COLOR_YELLOW, "�PUCU: 7/24 Marketlerden radyo alabilirsin!");
    SendClientMessage(playerid, COLOR_WHITE, "/frekans - Radyonun frekans�n� ayarlar.");
    SendClientMessage(playerid, COLOR_WHITE, "/slotayarla - Radyonun slotunu ayarlar.");
    SendClientMessage(playerid, COLOR_WHITE, "/r - Frekanstan konu�man� sa�lar. {FFFF00}�PUCU: Slotlar i�in /r2, /r3, /r4, /r5 kullanabilirsin.");
    SendClientMessage(playerid, COLOR_WHITE, "/slotsifirla [slot id] - Radyonu ba�lad���n slotlar� s�f�rlar.");
//  SendClientMessageEx(playerid, COLOR_WHITE, "Mevcut Slotlar�n: {33AA33}[Slot 1: %d][Slot 2: %d][Slot 3: %d][Slot 4: %d][Slot 5: %d]", slot1, slot2, slot3, slot4, slot5);
    return 1;
}

CMD:ustara(playerid, params[])
{
    static
        id;

    if(sscanf(params, "u", id)) return SendUsageMessage(playerid, "/ustara [oyuncu ID/isim]");
    if(playerid == id) return SendServerMessage(playerid, "Kendi �st�n� arayamazs�n.");
    if(!IsPlayerConnected(id)) return SendServerMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
    if(!pLoggedIn[id]) return SendServerMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
    if(!GetDistanceBetweenPlayers(playerid, id, 4.5)) return SendServerMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");

    if(GetPlayerSpecialAction(id) == SPECIAL_ACTION_HANDSUP)
    {
        SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s %s isimli ki�inin �st�n� arar.", ReturnName(playerid, 0), ReturnName(id, 0));
        Frisk_ReturnData(playerid, id);
    }
    else
    {
        if(PlayerData[playerid][pFrisking] == id && PlayerData[playerid][pAllowedFrisk] == id)
        {
            SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s %s isimli ki�inin �st�n� arar.", ReturnName(playerid, 0), ReturnName(id, 0));
            Frisk_ReturnData(playerid, id);

            PlayerData[playerid][pAllowedFrisk] = -1;
            PlayerData[playerid][pFrisking] = -1;
            PlayerData[id][pFriskRequest] = -1;
        }
        else
        {
            SendClientMessageEx(id, COLOR_YELLOW, "SERVER: %s �st�n� aramaya �al��t�. Seni aramas� i�in /kabul ustarama %d yazman gerekiyor.", ReturnName(playerid, 0), playerid);
            SendClientMessage(playerid, COLOR_ADM, "SERVER: Ki�inin �st�n� arayabilmen i�in �st aramas�n� kabul etmesi gerekiyor.");

            PlayerData[playerid][pFrisking] = id;
            PlayerData[id][pFriskRequest] = playerid;
        }
    }

    return true;
}

CMD:tokalas(playerid, params[])
{
    static
         id,
         greet;

    if(sscanf(params, "ui", id, greet)) return SendUsageMessage(playerid, "/tokalas [oyuncu ID/isim] [(1-6)]");
    if(playerid == id) return SendServerMessage(playerid, "Bu komutu kendi �st�nde kullanamazs�n.");
    if(!IsPlayerConnected(id))  return SendServerMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
    if(!pLoggedIn[id]) return SendServerMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
    if(!GetDistanceBetweenPlayers(playerid, id, 4.5)) return SendServerMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
    if(GetPlayerTeam(id) != STATE_ALIVE) return SendServerMessage(playerid, "�l� durumda olan biriyle tokala�amazs�n.");

    PlayerData[id][pGreetType] = greet;
    PlayerData[id][pGreetRequest] = playerid;

    SendClientMessageEx(id, COLOR_YELLOW, "SERVER: %s seninle tokala�mak istiyor. Cevaplamak i�in /kabul tokalasma %i yazman yeterli.", ReturnName(playerid, 0), playerid);
    SendClientMessageEx(playerid, COLOR_ADM, "SERVER: %s isimli oyuncuya tokala�ma iste�in g�nderildi.", ReturnName(id, 0));
    return 1;
}

CMD:kabul(playerid, params[])
{
    new
        option[11], id;

    if(sscanf(params, "s[11]I(-1)", option, id))
    {
        SendClientMessage(playerid, COLOR_ACTION, "____________________________________________________");
        SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /kabul [eylem]");
        SendClientMessage(playerid, COLOR_ACTION, "[Eylem] ustarama, tokalasma, yayin");
        SendClientMessage(playerid, COLOR_ACTION, "____________________________________________________");
        return 1;
    }

    if(!strcmp(option, "ustarama"))
    {
        if(id == -1) return SendUsageMessage(playerid, "/kabul ustarama [oyuncu ID/isim]");
        if(playerid == id) return SendServerMessage(playerid, "Bu komutu kendi �st�nde kullanamazs�n.");
        if(!IsPlayerConnected(id)) return SendServerMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
        if(!pLoggedIn[id]) return SendServerMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
        if(!GetDistanceBetweenPlayers(playerid, id, 4.5)) return SendServerMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
        if(PlayerData[playerid][pFriskRequest] != id) return SendServerMessage(playerid, "Belirtti�in ki�i sana �st arama iste�i g�ndermemi�.");

        SendClientMessageEx(id, COLOR_YELLOW, "SERVER: %s �st arama iste�ini kabul etti. Tekrardan /ustara %d yazarak arayabilirsin.", ReturnName(playerid, 0), playerid);
        SendClientMessageEx(playerid, COLOR_WHITE, "SERVER: %s isimli ki�inin �st arama iste�ini kabul ettin.", ReturnName(id, 0));

        PlayerData[id][pAllowedFrisk] = playerid;
        PlayerData[playerid][pFriskRequest] = -1;
        return 1;
    }
    else if(!strcmp(option, "yayin"))
    {
        if(id == -1) return SendUsageMessage(playerid, "/kabul yayin [oyuncu ID/isim]");
        if(playerid == id) return SendServerMessage(playerid, "Bu komutu kendi �st�nde kullanamazs�n.");
        if(!IsPlayerConnected(id)) return SendServerMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
        if(!pLoggedIn[id]) return SendServerMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
        if(!GetDistanceBetweenPlayers(playerid, id, 4.5)) return SendServerMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
        if(PlayerData[playerid][pLiveOffer] != id) return SendServerMessage(playerid, "Belirtti�in ki�i sana �st arama iste�i g�ndermemi�.");

        SendClientMessageEx(id, COLOR_YELLOW, "SERVER: %s canl� yay�n iste�ini kabul etti.", ReturnName(playerid, 0), playerid);
        SendClientMessageEx(playerid, COLOR_WHITE, "SERVER: %s isimli ki�inin canl� yay�n iste�ini kabul ettin.", ReturnName(id, 0));
        PlayerData[playerid][pLiveBroadcast] = id;
        PlayerData[playerid][pLiveOffer] = -1;
        return 1;
    }
    else if(!strcmp(option, "tokalasma"))
    {
        if(id == -1) return SendUsageMessage(playerid, "/kabul tokalasma [oyuncu ID/isim]");
        if(playerid == id) return SendServerMessage(playerid, "Bu komutu kendi �st�nde kullanamazs�n.");
        if(!IsPlayerConnected(id)) return SendServerMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
        if(!pLoggedIn[id]) return SendServerMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
        if(!GetDistanceBetweenPlayers(playerid, id, 4.5)) return SendServerMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
        if(PlayerData[playerid][pGreetRequest] != id) return SendServerMessage(playerid, "Belirtti�in ki�i sana tokala�ma iste�i g�ndermemi�.");

        switch(PlayerData[playerid][pGreetType])
        {
            case 1: PlayAnimation(playerid, "GANGS", "HNDSHKAA", 4.0, 0, 0, 0, 0, 0, 1), PlayAnimation(id, "GANGS", "HNDSHKAA", 4.0, 0, 0, 0, 0, 0, 1);
            case 2: PlayAnimation(playerid, "GANGS", "HNDSHKBA", 4.0, 0, 0, 0, 0, 0, 1), PlayAnimation(id, "GANGS", "HNDSHKBA", 4.0, 0, 0, 0, 0, 0, 1);
            case 3: PlayAnimation(playerid, "GANGS", "HNDSHKCA", 4.0, 0, 0, 0, 0, 0, 1), PlayAnimation(id, "GANGS", "HNDSHKCA", 4.0, 0, 0, 0, 0, 0, 1);
            case 4: PlayAnimation(playerid, "GANGS", "HNDSHKDA", 4.0, 0, 0, 0, 0, 0, 1), PlayAnimation(id, "GANGS", "HNDSHKDA", 4.0, 0, 0, 0, 0, 0, 1);
            case 5: PlayAnimation(playerid, "GANGS", "HNDSHKEA", 4.0, 0, 0, 0, 0, 0, 1), PlayAnimation(id, "GANGS", "HNDSHKEA", 4.0, 0, 0, 0, 0, 0, 1);
            case 6: PlayAnimation(playerid, "GANGS", "HNDSHKFA", 4.0, 0, 0, 0, 0, 0, 1), PlayAnimation(id, "GANGS", "HNDSHKFA", 4.0, 0, 0, 0, 0, 0, 1);
        }

        PlayerData[playerid][pGreetRequest] = -1;
        PlayerData[playerid][pGreetType] = -1;
        return 1;
    }
    return 1;
}

CMD:saat(playerid, params[])return cmd_zaman(playerid, params);
CMD:zaman(playerid, params[])
{
    cmd_ame(playerid, "saati kontrol eder.");

    new string[128];

    format(string, sizeof(string), "~g~|~w~%s~g~|", GetHour());
    GameTextForPlayer(playerid, string, 2000, 1);

    if(PlayerData[playerid][pAjailTime] > 0)
    {
        format(string, sizeof(string), "~g~|~w~%s~g~|~n~~w~Hapis Suresi: %s saniye", GetHour(), MoneyFormat(PlayerData[playerid][pAjailTime]));
        GameTextForPlayer(playerid, string, 2000, 1);
    }
    else if(PlayerData[playerid][pICJailTime] > 0)
    {
        format(string, sizeof(string), "~g~|~w~%s~g~|~n~~w~Hapis Suresi: %s saniye", GetHour(), MoneyFormat(PlayerData[playerid][pICJailTime]));
        GameTextForPlayer(playerid, string, 2000, 1);
    }
    return 1;
}

/*
CMD:dropgun(playerid, params[])
{
    new
        weapon_id;

    if(sscanf(params, "i", weapon_id))
        return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /dropgun [weapon id]");

    if(weapon_id == 0)
        return SendClientMessage(playerid, COLOR_ADM, "HATA: Invalid Weapon ID.");

    if(!Player_HasWeapon(playerid, weapon_id) || Player_HasWeapon(playerid, weapon_id) && IsSaveableWeapon(playerid, weapon_id))
        return SendClientMessage(playerid, COLOR_ADM, "SERVER: You don't have this weapon or can't drop it.");

    SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s dropped their %s.", ReturnName(playerid, 0), ReturnWeaponName(weapon_id));
    WriteLog("weapon_logs/drop_gun.txt", "[%s] %s dropped their %s. (Receive code: %i)", ReturnDate(), ReturnName(playerid, 1), ReturnWeaponName(weapon_id), ReturnWeaponReceiveType(playerid, weapon_id));

    TakePlayerWeapon(playerid, weapon_id);
    return 1;
}
*/

CMD:yedektelbirak(playerid, params[])
{
    if(!PlayerData[playerid][pHasBurner]) return SendErrorMessage(playerid, "Yedek telefonun yok.");

    if(MainPhone[playerid] == 1) return SendClientMessage(playerid, COLOR_ADM, "* �u anda yedek telefonunu kullan�yorsun. Yere b�rakmadan �nce de�i�tirmen gerek.");

    PlayerData[playerid][pHasBurner] = false;
    cmd_ame(playerid, "yedek telefonunu yere atar.");
    return 1;
}

CMD:yedektelefon(playerid, params[])
{
    if(!PlayerData[playerid][pHasBurner]) return SendErrorMessage(playerid, "Yedek telefonun yok.");
    if(PlayerData[playerid][pUsingBurner]) cmd_tkapat(playerid, "");

    PlayerData[playerid][pBurnerPhoneOff] = !PlayerData[playerid][pBurnerPhoneOff];
    SendClientMessageEx(playerid, COLOR_GREY, "[!] Yedek telefonunu %s.", PlayerData[playerid][pBurnerPhoneOff] ? "kapatt�n" : "a�t�n");
    cmd_ame(playerid, sprintf("telefonu %s.", PlayerData[playerid][pBurnerPhoneOff] ? "cebine atar" : "cebinden ��kar�r"));
    return 1;
}

CMD:telefondegistir(playerid, params[])
{
    if(!PlayerData[playerid][pHasBurner]) return SendErrorMessage(playerid, "Yedek telefonun yok.");

    MainPhone[playerid] = !MainPhone[playerid];
    SendClientMessageEx(playerid, COLOR_GREY, "[!] %s telefonuna ge�i� yapt�n.", MainPhone[playerid] != 0 ? "Yedek" : "Ana");
    return 1;
}

// burner check ekle
CMD:telefonpasla(playerid, params[])
{
    if(PlayerData[playerid][pPhoneline] == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Biriyle konu�muyorsun.");

    static playerb;
    if(sscanf(params, "u", playerb)) return SendClientMessage(playerid, COLOR_GREY, "KULLANIM: /telefonpasla [oyuncu ID/isim]");
    if(!IsPlayerConnected(playerb)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
    if(!pLoggedIn[playerb]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
    if(!GetDistanceBetweenPlayers(playerid, playerb, 5.0)) return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
    if(PlayerData[playerb][pCalling] == 2) return SendErrorMessage(playerid, "Telefon paslamak istedi�in ki�iyi biri ar�yor.");
    if(PlayerData[playerb][pPhoneline] != INVALID_PLAYER_ID) return SendErrorMessage(playerid, "Telefon paslamak istedi�in ki�i biriyle g�r���yor.");
    cmd_ame(playerid, sprintf("telefonunu %s adl� ki�iye verir.", ReturnName(playerb, 0)));

    PlayerData[playerb][pCalling] = 0;
    PlayerData[playerid][pCalling] = 0;
    PlayerData[playerb][pPhoneline] = PlayerData[playerid][pPhoneline];
    PlayerData[playerid][pPhoneline] = INVALID_PLAYER_ID;
    return 1;
}

CMD:ara(playerid, params[])
{
    if(PlayerData[playerid][pICJailed])
        return SendClientMessage(playerid, COLOR_ADM, "[-] Tutukland���n�zda telefonunuza el konuldu.");

    if(PlayerData[playerid][pPhoneOff])
        return SendClientMessage(playerid, COLOR_ADM, "SERVER: Telefonun kapal�yken bu komutu kullanamazs�n.");

    if(PlayerData[playerid][pHandcuffed])
        return SendClientMessage(playerid, COLOR_ADM, "SERVER: Kelep�eliyken bu komutu kullanamazs�n.");

    if(PlayerData[playerid][pPhoneline] != INVALID_PLAYER_ID)
        return SendClientMessage(playerid, COLOR_ADM, "SERVER: Zaten biriyle konu�uyorsun.");

    new
        display_str[128] = "",
        phone_number,
        player_b
    ;

    if(sscanf(params, "s[128]", params))
    {
        SendClientMessage(playerid, COLOR_GREY, "[ Bilinen numaralar ]");
        return SendClientMessage(playerid, COLOR_ADM, "Kullan�m: /ara [numara/kay�tl� isim]");
    }

    if(IsNumeric(params))
    {
        phone_number = strval(params);
        player_b = IsValidNumber(phone_number);

        if(player_b == playerid)
            return SendClientMessage(playerid, COLOR_ADM, "SERVER: Kendini arayamazs�n.");

        if (PlayerData[playerid][pUseGUI])
        {
            Phone_HideUI(playerid);
            Phone_ShowUI(playerid);
            PlayerTextDrawSetString(playerid, PhoneNotify[playerid], "Araniyor...");
            PlayerTextDrawHide(playerid, PhoneBtnMenu[playerid]);
        }

        cmd_ame(playerid, "telefondan bir numara �evirir.");
        PlayerPlaySound(playerid, 16001, 0.0, 0.0, 0.0);
        SetPlayerCellphoneAction(playerid, true);

        switch(phone_number)
        {
            case 911:
            {
                PlayerData[playerid][pPhoneline] = 999;
                PlayerData[playerid][pCalling] = 2;

                PlayerData[playerid][p911CallTimer][0] = SetTimerEx("CallingEmergencyServices", 2000, false, "i", playerid);
                return 1;
            }
            case TAXI_NUMBER:
            {
                PlayerData[playerid][pPhoneline] = TAXI_NUMBER;
                PlayerData[playerid][pCalling] = 2;

                TaxiCallTimer[playerid] = SetTimerEx("OnTaxiCall", 3000, false, "i", playerid);
                return 1;
            }
            case MECHANIC_NUMBER:
            {
                PlayerData[playerid][pPhoneline] = MECHANIC_NUMBER;
                PlayerData[playerid][pCalling] = 2;

                MechanicCallTimer[playerid] = SetTimerEx("OnMechanicCall", 3000, false, "i", playerid);
                return 1;
            }
            case 991:
            {
                PlayerData[playerid][pPhoneline] = 991;
                PlayerData[playerid][pCalling] = 2;

                SetPVarInt(playerid, "NonEmergencyCall", 1);
                phoneTimer[playerid] = SetTimerEx("OnNonEmergencyCall", 3000, false, "i", playerid);
                return 1;
            }
        }


        if(player_b != INVALID_PLAYER_ID)
        {
            PlayerData[playerid][pPhoneline] = player_b;
            PlayerData[playerid][pCalling] = 2;

            if(PlayerData[player_b][pPhoneline] != INVALID_PLAYER_ID)
                return phoneTimer[playerid] = SetTimerEx("OnBadPhoneCall", 2000, false, "ii", playerid, 1);

            if(MainPhone[player_b] == 0 && PlayerData[player_b][pPhoneOff])
                return phoneTimer[playerid] = SetTimerEx("OnBadPhoneCall", 2000, false, "ii", playerid, 2);

            if(MainPhone[player_b] == 1 && PlayerData[player_b][pBurnerPhoneOff])
                return phoneTimer[playerid] = SetTimerEx("OnBadPhoneCall", 2000, false, "ii", playerid, 2);

            PlayerData[player_b][pPhoneline] = playerid;
            PlayerData[player_b][pCalling] = 1;

            if (PlayerData[player_b][pPhoneSilent] == 0)
            {
                if (!PlayerData[player_b][pUseGUI])
                {
                    Phone_HideUI(player_b);
                    Phone_ShowUI(player_b);
                    CancelSelectTextDraw(player_b);
                    PlayerTextDrawSetString(player_b, PhoneNotify[player_b], "Biri_Ariyor!");
                    PlayerTextDrawHide(player_b, PhoneBtnMenu[player_b]);
                }
                phoneTimer[player_b] = SetTimerEx("TIMER_RingSound", 3000, true, "i", player_b);
                cmd_ame(player_b, "telefonu �al�yor.");
            } else {
                cmd_ame(player_b, "telefonu titriyor.");
            }

            for(new i = 1; i < MAX_PLAYER_CONTACTS; i++)
            {
                if(ContactsData[player_b][i][contactNumber] == ReturnPhoneNumber(playerid))
                {
                    format(display_str, 128, "[!] Telefonu a�mak i�in /tcevap komutunu kullan�n. %s taraf�ndan aran�yorsunuz.", ContactsData[player_b][i][contactName]);
                }
            }

            if(isnull(display_str))
                format(display_str, 128, "[!] Telefonu a�mak i�in /tcevap komutunu kullan�n. %d taraf�ndan aran�yorsunuz.", PlayerData[playerid][pPhone]);

            SendClientMessage(player_b, COLOR_GREY, display_str);
        }
        else
        {
            PlayerData[playerid][pPhoneline] = playerid;
            PlayerData[playerid][pCalling] = 2;

            return phoneTimer[playerid] = SetTimerEx("OnBadPhoneCall", 2000, false, "ii", playerid, 2);
        }
    }
    else
    {
        if(!strcmp(params, "788-CALINTI-ARAC", true))
        {
            cmd_ame(playerid, "telefondan bir numara �evirir.");

            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
            PlayerPlaySound(playerid, 3600, 0.0, 0.0, 0.0);

            PlayerData[playerid][pPhoneline] = 789;
            PlayerData[playerid][pCalling] = 2;

            PlayerStolenCarTimer[playerid] = SetTimerEx("OnStolenCarCall", 2000, false, "i", playerid);
            return 1;
        }

        if(!strcmp(params, "1-800-BLBRD", true))
        {
            cmd_ame(playerid, "telefondan bir numara �evirir.");
            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
            PlayerPlaySound(playerid, 3600, 0.0, 0.0, 0.0);

            PlayerData[playerid][pPhoneline] = 1800;
            PlayerData[playerid][pCalling] = 2;

            PlayerBillboardTimer[playerid] = SetTimerEx("OnBillboardRentCall", 2000, false, "i", playerid);
            return 1;
        }

        if(MainPhone[playerid] == 1)
            return SendClientMessage(playerid, COLOR_ADM, "* Yedek telefonunla rehberindeki ki�ileri arayamazs�n.");

        new
            bool: contact_found;

        for(new i = 1; i < MAX_PLAYER_CONTACTS; i++)
        {
            if(strfind(ContactsData[playerid][i][contactName], params, true) != -1)
            {
                contact_found = true;
                phone_number = ContactsData[playerid][i][contactNumber];
            }
        }

        if(!contact_found)
            return SendClientMessage(playerid, COLOR_GREY, "[!] Kay�tl� isim bulunamad�.");

        player_b = IsValidNumber(phone_number);

        if(player_b == playerid)
            return SendClientMessage(playerid, COLOR_ADM, "SERVER: Kendini arayamazs�n.");

        cmd_ame(playerid, "telefondan bir numara �evirir.");
        PlayerPlaySound(playerid, 16001, 0.0, 0.0, 0.0);
        SetPlayerCellphoneAction(playerid, true);

        if (PlayerData[playerid][pUseGUI]) {
            Phone_HideUI(playerid);
            Phone_ShowUI(playerid);
            PlayerTextDrawSetString(playerid, PhoneNotify[playerid], "Araniyor...");
            PlayerTextDrawHide(playerid, PhoneBtnMenu[playerid]);
        }

        if( player_b != INVALID_PLAYER_ID )
        {
            PlayerData[playerid][pPhoneline] = player_b;
            PlayerData[playerid][pCalling] = 2;

            if(PlayerData[player_b][pPhoneline] != INVALID_PLAYER_ID)
                return phoneTimer[playerid] = SetTimerEx("OnBadPhoneCall", 2000, false, "ii", playerid, 1);

            if(MainPhone[player_b] == 0 && PlayerData[player_b][pPhoneOff])
                return phoneTimer[playerid] = SetTimerEx("OnBadPhoneCall", 2000, false, "ii", playerid, 2);

            if(MainPhone[player_b] == 1 && PlayerData[player_b][pBurnerPhoneOff])
                return phoneTimer[playerid] = SetTimerEx("OnBadPhoneCall", 2000, false, "ii", playerid, 2);

            PlayerData[player_b][pPhoneline] = playerid;
            PlayerData[player_b][pCalling] = 1;

            if (PlayerData[player_b][pPhoneSilent] == 0)
            {
                if (!PlayerData[player_b][pUseGUI]) {
                    Phone_HideUI(player_b);
                    Phone_ShowUI(player_b);
                    CancelSelectTextDraw(player_b);
                    PlayerTextDrawSetString(player_b, PhoneNotify[player_b], "Biri_Ariyor!");
                    PlayerTextDrawHide(player_b, PhoneBtnMenu[player_b]);
                }
                phoneTimer[player_b] = SetTimerEx("TIMER_RingSound", 3000, true, "i", player_b);
                cmd_ame(player_b, "telefonu �al�yor.");
            } else {
                cmd_ame(player_b, "telefonu titriyor.");
            }

            for(new i = 1; i < MAX_PLAYER_CONTACTS; i++)
            {
                if(ContactsData[player_b][i][contactNumber] == ReturnPhoneNumber(playerid))
                {
                    format(display_str, 128, "[!] Telefonu a�mak i�in /tcevap komutunu kullan�n. %s taraf�ndan aran�yorsunuz.", ContactsData[player_b][i][contactName]);
                }
            }

            if(isnull(display_str))
                format(display_str, 128, "[!] Telefonu a�mak i�in /tcevap komutunu kullan�n. %d taraf�ndan aran�yorsunuz.", PlayerData[playerid][pPhone]);

            SendClientMessage(player_b, COLOR_GREY, display_str);
        }
        else
        {
            PlayerData[playerid][pPhoneline] = playerid;
            PlayerData[playerid][pCalling] = 2;

            return phoneTimer[playerid] = SetTimerEx("OnBadPhoneCall", 2000, false, "ii", playerid, 2);
        }
    }
    return 1;
}

CMD:sms(playerid, params[])
{
    new
        phone_number,
        player_b,
        text[128]
    ;

    if(PlayerData[playerid][pICJailed])
        return SendClientMessage(playerid, COLOR_ADM, "[-] Tutukland���n�zda telefonunuza el konuldu.");

    if(MainPhone[playerid] == 0 && PlayerData[playerid][pPhoneOff])
        return SendClientMessage(playerid, COLOR_ADM, "Telefonun kapal�yken bu komutu kullanamazs�n.");

    if(MainPhone[playerid] == 1 && PlayerData[playerid][pBurnerPhoneOff])
        return SendClientMessage(playerid, COLOR_ADM, "Telefonun kapal�yken bu komutu kullanamazs�n.");

    if(sscanf(params, "s[60]s[128]", params, text))
        return SendClientMessage(playerid, COLOR_ADM, "SERVER: /sms [telefon numaras� veya isim] [mesaj]");

    if( IsNumeric(params) )
    {
        phone_number = strval(params);
        player_b = IsValidNumber(phone_number);

        cmd_ame(playerid, "telefonu kullanarak mesaj g�nderir.");

        if(player_b == INVALID_PLAYER_ID)
        {
            SetTimerEx("OnFailedSMS", 3000, false, "i", playerid);
            return 1;
        }

        if(MainPhone[player_b] == 1 && PlayerData[player_b][pBurnerPhoneOff])
        {
            SetTimerEx("OnFailedSMS", 3000, false, "i", playerid);
            return 1;
        }

        if(MainPhone[player_b] == 0 && PlayerData[player_b][pPhoneOff])
        {
            SetTimerEx("OnFailedSMS", 3000, false, "i", playerid);
            return 1;
        }

        format(PlayerSMS[playerid], 128, "%s", text);
        SetTimerEx("SendSMSText", 3000, false, "ii", playerid, player_b);
        return 1;
    }
    else
    {
        if(MainPhone[playerid] == 1)
            return SendClientMessage(playerid, COLOR_ADM, "* Yedek telefonunla rehberindeki ki�ilere SMS atamazs�n.");

        new contactExists;

        for(new i = 1; i < MAX_PLAYER_CONTACTS; i++)
        {
            if(!strcmp(ContactsData[playerid][i][contactName], params, true))
            {
                contactExists = 1;
                phone_number = ContactsData[playerid][i][contactNumber];
            }
        }
        if(!contactExists) return SendClientMessage(playerid, COLOR_ADM, "[!] Kay�tl� isim bulunamad�.");

        player_b = IsValidNumber(phone_number);

        cmd_ame(playerid, "telefonu kullanarak mesaj g�nderir.");

        if(player_b == INVALID_PLAYER_ID)
        {
            SetTimerEx("OnFailedSMS", 3000, false, "i", playerid);
            return 1;
        }

        if(MainPhone[player_b] == 1 && PlayerData[player_b][pBurnerPhoneOff])
        {
            SetTimerEx("OnFailedSMS", 3000, false, "i", playerid);
            return 1;
        }

        if(MainPhone[player_b] == 0 && PlayerData[player_b][pPhoneOff])
        {
            SetTimerEx("OnFailedSMS", 3000, false, "i", playerid);
            return 1;
        }

        format(PlayerSMS[playerid], 128, "%s", text);
        SetTimerEx("SendSMSText", 3000, false, "ii", playerid, player_b);
    }
    return 1;
}

//

CMD:aractanat(playerid, params[])
{
    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendErrorMessage(playerid, "�of�r koltu�unda olman gerek.");

    static id;
    if(sscanf(params, "u", id)) return SendUsageMessage(playerid, "/aractanat [oyuncu ID/isim]");
    if(playerid == id) return SendErrorMessage(playerid, "Kendini ara�tan atamazs�n.");
    if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
    if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
    if(GetPlayerVehicleID(playerid) != GetPlayerVehicleID(id)) return SendErrorMessage(playerid, "Bu ki�i senin arac�n�n i�erisinde de�il.");
    LocalChat(playerid, 20.0, sprintf("* %s %s adl� ki�iyi ara�tan atar.", ReturnName(playerid, 0), ReturnName(id, 0)), COLOR_EMOTE);
    RemovePlayerFromVehicle(id);
    return 1;
}

CMD:satinal(playerid, params[])
{
		new biz = -1;

  	if((biz = IsPlayerInBusiness(playerid)) != -1)
    {
        if(BusinessData[biz][BusinessType] == BUSINESS_GENERAL || BusinessData[biz][BusinessType] == BUSINESS_STORE)
        {
            if(Pkr_GetPlayerGame(playerid) != -1) return SendErrorMessage(playerid, "Poker oynarken bu komutu kullanamazs�n.");
            if(GetPVarInt(playerid, "Viewing_FoodList")== 1) return SendErrorMessage(playerid, "Yemek listesine bakarken bu komutu kullanamazs�n.");
            if(GetPVarInt(playerid, "Viewing_StoreList") == 1) return SendErrorMessage(playerid, "�r�n listesine bakarken bu komutu kullanamazs�n.");
            if(GetPVarInt(playerid, "Viewing_OwnedCarList") == 1) return SendErrorMessage(playerid, "Ara� listene bakarken bu komutu kullanamazs�n.");


            Market_Show(playerid);
            SelectTextDraw(playerid, COLOR_DARKGREEN);
            return 1;
        }
    }

    if(IsLAWFaction(playerid))
    {
        if(!IsNearFactionSpawn(playerid)) return 1;
        Attachment_List(playerid);
        return 1;
    }

    SendClientMessage(playerid, COLOR_ADM, "SERVER: Yak�n�nda sat�n alabilece�in bir �ey bulunmuyor.");
    return 1;
}

CMD:olcar(playerid, params[])
{
	return SendMessage(playerid, "Son binilen ara�: %d", GetPVarInt(playerid, "lastVehicle"));
}

CMD:mouse(playerid, params[])
{
	if(GetPVarInt(playerid, "Viewing_FoodList")== 1)
	{
		SelectTextDraw(playerid, COLOR_DARKGREEN);
		return 1;
	}
	if(GetPVarInt(playerid, "Viewing_StoreList") == 1)
	{
		SelectTextDraw(playerid, COLOR_DARKGREEN);
		return 1;
	}
	if(GetPVarInt(playerid, "Viewing_OwnedCarList") == 1)
	{
		SelectTextDraw(playerid, COLOR_DARKGREEN);
		return 1;
	}
	SendErrorMessage(playerid, "Bu komutu �u anda kullanamazs�n.");
	return 1;
}
CMD:telsatinal(playerid, params[])
{
    new
        id,
        str[350];

    if((id = IsPlayerInBusiness(playerid)) != -1)
    {
        if(BusinessData[id][BusinessType] != BUSINESS_PAWNSHOP && BusinessData[id][BusinessType] != BUSINESS_GENERAL && BusinessData[id][BusinessType] != BUSINESS_STORE)
            return SendClientMessage(playerid, COLOR_ADM, "[!] Bu i�yeri yedek cep telefonu satm�yor.");

        if(PlayerData[playerid][pHasBurner]) return SendClientMessage(playerid, COLOR_ADM, "[!] Zaten yedek cep telefonuna sahipsin.");

        strcat(str, "{ADC3E7}Burner Telefon{FFFFFF}\n Burner telefonlar ge�ici olarak ge�en telefonlard�r. Pawn shop ve Genel ma�azalardan sat�n alabilirsin.\n");
        strcat(str, "Ki�iler burner telefonu arayabilir. Bu telefon i�erisinde rehber kullanamazs�n�z.\n");
        strcat(str, "Ald�ktan sonra /ara komutunu kullanabilirsin. /yedektelbirak komutu ile yok edebilirsin.\n");
        strcat(str, "{ADC3E7}�cret:{FFFFFF} $500");

        ConfirmDialog(playerid, "{ADC3E7}Burner Telefon", str, "OnBurnerPhone");
    }
    else return SendClientMessage(playerid, COLOR_ADM, "SERVER: ��yerinde de�ilsin.");
    return 1;
}

CMD:ssmod(playerid, params[])
{
	if (!PlayerData[playerid][pSSMod])
	{
		TextDrawShowForPlayer(playerid, blindfoldTextdraw);
		PlayerData[playerid][pSSMod] = true;
	}
	else
	{
		TextDrawHideForPlayer(playerid, blindfoldTextdraw);
		PlayerData[playerid][pSSMod] = false;
	}
	return 1;
}

CMD:gozbagla(playerid, params[])
{
    static playerb;
    if(sscanf(params, "U(-1)", playerb)) return 1;

    if(playerb == -1)
    {
        if (!PlayerData[playerid][pBlindFolded])
        {
            TextDrawShowForPlayer(playerid, blindfoldTextdraw);
            PlayerData[playerid][pBlindFolded] = true;
        }
        else
        {
            TextDrawHideForPlayer(playerid, blindfoldTextdraw);
            PlayerData[playerid][pBlindFolded] = false;
        }
    }
    else
    {
        if(!IsPlayerConnected(playerb)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
        if(!pLoggedIn[playerb]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
        if(!GetDistanceBetweenPlayers(playerid, playerb, 4.5)) return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
        if(GetPlayerSpecialAction(playerb) != SPECIAL_ACTION_HANDSUP && GetPlayerSpecialAction(playerb) != SPECIAL_ACTION_DUCK)
            return SendErrorMessage(playerid, "Belirtti�in ki�i ellerini kald�rmam�� ya da e�ilmemi� g�z�k�yor.");

        if(!PlayerData[playerb][pBlindFolded])
        {
            TextDrawShowForPlayer(playerb, blindfoldTextdraw);
            SendClientMessageEx(playerb, COLOR_YELLOW, "SERVER: %s senin g�zlerini ba�lad�. ", ReturnName(playerid, 0));
            SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %s adl� ki�inin g�zlerini ba�lad�n. ", ReturnName(playerb, 0));
            SetPlayerChatBubble(playerb, "(( G�zleri ba�land�. ))", COLOR_WHITE, 10.0, 2500);
            GameTextForPlayer(playerb, "~p~Gozun baglandi", 3000, 4);
            PlayerData[playerb][pBlindFolded] = true;
        }
        else
        {
            TextDrawHideForPlayer(playerb, blindfoldTextdraw);
            SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %s adl� ki�inin g�z ba��n� ��kartt�n. ", ReturnName(playerb, 0));
            SendClientMessageEx(playerb, COLOR_YELLOW, "SERVER: %s senin g�z ba��n� a�t�. ", ReturnName(playerid, 0));
            SetPlayerChatBubble(playerb, "(( G�z ba�� ��kart�ld�. ))", COLOR_WHITE, 10.0, 2500);
            GameTextForPlayer(playerb, "~p~Gozlerin Acildi", 3000, 4);
            PlayerData[playerb][pBlindFolded] = false;
        }
    }
    return 1;
}

CMD:paraver(playerid, params[])
{
    static playerb, pay_amount, emote[128];
    if(sscanf(params, "udS('None')[128]", playerb, pay_amount, emote)) return SendUsageMessage(playerid, "/paraver [oyuncu ID/isim] [miktar] [emote (opsiyonel)]");
    if(!IsPlayerConnected(playerb)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
    if(!pLoggedIn[playerb]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
    if(!GetDistanceBetweenPlayers(playerid, playerb, 4.5)) return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
    if(pay_amount < 1) return SendErrorMessage(playerid, "Ge�ersiz miktar girdin.");
    if(pay_amount > PlayerData[playerid][pMoney]) return SendErrorMessage(playerid, "Yetersiz miktar girdin.");
    if(playerb == playerid) return SendErrorMessage(playerid, "Kendine para veremezsin.");
    if(gettime() - _pay_security_timer[playerid] < 3) return SendErrorMessage(playerid, "Tekrar para vermeden �nce bekleyin.");
    if(PlayerData[playerid][pLevel] == 1 && pay_amount > 500) return SendErrorMessage(playerid, "Seviye bir oldu�undan dolay� tek seferde $500 verebilirsin.");

    SendClientMessageEx(playerid, COLOR_GREY, " %s adl� ki�iye $%s g�nderdin.", ReturnName(playerb, 0), MoneyFormat(pay_amount));
    PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);

    SendClientMessageEx(playerb, COLOR_GREY, " %s sana $%s g�nderdi.", ReturnName(playerid, 0), MoneyFormat(pay_amount));
    PlayerPlaySound(playerb, 1052, 0.0, 0.0, 0.0);

    if(strfind(emote, "None", true) != -1)
        SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s bir miktar para ��kart�r ve %s adl� ki�iye verir.", ReturnName(playerid, 0), ReturnName(playerb, 0));
    else
        SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s %s (( Para ))", ReturnName(playerid, 0), emote);

    _pay_security_timer[playerid] = gettime();

    if(PlayerData[playerid][pLevel] <= 3 && PlayerData[playerb][pLevel] <= 3 || pay_amount >= 50000)
        adminWarn(1, sprintf("%s adl� ki�i $%s miktar paray� %s adl� ki�iye verdi.", ReturnName(playerid, 1), MoneyFormat(pay_amount), ReturnName(playerb, 1)));

    GiveMoney(playerid, -pay_amount);
    GiveMoney(playerb, pay_amount);

    SaveSQLInt(PlayerData[playerid][pSQLID], "players", "Money", PlayerData[playerid][pMoney]);
    SaveSQLInt(PlayerData[playerb][pSQLID], "players", "Money", PlayerData[playerb][pMoney]);

    LogPlayerAction(playerid, sprintf("%s %s'e para verdi. (miktar: %i)", ReturnName(playerid, 1), ReturnName(playerb, 1), pay_amount));
    LogPlayerAction(playerid, sprintf("%s isimli ki�iye $%s verdi.", ReturnName(playerb, 1), MoneyFormat(pay_amount)));
    LogPlayerAction(playerb, sprintf("%s isimli ki�iden $%s ald�.", ReturnName(playerid, 1), MoneyFormat(pay_amount)));
    return true;
}

/*CMD:silahsatinal(playerid, params[])
{
    if(!pLoggedIn[playerid])return true;

    new weaponName[128], ammo, totalPrice, string[128], biz;

    if((biz = IsPlayerInBusiness(playerid)) == 0)
        return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} You can't do this right now.");

    if(BusinessData[biz][businessType] != BIZ_AMMUNATION)
        return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} You can't do that in here.");

    if(!PlayerData[playerid][pWeaponsLicense])
        return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} You don't have a weapons license.");

    if(sscanf(params, "s[128]i", weaponName, ammo)) {
        SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /silahsatinal [silah ad�] [mermi]");
        SendClientMessage(playerid, COLOR_GRAD2, "[ colt: $200; ammo: $25 ] [ deagle: $500; ammo: $38 ] [ shotgun: $900; ammo: $38 ]");
        SendClientMessage(playerid, COLOR_GRAD2, "[ rifle: $1,200; ammo: $100 ] [ parachute: $50; ammo: $1,250 ] [ armor: $400 ]");
        return true;
    }

    if(strmatch(weaponName, "colt")){
        if( ammo < 1 )return SendClientMessage(playerid, COLOR_ADM, "SERVER: Insufficient Ammo.");
        if( ammo > 100 )return SendClientMessage(playerid, COLOR_ADM, "HATA: Bir seferde 100 mermi alabilirsin.");
        if( PlayerData[playerid][pMoney] < 200 ) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bunu kar��layacak paran yok.");

        totalPrice = ammo * 25 + 200;
        if( PlayerData[playerid][pMoney] < totalPrice )return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bunu kar��layacak paran yok.");

        format(string, sizeof(string), "Are you sure you want to purchase a Colt 45 for $%s?", MoneyFormat(totalPrice));
        ConfirmDialog(playerid, "Confirmation", string, "OnPlayerPurchaseWeapon", WEAPON_COLT45, ammo, totalPrice);
    }
    else if(strmatch(weaponName, "deagle")){
        if( ammo < 1 )return SendClientMessage(playerid, COLOR_ADM, "SERVER: Insufficient Ammo.");
        if( ammo > 100 )return SendClientMessage(playerid, COLOR_ADM, "HATA: Bir seferde 100 mermi alabilirsin.");
        if( PlayerData[playerid][pMoney] < 500 ) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bunu kar��layacak paran yok.");

        totalPrice = ammo * 38 + 500;
        if( PlayerData[playerid][pMoney] < totalPrice )return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bunu kar��layacak paran yok.");

        format(string, sizeof(string), "Are you sure you want to purchase a Desert Eagle for $%s?", MoneyFormat(totalPrice));
        ConfirmDialog(playerid, "Confirmation", string, "OnPlayerPurchaseWeapon", WEAPON_DEAGLE, ammo, totalPrice);
    }
    else if(strmatch(weaponName, "shotgun")){
        if( ammo < 1 )return SendClientMessage(playerid, COLOR_ADM, "SERVER: Insufficient Ammo.");
        if( ammo > 100 )return SendClientMessage(playerid, COLOR_ADM, "HATA: Bir seferde 100 mermi alabilirsin.");
        if( PlayerData[playerid][pMoney] < 900 ) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bunu kar��layacak paran yok.");

        totalPrice = ammo * 38 + 900;
        if( PlayerData[playerid][pMoney] < totalPrice )return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bunu kar��layacak paran yok.");

        format(string, sizeof(string), "Are you sure you want to purchase a Shotgun for $%s?", MoneyFormat(totalPrice));
        ConfirmDialog(playerid, "Confirmation", string, "OnPlayerPurchaseWeapon", WEAPON_SHOTGUN, ammo, totalPrice);
    }
    else if(strmatch(weaponName, "rifle")){
        if( ammo < 1 )return SendClientMessage(playerid, COLOR_ADM, "SERVER: Insufficient Ammo.");
        if( ammo > 100 )return SendClientMessage(playerid, COLOR_ADM, "HATA: Bir seferde 100 mermi alabilirsin.");
        if( PlayerData[playerid][pMoney] < 1200 ) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bunu kar��layacak paran yok.");

        totalPrice = ammo * 100 + 1200;
        if( PlayerData[playerid][pMoney] < totalPrice )return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bunu kar��layacak paran yok.");

        format(string, sizeof(string), "Are you sure you want to purchase a Rifle for $%s?", MoneyFormat(totalPrice));
        ConfirmDialog(playerid, "Confirmation", string, "OnPlayerPurchaseWeapon", WEAPON_RIFLE, ammo, totalPrice);
    }
    else if(strmatch(weaponName, "parachute")){
        return SendClientMessage(playerid, COLOR_ADM, "This item is out of stock right now.");
    }
    else if(strmatch(weaponName, "armor")){
        if( PlayerData[playerid][pMoney] < 400 ) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bunu kar��layacak paran yok.");

        totalPrice = 400;
        ConfirmDialog(playerid, "Confirmation", "Are you sure you want to purchase Armor for $2,000?", "OnPlayerPurchaseArmor", totalPrice);
    }
    else return SendClientMessage(playerid, COLOR_ADM, "SERVER: Ge�ersiz Parametre.");

    return true;
}

CMD:mermisatinal(playerid, params[])
{
    if(!pLoggedIn[playerid])return true;

    new weaponName[128], ammo, totalPrice, string[128];

    new biz;
    if((biz = IsPlayerInBusiness(playerid)) == 0)
        return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} You can't do this right now.");

    if(BusinessData[biz][businessType] != BIZ_AMMUNATION)
        return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} You can't do that in here.");

    if(!PlayerData[playerid][pWeaponsLicense])return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} You don't have a weapons license.");
    if(sscanf(params, "s[128]i", weaponName, ammo)) {
        SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /buygun [weapon] [ammo]");
        SendClientMessage(playerid, COLOR_GRAD2, "[ colt: $25 ] [ deagle: $38 ] [ shotgun: $38 ] [ rifle: $100 ]");
        return true;
    }

    if(ammo < 1)
        return SendClientMessage(playerid, COLOR_ADM, "HATA: Ge�ersiz mermi de�eri.");

    if(ammo > 100)
        return SendClientMessage(playerid, COLOR_ADM, "HATA: Bir seferde 100 mermi alabilirsin.");

    if(strmatch(weaponName, "colt")){
        if(!Player_HasWeapon(playerid, WEAPON_COLT45))
            return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} Elinde bu silah yok.");

        totalPrice = 25 * ammo;

        if( PlayerData[playerid][pMoney] < totalPrice ) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bunu kar��layacak paran yok.");

        format(string, sizeof(string), "Are you sure you want to buy ammo for $%s?", MoneyFormat(totalPrice));
        ConfirmDialog(playerid, "Confirmation", string, "OnPlayerPurchaseAmmo", WEAPON_COLT45, ammo, totalPrice);
    }
    else if(strmatch(weaponName, "deagle")){
        if(!Player_HasWeapon(playerid, WEAPON_DEAGLE))
            return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} Elinde bu silah yok.");

        totalPrice = 38 * ammo;

        if( PlayerData[playerid][pMoney] < totalPrice ) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bunu kar��layacak paran yok.");

        format(string, sizeof(string), "Are you sure you want to buy ammo for $%s?", MoneyFormat(totalPrice));
        ConfirmDialog(playerid, "Confirmation", string, "OnPlayerPurchaseAmmo", WEAPON_DEAGLE, ammo, totalPrice);
    }
    else if(strmatch(weaponName, "shotgun")){
        if(!Player_HasWeapon(playerid, WEAPON_SHOTGUN))
            return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} Elinde bu silah yok.");

        totalPrice = 38 * ammo;

        if( PlayerData[playerid][pMoney] < totalPrice ) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bunu kar��layacak paran yok.");

        format(string, sizeof(string), "Are you sure you want to buy ammo for $%s?", MoneyFormat(totalPrice));
        ConfirmDialog(playerid, "Confirmation", string, "OnPlayerPurchaseAmmo", WEAPON_SHOTGUN, ammo, totalPrice);
    }
    else if(strmatch(weaponName, "rifle")){
        if(!Player_HasWeapon(playerid, WEAPON_RIFLE))
            return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} Elinde bu silah yok.");

        totalPrice = 100 * ammo;

        if( PlayerData[playerid][pMoney] < totalPrice ) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bunu kar��layacak paran yok.");

        format(string, sizeof(string), "Are you sure you want to buy ammo for $%s?", MoneyFormat(totalPrice));
        ConfirmDialog(playerid, "Confirmation", string, "OnPlayerPurchaseAmmo", WEAPON_RIFLE, ammo, totalPrice);
    }
    else return SendClientMessage(playerid, COLOR_ADM, "SERVER: Ge�ersiz Parametre.");
    return true;
}
*/

CMD:otolow(playerid, params[])
{
    PlayerData[playerid][pAutoLow] = !PlayerData[playerid][pAutoLow];
    SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Otomatik k�s�k sesi %s.", PlayerData[playerid][pAutoLow] ? ("a�t�n") : ("kapad�n"));
    return 1;
}

CMD:arackirala(playerid, params[])
{
    if(!IsPlayerInAnyVehicle(playerid)) return SendErrorMessage(playerid, "Herhangi bir ara� i�erisinde de�ilsin.");
    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendErrorMessage(playerid, "�of�r koltu�unda de�ilsin.");

    new vehicleid = GetPlayerVehicleID(playerid);
    if(!IsValidRentalCar(vehicleid)) return SendErrorMessage(playerid, "Bu ara� kiral�k de�il.");
    if(CarData[vehicleid][carRentedBy]) return SendErrorMessage(playerid, "Bu ara� zaten kiralanm��.");
    if(PlayerData[playerid][pMoney] < CarData[vehicleid][carRentalPrice]) return SendErrorMessage(playerid, "Bunu kar��layacak paran yok. ($%s)", MoneyFormat(CarData[vehicleid][carRentalPrice]));

    SendClientMessage(playerid, COLOR_DARKGREEN, "Bu arac� kiralad�n. (iptal etmek i�in /arackiraiptal)");
    SendClientMessage(playerid, COLOR_WHITE, "�PUCU: Art�k bu ara� �zerinde /kilit komutunu kullanabilirsin.");
    SendClientMessage(playerid, COLOR_WHITE, "Motoru �al��t�rmak i�in /motor yazmal�s�n.");

    GiveMoney(playerid, -CarData[vehicleid][carRentalPrice]);
    CarData[vehicleid][carRentedBy] = PlayerData[playerid][pSQLID];
    PlayerData[playerid][pRentCarKey] = vehicleid;

    return 1;
}

CMD:arackiraiptal(playerid, params[])
{
    if(!IsPlayerInAnyVehicle(playerid)) return SendErrorMessage(playerid, "Herhangi bir ara� i�erisinde de�ilsin.");
    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendErrorMessage(playerid, "�of�r koltu�unda de�ilsin.");

    new vehicleid = GetPlayerVehicleID(playerid);
    if(!IsValidRentalCar(vehicleid)) return SendErrorMessage(playerid, "Bu ara� kiral�k de�il.");
    if(!CarData[vehicleid][carRentedBy]) return SendErrorMessage(playerid, "Bu ara� kiralanmam��.");
    if(CarData[vehicleid][carRentedBy] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu ara� senin kiral�k arac�n de�il.");

    if(!IsPlayerInRangeOfPoint(playerid, 3.0, CarData[vehicleid][carPos][0], CarData[vehicleid][carPos][1], CarData[vehicleid][carPos][2]))
    {
        SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Arac�n�n park alan�nda de�ilsin.");
        SendClientMessage(playerid, COLOR_PINK, "�PUCU: K�rm�z� i�arete giderek paran� alabilirsin.");
        SetPlayerCheckpoint(playerid, CarData[vehicleid][carPos][0], CarData[vehicleid][carPos][1], CarData[vehicleid][carPos][2], 3.0);
        return 1;
    }

    SendClientMessageEx(playerid, COLOR_DARKGREEN, "Arac�n�n kiras�n� iptal ettin.", ReturnVehicleName(vehicleid));
    GiveMoney(playerid, CarData[vehicleid][carRentalPrice]);
    PlayerData[playerid][pRentCarKey] = 0;
    CarData[vehicleid][carRentedBy] = 0;
    SetVehicleToRespawn(vehicleid);

    //LogPlayerAction(playerid, sprintf("Kiralad��� %i numaral� arac� iade etti.", RentalData[vehicleid][rentalcarSQLID]));
    return true;
}

CMD:rehber(playerid, params[])
{
    if(PlayerData[playerid][pPhoneOff])
        return SendClientMessage(playerid, COLOR_ADM, "HATA: {FFFFFF}Bu komutu kullanmak i�in telefonun g�c� a��k olmal�.");

    new a_string[128], b_string[128], string[128], query[177];
    if(sscanf(params, "s[128]S()[128]", a_string, b_string))
    {
        SendClientMessage(playerid, COLOR_ACTION, "____________________________________________________");
        SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /rehber [eylem]");
        SendClientMessage(playerid, COLOR_ACTION, "[Eylem] ekle, sil, goster, goruntule, duzenle");
        SendClientMessage(playerid, COLOR_ACTION, "____________________________________________________");
        return true;
    }

    if(!strcmp(a_string, "ekle")){
        new isim[128], c_num, c_id;

        if(sscanf(b_string, "s[128]d", isim, c_num))
            return SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /rehber ekle [isim] [numara]");

        if(c_num == 911 || c_num == MECHANIC_NUMBER || c_num == TAXI_NUMBER)
            return SendClientMessage(playerid, COLOR_ADM, "HATA: {FFFFFF}Bu tarz numaralar� rehbere ekleyemezsin.");

        for(new i = 1; i < MAX_PLAYER_CONTACTS; i++){
            if(!ContactsData[playerid][i][contactID]){
                c_id = i;
                break;
            }
        }

        SendClientMessageEx(playerid, COLOR_ACTION, "SERVER: Rehberine ba�ar�yla yeni kay�t ekledin. Rehber ID: #%d", c_id);
        contact_save_id[playerid] = c_id;

        mysql_format(m_Handle, query, sizeof(query), "INSERT INTO player_contacts (`playersqlid`, `contactid`, `contact_name`, `contact_num`) VALUES(%i, %i, '%e', %i)",
            PlayerData[playerid][pSQLID], c_id, isim, c_num);
        mysql_pquery(m_Handle, query, "SQL_AddPlayerContact", "i", playerid);

        ContactsData[playerid][c_id][contactID] = c_id;
        format(ContactsData[playerid][c_id][contactName], 128, "%s", isim);
        ContactsData[playerid][c_id][contactNumber] = c_num;
        return 1;
    }
    else if(!strcmp(a_string, "sil"))
    {
        new c_id;
        if(sscanf(b_string, "d", c_id))
            return SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /rehber sil [rehber ID]");

        if(c_id < 1 || c_id > MAX_PLAYER_NOTES)
            return SendClientMessage(playerid, COLOR_ADM, "HATA: {FFFFFF}Rehberinde b�yle biri kay�tl� de�il.");

        if(!ContactsData[playerid][c_id][contactID])
            return SendClientMessage(playerid, COLOR_ADM, "HATA: {FFFFFF}Rehberinde b�yle biri kay�tl� de�il.");

        mysql_format(m_Handle, query, sizeof(query), "DELETE FROM player_contacts WHERE id = %i", ContactsData[playerid][c_id][contactSQLID]);
        mysql_pquery(m_Handle, query);

        ContactsData[playerid][c_id][contactID] = 0;
        ContactsData[playerid][c_id][contactSQLID] = 0;
    }
    else if(!strcmp(a_string, "goster"))
    {
        new c_id, playerb;
        if(sscanf(b_string, "ud", playerb, c_id))
            return SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /rehber goster [oyuncu ID/ad�] [rehber ID]");

        if(!IsPlayerConnected(playerb))
            return SendClientMessage(playerid, COLOR_ADM, "HATA: {FFFFFF}Belirtti�in oyuncu bulunamad�.");

        if(!pLoggedIn[playerb])
            return SendClientMessage(playerid, COLOR_ADM, "HATA: {FFFFFF}Belirtti�in oyuncu hen�z giri� yapmam��.");

        if(!GetDistanceBetweenPlayers(playerid, playerb, 4.5))
            return SendClientMessage(playerid, COLOR_ADM, "HATA: {FFFFFF}Belirtti�iniz oyuncuya yak�n olmal�s�n.");

        if(c_id < 1 || c_id > MAX_PLAYER_NOTES)
            return SendClientMessage(playerid, COLOR_ADM, "HATA: {FFFFFF}Rehberinde b�yle biri kay�tl� de�il.");

        if(!ContactsData[playerid][c_id][contactID])
            return SendClientMessage(playerid, COLOR_ADM, "HATA: {FFFFFF}Rehberinde b�yle biri kay�tl� de�il.");

        format(string, sizeof(string), "[!] Rehber #%d: Ad�: %s Numara: %d", c_id, ContactsData[playerid][c_id][contactName], ContactsData[playerid][c_id][contactNumber]);
        SendClientMessage(playerb, COLOR_ACTION, string);
    }
    else if(!strcmp(a_string, "goruntule"))
    {
        new found = 0;
        for(new i = 1; i < MAX_PLAYER_CONTACTS; i++)
        {
            if(ContactsData[playerid][i][contactID] != 0)
            {
                if(!isnull(ContactsData[playerid][i][contactName]))
                {
                    format(string, sizeof(string), "[!] Rehber #%d: Ad�: %s Numara: %d", i, ContactsData[playerid][i][contactName], ContactsData[playerid][i][contactNumber]);
                    SendClientMessage(playerid, COLOR_ACTION, string);
                    found = 1;
                }
            }
        }
        if(found == 0)SendClientMessage(playerid, COLOR_ACTION, "[!] Rehberinde kay�tl� kimseyi bulamad�k.");
    }
    else if(!strcmp(a_string, "duzenle")){
        new c_id, isim[128], c_num;

        if(sscanf(b_string, "ds[128]d", c_id, isim, c_num))
            return SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /rehber duzenle [rehber ID] [isim] [numara]");

        if(!ContactsData[playerid][c_id][contactID])
            return SendClientMessage(playerid, COLOR_ADM, "HATA: {FFFFFF}Rehberinde b�yle biri kay�tl� de�il.");

        mysql_format(m_Handle, query, sizeof(query), "UPDATE player_contacts SET contact_name = '%e', contact_num = %i WHERE id = %i",
            isim, c_num, ContactsData[playerid][c_id][contactSQLID]);
        mysql_pquery(m_Handle, query);

        format(ContactsData[playerid][c_id][contactName], 128, "%s", isim);
        ContactsData[playerid][c_id][contactNumber] = c_num;

        SendClientMessage(playerid, COLOR_ACTION, "[!] Rehberindeki kay�t� ba�ar�yla d�zenledin.");
    }
    return true;
}

CMD:aracisim(playerid, params[])
{
   /* if(!_has_vehicle_spawned[playerid]) return SendErrorMessage(playerid, "Spawnlanm�� bir arac�n yok.");
    if(!IsPlayerInAnyVehicle(playerid)) return SendErrorMessage(playerid, "Herhangi bir ara�ta de�ilsin.");
    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendErrorMessage(playerid, "Arac�n �of�r koltu�unda de�ilsin.");

    new
        vehicleid = GetPlayerVehicleID(playerid);

    if(CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu araca sahip de�ilsin.");

    new vehicle_name[35];
    if(sscanf(params, "s[35]", vehicle_name))
    {
        SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /aracisim [�zel ara� ismi]");
        SendClientMessage(playerid, COLOR_ACTION, "SERVER: Bu komutun olumsuz kullan�lmas� halinde KALICI YASAKLAMA cezas� al�rs�n�z.");
        SendClientMessage(playerid, COLOR_ACTION, "SERVER: �zel ara� isminiz arac�n ya��n�da i�ermelidir. (bknz: Range Rover Sport 2015)");
        SendClientMessage(playerid, COLOR_ACTION, "SERVER: Varolan �zel ara� ismini mi silmek istiyorsun? /aracisim_sil");
        return 1;
    }

    if(strlen(vehicle_name) > 20) return SendErrorMessage(playerid, "Ara� isminiz en fazla 20 karakter olabilir.");
    if(ContainsInvalidCharacters(vehicle_name)) return SendErrorMessage(playerid, "Ara� isminiz sadece harf ve rakamlardan olu�abilir.");

    CarData[vehicleid][carName] = EOS;
    strcat(CarData[vehicleid][carName], vehicle_name);

    new query[128];
    mysql_format(m_Handle, query, sizeof(query), "UPDATE vehicles SET VehicleName = '%e' WHERE id = %i", vehicle_name, CarData[vehicleid][carID]);
    mysql_tquery(m_Handle, query);

    SendClientMessageEx(playerid, COLOR_ADM, "SERVER: Arac�n�z�n ismi ba�ar�yla %s olarak g�ncellendi!", vehicle_name);*/

    SendClientMessage(playerid, COLOR_ADM, "Bu sistem devre d���.");
    return 1;
}

CMD:aracisim_sil(playerid, params[])
{
    if(!_has_vehicle_spawned[playerid]) return SendErrorMessage(playerid, "Spawnlanm�� bir arac�n yok.");
    if(!IsPlayerInAnyVehicle(playerid)) return SendErrorMessage(playerid, "Herhangi bir ara�ta de�ilsin.");
    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendErrorMessage(playerid, "Arac�n �of�r koltu�unda de�ilsin.");

    new
        vehicleid = GetPlayerVehicleID(playerid);

    if(CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu araca sahip de�ilsin.");

    CarData[vehicleid][carName] = EOS;
    strcat(CarData[vehicleid][carName], ReturnVehicleModelName(GetVehicleModel(vehicleid)));

    new query[128];
    mysql_format(m_Handle, query, sizeof(query), "UPDATE vehicles SET VehicleName = '%e' WHERE id = %i", ReturnVehicleModelName(GetVehicleModel(vehicleid)), CarData[vehicleid][carID]);
    mysql_tquery(m_Handle, query);

    SendClientMessage(playerid, COLOR_ADM, "SERVER: Arac�n�z�n ismi ba�ar�yla eski haline �evirildi!");
    return 1;
}

CMD:arac(playerid, params[])
{
    if(PlayerData[playerid][pInTuning]) return SendErrorMessage(playerid, "Modifiye men�s� a��kken bu komutu kullanamazs�n.");

    new a_string[60], b_string[128], string[128];

    if(sscanf(params, "s[60]S()[128]", a_string, b_string))
    {
        SendClientMessage(playerid, COLOR_ACTION, "____________________________________________________");
        SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /arac [eylem]");
        SendClientMessage(playerid, COLOR_ACTION, "[Eylem] getir, park, sat, kayit, kayitsil, satinal, gelistir, far, kapi, fiyat");
        SendClientMessage(playerid, COLOR_ACTION, "[Eylem] bilgi, cekici, anahtarkopyala, anahtaral, anahtarbirak, birlik, bul, parksatinal, kilit, lokasyon");
        SendClientMessage(playerid, COLOR_ACTION, "[Eylem] liste, benzinkutusu");
        SendClientMessage(playerid, COLOR_ACTION, "[Dikkat] hurda (uyar�: kal�c� olarak arac�n�z� siler)");
        SendClientMessage(playerid, COLOR_ACTION, "[�pucu] forum.lss-roleplay.com adresinde but�n bu eylemleri anlatan bir konu bulunuyor.");
        SendClientMessage(playerid, COLOR_ACTION, "[�pucu] Ara� bilgilerine ba�kalar�na /arac bilgi [oyuncu ID/ad�] komutuyla g�sterebilirsin.");
        SendClientMessage(playerid, COLOR_ACTION, "[�pucu] �zel ara� ismi mi istiyorsun? /aracisim komutunu kullanabilirsin.");
        SendClientMessage(playerid, COLOR_ACTION, "____________________________________________________");
        return 1;
    }

    if(!strcmp(a_string, "getir") || !strcmp(a_string, "g", true))
    {
        if(CountPlayerCars(playerid) == 0) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Hi� arac�n yok.");
        if(_has_vehicle_spawned[playerid]) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Spawnlanm�� arac�n bulunuyor.");
        if(Pkr_GetPlayerGame(playerid) != -1) return SendErrorMessage(playerid, "Poker oynarken bu komutu kullanamazs�n.");
        if(GetPVarInt(playerid, "Viewing_FoodList")) return SendErrorMessage(playerid, "Yemek listesine bakarken bu komutu kullanamazs�n.");
        if(GetPVarInt(playerid, "Viewing_StoreList")) return SendErrorMessage(playerid, "�r�n listesine bakarken bu komutu kullanamazs�n.");
        if(GetPVarInt(playerid, "Viewing_OwnedCarList")) return SendErrorMessage(playerid, "Ara� listene bakarken bu komutu kullanamazs�n.");
        if(GetPVarInt(playerid, "Viewing_DealershipCats")) return SendErrorMessage(playerid, "Ara� kategorilerine bu komutu kullanamazs�n.");
        if(GetPVarInt(playerid, "Viewing_Dealership")) return SendErrorMessage(playerid, "Ara� listesine bu komutu kullanamazs�n.");
        if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER || GetPlayerState(playerid) == PLAYER_STATE_PASSENGER) return SendErrorMessage(playerid, "Bir arac�n i�erisindeyken ara� getiremezsiniz.");

        new id;
        if(sscanf(b_string, "D(-1)", id)) return SendUsageMessage(playerid, "/arac getir [slot]");
        //
        //id = (id == -1) ? playerid : id;

        if(id == -1)
        {
            SetPVarInt(playerid, "playervehicles_count", CountPlayerCars(playerid));
            SetPVarInt(playerid, "playervehicles_page", 0);

            PlayerVehicles_Show(playerid);
            SelectTextDraw(playerid, COLOR_DARKGREEN);
        } else { // 1 - 9
            if(id < 1 || id > MAX_OWNED_CARS) return SendErrorMessage(playerid, "Hatal� slot aral��� girdin.");
            if(!PlayerData[playerid][pOwnedCar][id]) return SendErrorMessage(playerid, "Bu slotta arac�n bulunmuyor.");
            LoadVehicles(playerid, id);
        }
        return 1;
    }
    else if(!strcmp(a_string, "l") || !strcmp(a_string, "lokasyon", true) || !strcmp(a_string, "liste", true))
    {
        if(CountPlayerCars(playerid) == 0) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Hi� arac�n yok.");

        new
            query[40];

        for(new i = 1; i < MAX_OWNED_CARS; i++) if(PlayerData[playerid][pOwnedCar][i])
        {
            mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM vehicles WHERE id = %i", PlayerData[playerid][pOwnedCar][i]);
            mysql_tquery(m_Handle, query, "OnShowVehicleList", "i", playerid);
        }

        if(_has_vehicle_spawned[playerid])
        {
            SendServerMessage(playerid, "[!] %s isimli arac�n spawnlanm�� durumda. Ara� ID: %d", GetVehicleModel(_has_vehicle_spawned[playerid]), _has_vehicle_spawned[playerid]);
        }
        return 1;
    }
    else if(!strcmp(a_string, "bilgi"))
    {
        if(!_has_vehicle_spawned[playerid]) return SendServerMessage(playerid, "Spawnlanm�� bir arac�n yok.");
        if(!IsPlayerInAnyVehicle(playerid)) return SendServerMessage(playerid, "Herhangi bir ara�ta de�ilsin.");
        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendServerMessage(playerid, "Arac�n �of�r koltu�unda de�ilsin.");

        new vehicleid = GetPlayerVehicleID(playerid);
        if(CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID]) return SendServerMessage(playerid, "Bu araca sahip de�ilsin.");

        new id;
        if(sscanf(b_string, "D(-1)", id)) return SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /arac bilgi [oyuncu ID]");

        id = (id == -1) ? playerid : id;
        if(!IsPlayerConnected(id)) return SendServerMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
        if(!pLoggedIn[id]) return SendServerMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
        if(!GetDistanceBetweenPlayers(playerid, id, 4.5)) return SendServerMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
        SendClientMessageEx(id, COLOR_WHITE, "Ara� �mr�: Motor �mr�[%.2f], Batarya �mr�[%.2f], KM[%.1f]", CarData[vehicleid][carEngine], CarData[vehicleid][carBattery], CarData[vehicleid][carMileage]);
        SendClientMessageEx(id, COLOR_WHITE, "G�venlik: Kilit[%d], Alarm[%d], Immobiliser[%d], Sigorta[%d]", CarData[vehicleid][carLock], CarData[vehicleid][carAlarm], CarData[vehicleid][carImmob], CarData[vehicleid][carInsurance]);
        SendClientMessageEx(id, COLOR_WHITE, "Di�er: Ana Renk[{%06x}%d{FFFFFF}], �kincil Renk[{%06x}%d{FFFFFF}], Plaka[%s], Patlat�ld��� Say�[%d]", VehicleColoursTableRGBA[CarData[vehicleid][carColor1]] >>> 8, CarData[vehicleid][carColor1], VehicleColoursTableRGBA[CarData[vehicleid][carColor2]] >>> 8, CarData[vehicleid][carColor2], CarData[vehicleid][carPlates], CarData[vehicleid][carTimeDestroyed]);
        return 1;
    }
    else if(!strcmp(a_string, "gelistir"))
    {
        if(!_has_vehicle_spawned[playerid]) return SendServerMessage(playerid, "Spawnlanm�� bir arac�n yok.");
        if(!IsPlayerInAnyVehicle(playerid)) return SendServerMessage(playerid, "Herhangi bir ara�ta de�ilsin.");
        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendServerMessage(playerid, "Arac�n �of�r koltu�unda de�ilsin.");

        new vehicleid = GetPlayerVehicleID(playerid);
        if(CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID]) return SendServerMessage(playerid, "Bu araca sahip de�ilsin.");

				foreach(new b : Businesses) if(IsPlayerInRangeOfPoint(playerid, 7.5, BusinessData[b][EnterPos][0], BusinessData[b][EnterPos][1], BusinessData[b][EnterPos][2]))
						{
							if(BusinessData[b][BusinessType] != BUSINESS_DEALERSHIP) return SendErrorMessage(playerid, "Bu i�yeri galeri de�il.");
			        if(PlayerUpgradingVehicle[playerid]) return SendErrorMessage(playerid, "Zaten bir arac�n� geli�tiriyorsun.");
			        if(CarEngine[vehicleid]) return SendErrorMessage(playerid, "Arac� geli�tirebilmek i�in l�tfen motoru kapat�n�z.");

			        new type[7], type_level, confirm[6];
			        if(sscanf(b_string, "s[7]I(-1)S()[6]", type, type_level, confirm))
			        {
			            SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /arac gelistir [tip] [tip-seviyesi]");
			            SendClientMessage(playerid, COLOR_ACTION, "[T�PLER] kilit, alarm, immob"); // sigorta ve ara� armor
			            //SendClientMessage(playerid, COLOR_ACTION, "[DE����M] batarya, motor");

			            //SendClientMessage(playerid, COLOR_ACTION, "Bu sistem �u anl�k kapal� durumda.");
			            return 1;
			        }
				        if(!strcmp(type, "kilit"))
				        {
				            new car_price, total_cost;

				            for(new i = 0; i < sizeof(DealershipData); i++) if(DealershipData[i][DealershipModel] == CarData[vehicleid][carModel])
				            {
				                car_price = DealershipData[i][DealershipPrice];
				                break;
				            }

				            if(type_level == -1)
				            {
				                SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /arac gelistir kilit [kilit-seviyesi]");
				                for(new i = 1; i <= 5; i++) SendClientMessageEx(playerid, COLOR_ACTION, "Kilit Seviyesi %i - {33AA33}$%s", i, MoneyFormat(floatround(car_price * 0.15 * i-1)));
				                return 1;
				            }

				            if(type_level < 1 || type_level > 5) return SendErrorMessage(playerid, "Kilit seviyesi 1-5 aras�nda olmal�d�r.");
				            if(type_level > CarData[vehicleid][carLock]+1) return SendErrorMessage(playerid, "Kilit seviyesini ad�m ad�m y�kseltmelisin.");
				            if(CarData[vehicleid][carLock] >= type_level) return SendErrorMessage(playerid, "Kilit seviyesi zaten %i olarak g�z�k�yor.", type_level);

				            total_cost = floatround(car_price * 0.15 * type_level);
				            if(PlayerData[playerid][pMoney] < total_cost) return SendErrorMessage(playerid, "Yeterli paran yok. ($%s)", MoneyFormat(total_cost));

				            if(!isnull(confirm) && !strcmp(confirm, "onay", true))
				            {
				                SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: Geli�tirme i�lemi ba�lad�, l�tfen hareket etmeyiniz.");
				                VehicleUpgradeSign[vehicleid] = Create3DTextLabel("(( | ))\nK�L�T Y�KSELT�L�YOR", COLOR_DARKGREEN, 0.0, 0.0, 0.0, 25.0, 0, 1);
				                Attach3DTextLabelToVehicle(VehicleUpgradeSign[vehicleid], vehicleid, -0.0, -0.0, -0.0);

				                PlayerUpgradingVehicle[playerid] = true;
				                PlayerUpgradeTimer[playerid] = SetTimerEx("OnVehicleLockUpgrade", 4500, true, "iiii", playerid, vehicleid, total_cost, type_level);
				            }
				            else
				            {
				                SendClientMessageEx(playerid, COLOR_YELLOW, "Bu i�lem $%s tutacak", MoneyFormat(total_cost));
				                SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /arac gelistir [kilit] [kilit-seviyesi] {FFFF00}onay");
				            }
				            return 1;
				       }
							 else if(!strcmp(type, "alarm"))
							 {
									 new car_price, total_cost;

									 for(new i = 0; i < sizeof(DealershipData); i++) if(DealershipData[i][DealershipModel] == CarData[vehicleid][carModel])
									 {
											 car_price = DealershipData[i][DealershipPrice];
											 break;
									 }

									 if(type_level == -1)
									 {
											 SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /arac gelistir alarm [alarm-seviyesi]");
											 for(new i = 1; i <= 4; i++) SendClientMessageEx(playerid, COLOR_ACTION, "Alarm Seviyesi %i - {33AA33}$%s", i, MoneyFormat(floatround(car_price * 0.20 * i-1)));
											 return 1;
									 }

									 if(type_level < 1 || type_level > 4) return SendErrorMessage(playerid, "Alarm seviyesi 1-4 aras�nda olmal�d�r.");
									 if(type_level > CarData[vehicleid][carAlarm]+1) return SendErrorMessage(playerid, "Alarm seviyesini ad�m ad�m y�kseltmelisin.");
									 if(CarData[vehicleid][carAlarm] >= type_level) return SendErrorMessage(playerid, "Alarm seviyesi zaten %i olarak g�z�k�yor.", type_level);

									 total_cost = floatround(car_price * 0.20 * type_level);
									 if(PlayerData[playerid][pMoney] < total_cost) return SendErrorMessage(playerid, "Yeterli paran yok. ($%s)", MoneyFormat(total_cost));

									 if(!isnull(confirm) && !strcmp(confirm, "onay", true))
									 {
											 SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: Geli�tirme i�lemi ba�lad�, l�tfen hareket etmeyiniz.");
											 VehicleUpgradeSign[vehicleid] = Create3DTextLabel("(( | ))\nALARM Y�KSELT�L�YOR", COLOR_DARKGREEN, 0.0, 0.0, 0.0, 25.0, 0, 1);
											 Attach3DTextLabelToVehicle(VehicleUpgradeSign[vehicleid], vehicleid, -0.0, -0.0, -0.0);

											 PlayerUpgradingVehicle[playerid] = true;
											 PlayerUpgradeTimer[playerid] = SetTimerEx("OnVehicleAlarmUpgrade", 4500, true, "iiii", playerid, vehicleid, total_cost, type_level);
									 }
									 else
									 {
											 SendClientMessageEx(playerid, COLOR_YELLOW, "Bu i�lem $%s tutacak", MoneyFormat(total_cost));
											 SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /arac gelistir [alarm] [alarm-seviyesi] {FFFF00}onay");
									 }
									 return 1;
								 }
							 /*else if(!strcmp(type, "batarya"))
							 {
									 new car_price, total_cost;

									 for(new i = 0; i < sizeof(DealershipData); i++) if(DealershipData[i][DealershipModel] == CarData[vehicleid][carModel])
									 {
											 car_price = DealershipData[i][DealershipPrice];
											 break;
									 }

									 total_cost = floatround(car_price * 0.30 * type_level);
									 if(PlayerData[playerid][pMoney] < total_cost) return SendErrorMessage(playerid, "Yeterli paran yok. ($%s)", MoneyFormat(total_cost));

									 if(!isnull(confirm) && !strcmp(confirm, "onay", true))
									 {
											 SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: De�i�tirilme i�lemi ba�lad�, l�tfen hareket etmeyiniz.");
											 VehicleUpgradeSign[vehicleid] = Create3DTextLabel("(( | ))\nBATARYA DE���T�R�L�YOR", COLOR_DARKGREEN, 0.0, 0.0, 0.0, 25.0, 0, 1);
											 Attach3DTextLabelToVehicle(VehicleUpgradeSign[vehicleid], vehicleid, -0.0, -0.0, -0.0);

											 PlayerUpgradingVehicle[playerid] = true;
											 PlayerUpgradeTimer[playerid] = SetTimerEx("OnVehicleChangeBattery", 6500, true, "iiii", playerid, vehicleid, total_cost, GetVehicleCondition(vehicleid, 2));
									 }
									 else
									 {
										 	 SendClientMessage(playerid, COLOR_YELLOW, "Bu i�lem, arac�n�zdaki bataryay� stok d�zeyinde bir batarya ile de�i�tirecek.");
											 SendClientMessageEx(playerid, COLOR_YELLOW, "Bu i�lem $%s tutacak", MoneyFormat(total_cost));
											 SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /arac gelistir [batarya] {FFFF00}onay");
									 }
									 return 1;
								 }
								else if(!strcmp(type, "motor"))
								 {
										 new car_price, total_cost;

										 for(new i = 0; i < sizeof(DealershipData); i++) if(DealershipData[i][DealershipModel] == CarData[vehicleid][carModel])
										 {
												 car_price = DealershipData[i][DealershipPrice];
												 break;
										 }


										 total_cost = floatround(car_price * 0.30 * type_level + 10);
										 if(PlayerData[playerid][pMoney] < total_cost) return SendErrorMessage(playerid, "Yeterli paran yok. ($%s)", MoneyFormat(total_cost));

										 if(!isnull(confirm) && !strcmp(confirm, "onay", true))
										 {
												 SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: De�i�tirilme i�lemi ba�lad�, l�tfen hareket etmeyiniz.");
												 VehicleUpgradeSign[vehicleid] = Create3DTextLabel("(( | ))\nMOTOR DE���T�R�L�YOR", COLOR_DARKGREEN, 0.0, 0.0, 0.0, 25.0, 0, 1);
												 Attach3DTextLabelToVehicle(VehicleUpgradeSign[vehicleid], vehicleid, -0.0, -0.0, -0.0);

												 PlayerUpgradingVehicle[playerid] = true;
												 PlayerUpgradeTimer[playerid] = SetTimerEx("OnVehicleChangeEngine", 8500, true, "iiii", playerid, vehicleid, total_cost, GetVehicleCondition(vehicleid, 1));
										 }
										 else
										 {
												 SendClientMessage(playerid, COLOR_YELLOW, "Bu i�lem, arac�n�zdaki motoru stok d�zeyinde bir motor ile de�i�tirecek.");
												 SendClientMessageEx(playerid, COLOR_YELLOW, "Bu i�lem $%s tutacak", MoneyFormat(total_cost));
												 SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /arac gelistir [motor] {FFFF00}onay");
										 }
										 return 1;
									 }*/
									else if(!strcmp(type, "immob"))
									 {
									 		new car_price, total_cost;

									 		for(new i = 0; i < sizeof(DealershipData); i++) if(DealershipData[i][DealershipModel] == CarData[vehicleid][carModel])
									 		{
									 				car_price = DealershipData[i][DealershipPrice];
									 				break;
									 		}

									 		if(type_level == -1)
									 		{
									 				SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /arac gelistir immob [immob-seviyesi]");
									 				for(new i = 1; i <= 4; i++) SendClientMessageEx(playerid, COLOR_ACTION, "�mmobilizer Seviyesi %i - {33AA33}$%s", i, MoneyFormat(floatround(car_price * 0.23 * i-1)));
									 				return 1;
									 		}

									 		if(type_level < 1 || type_level > 4) return SendErrorMessage(playerid, "�mmobilizer seviyesi 1-4 aras�nda olmal�d�r.");
									 		if(type_level > CarData[vehicleid][carImmob]+1) return SendErrorMessage(playerid, "�mmobilizer seviyesini ad�m ad�m y�kseltmelisin.");
									 		if(CarData[vehicleid][carImmob] >= type_level) return SendErrorMessage(playerid, "�mmobilizer seviyesi zaten %i olarak g�z�k�yor.", type_level);

									 		total_cost = floatround(car_price * 0.23 * type_level);
									 		if(PlayerData[playerid][pMoney] < total_cost) return SendErrorMessage(playerid, "Yeterli paran yok. ($%s)", MoneyFormat(total_cost));

									 		if(!isnull(confirm) && !strcmp(confirm, "onay", true))
									 		{
									 				SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: Geli�tirme i�lemi ba�lad�, l�tfen hareket etmeyiniz.");
									 				VehicleUpgradeSign[vehicleid] = Create3DTextLabel("(( | ))\nIMMOBILIZER Y�KSELT�L�YOR", COLOR_DARKGREEN, 0.0, 0.0, 0.0, 25.0, 0, 1);
									 				Attach3DTextLabelToVehicle(VehicleUpgradeSign[vehicleid], vehicleid, -0.0, -0.0, -0.0);

									 				PlayerUpgradingVehicle[playerid] = true;
									 				PlayerUpgradeTimer[playerid] = SetTimerEx("OnVehicleImmobUpgrade", 4500, true, "iiii", playerid, vehicleid, total_cost, type_level);
									 		}
									 		else
									 		{
									 				SendClientMessageEx(playerid, COLOR_YELLOW, "Bu i�lem $%s tutacak", MoneyFormat(total_cost));
									 				SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /arac gelistir [immob] [immob-seviyesi] {FFFF00}onay");
									 		}
									 		return 1;
							}
							 return 1;
					}
					SendErrorMessage(playerid, "Yak�n�nda galeri yok.");
    }
    else if(!strcmp(a_string, "cekici"))
    {
        if(!_has_vehicle_spawned[playerid]) return SendServerMessage(playerid, "Spawnlanm�� bir arac�n yok.");
        if(PlayerData[playerid][pMoney] < 2000) return SendServerMessage(playerid, "Yeterli paran yok. ($2,000)");
        if(playerTowingVehicle[playerid]) return SendServerMessage(playerid, "Zaten bir arac�n� �ektiriyorsun.");
        if(IsVehicleOccupied(_has_spawned_vehicleid[playerid])) return SendServerMessage(playerid, "Arac�n kullan�l�r ya da �al�nm�� durumda.");

        //foreach(new i : Vehicle) {
        //  if(GetVehicleTrailer(i) == vehicleID) {
        //      return SendClientMessage(playerid, COLOR_GREY, "Your vehicle is currently being towed by a Tow Truck.");
        //  }
        //}

        SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: �ekici iste�i g�nderildi.");
        vehicleTowSign[_has_spawned_vehicleid[playerid]] = CreateDynamic3DTextLabel("(( | ))\nARA� �EK�L�YOR", COLOR_DARKGREEN, 0.0, 0.0, 0.0, 3.0);
        //Create3DTextLabel("(( | ))\nARA� �EK�L�YOR", COLOR_DARKGREEN, 0.0, 0.0, 0.0, 25.0, 0, 1);
        Attach3DTextLabelToVehicle(vehicleTowSign[_has_spawned_vehicleid[playerid]], _has_spawned_vehicleid[playerid], -0.0, -0.0, -0.0);

        playerTowingVehicle[playerid] = true;
        playerTowTimer[playerid] = SetTimerEx("OnVehicleTow", 4500, true, "i", playerid);
        return 1;
    }
    else if(!strcmp(a_string, "park") || !strcmp(a_string, "p", true))
    {
        if(!_has_vehicle_spawned[playerid]) return SendErrorMessage(playerid, "Spawnlanm�� bir arac�n yok.");
        if(!IsPlayerInAnyVehicle(playerid)) return SendErrorMessage(playerid, "Herhangi bir ara�ta de�ilsin.");
        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendErrorMessage(playerid, "Arac�n �of�r koltu�unda de�ilsin.");

        new vehicleid = GetPlayerVehicleID(playerid);
        if(CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu araca sahip de�ilsin.");

        if(!IsPlayerInRangeOfPoint(playerid, 5.0, CarData[vehicleid][carPos][0], CarData[vehicleid][carPos][1], CarData[vehicleid][carPos][2]))
        {
            PlayerData[playerid][pCarCheckpoint] = 1;
            SetPlayerCheckpoint(playerid, CarData[vehicleid][carPos][0], CarData[vehicleid][carPos][1], CarData[vehicleid][carPos][2], 3.0);
            SendClientMessage(playerid, COLOR_ADM, "�PUCU: Arac�n�n park yerinde olman gerekiyor.");
            SendClientMessage(playerid, COLOR_PINK, "SERVER: ��areti takip et.");
            return 1;
        }

        Car_Save(vehicleid);
        _has_vehicle_spawned[playerid] = false;
        _has_spawned_vehicleid[playerid] = 0;

        LogVehicleAction(vehicleid, sprintf("%s taraf�ndan park edildi.", ReturnName(playerid)));
        SendClientMessage(playerid, COLOR_DARKGREEN, "Arac�n park edildi.");
        Vehicle_DefaultValues(vehicleid);
        DestroyVehicle(vehicleid);

        new Float: x, Float: y, Float: z, Float: a;
        GetPlayerPos(playerid, x, y, z); GetPlayerFacingAngle(playerid, a);
        SendPlayer(playerid, x + 1.0, y, z, a, GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid));
    }
    else if(!strcmp(a_string, "parksatinal") || !strcmp(a_string, "ps"))
    {
        if(!_has_vehicle_spawned[playerid]) return SendErrorMessage(playerid, "Spawnlanm�� bir arac�n yok.");
        if(!IsPlayerInAnyVehicle(playerid)) return SendErrorMessage(playerid, "Herhangi bir ara�ta de�ilsin.");
        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendErrorMessage(playerid, "Arac�n �of�r koltu�unda de�ilsin.");

        new vehicleid = GetPlayerVehicleID(playerid);
        if(CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu araca sahip de�ilsin.");

        new confirm[5];
        if(sscanf(b_string, "S()[5]", confirm))
        {
            SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /arac parksatinal {FFFF00}onay");
            return 1;
        }

        if(!isnull(confirm) && !strcmp(confirm, "onay", true))
        {
            new free_park = 0;
            foreach(new i : Properties) if(PropertyData[i][PropertyOwnerID] == PlayerData[playerid][pSQLID])
            {
                if(PlayerData[playerid][pInsideGarage] != -1)
                {
                    if(GarageData[PlayerData[playerid][pInsideGarage]][GaragePropertyID] == i)
                    {
                        free_park = 1;
                    }
                }
                else
                {
                    if(IsPlayerInRangeOfPoint(playerid, 15.0, PropertyData[i][PropertyEnter][0], PropertyData[i][PropertyEnter][1], PropertyData[i][PropertyEnter][2]))
                    {
                        free_park = 1;
                    }
                }
            }

            if(!free_park)
            {
                if(PlayerData[playerid][pMoney] < 1000)
                    return SendClientMessage(playerid, COLOR_ADM, "Park yeri alabilecek kadar paran yok. ($1,000)");

                GiveMoney(playerid, -1000);
                SendServerMessage(playerid, "Park yeri $1,000 kar��l���nda sat�n al�nd�. (Yer de�i�imi)");
            }
            else
            {
                SendClientMessage(playerid, COLOR_DARKGREEN, "Park yeri �cretsiz olarak de�i�tirildi!");
            }

            GetVehiclePos(vehicleid, CarData[vehicleid][carPos][0], CarData[vehicleid][carPos][1], CarData[vehicleid][carPos][2]);
            GetVehicleZAngle(vehicleid, CarData[vehicleid][carPos][3]);
            CarData[vehicleid][carInterior] = GetPlayerInterior(playerid);
            CarData[vehicleid][carWorld] = GetPlayerVirtualWorld(playerid);
            Car_Save(vehicleid);
        }
        else SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /arac parksatinal {FFFF00}onay");
        return 1;
    }
    else if(!strcmp(a_string, "kayitsil"))
    {
        if (PlayerData[playerid][pMoney] < 20000)
            return SendServerMessage(playerid, "Yeterli paran yok. ($20,000)");

        if(!_has_vehicle_spawned[playerid])
            return SendServerMessage(playerid, "Spawnlanm�� bir arac�n yok.");

        if (!IsPlayerInAnyVehicle(playerid))
            return SendServerMessage(playerid, "Herhangi bir ara�ta de�ilsin.");

        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
            return SendServerMessage(playerid, "Arac�n �of�r koltu�unda de�ilsin.");

        new
            vehicleid = GetPlayerVehicleID(playerid);

        if(CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID])
            return SendServerMessage(playerid, "Bu araca sahip de�ilsin.");

        if(!IsPlayerInRangeOfPoint(playerid, 5.0, 2520.11, -1485.05, 24.00))
        {
            SendServerMessage(playerid, "�llegal Sigorta b�lgesi checkpoint yerle�tirildi.");
            SetPlayerCheckpoint(playerid, 2520.11, -1485.05, 24.00, 3.0);
            return 1;
        }

        SetVehicleNumberPlate(vehicleid, " ");
				CarData[vehicleid][carIllegalPlate] = true;
        Car_Save(vehicleid);

        SetVehicleToRespawn(vehicleid);
        PutPlayerInVehicle(playerid, vehicleid, 0);

        SendServerMessage(playerid, "Arac�n�n plaka kay�tlar� $20.000 kar��l���nda silindi.");
        SendServerMessage(playerid, "Bunun illegal oldu�unu unutma.");
        GiveMoney(playerid, -20000);
        return 1;
    }
    else if(!strcmp(a_string, "kayit"))
    {
        if(!_has_vehicle_spawned[playerid])
            return SendServerMessage(playerid, "Spawnlanm�� bir arac�n yok.");

        if (!IsPlayerInAnyVehicle(playerid))
            return SendServerMessage(playerid, "Herhangi bir ara�ta de�ilsin.");

        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
            return SendServerMessage(playerid, "Arac�n �of�r koltu�unda de�ilsin.");

        if (PlayerData[playerid][pMoney] < 2500)
            return SendServerMessage(playerid, "Yeterli paran yok. ($2,500)");

        new
            vehicleid = GetPlayerVehicleID(playerid);

        if(CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID])
            return SendServerMessage(playerid, "Bu araca sahip de�ilsin.");

        if(!IsPlayerInRangeOfPoint(playerid, 5.0, 2520.11, -1485.05, 24.00))
        {
            SendServerMessage(playerid, "�llegal Sigorta b�lgesi checkpoint yerle�tirildi.");
            SetPlayerCheckpoint(playerid, 2520.11, -1485.05, 24.00, 3.0);
            return 1;
        }

        new rand[3];
        rand[0] = random(sizeof(PlatePossible));
        rand[1] = random(sizeof(PlatePossible));
        rand[2] = random(sizeof(PlatePossible));

        format(CarData[vehicleid][carPlates], 32, "%d%s%s%s%d%d%d", random(9), PlatePossible[rand[0]], PlatePossible[rand[1]], PlatePossible[rand[2]], random(9), random(9), random(9));
        SetVehicleNumberPlate(vehicleid, CarData[vehicleid][carPlates]);
				CarData[vehicleid][carIllegalPlate] = true;
        Car_Save(vehicleid);

        SetVehicleToRespawn(vehicleid);
        PutPlayerInVehicle(playerid, vehicleid, 0);
        SendServerMessage(playerid, "Kolay olmad�. Kopyalar� olmadan resmi evraklar�n sana ge�mesi $2,500 tuttu.");
        GiveMoney(playerid, -2500);
        return 1;
    }
    else if(!strcmp(a_string, "modifikasyon"))
    {
        if(!_has_vehicle_spawned[playerid])
            return SendServerMessage(playerid, "Spawnlanm�� bir arac�n yok.");

        if (!IsPlayerInAnyVehicle(playerid))
            return SendServerMessage(playerid, "Herhangi bir ara�ta de�ilsin.");

        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
            return SendServerMessage(playerid, "Arac�n �of�r koltu�unda de�ilsin.");

        new vehicleid = GetPlayerVehicleID(playerid);
        if(CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID])
            return SendServerMessage(playerid, "Bu araca sahip de�ilsin.");

        new str[512] = "{FF6347}>> S�f�rla{FFFFFF}\n{FF6347}Paintjob Sil{FFFFFF}\n";
        new component;
        new strName[32];
        new count;

        for(new j; j < 14; j++)
        {
            strName = "Bo�"; component = CarData[vehicleid][carMods][j];
            if(component)strmid(strName, GetComponentName(component), 0, 32);
            format(str, sizeof(str), "%sSlot %d: %s (#%d)\n", string, j, strName, component);
            count++;
        }

        if(!count && CarData[vehicleid][carPaintjob] == 3)
            return SendServerMessage(playerid, "Bu ara�ta hi� modifikasyon par�as� yok.");

        ShowPlayerDialog(playerid, DIALOG_REMOVE_COMP, DIALOG_STYLE_LIST, "Ara� Modifikasyonlar�", str, "Sil", "<<");
        return 1;
    }
    else if(!strcmp(a_string, "bul"))
    {
        if(!_has_vehicle_spawned[playerid]) return SendServerMessage(playerid, "Spawnlanm�� bir arac�n yok.");
        if(IsVehicleOccupied(_has_spawned_vehicleid[playerid])) return SendServerMessage(playerid, "Arac�n� biri kullan�yor veya �al�nm�� durumda g�z�k�yor.");

        new Float: car_pos_x, Float: car_pos_y, Float: car_pos_z;
        SendServerMessage(playerid, "Ara� ID: %d", _has_spawned_vehicleid[playerid]);
        GetVehiclePos(_has_spawned_vehicleid[playerid], car_pos_x, car_pos_y, car_pos_z);
        SetPlayerCheckpoint(playerid, car_pos_x, car_pos_y, car_pos_z, 4.0);
        PlayerData[playerid][pCarCheckpoint] = 1;
        return 1;
    }
    else if(!strcmp(a_string, "birlik"))
    {
        if(!_has_vehicle_spawned[playerid])
            return SendServerMessage(playerid, "Spawnlanm�� bir arac�n yok.");

        if (!IsPlayerInAnyVehicle(playerid))
            return SendServerMessage(playerid, "Herhangi bir ara�ta de�ilsin.");

        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
            return SendServerMessage(playerid, "Arac�n �of�r koltu�unda de�ilsin.");

        if(PlayerData[playerid][pFaction] == -1)
            return SendServerMessage(playerid, "Herhangi bir birlikte de�ilsin");

        if(PlayerData[playerid][pFactionRank] != 1)
            return SendServerMessage(playerid, "Bu arac� birli�ine eklemek i�in r�tben yetersiz.");

        new vehicleid = GetPlayerVehicleID(playerid);
        if(CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID])
            return SendServerMessage(playerid, "Bu araca sahip de�ilsin.");

        if(CarData[vehicleid][carFaction] != -1)
            return SendServerMessage(playerid, "Bu ara� zaten %s birli�ine kay�tl�.", Faction_GetName(CarData[vehicleid][carFaction]));

        SendServerMessage(playerid, "Arac�n art�k %s birli�ine kay�tl�.", Faction_GetName(PlayerData[playerid][pFaction]));
        CarData[vehicleid][carFaction] = PlayerData[playerid][pFaction];
        CarData[vehicleid][carOwnerID] = 0;

        _has_vehicle_spawned[playerid] = false;
        _has_spawned_vehicleid[playerid] = 0;

        for(new i = 1; i < MAX_OWNED_CARS; i++)
        {
            if(PlayerData[playerid][pOwnedCar][i] == CarData[vehicleid][carID])
            {
                PlayerData[playerid][pOwnedCar][i] = 0;
            }
        }

        Car_Save(vehicleid);
        return 1;
    }
    else if(!strcmp(a_string, "birlikcikar"))
    {
				if(_has_vehicle_spawned[playerid]) return SendErrorMessage(playerid, "Spawnlanm�� bir arac�n varken bu komutu kullanamazs�n.");
        if (!IsPlayerInAnyVehicle(playerid)) return SendServerMessage(playerid, "Herhangi bir ara�ta de�ilsin.");
        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendServerMessage(playerid, "Arac�n �of�r koltu�unda de�ilsin.");

        new vehicleid = GetPlayerVehicleID(playerid);
        SendServerMessage(playerid, "Arac�n art�k %s birli�ine kay�tl� de�il.", Faction_GetName(CarData[vehicleid][carFaction]));
        CarData[vehicleid][carFaction] = -1;
				CarData[vehicleid][carOwnerID] = PlayerData[playerid][pSQLID];
				Car_Save(vehicleid);

				for(new i = 1; i < MAX_OWNED_CARS; i++)
				{
						if(PlayerData[playerid][pOwnedCar][i] == 0)
						{
								PlayerData[playerid][pOwnedCar][i] = CarData[vehicleid][carID];
								Vehicle_DefaultValues(vehicleid);
								DestroyVehicle(vehicleid);

								new Float: x, Float: y, Float: z, Float: a;
								GetPlayerPos(playerid, x, y, z); GetPlayerFacingAngle(playerid, a);
								SendPlayer(playerid, x + 1.0, y, z, a, GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid));
								return 1;
						}
				}
        return 1;
    }
    else if(!strcmp(a_string, "satinal"))
    {
        if(_has_vehicle_spawned[playerid]) return SendErrorMessage(playerid, "Yeni bir ara� almak i�in ilk �nce spawnlanm�� olan� park et.");
        if(FreePlayerCarID(playerid) == -1) return SendErrorMessage(playerid, "�u anda m�mk�n olan maksimum ara� say�s�na sahipsiniz.");

        if(GetPVarInt(playerid, "AtBusiness") != -1)
        {
            new b = GetPVarInt(playerid, "AtBusiness");
            if(IsPlayerInRangeOfPoint(playerid, 5.0, BusinessData[b][EnterPos][0], BusinessData[b][EnterPos][1], BusinessData[b][EnterPos][2]))
            {
                if(BusinessData[b][BusinessType] != BUSINESS_DEALERSHIP) return SendErrorMessage(playerid, "Bu i�yeri galeri de�il.");
                if(GetPVarInt(playerid, "Viewing_OwnedCarList")) return SendErrorMessage(playerid, "Ara� listene bakarken ara� sat�n alamazs�n, ilk �nce kapat.");
                if(GetPVarInt(playerid, "Viewing_DealershipCats")) return SendErrorMessage(playerid, "Zaten galerideki ara� kategorilerine bak�yorsun.");
                if(GetPVarInt(playerid, "Viewing_Dealership")) return SendErrorMessage(playerid, "Zaten galerideki ara� listesine bak�yorsun.");

                PlayerData[playerid][pAtDealership] = b;
                SetPVarInt(playerid, "dealership_category_page", 0);

                Dealership_Show(playerid, 0);
                SelectTextDraw(playerid, COLOR_DARKGREEN);
                return 1;
            }
        }

        SendErrorMessage(playerid, "Yak�n�nda galeri yok.");
        return 1;
    }
    else if(!strcmp(a_string, "hurda"))
    {
        if(!_has_vehicle_spawned[playerid]) return SendServerMessage(playerid, "Spawnlanm�� bir arac�n yok.");
        if (!IsPlayerInAnyVehicle(playerid)) return SendServerMessage(playerid, "Herhangi bir ara�ta de�ilsin.");
        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendServerMessage(playerid, "Arac�n �of�r koltu�unda de�ilsin.");

        new vehicleid = GetPlayerVehicleID(playerid);
        if(CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID]) return SendServerMessage(playerid, "Bu araca sahip de�ilsin.");

        new cash_back;
        for(new i = 0; i < sizeof(DealershipData); i++) if(DealershipData[i][DealershipModel] == CarData[vehicleid][carModel])
        {
            cash_back = DealershipData[i][DealershipPrice] / 2;
        }
        PlayerData[playerid][pBlockGetir] = 1;
        new str[178];
        format(str, sizeof(str), "%s model arac�n� hurdaya ��karmak istiyor musun?\nGeri alaca��n miktar: $%s\n\n{FF6347}Bu i�lem kal�c�d�r ve de�i�tirilemez.", ReturnVehicleName(vehicleid), MoneyFormat(cash_back));
        ConfirmDialog(playerid, "Onay", str, "OnVehicleScrap", CarData[vehicleid][carID], cash_back, vehicleid);
        return 1;
    }
    else if(!strcmp(a_string, "kaput"))
    {
        new
            Float:x,
            Float:y,
            Float:z;

        new engine, lights, alarm, doors, bonnet, boot, objective;

        if(!IsPlayerInAnyVehicle(playerid) && GetNearestVehicle(playerid) != INVALID_VEHICLE_ID)
        {
            GetVehicleHood(GetNearestVehicle(playerid), x, y, z);
            new vehicleid = GetNearestVehicle(playerid);

            if(!IsPlayerInRangeOfPoint(playerid, 2.5, x, y, z))
                return SendServerMessage(playerid, "Arac�n kaputuna yak�n de�ilsin.");

            if(IsValidFactionCar(vehicleid) && PlayerData[playerid][pFaction] != CarData[vehicleid][carFaction] && !FactionData[CarData[vehicleid][carFaction]][FactionCopPerms])
                return SendServerMessage(playerid, "Bu araca eri�imin yok.");

            if(CarData[vehicleid][carLocked])
                return SendServerMessage(playerid, "Bu ara� kilitli.");

            GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
            if(!bonnet)
            {
                SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, 1, boot, objective);
                SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Kaputu a�t�n.");
            }
            else
            {
                SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, 0, boot, objective);
                SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Kaputu kapatt�n.");
            }
        }
        else if(IsPlayerInAnyVehicle(playerid))
        {
            if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
                return SendServerMessage(playerid, "Arac�n �of�r koltu�unda de�ilsin.");

            new
                vehicleid = GetPlayerVehicleID(playerid);

            if(IsValidFactionCar(vehicleid) && PlayerData[playerid][pFaction] != CarData[vehicleid][carFaction] && !FactionData[CarData[vehicleid][carFaction]][FactionCopPerms])
                return SendServerMessage(playerid, "Bu araca eri�imin yok.");

            if(CarData[vehicleid][carLocked])
                return SendServerMessage(playerid, "Bu ara� kilitli.");

            GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
            if(!bonnet)
            {
                SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, 1, boot, objective);
                SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Kaputu a�t�n.");
            }
            else
            {
                SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, 0, boot, objective);
                SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Kaputu kapatt�n.");
            }
        }
        else return SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Herhangi bir arac�n i�inde veya yak�n�nda de�ilsin.");
    }
    else if(!strcmp(a_string, "bagaj"))
    {
        new
            Float:x,
            Float:y,
            Float:z;

        new engine, lights, alarm, doors, bonnet, boot, objective;

        if(!IsPlayerInAnyVehicle(playerid) && GetNearestVehicle(playerid) != INVALID_VEHICLE_ID)
        {
            GetVehicleBoot(GetNearestVehicle(playerid), x, y, z);
            new vehicleid = GetNearestVehicle(playerid);

            if(!IsPlayerInRangeOfPoint(playerid, 2.5, x, y, z)) return SendServerMessage(playerid, "Arac�n bagaj�na yak�n de�ilsin.");

            if(IsValidFactionCar(vehicleid) && PlayerData[playerid][pFaction] != CarData[vehicleid][carFaction] && !FactionData[CarData[vehicleid][carFaction]][FactionCopPerms])
                return SendServerMessage(playerid, "Bu araca eri�imin yok.");

            if(CarData[vehicleid][carLocked]) return SendServerMessage(playerid, "Bu ara� kilitli.");

            GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
            if(!boot)
            {
                SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, 1, objective);
                SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Bagaj� a�t�n.");
                SendClientMessage(playerid, COLOR_WHITE, "SERVER: /kontrol, /silahkoy, /ukoy komutlar�n� kullanabilirsin.");
            }
            else
            {
                SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, 0, objective);
                SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Bagaj� kapatt�n.");
            }
        }
        else if(IsPlayerInAnyVehicle(playerid))
        {
            if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
                return SendServerMessage(playerid, "Arac�n �of�r koltu�unda de�ilsin.");

            new
                vehicleid = GetPlayerVehicleID(playerid);

            if(IsValidFactionCar(vehicleid) && PlayerData[playerid][pFaction] != CarData[vehicleid][carFaction] && !FactionData[CarData[vehicleid][carFaction]][FactionCopPerms])
                return SendServerMessage(playerid, "Bu araca eri�imin yok.");

            if(CarData[vehicleid][carLocked]) return SendServerMessage(playerid, "Bu ara� kilitli.");

            GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
            if(!boot)
            {
                SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, 1, objective);
                SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Bagaj� a�t�n.");
                SendClientMessage(playerid, COLOR_WHITE, "SERVER: /kontrol, /silahkoy, /ukoy komutlar�n� kullanabilirsin.");
            }
            else
            {
                SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, 0, objective);
                SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Bagaj� kapatt�n.");
            }
        }
        else return SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Herhangi bir arac�n i�inde veya yak�n�nda de�ilsin.");
    }
    else if(!strcmp(a_string, "cezalar"))
    {
        if(PlayerData[playerid][pDrivingTest]) return SendServerMessage(playerid, "Ehliyet s�nav�ndayken bu komutu kullanamazs�n.");
        if(PlayerData[playerid][pTaxiDrivingTest]) return SendServerMessage(playerid, "Taksi s�nav�ndayken bu komutu kullanamazs�n.");

        if(!_has_vehicle_spawned[playerid]) return SendServerMessage(playerid, "Spawnlanm�� bir arac�n yok.");
        if (!IsPlayerInAnyVehicle(playerid)) return SendServerMessage(playerid, "Herhangi bir ara�ta de�ilsin.");
        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendServerMessage(playerid, "Arac�n �of�r koltu�unda de�ilsin.");

        new vehicleid = GetPlayerVehicleID(playerid);
        if(CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID]) return SendServerMessage(playerid, "Bu araca sahip de�ilsin.");
        if(!CountVehicleFines(vehicleid)) return SendServerMessage(playerid, "Bu arac�n herhangi bir cezas� yok.");

        Vehicle_ShowFines(vehicleid, playerid, playerid);
        return 1;
    }
    else if(!strcmp(a_string, "cezaode"))
    {
        new h = -1;
        if((h = IsPlayerInProperty(playerid)) == -1)
        {
            if(PropertyData[h][PropertyFaction] != -1)
            {
                if(FactionData[PropertyData[h][PropertyFaction]][FactionCopPerms])
                {
                    if(!_has_vehicle_spawned[playerid]) return SendErrorMessage(playerid, "Spawnlanm�� bir arac�n yok.");

                    new vehicleid = _has_spawned_vehicleid[playerid];
                    if(CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID])
                        return SendErrorMessage(playerid, "Bu araca sahip de�ilsin.");

                    if(!CountVehicleFines(vehicleid))
                        return SendErrorMessage(playerid, "Bu arac�n herhangi bir cezas� yok.");

                    if(PlayerData[playerid][pMoney] < CountVehicleFinesTotal(vehicleid))
                        return SendErrorMessage(playerid, "Cezay� �demek i�in yeterli paran yok.");

                    SendClientMessageEx(playerid, COLOR_YELLOW, "[-] Para cezalar�n� �dedin. Tutar: $%s.", MoneyFormat(CountVehicleFinesTotal(vehicleid)));
                    GiveMoney(playerid, -CountVehicleFinesTotal(vehicleid));
                    ClearVehicleFines(vehicleid);
                }
            }
        }

        SendServerMessage(playerid, "Yak�n�nda ceza �deyebilece�in bir nokta bulunmuyor.");
        return 1;
    }
    else if(!strcmp(a_string, "sat"))
    {
        new playerb, price;
        if(!isnull(b_string) && !strcmp(b_string, "iptal", true))
        {
            if(VehicleOfferedTo[playerid] == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_ADM, "HATA: Ara� satmak i�in teklif yapmad�n.");

            SendClientMessageEx(playerid, COLOR_ACTION, "SERVER: Teklifini iptal ettin. %s adl� ki�i bilgilendirildi.", ReturnName(VehicleOfferedTo[playerid]));
            SendClientMessageEx(VehicleOfferedTo[playerid], COLOR_ACTION, "SERVER: %s adl� ki�i teklifini iptal etti.", ReturnName(playerid));

            VehicleOfferedTo[VehicleOfferBy[playerid]] = INVALID_PLAYER_ID;
            VehicleOfferBy[playerid] = INVALID_PLAYER_ID;

            VehiclePrice[playerid] = 0;
            VehicleDBIDOffered[VehicleOfferedTo[playerid]] = 0;
            return 1;
        }

        if(!_has_vehicle_spawned[playerid])
            return SendServerMessage(playerid, "Spawnlanm�� bir arac�n yok.");
        if (!IsPlayerInAnyVehicle(playerid))
            return SendServerMessage(playerid, "Herhangi bir ara�ta de�ilsin.");
        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
            return SendServerMessage(playerid, "Arac�n �of�r koltu�unda de�ilsin.");

        new
            vehicleid = GetPlayerVehicleID(playerid);

        if(CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID])
            return SendServerMessage(playerid, "Bu araca sahip de�ilsin.");
        if(VehicleOfferedTo[playerid] != INVALID_PLAYER_ID)
            return SendServerMessage(playerid, "Zaten teklifini yapt�n, cevap i�in beklemelisin.");
        if(sscanf(b_string, "ui", playerb, price))
            return SendUsageMessage(playerid, "/arac sat [oyuncu ID/isim] [fiyat]");
        if(!IsPlayerConnected(playerb))
            return SendServerMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
        if(!pLoggedIn[playerb])
            return SendServerMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
        if(!GetDistanceBetweenPlayers(playerid, playerb, 4.5))
            return SendServerMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
        if(price < 1)
            return SendServerMessage(playerid, "Ge�ersiz fiyat.");
        if(VehicleOfferBy[playerb] != INVALID_PLAYER_ID)
            return SendServerMessage(playerid, "Bu ki�iye �u anda bir teklif yap�lm��.");
        if(FreePlayerCarID(playerb) == -1)
            return SendServerMessage(playerid, "Bu ki�i daha fazla araca sahip olamaz.");
        if(playerid == playerb)
            return SendServerMessage(playerid, "Kendine ara� satamazs�n.");

        if(_has_vehicle_spawned[playerb]) return SendServerMessage(playerid, "Satmak istedi�in ki�i t�m ara�lar�n� gizlemeli.");

        format(string, sizeof(string), "%s adl� ki�iye %s model arac�n� $%s kar��l���nda satmak istedi�ine emin misin?", ReturnName(playerb, 1), ReturnVehicleName(vehicleid), MoneyFormat(price));
        ConfirmDialog(playerid, "Onay", string, "OnVehicleOffer", playerb, price);
        return 1;
    }
    else if(!strcmp(a_string, "kabul"))
    {
        if(VehicleOfferBy[playerid] == INVALID_PLAYER_ID)
            return SendClientMessage(playerid, COLOR_ADM, "HATA: Sana g�nderilen bir teklif bulunamad�.");

        if(!strcmp(b_string, "evet", true))
        {
            if(!GetDistanceBetweenPlayers(playerid, VehicleOfferBy[playerid], 4.5))
            {
                SendClientMessageEx(playerid, COLOR_ACTION, "SERVER: Teklifi yapan %s adl� ki�iye yak�n olmad���n i�in sat�� iptal edildi.", ReturnName(VehicleOfferBy[playerid]));
                VehicleOfferedTo[VehicleOfferBy[playerid]] = INVALID_PLAYER_ID;
                VehicleOfferBy[playerid] = INVALID_PLAYER_ID;

                VehiclePrice[playerid] = 0;
                VehicleDBIDOffered[playerid] = 0;
                return 1;
            }

            if(VehiclePrice[playerid] > PlayerData[playerid][pMoney])
            {
                SendClientMessageEx(playerid, COLOR_ACTION, "SERVER: Yeterli paran yok, sat�� iptal edildi.", ReturnName(VehicleOfferBy[playerid]));
                SendClientMessageEx(VehicleOfferBy[playerid], COLOR_ACTION, "SERVER: %s adl� ki�inin yeterli paras� yok.", ReturnName(playerid));

                VehicleOfferedTo[VehicleOfferBy[playerid]] = INVALID_PLAYER_ID;
                VehicleOfferBy[playerid] = INVALID_PLAYER_ID;

                VehiclePrice[playerid] = 0;
                VehicleDBIDOffered[playerid] = 0;
                return 1;
            }

            new slot, foundCar = -1;

            for(new i = 1, j = GetVehiclePoolSize(); i <= j; i++)
            {
                if(CarData[i][carID] == VehicleDBIDOffered[playerid])
                {
                    foundCar = i;
                }
            }
            if(foundCar == -1)
            {
                SendClientMessageEx(playerid, COLOR_ACTION, "SERVER: Hata olu�tu, %s adl� ki�inin arac� spawn olmam��.", ReturnName(VehicleOfferBy[playerid]));
                SendClientMessageEx(VehicleOfferBy[playerid], COLOR_ACTION, "SERVER: Hata olu�tu, arac�n spawnlanmam��.", ReturnName(playerid));

                VehicleOfferedTo[VehicleOfferBy[playerid]] = INVALID_PLAYER_ID;
                VehicleOfferBy[playerid] = INVALID_PLAYER_ID;

                VehiclePrice[playerid] = 0;
                VehicleDBIDOffered[playerid] = 0;
                return 1;
            }

            _has_vehicle_spawned[VehicleOfferBy[playerid]] = false;
            _has_spawned_vehicleid[VehicleOfferBy[playerid]] = INVALID_VEHICLE_ID;

            SendClientMessageEx(VehicleOfferBy[playerid], COLOR_ACTION, "SERVER: %s senin teklifini kabul etti! (%s)", ReturnName(playerid), Time());
            SendClientMessageEx(playerid, COLOR_ACTION, "SERVER: %s adl� ki�inin teklifini kabul ettin! (%s)", ReturnName(VehicleOfferBy[playerid]), Time());

            LogPlayerAction(playerid, sprintf("%s isimli ki�inin ara� sat���n� (DBID: %i) kabul etti. (Fiyat: $%s)", ReturnName(VehicleOfferBy[playerid]), VehicleDBIDOffered[playerid], MoneyFormat(VehiclePrice[playerid])));

            slot = FreePlayerCarID(playerid);
            PlayerData[playerid][pOwnedCar][slot] = VehicleDBIDOffered[playerid];

            for(new i = 1; i < MAX_OWNED_CARS; i++)
            {
                if(PlayerData[VehicleOfferBy[playerid]][pOwnedCar][i] == VehicleDBIDOffered[playerid])
                {
                    PlayerData[VehicleOfferBy[playerid]][pOwnedCar][i] = 0;
                }
            }

            CarData[foundCar][carOwnerID] = PlayerData[playerid][pSQLID];
            Car_Save(foundCar);

            GiveMoney(playerid, -VehiclePrice[VehicleOfferBy[playerid]]);
            GiveMoney(VehicleOfferBy[playerid], VehiclePrice[VehicleOfferBy[playerid]]);

            Player_Save(playerid); Player_Save(VehicleOfferBy[playerid]);
            RefreshPlayerCarSlots(VehicleOfferBy[playerid]);

            Car_Save(foundCar);

            SendClientMessage(playerid, COLOR_DARKGREEN, "Arac� sat�n ald�n ve /arac getir ile tekrar spawnlamal�s�n.");
            Vehicle_DefaultValues(foundCar);
            DestroyVehicle(foundCar);

            VehiclePrice[playerid] = 0;
            VehicleDBIDOffered[playerid] = 0;

            VehiclePrice[VehicleOfferBy[playerid]] = 0;
            VehicleDBIDOffered[VehicleOfferBy[playerid]] = 0;

            VehicleOfferedTo[VehicleOfferBy[playerid]] = INVALID_PLAYER_ID;
            VehicleOfferBy[playerid] = INVALID_PLAYER_ID;
        }
        else if(!strcmp(b_string, "hayir", true))
        {
            SendClientMessageEx(VehicleOfferBy[playerid], COLOR_ACTION, "SERVER: %s teklifini reddetti.", ReturnName(playerid));
            SendClientMessageEx(playerid, COLOR_ACTION, "SERVER: %s adl� ki�inin teklifini reddettin.", ReturnName(VehicleOfferBy[playerid]));

            VehiclePrice[playerid] = 0;
            VehicleDBIDOffered[playerid] = 0;

            VehiclePrice[VehicleOfferBy[playerid]] = 0;
            VehicleDBIDOffered[VehicleOfferBy[playerid]] = 0;

            VehicleOfferedTo[VehicleOfferBy[playerid]] = INVALID_PLAYER_ID;
            VehicleOfferBy[playerid] = INVALID_PLAYER_ID;
        }
        else return SendClientMessage(playerid, COLOR_ADM, "SERVER: Cevap evet ya da hayir olmal�.");
    }
    else if(!strcmp(a_string, "benzin"))
    {
        if(!IsPlayerInAnyVehicle(playerid)) return SendServerMessage(playerid, "Herhangi bir ara�ta de�ilsin.");
        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendServerMessage(playerid, "Arac�n �of�r koltu�unda de�ilsin.");
        if(PlayerRefilling[playerid]) return SendServerMessage(playerid, "Benzin doldurma i�lemi yap�yorsun.");

        if(GetPVarInt(playerid, "AtBusiness") != -1)
        {
            new b = GetPVarInt(playerid, "AtBusiness");
            if(IsPlayerInRangeOfPoint(playerid, 7.0, BusinessData[b][EnterPos][0], BusinessData[b][EnterPos][1], BusinessData[b][EnterPos][2]))
            {
                if(BusinessData[b][BusinessType] != BUSINESS_GASSTATION) return SendErrorMessage(playerid, "Bu i�yeri benzinlik de�il.");

                new
                    vehicleid = GetPlayerVehicleID(playerid),
                    vehicleType;

                if(GetVehicleModelInfoAsInt(GetVehicleModel(vehicleid), "TransMissionData_nEngineType") == 'P')
                    vehicleType = FUEL_TYPE_PETROL;
                else if(GetVehicleModelInfoAsInt(GetVehicleModel(vehicleid), "TransMissionData_nEngineType") == 'D')
                    vehicleType = FUEL_TYPE_DIESEL;
                else
                    vehicleType = FUEL_TYPE_ELECTRIC;

                new primary_str[512], sub_str[128];
                if(CarData[vehicleid][carFuel] > 99.0)
                {
                    format(sub_str, sizeof(sub_str), "Benzinin dolu oldu�u i�in daha fazla dolduramazs�n.");
                    strcat(primary_str, sub_str);
                }
                else
                {
                    format(sub_str, sizeof(sub_str), "{FFFFFF}Yak�t Tipi: {FFFF00}%s\n", GetFuelTypeAsString(vehicleType));
                    strcat(primary_str, sub_str);

                    format(sub_str, sizeof(sub_str), "{FFFFFF}�uanki Yak�t: {FFFF00}%s\n", CarData[vehicleid][carFuel]);
                    strcat(primary_str, sub_str);

                    format(sub_str, sizeof(sub_str), "{FFFFFF}Al�nacak Miktar: {FFFF00}%s\n", 100-CarData[vehicleid][carFuel]);
                    strcat(primary_str, sub_str);
                }

                ConfirmDialog(playerid, "Onay", primary_str, "OnConfirmFuel", vehicleType, b);
                return 1;
            }
        }

        SendErrorMessage(playerid, "Yak�n�nda benzinlik yok.");
        return 1;
    }
    else if(!strcmp(a_string, "kapi")) return cmd_arackapi(playerid, "");
    else if(!strcmp(a_string, "far")) return cmd_far(playerid, "");
    else if(!strcmp(a_string, "kilit"))
    {
        new bool:foundCar = false, vehicleid, Float: fetchPos[3];

        for (new i = 0; i < MAX_VEHICLES; i++)
        {
            GetVehiclePos(i, fetchPos[0], fetchPos[1], fetchPos[2]);
            if(IsPlayerInRangeOfPoint(playerid, 4.0, fetchPos[0], fetchPos[1], fetchPos[2]))
            {
                foundCar = true;
                vehicleid = i;
                break;
            }
        }

        if(foundCar == true)
        {
            if(IsValidPlayerCar(vehicleid))
            {
                if(PlayerData[playerid][pSQLID] != CarData[vehicleid][carOwnerID] && PlayerData[playerid][pCarKey] != CarData[vehicleid][carID] && !IsWindowOpened(vehicleid))
                {
                    SendServerMessage(playerid, "Bu araca eri�imin yok.");
                    SendServerMessage(playerid, "E�er bu arac� �almak istiyorsan�z: {FFFFFF}\"/kilit kir\"");
                    SendServerMessage(playerid, "E�er bu arac� sakince �almak istiyorsan�z: {FFFFFF}\"/kilit skir\"");
                    return 1;
                }

                if(!CarData[vehicleid][carLocked])
                {
                    ToggleVehicleLock(vehicleid, true);
                    CarData[vehicleid][carLocked] = true;
                    GameTextForPlayer(playerid, sprintf("~r~%s KILITLENDI", ReturnVehicleName(vehicleid)), 3000, 4);
                    PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
                }
                else
                {
                    ToggleVehicleLock(vehicleid, false);
                    CarData[vehicleid][carLocked] = false;
                    GameTextForPlayer(playerid, sprintf("~g~%s ACILDI", ReturnVehicleName(vehicleid)), 3000, 4);
                    PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
                }
            }
            else if(IsValidFactionCar(vehicleid))
            {
                if(PlayerData[playerid][pFaction] != CarData[vehicleid][carFaction] && !PlayerData[playerid][pAdminDuty])
                {
                    SendServerMessage(playerid, "Bu araca eri�imin yok.");
                    return 1;
                }

                if(!CarData[vehicleid][carLocked])
                {
                    ToggleVehicleLock(vehicleid, true);
                    CarData[vehicleid][carLocked] = true;
                    GameTextForPlayer(playerid, sprintf("~r~%s KILITLENDI", ReturnVehicleName(vehicleid)), 2000, 4);
                    PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
                }
                else
                {
                    ToggleVehicleLock(vehicleid, false);
                    CarData[vehicleid][carLocked] = false;
                    GameTextForPlayer(playerid, sprintf("~g~%s ACILDI", ReturnVehicleName(vehicleid)), 2000, 4);
                    PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
                }
            }
            else if(IsValidRentalCar(vehicleid))
            {
                if(CarData[vehicleid][carRentedBy] != PlayerData[playerid][pSQLID] && !PlayerData[playerid][pAdminDuty])
                {
                    GameTextForPlayer(playerid, "Anahtarlarin yok.", 2000, 6);
                    return 1;
                }

                if(!CarData[vehicleid][carLocked])
                {
                    ToggleVehicleLock(vehicleid, true);
                    CarData[vehicleid][carLocked] = true;
                    GameTextForPlayer(playerid, sprintf("~r~%s KILITLENDI", ReturnVehicleName(vehicleid)), 3000, 6);
                    PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
                }
                else
                {
                    ToggleVehicleLock(vehicleid, false);
                    CarData[vehicleid][carLocked] = false;
                    GameTextForPlayer(playerid, sprintf("~g~%s ACILDI", ReturnVehicleName(vehicleid)), 3000, 6);
                    PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
                }
            }
            else return GameTextForPlayer(playerid, "~r~Bu aracin kilidi yok.", 2000, 6);
        }
        else SendClientMessage(playerid, COLOR_ADM, "SERVER: Herhangi bir arac�n yak�n�nda de�ilsin.");
    }
    else if(!strcmp(a_string, "anahtarkopyala"))
    {
        if(!_has_vehicle_spawned[playerid]) return SendServerMessage(playerid, "Spawnlanm�� bir arac�n yok.");
        if (!IsPlayerInAnyVehicle(playerid)) return SendServerMessage(playerid, "Herhangi bir ara�ta de�ilsin.");
        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendServerMessage(playerid, "Arac�n �of�r koltu�unda de�ilsin.");
        if (PlayerData[playerid][pMoney] < 750) return SendServerMessage(playerid, "Yeterli paran yok. ($750)");

        static playerb;
        if(sscanf(b_string, "i", playerb)) return SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /arac anahtarkopyala [oyuncu ID/isim]");
        if(playerid == playerb) return SendServerMessage(playerid, "Bu komutu kendi �st�nde kullanamazs�n.");
        if(!IsPlayerConnected(playerb)) return SendServerMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
        if(!pLoggedIn[playerb]) return SendServerMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
        if(!GetDistanceBetweenPlayers(playerid, playerb, 4.5)) return SendServerMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
        if(PlayerData[playerb][pCarKey] != 0) return SendServerMessage(playerid, "Belirtti�in ki�inin zaten kopyalanm�� bir anahtar� bulunuyor.");
        if(PlayerData[playerb][pCarKey] == CarData[_has_spawned_vehicleid[playerid]][carID]) return SendServerMessage(playerid, "Belirtti�in ki�ide zaten senin arac�n�n anahtarlar� var.");

        SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}%s adl� ki�iye %s arac�n�n anahtar�n� verdin.", ReturnName(playerb), ReturnVehicleName(_has_spawned_vehicleid[playerid]));
        SendClientMessageEx(playerb, COLOR_ADM, "[ ! ] {FFFFFF}%s sana %s adl� arac�n�n anahtarlar�n� verdi.", ReturnName(playerid), ReturnVehicleName(_has_spawned_vehicleid[playerid]));
        SetPlayerChatBubble(playerid, sprintf("* %s, %s adl� ki�iye arac�n�n anahtar�n� verir.", ReturnName(playerid, 0), ReturnName(playerb, 0)), COLOR_ACTION, 20.0, 3000);
        SaveSQLInt(PlayerData[playerb][pSQLID], "players", "CarKey", CarData[_has_spawned_vehicleid[playerid]][carID]);
        PlayerData[playerb][pCarKey] = CarData[_has_spawned_vehicleid[playerid]][carID];
        GiveMoney(playerid, -750);
        return 1;
    }
    else if(!strcmp(a_string, "anahtarbirak"))
    {
        if(IsPlayerInAnyVehicle(playerid)) return SendErrorMessage(playerid, "Ara�tayken bu komutu kullanamazs�n.");
        if(!PlayerData[playerid][pCarKey]) return SendErrorMessage(playerid, "Hi� kopyalanm�� anahtar�n bulunmuyor.");
        SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Ba�kas�ndan ald���n yedek anahtarlar� b�rakt�n.");
        PlayerData[playerid][pCarKey] = 0;
        return 1;
    }
    else if(!strcmp(a_string, "anahtaral"))
    {
        if(!_has_vehicle_spawned[playerid]) return SendServerMessage(playerid, "Spawnlanm�� bir arac�n yok.");
        if(!IsPlayerInAnyVehicle(playerid)) return SendServerMessage(playerid, "Herhangi bir ara�ta de�ilsin.");
        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendServerMessage(playerid, "Arac�n �of�r koltu�unda de�ilsin.");

        new vehicleid = GetPlayerVehicleID(playerid);
        if(CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID]) return SendServerMessage(playerid, "Bu araca sahip de�ilsin.");

        new id;
        if(sscanf(b_string, "u", id)) return SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /arac anahtaral [oyuncu ID/ad�]");
        if(playerid == id) return SendErrorMessage(playerid, "Bu komutu kendi �zerinde kullanamazs�n.");
        if(!IsPlayerConnected(id)) return SendServerMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
        if(!pLoggedIn[id]) return SendServerMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
        if(!GetDistanceBetweenPlayers(playerid, id, 4.5)) return SendServerMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
        if(PlayerData[id][pCarKey] != CarData[vehicleid][carID]) return SendErrorMessage(playerid, "Belirtti�in ki�ide kopyalanm�� anahtar�n bulunmuyor.");
        if(!PlayerData[id][pCarKey]) return SendErrorMessage(playerid, "Belirtti�in ki�ide kopyalanm�� anahtar�n bulunmuyor.");
        SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}%s isimli oyuncunun %s arac�n�n yedek anahtarlar�na el koydun.", ReturnName(id, 0), ReturnVehicleName(_has_spawned_vehicleid[playerid]));
        SendClientMessageEx(id, COLOR_ADM, "[ ! ] {FFFFFF}%s sana verdi�i %s arac�n�n yedek anahtarlar�na el koydu.", ReturnName(playerid, 0), ReturnVehicleName(_has_spawned_vehicleid[playerid]));
        PlayerData[id][pCarKey] = 0;
        return 1;
    }
    else if(!strcmp(a_string, "fiyat"))
    {
        new model[32];
        if(sscanf(b_string, "s[32]", model)) return SendClientMessage(playerid, COLOR_ACTION, "KULLANIM: /arac fiyat [model ID/ad�]");

        if(GetPVarInt(playerid, "AtBusiness") != -1)
        {
            new b = GetPVarInt(playerid, "AtBusiness");
            if(IsPlayerInRangeOfPoint(playerid, 10.0, BusinessData[b][EnterPos][0], BusinessData[b][EnterPos][1], BusinessData[b][EnterPos][2]))
            {
                if(BusinessData[b][BusinessType] != BUSINESS_DEALERSHIP) return SendErrorMessage(playerid, "Bu i�yeri galeri de�il.");
                if((model[0] = GetVehicleModelByName(model)) == 0) return SendErrorMessage(playerid, "Hatal� model ID/ad� girdiniz.");

                new vehicleid;
                foreach(new i : Dealerships) if(DealershipData[i][DealershipModel] == model[0])
                {
                    vehicleid = i;
                    break;
                }


                new sub_str[90], primary_str[512], title[70];
                new car_price = DealershipData[vehicleid][DealershipPrice];
                format(title, sizeof(title), "%s Bilgileri G�steriliyor", DealershipData[vehicleid][DealershipModelName]);
                format(sub_str, sizeof(sub_str), "{33AA33}%s {FFFFFF}fiyat� eklentisiz {33AA33}$%s{FFFFFF},\n\n", DealershipData[vehicleid][DealershipModelName], MoneyFormat(DealershipData[vehicleid][DealershipPrice]));
                strcat(primary_str, sub_str);

                strcat(primary_str, "5 seviye kilit fiyatlar�:\n");
                format(sub_str, sizeof(sub_str), "{33AA33}$0, $%s, $%s, $%s, $%s\n\n", MoneyFormat(floatround(car_price * 0.15 * 1)), MoneyFormat(floatround(car_price * 0.15 * 2)), MoneyFormat(floatround(car_price * 0.15 * 3)), MoneyFormat(floatround(car_price * 0.15 * 4)));
                strcat(primary_str, sub_str);

                strcat(primary_str, "{FFFFFF}4 seviye alarm fiyatlar�:\n");
                format(sub_str, sizeof(sub_str), "{33AA33}$%s, $%s, $%s, $%s\n\n", MoneyFormat(floatround(car_price * 0.20 * 1)), MoneyFormat(floatround(car_price * 0.20 * 2)), MoneyFormat(floatround(car_price * 0.20 * 3)), MoneyFormat(floatround(car_price * 0.20 * 4)));
                strcat(primary_str, sub_str);

                strcat(primary_str, "{FFFFFF}4 seviye immobiliser fiyatlar�:\n");
                format(sub_str, sizeof(sub_str), "{33AA33}$%s, $%s, $%s, $%s\n\n", MoneyFormat(floatround(car_price * 0.23 * 1)), MoneyFormat(floatround(car_price * 0.23 * 2)), MoneyFormat(floatround(car_price * 0.23 * 3)), MoneyFormat(floatround(car_price * 0.23 * 4)));
                strcat(primary_str, sub_str);

                strcat(primary_str, "{FFFFFF}3 seviye sigorta fiyatlar�:\n");
                format(sub_str, sizeof(sub_str), "{33AA33}$%s, $%s, $%s\n\n", MoneyFormat(floatround(car_price * 0.25 * 1)), MoneyFormat(floatround(car_price * 0.25 * 2)), MoneyFormat(floatround(car_price * 0.25 * 3)));
                strcat(primary_str, sub_str);

                Dialog_Show(playerid, DIALOG_USE, DIALOG_STYLE_MSGBOX, title, primary_str, "Tamam!", "");
                return 1;
            }
        }

        SendErrorMessage(playerid, "Yak�n�nda galeri yok.");
        return 1;
    }

    else if(!strcmp(a_string, "benzinkutusu"))
    {
        if(PlayerData[playerid][pGascan] < 1)
            return SendErrorMessage(playerid, "Benzin kutunuz yok.");

        new vehicleid = GetNearestVehicle(playerid);

        if(vehicleid == INVALID_VEHICLE_ID)
            return SendErrorMessage(playerid, "Yak�n�n�zda bir ara� yok.");

        if(IsABike(vehicleid))
            return SendErrorMessage(playerid, "Bu ara� yak�tla �al��m�yor.");

        if(CarData[vehicleid][carFuel] >= 85.00)
            CarData[vehicleid][carFuel] = 100.0;

        else CarData[vehicleid][carFuel] += 15.0;

        PlayerData[playerid][pGascan]--;

        SendServerMessage(playerid, "Arac�n yak�t de�erine 15 eklendi.");
    }

    else return SendClientMessage(playerid, COLOR_ADM, "SERVER: Hatal� parametre girdiniz.");
    return true;
}

CMD:cw(playerid, params[]) return cmd_carwhisper(playerid, params);
CMD:carwhisper(playerid, params[])
{
    if(!IsPlayerInAnyVehicle(playerid)) return SendServerMessage(playerid, "Herhangi bir ara�ta de�ilsin.");

    new vehicleid = GetPlayerVehicleID(playerid);
    if(IsAMotorBike(vehicleid) > 0) return SendErrorMessage(playerid, "Motorsikletteyken f�s�ldayamazs�n.");
    if(isnull(params)) return SendUsageMessage(playerid, "/cw [mesaj]");

    foreach(new i : Player)
    {
        if(IsPlayerInVehicle(i, vehicleid))
        {
            if(strlen(params) > 75)
            {
                SendClientMessageEx(i, COLOR_YELLOW, "%s (f�s�ldar): %.75s...", ReturnName(playerid, 0), params);
                SendClientMessageEx(i, COLOR_YELLOW, "...%s", params[75]);
            }
            else SendClientMessageEx(i, COLOR_YELLOW, "%s (f�s�ldar): %s", ReturnName(playerid, 0), params);
        }

        if(SpectateID[i] == playerid)
        {
            if(strlen(params) > 75)
            {
                SendClientMessageEx(i, COLOR_ADM, "[CW] [%i] %s: %.75s...", playerid, ReturnName(playerid), params);
                SendClientMessageEx(i, COLOR_ADM, "...%s", params[75]);
            }
            else SendClientMessageEx(i, COLOR_ADM, "[CW] [%i] %s: %s", playerid,ReturnName(playerid), params);
        }
    }
    return 1;
}

CMD:cb(playerid, params[])
{
    if(!IsPlayerInAnyVehicle(playerid)) return SendServerMessage(playerid, "Herhangi bir ara�ta de�ilsin.");

    new vehicleid = GetPlayerVehicleID(playerid);
    if(IsAMotorBike(vehicleid) > 0) return SendErrorMessage(playerid, "Motorsikletteyken f�s�ldayamazs�n.");
    if(isnull(params)) return SendUsageMessage(playerid, "/cb [mesaj]");

    foreach(new i : Player)
    {
        if(IsPlayerInVehicle(i, vehicleid))
        {
            if(strlen(params) > 75)
            {
                SendClientMessageEx(i, COLOR_YELLOW, "(( [%i] %s: %.75s...", playerid, ReturnName(playerid, 1), params);
                SendClientMessageEx(i, COLOR_YELLOW, "...%s ))", params[75]);
            }
            else SendClientMessageEx(i, COLOR_YELLOW, "(( [%i] %s: %s ))", playerid, ReturnName(playerid, 1), params);
        }

        if(SpectateID[i] == playerid)
        {
            if(strlen(params) > 75)
            {
                SendClientMessageEx(i, COLOR_ADM, "[CB] [%i] %s: %.75s...", playerid, ReturnName(playerid), params);
                SendClientMessageEx(i, COLOR_ADM, "...%s", params[75]);
            }
            else SendClientMessageEx(i, COLOR_ADM, "[CB] [%i] %s: %s", playerid, ReturnName(playerid), params);
        }
    }
    return 1;
}

CMD:unimpound(playerid, params[])
{
	if(!_has_vehicle_spawned[playerid] && !PlayerData[playerid][pAdminDuty])
		return SendClientMessage(playerid, COLOR_ADM, "SERVER: Spawnlanm�� bir arac�n yok.");

	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
		return SendClientMessage(playerid, COLOR_ADM, "SERVER: Ara� s�rm�yorsun.");

	new
		vehicleid = GetPlayerVehicleID(playerid);

	if(PlayerData[playerid][pSQLID] != CarData[vehicleid][carOwnerID])
		return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bu ara� sana ait de�il.");

	if(CarData[vehicleid][carImpounded] == -1)
		return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bu ara� �ekilmemi�.");

	if(CarData[vehicleid][carImpounded] != -1)
	{
		getdate(year, month, day);
		gettime(hour, minute, second);

		if(mktime(hour, minute, second, day, month, year) < CarData[vehicleid][carImpoundTime])
		{
			SendClientMessageEx(playerid, COLOR_ADM, "%s model arac�n�z� alman�z i�in %s tarihini beklemelisiniz.", ReturnVehicleName(vehicleid), GetFullTime(CarData[vehicleid][carImpoundTime]));
			SendClientMessageEx(playerid, COLOR_ADM, "Arac�n�z�n �ekilme sebebi %s olarak g�z�k�yor.", CarData[vehicleid][carImpoundReason]);
			return 1;
		}
	}

	CarData[vehicleid][carImpounded] = -1;
	GiveMoney(playerid, -500);

	SendClientMessage(playerid, COLOR_DARKGREEN, "$500 �dediniz ve arac�n�z� �ekiciden kurtard�n�z.");
	Car_Save(vehicleid);
	return 1;
}

CMD:aracaat(playerid, params[])
{
    if(IsPlayerInAnyVehicle(playerid)) return SendErrorMessage(playerid, "Ara� i�inde bu komutu kullanamazs�n.");
    if(PlayerData[playerid][pBrutallyWounded]) return SendErrorMessage(playerid, "Yaral�yken bu komutu kullanamazs�n.");
    if(PlayerData[playerid][pHandcuffed]) return SendErrorMessage(playerid, "Kelep�eliyken bu komutu kullanamazs�n.");

    new id, koltuk[4];
    if(sscanf(params, "us[4]", id, koltuk)) return SendUsageMessage(playerid, "/aracaat [osag, asol, asag]");
    if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
    if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
    if(!GetDistanceBetweenPlayers(playerid, id, 4.5)) return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
    if(!PlayerData[id][pBrutallyWounded]) return SendErrorMessage(playerid, "Belirtti�in ki�i yaral� de�il.");

    new vehicleid;
    if(GetNearestVehicle(playerid) == INVALID_VEHICLE_ID) return SendErrorMessage(playerid, "Yak�n�nda ara� yok.");

    vehicleid = GetNearestVehicle(playerid);
    if(CarData[vehicleid][carLocked]) return SendErrorMessage(playerid, "Bu ara� kilitli.");

    if(!strcmp(koltuk, "osag"))
    {
        if(!IsSeatAvailable(vehicleid, 1)) return SendErrorMessage(playerid, "Bu koltuk dolu g�z�k�yor.");
        PutPlayerInVehicle(id, vehicleid, 1);
        return 1;
    }
    else if(!strcmp(params, "asol"))
    {
        if(!IsSeatAvailable(vehicleid, 2)) return SendErrorMessage(playerid, "Bu koltuk dolu g�z�k�yor.");
        PutPlayerInVehicle(id, vehicleid, 2);
        return 1;
    }
    else if(!strcmp(params, "asag"))
    {
        if(!IsSeatAvailable(vehicleid, 3)) return SendErrorMessage(playerid, "Bu koltuk dolu g�z�k�yor.");
        PutPlayerInVehicle(id, vehicleid, 3);
        return 1;
    }
    else SendClientMessage(playerid, COLOR_ADM, "SERVER: Hatal� parametre girdiniz.");
    return 1;
}

CMD:cam(playerid, params[])return cmd_araccam(playerid, params);
CMD:araccam(playerid, params[])
{
    if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Herhangi bir ara� i�erisinde de�ilsin.");

    new vehicleid = GetPlayerVehicleID(playerid);
    if(!IsWindowedVehicle(vehicleid)) return SendErrorMessage(playerid, "Bu arac�n cam� yok.");
    if(PlayerData[playerid][pHandcuffed]) return SendErrorMessage(playerid, "Kelep�eliyken bu komutu kullanamazs�n.");
    if(isnull(params)) return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /araccam [hepsi, osol, osag, asol, asag]");

    GetVehicleParamsCarWindows(vehicleid, CarData[vehicleid][carWindows][0], CarData[vehicleid][carWindows][1], CarData[vehicleid][carWindows][2], CarData[vehicleid][carWindows][3]);

    if(!strcmp(params, "hepsi"))
    {
        for(new i; i < 4; i++) CarData[vehicleid][carWindows][i] = !CarData[vehicleid][carWindows][i];
        SetVehicleParamsCarWindows(vehicleid, CarData[vehicleid][carWindows][0], CarData[vehicleid][carWindows][1], CarData[vehicleid][carWindows][2], CarData[vehicleid][carWindows][3]);
        cmd_ame(playerid, sprintf("arac�n�n b�t�n camlar�n� %s.", (CarData[vehicleid][carWindows][0] != 0) ? ("kapat�r") : ("a�ar")));
        return 1;
    }
    else if(!strcmp(params, "osol"))
    {
        CarData[vehicleid][carWindows][0] = !CarData[vehicleid][carWindows][0];
        SetVehicleParamsCarWindows(vehicleid, CarData[vehicleid][carWindows][0], CarData[vehicleid][carWindows][1], CarData[vehicleid][carWindows][2], CarData[vehicleid][carWindows][3]);
        cmd_ame(playerid, sprintf("�n sol cam� %s.", (CarData[vehicleid][carWindows][0] != 0) ? ("kapat�r") : ("a�ar")));
        return 1;
    }
    else if(!strcmp(params, "osag"))
    {
        CarData[vehicleid][carWindows][1] = !CarData[vehicleid][carWindows][1];
        SetVehicleParamsCarWindows(vehicleid, CarData[vehicleid][carWindows][0], CarData[vehicleid][carWindows][1], CarData[vehicleid][carWindows][2], CarData[vehicleid][carWindows][3]);
        cmd_ame(playerid, sprintf("�n sa� cam� %s.", (CarData[vehicleid][carWindows][1] != 0) ? ("kapat�r") : ("a�ar")));
        return 1;
    }
    else if(!strcmp(params, "asol"))
    {
        CarData[vehicleid][carWindows][2] = !CarData[vehicleid][carWindows][2];
        SetVehicleParamsCarWindows(vehicleid, CarData[vehicleid][carWindows][0], CarData[vehicleid][carWindows][1], CarData[vehicleid][carWindows][2], CarData[vehicleid][carWindows][3]);
        cmd_ame(playerid, sprintf("arka sol cam� %s.", (CarData[vehicleid][carWindows][2] != 0) ? ("kapat�r") : ("a�ar")));
        return 1;
    }
    else if(!strcmp(params, "asag"))
    {
        CarData[vehicleid][carWindows][3] = !CarData[vehicleid][carWindows][3];
        SetVehicleParamsCarWindows(vehicleid, CarData[vehicleid][carWindows][0], CarData[vehicleid][carWindows][1], CarData[vehicleid][carWindows][2], CarData[vehicleid][carWindows][3]);
        cmd_ame(playerid, sprintf("arka sa� cam� %s.", (CarData[vehicleid][carWindows][3] != 0) ? ("kapat�r") : ("a�ar")));
        return 1;
    }
    else SendClientMessage(playerid, COLOR_ADM, "SERVER: Hatal� parametre girdiniz.");
    return 1;
}

CMD:arackapi(playerid, params[])
{
    new vehicleid = GetPlayerVehicleID(playerid);

	if(!IsValidVehicle(vehicleid)) return SendErrorMessage(playerid, "Herhangi bir ara� i�erisinde de�ilsin.");
	if(IsABike(vehicleid)) return SendErrorMessage(playerid, "Bu arac�n kap�s� yok.");
    if(PlayerData[playerid][pHandcuffed]) return SendErrorMessage(playerid, "Kelep�eliyken bu komutu kullanamazs�n.");
    if(isnull(params)) return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /arackapi [hepsi, osol, osag, asol, asag]");

    if(!strcmp(params, "hepsi"))
    {
        for(new i = 0; i < 4; i++)
        {
            CarData[vehicleid][carDoors][i] = !CarData[vehicleid][carDoors][i];
        }

        SetVehicleParamsCarDoors(vehicleid, CarData[vehicleid][carDoors][0], CarData[vehicleid][carDoors][1], CarData[vehicleid][carDoors][2], CarData[vehicleid][carDoors][3]);
        cmd_ame(playerid, sprintf("b�t�n kap�lar� %s.", (!CarData[vehicleid][carDoors][0]) ? ("kapat�r") : ("a�ar")));
        return 1;
    }
    else if(!strcmp(params, "osol"))
    {
        CarData[vehicleid][carDoors][0] = !CarData[vehicleid][carDoors][0];
        SetVehicleParamsCarDoors(vehicleid, CarData[vehicleid][carDoors][0], CarData[vehicleid][carDoors][1], CarData[vehicleid][carDoors][2], CarData[vehicleid][carDoors][3]);
        cmd_ame(playerid, sprintf("�n sol kap�y� %s.", (!CarData[vehicleid][carDoors][0]) ? ("kapat�r") : ("a�ar")));
        return 1;
    }
    else if(!strcmp(params, "osag"))
    {
        CarData[vehicleid][carDoors][1] = !CarData[vehicleid][carDoors][1];
        SetVehicleParamsCarDoors(vehicleid, CarData[vehicleid][carDoors][0], CarData[vehicleid][carDoors][1], CarData[vehicleid][carDoors][2], CarData[vehicleid][carDoors][3]);
        cmd_ame(playerid, sprintf("�n sa� kap�y� %s.", (!CarData[vehicleid][carDoors][1]) ? ("kapat�r") : ("a�ar")));
        return 1;
    }
    else if(!strcmp(params, "asol"))
    {
        CarData[vehicleid][carDoors][2] = !CarData[vehicleid][carDoors][2];
        SetVehicleParamsCarDoors(vehicleid, CarData[vehicleid][carDoors][0], CarData[vehicleid][carDoors][1], CarData[vehicleid][carDoors][2], CarData[vehicleid][carDoors][3]);
        cmd_ame(playerid, sprintf("arka sol kap�y� %s.", (!CarData[vehicleid][carDoors][2]) ? ("kapat�r") : ("a�ar")));
        return 1;
    }
    else if(!strcmp(params, "asag"))
    {
        CarData[vehicleid][carDoors][3] = !CarData[vehicleid][carDoors][3];
        SetVehicleParamsCarDoors(vehicleid, CarData[vehicleid][carDoors][0], CarData[vehicleid][carDoors][1], CarData[vehicleid][carDoors][2], CarData[vehicleid][carDoors][3]);
        cmd_ame(playerid, sprintf("arka sa� kap�y� %s.", (!CarData[vehicleid][carDoors][3]) ? ("kapat�r") : ("a�ar")));
        return 1;
    }
    else SendClientMessage(playerid, COLOR_ADM, "SERVER: Hatal� parametre girdiniz.");
    return 1;
}

//Cigs
CMD:sigara(playerid, params[])
{
    if(PlayerData[playerid][pBrutallyWounded]) return SendServerMessage(playerid, "�u anda bunu yapamazs�n.");
    if(!PlayerData[playerid][pCigarettes]) return SendClientMessage(playerid, COLOR_GREY, "HATA: Hi� sigaran yok.");
    if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_SMOKE_CIGGY) return SendClientMessage(playerid, COLOR_GREY, "SERVER: Zaten sigara i�iyorsun.");

    cmd_ame(playerid, "sigaras�n� a�z�na koyup ate�ler.");

    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_SMOKE_CIGGY);
    PlayerData[playerid][pCigarettes]--;
    return 1;
}

CMD:sigaraver(playerid, params[])
{
    if(PlayerData[playerid][pBrutallyWounded]) return SendServerMessage(playerid, "�u anda bunu yapamazs�n.");
    if(!PlayerData[playerid][pCigarettes]) return SendClientMessage(playerid, COLOR_GREY, "HATA: Hi� sigaran yok.");

    static playerb, quantity;
    if(sscanf(params, "ui", playerb, quantity)) return SendClientMessage(playerid, COLOR_GREY, "KULLANIM: /sigaraver [oyuncu ID/isim] [adet]");
    if(!IsPlayerConnected(playerb)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
    if(!pLoggedIn[playerb]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
    if(!GetDistanceBetweenPlayers(playerid, playerb, 4.5)) return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
    if(quantity > PlayerData[playerid][pCigarettes]) return SendClientMessage(playerid, COLOR_GREY, "SERVER: Bu kadar sigaran yok.");

    SendClientMessageEx(playerb, COLOR_GREY, "%s sana %i adet sigara verdi.", ReturnName(playerid, 0), quantity);
    cmd_ame(playerid, sprintf("%s adl� ki�iye sigara verir.", ReturnName(playerb, 0)));
    PlayerData[playerid][pCigarettes] -= quantity;
    PlayerData[playerb][pCigarettes] += quantity;
    return 1;
}

CMD:sigarapasla(playerid, params[])
{
    if(GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_SMOKE_CIGGY) return SendClientMessage(playerid, COLOR_GREY, "HATA: Sigara i�miyorsun.");

    static id;
    if(sscanf(params, "u", id)) return SendClientMessage(playerid, COLOR_GREY, "KULLANIM: /sigarapasla [oyuncu ID/isim]");
    if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
    if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
    if(!GetDistanceBetweenPlayers(playerid, id, 4.5)) return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
    if(GetPlayerState(id) == SPECIAL_ACTION_SMOKE_CIGGY) return SendClientMessage(playerid, COLOR_GREY, "SERVER: Bu ki�i zaten sigara i�iyor.");
    if(GetPlayerTeam(id) != STATE_ALIVE) return SendClientMessage(playerid, COLOR_GREY, "SERVER: Bu ki�iye �u anda sigara paslayamazs�n.");

    cmd_ame(playerid, sprintf("sigaras�n� %s adl� ki�iye paslar.", ReturnName(id, 0)));
    SetPlayerSpecialAction(id, SPECIAL_ACTION_SMOKE_CIGGY);
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
    return 1;
}

CMD:icecek(playerid, params[])
{
    if (PlayerData[playerid][pBrutallyWounded]) return SendServerMessage(playerid, "�u anda bunu yapamazs�n.");
    if(!PlayerData[playerid][pDrinks]) return SendClientMessage(playerid, COLOR_ADM, "HATA: Herhangi bir i�ece�in yok.");
    if(isnull(params)) return SendClientMessage(playerid, COLOR_GREY, "KULLANIM: /icecek [bira/sarap/gazoz]");

    if(!strcmp(params, "bira"))
    {
        if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_DRINK_BEER) return SendClientMessage(playerid, COLOR_ADM, "Zaten bira i�iyorsun.");
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_BEER);
        cmd_ame(playerid, "biras�n�n kapa��n� a��p i�meye ba�lar.");
    }
    else if(!strcmp(params, "sarap"))
    {
        if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_DRINK_WINE) return SendClientMessage(playerid, COLOR_ADM, "Zaten sarap i�iyorsun.");
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_WINE);
        cmd_ame(playerid, "�arap �i�esinin t�pas�n� s�ker ve i�meye ba�lar.");
    }
    else if(!strcmp(params, "gazoz"))
    {
        if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_DRINK_SPRUNK) return SendClientMessage(playerid, COLOR_ADM, "Zaten gazoz i�iyorsun.");
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_SPRUNK);
        cmd_ame(playerid, "gazozunun kapa��n� a�ar ve i�meye ba�lar.");
    }
    else return SendClientMessage(playerid, COLOR_ADM, "SERVER: Ge�ersiz parametre girdin.");
    return 1;
}

CMD:icecekver(playerid, params[])
{
    if (PlayerData[playerid][pBrutallyWounded]) return SendServerMessage(playerid, "�u anda bunu yapamazs�n.");
    if(!PlayerData[playerid][pDrinks]) return SendClientMessage(playerid, COLOR_ADM, "HATA: Herhangi bir i�ece�in yok.");

    static playerb;
    if(sscanf(params, "u", playerb)) return SendClientMessage(playerid, COLOR_GREY, "KULLANIM: /icecekver [oyuncu ID/isim]");
    if(!IsPlayerConnected(playerb)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
    if(!pLoggedIn[playerb]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
    if(!GetDistanceBetweenPlayers(playerid, playerb, 4.5)) return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");

    cmd_ame(playerid, sprintf("%s adl� ki�iye i�ecek verir.", ReturnName(playerb, 0)));
    PlayerData[playerid][pDrinks]++;
    PlayerData[playerb][pDrinks]--;
    return 1;
}

CMD:icecekpasla(playerid, params[])
{
    if(GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_DRINK_BEER
    || GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_DRINK_WINE
    || GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_DRINK_SPRUNK) return SendClientMessage(playerid, COLOR_GREY, "HATA: ��ecek i�miyorsun.");

    static playerb;
    if(sscanf(params, "u", playerb)) return SendClientMessage(playerid, COLOR_GREY, "KULLANIM: /icecekpasla [oyuncu ID/isim]");
    if(!IsPlayerConnected(playerb)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
    if(!pLoggedIn[playerb]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
    if(!GetDistanceBetweenPlayers(playerid, playerb, 4.5)) return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");

    if(GetPlayerSpecialAction(playerb) == SPECIAL_ACTION_DRINK_BEER
    || GetPlayerSpecialAction(playerb) == SPECIAL_ACTION_DRINK_WINE
    || GetPlayerSpecialAction(playerb) == SPECIAL_ACTION_DRINK_SPRUNK) return SendClientMessage(playerid, COLOR_GREY, "SERVER: Bu ki�i zaten i�ecek i�iyor.");

    cmd_ame(playerid, sprintf("i�ece�ini %s adl� ki�iye paslar.", ReturnName(playerb, 0)));
    SetPlayerSpecialAction(playerb, GetPlayerSpecialAction(playerid));
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
    return 1;
}

CMD:yazitura(playerid, params[])
{
    if (PlayerData[playerid][pBrutallyWounded]) return SendServerMessage(playerid, "�u anda bunu yapamazs�n.");
    LocalChat(playerid, 20.0, sprintf("* %s eliyle paray� havaya f�rlat�r ve %s gelir.", ReturnName(playerid, 0), random(2) ? ("tura") : ("yaz�")), COLOR_WHITE);
    return 1;
}

CMD:zar(playerid, params[])
{
    if (PlayerData[playerid][pBrutallyWounded]) return SendServerMessage(playerid, "�u anda bunu yapamazs�n.");

    new dice = randomEx(1, 6);
    LocalChat(playerid, 20.0, sprintf("* %s zar atar ve %i gelir.", ReturnName(playerid, 0), dice), COLOR_WHITE);
    return 1;
}

CMD:rsayi(playerid, params[])
{
    new sayi1, sayi2, emote[128];
    if(sscanf(params, "iis[128]", sayi1, sayi2, emote)) return SendUsageMessage(playerid, "/rsayi [min. de�er] [maks. de�er] [emote]");
    if(strlen(emote) < 3 || strlen(emote) > 128) return SendErrorMessage(playerid, "Emote en az 3 karakter en fazla 128 karakter olabilir.");
    if(sayi1 > sayi2) return SendErrorMessage(playerid, "Maksimum de�er minimum de�erden y�ksek olmal�d�r.");

    LocalChat(playerid, 20.0, sprintf("* %s %s %i. ((%i ile %i))", ReturnName(playerid, 0), randomEx(sayi1, sayi2), sayi1, sayi2), COLOR_WHITE);
    return 1;
}

CMD:hapistencik(playerid, params[])
{
    if(!PlayerData[playerid][pICJailed]) return SendServerMessage(playerid, "Hapiste de�ilsin.");
    if(PlayerData[playerid][pICJailed] && PlayerData[playerid][pICJailTime] > 1) return SendClientMessage(playerid, COLOR_ADM, "[-] Zaman�n dolmad�.");

    SendPlayer(playerid, 1516.2751,-1690.4175,13.3365, 90.0, 0, 0);
    SendLawMessage(COLOR_ADM, sprintf("[Hapis] %s hapisten ��kt�.", ReturnName(playerid, 1)));
    DestroyDynamic3DTextLabel(PlayerData[playerid][pICJail3D]);

    PlayerData[playerid][pICJailNotify] = 0;
    PlayerData[playerid][pICJailed] = 0;
    PlayerData[playerid][pICJailTime] = 0;

    TotalJailees--;
    SendClientMessage(playerid, COLOR_ADM, "[-] Hapisten ��kt�n.");
    return 1;
}


CMD:aksesuar(playerid, params[])
{
		if (PlayerData[playerid][pEditingClothing])
			return SendServerMessage(playerid, "Aksesuar�n� d�zenlerken bu komutu kullanamazs�n.");

		new id;
		new a_string[40], b_string[90];
		if (sscanf(params, "s[40]S()[90]", a_string, b_string))
		{
				new
						sub[78], primary[512], count = 0;

				for(new i = 0; i < MAX_CLOTHING_ITEMS; i++) if(ClothingData[playerid][i][ClothingID])
				{
						format(sub, sizeof(sub), "{FFFF00}%d. {FFFFFF}%s (Index: %d)\n", i, ClothingData[playerid][i][ClothingName], ClothingData[playerid][i][ClothingSlotID]);
						strcat(primary, sub);
						count++;
				}

				if(!count) return SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}Hi� aksesuar�n yok.");
				else ShowPlayerDialog(playerid, DIALOG_CLOTHING_MENU, DIALOG_STYLE_LIST, "Aksesuar Listesi", primary, "Se�", "<< Kapat"),	SendUsageMessage(playerid, "/aksesuar giy | duzenle | sil | bilgi");
				return 1;
		}

		else if(!strcmp(a_string, "giy", true) || !strcmp(a_string, "g", true))
    {
        if (sscanf(b_string, "d", id)) return SendUsageMessage(playerid, "/aksesuar giy [slot]");
        if (id < 0 || id >= MAX_CLOTHING_ITEMS) return SendServerMessage(playerid, "Ge�ersiz slot.");
        if (!ClothingData[playerid][id][ClothingOwnerID]) return SendServerMessage(playerid, "Bu slotta aksesuar�n yok.");
        if (PlayerData[playerid][pEditingClothing]) return SendServerMessage(playerid, "Aksesuar�n� d�zenlemeyi bitirdikten sonra giyebilirsin.");

        //new clothing_id = FreeAttachmentSlot(playerid);
				new clothing_id = ClothingData[playerid][id][ClothingSlotID];
        if (IsPlayerAttachedObjectSlotUsed(playerid, clothing_id))
        {
            SendClientMessageEx(playerid, COLOR_WHITE, "SERVER: %s aksesuar�n� ��kartt�n.", ClothingData[playerid][id][ClothingName]);
            RemovePlayerAttachedObject(playerid, clothing_id);
        }
        else {
			     SetPlayerAttachedObject(playerid, clothing_id, ClothingData[playerid][id][ClothingModelID], ClothingData[playerid][id][ClothingBoneID], ClothingData[playerid][id][ClothingPos][0], ClothingData[playerid][id][ClothingPos][1], ClothingData[playerid][id][ClothingPos][2], ClothingData[playerid][id][ClothingRot][0], ClothingData[playerid][id][ClothingRot][1], ClothingData[playerid][id][ClothingRot][2], ClothingData[playerid][id][ClothingScale][0], ClothingData[playerid][id][ClothingScale][1], ClothingData[playerid][id][ClothingScale][2], ClothingData[playerid][id][ClothingColor], ClothingData[playerid][id][ClothingColor2]);

            SendClientMessageEx(playerid, COLOR_WHITE, "SERVER: %s aksesuar�n� giydin.", ClothingData[playerid][id][ClothingName]);
        }
				return 1;
    }
    else if(!strcmp(a_string, "duzenle", true) || !strcmp(a_string, "d", true))
    {
        if (sscanf(b_string, "d", id)) return SendUsageMessage(playerid, "/aksesuar duzenle [slot]");
        if (id < 0 || id >= MAX_CLOTHING_ITEMS) return SendServerMessage(playerid, "Ge�ersiz slot.");
        if (!ClothingData[playerid][id][ClothingOwnerID]) return SendServerMessage(playerid, "Bu slotta aksesuar�n yok.");
        if (PlayerData[playerid][pEditingClothing]) return SendServerMessage(playerid, "Aksesuar�n� d�zenlemeyi bitirdikten sonra yeni bir tanesini d�zenleyebilirsin.");

				new slot_id = ClothingData[playerid][id][ClothingSlotID];

				if(!IsPlayerAttachedObjectSlotUsed(playerid, slot_id))
				{
					SetPlayerAttachedObject(playerid, slot_id, ClothingData[playerid][id][ClothingModelID], ClothingData[playerid][id][ClothingBoneID], ClothingData[playerid][id][ClothingPos][0], ClothingData[playerid][id][ClothingPos][1], ClothingData[playerid][id][ClothingPos][2], ClothingData[playerid][id][ClothingRot][0], ClothingData[playerid][id][ClothingRot][1], ClothingData[playerid][id][ClothingRot][2], ClothingData[playerid][id][ClothingScale][0], ClothingData[playerid][id][ClothingScale][1], ClothingData[playerid][id][ClothingScale][2], ClothingData[playerid][id][ClothingColor], ClothingData[playerid][id][ClothingColor2]);
				}

				PlayerData[playerid][pEditingClothing] = true;
				EditAttachedObject(playerid, slot_id);
				return 1;
    }

    else if(!strcmp(a_string, "sil"))
    {
        if (sscanf(b_string, "d", id)) return SendUsageMessage(playerid, "/aksesuar sil [slot]");
        if (id < 0 || id >= MAX_CLOTHING_ITEMS) return SendServerMessage(playerid, "Ge�ersiz slot.");
        if (!ClothingData[playerid][id][ClothingOwnerID]) return SendServerMessage(playerid, "Bu slotta aksesuar�n yok.");
        if (PlayerData[playerid][pEditingClothing]) return SendServerMessage(playerid, "Aksesuar�n� d�zenlemeyi bitirdikten sonra silebilirsin.");

        if (IsPlayerAttachedObjectSlotUsed(playerid, id))
        {
            RemovePlayerAttachedObject(playerid, id);
        }

        SendClientMessageEx(playerid, COLOR_WHITE, "SERVER: %s aksesuar�n� sildin.", ClothingData[playerid][id][ClothingName]);

        new query[60];
        mysql_format(m_Handle, query, sizeof(query), "DELETE FROM player_clothing WHERE id = %i", ClothingData[playerid][id][ClothingID]);
        mysql_pquery(m_Handle, query);

				ClothingData[playerid][id][ClothingID] = 0;
				ClothingData[playerid][id][ClothingOwnerID] = !ClothingData[playerid][id][ClothingOwnerID];
				return 1;
    }

		else if(!strcmp(a_string, "bilgi"))
		{
				new pid;
				if (sscanf(b_string, "dI(-1)", id, pid)) return SendUsageMessage(playerid, "/aksesuar bilgi [slot] [playerID(iste�e ba�l�)]");
				if (id < 0 || id >= MAX_CLOTHING_ITEMS) return SendServerMessage(playerid, "Ge�ersiz slot.");
				if (!ClothingData[playerid][id][ClothingOwnerID]) return SendServerMessage(playerid, "Bu slotta aksesuar�n yok.");
				if(pid == -1)
				{
					SendMessage(playerid, "{FF6347}Slot %d {FFFFFF}, {FF6347}%s", id, ClothingData[playerid][id][ClothingName]);
					SendMessage(playerid, "{FFFFFF}Se�ili kemik {FF6347}%s, {FFFFFF}Indeks {FF6347}%d", Clothing_Bone(ClothingData[playerid][id][ClothingBoneID]), ClothingData[playerid][id][ClothingSlotID]);
					SendMessage(playerid, " ");
					SendMessage(playerid, "{FFFFFF}Pozisyon de�erleri X: {FF6347}%2.f{FFFFFF}, Y: {FF6347}%2.f{FFFFFF}, Z: {FF6347}%2.f", ClothingData[playerid][id][ClothingPos][0], ClothingData[playerid][id][ClothingPos][1], ClothingData[playerid][id][ClothingPos][2]);
					SendMessage(playerid, "{FFFFFF}Rotasyon de�erleri X: {FF6347}%2.f{FFFFFF}, Y: {FF6347}%2.f{FFFFFF}, Z: {FF6347}%2.f", ClothingData[playerid][id][ClothingRot][0], ClothingData[playerid][id][ClothingRot][1], ClothingData[playerid][id][ClothingRot][2]);
					SendMessage(playerid, "{FFFFFF}B�y�kl�k de�erleri X: {FF6347}%2.f{FFFFFF}, Y: {FF6347}%2.f{FFFFFF}, Z: {FF6347}%2.f", ClothingData[playerid][id][ClothingScale][0], ClothingData[playerid][id][ClothingScale][1], ClothingData[playerid][id][ClothingScale][2]);
				}
				else
				{

					if(pid == playerid)
						return SendClientMessage(playerid, COLOR_GREY, "Bu komutu kendi �zerinde kullanamazs�n.");

					if(!IsPlayerConnected(pid))
						return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");

					if(!pLoggedIn[pid])
						return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");

					if(!GetDistanceBetweenPlayers(playerid, pid, 6.0))
						return SendClientMessage(playerid, COLOR_GREY, "SERVER: Bu ki�iye yak�n de�ilsin.");

					SendMessage(pid, "{FF6347}Slot %d {FFFFFF}, {FF6347}%s", id, ClothingData[playerid][id][ClothingName]);
					SendMessage(pid, "{FFFFFF}Se�ili kemik {FF6347}%s, {FFFFFF}Indeks {FF6347}%d", Clothing_Bone(ClothingData[playerid][id][ClothingBoneID]), ClothingData[playerid][id][ClothingSlotID]);
					SendMessage(pid, " ");
					SendMessage(pid, "{FFFFFF}Pozisyon de�erleri X: {FF6347}%2.f{FFFFFF}, Y: {FF6347}%2.f{FFFFFF}, Z: {FF6347}%2.f", ClothingData[playerid][id][ClothingPos][0], ClothingData[playerid][id][ClothingPos][1], ClothingData[playerid][id][ClothingPos][2]);
					SendMessage(pid, "{FFFFFF}Rotasyon de�erleri X: {FF6347}%2.f{FFFFFF}, Y: {FF6347}%2.f{FFFFFF}, Z: {FF6347}%2.f", ClothingData[playerid][id][ClothingRot][0], ClothingData[playerid][id][ClothingRot][1], ClothingData[playerid][id][ClothingRot][2]);
					SendMessage(pid, "{FFFFFF}B�y�kl�k de�erleri X: {FF6347}%2.f{FFFFFF}, Y: {FF6347}%2.f{FFFFFF}, Z: {FF6347}%2.f", ClothingData[playerid][id][ClothingScale][0], ClothingData[playerid][id][ClothingScale][1], ClothingData[playerid][id][ClothingScale][2]);
				}
				return 1;
		}
		else SendUsageMessage(playerid, "/aksesuar giy | duzenle | sil | bilgi");
    return 1;
}

CMD:tog(playerid, params[])
{
    new
        specifier[20];

    if(sscanf(params, "s[20]", specifier))
    {
        SendUsageMessage(playerid, "/tog [parametre]");
        SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ooc, hud, sokak, renk, isim, anim, birlik, haber, reklam, kickban");
        if(PlayerData[playerid][pAdmin]) SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}deaths, connects");
        if(PlayerData[playerid][pAdmin] >= 4) SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}ahide");
        return 1;
    }

    if(!strcmp(specifier, "reklam", true))
    {
        PlayerData[playerid][pNewss] = !PlayerData[playerid][pNewss];
        SendClientMessageEx(playerid, COLOR_GREY, "Haberleri %s hale getirildi.", PlayerData[playerid][pNewss] ? "g�r�n�r" : "gizli");
    }
    else if(!strcmp(specifier, "kickban", true))
    {
        PlayerData[playerid][pKickBanStatus] = !PlayerData[playerid][pKickBanStatus];
        SendClientMessageEx(playerid, COLOR_GREY, "Kick ve ban bildirimlerini %s hale getirildi.", PlayerData[playerid][pKickBanStatus] ? "g�r�n�r" : "gizli");
    }
    else if(!strcmp(specifier, "ooc", true))
    {
        PlayerData[playerid][pOOCStatus] = !PlayerData[playerid][pOOCStatus];
        SendClientMessageEx(playerid, COLOR_GREY, "OOC kanal %s hale getirildi.", PlayerData[playerid][pOOCStatus] ? "g�r�n�r" : "gizli");
        SaveSQLInt(PlayerData[playerid][pSQLID], "players", "OOCStatus", bool:PlayerData[playerid][pOOCStatus]);
        return 1;
    }
    else if(!strcmp(specifier, "hud", true))
    {
        PlayerData[playerid][pHudStatus] = !PlayerData[playerid][pHudStatus];
        SendClientMessageEx(playerid, COLOR_GREY, "HUD %s hale getirildi.", PlayerData[playerid][pHudStatus] ? "g�r�n�r" : "gizli");
        SaveSQLInt(PlayerData[playerid][pSQLID], "players", "HudStatus", bool:PlayerData[playerid][pHudStatus]);
        Hud_Change(playerid);
        return 1;
    }
    else if(!strcmp(specifier, "sokak", true))
    {
        PlayerData[playerid][pStreetStatus] = !PlayerData[playerid][pStreetStatus];
        SendClientMessageEx(playerid, COLOR_GREY, "Sokak isimleri %s hale getirildi.", PlayerData[playerid][pStreetStatus] ? "g�r�n�r" : "gizli");
        SaveSQLInt(PlayerData[playerid][pSQLID], "players", "StreetStatus", bool:PlayerData[playerid][pStreetStatus]);
        Street_Change(playerid);
        return 1;
    }
    else if(!strcmp(specifier, "haber", true))
    {
        PlayerData[playerid][pNewsStatus] = !PlayerData[playerid][pNewsStatus];
        SendClientMessageEx(playerid, COLOR_GREY, "Haberler %s hale getirildi.", PlayerData[playerid][pNewsStatus] ? "g�r�n�r" : "gizli");
        SaveSQLInt(PlayerData[playerid][pSQLID], "players", "NewsStatus", bool:PlayerData[playerid][pNewsStatus]);
        return 1;
    }
    else if(!strcmp(specifier, "anim", true))
    {
        PlayerData[playerid][pChatStatus] = !PlayerData[playerid][pChatStatus];
        SendClientMessageEx(playerid, COLOR_GREY, "Otomatik animasyon %s hale getirildi.", PlayerData[playerid][pChatStatus] ? "aktif" : "de-aktif");
        SaveSQLInt(PlayerData[playerid][pSQLID], "players", "ChatStatus", bool:PlayerData[playerid][pChatStatus]);
        return 1;
    }
    else if(!strcmp(specifier, "birlik", true))
    {
        if(PlayerData[playerid][pFaction] == -1) return SendErrorMessage(playerid, "Herhangi bir birlikte de�ilsin.");

        PlayerData[playerid][pFactionStatus] = !PlayerData[playerid][pFactionStatus];
        SendClientMessageEx(playerid, COLOR_GREY, "Birlik konu�malar� %s hale getirildi.", PlayerData[playerid][pFactionStatus] ? "g�r�n�r" : "gizli");
        SaveSQLInt(PlayerData[playerid][pSQLID], "players", "FactionStatus", bool:PlayerData[playerid][pFactionStatus]);
        return 1;
    }
    else if(!strcmp(specifier, "renk", true))
    {
        if(!IsPoliceFaction(playerid)) return UnAuthMessage(playerid);
        if(!PlayerData[playerid][pLAWduty]) return SendServerMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");

        PlayerData[playerid][pColorStatus] = !PlayerData[playerid][pColorStatus];
        SendClientMessageEx(playerid, COLOR_GREY, "��ba�� renginiz %s hale getirildi.", PlayerData[playerid][pColorStatus] ? "g�r�n�r" : "gizli");
        SetPlayerColor(playerid, PlayerData[playerid][pColorStatus] ? COLOR_COP : COLOR_WHITE);
        return 1;
    }
    else if(!strcmp(specifier, "isim", true))
    {
        PlayerData[playerid][pNickStatus] = !PlayerData[playerid][pNickStatus];
        SendClientMessageEx(playerid, COLOR_GREY, "�simler %s hale getirildi.", PlayerData[playerid][pNickStatus] ? "g�r�n�r" : "gizli");

        foreach(new i : Player)
        {
            if(PlayerData[i][pMaskOn]) continue;
            ShowPlayerNameTagForPlayer(playerid, i, PlayerData[playerid][pNickStatus]);
        }
        return 1;
    }
    else if(!strcmp(specifier, "deaths", true))
    {
        if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);
        PlayerData[playerid][pDeathStatus] = !PlayerData[playerid][pDeathStatus];
        SendClientMessageEx(playerid, COLOR_ADM, "AdmCmd: �l�m bildirimleri %s hale getirildi.", PlayerData[playerid][pDeathStatus] ? "g�r�n�r" : "gizli");
        return 1;
    }
    else if(!strcmp(specifier, "connects", true))
    {
        if(!PlayerData[playerid][pAdmin]) return UnAuthMessage(playerid);
        PlayerData[playerid][pConnectStatus] = !PlayerData[playerid][pConnectStatus];
        SendClientMessageEx(playerid, COLOR_ADM, "AdmCmd: Giri� bildirimleri %s hale getirildi.", PlayerData[playerid][pConnectStatus] ? "g�r�n�r" : "gizli");
        return 1;
    }
    else if(!strcmp(specifier, "ahide", true))
    {
        if(PlayerData[playerid][pAdmin] < 4) return UnAuthMessage(playerid);
        PlayerData[playerid][pAdminHide] = !PlayerData[playerid][pAdminHide];
        SendClientMessageEx(playerid, COLOR_ADM, "AdmCmd: Y�netici listesinde %s hale getirildin.", PlayerData[playerid][pAdminHide] ? "gizli" : "g�r�n�r");
        return 1;
    }
    else SendClientMessage(playerid, COLOR_ADM, "SERVER: Hatal� parametre girdiniz.");
    return 1;
}

CMD:gov(playerid, params[])
{
    if(!IsPoliceFaction(playerid)) return UnAuthMessage(playerid);
    if(PlayerData[playerid][pFactionRank] > FactionData[PlayerData[playerid][pFaction]][FactionEditrank])
        return SendErrorMessage(playerid, "R�tben bu komut i�in yetersiz.");

    if(isnull(params)) return SendUsageMessage(playerid, "/gov [yaz�]");

    if(strlen(params) > 80)
    {
        // 0x6495EDFF
        SendClientMessageToAll(0x6495EDFF, sprintf("[Devlet Duyurusu] %.80s", params));
        SendClientMessageToAll(0x6495EDFF, sprintf("[Devlet Duyurusu] ...%s", params[80]));
    }
    else
    {
        SendClientMessageToAll(0x6495EDFF, sprintf("[Devlet Duyurusu] %s", params));
    }

    return 1;
}

CMD:icecekal(playerid, params[])
{
    new id = -1;
    if((id = IsPlayerInBusiness(playerid)) == -1) return SendClientMessage(playerid, COLOR_ADM, "HATA: Bir i�yerinde de�ilsin.");
    if(BusinessData[id][BusinessType] != BUSINESS_CLUB) return SendClientMessage(playerid, COLOR_ADM, "HATA: Kul�pte de�ilsin.");
    if(PlayerData[playerid][pMoney] < 3) return SendClientMessage(playerid, COLOR_ADM, "Yeterli paran yok. ($3)");
    SendClientMessage(playerid, COLOR_YELLOW, "��ecek sat�n ald�n. /icecek, /icecekver!");
    PlayerData[playerid][pDrinks]++;
    GiveMoney(playerid, -3);
    return 1;
}

CMD:kapical(playerid, params[])
{
    new h = -1;
    if((h = IsPlayerNearProperty(playerid)) != -1)
    {
        foreach(new i : Player) if(IsPlayerInProperty(i) == h)
        {
            SendClientMessageEx(i, COLOR_EMOTE, "* %s kap�y� t�klat�r.", ReturnName(playerid, 0));
        }

        SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s kap�y� t�klat�r.", ReturnName(playerid, 0));
        return 1;
    }

    new b = -1;
    if((b = IsPlayerNearBusiness(playerid)) != -1)
    {
        foreach(new i : Player) if(IsPlayerInBusiness(i) == b)
        {
            SendClientMessageEx(i, COLOR_EMOTE, "* %s kap�y� t�klat�r.", ReturnName(playerid, 0));
        }

        SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s kap�y� t�klat�r.", ReturnName(playerid, 0));
        return 1;
    }

    SendClientMessage(playerid, COLOR_ADM, "SERVER: Herhangi bir kap�n�n yak�n�nda de�ilsin.");
    return 1;
}

CMD:ds(playerid, params[])
{
    if(isnull(params)) return SendUsageMessage(playerid, "/ds [mesaj]");

    new h = -1;
    if((h = IsPlayerNearProperty(playerid)) != -1)
    {
        foreach(new i : Player) if(IsPlayerInProperty(i) == h)
        {
            if(strlen(params) > 84)
            {
                SendClientMessageEx(i, COLOR_GRAD1, "%s (ba��r�r): %.84s", ReturnName(playerid, 0), params);
                SendClientMessageEx(i, COLOR_GRAD1, "%s (ba��r�r): ... %s", ReturnName(playerid, 0), params[84]);
            }
            else SendClientMessageEx(i, COLOR_GRAD1, "%s (ba��r�r): %s", ReturnName(playerid, 0), params);
        }

        if(strlen(params) > 84)
        {
            SendNearbyMessage(playerid, 20.0, COLOR_GRAD1, "%s (ba��r�r): %.84s", ReturnName(playerid, 0), params);
            SendNearbyMessage(playerid, 20.0, COLOR_GRAD1, "%s (ba��r�r): ... %s", ReturnName(playerid, 0), params[84]);
        }
        else SendNearbyMessage(playerid, 20.0, COLOR_GRAD1, "%s (ba��r�r): %s", ReturnName(playerid, 0), params);
        return 1;
    }

    h = -1;
    if((h = IsPlayerInProperty(playerid)) != -1)
    {
        foreach(new i : Player) if(IsPlayerNearProperty(i) == h)
        {
            if(strlen(params) > 84)
            {
                SendClientMessageEx(i, COLOR_GRAD1, "%s (ba��r�r): %.84s", ReturnName(playerid, 0), params);
                SendClientMessageEx(i, COLOR_GRAD1, "%s (ba��r�r): ... %s", ReturnName(playerid, 0), params[84]);
            }
            else SendClientMessageEx(i, COLOR_GRAD1, "%s (ba��r�r): %s", ReturnName(playerid, 0), params);
        }

        if(strlen(params) > 84)
        {
            SendNearbyMessage(playerid, 20.0, COLOR_GRAD1, "%s (ba��r�r): %.84s", ReturnName(playerid, 0), params);
            SendNearbyMessage(playerid, 20.0, COLOR_GRAD1, "%s (ba��r�r): ... %s", ReturnName(playerid, 0), params[84]);
        }
        else SendNearbyMessage(playerid, 20.0, COLOR_GRAD1, "%s (ba��r�r): %s", ReturnName(playerid, 0), params);
        return 1;
    }

    new b = -1;
    if((b = IsPlayerNearBusiness(playerid)) != -1)
    {
        foreach(new i : Player) if(IsPlayerInBusiness(i) == b)
        {
            if(strlen(params) > 84)
            {
                SendClientMessageEx(i, COLOR_GRAD1, "%s (ba��r�r): %.84s", ReturnName(playerid, 0), params);
                SendClientMessageEx(i, COLOR_GRAD1, "%s (ba��r�r): ... %s", ReturnName(playerid, 0), params[84]);
            }
            else SendClientMessageEx(i, COLOR_GRAD1, "%s (ba��r�r): %s", ReturnName(playerid, 0), params);
        }

        if(strlen(params) > 84)
        {
            SendNearbyMessage(playerid, 20.0, COLOR_GRAD1, "%s (ba��r�r): %.84s", ReturnName(playerid, 0), params);
            SendNearbyMessage(playerid, 20.0, COLOR_GRAD1, "%s (ba��r�r): ... %s", ReturnName(playerid, 0), params[84]);
        }
        else SendNearbyMessage(playerid, 20.0, COLOR_GRAD1, "%s (ba��r�r): %s", ReturnName(playerid, 0), params);
        return 1;
    }

    b = -1;
    if((b = IsPlayerInBusiness(playerid)) != -1)
    {
        foreach(new i : Player) if(IsPlayerNearBusiness(i) == b)
        {
            if(strlen(params) > 84)
            {
                SendClientMessageEx(i, COLOR_GRAD1, "%s (ba��r�r): %.84s", ReturnName(playerid, 0), params);
                SendClientMessageEx(i, COLOR_GRAD1, "%s (ba��r�r): ... %s", ReturnName(playerid, 0), params[84]);
            }
            else SendClientMessageEx(i, COLOR_GRAD1, "%s (ba��r�r): %s", ReturnName(playerid, 0), params);
        }

        if(strlen(params) > 84)
        {
            SendNearbyMessage(playerid, 20.0, COLOR_GRAD1, "%s (ba��r�r): %.84s", ReturnName(playerid, 0), params);
            SendNearbyMessage(playerid, 20.0, COLOR_GRAD1, "%s (ba��r�r): ... %s", ReturnName(playerid, 0), params[84]);
        }
        else SendNearbyMessage(playerid, 20.0, COLOR_GRAD1, "%s (ba��r�r): %s", ReturnName(playerid, 0), params);
        return 1;
    }

    SendClientMessage(playerid, COLOR_ADM, "SERVER: Herhangi bir kap�n�n yak�n�nda de�ilsin.");
    return 1;
}

CMD:ddo(playerid, params[])
{
    if(isnull(params)) return SendUsageMessage(playerid, "/ddo [emote]");

    new h = -1;
    if((h = IsPlayerNearProperty(playerid)) != -1)
    {
        foreach(new i : Player) if(IsPlayerInProperty(i) == h)
        {
            if(strlen(params) > 90)
            {
                SendClientMessageEx(i, COLOR_EMOTE, "* [Kap�] %.90s ...", params);
                SendClientMessageEx(i, COLOR_EMOTE, "* [Kap�] ... %s (( %s ))", params[90], ReturnName(playerid, 0));
            }
            else SendClientMessageEx(i, COLOR_EMOTE, "* [Kap�] %s (( %s ))", params, ReturnName(playerid, 0));
        }

        if(strlen(params) > 90)
        {
            SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* [Kap�] %.90s ...", params);
            SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* [Kap�] ... %s (( %s ))", params, ReturnName(playerid, 0));
        }
        else SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* [Kap�] %s (( %s ))", params, ReturnName(playerid, 0));
        return 1;
    }

    h = -1;
    if((h = IsPlayerInProperty(playerid)) != -1)
    {
        foreach(new i : Player) if(IsPlayerNearProperty(i) == h)
        {
            if(strlen(params) > 90)
            {
                SendClientMessageEx(i, COLOR_EMOTE, "* [Kap�] %.90s ...", params, ReturnName(playerid, 0));
                SendClientMessageEx(i, COLOR_EMOTE, "* [Kap�] ... %s (( %s ))", params[90], ReturnName(playerid, 0));
            }
            else SendClientMessageEx(i, COLOR_EMOTE, "* [Kap�] %s (( %s ))", params, ReturnName(playerid, 0));
        }

        if(strlen(params) > 90)
        {
            SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* [Kap�] %.90s ...", params, ReturnName(playerid, 0));
            SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* [Kap�] ... %s (( %s ))", params, ReturnName(playerid, 0));
        }
        else SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* [Kap�] %s (( %s ))", params, ReturnName(playerid, 0));
        return 1;
    }

    new b = -1;
    if((b = IsPlayerNearBusiness(playerid)) != -1)
    {
        foreach(new i : Player) if(IsPlayerInBusiness(i) == b)
        {
            if(strlen(params) > 90)
            {
                SendClientMessageEx(i, COLOR_EMOTE, "* [Kap�] %.90s ...", params);
                SendClientMessageEx(i, COLOR_EMOTE, "* [Kap�] ... %s (( %s ))", params[90], ReturnName(playerid, 0));
            }
            else SendClientMessageEx(i, COLOR_EMOTE, "* [Kap�] %s (( %s ))", params, ReturnName(playerid, 0));
        }

        if(strlen(params) > 90)
        {
            SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* [Kap�] %.90s ...", params);
            SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* [Kap�] ... %s (( %s ))", params, ReturnName(playerid, 0));
        }
        else SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* [Kap�] %s (( %s ))", params, ReturnName(playerid, 0));
        return 1;
    }

    b = -1;
    if((b = IsPlayerInBusiness(playerid)) != -1)
    {
        foreach(new i : Player) if(IsPlayerNearBusiness(i) == b)
        {
            if(strlen(params) > 90)
            {
                SendClientMessageEx(i, COLOR_EMOTE, "* [Kap�] %.90s ...", params, ReturnName(playerid, 0));
                SendClientMessageEx(i, COLOR_EMOTE, "* [Kap�] ... %s (( %s ))", params[90], ReturnName(playerid, 0));
            }
            else SendClientMessageEx(i, COLOR_EMOTE, "* [Kap�] %s (( %s ))", params, ReturnName(playerid, 0));
        }

        if(strlen(params) > 90)
        {
            SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* [Kap�] %.90s ...", params, ReturnName(playerid, 0));
            SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* [Kap�] ... %s (( %s ))", params, ReturnName(playerid, 0));
        }
        else SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* [Kap�] %s (( %s ))", params, ReturnName(playerid, 0));
        return 1;
    }

    SendClientMessage(playerid, COLOR_ADM, "SERVER: Herhangi bir kap�n�n yak�n�nda de�ilsin.");
    return 1;
}

CMD:aracteslimet(playerid, params[])
{
    if(!IsPlayerInAnyVehicle(playerid))
        return SendErrorMessage(playerid, "Herhangi bir ara� i�erisinde de�ilsin.");

    if (GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
        return SendErrorMessage(playerid, "�of�r koltu�unda olmal�s�n.");

    new vehicleid = GetPlayerVehicleID(playerid);

    if(!IsValidPlayerCar(vehicleid))
        return SendErrorMessage(playerid, "Bu ara� �ah�sa ait de�il.");

    new
        id;

    if( (id = Chopshop_Nearest(playerid)) == -1)
        return SendErrorMessage(playerid, "Yak�n�nda Chopshop bulunmuyor.");

    if(PlayerData[playerid][pSQLID] == CarData[vehicleid][carOwnerID])
        return SendErrorMessage(playerid, "Kendi araban�n kilidini k�ramazs�n.");

    if(PlayerData[playerid][pLevel] < 7)
        return SendErrorMessage(playerid, "Bu komutu kullanabilmek i�in 7. seviye ve �st� olmal�s�n.");

    if(!Chopshop_CheckWantedModel(id, GetVehicleModel(vehicleid)))
        return SendInfoMessage(playerid, "Bu arabaya ihtiyac�m�z yok.");

    //if(PlayerData[playerid][pChopshopCooldown] != 0)
    //  return SendErrorMessage(playerid, "Ba�ka bir ara� satabilmek i�in %i saat beklemelisin.", PlayerData[playerid][pChopshopCooldown]);

    if(Chopshopping[playerid] != 0)
        return SendErrorMessage(playerid, "Zaten bir ara� teslim ediyorsun.");

    if (Chopshopping[playerid] != 0)
    {
        KillTimer(ChopshopTimer[playerid]);
        Chopshopping[playerid] = 1;
    }

    Chopshopping[playerid] = 60;
    ChopshopTimer[playerid] = SetTimerEx("Chopshop_Timer", 1000, true, "ii", playerid, vehicleid);
    return 1;
}

CMD:modifiye(playerid, params[])
{
    if(PlayerData[playerid][pInTuning])
        return SendErrorMessage(playerid, "Zaten modifiye alan�na girmi�sin.");

    if(!IsPlayerInRangeOfPoint(playerid, 5, EXTERIOR_TUNING_X, EXTERIOR_TUNING_Y, EXTERIOR_TUNING_Z))
        return SendErrorMessage(playerid, "Modifiye alan�na yak�n de�ilsin.");

    if (GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
        return SendErrorMessage(playerid, "Herhangi bir ara�ta de�ilsin.");

    new vehID = GetPlayerVehicleID(playerid);
    if(IsABike(vehID) > 0 || IsAMotorBike(vehID) > 0)
        return SendErrorMessage(playerid, "Bu tarz ta��tlar� modifiye edemezsin.");

    if (IsValidFactionCar(vehID))
        return SendErrorMessage(playerid, "Birlik ara�lar�n� modifiye edemezsin.");

    if(CarData[vehID][carOwnerID] != PlayerData[playerid][pSQLID] && PlayerData[playerid][pCarKey] != CarData[vehID][carID] && !PlayerData[playerid][pAdminDuty])
        return SendErrorMessage(playerid, "Modifiye alan�na girebilmek i�in arac�n sahibi olmal�s�n.");

    foreach(new i : Player) if(GetPlayerVehicleID(i) == vehID && i != playerid)
        return SendErrorMessage(playerid, "Arac�nda ba�ka biri varken modifiyeciye giremezsin.");

    SetPlayerCameraPos(playerid, 441.1662, -1302.0037, 18.0385);
    SetPlayerCameraLookAt(playerid, 440.2185, -1301.6881, 17.6184);

    SetVehiclePos(vehID, INTERIOR_TUNING_X, INTERIOR_TUNING_Y, INTERIOR_TUNING_Z);
    SetVehicleZAngle(vehID, -180);

    SetPlayerVirtualWorld(playerid, playerid + 1);
    SetVehicleVirtualWorld(vehID, playerid + 1);

    CarEngine[vehID] = false;
    CarLights[vehID] = false;
    SetVehicleParamsEx(vehID, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF);
    TogglePlayerControllable(playerid, 0);

    PlayerData[playerid][pInTuning] = 1;
    PlayerData[playerid][pTuningCategoryID] = 0;

    new categoryTuning = PlayerData[playerid][pTuningCategoryID];
    PlayerTextDrawSetString(playerid, TDTuning_Component[playerid], sprintf("%s (~>~)~y~ %s", TuningCategories[categoryTuning], TuningCategories[categoryTuning + 1]));

    Tuning_SetDisplay(playerid);

    PlayerTextDrawShow(playerid, TDTuning_Dots[playerid]);
    PlayerTextDrawShow(playerid, TDTuning_Price[playerid]);
    PlayerTextDrawShow(playerid, TDTuning_ComponentName[playerid]);
    PlayerTextDrawShow(playerid, TDTuning_YN[playerid]);
		PlayerTextDrawShow(playerid, TDTuning_Component[playerid]);

    SendMessage(playerid, "{FF6347}~k~~VEHICLE_LOOKLEFT~ {FFFFFF}ve {FF6347}~k~~VEHICLE_LOOKRIGHT~ {FFFFFF}tu�lar�yla kategorileri, {FF6347}~k~~VEHICLE_FIREWEAPON~ {FFFFFF}ve {FF6347}~k~~PED_LOCK_TARGET~ {FFFFFF}tu�lar�yla �e�itleri de�i�tirebilirsin.");
    return 1;
}

/*CMD:gazete(playerid)
{
    if(IsPlayerInRangeOfPoint(playerid, 1.5, 1663.8573, -2330.1743, -2.6797))
    {
        ShowMenuForPlayer(main_page, playerid); TogglePlayerControllable(playerid, 0);
        SetPlayerPos(playerid, 1663.5166, -2332.6809, -2.6797); SetPlayerFacingAngle(playerid, 180.0);
        //pc_cmd_sit(playerid, "4");
        SendClientMessage(playerid, COLOR_WHITE, "��kmak i�in {FF6347}ENTER{FFFFFF}, se�mek i�in {FF6347}SPACE{FFFFFF} tu�una bas�n.");
    }
    return 1;
}*/

CMD:vw(playerid, params[])
{
    SendServerMessage(playerid, "Virtual World: %d", GetPlayerVirtualWorld(playerid));
    return 1;
}

CMD:pmkapat(playerid, params[])
{
    if(PlayerData[playerid][PmOFF])
    {
        PlayerData[playerid][PmOFF] = false;
        SendServerMessage(playerid, "PM kanal�n� ba�ar�yla a�t�n.");
    }
    else
    {
        PlayerData[playerid][PmOFF] = true;
        SendServerMessage(playerid, "PM kanal�n� ba�ar�yla kapatt�n.");
    }
    return 1;
}

CMD:motor(playerid, params[])
{
    if(!IsPlayerInAnyVehicle(playerid)) return SendServerMessage(playerid, "Herhangi bir ara�ta de�ilsin.");
    if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendServerMessage(playerid, "Arac�n �of�r koltu�unda de�ilsin.");

    new vehicleid = GetPlayerVehicleID(playerid);
    if(NoEngineCar(vehicleid)) return SendServerMessage(playerid, "Bu arac�n motoru yok.");
    if(!IsValidCar(vehicleid) && !PlayerData[playerid][pAdminDuty]) return SendServerMessage(playerid, "Bu komut sadece �zel ara�larda kullan�l�r.");

		if(CarData[vehicleid][carImpounded] != -1 && !PlayerData[playerid][pAdminDuty])
			return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bu ara� �ekildi�i i�in bu komudu kullanamazs�n.");

    if(IsValidRentalCar(vehicleid))
    {
        if(CarData[vehicleid][carRentedBy] != PlayerData[playerid][pSQLID] && !PlayerData[playerid][pAdminDuty])
        {
            GameTextForPlayer(playerid, "Anahtarlarin yok.", 2000, 6);
            return 1;
        }
    }

    if(IsValidFactionCar(vehicleid))
    {
        if(PlayerData[playerid][pFaction] != CarData[vehicleid][carFaction] && !PlayerData[playerid][pAdminDuty])
        {
            SendServerMessage(playerid, "Bu araca eri�imin yok.");
            return 1;
        }
    }

    if(IsValidPlayerCar(vehicleid))
    {

        if(CarData[vehicleid][carEngine] < 10.00)
        {
            SendServerMessage(playerid, "Arac�n motor �mr� bitmi�.");
            return 1;
        }

				if(PlayerData[playerid][pSQLID] != CarData[vehicleid][carOwnerID] && PlayerData[playerid][pCarKey] != CarData[vehicleid][carID] && !PlayerData[playerid][pAdminDuty])
				{
					if(CarEngine[vehicleid] && !PlayerData[playerid][pAdminDuty])
					{
						GameTextForPlayer(playerid, "~g~MOTOR ZATEN ACIK", 3000, 3);
						return 1;
					}

					if(PlayerData[playerid][pUnscrambling])
						return SendClientMessage(playerid, COLOR_ADM, "SERVER: Zaten d�zkontak uyguluyorsun.");

					new
						idx;

					PlayerData[playerid][pUnscrambling] = true;

					idx = random(sizeof(g_aUnscrambleInfo));
					PlayerData[playerid][pUnscrambleID] = idx;

					switch(CarData[vehicleid][carImmob])
					{
						case 1: PlayerData[playerid][pUnscramblerTime] = 125;
						case 2: PlayerData[playerid][pUnscramblerTime] = 100;
						case 3: PlayerData[playerid][pUnscramblerTime] = 75;
						case 4: PlayerData[playerid][pUnscramblerTime] = 50;
						case 5: PlayerData[playerid][pUnscramblerTime] = 25;
					}

					PlayerData[playerid][pUnscrambleTimer] = SetTimerEx("OnPlayerUnscramble", 1000, true, "i", playerid);

					PlayerTextDrawSetString(playerid, Unscrambler_PTD[playerid][1], sprintf("%s", g_aUnscrambleInfo[idx][scrambledWord]));
					PlayerTextDrawSetString(playerid, Unscrambler_PTD[playerid][2], sprintf("~r~KELIMEYI_COZMEK_ICIN_~w~%d_~r~SANIYEN_VAR", PlayerData[playerid][pUnscramblerTime]));

					ShowUnscrambleTextdraw(playerid);
					//LogPlayerAction(playerid, sprintf("%i numaral� araca d�zkontak yap�yor.", CarData[vehicleid][carID]));
					return 1;
				}
    }

    if(CarEngine[vehicleid])
    {
        CarEngine[vehicleid] = false;
        ToggleVehicleEngine(vehicleid, false);
        cmd_ame(playerid, sprintf("%s model arac�n motorunu kapat�r.", ReturnVehicleName(vehicleid)));
        GameTextForPlayer(playerid, "~r~MOTOR KAPANDI", 2000, 4);
    }
    else
    {
        if(CarData[vehicleid][carFuel] < 1)
        {
            SendServerMessage(playerid, "Arac�n yak�t� bitmi�.");
            return 1;
        }

				if(CarData[vehicleid][carTweak] == true)
				{
					CarData[vehicleid][carRev] = gettime();
					SendServerMessage(playerid, "Motor k�t� bir �ekilde hasar ald�.");
					SendClientMessage(playerid, COLOR_YELLOW, "�PUCU: {FFFFFF}W{FFFF00} tu�una basarak motoru zorlayabilirsin.");
					SendClientMessage(playerid, COLOR_YELLOW, "�PUCU: Motoru �al��t�r�rken {FFFFFF}10 saniye{FFFF00} hakk�n olacakt�r.");
					PlayerData[playerid][carTweakTimer] = SetTimerEx("OnPlayerCarTweak", 500, true, "dd", playerid, vehicleid);
					return 1;
				}

        CarEngine[vehicleid] = true;
        ToggleVehicleEngine(vehicleid, true);
        cmd_ame(playerid, sprintf("%s model arac�n motorunu �al��t�r�r.", ReturnVehicleName(vehicleid)));
        GameTextForPlayer(playerid, "~g~MOTOR ACILDI", 2000, 4);
    }
    return 1;
}

CMD:taksi(playerid, params[])
{
	new
		str_a[30], str_b[30];

	if(sscanf(params, "s[30]S()[30]", str_a, str_b))
	{
		SendClientMessage(playerid, COLOR_YELLOW, "KULLANIM: /taksi [parametre]");
		SendClientMessage(playerid, COLOR_WHITE, "KONTROL |");
		SendClientMessage(playerid, COLOR_WHITE, "TARIFE | BITIR | KABUL");
		SendClientMessage(playerid, COLOR_WHITE, "ISBASI | BASLA");
		SendClientMessage(playerid, COLOR_WHITE, "�PUCU: Taksimetrenin durmas� size otomatik para gelece�i anlam�na gelmez.");
		return 1;
	}

	if(!strcmp(str_a, "kontrol"))
	{
		new id;
		if(sscanf(str_b, "u", id)) {
			SendClientMessage(playerid, COLOR_YELLOW, "KULLANIM: /taksi kontrol [oyuncu ID/ad�]");
			SendClientMessage(playerid, COLOR_WHITE, "�PUCU: Bu komutla taksicinin tarifesini ��renebilirsin.");
			return 1;
		}

		if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
		if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
		if(!StartedTaxiJob[id]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i i�ba��nda g�z�km�yor.");
		SendClientMessageEx(playerid, COLOR_YELLOW, "-> %s isimli taksicinin tarifesi: $%i/saniye", ReturnName(id), TaxiFair[id]);
		return 1;
	}

	new vehicleid = GetPlayerVehicleID(playerid);
	if(PlayerData[playerid][pSideJob] != TAXI_JOB && PlayerData[playerid][pJob] != TAXI_JOB) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Taksi �of�r� de�ilsin.");
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendErrorMessage(playerid, "Herhangi bir ara� i�erisinde de�ilsin.");
	if(!IsTaxi(vehicleid)) return SendErrorMessage(playerid, "Takside i�erisinde olman gerekiyor.");

	if(!strcmp(str_a, "basla"))
	{
		new anyPlayers = 0;
		if(!StartedTaxiJob[playerid]) return SendClientMessage(playerid, COLOR_YELLOW, "-> /taksi isbasi yazmal�s�n.");
		if(TaxiFairStarted[playerid]) return SendClientMessage(playerid, COLOR_YELLOW, "-> Tarifen aktif ilk �nce kapat.");

		foreach (new i : Player)
		{
			if(i == playerid)
				continue;

			if(IsPlayerInVehicle(i, vehicleid))
			{
				anyPlayers++;

				InTaxiRide[i] = 1;
				TaxiDriver[i] = PlayerData[playerid][pSQLID];

				TaxiDuration[i] = gettime();
				TaxiPrice[i] = 0;

				for(new c = 0; c < 5; c++) PlayerTextDrawShow(i, TaxiFair_PTD[playerid][c]);
				TaxiDurationTimer[i] = SetTimerEx("UpdateTaxiDuration", 1000, true, "i", i);
				SendClientMessageEx(i, COLOR_YELLOW, "-> Taksi �of�r� %s tarifeyi ba�latt�. (Tarife: $%i/saniye)", ReturnName(playerid, 0), TaxiFair[playerid]);
			}
		}

		if(!anyPlayers) return SendClientMessage(playerid, COLOR_YELLOW, "-> Taksinde kimse yok, tarife ba�latamazs�n.");

		TaxiDriverTimer[playerid] = SetTimerEx("OnTaxiFair", 1000, true, "i", playerid);
		TaxiFairStarted[playerid] = 1;
		TaxiDuration[playerid] = gettime();
		TaxiTotalFair[playerid] = 0;

		for(new f = 0; f < 5; f++) PlayerTextDrawShow(playerid, TaxiFair_PTD[playerid][f]);
	}
	else if(!strcmp(str_a, "kabul"))
	{
		if(!StartedTaxiJob[playerid]) return SendClientMessage(playerid, COLOR_YELLOW, "-> /taksi isbasi yazmal�s�n.");

		new ph;
		if(sscanf(str_b, "i", ph)) return SendClientMessage(playerid, COLOR_YELLOW, "KULLANIM: /taksi kabul [telefon numaras�]");

		new id = IsValidNumber(ph);
		if(id == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_ADM, "Hatal� telefon numaras� girdiniz.");
		if(GetPVarInt(id, "NeedTaxi") == 0) return SendClientMessage(playerid, COLOR_ADM, "Bu �a�r� yan�tlanm�� veya �uanda ihtiyac� yok.");

		SendClientMessageEx(id, COLOR_YELLOW, "%s taksi �a�r�n� cevaplad�, sana do�ru geliyor. Tarifesi: $%i/saniye", ReturnName(playerid, 0), TaxiFair[playerid]);
		SendClientMessage(playerid, COLOR_WHITE, "Taksi �a�r�s�na ilk sen cevap verdin!");

		SendClientMessage(playerid, COLOR_YELLOW, "|_______________Taksi �a�r�s�_______________|");
		SendClientMessageEx(playerid, COLOR_YELLOW, "Arayan: %i", ReturnPhoneNumber(id));
		SendClientMessageEx(playerid, COLOR_YELLOW, "Lokasyon: %s", Player_GetLocation(id));
		SendClientMessageEx(playerid, COLOR_YELLOW, "Gidece�i Yer: %s", TaxiText[id]);

		format(TaxiText[id], 128, "");
		SetPVarInt(id, "NeedTaxi", 0);
	}
	else if(!strcmp(str_a, "bitir"))
	{
		if(!TaxiFairStarted[playerid]) return SendClientMessage(playerid, COLOR_YELLOW, "-> Tarifeyi ba�latmadan bitiremezsin.");

		foreach(new i : Player)
		{
			if(InTaxiRide[i] && TaxiDriver[i] == PlayerData[playerid][pSQLID])
			{
				EndTaxiFair(i);
				SendClientMessage(i, COLOR_YELLOW, "-> Taksi �of�r�n tarifeyi kapatt�.");
			}
		}

		EndTaxiFairDriver(playerid);
		SendClientMessage(playerid, COLOR_YELLOW, "-> Tarifen sona erdi.");
	}
	else if(!strcmp(str_a, "tarife"))
	{
		new
			price;

		if(sscanf(str_b, "i", price))
		{
			SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /taksi tarife [$(1-25)]");
			SendClientMessageEx(playerid, COLOR_ADM, "[!] �u anki tarifen: $%i", TaxiFair[playerid]);
			return 1;
		}

		if(price < 1 || price > 25) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Miktar $1 - $25 aras�nda olmal�.");
		if(TaxiFairStarted[playerid]) return SendClientMessage(playerid, COLOR_ADM, "SERVER: �lk ba�ta aktif olan tarifeni kapat.");

		TaxiFair[playerid] = price;
		SendClientMessageEx(playerid, COLOR_YELLOW, "-> Tarifeni $%d olarak ayarlad�n.", price);
	}
	else if(!strcmp(str_a, "isbasi"))
	{
		if(StartedTaxiJob[playerid])
		{
			if(!PlayerData[playerid][pTesterDuty] && !PlayerData[playerid][pAdminDuty])
				SetPlayerColor(playerid, COLOR_WHITE);

			StartedTaxiJob[playerid] = false;
			SendClientMessage(playerid, COLOR_YELLOW, "-> Taksi i�ba��n� kapatt�n.");
		}
		else
		{
			if(!PlayerData[playerid][pTesterDuty] && !PlayerData[playerid][pAdminDuty])
				SetPlayerColor(playerid, COLOR_TAXIDUTY);

			StartedTaxiJob[playerid] = true;

			SendClientMessageEx(playerid, COLOR_YELLOW, "-> Taksi i�ba��n� a�t�n. (Tarife: $%i)", TaxiFair[playerid]);
		}
	}
	else return SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Hatal� parametre girdiniz.");
	return 1;
}

CMD:giseyonetim(playerid, params[])
{
	if(!IsPoliceFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty]) return SendServerMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");

	new sub[128], primary[512];
	strcat(primary, "Gi�e y�netim men�s�ne ho� geldin!\n\n");
	strcat(primary, "Bu men� arac�l��� ile gi�elerin kilit durumunu y�netebilir ve\n");
	strcat(primary, "San Andreas etraf�ndaki belirli gi�elerin bilgilerine g�z atabilirsin.\n\n");
	strcat(primary, "Bu ekranda, son 60 dakika i�erisindeki\n");
	strcat(primary, "b�t�n gi�elerin giri� - ��k��lar�n� ve fiyatland�rmalar�n�\n");
	strcat(primary, "istatistiksel ve finansal olarak g�rebilirsin.\n\n");
	strcat(primary, "{85A82B}�statiktiksel Bilgiler:\n");
	format(sub, sizeof(sub), "{FFFFFF}A��k Gi�eler: %i          �demeler: $%i          Ka� Kez Kilitlendi: %i", Toll_OpenedCount(), TotalTollPayment, TollTimesLocked);
	strcat(primary, sub);

	Dialog_Show(playerid, TOLL_LIST, DIALOG_STYLE_MSGBOX, "Gi�e Y�netimi", primary, "�lerle", "Kapat");
	return 1;
}

CMD:gise(playerid, params[])
{
	if(GetPVarInt(playerid, "AtToll") != -1)
	{
		new t = GetPVarInt(playerid, "AtToll");
		if(IsPlayerInRangeOfPoint(playerid, 6.0, TollData[t][TollPos][0], TollData[t][TollPos][1], TollData[t][TollPos][2]))
		{
			if(TollData[t][TollStatus]) return SendClientMessage(playerid, COLOR_ADM, "Gi�e G�revlisi: {FFFFFF}Gi�e zaten a��k!");
			if(TollData[t][TollLocked] && !PlayerData[playerid][pLAWduty] && !PlayerData[playerid][pMEDduty])
				return SendClientMessage(playerid, COLOR_ADM, "Gi�e G�revlisi: {FFFFFF}Gi�eler �u anda kullan�ma kapat�lm��.");

			if(PlayerData[playerid][pMoney] < TollData[t][TollPrice] && !PlayerData[playerid][pLAWduty])
				return SendClientMessage(playerid, COLOR_ADM, "Gi�e G�revlisi: {FFFFFF}Gi�elerin a��lmas� i�in para �demelisin.");

			SendClientMessage(playerid, COLOR_ADM, "Gi�e G�revlisi: {FFFFFF}Gi�eler 6 saniyeli�ine a��ld�. Kapanmadan ge�!");

			if(!PlayerData[playerid][pLAWduty] && !PlayerData[playerid][pMEDduty])
			{
				GiveMoney(playerid, -TollData[t][TollPrice]);
				TotalTollPayment += TollData[t][TollPrice];
			}

			TollData[t][TollStatus] = true;
			SetDynamicObjectRot(TollData[t][TollObject], TollData[t][TollMovePos][3], TollData[t][TollMovePos][4], TollData[t][TollMovePos][5]);
			TollData[t][TollTimer] = SetTimerEx("Toll_Close", 6000, false, "i", t);
		}
	}
	return 1;
}

CMD:samaps(playerid, params[])
{
	if(!IsPlayerInAnyVehicle(playerid)) return SendErrorMessage(playerid, "Herhangi bir ara� i�erisinde de�ilsin.");
	if(GetPlayerVehicleSeat(playerid) > 1) return SendErrorMessage(playerid, "Arka koltukta bu komutu kullanamazs�n.");
	if(PlayerData[playerid][pDrivingTest]) return SendServerMessage(playerid, "Ehliyet s�nav�ndayken bu komutu kullanamazs�n.");
	if(PlayerData[playerid][pTaxiDrivingTest]) return SendServerMessage(playerid, "Taksi s�nav�ndayken bu komutu kullanamazs�n.");

	new primary_str[200];
	strcat(primary_str, "Sokak Bul\n");
	strcat(primary_str, "Ev Bul\n");
	strcat(primary_str, "En Yak�n Benzin �stasyonu\n");
	strcat(primary_str, "En Yak�n 24/7\n");
	strcat(primary_str, "En Yak�n Bar/Kul�p\n");
	strcat(primary_str, "En Yak�n Restaurant\n");
	strcat(primary_str, "T�m ��yerleri\n");
	strcat(primary_str, "�nemli Noktalar\n");
	Dialog_Show(playerid, GPS_MAIN, DIALOG_STYLE_LIST, "SA Maps - Ana Men�", primary_str, "�leri", "Kapat");
	return 1;
}

CMD:fac(playerid, params[]) return cmd_f(playerid, params);
CMD:f(playerid, params[])
{
	if(PlayerData[playerid][pFaction] == -1) return SendErrorMessage(playerid, "Herhangi bir birlikte de�ilsin.");
	if(!PlayerData[playerid][pFactionStatus]) return SendErrorMessage(playerid, "Birlik kanal�n� kapatm��s�n, /tog birlik yazarak a�abilirsin.");

	if(PlayerData[playerid][pFactionRank] > FactionData[PlayerData[playerid][pFaction]][FactionChatrank])
	    return SendErrorMessage(playerid, "Birlik kanal�ndan konu�abilmek i�in r�tben yetersiz.");

	if(isnull(params)) return SendUsageMessage(playerid, "/f [mesaj]");

	if(FactionData[PlayerData[playerid][pFaction]][FactionChatStatus])
    {
        if(PlayerData[playerid][pFactionRank] > FactionData[PlayerData[playerid][pFaction]][FactionEditrank] && !PlayerData[playerid][pAdminDuty])
        {
            SendErrorMessage(playerid, "Birlik kanal� birlik y�neticileri taraf�ndan kapat�lm��.");
		}
		else
		{
			SendFactionMessage(playerid, sprintf("**(( %s %s: %s ))**", Player_GetFactionRank(playerid), ReturnName(playerid, 1), params));
		}
	}
	else
	{
		SendFactionMessage(playerid, sprintf("**(( %s %s: %s ))**", Player_GetFactionRank(playerid), ReturnName(playerid, 1), params));
	}
	return true;
}

CMD:frozet(playerid, params[])
{
	if(!IsLAWFaction(playerid)) return UnAuthMessage(playerid);
    if(PlayerData[playerid][pFactionRank] > FactionData[PlayerData[playerid][pFaction]][FactionEditrank])
        return SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�:{FFFFFF} Rozet numaralar�n� ayarlamak i�in r�tben yetersiz.");

    new id, badge;
    if(sscanf(params, "ui", id, badge)) return SendUsageMessage(playerid, "/frozet [oyuncu ID/isim] [rozet numaras�]");
	if(!IsPlayerConnected(id)) return SendServerMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
	if(!pLoggedIn[id]) return SendServerMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");

	SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %s isimli oyuncunun rozet numaras�n� #%d olarak g�ncelledin.", ReturnName(id), badge);
    SendClientMessageEx(id, COLOR_YELLOW, "SERVER: Rozet numaran #%d olarak g�ncellendi.", badge);
    SaveSQLInt(PlayerData[id][pSQLID], "players", "Badge", badge);
    PlayerData[id][pBadge] = badge;
    return 1;
}

CMD:frutbeayarla(playerid, params[])
{
	if(PlayerData[playerid][pFaction] == -1) return SendErrorMessage(playerid, "Herhangi bir birlikte de�ilsin.");
	if(PlayerData[playerid][pFactionRank] > FactionData[PlayerData[playerid][pFaction]][FactionEditrank])
		return SendErrorMessage(playerid, "Birlik r�tbelerini ayarlamak i�in r�tben yetersiz.");

	new rank[60], rankn, faction = PlayerData[playerid][pFaction];
	if(sscanf(params, "ds[60]", rankn, rank))
	{
		SendUsageMessage(playerid, "/frutbeayarla [r�tbe ID] [r�tbe ad�]");
		return 1;
	}

	if(rankn > 20 || rankn < 1)
		return SendErrorMessage(playerid, "Hatal� r�tbe ID girdin.");

	if(strlen(rank) > 60)
		return SendErrorMessage(playerid, "R�tbe ad� 60 karakterden fazla olamaz.");

	SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}#%i numaral� r�tbenin ad�n� %s olarak de�i�tirdin!", rankn, rank);
	FactionRanks[faction][rankn] = rank;
	Faction_SaveRanks(faction);
	return 1;
}

CMD:fkapat(playerid, params[])
{
	if(PlayerData[playerid][pFaction] == -1) return SendErrorMessage(playerid, "Herhangi bir birlikte de�ilsin.");
	if(PlayerData[playerid][pFactionRank] > FactionData[PlayerData[playerid][pFaction]][FactionEditrank])
		return SendErrorMessage(playerid, "Birlik kanal�n� ayarlamak i�in r�tben yetersiz.");

	new faction = PlayerData[playerid][pFaction];
	if(!FactionData[faction][FactionChatStatus])
	{
		SendFactionMessageEx(playerid, COLOR_ADM, sprintf("[!] {FFFFFF}%s birlik kanal�n� kullan�ma kapatt�.", ReturnName(playerid, 1)));
		FactionData[faction][FactionChatStatus] = true;
	}
	else
	{
		SendFactionMessageEx(playerid, COLOR_ADM, sprintf("[!] {FFFFFF}%s birlik kanal�n� kullan�ma a�t�.", ReturnName(playerid, 1)));
		FactionData[faction][FactionChatStatus] = false;
	}
	return 1;
}

CMD:frenk(playerid, params[])
{
	if(PlayerData[playerid][pFaction] == -1) return SendErrorMessage(playerid, "Herhangi bir birlikte de�ilsin.");
	if(PlayerData[playerid][pFactionRank] > FactionData[PlayerData[playerid][pFaction]][FactionEditrank])
		return SendErrorMessage(playerid, "Birlik kanal� rengini ayarlamak i�in r�tben yetersiz.");

	new color, faction = PlayerData[playerid][pFaction];
	if(sscanf(params, "x", color)) return SendUsageMessage(playerid, "/frenk [hex code (�rnek: 0x(6 haneli kod buraya)FF)]");

	SendClientMessageEx(playerid, COLOR_ADM, sprintf("[!] {FFFFFF}Birlik kanal rengi %x olarak ayarland�.", color));
	FactionData[PlayerData[playerid][pFaction]][FactionChatColor] = color;
	SaveSQLInt(faction, "factions", "ChatColor", FactionData[faction][FactionChatColor]);
	return true;
}

CMD:fisim(playerid, params[])
{
	if(PlayerData[playerid][pFaction] == -1) return SendErrorMessage(playerid, "Herhangi bir birlikte de�ilsin.");
	if(PlayerData[playerid][pFactionRank] != 1) return SendErrorMessage(playerid, "Bu komutu sadece en y�ksek r�tbe kullanabilir.");

	new name[128], faction = PlayerData[playerid][pFaction];
	if(sscanf(params, "s[128]", name)) return SendUsageMessage(playerid, "/fisim [birlik ad�]");
	SendClientMessageEx(playerid, COLOR_ADM, "[!] {FFFFFF}Birlik isminiz %s olarak de�i�tirildi.", name);
	format(FactionData[faction][FactionName], 128, "%s", name);
	Faction_Save(faction);
	return 1;
}

CMD:fkisaltma(playerid, params[])
{
	if(PlayerData[playerid][pFaction] == -1) return SendErrorMessage(playerid, "Herhangi bir birlikte de�ilsin.");
	if(PlayerData[playerid][pFactionRank] != 1) return SendErrorMessage(playerid, "Bu komutu sadece en y�ksek r�tbe kullanabilir.");

	new name[128], faction = PlayerData[playerid][pFaction];
	if(sscanf(params, "s[128]", name)) return SendUsageMessage(playerid, "/fkisaltma [k�saltma]");
	SendClientMessageEx(playerid, COLOR_ADM, "[!] {FFFFFF}Birlik k�saltman�z %s olarak de�i�tirildi.", name);
	format(FactionData[faction][FactionAbbrev], 128, "%s", name);
	Faction_Save(faction);
	return 1;
}

CMD:fkabul(playerid, params[])
{
	if(PlayerData[playerid][pFactionOffer] == -1) return SendErrorMessage(playerid, "Herhangi bir birli�e davet edilmemi�sin.");

	PlayerData[playerid][pFaction] = PlayerData[playerid][pFactionOffer];
	SaveSQLInt(PlayerData[playerid][pSQLID], "players", "Faction", PlayerData[playerid][pFaction]);

	PlayerData[playerid][pFactionRank] = FactionData[PlayerData[playerid][pFactionOffer]][FactionMaxRanks];
	SaveSQLInt(PlayerData[playerid][pSQLID], "players", "FactionRank", PlayerData[playerid][pFactionRank]);
	PlayerData[playerid][pSpawnPoint] = 3;

	SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Art�k %s birli�inin bir �yesisin!", FactionData[PlayerData[playerid][pFaction]][FactionName]);
	PlayerData[playerid][pFactionOffer] = -1;
	return 1;
}

CMD:fdavet(playerid, params[])
{
	if(PlayerData[playerid][pFaction] == -1) return SendErrorMessage(playerid, "Herhangi bir birlikte de�ilsin.");

	new playerb;
	if(sscanf(params, "u", playerb)) return SendUsageMessage(playerid, "/fdavet [oyuncu ID/isim]");
	if(PlayerData[playerid][pFactionRank] > FactionData[PlayerData[playerid][pFaction]][FactionEditrank])
		return SendErrorMessage(playerid, "Birlik davet komutunu kullanmak i�in r�tben yetersiz.");

	if(!IsPlayerConnected(playerb)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i aktif de�il.");
	if(!pLoggedIn[playerb]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
	if(PlayerData[playerb][pFaction] != -1) return SendErrorMessage(playerid, "Belirtti�iniz ki�i zaten herhangi bir birlikte bulunuyor.");

	SendClientMessageEx(playerb, COLOR_YELLOW, "SERVER: %s seni %s birli�ine davet etti, kabul etmek i�in /fkabul yazabilirsin.", ReturnName(playerid, 0), FactionData[PlayerData[playerid][pFaction]][FactionName]);
	SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %s isimli ki�iyi %s birli�ine davet ettin, kabul etmesi i�in /fkabul yazmal�.", ReturnName(playerb, 0), FactionData[PlayerData[playerid][pFaction]][FactionName]);
	PlayerData[playerb][pFactionOffer] = PlayerData[playerid][pFaction];
	return 1;
}

CMD:fkov(playerid, params[])
{
	if(PlayerData[playerid][pFaction] == -1) return SendErrorMessage(playerid, "Herhangi bir birlikte de�ilsin.");
	if(PlayerData[playerid][pFactionRank] > FactionData[PlayerData[playerid][pFaction]][FactionEditrank])
		return SendErrorMessage(playerid, "Birlikten atma komutunu kullanmak i�in r�tben yetersiz.");

	new id;
	if(sscanf(params, "u", id)) return SendUsageMessage(playerid, "/fkov [oyuncu ID/isim]");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
	if(PlayerData[id][pFaction] == -1) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hi� bir birlikte bulunmuyor.");
	if(PlayerData[playerid][pFaction] != PlayerData[id][pFaction]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i bu birlikte bulunmuyor.");
	if(PlayerData[playerid][pFactionRank] > PlayerData[id][pFactionRank]) return SendErrorMessage(playerid, "Senden y�ksek r�tbeli birini kovamazs�n.");

	SendClientMessageEx(id, COLOR_YELLOW, "SERVER: %s seni %s birli�inden kovdu.", ReturnName(playerid, 0), FactionData[PlayerData[playerid][pFaction]][FactionName]);
	SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: %s isimli ki�iyi birlikten kovdun.", ReturnName(id, 0));

	if(FactionData[PlayerData[id][pFaction]][FactionCopPerms])
	{
		SetPlayerArmour(id, 0);
		SetPlayerColor(id, COLOR_WHITE);
		PlayerData[id][pLAWduty] = false;
		PlayerData[id][pSWATduty] = false;
		TakePlayerGuns(playerid);
	}

	if(GetPlayerSkin(playerid) != PlayerData[playerid][pSkin])
		SetPlayerSkin(playerid, PlayerData[playerid][pSkin]);

	PlayerData[id][pFactionRank] = 0;
	PlayerData[id][pFaction] = -1;
	return 1;
}

CMD:frutbe(playerid, params[])
{
	if(PlayerData[playerid][pFaction] == -1) return SendErrorMessage(playerid, "Herhangi bir birlikte de�ilsin.");
	if(PlayerData[playerid][pFactionRank] > FactionData[PlayerData[playerid][pFaction]][FactionEditrank])
		return SendErrorMessage(playerid, "Birlik r�tbe komutunu kullanmak i�in r�tben yetersiz.");

	new playerb,
		newrank,
		faction = PlayerData[playerid][pFaction];

	if(sscanf(params, "ud", playerb, newrank))
	{
		for(new i = 1; i < MAX_FACTION_RANKS; i++)
		{
			if(!strcmp(FactionRanks[faction][i], "Yok"))
				continue;

			SendClientMessageEx(playerid, COLOR_YELLOW, "-> R�tbe %i: %s", i, FactionRanks[faction][i]);
		}

		SendUsageMessage(playerid, "/frutbe [oyuncu ID/isim] [r�tbe ID]");
		return 1;
	}

	if(newrank < 1 || newrank > 20) return SendErrorMessage(playerid, "Hatal� r�tbe ID girdin.");
	if(!IsPlayerConnected(playerb)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
	if(!pLoggedIn[playerb]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
	if(PlayerData[playerb][pFaction] != faction) return SendErrorMessage(playerid, "Belirtti�iniz ki�i bu birlikte bulunmuyor.");
	if(PlayerData[playerb][pFactionRank] < PlayerData[playerid][pFactionRank]) return SendErrorMessage(playerid, "Belirtti�in ki�iyi senden y�ksek r�tbeli yapamazs�n.");

	SendClientMessageEx(playerid, COLOR_YELLOW, "%s isimli ki�inin r�tbesini %s(eskisi: %s) olarak g�ncelledin!", ReturnName(playerb, 1), FactionRanks[faction][newrank], FactionRanks[faction][PlayerData[playerb][pFactionRank]]);
	SendClientMessageEx(playerb, COLOR_YELLOW, "Birlik r�tbeniz %s taraf�ndan %s(eskisi: %s) olarak g�ncellendi!", ReturnName(playerid, 1), FactionRanks[faction][newrank], FactionRanks[faction][PlayerData[playerb][pFactionRank]]);
	PlayerData[playerb][pFactionRank] = newrank;
	return 1;
}

/*CMD:ofkov(playerid, params[])
{
	if(!PlayerData[playerid][pFaction])
		return SendErrorMessage(playerid, "Herhangi bir birlikte de�ilsin.");
	if(PlayerData[playerid][pFactionRank] > FactionData[PlayerData[playerid][pFaction]][factionEditrank])
		return SendErrorMessage(playerid, "Birlikten atma komutunu kullanmak i�in r�tben yetersiz.");
	if(isnull(params))
		return SendUsageMessage(playerid, "/ofkov [�sim_Soyisim]");
	if(!IsValidRoleplayName(params))
		return SendErrorMessage(playerid, "Hatal� isim_soyisim girdin. �sim kelimesi kelimesine ayn� olmal�.");
	if(!ReturnSQLFromName(params))
		return SendErrorMessage(playerid, "Belirtti�in ki�i veritaban�nda yok.");

	foreach(new i : Player)
	{
		if(!strcmp(ReturnName(i), params, true))
		{
			SendErrorMessage(playerid, "Belirtti�in ki�i �u anda oyunda g�z�k�yor.");
			return 1;
		}
	}

	new query[230];
	new faction_id, rank_id;

	mysql_format(m_Handle, query, sizeof query, "SELECT Faction, FactionRank FROM players WHERE id = %i", ReturnSQLFromName(params));
	new Cache:cache = mysql_query(m_Handle, query);

	cache_get_value_name_int(0, "Faction", faction_id);
	cache_get_value_name_int(0, "FactionRank", rank_id);

	if(faction_id != PlayerData[playerid][pFaction])
	{
		SendErrorMessage(playerid, "Belirtti�in ki�i senin birli�inde de�il.");
		cache_delete(cache);
		return 1;
	}

	if(rank_id < PlayerData[playerid][pFactionRank])
	{
		SendErrorMessage(playerid, "Belirtti�in ki�i senden daha r�tbeli.");
		cache_delete(cache);
		return 1;
	}

	format(query, sizeof query, "%s adl� ki�iyi birlikten atmak istiyor musun?", params);
	ConfirmDialog(playerid, "Onay", query, "OnOfflineUninvite", ReturnSQLFromName(params));
	cache_delete(cache);
	return true;
}

*/

CMD:sreklam(playerid, params[])
{
	if(GetPVarInt(playerid, "AtBusiness") != -1)
	{
		new b = GetPVarInt(playerid, "AtBusiness");
		if(BusinessData[b][BusinessType] != BUSINESS_ADVERT) return SendErrorMessage(playerid, "Bu i�yeri reklam noktas� de�il.");
		if(PlayerData[playerid][pMoney] < 150) return SendErrorMessage(playerid, "Reklam vermek i�in yeterli paran yok. ($150)");

		new ad_text[128];
		if(sscanf(params, "s[128]",ad_text))
		{
			SendUsageMessage(playerid, "/sreklam [reklam metniniz]");
			return 1;
		}

		if(strlen(ad_text) < 1 || strlen(ad_text) > 128)
		{
			SendErrorMessage(playerid, "Reklam�n i�eri�i en az 1 karakter en fazla 128 karakter olmal�d�r.");
			return 1;
		}

		if(PlayerInQueue(playerid) > Advert_GetLimit(playerid))
		{
			SendClientMessageEx(playerid, COLOR_ADM, "SERVER: %i ki�i s�rada g�r�n�yor, l�tfen bekleyin.", PlayerInQueue(playerid));
			return 1;
		}

		Advert_Publish(playerid, ad_text, 2);
		return 1;
	}

	SendErrorMessage(playerid, "Yak�n�nda reklam noktas� yok.");
	return 1;
}

CMD:reklam(playerid, params[])
{

	if(IsPlayerInRangeOfPoint(playerid, 1.5, 1129.0577, -1489.6921, 22.7626))
	{
		new ad_text[128];
		if(sscanf(params, "s[128]",ad_text))
		{
			SendUsageMessage(playerid, "/reklam [reklam metniniz]");
			return 1;
		}

		if(strlen(ad_text) < 1 || strlen(ad_text) > 128)
		{
			SendErrorMessage(playerid, "Reklam�n i�eri�i en az 1 karakter en fazla 128 karakter olmal�d�r.");
			return 1;
		}

		if(PlayerInQueue(playerid) > Advert_GetLimit(playerid))
		{
			SendClientMessageEx(playerid, COLOR_ADM, "SERVER: %i ki�i s�rada g�r�n�yor, l�tfen bekleyin.", PlayerInQueue(playerid));
			return 1;
		}

		Advert_Publish(playerid, ad_text, 1);
		return 1;
	}

	if(GetPVarInt(playerid, "AtBusiness") != -1)
	{
		new b = GetPVarInt(playerid, "AtBusiness");
		if(BusinessData[b][BusinessType] != BUSINESS_ADVERT) return SendErrorMessage(playerid, "Bu i�yeri reklam noktas� de�il.");
		if(PlayerData[playerid][pMoney] < 150) return SendErrorMessage(playerid, "Reklam vermek i�in yeterli paran yok. ($150)");

		new ad_text[128];
		if(sscanf(params, "s[128]",ad_text))
		{
			SendUsageMessage(playerid, "/reklam [reklam metniniz]");
			return 1;
		}

		if(strlen(ad_text) < 1 || strlen(ad_text) > 128)
		{
			SendErrorMessage(playerid, "Reklam�n i�eri�i en az 1 karakter en fazla 128 karakter olmal�d�r.");
			return 1;
		}

		if(PlayerInQueue(playerid) > Advert_GetLimit(playerid))
		{
			SendClientMessageEx(playerid, COLOR_ADM, "SERVER: %i ki�i s�rada g�r�n�yor, l�tfen bekleyin.", PlayerInQueue(playerid));
			return 1;
		}

		Advert_Publish(playerid, ad_text, 1);
		return 1;
	}

	SendClientMessage(playerid, COLOR_RED, "Reklam ofisinin i� kap�s�nda reklam verebilirsin.");
	return 1;
}

CMD:reklamlar(playerid, params[])
{
	if(GetPVarInt(playerid, "AtBusiness") != -1)
	{
		new b = GetPVarInt(playerid, "AtBusiness");
		if(BusinessData[b][BusinessType] != BUSINESS_ADVERT) return SendErrorMessage(playerid, "Bu i�yeri reklam noktas� de�il.");

		Advert_List(playerid);
		return 1;
	}

	SendErrorMessage(playerid, "Yak�n�nda reklam noktas� yok.");
	return 1;
}

CMD:sonreklamlar(playerid, params[])
{
	if(Dialog_Opened(playerid)) return SendErrorMessage(playerid, "Bu komutu kullanmak i�in ilk �nce bakt���n men�y� kapat.");

    new sub[128], primary[512];
	new advert_text[128], advert_number, adverttype, id;

	strcat(primary, "#\tReklam\t�leti�im\n");
	new Cache:cache = mysql_query(m_Handle, "SELECT * FROM adverts ORDER BY id DESC LIMIT 10");
	if(!cache_num_rows())
	{
		strcat(primary, "Hi� reklam bulunamad�.");
	}
	else
	{
		for(new i = 0, j = cache_num_rows(); i < j; i++)
		{
			cache_get_value_name_int(i, "id", id);
			cache_get_value_name_int(i, "adverttype", adverttype);
			cache_get_value_name_int(i, "advertnumber", advert_number);
			cache_get_value_name(i, "adverttext", advert_text, sizeof(advert_text));

			if(adverttype == 1)
				format(sub, sizeof(sub), "%i\t%.40s...\t%i\n", id, advert_text, advert_number);
			else
				format(sub, sizeof(sub), "%i\t%.40s...\t-\n", id, advert_text);

			strcat(primary, sub);
		}
	}
	cache_delete(cache);
	Dialog_Show(playerid, DIALOG_DEFAULT, DIALOG_STYLE_TABLIST_HEADERS, "Son Reklamlar", primary, "<<", "");
	return 1;
}

CMD:me(playerid, params[])
{
	if(isnull(params)) return SendUsageMessage(playerid, "/me [eylem]");

	if(strlen(params) > 84)
	{
	    SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s %.84s", ReturnName(playerid, 0), params);
	    SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "...%s", params[84]);
	}
	else SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s %s", ReturnName(playerid, 0), params);
	return 1;
}

CMD:melow(playerid, params[])
{
	if(isnull(params)) return SendUsageMessage(playerid, "/melow [eylem]");

	if(strlen(params) > 84)
	{
	    SendNearbyMessage(playerid, 10.0, COLOR_EMOTE, "* %s %.84s", ReturnName(playerid, 0), params);
	    SendNearbyMessage(playerid, 10.0, COLOR_EMOTE, "...%s", params[84]);
	}
	else SendNearbyMessage(playerid, 10.0, COLOR_EMOTE, "* %s %s", ReturnName(playerid, 0), params);
	return 1;
}

CMD:my(playerid, params[])
{
	if(isnull(params)) return SendUsageMessage(playerid, "/my [eylem]");

	if(strlen(params) > 84)
	{
	    SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s %.84s", ReturnName(playerid, 0), params);
	    SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "...%s", params[84]);
	}
	else SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s %s", ReturnName(playerid, 0), params);
	return 1;
}

CMD:amy(playerid, params[])
{
	if(PlayerData[playerid][pBrutallyWounded]) return SendServerMessage(playerid, "�u anda bunu yapamazs�n.");
	if(isnull(params)) return SendUsageMessage(playerid, "/amy [eylem]");

	SetPlayerChatBubble(playerid, sprintf("* %s %s", ReturnName(playerid, 0), params), COLOR_EMOTE, 25.0, 10000);
	SendClientMessageEx(playerid, COLOR_EMOTE, "> %s %s", ReturnName(playerid, 0), params);
	return 1;
}

CMD:do(playerid, params[])
{
	if(isnull(params)) return SendUsageMessage(playerid, "/do [eylem]");

	if(strlen(params) > 84)
	{
	    SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %.84s", params);
	    SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "...%s (( %s ))", params[84], ReturnName(playerid, 0));
	}
	else SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s (( %s ))", params, ReturnName(playerid, 0));
	return 1;
}

CMD:dolow(playerid, params[])
{
	if(isnull(params)) return SendUsageMessage(playerid, "/dolow [eylem]");

	if(strlen(params) > 84)
	{
	    SendNearbyMessage(playerid, 10.0, COLOR_EMOTE, "* %.84s", params);
	    SendNearbyMessage(playerid, 10.0, COLOR_EMOTE, "...%s (( %s ))", params[84], ReturnName(playerid, 0));
	}
	else SendNearbyMessage(playerid, 10.0, COLOR_EMOTE, "* %s (( %s ))", params, ReturnName(playerid, 0));
	return 1;
}

CMD:ame(playerid, params[])
{
	if(PlayerData[playerid][pBrutallyWounded]) return SendServerMessage(playerid, "�u anda bunu yapamazs�n.");
	if(isnull(params)) return SendUsageMessage(playerid, "/ame [eylem]");

	SetPlayerChatBubble(playerid, sprintf("* %s %s", ReturnName(playerid, 0), params), COLOR_EMOTE, 25.0, 10000);
	SendClientMessageEx(playerid, COLOR_EMOTE, "> %s %s", ReturnName(playerid, 0), params);
	return 1;
}

CMD:sme(playerid, params[])
{
	if(PlayerData[playerid][pBrutallyWounded]) return SendServerMessage(playerid, "�u anda bunu yapamazs�n.");

	new time, msg[128];
	if(sscanf(params, "is[128]", time, msg)) return SendUsageMessage(playerid, "/sme [s�re(1-120 saniye)] [eylem]");
    if(time < 1 || time > 120) return SendServerMessage(playerid, "S�re en az 1 en fazla 120 saniye olmal�d�r.");
	if(strlen(msg) > 128) return SendServerMessage(playerid, "Eylem i�eri�i en fazla 128 karakteri olmal�d�r.");

	SetPlayerChatBubble(playerid, sprintf("* %s %s", ReturnName(playerid, 0), msg), COLOR_EMOTE, 25.0, time*1000);
	SendClientMessageEx(playerid, COLOR_EMOTE, "> %s %s", ReturnName(playerid, 0), msg);
	return 1;
}

CMD:ado(playerid, params[])
{
    if(PlayerData[playerid][pBrutallyWounded]) return SendServerMessage(playerid, "�u anda bunu yapamazs�n.");
    if(isnull(params)) return SendUsageMessage(playerid, "/ado [durum]");

    SetPlayerChatBubble(playerid, sprintf("* %s (( %s ))", params, ReturnName(playerid, 0)), COLOR_EMOTE, 25.0, 10000);
    SendClientMessageEx(playerid, COLOR_EMOTE, "> %s (( %s ))", params, ReturnName(playerid, 0));
    return 1;
}

CMD:sdo(playerid, params[])
{
    if(PlayerData[playerid][pBrutallyWounded]) return SendServerMessage(playerid, "�u anda bunu yapamazs�n.");

    new time, msg[128];
    if(sscanf(params, "is[128]", time, msg)) return SendUsageMessage(playerid, "/sdo [s�re(1-120 saniye)] [durum]");
    if(time < 1 || time > 120) return SendServerMessage(playerid, "S�re en az 1 en fazla 120 saniye olmal�d�r.");
    if(strlen(msg) > 128) return SendServerMessage(playerid, "Durum i�eri�i en fazla 128 karakteri olmal�d�r.");

    SetPlayerChatBubble(playerid, sprintf("* %s (( %s ))", msg, ReturnName(playerid, 0)), COLOR_EMOTE, 25.0, time*1000);
    SendClientMessageEx(playerid, COLOR_EMOTE, "> %s (( %s ))", msg, ReturnName(playerid, 0));
    return 1;
}

CMD:vme(playerid, params[])
{
    if(!HaveVME[playerid])
    {
		new vehicleid = INVALID_VEHICLE_ID;

		if(!IsPlayerInAnyVehicle(playerid))
			vehicleid = GetNearestVehicle(playerid);
		else
			vehicleid = GetPlayerVehicleID(playerid);

		if(vehicleid == INVALID_VEHICLE_ID) return SendServerMessage(playerid, "Yak�n�nda ara� yok.");
		if(CarData[vehicleid][carLocked] && !PlayerData[playerid][pAdminDuty]) return SendServerMessage(playerid, "Bu ara� kilitli.");

  		new time, msg[31];
    	if(sscanf(params, "ds[31]", time, msg)) return SendUsageMessage(playerid, "/vme [s�re(1-15 dk.)] [mesaj]");
	    if(time < 1 || time > 15) return SendServerMessage(playerid, "S�re dakika cinsinden en az 1 en fazla 15 olmal�d�r.");
		if(strlen(msg) > 30) return SendServerMessage(playerid, "Mesaj�n�z�n i�eri�i 30 karakteri ge�memelidir.");

		static
    		Float:fSize[3],
    		Float:fSeat[3];

	    GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_SIZE, fSize[0], fSize[1], fSize[2]);
		GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_FRONTSEAT, fSeat[0], fSeat[1], fSeat[2]);

	    VME[playerid] = CreateDynamic3DTextLabel(sprintf("(( %s )) %s", ReturnName(playerid, 1), msg), COLOR_EMOTE, -fSeat[0], fSeat[1], fSize[2] / 2.0, 25.0, 0, 0);
	    //Create3DTextLabel(sprintf("(( %s )) %s", ReturnName(playerid, 1), msg), COLOR_EMOTE, -fSeat[0], fSeat[1], fSize[2] / 2.0, 25.0, 0, 0);
	    Attach3DTextLabelToVehicle(VME[playerid], vehicleid, 0.0, 0.0, 1.0);

	    TimerVME[playerid] = SetTimerEx("DestroyVME", time*60000, false, "i", playerid);
 	   	HaveVME[playerid] = 1;

 	   	SendClientMessageEx(playerid, COLOR_ADM, "[!] {FFFFFF}Mesaj�n�z�n ba�ar�yla araca sabitlendi, %d dakika sonra otomatik olarak silinecektir.", time);
 	   	SendClientMessage(playerid, COLOR_ADM, "Ara� mesaj�n� silmek isterseniz tekrardan /vme yazabilirsiniz.");
    } else {
        SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}Araca sabitledi�iniz mesaj ba�ar�yla silindi.");
		Delete3DTextLabel(VME[playerid]);
	    KillTimer(TimerVME[playerid]);
		HaveVME[playerid] = 0;
    }
    return 1;
}

CMD:not(playerid, params[])
{
	Note_RouteCommands(playerid, params);
	return 1;
}

CMD:ehliyet(playerid, params[])
{
	if(PlayerData[playerid][pDrivingTest]) return SendErrorMessage(playerid, "Ehliyet s�nav�n�n ortas�ndas�n.");
	if(PlayerData[playerid][pTaxiDrivingTest]) return SendErrorMessage(playerid, "Taksi s�nav�n�n ortas�ndas�n.");
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendErrorMessage(playerid, "Herhangi bir ara�ta de�ilsin.");

	if(IsPlayerInDMVVehicle(playerid))
	{
		if(PlayerData[playerid][pDriversLicense]) return SendErrorMessage(playerid, "Ehliyetin bulunuyor.");

		new
			vehicleid = GetPlayerVehicleID(playerid);

		PlayerData[playerid][pTestStage] = 0;
		PlayerData[playerid][pTestTime] = 180;
		PlayerData[playerid][pTestCar] = vehicleid;
		PlayerData[playerid][pDrivingTest] = true;

		ToggleVehicleEngine(vehicleid, true);
		CarEngine[vehicleid] = true;

	    SendClientMessage(playerid, COLOR_ADM, "_________Ana S�r�� Kurallar�_________");
	    SendClientMessage(playerid, COLOR_ADM, "1) Her zaman yolun sa� taraf�ndan s�r.");
	    SendClientMessage(playerid, COLOR_ADM, "2) Ara� ile ana yollarda h�z yapma.");
	    SendClientMessage(playerid, COLOR_ADM, "3) Yoldaki di�er s�r�c�lere kar�� ho�g�r�l� ol.");
	    SendClientMessage(playerid, COLOR_WHITE, "Kontrol noktas�na giri� yaparak s�nav�na ba�layabilirsin.");
	    SendClientMessage(playerid, COLOR_WHITE, "E�er �ok fazla h�z yaparsan, ba��n belaya girebilir.");

		//cmd_ame(playerid, sprintf("%s model arac�n motorunu �al��t�r�r.", ReturnVehicleName(vehicleid)));
		SendClientMessage(playerid, COLOR_GREY, "S�r�� E�itmeni: Kontrol noktalar�na dikkat ederek ve kurallara uyarak s�r��e ba�layabilirsin.");
		SetPlayerCheckpoint(playerid, g_arrDrivingCheckpoints[PlayerData[playerid][pTestStage]][0], g_arrDrivingCheckpoints[PlayerData[playerid][pTestStage]][1], g_arrDrivingCheckpoints[PlayerData[playerid][pTestStage]][2], 3.0);
	}
	else if(IsPlayerInTDVMVehicle(playerid))
	{
		if(!PlayerData[playerid][pDriversLicense]) return SendErrorMessage(playerid, "Ehliyet almadan, taksi ehliyeti alamazs�n.");
		if(PlayerData[playerid][pSideJob] == TAXI_JOB && PlayerData[playerid][pJob] == TAXI_JOB) return SendErrorMessage(playerid, "Taksi ehliyetin bulunuyor.");

		new
			vehicleid = GetPlayerVehicleID(playerid);

		PlayerData[playerid][pTestStage] = 0;
		//PlayerData[playerid][pTestTime] = 180;
		PlayerData[playerid][pTestCar] = vehicleid;
		PlayerData[playerid][pTaxiDrivingTest] = true;

		ToggleVehicleEngine(vehicleid, true);
		CarEngine[vehicleid] = true;

	    SendClientMessage(playerid, COLOR_ADM, "_________Ana S�r�� Kurallar�[Taksi]_________");
	    SendClientMessage(playerid, COLOR_ADM, "1) Her zaman yolun sa� taraf�ndan s�r.");
	    SendClientMessage(playerid, COLOR_ADM, "2) Ara� ile ana yollarda h�z yapma.");
	    SendClientMessage(playerid, COLOR_ADM, "3) Yoldaki di�er s�r�c�lere kar�� ho�g�r�l� ol.");
	    SendClientMessage(playerid, COLOR_WHITE, "Kontrol noktas�na giri� yaparak s�nav�na ba�layabilirsin.");
	    SendClientMessage(playerid, COLOR_WHITE, "E�er �ok fazla h�z yaparsan, ba��n belaya girebilir.");

	    SetPlayerCheckpoint(playerid, g_arrTaxiDrivingCheckpoints[PlayerData[playerid][pTestStage]][0], g_arrTaxiDrivingCheckpoints[PlayerData[playerid][pTestStage]][1], g_arrTaxiDrivingCheckpoints[PlayerData[playerid][pTestStage]][2], 3.0);
	}
	else SendErrorMessage(playerid, "Ehliyet s�nav arac� i�erisinde de�ilsin.");
	return 1;
}

CMD:boombox(playerid, params[])
{
	new specifier[40], specifier_ex[40];
	if (sscanf(params, "s[40]S()[40]", specifier, specifier_ex))
	{
		SendUsageMessage(playerid, "/boombox [eylem]");
		SendClientMessage(playerid, COLOR_ADM, "[Eylem] koy, duzenle, yoket, al, ver");
		SendClientMessage(playerid, COLOR_ADM, "** /istasyon komutunu kullanarak kanal ayarlayabilirsin. **");
		return 1;
	}

	if (!PlayerData[playerid][pHasBoombox]) return SendErrorMessage(playerid, "Boombox'un yok.");

	if (!strcmp(specifier, "koy"))
	{
		if (Boombox_Placed(playerid) != -1) return SendErrorMessage(playerid, "Zaten bir boombox koymu�sun.");
		if (Boombox_Nearest(playerid) != -1) return SendErrorMessage(playerid, "Yak�nlar�nda bir yere boombox koyulmu�.");

		Boombox_Create(playerid);
		return 1;
	}
	else if (!strcmp(specifier, "duzenle"))
	{
		static id = -1;
		if((id = Boombox_Nearest(playerid, 4.0)) == -1) return SendErrorMessage(playerid, "Yak�n�nda boombox yok.");
		if (BoomboxData[id][BoomboxOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu boombox senin de�il.");

		EditingID[playerid] = id;
		EditingObject[playerid] = 14;
		EditDynamicObject(playerid, BoomboxData[id][BoomboxObject]);
		return 1;
	}
	else if (!strcmp(specifier, "yoket"))
	{
		static id = -1;
		if((id = Boombox_Nearest(playerid, 4.0)) == -1) return SendErrorMessage(playerid, "Yak�n�nda boombox yok.");
		if (BoomboxData[id][BoomboxOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu boombox senin de�il.");
		SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: Boombox'unu yokettin.");
		foreach (new i : Player) if(Boombox_Nearest(i, 10.0) != -1) StopAudioStreamForPlayer(i);
		PlayerData[playerid][pHasBoombox] = false;
		Boombox_Delete(id);
		return 1;
	}
	else if (!strcmp(specifier, "al"))
	{
		static id = -1;
		if((id = Boombox_Nearest(playerid, 4.0)) == -1) return SendErrorMessage(playerid, "Yak�n�nda boombox yok.");
		if (BoomboxData[id][BoomboxOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu boombox senin de�il.");
		SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: Boombox'unu kald�rd�n, tekrar yerle�tirmek i�in /boombox koy yazabilirsin.");
		foreach (new i : Player) if(Boombox_Nearest(i, 10.0) != -1) StopAudioStreamForPlayer(i);
		Boombox_Delete(id);
		return 1;
	}
	else if (!strcmp(specifier, "ver"))
	{
		static id = -1, playerb;
		if((id = Boombox_Nearest(playerid, 4.0)) == -1) return SendErrorMessage(playerid, "Yak�n�nda boombox yok.");
		if (BoomboxData[id][BoomboxOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu boombox senin de�il.");
		if (sscanf(specifier_ex, "u", playerb)) return SendUsageMessage(playerid, "/boombox ver [oyuncu ID/isim]");
		if(!IsPlayerConnected(playerb)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
		if(!pLoggedIn[playerb]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
		if(!GetDistanceBetweenPlayers(playerid, playerb, 4.5)) return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
		if (PlayerData[playerb][pHasBoombox]) return SendErrorMessage(playerid, "Belirtti�in ki�inin zaten boombox� var.");
		SendClientMessageEx(playerid, COLOR_DARKGREEN, "SERVER: %s adl� ki�iye Boombox verdin.", ReturnName(playerb, 0));
		SendClientMessageEx(playerb, COLOR_DARKGREEN, "SERVER: %s sana Boombox'unu verdi.", ReturnName(playerid, 0));
		BoomboxData[id][BoomboxOwnerID] = PlayerData[playerb][pSQLID];
		PlayerData[playerid][pHasBoombox] = false;
		return 1;
	}
	else SendClientMessage(playerid, COLOR_ADM, "SERVER: Hatal� parametre girdiniz.");
	return 1;
}

CMD:fixr(playerid, params[]) return StopAudioStreamForPlayer(playerid);

CMD:istasyon(playerid, params[])
{
	if (!strcmp(params, "kapat"))
	{
		new id = -1;
		if((id = Boombox_Nearest(playerid, 4.0)) != -1)
		{
			if(BoomboxData[id][BoomboxOwnerID] != PlayerData[playerid][pSQLID] && !PlayerData[playerid][pAdmin]) return SendErrorMessage(playerid, "Bu boomboxa eri�imin yok.");
			if(!BoomboxData[id][BoomboxStatus]) return SendServerMessage(playerid, "Zaten bu boombox �al��m�yor.");

			foreach (new i : Player) if(Boombox_Nearest(i, 10.0) == id)
			{
				SendClientMessage(i, COLOR_DARKGREEN, "SERVER: Boombox durduruldu.");
				StopAudioStreamForPlayer(i);
			}

			BoomboxData[id][BoomboxStatus] = false;
			return 1;
		}

		if(IsPlayerInAnyVehicle(playerid))
		{
			if(GetPlayerVehicleSeat(playerid) > 1) return SendErrorMessage(playerid, "�n tarafta oturan ki�iler radyoyu ayarlayabilir.");

			new vehicleid = GetPlayerVehicleID(playerid);
			if(!CarData[vehicleid][carXMR]) return SendServerMessage(playerid, "Bu arac�n XM radyosu yok.");
			if(!CarData[vehicleid][carXMROn]) return SendServerMessage(playerid, "Zaten bu ara�ta XMR radyosu �al��m�yor.");

			foreach (new i : Player) if(IsPlayerInVehicle(i, vehicleid))
			{
				SendClientMessage(i, COLOR_DARKGREEN, "SERVER: Radyo durduruldu.");
				StopAudioStreamForPlayer(i);
			}

			CarData[vehicleid][carXMROn] = false;
			return 1;
		}

		if((id = IsPlayerInProperty(playerid)) != -1)
		{
			if(IsPlayerInRangeOfPoint(playerid, 3.0, PropertyData[id][PropertyXMR][0], PropertyData[id][PropertyXMR][1], PropertyData[id][PropertyXMR][2]))
			{
				if(PropertyData[id][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendServerMessage(playerid, "Bu eve sahip de�ilsin.");
				if(!PropertyData[id][PropertyXMROn]) return SendServerMessage(playerid, "Bu radyo zaten �al��m�yor.");

				foreach (new i : Player) if (IsPlayerInProperty(i) == id)
				{
					SendClientMessage(i, COLOR_DARKGREEN, "SERVER: Radyo durduruldu.");
					StopAudioStreamForPlayer(i);
				}

				PropertyData[id][PropertyXMROn] = false;
				return 1;
			}
		}

		if((id = IsPlayerInBusiness(playerid)) != -1)
		{
			if(BusinessData[id][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");
			if(!BusinessData[id][BusinessXMROn]) return SendServerMessage(playerid, "Bu radyo zaten �al��m�yor.");

			foreach(new i : Player) if(IsPlayerInBusiness(i) == id)
			{
				SendClientMessage(i, COLOR_DARKGREEN, "SERVER: Radyo durduruldu.");
				StopAudioStreamForPlayer(i);
			}

			BusinessData[id][BusinessXMROn] = false;
			return 1;
		}

		SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: Radyoya yak�n de�ilsin.");
		return 1;
	}
	else
	{
		new id = -1, near_anything = 0;
		if((id = Boombox_Nearest(playerid, 4.0)) != -1)
		{
			if(BoomboxData[id][BoomboxOwnerID] != PlayerData[playerid][pSQLID] && !PlayerData[playerid][pAdmin])
				return SendErrorMessage(playerid, "Bu boomboxa eri�imin yok.");

			near_anything++;
		}

		if(IsPlayerInAnyVehicle(playerid))
		{
			if(GetPlayerVehicleSeat(playerid) > 1) return SendErrorMessage(playerid, "�n tarafta oturan ki�iler radyoyu ayarlayabilir.");
			if(!CarData[GetPlayerVehicleID(playerid)][carXMR]) return SendServerMessage(playerid, "Bu arac�n XM radyosu yok.");

			near_anything++;
		}

		if((id = IsPlayerInProperty(playerid)) != -1)
		{
			if(IsPlayerInRangeOfPoint(playerid, 3.0, PropertyData[id][PropertyXMR][0], PropertyData[id][PropertyXMR][1], PropertyData[id][PropertyXMR][2]))
			{
				if(PropertyData[id][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu eve sahip de�ilsin.");
				if(!PropertyData[id][PropertyHasXMR]) return SendErrorMessage(playerid, "Bu evin XM radyosu yok.");
				near_anything++;
			}
		}

		if((id = IsPlayerInBusiness(playerid)) != -1)
		{
			if(BusinessData[id][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");
			if(!BusinessData[id][BusinessHasXMR]) return SendServerMessage(playerid, "Bu i�yerinin XM radyosu yok.");
			near_anything++;
		}

		if(!near_anything) return SendErrorMessage(playerid, "Herhangi bir radyoya yak�n de�ilsin.");

		if(sscanf(params, "i", id))
		{
			ShowXMRDialog(playerid);
			return 1;
		}

		if(!XMRData[id][xmrID]) return SendErrorMessage(playerid, "Ge�ersiz istasyon ID belirttin.");
        cmd_ame(playerid, sprintf("radyo �zerinde %s kanal�n� a�ar.", XMRData[id][xmrName]));

 		new idx = -1;
		if((idx = Boombox_Nearest(playerid, 4.0)) != -1)
		{
			foreach (new i : Player) if(Boombox_Nearest(i, 25.0) == idx)
			{
				SendClientMessageEx(i, COLOR_ADM, "SERVER: Radyo istasyonu %s olarak de�i�tirildi.", XMRData[id][xmrName]);
				PlayAudioStreamForPlayer(i, XMRData[id][xmrStationURL], BoomboxData[idx][BoomboxLocation][0], BoomboxData[idx][BoomboxLocation][1], BoomboxData[idx][BoomboxLocation][2], 25.0, 1);
			}

			format(BoomboxData[idx][BoomboxURL], 128, "%s", XMRData[id][xmrStationURL]);
			BoomboxData[idx][BoomboxStatus] = true;
			return 1;
		}

		if((idx = IsPlayerInProperty(playerid)) != -1)
		{
			foreach(new i : Player) if(IsPlayerInProperty(i) == idx)
			{
				SendClientMessageEx(i, COLOR_ADM, "SERVER: Radyo istasyonu %s olarak de�i�tirildi.", XMRData[id][xmrName]);
				PlayAudioStreamForPlayer(i, XMRData[id][xmrStationURL]);
			}

			format(PropertyData[idx][PropertyXMRUrl], 128, "%s", XMRData[id][xmrStationURL]);
			PropertyData[idx][PropertyXMROn] = true;
			return 1;
		}

		if((idx = IsPlayerInBusiness(playerid)) != -1)
		{
			foreach(new i : Player) if(IsPlayerInBusiness(i) == id)
			{
				SendClientMessageEx(i, COLOR_ADM, "SERVER: Radyo istasyonu %s olarak de�i�tirildi.", XMRData[id][xmrName]);
				PlayAudioStreamForPlayer(i, XMRData[id][xmrStationURL]);
			}

			format(BusinessData[idx][BusinessXMRUrl], 128, "%s", XMRData[SubXMRHolder[playerid]][xmrStationURL]);
			BusinessData[idx][BusinessXMROn] = true;
			return 1;
		}

		if(IsPlayerInAnyVehicle(playerid))
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			foreach(new i : Player) if(IsPlayerInVehicle(i, vehicleid))
			{
				SendClientMessageEx(i, COLOR_ADM, "SERVER: Radyo istasyonu %s olarak de�i�tirildi.", XMRData[id][xmrName]);
				PlayAudioStreamForPlayer(i, XMRData[id][xmrStationURL]);
			}

			format(CarData[vehicleid][carXMRUrl], 128, "%s", XMRData[id][xmrStationURL]);
			CarData[vehicleid][carXMROn] = true;
			return 1;
		}
	}
	return 1;
}

CMD:birlikler(playerid, params[])
{
	Faction_List(playerid);
	return 1;
}

CMD:faktif(playerid, params[])
{
	new Factionid;
	if(sscanf(params, "I(-1)", Factionid)) return SendUsageMessage(playerid, "/faktif [birlik ID]");

	if(Factionid == -1)
	{
		if(PlayerData[playerid][pFaction] == -1) return SendServerMessage(playerid, "Herhangi bir birlikte de�ilsin.");

		SendClientMessageEx(playerid, COLOR_GREY, "SERVER: %s birli�inin aktif listesi:", FactionData[PlayerData[playerid][pFaction]][FactionName]);

		foreach(new i : Player)
		{
			if(PlayerData[i][pFaction] == PlayerData[playerid][pFaction])
			{
				if(PlayerData[i][pLAWduty]) SendClientMessageEx(playerid, COLOR_GREY, "(ID: %d) %s%s %s", i, PlayerData[i][pAdminDuty] ? ("{FF9900}") : ("{8D8DFF}"), Player_GetFactionRank(i), ReturnName(i, 1));
				else SendClientMessageEx(playerid, COLOR_GREY, "(ID: %d) %s%s %s", i, PlayerData[i][pAdminDuty] ? ("{FF9900}") : (""), Player_GetFactionRank(i), ReturnName(i, 1));
			}
		}
	}
	else
	{
		if(!Iter_Contains(Factions, Factionid)) return SendErrorMessage(playerid, "Hatal� birlik ID girdin.");
		SendClientMessageEx(playerid, COLOR_ADM, "[!] %s {FFFFFF}birli�inde {FF6347}%d{FFFFFF} kay�tl� ki�iden {FF6347}%d{FFFFFF} ki�i aktif g�r�n�yor.", FactionData[Factionid][FactionName], CountFactionMembers(Factionid), CountOnlineMembers(Factionid));
	}
	return 1;
}

CMD:fspawn(playerid, params[])
{
	if(PlayerData[playerid][pFaction] == -1) return SendErrorMessage(playerid, "Herhangi bir birlikte de�ilsin.");
	if(PlayerData[playerid][pFactionRank] > FactionData[PlayerData[playerid][pFaction]][FactionEditrank])
		return SendErrorMessage(playerid, "Birlik spawn noktas�n� ayarlamak i�in r�tben yetersiz.");

	new factionid = PlayerData[playerid][pFaction];
	SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Birli�inin spawn noktas�n� �uanki konumun olarak ayarlad�n.");
	GetPlayerPos(playerid, FactionData[factionid][FactionSpawn][0], FactionData[factionid][FactionSpawn][1], FactionData[factionid][FactionSpawn][2]);
	GetPlayerFacingAngle(playerid, FactionData[factionid][FactionSpawn][3]);
	FactionData[factionid][FactionSpawnInterior] = GetPlayerInterior(playerid);
	FactionData[factionid][FactionSpawnVW] = GetPlayerVirtualWorld(playerid);
	Faction_Save(factionid);
	return 1;
}

CMD:fpspawn(playerid, params[])
{
 	if(PlayerData[playerid][pFaction] == -1) return SendServerMessage(playerid, "Herhangi bir birlikte de�ilsin.");
	if(PlayerData[playerid][pFactionRank] > FactionData[PlayerData[playerid][pFaction]][FactionEditrank])
		return SendClientMessage(playerid, COLOR_ADM, "HATA: R�tben d�zenleme i�in yetersiz.");

	new id, Factionid = PlayerData[playerid][pFaction];
	if(sscanf(params, "i", id)) return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /fpspawn [1/2/3]");
	switch(id)
	{
		case 1:
		{
			SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Birli�inin birinci spawn noktas�n� ayarlad�n.");
			GetPlayerPos(playerid, FactionData[Factionid][FactionSpawnEx1][0], FactionData[Factionid][FactionSpawnEx1][1], FactionData[Factionid][FactionSpawnEx1][2]);
			FactionData[Factionid][FactionSpawnEx1Interior] = GetPlayerInterior(playerid);
			FactionData[Factionid][FactionSpawnEx1VW] = GetPlayerVirtualWorld(playerid);
			Faction_Save(Factionid);
		}
		case 2:
		{
			SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Birli�inin ikinci spawn noktas�n� ayarlad�n.");
			GetPlayerPos(playerid, FactionData[Factionid][FactionSpawnEx2][0], FactionData[Factionid][FactionSpawnEx2][1], FactionData[Factionid][FactionSpawnEx2][2]);
			FactionData[Factionid][FactionSpawnEx2Interior] = GetPlayerInterior(playerid);
			FactionData[Factionid][FactionSpawnEx2VW] = GetPlayerVirtualWorld(playerid);
			Faction_Save(Factionid);
		}
		case 3:
		{
			SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Birli�inin ���nc� spawn noktas�n� ayarlad�n.");
			GetPlayerPos(playerid, FactionData[Factionid][FactionSpawnEx3][0], FactionData[Factionid][FactionSpawnEx3][1], FactionData[Factionid][FactionSpawnEx3][2]);
			FactionData[Factionid][FactionSpawnEx3Interior] = GetPlayerInterior(playerid);
			FactionData[Factionid][FactionSpawnEx3VW] = GetPlayerVirtualWorld(playerid);
			Faction_Save(Factionid);
		}
		default: SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /setpspawn [1/2/3]");
	}
	return 1;
}

CMD:fpark(playerid, params[])
{
	if(PlayerData[playerid][pFactionRank] > FactionData[PlayerData[playerid][pFaction]][FactionTowrank] && !PlayerData[playerid][pAdminDuty])
		return SendServerMessage(playerid, "R�tben bu komut i�in yetersiz.");

	new
		bool: vehicle_found = false,
		Factionid;

	if(PlayerData[playerid][pAdminDuty])
	{
		if(sscanf(params, "i", Factionid)) return SendUsageMessage(playerid, "/fpark [birlik ID]");
		if(!Iter_Contains(Factions, Factionid)) return SendErrorMessage(playerid, "Hatal� birlik ID girdin.");

		for(new f = 1, j = GetVehiclePoolSize(); f <= j; f++)
		{
			if(CarData[f][carFaction] == Factionid)
			{
				if(!IsVehicleOccupied(f))
				{
					vehicle_found = true;
					SetVehicleToRespawn(f);
				}
			}
		}

		if(vehicle_found)
		{
			SendFactionMessageEx(playerid, COLOR_ADM, sprintf("<< Y�netici %s b�t�n birlik ara�lar� eski pozisyonlar�na getirdi. >>", ReturnName(playerid, 1)));
		}
		else SendServerMessage(playerid, "Respawn edilebilecek birlik arac� bulunamad�.");
		return 1;
	}

	for(new i = 1, j = GetVehiclePoolSize(); i <= j; i++)
	{
		if(CarData[i][carFaction] == PlayerData[playerid][pFaction])
		{
			if(!IsVehicleOccupied(i))
			{
				vehicle_found = true;
				SetVehicleToRespawn(i);
			}
		}
	}

	if(vehicle_found)
	{
		SendFactionMessageEx(playerid, COLOR_ADM, sprintf("<< %s b�t�n birlik ara�lar� eski pozisyonlar�na getirdi. >>", ReturnName(playerid, 1)));
	}
	else SendServerMessage(playerid, "Respawn edilebilecek birlik arac� bulunamad�.");
	return 1;
}

CMD:fuyeler(playerid, params[])
{
	if(PlayerData[playerid][pFaction] == -1) return SendServerMessage(playerid, "Herhangi bir birlikte de�ilsin.");
	Faction_Member_List(playerid);
	return 1;
}

CMD:fkasa(playerid, params[])
{
	if(!IsLAWFaction(playerid)) return UnAuthMessage(playerid);
	if(PlayerData[playerid][pFactionRank] > FactionData[PlayerData[playerid][pFaction]][FactionEditrank])
		return SendErrorMessage(playerid, "R�tben bu komut i�in yetersiz.");

	new specifier[60], method[30];

	if(sscanf(params, "s[60]S()[30]", specifier, method))
		return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /fkasa [parakoy/paracek/bakiye]");

	if(!strcmp(specifier, "parakoy"))
	{
		new
			quantity;

		if(sscanf(method, "i", quantity)) return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /fkasa parakoy [miktar]");
		if(quantity < 1 || quantity > PlayerData[playerid][pMoney]) return SendClientMessage(playerid, COLOR_ADM, "HATA: Bu kadar paran yok.");

		GiveMoney(playerid, -quantity);
		FactionData[PlayerData[playerid][pFaction]][FactionBank]+= quantity;

		SendClientMessageEx(playerid, COLOR_ACTION, "Birli�inin kasas�na $%s koydun! (%s)", MoneyFormat(quantity), Faction_GetName(PlayerData[playerid][pFaction]), GetFullTime(Time()));
	}
	else if(!strcmp(specifier, "paracek"))
	{
		new
			quantity;

		if(PlayerData[playerid][pFactionRank] != 1) return SendClientMessage(playerid, COLOR_ADM, "HATA: Sadece 1. r�tbe para �ekebilir.");

		if(sscanf(method, "i", quantity)) return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /fkasa paracek [de�er]");
		if(quantity < 1 || quantity > FactionData[PlayerData[playerid][pFaction]][FactionBank])
			return SendClientMessage(playerid, COLOR_ADM, "HATA: Kasada bu kadar para yok.");

		GiveMoney(playerid, quantity);
		FactionData[PlayerData[playerid][pFaction]][FactionBank]-= quantity;

		SendClientMessageEx(playerid, COLOR_ACTION, "Birli�inin kasas�ndan $%s �ektin. Birlik: %s - (%s)", MoneyFormat(quantity), Faction_GetName(PlayerData[playerid][pFaction]), GetFullTime(Time()));
	}
	else if(!strcmp(specifier, "bakiye"))
		return SendClientMessageEx(playerid, COLOR_ACTION, "%s birli�inin kasas�: $%s (%s)", Faction_GetName(PlayerData[playerid][pFaction]), MoneyFormat(FactionData[PlayerData[playerid][pFaction]][FactionBank]), GetFullTime(Time()));

	else return SendClientMessage(playerid, COLOR_ADM, "SERVER: Hatal� parametre girdin.");
	return 1;
}

//Faction configure
CMD:birlikpanel(playerid, params[])
{
	if(PlayerData[playerid][pFaction] == -1) return SendClientMessage(playerid, COLOR_ADM, "HATA: Birlikte de�ilsin.");
	if(PlayerData[playerid][pFactionRank] < FactionData[PlayerData[playerid][pFaction]][FactionEditrank]) return SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�:{FFFFFF} R�tben bu komut i�in yetersiz.");

	ShowYourFactionMenu(playerid);
	return 1;
}


CMD:apb(playerid, params[])
{
	if(!IsPoliceFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty]) return SendServerMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");

	APB_RouteCommands(playerid, params);
	return 1;
}

CMD:uyustest(playerid, params[])
{
	if(!IsPoliceFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty]) return SendServerMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");

	new id;
	if(sscanf(params, "u", id)) return SendUsageMessage(playerid, "/uyustest [oyuncu ID/isim]");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
	if(!GetDistanceBetweenPlayers(playerid, id, 4.5)) return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
	SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s sobriety test cihaz�n� %s �zerinde kullan�r.", ReturnName(playerid, 0), ReturnName(id, 0));
	Drug_ReturnData(playerid, id);
	return 1;
}

CMD:faksesuar(playerid, params[])
{
	if(!IsLAWFaction(playerid))
		return UnAuthMessage(playerid);

	if(PlayerData[playerid][pInsideEntrance] == -1)
		return SendErrorMessage(playerid, "Bu birlik komutunu kullanmak i�in birli�inize ait bir bina i�erisinde olmal�s�n�z.");

	if(PlayerData[playerid][pFaction] != EntranceData[PlayerData[playerid][pInsideEntrance]][EntranceFaction])
		return SendErrorMessage(playerid, "Bu bina senin birli�ine ait de�il.");

	Attachment_List(playerid);
	return 1;
}

CMD:engel(playerid, params[])
{
	if(!IsLAWFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty] && !PlayerData[playerid][pMEDduty]) return SendErrorMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");

	Roadblock_RouteCommands(playerid, params);
	return 1;
}

CMD:rozet(playerid, params[])
{
	if(!IsLAWFaction(playerid)) return UnAuthMessage(playerid);

	new playerb;
	if (sscanf(params, "u", playerb)) return SendUsageMessage(playerid, "/rozet [oyuncu ID/isim]");
	if(!IsPlayerConnected(playerb)) return SendServerMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
	if(!pLoggedIn[playerb]) return SendServerMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
	if(!GetDistanceBetweenPlayers(playerid, playerb, 4.5)) return SendServerMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");

	if (playerb == playerid)
 		SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s kendi rozetine bak�n�r.", ReturnName(playerid, 0));
	else
		SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s, %s adl� ki�iye rozetini g�sterir.", ReturnName(playerid, 0), ReturnName(playerb, 0));

	SendClientMessage(playerb, COLOR_COP, "______________________________________");
	SendClientMessageEx(playerb, COLOR_GRAD2, "  �sim: %s", ReturnNameLetter(playerid));
	SendClientMessageEx(playerb, COLOR_GRAD2, "  R�tbe: %s", Player_GetFactionRank(playerid));
	SendClientMessageEx(playerb, COLOR_GRAD2, "  Birlik: %s", Faction_GetName(PlayerData[playerid][pFaction]));
	SendClientMessageEx(playerb, COLOR_GRAD2, "  Rozet Numaras�: #%i", ReturnBadgeNumber(playerid));
	SendClientMessage(playerb, COLOR_COP, "______________________________________");
	return 1;
}

CMD:cctvcik(playerid, params[])
{
	if(!IsPoliceFaction(playerid))
		return UnAuthMessage(playerid);

	if(!PlayerData[playerid][pLAWduty])
		return SendServerMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman�z gerekiyor.");

	if(CCTVID[playerid] == -1)
		return SendErrorMessage(playerid, "Bu komutu CCTV bilgisayar�ndayken kullanabilirsin.");

	Camera_Quit(playerid);
	TogglePlayerControllable(playerid, 0);
	SetTimerEx("unfreeze_player", 1200, false, "d", playerid);
	return 1;
}

Camera_Quit(playerid)
{
	DestroyPlayerObject(playerid, cctvPlayerObject[playerid]);
	TogglePlayerSpectating(playerid, 0);
  return 1;
}

CMD:cctv(playerid, params[])
{
	if(!IsPoliceFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty]) return SendServerMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");

	if(CCTVID[playerid] == -1)
	{
			if(PlayerData[playerid][pInsideEntrance] == -1)
				return SendErrorMessage(playerid, "Bu birlik komutunu kullanmak i�in birli�inize ait bir bina i�erisinde olmal�s�n�z.");

			if(PlayerData[playerid][pFaction] != EntranceData[PlayerData[playerid][pInsideEntrance]][EntranceFaction])
				return SendErrorMessage(playerid, "Bu bina senin birli�ine ait de�il.");

			Camera_List(playerid);
			return 1;
		}

	Camera_List(playerid);
	return 1;
}

CMD:siren(playerid, params[])
{
	if(!IsLAWFaction(playerid)) return UnAuthMessage(playerid);
	if(!IsPlayerInAnyVehicle(playerid)) return SendErrorMessage(playerid, "Herhangi bir ara� i�erisinde de�ilsin.");

	new vehicleid = GetPlayerVehicleID(playerid);
	if(CarData[vehicleid][carFaction] == -1) return SendErrorMessage(playerid, "Herhangi bir birlik arac� i�erisinde de�ilsin.");

	if(CarData[vehicleid][carSirenOn])
	{
	    CarData[vehicleid][carSirenOn] = false;
		DestroyDynamicObject(CarData[vehicleid][carSirenObject]);
		cmd_ame(playerid, "ara�tan ta��nabilir sireni s�ker.");
	}
	else {
		static
    		Float:fSize[3],
    		Float:fSeat[3];

	    GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_SIZE, fSize[0], fSize[1], fSize[2]);
		GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_FRONTSEAT, fSeat[0], fSeat[1], fSeat[2]);

        CarData[vehicleid][carSirenOn] = true;
		CarData[vehicleid][carSirenObject] = CreateDynamicObject(18646, 0.0, 0.0, 1000.0, 0.0, 0.0, 0.0);
	    AttachDynamicObjectToVehicle(CarData[vehicleid][carSirenObject], vehicleid, -fSeat[0], fSeat[1], fSize[2] / 2.0, 0.0, 0.0, 0.0);
		cmd_ame(playerid, "araca ta��nabilir siren ba�lar.");
	}
	return 1;
}

CMD:pfver(playerid, params[])
{
	if(!IsPoliceFaction(playerid))
		return SendErrorMessage(playerid, "Bu komutu sadece PD kullanabilir.");

	if(!PlayerData[playerid][pLAWduty])
		return SendErrorMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");

	new playerb;
	if(sscanf(params, "u", playerb))
		return SendUsageMessage(playerid, "/pfver [oyuncu ID/isim]");

	if(!IsPlayerConnected(playerb))
		return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
	if(!pLoggedIn[playerb])
		return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
	if(!GetDistanceBetweenPlayers(playerid, playerb, 4.5))
		return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
	if(PlayerData[playerb][pWeaponsLicense])
		return SendErrorMessage(playerid, "Belirtti�iniz ki�inin silah lisans� bulunuyor.");

	PlayerData[playerb][pWeaponsLicense] = true;
	SendClientMessageEx(playerb, COLOR_YELLOW, "-> %s %s sana silah lisans� verdi.", Player_GetFactionRank(playerid), ReturnName(playerid, 1));
	SendLawMessage(COLOR_COP, sprintf("** HQ Duyurusu: %s %s, %s adl� ki�iye silah lisans� verdi! **", Player_GetFactionRank(playerid), ReturnName(playerid, 1), ReturnName(playerb, 1)));
	adminWarn(4, sprintf("%s, %s adl� ki�iye PF lisans� verdi.", ReturnName(playerid, 1), ReturnName(playerb, 1)));
	return true;
}

CMD:mdver(playerid, params[])
{
	if(!IsMedicFaction(playerid))
		return SendErrorMessage(playerid, "Bu komutu sadece FD kullanabilir.");

	if(!PlayerData[playerid][pMEDduty])
		return SendErrorMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");

	new playerb;
	if(sscanf(params, "u", playerb))
		return SendUsageMessage(playerid, "/mdver [oyuncu ID/isim]");

	if(!IsPlayerConnected(playerb))
		return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
	if(!pLoggedIn[playerb])
		return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
	if(!GetDistanceBetweenPlayers(playerid, playerb, 4.5))
		return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
	if(PlayerData[playerb][pMedicalLicense])
		return SendErrorMessage(playerid, "Belirtti�iniz ki�inin medikal lisans� bulunuyor.");

	PlayerData[playerb][pMedicalLicense] = true;
	SendClientMessageEx(playerb, COLOR_YELLOW, "-> %s %s sana medikal lisans� verdi.", Player_GetFactionRank(playerid), ReturnName(playerid, 1));
	SendLawMessage(COLOR_EMT, sprintf("** HQ Duyurusu: %s %s, %s adl� ki�iye medikal lisans� verdi! **", Player_GetFactionRank(playerid), ReturnName(playerid, 1), ReturnName(playerb, 1)));
	return true;
}

CMD:cezakes(playerid, params[])
{
	if(!IsPoliceFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty]) return SendServerMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");

	static playerb, amount, reason[128];

	if(sscanf(params, "uds[128]", playerb, amount, reason)) return SendUsageMessage(playerid, "/cezakes [oyuncu ID/isim] [miktar] [sebep]");
	//if(playerb == playerid) return SendServerMessage(playerid, "Bu komutu kendi �zerinde kullanamazs�n.");
	if(!IsPlayerConnected(playerb)) return SendServerMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
	if(!pLoggedIn[playerb]) return SendServerMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
	if(!GetDistanceBetweenPlayers(playerid, playerb, 4.5)) return SendServerMessage(playerid, "Belirtti�iniz ki�iye yak�n de�ilsin.");
	if(strlen(reason) < 3) return SendServerMessage(playerid, "Ge�erli bir sebep giriniz.");
	if(amount < 1 || amount > 99999) return SendServerMessage(playerid, "Ge�erli bir miktar giriniz.");

	static id = -1;
	for (new i = 0; i < MAX_FINES; i++)
	{
		if(Fines[playerb][i][fine_id]) continue;

		id = i;
		break;
	}

	if(id == -1) return SendErrorMessage(playerid, "Belirtti�in ki�inin �ok fazla �denmemi� cezas� bulunuyor.");

	new query[256];
	mysql_format(m_Handle, query, sizeof(query), "INSERT INTO player_fines (player_dbid, issuer_name, fine_amount, fine_Faction, fine_reason, fine_date) VALUES(%i, '%e', %i, %i, '%e', %i)", PlayerData[playerb][pSQLID], ReturnName(playerid, 1), amount, PlayerData[playerid][pFaction], reason, Time());
	new Cache:cache = mysql_query(m_Handle, query);

	Fines[playerb][id][fine_id] = cache_insert_id();
	Fines[playerb][id][fine_amount] = amount;
	format(Fines[playerb][id][fine_issuer], 24, "%s", ReturnName(playerid, 1));
	format(Fines[playerb][id][fine_reason], 128, "%s", reason);
	Fines[playerb][id][fine_faction] = PlayerData[playerid][pFaction];
	Fines[playerb][id][fine_date] = Time();
	cache_delete(cache);

	TotalFines++;
	cmd_me(playerid, sprintf("%s adl� ki�iye %s sebebinden $%s de�erinde ceza keser.", ReturnName(playerb, 0), reason, MoneyFormat(amount)));
	SendClientMessage(playerb, COLOR_ADM, sprintf("[!] %s taraf�ndan sana ceza kesildi. Sebep: %s", ReturnName(playerid, 0), MoneyFormat(amount)));

	new fines_message[256];
	format(fines_message, sizeof(fines_message), "%s %s, %s adl� ki�iye %s sebebiyle $%s miktar�nda ceza kesti.   -   [%s]", Player_GetFactionRank(playerid), ReturnName(playerid, 0),  ReturnName(playerb), reason, MoneyFormat(amount), GetFullTime(Time()));
	DCC_SendChannelMessage(fines_channel, FixDiscordWord(fines_message));
	return 1;
}

CMD:acezakes(playerid, params[])
{
	if(!IsPoliceFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty]) return SendServerMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");

	static targetid, amount, reason[128];
	if(sscanf(params, "iis[128]", targetid, amount, reason)) return SendUsageMessage(playerid, "/acezakes [ara� ID] [miktar] [sebep] (ara� ID g�rebilmek i�in /dl)");
	if(!IsValidVehicle(targetid)) return SendErrorMessage(playerid, "Belirtti�iniz ara� oyunda yok.");

	new
		Float:x,
		Float:y,
		Float:z;

	GetVehiclePos(targetid, x, y, z);
	if(!IsPlayerInRangeOfPoint(playerid, 6.0, x, y, z)) return SendErrorMessage(playerid, "Belirtti�in arac�n yak�n�nda de�ilsin.");
	if(!IsValidPlayerCar(targetid)) return SendErrorMessage(playerid, "Belirtti�in araca ceza kesemezsin.");
	if(strlen(reason) < 3) return SendErrorMessage(playerid, "Ge�erli bir sebep giriniz.");
	if(amount < 1) return SendErrorMessage(playerid, "Ge�erli bir miktar giriniz.");

	new id = -1;
	for(new i = 0; i < 30; i++)
	{
		if(VehicleFines[targetid][i][fine_id]) continue;

		id = i;
		break;
	}

	if(id == -1) return SendErrorMessage(playerid, "Belirtti�in arac�n �ok fazla fazla cezas� bulunuyor.");

	new query[256];
	mysql_format(m_Handle, query, sizeof(query), "INSERT INTO vehicle_fines (vehicle_dbid, vehicle_x, vehicle_y, vehicle_z, issuer_name, fine_amount, fine_Faction, fine_reason, fine_date) VALUES(%i, %f, %f, %f, '%e', %i, %i, '%e', %i)", CarData[targetid][carID], x, y, z, ReturnName(playerid), amount, PlayerData[playerid][pFaction], reason, Time());
	new Cache:cache = mysql_query(m_Handle, query);

	VehicleFines[targetid][id][fine_id] = cache_insert_id();
	VehicleFines[targetid][id][fine_amount] = amount;
	VehicleFines[targetid][id][fine_x] = x;
	VehicleFines[targetid][id][fine_y] = y;
	VehicleFines[targetid][id][fine_z] = z;
	format(VehicleFines[targetid][id][fine_issuer], 24, "%s", ReturnName(playerid, 1));
	format(VehicleFines[targetid][id][fine_reason], 128, "%s", reason);
	VehicleFines[targetid][id][fine_faction] = PlayerData[playerid][pFaction];
	VehicleFines[targetid][id][fine_date] = Time();

	cache_delete(cache);
	cmd_me(playerid, sprintf("%s model araca %s sebebinden $%s de�erinde ceza keser.", ReturnVehicleName(targetid), reason, MoneyFormat(amount)));
	return 1;
}

CMD:hapis(playerid, params[])
{
	if(!IsPoliceFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty]) return SendErrorMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");

	if(PlayerData[playerid][pInsideEntrance] == -1)
		return SendErrorMessage(playerid, "Bu birlik komutunu kullanmak i�in birli�inize ait bir bina i�erisinde olmal�s�n�z.");

	if(PlayerData[playerid][pFaction] != EntranceData[PlayerData[playerid][pInsideEntrance]][EntranceFaction])
		return SendErrorMessage(playerid, "Bu bina senin birli�ine ait de�il.");

	static playerb, time;
	if(sscanf(params, "ui", playerb, time)) return SendUsageMessage(playerid, "/hapis [oyuncu ID/isim] [s�re]");
	//if(playerb == playerid) return SendServerMessage(playerid, "Bu komutu kendi �zerinde kullanamazs�n.");
	if(!IsPlayerConnected(playerb)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
	if(!pLoggedIn[playerb]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
	if(!GetDistanceBetweenPlayers(playerid, playerb, 5.0)) return SendErrorMessage(playerid, "Belirtti�iniz ki�iye yak�n de�ilsin.");
	if(PlayerData[playerb][pICJailed]) return SendErrorMessage(playerid, "Bu ki�i zaten hapiste at�lm��.");

	PlayerData[playerb][pPhoneOff] = true;
	PlayerData[playerb][pICJailTime] = time * 60;
	PlayerData[playerb][pICJailed] = 1;

	if(PlayerData[playerb][pActiveListing]) PlayerData[playerb][pActiveListing] = 0;

	PlayerData[playerb][pJailTimes]++;

	new jail_str[90];

	TotalJailees++;
	format(jail_str, 90, "A%03d", TotalJailees);
	PlayerData[playerb][pICJail3D] = CreateDynamic3DTextLabel(jail_str, COLOR_LGREEN, 0.0, 0.0, -0.10, 20.0, playerb);

	SendLawMessage(COLOR_ADM, sprintf("[Hapis] %s %s, %s isimli ki�iyi hapise g�nderdi.", Player_GetFactionRank(playerid), ReturnName(playerid), ReturnName(playerb)));
	SendClientMessageEx(playerb, COLOR_ADM, "[ ! ] Uyar�: Hapise girdi�in i�in telefonun otomatik olarak kapat�ld�. Hapisten ��k�nca telefonunu a�may� unutma.", ReturnName(playerid), time);

	new jail_msg[256];
	format(jail_msg, sizeof(jail_msg), "%s %s, %s adl� ki�iyi %d dakika hapise g�nderdi.   -   [%s]", Player_GetFactionRank(playerid), ReturnName(playerid, 0), ReturnName(playerb), time, GetFullTime(Time()));
	DCC_SendChannelMessage(jail_channel, FixDiscordWord(jail_msg));

	// color_green ile atana hangi cell yazd��� gelcek
	Player_Save(playerb);
	return 1;
}

CMD:kapikir(playerid, params[])
{
	if(!IsPoliceFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty]) return SendErrorMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");
    if(PlayerData[playerid][pKickDoor]) return SendErrorMessage(playerid, "Bu komutu tekrar kullanmak i�in bekle.");

	if(GetPVarInt(playerid, "AtGarage") != -1)
	{
		new g = GetPVarInt(playerid, "AtGarage");
		if(IsPlayerInRangeOfPoint(playerid, 3.0, GarageData[g][GaragePos][0], GarageData[g][GaragePos][1], GarageData[g][GaragePos][2]))
		{
            if (!GarageData[g][GarageLocked]) return SendErrorMessage(playerid, "Bu garaj zaten kilitli de�il.");

		    ApplyAnimation(playerid, "POLICE", "Door_Kick", 4.0, 0, 0, 0, 0, 0);
			SendNearbyMessage(playerid, 30.0, COLOR_EMOTE, "** %s garaj�n kap�s�n� k�rmaya �al���r.", ReturnName(playerid, 0));
		    SetTimerEx("KickGarage", 1500, false, "dd", playerid, g);
		    PlayerData[playerid][pKickDoor] = true;
		    return 1;
		}
 	}

	new h = -1;
	if((h = IsPlayerNearProperty(playerid)) != -1)
	{
	    if(!PropertyData[h][PropertyLocked]) return SendErrorMessage(playerid, "Bu k�rmaya �al��t���n kap� kilitli de�il.");
		SendNearbyMessage(playerid, 30.0, COLOR_EMOTE, "** %s evin kap�s�n� k�rmaya �al���r.", ReturnName(playerid, 0));
	  	ApplyAnimation(playerid, "POLICE", "Door_Kick", 4.0, 0, 0, 0, 0, 0);
	    SetTimerEx("KickHouse", 1500, false, "ii", playerid, h);
	    PlayerData[playerid][pKickDoor] = true;
	    return 1;
	}

	h = -1;
	if((h = IsPlayerNearBusiness(playerid)) != -1)
	{
		if(!BusinessData[h][BusinessLocked]) return SendErrorMessage(playerid, "Bu k�rmaya �al��t���n kap� kilitli de�il.");
		SendNearbyMessage(playerid, 30.0, COLOR_EMOTE, "** %s i�yerinin kap�s�n� k�rmaya �al��r.", ReturnName(playerid, 0));
	    ApplyAnimation(playerid, "POLICE", "Door_Kick", 4.0, 0, 0, 0, 0, 0);
	    SetTimerEx("KickBusiness", 1500, false, "ii", playerid, h);
	    PlayerData[playerid][pKickDoor] = true;
		return 1;
	}

	SendErrorMessage(playerid, "Etraf�nda k�rabilece�in bir kap� yok.");
	return 1;
}

CMD:m(playerid, params[]) return cmd_megafon(playerid, params);
CMD:megafon(playerid, params[])
{
	if(!IsLAWFaction(playerid)) return UnAuthMessage(playerid);
	if(isnull(params)) return SendUsageMessage(playerid, "/megafon [yaz�]");

	if(strlen(params) > 84)
	{
	    SendNearbyMessage(playerid, 40.0, COLOR_YELLOW, "[ %s:o< %.84s", ReturnName(playerid, 0), params);
	    SendNearbyMessage(playerid, 40.0, COLOR_YELLOW, "...%s ]", params[84]);
	}
	else SendNearbyMessage(playerid, 40.0, COLOR_YELLOW, "[ %s:o< %s ]", ReturnName(playerid, 0), params);
	return 1;
}

CMD:depayarla(playerid, params[])
{
	if(!IsLAWFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty] && !PlayerData[playerid][pMEDduty]) return SendErrorMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");

	PlayerData[playerid][pDep] = 0;
	new dep[10];
	if(sscanf(params, "s[10]", dep)) return SendUsageMessage(playerid, "/depayarla [HEPSI / LS(SD) / LS(PD) / LS(FD) / SA(DCR) / SA(GOV) / FBI / COURTS / SERVICES]");

	if(!strcmp(dep, "HEPSI"))
	{
		SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}�u anda b�t�n departmanlara ba�l� olarak konu�uyorsun.");
		PlayerData[playerid][pDep] = 0;
		return 1;
	}
	else if(!strcmp(dep, "LSSD") || !strcmp(dep, "SD"))
	{
		SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}�u anda LSSD departman�na ba�l� olarak konu�uyorsun.");
		PlayerData[playerid][pDep] = 1;
		return 1;
	}
	else if(!strcmp(dep, "LSPD") || !strcmp(dep, "PD"))
	{
		SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}�u anda LSPD departman�na ba�l� olarak konu�uyorsun.");
		PlayerData[playerid][pDep] = 2;
		return 1;
	}
	else if(!strcmp(dep, "LSFD") || !strcmp(dep, "LSFD"))
	{
		SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}�u anda LSFD departman�na ba�l� olarak konu�uyorsun.");
		PlayerData[playerid][pDep] = 3;
		return 1;
	}
	else if(!strcmp(dep, "SADCR") || !strcmp(dep, "DCR"))
	{
		SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}�u anda SADCR departman�na ba�l� olarak konu�uyorsun.");
		PlayerData[playerid][pDep] = 4;
		return 1;
	}
	else if(!strcmp(dep, "SAGOV") || !strcmp(dep, "GOV"))
	{
		SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}�u anda SAGOV departman�na ba�l� olarak konu�uyorsun.");
		PlayerData[playerid][pDep] = 5;
		return 1;
	}
	else SendErrorMessage(playerid, "Hatal� parametre girdiniz.");
	return 1;
}

CMD:dep(playerid, params[])return cmd_departman(playerid, params);
CMD:departman(playerid, params[])
{
	if(!IsLAWFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty] && !PlayerData[playerid][pMEDduty]) return SendErrorMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");
	if (isnull(params)) return SendUsageMessage(playerid, "/departman [yaz�]");

	new Float: posx, Float: posy, Float: posz;
	GetPlayerPos(playerid, posx, posy, posz);

	switch(PlayerData[playerid][pDep])
	{
		case 0:
		{
			foreach(new i : Player)
			{
				new f = PlayerData[i][pFaction];
				if(f == -1) continue;

				if(FactionData[f][FactionCopPerms] || FactionData[f][FactionMedPerms] || FactionData[f][FactionSheriffPerms])
				{
					if(strlen(params) > 80)
					{
						SendClientMessageEx(i, COLOR_DEPT, "** [%s>HEPSI] %s %s: %.80s...", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);
						SendClientMessageEx(i, COLOR_DEPT, "** [%s>HEPSI] %s %s: ...%s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params[80]);
					}
					else SendClientMessageEx(i, COLOR_DEPT, "** [%s>HEPSI] %s %s: %s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);
				}
			}

			LocalChat(playerid, 20.0, sprintf("%s (radyo): %s", ReturnName(playerid, 0), params), COLOR_FADE1);
		}
		case 1:
		{
			if(strlen(params) > 80)
			{
				SendClientMessageEx(playerid, COLOR_DEPT, "** [%s>SHERIFF] %s %s: %.80s...", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);
				SendClientMessageEx(playerid, COLOR_DEPT, "** [%s>SHERIFF] %s %s: ...%s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params[80]);
			}
			else SendClientMessageEx(playerid, COLOR_DEPT, "** [%s>SHERIFF] %s %s: %s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);

			foreach(new i : Player)
			{
				new f = PlayerData[i][pFaction];
				if(f == -1) continue;
				if(i == playerid) continue;

				if(FactionData[f][FactionSheriffPerms])
				{
					if(strlen(params) > 80)
					{
						SendClientMessageEx(i, COLOR_DEPT, "** [%s>SHERIFF] %s %s: %.80s...", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);
						SendClientMessageEx(i, COLOR_DEPT, "** [%s>SHERIFF] %s %s: ...%s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params[80]);
					}
					else SendClientMessageEx(i, COLOR_DEPT, "** [%s>SHERIFF] %s %s: %s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);
				}
			}

			LocalChat(playerid, 20.0, sprintf("%s (radyo): %s", ReturnName(playerid, 0), params), COLOR_FADE1);
		}
		case 2:
		{
			if(strlen(params) > 80)
			{
				SendClientMessageEx(playerid, COLOR_DEPT, "** [%s>POLICE] %s %s: %.80s...", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);
				SendClientMessageEx(playerid, COLOR_DEPT, "** [%s>POLICE] %s %s: ...%s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params[80]);
			}
			else SendClientMessageEx(playerid, COLOR_DEPT, "** [%s>POLICE] %s %s: %s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);

			foreach(new i : Player)
			{
				new f = PlayerData[i][pFaction];
				if(f == -1) continue;
				if(i == playerid) continue;

				if(FactionData[f][FactionCopPerms])
				{
					if(strlen(params) > 80)
					{
						SendClientMessageEx(i, COLOR_DEPT, "** [%s>POLICE] %s %s: %.80s...", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);
						SendClientMessageEx(i, COLOR_DEPT, "** [%s>POLICE] %s %s: ...%s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params[80]);
					}
					else SendClientMessageEx(i, COLOR_DEPT, "** [%s>POLICE] %s %s: %s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);
				}
			}

			LocalChat(playerid, 20.0, sprintf("%s (radyo): %s", ReturnName(playerid, 0), params), COLOR_FADE1);
		}
		case 3:
		{
			if(strlen(params) > 80)
			{
				SendClientMessageEx(playerid, COLOR_DEPT, "** [%s>FIRE] %s %s: %.80s...", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);
				SendClientMessageEx(playerid, COLOR_DEPT, "** [%s>FIRE] %s %s: ...%s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params[80]);
			}
			else SendClientMessageEx(playerid, COLOR_DEPT, "** [%s>FIRE] %s %s: %s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);

			foreach(new i : Player)
			{
				new f = PlayerData[i][pFaction];
				if(f == -1) continue;
				if(i == playerid) continue;

				if(FactionData[f][FactionMedPerms])
				{
					if(strlen(params) > 80)
					{
						SendClientMessageEx(i, COLOR_DEPT, "** [%s>FIRE] %s %s: %.80s...", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);
						SendClientMessageEx(i, COLOR_DEPT, "** [%s>FIRE] %s %s: ...%s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params[80]);
					}
					else SendClientMessageEx(i, COLOR_DEPT, "** [%s>FIRE] %s %s: %s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);
				}
			}

			LocalChat(playerid, 20.0, sprintf("%s (radyo): %s", ReturnName(playerid, 0), params), COLOR_FADE1);
		}
	}
	return 1;
}

CMD:deplow(playerid, params[])return cmd_departmanlow(playerid, params);
CMD:departmanlow(playerid, params[])
{
	if(!IsLAWFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty] && !PlayerData[playerid][pMEDduty]) return SendErrorMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");
	if (isnull(params)) return SendUsageMessage(playerid, "/departmanlow [yaz�]");

	new Float: posx, Float: posy, Float: posz;
	GetPlayerPos(playerid, posx, posy, posz);

	switch(PlayerData[playerid][pDep])
	{
		case 0:
		{
			foreach(new i : Player)
			{
				new f = PlayerData[i][pFaction];
				if(f == -1) continue;

				if(FactionData[f][FactionCopPerms] || FactionData[f][FactionMedPerms] || FactionData[f][FactionSheriffPerms])
				{
					if(strlen(params) > 80)
					{
						SendClientMessageEx(i, COLOR_DEPT, "** [%s>HEPSI] %s %s: %.80s...", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);
						SendClientMessageEx(i, COLOR_DEPT, "** [%s>HEPSI] %s %s: ...%s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params[80]);
					}
					else SendClientMessageEx(i, COLOR_DEPT, "** [%s>HEPSI] %s %s: %s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);
				}
			}

			LocalChat(playerid, 5.0, sprintf("%s (radyo): %s", ReturnName(playerid, 0), params), COLOR_FADE1);
		}
		case 1:
		{
			if(strlen(params) > 80)
			{
				SendClientMessageEx(playerid, COLOR_DEPT, "** [%s>SHERIFF] %s %s: %.80s...", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);
				SendClientMessageEx(playerid, COLOR_DEPT, "** [%s>SHERIFF] %s %s: ...%s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params[80]);
			}
			else SendClientMessageEx(playerid, COLOR_DEPT, "** [%s>SHERIFF] %s %s: %s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);

			foreach(new i : Player)
			{
				new f = PlayerData[i][pFaction];
				if(f == -1) continue;
				if(i == playerid) continue;

				if(FactionData[f][FactionSheriffPerms])
				{
					if(strlen(params) > 80)
					{
						SendClientMessageEx(i, COLOR_DEPT, "** [%s>SHERIFF] %s %s: %.80s...", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);
						SendClientMessageEx(i, COLOR_DEPT, "** [%s>SHERIFF] %s %s: ...%s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params[80]);
					}
					else SendClientMessageEx(i, COLOR_DEPT, "** [%s>SHERIFF] %s %s: %s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);
				}
			}

			LocalChat(playerid, 5.0, sprintf("%s (radyo): %s", ReturnName(playerid, 0), params), COLOR_FADE1);
		}
		case 2:
		{
			if(strlen(params) > 80)
			{
				SendClientMessageEx(playerid, COLOR_DEPT, "** [%s>POLICE] %s %s: %.80s...", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);
				SendClientMessageEx(playerid, COLOR_DEPT, "** [%s>POLICE] %s %s: ...%s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params[80]);
			}
			else SendClientMessageEx(playerid, COLOR_DEPT, "** [%s>POLICE] %s %s: %s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);

			foreach(new i : Player)
			{
				new f = PlayerData[i][pFaction];
				if(f == -1) continue;
				if(i == playerid) continue;

				if(FactionData[f][FactionCopPerms])
				{
					if(strlen(params) > 80)
					{
						SendClientMessageEx(i, COLOR_DEPT, "** [%s>POLICE] %s %s: %.80s...", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);
						SendClientMessageEx(i, COLOR_DEPT, "** [%s>POLICE] %s %s: ...%s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params[80]);
					}
					else SendClientMessageEx(i, COLOR_DEPT, "** [%s>POLICE] %s %s: %s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);
				}
			}

			LocalChat(playerid, 5.0, sprintf("%s (radyo): %s", ReturnName(playerid, 0), params), COLOR_FADE1);
		}
		case 3:
		{
			if(strlen(params) > 80)
			{
				SendClientMessageEx(playerid, COLOR_DEPT, "** [%s>FIRE] %s %s: %.80s...", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);
				SendClientMessageEx(playerid, COLOR_DEPT, "** [%s>FIRE] %s %s: ...%s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params[80]);
			}
			else SendClientMessageEx(playerid, COLOR_DEPT, "** [%s>FIRE] %s %s: %s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);

			foreach(new i : Player)
			{
				new f = PlayerData[i][pFaction];
				if(f == -1) continue;
				if(i == playerid) continue;

				if(FactionData[f][FactionMedPerms])
				{
					if(strlen(params) > 80)
					{
						SendClientMessageEx(i, COLOR_DEPT, "** [%s>FIRE] %s %s: %.80s...", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);
						SendClientMessageEx(i, COLOR_DEPT, "** [%s>FIRE] %s %s: ...%s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params[80]);
					}
					else SendClientMessageEx(i, COLOR_DEPT, "** [%s>FIRE] %s %s: %s", Player_GetFactionAbbrev(playerid), Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);
				}
			}

			LocalChat(playerid, 5.0, sprintf("%s (radyo): %s", ReturnName(playerid, 0), params), COLOR_FADE1);
		}
	}
	return 1;
}

CMD:kelepce(playerid, params[])
{
	if(!IsLAWFaction(playerid)) return UnAuthMessage(playerid);

	new id;
	if(sscanf(params, "u", id)) return SendUsageMessage(playerid, "/kelepce [oyuncu ID/isim]");
	if(id == playerid) return SendServerMessage(playerid, "Bu komutu kendi �zerinde kullanamazs�n.");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
	if(!GetDistanceBetweenPlayers(playerid, id, 4.5)) return SendErrorMessage(playerid, "Belirtti�iniz ki�iye yak�n de�ilsin.");
	if(PlayerData[id][pHandcuffed]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i zaten kelep�elenmi�.");
	if(PlayerData[id][pHandcuffing]) return SendErrorMessage(playerid, "Belirtti�iniz ki�iyi zaten biri kelep�eliyor.");
	PlayerData[id][pHandcuffing] = false;
	PlayerData[playerid][pHandcuffCount] -= 1;
	SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}%i adet kelep�e setin kald�.", PlayerData[playerid][pHandcuffCount]);
	SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}%s isimli oyuncuyu kelep�eledin.", ReturnName(id, 0));
	SendClientMessageEx(id, COLOR_ADM, "[ ! ] {FFFFFF}%s seni kelep�eledi.", ReturnName(playerid, 0));
	ToggleHandcuffs(id, true);
	return 1;
}

CMD:kelepcecoz(playerid, params[])
{
	if(!IsLAWFaction(playerid)) return UnAuthMessage(playerid);

	new id;
	if(sscanf(params, "u", id)) return SendServerMessage(playerid, "/kelepcecoz [oyuncu ID/isim]");
	if(id == playerid) return SendServerMessage(playerid, "Bu komutu kendi �zerinde kullanamazs�n.");
	if(!IsPlayerConnected(id)) return SendServerMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
	if(!pLoggedIn[id]) return SendServerMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
	if(!GetDistanceBetweenPlayers(playerid, id, 4.5)) return SendServerMessage(playerid, "Belirtti�iniz ki�iye yak�n de�ilsin.");
	if(!PlayerData[id][pHandcuffed]) return SendServerMessage(playerid, "Belirtti�iniz ki�i zaten kelep�elenmemi�.");
	if(PlayerData[id][pHandcuffing]) return SendErrorMessage(playerid, "Belirtti�iniz ki�inin kelep�esini zaten biri ��z�yor.");
	PlayerData[id][pHandcuffing] = false;
	PlayerData[playerid][pHandcuffCount] += 1;
	SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}%i adet kelep�e setin kald�.", PlayerData[playerid][pHandcuffCount]);
	SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}%s isimli oyuncunun kelep�esini ��zd�n.", ReturnName(id, 0));
	SendClientMessageEx(id, COLOR_ADM, "[ ! ] {FFFFFF}%s senin kelep�eni ��zd�.", ReturnName(playerid, 0));
	ToggleHandcuffs(id, false);
	PlayerData[id][pHandcuffing] = true;
	return 1;
}

CMD:ltl(playerid, params[])
{
	if(!IsPoliceFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty]) return SendServerMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");
	if(!Player_HasWeapon(playerid, 33) && !PlayerData[playerid][pTaser]) return SendErrorMessage(playerid, "�st�nde rifle yok.");

	if(!PlayerData[playerid][pLethalbullet])
	{
		PlayerData[playerid][pLethalbullet] = true;
		SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Mermi t�r�n� ZARARSIZ/PLAST�K MERM� olarak ayarlad�n.");
	}
	else
	{
		PlayerData[playerid][pLethalbullet] = false;
		SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Mermi t�r�n� ZARARLI/GER�EK MERM� olarak ayarlad�n.");
	}
	return 1;
}

CMD:plastikmermi(playerid, params[])
{
	if(!IsPoliceFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty]) return SendServerMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");
	if(!Player_HasWeapon(playerid, 25) && !PlayerData[playerid][pTaser]) return SendErrorMessage(playerid, "�st�nde shotgun yok.");

	if(!PlayerData[playerid][pRubberbullet])
	{
		PlayerData[playerid][pRubberbullet] = true;
		SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Mermi t�r�n� ZARARSIZ/PLAST�K MERM� olarak ayarlad�n.");
	}
	else
	{
		PlayerData[playerid][pRubberbullet] = false;
		SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Mermi t�r�n� ZARARLI/GER�EK MERM� olarak ayarlad�n.");
	}
	return 1;
}

CMD:spike(playerid, params[])
{
	if(!IsPoliceFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty]) return SendServerMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman�z gerekiyor.");

	SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Bulundu�unuz noktaya {FF6347}�ivi {FFFFFF}konu�land�rd�n�z. �ivinin konumunu ayarlayana kadar sadece sizde g�r�n�r.");
	SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Pozisyonu kaydetmeden �nce kontrol etmeyi unutmay�n. (Kald�rmak i�in /engel kaldir)");
	Roadblock_Create(playerid, 2892, "�ivi");
	return 1;
}

CMD:taser(playerid, params[])
{
	if(!IsPoliceFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty]) return SendErrorMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");
	if(!Player_HasWeapon(playerid, 24) && !PlayerData[playerid][pTaser]) return SendErrorMessage(playerid, "�st�nde taser yok.");

	if(!PlayerData[playerid][pTaser])
	{
		GetPlayerWeaponData(playerid, Weapon_GetSlotID(24), PlayerData[playerid][pWeapons][Weapon_GetSlotID(24)], playerTaserAmmo[playerid]);
		SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s taserini te�hizat kemerinden kavrar.", ReturnName(playerid, 0));
		PlayerData[playerid][pTaser] = true;
		GivePlayerWeapon(playerid, 23, 5);
	}
	else
	{
		SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s taserini te�hizat kemerine yerle�tirir.", ReturnName(playerid, 0));
		GivePlayerWeapon(playerid, 24, playerTaserAmmo[playerid]);
		PlayerData[playerid][pTaser] = false;
	}
	return 1;
}

CMD:tackle(playerid, params[])
{
	if(!IsPoliceFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty]) return SendServerMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");

	if(!PlayerData[playerid][pTackle])
	{
		PlayerData[playerid][pTackle] = true;
		SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}Tackle modu aktif edildi.");
		SendClientMessage(playerid, COLOR_ADM, "E�er birisini yumruklamay� denerseniz, yere d���rme giri�iminde bulunacaks�n�z.");
		SendClientMessage(playerid, COLOR_ADM, "Yere d���rme giri�iminde bulundu�unuz ki�iyi sistem yere d���rmeye �al��t���n�z hakk�nda sistem bilgi mesaj� verecektir.");
		SendClientMessage(playerid, COLOR_ADM, "Di�er oyuncular� bilgilendirmek ad�na sistem otomatik bir emote verecektir.");
		SendClientMessage(playerid, COLOR_ADM, "Komut kullanman�z� engellemek amac�yla sistem uygun bir animasyonu karakterinize oynatacakt�r.");
		SendClientMessage(playerid, COLOR_ADM, "E�er yere d���rmeye �al��t���n�z ki�i role uymuyorsa, oyun i�i bir rapor olu�turun.");
	}
	else
	{
		PlayerData[playerid][pTackle] = false;
		SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}Tackle modu de-aktif edildi.");
	}
	return 1;
}


CMD:togalpr(playerid, params[])
{
	if(!PlayerData[playerid][pAlpr])
	{
		PlayerData[playerid][pAlpr] = true;
		SendClientMessage(playerid, COLOR_ADM, "ALPR {FFFFFF}aktif edildi.");
	}
	else
	{
		PlayerData[playerid][pAlpr] = false;
		SendClientMessage(playerid, COLOR_ADM, "ALPR {FFFFFF}de-aktif edildi.");
	}
	return 1;
}

CMD:alprlog(playerid, params[])
{
	Show_AlprLog(playerid);
	return 1;
}

Server:Show_AlprLog(playerid)
{
	new str[64], countdown = 0;

	if(gettime() - GetPVarInt(playerid, "pAlpr_Active_LastID_Time") > 60)
		return SendErrorMessage(playerid, "Hi� ALPR kay�t� yok.");

	foreach(new id : VBolos)
	{
		if(id == GetPVarInt(playerid, "pAlpr_Active_LastID"))
		{

			format(str, sizeof(str), "BOLO#\tPlaka\tAranma Sebebi\n%d\t%s\t%s\n", id, VehicleBolo[id][vBoloPlate], VehicleBolo[id][vBoloCrimes]);
			countdown++;
		}
	}
	if(countdown == 0)
		return SendErrorMessage(playerid, "Hi� ALPR kay�t� yok.");

	Dialog_Show(playerid, DIALOG_ALPRLOG, DIALOG_STYLE_TABLIST_HEADERS, "ALPR Kay�tlar� (son 60 saniye)", str, "Sorgula", "Kapat");
	return 1;
}

CMD:takip(playerid, params[])
{
	if(!IsPoliceFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty]) return SendServerMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");

	new phone, playerb;
	if(sscanf(params, "d", phone)) return SendUsageMessage(playerid, "/takip [telefon numaras�]");
	if(PlayerData[playerid][pIsTracing]) return SendErrorMessage(playerid, "Yer tespit ediliyor, l�tfen bekleyin.");

	playerb = IsValidNumber(phone);
	PlayerData[playerid][pTraceNum] = playerb;

	SendLawMessage(COLOR_COP, sprintf("** HQ: %s %s 555-%d numaras� �st�nde takip ba�latt�! **", Player_GetFactionRank(playerid), ReturnName(playerid, 0), phone));

	PlayerTextDrawShow(playerid, Trace_PTD[playerid][0]);
	PlayerTextDrawSetString(playerid, Trace_PTD[playerid][0], "Takip_Basliyor");
	SetTimerEx("TracingSteps", 4000, false, "i", playerid);
	PlayerData[playerid][pIsTracing] = 1;
	return true;
}

CMD:ftakip(playerid, params[])
{
	if(!IsPoliceFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty]) return SendServerMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");

	new phone, playerb;
	if(sscanf(params, "d", phone)) return SendUsageMessage(playerid, "/ftakip [telefon numaras�]");
	if(PlayerData[playerid][pIsTracing] == 2) return SendErrorMessage(playerid, "Yer tespit ediliyor, l�tfen bekleyin.");

	playerb = IsValidNumber(phone);
	PlayerData[playerid][pTraceNum] = playerb;
	SendLawMessage(COLOR_COP, sprintf("** HQ: %s %s 555-%d numaras� �st�ne geni� bir takip ba�latt�! **", Player_GetFactionRank(playerid), ReturnName(playerid, 0), phone));
	PlayerTextDrawShow(playerid, Trace_PTD[playerid][0]);
	PlayerTextDrawSetString(playerid, Trace_PTD[playerid][0], "Takip_Basliyor");
	SetTimerEx("TracingSteps", 4000, false, "i", playerid);
	PlayerData[playerid][pIsTracing] = 2;
	return true;
}

CMD:callsign(playerid, params[])
{
	if(!IsPoliceFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty]) return SendServerMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");
	if(isnull(params)) return SendUsageMessage(playerid, "/callsign [_callsign_ (�rnek: 2-ADAM-4]");

	if(!PlayerData[playerid][pLAWduty])
		SendClientMessageEx(playerid, COLOR_COP, "** HQ: %s %s �u anda %s birim kodu alt�nda! **", Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);

	SendLawMessage(COLOR_COP, sprintf("** HQ: %s %s �u anda %s birim kodu alt�nda! **", Player_GetFactionRank(playerid), ReturnName(playerid, 0), params));
	return 1;
}

CMD:swat(playerid, params[])
{
	if(!IsPoliceFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty]) return SendServerMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");

	switch(PlayerData[playerid][pSWATduty])
	{
		case false:
		{
			SetPlayerHealth(playerid, PlayerData[playerid][pMaxHealth]);
			SetPlayerArmour(playerid, 100);

			SendLawMessage(COLOR_COP, sprintf("** HQ: %s %s art�k SWAT birim kodu alt�nda de�il. **", Player_GetFactionRank(playerid), ReturnName(playerid, 0)));
		}

		case true:
		{
			SetPlayerHealth(playerid, 150);
			SetPlayerArmour(playerid, 200);

			SendLawMessage(COLOR_COP, sprintf("** HQ: %s %s art�k SWAT birim kodu alt�nda! **", Player_GetFactionRank(playerid), ReturnName(playerid, 0)));
		}
	}

	PlayerData[playerid][pSWATduty] = !PlayerData[playerid][pSWATduty];

	return 1;
}

CMD:hq(playerid, params[])
{
	if(!IsLAWFaction(playerid)) return UnAuthMessage(playerid);
	if(isnull(params)) return SendUsageMessage(playerid, "/hq [i�erik]");

	new string[128];
	format(string, sizeof(string), "HQ: %s %s: %s", Player_GetFactionRank(playerid), ReturnName(playerid, 0), params);
	SendFactionMessageEx(playerid, COLOR_CYAN, string);
	return 1;
}

CMD:isbasi(playerid, params[])
{
	if(!IsLAWFaction(playerid)) return UnAuthMessage(playerid);

	if(PlayerData[playerid][pInsideEntrance] == -1)
		return SendErrorMessage(playerid, "Bu birlik komutunu kullanmak i�in birli�inize ait bir bina i�erisinde olmal�s�n�z.");

	if(PlayerData[playerid][pFaction] != EntranceData[PlayerData[playerid][pInsideEntrance]][EntranceFaction])
		return SendErrorMessage(playerid, "Bu bina senin birli�ine ait de�il.");

	if(IsPoliceFaction(playerid))
	{
		if(!PlayerData[playerid][pLAWduty])
		{
			PlayerData[playerid][pLAWduty] = true;

			if(isnull(PlayerData[playerid][pCallsign]))
			{
				SendLawMessage(COLOR_COP, sprintf("** HQ: %s %s �u anda i�ba��nda! **", Player_GetFactionRank(playerid), ReturnName(playerid, 0)));
			}
			else
			{
				SendLawMessage(COLOR_COP, sprintf("** HQ: %s %s �u anda %s kodu alt�nda i�ba��nda! **", Player_GetFactionRank(playerid), ReturnName(playerid, 0), PlayerData[playerid][pCallsign]));
			}

			TakePlayerGuns(playerid);
			SetPlayerColor(playerid, PlayerData[playerid][pTesterDuty] ? (COLOR_TESTER) : (PlayerData[playerid][pAdminDuty] ? COLOR_ADMIN : COLOR_COP));
			SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s dolaptan ekipmanlar�n� al�r.", ReturnName(playerid, 0));
			SetPlayerHealth(playerid, PlayerData[playerid][pMaxHealth]);
			PlayerData[playerid][pHandcuffCount] += 2;
			GivePlayerWeapon(playerid, 3, 1);
			GivePlayerWeapon(playerid, 41, 500);
			GivePlayerWeapon(playerid, 24, 50);
		}
		else
		{
			if(isnull(PlayerData[playerid][pCallsign]))
				SendLawMessage(COLOR_COP, sprintf("** HQ: %s %s �u anda i�ba��ndan ��kt�! **", Player_GetFactionRank(playerid), ReturnName(playerid, 0)));
			else
				SendLawMessage(COLOR_COP, sprintf("** HQ: %s %s �u anda %s kodu alt�nda i�ba��ndan ��kt�! **", Player_GetFactionRank(playerid), ReturnName(playerid, 0), PlayerData[playerid][pCallsign]));

			format(PlayerData[playerid][pCallsign], 128, "");

			PlayerData[playerid][pLAWduty] = false;
			if(PlayerData[playerid][pSWATduty]) PlayerData[playerid][pSWATduty] = false;
			if(GetPlayerSkin(playerid) != PlayerData[playerid][pSkin]) SetPlayerSkin(playerid, PlayerData[playerid][pSkin]);
			SetPlayerColor(playerid, PlayerData[playerid][pTesterDuty] ? (COLOR_TESTER) : (PlayerData[playerid][pAdminDuty] ? COLOR_ADMIN : COLOR_WHITE));
			SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s ekipmanlar�n� dolaba koyar.", ReturnName(playerid, 0));
			SetPlayerHealth(playerid, PlayerData[playerid][pMaxHealth]);
			PlayerData[playerid][pHandcuffCount] = 0;
			SetPlayerArmour(playerid, 0);
			TakePlayerGuns(playerid);
		}
	}
	else if(IsMedicFaction(playerid))
	{
	    if(!PlayerData[playerid][pMEDduty])
	    {
	    	PlayerData[playerid][pMEDduty] = true;
			SetPlayerColor(playerid, PlayerData[playerid][pTesterDuty] ? (COLOR_TESTER) : (PlayerData[playerid][pAdminDuty] ? COLOR_ADMIN : COLOR_EMT));
			SendFDMessage(COLOR_EMT, sprintf("** HQ: %s %s �u anda i�ba��nda! **", Player_GetFactionRank(playerid), ReturnName(playerid, 0)));
			SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s dolaptan ekipmanlar�n� al�r.", ReturnName(playerid, 0));
			SetPlayerHealth(playerid, PlayerData[playerid][pMaxHealth]);
		}
		else
		{
			PlayerData[playerid][pMEDduty] = false;
			if(GetPlayerSkin(playerid) != PlayerData[playerid][pSkin]) SetPlayerSkin(playerid, PlayerData[playerid][pSkin]);
			SetPlayerColor(playerid, PlayerData[playerid][pTesterDuty] ? (COLOR_TESTER) : (PlayerData[playerid][pAdminDuty] ? COLOR_ADMIN : COLOR_WHITE));
			SendFDMessage(COLOR_EMT, sprintf("** HQ: %s %s �u anda i�ba��ndan ��kt�! **", Player_GetFactionRank(playerid), ReturnName(playerid, 0)));
			SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s ekipmanlar�n� dolaba koyar.", ReturnName(playerid, 0));
			SetPlayerHealth(playerid, PlayerData[playerid][pMaxHealth]);
		}
	}
	return 1;
}

CMD:carsign(playerid, params[])
{
	if(!IsLAWFaction(playerid)) return UnAuthMessage(playerid);
	if(!IsPlayerInAnyVehicle(playerid)) return SendErrorMessage(playerid, "Herhangi bir ara� i�erisinde de�ilsin.");
	if(GetPlayerVehicleSeat(playerid) > 1) return SendErrorMessage(playerid, "Arka koltukta bu komutu kullanamazs�n.");
	if(!PlayerData[playerid][pLAWduty] && !PlayerData[playerid][pMEDduty]) return SendServerMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");

	new vehicleid = GetPlayerVehicleID(playerid);
	if(CarData[vehicleid][carFaction] == -1) return SendServerMessage(playerid, "Sadece birlik ara�lar�na car-sign ekleyebilirsin.");
	if(isnull(params)) return SendUsageMessage(playerid, "/carsign [carsign yaz�s�]");

	format(CarData[vehicleid][carSign], 45, "%s", params);

	SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /carsign_sil - {FFFFFF}��in bitti�inde silmek i�in kullanabilirsin.");
	if(!IsValidDynamic3DTextLabel(CarData[vehicleid][carSign3D])) CarData[vehicleid][carSign3D] = CreateDynamic3DTextLabel(sprintf("%s", CarData[vehicleid][carSign]), COLOR_WHITE, -0.7, -1.9, -0.3, 10.0, INVALID_PLAYER_ID, vehicleid, 0, -1, -1, -1);
	else UpdateDynamic3DTextLabelText(CarData[vehicleid][carSign3D], COLOR_WHITE, sprintf("%s", CarData[vehicleid][carSign]));
	Attach3DTextLabelToVehicle(CarData[vehicleid][carSign3D], vehicleid, -0.7, -1.9, -0.3);

	return 1;
}

CMD:carsign_sil(playerid, params[])
{
	if(!IsLAWFaction(playerid)) return UnAuthMessage(playerid);
	if(!IsPlayerInAnyVehicle(playerid)) return SendErrorMessage(playerid, "Herhangi bir ara� i�erisinde de�ilsin.");
	if(GetPlayerVehicleSeat(playerid) > 1) return SendErrorMessage(playerid, "Arka koltukta bu komutu kullanamazs�n.");
	if(!PlayerData[playerid][pLAWduty] && !PlayerData[playerid][pMEDduty]) return SendServerMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");

	new vehicleid = GetPlayerVehicleID(playerid);
	if(CarData[vehicleid][carFaction] == -1) return SendServerMessage(playerid, "Sadece birlik ara�lar�ndan car-sign silebilirsin.");

	format(CarData[vehicleid][carSign], 45, "-");
	SendServerMessage(playerid, "Carsign ba�ar�yla silindi, tekrar /carsign yazarak ekleyebilirsin.");
	if(IsValidDynamic3DTextLabel(CarData[vehicleid][carSign3D])) DestroyDynamic3DTextLabel(CarData[vehicleid][carSign3D]);
	return 1;
}

CMD:label(playerid, params[])
{
	if(!IsLAWFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty] && !PlayerData[playerid][pMEDduty]) return SendErrorMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");

    Label_RouteCommands(playerid, params);
	return 1;
}

CMD:elkoy(playerid, params[])
{
	if(!IsPoliceFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty]) return SendErrorMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");

	new id, specifier[15], b_string[15];
	if(sscanf(params, "us[15]S()[15]", id, specifier, b_string))
		return SendUsageMessage(playerid, "/elkoy [oyuncu ID/isim] [silahlar, lisans, uyusturucu]");

	if(!IsPlayerConnected(id)) return SendServerMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
	if(!pLoggedIn[id]) return SendServerMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
	if(!GetDistanceBetweenPlayers(playerid, id, 4.5)) return SendServerMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");

	if(!strcmp(specifier, "silahlar"))
	{
		SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s, %s adl� ki�inin silahlar�na el koydu.", ReturnName(playerid, 0), ReturnName(id, 0));
		TakePlayerGuns(id);
	}
	else if(!strcmp(specifier, "lisans"))
	{
		new lictype[10];
		if(sscanf(b_string, "s[10]", lictype)) return SendUsageMessage(playerid, "/elkoy [oyuncu ID/isim] lisans [ehliyet, silah]");

		if(!strcmp(b_string, "ehliyet"))
		{
			SendLawMessage(COLOR_COP, sprintf("** HQ: %s %s, %s adl� ki�inin s�r�c� lisans�n� iptal etti! **", Player_GetFactionRank(playerid), ReturnName(playerid, 1), ReturnName(id, 1)));
			SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s, %s adl� ki�inin s�r�c� lisans�na el koydu.", ReturnName(playerid, 0), ReturnName(id, 0));
			PlayerData[id][pDriversLicense] = false;
		}
		else if(!strcmp(b_string, "silah"))
		{
			SendLawMessage(COLOR_COP, sprintf("** HQ: %s %s, %s adl� ki�inin silah lisans�n� iptal etti! **", Player_GetFactionRank(playerid), ReturnName(playerid, 1), ReturnName(id, 1)));
			SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s, %s adl� ki�inin silah lisans�na el koydu.", ReturnName(playerid, 0), ReturnName(id, 0));
			PlayerData[id][pWeaponsLicense] = false;
		}
		else return SendClientMessage(playerid, COLOR_ADM, "SERVER: Hatal� parametre girdin.");
	}
	else if(!strcmp(specifier, "uyusturucu"))
	{
		SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s, %s adl� ki�inin uyu�turucular�na el koydu.", ReturnName(playerid, 0), ReturnName(id, 0));
		for(new i = 1; i < MAX_PACK_SLOT; ++i) Drug_DefaultValues(playerid, -1);
		return 1;
	}
	else return SendClientMessage(playerid, COLOR_ADM, "SERVER: Hatal� parametre girdin.");
	return true;
}

CMD:hizkamerasi(playerid, params[])
{

	if(!IsPoliceFaction(playerid))
		return UnAuthMessage(playerid);

	if(!PlayerData[playerid][pLAWduty])
		return SendErrorMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman�z gerekiyor.");

	if(!IsPlayerInAnyVehicle(playerid))
		return SendErrorMessage(playerid, "Bir ara� i�erisinde de�ilsin.");

	new speed;
	if(sscanf(params, "d", speed))
		return SendUsageMessage(playerid, "/hizkamerasi [h�z de�eri]");

	if(speed == 0)
		{

			SetPVarInt(playerid, "playerSpeedCam", 0);
			return 1;
		}

	if(speed < 15 || speed > 256)
		return SendErrorMessage(playerid, "Ge�ersiz h�z girdiniz. (15 - 256)");

	SetPVarInt(playerid, "playerSpeedCam", speed);
	SendClientMessageEx(playerid, COLOR_GREY, "H�z kameras� aktif edildi. (%d)", speed);
	return 1;
}

CMD:aracbagla(playerid, params[])
{

	if(!IsPoliceFaction(playerid))
		return UnAuthMessage(playerid);

	if(!PlayerData[playerid][pLAWduty])
		return SendErrorMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman�z gerekiyor.");

	if(!IsPlayerInAnyVehicle(playerid))
		return SendErrorMessage(playerid, "Bir �ekici i�erisinde de�ilsin.");

	new vehicle = GetPlayerVehicleID(playerid);
	if(GetVehicleModel(vehicle) != 525)
		return SendErrorMessage(playerid, "Kulland���n�z ara� �ekici de�il.");

	if(IsTrailerAttachedToVehicle(vehicle))
		return SendErrorMessage(playerid, "Bulundu�unuz ara� zaten bir ba�ka araca ba�l�.");

	new id;
	if(sscanf(params, "d", id))
		return SendUsageMessage(playerid, "/aracbagla [ara�ID (/dl)]");

	if(IsTrailerAttachedToVehicle(id))
		return SendErrorMessage(playerid, "Girilen ID'ye sahip ara� zaten bir ba�ka araca ba�l�.");

	AttachTrailerToVehicle(id, GetPlayerVehicleID(playerid));
	SendClientMessageEx(playerid, COLOR_GREY, "Ara� ba�land�. (%d)", id);
	return 1;
}

CMD:impound(playerid, params[])
{
	if(!IsPoliceFaction(playerid))
		return UnAuthMessage(playerid);

	if(!PlayerData[playerid][pLAWduty])
		return SendErrorMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman�z gerekiyor.");

	if(!IsPlayerInAnyVehicle(playerid))
		return SendErrorMessage(playerid, "Bir �ekici i�erisinde de�ilsin.");

	new vehicle = GetPlayerVehicleID(playerid);
	if(GetVehicleModel(vehicle) != 525)
		return SendErrorMessage(playerid, "Kulland���n�z ara� �ekici de�il.");


	new trailerid = GetVehicleTrailer(vehicle);
	if(trailerid == 0)
		return SendErrorMessage(playerid, "Arac�na ba�l� bir ara� yok.");

	if(!IsValidPlayerCar(trailerid))
		return SendErrorMessage(playerid, "Bu ara� ba�lanamaz.");

	if(CarData[trailerid][carImpounded] != -1)
		return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bu ara� zaten �ekilmi�.");

	new id = Impound_Nearest(playerid);
	if (id == -1) return SendClientMessage(playerid, COLOR_ADM, "Ara� ba�lama noktas�nda de�ilsin.");

	new option[24], value, reason[45];

	if(sscanf(params, "s[24]ds[45]", option, value, reason))
		return SendUsageMessage(playerid, "/impound [gun veya saat] [De�er] [A��klama]");

	getdate(year, month, day);
	gettime(hour, minute, second);

	if(!strcmp(option, "gun"))
	{
			if(value < 0 || value > 7)
				return SendErrorMessage(playerid, "Girilen g�n de�eri 0'dan k���k, 7'ten b�y�k olamaz.");

			GetPlayerPos(playerid, CarData[trailerid][carPos][0], CarData[trailerid][carPos][1], CarData[trailerid][carPos][2]);
			CarData[trailerid][carImpounded] = id;
			CarData[trailerid][carImpoundTime] = mktime(hour, minute, second, day+value, month, year);
			format(CarData[trailerid][carImpoundReason], 45, "%s", reason);
			Car_Save(trailerid);

			foreach(new i : Player) if(PlayerData[i][pSQLID] == CarData[trailerid][carOwnerID])
			{
				SendClientMessageEx(i, COLOR_DARKGREEN, "SERVER: %s model arac�n�z polis departman� taraf�ndan �ekildi.", ReturnVehicleName(trailerid));

			}
			SendClientMessageEx(playerid, COLOR_ADM, "%s(#%d) model ara� %s tarihine kadar �ekildi. A��klama: %s", ReturnVehicleName(trailerid), trailerid, GetFullTime(mktime(hour, minute, second, day+value, month, year)), reason);

			new impound_msg[256];
			format(impound_msg, sizeof(impound_msg), "%s %s, %s adl� ki�inin %s[%s] model arac�n� %s tarihine kadar %s sebebiyle �ekti.   -   [%s]", Player_GetFactionRank(playerid), ReturnName(playerid, 0),  ReturnSQLName(CarData[trailerid][carOwnerID]), ReturnVehicleName(trailerid), ReturnVehiclePlate(trailerid), GetFullTime(mktime(hour, minute, second, day+value, month, year)), reason, GetFullTime(Time()));
			DCC_SendChannelMessage(impound_channel, FixDiscordWord(impound_msg));
	}
	if(!strcmp(option, "saat"))
	{
		if(value < 0 || value > 24)
			return SendErrorMessage(playerid, "Girilen saat de�eri 0'dan k���k, 24'ten b�y�k olamaz.");

		GetPlayerPos(playerid, CarData[trailerid][carPos][0], CarData[trailerid][carPos][1], CarData[trailerid][carPos][2]);
		CarData[trailerid][carImpounded] = id;
		CarData[trailerid][carImpoundTime] = mktime(hour+value, minute, second, day, month, year);
		format(CarData[trailerid][carImpoundReason], 45, "%s", reason);
		Car_Save(trailerid);

		foreach(new i : Player) if(PlayerData[i][pSQLID] == CarData[trailerid][carOwnerID])
		{
			SendClientMessageEx(i, COLOR_DARKGREEN, "SERVER: %s model arac�n�z polis departman� taraf�ndan �ekildi.", ReturnVehicleName(trailerid), ReturnName(playerid, 1));
		}

		SendServerMessage(playerid, "[ ! ] %s(#%d) model ara� %s tarihine kadar �ekildi. A��klama: %s", ReturnVehicleName(trailerid), trailerid, GetFullTime(mktime(hour+value, minute, second, day, month, year)), reason);

		new impound_msg[256];
		format(impound_msg, sizeof(impound_msg), "%s %s, %s adl� ki�inin %s[%s] model arac�n� %s tarihine kadar %s sebebiyle �ekti.   -   [%s]", Player_GetFactionRank(playerid), ReturnName(playerid, 0),  ReturnSQLName(CarData[trailerid][carOwnerID]), ReturnVehicleName(trailerid), ReturnVehiclePlate(trailerid), GetFullTime(mktime(hour+value, minute, second, day, month, year)), reason, GetFullTime(Time()));
		DCC_SendChannelMessage(impound_channel, FixDiscordWord(impound_msg));
	}
	return 1;
}

CMD:aranmaemri(playerid, params[])
{
	if(!IsPoliceFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pLAWduty]) return SendErrorMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");

	new
		id,
		reason[128];

	if(sscanf(params, "us[128]", id, reason)) return SendUsageMessage(playerid, "/aranmaemri [oyuncu ID/isim] [sebep]");

	if(!IsPlayerConnected(id)) return SendServerMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
	if(!pLoggedIn[id]) return SendServerMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
	if(strlen(reason) < 3 || strlen(reason) > 128) return SendServerMessage(playerid, "Sebep 3 ile 128 karakter aras�nda olmal�d�r.");

    new add_query[256];
	mysql_format(m_Handle, add_query, sizeof(add_query), "INSERT INTO criminal_record (player_name, entry_reason, entry_date, entry_by) VALUES('%e', '%e', %i, '%e')", ReturnName(id, 1), reason, Time(), ReturnName(playerid, 1));
	mysql_tquery(m_Handle, add_query, "OnPlayerAddCharge", "ii", playerid, id);
	return 1;
}

CMD:setp(playerid, params[])
{
	if(!IsLAWFaction(playerid)) return UnAuthMessage(playerid);

	new
		id;
	if(sscanf(params, "i", id)) return SendUsageMessage(playerid, "/setp [(1-3)]");
	if(id < 1 || id > 3) return SendErrorMessage(playerid, "Hatal� spawn noktas� se�tin. (1-3)");

	PlayerData[playerid][pSpawnPrecinct] = id;
	SendClientMessageEx(playerid, COLOR_ADM, "[!] Birli�inin (%d) numaral� spawn noktas�n� ayarlad�n, art�k se�ti�in noktada oyuna ba�layacaks�n.", id);
	return 1;
}

CMD:candoldur(playerid, params[])
{
	if(IsPoliceFaction(playerid))
	{
		if(PlayerData[playerid][pInsideEntrance] == -1)
			return SendErrorMessage(playerid, "Bu birlik komutunu kullanmak i�in birli�inize ait bir bina i�erisinde olmal�s�n�z.");

		if(PlayerData[playerid][pFaction] != EntranceData[PlayerData[playerid][pInsideEntrance]][EntranceFaction])
			return SendErrorMessage(playerid, "Bu bina senin birli�ine ait de�il.");

		SendClientMessage(playerid, COLOR_WHITE, "Maksimum can ve z�rh temin edildi.");
		SetPlayerHealth(playerid, PlayerData[playerid][pMaxHealth]);
		SetPlayerArmour(playerid, 100);
		return 1;
	}

	else if(IsMedicFaction(playerid))
	{
		if(PlayerData[playerid][pInsideEntrance] == -1)
			return SendErrorMessage(playerid, "Bu birlik komutunu kullanmak i�in birli�inize ait bir bina i�erisinde olmal�s�n�z.");

		if(PlayerData[playerid][pFaction] != EntranceData[PlayerData[playerid][pInsideEntrance]][EntranceFaction])
			return SendErrorMessage(playerid, "Bu bina senin birli�ine ait de�il.");

		SendClientMessage(playerid, COLOR_WHITE, "Maksimum can temin edildi.");
		SetPlayerHealth(playerid, PlayerData[playerid][pMaxHealth]);
		return 1;
	}

	new id = -1;
	if((id = IsPlayerInProperty(playerid)) != -1)
	{
		if(PropertyData[id][PropertyFaction] != -1)
		{
			if(PlayerData[playerid][pFaction] != PropertyData[id][PropertyFaction]) return SendErrorMessage(playerid, "Burada can dolduramazs�n.");

			if(FactionData[PropertyData[id][PropertyFaction]][FactionCopPerms])
			{
				if(PlayerData[playerid][pLAWduty])
				{
					//LogPlayerAction(playerid, "Healed and got 100 Armor");
					SendClientMessage(playerid, COLOR_WHITE, "Maksimum can ve z�rh temin edildi.");
					SetPlayerHealth(playerid, PlayerData[playerid][pMaxHealth]);
					SetPlayerArmour(playerid, 100);
				}
				else
				{
					//LogPlayerAction(playerid, "Healed to max health");
					SendClientMessage(playerid, COLOR_WHITE, "Can�n maksimum olacak �ekilde dolduruldu.");
					SetPlayerHealth(playerid, PlayerData[playerid][pMaxHealth]);
				}
			}
			else if(FactionData[PropertyData[id][PropertyFaction]][FactionMedPerms])
			{
				if(PlayerData[playerid][pMEDduty])
				{
					new idx;
					if(sscanf(params, "u", idx)) return SendUsageMessage(playerid, "/candoldur [oyuncu ID/isim]");
					if(playerid == idx) return SendErrorMessage(playerid, "Kendi can�n� dolduramazs�n.");
					if(!IsPlayerConnected(idx)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
					if(!pLoggedIn[idx]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
					if(!GetDistanceBetweenPlayers(playerid, idx, 4.5)) return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
					SendClientMessageEx(playerid, COLOR_EMT, "%s isimli oyuncunun can�n� 100 olacak �ekilde iyile�tirdin.", ReturnName(idx));
					SendClientMessageEx(idx, COLOR_EMT, "%s can�n� 100 olacak �ekilde iyile�tirdi.", ReturnName(playerid));
					SetPlayerHealth(idx, 100);
				}
				else SendClientMessage(playerid, COLOR_ADM, "Burada can dolduramazs�n.");
			}
			else
			{
				SetPlayerHealth(playerid, PlayerData[playerid][pMaxHealth]);
				SendClientMessage(playerid, COLOR_WHITE, "Can�n maksimum olacak �ekilde dolduruldu.");
				//LogPlayerAction(playerid, "Healed to max health");
			}
		}
		else
		{
			new data[e_furniture];
			for(new i, j = Streamer_GetUpperBound(STREAMER_TYPE_OBJECT); i < j; i++)
			{
			    if(!IsValidDynamicObject(i)) continue;
			   	if(!IsHouseRefrigerator(Streamer_GetIntData(STREAMER_TYPE_OBJECT, i, E_STREAMER_MODEL_ID))) continue;
			    if(!Streamer_IsInArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, 0)) continue;

			    Streamer_GetArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, data);
		    	if(IsPlayerInRangeOfPoint(playerid, 2.5, data[furnitureX], data[furnitureY], data[furnitureZ]))
				{
					// 	LogPlayerAction(playerid, "Healed to max health");
					SetPlayerHealth(playerid, PlayerData[playerid][pMaxHealth]);
					SendClientMessage(playerid, COLOR_WHITE, "Can�n maksimum olacak �ekilde dolduruldu.");
					SetPlayerChatBubble(playerid, sprintf("(( * %s can�n� maksimum olarak yeniledi. ))", ReturnName(playerid, 1)), COLOR_EMOTE, 20.0, 4000);
					return 1;
				}
			}

			SendClientMessage(playerid, COLOR_ADM, "Yak�n�nda buzdolab� yok.");
		}
	}
	else SendErrorMessage(playerid, "�u anda bunu yapamazs�n.");
	return 1;
}

CMD:uniforma(playerid, params[])
{
	if(IsMedicFaction(playerid))
	{
		if(PlayerData[playerid][pInsideEntrance] == -1)
			return SendErrorMessage(playerid, "Bu birlik komutunu kullanmak i�in birli�inize ait bir bina i�erisinde olmal�s�n�z.");

		if(PlayerData[playerid][pFaction] != EntranceData[PlayerData[playerid][pInsideEntrance]][EntranceFaction])
			return SendErrorMessage(playerid, "Bu bina senin birli�ine ait de�il.");

		Uniform_List(playerid);
		return 1;
	}

	if(IsPoliceFaction(playerid))
	{
		if(PlayerData[playerid][pInsideEntrance] == -1)
			return SendErrorMessage(playerid, "Bu birlik komutunu kullanmak i�in birli�inize ait bir bina i�erisinde olmal�s�n�z.");

		if(PlayerData[playerid][pFaction] != EntranceData[PlayerData[playerid][pInsideEntrance]][EntranceFaction])
			return SendErrorMessage(playerid, "Bu bina senin birli�ine ait de�il.");

		Uniform_List(playerid);
		return 1;
	}
	return 1;
}

CMD:fcarspawn(playerid, params[])
{
	if(!IsLAWFaction(playerid))
		return UnAuthMessage(playerid);

	if(!IsPlayerInAnyVehicle(playerid))
		return SendErrorMessage(playerid, "Herhangi bir ara� i�erisinde de�ilsin.");

	new vehicleid = GetPlayerVehicleID(playerid);
	if(IsValidFactionCar(vehicleid) && PlayerData[playerid][pFaction] != CarData[vehicleid][carFaction])
		return SendServerMessage(playerid, "Bu araca eri�imin yok.");

	if(!IsPlayerInRangeOfPoint(playerid, 5.0, CarData[vehicleid][carPos][0], CarData[vehicleid][carPos][1], CarData[vehicleid][carPos][2]))
	{
		PlayerData[playerid][pCarCheckpoint] = 1;
		SetPlayerCheckpoint(playerid, CarData[vehicleid][carPos][0], CarData[vehicleid][carPos][1], CarData[vehicleid][carPos][2], 3.0);
		SendClientMessage(playerid, COLOR_ADM, "�PUCU: Arac�n�n park yerinde olman gerekiyor.");
		SendClientMessage(playerid, COLOR_PINK, "SERVER: ��areti takip et.");
		return 1;
	}
	SetVehicleToRespawn(vehicleid);
	return 1;
}

CMD:radar(playerid, params[])
{

	if(!IsLAWFaction(playerid))
		return UnAuthMessage(playerid);

	/*if(!PlayerData[playerid][pLAWduty])
		return SendServerMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman�z gerekiyor.");*/

	new opt[24];
	new task[128];
	if(sscanf(params, "s[24]S()[128]", opt, task))
		return SendUsageMessage(playerid, "/radar [ac/kapat/hiz]");

	if(strmatch(opt, "ac"))
	{
		if(PlayerData[playerid][pRadar] == true)
			return SendErrorMessage(playerid, "Zaten radar�n�z aktif.");


		GetPlayerPos(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]);
		PlayerData[playerid][pRadarPos][0] = PlayerData[playerid][pPos][0];
		PlayerData[playerid][pRadarPos][1] = PlayerData[playerid][pPos][1];
		PlayerData[playerid][pRadarPos][2] = PlayerData[playerid][pPos][2];
		PlayerData[playerid][pRadar] = true;
		SetPlayerCheckpoint(playerid, PlayerData[playerid][pRadarPos][0], PlayerData[playerid][pRadarPos][1], PlayerData[playerid][pRadarPos][2], 2.5);
		SetPlayerRaceCheckpoint(playerid,1,PlayerData[playerid][pRadarPos][0], PlayerData[playerid][pRadarPos][1], PlayerData[playerid][pRadarPos][2],
								0.0,0.0,0.0,1.0);
		SendClientMessage(playerid, COLOR_ADM, "Radar {FFFFFF}aktif edildi.");
	}

	else if(strmatch(opt, "kapat"))
	{
		if(PlayerData[playerid][pRadar] == false)
			return SendErrorMessage(playerid, "Zaten radar�n�z kapal�.");

		PlayerData[playerid][pRadar] = false;
		DisablePlayerRaceCheckpoint(playerid);
		SendClientMessage(playerid, COLOR_ADM, "Radar {FFFFFF}in-aktif edildi.");
	}

	else if(strmatch(opt, "hiz"))
	{
		new speed;
		if(sscanf(task, "d", speed))
			return SendUsageMessage(playerid, "/radar hiz [H�z]");

		if(speed > 120 || speed < 25)
			return SendErrorMessage(playerid, "Girilen h�z de�eri minimum 25 ve maksimum 120 olabilir.");

		PlayerData[playerid][pRadarSpeed] = speed;
		SendServerMessage(playerid, "Radar h�z� %d KMH olarak ayarland�.", speed);
	}
	return 1;
}

CMD:tuniforma(playerid, params[])
{
	if(!IsPoliceFaction(playerid)) return UnAuthMessage(playerid);

	new
		Float:x,
		Float:y,
		Float:z;

	new engine, lights, alarm, doors, bonnet, boot, objective;

	if(!IsPlayerInAnyVehicle(playerid) && GetNearestVehicle(playerid) != INVALID_VEHICLE_ID)
	{
		GetVehicleBoot(GetNearestVehicle(playerid), x, y, z);
		new	vehicleid = GetNearestVehicle(playerid);

		if(!IsPlayerInRangeOfPoint(playerid, 2.5, x, y, z)) return SendServerMessage(playerid, "Arac�n bagaj�na yak�n de�ilsin.");

		if(IsValidFactionCar(vehicleid) && PlayerData[playerid][pFaction] != CarData[vehicleid][carFaction] && !FactionData[CarData[vehicleid][carFaction]][FactionCopPerms])
						return SendServerMessage(playerid, "Bu araca eri�imin yok.");

		if(CarData[vehicleid][carLocked])
			return SendServerMessage(playerid, "Bu ara� kilitli.");

		GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);

		TrunkUniform_List(playerid);
	}
	else SendErrorMessage(playerid, "Herhangi bir araca yak�n de�ilsin.");
	return 1;
}

/*CMD:mdc(playerid, params[])
{
	if(!IsPoliceFaction(playerid)) return UnAuthMessage(playerid);
	if(!IsPlayerInAnyVehicle(playerid)) return SendErrorMessage(playerid, "Herhangi bir ara� i�erisinde de�ilsin.");
	if(GetPlayerVehicleSeat(playerid) > 1) return SendErrorMessage(playerid, "Arka koltukta MDC kullanamazs�n.");

	new vehicleid = GetPlayerVehicleID(playerid);
	if(CarData[vehicleid][carFaction] == -1) return SendErrorMessage(playerid, "Herhangi bir birlik arac� i�erisinde de�ilsin.");
	if(!FactionData[CarData[vehicleid][carFaction]][FactionCopPerms]) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bu ara�ta MDC kullanamazs�n.");

	//MDC_Toggle(playerid, GetPVarInt(playerid, "Viewing_MDC") == 1 ? false : true);
	ShowPlayerMDC(playerid);
	return 1;
}*/

CMD:tedaviet(playerid, params[])
{
	if(!IsMedicFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pMEDduty]) return SendErrorMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");

	new
		playerb,
		str[128];

	if(sscanf(params, "u", playerb)) return SendClientMessage(playerid, COLOR_GREY, "KULLANIM: /tedaviet [oyuncuID/isim]");
	if(!IsPlayerConnected(playerb)) return SendClientMessage(playerid, COLOR_GREY, "HATA: Girdi�in oyuncu ID veya isim aktif de�il.");
	if(playerb == playerid) return SendClientMessage(playerid, COLOR_GREY, "HATA: Kendi kendini iyile�tiremezsin.");
	if(!GetDistanceBetweenPlayers(playerid, playerb, 6.0)) return SendClientMessage(playerid, COLOR_GREY, "SERVER: Bu ki�iye yak�n de�ilsin..");
	if(GetPlayerTeam(playerb) != STATE_WOUNDED) return SendClientMessage(playerid, COLOR_GREY, "SERVER: Ki�inin yaral� olmas� gerek.");

	PlayerData[playerb][pBrutallyWounded] = 0;

	SetPlayerTeam(playerb, STATE_ALIVE);
	SetPlayerHealth(playerb, 50);

	format(str, sizeof(str), "** HQ: %s %s, %s �st�nde operasyonunu bitirdi! **", Player_GetFactionRank(playerid), ReturnName(playerid, 0), ReturnName(playerb));
	SendFDMessage(COLOR_EMT, str);

	format(str, sizeof(str), "%s revived %s with \"/tedaviet\".", ReturnName(playerid), ReturnName(playerb));
	adminWarn(1, str);

	SendClientMessageEx(playerid, COLOR_EMT, "SERVER: %s �zerinde operasyonunu bitirdin.", ReturnName(playerb, 0));
	SendClientMessageEx(playerb, COLOR_EMT, "SERVER: %s taraf�ndan iyile�tirildin.", ReturnName(playerid, 0));
	return 1;
}

CMD:ates(playerid, params[])
{
	if(!IsMedicFaction(playerid)) return UnAuthMessage(playerid);
	if(!PlayerData[playerid][pMEDduty]) return SendErrorMessage(playerid, "Bu komutu kullanmak i�in i�ba��nda olman gerekiyor.");

    Fire_RouteCommands(playerid, params);
	return 1;
}

CMD:yayin(playerid, params[])
{
	if(!IsNewsFaction(playerid)) return UnAuthMessage(playerid);

	static type[24], string[128];
	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/yayin [parametre]");
	    SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}baslat, bitir, davet, cikar");
		return 1;
	}

	if(!strcmp(type, "baslat", true))
	{
		if(PlayerData[playerid][pLiveBroadcast] != INVALID_PLAYER_ID) return SendErrorMessage(playerid, "Zaten canl� yay�n� ba�latm��s�n.");
		SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Canl� yay�na ba�lad�n�z, s�yleyeceklerinizi dinleyenleriniz duyacakt�r.");
		PlayerData[playerid][pLiveBroadcast] = playerid;
		return 1;
	}
	else if (!strcmp(type, "bitir", true))
	{
		if(PlayerData[playerid][pLiveBroadcast] == INVALID_PLAYER_ID) return SendErrorMessage(playerid, "Zaten canl� yay�n� bitirmi�sin.");
		SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Canl� yay�n� bitirdiniz, art�k s�yleyeceklerinizi duymayacaklard�r.");
		PlayerData[playerid][pLiveBroadcast] = INVALID_PLAYER_ID;

		foreach(new i : Player) if(PlayerData[i][pLiveBroadcast] == playerid)
		{
			SendClientMessage(i, COLOR_YELLOW, "SERVER: Canl� yay�n� sona erdi, art�k s�yleyeceklerinizi duymayacaklard�r.");
			PlayerData[i][pLiveBroadcast] = INVALID_PLAYER_ID;
		}
		return 1;
 	}
 	else if (!strcmp(type, "davet", true))
	{
		if(PlayerData[playerid][pLiveBroadcast] == INVALID_PLAYER_ID) return SendErrorMessage(playerid, "Canl� yay�na ba�lamadan bu komutu kullanamazs�n.");

		static id;
		if (sscanf(string, "u", id)) return SendUsageMessage(playerid, "/yayin davet [oyuncu ID/ad�]");
		if(playerid == id) return SendErrorMessage(playerid, "Bu komutu kendi �st�nde kullanamazs�n.");
		if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
		if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
		if(!GetDistanceBetweenPlayers(playerid, id, 4.5)) return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
		if(PlayerData[id][pLiveBroadcast] != INVALID_PLAYER_ID) return SendErrorMessage(playerid, "Belirtti�in ki�i zaten canl� yay�nda g�z�k�yor.");
		if(PlayerData[id][pLiveOffer] != INVALID_PLAYER_ID) return SendErrorMessage(playerid, "Belirtti�in ki�iye ba�ka birisi davet g�ndermi�.");
		if(PlayerData[id][pLiveOffer] == playerid) return SendErrorMessage(playerid, "Belirtti�in ki�inin davetini kabul etmesini bekle.");

		SendClientMessageEx(playerid, COLOR_GREY, "SERVER: %s isimli ki�iyi canl� yay�na davet ettiniz.", ReturnName(id));
		SendClientMessageEx(id, COLOR_GREY, "SERVER: %s seni canl� yay�na davet etti. /kabul yayin %i yazarak yay�na kat�labilirsin.", ReturnName(playerid), playerid);
		PlayerData[id][pLiveOffer] = playerid;
		return 1;
 	}
 	else if (!strcmp(type, "cikar", true))
	{
		if(PlayerData[playerid][pLiveBroadcast] == INVALID_PLAYER_ID) return SendErrorMessage(playerid, "Canl� yay�na ba�lamadan bu komutu kullanamazs�n.");
		if(PlayerData[playerid][pLiveBroadcast] != playerid) return SendErrorMessage(playerid, "Bu komutu sadece yay�n� ba�latan ki�i kullanabilir.");

		static id;
		if (sscanf(string, "u", id)) return SendUsageMessage(playerid, "/yayin cikar [oyuncu ID/ad�]");
		if(playerid == id) return SendErrorMessage(playerid, "Bu komutu kendi �st�nde kullanamazs�n.");
		if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
		if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
		if(!GetDistanceBetweenPlayers(playerid, id, 4.5)) return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
		if(PlayerData[id][pLiveBroadcast] == INVALID_PLAYER_ID) return SendErrorMessage(playerid, "Belirtti�in ki�i zaten canl� yay�nda g�z�km�yor.");

		SendClientMessageEx(playerid, COLOR_GREY, "SERVER: %s isimli ki�iyi canl� yay�ndan ��kard�n�z.", ReturnName(id));
		SendClientMessageEx(id, COLOR_YELLOW, "SERVER: %s taraf�ndan canl� yay�ndan ��kar�ld�n�z, art�k s�yleyeceklerinizi duymayacaklard�r.", ReturnName(playerid));
		PlayerData[id][pLiveBroadcast] = INVALID_PLAYER_ID;
		return 1;
 	}
 	return 1;
}

CMD:meslek(playerid, params[])
{
	new type[15], interval;
	if (sscanf(params, "s[15]I(-1)", type, interval))
	{
		SendUsageMessage(playerid, "/meslek [meslek adi]");
		SendClientMessage(playerid, COLOR_GREY, "Tipler: mekanik, kamyoncu");
		SendClientMessage(playerid, COLOR_GREY, "Ekstra: yardim, anacikis, yancikis, degistir");
		return 1;
	}

	if (!strcmp(type, "yardim", true))
	{
		if(IsPoliceFaction(playerid) || IsMedicFaction(playerid) || IsLAWFaction(playerid))
			return SendErrorMessage(playerid, "Birli�iniz i�in bu komut devred��� b�rak�lm��t�r.");

		if (!PlayerData[playerid][pJob]) return SendErrorMessage(playerid, "Herhangi bir ana mesle�in bulunmuyor.");

		if (PlayerData[playerid][pJob])
		{
			switch (PlayerData[playerid][pJob])
			{
				case MECHANIC_JOB:
				{
					SendClientMessageEx(playerid, COLOR_ADM, "%s Komutlar�:", ReturnJobName(PlayerData[playerid][pJob]));
					SendClientMessage(playerid, COLOR_WHITE, "/parcaal /parcadurum /aracitamiret /araciboya");
					SendClientMessage(playerid, COLOR_WHITE, "/renkler /aracicek /aracidoldur");
				}
				case TAXI_JOB:
				{
					SendClientMessageEx(playerid, COLOR_ADM, "%s Komutlar�:", ReturnJobName(PlayerData[playerid][pJob]));
					SendClientMessage(playerid, COLOR_WHITE, "/taksi [kabul / isbasi / tarife / basla / bitir]");
				}
				case TRUCKER_JOB:
				{
					SendClientMessageEx(playerid, COLOR_ADM, "%s Komutlar�:", Player_GetTruckerRank(playerid));
					SendClientMessage(playerid, COLOR_WHITE, "Ayarlanmam��, geli�tiriciye bildirin.");
					SendClientMessage(playerid, COLOR_WHITE, "Forumdaki d�k�manlar� okuyun.");
					SendClientMessage(playerid, COLOR_WHITE, "Sunucu Bilgileri -> Sistem Tan�t�mlar� -> Trucker Sistemi");
					SendClientMessage(playerid, COLOR_WHITE, "(https://forum.lss-roleplay.com/viewtopic.php?f=10&t=185)");
					SendClientMessage(playerid, COLOR_WHITE, "Bu i�i yapabilmek i�in pikap, kamyonet veya t�ra ihtiyac�n var.");
					SendClientMessage(playerid, COLOR_WHITE, "T�m aksiyonlar i�in {FFFF00}/kargo {FFFFFF}komutunu kullan�n.");
					SendClientMessage(playerid, COLOR_WHITE, "T�m kargo noktalar� i�in {FFFF00}/tpda {FFFFFF}komutunu kullan�n.");
					SendClientMessage(playerid, COLOR_WHITE, "T�m kargo noktalar� i�in {FFFF00}/endustri {FFFFFF}komutunu kullan�n.");
					SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Bu meslekte %i saat ge�irmi�sin.", PlayerData[playerid][pJobTime]);
				}
			}
		}

		if (PlayerData[playerid][pSideJob])
		{
			if(IsPoliceFaction(playerid) || IsMedicFaction(playerid) || IsLAWFaction(playerid))
				return SendErrorMessage(playerid, "Birli�iniz i�in bu komut devred��� b�rak�lm��t�r.");

			switch (PlayerData[playerid][pSideJob])
			{
				case MECHANIC_JOB:
				{
					SendClientMessageEx(playerid, COLOR_ADM, "%s Komutlar�: [Yan Meslek]", ReturnJobName(PlayerData[playerid][pSideJob]));
					SendClientMessage(playerid, COLOR_WHITE, "/parcaal /parcadurum /aracitamiret /araciboya");
					SendClientMessage(playerid, COLOR_WHITE, "/renkler /aracicek /aracidoldur");
				}
				case TAXI_JOB:
				{
					SendClientMessageEx(playerid, COLOR_ADM, "%s Komutlar�: [Yan Meslek]", ReturnJobName(PlayerData[playerid][pSideJob]));
					SendClientMessage(playerid, COLOR_WHITE, "/taksi [kabul / isbasi / tarife / basla / bitir]");
				}
				case TRUCKER_JOB:
				{
					SendClientMessageEx(playerid, COLOR_ADM, "%s Komutlar�: [Yan Meslek]", Player_GetTruckerRank(playerid));
					SendClientMessage(playerid, COLOR_WHITE, "Ayarlanmam��, geli�tiriciye bildirin.");
					SendClientMessage(playerid, COLOR_WHITE, "Forumdaki d�k�manlar� okuyun.");
					SendClientMessage(playerid, COLOR_WHITE, "Sunucu Bilgileri -> Sistem Tan�t�mlar� -> Trucker Sistemi");
					SendClientMessage(playerid, COLOR_WHITE, "(https://forum.lss-roleplay.com/viewtopic.php?f=10&t=185)");
					SendClientMessage(playerid, COLOR_WHITE, "Bu i�i yapabilmek i�in pikap, kamyonet veya t�ra ihtiyac�n var.");
					SendClientMessage(playerid, COLOR_WHITE, "T�m aksiyonlar i�in {FFFF00}/kargo {FFFFFF}komutunu kullan�n.");
					SendClientMessage(playerid, COLOR_WHITE, "T�m kargo noktalar� i�in {FFFF00}/tpda {FFFFFF}komutunu kullan�n.");
					SendClientMessage(playerid, COLOR_WHITE, "T�m kargo noktalar� i�in {FFFF00}/endustri {FFFFFF}komutunu kullan�n.");
					SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Bu meslekte %i saat ge�irmi�sin.", PlayerData[playerid][pSideJobLevel]);
				}
			}
		}
	}
	else if (!strcmp(type, "degistir", true))
	{
		if(IsPoliceFaction(playerid) || IsMedicFaction(playerid) || IsLAWFaction(playerid))
			return SendErrorMessage(playerid, "Birli�iniz i�in bu komut devred��� b�rak�lm��t�r.");

		if(interval == -1) return SendUsageMessage(playerid, "/meslek degistir [(1)yanmeslek / (2)anameslek]");
		if(interval < 1 || interval > 2) return SendErrorMessage(playerid, "Hatal� meslek tipi girdin, ipucu ba��ndaki say�y� yaz.");

		switch (interval)
		{
			case 1:
			{
				if(PlayerData[playerid][pSideJob]) return SendErrorMessage(playerid, "Zaten yan mesle�indesin.");

				PlayerData[playerid][pSideJob] = PlayerData[playerid][pJob];
				PlayerData[playerid][pJob] = 0;

				SendInfoMessage(playerid, "Yan mesle�ine ge�i� yapt�n!");
				return 1;
			}
			case 2:
			{
				if(PlayerData[playerid][pJob]) return SendErrorMessage(playerid, "Zaten ana mesle�indesin.");

				PlayerData[playerid][pJob] = PlayerData[playerid][pSideJob];
				PlayerData[playerid][pSideJob] = 0;

				SendInfoMessage(playerid, "Ana mesle�ine ge�i� yapt�n!");
				return 1;
			}
		}

	}
	else if (!strcmp(type, "mekanik", true))
	{
		if(IsPoliceFaction(playerid) || IsMedicFaction(playerid) || IsLAWFaction(playerid))
			return SendErrorMessage(playerid, "Birli�iniz i�in bu komut devred��� b�rak�lm��t�r.");

		if(PlayerData[playerid][pDrivingTest]) return SendServerMessage(playerid, "Ehliyet s�nav�ndayken bu komutu kullanamazs�n.");
		if(PlayerData[playerid][pTaxiDrivingTest]) return SendServerMessage(playerid, "Taksi s�nav�ndayken bu komutu kullanamazs�n.");
	    if(PlayerData[playerid][pJob]) return SendErrorMessage(playerid, "Herhangi bir mesle�in bulunuyor, ilk olarak meslekten ��kmay� dene.");

	    if(!IsPlayerInRangeOfPoint(playerid, MECHANIC_POS_RANGE, MECHANIC_POS_X, MECHANIC_POS_Y, MECHANIC_POS_Z))
	    {
     		SetPlayerCheckpoint(playerid, MECHANIC_POS_X, MECHANIC_POS_Y, MECHANIC_POS_Z, MECHANIC_POS_RANGE);
	 	   	return SendErrorMessage(playerid, "Ara� tamircisi mesle�i noktas�nda de�ilsiniz.");
		}

		PlayerData[playerid][pJob] = MECHANIC_JOB;
		InfoTD_MSG(playerid, 1, 3000, sprintf("TEBRIKLER!~n~%s MESLEGINE GIRDINIZ.~n~/meslek yardim", ReturnJobNameTXD(PlayerData[playerid][pJob])));
    }
    else if (!strcmp(type, "kamyoncu", true))
	{
		if(IsPoliceFaction(playerid) || IsMedicFaction(playerid) || IsLAWFaction(playerid))
			return SendErrorMessage(playerid, "Birli�iniz i�in bu komut devred��� b�rak�lm��t�r.");

		if(PlayerData[playerid][pDrivingTest]) return SendServerMessage(playerid, "Ehliyet s�nav�ndayken bu komutu kullanamazs�n.");
		if(PlayerData[playerid][pTaxiDrivingTest]) return SendServerMessage(playerid, "Taksi s�nav�ndayken bu komutu kullanamazs�n.");
	    if(PlayerData[playerid][pJob]) return SendErrorMessage(playerid, "Herhangi bir mesle�in bulunuyor, ilk olarak meslekten ��kmay� dene.");

	    if(!IsPlayerInRangeOfPoint(playerid, 3.0, 2676.0427, -2539.7114, 13.4232))
	    {
     		SetPlayerCheckpoint(playerid, 2676.0427, -2539.7114, 13.4232, 3.0);
	 	   	return SendInfoMessage(playerid, "Kamyoncu mesle�i noktas�nda haritada i�aretlendi.");
		}

		PlayerData[playerid][pJob] = TRUCKER_JOB;
		InfoTD_MSG(playerid, 1, 3000, sprintf("TEBRIKLER!~n~%s MESLEGINE GIRDINIZ.~n~/meslek yardim", ReturnJobNameTXD(PlayerData[playerid][pJob])));
    }
    else if (!strcmp(type, "anacikis", true))
	{
		if(!PlayerData[playerid][pJob]) return SendServerMessage(playerid, "Herhangi bir mesle�in bulunmuyor.");
		if(PlayerData[playerid][pJobTime] < 4) return SendServerMessage(playerid, "Mesle�ini b�rakabilmek i�in en az 4 saat ge�irmen gerekiyor.");

		PlayerData[playerid][pJob] = 0;
		PlayerData[playerid][pJobTime] = 0;
		PlayerData[playerid][pJobLevel] = 0;
		SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}%s mesle�ini b�rakt�n�z.", ReturnJobName(PlayerData[playerid][pJob]));
		return 1;
	}
 	else if (!strcmp(type, "yancikis", true))
	{
		if(!PlayerData[playerid][pSideJob]) return SendErrorMessage(playerid, "Herhangi bir yan mesle�in bulunmuyor.");
		if(PlayerData[playerid][pSideJobTime] < 4) return SendServerMessage(playerid, "Mesle�ini b�rakabilmek i�in en az 4 saat ge�irmen gerekiyor.");

		PlayerData[playerid][pSideJob] = 0;
		PlayerData[playerid][pSideJobTime] = 0;
		PlayerData[playerid][pSideJobLevel] = 0;
		SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}%s mesle�ini b�rakt�n�z.", ReturnJobName(PlayerData[playerid][pSideJob]));
		return 1;
	}
    return 1;
}

CMD:araciboya(playerid, params[])
{
	if(PlayerData[playerid][pSideJob] != MECHANIC_JOB && PlayerData[playerid][pJob] != MECHANIC_JOB) return SendErrorMessage(playerid, "Mekanik de�ilsin.");
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendErrorMessage(playerid, "�ekicinin �of�r koltu�unda olman gerekiyor.");

	new vehicleid = GetPlayerVehicleID(playerid);
	if(GetVehicleModel(vehicleid) != 525) return SendErrorMessage(playerid, "�ekici i�erisinde olman gerekiyor.");
   	if(PlayerData[playerid][pComponents] < 7) return SendErrorMessage(playerid, "��lem yapabilmek i�in en az 7 tamir par�an olmas� gerekiyor.");

   	new id, color1, color2;
	if(sscanf(params, "uii", id, color1, color2)) return SendUsageMessage(playerid, "/araciboya [oyuncu ID/isim] [renk1] [renk2]");
	if(id == playerid) return SendErrorMessage(playerid, "Bu komutu kendi �zerinde kullanamazs�n.");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
	if(!GetDistanceBetweenPlayers(playerid, id, 8.0)) return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
	if(GetPlayerState(id) != PLAYER_STATE_DRIVER) return SendErrorMessage(playerid, "Belirtti�in ki�i �of�r koltu�unda de�il.");
	new elsevehicle = GetPlayerVehicleID(id);
	if(!IsValidPlayerCar(elsevehicle)) return SendErrorMessage(playerid, "Belirtti�in ki�inin arac�na i�lem yap�lamaz.");
	if(color1 < 0 || color1 > 255) return SendErrorMessage(playerid, "1. renk kodu 0 ile 255 aras�nda olmal�.");
	if(color2 < 0 || color2 > 255) return SendErrorMessage(playerid, "2. renk kodu 0 ile 255 aras�nda olmal�.");
	SetPVarInt(playerid, "Mechanic_Color1", color1);
	SetPVarInt(playerid, "Mechanic_Color2", color2);
	SendOffer(playerid, id, 0);
	return 1;
}

CMD:aracidoldur(playerid, params[])
{
	if(PlayerData[playerid][pSideJob] != MECHANIC_JOB && PlayerData[playerid][pJob] != MECHANIC_JOB) return SendErrorMessage(playerid, "Mekanik de�ilsin.");
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendErrorMessage(playerid, "�ekicinin �of�r koltu�unda olman gerekiyor.");

	new vehicleid = GetPlayerVehicleID(playerid);
	if(GetVehicleModel(vehicleid) != 525) return SendErrorMessage(playerid, "�ekici i�erisinde olman gerekiyor.");
   	if(PlayerData[playerid][pComponents] < 12) return SendErrorMessage(playerid, "��lem yapabilmek i�in en az 12 tamir par�an olmas� gerekiyor.");

	new id;
	if(sscanf(params, "u", id)) return SendUsageMessage(playerid, "/aracidoldur [oyuncu ID/isim]");
	if(id == playerid) return SendErrorMessage(playerid, "Bu komutu kendi �zerinde kullanamazs�n.");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
	if(!GetDistanceBetweenPlayers(playerid, id, 8.0)) return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
	if(GetPlayerState(id) != PLAYER_STATE_DRIVER) return SendErrorMessage(playerid, "Belirtti�in ki�i �of�r koltu�unda de�il.");
	new elsevehicle = GetPlayerVehicleID(id);
	if(!IsValidPlayerCar(elsevehicle)) return SendErrorMessage(playerid, "Belirtti�in ki�inin arac�na i�lem yap�lamaz.");
	SendOffer(playerid, id, 5);
	return 1;
}

CMD:aracicek(playerid, params[])
{
	if(PlayerData[playerid][pSideJob] != MECHANIC_JOB && PlayerData[playerid][pJob] != MECHANIC_JOB && !IsPoliceFaction(playerid)) return SendErrorMessage(playerid, "Mekanik de�ilsin.");
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendErrorMessage(playerid, "�ekicinin �of�r koltu�unda olman gerekiyor.");

	new vehicleid = GetPlayerVehicleID(playerid);
	if(GetVehicleModel(vehicleid) != 525) return SendErrorMessage(playerid, "�ekici i�erisinde olman gerekiyor.");

	new id;
	if(sscanf(params, "u", id)) return SendUsageMessage(playerid, "/aracicek [oyuncu ID/isim]");
	if(id == playerid) return SendErrorMessage(playerid, "Bu komutu kendi �zerinde kullanamazs�n.");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
	if(!GetDistanceBetweenPlayers(playerid, id, 8.0)) return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
	if(GetPlayerState(id) == PLAYER_STATE_DRIVER) return SendErrorMessage(playerid, "Belirtti�in ki�i �of�r koltu�unda oturuyor, yan koltu�a ge�meli.");

	new elsevehicle = GetPlayerVehicleID(id);
	if(elsevehicle == INVALID_VEHICLE_ID) return SendErrorMessage(playerid, "Belirtti�in ki�inin arac� yak�n�nda yok.");
	if(!IsValidPlayerCar(elsevehicle)) return SendErrorMessage(playerid, "Belirtti�in ki�inin arac�na i�lem yap�lamaz.");
	if(IsTrailerAttachedToVehicle(elsevehicle)) return SendErrorMessage(playerid, "Belirtti�in ki�inin arac� ba�kas� taraf�nda �ekiliyor.");
	if(IsHelicopter(elsevehicle) || NoEngineCar(elsevehicle)) return SendErrorMessage(playerid, "Belirtti�in ki�inin arac� �ekilemeyecek t�rden g�z�k�yor.");
	SendOffer(playerid, id, 6);
	return 1;
}

CMD:aracitamiret(playerid, params[])
{
	if(PlayerData[playerid][pSideJob] != MECHANIC_JOB && PlayerData[playerid][pJob] != MECHANIC_JOB) return SendErrorMessage(playerid, "Mekanik de�ilsin.");
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendErrorMessage(playerid, "�ekicinin �of�r koltu�unda olman gerekiyor.");

	new vehicleid = GetPlayerVehicleID(playerid);
	if(GetVehicleModel(vehicleid) != 525) return SendErrorMessage(playerid, "�ekici i�erisinde olman gerekiyor.");
   	if(PlayerData[playerid][pComponents] < 20) return SendErrorMessage(playerid, "��lem yapabilmek i�in en az 20 tamir par�an olmas� gerekiyor.");

	new id, type;
	if(sscanf(params, "ui", id, type))
	{
		SendUsageMessage(playerid, "/aracitamiret [oyuncu ID/isim] [tip]");
		SendClientMessage(playerid, -1, "{C0C0C0}Tip 1: {FFFFFF}Kaporta Tamiri");
		SendClientMessage(playerid, -1, "{C0C0C0}Tip 2: {FFFFFF}Ara� Tamiri");
		SendClientMessage(playerid, -1, "{C0C0C0}Tip 3: {FFFFFF}Motor Tamiri");
		SendClientMessage(playerid, -1, "{C0C0C0}Tip 4: {FFFFFF}Batarya Tamiri");
		return 1;
	}

	if(id == playerid) return SendErrorMessage(playerid, "Bu komutu kendi �zerinde kullanamazs�n.");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
	if(!GetDistanceBetweenPlayers(playerid, id, 8.0)) return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
	if(GetPlayerState(id) != PLAYER_STATE_DRIVER) return SendErrorMessage(playerid, "Belirtti�in ki�i �of�r koltu�unda de�il.");

	new elsevehicle = GetPlayerVehicleID(id);
	if(!IsValidPlayerCar(elsevehicle)) return SendErrorMessage(playerid, "Belirtti�in ki�inin arac�na i�lem yap�lamaz.");
	if(type < 1 || type > 4) return SendErrorMessage(playerid, "Tamir tipi 1 ile 4 aras�nda olmal�.");
	SendOffer(playerid, id, type);
	return 1;
}

CMD:parcadurum(playerid, params[])
{
	if(PlayerData[playerid][pSideJob] != MECHANIC_JOB && PlayerData[playerid][pJob] != MECHANIC_JOB) return SendErrorMessage(playerid, "Mekanik de�ilsin.");
    SendInfoMessage(playerid, "%i tane tamir par�an var.", PlayerData[playerid][pComponents]);
    return 1;
}

CMD:parcaal(playerid, params[])
{
	if(PlayerData[playerid][pDrivingTest]) return SendServerMessage(playerid, "Ehliyet s�nav�ndayken bu komutu kullanamazs�n.");
	if(PlayerData[playerid][pSideJob] != MECHANIC_JOB && PlayerData[playerid][pJob] != MECHANIC_JOB) return SendErrorMessage(playerid, "Mekanik de�ilsin.");

    if(!IsPlayerInRangeOfPoint(playerid, MECHANIC_COMP_POS_RANGE, MECHANIC_COMP_POS_X, MECHANIC_COMP_POS_Y, MECHANIC_COMP_POS_Z))
    {
 		SetPlayerCheckpoint(playerid, MECHANIC_COMP_POS_X, MECHANIC_COMP_POS_Y, MECHANIC_COMP_POS_Z, MECHANIC_COMP_POS_RANGE);
 	   	return SendErrorMessage(playerid, "Par�a sat�n alma noktas� i�aretlendi.");
	}

	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendErrorMessage(playerid, "�ekicinin �of�r koltu�unda olman gerekiyor.");

	new vehicleid = GetPlayerVehicleID(playerid);
	if(GetVehicleModel(vehicleid) != 525) return SendErrorMessage(playerid, "�ekici i�erisinde olman gerekiyor.");
   	if(PlayerData[playerid][pComponents] >= 2000) return SendErrorMessage(playerid, "En fazla 2000 tane tamir par�as�na sahip olabilirsin.");

	new amount;
	if (sscanf(params, "i", amount)) return SendUsageMessage(playerid, "/parcaal [miktar(1 par�a = $30)]");
	if(amount < 0 || amount > 50) return SendErrorMessage(playerid, "Girilen par�a miktar� 1 ile 50 aras�nda olabilir.");
	if(amount+PlayerData[playerid][pComponents] > 2000) return SendErrorMessage(playerid, "2000 par�a limitini ge�iyorsun.");
	if(PlayerData[playerid][pMoney] < (MECHANIC_COMP_PRICE * amount)) return SendErrorMessage(playerid, "Girilen par�a miktar�n� alacak kadar paran�z bulunmuyor.");

    InfoTD_MSG(playerid, 2, 5000, sprintf("~w~%i~r~_ADET_TAMIR_PARCASI_SATIN_ALDIN.", amount));
    GiveMoney(playerid, -(MECHANIC_COMP_PRICE * amount));
    PlayerData[playerid][pComponents] += amount;
    return 1;
}

CMD:tpda(playerid, params[])
{
	if(PlayerData[playerid][pSideJob] != TRUCKER_JOB && PlayerData[playerid][pJob] != TRUCKER_JOB)
		return SendClientMessage(playerid, COLOR_ADM, "SERVER: Kamyon �of�r� de�ilsin.");

 	if(!IsPlayerInAnyVehicle(playerid)) return SendServerMessage(playerid, "Herhangi bir ara�ta de�ilsin.");
	Dialog_Show(playerid, PDA_MAIN, DIALOG_STYLE_LIST, "Trucker PDA", "{FFFFFF}T�m fabrikalar� {AFAFAF}g�ster\n{FFFFFF}Kargo kabul eden i�yerlerini {AFAFAF}g�ster\n{FFFFFF}Gemi bilgisini {AFAFAF}g�ster", "Se�", "Kapat");
	return 1;
}

CMD:endustri(playerid, params[])
{
	if(PlayerData[playerid][pSideJob] != TRUCKER_JOB && PlayerData[playerid][pJob] != TRUCKER_JOB)
		return SendClientMessage(playerid, COLOR_ADM, "SERVER: Kamyon �of�r� de�ilsin.");

	new id = -1;
	if((id = Industry_Nearest(playerid, 10.0)) == -1)
		return SendErrorMessage(playerid, "Yak�n�nda end�stri yok.");

    Industry_Show(playerid, id);
	return 1;
}

CMD:trailer(playerid, params[])
{
	if(PlayerData[playerid][pSideJob] != TRUCKER_JOB && PlayerData[playerid][pJob] != TRUCKER_JOB)
		return SendClientMessage(playerid, COLOR_ADM, "SERVER: Kamyon �of�r� de�ilsin.");

    if(!IsPlayerInAnyVehicle(playerid))
		return 1;

    new vehicle = GetPlayerVehicleID(playerid),
   		trailerid = GetVehicleTrailer(vehicle);

    if(!IsTruckCar(vehicle))
        return 1;

    if(trailerid == 0)
    	return SendErrorMessage(playerid, "Arac�na ba�l� trailer yok.");

	new parametrs[10];
	if(sscanf(params, "s[10]", parametrs))
	{
		SendClientMessage(playerid, COLOR_YELLOW, "/trailer kilit{FFFFFF} - Traileri kilitler.");
		SendClientMessage(playerid, COLOR_YELLOW, "/trailer coz{FFFFFF} - Trailer ba�lant�s� kopar�r.");
		SendClientMessage(playerid, COLOR_YELLOW, "/trailer isik{FFFFFF} - Trailer�n ���klar�n� a�ar.");
		SendClientMessage(playerid, COLOR_YELLOW, "/trailer liste{FFFFFF} - Trailerdaki kargolar� g�sterir.");
		return 1;
	}

	if(!strcmp(parametrs, "liste", true) || !strcmp(parametrs, "kargo", true))
	{
		new title[52],
	        msg[512] = "{9ACD32}�r�n\t{9ACD32}Adet",
         	count;

	    format(title, sizeof(title), "Trailer (Kapasite: %i)", GetMaxCargoVehicle(trailerid));

		for(new i; i != MAX_TRUCK_PRODUCT; i++)
		{
		    if(CarData[trailerid][carCargoAmount][i] == 0)
		        continue;

			format(msg, sizeof(msg), "%s\n%s\t%i %s.", msg, TruckerData_product[i], CarData[trailerid][carCargoAmount][i], Trucker_GetType(i));
			count++;
		}

		if(!count)
		    return SendErrorMessage(playerid, "Bu trailerda hi� kargo yok.");

		Dialog_Show(playerid, DIALOG_NONE, DIALOG_STYLE_TABLIST_HEADERS, title, msg, "Kapat", "");
	    return 1;
	}
	else if(!strcmp(parametrs, "coz", true))
	{
	    if(GetVehicleSpeed(vehicle) > 3)
	        return SendErrorMessage(playerid, "Hareket halinde traileri ��zemezsin.");

        DetachTrailerFromVehicle(vehicle);
	    return 1;
	}
	else if(!strcmp(parametrs, "isik", true))
	{
		if(CarLights[trailerid])
		{
			CarLights[trailerid] = false;
			ToggleVehicleLights(trailerid, false);
			GameTextForPlayer(playerid, "~w~TRAILER ISIKLARI ~r~KAPANDI", 2500, 4);
		}
		else
		{
			CarLights[trailerid] = true;
			ToggleVehicleLights(trailerid, true);
			GameTextForPlayer(playerid, "~w~TRAILER ISIKLARI ~g~ACILDI", 2500, 4);
		}
	    return 1;
	}
	else if(!strcmp(parametrs, "kilit", true))
	{
		if(!CarData[trailerid][carLocked])
		{
			ToggleVehicleLock(trailerid, true);
			CarData[trailerid][carLocked] = true;
			GameTextForPlayer(playerid, sprintf("~r~%s KILITLENDI", ReturnVehicleName(trailerid)), 2000, 4);
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		}
		else
		{
			ToggleVehicleLock(trailerid, false);
			CarData[trailerid][carLocked] = false;
			GameTextForPlayer(playerid, sprintf("~g~%s ACILDI", ReturnVehicleName(trailerid)), 2000, 4);
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		}
	    return 1;
	}
	return 1;
}

CMD:kargo(playerid, params[])
{
	if(PlayerData[playerid][pSideJob] != TRUCKER_JOB && PlayerData[playerid][pJob] != TRUCKER_JOB)
		return SendClientMessage(playerid, COLOR_ADM, "SERVER: Kamyon �of�r� de�ilsin.");

	new parametrs[10], arg[4];
	if(sscanf(params, "s[10]S()[4]", parametrs, arg))
	{
		SendClientMessage(playerid, COLOR_YELLOW, "/kargo liste{FFFFFF} - Ara�taki t�m kargolar� g�sterir.");
		SendClientMessage(playerid, COLOR_YELLOW, "/kargo yerlestir{FFFFFF} - Elinizdeki kargoyu araca koyar.");
		SendClientMessage(playerid, COLOR_YELLOW, "/kargo fork{FFFFFF} - Yak�ndaki ara�tan forklifte kargo al�r.");
		SendClientMessage(playerid, COLOR_YELLOW, "/kargo koy{FFFFFF} - Elinizdeki kargoyu yere koyar.");
		SendClientMessage(playerid, COLOR_YELLOW, "/kargo al{FFFFFF} - Yerdeki kargoyu elinize al�r.");
		SendClientMessage(playerid, COLOR_YELLOW, "/kargo satinal{FFFFFF} - Kargo sat�n al�r.");
		SendClientMessage(playerid, COLOR_YELLOW, "/kargo sat{FFFFFF} - Kargo satar.");
		return 1;
	}

	if(!strcmp(parametrs, "liste", true))
	{
	    new vehicle = GetPlayerVehicleID(playerid);
		if(vehicle == 0 && (vehicle = GetNearBootVehicle(playerid)) == 0)
	    	return SendErrorMessage(playerid, "Yak�n�nda ara�/trailer yok.");

        if(IsTruckCar(vehicle))
			return SendErrorMessage(playerid, "Trailer y�klenmi� kargolar� listelemek i�in /trailer liste yazmal�s�n.");

		if(!IsTruckerJob(vehicle))
		    return SendErrorMessage(playerid, "Bu ara� kargo ta��yabilecek tipten de�il.");

		if(!ValidTruckForPlayer(playerid, vehicle))
		    return SendErrorMessage(playerid, "Bu arac� kullanman�z i�in meslek r�tbeniz yetersiz. (/meslek yardim)");

		if(PlayerData[playerid][pSQLID] != CarData[vehicle][carOwnerID] && PlayerData[playerid][pCarKey] != CarData[vehicle][carID] && !PlayerData[playerid][pAdminDuty])
				return SendErrorMessage(playerid, "Bu arac�n anahtarlar� sende yok.");

		if(CarData[vehicle][carLocked])
			return SendErrorMessage(playerid, "Bu ara� kilitli.");

	    new title[52],
	        msg[512] = "{9ACD32}�r�n\t{9ACD32}Adet",
         	count;

	    format(title, sizeof(title), "%s (Kapasite: %i)", ReturnVehicleModelName(GetVehicleModel(vehicle)), GetMaxCargoVehicle(vehicle));

      	for(new i; i != MAX_TRUCK_PRODUCT; i++)
      		PlayerData[playerid][pCargoListed][i] = 0;

		for(new i; i != MAX_TRUCK_PRODUCT; i++)
		{
		    if(CarData[vehicle][carCargoAmount][i] == 0)
		        continue;

 			PlayerData[playerid][pCargoListed][count] = i;
			format(msg, sizeof(msg), "%s\n%s\t%i %s.", msg, TruckerData_product[i], CarData[vehicle][carCargoAmount][i], Trucker_GetType(i));
			count++;
		}

		if(!count)
		    return SendErrorMessage(playerid, "Bu ara�ta hi� kargo yok.");

		Dialog_Show(playerid, CARGO_LIST, DIALOG_STYLE_TABLIST_HEADERS, title, msg, "Al", "Kapat");
		SetPVarInt(playerid, "cargo_veh_id", vehicle);
	    return 1;
	}
	else if(!strcmp(parametrs, "yerlestir", true))
	{
	    if(PlayerData[playerid][pCargoID] == 0)
		    return SendErrorMessage(playerid, "Hi� kargo ta��m�yorsun.");

        new vehicle;
		if((vehicle = GetNearBootVehicle(playerid)) == 0)
	    	return SendErrorMessage(playerid, "Yak�n�nda ara� yok.");

		if(!IsTruckerJob(vehicle))
		    return SendErrorMessage(playerid, "Bu ara� kargo ta��yabilecek tipten de�il.");

		if(PlayerData[playerid][pSQLID] != CarData[vehicle][carOwnerID] && PlayerData[playerid][pCarKey] != CarData[vehicle][carID] && !PlayerData[playerid][pAdminDuty])
				return SendErrorMessage(playerid, "Bu arac�n anahtarlar� sende yok.");

		if(!ValidTruckForPlayer(playerid, vehicle))
		    return SendErrorMessage(playerid, "Bu arac� kullanman�z i�in meslek r�tbeniz yetersiz. (/meslek yardim)");

		if(CarData[vehicle][carLocked])
			return SendErrorMessage(playerid, "Bu ara� kilitli.");

		new engine, lights, alarm, doors, bonnet, boot, objective;
		GetVehicleParamsEx(vehicle, engine, lights, alarm, doors, bonnet, boot, objective);

		if(!boot)
			return SendErrorMessage(playerid, "Bu arac�n bagaj� kapal�.");

		if(!IsValidProductVehicle(vehicle, PlayerData[playerid][pCargoID]-1) && GetVehicleModel(vehicle) != 578)
		    return SendErrorMessage(playerid, "Bu ara� elinizdeki kargo tipini desteklemiyor.");

		new amount;
		for(new i; i != MAX_TRUCK_PRODUCT; i++)
			amount += CarData[vehicle][carCargoAmount][i];

		if(amount >= GetMaxCargoVehicle(vehicle))
		    return SendErrorMessage(playerid, "Bu ara�ta yer kalmam��.");

        switch(GetVehicleModel(vehicle))
        {
            case 600, 543, 605, 422, 478, 554, 530: CarData[vehicle][carCargoObj][amount] = CreateDynamicObject(2912, 0.0, 0.0, 0.0, -100.0, 0.0, 0.0);
            case 443: CarData[vehicle][carCargoObj][amount] = CreateDynamicObject(3593, 0.0, 0.0, 0.0, -100.0, 0.0, 0.0);
		}

		switch(GetVehicleModel(vehicle))
		{
		    case 600: AttachDynamicObjectToVehicle(CarData[vehicle][carCargoObj][amount], vehicle, picador_attach[amount][0], picador_attach[amount][1], picador_attach[amount][2], 0.0, 0.0, 0.0);
		    case 543, 605: AttachDynamicObjectToVehicle(CarData[vehicle][carCargoObj][amount], vehicle, sadler_attach[amount][0], sadler_attach[amount][1], sadler_attach[amount][2], 0.0, 0.0, 0.0);
		    case 422: AttachDynamicObjectToVehicle(CarData[vehicle][carCargoObj][amount], vehicle, bobcat_attach[amount][0], bobcat_attach[amount][1], bobcat_attach[amount][2], 0.0, 0.0, 0.0);
            case 478: AttachDynamicObjectToVehicle(CarData[vehicle][carCargoObj][amount], vehicle, walton_attach[amount][0], walton_attach[amount][1], walton_attach[amount][2], 0.0, 0.0, 0.0);
            case 554: AttachDynamicObjectToVehicle(CarData[vehicle][carCargoObj][amount], vehicle, yosemite_attach[amount][0], yosemite_attach[amount][1], yosemite_attach[amount][2], 0.0, 0.0, 0.0);
			case 530: AttachDynamicObjectToVehicle(CarData[vehicle][carCargoObj][amount], vehicle, forklift_attach[amount][0], forklift_attach[amount][1], forklift_attach[amount][2], 0.0, 0.0, 0.0);
		}

		Streamer_Update(playerid, STREAMER_TYPE_OBJECT);

        cmd_putdown(playerid, "");
        if(IsPlayerAttachedObjectSlotUsed(playerid, SLOT_MISC))
        	RemovePlayerAttachedObject(playerid, SLOT_MISC);
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);

		CarData[vehicle][carCargoAmount][PlayerData[playerid][pCargoID]-1]++;
		PlayerData[playerid][pCargoID] = 0;
	    return 1;
	}
	else if(!strcmp(parametrs, "koy", true))
	{
	    if(PlayerData[playerid][pCargoID] == 0)
		    return SendErrorMessage(playerid, "Hi� kargo ta��m�yorsun.");

		new id = -1;
		for(new i; i != MAX_CARGO_OBJ; i++)
		{
		    if(CargoObject[i][oOn] != 0)
		        continue;

			id = i;
			break;
		}

		if(id == -1)
		    return SendErrorMessage(playerid, "Yak�nlarda �ok fazla kargo oldu�u i�in �imdilik yere kargo koyam�yorsun.");

		CargoObject[id][oOn] = 1;
		CargoObject[id][oProduct] = PlayerData[playerid][pCargoID];

        cmd_putdown(playerid, "");
		if(IsPlayerAttachedObjectSlotUsed(playerid, SLOT_MISC))
 			RemovePlayerAttachedObject(playerid, SLOT_MISC);
  		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
    	PlayerData[playerid][pCargoID] = 0;

		new Float: x,
			Float: y,
			Float: z;

		GetPlayerPos(playerid, x, y, z);
        GetXYInFrontOfPlayer(playerid, x, y, 1.5);
        CargoObject[id][oZ] -= 2.0;

		CargoObject[id][oObj] =
			CreateDynamicObject(2912, x, y, z, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));

        CargoObject[id][oX] = x,
        CargoObject[id][oY] = y,
        CargoObject[id][oZ] = z,
        CargoObject[id][oInt] = GetPlayerInterior(playerid),
        CargoObject[id][oVW] = GetPlayerVirtualWorld(playerid);

		CargoObject[id][oLabel] =
			CreateDynamic3DTextLabel(sprintf("[{FFFF00}%s{FFFFFF}]", TruckerData_product[CargoObject[id][oProduct]-1]), 0xFFFFFFFF, x, y, z+0.1, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), -1, 100.0);

		return 1;
	}
	else if(!strcmp(parametrs, "al", true))
	{
        if(IsPlayerAttachedObjectSlotUsed(playerid, SLOT_MISC) || PlayerData[playerid][pCargoID] != 0)
	    	return SendErrorMessage(playerid, "Kargo ta��yorsun.");

		new id = -1;
		for(new i; i != MAX_CARGO_OBJ; i++)
		{
			if(CargoObject[i][oOn] == 0 || !IsPlayerInRangeOfPoint(playerid, 2.0, CargoObject[i][oX], CargoObject[i][oY], CargoObject[i][oZ]) || GetPlayerVirtualWorld(playerid) != CargoObject[i][oVW] || CargoObject[i][oInt] != GetPlayerInterior(playerid))
				continue;

			id = i;
			break;
		}

        if(id == -1)
		    return SendErrorMessage(playerid, "Yak�n�nda hi� kargo yok.");

        CargoObject[id][oOn] = 0;

        PlayerData[playerid][pCargoID] = CargoObject[id][oProduct];

        cmd_liftup(playerid, "");
        SetPlayerAttachedObject(playerid, SLOT_MISC, 2912, 5, 0.102000, 0.306000, -0.228999, -1.100001, 14.499999, -1.300000, 1.000000, 1.000000, 1.000000);
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);

        if(IsValidDynamicObject(CargoObject[id][oObj]))
            DestroyDynamicObject(CargoObject[id][oObj]);

        if(IsValidDynamic3DTextLabel(CargoObject[id][oLabel]))
		{
			DestroyDynamic3DTextLabel(CargoObject[id][oLabel]);
	        CargoObject[id][oLabel] = Text3D:INVALID_3DTEXT_ID;
		}
	    return 1;
	}
	else if(!strcmp(parametrs, "satinal", true))
	{
	    if(IsPlayerInAnyVehicle(playerid))
		{
			new id = -1;
			if((id = Industry_Nearest(playerid, 10.0)) == -1)
	    		return SendErrorMessage(playerid, "Yak�n�nda kargo sat�n alabilece�in bir nokta yok.");

            if(TruckerData[id][tLocked] == 1)
	        	return SendErrorMessage(playerid, "Bu nokta kargo sat���na kapal�.");

		    new vehicle = GetPlayerVehicleID(playerid),
		   		trailerid = GetVehicleTrailer(vehicle);

			if(GetVehicleModel(vehicle) == 578 || GetVehicleModel(vehicle) == 443 || GetVehicleModel(vehicle) == 554 || GetVehicleModel(vehicle) == 499 || GetVehicleModel(vehicle) == 414 || GetVehicleModel(vehicle) == 456 || GetVehicleModel(vehicle) == 455 || GetVehicleModel(vehicle) == 530)
				trailerid = vehicle;

	     	if(trailerid == 0)
		        return SendErrorMessage(playerid, "Bu komutu ara� i�inde trailerin varken kullanabilirsin.");

            if(ValidTruckForPlayer(playerid, trailerid) == 0)
		    	return SendErrorMessage(playerid, "Bu traileri kullanman�z i�in meslek r�tbeniz yetersiz. (/meslek yardim)");

			if(CarData[trailerid][carLocked])
				return SendErrorMessage(playerid, "Bu trailer kilitli.");

			if(GetVehicleModel(trailerid) != 530)
			{
	            if(IsTakeProduct(TruckerData[id][tProductID]))
			        return SendErrorMessage(playerid, "Se�ti�in kargo bu trailerin ta��yabilece�i t�rden de�il.");
			}

			if(!IsValidProductVehicle(trailerid, TruckerData[id][tProductID]))
			    return SendErrorMessage(playerid, "Bu trailer sat�n almak istedi�iniz kargo tipini desteklemiyor.");

			new capacity = strval(arg),
			    content = GetMaxCargoVehicle(trailerid);

			if(isnull(arg))
			{
			    SendUsageMessage(playerid, "/kargo satinal [miktar]");
			    switch(TruckerData[id][tProductID])
			    {
			        case TRUCKER_BRICKS: SendClientMessageEx(playerid, -1, "Maksimum al�nabilecek miktar: %i (Tu�la)", content/6);
					case TRUCKER_TRANSFORMS: SendClientMessageEx(playerid, -1, "Maksimum al�nabilecek miktar: %i (Transformat�r)", content/6);
					case TRUCKER_WOODS: SendClientMessageEx(playerid, -1, "Maksimum al�nabilecek miktar: %i (A�a� K�t�kleri)", content/18);
					default: SendClientMessageEx(playerid, -1, "Maksimum al�nabilecek miktar: %i", content);
				}
			    return 1;
			}

			if(capacity < 1 || capacity > GetMaxCargoVehicle(trailerid))
			    return SendErrorMessage(playerid, "Bu trailerin alabilece�i kargo miktar� aral���: 1 - %i.", GetMaxCargoVehicle(trailerid));

			if(TruckerData[id][tStorage] < capacity)
	        	return SendErrorMessage(playerid, "Sat�n almak istedi�in %i tane kargo stokta yok.", capacity);

			if(PlayerData[playerid][pMoney] < TruckerData[id][tPrice] * capacity)
		    	return SendErrorMessage(playerid, "Yeterli paran bulunmuyor. ($%s)", MoneyFormat(TruckerData[id][tPrice] * capacity));

			new amount,
				prodid = -1;

			for(new i; i != MAX_TRUCK_PRODUCT; i++)
			{
			    if(CarData[trailerid][carCargoAmount][i] == 0)
			        continue;

				amount += CarData[trailerid][carCargoAmount][i];
				prodid = i;
			}

            switch(TruckerData[id][tProductID])
			{
   				case TRUCKER_BRICKS, TRUCKER_TRANSFORMS:
   				{
   				    if(amount + capacity > content/6)
			    		return SendErrorMessage(playerid, "Bu trailera en fazla %i adet kargo alabilirsin.", capacity);
   				}
				case TRUCKER_WOODS:
				{
				    if(amount + capacity > content/18)
			    		return SendErrorMessage(playerid, "Bu trailera en fazla %i adet kargo alabilirsin.", capacity);
				}
			 	default:
				{
					if(amount + capacity > content)
			    		return SendErrorMessage(playerid, "Bu trailera en fazla %i adet kargo alabilirsin.", capacity);
				}
			}

			if(amount && prodid != TruckerData[id][tProductID])
			    return SendErrorMessage(playerid, "Trailer i�inde \"%s\" tipinde kargo bulunuyor, sadece ayn� tipten sat�n alabilirsin.", TruckerData_product[prodid]);

			if(GetVehicleModel(vehicle) == 443 || GetVehicleModel(vehicle) == 578 || GetVehicleModel(vehicle) == 554 || GetVehicleModel(vehicle) == 530)
			{
				for(new i = 0; i != capacity; i++)
				{
			        switch(GetVehicleModel(vehicle))
			        {
						case 530:
						{
							CarData[vehicle][carCargoObj][amount] =
								CreateDynamicObject(2912, 0.0, 0.0, 0.0, -100.0, 0.0, 0.0);

							AttachDynamicObjectToVehicle(CarData[vehicle][carCargoObj][amount], vehicle, forklift_attach[amount][0], forklift_attach[amount][1], forklift_attach[amount][2], 0.0, 0.0, 0.0);
						}
			            case 443:
						{
							CarData[vehicle][carCargoObj][amount] =
								CreateDynamicObject(3593, 0.0, 0.0, 0.0, -100.0, 0.0, 0.0);

							AttachDynamicObjectToVehicle(CarData[vehicle][carCargoObj][amount], vehicle, paker_attach[amount][0], paker_attach[amount][1], paker_attach[amount][2], paker_attach[amount][3], 0.0, 0.0);
						}
						case 578:
						{
							switch(TruckerData[id][tProductID])
							{
								case TRUCKER_WOODS:
								{
									CarData[vehicle][carCargoObj][amount] = CreateDynamicObject(18609, 0.0, 0.0, 0.0, -100.0, 0.0, 0.0);
									AttachDynamicObjectToVehicle(CarData[vehicle][carCargoObj][amount], vehicle, dft_attach[0], dft_attach[1], dft_attach[2], 0.0, 0.0, dft_attach[3]);
								}
								case TRUCKER_BRICKS:
								{
									CarData[vehicle][carCargoObj][amount] = CreateDynamicObject(18609, 0.0, 0.0, 0.0, -100.0, 0.0, 0.0);
									AttachDynamicObjectToVehicle(CarData[vehicle][carCargoObj][amount], vehicle, dft_attach_brick[amount][0], dft_attach_brick[amount][1], dft_attach_brick[amount][2], 0.0, 0.0, 0.0);
								}
								case TRUCKER_TRANSFORMS:
								{
									CarData[vehicle][carCargoObj][amount] = CreateDynamicObject(3273, 0.0, 0.0, 0.0, -100.0, 0.0, 0.0);
									AttachDynamicObjectToVehicle(CarData[vehicle][carCargoObj][amount], vehicle, dft_attach_brick[amount][0], dft_attach_brick[amount][1], dft_attach_brick[amount][2], 0.0, 0.0, 0.0);
								}
							}
						}
						case 554:
						{
							CarData[vehicle][carCargoObj][amount] =
								CreateDynamicObject(1685, 0.0, 0.0, 0.0, -100.0, 0.0, 0.0);

							AttachDynamicObjectToVehicle(CarData[vehicle][carCargoObj][amount], vehicle, yosemite_attach_brick[0], yosemite_attach_brick[1], yosemite_attach_brick[2], 0.0, 0.0, 0.0);
						}
					}
					amount++;
				}
			}

			Streamer_Update(playerid, STREAMER_TYPE_OBJECT);
			GameTextForPlayer(playerid, sprintf("~r~-$%i", (TruckerData[id][tPrice] * capacity)), 1000, 1);
			CarData[trailerid][carCargoAmount][TruckerData[id][tProductID]] += capacity;
            GiveMoney(playerid, -(TruckerData[id][tPrice] * capacity));
			TruckerData[id][tStorage] -= capacity;
        	Industry_Update(id);
			return 1;
		}

        new id = -1;
		if((id = Industry_Nearest(playerid, 2.0)) == -1)
	    	return SendErrorMessage(playerid, "Yak�n�nda kargo sat�n alabilece�in bir nokta yok.");

	    if(TruckerData[id][tLocked] == 1)
	        return SendErrorMessage(playerid, "Bu nokta kargo sat���na kapal�.");

		if(!IsTakeProduct(TruckerData[id][tProductID]))
		    return SendErrorMessage(playerid, "Se�ti�in kargo ta��yabilece�in t�rden de�il.");

        if(!TruckerData[id][tStorage])
	        return SendErrorMessage(playerid, "Stokta �r�n kalmam��.");

		if(PlayerData[playerid][pMoney] < TruckerData[id][tPrice])
	    	return SendErrorMessage(playerid, "Yeterli paran bulunmuyor. ($%s)", MoneyFormat(TruckerData[id][tPrice]));

		if(IsPlayerAttachedObjectSlotUsed(playerid, SLOT_MISC) || PlayerData[playerid][pCargoID] != 0)
	    	return SendErrorMessage(playerid, "Kargo ta��yorsun.");

        cmd_liftup(playerid, "");
        SetPlayerAttachedObject(playerid, SLOT_MISC, 2912, 5, 0.102000, 0.306000, -0.228999, -1.100001, 14.499999, -1.300000, 1.000000, 1.000000, 1.000000);
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);

		GiveMoney(playerid, -TruckerData[id][tPrice]);
		PlayerData[playerid][pCargoID] = TruckerData[id][tProductID]+1;
		GameTextForPlayer(playerid, sprintf("~r~-$%i", TruckerData[id][tPrice]), 1000, 1);
		TruckerData[id][tStorage]--;
		Industry_Update(id);
	    return 1;
	}
	else if(!strcmp(parametrs, "fork", true))
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			new vehicle = GetPlayerVehicleID(playerid);

			if(GetVehicleModel(vehicle) != 530)
				return SendErrorMessage(playerid, "Bu komutu sadece forkliftte kullanabilirsin.");

			if(GetClosestVehicle(playerid, 5.0) == -1)
				return SendErrorMessage(playerid, "Yak�n�nda kargo alabilece�in bir ara� yok.");

			new
				Float:x,
				Float:y,
				Float:z;

			GetVehicleBoot(GetClosestVehicle(playerid, 5.0), x, y, z);
			new	nearvehicle = GetClosestVehicle(playerid, 5.0);

			if(!IsPlayerInRangeOfPoint(playerid, 5.0, x, y, z))
				return SendErrorMessage(playerid, "Bu arac�n bagaj�na yak�n de�ilsin.");

			if(CarData[nearvehicle][carLocked])
				return SendErrorMessage(playerid, "Bu ara� kilitli.");

			new engine, lights, alarm, doors, bonnet, boot, objective;
			GetVehicleParamsEx(nearvehicle, engine, lights, alarm, doors, bonnet, boot, objective);

			if(!boot)
				return SendErrorMessage(playerid, "Bu arac�n bagaj� kapal�.");

			new amount2, prodid2 = -1;
			for(new i; i != MAX_TRUCK_PRODUCT; i++)
			{
			    if(CarData[vehicle][carCargoAmount][i] == 0)
			        continue;

				amount2 += CarData[vehicle][carCargoAmount][i];
				prodid2 = i;
			}

			new amount, total, prodid = -1;
			for(new i; i != MAX_TRUCK_PRODUCT; i++)
			{
			    if(CarData[nearvehicle][carCargoAmount][i] == 0)
			        continue;

				amount += CarData[nearvehicle][carCargoAmount][i];
				prodid = i;
			}

			if(amount < 1)
				return SendErrorMessage(playerid, "Yak�n�ndaki ara�ta hi� kargo kalmam��.");

			if(amount2 && prodid2 != prodid)
			    return SendErrorMessage(playerid, "Forkliftte \"%s\" tipinde kargo bulunuyor, sadece ayn� tipten koyabilirsin.", TruckerData_product[prodid2]);

			if(!IsTakeProduct(prodid))
    			return SendErrorMessage(playerid, "Se�ti�in kargo ta��yabilece�in t�rden de�il.");

			amount = (amount > GetMaxCargoVehicle(vehicle)) ? GetMaxCargoVehicle(vehicle) : amount;

			for(new i = 0; i != amount; i++)
			{
				switch(GetVehicleModel(nearvehicle))
			 	{
			  		case 600, 543, 605, 422, 478, 554: DestroyDynamicObject(CarData[nearvehicle][carCargoObj][total]);
				}

		        switch(GetVehicleModel(vehicle))
		        {
					case 530:
					{
						CarData[vehicle][carCargoObj][total] =
							CreateDynamicObject(2912, 0.0, 0.0, 0.0, -100.0, 0.0, 0.0);

						AttachDynamicObjectToVehicle(CarData[vehicle][carCargoObj][total], vehicle, forklift_attach[total][0], forklift_attach[total][1], forklift_attach[total][2], 0.0, 0.0, 0.0);
					}
				}
				total++;
			}

			CarData[nearvehicle][carCargoAmount][prodid] -= amount;
			CarData[vehicle][carCargoAmount][prodid] += amount;
			Streamer_Update(playerid, STREAMER_TYPE_OBJECT);
			return 1;
		}
		else SendErrorMessage(playerid, "Herhangi bir ara� i�inde de�ilsin.");
		return 1;
	}
	else if(!strcmp(parametrs, "sat", true))
	{
	    if(IsPlayerInAnyVehicle(playerid))
		{
            new vehicle = GetPlayerVehicleID(playerid),
		   		trailerid = GetVehicleTrailer(vehicle);

			if(GetVehicleModel(vehicle) == 578 || GetVehicleModel(vehicle) == 443 || GetVehicleModel(vehicle) == 554 || GetVehicleModel(vehicle) == 499 || GetVehicleModel(vehicle) == 414 || GetVehicleModel(vehicle) == 456 || GetVehicleModel(vehicle) == 530)
				trailerid = vehicle;

	     	if(trailerid == 0)
		        return SendErrorMessage(playerid, "Bu komutu ara� i�inde trailerin varken kullanabilirsin.");

            if(!ValidTruckForPlayer(playerid, trailerid))
		    	return SendErrorMessage(playerid, "Bu traileri kullanman�z i�in meslek r�tbeniz yetersiz. (/meslek yardim)");


			if(PlayerData[playerid][pSQLID] != CarData[vehicle][carOwnerID] && PlayerData[playerid][pCarKey] != CarData[vehicle][carID] && !PlayerData[playerid][pAdminDuty])
					return SendErrorMessage(playerid, "Bu arac�n anahtarlar� sende yok.");

			if(CarData[trailerid][carLocked])
				return SendErrorMessage(playerid, "Bu trailer kilitli.");

            new capacity = strval(arg);

			if(isnull(arg))
			{
			    SendUsageMessage(playerid, "/kargo sat [miktar]");
			    return 1;
			}

			if(capacity < 1 || capacity > GetMaxCargoVehicle(trailerid))
			    return SendErrorMessage(playerid, "Miktar en az 1 en fazla %i olarak girilebilir.", GetMaxCargoVehicle(trailerid));

            new amount, prodid = -1;

			for(new i; i != MAX_TRUCK_PRODUCT; i++)
			{
			    if(CarData[trailerid][carCargoAmount][i] == 0) // || IsTakeProduct(i)
			        continue;

				amount += CarData[trailerid][carCargoAmount][i];
				prodid = i;
				break;
			}

			if(amount < capacity)
			    return SendErrorMessage(playerid, "Trailerda belirtti�in kadar kargo yok.");

            new id = -1;

			if((id = Industry_Nearest(playerid, 15.0)) != -1)
			{
                if(TruckerData[id][tLocked] == 1)
	        		return SendErrorMessage(playerid, "Bu nokta kargo al�m�na kapal�.");

		        if(TruckerData[id][tStorage] + amount > TruckerData[id][tStorageSize])
			        return SendErrorMessage(playerid, "Stok dolu g�z�k�yor.");

          		if(TruckerData[id][tProductID] != prodid)
			        return SendErrorMessage(playerid, "Satmak istedi�in kargo tipini bu nokta alm�yor.");

				if(GetVehicleModel(vehicle) == 443 || GetVehicleModel(vehicle) == 578 || GetVehicleModel(vehicle) == 554 || GetVehicleModel(vehicle) == 530)
				{
					for(new i = 0; i != capacity; i++)
					{
				        DestroyDynamicObject(CarData[vehicle][carCargoObj][amount-1]);
				        amount--;
					}
				}

				Streamer_Update(playerid, STREAMER_TYPE_OBJECT);
             	CarData[vehicle][carCargoAmount][prodid] -= capacity;
                GiveMoney(playerid, TruckerData[id][tPrice] * capacity);

				GameTextForPlayer(playerid, sprintf("~w~+$%i", TruckerData[id][tPrice] * capacity), 1000, 1);

				TruckerData[id][tStorage] += capacity;
				Industry_Update(id);
				return 1;
			}
			else if((id = GetNearBizOutside(playerid, 15.0)) != -1)
			{
			    if(capacity > BusinessData[id][BusinessWantedProduct])
			        return SendErrorMessage(playerid, "Bu i�yeri %i adet kargo sat�n almak istiyor.", BusinessData[id][BusinessWantedProduct]);

			    if(BusinessData[id][BusinessProduct] > 400)
			    	return SendErrorMessage(playerid, "Bu i�yerinin kargo kapasitesi dolmu�.");

                if(!BusinessData[id][BusinessProductPrice])
				    return SendErrorMessage(playerid, "Bu i�yeri kargo sat�n alm�yor.");

                if(biz_prod_types[BusinessData[id][BusinessType]] != prodid)
			        return SendErrorMessage(playerid, "Satmak istedi�in kargo tipini bu i�yeri alm�yor.");

			    if(GetVehicleModel(vehicle) == 443 || GetVehicleModel(vehicle) == 578 || GetVehicleModel(vehicle) == 554)
				{
					for(new i = 0; i != capacity; i++)
					{
				        DestroyDynamicObject(CarData[vehicle][carCargoObj][amount-1]);
				        amount--;
					}
				}

				Streamer_Update(playerid, STREAMER_TYPE_OBJECT);
             	CarData[trailerid][carCargoAmount][prodid] -= capacity;
                BusinessData[id][BusinessProduct] += (BusinessData[id][BusinessType] * capacity);
               	BusinessData[id][BusinessCashbox] -= (BusinessData[id][BusinessProductPrice] * capacity);
                GiveMoney(playerid, BusinessData[id][BusinessProductPrice] * capacity);
				GameTextForPlayer(playerid, sprintf("~w~+$%i", (BusinessData[id][BusinessProductPrice] * capacity)), 1000, 1);
				if(BusinessData[id][BusinessProduct] >= 400) BusinessData[id][BusinessProductPrice] = 0;
				Business_Save(id);
				return 1;
			}
			else SendErrorMessage(playerid, "Yak�n�nda kargo satabilece�in bir nokta yok.");
			return 1;
		}

		if(!PlayerData[playerid][pCargoID])
  			return SendErrorMessage(playerid, "Kargo ta��m�yorsun.");

        new id;
		if((id = Industry_Nearest(playerid, 2.0)) != -1)
		{
            if(TruckerData[id][tLocked] == 1)
        		return SendErrorMessage(playerid, "Bu nokta kargo al�m�na kapal�.");

	        if(TruckerData[id][tStorage] + 1 > TruckerData[id][tStorageSize])
		        return SendErrorMessage(playerid, "Stok dolu g�z�k�yor.");

	        if(TruckerData[id][tProductID] != PlayerData[playerid][pCargoID]-1)
		        return SendErrorMessage(playerid, "Satmak istedi�in kargo tipini bu nokta alm�yor.");

            cmd_putdown(playerid, "");
	        if(IsPlayerAttachedObjectSlotUsed(playerid, SLOT_MISC))
	        	RemovePlayerAttachedObject(playerid, SLOT_MISC);
	        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);

			GiveMoney(playerid, TruckerData[id][tPrice]);
			PlayerData[playerid][pCargoID] = 0;

			GameTextForPlayer(playerid, sprintf("~w~+$%i", TruckerData[id][tPrice]), 1000, 1);

			TruckerData[id][tStorage]++;
			Industry_Update(id);
        }
        else if((id = GetNearBizOutside(playerid)) != -1)
		{
		    if(BusinessData[id][BusinessProduct] > 400)
		    	return SendErrorMessage(playerid, "Bu i�yerinin kargo kapasitesi dolmu�.");

            if(!BusinessData[id][BusinessProductPrice])
				return SendErrorMessage(playerid, "Bu i�yeri kargo sat�n alm�yor.");

            if(biz_prod_types[BusinessData[id][BusinessType]] != PlayerData[playerid][pCargoID]-1)
				return SendErrorMessage(playerid, "Satmak istedi�in kargo tipini bu i�yeri alm�yor.");

    	    cmd_putdown(playerid, "");
            if(IsPlayerAttachedObjectSlotUsed(playerid, SLOT_MISC)) RemovePlayerAttachedObject(playerid, SLOT_MISC);
	        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);

            PlayerData[playerid][pCargoID] = 0;
            BusinessData[id][BusinessProduct] += BusinessData[id][BusinessType];
           	BusinessData[id][BusinessCashbox] -= BusinessData[id][BusinessProductPrice];
            GiveMoney(playerid, BusinessData[id][BusinessProductPrice]);
			if(BusinessData[id][BusinessProduct] >= 400) BusinessData[id][BusinessProductPrice] = 0;
			Business_Save(id);
			return 1;
		}
		else SendErrorMessage(playerid, "Yak�n�nda kargo satabilece�in bir nokta yok.");
	}
	return 1;
}

CMD:cop(playerid, params[])
{
    Trash_RouteCommands(playerid, params);
	return 1;
}

CMD:balikgit(playerid, params[])
{
	if(PlayerData[playerid][pDrivingTest]) return SendServerMessage(playerid, "Ehliyet s�nav�ndayken bu komutu kullanamazs�n.");
	if(PlayerData[playerid][pTaxiDrivingTest]) return SendServerMessage(playerid, "Taksi s�nav�ndayken bu komutu kullanamazs�n.");

	new id;
	if(sscanf(params, "i", id)) return SendUsageMessage(playerid, "/balikgit [1(bot)/2(iskele)]");

	switch(id)
	{
		case 1: SetPlayerCheckpoint(playerid, 154.302, -1944.67, 4.17844, 3.0);
		case 2: SetPlayerCheckpoint(playerid, 403.8266, -2088.7598, 7.8359, 3.0);
		default: SendUsageMessage(playerid, "/balikgit [1(bot)/2(iskele)]");
	}
	return 1;
}

CMD:baliktut(playerid, params[])
{
	if(!IsPlayerAtFishingPlace(playerid) && !IsABoat(GetPlayerVehicleID(playerid)))
		return SendErrorMessage(playerid, "Burada bal�k tutamazs�n�z.");

	if(PlayerData[playerid][pFishTime] > 0)
		return SendClientMessage(playerid, COLOR_WHITE, "(( L�tfen /baliktut komutunu 6 saniyede bir kullan�n. ))");

	if(PlayerData[playerid][pFishCheckpoint])
		return SendInfoMessage(playerid, "Haritada i�aretlenmi� olan k�rm�z� noktaya ilerle.");

	if(IsABoat(GetPlayerVehicleID(playerid)))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendErrorMessage(playerid, "Bal�k tutabilmek i�in botun �of�r koltu�unda olmal�s�n.");
		if(!CarEngine[GetPlayerVehicleID(playerid)]) return SendErrorMessage(playerid, "�lk �nce botun motorunu a�mal�s�n.");
		if(PlayerData[playerid][pFishWeight] >= 2500) return SendErrorMessage(playerid, "Botta 2,500 kgden fazla bal�k tutamazs�n.");

		new rand = random(sizeof(BoatCP));
		SetPlayerRaceCheckpoint(playerid, 1, BoatCP[rand][0], BoatCP[rand][1], BoatCP[rand][2], 0.0, 0.0, 0.0, 8.0);
		PlayerData[playerid][pFishCheckpoint] = 1;
	}
	else
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return SendClientMessage(playerid, COLOR_GREY, "Bal�k tutabilmek i�in ara�tan inmelisin.");
		if(PlayerData[playerid][pFishWeight] >= 450) return SendErrorMessage(playerid, "�zerinde 450 kgden fazla bal�k ta��yamazs�n.");

		ApplyAnimation(playerid, "SAMP", "FishingIdle", 4.1, 0, 0, 0, 1, 0, 1);
		SetPlayerAttachedObject(playerid, 9, 18632, 6, 0.112999, 0.024000, 0.000000, -172.999954, 28.499994, 0.000000);
		cmd_ame(playerid, "oltas�n� suyun derinliklerine do�ru sallar.");
		TogglePlayerControllable(playerid, 0);
		PlayerData[playerid][pFishTime] = 6;
	}
	return 1;
}

CMD:baliksat(playerid, params[])
{
	if(PlayerData[playerid][pFishTime] > 0) return SendErrorMessage(playerid, "Bal�k tutarken bu komutu kullanamazs�n.");
	if(PlayerData[playerid][pDrivingTest]) return SendServerMessage(playerid, "Ehliyet s�nav�ndayken bu komutu kullanamazs�n.");

	if(!IsPlayerInRangeOfPoint(playerid, 5.0, 2475.6350,-2709.6445,3.0000))
    {
 		SetPlayerCheckpoint(playerid, 2475.6350,-2709.6445,3.0000, 3.0);
 	   	return SendInfoMessage(playerid, "Bal�k satma noktas� i�aretlendi.");
	}

	if(!PlayerData[playerid][pFishWeight]) return SendErrorMessage(playerid, "Satabilecek bal���n kalmam��.");

	new amount = PlayerData[playerid][pFishWeight] * randomEx(5, 6);

	GameTextForPlayer(playerid, sprintf("~p~%i KILO BALIK SATTIN~n~~w~$%i", PlayerData[playerid][pFishWeight], amount), 3000, 4);
	GiveMoney(playerid, amount);
	PlayerData[playerid][pFishWeight] = 0;
	return 1;
}

CMD:baliklarim(playerid, params[])
{
	SendClientMessage(playerid, COLOR_DARKGREEN, "_________________________");
	SendClientMessageEx(playerid, COLOR_WHITE, "Bal�klar�n a��rl���:[%i] kg", PlayerData[playerid][pFishWeight]);
	return 1;
}

CMD:ev(playerid, params[])
{
	static type[24], string[128];
	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/ev [parametre]");
		SendClientMessage(playerid, COLOR_ADM, "-> satinal, sat, bilgi, zula, paracek, parayatir, saat");
		SendClientMessage(playerid, COLOR_ADM, "-> item, gelistir, kiracilar, kira, kiradurum, kov");
		SendClientMessage(playerid, COLOR_ADM, "-> bosdekor (Ba�tan interior yapmak i�in kullanabilece�iniz temiz interior.)");
		SendClientMessage(playerid, COLOR_ADM, "-> girisayarla (��yerinin i� kap�s�n� de�i�tirir.)");
		SendClientMessage(playerid, COLOR_ADM, "-> silahkoy (Silah�n�z� eve yerle�tirmeye yarar.)");
		return 1;
	}

	if(!strcmp(type, "satinal", true))
	{
		new h = -1;
		if((h = IsPlayerNearProperty(playerid)) == -1) return SendClientMessage(playerid, COLOR_ADM, "Herhangi bir evin kap�s�nda de�ilsin.");
		if(Property_Count(playerid) == 3) return SendErrorMessage(playerid, "Maksimum sahip olabilece�in ev say�s�na ula�m��s�n.");
		if(PropertyData[h][PropertyOwnerID]) return SendErrorMessage(playerid, "Sahibi olan bir evi sat�n alamazs�n.");

		if(PlayerData[playerid][pMoney] < PropertyData[h][PropertyMarketPrice])
			return SendErrorMessage(playerid, "Bu evi sat�n almak i�in yeterli paran yok. (%s)", MoneyFormat(PropertyData[h][PropertyMarketPrice]));

		if(PlayerData[playerid][pLevel] < PropertyData[h][PropertyLevel])
			return SendErrorMessage(playerid, "Bu evi sat�n almak i�in seviyen yetersiz.");

		PropertyData[h][PropertyOwnerID] = PlayerData[playerid][pSQLID];
		SaveSQLInt(PropertyData[h][PropertyID], "properties", "OwnerSQL", PropertyData[h][PropertyOwnerID]);
		GameTextForPlayer(playerid, "Evine Hosgeldin!~n~Istedigin zaman bu checkpointte~n~/giris yazarak girebilirsin", 3000, 5);
		SendClientMessage(playerid, COLOR_DARKGREEN, "Tebrikler, art�k bu evin sahibisin!");
		GiveMoney(playerid, -PropertyData[h][PropertyMarketPrice]);
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		Property_Refresh(h);

		//LogPlayerAction(playerid, sprintf("%i(DBID: %i) numaral� evi $%i miktara sat�n ald�.", h, PropertyData[h][PropertyID], PropertyData[h][PropertyMarketPrice]));
		return 1;
	}
	else if(!strcmp(type, "sat", true))
	{
		new h = -1;
		if((h = IsPlayerNearProperty(playerid)) == -1) return SendClientMessage(playerid, COLOR_ADM, "Herhangi bir evin kap�s�nda de�ilsin.");
		if(!Property_Count(playerid)) return SendErrorMessage(playerid, "Hi� evin yok.");
		if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendServerMessage(playerid, "Bu eve sahip de�ilsin.");

		new onayla[5];
		if(sscanf(string, "s[5]", onayla)) return SendUsageMessage(playerid, "/ev sat {FFFF00}onay");

		if(!strcmp(onayla, "onay", true))
		{
			PropertyData[h][PropertyOwnerID] = 0;
			SaveSQLInt(PropertyData[h][PropertyID], "properties", "OwnerSQL", 0);
			PlayerData[playerid][pSpawnPoint] = SPAWN_POINT_AIRPORT;

			SendClientMessageEx(playerid, COLOR_ADM, "SERVER: {FFFFFF}Evini $%s olarak yar� fiyat�na satt�n.", MoneyFormat(PropertyData[h][PropertyMarketPrice] / 2));
			GiveMoney(playerid, PropertyData[h][PropertyMarketPrice] / 2);
			GameTextForPlayer(playerid, "EVINI SATTIN!", 3000, 5);
		}
		else SendUsageMessage(playerid, "/ev sat {FFFF00}onay");
		return 1;
	}
	else if(!strcmp(type, "bosdekor", true))
	{
		new h = -1;
		if((h = IsPlayerNearProperty(playerid)) == -1) return SendClientMessage(playerid, COLOR_ADM, "Herhangi bir evin kap�s�nda de�ilsin.");
		if(!Property_Count(playerid)) return SendErrorMessage(playerid, "Hi� evin yok.");
		if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendServerMessage(playerid, "Bu eve sahip de�ilsin.");

		PropertyData[h][PropertyExit][0] = 1412.639892;
		PropertyData[h][PropertyExit][1] = -1.787510;
		PropertyData[h][PropertyExit][2] = 1000.924377;
		PropertyData[h][PropertyExitInterior] = 1;
		Property_Refresh(h);
		SendServerMessage(playerid, "Eviniz bo� dekora ayarland�.");
	}
	else if(!strcmp(type, "girisayarla", true))
	{
		new h = -1;
		if((h = IsPlayerInProperty(playerid)) == -1) return SendClientMessage(playerid, COLOR_ADM, "Herhangi bir evin i�inde de�ilsin.");
		if(!Property_Count(playerid)) return SendErrorMessage(playerid, "Hi� evin yok.");
		if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendServerMessage(playerid, "Bu eve sahip de�ilsin.");

		new Float:x, Float:y, Float:z, Float:a;
		GetPlayerPos(playerid, x, y, z);
		GetPlayerFacingAngle(playerid, a);

		PropertyData[h][PropertyExit][0] = x;
		PropertyData[h][PropertyExit][1] = y;
		PropertyData[h][PropertyExit][2] = z;
		PropertyData[h][PropertyExit][3] = a;
		PropertyData[h][PropertyExitInterior] = GetPlayerInterior(playerid);
		SendServerMessage(playerid, "Evinizin giri� b�lgesini ba�ar�yla ayarlad�n�z.");
		Business_Refresh(h);
	}
	else if(!strcmp(type, "bilgi", true))
	{
		new h = -1;
		if((h = IsPlayerInProperty(playerid)) == -1) return SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi evinizde olmal�s�n�z.");
		if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendServerMessage(playerid, "Bu eve sahip de�ilsin.");
		/*	new garage_id;
		foreach(new i : Garages) if(GarageData[i][GaragePropertyID] == h)
		{
			garage_id = i;
		}

		SendClientMessageEx(playerid, COLOR_DARKGREEN, "|__________________Ev [%i]__________________|", PropertyData[h][HouseID]);
		SendClientMessageEx(playerid, COLOR_GREY, "Sahip:[%s] Level:[%i] De�er:[$%s] Kasa:[%s] Durum:[%s]", ReturnName(playerid, 1), PropertyData[h][propertyLevel], MoneyFormat(PropertyData[h][propertyMarketPrice]), PropertyData[h][propertyLocked] ? ("Kilitli") : ("Kilitli De�il"));
		SendClientMessageEx(playerid, COLOR_GREY, "Garaj ID:[%s] Level:[%i] De�er:[$%s] Durum:[%s]", (garage_id != 0) ? (MoneyFormat(garage_id)) : ("Yok"), PropertyData[h][propertyLevel], MoneyFormat(PropertyData[h][propertyMarketPrice]), GarageData[garage_id][GarageLocked] ? ("Kilitli") : ("Kilitli De�il"));
		SendClientMessageEx(playerid, COLOR_DARKGREEN, "|__________________Ev [%i]__________________|", PropertyData[h][HouseID]);
		*/
		return 1;
	}
	else if(!strcmp(type, "zula", true))
	{
		new h = -1;
		if((h = IsPlayerInProperty(playerid)) == -1) return SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi evinizde olmal�s�n�z.");
		if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendServerMessage(playerid, "Bu eve sahip de�ilsin.");

		GetPlayerPos(playerid, PropertyData[h][PropertyCheck][0], PropertyData[h][PropertyCheck][1], PropertyData[playerid][PropertyCheck][2]);
		PropertyData[h][PropertyCheckInterior] = GetPlayerInterior(playerid);
		PropertyData[h][PropertyCheckWorld] = GetPlayerVirtualWorld(playerid);

		SendClientMessage(playerid, COLOR_WHITE, "SERVER: Evin zula noktas�n� ayarlad�n.");
		SendClientMessage(playerid, COLOR_WHITE, "SERVER: /silahkoy /ukoy /kontrol");
		Property_Save(h);
		return 1;
	}
	else if(!strcmp(type, "parayatir", true))
	{
		new h = -1;
		if((h = IsPlayerInProperty(playerid)) == -1) return SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi evinizde olmal�s�n�z.");
		if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu eve sahip de�ilsin.");

		new data[e_furniture];
		for(new i, j = Streamer_GetUpperBound(STREAMER_TYPE_OBJECT); i < j; i++)
		{
		    if(!IsValidDynamicObject(i)) continue;
		    if(!IsHouseSafe(Streamer_GetIntData(STREAMER_TYPE_OBJECT, i, E_STREAMER_MODEL_ID))) continue;
		    if(!Streamer_IsInArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, 0)) continue;

		    Streamer_GetArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, data);
	    	if(IsPlayerInRangeOfPoint(playerid, 2.5, data[furnitureX], data[furnitureY], data[furnitureZ]))
			{
				new interval;
				if(sscanf(string, "i", interval)) return SendUsageMessage(playerid, "/ev parayatir [miktar]");
				if(interval < 1 || interval > PlayerData[playerid][pMoney]) return SendErrorMessage(playerid, "Ge�ersiz de�er belirttin.");

				GiveMoney(playerid, -interval);
				PropertyData[h][PropertyMoney] += interval;
				SaveSQLInt(PropertyData[h][PropertyID], "properties", "Money", PropertyData[h][PropertyMoney]);
				SendClientMessageEx(playerid, COLOR_DARKGREEN, "SERVER: Evin kasas�na $%s koydun. (Biriken: $%s)", MoneyFormat(interval), MoneyFormat(PropertyData[h][PropertyMoney]));

			    //LogPlayerAction(playerid, sprintf("%i numaral� evin zulas�na $%s miktara para koydu. [�nceki Zula: $%i - �nceki Para: $%i - �imdiki Para: $%i]", h, MoneyFormat(interval), PropertyData[houseid][propertyMoney], PlayerData[playerid][pMoney], (PlayerData[playerid][pMoney]-interval)));
				return 1;
			}
		}

		SendClientMessage(playerid, COLOR_ADM, "Yak�n�nda kasa yok.");
		return 1;
	}
	else if(!strcmp(type, "paracek", true))
	{
		new h = -1;
		if((h = IsPlayerInProperty(playerid)) == -1) return SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi evinizde olmal�s�n�z.");
		if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu eve sahip de�ilsin.");

		new data[e_furniture];
		for(new i, j = Streamer_GetUpperBound(STREAMER_TYPE_OBJECT); i < j; i++)
		{
		    if(!IsValidDynamicObject(i)) continue;
		    if(!IsHouseSafe(Streamer_GetIntData(STREAMER_TYPE_OBJECT, i, E_STREAMER_MODEL_ID))) continue;
		    if(!Streamer_IsInArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, 0)) continue;

		    Streamer_GetArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, data);
	    	if(IsPlayerInRangeOfPoint(playerid, 2.5, data[furnitureX], data[furnitureY], data[furnitureZ]))
			{
				new interval;
				if(sscanf(string, "i", interval)) return SendUsageMessage(playerid, "/ev paracek [miktar]");
				if(interval < 1 || interval > PropertyData[h][PropertyMoney]) return SendErrorMessage(playerid, "Ge�ersiz de�er belirttin.");

				GiveMoney(playerid, interval);
				PropertyData[h][PropertyMoney] -= interval;
				SaveSQLInt(PropertyData[h][PropertyID], "properties", "Money", PropertyData[h][PropertyMoney]);
				SendClientMessageEx(playerid, COLOR_DARKGREEN, "SERVER: Evin kasas�ndan $%s �ektin. (Kalan: $%s)", MoneyFormat(interval), MoneyFormat(PropertyData[h][PropertyMoney]));
		        //LogPlayerAction(playerid, sprintf("%i numaral� evin zulas�ndan $%s miktar para ald�. [�nceki Zula: $%i - �imdiki Para: $%i]", houseid, MoneyFormat(interval), (PropertyData[houseid][propertyMoney]-interval), (PlayerData[playerid][pMoney]+interval)));
				return 1;
			}
		}

		SendClientMessage(playerid, COLOR_ADM, "Yak�n�nda kasa yok.");
	    return 1;
	}
	else if(!strcmp(type, "saat", true))
	{
		new h = -1;
		if((h = IsPlayerInProperty(playerid)) == -1) return SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi evinizde olmal�s�n�z.");
		if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu eve sahip de�ilsin.");

		new interval;
		if(sscanf(string, "i", interval)) return SendUsageMessage(playerid, "/ev saat [0-23]");
		if(interval < 0 || interval > 23) return SendErrorMessage(playerid, "Saat de�eri 0 - 23 aral���nda olmal�d�r.");

		PropertyData[h][PropertyTime] = interval;
		SaveSQLInt(PropertyData[h][PropertyID], "properties", "Time", PropertyData[h][PropertyTime]);
		SendClientMessageEx(playerid, COLOR_DARKGREEN, "SERVER: Evin saatini %i olarak ayarlad�n�z.", interval);

		foreach(new i : Player) if(IsPlayerInProperty(i) == h)
		{
			SetPlayerTime(i, PropertyData[h][PropertyTime], 0);
		}
		return 1;
	}
	else if(!strcmp(type, "isik", true))
	{
		new h = -1;
		if((h = IsPlayerInProperty(playerid)) == -1) return SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi evinizde olmal�s�n�z.");
		if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu eve sahip de�ilsin.");

		if(!PropertyData[h][PropertyLights])
		{
			PropertyData[h][PropertyLights] = true;
			cmd_ame(playerid, "kom�tat�r anahtar�na basar ve ����� kapat�r.");
			foreach (new i : Player) if(PlayerData[i][pInsideHouse] == h)
			{
				PlayerTextDrawShow(i, PropertyLightsTXD[i]);
			}
		}
		else
		{
			PropertyData[h][PropertyLights] = false;
			cmd_ame(playerid, "kom�tat�r anahtar�na basar ve ����� a�ar.");
			foreach (new i : Player) if(PlayerData[i][pInsideHouse] == h)
			{
				PlayerTextDrawHide(i, PropertyLightsTXD[i]);
			}
		}
		return 1;
	}
	else if(!strcmp(type, "item", true))
	{
		new h = -1;
		if((h = IsPlayerInProperty(playerid)) == -1) return SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi evinizde olmal�s�n�z.");
		if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu eve sahip de�ilsin.");

		new type_two[24], string_two[128];
		if(sscanf(string, "s[24]S()[128]", type_two, string_two))
		{
			SendUsageMessage(playerid, "/ev item [item]");
			SendClientMessage(playerid, COLOR_GREY, "|_________Ev �temleri_________|");
			SendClientMessage(playerid, COLOR_GREY, "| 1. xmr (/istasyon)");
			return 1;
		}

		if (!strcmp(type_two, "xmr", true))
		{
			if(!PropertyData[h][PropertyHasXMR]) return SendErrorMessage(playerid, "Evinde XM Radyo yok.");

			new islem[8];
			if(sscanf(string_two, "s[8]", islem)) return SendUsageMessage(playerid, "/ev item xmr [duzenle/sil]");

			if (!strcmp(islem, "duzenle", true))
			{
				EditingID[playerid] = h;
				EditingObject[playerid] = 19;
				EditDynamicObject(playerid, PropertyData[h][PropertyXMRObject]);
			}
			else if (!strcmp(islem, "sil", true))
			{
				SendClientMessage(playerid, COLOR_ADM, "[!]{FFFFFF} Evindeki XM radyoyu sildin.");
				DestroyDynamicObject(PropertyData[h][PropertyXMRObject]);
				PropertyData[h][PropertyHasXMR] = false;
			}
			else SendErrorMessage(playerid, "Ge�ersiz parametre girdiniz.");
		}
	}
	else if(!strcmp(type, "gelistir", true))
	{
		new h = -1;
		if((h = IsPlayerInProperty(playerid)) == -1) return SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi evinizde olmal�s�n�z.");
		if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu eve sahip de�ilsin.");

		new type_two[24], string_two[128];
		if(sscanf(string, "s[24]S()[128]", type_two, string_two))
		{
			SendUsageMessage(playerid, "/ev gelistir [item]");
			SendClientMessage(playerid, COLOR_GREY, "|_________Ev �temleri_________|");
			SendClientMessage(playerid, COLOR_GREY, "| 1. xmr (/istasyon)");
			return 1;
		}

		if (!strcmp(type_two, "xmr", true))
		{
			if(PropertyData[h][PropertyHasXMR]) return SendErrorMessage(playerid, "Evinde XM Radyo var.");
			if(PlayerData[playerid][pMoney] < 5000) return SendErrorMessage(playerid, "Bu geli�tirme i�in yeterli paran yok. ($5,000)");

			GetPlayerPos(playerid, PropertyData[h][PropertyXMR][0], PropertyData[h][PropertyXMR][1], PropertyData[h][PropertyXMR][2]);
			GetXYInFrontOfPlayer(playerid, PropertyData[h][PropertyXMR][0], PropertyData[h][PropertyXMR][1], 3.0);
			PropertyData[h][PropertyXMRObject] = CreateDynamicObject(2103, PropertyData[h][PropertyXMR][0], PropertyData[h][PropertyXMR][1], PropertyData[h][PropertyXMR][2], 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
			EditDynamicObject(playerid, PropertyData[h][PropertyXMRObject]);
			EditingObject[playerid] = 20;
			EditingID[playerid] = h;
		}
		else SendErrorMessage(playerid, "Ge�ersiz parametre girdiniz.");
	}
	else if(!strcmp(type, "kiracilar", true))
	{
		new h = -1;
		if((h = IsPlayerInProperty(playerid)) == -1) return SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi evinizde olmal�s�n�z.");
		if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu eve sahip de�ilsin.");

		new query[63];
		mysql_format(m_Handle, query, sizeof(query), "SELECT Name FROM players WHERE Renting = %i LIMIT 20", PropertyData[h][PropertyID]);
		new Cache:cache = mysql_query(m_Handle, query);
		if(cache_num_rows())
		{
			new str[480], tenant_name[24];
			SendClientMessage(playerid, COLOR_ADM, "Evindeki Kirac�lar:");

			for(new i = 0, j = cache_num_rows(); i < j; i++)
			{
				cache_get_value_name(i, "Name", tenant_name, sizeof(tenant_name));

				format(str, sizeof(str), "%s%s\n", str, tenant_name);
				Dialog_Show(playerid, DIALOG_USE, DIALOG_STYLE_LIST, "Kirac�lar", str, ">>>", "");
			}
		}
		else SendClientMessage(playerid, COLOR_ADM, "SERVER: Evinde hi� kirac� bulunmuyor.");
		cache_delete(cache);
		return 1;
 	}
 	else if(!strcmp(type, "kira", true))
	{
		new h = -1;
		if((h = IsPlayerInProperty(playerid)) == -1) return SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi evinizde olmal�s�n�z.");
		if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu eve sahip de�ilsin.");

		new interval;
		if(sscanf(string, "i", interval)) return SendUsageMessage(playerid, "/ev kira [miktar]");
		if(interval < 10 || interval > 500) return SendErrorMessage(playerid, "Kira fiyat� minimum $10 maksimum $500 olmal�d�r.");

		PropertyData[h][PropertyRentPrice] = interval;
		SaveSQLInt(PropertyData[h][PropertyID], "properties", "RentPrice", PropertyData[h][PropertyRentPrice]);
		SendClientMessageEx(playerid, COLOR_WHITE, "Evinizin kiras� $%s olarak ayarland�.", MoneyFormat(interval));
		return 1;
	}
 	else if(!strcmp(type, "kiradurum", true))
	{
		new h = -1;
		if((h = IsPlayerInProperty(playerid)) == -1) return SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi evinizde olmal�s�n�z.");
		if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu eve sahip de�ilsin.");

		if(!PropertyData[h][PropertyRentable])
		{
			PropertyData[h][PropertyRentable] = true;
			SaveSQLInt(PropertyData[h][PropertyID], "properties", "Rentable", PropertyData[h][PropertyRentable]);
			SendClientMessageEx(playerid, COLOR_DARKGREEN, "Evin art�k kiralanabilir. [$%i]", PropertyData[h][PropertyRentPrice]);
			SendClientMessageEx(playerid, COLOR_WHITE, "Evin kiras�n� $10'dan ba�lamak �art�yla de�i�tirebilirsin. (/ev kira)");
		}
		else
		{
			PropertyData[h][PropertyRentable] = false;
			SaveSQLInt(PropertyData[h][PropertyID], "properties", "Rentable", PropertyData[h][PropertyRentable]);
			SendClientMessage(playerid, COLOR_DARKGREEN, "Evin art�k kiranabilir de�il.");
		}
		return 1;
 	}
 	else if(!strcmp(type, "kov", true))
	{
		new h = -1;
		if((h = IsPlayerInProperty(playerid)) == -1) return SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi evinizde olmal�s�n�z.");
		if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu eve sahip de�ilsin.");

		new query[63];
		mysql_format(m_Handle, query, sizeof(query), "SELECT id FROM players WHERE Renting = %i LIMIT 20", PropertyData[h][PropertyID]);
		new Cache:cache = mysql_query(m_Handle, query);
		if(cache_num_rows())
		{
			SendClientMessageEx(playerid, COLOR_ADM, "SERVER: Evinde bulunan %i kirac�y� kovdun.", cache_num_rows());
			for(new i = 0, j = cache_num_rows(); i < j; i++)
			{
				mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET Renting = -1 WHERE Renting = %i LIMIT 20", PropertyData[h][PropertyID]);
				mysql_tquery(m_Handle, query);
			}
		}
		else SendClientMessage(playerid, COLOR_ADM, "SERVER: Evinde hi� kirac� bulunmuyor.");
		cache_delete(cache);
		return 1;
 	}
	else SendErrorMessage(playerid, "Hatal� parametre girdin.");
	return 1;
}

CMD:odakirala(playerid, params[])
{
	if(PlayerData[playerid][pRenting] == -1)
	{
		new h = -1;
		if((h = IsPlayerNearProperty(playerid)) == -1) return SendClientMessage(playerid, COLOR_ADM, "Herhangi bir evin kap�s�nda de�ilsin.");
		if(!PropertyData[h][PropertyRentable]) return SendServerMessage(playerid, "Bu yer kiralanabilir de�il.");
		if(PropertyData[h][PropertyOwnerID] == PlayerData[playerid][pSQLID]) return SendServerMessage(playerid, "Sahip oldu�un evi kendine kiralayamazs�n.");
		if(PlayerData[playerid][pMoney] < PropertyData[h][PropertyRentPrice]) return SendErrorMessage(playerid, "Yeterli paran yok. ($%s)", MoneyFormat(PropertyData[h][PropertyRentPrice]));

		GiveMoney(playerid, -PropertyData[h][PropertyRentPrice]);
		PlayerData[playerid][pSpawnPoint] = SPAWN_POINT_RENTING;

		PlayerData[playerid][pRenting] = h;
		SendClientMessageEx(playerid, COLOR_ADM, "[!] {FFFFFF}%s adresini kiralad�n. �cret: $%s.", PropertyData[h][PropertyAddress], MoneyFormat(PropertyData[h][PropertyRentPrice]));
		SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}Kiralamay� durdurana kadar burada oyuna ba�layacaks�n.");

        //LogPlayerAction(playerid, sprintf("%i numaral� evi kiralad�.", h));
	}
	else
	{
		PlayerData[playerid][pRenting] = -1;
		PlayerData[playerid][pSpawnPoint] = SPAWN_POINT_AIRPORT;
		SendServerMessage(playerid, "Art�k eski yerini kiralam�yorsun.");
	}
	return 1;
}


CMD:dosign(playerid, params[])
{
	new b = -1;
	if((b = IsPlayerInBusiness(playerid)) == -1) return SendErrorMessage(playerid, "Herhangi bir i�yeri i�erisinde de�ilsin.");
	if(BusinessData[b][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");

	new time, msg[128];
	if(sscanf(params, "is[128]", time, msg)) return SendUsageMessage(playerid, "/dosign [s�re(1-600 saniye)] [eylem]");
    if(time < 1 || time > 600) return SendServerMessage(playerid, "S�re en az 1 en fazla 600 saniye olmal�d�r.");
	if(strlen(msg) > 100) return SendServerMessage(playerid, "Eylem i�eri�i en fazla 100 karakteri olmal�d�r.");

	SetPlayerChatBubble(playerid, sprintf("* %s %s", ReturnName(playerid, 0), msg), COLOR_EMOTE, 25.0, time*1000);
	SendClientMessageEx(playerid, COLOR_EMOTE, "> %s %s", ReturnName(playerid, 0), msg);

	new id = Iter_Free(Dosigns);
	if (id == -1) return SendErrorMessage(playerid, "�u anda daha fazla bilgi yaz�s� eklenemiyor.");

	if(Dosign_PlayerInQueue(playerid) > 1)
	{
	   	SendErrorMessage(playerid, "��yerine en fazla 2 adet ekleyebilirsin, silinmelerini bekle.");
		return 1;
	}

	format(DosignData[id][DosignPlacedBy], 25, "%s", ReturnName(playerid));
	GetPlayerPos(playerid, DosignData[id][DosignPos][0], DosignData[id][DosignPos][1], DosignData[id][DosignPos][2]);
    DosignData[id][DosignInterior] = GetPlayerInterior(playerid); DosignData[id][DosignWorld] = GetPlayerVirtualWorld(playerid);
    DosignData[id][DosignLabel] = CreateDynamic3DTextLabel(sprintf("(( %s )) %s", ReturnName(playerid, 1), msg), COLOR_EMOTE, DosignData[id][DosignPos][0], DosignData[id][DosignPos][1], DosignData[id][DosignPos][2], 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, DosignData[id][DosignWorld], DosignData[id][DosignInterior]);
   	DosignData[id][DosignTimer] = SetTimerEx("Dosign_Clear", time*1000, false, "i", id);
   	SendClientMessageEx(playerid, -1, "SERVER: {ADC3E7}Bilgi yaz�s� {FFFFFF}ekledin, %i saniye sonra otomatik silinecektir.", time);
   	Iter_Add(Dosigns, id);
	return 1;
}

CMD:isyeri(playerid, params[])
{
	static type[24], string[128];
	if (sscanf(params, "s[24]S()[128]", type, string))
 	{
		SendUsageMessage(playerid, "/isyeri [parametre]");
		if(!Business_Count(playerid)) SendClientMessage(playerid, COLOR_ADM, "-> satinal");
		else
		{
			SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}sistemesat, bilgi, gelistir, giris, isim, paracek, motd, saat, isik");
			SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}parayatir, calisanlar, al, kov, iptal, kabul, red, cik");
			SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}kargofiyati, kargosayisi, kilit");
			SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}bosdekor (Ba�tan interior yapmak i�in kullanabilece�iniz temiz interior.)");
			SendClientMessage(playerid, COLOR_ADM, "-> {FFFFFF}girisayarla (��yerinin i� kap�s�n� de�i�tirir.)");
		}
		return 1;
	}

	if (!strcmp(type, "satinal", true))
	{
		new b = -1;
		if((b = IsPlayerNearBusiness(playerid)) == -1) return SendErrorMessage(playerid, "Herhangi bir i�yeri kap�s�nda de�ilsin.");
		if(Business_Count(playerid) == 1) return SendErrorMessage(playerid, "Maksimum sahip olabilece�in i�yerine say�s�na ula�m��s�n.");
		if(BusinessData[b][BusinessOwnerSQLID]) return SendErrorMessage(playerid, "Sahibi olan bir i�yerini sat�n alamazs�n.");

		if(BusinessData[b][BusinessType] == BUSINESS_BANK || BusinessData[b][BusinessType] == BUSINESS_DEALERSHIP)
			return SendErrorMessage(playerid, "Bu i�yeri t�r�n� sat�n alamazs�n.");

		if(PlayerData[playerid][pMoney] < BusinessData[b][BusinessPrice])
			return SendErrorMessage(playerid, "Bu i�yerini sat�n almak i�in yeterli paran yok. (%s)", MoneyFormat(BusinessData[b][BusinessPrice]));

		if(PlayerData[playerid][pLevel] < BusinessData[b][BusinessLevel])
			return SendErrorMessage(playerid, "Bu i�yerini sat�n almak i�in seviyen yetersiz.");

		BusinessData[b][BusinessOwnerSQLID] = PlayerData[playerid][pSQLID];
		SaveSQLInt(BusinessData[b][BusinessID], "businesses", "BusinessOwner", PlayerData[playerid][pSQLID]);
		GameTextForPlayer(playerid, "Tebrikler!~n~Bu isyerinin yeni sahibi sensin!", 4000, 5);
		GiveMoney(playerid, -BusinessData[b][BusinessPrice]);
		PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
		Business_Refresh(b);
		return 1;
	}
	else if(!strcmp(type, "kilit", true))
	{
		new b = -1;
		if(!Business_Count(playerid)) return SendErrorMessage(playerid, "Hi� i�yerin yok.");

		if((b = IsPlayerNearBusiness(playerid)) != -1)
		{
			if(BusinessData[b][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");

			if(!BusinessData[b][BusinessLocked])
			{
				BusinessData[b][BusinessLocked] = true;
				SendServerMessage(playerid, "��yerini kilitledin.");
			}
			else
			{
				BusinessData[b][BusinessLocked] = false;
				SendServerMessage(playerid, "��yerinin kilidini a�t�n.");
			}
		}
		else if((b = IsPlayerInBusiness(playerid)) != -1)
		{
			if(BusinessData[b][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");

			if(!BusinessData[b][BusinessLocked])
			{
				BusinessData[b][BusinessLocked] = true;
				SendServerMessage(playerid, "��yerini kilitledin.");
			}
			else
			{
				BusinessData[b][BusinessLocked] = false;
				SendServerMessage(playerid, "��yerinin kilidini a�t�n.");
			}
		}
		return 1;
	}
	/*else if(!strcmp(type, "sat", true))
	{
		new b = -1;
		if((b = IsPlayerNearBusiness(playerid)) == -1) return SendErrorMessage(playerid, "Herhangi bir i�yeri kap�s�nda de�ilsin.");
		if(!Business_Count(playerid)) return SendErrorMessage(playerid, "Hi� i�yerin yok.");
		if(BusinessData[b][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");

		new player, fiyat;
		if(sscanf(string, "ud", player, fiyat)) return SendUsageMessage(playerid, "/isyeri sat [oyuncuid/oyuncuad�] [fiyat]");

		if(!IsPlayerConnected(player)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda de�il.");
		if(!pLoggedIn[player]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
		if(!GetDistanceBetweenPlayers(playerid, player, 4.5)) return SendErrorMessage(playerid, "Belirtti�iniz ki�iye yak�n de�ilsin.");

		if(fiyat < 1)
			return SendErrorMessage(playerid, "Fiyat 1'in alt�nda olamaz.");

		SendClientMessageEx(playerid, COLOR_YELLOW, "%s isimli ki�iye %i fiyat�na i�yerini satmay� teklif ettin.", ReturnName(player), fiyat);
		SendClientMessageEx(player, COLOR_YELLOW, "%s isimli ki�i %d ID'li i�yerini sana satmay� teklif ediyor. Fiyat: %d ( /isyeri kabul )", ReturnName(playerid), b, fiyat);

		PlayerData[player][pOffered] = 1;
		PlayerData[player][pOfferedType] = OFFER_TYPE_BIZ;
		PlayerData[player][pOffer] = playerid;
		PlayerData[player][pOfferPrice] = fiyat;

		PlayerData[playerid][pOfferedID] = player;
		PlayerData[playerid][pOfferedItem] = b;
		return 1;
	}
	else if(!strcmp(type, "kabul", true))
	{
		if(PlayerData[playerid][pOffered])
		{
			if(PlayerData[playerid][pOfferedType] == OFFER_TYPE_BIZ)
			{
				new id = PlayerData[playerid][pOffer];
				if(PlayerData[id][pOfferedID] == playerid)
				{
					new price = PlayerData[playerid][pOfferPrice];
					new b = PlayerData[playerid][pOfferedItem];
					if(PlayerData[playerid][pMoney] < price)
					{
						if(BusinessData[b][BusinessOwnerSQLID] == PlayerData[id][pSQLID]) return SendErrorMessage(playerid, "Sat�n almaya �al��t���n�z ki�i art�k bu i�yerinin sahibi de�il.");

						GiveMoney(playerid, -price);
						GiveMoney(id, price);
						GameTextForPlayer(playerid, "Tebrikler!~n~Bu isyerinin yeni sahibi sensin!", 4000, 5);
						BusinessData[b][BusinessOwnerSQLID] = PlayerData[playerid][pSQLID];
						SaveSQLInt(BusinessData[b][BusinessID], "businesses", "BusinessOwner", PlayerData[playerid][pSQLID]);
						SendServerMessage(id, "��yerini ba�ar�yla satt�n.");

						PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
						PlayerPlaySound(id, 1052, 0.0, 0.0, 0.0);
						Business_Refresh(b);
					}
					else
					{
						SendServerMessage(playerid, "Bunu kar��layam�yorsun. ��yeri Fiyat�: %d", price);
					}
				}
				else
				{
					SendErrorMessage(playerid, "Herhangi biriyle ticaret yapm�yorsun.");
				}
			}
		}
		else
		{
			SendErrorMessage(playerid, "Herhangi biriyle ticaret yapm�yorsun.");
		}
	}*/
	else if(!strcmp(type, "sistemesat", true))
	{
		new b = -1;
		if((b = IsPlayerNearBusiness(playerid)) == -1) return SendErrorMessage(playerid, "Herhangi bir i�yeri kap�s�nda de�ilsin.");
		if(!Business_Count(playerid)) return SendErrorMessage(playerid, "Hi� i�yerin yok.");
		if(BusinessData[b][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");

		new onayla[5];
		if(sscanf(string, "s[5]", onayla)) return SendUsageMessage(playerid, "/isyeri sat {FFFF00}onay");

		if(!strcmp(onayla, "onay", true))
		{
			BusinessData[b][BusinessOwnerSQLID] = 0;
			SaveSQLInt(BusinessData[b][BusinessID], "businesses", "BusinessOwner", 0);
			SendClientMessageEx(playerid, COLOR_ADM, "SERVER: {FFFFFF}��yerini $%s olarak yar� fiyat�na satt�n.", MoneyFormat(BusinessData[b][BusinessPrice] / 2));
			GiveMoney(playerid, BusinessData[b][BusinessPrice] / 2);
			GameTextForPlayer(playerid, "ISYERINI SATTIN!", 3000, 5);
		}
		else SendUsageMessage(playerid, "/isyeri sat {FFFF00}onay");
		return 1;
	}
	else if (!strcmp(type, "kargosayisi", true))
	{
		new b = -1;
		if((b = IsPlayerInBusiness(playerid)) == -1) return SendErrorMessage(playerid, "Herhangi bir i�yeri i�erisinde de�ilsin.");
		if(BusinessData[b][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");

		static level;
		if(sscanf(string, "i", level)) return SendUsageMessage(playerid, "/isyeri kargosayisi [0-100]");
		if(level < 0 || level > 100) return SendErrorMessage(playerid, "Kargo say�s� 0 - 100 aral���nda olmal�d�r.");
		SendClientMessageEx(playerid, COLOR_DARKGREEN, "SERVER: ��yeri istenen kargo say�s�n� %i olarak ayarlad�n�z.", level);
		BusinessData[b][BusinessWantedProduct] = level;
		Business_Save(b);
		return 1;
	}
	else if (!strcmp(type, "kargofiyati", true))
	{
		new b = -1;
		if((b = IsPlayerInBusiness(playerid)) == -1) return SendErrorMessage(playerid, "Herhangi bir i�yeri i�erisinde de�ilsin.");
		if(BusinessData[b][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");

		static level;
		if(sscanf(string, "i", level)) return SendUsageMessage(playerid, "/isyeri kargofiyati [0-100$]");
		if(level < 0 || level > 100) return SendErrorMessage(playerid, "Kargo fiyat� 0 - 100$ aral���nda olmal�d�r.");
		SendClientMessageEx(playerid, COLOR_YELLOW, "SERVER: Bu i�yerinin kargo al�� fiyat�n� %s olarak g�ncelledin.", MoneyFormat(level));
		BusinessData[b][BusinessProductPrice] = level;
		Business_Save(b);
		return 1;
	}
	else if(!strcmp(type, "saat", true))
	{
		new b = -1;
		if((b = IsPlayerInBusiness(playerid)) == -1) return SendErrorMessage(playerid, "Herhangi bir i�yeri i�erisinde de�ilsin.");
		if(BusinessData[b][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");

		new interval;
		if(sscanf(string, "i", interval)) return SendUsageMessage(playerid, "/isyeri saat [0-23]");
		if(interval < 0 || interval > 23) return SendErrorMessage(playerid, "Saat de�eri 0 - 23 aral���nda olmal�d�r.");

		BusinessData[b][BusinessTime] = interval;
		SaveSQLInt(BusinessData[b][BusinessID], "businesses", "Time", BusinessData[b][BusinessTime]);
		SendClientMessageEx(playerid, COLOR_DARKGREEN, "SERVER: ��yeri saatini %i olarak ayarlad�n�z.", interval);

		foreach(new i : Player) if(PlayerData[i][pInsideBusiness] == b)
		{
			SetPlayerTime(i, BusinessData[b][BusinessTime], 0);
		}
		return 1;
	}
	else if(!strcmp(type, "isik", true))
	{
		new b = -1;
		if((b = IsPlayerInBusiness(playerid)) == -1) return SendErrorMessage(playerid, "Herhangi bir i�yeri i�erisinde de�ilsin.");
		if(BusinessData[b][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");

		if(!BusinessData[b][BusinessLights])
		{
			BusinessData[b][BusinessLights] = true;
			cmd_ame(playerid, "kom�tat�r anahtar�na basar ve ����� kapat�r.");
			foreach (new i : Player) if(PlayerData[i][pInsideBusiness] == b)
			{
				PlayerTextDrawShow(i, PropertyLightsTXD[i]);
			}
		}
		else
		{
			BusinessData[b][BusinessLights] = false;
			cmd_ame(playerid, "kom�tat�r anahtar�na basar ve ����� a�ar.");
			foreach (new i : Player) if(PlayerData[i][pInsideBusiness] == b)
			{
				PlayerTextDrawHide(i, PropertyLightsTXD[i]);
			}
		}
		return 1;
	}
	else if(!strcmp(type, "gelistir", true))
	{
		new b = -1;
		if((b = IsPlayerInBusiness(playerid)) == -1) return SendErrorMessage(playerid, "Herhangi bir i�yeri i�erisinde de�ilsin.");
		if(BusinessData[b][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");

		new type_two[24], string_two[128];
		if(sscanf(string, "s[24]S()[128]", type_two, string_two))
		{
			SendUsageMessage(playerid, "/isyeri gelistir [item]");
			SendClientMessage(playerid, COLOR_GREY, "|_________��yeri �temleri_________|");
			SendClientMessage(playerid, COLOR_GREY, "| 1. xmr (/istasyon)");
			return 1;
		}

		if(!strcmp(type_two, "xmr", true))
		{
			if(BusinessData[b][BusinessHasXMR]) return SendErrorMessage(playerid, "��yerinde XM radyo var.");
			if(PlayerData[playerid][pMoney] < 5000) return SendErrorMessage(playerid, "Bu geli�tirme i�in yeterli paran yok. ($5,000)");
			SendClientMessage(playerid, COLOR_GRAD2, "SERVER: ��yerine XM radyo sat�n ald�n! /istasyon");
	        BusinessData[b][BusinessHasXMR] = true;
	        GiveMoney(playerid, -5000);
			return 1;
		}
		else SendErrorMessage(playerid, "Ge�ersiz parametre girdiniz.");
	}
	else if (!strcmp(type, "parayatir", true))
	{
		new b = -1;
		if((b = IsPlayerInBusiness(playerid)) == -1) return SendErrorMessage(playerid, "Herhangi bir i�yeri i�erisinde de�ilsin.");
		if(!Business_Count(playerid)) return SendErrorMessage(playerid, "Hi� i�yerin yok.");
		if(BusinessData[b][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");

		new interval;
		if(sscanf(string, "i", interval)) return SendUsageMessage(playerid, "/isyeri parayatir [miktar]");
		if(interval < 1 || interval > PlayerData[playerid][pMoney]) return SendErrorMessage(playerid, "Ge�ersiz de�er belirttin.");

		GiveMoney(playerid, -interval);
		BusinessData[b][BusinessCashbox] += interval;
		SaveSQLInt(BusinessData[b][BusinessID], "businesses", "BusinessCashbox", BusinessData[b][BusinessCashbox]);
		SendClientMessageEx(playerid, COLOR_DARKGREEN, "SERVER: ��yeri kasas�na $%s koydun. (Kasa Toplam�: $%s)", MoneyFormat(interval), MoneyFormat(BusinessData[b][BusinessCashbox]));
		return 1;
	}
	else if (!strcmp(type, "paracek", true))
	{
		new b = -1;
		if((b = IsPlayerInBusiness(playerid)) == -1) return SendErrorMessage(playerid, "Herhangi bir i�yeri i�erisinde de�ilsin.");
		if(!Business_Count(playerid)) return SendErrorMessage(playerid, "Hi� i�yerin yok.");
		if(BusinessData[b][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");

		new interval;
		if(sscanf(string, "i", interval)) return SendUsageMessage(playerid, "/isyeri paracek [miktar]");
		if(interval < 1 || interval >BusinessData[b][BusinessCashbox]) return SendErrorMessage(playerid, "Ge�ersiz de�er belirttin.");

		GiveMoney(playerid, interval);
		BusinessData[b][BusinessCashbox] -= interval;
		SaveSQLInt(BusinessData[b][BusinessID], "businesses", "BusinessCashbox", BusinessData[b][BusinessCashbox]);
		SendClientMessageEx(playerid, COLOR_DARKGREEN, "SERVER: ��yeri kasas�ndan $%s �ektin. (Kasa Toplam�: $%s)", MoneyFormat(interval), MoneyFormat(BusinessData[b][BusinessCashbox]));
        return 1;
	}
	else if (!strcmp(type, "bilgi", true))
	{
		if(!Business_Count(playerid)) return SendErrorMessage(playerid, "Hi� i�yerin yok.");

		new id;
		if((id = IsPlayerInBusiness(playerid)) == -1) return SendErrorMessage(playerid, "Herhangi bir i�yeri i�erisinde de�ilsin.");
		if(BusinessData[id][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID] && !PlayerData[playerid][pAdminDuty]) return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");

		SendClientMessageEx(playerid, COLOR_DARKGREEN, "|__________________%s [%i]__________________|", BusinessData[id][BusinessName], id);
		SendClientMessageEx(playerid, COLOR_WHITE, "ID:[%i] Sahip:[%s] Level:[%i] De�er:[$%s] Tip:[%i] Kilitli:[%s]", BusinessData[id][BusinessID], ReturnName(playerid, 1), BusinessData[id][BusinessLevel], MoneyFormat(BusinessData[id][BusinessPrice]), BusinessData[id][BusinessType], BusinessData[id][BusinessLocked] ? ("Evet") : ("Hay�r"));
		//SendClientMessageEx(playerid, COLOR_WHITE, "Kasa:[$%s] Giri� Fiyat�:[$%s] �r�n Say�s�:[%i] �r�n Tipi:[%s] �r�n Fiyat�:[$%s]", MoneyFormat(BusinessData[id][BusinessCashbox]), MoneyFormat(BusinessData[id][BusinessFee]), BusinessData[id][BusinessProduct], Industry_CargoName(BusinessData[id][BusinessProduct]), MoneyFormat(BusinessData[id][BusinessProductPrice]));
		SendClientMessageEx(playerid, COLOR_DARKGREEN, "|__________________%s [%i]__________________|", BusinessData[id][BusinessName], id);
		return 1;
	}
	else if (!strcmp(type, "giris", true))
	{
		new b = -1;
		if((b = IsPlayerInBusiness(playerid)) == -1) return SendErrorMessage(playerid, "Herhangi bir i�yeri i�erisinde de�ilsin.");
		if(!Business_Count(playerid)) return SendErrorMessage(playerid, "Hi� i�yerin yok.");
		if(BusinessData[b][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");

		new interval;
		if(sscanf(string, "i", interval)) return SendUsageMessage(playerid, "/isyeri giris [miktar]");
		if(interval < 0 || interval > 500) return SendErrorMessage(playerid, "��yeri giri� fiyat� $0-$500 aras� olmal�d�r.");

		BusinessData[b][BusinessFee] = interval;
		SaveSQLInt(BusinessData[b][BusinessID], "businesses", "BusinessFee", BusinessData[b][BusinessFee]);
		SendClientMessageEx(playerid, COLOR_DARKGREEN, "SERVER: ��yeri giri� fiyat� $%d olarak ayarland�!", interval);
		return 1;
 	}
	else if (!strcmp(type, "isim", true))
	{
		if(!Business_Count(playerid)) return SendErrorMessage(playerid, "Hi� i�yerin yok.");

		static id = -1;
		if((id = IsPlayerInBusiness(playerid)) == -1) return SendErrorMessage(playerid, "��yeri i�erisinde de�ilsin.");
		if(BusinessData[id][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");

		new business_name[45];
		if(sscanf(string, "s[45]", business_name)) return SendUsageMessage(playerid, "/isyeri isim [metin]");
		if(isnull(business_name) || strlen(business_name) > 45) return SendErrorMessage(playerid, "��yeri ismi maksimum 45 karakter olabilir.");
    	if(ContainsInvalidCharacters(business_name)) return SendErrorMessage(playerid, "��yeri ismi i�erisinde T�rk�e karakter kullanamazs�n.");

		SendClientMessageEx(playerid, COLOR_DARKGREEN, "SERVER: ��yerinin ismi %s olarak de�i�ti!", business_name);
		format(BusinessData[id][BusinessName], 45, "%s", business_name);
		Business_Save(id);
		return 1;
 	}
 	else if (!strcmp(type, "motd", true))
	{
		if(!Business_Count(playerid)) return SendErrorMessage(playerid, "Hi� i�yerin yok.");

		static id = -1;
		if((id = IsPlayerInBusiness(playerid)) == -1) return SendErrorMessage(playerid, "��yeri i�erisinde de�ilsin.");
		if(BusinessData[id][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");

		new business_motd[128];
		if(sscanf(string, "s[128]", business_motd)) return SendUsageMessage(playerid, "/isyeri motd [metin]");
		if(isnull(business_motd) || strlen(business_motd) > 128) return SendErrorMessage(playerid, "��yeri metni maksimum 128 karakter olabilir.");
    	//if(ContainsInvalidCharacters(business_name)) return SendErrorMessage(playerid, "��yeri ismi i�erisinde T�rk�e karakter kullanamazs�n.");

		if(!strcmp(business_motd, "kaldir", true))
		{
			SendClientMessage(playerid, COLOR_DARKGREEN, "��yerinin metni ba�ar�yla kald�r�ld�.");
			format(BusinessData[id][BusinessMOTD], 128, "Yok");
			Business_Save(id);
		    return 1;
		}

		SendClientMessageEx(playerid, COLOR_DARKGREEN, "��yerinin metni %s olarak de�i�ti! (kald�rmak i�in /isyeri motd kaldir)", business_motd);
		format(BusinessData[id][BusinessMOTD], 128, "%s", business_motd);
		Business_Save(id);
		return 1;
 	}
 	else if (!strcmp(type, "cik", true))
	{
		if(PlayerData[playerid][pWorkOn] == -1) return SendErrorMessage(playerid, "Herhangi bir yerde �al��m�yorsun.");
		SendClientMessageEx(playerid, COLOR_RED, "SERVER: %s adl� i�yerinde �al��may� b�rakt�n.", BusinessData[PlayerData[playerid][pWorkOn]][BusinessName]);
		SaveSQLInt(PlayerData[playerid][pSQLID], "players", "WorkOn", -1);
		PlayerData[playerid][pWorkOn] = -1;
	    return 1;
	}
	else if(!strcmp(type, "bosdekor", true))
	{
		new b = -1;
		if((b = IsPlayerNearBusiness(playerid)) == -1) return SendErrorMessage(playerid, "Herhangi bir i�yeri kap�s�nda de�ilsin.");
		if(!Business_Count(playerid)) return SendErrorMessage(playerid, "Hi� i�yerin yok.");
		if(BusinessData[b][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");

		BusinessData[b][ExitPos][0] = 1412.639892;
		BusinessData[b][ExitPos][1] = -1.787510;
		BusinessData[b][ExitPos][2] = 1000.924377;
		BusinessData[b][ExitInterior] = 1;
		SendServerMessage(playerid, "��yerinizi ba�ar�yla bo� depoya ayarlad�n�z.");
		Business_Refresh(b);
	}
	else if(!strcmp(type, "girisayarla", true))
	{
		new b = -1;
		if((b = IsPlayerInBusiness(playerid)) == -1) return SendErrorMessage(playerid, "Herhangi bir i�yerinin i�inde de�ilsin.");
		if(!Business_Count(playerid)) return SendErrorMessage(playerid, "Hi� i�yerin yok.");
		if(BusinessData[b][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID] && PlayerData[playerid][pGrantBuildBiz] != BusinessData[b][BusinessID]) return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");

		new Float:x, Float:y, Float:z, Float:a;
		GetPlayerPos(playerid, x, y, z);
		GetPlayerFacingAngle(playerid, a);

		BusinessData[b][ExitPos][0] = x;
		BusinessData[b][ExitPos][1] = y;
		BusinessData[b][ExitPos][2] = z;
		BusinessData[b][ExitPos][3] = a;
		BusinessData[b][ExitInterior] = GetPlayerInterior(playerid);
		SendServerMessage(playerid, "��yerinizin giri� b�lgesini ba�ar�yla ayarlad�n�z.");
		Business_Refresh(b);
	}
	else if (!strcmp(type, "calisanlar", true))
	{
		if(!Business_Count(playerid)) return SendErrorMessage(playerid, "Hi� i�yerin yok.");

		static id = -1;
		if((id = IsPlayerInBusiness(playerid)) == -1) return SendErrorMessage(playerid, "��yeri i�erisinde de�ilsin.");
		if(BusinessData[id][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");

		new query[60];
		mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM players WHERE WorkOn = %i LIMIT 20", id);
		new Cache:cache = mysql_query(m_Handle, query);
		if(cache_num_rows())
		{
			new str[128], worker_name[24];
			for(new i = 0, j = cache_num_rows(); i < j; i++)
			{
				cache_get_value_name(i, "Name", worker_name, 24);
				format(str, sizeof(str), "%s%d. %s\n", str, (i+1), worker_name);
			}
			ShowPlayerDialog(playerid, DIALOG_USE, DIALOG_STYLE_LIST, sprintf("%s �al��anlar�", BusinessData[id][BusinessName]), str, ">>>", "");
		}
		else SendClientMessage(playerid, COLOR_ADM, "SERVER: ��yerinde kimse �al��m�yor.");
		cache_delete(cache);
		return 1;
	}
	/*else if(strmatch(specifier, "iptal"))
	{
		if(CountPlayerBusinesses(playerid) == 0)
			return SendErrorMessage(playerid, "Hi� i�yerin yok.");

		new bizid;
		if((bizid = IsPlayerInBusiness(playerid)) == 0)
			return SendErrorMessage(playerid, "��yeri i�erisinde de�ilsin.");

		if(BusinessData[bizid][businessOwnerSQL] != PlayerData[playerid][pSQLID])
			return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");

		if(OfferedHireTo[playerid] == INVALID_PLAYER_ID)
			return SendUsageMessage(playerid, "Hen�z birisine teklif yapmam��s�n.");

		SendClientMessageEx(OfferedHireTo[playerid], COLOR_RED, "SERVER: %s sana olan teklifini iptal etti.", ReturnName(playerid));
		SendClientMessageEx(playerid, COLOR_RED, "SERVER: %s adl� ki�iye yapt���n teklifi iptal ettin.", ReturnName(OfferedHireTo[playerid]));

		OfferedHireBy[OfferedHireTo[playerid]] = INVALID_PLAYER_ID;
		OfferedHireTo[playerid] = INVALID_PLAYER_ID;
		OfferedHireBusinessID[playerid] = 0;
	    return 1;
	}
	else if(strmatch(specifier, "al"))
	{
		if(CountPlayerBusinesses(playerid) == 0)
			return SendErrorMessage(playerid, "Hi� i�yerin yok.");

		new bizid;
		if((bizid = IsPlayerInBusiness(playerid)) == 0)
			return SendErrorMessage(playerid, "��yeri i�erisinde de�ilsin.");

		if(BusinessData[bizid][businessOwnerSQL] != PlayerData[playerid][pSQLID])
			return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");

		if(OfferedHireTo[playerid] != INVALID_PLAYER_ID)
			return SendUsageMessage(playerid, "Aktif bir teklifin var, de�erlendirmesini beklemelisin.");

		if (interval == -1)
 			return SendUsageMessage(playerid, "/isyeri al [oyuncu ID]");

		if(interval == playerid)
			return SendErrorMessage(playerid, "Kendini i�e alamazs�n.");

		if(!IsPlayerConnected(interval))
			return SendErrorMessage(playerid, "Belirtti�in ki�i aktif de�il.");

		if(!pLoggedIn[interval])
			return SendErrorMessage(playerid, "Belirtti�in ki�i giri� yapmam��.");

		if(!GetDistanceBetweenPlayers(playerid, interval, 5.0))
			return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");

		if(OfferedHireBy[interval] != INVALID_PLAYER_ID)
			return SendErrorMessage(playerid, "Bu ki�iye zaten bir teklif yap�lm��..");

		SendClientMessageEx(playerid, COLOR_RED, "SERVER: %s isimli ki�iye %s i�yerinde �al��mas� i�in teklif g�nderdin.", ReturnName(interval, 0), BusinessData[bizid][businessName]);
		SendClientMessage(playerid, COLOR_RED, "SERVER: /isyeri al iptal yazarak teklifini iptal edebilirsin.");

		SendClientMessageEx(interval, COLOR_RED, "SERVER: %s sana %s adl� i�yerinde i� teklif etti. /isyeri [kabul/red] komutu ile de�erlendirebilirsin.", ReturnName(playerid, 0), BusinessData[bizid][businessName]);
		OfferedHireBusinessID[playerid] = bizid;
		OfferedHireBy[interval] = playerid;
		OfferedHireTo[playerid] = interval;
		return 1;
  	}
	else if(strmatch(specifier, "kov"))
	{
		if(CountPlayerBusinesses(playerid) == 0)
			return SendErrorMessage(playerid, "Hi� i�yerin yok.");

		new bizid;
		if((bizid = IsPlayerInBusiness(playerid)) == 0)
			return SendErrorMessage(playerid, "��yeri i�erisinde de�ilsin.");

		if(BusinessData[bizid][businessOwnerSQL] != PlayerData[playerid][pSQLID])
			return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");

		if (interval == -1)
 			return SendUsageMessage(playerid, "/isyeri kov [oyuncu ID]");

		if(interval == playerid)
			return SendErrorMessage(playerid, "Kendini kovamazs�n.");

		if(!IsPlayerConnected(interval))
			return SendErrorMessage(playerid, "Belirtti�in ki�i aktif de�il.");

		if(!pLoggedIn[interval])
			return SendErrorMessage(playerid, "Belirtti�in ki�i giri� yapmam��.");

		if(PlayerData[interval][pWorkOn] != BusinessData[bizid][businessID])
			return SendErrorMessage(playerid, "Bu ki�i senin �al��an�n de�il.");

		SendClientMessageEx(interval, COLOR_RED, "SERVER: %s seni i�yerinden kovdu.", ReturnName(playerid));
		SendClientMessageEx(playerid, COLOR_RED, "SERVER: %s isimli ki�iyi i�yerinden kovdun.", ReturnName(interval));
		SaveSQLInt(PlayerData[interval][pSQLID], "players", "WorkOn", -1);
		PlayerData[interval][pWorkOn] = -1;
	    return 1;
	}
	else if(strmatch(specifier, "kabul"))
	{
		if(OfferedHireBy[playerid] == INVALID_PLAYER_ID)
			return SendErrorMessage(playerid, "Kimse sana i� teklifi yapmad�.");

		SendClientMessageEx(playerid, COLOR_RED, "SERVER: %s isimli ki�inin i�yeri teklifini kabul ettin.", ReturnName(OfferedHireBy[playerid]));
		SendClientMessageEx(OfferedHireBy[playerid], COLOR_RED, "SERVER: %s senin i�yerini teklifini kabul etti.", ReturnName(playerid));

		SaveSQLInt(PlayerData[playerid][pSQLID], "players", "WorkOn", OfferedHireBusinessID[OfferedHireBy[playerid]]);
		PlayerData[playerid][pWorkOn] = OfferedHireBusinessID[OfferedHireBy[playerid]];

		OfferedHireTo[OfferedHireBy[playerid]] = INVALID_PLAYER_ID;
		OfferedHireBusinessID[OfferedHireBy[playerid]] = 0;
		OfferedHireBy[playerid] = INVALID_PLAYER_ID;
 		return 1;
	}
	else if(strmatch(specifier, "red"))
	{
		if(OfferedHireBy[playerid] == INVALID_PLAYER_ID)
			return SendErrorMessage(playerid, "Kimse sana i� teklifi yapmad�.");

		SendClientMessageEx(playerid, COLOR_RED, "SERVER: %s isimli ki�inin i�yeri teklifini reddettin.", ReturnName(OfferedHireBy[playerid]));
		SendClientMessageEx(OfferedHireBy[playerid], COLOR_RED, "SERVER: %s senin i�yeri teklifini reddetti.", ReturnName(playerid));

		OfferedHireTo[OfferedHireBy[playerid]] = INVALID_PLAYER_ID;
		OfferedHireBusinessID[OfferedHireBy[playerid]] = 0;
		OfferedHireBy[playerid] = INVALID_PLAYER_ID;
 		return 1;
	}*/
 	else if (!strcmp(type, "al", true))
 	{
 		SendClientMessage(playerid, -1, "Bu i�lev devred���.");
 	}
 	else if (!strcmp(type, "kov", true))
 	{
 		SendClientMessage(playerid, -1, "Bu i�lev devred���.");
 	}
	else SendErrorMessage(playerid, "Hatal� parametre girdin.");
	return 1;
}

CMD:mobilyaizin(playerid, params[])
{
	new h = -1, b = -1, id;
	if((h = IsPlayerInProperty(playerid)) != -1)
	{
		if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendServerMessage(playerid, "Bu eve sahip de�ilsin.");

		if(sscanf(params, "u", id)) return SendUsageMessage(playerid, "/mobilyaizin [oyuncu ID/isim]");
		if(playerid == id) return SendErrorMessage(playerid, "Bu komutu kendi �zerinde kullanamazs�n.");
		if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirtti�iniz oyuncu oyunda yok.");
		if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirtti�iniz oyuncu hen�z �ifresini girmemi�.");
		if(!GetDistanceBetweenPlayers(playerid, id, 4.5)) return SendErrorMessage(playerid, "Belirtti�in oyuncuya yak�n de�ilsin.");
		if(IsPlayerInProperty(id) != h) return SendErrorMessage(playerid, "Belirtti�in oyuncuya seninle ayn� evde de�il.");

		InfoTD_MSG(id, 1, 5000, "~w~MOBILYA DUZENLEME ICIN DAVET.~n~~y~Y ~p~TUSUYLA KABUL EDEBILIR ~r~N ~p~TUSUYLA REDDEDEBILIRSIN.");
		InfoTD_MSG(playerid, 1, 5000, "~w~MOBILYA DUZENLEME ICIN DAVET GONDERDIN.~n~~y~LUTFEN CEVAPLANMASINI BEKLE.");
		SetPVarInt(id, "Grantbuild_PropertyID", h);
		SetPVarInt(id, "Grantbuild_ID", playerid);
	}
	else if((b = IsPlayerInBusiness(playerid)) != -1)
	{
		if(BusinessData[b][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin.");

		if(sscanf(params, "u", id)) return SendUsageMessage(playerid, "/mobilyaizin [oyuncu ID/isim]");
		if(playerid == id) return SendErrorMessage(playerid, "Bu komutu kendi �zerinde kullanamazs�n.");
		if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirtti�iniz oyuncu oyunda yok.");
		if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirtti�iniz oyuncu hen�z �ifresini girmemi�.");
		if(!GetDistanceBetweenPlayers(playerid, id, 4.5)) return SendErrorMessage(playerid, "Belirtti�in oyuncuya yak�n de�ilsin.");
		if(IsPlayerInBusiness(id) != b) return SendErrorMessage(playerid, "Belirtti�in oyuncuya seninle ayn� i�yerinde de�il.");

		InfoTD_MSG(id, 1, 5000, "~w~MOBILYA DUZENLEME ICIN DAVET.~n~~y~Y ~p~TUSUYLA KABUL EDEBILIR ~r~N ~p~TUSUYLA REDDEDEBILIRSIN.");
		InfoTD_MSG(playerid, 1, 5000, "~w~MOBILYA DUZENLEME ICIN DAVET GONDERDIN.~n~~y~LUTFEN CEVAPLANMASINI BEKLE.");
		SetPVarInt(id, "Grantbuild_BusinessID", b);
		SetPVarInt(id, "Grantbuild_ID", playerid);
	}
	return 1;
}

CMD:mobilyalarikaldir(playerid, params[])
{
	new h = -1, b = -1;
	if((h = IsPlayerInProperty(playerid)) == -1)
	{
		if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendServerMessage(playerid, "Bu eve sahip de�ilsin.");
		if(PropertyData[h][PropertySwitchID] == -1) return SendServerMessage(playerid, "Bu komutu kullanabilmek i�in evinin ayar�n�n yap�lmas� gerekiyor.");

		new confirm[5];
		if(sscanf(params, "s[5]", confirm))
		{
			SendUsageMessage(playerid, "/mobilyalarikaldir {FFFF00}onay");
			return 1;
		}

		if(!isnull(confirm) && !strcmp(confirm, "onay", true))
		{
			new data[e_furniture], query[64], sellprice;
			for(new i, j = Streamer_GetUpperBound(STREAMER_TYPE_OBJECT); i < j; i ++)
			{
			    if(!IsValidDynamicObject(i)) continue;
			    if(!Streamer_IsInArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, 0)) continue;

				Streamer_GetArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, data);
				if(data[SQLID] > 0 && data[PropertyID] == PropertyData[h][PropertyID])
				{
					sellprice += (data[furniturePrice] - (data[furniturePrice] & 2)) / 2;

					DestroyDynamicObject(i);
					mysql_format(m_Handle, query, sizeof(query), "DELETE FROM furnitures WHERE id = %i", data[SQLID]);
					mysql_tquery(m_Handle, query);

					//Streamer_RemoveArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, data[PropertyID]);
				}
		    }

			GameTextForPlayer(playerid, sprintf("~w~+$%i", sellprice), 2000, 1);
			GiveMoney(playerid, sellprice);

			if(!PropertyData[h][PropertySwitch])
			{
				new p = PropertyData[h][PropertySwitchID];
				PropertyData[h][PropertyExit][0] = g_PropertyInteriorsWOF[p][InteriorX];
				PropertyData[h][PropertyExit][1] = g_PropertyInteriorsWOF[p][InteriorY];
				PropertyData[h][PropertyExit][2] = g_PropertyInteriorsWOF[p][InteriorZ];
				PropertyData[h][PropertyExit][3] = g_PropertyInteriorsWOF[p][InteriorA];
				PropertyData[h][PropertyExitInterior] = g_PropertyInteriorsWOF[p][InteriorID];
				PropertyData[h][PropertySwitch] = true;
			}
			else
			{
				new p = PropertyData[h][PropertySwitchID];
				PropertyData[h][PropertyExit][0] = g_PropertyInteriors[p][InteriorX];
				PropertyData[h][PropertyExit][1] = g_PropertyInteriors[p][InteriorY];
				PropertyData[h][PropertyExit][2] = g_PropertyInteriors[p][InteriorZ];
				PropertyData[h][PropertyExit][3] = g_PropertyInteriors[p][InteriorA];
				PropertyData[h][PropertyExitInterior] = g_PropertyInteriors[p][InteriorID];
				PropertyData[h][PropertySwitch] = false;
			}

			foreach(new i : Player) if(PlayerData[i][pInsideHouse] == h)
			{
				SendPlayer(i, PropertyData[h][PropertyExit][0], PropertyData[h][PropertyExit][1], PropertyData[h][PropertyExit][2], PropertyData[h][PropertyExit][3], PropertyData[h][PropertyExitInterior], PropertyData[h][PropertyExitWorld]);
				SendClientMessage(i, COLOR_YELLOW, "SERVER: Bu evin i� k�sm� g�ncellendi.");
				SetCameraBehindPlayer(i);
			}

			Property_Refresh(h);
			Property_Save(h);
			return 1;
		}
		else SendUsageMessage(playerid, "/mobilyalarikaldir {FFFF00}onay");
	}

	if((b = IsPlayerInBusiness(playerid)) == -1)
	{
		if(BusinessData[b][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID]) return SendServerMessage(playerid, "Bu i�yerine sahip de�ilsin.");

		new confirm[5];
		if(sscanf(params, "s[5]", confirm))
		{
			SendUsageMessage(playerid, "/mobilyalarikaldir {FFFF00}onay");
			return 1;
		}

		if(!isnull(confirm) && !strcmp(confirm, "onay", true))
		{
			new data[e_furniture], query[64], sellprice;
			for(new i, j = Streamer_GetUpperBound(STREAMER_TYPE_OBJECT); i < j; i ++)
			{
			    if(!IsValidDynamicObject(i)) continue;
			    if(!Streamer_IsInArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, 0)) continue;

				Streamer_GetArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, data);
				if(data[SQLID] > 0 && data[BusinessID] == BusinessData[b][BusinessID])
				{
					sellprice += (data[furniturePrice] - (data[furniturePrice] & 2)) / 2;

					DestroyDynamicObject(i);
					mysql_format(m_Handle, query, sizeof(query), "DELETE FROM furnitures WHERE id = %i", data[SQLID]);
					mysql_tquery(m_Handle, query);

					//Streamer_RemoveArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, data[PropertyID]);
				}
		    }

			GameTextForPlayer(playerid, sprintf("~w~+$%i", sellprice), 2000, 1);
			GiveMoney(playerid, sellprice);

			Business_Refresh(h);
			Business_Save(h);
			return 1;
		}
		else SendUsageMessage(playerid, "/mobilyalarikaldir {FFFF00}onay");
	}
	return 1;
}

CMD:tummobilyalarisat(playerid, params[])
{
	new h = -1;
	if((h = IsPlayerInProperty(playerid)) == -1) return SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Bu komutu kullanabilmek i�in kendi evinizde olmal�s�n�z.");
	//if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID] && PlayerData[playerid][pGrantBuild] != PropertyData[h][PropertyID])
	//    return SendErrorMessage(playerid, "Sahip olmad���n evin mobilyas�n� satamazs�n.");
	if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendServerMessage(playerid, "Bu eve sahip de�ilsin.");
	if(EditingObject[playerid]) return SendErrorMessage(playerid, "�u anda ba�ka bir obje d�zenliyorsun.");
	if(!Furniture_GetCount(h)) return SendErrorMessage(playerid, "Hi� mobilyan yok.");

	new property_address[64], property_entered[64];
	switch(PropertyData[h][PropertyType])
	{
	    case 1,3: format(property_entered, sizeof(property_entered), "%s %i %s Mobilya", GetStreet(PropertyData[h][PropertyEnter][0], PropertyData[h][PropertyEnter][1], PropertyData[h][PropertyEnter][2]), h, GetCityName(PropertyData[h][PropertyEnter][0], PropertyData[h][PropertyEnter][1], PropertyData[h][PropertyEnter][2]));
	    case 2:
	    {
		    new link = PropertyData[h][PropertyComplexLink];
		  	format(property_entered, sizeof(property_entered), "%s %i %s Mobilya", GetStreet(PropertyData[link][PropertyEnter][0], PropertyData[link][PropertyEnter][1], PropertyData[link][PropertyEnter][2]), h, GetCityName(PropertyData[link][PropertyEnter][0], PropertyData[link][PropertyEnter][1], PropertyData[link][PropertyEnter][2]));
	    }
	}

	if(sscanf(params, "s[64]", property_address))
	{
		new data[e_furniture], sellprice, count;
		for(new i, j = Streamer_GetUpperBound(STREAMER_TYPE_OBJECT); i < j; i ++)
		{
		    if(!IsValidDynamicObject(i)) continue;
		    if(!Streamer_IsInArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, 0)) continue;

			Streamer_GetArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, data);
			if(data[SQLID] > 0 && data[PropertyID] == h)
			{
			    sellprice += (data[furniturePrice] - (data[furniturePrice] & 2)) / 2;
		 		count++;
			}
	    }

		SendClientMessage(playerid, COLOR_DARKRED, "Uyar�: Bu i�lem geri al�namaz. Yapt���n i�lemden emin ol.");
		SendClientMessage(playerid, COLOR_WHITE, " ");
		SendClientMessageEx(playerid, COLOR_DARKGREEN, "Bu ev $%s de�erinde %i adet mobilyaya sahip.", MoneyFormat(sellprice), count);
		SendClientMessage(playerid, COLOR_DARKGREEN, "��lemi onaylamak i�in, a�a��da yaz�lan� giriniz.");
		SendClientMessageEx(playerid, COLOR_WHITE, "/tummobilyalarisat %s", property_entered);
		SendClientMessage(playerid, COLOR_WHITE, " ");
		SendClientMessage(playerid, COLOR_DARKRED, "Uyar�: Bu i�lem geri al�namaz. Yapt���n i�lemden emin ol.");
		return 1;
	}

	if(!isnull(property_address) && !strcmp(property_entered, property_address, true))
	{
		new data[e_furniture], query[64], sellprice;
		for(new i, j = Streamer_GetUpperBound(STREAMER_TYPE_OBJECT); i < j; i ++)
		{
		    if(!IsValidDynamicObject(i)) continue;
		    if(!Streamer_IsInArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, 0)) continue;

			Streamer_GetArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, data);
			if(data[SQLID] > 0 && data[PropertyID] == h)
			{
				sellprice += (data[furniturePrice] - (data[furniturePrice] & 2)) / 2;

				DestroyDynamicObject(i);
				mysql_format(m_Handle, query, sizeof(query), "DELETE FROM furnitures WHERE id = %i", data[SQLID]);
				mysql_tquery(m_Handle, query);

				//Streamer_RemoveArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, data[PropertyID]);
			}
	    }

		GameTextForPlayer(playerid, sprintf("~w~+$%i", sellprice), 2000, 1);
		GiveMoney(playerid, sellprice);
	}
	return 1;
}

CMD:mobilya(playerid, params[])
{
	if(EditingObject[playerid]) return SendErrorMessage(playerid, "�u anda ba�ka bir obje d�zenliyorsun.");

	// i�yeri i�inde gelecek ayn�s�
	new h = -1;
	if((h = IsPlayerInProperty(playerid)) != -1)
	{
		//if(!Property_Count(playerid)) return SendErrorMessage(playerid, "Hi� evin yok.");
		if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID] && PropertyData[h][PropertyID] != PlayerData[playerid][pGrantBuild])
		{
    		SendErrorMessage(playerid, "Bu eve sahip de�ilsin veya mobilya iznin bulunmuyor.");
    		return 1;
    	}

    	Furniture_Panel(playerid, h, 0);
    	return 1;
	}

	new b = -1;
	if((b = IsPlayerInBusiness(playerid)) != -1)
	{
		//if(!Property_Count(playerid)) return SendErrorMessage(playerid, "Hi� evin yok.");
		if(BusinessData[b][BusinessOwnerSQLID] != PlayerData[playerid][pSQLID] && BusinessData[b][BusinessID] != PlayerData[playerid][pGrantBuildBiz])
		{
    		SendErrorMessage(playerid, "Bu i�yerine sahip de�ilsin veya mobilya iznin bulunmuyor.");
    		return 1;
    	}

    	Furniture_Panel(playerid, b, 1);
    	return 1;
	}

	SendErrorMessage(playerid, "Burada dekorasyon yapamazs�n.");
	return 1;
}

CMD:uyusturucularim(playerid, params[])
{
    new id;
	if(sscanf(params, "U(-1)", id)) return SendUsageMessage(playerid, "/uyusturucularim [oyuncu ID/isim]");
    if(id == -1) {
    	SendClientMessageEx(playerid, COLOR_ADM, "%s Uyu�turucular�:", ReturnName(playerid, 0));
    	Player_ListDrugs(playerid, playerid);
    	return 1;
    }

	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
	if(!GetDistanceBetweenPlayers(playerid, id, 2.0)) return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
	SendClientMessageEx(id, COLOR_ADM, "%s Uyu�turucular�:", ReturnName(playerid, 0));
    Player_ListDrugs(playerid, id);
	return 1;
}

CMD:uver(playerid, params[])
{
	new id, slot, Float: amount, free_slot;
	if(sscanf(params, "uif", id, slot, amount)) return SendUsageMessage(playerid, "/uver [oyuncu ID/ad�] [uyu�turucu slotu] [gram]");
	if(playerid == id) return SendErrorMessage(playerid, "Kendine uyu�turucu veremezsin.");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
	if(!GetDistanceBetweenPlayers(playerid, id, 2.0)) return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
	if(slot < 1 || slot > 24) return SendErrorMessage(playerid, "Ge�ersiz uyu�turucu slotu belirttin.");
	if(!player_drug_data[playerid][slot][is_exist]) return SendErrorMessage(playerid, "Bu slotta uyu�turucun yok.");
	if(amount < 0.1 || amount > player_drug_data[playerid][slot][drug_amount])
		return SendErrorMessage(playerid, "Bu slotta bu kadar uyu�turucun yok.");

	free_slot = Drug_GetPlayerNextSlot(id);

	if(free_slot == -1) {
		return SendServerMessage(playerid, "%s �st�nde daha fazla uyu�turucu bulunduramaz.", ReturnName(id, 0));
	}

	new drug_query[512];
	mysql_format(m_Handle, drug_query, sizeof(drug_query), "INSERT INTO player_drugs (player_dbid, drug_name, drug_type, drug_amount, drug_quality, drug_size) VALUES (%i, '%e', %i, %f, %i, %i)",
		PlayerData[id][pSQLID],
		player_drug_data[playerid][slot][drug_name],
		player_drug_data[playerid][slot][drug_id],
		amount,
		player_drug_data[playerid][slot][drug_quality],
		player_drug_data[playerid][slot][drug_size]
	);
	new Cache: cache = mysql_query(m_Handle, drug_query);

	player_drug_data[id][free_slot][data_id] = cache_insert_id();
	player_drug_data[id][free_slot][drug_id] = player_drug_data[playerid][slot][drug_id];
	format(player_drug_data[id][free_slot][drug_name], 64, "%s", player_drug_data[playerid][slot][drug_name]);
	player_drug_data[id][free_slot][drug_amount] = amount;
	player_drug_data[id][free_slot][drug_quality] = player_drug_data[playerid][slot][drug_quality];
	player_drug_data[id][free_slot][drug_size] = player_drug_data[playerid][slot][drug_size];
	player_drug_data[id][free_slot][is_exist] = true;

	cache_delete(cache);

	cmd_ame(playerid, sprintf("%s adl� ki�iye %s verir.", ReturnName(id, 0), Drug_GetName(player_drug_data[id][free_slot][drug_id])));
	SendClientMessageEx(playerid, COLOR_YELLOW, "%s adl� ki�iye %s - %s (%s) verdin.", ReturnName(id, 0), player_drug_data[id][free_slot][drug_name], Drug_GetName(player_drug_data[id][free_slot][drug_id]), Drug_GetType(player_drug_data[id][free_slot][drug_size]));
	SendClientMessageEx(id, COLOR_YELLOW, "%s sana %s - %s (%s) verdi.", ReturnName(playerid, 0), player_drug_data[id][free_slot][drug_name], Drug_GetName(player_drug_data[id][free_slot][drug_id]), Drug_GetType(player_drug_data[id][free_slot][drug_size]));

	player_drug_data[playerid][slot][drug_amount] -= amount;
	if(player_drug_data[playerid][slot][drug_amount] < 0.1) Drug_DefaultValues(playerid, slot);
	return 1;
}

CMD:ubirak(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid)) return SendErrorMessage(playerid, "Ara� i�erisinde bu komutu kullanamazs�n.");

	new slot, Float: amount;
	if(sscanf(params, "if", slot, amount)) {
		SendUsageMessage(playerid, "/ubirak [uyu�turucu slotu] [gram]");
		SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Uyu�turucuyu yerden almak i�in, /ual yazabilirsin.");
		return 1;
	}

	if(slot < 1 || slot > 24) return SendErrorMessage(playerid, "Ge�ersiz uyu�turucu slotu belirttin.");
	if(!player_drug_data[playerid][slot][is_exist]) return SendErrorMessage(playerid, "Bu slotta uyu�turucun yok.");

	if(amount < 0.1 || amount > player_drug_data[playerid][slot][drug_amount])
		return SendErrorMessage(playerid, "Bu slotta bu kadar uyu�turucun yok.");

	new id = Iter_Free(Drops);
	if(id == -1) return SendErrorMessage(playerid, "G�r�n��e g�re uyu�turucuyu b�rakmak �u anda m�mk�n de�il.");

	DropData[id][DropType] = 2;
	DropData[id][DropDrugAmount] = amount;
	DropData[id][DropDrugID] = player_drug_data[playerid][slot][drug_id];
	format(DropData[id][DropDrugName], 64, "%s", player_drug_data[playerid][slot][drug_name]);
	DropData[id][DropDrugQuality] = player_drug_data[playerid][slot][drug_quality];
	DropData[id][DropDrugSize] = player_drug_data[playerid][slot][drug_size];

	player_drug_data[playerid][slot][drug_amount] -= amount;
	if(player_drug_data[playerid][slot][drug_amount] < 0.1) Drug_DefaultValues(playerid, slot);

	GetPlayerPos(playerid, DropData[id][DropLocation][0], DropData[id][DropLocation][1], DropData[id][DropLocation][2]);
	DropData[id][DropInterior] = GetPlayerInterior(playerid); DropData[id][DropWorld] = GetPlayerVirtualWorld(playerid);

	DropData[id][DroppedBy] = PlayerData[playerid][pSQLID];
	DropData[id][DropObjID] = CreateDynamicObject(Drug_GetDropType(DropData[id][DropDrugSize]), DropData[id][DropLocation][0], DropData[id][DropLocation][1], DropData[id][DropLocation][2] - 1.0, 0.0, 0.0, 0.0, DropData[id][DropWorld], DropData[id][DropInterior]);
	DropData[id][DropTimer] = SetTimerEx("Drop_DrugRemove", 600000, false, "i", id);
	Iter_Add(Drops, id);

	SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Uyu�turucu 10 dakika i�erisinde kaybolacak. /ual yazarak geri alabilirsin.");
	cmd_ame(playerid, "yere bir �eyler b�rak�r.");
	return 1;
}

CMD:ual(playerid, params[])
{
	new id = -1;
	if((id = Drop_Nearest(playerid)) != -1)
	{
		new free_slot = Drug_GetPlayerNextSlot(playerid);
		if(free_slot == -1) return SendErrorMessage(playerid, "�st�nde daha fazla uyu�turucu bulunduramazs�n.");

		new drug_query[512];
		mysql_format(m_Handle, drug_query, sizeof(drug_query), "INSERT INTO player_drugs (player_dbid, drug_name, drug_type, drug_amount, drug_quality, drug_size) VALUES (%i, '%e', %i, %f, %i, %i)", PlayerData[playerid][pSQLID], DropData[id][DropDrugName], DropData[id][DropDrugID], DropData[id][DropDrugAmount], DropData[id][DropDrugQuality], DropData[id][DropDrugSize]);
		new Cache: cache = mysql_query(m_Handle, drug_query);

		player_drug_data[playerid][free_slot][data_id] = cache_insert_id();
		player_drug_data[playerid][free_slot][drug_id] = DropData[id][DropDrugID];
		format(player_drug_data[playerid][free_slot][drug_name], 64, "%s", DropData[id][DropDrugName]);
		player_drug_data[playerid][free_slot][drug_amount] = DropData[id][DropDrugAmount];
		player_drug_data[playerid][free_slot][drug_quality] = DropData[id][DropDrugQuality];
		player_drug_data[playerid][free_slot][drug_size] = DropData[id][DropDrugSize];
		player_drug_data[playerid][free_slot][is_exist] = true;
		cache_delete(cache);

		SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Yak�n�nda bulunan %s - %s (%s) uyu�turucuyu ald�n.", DropData[id][DropDrugName], Drug_GetName(DropData[id][DropDrugID]), Drug_GetType(DropData[id][DropDrugSize]));
		cmd_ame(playerid, "yerden bir �eyler al�r.");
		Drop_DrugRemove(id);
		return 1;
	}

	SendErrorMessage(playerid, "Etraf�nda uyu�turucu alabilece�in yer yok.");
	return 1;
}

CMD:ukullan(playerid, params[])
{
	new slot, Float: amount, emote[128];
	if(sscanf(params, "ifS('Yok')[128]", slot, amount, emote)) return SendUsageMessage(playerid, "/ukullan [uyu�turucu slotu] [gram] [emote]");
	if(slot < 1 || slot > 20) return SendErrorMessage(playerid, "Ge�ersiz uyu�turucu slotu belirttin.");
	if(!player_drug_data[playerid][slot][is_exist]) return SendErrorMessage(playerid, "Bu slotta uyu�turucun yok.");

	if(amount < 0.1) return SendErrorMessage(playerid, "Tek seferde en az 0.1 gram %s kullanabilirsin.", Drug_GetName(player_drug_data[playerid][slot][drug_id]));
	if(amount > 0.3) return SendErrorMessage(playerid, "Tek seferde en fazla 0.3 gram %s kullanabilirsin.", Drug_GetName(player_drug_data[playerid][slot][drug_id]));
	if(player_drug_data[playerid][slot][drug_amount] < amount) return SendErrorMessage(playerid, "Bu slotta yeterli uyu�turucun yok.");

	SendClientMessageEx(playerid, COLOR_YELLOW, "%0.1f gram %s kulland�n.", amount, Drug_GetName(player_drug_data[playerid][slot][drug_id]));
	if(strfind(emote, "Yok", true) != -1) cmd_ame(playerid, sprintf("%s kullan�r.", Drug_GetName(player_drug_data[playerid][slot][drug_id])));
	else cmd_ame(playerid, sprintf("%s", emote));

	Player_UseDrug(playerid, player_drug_data[playerid][slot][drug_id], player_drug_data[playerid][slot][drug_quality], amount);

	player_drug_data[playerid][slot][drug_amount] -= amount;
	if(player_drug_data[playerid][slot][drug_amount] < 0.1) Drug_DefaultValues(playerid, slot);
	return 1;
}

CMD:uk(playerid, params[]) return cmd_ukoy(playerid, params);
CMD:ukoy(playerid, params[])
{
	new h = -1;
	if((h = IsPlayerInProperty(playerid)) != -1)
	{
		if(!Property_Count(playerid)) return SendErrorMessage(playerid, "Hi� evin yok.");
		if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu eve sahip de�ilsin.");
		if(!IsPlayerInRangeOfPoint(playerid, 3.0, PropertyData[h][PropertyCheck][0], PropertyData[h][PropertyCheck][1], PropertyData[h][PropertyCheck][2]))
		    return SendErrorMessage(playerid, "Zula noktas�na yak�n de�ilsin.");

		new slot, Float: amount;
		if(sscanf(params, "if", slot, amount)) return SendUsageMessage(playerid, "/ukoy [uyu�turucu slotu] [gram]");
		if(slot < 1 || slot > 24) return SendErrorMessage(playerid, "Ge�ersiz slot belirttin.");
		if(!player_drug_data[playerid][slot][is_exist]) return SendErrorMessage(playerid, "Bu slotta uyu�turucun yok.");

		if(amount < 0.1 || amount > player_drug_data[playerid][slot][drug_amount]) {
			return SendErrorMessage(playerid, "Girdi�in miktarda uyu�turucun yok.");
		}

		if(GetPropertyDrugs(h) == MAX_PACK_SLOT-1) {
			return SendServerMessage(playerid, "Bu evde uyu�turucu koymaya yer kalmam��.");
		}

		new drug_query[512], free_slot = GetNextPropertyDrugSlot(h);
		mysql_format(m_Handle, drug_query, sizeof(drug_query), "INSERT INTO property_drugs (drug_name, drug_type, drug_amount, drug_quality, drug_size, property_id, placed_by) VALUES ('%e', %i, %f, %i, %i, %i, %i)", player_drug_data[playerid][slot][drug_name], player_drug_data[playerid][slot][drug_id], amount, player_drug_data[playerid][slot][drug_quality], player_drug_data[playerid][slot][drug_size], h, PlayerData[playerid][pSQLID]);
		new Cache:cache = mysql_query(m_Handle, drug_query);

	    property_drug_data[h][free_slot][data_id] = cache_insert_id();
	    property_drug_data[h][free_slot][property_id] = h;
	    property_drug_data[h][free_slot][prop_drug_id] = player_drug_data[playerid][slot][drug_id];
	    format(property_drug_data[h][free_slot][prop_drug_name], 64, "%s", player_drug_data[playerid][slot][drug_name]);
	    property_drug_data[h][free_slot][prop_drug_amount] = amount;
	    property_drug_data[h][free_slot][prop_drug_quality] = player_drug_data[playerid][slot][drug_quality];
	    property_drug_data[h][free_slot][prop_drug_size] = player_drug_data[playerid][slot][drug_size];
		property_drug_data[h][free_slot][is_exist] = true;

		cache_delete(cache);

		SendClientMessageEx(playerid, COLOR_DARKGREEN, "[Uyu�turucu] Evin i�erisine %0.1f gram %s %s koydun.", amount, Drug_GetName(player_drug_data[playerid][slot][drug_id]), player_drug_data[playerid][slot][drug_name]);
		cmd_ame(playerid, "evin i�erisine bir �eyler koyar.");

		player_drug_data[playerid][slot][drug_amount] -= amount;
		if(player_drug_data[playerid][slot][drug_amount] < 0.1) Drug_DefaultValues(playerid, slot);
		return 1;
	}
	else
	{
		new slot, Float: amount;
		if(sscanf(params, "if", slot, amount)) return SendUsageMessage(playerid, "/ukoy [uyu�turucu slotu] [gram]");
		if(slot < 1 || slot > 24) return SendErrorMessage(playerid, "Ge�ersiz slot belirttin.");
		if(!player_drug_data[playerid][slot][is_exist]) return SendErrorMessage(playerid, "Bu slotta uyu�turucun yok.");

		if(amount < 0.1 || amount > player_drug_data[playerid][slot][drug_amount])
		{
			return SendErrorMessage(playerid, "Girdi�in miktarda uyu�turucun yok.");
		}

		if(!IsPlayerInAnyVehicle(playerid) && GetNearestVehicle(playerid) != INVALID_VEHICLE_ID)
		{
			new Float: x, Float: y, Float: z;
			GetVehicleBoot(GetNearestVehicle(playerid), x, y, z);
			new	vehicleid = GetNearestVehicle(playerid);

			if(IsValidFactionCar(vehicleid) && PlayerData[playerid][pFaction] != CarData[vehicleid][carFaction])
	            return SendServerMessage(playerid, "Bu araca eri�imin yok.");

			if(CarData[vehicleid][carLocked])
				return SendServerMessage(playerid, "Bu ara� kilitli.");

			new engine, lights, alarm, doors, bonnet, boot, objective;
			GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);

			if(!boot)
				return SendClientMessage(playerid, COLOR_YELLOW, "SERVER: �lk �nce bagaj� a�mal�s�n.");

			if(GetVehicleDrugs(vehicleid) == MAX_PACK_SLOT-1)
				return SendServerMessage(playerid, "Bu ara�ta uyu�turucu koymaya yer kalmam��.");

			new drug_query[512], free_slot = GetNextVehicleDrugSlot(vehicleid);
			mysql_format(m_Handle, drug_query, sizeof(drug_query), "INSERT INTO vehicle_drugs (drug_name, drug_type, drug_amount, drug_quality, drug_size, vehicle_id, placed_by) VALUES ('%e', %i, %f, %i, %i, %i, %i)", player_drug_data[playerid][slot][drug_name], player_drug_data[playerid][slot][drug_id], amount, player_drug_data[playerid][slot][drug_quality], player_drug_data[playerid][slot][drug_size], CarData[vehicleid][carID], PlayerData[playerid][pSQLID]);
			new Cache:cache = mysql_query(m_Handle, drug_query);

		    vehicle_drug_data[vehicleid][free_slot][data_id] = cache_insert_id();
		    vehicle_drug_data[vehicleid][free_slot][veh_id] = CarData[vehicleid][carID];
		    vehicle_drug_data[vehicleid][free_slot][veh_drug_id] = player_drug_data[playerid][slot][drug_id];
		    format(vehicle_drug_data[vehicleid][free_slot][veh_drug_name], 64, "%s", player_drug_data[playerid][slot][drug_name]);
		    vehicle_drug_data[vehicleid][free_slot][veh_drug_amount] = amount;
		    vehicle_drug_data[vehicleid][free_slot][veh_drug_quality] = player_drug_data[playerid][slot][drug_quality];
		    vehicle_drug_data[vehicleid][free_slot][veh_drug_size] = player_drug_data[playerid][slot][drug_size];
			vehicle_drug_data[vehicleid][free_slot][is_exist] = true;

			cache_delete(cache);

			SendClientMessageEx(playerid, COLOR_DARKGREEN, "[Uyu�turucu] Arac�n i�erisine %0.1f gram %s %s koydun.", amount, Drug_GetName(player_drug_data[playerid][slot][drug_id]), player_drug_data[playerid][slot][drug_name]);
			cmd_ame(playerid, "arac�n i�erisine bir �eyler koyar.");

			player_drug_data[playerid][slot][drug_amount] -= amount;
			if(player_drug_data[playerid][slot][drug_amount] < 0.1) Drug_DefaultValues(playerid, slot);
			return 1;
		}
		else if(IsPlayerInAnyVehicle(playerid))
		{
			new vehicleid = GetPlayerVehicleID(playerid);

			if(IsValidFactionCar(vehicleid) && PlayerData[playerid][pFaction] != CarData[vehicleid][carFaction])
	            return SendServerMessage(playerid, "Bu araca eri�imin yok.");

			if(GetVehicleDrugs(vehicleid) == MAX_PACK_SLOT-1)
				return SendServerMessage(playerid, "Bu ara�ta uyu�turucu koymaya yer kalmam��.");

			new drug_query[512], free_slot = GetNextVehicleDrugSlot(vehicleid);
			mysql_format(m_Handle, drug_query, sizeof(drug_query), "INSERT INTO vehicle_drugs (drug_name, drug_type, drug_amount, drug_quality, drug_size, vehicle_id, placed_by) VALUES ('%e', %i, %f, %i, %i, %i, %i)", player_drug_data[playerid][slot][drug_name], player_drug_data[playerid][slot][drug_id], amount, player_drug_data[playerid][slot][drug_quality], player_drug_data[playerid][slot][drug_size], CarData[vehicleid][carID], PlayerData[playerid][pSQLID]);
			new Cache:cache = mysql_query(m_Handle, drug_query);

		    vehicle_drug_data[vehicleid][free_slot][data_id] = cache_insert_id();
		    vehicle_drug_data[vehicleid][free_slot][veh_id] = CarData[vehicleid][carID];
		    vehicle_drug_data[vehicleid][free_slot][veh_drug_id] = player_drug_data[playerid][slot][drug_id];
		    format(vehicle_drug_data[vehicleid][free_slot][veh_drug_name], 64, "%s", player_drug_data[playerid][slot][drug_name]);
		    vehicle_drug_data[vehicleid][free_slot][veh_drug_amount] = amount;
		    vehicle_drug_data[vehicleid][free_slot][veh_drug_quality] = player_drug_data[playerid][slot][drug_quality];
		    vehicle_drug_data[vehicleid][free_slot][veh_drug_size] = player_drug_data[playerid][slot][drug_size];
			vehicle_drug_data[vehicleid][free_slot][is_exist] = true;

			cache_delete(cache);

			SendClientMessageEx(playerid, COLOR_DARKGREEN, "[Uyu�turucu] Arac�n i�erisine %0.1f gram %s %s koydun.", amount, Drug_GetName(player_drug_data[playerid][slot][drug_id]), player_drug_data[playerid][slot][drug_name]);
			cmd_ame(playerid, "arac�n i�erisine bir �eyler koyar.");

			player_drug_data[playerid][slot][drug_amount] -= amount;
			if(player_drug_data[playerid][slot][drug_amount] < 0.1) Drug_DefaultValues(playerid, slot);
			return 1;
		}
	}

	SendErrorMessage(playerid, "Etraf�nda uyu�turucunu b�rakabilece�in yer yok.");
	return 1;
}

CMD:tuk(playerid, params[])return cmd_tumuyusturucularikoy(playerid, params);
CMD:tumuyusturucularikoy(playerid, params[])
{
	if(!IsPlayerInAnyVehicle(playerid)) return SendErrorMessage(playerid, "Herhangi bir ara� i�erisinde de�ilsin.");
	new vehicleid = GetPlayerVehicleID(playerid);
	if(!IsValidCar(vehicleid)) return SendErrorMessage(playerid, "Bu komut sadece sisteme kay�tl� ara�larda kullan�l�r.");
	if(!Player_GetDrugCount(playerid)) return SendErrorMessage(playerid, "Hi� uyu�turucun yok.");

	new emote[128];
	if(sscanf(params, "S('Yok')[128]", emote)) return SendUsageMessage(playerid, "/tumuyusturucularikoy [emote]");

	new Float: placed_amount, vehicle_space = false;
	for(new i = 1; i < MAX_PACK_SLOT; i++)
	{
		if(!vehicle_drug_data[vehicleid][i][is_exist])
		{
			vehicle_space = true;
			break;
		}
	}

	if(!vehicle_space) return SendErrorMessage(playerid, "Bu araca daha fazla uyu�turucu koyamazs�n.");

	new drug_query[512];
	new car_space = 0, drug_space = 0;
	for(new i = 1; i < MAX_PACK_SLOT; ++i)
	{
		if(!vehicle_drug_data[vehicleid][i][is_exist])
		{
			car_space++;
			for(new j = 1; j < MAX_PACK_SLOT; ++j)
			{
				if(player_drug_data[playerid][j][is_exist])
				{
					drug_space++;

					placed_amount += player_drug_data[playerid][j][drug_amount];

					mysql_format(m_Handle, drug_query, sizeof(drug_query), "INSERT INTO vehicle_drugs (drug_name, drug_type, drug_amount, drug_quality, drug_size, vehicle_id, placed_by) VALUES ('%e', %i, %f, %i, %i, %i, %i)", player_drug_data[playerid][j][drug_name], player_drug_data[playerid][j][drug_id], player_drug_data[playerid][j][drug_amount], player_drug_data[playerid][j][drug_quality], player_drug_data[playerid][j][drug_size], CarData[vehicleid][carID], PlayerData[playerid][pSQLID]);
					new Cache:cache = mysql_query(m_Handle, drug_query);

				    vehicle_drug_data[vehicleid][i][data_id] = cache_insert_id();
					vehicle_drug_data[vehicleid][i][veh_drug_id] = player_drug_data[playerid][j][drug_id];
					format(vehicle_drug_data[vehicleid][i][veh_drug_name], 64, "%s", player_drug_data[playerid][j][drug_name]);
					vehicle_drug_data[vehicleid][i][veh_drug_amount] = player_drug_data[playerid][j][drug_amount];
					vehicle_drug_data[vehicleid][i][veh_drug_quality] = player_drug_data[playerid][j][drug_quality];
					vehicle_drug_data[vehicleid][i][veh_drug_size] = player_drug_data[playerid][j][drug_size];
					vehicle_drug_data[vehicleid][i][is_exist] = true;

					cache_delete(cache);

					Drug_DefaultValues(playerid, j);

					if(drug_space % car_space == 0)
						break;
				}
			}
		}
	}

	SendClientMessageEx(playerid, COLOR_DARKGREEN, "[Uyu�turucu] Arac�n i�erisine toplam %0.1f gram uyu�turucu koydun.", placed_amount);
	if(strfind(emote, "Yok", true) != -1) cmd_ame(playerid, "arac�n i�erisinden bir �eyler al�r.");
	else cmd_ame(playerid, sprintf("%s", emote));
	return 1;
}

CMD:tua(playerid, params[]) return cmd_tumuyusturucularial(playerid, params);
CMD:tumuyusturucularial(playerid, params[])
{
	if(!IsPlayerInAnyVehicle(playerid)) return SendErrorMessage(playerid, "Herhangi bir ara� i�erisinde de�ilsin.");
	new vehicleid = GetPlayerVehicleID(playerid);
	if(!IsValidCar(vehicleid)) return SendErrorMessage(playerid, "Bu komut sadece sisteme kay�tl� ara�larda kullan�l�r.");

	new free_slot = Drug_GetPlayerNextSlot(playerid);
	if(free_slot == -1) return SendErrorMessage(playerid, "�st�nde daha fazla uyu�turucu bulunduramazs�n.");
	if(!Vehicle_GetDrugCount(vehicleid)) return SendErrorMessage(playerid, "Bu ara�ta hi� uyu�turucu yok.");

	new emote[128];
	if(sscanf(params, "S('Yok')[128]", emote)) return SendUsageMessage(playerid, "/tumuyusturucularial [emote]");

	new drug_query[512];
	new Float: tooked_amount, player_space = 0, car_space = 0;
	for(new i = 1; i < MAX_PACK_SLOT; ++i)
	{
		if(!player_drug_data[playerid][i][is_exist])
		{
			player_space++;
			for (new j = 1; j < MAX_PACK_SLOT; j++)
			{
				if(vehicle_drug_data[vehicleid][j][is_exist])
				{
					car_space++;
					tooked_amount += vehicle_drug_data[vehicleid][j][veh_drug_amount];

					mysql_format(m_Handle, drug_query, sizeof(drug_query), "INSERT INTO player_drugs (player_dbid, drug_name, drug_type, drug_amount, drug_quality, drug_size) VALUES (%i, '%e', %i, %f, %i, %i)", PlayerData[playerid][pSQLID], vehicle_drug_data[vehicleid][j][veh_drug_name], vehicle_drug_data[vehicleid][j][veh_drug_id], vehicle_drug_data[vehicleid][j][veh_drug_amount], vehicle_drug_data[vehicleid][j][veh_drug_quality], vehicle_drug_data[vehicleid][j][veh_drug_size]);
					new Cache: cache = mysql_query(m_Handle, drug_query);

					player_drug_data[playerid][i][data_id] = cache_insert_id();
					player_drug_data[playerid][i][drug_id] = vehicle_drug_data[vehicleid][j][veh_drug_id];
					format(player_drug_data[playerid][i][drug_name], 64, "%s", vehicle_drug_data[vehicleid][j][veh_drug_name]);
					player_drug_data[playerid][i][drug_amount] = vehicle_drug_data[vehicleid][j][veh_drug_amount];
					player_drug_data[playerid][i][drug_quality] = vehicle_drug_data[vehicleid][j][veh_drug_quality];
					player_drug_data[playerid][i][drug_size] = vehicle_drug_data[vehicleid][j][veh_drug_size];
					player_drug_data[playerid][i][is_exist] = true;

					cache_delete(cache);

					Drug_VehicleDefaultValues(vehicleid, j);

					if(car_space % player_space == 0)
						break;
				}
			}
		}
	}

	SendClientMessageEx(playerid, COLOR_DARKGREEN, "[Uyu�turucu] Arac�n i�erisine toplam %0.1f gram uyu�turucu ald�n.", tooked_amount);
	if(strfind(emote, "Yok", true) != -1) cmd_ame(playerid, "arac�n i�erisinden bir �eyler al�r.");
	else cmd_ame(playerid, sprintf("%s", emote));
	return 1;
}

CMD:kontrol(playerid, params[])
{
	new option[12];
	if(sscanf(params, "s[12]", option)) return SendUsageMessage(playerid, "/kontrol [(s)ilah/(u)yusturucu]");
    if(!strcmp(option, "silah", true) || !strcmp(option, "s", true))
	{
		SendClientMessage(playerid, COLOR_ADM, "/silahal [slot] ile silah�n�z� alabilirsiniz.");
		new h = -1;
		if((h = IsPlayerInProperty(playerid)) != -1)
		{
			if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu eve sahip de�ilsin.");

		    ListPropertyWeaps(playerid, h);
	 		return 1;
		}
		else
		{
			if(!IsPlayerInAnyVehicle(playerid) && GetNearestVehicle(playerid) != INVALID_VEHICLE_ID)
			{
			    new Float: x, Float: y, Float: z;
				GetVehicleBoot(GetNearestVehicle(playerid), x, y, z);
				new vehicleid = GetNearestVehicle(playerid);


				if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece �zel ara�larda kullan�l�r.");
				if(IsValidFactionCar(vehicleid) && PlayerData[playerid][pFaction] != CarData[vehicleid][carFaction] && !FactionData[CarData[vehicleid][carFaction]][FactionCopPerms])
		        {
		        	if(CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID]) return SendServerMessage(playerid, "Bu araca m�dahale edemezsin.");
		        }

				if(!IsPlayerInRangeOfPoint(playerid, 2.5, x, y, z)) return SendErrorMessage(playerid, "Arac�n bagaj�na yak�n de�ilsin.");
				if(CarData[vehicleid][carLocked]) return SendErrorMessage(playerid, "Bu ara� kilitli.");
				ListTrunkWeapons(playerid, vehicleid);
				return 1;
			}
			else if(IsPlayerInAnyVehicle(playerid))
			{
				new	vehicleid = GetPlayerVehicleID(playerid);
				if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece �zel ara�larda kullan�l�r.");
				if(IsValidFactionCar(vehicleid) && PlayerData[playerid][pFaction] != CarData[vehicleid][carFaction] && !FactionData[CarData[vehicleid][carFaction]][FactionCopPerms])
		        {
		        	if(CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID]) return SendServerMessage(playerid, "Bu araca m�dahale edemezsin.");
		        }

				ListTrunkWeapons(playerid, vehicleid);
				return 1;
			}
		}

		SendErrorMessage(playerid, "Etraf�nda kontrol edebilece�in bir �ey yok.");
	}
 	else if(!strcmp(option, "uyusturucu", true) || !strcmp(option, "u", true))
	{
		new h = -1;
		if((h = IsPlayerInProperty(playerid)) != -1)
		{
			if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu eve sahip de�ilsin.");
			if(!IsPlayerInRangeOfPoint(playerid, 3.0, PropertyData[h][PropertyCheck][0], PropertyData[h][PropertyCheck][1], PropertyData[h][PropertyCheck][2]))
		    	return SendErrorMessage(playerid, "Zula noktas�na yak�n de�ilsin.");

		    Property_ListDrugs(playerid, h, false);
	 		return 1;
		}
		else
		{
			if(!IsPlayerInAnyVehicle(playerid) && GetNearestVehicle(playerid) != INVALID_VEHICLE_ID)
			{
			    new Float: x, Float: y, Float: z;
				GetVehicleBoot(GetNearestVehicle(playerid), x, y, z);
				new vehicleid = GetNearestVehicle(playerid);

				if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece �zel ara�larda kullan�l�r.");
				if(IsValidFactionCar(vehicleid) && PlayerData[playerid][pFaction] != CarData[vehicleid][carFaction] && !FactionData[CarData[vehicleid][carFaction]][FactionCopPerms])
		        {
		        	if(CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID]) return SendServerMessage(playerid, "Bu araca m�dahale edemezsin.");
		        }

				if(!IsPlayerInRangeOfPoint(playerid, 2.5, x, y, z)) return SendErrorMessage(playerid, "Arac�n bagaj�na yak�n de�ilsin.");
				if(CarData[vehicleid][carLocked]) return SendErrorMessage(playerid, "Bu ara� kilitli.");
				Vehicle_ListDrugs(playerid, vehicleid, false);
				return 1;
			}
			else if(IsPlayerInAnyVehicle(playerid))
			{
				new	vehicleid = GetPlayerVehicleID(playerid);
				if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece �zel ara�larda kullan�l�r.");
				if(IsValidFactionCar(vehicleid) && PlayerData[playerid][pFaction] != CarData[vehicleid][carFaction] && !FactionData[CarData[vehicleid][carFaction]][FactionCopPerms])
		        {
		        	if(CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID]) return SendServerMessage(playerid, "Bu araca m�dahale edemezsin.");
		        }

		    	Vehicle_ListDrugs(playerid, vehicleid, false);
		    	return 1;
		    }
		}

		SendErrorMessage(playerid, "Etraf�nda kontrol edebilece�in bir �ey yok.");
	}
	else SendServerMessage(playerid, "Hatal� parametre girdin.");
	return 1;
}

CMD:silah(playerid, params[])
{
	new specifier[24];

	new b_string[90];

	if(sscanf(params, "s[24]S()[90]", specifier, b_string))
	{
		SendUsageMessage(playerid, "/silah [ayarla/kemik/sakla/bilgi/inp(el ile pos. ayarlama)/resetpos]");
		return 1;
	}

	new weaponid = GetPlayerWeapon(playerid);
    if(!weaponid) return SendErrorMessage(playerid, "Silah tutmuyorsun.");
    if(!Player_HasWeapon(playerid, weaponid)) return SendErrorMessage(playerid, "Bu silah sende yok.");
    if(!IsWeaponWearable(weaponid)) return SendErrorMessage(playerid, "Bu komutu tuttu�un silah �zerinde kullanamazs�n.");

    else if(!strcmp(specifier, "ayarla"))
    {
        if(EditingDisplay[playerid]) return SendErrorMessage(playerid, "Zaten bir silah d�zenliyorsun.");
        if(WeaponSettings[playerid][weaponid-22][WeaponHidden]) return SendErrorMessage(playerid, "Saklam�� oldu�un silah� d�zenleyemezsin.");

        new index = weaponid - 22;
        SetPlayerArmedWeapon(playerid, 0);
        SetPlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid), ReturnWeaponsModel(weaponid), WeaponSettings[playerid][index][WeaponBone], WeaponSettings[playerid][index][WeaponPos][0], WeaponSettings[playerid][index][WeaponPos][1], WeaponSettings[playerid][index][WeaponPos][2], WeaponSettings[playerid][index][WeaponPos][3], WeaponSettings[playerid][index][WeaponPos][4], WeaponSettings[playerid][index][WeaponPos][5], 1.0, 1.0, 1.0);
        EditAttachedObject(playerid, GetWeaponObjectSlot(weaponid));
        EditingDisplay[playerid] = weaponid;
    }

		else if(!strcmp(specifier, "inp"))
		{
				if(EditingDisplay[playerid]) return SendErrorMessage(playerid, "Zaten bir silah d�zenliyorsun.");
				if(WeaponSettings[playerid][weaponid-22][WeaponHidden]) return SendErrorMessage(playerid, "Saklam�� oldu�un silah� d�zenleyemezsin.");

				new index = weaponid - 22;
				SetPVarInt(playerid, "weaponLastIndex", index);
				SetPVarInt(playerid, "weaponLastWeapon", weaponid);
				Dialog_Show(playerid, WEAPON_CHANGEPOSITION, DIALOG_STYLE_LIST, "{D2D2D2}Hangisini de�i�tirmek istersiniz?", "{A9C4E4}1\tPozisyon\n{A9C4E4}2\tRotasyon", "Se�", "<< Kapat");
		}

		else if(!strcmp(specifier, "resetpos"))
		{
				if(EditingDisplay[playerid]) return SendErrorMessage(playerid, "Zaten bir silah d�zenliyorsun.");
				if(WeaponSettings[playerid][weaponid-22][WeaponHidden]) return SendErrorMessage(playerid, "Saklam�� oldu�un silah� d�zenleyemezsin.");

				new index = weaponid - 22;
				Weapon_ResetWepPos(playerid, index);

				new
						search_query[356];
				mysql_format(m_Handle, search_query, sizeof(search_query), "SELECT id FROM weapon_attachments WHERE WeaponID = %d AND playerdbid = %d", weaponid, PlayerData[playerid][pSQLID]);
				mysql_tquery(m_Handle, search_query, "CheckWeaponAttachements", "id", playerid, weaponid);

				SendMessage(playerid, "{FF6347}%s {FFFFFF}adl� silah�n aksesuar olarak konumlar� s�f�rland�.", ReturnWeaponName(weaponid));
		}

		else if(!strcmp(specifier, "bilgi"))
		{
			if(EditingDisplay[playerid]) return SendErrorMessage(playerid, "Zaten bir silah d�zenliyorsun.");

			new pid;
			if (sscanf(b_string, "I(-1)", pid)) return SendUsageMessage(playerid, "/silah bilgi [playerID(iste�e ba�l�)]");

			new index = weaponid - 22;
			if(pid == -1)
			{
				SendMessage(playerid, " ");
				SendMessage(playerid, "{FF6347}%s {FFFFFF}i�in konumland�rma de�erleri:", ReturnWeaponName(weaponid));
				SendMessage(playerid, "{FFFFFF}Pozisyon de�erleri X: {FF6347}%2.f{FFFFFF}, Y: {FF6347}%2.f{FFFFFF}, Z: {FF6347}%2.f",WeaponSettings[playerid][index][WeaponPos][0], WeaponSettings[playerid][index][WeaponPos][1], WeaponSettings[playerid][index][WeaponPos][2]);
				SendMessage(playerid, "{FFFFFF}Rotasyon de�erleri X: {FF6347}%2.f{FFFFFF}, Y: {FF6347}%2.f{FFFFFF}, Z: {FF6347}%2.f",WeaponSettings[playerid][index][WeaponPos][3], WeaponSettings[playerid][index][WeaponPos][4], WeaponSettings[playerid][index][WeaponPos][5]);
			}
			else
			{

				if(pid == playerid)
					return SendClientMessage(playerid, COLOR_GREY, "Bu komutu kendi �zerinde kullanamazs�n.");

				if(!IsPlayerConnected(pid))
					return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");

				if(!pLoggedIn[pid])
					return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");

				if(!GetDistanceBetweenPlayers(playerid, pid, 6.0))
					return SendClientMessage(playerid, COLOR_GREY, "SERVER: Bu ki�iye yak�n de�ilsin.");

					SendMessage(playerid, "{FF6347}%s {FFFFFF}adl� ki�iye {FF6347}M4 {FFFFFF}silah�n�n aksesuar pozisyonlar� g�nderildi.", ReturnName(pid));
					SendMessage(pid, " ");
					SendMessage(pid, "{FF6347}%s {FFFFFF}i�in konumland�rma de�erleri: (%s)", ReturnWeaponName(weaponid), ReturnName(playerid));
					SendMessage(pid, "{FFFFFF}Pozisyon de�erleri X: {FF6347}%2.f{FFFFFF}, Y: {FF6347}%2.f{FFFFFF}, Z: {FF6347}%2.f",WeaponSettings[playerid][index][WeaponPos][0], WeaponSettings[playerid][index][WeaponPos][1], WeaponSettings[playerid][index][WeaponPos][2]);
					SendMessage(pid, "{FFFFFF}Rotasyon de�erleri X: {FF6347}%2.f{FFFFFF}, Y: {FF6347}%2.f{FFFFFF}, Z: {FF6347}%2.f",WeaponSettings[playerid][index][WeaponPos][3], WeaponSettings[playerid][index][WeaponPos][4], WeaponSettings[playerid][index][WeaponPos][5]);
			}
		}

		else if(!strcmp(specifier, "kemik"))
		{
			if(EditingDisplay[playerid]) return SendErrorMessage(playerid, "Zaten bir silah d�zenliyorsun.");

			new
				primary[454], sub[60];

			for(new j = 1; j <= 18; j++)
			{
				format(sub, sizeof(sub), "%s\n", Clothing_Bone(j));
				strcat(primary, sub);
			}

	        Dialog_Show(playerid, BONE_EDIT, DIALOG_STYLE_LIST, "Kemik", primary, "Se�", "�ptal");
	        EditingDisplay[playerid] = weaponid;
		}
		else if(!strcmp(specifier, "sakla"))
    {
    	if(EditingDisplay[playerid]) return SendErrorMessage(playerid, "Silah d�zenlerken saklayamazs�n.");
        if(!IsWeaponHideable(weaponid)) return SendErrorMessage(playerid, "Bu silah saklanamaz.");

        new index = weaponid - 22;

        if (WeaponSettings[playerid][index][WeaponHidden])
        {
            SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Art�k %s isimli silah �st�nde g�r�n�r halde olacak.", ReturnWeaponName(weaponid));
            WeaponSettings[playerid][index][WeaponHidden] = false;
        }
        else
        {
            if(IsPlayerAttachedObjectSlotUsed(playerid, GetWeaponObjectSlot(weaponid)))
                RemovePlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid));

            SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Art�k %s isimli silah �st�nde g�r�nmez halde olacak.", ReturnWeaponName(weaponid));
            WeaponSettings[playerid][index][WeaponHidden] = true;
        }
				new
						search_query[356];
				mysql_format(m_Handle, search_query, sizeof(search_query), "SELECT id FROM weapon_attachments WHERE WeaponID = %d AND playerdbid = %d", weaponid, PlayerData[playerid][pSQLID]);
				mysql_tquery(m_Handle, search_query, "CheckWeaponAttachements", "id", playerid, weaponid);
    }
  else SendErrorMessage(playerid, "Hatal� parametre girdiniz.");
	return 1;
}

CMD:silahver(playerid, params[])
{
	if(IsLAWFaction(playerid)) return UnAuthMessage(playerid);
 	if(IsPlayerInAnyVehicle(playerid)) return SendErrorMessage(playerid, "Ara� i�inde bu komutu kullanamazs�n.");

	new	playerb, wepid;
	if(sscanf(params, "ui", playerb, wepid)) return SendUsageMessage(playerid, "/silahver [oyuncu ID/isim] [silah ID]");
	if(playerb == playerid) return SendErrorMessage(playerid, "Kendine silah veremezsin.");
	if(!IsPlayerConnected(playerb)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
	if(!pLoggedIn[playerb]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
	if(!GetDistanceBetweenPlayers(playerid, playerb, 2.0)) return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");
 	if(IsPlayerInAnyVehicle(playerb)) return SendErrorMessage(playerid, "Belirtti�in ki�i ara� i�inde olmamal�.");

	if(wepid <= 1 || wepid > 46 || wepid == 35 || wepid == 36 || wepid == 37 || wepid == 38 || wepid == 39 || wepid == 21 || wepid == 19)
	    return SendErrorMessage(playerid, "Hatal� silah ID girdin.");

	if(!Player_HasWeapon(playerid, wepid)) return SendErrorMessage(playerid, "Bu silah sende yok.");
	if(Player_HasWeapon(playerb, wepid)) return SendErrorMessage(playerid, "Bu silah belirtti�in ki�ide mevcut.");

    new count;
    if(Player_HasWeapon(playerb, 22))
    {
        count++;
    }

    if(Player_HasWeapon(playerb, 23))
    {
        count++;
    }

    if(Player_HasWeapon(playerb, 24))
    {
        count++;
    }

    if(Player_HasWeapon(playerb, 25))
    {
        count++;
    }

    if(Player_HasWeapon(playerb, 26))
    {
        count++;
    }

    if(Player_HasWeapon(playerb, 27))
    {
        count++;
    }

    if(Player_HasWeapon(playerb, 28))
    {
        count++;
    }

    if(Player_HasWeapon(playerb, 29))
    {
        count++;
    }

    if(Player_HasWeapon(playerb, 30))
    {
        count++;
    }

    if(Player_HasWeapon(playerb, 31))
    {
        count++;
    }

    if(Player_HasWeapon(playerb, 32))
    {
        count++;
    }

    if(Player_HasWeapon(playerb, 33))
    {
        count++;
    }

    if(Player_HasWeapon(playerb, 34))
    {
        count++;
    }

    if(count >= 2)
    {
        return SendErrorMessage(playerid, "Silah�n� vermeye �al��t���n ki�i iki adet silah ta��yor daha fazlas�n� ta��yamaz.");
    }

	SendClientMessageEx(playerid, COLOR_ORANGE, "SERVER: %s isimli ki�iye %i mermili %s verdin.", ReturnName(playerb, 0), PlayerData[playerid][pWeaponsAmmo][ Weapon_GetSlotID(wepid) ], ReturnWeaponName(wepid));
	SendClientMessageEx(playerb, COLOR_ORANGE, "SERVER: %s sana %i mermili %s verdi.", ReturnName(playerid, 0), PlayerData[playerid][pWeaponsAmmo][ Weapon_GetSlotID(wepid) ], ReturnWeaponName(wepid));

	GivePlayerWeapon(playerb, wepid, PlayerData[playerid][pWeaponsAmmo][ Weapon_GetSlotID(wepid) ]);
	PlayerData[playerid][pWeaponsAmmo][ Weapon_GetSlotID(wepid) ] = 0;
	PlayerData[playerid][pWeapons][ Weapon_GetSlotID(wepid) ] = 0;
	Player_RemoveWeapon(playerid, wepid);
	return 1;
}

CMD:silahlarim(playerid, params[])
{
	if(IsLAWFaction(playerid)) return UnAuthMessage(playerid);
	SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Silah� b�rakmak i�in, /silahbirak [silah ID]");

	new count;
	for(new i = 0; i < 4; i++) if(PlayerData[playerid][pWeaponsAmmo][i] > 0)
	{
		SendClientMessageEx(playerid, COLOR_ADM, "[ {FFFFFF}%i. %s - %i mermi {FF6347}]", PlayerData[playerid][pWeapons][i], ReturnWeaponName(PlayerData[playerid][pWeapons][i]), PlayerData[playerid][pWeaponsAmmo][i]);
		count++;
	}

	if(!count) SendClientMessage(playerid, COLOR_WHITE, "Hi� silah�n yok.");
	return 1;
}

CMD:silahbirak(playerid, params[])
{
	if(IsLAWFaction(playerid)) return UnAuthMessage(playerid);
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_ADM, "HATA: Ara� i�erisinde bu komutu kullanamazs�n.");

	new weaponid;
	if(sscanf(params, "i", weaponid))
	{
		SendUsageMessage(playerid, "/silahbirak [silah ID]");
		SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Silah� yerden almak i�in, /silahal yazabilirsin.");
		return 1;
	}

	if(weaponid < 1 || weaponid > 46 || weaponid == 35 || weaponid == 36 || weaponid == 37 || weaponid == 38 || weaponid == 39)
		return SendErrorMessage(playerid, "Ge�ersiz silah ID belirttin.");

	if(!Player_HasWeapon(playerid, weaponid)) return SendErrorMessage(playerid, "Bu silah sende yok.");

	new id = Iter_Free(Drops);
	if(id == -1) return SendErrorMessage(playerid, "G�r�n��e g�re silah� b�rakmak �u anda m�mk�n de�il.");
	new weap_slot = Weapon_GetSlotID(weaponid);

	DropData[id][DropType] = 1;
	DropData[id][DropWeaponID] = weaponid;
	DropData[id][DropWeaponAmmo] = PlayerData[playerid][pWeaponsAmmo][weap_slot];

	PlayerData[playerid][pWeapons][weap_slot] = 0;
	PlayerData[playerid][pWeaponsAmmo][weap_slot] = 0;
	Player_RemoveWeapon(playerid, weaponid);

	GetPlayerPos(playerid, DropData[id][DropLocation][0], DropData[id][DropLocation][1], DropData[id][DropLocation][2]);
	DropData[id][DropInterior] = GetPlayerInterior(playerid); DropData[id][DropWorld] = GetPlayerVirtualWorld(playerid);

	DropData[id][DroppedBy] = PlayerData[playerid][pSQLID];
	DropData[id][DropObjID] = CreateDynamicObject(ReturnWeaponsModel(weaponid), DropData[id][DropLocation][0], DropData[id][DropLocation][1], DropData[id][DropLocation][2] - 1.0, 80.0, 0.0, 0.0, DropData[id][DropWorld], DropData[id][DropInterior]);
	DropData[id][DropTimer] = SetTimerEx("Drop_GunRemove", 600000, false, "i", id);
	Iter_Add(Drops, id);

	SendClientMessage(playerid, COLOR_ADM, "[!] Silah�n 10 dakika i�erisinde kaybolacak. /silahal yazarak geri alabilirsin.");
	cmd_ame(playerid, sprintf("yere %s model silah b�rak�r.", ReturnWeaponName(weaponid)));
	return 1;
}

CMD:silahkoy(playerid, params[])
{
	new h = -1;
	if((h = IsPlayerInProperty(playerid)) != -1)
	{
		if(IsLAWFaction(playerid)) return UnAuthMessage(playerid);
		if(!Property_Count(playerid)) return SendErrorMessage(playerid, "Hi� evin yok.");
		if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu eve sahip de�ilsin.");
		/*if(!IsPlayerInRangeOfPoint(playerid, 3.0, PropertyData[h][PropertyCheck][0], PropertyData[h][PropertyCheck][1], PropertyData[h][PropertyCheck][2]))
		    return SendErrorMessage(playerid, "Zula noktas�na yak�n de�ilsin.");*/

		new weapid, slot;
		if(sscanf(params, "i", weapid)) return SendUsageMessage(playerid, "/silahkoy [silah ID]");
		if(!Player_HasWeapon(playerid, weapid)) return SendServerMessage(playerid, "Bu silah sende yok.");
		if(GetPropertyWeps(h) == MAX_PACK_SLOT-1) return SendServerMessage(playerid, "Bu evde silah koymaya yer kalmam��.");

		slot = GetNextPropertyWeapSlot(h);

		new weap_query[200];
		mysql_format(m_Handle, weap_query, sizeof(weap_query), "INSERT INTO property_weapons (weapon, ammo, property_id, placed_by) VALUES(%i, %i, %i, %i)", PlayerData[playerid][pWeapons][ Weapon_GetSlotID(weapid) ], PlayerData[playerid][pWeaponsAmmo][ Weapon_GetSlotID(weapid) ], h, PlayerData[playerid][pSQLID]);
		mysql_tquery(m_Handle, weap_query, "AddWeaponToProperty", "iiiii", playerid, h, slot, PlayerData[playerid][pWeapons][ Weapon_GetSlotID(weapid) ], PlayerData[playerid][pWeaponsAmmo][ Weapon_GetSlotID(weapid) ]);
		return 1;
	}
	else
	{

		new
			Float: x,
			Float: y,
			Float: z,
			weapid,
			slot;

		if(sscanf(params, "i", weapid)) return SendUsageMessage(playerid, "/silahkoy [silah ID]");
		if(!Player_HasWeapon(playerid, weapid)) return SendServerMessage(playerid, "Bu silah sende yok.");

		if(!IsPlayerInAnyVehicle(playerid) && GetNearestVehicle(playerid) != INVALID_VEHICLE_ID)
		{
			GetVehicleBoot(GetNearestVehicle(playerid), x, y, z);
			new	vehicleid = GetNearestVehicle(playerid);

			if(IsValidRentalCar(vehicleid)) return UnAuthMessage(playerid);

			if(IsLAWFaction(playerid) && !IsValidFactionCar(vehicleid) && PlayerData[playerid][pFaction] != CarData[vehicleid][carFaction])
				return UnAuthMessage(playerid);

			if(IsValidFactionCar(vehicleid) && PlayerData[playerid][pFaction] != CarData[vehicleid][carFaction])
	            return SendServerMessage(playerid, "Bu araca eri�imin yok.");

			new engine, lights, alarm, doors, bonnet, boot, objective;
			GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);

			if(!boot)
				return SendClientMessage(playerid, COLOR_YELLOW, "SERVER: �lk �nce bagaj� a�mal�s�n.");

			if(GetVehicleTrunkWeps(vehicleid) == MAX_WEP_SLOT-1)
				return SendServerMessage(playerid, "Bu ara�ta silah koymaya yer kalmam��.");

			slot = GetNextVehicleTrunkSlot(vehicleid);
			//ammo = ReturnWeaponAmmo(playerid, weapon_id);

			if(CarData[vehicleid][carFaction] != -1)
			{
				if(FactionData[CarData[vehicleid][carFaction]][FactionCopPerms])
				{
				    vehicle_weap_data[vehicleid][slot][data_id] = 0;
				    vehicle_weap_data[vehicleid][slot][veh_wep] = weapid;
				    vehicle_weap_data[vehicleid][slot][veh_ammo] = PlayerData[playerid][pWeaponsAmmo][ Weapon_GetSlotID(weapid) ];
				    vehicle_weap_data[vehicleid][slot][is_exist] = true;
				    vehicle_weap_data[vehicleid][slot][veh_id] = CarData[vehicleid][carID];
					for(new i = 0; i < 6; i++) vehicle_weap_data[vehicleid][slot][wep_offset][i] = 0.0;

					Player_RemoveWeapon(playerid, weapid);
					PlayerData[playerid][pWeapons][ Weapon_GetSlotID(weapid) ] = 0;
					PlayerData[playerid][pWeaponsAmmo][ Weapon_GetSlotID(weapid) ] = 0;
				    cmd_ame(playerid, sprintf("%s model araca %s koyar.", ReturnVehicleName(vehicleid), ReturnWeaponName(weapid)));
				}
				else
				{
					new weap_query[300];
					mysql_format(m_Handle, weap_query, sizeof(weap_query), "INSERT INTO vehicle_weapons (weapon, ammo, vehicle_id, placed_by) VALUES(%i, %i, %i, %i)", PlayerData[playerid][pWeapons][ Weapon_GetSlotID(weapid) ], PlayerData[playerid][pWeaponsAmmo][ Weapon_GetSlotID(weapid) ], CarData[vehicleid][carID], PlayerData[playerid][pSQLID]);
					mysql_tquery(m_Handle, weap_query, "AddWeaponToTrunk", "iiiii", playerid, vehicleid, slot, PlayerData[playerid][pWeapons][ Weapon_GetSlotID(weapid) ], PlayerData[playerid][pWeaponsAmmo][ Weapon_GetSlotID(weapid) ]);
				}
			}
			else {
				new weap_query[300];
				mysql_format(m_Handle, weap_query, sizeof(weap_query), "INSERT INTO vehicle_weapons (weapon, ammo, vehicle_id, placed_by) VALUES(%i, %i, %i, %i)", PlayerData[playerid][pWeapons][ Weapon_GetSlotID(weapid) ], PlayerData[playerid][pWeaponsAmmo][ Weapon_GetSlotID(weapid) ], CarData[vehicleid][carID], PlayerData[playerid][pSQLID]);
				mysql_tquery(m_Handle, weap_query, "AddWeaponToTrunk", "iiiii", playerid, vehicleid, slot, PlayerData[playerid][pWeapons][ Weapon_GetSlotID(weapid) ], PlayerData[playerid][pWeaponsAmmo][ Weapon_GetSlotID(weapid) ]);
			}
			return 1;
		}
		else if(IsPlayerInAnyVehicle(playerid))
		{
			new vehicleid = GetPlayerVehicleID(playerid);

			if(IsValidRentalCar(vehicleid)) return UnAuthMessage(playerid);

			if(IsLAWFaction(playerid) && !IsValidFactionCar(vehicleid) && PlayerData[playerid][pFaction] != CarData[vehicleid][carFaction])
				return UnAuthMessage(playerid);

			if(IsValidFactionCar(vehicleid) && PlayerData[playerid][pFaction] != CarData[vehicleid][carFaction])
	            return SendServerMessage(playerid, "Bu araca eri�imin yok.");

			if(GetVehicleTrunkWeps(vehicleid) == MAX_WEP_SLOT-1)
				return SendServerMessage(playerid, "Bu ara�ta silah koymaya yer kalmam��.");

			slot = GetNextVehicleTrunkSlot(vehicleid);
			//ammo = ReturnWeaponAmmo(playerid, weapon_id);

			if(FactionData[CarData[vehicleid][carFaction]][FactionCopPerms])
			{
			    vehicle_weap_data[vehicleid][slot][data_id] = 0;
			    vehicle_weap_data[vehicleid][slot][veh_wep] = weapid;
			    vehicle_weap_data[vehicleid][slot][veh_ammo] = PlayerData[playerid][pWeaponsAmmo][ Weapon_GetSlotID(weapid) ];
			    vehicle_weap_data[vehicleid][slot][is_exist] = true;
			    vehicle_weap_data[vehicleid][slot][veh_id] = CarData[vehicleid][carID];
				for(new i = 0; i < 6; i++) vehicle_weap_data[vehicleid][slot][wep_offset][i] = 0.0;

				Player_RemoveWeapon(playerid, weapid);
				PlayerData[playerid][pWeapons][ Weapon_GetSlotID(weapid) ] = 0;
				PlayerData[playerid][pWeaponsAmmo][ Weapon_GetSlotID(weapid) ] = 0;
			    cmd_ame(playerid, sprintf("%s model araca %s koyar.", ReturnVehicleName(vehicleid), ReturnWeaponName(weapid)));
			} else {
				new weap_query[300];
				mysql_format(m_Handle, weap_query, sizeof(weap_query), "INSERT INTO vehicle_weapons (weapon, ammo, vehicle_id, placed_by) VALUES(%i, %i, %i, %i)", PlayerData[playerid][pWeapons][ Weapon_GetSlotID(weapid) ], PlayerData[playerid][pWeaponsAmmo][ Weapon_GetSlotID(weapid) ], CarData[vehicleid][carID], PlayerData[playerid][pSQLID]);
				mysql_tquery(m_Handle, weap_query, "AddWeaponToTrunk", "iiiii", playerid, vehicleid, slot, PlayerData[playerid][pWeapons][ Weapon_GetSlotID(weapid) ], PlayerData[playerid][pWeaponsAmmo][ Weapon_GetSlotID(weapid) ]);
			}
			return 1;
		}
	}

	SendErrorMessage(playerid, "Etraf�nda silah�n� b�rakabilece�in yer yok.");
	return 1;
}

CMD:silahal(playerid, params[])
{
    new count;
    if(Player_HasWeapon(playerid, 22))
    {
        count++;
    }

    if(Player_HasWeapon(playerid, 23))
    {
        count++;
    }

    if(Player_HasWeapon(playerid, 24))
    {
        count++;
    }

    if(Player_HasWeapon(playerid, 25))
    {
        count++;
    }

    if(Player_HasWeapon(playerid, 26))
    {
        count++;
    }

    if(Player_HasWeapon(playerid, 27))
    {
        count++;
    }

    if(Player_HasWeapon(playerid, 28))
    {
        count++;
    }

    if(Player_HasWeapon(playerid, 29))
    {
        count++;
    }

    if(Player_HasWeapon(playerid, 30))
    {
        count++;
    }

    if(Player_HasWeapon(playerid, 31))
    {
        count++;
    }

    if(Player_HasWeapon(playerid, 32))
    {
        count++;
    }

    if(Player_HasWeapon(playerid, 33))
    {
        count++;
    }

    if(Player_HasWeapon(playerid, 34))
    {
        count++;
    }

    if(count >= 2)
    {
        return SendErrorMessage(playerid, "�st�nde en fazla iki silah bulundurabilirsin.");
    }

	new id = -1;
	if((id = Drop_Nearest(playerid)) != -1)
	{
		if(DropData[id][DropType] != 1)
			return SendErrorMessage(playerid, "Yerdeki silah de�il.");

		if(Player_HasWeapon(playerid, DropData[id][DropWeaponID]))
			return SendErrorMessage(playerid, "Bu silah zaten sende var.");

        if(Player_HasWeapon(playerid, 25))
        {
            if(Weapon_SlotID(playerid, DropData[id][DropWeaponID]) == 3)
            {
                return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
            }
        }

        if(Player_HasWeapon(playerid, 26))
        {
            if(Weapon_SlotID(playerid, DropData[id][DropWeaponID]) == 3)
            {
                return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
            }
        }

        if(Player_HasWeapon(playerid, 27))
        {
            if(Weapon_SlotID(playerid, DropData[id][DropWeaponID]) == 3)
            {
                return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
            }
        }

        if(Player_HasWeapon(playerid, 28))
        {
            if(Weapon_SlotID(playerid, DropData[id][DropWeaponID]) == 3)
            {
                return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
            }
        }

        if(Player_HasWeapon(playerid, 29))
        {
            if(Weapon_SlotID(playerid, DropData[id][DropWeaponID]) == 3)
            {
                return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
            }
        }

        if(Player_HasWeapon(playerid, 30))
        {
            if(Weapon_SlotID(playerid, DropData[id][DropWeaponID]) == 3)
            {
                return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
            }
        }

        if(Player_HasWeapon(playerid, 31))
        {
            if(Weapon_SlotID(playerid, DropData[id][DropWeaponID]) == 3)
            {
                return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
            }
        }

        if(Player_HasWeapon(playerid, 32))
        {
            if(Weapon_SlotID(playerid, DropData[id][DropWeaponID]) == 3)
            {
                return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
            }
        }

        if(Player_HasWeapon(playerid, 33))
        {
            if(Weapon_SlotID(playerid, DropData[id][DropWeaponID]) == 3)
            {
                return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
            }
        }

        if(Player_HasWeapon(playerid, 34))
        {
            if(Weapon_SlotID(playerid, DropData[id][DropWeaponID]) == 3)
            {
                return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
            }
        }

		GivePlayerWeapon(playerid, DropData[id][DropWeaponID], DropData[id][DropWeaponAmmo]);
		SendClientMessageEx(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Yak�n�nda bulunan %s model silah� %i mermisiyle yerden ald�n.", ReturnWeaponName(DropData[id][DropWeaponID]), DropData[id][DropWeaponAmmo]);

		cmd_ame(playerid, sprintf("yerden %s model silah� al�r.", ReturnWeaponName(DropData[id][DropWeaponID])));
		Drop_GunRemove(id);
		return 1;
	}

	new h = -1;
	if((h = IsPlayerInProperty(playerid)) != -1)
	{
		if(PropertyData[h][PropertyOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu eve sahip de�ilsin.");

	    new
			slot;

		if(sscanf(params, "i", slot)) return SendUsageMessage(playerid, "/silahal [slot]");
		if(slot < 1 || slot > 20) return SendServerMessage(playerid, "Hatal� slot girdiniz.");
		if(!property_weap_data[h][slot][is_exist]) return SendErrorMessage(playerid, "Se�ti�iniz slot bo� g�z�k�yor.");
		if(Player_HasWeapon(playerid, property_weap_data[h][slot][prop_wep]))  return SendErrorMessage(playerid, "Bu silah zaten sende var.");

        if(Player_HasWeapon(playerid, 25))
        {
            if(Weapon_SlotID(playerid, property_weap_data[h][slot][prop_wep]) == 3)
            {
                return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
            }
        }

        if(Player_HasWeapon(playerid, 26))
        {
            if(Weapon_SlotID(playerid, property_weap_data[h][slot][prop_wep]) == 3)
            {
                return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
            }
        }

        if(Player_HasWeapon(playerid, 27))
        {
            if(Weapon_SlotID(playerid, property_weap_data[h][slot][prop_wep]) == 3)
            {
                return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
            }
        }

        if(Player_HasWeapon(playerid, 28))
        {
            if(Weapon_SlotID(playerid, property_weap_data[h][slot][prop_wep]) == 3)
            {
                return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
            }
        }

        if(Player_HasWeapon(playerid, 29))
        {
            if(Weapon_SlotID(playerid, property_weap_data[h][slot][prop_wep]) == 3)
            {
                return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
            }
        }

        if(Player_HasWeapon(playerid, 30))
        {
            if(Weapon_SlotID(playerid, property_weap_data[h][slot][prop_wep]) == 3)
            {
                return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
            }
        }

        if(Player_HasWeapon(playerid, 31))
        {
            if(Weapon_SlotID(playerid, property_weap_data[h][slot][prop_wep]) == 3)
            {
                return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
            }
        }

        if(Player_HasWeapon(playerid, 32))
        {
            if(Weapon_SlotID(playerid, property_weap_data[h][slot][prop_wep]) == 3)
            {
                return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
            }
        }

        if(Player_HasWeapon(playerid, 33))
        {
            if(Weapon_SlotID(playerid, property_weap_data[h][slot][prop_wep]) == 3)
            {
                return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
            }
        }

        if(Player_HasWeapon(playerid, 34))
        {
            if(Weapon_SlotID(playerid, property_weap_data[h][slot][prop_wep]) == 3)
            {
                return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
            }
        }

        RemoveWeaponFromProperty(playerid, h, slot);
		return 1;
	}
	else
	{
		if(!IsPlayerInAnyVehicle(playerid) && GetNearestVehicle(playerid) != INVALID_VEHICLE_ID)
		{
		    new Float: x, Float: y, Float: z;
			GetVehicleBoot(GetNearestVehicle(playerid), x, y, z);
			new vehicleid = GetNearestVehicle(playerid);

			if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece �zel ara�larda kullan�l�r.");
			if(IsValidFactionCar(vehicleid) && PlayerData[playerid][pFaction] != CarData[vehicleid][carFaction] && !FactionData[CarData[vehicleid][carFaction]][FactionCopPerms])
	            return SendServerMessage(playerid, "Bu araca eri�imin yok.");

			if(!IsPlayerInRangeOfPoint(playerid, 2.5, x, y, z)) return SendErrorMessage(playerid, "Arac�n bagaj�na yak�n de�ilsin.");
			if(CarData[vehicleid][carLocked]) return SendErrorMessage(playerid, "Bu ara� kilitli.");

			if(!IsLAWFaction(playerid) && CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu ara� sana ait de�il.");

			new
				slot;

			if(sscanf(params, "i", slot)) return SendUsageMessage(playerid, "/silahal [slot]");
			if(slot < 1 || slot > 5) return SendServerMessage(playerid, "Hatal� slot girdiniz.");
			if(!vehicle_weap_data[vehicleid][slot][is_exist]) return SendErrorMessage(playerid, "Se�ti�iniz slot bo� g�z�k�yor.");
			if(Player_HasWeapon(playerid, vehicle_weap_data[vehicleid][slot][veh_wep])) return SendErrorMessage(playerid, "Bu silah zaten sende var.");

            if(Player_HasWeapon(playerid, 25))
            {
                if(Weapon_SlotID(playerid, vehicle_weap_data[vehicleid][slot][veh_wep]) == 3)
                {
                    return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
                }
            }

            if(Player_HasWeapon(playerid, 26))
            {
                if(Weapon_SlotID(playerid, vehicle_weap_data[vehicleid][slot][veh_wep]) == 3)
                {
                    return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
                }
            }

            if(Player_HasWeapon(playerid, 27))
            {
                if(Weapon_SlotID(playerid, vehicle_weap_data[vehicleid][slot][veh_wep]) == 3)
                {
                    return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
                }
            }

            if(Player_HasWeapon(playerid, 28))
            {
                if(Weapon_SlotID(playerid, vehicle_weap_data[vehicleid][slot][veh_wep]) == 3)
                {
                    return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
                }
            }

            if(Player_HasWeapon(playerid, 29))
            {
                if(Weapon_SlotID(playerid, vehicle_weap_data[vehicleid][slot][veh_wep]) == 3)
                {
                    return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
                }
            }

            if(Player_HasWeapon(playerid, 30))
            {
                if(Weapon_SlotID(playerid, vehicle_weap_data[vehicleid][slot][veh_wep]) == 3)
                {
                    return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
                }
            }

            if(Player_HasWeapon(playerid, 31))
            {
                if(Weapon_SlotID(playerid, vehicle_weap_data[vehicleid][slot][veh_wep]) == 3)
                {
                    return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
                }
            }

            if(Player_HasWeapon(playerid, 32))
            {
                if(Weapon_SlotID(playerid, vehicle_weap_data[vehicleid][slot][veh_wep]) == 3)
                {
                    return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
                }
            }

            if(Player_HasWeapon(playerid, 33))
            {
                if(Weapon_SlotID(playerid, vehicle_weap_data[vehicleid][slot][veh_wep]) == 3)
                {
                    return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
                }
            }

            if(Player_HasWeapon(playerid, 34))
            {
                if(Weapon_SlotID(playerid, vehicle_weap_data[vehicleid][slot][veh_wep]) == 3)
                {
                    return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
                }
            }

			RemoveWeaponFromTrunk(playerid, vehicleid, slot);
			return 1;
		}
		else if(IsPlayerInAnyVehicle(playerid))
		{
			new	vehicleid = GetPlayerVehicleID(playerid);
			if(!IsValidCar(vehicleid)) return SendServerMessage(playerid, "Bu komut sadece �zel ara�larda kullan�l�r.");
			if(IsValidFactionCar(vehicleid) && PlayerData[playerid][pFaction] != CarData[vehicleid][carFaction] && !FactionData[CarData[vehicleid][carFaction]][FactionCopPerms])
	            return SendServerMessage(playerid, "Bu araca eri�imin yok.");

            if(!IsLAWFaction(playerid) && CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID]) return SendErrorMessage(playerid, "Bu ara� sana ait de�il.");

			new
				slot;

			if(sscanf(params, "i", slot)) return SendUsageMessage(playerid, "/silahal [slot]");
			if(slot < 1 || slot > 5) return SendServerMessage(playerid, "Hatal� slot girdiniz.");
			if(!vehicle_weap_data[vehicleid][slot][is_exist]) return SendErrorMessage(playerid, "Se�ti�iniz slot bo� g�z�k�yor.");
			if(Player_HasWeapon(playerid, vehicle_weap_data[vehicleid][slot][veh_wep])) return SendErrorMessage(playerid, "Bu silah zaten sende var.");

            if(Player_HasWeapon(playerid, 25))
            {
                if(Weapon_SlotID(playerid, vehicle_weap_data[vehicleid][slot][veh_wep]) == 3)
                {
                    return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
                }
            }

            if(Player_HasWeapon(playerid, 26))
            {
                if(Weapon_SlotID(playerid, vehicle_weap_data[vehicleid][slot][veh_wep]) == 3)
                {
                    return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
                }
            }

            if(Player_HasWeapon(playerid, 27))
            {
                if(Weapon_SlotID(playerid, vehicle_weap_data[vehicleid][slot][veh_wep]) == 3)
                {
                    return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
                }
            }

            if(Player_HasWeapon(playerid, 28))
            {
                if(Weapon_SlotID(playerid, vehicle_weap_data[vehicleid][slot][veh_wep]) == 3)
                {
                    return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
                }
            }

            if(Player_HasWeapon(playerid, 29))
            {
                if(Weapon_SlotID(playerid, vehicle_weap_data[vehicleid][slot][veh_wep]) == 3)
                {
                    return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
                }
            }

            if(Player_HasWeapon(playerid, 30))
            {
                if(Weapon_SlotID(playerid, vehicle_weap_data[vehicleid][slot][veh_wep]) == 3)
                {
                    return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
                }
            }

            if(Player_HasWeapon(playerid, 31))
            {
                if(Weapon_SlotID(playerid, vehicle_weap_data[vehicleid][slot][veh_wep]) == 3)
                {
                    return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
                }
            }

            if(Player_HasWeapon(playerid, 32))
            {
                if(Weapon_SlotID(playerid, vehicle_weap_data[vehicleid][slot][veh_wep]) == 3)
                {
                    return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
                }
            }

            if(Player_HasWeapon(playerid, 33))
            {
                if(Weapon_SlotID(playerid, vehicle_weap_data[vehicleid][slot][veh_wep]) == 3)
                {
                    return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
                }
            }

            if(Player_HasWeapon(playerid, 34))
            {
                if(Weapon_SlotID(playerid, vehicle_weap_data[vehicleid][slot][veh_wep]) == 3)
                {
                    return SendErrorMessage(playerid, "Bu silah slotunuz zaten dolu. Birincil silah�n�z� g�r�nt�leyip(/karakter) o silah� ba�ka bir yere yerle�tirip tekrar deneyin.");
                }
            }

			RemoveWeaponFromTrunk(playerid, vehicleid, slot);
			return 1;
		}
	}

	SendErrorMessage(playerid, "Etraf�nda silah alabilece�in yer yok.");
	return 1;
}

//wip of new warehouse
/*CMD:orderammo(playerid, params[])
{
	if(!pLoggedIn[playerid])return true;
	if(!IsIllegalFaction(playerid))
		return SendClientMessage(playerid, COLOR_ADM, "HATA: Birlikte de�ilsin..");

	new weaponName[128], ammo, totalPrice, string[128];
	if(sscanf(params, "s[128]i", weaponName, ammo)) {
		SendClientMessage(playerid, COLOR_ADM, "KULLANIM:{FFFFFF} /buygun [weapon] [ammo]");
		SendClientMessage(playerid, COLOR_GRAD2, "[ colt: $50 ] [ deagle: $25 ] [ shotgun: $50 ] [ rifle: $150 ] [ M4: $500 ] [ AK: $130 ] ");
		SendClientMessage(playerid, COLOR_GRAD2, "[ Sniper Rifle: $5,000 ] [ TEC: $80 ] [ UZI: $80 ] [ MP5: $450 ] [ Armour (50%): $3000 ] [ Armour (85%): $5000 ]  ");
		SendClientMessage(playerid, COLOR_GRAD2, "[ Molotov: $1500 ] [ Grenade: $2000 ] ");
		return true;
	}

	if(ammo < 1)
		return SendClientMessage(playerid, COLOR_ADM, "HATA: Ge�ersiz mermi de�eri.");

 	if(ammo > 100)
		return SendClientMessage(playerid, COLOR_ADM, "HATA: Bir seferde 100 mermi alabilirsin.");

	if(strmatch(weaponName, "colt")){
		if(!Player_HasWeapon(playerid, WEAPON_COLT45))
		return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} Elinde bu silah yok.");

		totalPrice = 25 * ammo;

		if( PlayerData[playerid][pMoney] < totalPrice ) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bunu kar��layacak paran yok.");

		format(string, sizeof(string), "Are you sure you want to buy ammo for $%s?", MoneyFormat(totalPrice));
		ConfirmDialog(playerid, "Confirmation", string, "OnPlayerPurchaseAmmo", WEAPON_COLT45, ammo, totalPrice);
	}
	else if(strmatch(weaponName, "deagle")){
		if(!Player_HasWeapon(playerid, WEAPON_DEAGLE))
			return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} Elinde bu silah yok.");

		totalPrice = 38 * ammo;

		if( PlayerData[playerid][pMoney] < totalPrice ) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bunu kar��layacak paran yok.");

		format(string, sizeof(string), "Are you sure you want to buy ammo for $%s?", MoneyFormat(totalPrice));
		ConfirmDialog(playerid, "Confirmation", string, "OnPlayerPurchaseAmmo", WEAPON_DEAGLE, ammo, totalPrice);
	}
	else if(strmatch(weaponName, "shotgun")){
		if(!Player_HasWeapon(playerid, WEAPON_SHOTGUN))
			return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} Elinde bu silah yok.");

		totalPrice = 38 * ammo;

		if( PlayerData[playerid][pMoney] < totalPrice ) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bunu kar��layacak paran yok.");

		format(string, sizeof(string), "Are you sure you want to buy ammo for $%s?", MoneyFormat(totalPrice));
		ConfirmDialog(playerid, "Confirmation", string, "OnPlayerPurchaseAmmo", WEAPON_SHOTGUN, ammo, totalPrice);
	}
	else if(strmatch(weaponName, "rifle")){
		if(!Player_HasWeapon(playerid, WEAPON_RIFLE))
			return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} Elinde bu silah yok.");

		totalPrice = 100 * ammo;

		if( PlayerData[playerid][pMoney] < totalPrice ) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bunu kar��layacak paran yok.");

		format(string, sizeof(string), "Are you sure you want to buy ammo for $%s?", MoneyFormat(totalPrice));
		ConfirmDialog(playerid, "Confirmation", string, "OnPlayerPurchaseAmmo", WEAPON_RIFLE, ammo, totalPrice);
	}
	else if(strmatch(weaponName, "M4")){
		if(!Player_HasWeapon(playerid, WEAPON_M4))
			return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} Elinde bu silah yok.");

		totalPrice = 500 * ammo;

		if( PlayerData[playerid][pMoney] < totalPrice ) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bunu kar��layacak paran yok.");

		format(string, sizeof(string), "Are you sure you want to buy ammo for $%s?", MoneyFormat(totalPrice));
		ConfirmDialog(playerid, "Confirmation", string, "OnPlayerPurchaseAmmo", WEAPON_M4, ammo, totalPrice);
	}
	else if(strmatch(weaponName, "AK")){
		if(!Player_HasWeapon(playerid, WEAPON_AK47))
			return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} Elinde bu silah yok.");

		totalPrice = 130 * ammo;

		if( PlayerData[playerid][pMoney] < totalPrice ) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bunu kar��layacak paran yok.");

		format(string, sizeof(string), "Are you sure you want to buy ammo for $%s?", MoneyFormat(totalPrice));
		ConfirmDialog(playerid, "Confirmation", string, "OnPlayerPurchaseAmmo", WEAPON_AK47, ammo, totalPrice);
	}
	else if(strmatch(weaponName, "Sniper Rifle")){
		if(!Player_HasWeapon(playerid, WEAPON_SNIPER))
			return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} Elinde bu silah yok.");

		totalPrice = 5000 * ammo;

		if( PlayerData[playerid][pMoney] < totalPrice ) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bunu kar��layacak paran yok.");

		format(string, sizeof(string), "Are you sure you want to buy ammo for $%s?", MoneyFormat(totalPrice));
		ConfirmDialog(playerid, "Confirmation", string, "OnPlayerPurchaseAmmo", WEAPON_SNIPER, ammo, totalPrice);
	}
	else if(strmatch(weaponName, "TEC")){
		if(!Player_HasWeapon(playerid, WEAPON_TEC9))
			return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} Elinde bu silah yok.");

		totalPrice = 80 * ammo;

		if( PlayerData[playerid][pMoney] < totalPrice ) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bunu kar��layacak paran yok.");

		format(string, sizeof(string), "Are you sure you want to buy ammo for $%s?", MoneyFormat(totalPrice));
		ConfirmDialog(playerid, "Confirmation", string, "OnPlayerPurchaseAmmo", WEAPON_TEC9, ammo, totalPrice);
	}
	else if(strmatch(weaponName, "UZI")){
		if(!Player_HasWeapon(playerid, WEAPON_UZI))
			return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} Elinde bu silah yok.");

		totalPrice = 80 * ammo;

		if( PlayerData[playerid][pMoney] < totalPrice ) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bunu kar��layacak paran yok.");

		format(string, sizeof(string), "Are you sure you want to buy ammo for $%s?", MoneyFormat(totalPrice));
		ConfirmDialog(playerid, "Confirmation", string, "OnPlayerPurchaseAmmo", WEAPON_UZI, ammo, totalPrice);
	}
	else if(strmatch(weaponName, "MP5")){
		if(!Player_HasWeapon(playerid, WEAPON_MP5))
			return SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} Elinde bu silah yok.");

		totalPrice = 450 * ammo;

		if( PlayerData[playerid][pMoney] < totalPrice ) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bunu kar��layacak paran yok.");

		format(string, sizeof(string), "Are you sure you want to buy ammo for $%s?", MoneyFormat(totalPrice));
		ConfirmDialog(playerid, "Confirmation", string, "OnPlayerPurchaseAmmo", WEAPON_MP5, ammo, totalPrice);
	}
	else return SendClientMessage(playerid, COLOR_ADM, "SERVER: Ge�ersiz Parametre.");
	return true;
}*/

CMD:cezalarim(playerid, params[])
{
	if(PlayerData[playerid][pDrivingTest]) return SendServerMessage(playerid, "Ehliyet s�nav�ndayken bu komutu kullanamazs�n.");
	if(PlayerData[playerid][pTaxiDrivingTest]) return SendServerMessage(playerid, "Taksi s�nav�ndayken bu komutu kullanamazs�n.");

	new id;
	if(sscanf(params, "U(-1)", id)) return 1;
	if(id != -1) {
		if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
		if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
		if(!GetDistanceBetweenPlayers(playerid, id, 5.0)) return SendErrorMessage(playerid, "Belirtti�iniz ki�iye yak�n de�ilsin.");
	}

	Player_ShowFines(playerid, id != -1 ? !IsPoliceFaction(playerid) ? playerid : id : playerid);
	return 1;
}

CMD:cezaode(playerid, params[])
{
	new bool: has_fines = false;
	for(new i = 0; i < MAX_FINES; i++)
	{
		if(!Fines[playerid][i][fine_id]) continue;
		has_fines = true;
	}

	if(!has_fines) return SendClientMessage(playerid, COLOR_ADM, "SERVER: �deyecek herhangi bir cezan yok.");

	new
		f_id, index,
		bool:fine_exists = false;

	if(sscanf(params, "i", f_id)) {
		return SendClientMessage(playerid, COLOR_GREY, "KULLANIM: /cezaode [ceza ID] (IDleri /cezalarim yazarak g�rebilirsin.)");
	}

	for(new i = 0; i < MAX_FINES; i++)
	{
		if(!Fines[playerid][i][fine_id]) continue;

		if(Fines[playerid][i][fine_id] == f_id)
		{
			fine_exists = true;
			index = i;
		}
	}

	if(!fine_exists) return SendClientMessage(playerid, COLOR_ADM, "SERVER: B�yle bir numaral� cezan bulunmuyor.");
	ConfirmDialog(playerid, "Onay", sprintf("{ADC3E7}Ceza #%i {FFFFFF}numaral� cezay� �demek �zeresin.\nCeza Tutar�: {ADC3E7}$%s.", f_id, MoneyFormat(Fines[playerid][index][fine_amount])), "OnPlayerPayFine", index);
	return 1;
}

CMD:sokak(playerid, params[])
{
	new Float: x, Float: y, Float: z; GetPlayerPos(playerid, x, y, z);
	SendClientMessageEx(playerid, COLOR_WHITE, "Sokak: %s, %s, %s %i, San Andreas", GetPlayerStreet(playerid), GetZoneName(x, y, z), GetCityName(x, y, z), ReturnAreaCode(GetZoneID(x, y, z)));
	return 1;
}


CMD:stilayarla(playerid, params[])
{
	new style_id, pick_id;
	if(sscanf(params, "iI(-1)", style_id, pick_id))
	{
		SendUsageMessage(playerid, "/stilayarla [stil numaras�]");
		SendClientMessage(playerid, COLOR_ADM, "1 - Y�r�me Stili | 2 - Konu�ma Stili | 3 - HUD Stili");
		SendClientMessage(playerid, COLOR_ADM, "4 - Sokak Stili");
		return 1;
	}

	//| 5 - Jog Stili | 6 - Sokak Stili
	switch(style_id)
	{
		case 1:
		{
			if(pick_id == -1)
			{
				SendUsageMessage(playerid, "/stilayarla 1 [stil numaras�]");
				SendClientMessage(playerid, COLOR_WHITE, "Y�r�me stilleri: 0 1 2 3 4");
				SendClientMessage(playerid, COLOR_WHITE, "Y�r�me stilleri: 5 6 7 8 9");
				return 1;
			}

			if(pick_id < 0 || pick_id > 9) return SendErrorMessage(playerid, "Ge�ersiz stil numaras� girdin.");

			PlayerData[playerid][pWalkstyle] = pick_id;
			SendClientMessageEx(playerid, COLOR_YELLOW, "Y�r�me stilinizi %i olarak ayarlad�n�z. (/walk)", pick_id);
		}
		case 2:
		{
			if(!PlayerData[playerid][pDonator])
				return SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�:{FFFFFF} Ba����� de�ilsin.");

			if(pick_id == -1)
			{
				SendUsageMessage(playerid, "/stilayarla 2 [stil numaras�]");
				SendClientMessage(playerid, COLOR_WHITE, "Konu�ma stilleri: 0 1 2 3 4");
				SendClientMessage(playerid, COLOR_WHITE, "Konu�ma stilleri: 5 6 7");
				return 1;
			}

			if(pick_id < 0 || pick_id > 7) return SendErrorMessage(playerid, "Ge�ersiz stil numaras� girdin.");

			PlayerData[playerid][pChatstyle] = pick_id;
			SendClientMessageEx(playerid, COLOR_YELLOW, "Konu�ma stilinizi %i olarak ayarlad�n�z.", pick_id);
		}
		case 3:
		{
			if(pick_id == -1) return SendUsageMessage(playerid, "/stilayarla 3 [stil numaras�]");
			if(pick_id < 0 || pick_id > 4) return SendErrorMessage(playerid, "Ge�ersiz stil numaras� girdin.");
			if(PlayerData[playerid][pHudstyle] == pick_id) return SendErrorMessage(playerid, "Belirtti�in stili kullan�yorsun.");

			PlayerData[playerid][pHudstyle] = pick_id;
			SendClientMessageEx(playerid, COLOR_YELLOW, "HUD stilinizi %i olarak de�i�tirdiniz.", pick_id);
			SendClientMessage(playerid, COLOR_YELLOW, "HUD stilinizin g�ncellenmesi i�in /tog hud yazarak kapat a� yapman�z gerekiyor.");
			Hud_Change(playerid);
		}
		case 4:
		{
			if(pick_id == -1) {
				SendUsageMessage(playerid, "/stilayarla 4 [stil numaras�]");
				SendClientMessage(playerid, COLOR_WHITE, "0 - Sa� alt. | 1 - Radar�n alt�. | 2 - Radar�n �st�.");
				SendClientMessage(playerid, COLOR_WHITE, "3 - $$ alt�. | 4 - Orta yukar�. | 5 - Sol alt.");
				SendClientMessage(playerid, COLOR_WHITE, "5 - Orta sol.");
				return 1;
			}
			if(pick_id < 0 || pick_id > 7) return SendErrorMessage(playerid, "Ge�ersiz stil numaras� girdin.");
			if(PlayerData[playerid][pStreetstyle] == pick_id) return SendErrorMessage(playerid, "Belirtti�in stili kullan�yorsun.");

			PlayerData[playerid][pStreetstyle] = pick_id;
			SendClientMessageEx(playerid, COLOR_YELLOW, "Sokak stilinizi %i olarak de�i�tirdiniz.", pick_id);
			SendClientMessage(playerid, COLOR_YELLOW, "Sokak stilinizin g�ncellenmesi i�in /tog sokak yazarak kapat a� yapman�z gerekiyor.");
			SendClientMessage(playerid, COLOR_YELLOW, "Sokak bilgisi sadece ara� i�inde g�z�k�r!");
			Street_Change(playerid);
		}
		/*
		case 3:{
			if(!PlayerData[playerid][pDonator])
				return SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�:{FFFFFF} Ba��s�� de�ilsin.");

			if(pickid == -1)
			{
				SendClientMessage(playerid, COLOR_WHITE, "D�v�� stili: 0 1 2 3 4");
				SendClientMessage(playerid, COLOR_WHITE, "D�v�� stili: 5");
				SendClientMessage(playerid, COLOR_DARKGREEN, "KULLANIM: /stilayarla 3 [stil ID]");
				return true;
			}

			if(pickid != -1 && pickid < 0 || pickid > 5)
				return SendClientMessage(playerid, COLOR_ADM, "Ge�ersiz d�v�� stili.");

			switch(pickid)
			{
				case 0: pickid = 15;
				case 1: pickid = 4;
				case 2: pickid = 5;
				case 3: pickid = 6;
				case 4: pickid = 7;
				case 5: pickid = 16;
			}

			SetPlayerFightingStyle(playerid, pickid);
			PlayerData[playerid][pFightstyle] = pickid;

			SendClientMessageEx(playerid, COLOR_YELLOW, "D�v�� stilini %s olarak de�i�tirdin!", GetFightstyleName(pickid));
		}*/
	}
	return 1;
}

CMD:sohbet(playerid, params[])
{
	if(PlayerData[playerid][pConvoID] != INVALID_PLAYER_ID)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "SERVER: %s ile olan sohbet g�r��mesini bitirdin", ReturnName(PlayerData[playerid][pConvoID]));
		SendClientMessageEx(PlayerData[playerid][pConvoID], COLOR_GREY, "SERVER: %s isimli oyuncu seninle olan sohbet g�r��mesini sona erdirdi.", ReturnName(playerid));
		PlayerData[playerid][pConvoID] = INVALID_PLAYER_ID;
		return 1;
	}

	new id;
	if(sscanf(params, "i", id)) return SendUsageMessage(playerid, "/sohbet [oyuncu ID/ad�]");
	if(playerid == id) return SendErrorMessage(playerid, "Bu komutu kendi �zerinde kullanamazs�n.");
	if(!IsPlayerConnected(id)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
	if(!pLoggedIn[id]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");

	SendClientMessageEx(playerid, COLOR_GREY, "SERVER: %s ile bir sohbet g�r��mesi ba�latt�n, chatten yazd�klar�n PM olarak iletilecektir.", ReturnName(id));
	SendClientMessageEx(id, COLOR_GREY, "SERVER: %s isimli oyuncu seninle bir sohbet ba�latt�.", ReturnName(playerid));
	PlayerData[playerid][pConvoID] = id;
	return 1;
}

/*CMD:kabuletolum(playerid, params[])
{
	if(PlayerData[playerid][pBrutallyWounded] != 1) return SendClientMessage(playerid, COLOR_GREY, "HATA: Hen�z yaralanmam��s�n.");

	SetDead(playerid);
	r*eturn 1;
}*/

CMD:tedaviol(playerid, params[])
{
	if(PlayerData[playerid][pBrutallyWounded] != 0)
	{
		if(PlayerData[playerid][pInjurTime] > 0)
			return SendClientMessage(playerid, COLOR_YELLOW, sprintf("-> %d saniyen daha var.", PlayerData[playerid][pInjurTime]));

		DeathTimeNotice[playerid] = 0;
		PlayerData[playerid][pBrutallyWounded] = 0;
		SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL, 899);
		SetPlayerSkillLevel(playerid, WEAPONSKILL_MICRO_UZI, 0);
		SetPlayerSkillLevel(playerid, WEAPONSKILL_SPAS12_SHOTGUN, 0);
		SetPlayerSkillLevel(playerid, WEAPONSKILL_AK47, 999);
	    SetPlayerSkillLevel(playerid, WEAPONSKILL_DESERT_EAGLE, 999);
	    SetPlayerSkillLevel(playerid, WEAPONSKILL_SHOTGUN, 999);
	    SetPlayerSkillLevel(playerid, WEAPONSKILL_M4, 999);
	    SetPlayerSkillLevel(playerid, WEAPONSKILL_MP5, 999);
	    SetPlayerHealth(playerid, PlayerData[playerid][pMaxHealth]);
		TogglePlayerControllable(playerid, true);
		SetPlayerTeam(playerid, STATE_ALIVE);
		Damages_Clear(playerid);
		SpawnPlayerIn(playerid);
	}
	return 1;
}

CMD:sz(playerid, params[])return cmd_szaman(playerid, params);
CMD:szaman(playerid, params[])
{
	SendClientMessageEx(playerid, COLOR_GREY, "Tarih: %s", GetFullTime(Time()));
	return 1;
}

CMD:isbasindakiler(playerid, params[])
{
	new pd_count = 0,
	    sadoc_count = 0,
	    medic_count = 0,
	    taxi_count = 0;

	foreach(new i : Player)
	{
	    if(PlayerData[i][pLAWduty]) pd_count++;
	    if(PlayerData[i][pSDCduty]) sadoc_count++;
	    if(PlayerData[i][pMEDduty]) medic_count++;
		if(StartedTaxiJob[i]) taxi_count++;
	}

	SendClientMessageEx(playerid, COLOR_ADM, "[!] {FFFFFF}%i adet polis memuru, %i hapishane g�revlisi, %i sa�l�k g�revlisi ve %i taksici i�ba��nda g�z�k�yor.", pd_count, sadoc_count, medic_count, taxi_count);
	return 1;
}


CMD:id(playerid, params[])
{
	if(isnull(params)) return SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /id [oyuncu ID/isim]");

	if(IsNumeric(params))
	{
		new id = strval(params);
		if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Ge�ersiz ID girdin.");
		SendClientMessageEx(playerid, COLOR_GREY, "(ID: %i) %s | Level: %i", id, ReturnName(id), PlayerData[id][pLevel]);
	}
	else
	{
		new string[128], matchesFound[MAX_PLAYERS+1];
		for(new i = 0; i < MAX_PLAYERS; i++) { matchesFound[i] = INVALID_PLAYER_ID; }

		printf("1");
		new bool:found = false, countmatches = 0;

		foreach (new i : Player)
		{
			if(strfind(ReturnName(i, 1), params, true) != -1)
			{
				found = true;
				countmatches++;
			}
		}

		printf("2");
		if(found)
		{
			printf("3");
			new t = 0;
			foreach (new i : Player)
			{
				if(strfind(ReturnName(i, 1), params, true) != -1)
				{
					matchesFound[t] = i;
					t++;

					if(t >= MAX_PLAYERS-1) break;
				}
			}
			printf("4");

			switch(countmatches)
			{
				case 1: SendClientMessageEx(playerid, COLOR_GREY, "(ID: %i) %s | Level: %i", matchesFound[0], ReturnName(matchesFound[0], 1), PlayerData[matchesFound[0]][pLevel]);
				default:
				{
					new index = 0;
					for(new l = 0; l < sizeof(matchesFound)-1; l++) {
						if(matchesFound[l] != INVALID_PLAYER_ID) {
							index = l;
						}
					}

					printf("5");
					for(new l = 0; l <= index; l++) if(matchesFound[l] != INVALID_PLAYER_ID)
					{
						printf("dondu");
						format(string, sizeof(string), "%s(ID: %i) %s ", string, matchesFound[l], ReturnName(matchesFound[l], 1));

						/*if(i % 4 == 0 && i != 0 || i == sizeof(Items)-1)
						{
						    SendClientMessage(playerid, -1, str);
						    str[0] = 0;
						}*/

						if(l != 0 && l % index == 0)
						{
							SendClientMessage(playerid, COLOR_GREY, string);
							string[0] = 0;
						}
					}
					printf("6");
				}
			}
			printf("7");
		}
		else SendClientMessage(playerid, COLOR_ADM, "SERVER: Oyuncu bulunamad�.");
	}
	return 1;
}


CMD:id2(playerid, params[])
{
	#if !defined COMMAND_ID_MAX_MATCHES
		#define COMMAND_ID_MAX_MATCHES 11
	#endif

	new
		ids[COMMAND_ID_MAX_MATCHES];

	if(sscanf(params, "?<MATCH_NAME_PARTIAL=1>u[" #COMMAND_ID_MAX_MATCHES "]", ids))
	{
		SendClientMessage(playerid, COLOR_ADM, "KULLANIM: /id2 [oyuncu ID/isim]");
		return 1;
	}
	#undef COMMAND_ID_MAX_MATCHES

	new
		i,
		string[128];

	while (ids[i] != INVALID_PLAYER_ID)
	{
		if (ids[i] == cellmin) {
			SendClientMessage(playerid, COLOR_ADM, "SERVER: �ok fazla sonu� bulundu, listeleyemedik.");
			break;
		}

		format(string, sizeof(string), "%s(ID: %i) %s ", string, ids[i], ReturnName(ids[i], 1));

		if(i % 4 == 0 && i != 0 || i == 10)
		{
		    SendClientMessage(playerid, COLOR_GREY, string);
		    string[0] = 0;
		}

		++i;
	}

	if(i == 0) {
		SendClientMessage(playerid, COLOR_ADM, "SERVER: Oyuncu bulunamad�.");
	}
	return 1;
}

CMD:seviyeatla(playerid, params[])
{
	new
		exp_count = ((PlayerData[playerid][pLevel]) * 4 + 4);

	if(PlayerData[playerid][pExp] < exp_count)
	{
		SendClientMessageEx(playerid, COLOR_ADM, "ER���M REDDED�LD�: {FFFFFF}Seviye atlamak i�in %i deneyim puan�na ihtiyac�n var.", exp_count);
		return 1;
	}

	PlayerData[playerid][pLevel]++;
	SaveSQLInt(PlayerData[playerid][pSQLID], "players", "Level", PlayerData[playerid][pLevel]);

	PlayerData[playerid][pExp] -= exp_count;
	SaveSQLInt(PlayerData[playerid][pSQLID], "players", "Exp", PlayerData[playerid][pExp]);

	PlayerData[playerid][pUpgradePoints] += 2;

	PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
	SetPlayerScore(playerid, PlayerData[playerid][pLevel]);

	GameTextForPlayer(playerid, sprintf("~g~Seviye Atladin~n~~w~Aktif Seviyen %d", PlayerData[playerid][pLevel]), 5000, 1);
	SendClientMessageEx(playerid, COLOR_ADM, "SERVER: {FFFFFF}%d seviye oldun!", PlayerData[playerid][pLevel]);

	//LogPlayerAction(playerid, sprintf("%i seviye oldu.", newlevel));
	return 1;
}

/*CMD:gelistir(playerid, params[])
{
	new makscan[13];
	if (sscanf(params, "s[13]", makscan))
	{
		SendClientMessage(playerid, COLOR_GRAD2, "KULLANIM: /gelistir [geli�im]");
		SendClientMessageEx(playerid, COLOR_GRAD1, "%i geli�tirme puan�n var.", PlayerData[playerid][pUpgradePoints]);
		SendClientMessage(playerid, COLOR_GRAD2, "________Kullan�labilir Geli�tirmeler________");
		SendClientMessage(playerid, COLOR_GRAD2, "1: maksimumcan [Maksimum can�n�z� geli�tirin]");
		return 1;
	}

	if(!strcmp(makscan, "maksimumcan"))
	{
		if (!PlayerData[playerid][pUpgradePoints]) return SendClientMessage(playerid, COLOR_ADM, "ER���M REDDED�LD�:{FFFFFF} Yeterli geli�tirme puan�n�z yok.");
		if(PlayerData[playerid][pMaxHealth] >= 150) return SendClientMessage(playerid, COLOR_ADM, "HATA: Zaten maksimum can seviyesine ula�m��s�n�z.");
		//WriteLog("player_logs/upgrade_log.txt", "[%s] %s adl� ki�i maksimum can�n� %d say�s�ndan %d yapt�.", ReturnDate(), ReturnName(playerid), PlayerData[playerid][pMaxHealth], PlayerData[playerid][pMaxHealth] + 5);
		PlayerData[playerid][pMaxHealth] += 5;
		PlayerData[playerid][pUpgradePoints] -= 1;
		SendClientMessageEx(playerid, COLOR_GRAD2, "SERVER: Maksimum can�n %d.0 olarak geli�ti.", PlayerData[playerid][pMaxHealth]);
		Player_Save(playerid);
		return 1;
	}
	return true;
}*/

CMD:yardimiste(playerid, params[])
{
	if (isnull(params) || strlen(params) > 128)
	{
	    SendUsageMessage(playerid, "/yardimiste [a��klama]");
	    SendInfoMessage(playerid, "Yard�m komutu amac�na uygun kullan�lmal�d�r aksi takdirde ceza alabilirsiniz.");
	    return 1;
	}

	if(Support_GetCount(playerid) > 5) return SendErrorMessage(playerid, "Zaten 5 adet aktif yard�m iste�in bulunuyor.");
	if(PlayerData[playerid][pSupportTime] >= gettime()) return SendErrorMessage(playerid, "Yeni bir yard�m iste�i g�ndermek i�in l�tfen %d saniye bekle.", PlayerData[playerid][pSupportTime] - gettime());
    Support_Create(playerid, params);
	return 1;
}

Support_Create(playerid, text[])
{
   	new id = Iter_Free(Supports);
   	if (id == -1) return SendErrorMessage(playerid, "Yardim listesi dolu g�z�k�yor, daha sonra tekrar deneyin.");

	format(SupportData[id][SupportText], 128, "%s", text);
 	SupportData[id][SupportPlayer] = playerid;

	foreach (new i : Player)
	{
		if (PlayerData[i][pTester] > 0 && PlayerData[i][pTesterDuty])
		{
			SendClientMessageEx(i, COLOR_ADM, "[Yard�m: %d] {FF9900}%s(%d): %s", id+1, ReturnName(playerid, 0), playerid, text);
		}
	}

	SendInfoMessage(playerid, "Yard�m iste�in �evrimi�i testerlara g�nderildi, l�tfen sab�rla bekleyiniz.");
	PlayerData[playerid][pSupportTime] = gettime() + 15;
	Iter_Add(Supports, id);
	return 1;
}

Support_Remove(id)
{
    SupportData[id][SupportPlayer] = INVALID_PLAYER_ID;
    Iter_Remove(Supports, id);
	return 1;
}

Support_GetCount(playerid)
{
	new count = 0;
    foreach(new i : Supports) if (SupportData[i][SupportPlayer] == playerid)
	{
 		count++;
	}
	return count;
}

CMD:tc(playerid, params[])
{
	if(PlayerData[playerid][pUseGUI]) {
    	SelectTextDraw(playerid, COLOR_GREY);
	}
    return 1;
}

CMD:telefon(playerid, params[])
{
	if(PlayerData[playerid][pICJailed])
		return SendClientMessage(playerid, COLOR_ADM, "[-] Telefonun g�zalt�na al�nd���nda el konuldu.");

	if(PlayerData[playerid][pPhoneline] != INVALID_PLAYER_ID)
		return SendClientMessage(playerid, COLOR_ADM, "SERVER: Biriyle konu�urken telefon men�s�yle i�lem yapamazs�n.");

	if(PlayerData[playerid][pHandcuffed])
		return SendClientMessage(playerid, COLOR_ADM, "SERVER: Telefonunu bu durumda kullanamazs�n.");

    if(MainPhone[playerid] == 1)
    	return SendClientMessage(playerid, COLOR_ADM, "SERVER: �kincil telefonun aray�z� yok.");

	if(!PlayerData[playerid][pUseGUI])
    	Phone_ShowUI(playerid);
	else
	    Phone_HideUI(playerid);
	return 1;
}

CMD:tac(playerid, params[]) return cmd_tcevap(playerid, params);
CMD:tcevap(playerid, params[])
{
	if(PlayerData[playerid][pPhoneOff])
		return SendClientMessage(playerid, COLOR_RED, "SERVER: Telefonun kapal�yken bu komutu kullanamazs�n.");

	if(PlayerData[playerid][pHandcuffed])
		return SendClientMessage(playerid, COLOR_ADM, "SERVER: Kelep�eliyken bu komutu kullanamazs�n.");

	if(!PlayerData[playerid][pCalling])
		return SendClientMessage(playerid, COLOR_ADM, "SERVER: Kimse seni aram�yor.");

	if(PlayerData[playerid][pCalling] == 2)
		return SendClientMessage(playerid, COLOR_ADM, "SERVER: �u anda arayan sensin.");

	if (PlayerData[playerid][pUseGUI])
	{
		PlayerTextDrawSetString(playerid, PhoneNotify[playerid], "_");
		PlayerTextDrawHide(playerid, PhoneNotify[playerid]);
	    //PlayerTextDrawShow(playerid, PhoneBtnMenu[playerid]);

		PlayerTextDrawSetString(PlayerData[playerid][pPhoneline], PhoneNotify[PlayerData[playerid][pPhoneline]], "_");
		PlayerTextDrawHide(PlayerData[playerid][pPhoneline], PhoneNotify[PlayerData[playerid][pPhoneline]]);
		//PlayerTextDrawShow(PlayerData[playerid][pPhoneline], PhoneBtnMenu[PlayerData[playerid][pPhoneline]]);
	}

	PlayerData[playerid][pCalling] = 0;
	PlayerData[ PlayerData[playerid][pPhoneline]][pCalling] = 0;

	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
	KillTimer(phoneTimer[playerid]);

	SendClientMessage(PlayerData[playerid][pPhoneline], COLOR_GREY, "[!] �a�r� cevapland�.");
	SendClientMessage(playerid, COLOR_WHITE, "�PUCU: Chat kutusunu kullanarak konu�abilirsin.");
	return 1;
}

CMD:tkap(playerid, params[]) return cmd_tkapat(playerid, params);
CMD:tkapat(playerid, params[])
{
	if(PlayerData[playerid][pPhoneOff])
		return SendClientMessage(playerid, COLOR_ADM, "SERVER: Telefonun kapal�yken bu komutu kullanamazs�n.");

	if(PlayerData[playerid][pHandcuffed])
		return SendClientMessage(playerid, COLOR_ADM, "SERVER: Kelep�eliyken bu komutu kullanamazs�n.");

	if(PlayerData[playerid][pPhoneline] == INVALID_PLAYER_ID)
		return SendClientMessage(playerid, COLOR_ADM, "SERVER: Kimse taraf�ndan aranm�yorsun yada �a�r�da de�ilsin.");

	new
		player_b;

	cmd_ame(playerid, "telefonunu cebine koyar.");

	if(PlayerData[playerid][pUsingBurner])
		PlayerData[playerid][pUsingBurner] = false;

	if(PlayerData[playerid][pPhoneline] == 911 || PlayerData[playerid][pPhoneline] == 999 && PlayerData[playerid][pCalling])
	{
		PlayerData[playerid][pCalling] = 0;
		PlayerData[playerid][pPhoneline] = INVALID_PLAYER_ID;

		for(new i = 0; i < 2; i++)
			KillTimer(PlayerData[playerid][p911CallTimer][i]);

		return 1;
	}

	if(PlayerData[playerid][pPhoneline] == 1800)
	{
		if(PlayerData[playerid][pCalling] > 0) KillTimer(PlayerBillboardTimer[playerid]);

		PlayerData[playerid][pCalling] = 0;
		PlayerData[playerid][pPhoneline] = INVALID_PLAYER_ID;
		return 1;
	}

	if(PlayerData[playerid][pPhoneline] == 789 || PlayerData[playerid][pPhoneline] == 788)
	{
		if(PlayerData[playerid][pCalling] > 0)
			KillTimer(PlayerStolenCarTimer[playerid]);

		PlayerData[playerid][pCalling] = 0;
		PlayerData[playerid][pPhoneline] = INVALID_PLAYER_ID;

		PlayerStolenCarPrompt[playerid] = 0;
		PlayerStolenCarPlate[playerid] = "";
		return 1;
	}

	if(PlayerData[playerid][pPhoneline] == MECHANIC_NUMBER)
	{
		if(PlayerData[playerid][pCalling] > 0)
			KillTimer(MechanicCallTimer[playerid]);

		PlayerData[playerid][pPhoneline] = INVALID_PLAYER_ID;
		PlayerData[playerid][pCalling] = 0;

		format(MechanicText[playerid], 128, "");
		return 1;
	}

	if(PlayerData[playerid][pPhoneline] == TAXI_NUMBER)
	{
		if(PlayerData[playerid][pCalling] > 0) KillTimer(TaxiCallTimer[playerid]);

		PlayerData[playerid][pPhoneline] = INVALID_PLAYER_ID;
		PlayerData[playerid][pCalling] = 0;

		//TaxiStage[playerid] = 0;
		//for(new i = 0; i < 2; i++) format(TaxiText[playerid][i], 128, "");
		return 1;
	}

	if(PlayerData[playerid][pPhoneline] == 991)
	{
		if(PlayerData[playerid][pCalling] > 0)
			KillTimer(phoneTimer[playerid]);

		PlayerData[playerid][pPhoneline] = INVALID_PLAYER_ID;
		PlayerData[playerid][pCalling] = 0;

		DeletePVar(playerid, "NonEmergencyCall");
		return 1;
	}

	player_b = PlayerData[playerid][pPhoneline];

	KillTimer(phoneTimer[player_b]);
	KillTimer(phoneTimer[playerid]);

	if (PlayerData[playerid][pUseGUI])
	{
		PlayerTextDrawSetString(playerid, PhoneNotify[playerid], "_");
		PlayerTextDrawHide(playerid, PhoneNotify[playerid]);
	    PlayerTextDrawShow(playerid, PhoneBtnMenu[playerid]);
	}

	if (PlayerData[player_b][pUseGUI])
	{
		PlayerTextDrawSetString(player_b, PhoneNotify[player_b], "_");
		PlayerTextDrawHide(player_b, PhoneNotify[player_b]);
		PlayerTextDrawShow(player_b, PhoneBtnMenu[player_b]);
 	}

	SetPlayerCellphoneAction(playerid, false);
	PlayerPlaySound(playerid, 20601, 0.0, 0.0, 0.0);
	SendClientMessage(playerid, COLOR_GREY, "[!] �a�r�y� sonland�rd�n.");

	SetPlayerCellphoneAction(player_b, false);
	PlayerPlaySound(player_b, 20601, 0.0, 0.0, 0.0);
	SendClientMessage(player_b, COLOR_GREY, "[!] �a�r� sonland�r�ld�.");

	PlayerData[playerid][pCalling] = 0;
	PlayerData[player_b][pCalling] = 0;

	PlayerData[player_b][pPhoneline] = INVALID_PLAYER_ID;
	PlayerData[playerid][pPhoneline] = INVALID_PLAYER_ID;
	return 1;
}

CMD:hoparlor(playerid, params[])
{
	if(MainPhone[playerid] == 0 && PlayerData[playerid][pPhoneOff])
		return SendClientMessage(playerid, COLOR_ADM, "SERVER: Telefonun kapal�yken bu komutu kullanamazs�n.");

	if(MainPhone[playerid] == 1 && PlayerData[playerid][pBurnerPhoneOff])
		return SendClientMessage(playerid, COLOR_ADM, "SERVER: Telefonun kapal�yken bu komutu kullanamazs�n.");

	PlayerData[playerid][pLoudspeaker] = !PlayerData[playerid][pLoudspeaker];
	cmd_me(playerid, sprintf("telefonun hoparl�r�n� %s.", (PlayerData[playerid][pLoudspeaker] != 1) ? ("kapat�r") : ("a�ar")));
	return 1;
}

CMD:bagisyap(playerid, params[])
{
	new miktar;
	if(sscanf(params, "i", miktar)) return SendUsageMessage(playerid, "/bagisyap [miktar]");
	if(miktar < 1 || miktar > PlayerData[playerid][pMoney]) return SendErrorMessage(playerid, "Yazd���n miktar kadar paran yok.");

	SendClientMessageEx(playerid, COLOR_GREY, "%s, $%s miktarl�k ba����n i�in te�ekk�rler. (%s)", ReturnName(playerid), MoneyFormat(miktar), GetFullTime(Time()));
	//PlayerData[playerid][pBank] += miktar;
	GiveMoney(playerid, -miktar);
	return 1;
}

CMD:parayatir(playerid, params[])
{
	static id = -1;
	if(((id = IsPlayerInBusiness(playerid)) == -1 || BusinessData[id][BusinessType] != BUSINESS_BANK) && ATM_Nearest(playerid) == -1)
		return SendErrorMessage(playerid, "Bu komutu banka i�inde veya ATM cihaz�ndan kullanabilirsin.");

	new deposit;
	if(sscanf(params, "i", deposit)) return SendUsageMessage(playerid, "/parayatir [miktar]");
	if(deposit < 1) return SendErrorMessage(playerid, "En az yat�rabilece�in miktar $1 olmal�.");
	if(deposit > PlayerData[playerid][pMoney]) return SendErrorMessage(playerid, "Yazd���n miktar kadar paran yok.");

	GiveMoney(playerid, -deposit);
	PlayerData[playerid][pBank] += deposit;
	SendClientMessageEx(playerid, COLOR_ADM, "[!] {FFFFFF}Hesab�na {FF6346}$%s {FFFFFF}yat�rd�n! Kalan: {FF6346}$%s", MoneyFormat(deposit), MoneyFormat(PlayerData[playerid][pBank]));

	//WriteLog("money_logs/bank_log.txt", "[%s] %s deposited $%d into their bank, New balance: $%d (Hand: $%d)", ReturnDate(), ReturnName(playerid, 1), deposit, PlayerData[playerid][pBank], PlayerData[playerid][pMoney]);
	return 1;
}

CMD:paracek(playerid, params[])
{
	static id = -1;
	if(((id = IsPlayerInBusiness(playerid)) == -1 || BusinessData[id][BusinessType] != BUSINESS_BANK) && ATM_Nearest(playerid) == -1)
		return SendErrorMessage(playerid, "Bu komutu banka i�inde veya ATM cihaz�ndan kullanabilirsin.");

	static amount;
	if(sscanf(params, "d", amount)) return SendUsageMessage(playerid, "/paracek [miktar]");
	if(amount < 1) return SendErrorMessage(playerid, "En az �ekebilece�in miktar $1 olmal�.");
	if(amount > PlayerData[playerid][pBank]) return SendErrorMessage(playerid, "Yazd���n miktar kadar paran yok.");
	if(PlayerData[playerid][pSavings]) return SendErrorMessage(playerid, "Mevduat hesab�n� aktif iken para �ekemezsin.");

	GiveMoney(playerid, amount);
	PlayerData[playerid][pBank] -= amount;
	SendClientMessageEx(playerid, COLOR_ADM, "[!] {FFFFFF}Hesab�ndan {FF6346}$%s {FFFFFF}�ektin! Kalan: {FF6346}$%s", MoneyFormat(amount), MoneyFormat(PlayerData[playerid][pBank]));

	//WriteLog("money_logs/withdraw_log.txt", "[%s] %s withdrew $%d from their bank, New balance: $%d (Hand: $%d)", ReturnDate(), ReturnName(playerid, 1), total, PlayerData[playerid][pBank], PlayerData[playerid][pMoney]);
	return 1;
}

CMD:maascek(playerid, params[])
{
	static id = -1;
	if(((id = IsPlayerInBusiness(playerid)) == -1 || BusinessData[id][BusinessType] != BUSINESS_BANK) && ATM_Nearest(playerid) == -1)
		return SendErrorMessage(playerid, "Bu komutu banka i�inde veya ATM cihaz�ndan kullanabilirsin.");

	if(PlayerData[playerid][pPaycheck] == 0) return SendErrorMessage(playerid, "Maa� hesab�nda hi� para yok.");

	GiveMoney(playerid, PlayerData[playerid][pPaycheck]);
	SendClientMessageEx(playerid, COLOR_ADM, "[!] {FFFFFF}Maa� hesab�ndan {FF6346}$%s {FFFFFF}miktar maa� �ektin.", MoneyFormat(PlayerData[playerid][pPaycheck]));
	PlayerData[playerid][pPaycheck] = 0;
	return 1;
}

CMD:transfer(playerid, params[])
{
	static id = -1;
	if(((id = IsPlayerInBusiness(playerid)) == -1 || BusinessData[id][BusinessType] != BUSINESS_BANK) && ATM_Nearest(playerid) == -1)
		return SendErrorMessage(playerid, "Bu komutu banka i�inde veya ATM cihaz�ndan kullanabilirsin.");

	new who, amount;
	if(sscanf(params, "ud", who, amount)) return SendUsageMessage(playerid, "/transfer [oyuncu ID/ad�] [miktar]");
	if(playerid == who) return SendErrorMessage(playerid, "Kendine transfer yapamazs�n.");
	if(!IsPlayerConnected(who)) return SendErrorMessage(playerid, "Belirtti�iniz ki�i oyunda yok.");
	if(!pLoggedIn[who]) return SendErrorMessage(playerid, "Belirtti�iniz ki�i hen�z �ifresini girmemi�.");
	if(amount < 1 || amount > PlayerData[playerid][pBank]) return SendErrorMessage(playerid, "Yazd���n miktar kadar paran yok.");
	if(PlayerData[playerid][pLevel] < 3) return SendErrorMessage(playerid, "Para g�nderebilmek i�in en az 3. seviye olmal�s�n.");
	if(PlayerData[who][pLevel] < 3) return SendErrorMessage(playerid, "Para g�ndermek istedi�in ki�i i�in en az 3. seviye olmal�.");
	if(PlayerData[playerid][pSavings]) return SendErrorMessage(playerid, "Mevduat hesab�n� aktif durumdayken para g�nderemezsin.");

	PlayerData[playerid][pBank] -= amount;
	PlayerData[who][pBank] += amount;
	SendClientMessageEx(playerid, COLOR_ADM, "[!] {FFFFFF}Hesab�ndan %s isimli ki�iye {FF6346}$%s {FFFFFF}transfer yapt�n! G�ncel Tutar: {FF6346}$%s", ReturnName(who), MoneyFormat(amount), MoneyFormat(PlayerData[playerid][pBank]));
	SendClientMessageEx(who, COLOR_ADM, "[!] {FFFFFF}Hesab�na %s taraf�ndan {FF6346}$%s {FFFFFF}transfer geldi! G�ncel Tutar: {FF6346}$%s", ReturnName(playerid), MoneyFormat(amount), MoneyFormat(PlayerData[who][pBank]));
	return 1;
}

CMD:bakiye(playerid, params[])
{
	static id = -1;
	if(((id = IsPlayerInBusiness(playerid)) == -1 || BusinessData[id][BusinessType] != BUSINESS_BANK) && ATM_Nearest(playerid) == -1)
		return SendErrorMessage(playerid, "Bu komutu banka i�inde veya ATM cihaz�ndan kullanabilirsin.");

	SendClientMessageEx(playerid, COLOR_ADM, "[!] {FFFFFF}%s tarihi itibariyle banka hesab�n�zda $%s miktar para bulunuyor.", GetFullTime(Time()), MoneyFormat(PlayerData[playerid][pBank]));
	return 1;
}

CMD:mevduat(playerid, params[])
{
	static id = -1;
	if((id = IsPlayerInBusiness(playerid)) == -1 || BusinessData[id][BusinessType] != BUSINESS_BANK)
		return SendErrorMessage(playerid, "Bu komutu banka i�inde kullanabilirsin.");

	if(!PlayerData[playerid][pSavings])
	{
		new amount;
		if(sscanf(params, "i", amount)) return SendUsageMessage(playerid, "/mevduat [miktar]");
		if(amount < 50000 || amount > 100000) return SendErrorMessage(playerid, "Mevduat miktar� en az $50,000 en fazla $100,000 olabilir.");
		if(amount > PlayerData[playerid][pMoney]) return SendErrorMessage(playerid, "Bu kadar paran bulunmuyor.");

		PlayerData[playerid][pSavings] = amount;
		GiveMoney(playerid, -amount);
		SendClientMessage(playerid, COLOR_WHITE, "|___ HESAP DURUMU ___|");
		SendClientMessageEx(playerid, COLOR_WHITE, "   Mevduat hesab� miktar�: $%s", MoneyFormat(PlayerData[playerid][pSavings]));
		//WriteLog("money_logs/savings_log.txt", "[%s] %s started their savings with : $%d", ReturnDate(), ReturnName(playerid, 1), amount);
		return true;
	}
	else if(isnull(params) && PlayerData[playerid][pSavings])
	{
		SendClientMessage(playerid, COLOR_WHITE, "|___ HESAP DURUMU ___|");
		SendClientMessageEx(playerid, COLOR_WHITE, "   Mevduat hesab� miktar�: $%s", MoneyFormat(PlayerData[playerid][pSavings]));
		SendClientMessageEx(playerid, COLOR_ADM, "[!] {FFFFFF}Mevduat hesab�nda {FF6346}$%s {FFFFFF}bulunuyor.", MoneyFormat(PlayerData[playerid][pSavings]));
		SendInfoMessage(playerid, "Mevduat�n� �ekebilmek i�in /mevduat cek yazabilirsin. (T�m paray� �eker)");
		return 1;
	}

	if(!isnull(params) && !strcmp(params, "cek", true))
	{
		if (!PlayerData[playerid][pSavings]) return SendErrorMessage(playerid, "Mevduat hesab�nda paran bulunmuyor.");
		ConfirmDialog(playerid, "Mevduat: Onay", "T�m birikimlerinizi �ekmek istiyor musunuz?\n\n{F81414}Bu geri al�namaz ve ba�tan ba�laman�z gerekir.", "OnPlayerSavingsWithdraw");
		return 1;
	}

	return true;
}

Server:OnPlayerSavingsWithdraw(playerid, response)
{
	if(response)
	{
		//WriteLog("money_logs/savingswithdraw_log.txt", "[%s] %s withdrew their savings of : $%s", ReturnDate(), ReturnName(playerid, 1), PlayerData[playerid][pSavings]);

		SendClientMessageEx(playerid, COLOR_ADM, "[!] {FFFFFF}Mevduat hesab�ndan {FF6346}$%s {FFFFFF}�ektin!", MoneyFormat(PlayerData[playerid][pSavings]));
		GiveMoney(playerid, PlayerData[playerid][pSavings]);
		PlayerData[playerid][pSavings] = 0;
	}
	else{
		SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}Birikimlerinizi daha sonra tekrar �ekebilmek i�in {FF6346}/mevduat cek {FFFFFF}yazabilirsin.");
	}
	return 1;
}

CMD:maske(playerid, params[])
{
	if(!PlayerData[playerid][pHasMask] && PlayerData[playerid][pDonator] < 2 && !PlayerData[playerid][pLAWduty] && !PlayerData[playerid][pMEDduty] && !PlayerData[playerid][pAdmin]) return SendClientMessage(playerid, COLOR_ADM, "HATA: Masken bulunmuyor.");

	if(PlayerData[playerid][pMaskOn])
	{
		foreach(new i : Player)
		{
			ShowPlayerNameTagForPlayer(i, playerid, 1);
   			Streamer_Update(i);
		}

	    TextDrawHideForPlayer(playerid, Masktd);
		GameTextForPlayer(playerid, "~p~MASKEYI CIKARDIN", 2000, 5);
		PlayerData[playerid][pMaskOn] = false;
	}
	else
	{
		foreach(new i : Player)
		{
			if(!PlayerData[i][pAdminDuty])
			{
				ShowPlayerNameTagForPlayer(i, playerid, 0);
				Streamer_Update(i);
			}
		}

        TextDrawShowForPlayer(playerid, Masktd);
		GameTextForPlayer(playerid, "~p~MASKEYI TAKTIN", 2000, 5);
		PlayerData[playerid][pMaskOn] = true;
	}
	return 1;
}

CMD:admins(playerid, params[])
{
	new count;
	SendClientMessage(playerid, COLOR_GREY, "Aktif Adminler:");
	foreach(new i : Player)
	{
		if(PlayerData[i][pAdmin] && !PlayerData[i][pAdminHide])
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "{%s}(Level: %i) %s (%s) (ID: %i) - ��ba��: %s", PlayerData[i][pAdminDuty] ? ("33AA33") : ("AFAFAF"), PlayerData[i][pAdmin], ReturnName(i), PlayerData[i][pAdminName], i, PlayerData[i][pAdminDuty] ? ("Evet") : ("Hay�r"));
			count++;
		}
	}

	if(!count) return SendClientMessage(playerid, COLOR_GREY, "Aktif admin bulunamad�.");
	return 1;
}

CMD:sifredegistir(playerid, params[])
{
	if(CanChangePassword[playerid])
	{
		CanChangePassword[playerid] = 0;

		new
			largeString[800];

		strcat(largeString, "{F81414}��FREN� DE���T�RMEK �ZERES�N!\n");
		strcat(largeString, "{FFFFFF}Hesap �ifrenizi g�vende tutmak i�in birka� ipucu:\n\n");
		strcat(largeString, "\tParolan�zda harf, say� ve simge kar���m� kullan�n.\n");
		strcat(largeString, "\t�nemli hesaplar�n�z�n her biri i�in benzersiz bir �ifre kullan�n.\n");
		strcat(largeString, "\tKi�isel bilgilerinizi veya yayg�n kelimeleri �ifre olarak kullanmay�n.\n");
		strcat(largeString, "\twww.lss-roleplay.com forum hesab�n�zla ayn� �ifreyi kullanmay�n.\n\n");
		strcat(largeString, "Unutmay�n, Los Santos Stories ekibi asla �ifrenizi istemez.\n\n");
		strcat(largeString, "{F81414}�ifreniz en az 3 fazla 128 karakter aral���nda olmal�d�r.");
		ShowPlayerDialog(playerid, DIALOG_PASSWORD_CHANGE, DIALOG_STYLE_PASSWORD, "Los Santos Stories: �ifre De�i�tir", largeString, "De�i�tir", "�ptal");
		return 1;
	}
	else
	{
		new query[128];
		mysql_format(m_Handle, query, sizeof(query), "SELECT RegisterIP, LastIP, HWID, Password FROM players WHERE id = %i", PlayerData[playerid][pSQLID]);
		new Cache:cache = mysql_query(m_Handle, query);

		new largeString[600];

		new IP[60], RegisterIP[60], HWID[90];
		cache_get_value_name(0, "LastIP", IP, 60);
		cache_get_value_name(0, "RegisterIP", RegisterIP, 60);
		cache_get_value_name(0, "HWID", HWID, 90);
		cache_delete(cache);

		if(strcmp(ReturnGPCI(playerid), HWID, false))
		{
			strcat(largeString, "{F81414}B�R HATA OLU�TU!\n\n");
			strcat(largeString, "{FFFFFF}�ifre de�i�ikli�ine izin vermeden �nce g�venlik kontrol�m�zde �nemli bir ad�m� do�rulayamad�k.\n");
			strcat(largeString, "Bu �nlem, hesab�n�z�n ihlal edilmesini �nlemek ve g�venli�ini sa�lamak i�in uygulanm��t�r\n\n");
			strcat(largeString, "L�tfen istekte bulunmak ve �ifre de�i�ikli�ine izin vermek i�in www.lss-roleplay.com forumunu ziyaret edin.");
			ShowPlayerDialog(playerid, DIALOG_USE, DIALOG_STYLE_MSGBOX, "Los Santos Stories: �ifre De�i�tir", largeString, "Tamam", "");
			return 1;
		}

		if(strcmp(ReturnIP(playerid), RegisterIP, false))
		{
			strcat(largeString, "{F81414}G�VENL�K KEL�MES� GEREK�YOR!\n\n");
			strcat(largeString, "{FFFFFF}Sunucu ile ba�lant�n�zda bir de�i�iklik olmu� gibi g�r�n�yor. Hesab�n�z�n g�venlik kelimesini...\n");
			strcat(largeString, "girerek, hesab�n�n �ifresini de�i�tirebilirsin. Bu, ilk kay�t oldu�unuzda ayarlad���n�z kelimeydi.\n");
			ShowPlayerDialog(playerid, DIALOG_PASSWORD_SECURITY_WORD, DIALOG_STYLE_PASSWORD, "Los Santos Stories: �ifre De�i�tir", largeString, "De�i�tir", "�ptal");
			return 1;
		}

		if(strcmp(ReturnIP(playerid), IP, false))
		{
			strcat(largeString, "{F81414}G�VENL�K KEL�MES� GEREK�YOR!\n\n");
			strcat(largeString, "{FFFFFF}Sunucu ile ba�lant�n�zda bir de�i�iklik olmu� gibi g�r�n�yor. Hesab�n�z�n g�venlik kelimesini...\n");
			strcat(largeString, "girerek, hesab�n�n �ifresini de�i�tirebilirsin. Bu, ilk kay�t oldu�unuzda ayarlad���n�z kelimeydi.\n");
			ShowPlayerDialog(playerid, DIALOG_PASSWORD_SECURITY_WORD, DIALOG_STYLE_PASSWORD, "Los Santos Stories: �ifre De�i�tir", largeString, "De�i�tir", "�ptal");
			return 1;
		}

		strcat(largeString, "{F81414}��FREN� DE���T�RMEK �ZERES�N!\n");
		strcat(largeString, "{FFFFFF}Hesap �ifrenizi g�vende tutmak i�in birka� ipucu:\n\n");
		strcat(largeString, "\tParolan�zda harf, say� ve simge kar���m� kullan�n.\n");
		strcat(largeString, "\t�nemli hesaplar�n�z�n her biri i�in benzersiz bir �ifre kullan�n.\n");
		strcat(largeString, "\tKi�isel bilgilerinizi veya yayg�n kelimeleri �ifre olarak kullanmay�n.\n");
		strcat(largeString, "\twww.lss-roleplay.com forum hesab�n�zla ayn� �ifreyi kullanmay�n.\n\n");
		strcat(largeString, "Unutmay�n, Los Santos Stories ekibi asla �ifrenizi istemez.\n\n");
		strcat(largeString, "{F81414}�ifreniz en az 3 fazla 128 karakter aral���nda olmal�d�r.");
		ShowPlayerDialog(playerid, DIALOG_PASSWORD_CHANGE, DIALOG_STYLE_PASSWORD, "Los Santos Stories: �ifre De�i�tir", largeString, "De�i�tir", "�ptal");
	}
	return 1;
}

CMD:lisans(playerid, params[])
{
	new playerb;
	if(sscanf(params, "u", playerb))
		return SendUsageMessage(playerid, "/lisans [oyuncu ID/ad�]");
	if(!IsPlayerConnected(playerb))
		return SendErrorMessage(playerid, "Belirtti�in ki�i aktif de�il.");
	if(!pLoggedIn[playerb])
		return SendErrorMessage(playerid, "Belirtti�in ki�i giri� yapmam��.");
	if(!GetDistanceBetweenPlayers(playerid, playerb, 5.0))
		return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");

	if(playerb != playerid) SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s kimli�ini %s adl� ki�iye g�sterir.", ReturnName(playerid, 0), ReturnName(playerb, 0));
	else SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s kendi kimlik kart�na bak�n�r.", ReturnName(playerid, 0));
	Player_ReturnLicenses(playerid, playerb);
	return 1;
}

CMD:sahtelisans(playerid, params[])
{
	new playerb, kimlik, ehliyet, silah, medikal, isim[24];
	if(sscanf(params, "uiiiis[24]", playerb, kimlik, ehliyet, silah, medikal, isim))
		return SendUsageMessage(playerid, "/sahtelisans [oyuncu ID/ad�] [kimlik numaras�(0/1)] [ehliyet(0/1)] [silah lisans�(0/1)] [medikal lisans�(0/1)] [sahte isim]");
	if(!IsPlayerConnected(playerb))
		return SendErrorMessage(playerid, "Belirtti�in ki�i aktif de�il.");
	if(!pLoggedIn[playerb])
		return SendErrorMessage(playerid, "Belirtti�in ki�i giri� yapmam��.");
	if(!GetDistanceBetweenPlayers(playerid, playerb, 5.0))
		return SendErrorMessage(playerid, "Belirtti�in ki�iye yak�n de�ilsin.");

    if (kimlik < 0 || kimlik > 1 && ehliyet < 0 || ehliyet > 1 && silah < 0 || silah > 1 && medikal < 0 || medikal > 1)
        return SendErrorMessage(playerid, "Say� de�erlerini sadece 1 ile 0 aras�nda girebilirsin.");

	SendClientMessage(playerb, COLOR_DARKGREEN, "_____Kimlik Bilgileri______");
	SendClientMessageEx(playerb, COLOR_GRAD2, "�sim Soyisim: %s", isim);
	SendClientMessageEx(playerb, COLOR_GRAD2, "Kimlik Numaras�: %i", kimlik != 0 ? (300000+random(199992)) : PlayerData[playerid][pSecurityNumber]);
	SendClientMessageEx(playerb, COLOR_GRAD2, "Ehliyet: %s", !ehliyet ? ("{FF6346}Yok") : ("{E2FFFF}Var"));
	SendClientMessageEx(playerb, COLOR_GRAD2, "Silah Lisans�: %s", !silah ? ("{FF6346}Yok") : ("{E2FFFF}Var"));
	SendClientMessageEx(playerb, COLOR_GRAD2, "Medikal Lisans�: %s", !medikal ? ("{FF6346}Yok") : ("{E2FFFF}Var"));
	SendClientMessage(playerb, COLOR_DARKGREEN, "___________________________");

	if(playerb != playerid)
		SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s kimli�ini %s adl� ki�iye g�sterir.", ReturnName(playerid, 0), ReturnName(playerb, 0));
	else
		SendNearbyMessage(playerid, 20.0, COLOR_EMOTE, "* %s kendi kimlik kart�na bak�n�r.", ReturnName(playerid, 0));
	return 1;
}

CMD:yemek(playerid, params[])
{
	static id = -1;
	if((id = IsPlayerInBusiness(playerid)) == -1) return SendErrorMessage(playerid, "Herhangi bir i�yeri i�erisinde de�ilsin.");
	if(BusinessData[id][BusinessType] != BUSINESS_RESTAURANT) return SendErrorMessage(playerid, "Bu komutu sadece restoranlarda kullanabilirsin.");
	if(GetPVarInt(playerid, "Viewing_FoodList") == 1) return SendErrorMessage(playerid, "Yemek listesine bakarken bu komutu kullanamazs�n.");
	if(GetPVarInt(playerid, "Viewing_StoreList") == 1) return SendErrorMessage(playerid, "�r�n listesine bakarken bu komutu kullanamazs�n.");
	if(GetPVarInt(playerid, "Viewing_OwnedCarList") == 1) return SendErrorMessage(playerid, "Ara� listene bakarken bu komutu kullanamazs�n.");

	new meal_id = PlayerData[playerid][pCarryMeal];
	if(meal_id != -1) return SendErrorMessage(playerid, "Elinde tepsi ta��yorsun.");
	Food_Menu(playerid, true);
	return 1;
}

CMD:tepsi(playerid, params[])
{
	if(EditingObject[playerid]) return SendErrorMessage(playerid, "�u anda ba�ka bir obje d�zenliyorsun.");
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return SendErrorMessage(playerid, "Tepsiyi kullanmak i�in ara�tan in.");

	if(isnull(params) || strlen(params) > 20)
	{
	    SendUsageMessage(playerid, "/tepsi [eylem]");
	    SendClientMessage(playerid, COLOR_ADM, "at {FFFFFF}- tepsiyi ��pe atar.");
	    SendClientMessage(playerid, COLOR_ADM, "al {FFFFFF}- tepsiyi alman� sa�lar.");
	    SendClientMessage(playerid, COLOR_ADM, "koy {FFFFFF}- tepsiyi yerle�tirmeni sa�lar.");
	    SendClientMessage(playerid, COLOR_ADM, "siparis {FFFFFF}- yemek sipari�i vermeni sa�lar.");
	    SendClientMessage(playerid, COLOR_ADM, "fiyat {FFFFFF}- yemek fiyatlar�n� ayarlaman� sa�lar.");
	    return 1;
	}

	if(!strcmp(params, "at", true))
	{
		new id = PlayerData[playerid][pCarryMeal];
		if(id == -1) return SendErrorMessage(playerid, "Elinde tepsi ta��m�yorsun.");

		//cmd_ame(playerid, "yeme�ini atar.");
		RemovePlayerAttachedObject(playerid, SLOT_MEAL);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		PlayerData[playerid][pCarryMeal] = -1;
		Meal_Drop(id);
		return 1;
	}
	else if(!strcmp(params, "al", true))
	{
		new id = PlayerData[playerid][pCarryMeal];
		if(id != -1) return SendErrorMessage(playerid, "Elinde tepsi ta��yorsun.");

		new meal_id = GetNearestMeal(playerid);
		if(meal_id == -1) return SendErrorMessage(playerid, "Etraf�nda tepsi yok.");

		if(MealData[meal_id][MealEditing] || MealData[meal_id][MealPlayerID] != -1)
			return SendErrorMessage(playerid, "Bu tepsi ba�kas� taraf�ndan kontrol ediliyor.");

        SetPlayerAttachedObject(playerid, SLOT_MEAL, MealData[meal_id][MealModelID], 1, 0.004999, 0.529999, 0.126999, -83.200004, 115.999961, -31.799890);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
  		PlayerData[playerid][pCarryMeal] = meal_id;

		MealData[meal_id][MealPlayerID] = playerid;
		DestroyDynamicObject(MealData[meal_id][MealObjectID]);
		MealData[meal_id][MealPos][0] = MealData[meal_id][MealPos][1] = MealData[meal_id][MealPos][2] = 0.0;
		MealData[meal_id][MealInterior] = MealData[meal_id][MealWorld] = 0;
		MealData[meal_id][MealEditing] = false;
		return 1;
	}
	else if(!strcmp(params, "koy", true))
	{
		new id = PlayerData[playerid][pCarryMeal];
		if(id == -1) return SendErrorMessage(playerid, "Elinde tepsi ta��m�yorsun.");

	    RemovePlayerAttachedObject(playerid, SLOT_MEAL);
	    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);

	    new Float: x, Float: y, Float: z;
		GetPlayerPos(playerid, x, y, z);

	    MealData[id][MealPlayerID] = -1;
	    MealData[id][MealPos][0] = x, MealData[id][MealPos][1] = y, MealData[id][MealPos][2] = z;
	    MealData[id][MealInterior] = GetPlayerInterior(playerid);
        MealData[id][MealWorld] = GetPlayerVirtualWorld(playerid);
		MealData[id][MealEditing] = true;

		EditingObject[playerid] = 15;
		EditingID[playerid] = id;
	    MealData[id][MealObjectID] = CreateDynamicObject(MealData[id][MealModelID], x, y, z, 0.0, 0.0, 0.0, MealData[id][MealWorld], MealData[id][MealInterior]);
	    EditDynamicObject(playerid, MealData[id][MealObjectID]);
		PlayerData[playerid][pCarryMeal] = -1;
		return 1;
	}
	else if(!strcmp(params, "siparis", true))
	{
        cmd_yemek(playerid, "");
	}
	else if(!strcmp(params, "fiyat", true))
	{
		if(!Business_Count(playerid)) return SendErrorMessage(playerid, "Hi� i�yerin yok.");
        Food_Config(playerid);
        return 1;
	}
	return 1;
}

CMD:kurallar(playerid, params[])
{
	SendClientMessage(playerid, -1, "Kurallar a�a��daki web sitesinde bulunabilir. Kay�t olurken kurallar� zaten kabul ettiniz...");
	SendClientMessage(playerid, -1, "forum.lss-roleplay.com");
	return 1;
}

/*CMD:spawndegistir(playerid, params[])
{
	new spawn_id, optional;
	if(sscanf(params, "dI(-1)", spawn_id, optional))
	{
		SendClientMessage(playerid, COLOR_WHITE, "SERVER: /spawnayarla [spawn ID]");
		SendClientMessage(playerid, COLOR_DARKGREEN, "1. Havaalan� | 2. Ev | 3. Kiral�k Ev | 4. Birlik");
		return 1;
	}

	if(spawn_id < 1 || spawn_id > 4)
		return SendServerMessage(playerid, "Hatal� spawn ID girdin.");

	switch (spawn_id)
	{
		case 1:
		{
		    if (PlayerData[playerid][pSpawnPoint] == SPAWN_POINT_AIRPORT)
		        return SendServerMessage(playerid, "Zaten buras� sizin oyuna ba�lama noktan�z olarak se�ilmi�.");

			PlayerData[playerid][pSpawnPoint] = SPAWN_POINT_AIRPORT;
			SendServerMessage(playerid, "Art�k Los Santos Airport b�lgesinde oyuna ba�layacaks�n.");
		}
		case 2:
		{
			if(CountPlayerHouses(playerid) == 0)
				return SendServerMessage(playerid, "Herhangi bir evin yok.");

			new
			    str[128];

			for(new i = 1, j = 0; i < MAX_PROPERTY; i++)
			{
				if(PropertyData[i][PropertyOwnerID] != PlayerData[playerid][pSQLID])
					continue;

				playerHouseSelect[playerid][j] = i;
				j++;

				if(j >= 3)
					break;
			}

			for(new c = 0; c < 3; c++)
			{
				if(playerHouseSelect[playerid][c])
				{
					format(str, sizeof(str), "%sEv %i Adres: %s\n", str, c+1, PropertyData[c][PropertyAddress]);
				}
			}

			ShowPlayerDialog(playerid, DIALOG_SELECT_HOUSE, DIALOG_STYLE_LIST, "Spawn Noktas�: Ev", str, "Se�", "<<");
		}
		case 3:
		{
			if(!PlayerData[playerid][pRenting])
				return SendServerMessage(playerid, "Herhangi bir kiralad���n evin yok.");

			PlayerData[playerid][pSpawnPoint] = SPAWN_POINT_RENTING;
			SendServerMessage(playerid, "Art�k kiral�k evinde oyuna ba�layacaks�n.");
		}
		case 4:
		{
  			if (PlayerData[playerid][pSpawnPoint] == SPAWN_POINT_FACTION)
		        return SendServerMessage(playerid, "Zaten buras� sizin oyuna ba�lama noktan�z olarak se�ilmi�.");

			new f = PlayerData[playerid][pFaction];
			if(!FactionData[f][FactionID])
				return SendServerMessage(playerid, "Herhangi bir birlikte de�ilsin.");

			if (FactionData[f][FactionSpawn][0] == 0.0)
				return SendServerMessage(playerid, "Birli�in spawn noktas� ayarlanmam��.");

			PlayerData[playerid][pSpawnPoint] = SPAWN_POINT_FACTION;
			PlayerData[playerid][pSpawnPrecinct] = 0;
			SendServerMessage(playerid, "Art�k birlik noktas�nda oyuna ba�layacaks�n.");
		}
		case 5:
		{

		}
	}
	return 1;
}

CountPlayerHouses(playerid)
{
	new count = 0;

	for(new i = 0; i < MAX_PROPERTY; i++)
	{
		if(PropertyData[i][PropertyOwnerID] == PlayerData[playerid][pSQLID])
		{
			count++;
		}
	}

	return count;
}*/

CMD:aksesuarsatinal(playerid, params[])
{
	new
		biz = -1;

	if((biz = IsPlayerInBusiness(playerid)) != -1)
	{
		if(BusinessData[biz][BusinessType] == BUSINESS_CLOTHING)
		{
			new subString[64];
				static string[sizeof(aksesuarListe) * sizeof(subString)];

				if (string[0] == EOS)
				{
						for (new x; x < sizeof(aksesuarListe); x++)
						{
								format(subString, sizeof(subString), "%i\n", aksesuarListe[x][modelidx]);
								strcat(string, subString);
						}
				}

				return ShowPlayerDialog(playerid, DIALOG_SELECT_ACCESSORY, DIALOG_STYLE_PREVIEW_MODEL, "Aksesuarlar", string, "Sec", "Iptal"), ac_ShowPlayerDialog(playerid, DIALOG_SELECT_ACCESSORY);
		}
		else SendErrorMessage(playerid, "Bulundu�unuz i�yeri bir k�yafet ma�azas� de�il.");
	}
	return 1;
}

CMD:kiyafetsatinal(playerid, params[])
{
	new
		biz = -1;

	if((biz = IsPlayerInBusiness(playerid)) != -1)
	{
		if(BusinessData[biz][BusinessType] == BUSINESS_CLOTHING)
		{
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

			    return ShowPlayerDialog(playerid, DIALOG_SELECT_SKIN2, DIALOG_STYLE_PREVIEW_MODEL, "Skin Sec", string, "Sec", "Iptal"), ac_ShowPlayerDialog(playerid, DIALOG_SELECT_SKIN2);
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

			    return ShowPlayerDialog(playerid, DIALOG_SELECT_SKIN2, DIALOG_STYLE_PREVIEW_MODEL, "Skin Sec", string, "Sec", "Iptal"), ac_ShowPlayerDialog(playerid, DIALOG_SELECT_SKIN2);
			}
		}
	}
	return 1;
}

CMD:ceset(playerid, params[])
{

    new a_string[60], b_string[128];
    if(sscanf(params, "s[60]S()[128]", a_string, b_string))
    {
			SendUsageMessage(playerid, "/ceset [incele | torba | aractanal & aracakoy | coronercagir | teslim | g�m]");
			return 1;
		}

		if(EditingID[playerid] != 0)
			return SendErrorMessage(playerid, "Bir obje d�zenlerken bu komutu kullanamazs�n.");

		else if(!strcmp(a_string, "incele", true))
		{
			foreach(new cid : Corpses) if(IsPlayerInRangeOfPoint(playerid, 2.5, CorpseData[cid][corpsePos][0], CorpseData[cid][corpsePos][1], CorpseData[cid][corpsePos][2]) && CorpseData[cid][corpseExists] == true)
			{
				if(CorpseData[cid][corpseVehicle] != -1)
					return SendErrorMessage(playerid, "Herhangi bir cesete yak�n de�ilsin.");

				new caption[33], str[355], longstr[1200], countdown = 0;

					format(caption, sizeof(caption), "%s", CorpseData[cid][corpseName]);
					for(new i = 0; i < MAX_CORPSEDAMAGE; i++)
					 {
					   if(CorpseDamages[cid][i][corpseTaken] != 0)
					   {
							 countdown+=1;
							format(str, sizeof(str), "%s b�lgesine %s ile %d hasar (�elik yelek: %d) %d sn �nce.\n", ReturnBodypartName(CorpseDamages[cid][i][corpseBodyPart]), ReturnWeaponName(CorpseDamages[cid][i][corpseWeapon]), CorpseDamages[cid][i][corpseTaken], CorpseDamages[cid][i][corpseArmor], gettime() - CorpseDamages[cid][i][corpseTime]);
							strcat(longstr, str);
						}
					 }

					 if(countdown == 0)
						 {
							 format(str, sizeof(str), "Hi�bir iz yok.");
							 strcat(longstr, str);
						 }

					Dialog_Show(playerid, DIALOG_USE, DIALOG_STYLE_LIST, caption, longstr, "<<", "");


					return 1;
			}
			return SendErrorMessage(playerid, "Herhangi bir cesete yak�n de�ilsin.");
		}

		else if(!strcmp(a_string, "teslim", true))
		{

			if(!IsPoliceFaction(playerid) && !IsMedicFaction(playerid))
				return SendErrorMessage(playerid, "Bu komutu sadece paramedikler ve polisler kullanabilir.");

			if(!IsPlayerInRangeOfPoint(playerid, 10.0, 1176.300048, -1323.380004, 14.014502) && !IsPlayerInRangeOfPoint(playerid, 10.0, 2033.494628, -1408.542724, 17.164062))
				return SendErrorMessage(playerid, "All Saints veya County General hastanesine yak�n olmal�s�n.");

			if(IsPlayerInAnyVehicle(playerid))
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				if(CarData[vehicleid][carCorpse] == -1) return SendErrorMessage(playerid, "Bu arac�n bagaj�nda ceset yok.");

				SendMessage(playerid, "{AFAFAF}[ ! ] Bulundu�unuz ara�taki ceset (%s) hastaneye teslim edildi.", CorpseData[CarData[vehicleid][carCorpse]][corpseName]);
				DespawnCorpse(CarData[vehicleid][carCorpse]);
				CarData[vehicleid][carCorpse] = -1;
				return 1;
			}
			else
			{
				foreach(new cid : Corpses) if(IsPlayerInRangeOfPoint(playerid, 2.5, CorpseData[cid][corpsePos][0], CorpseData[cid][corpsePos][1], CorpseData[cid][corpsePos][2]) && CorpseData[cid][corpseExists] == true)
				{
					if(CorpseData[cid][corpseVehicle] != -1)
						return SendErrorMessage(playerid, "Herhangi bir cesete yak�n de�ilsin.");

					if(CorpseData[cid][corpseBuring] == true)
						return SendErrorMessage(playerid, "Bu ceset �u anda bir oyuncu taraf�ndan g�m�ld��� i�in ceset �zerine bir i�lem yapamazs�n.");

					if(CorpseData[cid][corpseCoroner] == true)
						return SendErrorMessage(playerid, "Yak�n�n�zda bulunan ceset i�in zaten coroner �a��r�lm��.");

						SendMessage(playerid, "{AFAFAF}[ ! ] Yak�n�n�zda bulunan ceset (%s) hastaneye teslim edildi.",  CorpseData[cid][corpseName]);
						DespawnCorpse(cid);
					return 1;
				} return SendErrorMessage(playerid, "Herhangi bir cesete yak�n de�ilsin.");
			}
		}

		else if(!strcmp(a_string, "torba", true))
		{
			foreach(new cid : Corpses) if(IsPlayerInRangeOfPoint(playerid, 2.5, CorpseData[cid][corpsePos][0], CorpseData[cid][corpsePos][1], CorpseData[cid][corpsePos][2]) && CorpseData[cid][corpseExists] == true)
			{
				if(CorpseData[cid][corpseVehicle] != -1)
					return SendErrorMessage(playerid, "Herhangi bir cesete yak�n de�ilsin.");

				if(CorpseData[cid][corpseBodybag] == false)
				{
					if(!IsPoliceFaction(playerid) && !IsMedicFaction(playerid) && PlayerData[playerid][pCorpseBag] == 0)
						return SendErrorMessage(playerid, "Ceset torban yok.");

					CorpseData[cid][corpseBodybag] = true;
					DestroyDynamicActor(CorpseData[cid][corpseActor]);
					CorpseData[cid][corseBodybagObject] = CreateDynamicObject(19944, CorpseData[cid][corpsePos][0], CorpseData[cid][corpsePos][1], CorpseData[cid][corpsePos][2], 0.0, 0.0, 0.0, -1, -1, -1);
					EditingID[playerid] = cid;
					EditingObject[playerid] = 23;
					EditDynamicObject(playerid, CorpseData[EditingID[playerid]][corseBodybagObject]);
					SendMessage(playerid, "{AFAFAF}[ ! ] Yak�n�n�zdaki cesedi ceset torbas�na yerle�tirdiniz. Ceset torbas� objesini d�zenlemeyi unutmay�n.");
				}
				else
				{
					PlayerData[playerid][pCorpseBag] = 1;
					CorpseData[cid][corpseBodybag] = false;
					DestroyDynamicObject(CorpseData[cid][corseBodybagObject]);
					CorpseData[cid][corpseActor] = CreateDynamicActor(CorpseData[cid][corpseSkin], CorpseData[cid][corpsePos][0], CorpseData[cid][corpsePos][1], CorpseData[cid][corpsePos][2], CorpseData[cid][corpsePos][3], true, 100.0, 0, 0, -1);
					ApplyDynamicActorAnimation(CorpseData[cid][corpseActor], "WUZI", "CS_Dead_Guy", 4.1, 0, 1, 1, 1, 0);
					SendMessage(playerid, "{AFAFAF}[ ! ] Yak�n�n�zdaki cesedi ceset torbas�ndan ��kard�n�z.");
				}
				return 1;
			}
			return SendErrorMessage(playerid, "Herhangi bir cesete yak�n de�ilsin.");
		}

		else if(!strcmp(a_string, "coronercagir", true))
		{
			if(!IsPoliceFaction(playerid) && !IsMedicFaction(playerid))
				return SendErrorMessage(playerid, "Bu komutu sadece paramedikler ve polisler kullanabilir.");

			new medic_count = 0;
			foreach(new i : Player)
			{
			    if(PlayerData[i][pMEDduty]) medic_count++;
			}

			if(medic_count != 0)
				return SendErrorMessage(playerid, "Bu komut oyunda paramedikler yokken kullan�labilir. �u an olarak %d paramedik �yesi aktif.", medic_count);

			foreach(new cid : Corpses) if(IsPlayerInRangeOfPoint(playerid, 2.5, CorpseData[cid][corpsePos][0], CorpseData[cid][corpsePos][1], CorpseData[cid][corpsePos][2]) && CorpseData[cid][corpseExists] == true)
			{

				if(CorpseData[cid][corpseVehicle] != -1)
					return SendErrorMessage(playerid, "Herhangi bir cesete yak�n de�ilsin.");

				if(CorpseData[cid][corpseBuring] == true)
					return SendErrorMessage(playerid, "Yak�n�n�zdaki ceset g�m�ld��� i�in o ceset �zerinde i�lem yapam�yorsunuz.");

				if(CorpseData[cid][corpseCoroner] == true)
					return SendErrorMessage(playerid, "Yak�n�n�zda bulunan ceset i�in zaten coroner �a��r�lm��.");

				if(CorpseData[cid][corpseBodybag] == false)
					return SendErrorMessage(playerid, "Yak�n�n�zda bulunan ceset hen�z ceset torbas� i�erisinde de�il.");

				CorpseData[cid][corpseDespawnCountdown] = 60;
				CorpseData[cid][corpseTimer] = SetTimerEx("DespawnCorpse", 1000, true, "i", cid);
				CorpseData[cid][corpseCoroner] = true;
				SendMessage(playerid, "{AFAFAF}[ ! ] Yak�n�n�zdaki ceset (%s) i�in sistemsel olarak coroner �a��rd�n�z.", CorpseData[cid][corpseName]);
				SendMessage(playerid, "{AFAFAF}[ ! ] Yakla��k 1 dakika sonra ceset otomatik olarak silinecek. Rollerinizi ona g�re �ekillendirin.");

				return 1;
			}
			return SendErrorMessage(playerid, "Herhangi bir cesete yak�n de�ilsin.");
		}

		else if(!strcmp(a_string, "aracakoy", true))
		{
				foreach(new cid : Corpses) if(IsPlayerInRangeOfPoint(playerid, 2.5, CorpseData[cid][corpsePos][0], CorpseData[cid][corpsePos][1], CorpseData[cid][corpsePos][2]) && CorpseData[cid][corpseExists] == true)
				{
					if(CorpseData[cid][corpseVehicle] != -1)
						return SendErrorMessage(playerid, "Herhangi bir cesete yak�n de�ilsin.");

					if(CorpseData[cid][corpseBuring] == true)
						return SendErrorMessage(playerid, "Yak�n�n�zdaki ceset g�m�ld��� i�in o ceset �zerinde i�lem yapam�yorsunuz.");

					new vehicleid = GetNearestVehicle(playerid);
					if(vehicleid == INVALID_VEHICLE_ID)
						return SendErrorMessage(playerid, "Bir araca yak�n de�ilsin.");

						new
								Float:x,
								Float:y,
								Float:z;

					GetVehicleBoot(vehicleid, x, y, z);
					if(!IsPlayerInRangeOfPoint(playerid, 2.5, x, y, z)) return SendServerMessage(playerid, "Arac�n bagaj�na yak�n de�ilsin.");

					new engine, lights, alarm, doors, bonnet, boot, objective;
					GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
					if(!boot)
						return SendErrorMessage(playerid, "Bu arac�n bagaj� kapal�.");

					if(!IsValidVehicle(vehicleid)) return SendErrorMessage(playerid, "Bu araca ceset koyamazs�n.");
					if(IsValidRentalCar(vehicleid)) return SendErrorMessage(playerid, "Bu ara� kiral�k oldu�u i�in bu komutu kullanamazs�n.");

					if(CarData[vehicleid][carCorpse] != -1) return SendErrorMessage(playerid, "Bu arac�n bagaj�nda zaten bir ceset var.");

					if(IsValidDynamicObject(CorpseData[cid][corseBodybagObject])) DestroyDynamicObject(CorpseData[cid][corseBodybagObject]);
					if(IsValidDynamicActor(CorpseData[cid][corpseActor])) DestroyDynamicActor(CorpseData[cid][corpseActor]);

					CorpseData[cid][corpseVehicle] = vehicleid;
					CarData[vehicleid][carCorpse] = cid;
					SendMessage(playerid, "{AFAFAF}[ ! ] Yak�n�n�zdaki ceset (%s) yak�n�n�zdaki arac�n bagaj�na yerle�tirildi.", CorpseData[cid][corpseName]);

					return 1;
				} return SendErrorMessage(playerid, "Herhangi bir cesete yak�n de�ilsin.");
		}

		else if(!strcmp(a_string, "g�m", true))
		{
				foreach(new cid : Corpses) if(IsPlayerInRangeOfPoint(playerid, 2.5, CorpseData[cid][corpsePos][0], CorpseData[cid][corpsePos][1], CorpseData[cid][corpsePos][2]) && CorpseData[cid][corpseExists] == true)
				{
					if(GetPVarInt(playerid, "OnPlayerBuringCorpse") == 1)
						return SendErrorMessage(playerid, "Zaten ceset g�m�yorsun.");

					if(CorpseData[cid][corpseVehicle] != -1)
						return SendErrorMessage(playerid, "Herhangi bir cesete yak�n de�ilsin.");

					if(CheckPlayerClothing(playerid, 337) == -1)
						return SendErrorMessage(playerid, "Elinizde k�rek olmal�.");

					if(CorpseData[cid][corpseCoroner] == true)
						return SendErrorMessage(playerid, "Yak�n�n�zda bulunan ceset i�in zaten coroner �a��r�lm��.");

					if(CorpseData[cid][corpseBuring] == true)
						return SendErrorMessage(playerid, "Bu ceset zaten bir ba�kas� taraf�ndan g�m�l�yor.");

					TogglePlayerControllable(playerid, false);
					CorpseData[cid][corpseBuring] = true;
					SetPVarInt(playerid, "OnPlayerBuringCorpse", 1);
					SetPVarInt(playerid, "OnPlayerBuringCorpseTime", 30);
					SetPVarInt(playerid, "OnPlayerBuringCorpseID", cid);
					PlayerData[playerid][pCorpseBurialTimer] = SetTimerEx("OnPlayerBuringCorpse", 1000, true, "ii", playerid, cid);
					AnimOynat(playerid, "BASEBALL", "BAT_4", 4.1, 0, 0, 0, 1, 0, 1);

					SendMessage(playerid, "{AFAFAF}Yak�n�nzda bulunan ceseti (%s) g�mmeye ba�lad�n�z. (iptal etmek i�in /ceset g�miptal)", CorpseData[cid][corpseName]);
					return 1;
				} return SendErrorMessage(playerid, "Herhangi bir cesete yak�n de�ilsin.");
		}

		else if(!strcmp(a_string, "g�miptal", true))
		{
			if(GetPVarInt(playerid, "OnPlayerBuringCorpse") == 1)
			{
				SetPVarInt(playerid, "OnPlayerBuringCorpse", 0);
				CorpseData[GetPVarInt(playerid, "OnPlayerBuringCorpseID")][corpseBuring] = false;
				KillTimer(PlayerData[playerid][pCorpseBurialTimer]);
				TogglePlayerControllable(playerid, true);
				ClearAnimations(playerid);
				SendMessage(playerid, "{AFAFAF}Ceset g�m�lmesi iptal edildi.");
				return 1;
			}
			else SendErrorMessage(playerid, "Bir ceset g�mm�yorsun.");
		}

		else if(!strcmp(b_string, "aractanal", true))
		{
				new vehicleid = GetNearestVehicle(playerid);
				if(vehicleid == INVALID_VEHICLE_ID)
					return SendErrorMessage(playerid, "Bir araca yak�n de�ilsin.");

					new
							Float:x,
							Float:y,
							Float:z;
				GetVehicleBoot(vehicleid, x, y, z);
				if(!IsPlayerInRangeOfPoint(playerid, 2.5, x, y, z)) return SendServerMessage(playerid, "Arac�n bagaj�na yak�n de�ilsin.");

				new engine, lights, alarm, doors, bonnet, boot, objective;
				GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
				if(!boot)
					return SendErrorMessage(playerid, "Bu arac�n bagaj� kapal�.");

				if(CarData[vehicleid][carCorpse] == -1) return SendErrorMessage(playerid, "Bu arac�n bagaj�nda ceset yok.");

				new cid = CarData[vehicleid][carCorpse];
				GetPlayerPos(playerid, CorpseData[cid][corpsePos][0], CorpseData[cid][corpsePos][1], CorpseData[cid][corpsePos][2]);
				if(CorpseData[cid][corpseBodybag] == true)
				{
					CorpseData[cid][corseBodybagObject] = CreateDynamicObject(19944, CorpseData[cid][corpsePos][0]+0.3, CorpseData[cid][corpsePos][1], CorpseData[cid][corpsePos][2], 0.0, 0.0, 0.0, -1, -1, -1);
					EditingID[playerid] = cid;
					EditingObject[playerid] = 23;
					EditDynamicObject(playerid, CorpseData[EditingID[playerid]][corseBodybagObject]);
				}
				else
				{
					CorpseData[cid][corpseActor] = CreateDynamicActor(CorpseData[cid][corpseSkin], CorpseData[cid][corpsePos][0]+0.3, CorpseData[cid][corpsePos][1], CorpseData[cid][corpsePos][2], CorpseData[cid][corpsePos][3], true, 100.0, 0, 0, -1);
					ApplyDynamicActorAnimation(CorpseData[cid][corpseActor], "WUZI", "CS_Dead_Guy", 4.1, 0, 1, 1, 1, 0);
				}
				CorpseData[cid][corpseVehicle] = -1;
				CarData[vehicleid][carCorpse] = -1;
				SendMessage(playerid, "{AFAFAF}[ ! ] Ara� i�erisindeki ceset (%s) bagajdan ��kart�ld�.", CorpseData[cid][corpseName]);
				return 1;
		}
		return 1;
}

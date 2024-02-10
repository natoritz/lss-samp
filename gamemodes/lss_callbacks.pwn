Server:LoadFurnitures()
{
	mysql_tquery(m_Handle, "SELECT * FROM properties", "SQL_LoadProperties");
	mysql_tquery(m_Handle, "SELECT * FROM furnitures", "SQL_LoadFurnitures");
	return 1;
}

Server:SQL_LoadTruckers()
{
	if(!cache_num_rows()) return print("SERVER: Hiç trucker noktasý yüklenmedi.");

	for (new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_TRUCK_CARGO)
	{
		Iter_Add(Trucker, i);

		cache_get_value_name_int(i, "id", TruckerData[i][tID]);
		cache_get_value_name_int(i, "type", TruckerData[i][tType]);
		cache_get_value_name(i, "name", TruckerData[i][tName], 64);

		cache_get_value_name_int(i, "storage", TruckerData[i][tStorage]);
		cache_get_value_name_int(i, "storage_size", TruckerData[i][tStorageSize]);
		cache_get_value_name_int(i, "price", TruckerData[i][tPrice]);
		cache_get_value_name_int(i, "product_id", TruckerData[i][tProductID]);
		cache_get_value_name_int(i, "product_amount", TruckerData[i][tProductAmount]);
		cache_get_value_name_int(i, "pack", TruckerData[i][tPack]);
		cache_get_value_name_int(i, "gps", TruckerData[i][tGps]);
		cache_get_value_name_int(i, "locked", TruckerData[i][tLocked]);

		cache_get_value_name_float(i, "x", TruckerData[i][tPosX]);
		cache_get_value_name_float(i, "y", TruckerData[i][tPosY]);
		cache_get_value_name_float(i, "z", TruckerData[i][tPosZ]);

		Industry_Refresh(i);
	}

	printf("SERVER: %i adet trucker noktasý yüklendi.", cache_num_rows());
	return 1;
}

Server:SQL_LoadProperties()
{
	if(!cache_num_rows()) return print("SERVER: Hiç ev yüklenmedi.");

	for (new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_PROPERTY)
	{
		Iter_Add(Properties, i);

		cache_get_value_name_int(i, "id", PropertyData[i][PropertyID]);
		cache_get_value_name_int(i, "OwnerSQL", PropertyData[i][PropertyOwnerID]);
		cache_get_value_name_int(i, "Type", PropertyData[i][PropertyType]);
		cache_get_value_name_int(i, "ComplexID", PropertyData[i][PropertyComplexLink]);
		cache_get_value_name_int(i, "Faction", PropertyData[i][PropertyFaction]);

		cache_get_value_name_int(i, "Level", PropertyData[i][PropertyLevel]);
		cache_get_value_name_int(i, "Money", PropertyData[i][PropertyMoney]);

		cache_get_value_name_float(i, "ExteriorX", PropertyData[i][PropertyEnter][0]);
		cache_get_value_name_float(i, "ExteriorY", PropertyData[i][PropertyEnter][1]);
		cache_get_value_name_float(i, "ExteriorZ", PropertyData[i][PropertyEnter][2]);
		cache_get_value_name_float(i, "ExteriorA", PropertyData[i][PropertyEnter][3]);
		cache_get_value_name_int(i, "ExteriorID", PropertyData[i][PropertyEnterInterior]);
		cache_get_value_name_int(i, "ExteriorWorld", PropertyData[i][PropertyEnterWorld]);

		cache_get_value_name_float(i, "InteriorX", PropertyData[i][PropertyExit][0]);
		cache_get_value_name_float(i, "InteriorY", PropertyData[i][PropertyExit][1]);
		cache_get_value_name_float(i, "InteriorZ", PropertyData[i][PropertyExit][2]);
		cache_get_value_name_float(i, "InteriorA", PropertyData[i][PropertyExit][3]);
		cache_get_value_name_int(i, "InteriorID", PropertyData[i][PropertyExitInterior]);
		cache_get_value_name_int(i, "InteriorWorld", PropertyData[i][PropertyExitWorld]);

		cache_get_value_name_float(i, "CheckPosX", PropertyData[i][PropertyCheck][0]);
		cache_get_value_name_float(i, "CheckPosY", PropertyData[i][PropertyCheck][1]);
		cache_get_value_name_float(i, "CheckPosZ", PropertyData[i][PropertyCheck][2]);
		cache_get_value_name_int(i, "CheckID", PropertyData[i][PropertyCheckInterior]);
		cache_get_value_name_int(i, "CheckWorld", PropertyData[i][PropertyCheckWorld]);

		cache_get_value_name_int(i, "MarketPrice", PropertyData[i][PropertyMarketPrice]);
		cache_get_value_name_int(i, "RentPrice", PropertyData[i][PropertyRentPrice]);
		cache_get_value_name_int(i, "Rentable", bool:PropertyData[i][PropertyRentable]);
		cache_get_value_name_int(i, "Locked", bool:PropertyData[i][PropertyLocked]);
		cache_get_value_name_int(i, "HasXMR", bool:PropertyData[i][PropertyHasXMR]);

		cache_get_value_name_int(i, "BareSwitch", PropertyData[i][PropertySwitchID]);
		cache_get_value_name_int(i, "BareType", bool:PropertyData[i][PropertySwitch]);

		cache_get_value_name_int(i, "Time", PropertyData[i][PropertyTime]);
		cache_get_value_name_int(i, "Lights", bool:PropertyData[i][PropertyLights]);

		cache_get_value_name_float(i, "XMRPosX", PropertyData[i][PropertyXMR][0]);
		cache_get_value_name_float(i, "XMRPosY", PropertyData[i][PropertyXMR][1]);
		cache_get_value_name_float(i, "XMRPosZ", PropertyData[i][PropertyXMR][2]);
		cache_get_value_name_float(i, "XMRRotX", PropertyData[i][PropertyXMR][3]);
		cache_get_value_name_float(i, "XMRRotY", PropertyData[i][PropertyXMR][4]);
		cache_get_value_name_float(i, "XMRRotZ", PropertyData[i][PropertyXMR][5]);

		//new property_query[75];
       	//mysql_format(m_Handle, property_query, sizeof(property_query), "SELECT * FROM furnitures WHERE propertyid = %i", i);
		//mysql_tquery(m_Handle, property_query, "OnFurnituresLoad", "ii", i, 1);

		new property_query[75];
		mysql_format(m_Handle, property_query, sizeof(property_query), "SELECT * FROM property_drugs WHERE property_id = %i", i);
		mysql_tquery(m_Handle, property_query, "SQL_LoadPropertyDrugs", "i", i);

		mysql_format(m_Handle, property_query, sizeof(property_query), "SELECT * FROM property_weapons WHERE property_id = %i", i);
		mysql_tquery(m_Handle, property_query, "SQL_LoadPropertyWeaps", "i", i);

		PropertyData[i][PropertyExitWorld] = 100+PropertyData[i][PropertyID];

		Property_Refresh(i);
	}

	printf("SERVER: %i adet ev yüklendi.", cache_num_rows());
	return 1;
}

Server:SQL_LoadPropertyDrugs(id)
{
	if(!cache_num_rows()) return 1;

  	for (new i = 0, j = 1; i < cache_num_rows(); i++, j++) if (j < MAX_PACK_SLOT)
    {
		property_drug_data[id][j][is_exist] = true;
	    cache_get_value_name_int(i, "id", property_drug_data[id][j][data_id]);
	   	cache_get_value_name_int(i, "property_id", property_drug_data[id][j][property_id]);
	    cache_get_value_name_int(i, "drug_type", property_drug_data[id][j][prop_drug_id]);
	    cache_get_value_name(i, "drug_name", property_drug_data[id][j][prop_drug_name], 64);
	    cache_get_value_name_float(i, "drug_amount", property_drug_data[id][j][prop_drug_amount]);
	    cache_get_value_name_int(i, "drug_quality", property_drug_data[id][j][prop_drug_quality]);
	    cache_get_value_name_int(i, "drug_size", property_drug_data[id][j][prop_drug_size]);
	}
	return 1;
}

Server:SQL_LoadPropertyWeaps(prop_id)
{
	if(!cache_num_rows()) return 1;

	for (new i = 0, j = 1; i < cache_num_rows(); i++, j++) if (j < MAX_PACK_SLOT)
	{
		property_weap_data[prop_id][j][is_exist] = true;
	    cache_get_value_name_int(i, "id", property_weap_data[prop_id][j][data_id]);
	    cache_get_value_name_int(i, "weapon", property_weap_data[prop_id][j][prop_wep]);
		cache_get_value_name_int(i, "ammo", property_weap_data[prop_id][j][prop_ammo]);
		cache_get_value_name_int(i, "property_id", property_weap_data[prop_id][j][property_id]);
	}
	return 1;
}

Server:SQL_LoadFurnitures()
{
	if(!cache_num_rows()) return print("SERVER: Hiç mobilya yüklenmedi.");

	new id, vw, interior, data[e_furniture], txt[12];

	for (new i = 0, j = cache_num_rows(); i < j; i ++)
	{
		cache_get_value_name_int(i, "id", data[SQLID]);
		cache_get_value_name_int(i, "PropertyID", data[PropertyID]);
		cache_get_value_name_int(i, "BusinessID", data[BusinessID]);
		cache_get_value_name_int(i, "CategoryID", data[ArrayID]);
		cache_get_value_name_int(i, "SubCategoryID", data[SubArrayID]);
		cache_get_value_name_int(i, "FurnitureID", data[ObjectID]);
		cache_get_value_name_int(i, "FurniturePrice", data[furniturePrice]);
		cache_get_value_name(i, "FurnitureName", data[furnitureName], 64);
      	cache_get_value_name_float(i, "FurnitureX", data[furnitureX]);
       	cache_get_value_name_float(i, "FurnitureY", data[furnitureY]);
        cache_get_value_name_float(i, "FurnitureZ", data[furnitureZ]);
        cache_get_value_name_float(i, "FurnitureRX", data[furnitureRX]);
        cache_get_value_name_float(i, "FurnitureRY", data[furnitureRY]);
        cache_get_value_name_float(i, "FurnitureRZ", data[furnitureRZ]);
        cache_get_value_name_int(i, "FurnitureVW", vw);
        cache_get_value_name_int(i, "FurnitureInt", interior);

		data[TempObjectID] = CreateDynamicObject(
				data[ObjectID],
				data[furnitureX], data[furnitureY], data[furnitureZ],
          		data[furnitureRX], data[furnitureRY], data[furnitureRZ],
				vw, interior
			);

		if(IsHouseDoor(data[ObjectID])) data[furnitureLocked] = true, data[furnitureOpened] = false;

		for(new t; t < 5; t++)
		{
			format(txt, sizeof(txt), "Texture_%i", t+1);
			cache_get_value_name_int(i, txt, data[furnitureTexture][t]);

			if(data[furnitureTexture][t] == -1)
		        continue;

			id = data[furnitureTexture][t];
			SetDynamicObjectMaterial(data[TempObjectID], t, ObjectTextures[id][TModel], ObjectTextures[id][TXDName], ObjectTextures[id][TextureName], ObjectTextures[id][MaterialColor]);
		}

		Streamer_SetArrayData(STREAMER_TYPE_OBJECT, data[TempObjectID], E_STREAMER_EXTRA_ID, data);
	}
	return 1;
}

Server:SQL_LoadFactions()
{
	if(!cache_num_rows()) return print("SERVER: Hiç birlik yüklenmedi.");

	for (new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_FACTIONS)
	{
	    Iter_Add(Factions, i);
		cache_get_value_name_int(i, "id", FactionData[i][FactionID]);
		cache_get_value_name(i, "Name", FactionData[i][FactionName], 128);
		cache_get_value_name(i, "Abbreviation", FactionData[i][FactionAbbrev], 128);

		cache_get_value_name_int(i, "MaxRanks", FactionData[i][FactionMaxRanks]);
		cache_get_value_name_int(i, "EditRank", FactionData[i][FactionEditrank]);
		cache_get_value_name_int(i, "ChatRank", FactionData[i][FactionChatrank]);
		cache_get_value_name_int(i, "TowRank", FactionData[i][FactionTowrank]);

		cache_get_value_name_int(i, "ChatColor", FactionData[i][FactionChatColor]);
		cache_get_value_name_int(i, "ChatStatus", FactionData[i][FactionChatStatus]);
		cache_get_value_name_int(i, "CopPerms", FactionData[i][FactionCopPerms]);
		cache_get_value_name_int(i, "MedPerms", FactionData[i][FactionMedPerms]);
		cache_get_value_name_int(i, "SanPerms", FactionData[i][FactionSanPerms]);

		cache_get_value_name_float(i, "SpawnX", FactionData[i][FactionSpawn][0]);
		cache_get_value_name_float(i, "SpawnY", FactionData[i][FactionSpawn][1]);
		cache_get_value_name_float(i, "SpawnZ", FactionData[i][FactionSpawn][2]);
		cache_get_value_name_float(i, "SpawnA", FactionData[i][FactionSpawn][3]);
		cache_get_value_name_int(i, "SpawnInt", FactionData[i][FactionSpawnInterior]);
		cache_get_value_name_int(i, "SpawnWorld", FactionData[i][FactionSpawnVW]);

		cache_get_value_name_float(i, "ExSpawn1X", FactionData[i][FactionSpawnEx1][0]);
		cache_get_value_name_float(i, "ExSpawn1Y", FactionData[i][FactionSpawnEx1][1]);
		cache_get_value_name_float(i, "ExSpawn1Z", FactionData[i][FactionSpawnEx1][2]);
		cache_get_value_name_int(i, "ExSpawn1Int", FactionData[i][FactionSpawnEx1Interior]);
		cache_get_value_name_int(i, "ExSpawn1World", FactionData[i][FactionSpawnEx1VW]);

		cache_get_value_name_float(i, "ExSpawn2X", FactionData[i][FactionSpawnEx2][0]);
		cache_get_value_name_float(i, "ExSpawn2Y", FactionData[i][FactionSpawnEx2][1]);
		cache_get_value_name_float(i, "ExSpawn2Z", FactionData[i][FactionSpawnEx2][2]);
		cache_get_value_name_int(i, "ExSpawn2Int", FactionData[i][FactionSpawnEx2Interior]);
		cache_get_value_name_int(i, "ExSpawn2World", FactionData[i][FactionSpawnEx2VW]);

		cache_get_value_name_float(i, "ExSpawn3X", FactionData[i][FactionSpawnEx3][0]);
		cache_get_value_name_float(i, "ExSpawn3Y", FactionData[i][FactionSpawnEx3][1]);
		cache_get_value_name_float(i, "ExSpawn3Z", FactionData[i][FactionSpawnEx3][2]);
		cache_get_value_name_int(i, "ExSpawn3Int", FactionData[i][FactionSpawnEx3Interior]);
		cache_get_value_name_int(i, "ExSpawn3World", FactionData[i][FactionSpawnEx3VW]);

		cache_get_value_name_int(i, "Bank", FactionData[i][FactionBank]);

		new faction_query[64];
		mysql_format(m_Handle, faction_query, sizeof(faction_query), "SELECT * FROM faction_ranks WHERE faction_id = %i", FactionData[i][FactionID]);
		mysql_tquery(m_Handle, faction_query, "SQL_LoadFactionRanks", "i", i);
	}

	printf("SERVER: %i adet birlik yüklendi.", cache_num_rows());
	return 1;
}

Server:SQL_LoadFactionRanks(id)
{
	if(!cache_num_rows()) return 1;

	new str[25];
	for (new i = 0; i < cache_num_rows(); i++)
	{
		for (new j = 1; j < MAX_FACTION_RANKS; j++)
		{
			format(str, sizeof(str), "factionrank%i", j);
			cache_get_value_name(i, str, FactionRanks[id][j], 60);

			format(str, sizeof(str), "factionranksalary%i", j);
			cache_get_value_name_int(i, str, FactionRanksSalary[id][j]);
		}
	}
	return 1;
}

Server:SQL_LoadTolls()
{
	if(!cache_num_rows()) return print("SERVER: Hiç giþe yüklenmedi.");

	for (new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_TOLLS)
	{
		Iter_Add(Tolls, i);

		cache_get_value_name_int(i, "id", TollData[i][TollID]);
		cache_get_value_name(i, "TollName", TollData[i][TollName], 25);
		cache_get_value_name_int(i, "TollModel", TollData[i][TollModel]);
		cache_get_value_name_int(i, "TollPrice", TollData[i][TollPrice]);

		cache_get_value_name_float(i, "PosX", TollData[i][TollPos][0]);
		cache_get_value_name_float(i, "PosY", TollData[i][TollPos][1]);
		cache_get_value_name_float(i, "PosZ", TollData[i][TollPos][2]);
		cache_get_value_name_float(i, "RotX", TollData[i][TollPos][3]);
		cache_get_value_name_float(i, "RotY", TollData[i][TollPos][4]);
		cache_get_value_name_float(i, "RotZ", TollData[i][TollPos][5]);

		cache_get_value_name_int(i, "TollInterior", TollData[i][TollInterior]);
		cache_get_value_name_int(i, "TollWorld", TollData[i][TollWorld]);

		cache_get_value_name_float(i, "OpenX", TollData[i][TollMovePos][0]);
		cache_get_value_name_float(i, "OpenY", TollData[i][TollMovePos][1]);
		cache_get_value_name_float(i, "OpenZ", TollData[i][TollMovePos][2]);
		cache_get_value_name_float(i, "OpenRotX", TollData[i][TollMovePos][3]);
		cache_get_value_name_float(i, "OpenRotY", TollData[i][TollMovePos][4]);
		cache_get_value_name_float(i, "OpenRotZ", TollData[i][TollMovePos][5]);

		Toll_Refresh(i);
	}

	printf("SERVER: %i adet giþe yüklendi.", cache_num_rows());
	return 1;
}

Server:SQL_LoadCameras()
{
	if(!cache_num_rows()) return print("SERVER: Hiç CCTV yüklenmedi.");

    for (new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_CCTVS)
    {
    	Iter_Add(Cameras, i);

        cache_get_value_name_int(i, "id", CameraData[i][CameraID]);
        cache_get_value_name(i, "CameraName", CameraData[i][CameraName], 30);

        cache_get_value_name_float(i, "CameraX", CameraData[i][CameraLocation][0]);
        cache_get_value_name_float(i, "CameraY", CameraData[i][CameraLocation][1]);
        cache_get_value_name_float(i, "CameraZ", CameraData[i][CameraLocation][2]);

        cache_get_value_name_float(i, "CameraRX", CameraData[i][CameraLocation][3]);
        cache_get_value_name_float(i, "CameraRY", CameraData[i][CameraLocation][4]);
        cache_get_value_name_float(i, "CameraRZ", CameraData[i][CameraLocation][5]);

        cache_get_value_name_int(i, "CameraInterior", CameraData[i][CameraInterior]);
        cache_get_value_name_int(i, "CameraWorld", CameraData[i][CameraWorld]);

        Camera_Refresh(i);
    }

	printf("SERVER: %i adet CCTV yüklendi.", cache_num_rows());
	return 1;
}

Server:SQL_LoadBusinesses()
{
	if(!cache_num_rows()) return print("SERVER: Hiç iþyeri yüklenmedi.");

	for (new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_BUSINESS)
	{
		Iter_Add(Businesses, i);

		cache_get_value_name_int(i, "id", BusinessData[i][BusinessID]);
		cache_get_value_name_int(i, "BusinessOwner", BusinessData[i][BusinessOwnerSQLID]);
		cache_get_value_name(i, "BusinessName", BusinessData[i][BusinessName], 128);
		cache_get_value_name(i, "BusinessMOTD", BusinessData[i][BusinessMOTD], 128);
		cache_get_value_name_int(i, "BusinessPrice", BusinessData[i][BusinessPrice]);
		cache_get_value_name_int(i, "BusinessType", BusinessData[i][BusinessType]);
		cache_get_value_name_int(i, "BusinessRType", BusinessData[i][BusinessRestaurantType]);

		cache_get_value_name_float(i, "EnterX", BusinessData[i][EnterPos][0]);
		cache_get_value_name_float(i, "EnterY", BusinessData[i][EnterPos][1]);
		cache_get_value_name_float(i, "EnterZ", BusinessData[i][EnterPos][2]);
		cache_get_value_name_float(i, "EnterA", BusinessData[i][EnterPos][3]);
		cache_get_value_name_int(i, "EnterInterior", BusinessData[i][EnterInterior]);
		cache_get_value_name_int(i, "EnterWorld", BusinessData[i][EnterWorld]);

		cache_get_value_name_float(i, "ExitX", BusinessData[i][ExitPos][0]);
		cache_get_value_name_float(i, "ExitY", BusinessData[i][ExitPos][1]);
		cache_get_value_name_float(i, "ExitZ", BusinessData[i][ExitPos][2]);
		cache_get_value_name_float(i, "ExitA", BusinessData[i][ExitPos][3]);
		cache_get_value_name_int(i, "ExitInterior", BusinessData[i][ExitInterior]);
		cache_get_value_name_int(i, "ExitWorld", BusinessData[i][ExitWorld]);

		cache_get_value_name_float(i, "BankX", BusinessData[i][BankPos][0]);
		cache_get_value_name_float(i, "BankY", BusinessData[i][BankPos][1]);
		cache_get_value_name_float(i, "BankZ", BusinessData[i][BankPos][2]);
		cache_get_value_name_int(i, "BankInterior", BusinessData[i][BankInterior]);
		cache_get_value_name_int(i, "BankWorld", BusinessData[i][BankWorld]);

		cache_get_value_name_int(i, "BusinessLocked", bool:BusinessData[i][BusinessLocked]);
		cache_get_value_name_int(i, "BusinessHasXMR", bool:BusinessData[i][BusinessHasXMR]);

		cache_get_value_name_int(i, "BusinessCashbox", BusinessData[i][BusinessCashbox]);
		cache_get_value_name_int(i, "BusinessFee", BusinessData[i][BusinessFee]);

		cache_get_value_name_int(i, "Time", BusinessData[i][BusinessTime]);
		cache_get_value_name_int(i, "Lights", bool:BusinessData[i][BusinessLights]);

		cache_get_value_name_int(i, "BusinessProduct", BusinessData[i][BusinessProduct]);
		cache_get_value_name_int(i, "BusinessWantedProduct", BusinessData[i][BusinessWantedProduct]);
		cache_get_value_name_int(i, "BusinessProductPrice", BusinessData[i][BusinessProductPrice]);

		cache_get_value_name_int(i, "Food1", BusinessData[i][BusinessFood][0]);
		cache_get_value_name_int(i, "Food2", BusinessData[i][BusinessFood][1]);
		cache_get_value_name_int(i, "Food3", BusinessData[i][BusinessFood][2]);

		cache_get_value_name_int(i, "Price1", BusinessData[i][BusinessFoodPrice][0]);
		cache_get_value_name_int(i, "Price2", BusinessData[i][BusinessFoodPrice][1]);
		cache_get_value_name_int(i, "Price3", BusinessData[i][BusinessFoodPrice][2]);

		BusinessData[i][ExitWorld] = 10000+BusinessData[i][BusinessID];
		Business_Refresh(i);
	}

	printf("SERVER: %i adet iþyeri yüklendi.", cache_num_rows());
	return 1;
}

Server:SQL_LoadDealershipCats()
{
	if(!cache_num_rows()) return print("SERVER: Hiç araç kategorisi yüklenmedi.");

	for (new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_DEALERSHIP_CAT)
	{
		Iter_Add(DealershipCats, i);
		cache_get_value_name_int(i, "id", DealershipCatData[i][CategoryID]);
		cache_get_value_name(i, "CategoryName", DealershipCatData[i][CategoryModelName], 25);
		cache_get_value_name_int(i, "CategoryModel", DealershipCatData[i][CategoryModel]);
	}

	printf("SERVER: %i adet araç kategorisi yüklendi.", cache_num_rows());
	return 1;
}

Server:SQL_LoadDealerships()
{
	if(!cache_num_rows()) return print("SERVER: Hiç araç bilgisi yüklenmedi.");

	for (new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_DEALERSHIPS)
	{
		Iter_Add(Dealerships, i);
		cache_get_value_name_int(i, "id", DealershipData[i][DealershipID]);
		cache_get_value_name_int(i, "VehicleCategory", DealershipData[i][DealershipCategory]);
		cache_get_value_name(i, "VehicleName", DealershipData[i][DealershipModelName], 45);
		cache_get_value_name_int(i, "VehicleModel", DealershipData[i][DealershipModel]);
		cache_get_value_name_int(i, "VehiclePrice", DealershipData[i][DealershipPrice]);
		cache_get_value_name_int(i, "VehicleEnabled", DealershipData[i][DealershipIsEnabled]);
	}

	printf("SERVER: %i adet araç bilgisi yüklendi.", cache_num_rows());
	return 1;
}

Server:SQL_LoadStreets()
{
	if(!cache_num_rows()) return print("SERVER: Hiç sokak yüklenmedi.");

	for (new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_STREETS)
	{
		cache_get_value_name_int(i, "id", StreetData[i][StreetID]);
		cache_get_value_name(i, "StreetName", StreetData[i][StreetName], 35);
		cache_get_value_name_int(i, "StreetX", StreetData[i][StreetX]);
		cache_get_value_name_int(i, "StreetY", StreetData[i][StreetY]);
		cache_get_value_name_int(i, "MaxPoints", StreetData[i][MaxPoints]);

		new query[74];
		mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM street_pos WHERE StreetID = %i", StreetData[i][StreetID]);
		mysql_tquery(m_Handle, query, "SQL_LoadStreetPos", "i", i);
	}

	printf("SERVER: %i adet sokak yüklendi.", cache_num_rows());
	return 1;
}

Server:SQL_LoadStreetPos(id)
{
	if(!cache_num_rows()) return 1;

	new Float: position[200] = {};

	for (new i = 0, x = 0, j = cache_num_rows(); i < j; i++, x += 2)
	{
	    cache_get_value_name_float(i, "StreetX", position[x]);
	    cache_get_value_name_float(i, "StreetY", position[x + 1]);
	}

	StreetData[id][StreetAreaID] = CreateDynamicPolygon(position, .maxpoints = StreetData[id][MaxPoints]);
	Iter_Add(Streets, id);
	return 1;
}

Server:SQL_LoadAntennas()
{
	if(!cache_num_rows()) return print("SERVER: Hiç anten noktasý yüklenmedi.");

	for (new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_ANTENNAS)
	{
		Iter_Add(Antennas, i);

		cache_get_value_name_int(i, "id", AntennaData[i][AntennaID]);
		cache_get_value_name_float(i, "pos_x", AntennaData[i][AntennaLocation][0]);
		cache_get_value_name_float(i, "pos_y", AntennaData[i][AntennaLocation][1]);
		cache_get_value_name_float(i, "pos_z", AntennaData[i][AntennaLocation][2]);
		cache_get_value_name_float(i, "pos_rx", AntennaData[i][AntennaLocation][3]);
		cache_get_value_name_float(i, "pos_ry", AntennaData[i][AntennaLocation][4]);
		cache_get_value_name_float(i, "pos_rz", AntennaData[i][AntennaLocation][5]);

		AntennaData[i][AntennaObject] = CreateDynamicObject(3763, AntennaData[i][AntennaLocation][0], AntennaData[i][AntennaLocation][1], AntennaData[i][AntennaLocation][2], AntennaData[i][AntennaLocation][3], AntennaData[i][AntennaLocation][4], AntennaData[i][AntennaLocation][5]);
	}
	return 1;
}

Server:SQL_LoadEntrances()
{
	if(!cache_num_rows()) return print("SERVER: Hiç bina yüklenmedi.");

	for (new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_ENTRANCES)
	{
	    Iter_Add(Entrances, i);

	    cache_get_value_name_int(i, "id", EntranceData[i][EntranceID]);
	    cache_get_value_name(i, "EntranceName", EntranceData[i][EntranceName], 32);

		cache_get_value_name_float(i, "EnterX", EntranceData[i][EntrancePos][0]);
		cache_get_value_name_float(i, "EnterY", EntranceData[i][EntrancePos][1]);
		cache_get_value_name_float(i, "EnterZ", EntranceData[i][EntrancePos][2]);
		cache_get_value_name_float(i, "EnterA", EntranceData[i][EntrancePos][3]);

		cache_get_value_name_int(i, "EnterInterior", EntranceData[i][EntranceInteriorID]);
		cache_get_value_name_int(i, "EnterWorld", EntranceData[i][EntranceWorld]);

		cache_get_value_name_float(i, "ExitX", EntranceData[i][EntranceInt][0]);
		cache_get_value_name_float(i, "ExitY", EntranceData[i][EntranceInt][1]);
		cache_get_value_name_float(i, "ExitZ", EntranceData[i][EntranceInt][2]);
		cache_get_value_name_float(i, "ExitA", EntranceData[i][EntranceInt][3]);

		cache_get_value_name_int(i, "ExitInterior", EntranceData[i][ExitInteriorID]);
		cache_get_value_name_int(i, "ExitWorld", EntranceData[i][ExitWorld]);

        cache_get_value_name_int(i, "EntranceIcon", EntranceData[i][EntranceIcon]);
        cache_get_value_name_int(i, "EntranceFaction", EntranceData[i][EntranceFaction]);
        cache_get_value_name_int(i, "EntranceLocked", bool:EntranceData[i][EntranceLocked]);

		Entrance_Refresh(i);
	}

	printf("SERVER: %i adet bina yüklendi.", cache_num_rows());
	return 1;
}

Server:SQL_LoadBillboards()
{
	if(!cache_num_rows()) return print("SERVER: Hiç billboard noktasý yüklenmedi.");

	for (new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_BILLBOARDS)
	{
	    Iter_Add(Billboards, i);

		cache_get_value_name_int(i, "id", BillboardData[i][BillboardID]);
		cache_get_value_name_int(i, "BillboardModel", BillboardData[i][BillboardModel]);
		cache_get_value_name(i, "BillboardText", BillboardData[i][BillboardText], 128);

		cache_get_value_name_float(i, "BillboardX", BillboardData[i][BillboardLocation][0]);
        cache_get_value_name_float(i, "BillboardY", BillboardData[i][BillboardLocation][1]);
        cache_get_value_name_float(i, "BillboardZ", BillboardData[i][BillboardLocation][2]);
        cache_get_value_name_float(i, "BillboardRX", BillboardData[i][BillboardLocation][3]);
        cache_get_value_name_float(i, "BillboardRY", BillboardData[i][BillboardLocation][4]);
        cache_get_value_name_float(i, "BillboardRZ", BillboardData[i][BillboardLocation][5]);
        cache_get_value_name_int(i, "BillboardInterior", BillboardData[i][BillboardInterior]);
        cache_get_value_name_int(i, "BillboardWorld", BillboardData[i][BillboardWorld]);

        cache_get_value_name_int(i, "BillboardRentedBy", BillboardData[i][BillboardRentedBy]);
        cache_get_value_name_int(i, "BillboardRentExpiresAt", BillboardData[i][BillboardRentExpiresAt]);

		Billboard_Refresh(i);
	}
	printf("SERVER: %i adet billboard noktasý yüklendi.", cache_num_rows());
	return 1;
}

Server:SQL_LoadTags()
{
	if(!cache_num_rows()) return print("SERVER: Hiç graffiti noktasý yüklenmedi.");

	for (new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_SPRAYS)
	{
	    Iter_Add(Tags, i);

		cache_get_value_name_int(i, "id", SprayData[i][SprayID]);
		cache_get_value_name_int(i, "SprayModel", SprayData[i][SprayModel]);

		cache_get_value_name_float(i, "SprayX", SprayData[i][SprayLocation][0]);
        cache_get_value_name_float(i, "SprayY", SprayData[i][SprayLocation][1]);
        cache_get_value_name_float(i, "SprayZ", SprayData[i][SprayLocation][2]);
        cache_get_value_name_float(i, "SprayRX", SprayData[i][SprayLocation][3]);
        cache_get_value_name_float(i, "SprayRY", SprayData[i][SprayLocation][4]);
        cache_get_value_name_float(i, "SprayRZ", SprayData[i][SprayLocation][5]);
        cache_get_value_name_int(i, "SprayInterior", SprayData[i][SprayInterior]);
        cache_get_value_name_int(i, "SprayWorld", SprayData[i][SprayWorld]);

		Spray_Refresh(i);
	}
	printf("SERVER: %i adet graffiti noktasý yüklendi.", cache_num_rows());
	return 1;
}

Server:SQL_LoadObjects()
{
	if(!cache_num_rows()) return print("SERVER: Hiç sunucu objesi yüklenmedi.");

	for (new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_SERVER_OBJECTS)
	{
		Iter_Add(Objects, i);

	   	cache_get_value_name_int(i, "id", ObjectData[i][ObjectID]);
	   	cache_get_value_name_int(i, "ObjectModel", ObjectData[i][ObjectModel]);

	    cache_get_value_name_float(i, "ObjectX", ObjectData[i][ObjectPos][0]);
	    cache_get_value_name_float(i, "ObjectY", ObjectData[i][ObjectPos][1]);
	    cache_get_value_name_float(i, "ObjectZ", ObjectData[i][ObjectPos][2]);

	    cache_get_value_name_float(i, "ObjectRX", ObjectData[i][ObjectPos][3]);
	    cache_get_value_name_float(i, "ObjectRY", ObjectData[i][ObjectPos][4]);
	    cache_get_value_name_float(i, "ObjectRZ", ObjectData[i][ObjectPos][5]);

	    cache_get_value_name_int(i, "ObjectInterior", ObjectData[i][ObjectInterior]);
	    cache_get_value_name_int(i, "ObjectWorld", ObjectData[i][ObjectWorld]);

	    Object_Refresh(i);
	}

	printf("SERVER: %i adet sunucu objesi yüklendi.", cache_num_rows());
	return 1;
}

Server:SQL_LoadGates()
{
	if(!cache_num_rows()) return print("SERVER: Hiç hareketli kapý yüklenmedi.");

	for (new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_GATES)
	{
	    Iter_Add(Gates, i);

		cache_get_value_name_int(i, "id", GateData[i][GateID]);
		cache_get_value_name_int(i, "GateModel", GateData[i][GateModel]);
		cache_get_value_name_float(i, "GateSpeed", GateData[i][GateSpeed]);
		cache_get_value_name_float(i, "GateRadius", GateData[i][GateRadius]);
		cache_get_value_name_int(i, "GateTime", GateData[i][GateTime]);

		cache_get_value_name_float(i, "PosX", GateData[i][GatePos][0]);
		cache_get_value_name_float(i, "PosY", GateData[i][GatePos][1]);
		cache_get_value_name_float(i, "PosZ", GateData[i][GatePos][2]);
		cache_get_value_name_float(i, "RotX", GateData[i][GatePos][3]);
		cache_get_value_name_float(i, "RotY", GateData[i][GatePos][4]);
		cache_get_value_name_float(i, "RotZ", GateData[i][GatePos][5]);

		cache_get_value_name_int(i, "GateInterior", GateData[i][GateInterior]);
		cache_get_value_name_int(i, "GateWorld", GateData[i][GateWorld]);

		cache_get_value_name_float(i, "OpenX", GateData[i][GateMovePos][0]);
		cache_get_value_name_float(i, "OpenY", GateData[i][GateMovePos][1]);
		cache_get_value_name_float(i, "OpenZ", GateData[i][GateMovePos][2]);
		cache_get_value_name_float(i, "OpenRotX", GateData[i][GateMovePos][3]);
		cache_get_value_name_float(i, "OpenRotY", GateData[i][GateMovePos][4]);
		cache_get_value_name_float(i, "OpenRotZ", GateData[i][GateMovePos][5]);

  		cache_get_value_name_int(i, "GateFaction", GateData[i][GateFaction]);
        cache_get_value_name_int(i, "GateLinkID", GateData[i][GateLinkID]);

	 	cache_get_value_name_int(i, "TIndex", GateData[i][GateTIndex]);
  		cache_get_value_name_int(i, "TModel", GateData[i][GateTModel]);

		cache_get_value_name(i, "TXDName", GateData[i][GateTXDName], 33);
		cache_get_value_name(i, "TextureName", GateData[i][GateTextureName], 33);

        GateData[i][GateStatus] = false;
		Gate_Refresh(i);
	}

	printf("SERVER: %d adet hareketli kapý yüklendi.", cache_num_rows());
	return 1;
}

Server:SQL_LoadModels()
{
	if(!cache_num_rows()) return print("SERVER: Hiç model yüklenmedi.");

	new base_id, model_id, dffname[32], txdname[32];
	for (new i = 0, j = cache_num_rows(); i < j; i ++)
	{
        cache_get_value_name(i, "model_name", dffname, 32);
        strcat(dffname, ".dff");

        cache_get_value_name(i, "model_name", txdname, 32);
        strcat(txdname, ".txd");

        cache_get_value_name_int(i, "base_id", base_id);
        cache_get_value_name_int(i, "model_id", model_id);
		AddCharModel(base_id, model_id, dffname, txdname);
	}

	printf("SERVER: %d adet model yüklendi.", cache_num_rows());
	return 1;
}

Server:SQL_LoadDoors()
{
	if(!cache_num_rows()) return print("SERVER: Hiç kapý noktasý yüklenmedi.");

	for (new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_DOORS)
	{
		Iter_Add(Doors, i);

		cache_get_value_name_int(i, "id", DoorData[i][DoorID]);
		cache_get_value_name_float(i, "PosX", DoorData[i][EnterPos][0]);
		cache_get_value_name_float(i, "PosY", DoorData[i][EnterPos][1]);
		cache_get_value_name_float(i, "PosZ", DoorData[i][EnterPos][2]);
		cache_get_value_name_float(i, "PosA", DoorData[i][EnterPos][3]);
		cache_get_value_name_int(i, "PosInterior", DoorData[i][EnterInterior]);
		cache_get_value_name_int(i, "PosWorld", DoorData[i][EnterWorld]);

		cache_get_value_name_float(i, "IntX", DoorData[i][ExitPos][0]);
		cache_get_value_name_float(i, "IntY", DoorData[i][ExitPos][1]);
		cache_get_value_name_float(i, "IntZ", DoorData[i][ExitPos][2]);
		cache_get_value_name_float(i, "IntA", DoorData[i][ExitPos][3]);
		cache_get_value_name_int(i, "IntInterior", DoorData[i][ExitInterior]);
	 	cache_get_value_name_int(i, "IntWorld", DoorData[i][ExitWorld]);

		cache_get_value_name_int(i, "DoorFaction", DoorData[i][DoorFaction]);
		cache_get_value_name(i, "DoorName", DoorData[i][DoorName], 35);
		cache_get_value_name_int(i, "DoorLocked", bool:DoorData[i][DoorLocked]);

		Door_Refresh(i);
	}

	printf("SERVER: %i adet kapý noktasý yüklendi.", cache_num_rows());
	return 1;
}

Server:SQL_LoadATMs()
{
	if(!cache_num_rows()) return print("SERVER: Hiç ATM yüklenmedi.");

	for (new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_ATM_MACHINES)
	{
		Iter_Add(ATMs, i);

	   	cache_get_value_name_int(i, "id", ATMData[i][AtmID]);
	    cache_get_value_name_float(i, "AtmX", ATMData[i][AtmPos][0]);
	    cache_get_value_name_float(i, "AtmY", ATMData[i][AtmPos][1]);
	    cache_get_value_name_float(i, "AtmZ", ATMData[i][AtmPos][2]);
	    cache_get_value_name_float(i, "AtmRX", ATMData[i][AtmPos][3]);
	    cache_get_value_name_float(i, "AtmRY", ATMData[i][AtmPos][4]);
	    cache_get_value_name_float(i, "AtmRZ", ATMData[i][AtmPos][5]);
	    cache_get_value_name_int(i, "AtmInterior", ATMData[i][AtmInterior]);
	    cache_get_value_name_int(i, "AtmWorld", ATMData[i][AtmWorld]);

	    ATM_Refresh(i);
	}

	printf("SERVER: %i adet ATM yüklendi.", cache_num_rows());
	return 1;
}

Server:SQL_LoadActors()
{
	if(!cache_num_rows()) return print("SERVER: Hiç aktör yüklenmedi.");

	for (new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_ACTORS)
	{
	    Iter_Add(Actors, i);

 		cache_get_value_name_int(i, "id", ActorData[i][ActorID]);
 		cache_get_value_name(i, "ActorName", ActorData[i][ActorName], 45);
 		cache_get_value_name_int(i, "ActorSkin", ActorData[i][ActorModel]);
		cache_get_value_name_float(i, "ActorX", ActorData[i][ActorPos][0]);
		cache_get_value_name_float(i, "ActorY", ActorData[i][ActorPos][1]);
		cache_get_value_name_float(i, "ActorZ", ActorData[i][ActorPos][2]);
		cache_get_value_name_float(i, "ActorA", ActorData[i][ActorPos][3]);
		cache_get_value_name_int(i, "ActorInterior", ActorData[i][ActorInterior]);
		cache_get_value_name_int(i, "ActorWorld", ActorData[i][ActorWorld]);

		Actor_Refresh(i);
	}

	printf("SERVER: %i adet aktör yüklendi.", cache_num_rows());
	return 1;
}

Server:SQL_LoadPNS()
{
	if(!cache_num_rows()) return print("SERVER: Hiç PNS yüklenmedi.");

	for (new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_PAYNSPRAY)
	{
	    Iter_Add(Sprays, i);

 		cache_get_value_name_int(i, "id", PNSData[i][PnsID]);
 		cache_get_value_name(i, "PnsName", PNSData[i][PnsName], 45);
 		cache_get_value_name_int(i, "PnsPrice", PNSData[i][PnsPrice]);
 		cache_get_value_name_int(i, "PnsEarnings", PNSData[i][PnsEarnings]);

		cache_get_value_name_float(i, "EnterX", PNSData[i][PnsPos][0]);
		cache_get_value_name_float(i, "EnterY", PNSData[i][PnsPos][1]);
		cache_get_value_name_float(i, "EnterZ", PNSData[i][PnsPos][2]);
		cache_get_value_name_float(i, "EnterA", PNSData[i][PnsPos][3]);
		cache_get_value_name_int(i, "EnterInterior", PNSData[i][EnterInteriorID]);
		cache_get_value_name_int(i, "EnterWorld", PNSData[i][EnterWorld]);

		cache_get_value_name_float(i, "RepairX", PNSData[i][PnsInt][0]);
		cache_get_value_name_float(i, "RepairY", PNSData[i][PnsInt][1]);
		cache_get_value_name_float(i, "RepairZ", PNSData[i][PnsInt][2]);
		cache_get_value_name_float(i, "RepairA", PNSData[i][PnsInt][3]);
		cache_get_value_name_int(i, "RepairInterior", PNSData[i][ExitInteriorID]);
		cache_get_value_name_int(i, "RepairWorld", PNSData[i][ExitWorld]);

		PNS_Refresh(i);
	}

	printf("SERVER: %i adet PNS yüklendi.", cache_num_rows());
	return 1;
}

Server:SQL_LoadGarages()
{
	if(!cache_num_rows()) return print("SERVER: Hiç garaj yüklenmedi.");

	for (new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_GARAGES)
	{
	    Iter_Add(Garages, i);

		cache_get_value_name_int(i, "id", GarageData[i][GarageID]);
		cache_get_value_name_int(i, "GaragePropertyID", GarageData[i][GaragePropertyID]);

		cache_get_value_name_float(i, "EnterX", GarageData[i][GaragePos][0]);
		cache_get_value_name_float(i, "EnterY", GarageData[i][GaragePos][1]);
		cache_get_value_name_float(i, "EnterZ", GarageData[i][GaragePos][2]);
		cache_get_value_name_float(i, "EnterA", GarageData[i][GaragePos][3]);
		cache_get_value_name_int(i, "EnterInterior", GarageData[i][EnterInteriorID]);
		cache_get_value_name_int(i, "EnterWorld", GarageData[i][EnterWorld]);

		cache_get_value_name_float(i, "ExitX", GarageData[i][GarageInt][0]);
		cache_get_value_name_float(i, "ExitY", GarageData[i][GarageInt][1]);
		cache_get_value_name_float(i, "ExitZ", GarageData[i][GarageInt][2]);
		cache_get_value_name_float(i, "ExitA", GarageData[i][GarageInt][3]);
		cache_get_value_name_int(i, "ExitInterior", GarageData[i][ExitInteriorID]);
		cache_get_value_name_int(i, "ExitWorld", GarageData[i][ExitWorld]);

  		cache_get_value_name_int(i, "GarageFaction", GarageData[i][GarageFaction]);
        cache_get_value_name_int(i, "GarageLocked", bool:GarageData[i][GarageLocked]);

		Garage_Refresh(i);
	}

	printf("SERVER: %i adet garaj yüklendi.", cache_num_rows());
	return 1;
}

Server:SQL_LoadGarbages()
{
    if(!cache_num_rows()) return print("SERVER: Hiç çöp kutusu yüklenmedi.");

	for (new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_GARBAGE_BINS)
	{
	    Iter_Add(Garbages, i);

    	cache_get_value_name_int(i, "id", GarbageData[i][GarbageID]);
    	cache_get_value_name_int(i, "GarbageType", GarbageData[i][GarbageType]);
    	cache_get_value_name_int(i, "GarbageTakenCapacity", GarbageData[i][GarbageTakenCapacity]);
    	cache_get_value_name_int(i, "GarbageCapacity", GarbageData[i][GarbageCapacity]);
		cache_get_value_name_float(i, "GarbageX", GarbageData[i][GarbagePos][0]);
		cache_get_value_name_float(i, "GarbageY", GarbageData[i][GarbagePos][1]);
		cache_get_value_name_float(i, "GarbageZ", GarbageData[i][GarbagePos][2]);
 		cache_get_value_name_int(i, "GarbageInterior", GarbageData[i][GarbageInterior]);
    	cache_get_value_name_int(i, "GarbageWorld", GarbageData[i][GarbageWorld]);

    	new array[2]; array[0] = 14; array[1] = i;
		GarbageData[i][GarbageArea] = CreateDynamicSphere(GarbageData[i][GarbagePos][0], GarbageData[i][GarbagePos][1], GarbageData[i][GarbagePos][2], 3.0, GarbageData[i][GarbageWorld], GarbageData[i][GarbageInterior]);
		Streamer_SetArrayData(STREAMER_TYPE_AREA, GarbageData[i][GarbageArea], E_STREAMER_EXTRA_ID, array, 2);
	}
	printf("SERVER: %i adet çöp kutusu yüklendi.", cache_num_rows());
	return 1;
}

Server:SQL_LoadChopshop()
{
	if(cache_num_rows() == 0)
		return print("[Chopshop] Hic chopshop verisi bulunamadi.");

    for (new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_CHOPSHOP)
    {
        ChopshopData[i][chopshop_exist] = true;
  		cache_get_value_name_int(i, "id", ChopshopData[i][chopshop_id]);
		cache_get_value_name_float(i, "offsetX", ChopshopData[i][chopshop_pos][0]);
		cache_get_value_name_float(i, "offsetY", ChopshopData[i][chopshop_pos][1]);
		cache_get_value_name_float(i, "offsetZ", ChopshopData[i][chopshop_pos][2]);
		cache_get_value_name_float(i, "rotX", ChopshopData[i][chopshop_pos][3]);
		cache_get_value_name_float(i, "rotY", ChopshopData[i][chopshop_pos][4]);
		cache_get_value_name_float(i, "rotZ", ChopshopData[i][chopshop_pos][5]);
		cache_get_value_name_int(i, "money", ChopshopData[i][chopshop_money]);

        Chopshop_Refresh(i);
    }
    return 1;
}

Server:SQL_LoadImpound()
{
	if(cache_num_rows() == 0)
		return print("[Impound] Hic arac baglama noktasi verisi bulunamadi.");

	for (new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_IMPOUND_LOTS)
	{
 		ImpoundData[i][impoundExists] = true;
	    cache_get_value_name_int(i, "impoundID", ImpoundData[i][impoundID]);
	    cache_get_value_name_float(i, "impoundLotX", ImpoundData[i][impoundLot][0]);
        cache_get_value_name_float(i, "impoundLotY", ImpoundData[i][impoundLot][1]);
        cache_get_value_name_float(i, "impoundLotZ", ImpoundData[i][impoundLot][2]);
        cache_get_value_name_float(i, "impoundReleaseX", ImpoundData[i][impoundRelease][0]);
        cache_get_value_name_float(i, "impoundReleaseY", ImpoundData[i][impoundRelease][1]);
        cache_get_value_name_float(i, "impoundReleaseZ", ImpoundData[i][impoundRelease][2]);
        cache_get_value_name_float(i, "impoundReleaseA", ImpoundData[i][impoundRelease][3]);

		Impound_Refresh(i);
	}
	return 1;
}

Server:SQL_LoadXMRData()
{
	if(!cache_num_rows()) return 1;

	new count = 0;
	for(new i = 0, j = cache_num_rows(); i < j && i < MAX_XMR_SUBCATEGORY; i++)
	{
		cache_get_value_name_int(i, "id", XMRData[i+1][xmrID]);
		cache_get_value_name_int(i, "category", XMRData[i+1][xmrCategory]);
		cache_get_value_name(i, "xmr_name", XMRData[i+1][xmrName], 90);
		cache_get_value_name(i, "xmr_url", XMRData[i+1][xmrStationURL], 128);
		count++;
	}
	printf("Loading - %d XMR stations were loaded.", count);
	return true;
}

Server:SQL_LoadXMRCategories()
{
	if(!cache_num_rows()) return 1;

	new count = 0;
	for(new i = 0, j = cache_num_rows(); i < j && i < MAX_XMR_CATEGORIES; i++)
	{
		cache_get_value_name_int(i, "id", XMRCategoryData[i+1][XMRID]);
		cache_get_value_name(i, "cat_name", XMRCategoryData[i+1][XMRCategoryName], 90);
		cache_get_value_name_int(i, "category_id", XMRCategoryData[i+1][XMRCategory]);
		count++;
	}
	printf("Loading - %d XMR sub categories were loaded.", count);
	return true;
}

Server:SQL_LoadPlayerNotes(playerid)
{
	if(!cache_num_rows()) return 1;

	for(new i = 0, j = cache_num_rows(); i < j; i++) if (i < MAX_PLAYER_NOTES)
	{
		cache_get_value_name_int(i, "id", NoteData[playerid][i][NoteID]);
		cache_get_value_name(i, "details", NoteData[playerid][i][NoteDetails], 128);
		cache_get_value_name_int(i, "time", NoteData[playerid][i][NoteTime]);
	}
	return 1;
}

Server:LoadPlayerFines(playerid)
{
	if(!cache_num_rows()) return 1;

	for(new i = 0, j = cache_num_rows(); i < j; i ++) if (i < MAX_FINES)
	{
		cache_get_value_name_int(i, "id", Fines[playerid][i][fine_id]);
		cache_get_value_name(i, "issuer_name", Fines[playerid][i][fine_issuer], 24);
		cache_get_value_name_int(i, "fine_amount", Fines[playerid][i][fine_amount]);
		cache_get_value_name_int(i, "fine_faction", Fines[playerid][i][fine_faction]);
		cache_get_value_name(i, "fine_reason", Fines[playerid][i][fine_reason], 128);
		cache_get_value_name_int(i, "fine_date", Fines[playerid][i][fine_date]);
	}
	return 1;
}

Server:SQL_LoadClothing(playerid)
{
	if(!cache_num_rows()) return 1;

	for(new i = 0, j = cache_num_rows(); i < j; i++) if (i < MAX_CLOTHING_ITEMS)
	{
		cache_get_value_name_int(i, "id", ClothingData[playerid][i][ClothingID]);
		cache_get_value_name_int(i, "player_dbid", ClothingData[playerid][i][ClothingOwnerID]);
		cache_get_value_name(i, "clothing_name", ClothingData[playerid][i][ClothingName], 32);

		cache_get_value_name_int(i, "slot_id", ClothingData[playerid][i][ClothingSlotID]);
		cache_get_value_name_int(i, "model_id", ClothingData[playerid][i][ClothingModelID]);
		cache_get_value_name_int(i, "bone_id", ClothingData[playerid][i][ClothingBoneID]);

		cache_get_value_name_float(i, "pos_x", ClothingData[playerid][i][ClothingPos][0]);
		cache_get_value_name_float(i, "pos_y", ClothingData[playerid][i][ClothingPos][1]);
		cache_get_value_name_float(i, "pos_z", ClothingData[playerid][i][ClothingPos][2]);

		cache_get_value_name_float(i, "rot_x", ClothingData[playerid][i][ClothingRot][0]);
		cache_get_value_name_float(i, "rot_y", ClothingData[playerid][i][ClothingRot][1]);
		cache_get_value_name_float(i, "rot_z", ClothingData[playerid][i][ClothingRot][2]);

		cache_get_value_name_float(i, "scale_x", ClothingData[playerid][i][ClothingScale][0]);
		cache_get_value_name_float(i, "scale_y", ClothingData[playerid][i][ClothingScale][1]);
		cache_get_value_name_float(i, "scale_z", ClothingData[playerid][i][ClothingScale][2]);

		cache_get_value_name_int(i, "auto_wear", bool:ClothingData[playerid][i][ClothingAutoWear]);

		/*cache_get_value_name_int(i, "color1", ClothingData[playerid][i][ClothingColor]);
		cache_get_value_name_int(i, "color2", ClothingData[playerid][i][ClothingColor2]);

		cache_get_value_name(i, "color1", ClothingData[playerid][i][ClothingColor], 32);
		cache_get_value_name(i, "color2", ClothingData[playerid][i][ClothingColor2], 32);

		ClothingData[playerid][i][ClothingColor] = ((ClothingData[playerid][i][ClothingColor] << 8) | 0xFF);
		ClothingData[playerid][i][ClothingColor2] = ((ClothingData[playerid][i][ClothingColor2] << 8) | 0xFF);*/

		if(ClothingData[playerid][i][ClothingAutoWear] == true)
		{
			if(!IsPlayerAttachedObjectSlotUsed(playerid, ClothingData[playerid][i][ClothingSlotID]))
			{
				SetTimerEx("LoadClothingTimer", 2000, false, "dd", playerid, i);
			}
		}

	}
	return 1;
}

Server:LoadClothingTimer(playerid, i)
{
	SetPlayerAttachedObject(playerid, ClothingData[playerid][i][ClothingSlotID], ClothingData[playerid][i][ClothingModelID], ClothingData[playerid][i][ClothingBoneID], ClothingData[playerid][i][ClothingPos][0], ClothingData[playerid][i][ClothingPos][1], ClothingData[playerid][i][ClothingPos][2], ClothingData[playerid][i][ClothingRot][0], ClothingData[playerid][i][ClothingRot][1], ClothingData[playerid][i][ClothingRot][2], ClothingData[playerid][i][ClothingScale][0], ClothingData[playerid][i][ClothingScale][1], ClothingData[playerid][i][ClothingScale][2], ClothingData[playerid][i][ClothingColor], ClothingData[playerid][i][ClothingColor2]);
	return 1;
}

Server:SQL_LoadPlayerContacts(playerid)
{
	if(!cache_num_rows()) return 1;

	for(new i = 0, j = cache_num_rows(); i < j; i++) if(i < MAX_PLAYER_CONTACTS)
	{
		cache_get_value_name_int(i, "id", ContactsData[playerid][i+1][contactSQLID]);
		cache_get_value_name_int(i, "playersqlid", ContactsData[playerid][i+1][contactPlayerSQLID]);
		cache_get_value_name_int(i, "contactid", ContactsData[playerid][i+1][contactID]);

		cache_get_value_name(i, "contact_name", ContactsData[playerid][i+1][contactName], 128);
		cache_get_value_name_int(i, "contact_num", ContactsData[playerid][i+1][contactNumber]);
	}
	return 1;
}

Server:SQL_LoadAdminNotes(playerid)
{
	if(!cache_num_rows()) return 1;

	for(new i = 0, j = cache_num_rows(); i < j; i++) if(i < MAX_ADMIN_NOTES)
	{
		cache_get_value_name_int(i, "id", aNotesData[playerid][i+1][anote_SQLID]);
		cache_get_value_name_int(i, "player_dbid", aNotesData[playerid][i+1][anote_playerDBID]);
		cache_get_value_name(i, "anote_reason", aNotesData[playerid][i+1][anote_reason], 128);
		cache_get_value_name(i, "anote_issuer", aNotesData[playerid][i+1][anote_issuer], 60);
		cache_get_value_name_int(i, "anote_date", aNotesData[playerid][i+1][anote_date]);
		cache_get_value_name_int(i, "anote_active", aNotesData[playerid][i+1][anote_active]);
	}

	/*
	for(new i = 1; i < MAX_ADMIN_NOTES; i++)
	{
		if(aNotesData[playerid][i][anote_SQLID] != 0)
		{
			if(aNotesData[playerid][i][anote_active])
			{
				adminWarn(1, sprintf("Player %s has %d active OnAdminAction notes on him, last is: %s", ReturnName(playerid, 1), CountAdminNotes(playerid), aNotesData[playerid][i][anote_reason]));
			}
			else continue;
		}
	}*/
	return 1;
}

Server:SQL_LoadVehicles()
{
    if(!cache_num_rows()) return 1;

	new
		str[20], vehicleid = INVALID_VEHICLE_ID;

	for(new i = 0, c = cache_num_rows(); i < c; i++) if(i < MAX_VEHICLES)
	{
		vehicleid = CreateVehicle(vericek_int(i, "ModelID"),
									vericek_float(i, "PosX"),
									vericek_float(i, "PosY"),
									vericek_float(i, "PosZ"),
									vericek_float(i, "PosA"),
									vericek_int(i, "Color1"),
									vericek_int(i, "Color2"), -1, vericek_int(i, "Siren"));

    	if(vehicleid != INVALID_VEHICLE_ID)
		{
		    Vehicle_DefaultValues(vehicleid);
		    CarData[vehicleid][carExists] = true;

            cache_get_value_name_int(i, "id", CarData[vehicleid][carID]);
			cache_get_value_name_int(i, "ModelID", CarData[vehicleid][carModel]);
			cache_get_value_name_int(i, "OwnerID", CarData[vehicleid][carOwnerID]);
			cache_get_value_name_int(i, "FactionID", CarData[vehicleid][carFaction]);

			cache_get_value_name_int(i, "RentalID", CarData[vehicleid][carRental]);
			cache_get_value_name_int(i, "RentalPrice", CarData[vehicleid][carRentalPrice]);
			cache_get_value_name_int(i, "RentedBy", CarData[vehicleid][carRentedBy]);

      cache_get_value_name(i, "Plate", CarData[vehicleid][carPlates], 20);
      SetVehicleNumberPlate(vehicleid, CarData[vehicleid][carPlates]);

            cache_get_value_name(i, "VehicleName", CarData[vehicleid][carName], 35);
			cache_get_value_name(i, "CarSign", CarData[vehicleid][carSign], 45);

			cache_get_value_name_float(i, "PosX", CarData[vehicleid][carPos][0]);
			cache_get_value_name_float(i, "PosY", CarData[vehicleid][carPos][1]);
			cache_get_value_name_float(i, "PosZ", CarData[vehicleid][carPos][2]);
			cache_get_value_name_float(i, "PosA", CarData[vehicleid][carPos][3]);

			cache_get_value_name_int(i, "Interior", CarData[vehicleid][carInterior]);
			cache_get_value_name_int(i, "World", CarData[vehicleid][carWorld]);

			cache_get_value_name_int(i, "Color1", CarData[vehicleid][carColor1]);
			cache_get_value_name_int(i, "Color2", CarData[vehicleid][carColor2]);

			cache_get_value_name_int(i, "XMR", bool:CarData[vehicleid][carXMR]);
			cache_get_value_name_int(i, "Siren", bool:CarData[vehicleid][carSiren]);
        	cache_get_value_name_int(i, "Locked", bool:CarData[vehicleid][carLocked]);

        	cache_get_value_name_int(i, "Impounded", CarData[vehicleid][carImpounded]);
					cache_get_value_name_int(i, "ImpoundTime", CarData[vehicleid][carImpoundTime]);
					cache_get_value_name(i, "ImpoundReason", CarData[vehicleid][carImpoundReason], 45);

        	cache_get_value_name_float(i, "Fuel", CarData[vehicleid][carFuel]);
        	cache_get_value_name_float(i, "Mileage", CarData[vehicleid][carMileage]);
        	cache_get_value_name_float(i, "Armour", CarData[vehicleid][carArmour]);
        	cache_get_value_name_float(i, "EngineLife", CarData[vehicleid][carEngine]);
        	cache_get_value_name_float(i, "BatteryLife", CarData[vehicleid][carBattery]);

			cache_get_value_name_int(i, "LockLevel", CarData[vehicleid][carLock]);
			cache_get_value_name_int(i, "AlarmLevel", CarData[vehicleid][carAlarm]);
			cache_get_value_name_int(i, "ImmobLevel", CarData[vehicleid][carImmob]);

			cache_get_value_name_int(i, "Insurance", CarData[vehicleid][carInsurance]);
			cache_get_value_name_int(i, "InsuranceTime", CarData[vehicleid][carInsuranceTime]);
			cache_get_value_name_int(i, "InsurancePrice", CarData[vehicleid][carInsurancePrice]);

			cache_get_value_name_int(i, "TimesDestroyed", CarData[vehicleid][carTimeDestroyed]);
			cache_get_value_name_int(i, "Paintjob", CarData[vehicleid][carPaintjob]);

			if(CarData[vehicleid][carPaintjob] != -1) ChangeVehiclePaintjob(vehicleid, CarData[vehicleid][carPaintjob]);

			for(new m; m < 14; m++)
			{
				format(str, sizeof(str), "CarMods%i", m+1);
				cache_get_value_name_int(i, str, CarData[vehicleid][carMods][m]);

				if(m < 4)
				{
					format(str, sizeof(str), "CarDoors%i", m+1);
					cache_get_value_name_int(i, str, CarData[vehicleid][carDoors][m]);

					format(str, sizeof(str), "CarWindows%i", m+1);
					cache_get_value_name_int(i, str, CarData[vehicleid][carWindows][m]);
				}
			}

			cache_get_value_name_int(i, "LastDriver", CarData[vehicleid][carlastDriver]);
			cache_get_value_name_int(i, "LastPassenger", CarData[vehicleid][carlastPassenger]);

			cache_get_value_name_float(i, "LastHealth", CarData[vehicleid][carLastHealth]);
			cache_get_value_name_float(i, "MaxHealth", CarData[vehicleid][carMaxHealth]);
			cache_get_value_name_int(i, "Panels", CarData[vehicleid][carPanelStatus]);
			cache_get_value_name_int(i, "Doors", CarData[vehicleid][carDoorsStatus]);
			cache_get_value_name_int(i, "Lights", CarData[vehicleid][carLightsStatus]);
			cache_get_value_name_int(i, "Tires", CarData[vehicleid][carTiresStatus]);

			if(CarData[vehicleid][carLastHealth] < 350.0)
			{
				CarData[vehicleid][carLastHealth] = 360.0;
			}

			//SetVehicleParamsCarDoors(vehicleid, CarData[vehicleid][carDoors][0], CarData[vehicleid][carDoors][1], CarData[vehicleid][carDoors][2], CarData[vehicleid][carDoors][3]);
			//SetVehicleParamsCarWindows(vehicleid, CarData[vehicleid][carWindows][0], CarData[vehicleid][carWindows][1], CarData[vehicleid][carWindows][2], CarData[vehicleid][carWindows][3]);
			//UpdateVehicleDamageStatus(vehicleid, CarData[vehicleid][carPanelStatus], CarData[vehicleid][carDoorsStatus], CarData[vehicleid][carLightsStatus], CarData[vehicleid][carTiresStatus]);
			//SetVehicleParamsEx(vehicleid, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF);

			SetVehicleToRespawn(vehicleid);
			SetVehicleHealth(vehicleid, CarData[vehicleid][carLastHealth]);
		}
	}
	return 1;
}

Server:SQL_LoadOwnedCars(playerid)
{
	if(!cache_num_rows()) return SendClientMessage(playerid, COLOR_ADM, "HATA: {FFFFFF}Bu araç slotu boþ gözüküyor.");

	new
		str[20], vehicleid = INVALID_VEHICLE_ID;

	for(new i = 0, j = cache_num_rows(); i < j; i++) if(i < MAX_VEHICLES)
	{
		vehicleid = CreateVehicle(vericek_int(i, "ModelID"),
										vericek_float(i, "PosX"),
										vericek_float(i, "PosY"),
										vericek_float(i, "PosZ"),
										vericek_float(i, "PosA"),
										vericek_int(i, "Color1"),
										vericek_int(i, "Color2"), -1, false);
    	if(vehicleid != INVALID_VEHICLE_ID)
		{
		    Vehicle_DefaultValues(vehicleid);

		    CarData[vehicleid][carExists] = true;
			_has_spawned_vehicleid[playerid] = vehicleid;
			_has_vehicle_spawned[playerid] = true;

	        cache_get_value_name_int(i, "id", CarData[vehicleid][carID]);
			cache_get_value_name_int(i, "ModelID", CarData[vehicleid][carModel]);
			cache_get_value_name_int(i, "OwnerID", CarData[vehicleid][carOwnerID]);
			cache_get_value_name_int(i, "FactionID", CarData[vehicleid][carFaction]);

			cache_get_value_name_int(i, "RentalID", CarData[vehicleid][carRental]);
			cache_get_value_name_int(i, "RentalPrice", CarData[vehicleid][carRentalPrice]);
			cache_get_value_name_int(i, "RentedBy", CarData[vehicleid][carRentedBy]);

			cache_get_value_name_int(i, "illegalPlate", CarData[vehicleid][carIllegalPlate]);
	    cache_get_value_name(i, "Plate", CarData[vehicleid][carPlates], 20);

			if(CarData[vehicleid][carIllegalPlate] == true)
			{
				SetVehicleNumberPlate(vehicleid, " ");
			}
			else
			{
	    	SetVehicleNumberPlate(vehicleid, CarData[vehicleid][carPlates]);
			}

	    cache_get_value_name(i, "VehicleName", CarData[vehicleid][carName], 35);
			cache_get_value_name(i, "CarSign", CarData[vehicleid][carSign], 45);

			cache_get_value_name_float(i, "PosX", CarData[vehicleid][carPos][0]);
			cache_get_value_name_float(i, "PosY", CarData[vehicleid][carPos][1]);
			cache_get_value_name_float(i, "PosZ", CarData[vehicleid][carPos][2]);
			cache_get_value_name_float(i, "PosA", CarData[vehicleid][carPos][3]);

			cache_get_value_name_int(i, "Interior", CarData[vehicleid][carInterior]);
			cache_get_value_name_int(i, "World", CarData[vehicleid][carWorld]);

			cache_get_value_name_int(i, "Color1", CarData[vehicleid][carColor1]);
			cache_get_value_name_int(i, "Color2", CarData[vehicleid][carColor2]);

			cache_get_value_name_int(i, "XMR", bool:CarData[vehicleid][carXMR]);
			cache_get_value_name_int(i, "Siren", bool:CarData[vehicleid][carSiren]);
	    	cache_get_value_name_int(i, "Locked", bool:CarData[vehicleid][carLocked]);

	    	cache_get_value_name_int(i, "Impounded", CarData[vehicleid][carImpounded]);
				cache_get_value_name_int(i, "ImpoundTime", CarData[vehicleid][carImpoundTime]);
				cache_get_value_name(i, "ImpoundReason", CarData[vehicleid][carImpoundReason], 45);

	    	cache_get_value_name_float(i, "Fuel", CarData[vehicleid][carFuel]);
	    	cache_get_value_name_float(i, "Mileage", CarData[vehicleid][carMileage]);
	    	cache_get_value_name_float(i, "Armour", CarData[vehicleid][carArmour]);
	    	cache_get_value_name_float(i, "EngineLife", CarData[vehicleid][carEngine]);
	    	cache_get_value_name_float(i, "BatteryLife", CarData[vehicleid][carBattery]);

			cache_get_value_name_int(i, "LockLevel", CarData[vehicleid][carLock]);
			cache_get_value_name_int(i, "AlarmLevel", CarData[vehicleid][carAlarm]);
			cache_get_value_name_int(i, "ImmobLevel", CarData[vehicleid][carImmob]);

			cache_get_value_name_int(i, "Insurance", CarData[vehicleid][carInsurance]);
			cache_get_value_name_int(i, "InsuranceTime", CarData[vehicleid][carInsuranceTime]);
			cache_get_value_name_int(i, "InsurancePrice", CarData[vehicleid][carInsurancePrice]);

			cache_get_value_name_int(i, "TimesDestroyed", CarData[vehicleid][carTimeDestroyed]);
			cache_get_value_name_int(i, "Paintjob", CarData[vehicleid][carPaintjob]);

			if(CarData[vehicleid][carPaintjob] != -1) ChangeVehiclePaintjob(vehicleid, CarData[vehicleid][carPaintjob]);

			for(new m; m < 14; m++)
			{
				format(str, sizeof(str), "CarMods%i", m+1);
				cache_get_value_name_int(i, str, CarData[vehicleid][carMods][m]);

				if(m < 4)
				{
					format(str, sizeof(str), "CarDoors%i", m+1);
					cache_get_value_name_int(i, str, CarData[vehicleid][carDoors][m]);

					format(str, sizeof(str), "CarWindows%i", m+1);
					cache_get_value_name_int(i, str, CarData[vehicleid][carWindows][m]);
				}
			}

			cache_get_value_name_int(i, "LastDriver", CarData[vehicleid][carlastDriver]);
			cache_get_value_name_int(i, "LastPassenger", CarData[vehicleid][carlastPassenger]);

			cache_get_value_name_float(i, "LastHealth", CarData[vehicleid][carLastHealth]);
			cache_get_value_name_float(i, "MaxHealth", CarData[vehicleid][carMaxHealth]);
			cache_get_value_name_int(i, "Panels", CarData[vehicleid][carPanelStatus]);
			cache_get_value_name_int(i, "Doors", CarData[vehicleid][carDoorsStatus]);
			cache_get_value_name_int(i, "Lights", CarData[vehicleid][carLightsStatus]);
			cache_get_value_name_int(i, "Tires", CarData[vehicleid][carTiresStatus]);

			if(CarData[vehicleid][carLastHealth] < 350.0)
			{
				CarData[vehicleid][carLastHealth] = 360.0;
			}

			SetVehicleToRespawn(vehicleid);
			SetVehicleHealth(vehicleid, CarData[vehicleid][carLastHealth]);
			ToggleVehicleLock(vehicleid, CarData[vehicleid][carLocked] ? true : false);
		}
	}

	//LogVehicleAction(vehicleid, "Spawn edildi.");

	new query[74];
	mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM vehicle_weapons WHERE vehicle_id = %i", CarData[vehicleid][carID]);
	mysql_tquery(m_Handle, query, "SQL_LoadVehicleWeapons", "i", vehicleid);

	mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM vehicle_drugs WHERE vehicle_id = %i", CarData[vehicleid][carID]);
	mysql_tquery(m_Handle, query, "SQL_LoadVehicleDrugs", "i", vehicleid);

	mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM vehicle_fines WHERE vehicle_dbid = %i", CarData[vehicleid][carID]);
	mysql_tquery(m_Handle, query, "LoadVehicleFines", "i", vehicleid);

	SendClientMessageEx(playerid, COLOR_DARKGREEN, "%s isimli araç park edilen noktada spawn oldu.", ReturnVehicleName(vehicleid));
	SendClientMessageEx(playerid, COLOR_WHITE, "Güvenlik: Kilit[%i], Alarm[%i], Immob[%i], Sigorta[%i], KM[%.1f]", CarData[vehicleid][carLock], CarData[vehicleid][carAlarm], CarData[vehicleid][carImmob], CarData[vehicleid][carInsurance], CarData[vehicleid][carMileage]);
	SendClientMessageEx(playerid, COLOR_WHITE, "Araç Ömrü: Motor Ömrü[%.2f], Batarya Ömrü[%.2f], Patlatýldýðý Sayý[%i]", CarData[vehicleid][carEngine], CarData[vehicleid][carBattery], CarData[vehicleid][carTimeDestroyed]);

	SendClientMessage(playerid, COLOR_PINK, "ÝPUCU: Kýrmýzý noktayý takip ederek aracýný bulabilirsin.");
	SetPlayerCheckpoint(playerid, CarData[vehicleid][carPos][0], CarData[vehicleid][carPos][1], CarData[vehicleid][carPos][2], 3.0);
	if(CarData[vehicleid][carImpounded] != -1) SendClientMessage(playerid, COLOR_ADM, "Aracýnýz polisler tarafýndan çekilmiþ gözüküyor.");
	return 1;
}

Server:SQL_LoadVehicleWeapons(vehicleid)
{
	if(cache_num_rows() == 0)
		return print("[Vehicle Trunk] Hic arac bagaji verisi bulunamadi.");

   	for (new i = 0, j = 1; i < cache_num_rows(); i++, j++) if (j < MAX_WEP_SLOT)
	{
	    cache_get_value_name_int(i, "id", vehicle_weap_data[vehicleid][j][data_id]);
	    cache_get_value_name_int(i, "weapon", vehicle_weap_data[vehicleid][j][veh_wep]);
		cache_get_value_name_int(i, "ammo", vehicle_weap_data[vehicleid][j][veh_ammo]);
		cache_get_value_name_int(i, "vehicle_id", vehicle_weap_data[vehicleid][j][veh_id]);
		cache_get_value_name_float(i, "offsetX", vehicle_weap_data[vehicleid][j][wep_offset][0]);
		cache_get_value_name_float(i, "offsetY", vehicle_weap_data[vehicleid][j][wep_offset][1]);
		cache_get_value_name_float(i, "offsetZ", vehicle_weap_data[vehicleid][j][wep_offset][2]);
		cache_get_value_name_float(i, "rotX", vehicle_weap_data[vehicleid][j][wep_offset][3]);
		cache_get_value_name_float(i, "rotY", vehicle_weap_data[vehicleid][j][wep_offset][4]);
		cache_get_value_name_float(i, "rotZ", vehicle_weap_data[vehicleid][j][wep_offset][5]);

		printf("vehicle_weap_data[%i][%i][data_id]: %i", vehicleid, j, vehicle_weap_data[vehicleid][j][veh_wep]);

		if(vehicle_weap_data[vehicleid][j][veh_wep])
		{
		    if(IsValidDynamicObject(vehicle_weap_data[vehicleid][j][temp_object])) DestroyDynamicObject(vehicle_weap_data[vehicleid][j][temp_object]);
		    vehicle_weap_data[vehicleid][j][is_exist] = true;

		    vehicle_weap_data[vehicleid][j][temp_object] = CreateDynamicObject(ReturnWeaponsModel( vehicle_weap_data[vehicleid][j][veh_wep] ), 0, 0, -1000, 0, 0, 0);
		    AttachDynamicObjectToVehicle( vehicle_weap_data[vehicleid][j][temp_object] , vehicleid,
				vehicle_weap_data[vehicleid][j][wep_offset][0],
				vehicle_weap_data[vehicleid][j][wep_offset][1],
				vehicle_weap_data[vehicleid][j][wep_offset][2],
				vehicle_weap_data[vehicleid][j][wep_offset][3],
				vehicle_weap_data[vehicleid][j][wep_offset][4],
				vehicle_weap_data[vehicleid][j][wep_offset][5]
			);
		}
	}
	return 1;
}

Server:SQL_LoadVehicleDrugs(vehicleid)
{
	if(!cache_num_rows()) return 1;

	for (new i = 0, j = 1; i < cache_num_rows(); i++, j++)
    {
        vehicle_drug_data[vehicleid][j][is_exist] = true;
	    cache_get_value_name_int(i, "id", vehicle_drug_data[vehicleid][j][data_id]);
	    cache_get_value_name(i, "drug_name", vehicle_drug_data[vehicleid][j][veh_drug_name], 64);
	   	cache_get_value_name_int(i, "drug_type", vehicle_drug_data[vehicleid][j][veh_drug_id]);
	    cache_get_value_name_float(i, "drug_amount", vehicle_drug_data[vehicleid][j][veh_drug_amount]);
	    cache_get_value_name_int(i, "drug_quality", vehicle_drug_data[vehicleid][j][veh_drug_quality]);
	    cache_get_value_name_int(i, "drug_size", vehicle_drug_data[vehicleid][j][veh_drug_size]);
	    cache_get_value_name_int(i, "vehicle_id", vehicle_drug_data[vehicleid][j][veh_id]);
	}
	return 1;
}

Server:LoadVehicleFines(vehicleid)
{
	if(!cache_num_rows()) return 1;

	for(new i = 0, j = cache_num_rows(); i < j; i ++)
	{
		cache_get_value_name_int(i, "id", VehicleFines[vehicleid][i][fine_id]);
		cache_get_value_name_float(i, "vehicle_x", VehicleFines[vehicleid][i][fine_x]);
		cache_get_value_name_float(i, "vehicle_y", VehicleFines[vehicleid][i][fine_y]);
		cache_get_value_name_float(i, "vehicle_z", VehicleFines[vehicleid][i][fine_z]);
		cache_get_value_name(i, "issuer_name", VehicleFines[vehicleid][i][fine_issuer], 24);
		cache_get_value_name_int(i, "fine_amount", VehicleFines[vehicleid][i][fine_amount]);
		cache_get_value_name_int(i, "fine_faction", VehicleFines[vehicleid][i][fine_faction]);
		cache_get_value_name(i, "fine_reason", VehicleFines[vehicleid][i][fine_reason],  128);
		cache_get_value_name_int(i, "fine_date", VehicleFines[vehicleid][i][fine_date]);
	}
	return 1;
}

Server:SQL_LoadAttachments(playerid)
{
	if(!cache_num_rows())
	{
		return 1;
	}

	new weaponid, index;

	for(new i, j = cache_num_rows(); i < j; ++i)
	{
		cache_get_value_name_int(i, "WeaponID", weaponid); index = weaponid - 22;
		cache_get_value_name_int(i, "BoneID", WeaponSettings[playerid][index][WeaponBone]);
		cache_get_value_name_int(i, "Hidden", bool:WeaponSettings[playerid][index][WeaponHidden]);
		cache_get_value_name_float(i, "PosX", WeaponSettings[playerid][index][WeaponPos][0]);
		cache_get_value_name_float(i, "PosY", WeaponSettings[playerid][index][WeaponPos][1]);
		cache_get_value_name_float(i, "PosZ", WeaponSettings[playerid][index][WeaponPos][2]);
		cache_get_value_name_float(i, "RotX", WeaponSettings[playerid][index][WeaponPos][3]);
		cache_get_value_name_float(i, "RotY", WeaponSettings[playerid][index][WeaponPos][4]);
		cache_get_value_name_float(i, "RotZ", WeaponSettings[playerid][index][WeaponPos][5]);
	}
	return 1;
}

Server:Hud_Update(playerid, vehicleid)
{
	if(PlayerData[playerid][pHudStatus])
	{
		switch(PlayerData[playerid][pHudstyle])
		{
		    case 0:
		    {
		        if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && !IsABike(vehicleid) && vehicleid != g_aVehicleSpawned[playerid]) PlayerTextDrawSetString(playerid, Player_Hud[playerid][0], sprintf("KM/H: ~g~%i~n~~b~Yakit: ~g~%i~n~_~n~~b~Radyo Bilgi~n~Kanal: ~g~%i~n~~b~Slot: ~g~%i", floatround(GetVehicleSpeed(vehicleid)), floatround(CarData[vehicleid][carFuel]), PlayerData[playerid][pRadio][ PlayerData[playerid][pMainSlot] ], PlayerData[playerid][pMainSlot]));
		        else PlayerTextDrawSetString(playerid, Player_Hud[playerid][0], sprintf("Radyo Bilgi~n~Kanal: ~g~%i~n~~b~Slot: ~g~%i", PlayerData[playerid][pRadio][ PlayerData[playerid][pMainSlot] ], PlayerData[playerid][pMainSlot]));
		    }
		    case 1:
		    {
		        if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && !IsABike(vehicleid) && vehicleid != g_aVehicleSpawned[playerid]) PlayerTextDrawSetString(playerid, Player_Hud[playerid][1], sprintf("~g~%i__~r~%i__~w~%i", floatround(GetVehicleSpeed(vehicleid)), floatround(CarData[vehicleid][carFuel]), floatround(CarData[vehicleid][carMileage])));
				else PlayerTextDrawHide(playerid, Player_Hud[playerid][1]);
		    }
		    case 2:
		    {
		        if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && !IsABike(vehicleid) && vehicleid != g_aVehicleSpawned[playerid]) PlayerTextDrawSetString(playerid, Player_Hud[playerid][2], sprintf("%s_~r~%i_%i~y~KMH/~r~%i~y~MPH~n~~w~Kanal: ~y~%i~n~~w~Slot: ~y~%i", ReturnVehicleName(vehicleid), floatround(CarData[vehicleid][carFuel]), floatround(GetVehicleSpeed(vehicleid)), floatround(GetVehicleSpeed(vehicleid) * 0.6214), PlayerData[playerid][pRadio][ PlayerData[playerid][pMainSlot] ], PlayerData[playerid][pMainSlot]));
		        else PlayerTextDrawSetString(playerid, Player_Hud[playerid][2], sprintf("Kanal: ~y~%i~n~~w~Slot: ~y~%i", PlayerData[playerid][pRadio][ PlayerData[playerid][pMainSlot] ], PlayerData[playerid][pMainSlot]));
		    }
		    case 3:
		    {
		        if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && !IsABike(vehicleid) && vehicleid != g_aVehicleSpawned[playerid])
				{
					PlayerTextDrawShow(playerid, Player_Hud[playerid][3]); new Float: carhp; GetVehicleHealth(vehicleid, carhp);
			        PlayerTextDrawSetString(playerid,Player_Hud[playerid][3], sprintf("~l~%s~n~~w~%i   ~l~%i   ~w~%i   ~l~%i", ReturnVehicleName(vehicleid), floatround(CarData[vehicleid][carEngine]), floatround(CarData[vehicleid][carFuel]), floatround(carhp), floatround(GetVehicleSpeed(vehicleid))));
		        }
		        else PlayerTextDrawHide(playerid, Player_Hud[playerid][3]);
		    }
		    case 4:
		    {
		    	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && !IsABike(vehicleid) && vehicleid != g_aVehicleSpawned[playerid]) PlayerTextDrawSetString(playerid, Player_Hud[playerid][4], sprintf("KM/H: %i~n~Yakit: %i~n~_~n~Kanal: %i~n~Slot: %i", floatround(GetVehicleSpeed(vehicleid)), floatround(CarData[vehicleid][carFuel]), PlayerData[playerid][pRadio][ PlayerData[playerid][pMainSlot] ], PlayerData[playerid][pMainSlot]));
		        else PlayerTextDrawSetString(playerid, Player_Hud[playerid][4], sprintf("Kanal: %i~n~Slot: %i", PlayerData[playerid][pRadio][ PlayerData[playerid][pMainSlot] ], PlayerData[playerid][pMainSlot]));
		    }
		}
	}

	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) CarData[vehicleid][carMileage] += (floatround(GetVehicleSpeed(vehicleid)) * 0.00009722222);
	return 1;
}

Server:PermanentBan(playerid, theid, thereason[])
{
	SendMessageToAllKick(COLOR_ADM, "AdmCmd: %s isimli oyuncu %s tarafýndan yasaklandý. Sebep: %s", ReturnName(theid, 1), ReturnName(playerid, 1), thereason);
	KickEx(theid);
	return 1;
}

Server:CKBan(playerid, theid, thereason[])
{
	//SendMessageToAllKick(COLOR_ADM, "AdmCmd: %s isimli oyuncu %s tarafýndan yasaklandý. Sebep: %s", ReturnName(theid, 1), ReturnName(playerid, 1), thereason);
	CreateCorpse(theid);
	KickEx(theid);
	return 1;
}

Server:UnbanCK(playerid)
{
	new rows;
	cache_get_row_count(rows);

	if(rows)
	{
		new banstatus, userid, name[MAX_PLAYER_NAME];
		cache_get_value_name_int(0, "AccountStatus", banstatus);
		cache_get_value_name_int(0, "id", userid);
		cache_get_value_name(0, "Name", name);

		if(banstatus != 3) return SendErrorMessage(playerid, "Bu karakter yasaklanmamýþ.");

		new ban_query[52+11+1];
		mysql_format(m_Handle, ban_query, sizeof(ban_query), "UPDATE players SET AccountStatus = 0 WHERE id = '%d'", userid);
		mysql_tquery(m_Handle, ban_query);
		SendServerMessage(playerid, "Baþarýyla %s'ýn karakter yasaklamasý kaldýrýldý.", name);
	}
	else
	{
		SendErrorMessage(playerid, "Böyle bir karakter bulunamadý.");
	}
	return 1;
}

Server:SQL_AddAdminMessage(playerid)
{
	if (cache_num_rows())
	{
		new query[222], user_name[25];
		for (new i = 0, j = cache_num_rows(); i < j; i++)
		{
			cache_get_value_name(i, "Name", user_name, 25);
			mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET AdminMessage = '%e', AdminMessageBy = '%e', AdmMessageConfirm = 0 WHERE Name = '%e'", PlayerData[playerid][pAdminMsg], ReturnName(playerid, 1), user_name);
			mysql_tquery(m_Handle, query);

			format(PlayerData[playerid][pAdminMsg], 128, " ");
			SendClientMessageEx(playerid, COLOR_ADM, "[ ! ]{FFFFFF} %s isimli oyuncu giriþ yaptýktan sonra mesajýnýzý görecektir.", user_name);
			//WriteLog("admin_logs/players/admin_msg.txt", "[%s] %s AddAdminMessage user %s, reason: %s", ReturnDate(), ReturnName(playerid, 1), user_name, PlayerData[playerid][pAdminMsg]);
		}
	} else SendClientMessage(playerid, COLOR_ADM, "HATA:{FFFFFF} Belirtilen karakter adýnda bir hesap bulunamadý.");
	return 1;
}

Server:SQL_FurnitureAList(playerid, page)
{
	if(!IsPlayerConnected(playerid)) {
        return 0;
    }

    new rows = cache_num_rows();
    if(!rows) {
        return SendClientMessage(playerid, COLOR_ADM, "SERVER: Hiç mobilya verisi eklenmemiþ.");
    }

	new
		id, obj_price, obj_name[64], primary_str[1490];

	for(new i; i < rows; ++i)
	{
		cache_get_value_name_int(i, "id", id);
        cache_get_value_name(i, "ObjName", obj_name, 64);
        cache_get_value_name_int(i, "ObjPrice", obj_price);

		format(primary_str, sizeof(primary_str), "%s[%i] {AFAFAF}%s - $%s\n", primary_str, id, obj_name, MoneyFormat(obj_price));
	}

	if(page != 0) strcat(primary_str, "{FFFF00}Önceki Sayfa <<\n");
	if(rows >= MAX_CLOTHING_SHOW) strcat(primary_str, "{FFFF00}Sonraki Sayfa >>");

	Dialog_Show(playerid, FURNITURE_ALIST, DIALOG_STYLE_LIST, "LSS-RP: Mobilya Listesi", primary_str, "Düzenle", "<< Kapat");
	return 1;
}

Server:SQL_DealershipList(playerid, page)
{
	if(!IsPlayerConnected(playerid)) {
        return 0;
    }

    new rows = cache_num_rows();
    if(!rows) {
        return SendClientMessage(playerid, COLOR_ADM, "SERVER: Hiç araç verisi eklenmemiþ.");
    }

	new
		id, vehicle_price, vehicle_name[45], primary_str[1024];

	for(new i; i < rows; ++i)
	{
		cache_get_value_name_int(i, "id", id);
        cache_get_value_name(i, "VehicleName", vehicle_name, 45);
        cache_get_value_name_int(i, "VehiclePrice", vehicle_price);

		format(primary_str, sizeof(primary_str), "%s[%i] {AFAFAF}%s - $%s\n", primary_str, id, vehicle_name, MoneyFormat(vehicle_price));
	}

	if(page != 0) strcat(primary_str, "{FFFF00}Önceki Sayfa <<\n");
	if(rows >= MAX_CLOTHING_SHOW) strcat(primary_str, "{FFFF00}Sonraki Sayfa >>");

	Dialog_Show(playerid, VEHICLE_LIST, DIALOG_STYLE_LIST, "LSS-RP: Araç Listesi", primary_str, "Düzenle", "<< Kapat");
	return 1;
}

Server:OnPanelUnban(playerid, response)
{
	if(!response) {
		ShowAdminPanel(playerid);
		return 1;
	}

	new
		string[128],
		query[256];

	//format(string, sizeof(string), "%s isimli oyuncunun yasaklamasý %s tarafýndan kaldýrýldý.", AdminPanelName[playerid], ReturnName(playerid));
	//adminWarn(1, string);

	format(string, sizeof(string), "\"{A52A2A}%s{ADC3E7}\" adlý oyuncunun yasaðý baþarýyla kaldýrýldý.", AdminPanelName[playerid]);
	ShowPlayerDialog(playerid, DIALOG_USE, DIALOG_STYLE_MSGBOX, "Yönetici Paneli: Yasak Kaldýr", string, "Tamamdýr!", "");

	mysql_format(m_Handle, query, sizeof(query), "UPDATE bans SET active = 0 WHERE ban_name = '%e'", AdminPanelName[playerid]);
	mysql_tquery(m_Handle, query);
	return 1;
}

Server:DelaySetPos(playerid, Float:x, Float:y, Float:z) { SetPlayerPos(playerid, x, y, z); }

Server:OnEntranceCreated(id)
{
	EntranceData[id][EntranceID] = cache_insert_id();
	Entrance_Save(id);
	return 1;
}

Server:OnGarageCreated(id)
{
	GarageData[id][GarageID] = cache_insert_id();
	Garage_Save(id);
	return 1;
}

Server:OnPNSCreated(id)
{
	PNSData[id][PnsID] = cache_insert_id();
	PNS_Save(id);
	return 1;
}

Server:OnActorCreated(id)
{
	ActorData[id][ActorID] = cache_insert_id();
	Actor_Save(id);
	return 1;
}

Server:OnATMCreated(id)
{
	ATMData[id][AtmID] = cache_insert_id();
 	ATM_Save(id);
	return 1;
}

Server:SQL_TeleportList(playerid, page)
{
	if(!IsPlayerConnected(playerid)) {
        return 0;
    }

    new rows = cache_num_rows();
    if(!rows) {
        return SendClientMessage(playerid, COLOR_ADM, "SERVER: Hiç ýþýnlanma noktasý eklenmemiþ.");
    }

	new primary_str[1024], id, teleport_name[30];

	for(new i; i < rows; ++i)
	{
		cache_get_value_name_int(i, "id", id);
        cache_get_value_name(i, "TeleportName", teleport_name, sizeof(teleport_name));
		format(primary_str, sizeof(primary_str), "%s[%i] {AFAFAF}%s\n", primary_str, id, teleport_name);
	}

	if(page != 0) strcat(primary_str, "{FFFF00}Önceki Sayfa <<\n");
	if(rows >= MAX_CLOTHING_SHOW) strcat(primary_str, "{FFFF00}Sonraki Sayfa >>");

	Dialog_Show(playerid, TELEPORT_LIST, DIALOG_STYLE_LIST, "Iþýnlanma Listesi", primary_str, "Iþýnlan", "<< Kapat");
	return 1;
}

Server:OnDoorCreated(id)
{
	DoorData[id][DoorID] = cache_insert_id();
	Door_Save(id);
	return 1;
}

Server:OnGateCreated(id)
{
	GateData[id][GateID] = cache_insert_id();
	Gate_Save(id);
	return 1;
}

Server:CloseGate(id, linkid, Float:fX, Float:fY, Float:fZ, Float:speed, Float:fRotX, Float:fRotY, Float:fRotZ)
{
	MoveDynamicObject(GateData[id][GateObject], fX, fY, fZ, speed, fRotX, fRotY, fRotZ);

	new tmp_id = -1;
	if ((tmp_id = GetGateByID(linkid)) != -1)
		MoveDynamicObject(GateData[tmp_id][GateObject], GateData[tmp_id][GatePos][0], GateData[tmp_id][GatePos][1], GateData[tmp_id][GatePos][2], speed, GateData[tmp_id][GatePos][3], GateData[tmp_id][GatePos][4], GateData[tmp_id][GatePos][5]), GateData[tmp_id][GateStatus] = false;

	GateData[id][GateStatus] = false;
	return 1;
}

Server:OnObjectCreated(id)
{
	ObjectData[id][ObjectID] = cache_insert_id();
 	Object_Save(id);
	return 1;
}

Server:OnSprayCreated(id)
{
	SprayData[id][SprayID] = cache_insert_id();
 	Spray_Save(id);
	return 1;
}

Server:OnBillboardCreated(id)
{
	BillboardData[id][BillboardID] = cache_insert_id();
 	Billboard_Save(id);
	return 1;
}

Server:OnCameraCreated(id)
{
	CameraData[id][CameraID] = cache_insert_id();
	Camera_Save(id);
	return 1;
}

Server:OnTollCreated(id)
{
	TollData[id][TollID] = cache_insert_id();
	Toll_Save(id);
	return 1;
}

Server:OnFactionCreated(id)
{
	FactionData[id][FactionID] = cache_insert_id();

	new query[66];
	mysql_format(m_Handle, query, sizeof(query), "INSERT INTO faction_ranks (faction_id) VALUES (%i)", FactionData[id][FactionID]);
	mysql_tquery(m_Handle, query);

	Faction_Save(id);
	return 1;
}

Server:OnApplicationCheck(playerid, race_check)
{
	if(race_check != g_MysqlRaceCheck[playerid])
 	{
		SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Hata oluþtu, lütfen tekrar giriþ yapýnýz.");
 	    KickEx(playerid);
 	    return 1;
 	}

	if(!cache_num_rows())
	{
		SendErrorMessage(playerid, "%s geçerli bir baþvuru bekleyen karakter adý deðil.", ReturnName(playerid));
		SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Giriþ yapmak için bir karakter adý deðil, (ana) hesap adýnýzý kullandýðýnýzdan emin olun!");
		SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Bir hesap oluþturmak için lütfen https://lss-roleplay.com adresini ziyaret edin.");
		KickEx(playerid);
		return 1;
	}

	cache_get_value_name_int(0, "id", PlayerData[playerid][pSQLID]);
	cache_get_value_name_int(0, "accountid", AccountData[playerid][mSQLID]);

	LoadLoginDialogApp(playerid);
	return 1;
}

Server:OnAccountLoginApp(playerid)
{
	if(!cache_num_rows())
	{
		if(GetPVarInt(playerid, "LA") == 1)
		{
			SendClientMessage(playerid, COLOR_ADM, "HATA: {FFFFFF}Þifre denemesinde birden fazla kez baþarýsýz oldunuz.");
			KickEx(playerid);
			return 1;
		}

		LoadLoginDialogApp(playerid, sprintf("{FF0000}Hatalý þifre girdin, kalan deneme: %i.", (GetPVarInt(playerid, "LA")-1)));
		SetPVarInt(playerid, "LA", GetPVarInt(playerid, "LA") - 1);
	    return 1;
	}

	SendClientMessageEx(playerid, COLOR_WHITE, "SERVER: Hoþgeldin %s.", ReturnName(playerid, 0));
	SendClientMessage(playerid, COLOR_ADM, "NOT: Bir baþvuru oluþturana ve karakter baþvurun kabul edilene kadar oynayamayacaksýn.");
	SendClientMessage(playerid, COLOR_ADM, "ZIYARET ET: ucp.lss-roleplay.com");
	SendClientMessage(playerid, COLOR_ADM, "Karakter baþvurun henüz kabul edilmedi!");
	SendClientMessage(playerid, COLOR_ADM, "Saygýlarýmýzla, LSS-RP Yönetim Ekibi.");

	new query[354];
	mysql_format(m_Handle, query, sizeof(query), "UPDATE accounts SET reg_hwid = '%e', last_game_time = %i, last_game_ip = '%e' WHERE id = %i", ReturnGPCI(playerid), Time(), ReturnIP(playerid), AccountData[playerid][mSQLID]);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET IsLogged = 1, LastIP = %i, HWID = '%e' WHERE id = %i", ReturnIP(playerid), ReturnGPCI(playerid), PlayerData[playerid][pSQLID]);
	mysql_tquery(m_Handle, query);

	KickEx(playerid);
	return 1;
}

Server:OnAccountCheck(playerid, race_check)
{
	if(race_check != g_MysqlRaceCheck[playerid])
 	{
		SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Hata oluþtu, lütfen tekrar giriþ yapýnýz.");
 	    KickEx(playerid);
 	    return 1;
 	}

	if(!cache_num_rows())
	{
		SendErrorMessage(playerid, "%s geçerli bir hesap adý deðil.", ReturnName(playerid));
		SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Giriþ yapmak için bir karakter adý deðil, (ana) hesap adýnýzý kullandýðýnýzdan emin olun!");
		SendClientMessage(playerid, COLOR_ADM, "[ ! ] {FFFFFF}Bir hesap oluþturmak için lütfen https://lss-roleplay.com adresini ziyaret edin.");
		KickEx(playerid);
		return 1;
	}

	new active_id;
	cache_get_value_name_int(0, "active_id", active_id);

	cache_get_value_name_int(0, "id", AccountData[playerid][mSQLID]);

	cache_get_value_name_int(0, "adminlevel", PlayerData[playerid][pAdmin]);
	cache_get_value_name(0, "name", PlayerData[playerid][pAdminName]);

	cache_get_value_name_int(0, "testerlevel", PlayerData[playerid][pTester]);
	cache_get_value_name(0, "name", PlayerData[playerid][pTesterName]);

	new query[125];
	mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM bans WHERE ban_ip = '%e' AND active = 1 OR ban_accountid = %i AND active = 1", ReturnIP(playerid), AccountData[playerid][mSQLID]);
	mysql_tquery(m_Handle, query, "OnAttemptLogin", "i", playerid);
	return 1;
}

Server:OnAttemptLogin(playerid)
{
	if(cache_num_rows())
	{
		new char_name[25], reason[35];
		cache_get_value_name(0, "ban_name", char_name, sizeof(char_name));
		cache_get_value_name(0, "reason", reason, sizeof(reason));

	    SendClientMessageEx(playerid, COLOR_RED, "SERVER: %s isimli karakteriniz %s sebebiyle sunucudan yasaklý.", char_name, reason);
		SendClientMessage(playerid, COLOR_GREY, "SERVER: Hatalý yasaklanmalar için forumdan konu açabilirsiniz.");
		KickEx(playerid);
	    return 1;
	}

	LoadLoginDialog(playerid);
	return 1;
}

Server:OnAccountLogin(playerid)
{
	if(!cache_num_rows())
	{
		if(GetPVarInt(playerid, "LA") == 1)
		{
			SendClientMessage(playerid, COLOR_ADM, "HATA: {FFFFFF}Þifre denemesinde birden fazla kez baþarýsýz oldunuz.");
			KickEx(playerid);
			return 1;
		}

		LoadLoginDialog(playerid, sprintf("{FF0000}Hatalý þifre girdin, kalan deneme: %i.", (GetPVarInt(playerid, "LA")-1)));
		SetPVarInt(playerid, "LA", GetPVarInt(playerid, "LA") - 1);
	    return 1;
	}

	cache_get_value_name(0, "last_game_ip", AccountData[playerid][mLastIP], 16);

	/*if(strcmp(ReturnIP(playerid), AccountData[playerid][mLastIP]))
	{
		Dialog_Show(playerid, SECRETWORD, DIALOG_STYLE_PASSWORD, "Los Santos Roleplay: Hoþ Geldin!",
		"{FF6347}GÜVENLÝK ÖNLEMÝ:\n\n\
		{FFFFFF}Sistemimiz, hesap baðlantý koþullarýnýzdaki deðiþiklikleri algýladý.\n\
		Güvenliðinizin ihlal edilmediðinden emin olmak ve oturuma devam etmek için\n\
		kayýt sýrasýnda seçtiðiniz {FF6347}GÜVENLÝK KELÝMESÝNÝ {FFFFFF}girin.", "Tamam", "Ýptal");
		return 1;
	}*/

	new query[185+11+11+1];
	mysql_format(m_Handle, query, sizeof(query), "UPDATE accounts SET last_game_time = %i, last_game_ip = '%e' WHERE id = %i", Time(), ReturnIP(playerid), AccountData[playerid][mSQLID]);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "SELECT players.*, accounts.active_id FROM players INNER JOIN accounts ON accounts.id = players.accountid WHERE accounts.active_id != 0 AND players.AccountStatus = 1 AND accounts.id = %i", AccountData[playerid][mSQLID]);
	mysql_tquery(m_Handle, query, "OnCharacterList", "i", playerid);
	return 1;
}

Server:OnAccountLoginConfirm(playerid)
{
	if(!cache_num_rows())
	{
		SendClientMessage(playerid, COLOR_ADM, "SERVER: Güvenlik kelimesini hatalý girdiðin için atýldýn.");
		KickEx(playerid);
		return 1;
	}

	new query[185+11+11+1];
	mysql_format(m_Handle, query, sizeof(query), "UPDATE accounts SET last_game_time = %i, last_game_ip = '%e' WHERE id = %i", Time(), ReturnIP(playerid), AccountData[playerid][mSQLID]);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "SELECT players.*, accounts.active_id FROM players INNER JOIN accounts ON accounts.id = players.accountid WHERE accounts.active_id != 0 AND players.AccountStatus = 1 AND accounts.id = %i", AccountData[playerid][mSQLID]);
	mysql_tquery(m_Handle, query, "OnCharacterList", "i", playerid);

	SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Teþekkürler, sunucu ile olan baðlantýn doðrulandý.");
	return 1;
}

Server:BanCheck(playerid)
{
	new rows;
	cache_get_row_count(rows);
	if(rows)
	{
		SendErrorMessage(playerid, "Sunucudan yasaklanmýþ görünüyorsun. Eðer hatalý bir yasaklama olduðunu düþünüyorsan forum üzerinden temyiz konusu açabilirsin.");
		KickEx(playerid);
	}
}

Server:OnCharacterList(playerid)
{
	if(!cache_num_rows())
	{
		SendClientMessage(playerid, COLOR_GREY, "SERVER: Aktif bir karakterin bulunamadý.");
		KickEx(playerid);
		return 1;
	}

	new Float: base_x = 244.000000,
		Float: base_y = 131.000000,
		Float: base_name_x = 246.000000,
		Float: base_name_y = 135.000000;

	new names[3][24], levels[3], skins[3];

	for (new i = 0, j = cache_num_rows(); i < j; i ++)
	{
		cache_get_value_name_int(i, "id", CharacterHolder[playerid][i]);

		cache_get_value_name(i, "Name", names[i], 24);
		cache_get_value_name_int(i, "Level", levels[i]);
		cache_get_value_name_int(i, "Skin", skins[i]);

		switch(i)
		{
			case 1: base_x = 74.000000, base_name_x = 76.000000;
			case 2: base_x = 415.000000, base_name_x = 417.000000;
		}

		Character_Preview[playerid][i] = CreatePlayerTextDraw(playerid, base_x, base_y, "_");
	    PlayerTextDrawLetterSize(playerid, Character_Preview[playerid][i], 0.600000, 2.000000);
	    //PlayerTextDrawTextSize(playerid, Character_Preview[playerid][i], 152.000000, 170.000000);
	    PlayerTextDrawTextSize(playerid, Character_Preview[playerid][i], 152.000000, 170.000000);
	    PlayerTextDrawAlignment(playerid, Character_Preview[playerid][i], 1);
	    PlayerTextDrawColor(playerid, Character_Preview[playerid][i], -1);
		PlayerTextDrawSetShadow(playerid, Character_Preview[playerid][i], 0);
		PlayerTextDrawSetOutline(playerid, Character_Preview[playerid][i], 0);
		PlayerTextDrawBackgroundColor(playerid, Character_Preview[playerid][i], 125);
		PlayerTextDrawFont(playerid, Character_Preview[playerid][i], TEXT_DRAW_FONT_MODEL_PREVIEW);
		PlayerTextDrawSetProportional(playerid, Character_Preview[playerid][i], 0);
		PlayerTextDrawSetPreviewModel(playerid, Character_Preview[playerid][i], skins[i]);
		PlayerTextDrawSetPreviewRot(playerid, Character_Preview[playerid][i], -10.000000, 0.000000, -7.000000, 1.099997);
		PlayerTextDrawSetPreviewVehCol(playerid, Character_Preview[playerid][i], 1, 1);
		PlayerTextDrawSetSelectable(playerid, Character_Preview[playerid][i], 1);
	    PlayerTextDrawBoxColor(playerid, Character_Preview[playerid][i], 0);
		PlayerTextDrawUseBox(playerid, Character_Preview[playerid][i], 0);
	    PlayerTextDrawShow(playerid, Character_Preview[playerid][i]);

		Character_Preview_Name[playerid][i] = CreatePlayerTextDraw(playerid, base_name_x, base_name_y, sprintf("%s~n~Level_%i", names[i], levels[i]));
		PlayerTextDrawFont(playerid, Character_Preview_Name[playerid][i], 1);
		PlayerTextDrawLetterSize(playerid, Character_Preview_Name[playerid][i], 0.200000, 1.000000);
		PlayerTextDrawTextSize(playerid, Character_Preview_Name[playerid][i], 400.000000, 17.000000);
		PlayerTextDrawSetOutline(playerid, Character_Preview_Name[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, Character_Preview_Name[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, Character_Preview_Name[playerid][i], 1);
		PlayerTextDrawColor(playerid, Character_Preview_Name[playerid][i], -1);
		PlayerTextDrawBackgroundColor(playerid, Character_Preview_Name[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, Character_Preview_Name[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, Character_Preview_Name[playerid][i], 0);
		PlayerTextDrawSetProportional(playerid, Character_Preview_Name[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, Character_Preview_Name[playerid][i], 0);
		PlayerTextDrawShow(playerid, Character_Preview_Name[playerid][i]);
	}


	SelectTextDraw(playerid, COLOR_GREY);
	return 1;
}

/*
Server:OnWeaponsUpdate()
{
	foreach(new i : Player)
	{
		if(!pLoggedIn[i]) continue;
		if(!Player_HasWeapons(i)) continue;
		if(NetStats_GetConnectedTime(i) - PlayerConnectionTick[i] < 300) continue;
		if(gettime() - PlayerData[i][pPauseWepAC] < 4 && PlayerData[i][pPauseWepAC] != 0) continue;

		for (new w = 0; w < 4; w++)
		{
			new idx = Weapon_GetSlotID(PlayerData[i][pWeapons][w]);
			if(PlayerData[i][pWeapons][w] != 0 && PlayerData[i][pWeaponsAmmo][w] > 0)
			{
				AntiCheatGetWeaponData(i, idx, PlayerData[i][pWeapons][w], PlayerData[i][pWeaponsAmmo][w]);
			}

			if(PlayerData[i][pWeapons][w] != 0 && PlayerData[i][pWeaponsAmmo][w] <= 0)
			{
				PlayerData[i][pWeapons][w] = PlayerData[i][pWeaponsAmmo][w] = 0;
				SetPlayerArmedWeapon(i, 0);
			}
		}

		return 1;
	}
	return 1;
}
*/

/*

Server:OnPlayerPurchaseWeapon(playerid, response, weaponid, ammo, price)
{
	if( response ) {

		if(IsPlayerInBusiness(playerid))
		{
			BusinessData[IsPlayerInBusiness(playerid)][BusinessCashbox]+= price;
		}

		GiveMoney(playerid, -price);
		GivePlayerWeaponEx(playerid, weaponid, ammo, WEAPON_AMMUNATION_GIVEN);

		new
			string[128]
		;

		format(string, sizeof(string), "Bought %s (%d) for $%s", ReturnWeaponName(weaponid), ammo, MoneyFormat(price));
		LogPlayerAction(playerid, string);

		format(string, sizeof(string), "%s bought %s and %d ammo", ReturnName(playerid, 1), ReturnWeaponName(weaponid), ammo);
		adminWarn(1, string);

		//WriteLog("weapon_logs/ammunation/buygun.txt", "[%s] %s bought %s and %d ammo", ReturnDate(), ReturnName(playerid, 1), ReturnWeaponName(weaponid), ammo);
	}
	else return SendClientMessage(playerid, COLOR_DARKGREEN, "You cancelled your purchase!");
	return true;
}

Server:OnPlayerPurchaseArmor(playerid, response, price)
{
	if( response ){
		if(IsPlayerInBusiness(playerid))
		{
			BusinessData[IsPlayerInBusiness(playerid)][BusinessCashbox]+= price;
		}

		GiveMoney(playerid, -price);
		SetPlayerArmour(playerid, 50);
		new
			string[128]
		;

		format(string, sizeof(string), "Bought Armor $%s", MoneyFormat(price));
		LogPlayerAction(playerid, string);

		format(string, sizeof(string), "%s bought Armor for $%s", ReturnName(playerid, 1), MoneyFormat(price));
		adminWarn(1, string);

		//WriteLog("weapon_logs/ammunation/buykevlar_log.txt", "[%s] %s bought Armor for $%s", ReturnDate(), ReturnName(playerid, 1), MoneyFormat(price));
	}
	else return SendClientMessage(playerid, COLOR_DARKGREEN, "You cancelled your purchase!");
	return true;
}

Server:OnPlayerPurchaseAmmo(playerid, response, weaponid, ammo, price)
{
	if ( response ) {

		new currAmmo;

		SendClientMessage(playerid, COLOR_DARKGREEN, "You bought ammo. Enjoy your purchase!");

		if ( weaponid == WEAPON_COLT45 ) {
			currAmmo = ReturnWeaponAmmo(playerid, WEAPON_COLT45);
			GiveMoney(playerid, -price);

			SetPlayerAmmo(playerid, WEAPON_COLT45, ammo + currAmmo);
		}
		else if ( weaponid == WEAPON_DEAGLE ) {

			currAmmo = ReturnWeaponAmmo(playerid, WEAPON_DEAGLE);
			GiveMoney(playerid, -price);

			SetPlayerAmmo(playerid, WEAPON_DEAGLE, ammo + currAmmo);
		}
		else if ( weaponid == WEAPON_SHOTGUN ) {
			currAmmo = ReturnWeaponAmmo(playerid, WEAPON_SHOTGUN);
			GiveMoney(playerid, -price);

			SetPlayerAmmo(playerid, WEAPON_SHOTGUN, ammo + currAmmo);
		}
		else if ( weaponid == WEAPON_RIFLE ) {
			currAmmo = ReturnWeaponAmmo(playerid, WEAPON_RIFLE);
			GiveMoney(playerid, -price);

			SetPlayerAmmo(playerid, WEAPON_RIFLE, ammo + currAmmo);
		}

		new string[128];

		format(string, sizeof(string), "Bought %d Ammo for %s (%d) for $%s", ammo, ReturnWeaponName(weaponid), currAmmo, MoneyFormat(price));
		LogPlayerAction(playerid, string);

		//WriteLog("weapon_logs/ammunation/buyammo_log.txt", "[%s] %s bought %d Ammo for %s [Price: $%s]", ReturnDate(), ReturnName(playerid), ammo, ReturnWeaponName(weaponid), MoneyFormat(price));
	}
	else return SendClientMessage(playerid, COLOR_DARKGREEN, "You cancelled your purchase!");
	return true;
}
*/

Server:OnPropertyCreated(id)
{
	PropertyData[id][PropertyID] = cache_insert_id();
	Property_Save(id);
	return 1;
}

Server:AddWeaponToProperty(playerid, prop_id, slot, weapid, ammo)
{
	cmd_ame(playerid, sprintf("evin içerisine %s koyar.", ReturnWeaponName(weapid)));

	Player_RemoveWeapon(playerid, weapid);
	PlayerData[playerid][pWeaponsAmmo][ Weapon_GetSlotID(weapid) ] = 0;
	PlayerData[playerid][pWeapons][ Weapon_GetSlotID(weapid) ] = 0;
	//RemovePlayerWeapon(playerid, weapid);

    property_weap_data[prop_id][slot][data_id] = cache_insert_id();
    property_weap_data[prop_id][slot][prop_wep] = weapid;
    property_weap_data[prop_id][slot][prop_ammo] = ammo;
    property_weap_data[prop_id][slot][is_exist] = true;
    property_weap_data[prop_id][slot][property_id] = prop_id;
	return 1;
}

Server:OnBusinessCreated(id)
{
	BusinessData[id][BusinessID] = cache_insert_id();
	Business_Save(id);
	return 1;
}

Server:Dosign_Clear(id)
{
	KillTimer(DosignData[id][DosignTimer]); DosignData[id][DosignTimer] = -1;
	if(IsValidDynamic3DTextLabel(DosignData[id][DosignLabel])) DestroyDynamic3DTextLabel(DosignData[id][DosignLabel]);
	DosignData[id][DosignPos][0] = DosignData[id][DosignPos][1] = DosignData[id][DosignPos][2] = 0.0;
	Iter_Remove(Dosigns, id);
	return 1;
}

Server:SQL_FurnitureMainList(playerid)
{
	if(!IsPlayerConnected(playerid)) {
        return 0;
    }

    new rows = cache_num_rows();
    if(!rows) {
    	return 0;
    }

	new
		sub_str[40], primary_str[256], cat_name[26];

	for(new i; i < rows; ++i)
	{
		cache_get_value_name(i, "CategoryName", cat_name, 26);
		format(sub_str, sizeof(sub_str), "%s\n", cat_name);
		strcat(primary_str, sub_str);
	}

    Dialog_Show(playerid, FURNITURE_CATEGORIES, DIALOG_STYLE_LIST, "Kategoriler:", primary_str, "Seç", "<<<");
	return 1;
}

Server:SQL_FurnitureSubList(playerid)
{
	if(!IsPlayerConnected(playerid)) {
        return 0;
    }

    new rows = cache_num_rows();
    if(!rows) {
    	return 0;
    }

	new
		sub_str[40], primary_str[256], sub_name[45];

	for(new i; i < rows; ++i)
	{
		cache_get_value_name(i, "SubCategoryName", sub_name, 45);
		format(sub_str, sizeof(sub_str), "%s\n", sub_name);
		strcat(primary_str, sub_str);
	}

    Dialog_Show(playerid, FURNITURE_SUBCATEGORY, DIALOG_STYLE_LIST, "Kategoriler:", primary_str, "Seç", "<<<");
	return 1;
}

Server:SQL_FurnitureSubAltList(playerid)
{
	if(!IsPlayerConnected(playerid)) {
        return 0;
    }

    new rows = cache_num_rows();
    if(!rows) {
    	return 0;
    }

	new
		primary_str[1424], objname[64], objprice;

	for(new i; i < rows; ++i)
	{
		cache_get_value_name(i, "ObjName", objname, 64);
		cache_get_value_name_int(i, "ObjPrice", objprice);
		format(primary_str, sizeof(primary_str), "%s%s\t{33AA33}$%s\n", primary_str, objname, MoneyFormat(objprice));
	}

    Dialog_Show(playerid, FURNITURE_SUBALTCATEGORY, DIALOG_STYLE_TABLIST, "Mobilyalar:", primary_str, "Seç", "<<<");
	return 1;
}

Server:SQL_FurnitureList(playerid, page)
{
	if(!IsPlayerConnected(playerid)) {
        return 0;
    }

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

    new rows = cache_num_rows();
    if(!rows) {
    	Dialog_Show(playerid, FURNITURE_NO_LIST, DIALOG_STYLE_LIST, sprintf("Mevcut Mobilyalar(%s%i{FFFFFF})", rows ? "{33AA33}" : "{FF6347}", rows), "Hiç mobilyan yok.", "Seç", "<<<");
        return 1;
    }

	new primary_str[1024], furniture_name[64];

	for(new i; i < rows; ++i)
	{
		cache_get_value_name_int(i, "id", FurnitureHolder[playerid][i][0]);

		if(PlayerData[playerid][pHouseFurniture] != -1)
		{
			cache_get_value_name_int(i, "PropertyID", FurnitureHolder[playerid][i][1]);
		}
		else if(PlayerData[playerid][pBizFurniture] != -1)
		{
			cache_get_value_name_int(i, "BusinessID", FurnitureHolder[playerid][i][1]);
		}
		cache_get_value_name_int(i, "FurnitureID", FurnitureHolder[playerid][i][2]);
		cache_get_value_name(i, "FurnitureName", furniture_name, 64);

		format(primary_str, sizeof(primary_str), "%sSlot %i. %s\n", primary_str, i+1, furniture_name);
	}

	strcat(primary_str, "{FFFF00}*Seçerek Mobilya Düzenle(Pasif)*");
	if(page != 0) strcat(primary_str, "{FFFF00}<<\n");
	if(rows >= MAX_CLOTHING_SHOW) strcat(primary_str, "{FFFF00}>>");

	Dialog_Show(playerid, FURNITURE_LIST, DIALOG_STYLE_LIST, sprintf("Mevcut Mobilyalar(%s%i{FFFFFF})", rows ? "{33AA33}" : "{FF6347}", rows), primary_str, "Seç", "<<<");
	return 1;
}

Server:Drop_DrugRemove(id)
{
	if(IsValidDynamicObject(DropData[id][DropObjID])) {
		DestroyDynamicObject(DropData[id][DropObjID]);
	}

	KillTimer(DropData[id][DropTimer]);
	DropData[id][DropTimer] = -1;

	DropData[id][DropType] = 0;
	DropData[id][DropWeaponID] = DropData[id][DropWeaponAmmo] = 0;

	DropData[id][DropDrugAmount] = 0.0;
	DropData[id][DropType] = DropData[id][DropDrugID] = 0;
	DropData[id][DropDrugQuality] = DropData[id][DropDrugSize] = 0;
	format(DropData[id][DropDrugName], 64, "");

	for(new i = 0; i < 3; i++) DropData[id][DropLocation][i] = 0.0;
	DropData[id][DropInterior] = 0;
	DropData[id][DropWorld] = 0;
	DropData[id][DroppedBy] = 0;

	Iter_Remove(Drops, id);
	return 1;
}

Server:Player_HealUp(playerid, amount)
{
	if(PlayerData[playerid][pDrugLoop] > 3)
	{
		KillTimer(PlayerData[playerid][pDrugTimer]);
		PlayerData[playerid][pDrugTimer] = -1;
		return 1;
	}

	if(GetPlayerInterior(playerid) != GetPVarInt(playerid, "drug_int"))
	{
		KillTimer(PlayerData[playerid][pDrugTimer]);
		PlayerData[playerid][pDrugTimer] = -1;
		return 1;
	}

	if(PlayerData[playerid][pMaxHealth] > 200)
	{
		KillTimer(PlayerData[playerid][pDrugTimer]);
		PlayerData[playerid][pDrugTimer] = -1;
		return 1;
	}

	PlayerData[playerid][pDrugLoop]++;
	PlayerData[playerid][pMaxHealth] += amount;

	new Float: hp;
	GetPlayerHealth(playerid, hp);
	new sonuc = (floatround(hp) + amount >= 100) ? 100 : floatround(hp) + amount;
	SetPlayerHealth(playerid, sonuc);
	return 1;
}

Server:Drop_GunRemove(id)
{
	if(IsValidDynamicObject(DropData[id][DropObjID])) {
		DestroyDynamicObject(DropData[id][DropObjID]);
	}

	KillTimer(DropData[id][DropTimer]);
	DropData[id][DropTimer] = -1;

	DropData[id][DropType] = 0;
	DropData[id][DropWeaponID] = DropData[id][DropWeaponAmmo] = 0;

	DropData[id][DropDrugAmount] = 0.0;
	DropData[id][DropType] = DropData[id][DropDrugID] = 0;
	DropData[id][DropDrugQuality] = DropData[id][DropDrugSize] = 0;
	format(DropData[id][DropDrugName], 64, "");

	for(new i = 0; i < 3; i++) DropData[id][DropLocation][i] = 0.0;
	DropData[id][DropInterior] = 0;
	DropData[id][DropWorld] = 0;
	DropData[id][DroppedBy] = 0;

	Iter_Remove(Drops, id);
	return 1;
}

Server:AddWeaponToTrunk(playerid, vehicleid, slot, weapon, ammo)
{
	//if(!vehicle_weap_data[vehicleid][slot][data_id]) return 1;

    vehicle_weap_data[vehicleid][slot][data_id] = cache_insert_id();
    vehicle_weap_data[vehicleid][slot][veh_wep] = weapon;
    vehicle_weap_data[vehicleid][slot][veh_ammo] = ammo;
    vehicle_weap_data[vehicleid][slot][is_exist] = true;
    vehicle_weap_data[vehicleid][slot][veh_id] = CarData[vehicleid][carID];

	for(new i = 0; i < 6; i++) vehicle_weap_data[vehicleid][slot][wep_offset][i] = 0.0;

	new Float: player_pos[3];
	GetPlayerPos(playerid, player_pos[0], player_pos[1], player_pos[2]);

    SetPVarInt(playerid, "getVehicleID", vehicleid);
    SetPVarInt(playerid, "getSlot", slot);
    EditingObject[playerid] = 7;

    vehicle_weap_data[vehicleid][slot][temp_object] = CreateDynamicObject(ReturnWeaponsModel(weapon), player_pos[0], player_pos[1], player_pos[2], 0, 0, 0);
	EditDynamicObject(playerid, vehicle_weap_data[vehicleid][slot][temp_object]);

	Player_RemoveWeapon(playerid, weapon);
	PlayerData[playerid][pWeaponsAmmo][ Weapon_GetSlotID(weapon) ] = 0;
	PlayerData[playerid][pWeapons][ Weapon_GetSlotID(weapon) ] = 0;
	//RemovePlayerWeapon(playerid, weapon);

	SendClientMessage(playerid, COLOR_ADM, "[!] {FFFFFF}W{FF6347} veya {FFFFFF}SPACE{FF6347} tuþlarýna basarak kamerayý çevirebilirsin.");
    cmd_ame(playerid, sprintf("%s model araca %s koyar.", ReturnVehicleName(vehicleid), ReturnWeaponName(weapon)));
	return 1;
}

Server:OnPlayerPayFine(playerid, response, index)
{
	if(response)
	{
		if(PlayerData[playerid][pMoney] < Fines[playerid][index][fine_amount]) {
			return SendErrorMessage(playerid, "Bu cezayý ödemek için yeterli paran yok.");
		}

		new query[50];
		mysql_format(m_Handle, query, sizeof(query), "DELETE FROM player_fines WHERE id = %i", Fines[playerid][index][fine_id]);
		new Cache: cache = mysql_query(m_Handle, query); GiveMoney(playerid, -Fines[playerid][index][fine_amount]);
		SendClientMessageEx(playerid, COLOR_ADM, "SERVER: %s tarihi itibariyle $%s miktarýnda ceza ödedin.", GetFullTime(Time()), MoneyFormat(Fines[playerid][index][fine_amount]));
		FactionData[Fines[playerid][index][fine_faction]][FactionBank]+= Fines[playerid][index][fine_amount];
		Fines[playerid][index][fine_faction] = 0;
		Fines[playerid][index][fine_amount] = 0;
		Fines[playerid][index][fine_id] = 0;
		cache_delete(cache);
	}
	return 1;
}

Server:OnVehicleFinesCleared(vehicleid)
{
	for(new i = 0; i < MAX_FINES; i++) if(VehicleFines[vehicleid][i][fine_id])
		FactionData[VehicleFines[vehicleid][i][fine_faction]][FactionBank]+= VehicleFines[vehicleid][i][fine_amount];

	for(new i = 0; i < MAX_FINES; i++) if(VehicleFines[vehicleid][i][fine_id])
	{
		VehicleFines[vehicleid][i][fine_id] = 0;
		VehicleFines[vehicleid][i][fine_amount] = 0;
		VehicleFines[vehicleid][i][fine_faction] = 0;
	}
	return 1;
}

/*
Server:OnOfflineUninvite(playerid, response, dbid)
{
	if(response)
	{
		new removeQuery[200];

		mysql_format(m_Handle, removeQuery, sizeof removeQuery, "UPDATE players SET Faction = 0, FactionRank = 0 WHERE id = %i", dbid);
		mysql_tquery(m_Handle, removeQuery, "OnOfflineRemove", "ii", playerid, dbid);
	}
	return 1;
}

Server:OnOfflineRemove(playerid, dbid)
{
	Message(playerid, COLOR_ADM, "-> %s adlý kiþiyi baþarýyla birlikten çýkardýn.", ReturnSQLName(dbid));
	return 1;
}*/

Server:OnAdvertPublish(id)
{
	AdvertData[id][PublishTime] = AdvertData[id][PublishTime] - 1;

	if(AdvertData[id][PublishTime] <= 0)
    {
		switch(AdvertData[id][AdvertType])
		{
			case 1:
			{
				foreach(new i : Player) {
					if(PlayerData[i][pNewss] == true)
					{
						if(strlen(AdvertData[id][AdvertText]) > 80)
						{
							SendClientMessageEx(i, COLOR_DARKGREEN, "[Reklam] %.80s ...", AdvertData[id][AdvertText]);
							SendClientMessageEx(i, COLOR_DARKGREEN, "[Reklam] ...%s, Tel: [%i]", AdvertData[id][AdvertText][80], AdvertData[id][AdvertContact]);
						}
						else SendClientMessageEx(i, COLOR_DARKGREEN, "[Reklam] %s, Tel: [%i]", AdvertData[id][AdvertText], AdvertData[id][AdvertContact]);
					}
				}
			}
			case 2:
			{
				foreach(new i : Player) {
					if(PlayerData[i][pNewss] == true)
					{
						if(strlen(AdvertData[id][AdvertText]) > 80)
						{
							SendClientMessageEx(i, COLOR_DARKGREEN, "[Þirket Reklamý] %.80s ...", AdvertData[id][AdvertText]);
							SendClientMessageEx(i, COLOR_DARKGREEN, "[Þirket Reklamý] ...%s", AdvertData[id][AdvertText][80]);
						}
						else SendClientMessageEx(i, COLOR_DARKGREEN, "[Þirket Reklamý] %s", AdvertData[id][AdvertText]);
					}
				}
			}
		}

		Advert_Clear(id);
	}
}

Server:DestroyVME(playerid)
{
    Delete3DTextLabel(VME[playerid]);
    if(IsPlayerConnected(playerid)) KillTimer(TimerVME[playerid]), HaveVME[playerid] = 0;
    return 1;
}


Server:SQL_ClothingList(playerid, page)
{
	if(!IsPlayerConnected(playerid)) {
        return 0;
    }

    if(!cache_num_rows()) {
        return 0;
    }

	new bool: secondPage, count;
	new primary_str[1400], sub_str[400];

	new secPage = page;
	SetPVarInt(playerid, "clothing_idx", page);

	page--;

	strcat(primary_str, "#\tÝsim\tFiyat\n");

	new id, clothing_name[32], price;

	for(new i = page*MAX_CLOTHING_SHOW, j = cache_num_rows(); i < j; i++)
	{
		count++;

		if(count == MAX_CLOTHING_SHOW + 1)
		{
			secondPage = true;
			break;
		}
		else
		{
			cache_get_value_name_int(i, "id", id);
	        cache_get_value_name_int(i, "clothing_price", price);
	        cache_get_value_name(i, "clothing_name", clothing_name, sizeof(clothing_name));

			format(sub_str, sizeof(sub_str), "{FFFFFF}%i\t%s\t{33AA33}$%s\n", id, clothing_name, MoneyFormat(price));
			strcat(primary_str, sub_str);
		}
	}

	if(secPage != 1)
		format(primary_str, 1110, "%s{FFFF00}Önceki Sayfa <<\n", primary_str);

	if(secondPage)
		format(primary_str, 1110, "%s{FFFF00}Sonraki Sayfa >>\n", primary_str);

	Dialog_Show(playerid, ACCESSORY_LIST, DIALOG_STYLE_TABLIST_HEADERS, "Aksesuar Listesi", primary_str, "Tamam", "<< Kapat");
	return 1;
}

Server:SQL_FactionList(playerid, page)
{
	if(!IsPlayerConnected(playerid)) {
        return 0;
    }

    new rows = cache_num_rows();
    if(!rows) {
        return SendClientMessage(playerid, COLOR_ADM, "SERVER: Hiç birlik eklenmemiþ.");
    }

	new
		id, primary_str[1024], sub[1024];


	for(new i; i < rows; ++i)
	{
			cache_get_value_name_int(i, "id", id);
			format(sub, sizeof(sub), "{7E98B6}%i\t{7E98B6}%s\t{7E98B6}[%d / %i]\n", i, ReturnSQLFactionName(i), CountOnlineMembers(i), CountFactionMembers(i)); //  [%i / %i] CountOnlineMembers(id), CountFactionMembers(id)
	    strcat(primary_str, sub);
	}

	if(page != 0) strcat(primary_str, "{FFFF00}Önceki Sayfa <<\n");
	if(rows >= MAX_CLOTHING_SHOW) strcat(primary_str, "{FFFF00}Sonraki Sayfa >>");

	Dialog_Show(playerid, FACTION_LIST, DIALOG_STYLE_TABLIST, "Birlikler", primary_str, ">>>", "");
	return 1;
}

Server:SQL_FactionMemberList(playerid, page)
{
	if(!IsPlayerConnected(playerid)) {
        return 0;
    }

    new rows = cache_num_rows();
    if(!rows) {
        return SendClientMessage(playerid, COLOR_ADM, "SERVER: Hiç birlik üyesi bulunamadý.");
    }

	new
		bool: is_online = false, last_conn, Faction_rank, Faction_name[128], primary_str[1024];

	for(new i; i < rows; ++i)
	{
		cache_get_value_name_int(i, "LastTime", last_conn);
		cache_get_value_name_int(i, "FactionRank", Faction_rank);
		cache_get_value_name(i, "Name", Faction_name, sizeof(Faction_name));
		foreach(new g : Player) if(strcmp(ReturnName(g), Faction_name, true)) is_online = false;
		format(primary_str, sizeof(primary_str), "%s%s%s\t%s\t%s\n", primary_str, (is_online != true) ? ("{F81414}") : ("{33AA33}"), Faction_name, FactionRanks[PlayerData[playerid][pFaction]][Faction_rank], GetFullTime(last_conn));
	}

	if(page != 0) strcat(primary_str, "{FFFF00}Önceki Sayfa <<\n");
	if(rows >= MAX_CLOTHING_SHOW) strcat(primary_str, "{FFFF00}Sonraki Sayfa >>");

	Dialog_Show(playerid, Faction_MEMBER_LIST, DIALOG_STYLE_LIST, "Birlik Üyeleri", primary_str, ">>>", "");
	return 1;
}

Server:OnRoadblockDisband(playerid, response, id)
{
	if(response)
	{
	    if(IsValidDynamicObject(RoadblockData[id][RoadblockObject])) DestroyDynamicObject(RoadblockData[id][RoadblockObject]);
		if(IsValidDynamicArea(RoadblockData[id][RoadblockAreaID])) {
	    	Streamer_RemoveArrayData(STREAMER_TYPE_AREA, RoadblockData[id][RoadblockAreaID], E_STREAMER_PLAYER_ID, id);
		    DestroyDynamicArea(RoadblockData[id][RoadblockAreaID]);
		}

		RoadblockData[id][RoadblockSpikes] = false;
		Iter_Remove(Roadblocks, id);
	}
	return 1;
}

Server:KickHouse(playerid, id)
{
	switch (random(6))
	{
	    case 0..2:
	    {
	        SendNearbyMessage(playerid, 30.0, COLOR_EMOTE, "** %s evin kapýsýný kýramaz.", ReturnName(playerid, 0));
		}
		default:
		{
		    PropertyData[id][PropertyLocked] = false;
		    SendNearbyMessage(playerid, 30.0, COLOR_EMOTE, "** %s evin kapýsýný baþarýyla kýrar.", ReturnName(playerid, 0));
		}
	}

	PlayerData[playerid][pKickDoor] = false;
	return 1;
}

Server:KickBusiness(playerid, id)
{
	switch (random(6))
	{
	    case 0..2:
	    {
	        SendNearbyMessage(playerid, 30.0, COLOR_EMOTE, "** %s iþyerinin kapýsýný kýramaz.", ReturnName(playerid, 0));
		}
		default:
		{
		    BusinessData[id][BusinessLocked] = false;
		    SendNearbyMessage(playerid, 30.0, COLOR_EMOTE, "** %s iþyerinin kapýsýný baþarýyla kýrar.", ReturnName(playerid, 0));
		}
	}

	PlayerData[playerid][pKickDoor] = false;
	return 1;
}

Server:KickGarage(playerid, id)
{
	switch (random(6))
	{
	    case 0..2:
	    {
	        SendNearbyMessage(playerid, 30.0, COLOR_EMOTE, "** %s garajýn kapýsýný kýramaz.", ReturnName(playerid, 0));
		}
		default:
		{
		    GarageData[id][GarageLocked] = false;
		    SendNearbyMessage(playerid, 30.0, COLOR_EMOTE, "** %s garajýn kapýsýný baþarýyla kýrar.", ReturnName(playerid, 0));
		}
	}

	PlayerData[playerid][pKickDoor] = false;
	return 1;
}

Server:OnLabelDisband(playerid, response, id)
{
	if(response)
	{
		//SendFDMessage(COLOR_EMT, sprintf("** HQ: %s %s, %s konumundaki yangýn ateþini kaldýrdý! **", Player_GetFactionRank(playerid), ReturnName(playerid, 0), FireData[id][fire_location]));
        SendClientMessage(playerid, -1, "SERVER: {ADC3E7}Bilgi yazýsý {FFFFFF}silindi.");
		Label_Destroy(id);
	}
	return 1;
}

Server:OnFactionAttachmentCreated(playerid)
{
	new id = cache_insert_id();

	SendServerMessage(playerid, "Aksesuar eklendi. Benzersiz numara: %d", id);

	return 1;
}

Server:OnUniformCreated(playerid)
{
	new id = cache_insert_id();

	SendServerMessage(playerid, "Üniforma eklendi. Benzersiz numara: %d", id);

	return 1;
}

Server:SQL_TrunkUniformList(playerid, page)
{
	if(!IsPlayerConnected(playerid)) {
        return 0;
    }

    new rows = cache_num_rows();
    if(!rows) {
        return SendClientMessage(playerid, COLOR_ADM, "SERVER: Hiç üniforma eklenmemiþ.");
    }

	new primary_str[1024], sub_str[64];
	new skin_name[20], id, skin_race, skin_sex;
	strcat(primary_str, "Model\tMilliyet\tCinsiyet\n");

	for(new i; i < rows; ++i)
	{
		cache_get_value_name_int(i, "id", id);
        cache_get_value_name(i, "skin_name", skin_name, sizeof(skin_name));
        cache_get_value_name_int(i, "skin_race", skin_race);
        cache_get_value_name_int(i, "skin_sex", skin_sex);

		format(sub_str, sizeof(sub_str), "%i %s\t%s\t%s\n", id, skin_name, Uniform_GetRace(skin_race), Uniform_GetSex(skin_sex));
		strcat(primary_str, sub_str);
	}

	if(page != 0) strcat(primary_str, "{FFFF00}Önceki Sayfa <<\n");
	if(rows >= MAX_CLOTHING_SHOW) strcat(primary_str, "{FFFF00}Sonraki Sayfa >>");

	Dialog_Show(playerid, TRUNKUNIFORM_LIST, DIALOG_STYLE_TABLIST_HEADERS, "Üniforma Seç", primary_str, "Seç", "Kapat");
	return 1;
}

Server:SQL_UniformList(playerid, page)
{
	if(!IsPlayerConnected(playerid)) {
        return 0;
    }

    new rows = cache_num_rows();
    if(!rows) {
        return SendClientMessage(playerid, COLOR_ADM, "SERVER: Hiç üniforma eklenmemiþ.");
    }

	new primary_str[1024], sub_str[64];
	new skin_name[20], id, skin_race, skin_sex;
	strcat(primary_str, "Model\tMilliyet\tCinsiyet\n");

	for(new i; i < rows; ++i)
	{
		cache_get_value_name_int(i, "id", id);
        cache_get_value_name(i, "skin_name", skin_name, sizeof(skin_name));
        cache_get_value_name_int(i, "skin_race", skin_race);
        cache_get_value_name_int(i, "skin_sex", skin_sex);

		format(sub_str, sizeof(sub_str), "%i %s\t%s\t%s\n", id, skin_name, Uniform_GetRace(skin_race), Uniform_GetSex(skin_sex));
		strcat(primary_str, sub_str);
	}

	if(page != 0) strcat(primary_str, "{FFFF00}Önceki Sayfa <<\n");
	if(rows >= MAX_CLOTHING_SHOW) strcat(primary_str, "{FFFF00}Sonraki Sayfa >>");

	Dialog_Show(playerid, UNIFORM_LIST, DIALOG_STYLE_TABLIST_HEADERS, "Üniforma Seç", primary_str, "Seç", "Kapat");
	return 1;
}

Server:SQL_RoadblockList(playerid, page)
{
	if(!IsPlayerConnected(playerid)) {
        return 0;
    }

    new rows = cache_num_rows();
    if(!rows) {
        return SendClientMessage(playerid, COLOR_ADM, "SERVER: Hiç engel eklenmemiþ.");
    }

	new id, roadblock_name[25];
	new primary_str[756], sub_str[64];
	strcat(primary_str, "Model\n");

	for(new i; i < rows; ++i)
	{
		cache_get_value_name_int(i, "id", id);
        cache_get_value_name(i, "RoadblockName", roadblock_name, sizeof(roadblock_name));
		format(sub_str, sizeof(sub_str), "%i %s\n", id, roadblock_name);
		strcat(primary_str, sub_str);
	}

	if(page != 0) strcat(primary_str, "{FFFF00}Önceki Sayfa <<\n");
	if(rows >= MAX_CLOTHING_SHOW) strcat(primary_str, "{FFFF00}Sonraki Sayfa >>");

	Dialog_Show(playerid, ROADBLOCK_LIST, DIALOG_STYLE_TABLIST_HEADERS, "Engel Seç", primary_str, "Seç", "Kapat");
	return 1;
}

Server:SQL_AttachmentList(playerid, page)
{
	if(!IsPlayerConnected(playerid)) {
        return 0;
    }

    new rows = cache_num_rows();
    if(!rows) {
        return SendClientMessage(playerid, COLOR_ADM, "SERVER: Hiç aksesuar eklenmemiþ.");
    }

	new id, att_name[20], att_price;
	new primary_str[756], sub_str[64];
	strcat(primary_str, "Model\tFiyat\n");

	for(new i; i < rows; ++i)
	{
		cache_get_value_name_int(i, "id", id);
        cache_get_value_name(i, "att_name", att_name, sizeof(att_name));
        cache_get_value_name_int(i, "att_price", att_price);

		format(sub_str, sizeof(sub_str), "%i %s\t$%s\n", id, att_name, MoneyFormat(att_price));
		strcat(primary_str, sub_str);
	}

	if(page != 0) strcat(primary_str, "{FFFF00}Önceki Sayfa <<\n");
	if(rows >= MAX_CLOTHING_SHOW) strcat(primary_str, "{FFFF00}Sonraki Sayfa >>");

	Dialog_Show(playerid, ACCESORY_LIST, DIALOG_STYLE_TABLIST_HEADERS, "Aksesuar Seç", primary_str, "Seç", "Kapat");
	return 1;
}

Server:OnFireDisband(playerid, response, id)
{
	if(response)
	{
		SendFDMessage(COLOR_EMT, sprintf("** HQ: %s %s, %s konumundaki yangýn ateþini kaldýrdý! **", Player_GetFactionRank(playerid), ReturnName(playerid, 0), FireData[id][fire_location]));
		Fire_Destroy(id);
	}
	return 1;
}

Server:Mechanic_Count(playerid)
{
	if(GetPVarInt(playerid, "Mechanic_Started") == 0)
	{
		KillTimer(PaintJobTimer[playerid]);
		PaintJobTimer[playerid] = -1;
		return 1;
	}

    new vehicleid = GetPVarInt(playerid, "Mechanic_CarID");

	new Float: x, Float: y, Float: z; GetVehiclePos(vehicleid, x, y, z);
	if(!IsPlayerInRangeOfPoint(playerid, 5.0, x, y, z))
	{
		SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Sprayladýðýn aracýn yakýnýnda deðilsin, iþlem iptal edildi.");
		SetPVarInt(playerid, "Mechanic_Started", 0);
		SetPVarInt(playerid, "Mechanic_CarID", INVALID_VEHICLE_ID);
		SetPVarInt(playerid, "Mechanic_Type", -1);
		KillTimer(PaintJobTimer[playerid]);
		PaintJobTimer[playerid] = -1;
		return 1;
	}

	SetPVarInt(playerid, "Mechanic_Time", GetPVarInt(playerid, "Mechanic_Time") - 1);
	GameTextForPlayer(playerid, sprintf("~r~Islem Yapiliyor~n~~w~%d]", GetPVarInt(playerid, "Mechanic_Time")), 3000, 3);

	if(GetPVarInt(playerid, "Mechanic_Time") <= 0)
	{
		new type = GetPVarInt(playerid, "Mechanic_Type");

		SetPVarInt(playerid, "Mechanic_Started", 0);
		SetPVarInt(playerid, "Mechanic_CarID", INVALID_VEHICLE_ID);
		SetPVarInt(playerid, "Mechanic_Type", -1);
		KillTimer(PaintJobTimer[playerid]);
		PaintJobTimer[playerid] = -1;

		switch(type)
		{
			case 0:
			{
 				SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Ýþini bitirdin, 7 adet tamir parçasý harcadýn!");
				CarData[vehicleid][carColor1] = GetPVarInt(playerid, "Mechanic_Color1"), CarData[vehicleid][carColor2] = GetPVarInt(playerid, "Mechanic_Color2");
				ChangeVehicleColor(vehicleid, CarData[vehicleid][carColor1], CarData[vehicleid][carColor2]), PlayerData[playerid][pComponents] -= 7;
			}
			case 1:
			{
				SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Ýþini bitirdin, 10 adet tamir parçasý harcadýn!");
				RepairVehicle(vehicleid), PlayerData[playerid][pComponents] -= 10;
			}
			case 2:
			{
			    SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Ýþini bitirdin, 15 adet tamir parçasý harcadýn!");
    			RepairVehicle(vehicleid), SetVehicleHealth(vehicleid, CarData[vehicleid][carMaxHealth]);
    			PlayerData[playerid][pComponents] -= 15;
			}
			case 3:
			{
   				SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Ýþini bitirdin, 20 adet tamir parçasý harcayarak motorun gücünü +15.00 arttýrdýn!");
    			CarData[vehicleid][carEngine] += 15.00;
    			PlayerData[playerid][pComponents] -= 20;
			}
			case 4:
			{
				SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Ýþini bitirdin, 20 adet tamir parçasý harcayarak batarya gücünü +15.00 arttýrdýn!");
    			CarData[vehicleid][carBattery] += 15.00;
    			PlayerData[playerid][pComponents] -= 20;
			}
			case 5:
			{
				if(IsValidPlayerCar(vehicleid))
				{
				    CarData[vehicleid][carFuel] += 10;
				}

				SendClientMessage(playerid, COLOR_YELLOW, "SERVER: Ýþini bitirdin, 12 adet tamir parçasý harcayarak +10.00 benzin ekledin!");
				PlayerData[playerid][pComponents] -= 12;
			}
		}
	}
	return 1;
}

Server:InfoTD_MSG(playerid, type, ms_time, text[])
{
	if(GetPVarInt(playerid, "InfoTDshown") != -1)
	{
		switch(type)
		{
			case 1: PlayerTextDrawHide(playerid, PlayerOffer[playerid]);
			case 2: PlayerTextDrawHide(playerid, PlayerOffer2[playerid]);
		}
	    KillTimer(GetPVarInt(playerid, "InfoTDshown"));
	}

	switch(type)
	{
		case 1:
		{
			PlayerTextDrawSetString(playerid, PlayerOffer[playerid], text);
    		PlayerTextDrawShow(playerid, PlayerOffer[playerid]);
		}
		case 2:
		{
			PlayerTextDrawSetString(playerid, PlayerOffer2[playerid], text);
    		PlayerTextDrawShow(playerid, PlayerOffer2[playerid]);
		}
	}

	SetPVarInt(playerid, "InfoTDshown", SetTimerEx("InfoTD_Hide", ms_time, false, "ii", playerid, type));
}

Server:InfoTD_Hide(playerid, type)
{
	SetPVarInt(playerid, "InfoTDshown", -1);
	switch(type)
	{
		case 1: PlayerTextDrawHide(playerid, PlayerOffer[playerid]);
		case 2: PlayerTextDrawHide(playerid, PlayerOffer2[playerid]);
	}
}

Server:OnTaxiCall(playerid)
{
	SendClientMessage(playerid, COLOR_GREY, "[!] Çaðrý cevaplandý.");
	TaxiCallTimer[playerid] = SetTimerEx("OnTaxiCallPickup", 1500, false, "i", playerid);
	return 1;
}

Server:OnTaxiCallPickup(playerid)
{
	SendClientMessage(playerid, COLOR_YELLOW, "Taksi Operatörü (telefon): Merhabalar, nereye gitmek istersiniz?");
	PlayerData[playerid][pCalling] = 0;
	return 1;
}

Server:UpdateTaxiDuration(playerid)
{
	if(!IsPlayerInAnyVehicle(playerid)) {
		EndTaxiFair(playerid);
	}
	else
	{
		new
			driver;

		foreach(new i : Player) if(PlayerData[i][pSQLID] == TaxiDriver[playerid])
			driver = i;


		TaxiPrice[playerid]+= TaxiFair[driver];
		TaxiTotalFair[driver]+= TaxiFair[driver];

		new
			updateStr[90];

		format(updateStr, 90, "%i saniye", gettime() - TaxiDuration[playerid]);
		PlayerTextDrawSetString(playerid, TaxiFair_PTD[playerid][2], updateStr);

		format(updateStr, 90, " $%s", MoneyFormat(TaxiPrice[playerid]));
		PlayerTextDrawSetString(playerid, TaxiFair_PTD[playerid][4], updateStr);

		for(new i = 0; i < 5; i++) PlayerTextDrawShow(playerid, TaxiFair_PTD[playerid][i]);
	}
	return 1;
}

Server:OnTaxiFair(playerid)
{
	new
		updateStr[90],
		hasRiders = false;

	foreach(new i : Player)
	{
		if(i == playerid)
			continue;

		if(IsPlayerInVehicle(i, GetPlayerVehicleID(playerid)) && TaxiDriver[i] == PlayerData[playerid][pSQLID])
		{
			hasRiders = true;
		}
	}

	if(!hasRiders)
	{
		EndTaxiFairDriver(playerid);
		return 1;
	}

	if(!IsPlayerInAnyVehicle(playerid))
	{
		foreach(new i : Player) if(TaxiDriver[i] == PlayerData[playerid][pSQLID])
		{
			SendClientMessage(i, COLOR_YELLOW, "-> Taksi þoförü aracý terketti, tarifen sonra erdi.");
			EndTaxiFair(i);
		}

		SendClientMessage(playerid, COLOR_YELLOW, "-> Araçtan çýkarak tarifeyi sona erdirdin.");
		EndTaxiFairDriver(playerid);
		return 1;
	}

	format(updateStr, 90, "%i saniye", gettime() - TaxiDuration[playerid]);
	PlayerTextDrawSetString(playerid, TaxiFair_PTD[playerid][2], updateStr);

	format(updateStr, 90, " $%s", MoneyFormat(TaxiTotalFair[playerid]));
	PlayerTextDrawSetString(playerid, TaxiFair_PTD[playerid][4], updateStr);

	for(new i = 0; i < 5; i++) PlayerTextDrawShow(playerid, TaxiFair_PTD[playerid][i]);
	return 1;
}

Server:Toll_Close(id)
{
	SetDynamicObjectRot(TollData[id][TollObject], TollData[id][TollPos][3], TollData[id][TollPos][4], TollData[id][TollPos][5]);
	TollData[id][TollStatus] = false;
	return 1;
}

Server:CheckAccount(playerid, race)
{
		ClearLines(playerid, 20);
	  LocalChat(playerid, 20.0, sprintf("*** %s sunucuya giriþ yaptý.", ReturnName(playerid, 1)), COLOR_FADE1);
    new r = random(5);
    switch(r)
    {
        case 0:
        {
					InterpolateCameraPos(playerid,  259.2031, -2099.6387, 86.1498,  473.3414, -1296.8315, 87.7682, 5000);
					InterpolateCameraLookAt(playerid, 259.8386, -2098.8621, 85.9398,  474.3269, -1296.6411, 87.4831, 5000);
            //SetPlayerCameraPos(playerid, 2167.3994, -1929.4813, 99.2635);
            //SetPlayerCameraLookAt(playerid, 2166.7456, -1928.7269, 98.9185);
        }
        case 1:
        {
					InterpolateCameraPos(playerid,  1776.0037, -994.2299, 164.1484,  2021.0088, -1058.0527, 132.7876, 5000);
					InterpolateCameraLookAt(playerid, 1776.9460, -994.5750, 163.9983,  2021.7908, -1058.6815, 132.4825, 5000);
            //SetPlayerCameraPos(playerid, 2113.9004, -1656.2103, 125.1329);
            //SetPlayerCameraLookAt(playerid, 2114.8979, -1656.2430, 124.7529);
        }
        case 2:
        {
					InterpolateCameraPos(playerid,  2877.4587, -2322.0679, 117.2286,  2607.0059, -1904.7582, 135.5179, 5000);
					InterpolateCameraLookAt(playerid, 2876.5881, -2321.5676, 117.0735,  2606.0420, -1905.0396, 135.1027, 5000);
            //SetPlayerCameraPos(playerid, 1189.0391, -1457.4032, 216.9842);
            //SetPlayerCameraLookAt(playerid, 1188.0417, -1457.4248, 216.7842);
        }
				case 3:
				{
					InterpolateCameraPos(playerid,  924.7540, -2655.8618, 48.8208,  1275.5405, -2409.8687, 101.4439, 5000);
					InterpolateCameraLookAt(playerid, 925.5811, -2655.2898, 47.7506,  1276.4098, -2409.3618, 101.2437, 5000);
				}
				case 4:
				{
					InterpolateCameraPos(playerid,  1369.9067, -1694.4011, 52.2101,  1755.2010, -1553.4999, 68.0009, 5000);
					InterpolateCameraLookAt(playerid,  1370.2963, -1693.4733, 52.5849,  1754.5753, -1552.7125, 67.9558, 5000);
				}
    }

    if(IsValidRoleplayName(ReturnName(playerid)))
    {
        new query[455];
        mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM players WHERE Name = '%e' AND AccountStatus = 0", ReturnName(playerid));
        mysql_tquery(m_Handle, query, "OnApplicationCheck", "ii", playerid, race);
        return 1;
    }

		Character_Logo[playerid] = CreatePlayerTextDraw(playerid, 196.699783, 9.879829, "mdl-20053:serverlogo");
		PlayerTextDrawFont(playerid, Character_Logo[playerid], 4);
		PlayerTextDrawLetterSize(playerid, Character_Logo[playerid], 0.600000, 0.000000);
		PlayerTextDrawTextSize(playerid, Character_Logo[playerid], 239.000000, 111.000000);
		PlayerTextDrawSetOutline(playerid, Character_Logo[playerid], 1);
		PlayerTextDrawSetShadow(playerid, Character_Logo[playerid], 0);
		PlayerTextDrawAlignment(playerid, Character_Logo[playerid], 1);
		PlayerTextDrawColor(playerid, Character_Logo[playerid], -1);
		PlayerTextDrawBackgroundColor(playerid, Character_Logo[playerid], 255);
		PlayerTextDrawBoxColor(playerid, Character_Logo[playerid], 50);
		PlayerTextDrawUseBox(playerid, Character_Logo[playerid], 1);
		PlayerTextDrawSetProportional(playerid, Character_Logo[playerid], 1);
		PlayerTextDrawSetSelectable(playerid, Character_Logo[playerid], 0);
		PlayerTextDrawShow(playerid, Character_Logo[playerid]);

    new query[455];
    mysql_format(m_Handle, query, sizeof(query), "SELECT id, active_id, adminlevel, name, testerlevel, name, name FROM accounts WHERE name = '%e'", ReturnName(playerid));
    mysql_tquery(m_Handle, query, "OnAccountCheck", "ii", playerid, race);
    return 1;
}

Server:OnCoolDown(vehicleid)
{
    CarData[vehicleid][carCooldown] = false;
}

Server:SpectateUpdate(playerid, targetid)
{
    StartSpectate(playerid, targetid);
    return 1;
}

Server:OnPlayerNewPhone(playerid, response, index)
{
    if(response)
    {
        if(PlayerData[playerid][pPhoneType] == index) return SendErrorMessage(playerid, "Bu renkte bir telefon kýlýfýn bulunuyor.");
        if(PlayerData[playerid][pMoney] < 5000) return SendErrorMessage(playerid, "Yeterli paran yok.");

        PlayerData[playerid][pPhoneType] = index;
        SendClientMessage(playerid, COLOR_GREY, "[!] Telefon rengini sadsa olarak deðiþtirdin.");
    }
    return 1;
}

Server:OnPlayerNewReport(playerid, response, index)
{
    if (!response) return SendInfoMessage(playerid, "Rapor göndermekten vazgeçtin.");
    Report_Create(playerid, playerReport[playerid]);
    return 1;
}

Server:OnPlayerUp(playerid)
{
    new
        i = _has_player_reviver[playerid],
        newDisplay[128];

    if(!IsPlayerConnected(i))
    {
        KillTimer(playerHelpingTimer[playerid]);
        Delete3DTextLabel(playerHelpSign[i]);

        SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: Yardým edilirken oyuncu oyundan çýktý.");
        TogglePlayerControllable(playerid, 1);
        ClearAnimations(playerid);

        _has_player_reviving[playerid] = 0;
        _has_player_reviver[playerid] = -1;
        _has_player_reviver[i] = -1;

        playerHelpCount[playerid] = 0;
        playerHelpingPlayer[playerid] = false;
        return 1;
    }

    playerHelpCount[playerid]++;

    if(playerHelpCount[playerid] == 1) newDisplay = "(( || ))\nYARDIM EDÝLÝYOR";
    if(playerHelpCount[playerid] == 2) newDisplay = "(( ||| ))\nYARDIM EDÝLÝYOR";
    if(playerHelpCount[playerid] == 3) newDisplay = "(( |||| ))\nYARDIM EDÝLÝYOR";
    if(playerHelpCount[playerid] == 4) newDisplay = "(( ||||| ))\nYARDIM EDÝLÝYOR";
    if(playerHelpCount[playerid] == 5) newDisplay = "(( |||||| ))\nYARDIM EDÝLÝYOR";
    if(playerHelpCount[playerid] == 6) newDisplay = "(( ||||||| ))\nYARDIM EDÝLÝYOR";
    if(playerHelpCount[playerid] == 7) newDisplay = "(( |||||||| ))\nYARDIM EDÝLÝYOR";
    if(playerHelpCount[playerid] == 8) newDisplay = "(( |||||||| ))\nYARDIM EDÝLÝYOR";
    Update3DTextLabelText(playerHelpSign[i], COLOR_DARKGREEN, newDisplay);

    if(playerHelpCount[playerid] == 9)
    {
        ClearAnimations(playerid);
        TogglePlayerControllable(playerid, 1);
        SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: Yerdeki kiþiye baþarýyla yardým ettiniz.");
        SendClientMessage(i, COLOR_DARKGREEN, "SERVER: Yerden kaldýrýldýnýz, halsiz hissediyorsunuz.");
        playerHelpingPlayer[playerid] = false;

        Delete3DTextLabel(playerHelpSign[i]);
        KillTimer(playerHelpingTimer[playerid]);

        _has_player_reviving[playerid] = 0;
        _has_player_reviver[playerid] = -1;
        _has_player_reviver[i] = -1;

        PlayerData[i][pLegShot] = 0;
        PlayerData[i][pLowSkill] = 0;
        PlayerData[i][pExecuteTime] = 0;
        PlayerData[i][pBrutallyWounded] = 0;

        SetPlayerHealth(i, 31);
        TogglePlayerControllable(i, true);

        Damages_Clear(i);
        SetPlayerTeam(i, STATE_ALIVE);
        playerHelpCount[playerid] = 0;
        return 1;
    }

    return 1;
}

Server:OnVehicleLockUpgrade(playerid, vehicleid, price, to_level)
{
    if(!IsPlayerConnected(playerid))
    {
        KillTimer(PlayerUpgradeTimer[playerid]);
        PlayerUpgradeTimer[playerid] = -1;

        PlayerUpgradingVehicle[playerid] = false;
        Delete3DTextLabel(VehicleUpgradeSign[vehicleid]);
        PlayerVehicleUpgradeCount[playerid] = 0;
        return 1;
    }

    if(CarEngine[vehicleid])
    {
        KillTimer(PlayerUpgradeTimer[playerid]);
        PlayerUpgradeTimer[playerid] = -1;

        PlayerUpgradingVehicle[playerid] = false;
        Delete3DTextLabel(VehicleUpgradeSign[vehicleid]);
        PlayerVehicleUpgradeCount[playerid] = 0;

        SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: Aracý geliþtirirken motoru çalýþtýrdýðýn için iþlem iptal edildi.");
        return 1;
    }

    new newDisplay[128];
    PlayerVehicleUpgradeCount[playerid]++;
    switch(PlayerVehicleUpgradeCount[playerid])
    {
        case 1: newDisplay = "(( || ))\nKÝLÝT YÜKSELTÝLÝYOR";
        case 2: newDisplay = "(( ||| ))\nKÝLÝT YÜKSELTÝLÝYOR";
        case 3: newDisplay = "(( |||| ))\nKÝLÝT YÜKSELTÝLÝYOR";
        case 4: newDisplay = "(( ||||| ))\nKÝLÝT YÜKSELTÝLÝYOR";
        case 5: newDisplay = "(( |||||| ))\nKÝLÝT YÜKSELTÝLÝYOR";
        case 6: newDisplay = "(( ||||||| ))\nKÝLÝT YÜKSELTÝLÝYOR";
        case 7: newDisplay = "(( |||||||| ))\nKÝLÝT YÜKSELTÝLÝYOR";
        case 8: newDisplay = "(( |||||||| ))\nKÝLÝT YÜKSELTÝLÝYOR";
    }

    Update3DTextLabelText(VehicleUpgradeSign[vehicleid], COLOR_DARKGREEN, newDisplay);

    if(PlayerVehicleUpgradeCount[playerid] == 9)
    {
        CarData[vehicleid][carLock] = to_level;
        SaveSQLInt(CarData[vehicleid][carID], "vehicles", "LockLevel", to_level);

        InfoTD_MSG(playerid, 1, 5000, sprintf("~w~BU_ISLEM_$%s_TUTTU.", MoneyFormat(price)));
        GiveMoney(playerid, -price);

        KillTimer(PlayerUpgradeTimer[playerid]);
        PlayerUpgradeTimer[playerid] = -1;

        PlayerUpgradingVehicle[playerid] = false;
        Delete3DTextLabel(VehicleUpgradeSign[vehicleid]);
        PlayerVehicleUpgradeCount[playerid] = 0;
        return 1;
    }
    return 1;
}

Server:OnVehicleAlarmUpgrade(playerid, vehicleid, price, to_level)
{
    if(!IsPlayerConnected(playerid))
    {
        KillTimer(PlayerUpgradeTimer[playerid]);
        PlayerUpgradeTimer[playerid] = -1;

        PlayerUpgradingVehicle[playerid] = false;
        Delete3DTextLabel(VehicleUpgradeSign[vehicleid]);
        PlayerVehicleUpgradeCount[playerid] = 0;
        return 1;
    }

    if(CarEngine[vehicleid])
    {
        KillTimer(PlayerUpgradeTimer[playerid]);
        PlayerUpgradeTimer[playerid] = -1;

        PlayerUpgradingVehicle[playerid] = false;
        Delete3DTextLabel(VehicleUpgradeSign[vehicleid]);
        PlayerVehicleUpgradeCount[playerid] = 0;

        SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: Aracý geliþtirirken motoru çalýþtýrdýðýn için iþlem iptal edildi.");
        return 1;
    }

    new newDisplay[128];
    PlayerVehicleUpgradeCount[playerid]++;
    switch(PlayerVehicleUpgradeCount[playerid])
    {
        case 1: newDisplay = "(( || ))\nALARM YÜKSELTÝLÝYOR";
        case 2: newDisplay = "(( ||| ))\nALARM YÜKSELTÝLÝYOR";
        case 3: newDisplay = "(( |||| ))\nALARM YÜKSELTÝLÝYOR";
        case 4: newDisplay = "(( ||||| ))\nALARM YÜKSELTÝLÝYOR";
        case 5: newDisplay = "(( |||||| ))\nALARM YÜKSELTÝLÝYOR";
        case 6: newDisplay = "(( ||||||| ))\nALARM YÜKSELTÝLÝYOR";
        case 7: newDisplay = "(( |||||||| ))\nALARM YÜKSELTÝLÝYOR";
        case 8: newDisplay = "(( |||||||| ))\nALARM YÜKSELTÝLÝYOR";
    }

    Update3DTextLabelText(VehicleUpgradeSign[vehicleid], COLOR_DARKGREEN, newDisplay);

    if(PlayerVehicleUpgradeCount[playerid] == 9)
    {
        CarData[vehicleid][carAlarm] = to_level;
        SaveSQLInt(CarData[vehicleid][carID], "vehicles", "AlarmLevel", to_level);

        InfoTD_MSG(playerid, 1, 5000, sprintf("~w~BU_ISLEM_$%s_TUTTU.", MoneyFormat(price)));
        GiveMoney(playerid, -price);

        KillTimer(PlayerUpgradeTimer[playerid]);
        PlayerUpgradeTimer[playerid] = -1;

        PlayerUpgradingVehicle[playerid] = false;
        Delete3DTextLabel(VehicleUpgradeSign[vehicleid]);
        PlayerVehicleUpgradeCount[playerid] = 0;
        return 1;
    }
    return 1;
}

Server:OnVehicleImmobUpgrade(playerid, vehicleid, price, to_level)
{
    if(!IsPlayerConnected(playerid))
    {
        KillTimer(PlayerUpgradeTimer[playerid]);
        PlayerUpgradeTimer[playerid] = -1;

        PlayerUpgradingVehicle[playerid] = false;
        Delete3DTextLabel(VehicleUpgradeSign[vehicleid]);
        PlayerVehicleUpgradeCount[playerid] = 0;
        return 1;
    }

    if(CarEngine[vehicleid])
    {
        KillTimer(PlayerUpgradeTimer[playerid]);
        PlayerUpgradeTimer[playerid] = -1;

        PlayerUpgradingVehicle[playerid] = false;
        Delete3DTextLabel(VehicleUpgradeSign[vehicleid]);
        PlayerVehicleUpgradeCount[playerid] = 0;

        SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: Aracý geliþtirirken motoru çalýþtýrdýðýn için iþlem iptal edildi.");
        return 1;
    }

    new newDisplay[128];
    PlayerVehicleUpgradeCount[playerid]++;
    switch(PlayerVehicleUpgradeCount[playerid])
    {
        case 1: newDisplay = "(( || ))\nIMMOBILIZER YÜKSELTÝLÝYOR";
        case 2: newDisplay = "(( ||| ))\nIMMOBILIZER YÜKSELTÝLÝYOR";
        case 3: newDisplay = "(( |||| ))\nIMMOBILIZER YÜKSELTÝLÝYOR";
        case 4: newDisplay = "(( ||||| ))\nIMMOBILIZER YÜKSELTÝLÝYOR";
        case 5: newDisplay = "(( |||||| ))\nIMMOBILIZER YÜKSELTÝLÝYOR";
        case 6: newDisplay = "(( ||||||| ))\nIMMOBILIZER YÜKSELTÝLÝYOR";
        case 7: newDisplay = "(( |||||||| ))\nIMMOBILIZER YÜKSELTÝLÝYOR";
        case 8: newDisplay = "(( |||||||| ))\nIMMOBILIZER YÜKSELTÝLÝYOR";
    }

    Update3DTextLabelText(VehicleUpgradeSign[vehicleid], COLOR_DARKGREEN, newDisplay);

    if(PlayerVehicleUpgradeCount[playerid] == 9)
    {
        CarData[vehicleid][carImmob] = to_level;
        SaveSQLInt(CarData[vehicleid][carID], "vehicles", "ImmobLevel", to_level);

        InfoTD_MSG(playerid, 1, 5000, sprintf("~w~BU_ISLEM_$%s_TUTTU.", MoneyFormat(price)));
        GiveMoney(playerid, -price);

        KillTimer(PlayerUpgradeTimer[playerid]);
        PlayerUpgradeTimer[playerid] = -1;

        PlayerUpgradingVehicle[playerid] = false;
        Delete3DTextLabel(VehicleUpgradeSign[vehicleid]);
        PlayerVehicleUpgradeCount[playerid] = 0;
        return 1;
    }
    return 1;
}


Server:OnVehicleChangeBattery(playerid, vehicleid, price, Float:to_level)
{
    if(!IsPlayerConnected(playerid))
    {
        KillTimer(PlayerUpgradeTimer[playerid]);
        PlayerUpgradeTimer[playerid] = -1;

        PlayerUpgradingVehicle[playerid] = false;
        Delete3DTextLabel(VehicleUpgradeSign[vehicleid]);
        PlayerVehicleUpgradeCount[playerid] = 0;
        return 1;
    }

    if(CarEngine[vehicleid])
    {
        KillTimer(PlayerUpgradeTimer[playerid]);
        PlayerUpgradeTimer[playerid] = -1;

        PlayerUpgradingVehicle[playerid] = false;
        Delete3DTextLabel(VehicleUpgradeSign[vehicleid]);
        PlayerVehicleUpgradeCount[playerid] = 0;

        SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: Aracý geliþtirirken motoru çalýþtýrdýðýn için iþlem iptal edildi.");
        return 1;
    }

    new newDisplay[128];
    PlayerVehicleUpgradeCount[playerid]++;
    switch(PlayerVehicleUpgradeCount[playerid])
    {
        case 1: newDisplay = "(( || ))\nBATARYA DEÐÝÞTÝRÝLÝYOR";
        case 2: newDisplay = "(( ||| ))\nBATARYA DEÐÝÞTÝRÝLÝYOR";
        case 3: newDisplay = "(( |||| ))\nBATARYA DEÐÝÞTÝRÝLÝYOR";
        case 4: newDisplay = "(( ||||| ))\nBATARYA DEÐÝÞTÝRÝLÝYOR";
        case 5: newDisplay = "(( |||||| ))\nBATARYA DEÐÝÞTÝRÝLÝYOR";
        case 6: newDisplay = "(( ||||||| ))\nBATARYA DEÐÝÞTÝRÝLÝYOR";
        case 7: newDisplay = "(( |||||||| ))\nBATARYA DEÐÝÞTÝRÝLÝYOR";
        case 8: newDisplay = "(( |||||||| ))\nBATARYA DEÐÝÞTÝRÝLÝYOR";
    }

    Update3DTextLabelText(VehicleUpgradeSign[vehicleid], COLOR_DARKGREEN, newDisplay);

    if(PlayerVehicleUpgradeCount[playerid] == 9)
    {
				CarData[vehicleid][carBattery] = to_level;
        SaveSQLFloat(CarData[vehicleid][carID], "vehicles", "BatteryLife", to_level);

        InfoTD_MSG(playerid, 1, 5000, sprintf("~w~BU_ISLEM_$%s_TUTTU.", MoneyFormat(price)));
        GiveMoney(playerid, -price);

        KillTimer(PlayerUpgradeTimer[playerid]);
        PlayerUpgradeTimer[playerid] = -1;

        PlayerUpgradingVehicle[playerid] = false;
        Delete3DTextLabel(VehicleUpgradeSign[vehicleid]);
        PlayerVehicleUpgradeCount[playerid] = 0;
        return 1;
    }
    return 1;
}

Server:OnVehicleChangeEngine(playerid, vehicleid, price, Float:to_level)
{
    if(!IsPlayerConnected(playerid))
    {
        KillTimer(PlayerUpgradeTimer[playerid]);
        PlayerUpgradeTimer[playerid] = -1;

        PlayerUpgradingVehicle[playerid] = false;
        Delete3DTextLabel(VehicleUpgradeSign[vehicleid]);
        PlayerVehicleUpgradeCount[playerid] = 0;
        return 1;
    }

    if(CarEngine[vehicleid])
    {
        KillTimer(PlayerUpgradeTimer[playerid]);
        PlayerUpgradeTimer[playerid] = -1;

        PlayerUpgradingVehicle[playerid] = false;
        Delete3DTextLabel(VehicleUpgradeSign[vehicleid]);
        PlayerVehicleUpgradeCount[playerid] = 0;

        SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: Aracý geliþtirirken motoru çalýþtýrdýðýn için iþlem iptal edildi.");
        return 1;
    }

    new newDisplay[128];
    PlayerVehicleUpgradeCount[playerid]++;
    switch(PlayerVehicleUpgradeCount[playerid])
    {
        case 1: newDisplay = "(( || ))\nMOTOR DEÐÝÞTÝRÝLÝYOR";
        case 2: newDisplay = "(( ||| ))\nMOTOR DEÐÝÞTÝRÝLÝYOR";
        case 3: newDisplay = "(( |||| ))\nMOTOR DEÐÝÞTÝRÝLÝYOR";
        case 4: newDisplay = "(( ||||| ))\nMOTOR DEÐÝÞTÝRÝLÝYOR";
        case 5: newDisplay = "(( |||||| ))\nMOTOR DEÐÝÞTÝRÝLÝYOR";
        case 6: newDisplay = "(( ||||||| ))\nMOTOR DEÐÝÞTÝRÝLÝYOR";
        case 7: newDisplay = "(( |||||||| ))\nMOTOR DEÐÝÞTÝRÝLÝYOR";
        case 8: newDisplay = "(( |||||||| ))\nMOTOR DEÐÝÞTÝRÝLÝYOR";
    }

    Update3DTextLabelText(VehicleUpgradeSign[vehicleid], COLOR_DARKGREEN, newDisplay);

    if(PlayerVehicleUpgradeCount[playerid] == 9)
    {
				CarData[vehicleid][carEngine] = to_level;
        SaveSQLFloat(CarData[vehicleid][carID], "vehicles", "EngineLife", to_level);

        InfoTD_MSG(playerid, 1, 5000, sprintf("~w~BU_ISLEM_$%s_TUTTU.", MoneyFormat(price)));
        GiveMoney(playerid, -price);

        KillTimer(PlayerUpgradeTimer[playerid]);
        PlayerUpgradeTimer[playerid] = -1;

        PlayerUpgradingVehicle[playerid] = false;
        Delete3DTextLabel(VehicleUpgradeSign[vehicleid]);
        PlayerVehicleUpgradeCount[playerid] = 0;
        return 1;
    }
    return 1;
}

Server:SaveSQLInt(sqlid, table[], row[], value)
{
    new query[128];
    mysql_format(m_Handle, query, sizeof(query), "UPDATE %e SET %e = %i WHERE id = %i", table, row, value, sqlid);
    mysql_pquery(m_Handle, query);
    return true;
}

Server:SaveSQLFloat(sqlid, table[], row[], Float:value)
{
    new query[128];
    mysql_format(m_Handle, query, sizeof(query), "UPDATE %e SET %e = %f WHERE id = %i", table, row, value, sqlid);
    mysql_pquery(m_Handle, query);
    return true;
}

/*Server:SellUnusedHouses()
{
    cache_get_data(rows, fields);

    if(!rows)
        return SendClientMessageToAll(COLOR_PINK, "[NWE] Sunucudaki ev sahipleri en az iki hafta önce sunucuya giri? yapty?y için hiçbir ev satylmady.");

    new row, total_sold_count;
    total_sold_count = rows;

    GetWholeRows(row, rows)
    {
        cache_get_int(row, 0, houseid);

        format(query, sizeof(query), "UPDATE `players` SET `money` = `money`+%d, `spawn` = '-1',`house` = '-1' WHERE `reg_id` = '%d'", house[houseid][cost], house[houseid][owner_id]);
        mysql_function_query(dbHandle, query, false, "", "");

        format(query, sizeof(query), "UPDATE `houses` SET `owner` = '*',`owner_id` = '-1' WHERE `id` = '%d'", houseid);
        mysql_function_query(dbHandle, query, false, "", "");

        house[houseid][owner_id] = -1;
        house[houseid][owner] = '*';

        UpdateHouse3DTextLabel(houseid);
        UpdateHouseMapIcon(houseid);
    }

    format(str, sizeof(str), "[NWE] Sunucudaki ev sahipleri arasyndan en az iki hafta boyunca oyuna girmeyen %d oyuncunun evi satyldy.", total_sold_count);
    SendClientMessageToAll(COLOR_PINK, str);
    return true;
}*/

Server:FunctionPlayers()
{
    Ship_Update();

    gettime(hour, minute, second);
    if(minute == 00 && second == 59)
    {
        SetWorldTime(hour+1);

        /*
        foreach(new i : Billboards) if(BillboardData[i][BillboardRentedBy] != 0)
        {
            if(Time() > BillboardData[i][BillboardRentExpiresAt])
            {
                BillboardData[i][BillboardRentedBy] = 0;
                BillboardData[i][BillboardRentExpiresAt] = 0;
                format(BillboardData[i][BillboardText], 128, "Yok");

                Billboard_Refresh(i);
                Billboard_Save(i);
            }
        }*/
    }
/*  if(hour == 0 && minute == 0 && second == 0)
    {
        new query[400];
        new time_since = Time() - 1296000;
        mysql_format(m_Handle, query, sizeof(query), "SELECT * FROM properties WHERE OwnerSQL > 0 AND LastConnection < %i", time_since);
        mysql_tquery(m_Handle, query, "SellUnusedHouses", "");
    }*/


    for(new i; i < MAX_PLAYERS; i++)
    {
        if(IsPlayerConnected(i))
        {
            if(pLoggedIn[i])
            {

							if(GetPVarInt(i, "playerSpeedCam")) foreach(new pid : Player)
							{
								if(!IsPlayerInAnyVehicle(i) || GetPlayerState(i) != PLAYER_STATE_DRIVER || i == pid) continue;
								if(!IsPlayerInAnyVehicle(pid) || GetPlayerState(pid) != PLAYER_STATE_DRIVER || i == pid) continue;

								new target = GetPlayerVehicleID(pid);
								new speed = GetVehicleSpeed(target);

								new Float:posX, Float:posY, Float:posZ;

								GetVehiclePos(target, posX, posY, posZ);
								if(!IsPlayerInRangeOfPoint(i, 30.0, posX, posY, posZ) || speed < GetPVarInt(i, "playerSpeedCam")) continue;

					 			SendClientMessageEx(i, COLOR_BLUE, "[Kamera] Hýz sýnýrý aþýldý. (%s - %s) %d KM/H.", ReturnVehicleName(target), ReturnVehiclePlate(target), speed);
								return 1;
							}
							if(PlayerData[i][pAlpr] == true)
								{

									if(GetPVarInt(i, "pAlpr_Active") == 1)
										return 1;

									if(!IsPlayerInAnyVehicle(i))
										return 1;

									new vehid = GetPlayerVehicleID(i);

									if(!IsACruiser(vehid))
										return 1;


								foreach(new vb_id : VBolos) if(VehicleBolo[vb_id][vBoloExists] == true)
								{
									for(new wantedcar = 1, j = GetVehiclePoolSize(); wantedcar <= j; wantedcar++)
									{
										new vehicleplate[9];
										GetVehicleNumberPlate(wantedcar, vehicleplate, sizeof(vehicleplate));

											if(strmatch(vehicleplate, VehicleBolo[vb_id][vBoloPlate]))
											{
											new Float:wantedPos[3];
											GetVehiclePos(wantedcar, wantedPos[0], wantedPos[1], wantedPos[2]);

												if(IsPlayerInRangeOfPoint(i, 15.0,  wantedPos[0], wantedPos[1], wantedPos[2]))
												{
													SetPVarInt(i, "pAlpr_Active", 1);
													SetPVarInt(i, "pAlpr_Active_LastID", vb_id);
													SetPVarInt(i, "pAlpr_Active_LastID_Time", gettime());
													Alpr_Active(i, VehicleBolo[vb_id][vBoloPlate]);
													return 1;
												}
											}
										}
									}
								}

                if(GetTickCount() > (PlayerData[i][pPauseCheck] + 2000))
                    PlayerData[i][pPauseTime]++;
                else
                    PlayerData[i][pPauseTime] = 0;

                Hud_Update(i, GetPlayerVehicleID(i));
								Street_Update(i, GetPlayerVehicleID(i));

                if(SpectateID[i] != -1)
                {
                    if(GetPlayerInterior(i) != GetPlayerInterior(SpectateID[i]) || GetPlayerVirtualWorld(i) != GetPlayerVirtualWorld(SpectateID[i]))
                        StartSpectate(i, SpectateID[i]);

                    Spectate_Update(i);
                }

                if(PlayerData[i][pBrutallyWounded] != 0)
                {
                    if(PlayerData[i][pInjurTime] > 0)
                    {
                        PlayerData[i][pInjurTime]--;
                    }
                    else if(PlayerData[i][pInjurTime] == 0)
                    {
                        SendServerMessage(i, "/tedaviol komutu ile ayaða kalkabilirsin.");
                        PlayerData[i][pInjurTime] = -1;
                    }
                }

                if(PlayerData[i][pFishTime] > 0)
                {
                    PlayerData[i][pFishTime]--;

                    if(PlayerData[i][pFishTime] <= 0)
                    {
                        new id = IsABoat(GetPlayerVehicleID(i)) ? CatchFishOnBoat() : CatchFish();

                        if(id == -1)
                        {
                            cmd_ame(i, "oltayý kendine doðru çeker, hiçbir þey yakalayamadýðýný görür.");
                            SendClientMessage(i, COLOR_ADM, "Hiçbir þey yakalayamadýn.");
                        }
                        else
                        {
                            new rand_kg = IsABoat(GetPlayerVehicleID(i)) ? randomEx(FishData[id][FishMinWeight], FishData[id][FishMaxWeight]) * 2 : randomEx(FishData[id][FishMinWeight], FishData[id][FishMaxWeight]);
                            cmd_ame(i, sprintf("oltayý kendine doðru çeker, %i kg %s yakaladýðýný görür.", rand_kg, FishData[id][FishName]));
                            SendClientMessageEx(i, COLOR_DARKGREEN, "%i kg %s yakaladýn.", rand_kg, FishData[id][FishName]);
                            PlayerData[i][pFishWeight] += rand_kg;
                        }

                        if(IsPlayerAttachedObjectSlotUsed(i, 9)) {
                            RemovePlayerAttachedObject(i, 9);
                        }

                        if(IsABoat(GetPlayerVehicleID(i))) {
                            PlayerData[i][pFishCheckpoint] = 0;
                            DisablePlayerRaceCheckpoint(i);
                        }

                        TogglePlayerControllable(i, 1);
                        PlayerData[i][pFishTime] = 0;
                    }
                }


                if(PlayerBreakInVehicle[i] != INVALID_VEHICLE_ID && CarData[PlayerBreakInVehicle[i]][carPhysicalAttack] && GetPlayerState(i) == PLAYER_STATE_ONFOOT)
                {
                    new vehicleid = PlayerBreakInVehicle[i];
                    if(IsValidVehicle(vehicleid))
                    {
                        new Float:cX, Float:cY, Float:cZ;
                        GetVehiclePos(vehicleid, cX, cY, cZ);

                        if(GetVehicleDriver(vehicleid) != -1 || !IsPlayerInRangeOfPoint(i, 5.0, cX, cY, cZ))
                        {
                            CarData[vehicleid][carPhysicalAttack] = false;
                            CarData[vehicleid][carCooldown] = false;

                            if(IsValidDynamic3DTextLabel(BreakInTextDraw[i]))
                            {
                                DestroyDynamic3DTextLabel(BreakInTextDraw[i]);
                            }

                            KillTimer(BreakInTDTimer[i]);
                            PlayerBreakInVehicle[i] = INVALID_VEHICLE_ID;
                            PlayerBreakingIn[i] = 0;
                            BreakInError[i] = 0;
                            ActiveLockTD[i] = 0;
                        }
                    }
                }


                if(PlayerData[i][pTaxiDrivingTest])
                {
                    if(PlayerData[i][pTestTime] != 0)
                    {
                        PlayerData[i][pTestTime]--;
                        GameTextForPlayer(i, sprintf("~w~%d", PlayerData[i][pTestTime]), 2000, 3);
                        if(PlayerData[i][pTestTime] < 1)
                        {
                            GameTextForPlayer(i, "~w~Taksi Ehliyet Testin Iptal Oldu", 4000, 1);
                            CancelTaxiDrivingTest(i);
                        }
                    }
                }

                if(PlayerData[i][pDrivingTest])
                {
                    PlayerData[i][pTestTime]--;
                    GameTextForPlayer(i, sprintf("~w~%d", PlayerData[i][pTestTime]), 2000, 3);

                    if(PlayerData[i][pTestTime] < 1)
                    {
                        GameTextForPlayer(i, "~w~Ehliyet Testin Iptal Oldu", 4000, 1);
                        CancelDrivingTest(i);
                    }
                }

                if(GetPlayerVehicleID(i) != 0)
                {
                    if(GetPlayerVehicleID(i) != GetPVarInt(i, "lastVehicle"))
                    {
                        if(GetPVarInt(i, "vehIDtime") > gettime())
                        {
                            LogPlayerAction(i, "State hilesi kullandý.");
                            SendClientMessageToAll(COLOR_ADM, sprintf("AdmCmd: %s isimli oyuncu The Machine tarafýndan atýldý. Sebep: State Hilesi.", ReturnName(i)));
                            KickEx(i);
                            return 1;
                        }
                        SetPVarInt(i, "lastVehicle", GetPlayerVehicleID(i));
                        SetPVarInt(i, "vehIDtime", gettime() + 1);
                    }
                }

                if(PlayerData[i][pUseGUI])
                {
                    new str[24];
                    switch(GetNearestAntennaEx(i))
                    {
                        case 0: str = "SERVIS_YOK";
                        case 1: str = "I";
                        case 2: str = "II";
                        case 3: str = "III";
                        case 4: str = "IIII";
                        case 5: str = "IIIII";
                    }
                    PlayerTextDrawSetString(i, PhoneSignal[i], str);

                    if(PlayerData[i][pPhoneline] != INVALID_PLAYER_ID) // payphone engeli koy
                    {
                        if(GetNearestAntenna(i) == -1) cmd_tkapat(i, "");
                    }
                }

                if(PlayerIsTased[i] > 0)
                {
                    if(!IsPlayerInRangeOfPoint(i, 3.0, PlayerData[i][pPos][0], PlayerData[i][pPos][1], PlayerData[i][pPos][2]))
                        SetPlayerPos(i, PlayerData[i][pPos][0], PlayerData[i][pPos][1], PlayerData[i][pPos][2]);

                    ApplyAnimation(i, "SWEET", "Sweet_injuredloop", 4.0, 1, 0, 0, 1, 0);
                    PlayerIsTased[i]--;
                }

                if(PlayerData[i][pExecuteTime])
                {
                    PlayerData[i][pExecuteTime]++;
                    if(PlayerData[i][pExecuteTime] == 5)
                    {
                        PlayerData[i][pExecuteTime] = 0;
                    }
                }

                if(PlayerData[i][pAjailed])
                {
                    PlayerData[i][pAjailTime]--;
                    if(PlayerData[i][pAjailTime] <= 0)
                    {
                        PlayerData[i][pAjailed] = false;
                        SendClientMessage(i, COLOR_GREY, "SERVER: Topluma olan borcunu ödedin.");
                        SendPlayer(i, 1553.0421, -1675.4706, 16.1953, 90.0, 0, 0);
                    }
                }

                PlayerData[i][pPlayTime]++;

                if(PlayerData[i][pPlayTime] >= 3600)
                {
                    CallPaycheck(i);
                    if(payday2 == 1)
                    {
                        CallPaycheck(i);
                        SendServerMessage(i, "Çift paydaydan yararlandýn.");
                    }
                }

                switch(PlayerData[i][pBrutallyWounded])
                {
                    case 1: SetPlayerChatBubble(i, sprintf("(( Bu kiþi %i kere yaralanmýþ, /hasarlar %i ))", TotalDamages[i], i), COLOR_ADM, 30.0, 2000);
                    case 2: SetPlayerChatBubble(i, "(( BU KÝÞÝ ÖLÜ. ))", COLOR_ADM, 30.0, 2000);
                }

                if(GetPlayerTeam(i) == STATE_WOUNDED)
                {
                    if(!IsPlayerInAnyVehicle(i)) ApplyAnimation(i, "WUZI", "CS_Dead_Guy", 4.0, 0, 0, 0, 1, 0, 1);
                    else ApplyAnimation(i, "PED", "CAR_dead_LHS", 4.1, 0, 1, 1, 1, 0, 1);

                    if(!IsPlayerInRangeOfPoint(i, 3.0, PlayerData[i][pPos][0], PlayerData[i][pPos][1], PlayerData[i][pPos][2]) || GetPlayerVirtualWorld(i) != PlayerData[i][pWorld])
                    {
                        SetPlayerPos(i, PlayerData[i][pPos][0], PlayerData[i][pPos][1], PlayerData[i][pPos][2]);
                        SetPlayerFacingAngle(i, PlayerData[i][pPos][3]);

                        SetPlayerInterior(i, PlayerData[i][pInterior]);
                        SetPlayerVirtualWorld(i, PlayerData[i][pWorld]);
                    }
                }

                if(DeathTimeNotice[i] != 0)
                {
                    DeathTimeNotice[i]--;
                }

                if(PlayerData[i][pICJailed])
                {
                    PlayerData[i][pICJailTime]--;
                    if(PlayerData[i][pICJailTime] < 1)
                    {
                        if(!PlayerData[i][pICJailNotify])
                        {
                            SendClientMessage(i, COLOR_ADM, "[-] Hapis süren doldu. /hapistencik");
                            PlayerData[i][pICJailNotify] = 1;
                        }
                    }
                }

                // Para Hilesi
                new money = GetPlayerMoney(i);
                if (PlayerData[i][pMoney] != money)
                {
                    SetMoney(i, PlayerData[i][pMoney]);
                }

                if(PlayerData[i][pDrugUse] != -1)
                {
                    if(PlayerData[i][pDrugTime] < gettime())
                    {
                        PlayerData[i][pDrugUse] = -1;
                        PlayerTextDrawHide(i, drug_effect[i]);
                        Player_SetTime(i); Player_SetWeather(i);
                    }
                    else if(PlayerData[i][pDrugTime] > gettime())
                    {
                        switch(PlayerData[i][pDrugUse])
                        {
                            case DRUG_TYPE_MARIJUANA, DRUG_TYPE_CRACK:
                            {
                                /*SetPlayerTime(i, 21, 0);
                                SetPlayerWeather(i, 229);*/
                            }
                            case DRUG_TYPE_METH, DRUG_TYPE_PCP:
                            {
                                /*SetPlayerTime(i, 12, 0);
                                SetPlayerWeather(i, 226);*/
                            }
                            case DRUG_TYPE_ECSTASY, DRUG_TYPE_LSD, DRUG_TYPE_PEYOTE:
                            {
                                if(PlayerData[i][pDrugChgWeather] < gettime())
                                {
                                    PlayerData[i][pDrugChgWeather] = gettime() + 4;
                                    /*PlayerTextDrawBoxColor(i, drug_effect[i], drug_effect_color[random(sizeof(drug_effect_color))]);
                                    PlayerTextDrawShow(i, drug_effect[i]);*/
                                }
                            }
                            case DRUG_TYPE_COCAINE:
                            {
                                /*new h, m;
                                GetPlayerTime(i, h, m);
                                if(h > 18)
                                    SetPlayerTime(i, 12, 0);
                                else
                                    SetPlayerTime(i, h + 1, 0);
                                SetPlayerWeather(i, 190);*/
                            }
                            case DRUG_TYPE_HEROIN:
                            {
                                /*SetPlayerWeather(i, 21);*/
                            }
                        }
                    }
                }
            }
        }
    }
    return 1;
}

Server:FillRandomGarbage()
{
    foreach(new j : Garbages)
    {
        new
            random_garbage = random(4);

        if ((GarbageData[j][GarbageTakenCapacity] + random_garbage) >= GarbageData[j][GarbageCapacity]) {
            GarbageData[j][GarbageTakenCapacity] = GarbageData[j][GarbageCapacity];
        } else {
            GarbageData[j][GarbageTakenCapacity] += random_garbage;
        }
        //Garbage_Save(j);
    }
    return 1;
}

Server:OnPlayerNearPickup()
{
    foreach(new i : Player) if(pLoggedIn[i])
    {
        if(!IsPlayerInAnyVehicle(i))
        {
            new b = -1;
            if((b = IsPlayerNearBusiness(i)) != -1)
            {
                new string[128];
                if (!BusinessData[b][BusinessOwnerSQLID])
                {
                    if(GetPVarInt(i, "Viewing_DealershipCats") != 1 && GetPVarInt(i, "Viewing_Dealership") != 1 && BusinessData[b][BusinessType] != BUSINESS_GASSTATION)
                    {
                        switch(BusinessData[b][BusinessType])
                        {
                            case BUSINESS_ADVERT, BUSINESS_BANK, BUSINESS_CLUB: format(string, sizeof(string), "%s~n~~w~Giris Ucreti: ~g~$%d~n~~p~/giris", BusinessData[b][BusinessName], BusinessData[b][BusinessFee]);
                            case BUSINESS_DEALERSHIP: format(string, sizeof(string), "~n~~w~%s~n~~r~/arac satinal", BusinessData[b][BusinessName]);
                            default: format(string, sizeof(string), "%s~n~~w~Bu isyeri satilik~n~Ucret: ~g~$%d ~w~Seviye: %d~n~~p~Satin almak icin /isyeri satinal", BusinessData[b][BusinessName], BusinessData[b][BusinessPrice], BusinessData[b][BusinessLevel]);
                        }

                        GameTextForPlayer(i, string, 5000, 3);
                    }
                }
                else
                {
                    format(string, sizeof(string), "%s~n~~w~Sahip: %s~n~Giris Ucreti: ~g~$%d~n~~p~/giris", BusinessData[b][BusinessName], ReturnSQLName(BusinessData[b][BusinessOwnerSQLID]), BusinessData[b][BusinessFee]);
                    GameTextForPlayer(i, string, 5000, 3);
                }
            }
            //
        }
    }
    return 1;
}

Server:OnVehicleFuelChange(vehicleid)
{
    new iEngine, iLights, iAlarm,
        iDoors, iBonnet, iBoot,
        iObjective;

    if(CarEngine[vehicleid])
    {
        GetVehicleParamsEx(vehicleid, iEngine, iLights, iAlarm, iDoors, iBonnet, iBoot, iObjective);
        if(CarData[vehicleid][carFuel] >= 1.0)
        {
            CarData[vehicleid][carFuel] -= 0.01;
            CarData[vehicleid][carEngine] -= 0.001;
            if(CarData[vehicleid][carXMROn]) CarData[vehicleid][carBattery] -= 0.005;
            if(iLights == 1) CarData[vehicleid][carBattery] -= 0.003;
        }
        else if(CarData[vehicleid][carFuel] >= 1.0 && CarData[vehicleid][carEngine] <= 50.0)
        {
            CarData[vehicleid][carEngine] -= 0.001 * randomEx(1,10);
            CarData[vehicleid][carFuel] -= randomEx(1,3) * 0.2;
            CarData[vehicleid][carBattery] -= 0.002;
            if(CarData[vehicleid][carXMROn]) CarData[vehicleid][carBattery] -= 0.01;
            if(iLights == 1) CarData[vehicleid][carBattery] -= 0.005;
        }
        else if(CarData[vehicleid][carEngine] <= 0.0)
        {
            CarData[vehicleid][carEngine] = 0.0;
            ToggleVehicleEngine(vehicleid, false);
            CarEngine[vehicleid] = false;

            foreach(new i : Player)
            {
                if(GetPlayerState(i) == PLAYER_STATE_DRIVER && GetPlayerVehicleID(i) == vehicleid)
                {
                    GameTextForPlayer(i, "~r~Benzin Bitti!", 3500, 4);
                    break;
                }
            }
        }
    }
    return 1;
}

Server:OnVehicleUpdate()
{
    for(new i = 1, j = GetVehiclePoolSize(); i <= j; i++)
    {
        if(!IsValidVehicle(i)) continue;
        if(!IsValidCar(i)) continue;

        if(IsValidPlayerCar(i))
        {
            OnVehicleFuelChange(i);

            new Float: vehicle_health;
            GetVehicleHealth(i, vehicle_health);
            if(vehicle_health != CarData[i][carLastHealth])
            {
                if(OnVehicleHealthChange(i, vehicle_health, CarData[i][carLastHealth]))
                    CarData[i][carLastHealth] = vehicle_health;
                else
                    SetVehicleHealth(i, CarData[i][carLastHealth]);
            }
        }
        else if(IsValidRentalCar(i))
        {
            if(CarData[i][carTerminate])
            {
                CarData[i][carTerminate]--;
                if(CarData[i][carTerminate] && CarData[i][carRentedBy])
                {
                    CarData[i][carRentedBy] = 0;
                    SetVehicleToRespawn(i);
                }
            }
        }
    }
    return 1;
}

Server:OnVehicleHealthChange(vehicleid, Float:newhealth, Float:oldhealth)
{
    new
        Float: vehicle_health_loss = oldhealth - newhealth,
        owner_id = INVALID_PLAYER_ID;

    if(CarEngine[vehicleid])
    {
        if(newhealth >= 550 && newhealth <= 649)
        {
            CarData[vehicleid][carEngine] -= (vehicle_health_loss / 125.0);
            CarData[vehicleid][carBattery] -= (vehicle_health_loss / 150.0);
        }
        else if(newhealth >= 390 && newhealth <= 549)
        {
            CarData[vehicleid][carEngine] -= (vehicle_health_loss / 100.0);
            CarData[vehicleid][carBattery] -= (vehicle_health_loss / 125.0);
        }
        else if(newhealth >= 250 && newhealth <= 389)
        {
            CarData[vehicleid][carEngine] -= (vehicle_health_loss / 75.0);
            CarData[vehicleid][carBattery] -= (vehicle_health_loss / 100.0);

            if(newhealth < 350.0)
            {
                ToggleVehicleEngine(vehicleid, false);
                CarEngine[vehicleid] = false;

                CarData[vehicleid][carTweak] = true;

                SetVehicleHealth(vehicleid, 360.0);
                foreach(new pid : Player) if(IsPlayerInVehicle(pid, vehicleid))
                {
                    if(GetPlayerVehicleID(pid) == vehicleid)
                    {
                        if(GetPlayerState(pid) == PLAYER_STATE_DRIVER)
                        {
                            SendClientMessage(pid, COLOR_ADM, "ARAÇ BATARYASI MOTORUNU KAPATTI: Motor kötü bir þekilde hasar aldý.");
                            SendClientMessage(pid, COLOR_ADM, "ÝPUCU: Aracýný tamir ettirmeni öneriyoruz.");
                            SendClientMessage(pid, COLOR_ADM, "ÝPUCU: /motor yazarak çalýþtýrmayý deneyebilirsin.");

                            GameTextForPlayer(pid, "~r~MOTOR DURDU~n~BIRAZ ZORMALISIN!", 10000, 4);
                            return 1;
                        }
                    }
                }
            }
        }
    }

    if(newhealth <= 248)
    {
        foreach(new p : Player) if(PlayerData[p][pSQLID] == CarData[vehicleid][carOwnerID])
        {
            owner_id = p;
        }

        if (owner_id != INVALID_PLAYER_ID)
        {
            new
                Float: life_deplete;

            life_deplete = CarData[vehicleid][carEngine] - float(10+random(5));

            CarData[vehicleid][carTimeDestroyed] ++;

            if(CarData[vehicleid][carEngine] - life_deplete < 1.00)
                CarData[vehicleid][carEngine] = 0.0;

            else CarData[vehicleid][carEngine] = life_deplete;
            CarData[vehicleid][carBattery] -= 10.0;

            _has_vehicle_spawned[owner_id] = false;
            _has_spawned_vehicleid[owner_id] = 0;

            SendServerMessage(owner_id, "%s model aracýn yokedildi.", ReturnVehicleName(vehicleid));
            SendServerMessage(owner_id, "Motor gücü {FFFFFF}%.2f {FF6346}ve batarya gücü {FFFFFF}%.2f{FF6346} olarak güncellendi.", CarData[vehicleid][carEngine], CarData[vehicleid][carBattery]);
        }
        else
        {
            new
                query[128];

            mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET HasCarSpawned = 0 WHERE id = %i LIMIT 1", CarData[vehicleid][carOwnerID]);
            mysql_tquery(m_Handle, query);
        }

        foreach(new f : Player) if(PlayerBreakInVehicle[f] == vehicleid)
        {
            if(IsValidDynamic3DTextLabel(BreakInTextDraw[f]))
            {
                DestroyDynamic3DTextLabel(BreakInTextDraw[f]);
            }

            KillTimer(BreakInTDTimer[f]);

            //Clearing variables:
            PlayerBreakInVehicle[f] = INVALID_VEHICLE_ID;
            PlayerBreakingIn[f] = 0;
            BreakInError[f] = 0;
            ActiveLockTD[f] = 0;
        }

        Car_Save(vehicleid);
        Vehicle_DefaultValues(vehicleid);
        DestroyVehicle(vehicleid);
    }
    return 1;
}

Server:TIMER_RingSound(playerid)
{
    if(playerid != INVALID_PLAYER_ID) {
        PlayNearbySound(playerid, PlayerData[playerid][pPhoneRingtone]);
        return true;
    }
    return false;
}

Server:TIMER_ExitPNS(playerid)
{
    new pns_Id = PlayerData[playerid][pInsidePNS];
    SendPlayer(playerid, PNSData[pns_Id][PnsPos][0], PNSData[pns_Id][PnsPos][1], PNSData[pns_Id][PnsPos][2], PNSData[pns_Id][PnsPos][3], PNSData[pns_Id][EnterInteriorID], PNSData[pns_Id][EnterWorld]);
    PlayerData[playerid][pInsidePNS] = 0;
    PNSData[pns_Id][PnsOccupied] = false;

    SendClientMessage(playerid, COLOR_DARKGREEN, "Otomatik-Ses: Aracýn tamir edildi.");
    TogglePlayerControllable(playerid, true);
    return 1;
}

Server:OnVehicleTow(playerid)
{
    new
        vehicleid = _has_spawned_vehicleid[playerid],
        newDisplay[128];

    if(IsVehicleOccupied(vehicleid))
    {
        KillTimer(playerTowTimer[playerid]);
        Delete3DTextLabel(vehicleTowSign[vehicleid]);

        SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: Araç çekilirken bir sorun oluþtu.");

        playerVehicleTowCount[playerid] = 0;
        playerTowingVehicle[playerid] = false;
        return 1;
    }

    playerVehicleTowCount[playerid]++;

    switch(playerVehicleTowCount[playerid])
    {
        case 1: newDisplay = "(( || ))\nARAÇ ÇEKÝLÝYOR";
        case 2: newDisplay = "(( ||| ))\nARAÇ ÇEKÝLÝYOR";
        case 3: newDisplay = "(( |||| ))\nARAÇ ÇEKÝLÝYOR";
        case 4: newDisplay = "(( ||||| ))\nARAÇ ÇEKÝLÝYOR";
        case 5: newDisplay = "(( |||||| ))\nARAÇ ÇEKÝLÝYOR";
        case 6: newDisplay = "(( ||||||| ))\nARAÇ ÇEKÝLÝYOR";
        case 7: newDisplay = "(( |||||||| ))\nARAÇ ÇEKÝLÝYOR";
        case 8: newDisplay = "(( |||||||| ))\nARAÇ ÇEKÝLÝYOR";
    }

    Update3DTextLabelText(vehicleTowSign[vehicleid], COLOR_DARKGREEN, newDisplay);

    if(playerVehicleTowCount[playerid] == 9)
    {
        SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: Aracýnýz baþarýyla park yerine çekildi.");
        GiveMoney(playerid, -2000);

        playerTowingVehicle[playerid] = false;

        SetVehicleToRespawn(vehicleid);

        Delete3DTextLabel(vehicleTowSign[vehicleid]);
        KillTimer(playerTowTimer[playerid]);

        playerVehicleTowCount[playerid] = 0;
        return 1;
    }

    return 1;
}

Server:Player_SavePos(playerid, bool:save)
{
    if (GetPlayerState(playerid) != PLAYER_STATE_SPECTATING)
    {
        GetPlayerPos(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]);
        GetPlayerFacingAngle(playerid, PlayerData[playerid][pPos][3]);
        PlayerData[playerid][pInterior] = GetPlayerInterior(playerid);
        PlayerData[playerid][pWorld] = GetPlayerVirtualWorld(playerid);
    }

    if(save)
    {
        new query[256];
        mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET LastX = %f, LastY = %f, LastZ = %f, LastRot = %f, Interior = %i, World = %i WHERE id = %i LIMIT 1", PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], PlayerData[playerid][pPos][3], PlayerData[playerid][pInterior], PlayerData[playerid][pWorld], PlayerData[playerid][pSQLID]);
        mysql_tquery(m_Handle, query);
    }
    return 1;
}

Server:OnVehicleTextdraw(playerid)
{
    DestroyDynamic3DTextLabel(vehicleTextdraw[playerid]);
    playerTextdraw[playerid] = false;
    return 1;
}

Server:LoadPlayerTextdraw(playerid)
{
    //Phone:
    UI_Phone(playerid);
    UI_PhoneCase(playerid);

    //HUD:
    UI_Huds(playerid);
    UI_StreetHuds(playerid);

    //Tuning:
    Tuning_CreateTD(playerid);

		//MDC:
		UI_MDC(playerid);

		// ALPR:
		UI_ALPR(playerid);

		IdentityCard[playerid][0] = CreatePlayerTextDraw(playerid, 452.400238, 129.768966, "box");
		PlayerTextDrawLetterSize(playerid, IdentityCard[playerid][0], 0.000000, 6.960001);
		PlayerTextDrawTextSize(playerid, IdentityCard[playerid][0], 504.000000, 0.000000);
		PlayerTextDrawAlignment(playerid, IdentityCard[playerid][0], 1);
		PlayerTextDrawColor(playerid, IdentityCard[playerid][0], -1);
		PlayerTextDrawUseBox(playerid, IdentityCard[playerid][0], 1);
		PlayerTextDrawBoxColor(playerid, IdentityCard[playerid][0], -2139062017);
		PlayerTextDrawSetShadow(playerid, IdentityCard[playerid][0], 0);
		PlayerTextDrawSetOutline(playerid, IdentityCard[playerid][0], 0);
		PlayerTextDrawBackgroundColor(playerid, IdentityCard[playerid][0], 255);
		PlayerTextDrawFont(playerid, IdentityCard[playerid][0], 1);
		PlayerTextDrawSetProportional(playerid, IdentityCard[playerid][0], 1);
		PlayerTextDrawSetShadow(playerid, IdentityCard[playerid][0], 0);

		IdentityCard[playerid][1] = CreatePlayerTextDraw(playerid, 406.800567, 132.124465, "");
		PlayerTextDrawLetterSize(playerid, IdentityCard[playerid][1], 0.000000, 0.000000);
		PlayerTextDrawTextSize(playerid, IdentityCard[playerid][1], 138.000000, 93.000000);
		PlayerTextDrawAlignment(playerid, IdentityCard[playerid][1], 1);
		PlayerTextDrawColor(playerid, IdentityCard[playerid][1], -1);
		PlayerTextDrawSetShadow(playerid, IdentityCard[playerid][1], 0);
		PlayerTextDrawSetOutline(playerid, IdentityCard[playerid][1], 0);
		PlayerTextDrawBackgroundColor(playerid, IdentityCard[playerid][1], -2139062272);
		PlayerTextDrawFont(playerid, IdentityCard[playerid][1], 5);
		PlayerTextDrawSetProportional(playerid, IdentityCard[playerid][1], 0);
		PlayerTextDrawSetShadow(playerid, IdentityCard[playerid][1], 0);
		PlayerTextDrawSetPreviewModel(playerid, IdentityCard[playerid][1], 0);
		PlayerTextDrawFont(playerid, IdentityCard[playerid][1], TEXT_DRAW_FONT_MODEL_PREVIEW);
		PlayerTextDrawSetPreviewRot(playerid, IdentityCard[playerid][1], 0.000000, 0.000000, 0.000000, 1.000000);

		IdentityCard[playerid][2] = CreatePlayerTextDraw(playerid, 447.400360, 111.693199, "mdl-20053:license");
		PlayerTextDrawLetterSize(playerid, IdentityCard[playerid][2], 0.000000, 0.000000);
		PlayerTextDrawTextSize(playerid, IdentityCard[playerid][2], 159.000000, 127.000000);
		PlayerTextDrawAlignment(playerid, IdentityCard[playerid][2], 1);
		PlayerTextDrawColor(playerid, IdentityCard[playerid][2], -1);
		PlayerTextDrawSetShadow(playerid, IdentityCard[playerid][2], 0);
		PlayerTextDrawSetOutline(playerid, IdentityCard[playerid][2], 0);
		PlayerTextDrawBackgroundColor(playerid, IdentityCard[playerid][2], 255);
		PlayerTextDrawFont(playerid, IdentityCard[playerid][2], 4);
		PlayerTextDrawSetProportional(playerid, IdentityCard[playerid][2], 0);
		PlayerTextDrawSetShadow(playerid, IdentityCard[playerid][2], 0);

		IdentityCard[playerid][3] = CreatePlayerTextDraw(playerid, 498.099822, 142.122329, "ADNAN_GUNGOREN");
		PlayerTextDrawLetterSize(playerid, IdentityCard[playerid][3], 0.152399, 1.001466);
		PlayerTextDrawAlignment(playerid, IdentityCard[playerid][3], 1);
		PlayerTextDrawColor(playerid, IdentityCard[playerid][3], 255);
		PlayerTextDrawSetShadow(playerid, IdentityCard[playerid][3], 0);
		PlayerTextDrawSetOutline(playerid, IdentityCard[playerid][3], 0);
		PlayerTextDrawBackgroundColor(playerid, IdentityCard[playerid][3], 255);
		PlayerTextDrawFont(playerid, IdentityCard[playerid][3], 2);
		PlayerTextDrawSetProportional(playerid, IdentityCard[playerid][3], 1);
		PlayerTextDrawSetShadow(playerid, IdentityCard[playerid][3], 0);

		IdentityCard[playerid][4] = CreatePlayerTextDraw(playerid, 498.099822, 159.423385, "BIRINCIL_ADRES");
		PlayerTextDrawLetterSize(playerid, IdentityCard[playerid][4], 0.152399, 1.001466);
		PlayerTextDrawAlignment(playerid, IdentityCard[playerid][4], 1);
		PlayerTextDrawColor(playerid, IdentityCard[playerid][4], 255);
		PlayerTextDrawSetShadow(playerid, IdentityCard[playerid][4], 0);
		PlayerTextDrawSetOutline(playerid, IdentityCard[playerid][4], 0);
		PlayerTextDrawBackgroundColor(playerid, IdentityCard[playerid][4], 255);
		PlayerTextDrawFont(playerid, IdentityCard[playerid][4], 2);
		PlayerTextDrawSetProportional(playerid, IdentityCard[playerid][4], 1);
		PlayerTextDrawSetShadow(playerid, IdentityCard[playerid][4], 0);

		IdentityCard[playerid][5] = CreatePlayerTextDraw(playerid, 460.099670, 206.328018, "VAR");
		PlayerTextDrawLetterSize(playerid, IdentityCard[playerid][5], 0.103399, 0.791467);
		PlayerTextDrawAlignment(playerid, IdentityCard[playerid][5], 1);
		PlayerTextDrawColor(playerid, IdentityCard[playerid][5], 255);
		PlayerTextDrawSetShadow(playerid, IdentityCard[playerid][5], 0);
		PlayerTextDrawSetOutline(playerid, IdentityCard[playerid][5], 0);
		PlayerTextDrawBackgroundColor(playerid, IdentityCard[playerid][5], 255);
		PlayerTextDrawFont(playerid, IdentityCard[playerid][5], 2);
		PlayerTextDrawSetProportional(playerid, IdentityCard[playerid][5], 1);
		PlayerTextDrawSetShadow(playerid, IdentityCard[playerid][5], 0);

		IdentityCard[playerid][6] = CreatePlayerTextDraw(playerid, 460.099670, 221.128921, "VAR");
		PlayerTextDrawLetterSize(playerid, IdentityCard[playerid][6], 0.103399, 0.791467);
		PlayerTextDrawAlignment(playerid, IdentityCard[playerid][6], 1);
		PlayerTextDrawColor(playerid, IdentityCard[playerid][6], 255);
		PlayerTextDrawSetShadow(playerid, IdentityCard[playerid][6], 0);
		PlayerTextDrawSetOutline(playerid, IdentityCard[playerid][6], 0);
		PlayerTextDrawBackgroundColor(playerid, IdentityCard[playerid][6], 255);
		PlayerTextDrawFont(playerid, IdentityCard[playerid][6], 2);
		PlayerTextDrawSetProportional(playerid, IdentityCard[playerid][6], 1);
		PlayerTextDrawSetShadow(playerid, IdentityCard[playerid][6], 0);

		IdentityCard[playerid][7] = CreatePlayerTextDraw(playerid, 497.400177, 205.928024, "VAR");
		PlayerTextDrawLetterSize(playerid, IdentityCard[playerid][7], 0.103399, 0.791467);
		PlayerTextDrawAlignment(playerid, IdentityCard[playerid][7], 1);
		PlayerTextDrawColor(playerid, IdentityCard[playerid][7], 255);
		PlayerTextDrawSetShadow(playerid, IdentityCard[playerid][7], 0);
		PlayerTextDrawSetOutline(playerid, IdentityCard[playerid][7], 0);
		PlayerTextDrawBackgroundColor(playerid, IdentityCard[playerid][7], 255);
		PlayerTextDrawFont(playerid, IdentityCard[playerid][7], 2);
		PlayerTextDrawSetProportional(playerid, IdentityCard[playerid][7], 1);
		PlayerTextDrawSetShadow(playerid, IdentityCard[playerid][7], 0);

		IdentityCard[playerid][8] = CreatePlayerTextDraw(playerid, 497.800170, 220.830017, "VAR");
		PlayerTextDrawLetterSize(playerid, IdentityCard[playerid][8], 0.103399, 0.791467);
		PlayerTextDrawAlignment(playerid, IdentityCard[playerid][8], 1);
		PlayerTextDrawColor(playerid, IdentityCard[playerid][8], 255);
		PlayerTextDrawSetShadow(playerid, IdentityCard[playerid][8], 0);
		PlayerTextDrawSetOutline(playerid, IdentityCard[playerid][8], 0);
		PlayerTextDrawBackgroundColor(playerid, IdentityCard[playerid][8], 255);
		PlayerTextDrawFont(playerid, IdentityCard[playerid][8], 2);
		PlayerTextDrawSetProportional(playerid, IdentityCard[playerid][8], 1);
		PlayerTextDrawSetShadow(playerid, IdentityCard[playerid][8], 0);

		IdentityCard[playerid][9] = CreatePlayerTextDraw(playerid, 170.800277, 314.837646, "ADNAN_GUNGOREN_SANA_LISANSINI_GOSTERMEK_ISTIYOR.");
		PlayerTextDrawLetterSize(playerid, IdentityCard[playerid][9], 0.261999, 1.361066);
		PlayerTextDrawAlignment(playerid, IdentityCard[playerid][9], 1);
		PlayerTextDrawColor(playerid, IdentityCard[playerid][9], -1);
		PlayerTextDrawSetShadow(playerid, IdentityCard[playerid][9], 0);
		PlayerTextDrawSetOutline(playerid, IdentityCard[playerid][9], 0);
		PlayerTextDrawBackgroundColor(playerid, IdentityCard[playerid][9], 255);
		PlayerTextDrawFont(playerid, IdentityCard[playerid][9], 2);
		PlayerTextDrawSetProportional(playerid, IdentityCard[playerid][9], 1);
		PlayerTextDrawSetShadow(playerid, IdentityCard[playerid][9], 0);

		IdentityCard[playerid][10] = CreatePlayerTextDraw(playerid, 147.300201, 327.586730, "GORMEK_ICIN_~g~Y_~w~TUSUNA,SOHBETE_YAZDIRMAK_ICIN_~r~N_~w~TUSUNA_BASIN.");
		PlayerTextDrawLetterSize(playerid, IdentityCard[playerid][10], 0.249999, 1.744354);
		PlayerTextDrawAlignment(playerid, IdentityCard[playerid][10], 1);
		PlayerTextDrawColor(playerid, IdentityCard[playerid][10], -1);
		PlayerTextDrawSetShadow(playerid, IdentityCard[playerid][10], 0);
		PlayerTextDrawSetOutline(playerid, IdentityCard[playerid][10], 0);
		PlayerTextDrawBackgroundColor(playerid, IdentityCard[playerid][10], 255);
		PlayerTextDrawFont(playerid, IdentityCard[playerid][10], 2);
		PlayerTextDrawSetProportional(playerid, IdentityCard[playerid][10], 1);
		PlayerTextDrawSetShadow(playerid, IdentityCard[playerid][10], 0);


    drug_effect[playerid] = CreatePlayerTextDraw(playerid, 320.000000, 0.000000, "_");
    PlayerTextDrawAlignment(playerid, drug_effect[playerid], 2);
    PlayerTextDrawBackgroundColor(playerid, drug_effect[playerid], 255);
    PlayerTextDrawFont(playerid, drug_effect[playerid], 1);
    PlayerTextDrawLetterSize(playerid, drug_effect[playerid], 0.500000, 53.000000);
    PlayerTextDrawColor(playerid, drug_effect[playerid], -1);
    PlayerTextDrawSetOutline(playerid, drug_effect[playerid], 0);
    PlayerTextDrawSetProportional(playerid, drug_effect[playerid], 1);
    PlayerTextDrawSetShadow(playerid, drug_effect[playerid], 1);
    PlayerTextDrawUseBox(playerid, drug_effect[playerid], 1);
    PlayerTextDrawBoxColor(playerid, drug_effect[playerid], -14837680);
    PlayerTextDrawTextSize(playerid, drug_effect[playerid], 0.000000, 1215.000000);
    PlayerTextDrawSetSelectable(playerid, drug_effect[playerid], 0);

    PropertyLightsTXD[playerid] = CreatePlayerTextDraw(playerid, 644.000000, 1.000000, "_");
    PlayerTextDrawBackgroundColor(playerid, PropertyLightsTXD[playerid], 255);
    PlayerTextDrawFont(playerid, PropertyLightsTXD[playerid], 1);
    PlayerTextDrawLetterSize(playerid, PropertyLightsTXD[playerid], 0.530000, 51.000000);
    PlayerTextDrawColor(playerid, PropertyLightsTXD[playerid], -1);
    PlayerTextDrawSetOutline(playerid, PropertyLightsTXD[playerid], 0);
    PlayerTextDrawSetProportional(playerid, PropertyLightsTXD[playerid], 1);
    PlayerTextDrawSetShadow(playerid, PropertyLightsTXD[playerid], 1);
    PlayerTextDrawUseBox(playerid, PropertyLightsTXD[playerid], 1);
    PlayerTextDrawBoxColor(playerid, PropertyLightsTXD[playerid], 119);
    PlayerTextDrawTextSize(playerid, PropertyLightsTXD[playerid], -6.000000, 30.000000);
    PlayerTextDrawSetSelectable(playerid, PropertyLightsTXD[playerid], 0);

    PlayerOffer[playerid] = CreatePlayerTextDraw(playerid, 97.333351, 291.629669, "YENI_PLAKAN_AYARLANDI");
    PlayerTextDrawLetterSize(playerid, PlayerOffer[playerid], 0.248666, 1.259851);
    PlayerTextDrawAlignment(playerid, PlayerOffer[playerid], 1);
    PlayerTextDrawColor(playerid, PlayerOffer[playerid], -1);
    PlayerTextDrawSetShadow(playerid, PlayerOffer[playerid], 0);
    PlayerTextDrawSetOutline(playerid, PlayerOffer[playerid], 1);
    PlayerTextDrawBackgroundColor(playerid, PlayerOffer[playerid], 255);
    PlayerTextDrawFont(playerid, PlayerOffer[playerid], 2);
    PlayerTextDrawSetProportional(playerid, PlayerOffer[playerid], 1);
    PlayerTextDrawSetShadow(playerid, PlayerOffer[playerid], 0);

    //Default Textdraws
    PlayerOffer2[playerid] = CreatePlayerTextDraw(playerid, 97.333351, 291.629669, "~y~............");
    PlayerTextDrawLetterSize(playerid, PlayerOffer2[playerid], 0.216666, 1.139555);
    PlayerTextDrawAlignment(playerid, PlayerOffer2[playerid], 1);
    PlayerTextDrawColor(playerid, PlayerOffer2[playerid], -1523963137);
    PlayerTextDrawSetShadow(playerid, PlayerOffer2[playerid], 0);
    PlayerTextDrawSetOutline(playerid, PlayerOffer2[playerid], 1);
    PlayerTextDrawBackgroundColor(playerid, PlayerOffer2[playerid], 255);
    PlayerTextDrawFont(playerid, PlayerOffer2[playerid], 2);
    PlayerTextDrawSetProportional(playerid, PlayerOffer2[playerid], 1);
    PlayerTextDrawSetShadow(playerid, PlayerOffer2[playerid], 0);

    //Spectators:
    SpectatorTD[playerid] = CreatePlayerTextDraw(playerid, 380.846374, 286.452758, "IZLENEN_KISI:");
    PlayerTextDrawLetterSize(playerid, SpectatorTD[playerid], 0.206330, 1.118813);
    PlayerTextDrawAlignment(playerid, SpectatorTD[playerid], 1);
    PlayerTextDrawColor(playerid, SpectatorTD[playerid], -2147483393);
    PlayerTextDrawSetShadow(playerid, SpectatorTD[playerid], 0);
    PlayerTextDrawSetOutline(playerid, SpectatorTD[playerid], 1);
    PlayerTextDrawBackgroundColor(playerid, SpectatorTD[playerid], 255);
    PlayerTextDrawFont(playerid, SpectatorTD[playerid], 2);
    PlayerTextDrawSetProportional(playerid, SpectatorTD[playerid], 1);
    PlayerTextDrawSetShadow(playerid, SpectatorTD[playerid], 0);

    //Taxi Fair Textdraws:
    TaxiFair_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 99.032882, 309.551818, "GECEN_SURE:");
    PlayerTextDrawLetterSize(playerid, TaxiFair_PTD[playerid][0], 0.231333, 0.961183);
    PlayerTextDrawAlignment(playerid, TaxiFair_PTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, TaxiFair_PTD[playerid][0], -457153537);
    PlayerTextDrawSetShadow(playerid, TaxiFair_PTD[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, TaxiFair_PTD[playerid][0], 1);
    PlayerTextDrawBackgroundColor(playerid, TaxiFair_PTD[playerid][0], 255);
    PlayerTextDrawFont(playerid, TaxiFair_PTD[playerid][0], 2);
    PlayerTextDrawSetProportional(playerid, TaxiFair_PTD[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, TaxiFair_PTD[playerid][0], 0);

    TaxiFair_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 98.899574, 301.151306, "TAKSIMETRE");
    PlayerTextDrawLetterSize(playerid, TaxiFair_PTD[playerid][1], 0.231333, 0.961183);
    PlayerTextDrawAlignment(playerid, TaxiFair_PTD[playerid][1], 1);
    PlayerTextDrawColor(playerid, TaxiFair_PTD[playerid][1], -2147483393);
    PlayerTextDrawSetShadow(playerid, TaxiFair_PTD[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, TaxiFair_PTD[playerid][1], 1);
    PlayerTextDrawBackgroundColor(playerid, TaxiFair_PTD[playerid][1], 255);
    PlayerTextDrawFont(playerid, TaxiFair_PTD[playerid][1], 2);
    PlayerTextDrawSetProportional(playerid, TaxiFair_PTD[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, TaxiFair_PTD[playerid][1], 0);

    TaxiFair_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 163.800765, 309.551818, "0_SANIYE");
    PlayerTextDrawLetterSize(playerid, TaxiFair_PTD[playerid][2], 0.231333, 0.961183);
    PlayerTextDrawAlignment(playerid, TaxiFair_PTD[playerid][2], 1);
    PlayerTextDrawColor(playerid, TaxiFair_PTD[playerid][2], -1);
    PlayerTextDrawSetShadow(playerid, TaxiFair_PTD[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, TaxiFair_PTD[playerid][2], 1);
    PlayerTextDrawBackgroundColor(playerid, TaxiFair_PTD[playerid][2], 255);
    PlayerTextDrawFont(playerid, TaxiFair_PTD[playerid][2], 2);
    PlayerTextDrawSetProportional(playerid, TaxiFair_PTD[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, TaxiFair_PTD[playerid][2], 0);

    TaxiFair_PTD[playerid][3] = CreatePlayerTextDraw(playerid, 99.032882, 318.452362, "UCRET:");
    PlayerTextDrawLetterSize(playerid, TaxiFair_PTD[playerid][3], 0.231333, 0.961183);
    PlayerTextDrawAlignment(playerid, TaxiFair_PTD[playerid][3], 1);
    PlayerTextDrawColor(playerid, TaxiFair_PTD[playerid][3], -457153537);
    PlayerTextDrawSetShadow(playerid, TaxiFair_PTD[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, TaxiFair_PTD[playerid][3], 1);
    PlayerTextDrawBackgroundColor(playerid, TaxiFair_PTD[playerid][3], 255);
    PlayerTextDrawFont(playerid, TaxiFair_PTD[playerid][3], 2);
    PlayerTextDrawSetProportional(playerid, TaxiFair_PTD[playerid][3], 1);
    PlayerTextDrawSetShadow(playerid, TaxiFair_PTD[playerid][3], 0);

    TaxiFair_PTD[playerid][4] = CreatePlayerTextDraw(playerid, 133.632781, 318.452362, "$0.00");
    PlayerTextDrawLetterSize(playerid, TaxiFair_PTD[playerid][4], 0.231333, 0.961183);
    PlayerTextDrawAlignment(playerid, TaxiFair_PTD[playerid][4], 1);
    PlayerTextDrawColor(playerid, TaxiFair_PTD[playerid][4], -1);
    PlayerTextDrawSetShadow(playerid, TaxiFair_PTD[playerid][4], 0);
    PlayerTextDrawSetOutline(playerid, TaxiFair_PTD[playerid][4], 1);
    PlayerTextDrawBackgroundColor(playerid, TaxiFair_PTD[playerid][4], 255);
    PlayerTextDrawFont(playerid, TaxiFair_PTD[playerid][4], 2);
    PlayerTextDrawSetProportional(playerid, TaxiFair_PTD[playerid][4], 1);
    PlayerTextDrawSetShadow(playerid, TaxiFair_PTD[playerid][4], 0);

    ColorPanel[playerid][0] = CreatePlayerTextDraw(playerid, 139.436340, 323.000030, "");
    PlayerTextDrawLetterSize(playerid, ColorPanel[playerid][0], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, ColorPanel[playerid][0], 12.000000, 14.000000);
    PlayerTextDrawAlignment(playerid, ColorPanel[playerid][0], 1);
    PlayerTextDrawColor(playerid, ColorPanel[playerid][0], -1);
    PlayerTextDrawSetShadow(playerid, ColorPanel[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, ColorPanel[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, ColorPanel[playerid][0], -16776961);
    PlayerTextDrawFont(playerid, ColorPanel[playerid][0], 5);
    PlayerTextDrawSetProportional(playerid, ColorPanel[playerid][0], 0);
    PlayerTextDrawSetShadow(playerid, ColorPanel[playerid][0], 0);
    PlayerTextDrawSetSelectable(playerid, ColorPanel[playerid][0], true);
    PlayerTextDrawSetPreviewModel(playerid, ColorPanel[playerid][0], 0);
    PlayerTextDrawSetPreviewRot(playerid, ColorPanel[playerid][0], 0.000000, 0.000000, 0.000000, -1.000000);

    ColorPanel[playerid][1] = CreatePlayerTextDraw(playerid, 151.149368, 323.000030, "");
    PlayerTextDrawLetterSize(playerid, ColorPanel[playerid][1], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, ColorPanel[playerid][1], 12.000000, 14.000000);
    PlayerTextDrawAlignment(playerid, ColorPanel[playerid][1], 1);
    PlayerTextDrawColor(playerid, ColorPanel[playerid][1], -1);
    PlayerTextDrawSetShadow(playerid, ColorPanel[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, ColorPanel[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, ColorPanel[playerid][1], -1);
    PlayerTextDrawFont(playerid, ColorPanel[playerid][1], 5);
    PlayerTextDrawSetProportional(playerid, ColorPanel[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, ColorPanel[playerid][1], 0);
    PlayerTextDrawSetSelectable(playerid, ColorPanel[playerid][1], true);
    PlayerTextDrawSetPreviewModel(playerid, ColorPanel[playerid][1], 0);
    PlayerTextDrawSetPreviewRot(playerid, ColorPanel[playerid][1], 0.000000, 0.000000, 0.000000, -1.000000);

    ColorPanel[playerid][2] = CreatePlayerTextDraw(playerid, 163.330917, 323.000030, "");
    PlayerTextDrawLetterSize(playerid, ColorPanel[playerid][2], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, ColorPanel[playerid][2], 12.000000, 14.000000);
    PlayerTextDrawAlignment(playerid, ColorPanel[playerid][2], 1);
    PlayerTextDrawColor(playerid, ColorPanel[playerid][2], -1);
    PlayerTextDrawSetShadow(playerid, ColorPanel[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, ColorPanel[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, ColorPanel[playerid][2], 65535);
    PlayerTextDrawFont(playerid, ColorPanel[playerid][2], 5);
    PlayerTextDrawSetProportional(playerid, ColorPanel[playerid][2], 0);
    PlayerTextDrawSetShadow(playerid, ColorPanel[playerid][2], 0);
    PlayerTextDrawSetSelectable(playerid, ColorPanel[playerid][2], true);
    PlayerTextDrawSetPreviewModel(playerid, ColorPanel[playerid][2], 0);
    PlayerTextDrawSetPreviewRot(playerid, ColorPanel[playerid][2], 0.000000, 0.000000, 0.000000, -1.000000);

    ColorPanel[playerid][3] = CreatePlayerTextDraw(playerid, 175.043945, 323.000000, "");
    PlayerTextDrawLetterSize(playerid, ColorPanel[playerid][3], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, ColorPanel[playerid][3], 12.000000, 14.000000);
    PlayerTextDrawAlignment(playerid, ColorPanel[playerid][3], 1);
    PlayerTextDrawColor(playerid, ColorPanel[playerid][3], -1);
    PlayerTextDrawSetShadow(playerid, ColorPanel[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, ColorPanel[playerid][3], 0);
    PlayerTextDrawBackgroundColor(playerid, ColorPanel[playerid][3], -65281);
    PlayerTextDrawFont(playerid, ColorPanel[playerid][3], 5);
    PlayerTextDrawSetProportional(playerid, ColorPanel[playerid][3], 0);
    PlayerTextDrawSetShadow(playerid, ColorPanel[playerid][3], 0);
    PlayerTextDrawSetSelectable(playerid, ColorPanel[playerid][3], true);
    PlayerTextDrawSetPreviewModel(playerid, ColorPanel[playerid][3], 0);
    PlayerTextDrawSetPreviewRot(playerid, ColorPanel[playerid][3], 0.000000, 0.000000, 0.000000, -1.000000);

    ColorPanel[playerid][4] = CreatePlayerTextDraw(playerid, 139.436340, 337.000030, "");
    PlayerTextDrawLetterSize(playerid, ColorPanel[playerid][4], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, ColorPanel[playerid][4], 12.000000, 14.000000);
    PlayerTextDrawAlignment(playerid, ColorPanel[playerid][4], 1);
    PlayerTextDrawColor(playerid, ColorPanel[playerid][4], -1);
    PlayerTextDrawSetShadow(playerid, ColorPanel[playerid][4], 0);
    PlayerTextDrawSetOutline(playerid, ColorPanel[playerid][4], 0);
    PlayerTextDrawBackgroundColor(playerid, ColorPanel[playerid][4], -2147450625);
    PlayerTextDrawFont(playerid, ColorPanel[playerid][4], 5);
    PlayerTextDrawSetProportional(playerid, ColorPanel[playerid][4], 0);
    PlayerTextDrawSetShadow(playerid, ColorPanel[playerid][4], 0);
    PlayerTextDrawSetSelectable(playerid, ColorPanel[playerid][4], true);
    PlayerTextDrawSetPreviewModel(playerid, ColorPanel[playerid][4], 0);
    PlayerTextDrawSetPreviewRot(playerid, ColorPanel[playerid][4], 0.000000, 0.000000, 0.000000, -1.000000);

    ColorPanel[playerid][5] = CreatePlayerTextDraw(playerid, 151.617889, 337.000061, "");
    PlayerTextDrawLetterSize(playerid, ColorPanel[playerid][5], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, ColorPanel[playerid][5], 12.000000, 14.000000);
    PlayerTextDrawAlignment(playerid, ColorPanel[playerid][5], 1);
    PlayerTextDrawColor(playerid, ColorPanel[playerid][5], -1);
    PlayerTextDrawSetShadow(playerid, ColorPanel[playerid][5], 0);
    PlayerTextDrawSetOutline(playerid, ColorPanel[playerid][5], 0);
    PlayerTextDrawBackgroundColor(playerid, ColorPanel[playerid][5], 16711935);
    PlayerTextDrawFont(playerid, ColorPanel[playerid][5], 5);
    PlayerTextDrawSetProportional(playerid, ColorPanel[playerid][5], 0);
    PlayerTextDrawSetShadow(playerid, ColorPanel[playerid][5], 0);
    PlayerTextDrawSetSelectable(playerid, ColorPanel[playerid][5], true);
    PlayerTextDrawSetPreviewModel(playerid, ColorPanel[playerid][5], 0);
    PlayerTextDrawSetPreviewRot(playerid, ColorPanel[playerid][5], 0.000000, 0.000000, 0.000000, -1.000000);

    ColorPanel[playerid][6] = CreatePlayerTextDraw(playerid, 163.799438, 337.000061, "");
    PlayerTextDrawLetterSize(playerid, ColorPanel[playerid][6], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, ColorPanel[playerid][6], 12.000000, 14.000000);
    PlayerTextDrawAlignment(playerid, ColorPanel[playerid][6], 1);
    PlayerTextDrawColor(playerid, ColorPanel[playerid][6], -1);
    PlayerTextDrawSetShadow(playerid, ColorPanel[playerid][6], 0);
    PlayerTextDrawSetOutline(playerid, ColorPanel[playerid][6], 0);
    PlayerTextDrawBackgroundColor(playerid, ColorPanel[playerid][6], -16711681);
    PlayerTextDrawFont(playerid, ColorPanel[playerid][6], 5);
    PlayerTextDrawSetProportional(playerid, ColorPanel[playerid][6], 0);
    PlayerTextDrawSetShadow(playerid, ColorPanel[playerid][6], 0);
    PlayerTextDrawSetSelectable(playerid, ColorPanel[playerid][6], true);
    PlayerTextDrawSetPreviewModel(playerid, ColorPanel[playerid][6], 0);
    PlayerTextDrawSetPreviewRot(playerid, ColorPanel[playerid][6], 0.000000, 0.000000, 0.000000, -1.000000);

    ColorPanel[playerid][7] = CreatePlayerTextDraw(playerid, 175.043945, 337.000061, "");
    PlayerTextDrawLetterSize(playerid, ColorPanel[playerid][7], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, ColorPanel[playerid][7], 12.000000, 14.000000);
    PlayerTextDrawAlignment(playerid, ColorPanel[playerid][7], 1);
    PlayerTextDrawColor(playerid, ColorPanel[playerid][7], -1);
    PlayerTextDrawSetShadow(playerid, ColorPanel[playerid][7], 0);
    PlayerTextDrawSetOutline(playerid, ColorPanel[playerid][7], 0);
    PlayerTextDrawBackgroundColor(playerid, ColorPanel[playerid][7], -2147483393);
    PlayerTextDrawFont(playerid, ColorPanel[playerid][7], 5);
    PlayerTextDrawSetProportional(playerid, ColorPanel[playerid][7], 0);
    PlayerTextDrawSetShadow(playerid, ColorPanel[playerid][7], 0);
    PlayerTextDrawSetSelectable(playerid, ColorPanel[playerid][7], true);
    PlayerTextDrawSetPreviewModel(playerid, ColorPanel[playerid][7], 0);
    PlayerTextDrawSetPreviewRot(playerid, ColorPanel[playerid][7], 0.000000, 0.000000, 0.000000, -1.000000);

    ColorPanel[playerid][8] = CreatePlayerTextDraw(playerid, 126.486099, 354.500030, "Birincil_Renkler");
    PlayerTextDrawLetterSize(playerid, ColorPanel[playerid][8], 0.341434, 1.430832);
    PlayerTextDrawAlignment(playerid, ColorPanel[playerid][8], 1);
    PlayerTextDrawColor(playerid, ColorPanel[playerid][8], -1);
    PlayerTextDrawSetShadow(playerid, ColorPanel[playerid][8], 0);
    PlayerTextDrawSetOutline(playerid, ColorPanel[playerid][8], 1);
    PlayerTextDrawBackgroundColor(playerid, ColorPanel[playerid][8], 255);
    PlayerTextDrawFont(playerid, ColorPanel[playerid][8], 1);
    PlayerTextDrawSetProportional(playerid, ColorPanel[playerid][8], 1);
    PlayerTextDrawSetShadow(playerid, ColorPanel[playerid][8], 0);
    PlayerTextDrawSetSelectable(playerid, ColorPanel[playerid][8], true);

    ColorPanel[playerid][9] = CreatePlayerTextDraw(playerid, 186.756942, 329.416625, "LD_BEAT:RIGHT");
    PlayerTextDrawLetterSize(playerid, ColorPanel[playerid][9], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, ColorPanel[playerid][9], 16.000000, 17.000000);
    PlayerTextDrawAlignment(playerid, ColorPanel[playerid][9], 1);
    PlayerTextDrawColor(playerid, ColorPanel[playerid][9], -1);
    PlayerTextDrawSetShadow(playerid, ColorPanel[playerid][9], 0);
    PlayerTextDrawSetOutline(playerid, ColorPanel[playerid][9], 0);
    PlayerTextDrawBackgroundColor(playerid, ColorPanel[playerid][9], 255);
    PlayerTextDrawFont(playerid, ColorPanel[playerid][9], 4);
    PlayerTextDrawSetProportional(playerid, ColorPanel[playerid][9], 0);
    PlayerTextDrawSetShadow(playerid, ColorPanel[playerid][9], 0);
    PlayerTextDrawSetSelectable(playerid, ColorPanel[playerid][9], true);

    //Unscrambler Textdraws:
    Unscrambler_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 137.369461, 273.593383, "~y~/uns ~w~<KELIME>");
    PlayerTextDrawLetterSize(playerid, Unscrambler_PTD[playerid][0], 0.206330, 1.118813);
    PlayerTextDrawAlignment(playerid, Unscrambler_PTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, Unscrambler_PTD[playerid][0], -490707969);
    PlayerTextDrawSetShadow(playerid, Unscrambler_PTD[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, Unscrambler_PTD[playerid][0], 1);
    PlayerTextDrawBackgroundColor(playerid, Unscrambler_PTD[playerid][0], 255);
    PlayerTextDrawFont(playerid, Unscrambler_PTD[playerid][0], 2);
    PlayerTextDrawSetProportional(playerid, Unscrambler_PTD[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, Unscrambler_PTD[playerid][0], 0);

    Unscrambler_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 141.369705, 285.194091, "scrambledword");
    PlayerTextDrawLetterSize(playerid, Unscrambler_PTD[playerid][1], 0.206330, 1.118813);
    PlayerTextDrawAlignment(playerid, Unscrambler_PTD[playerid][1], 1);
    PlayerTextDrawColor(playerid, Unscrambler_PTD[playerid][1], -1);
    PlayerTextDrawSetShadow(playerid, Unscrambler_PTD[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, Unscrambler_PTD[playerid][1], 1);
    PlayerTextDrawBackgroundColor(playerid, Unscrambler_PTD[playerid][1], 255);
    PlayerTextDrawFont(playerid, Unscrambler_PTD[playerid][1], 2);
    PlayerTextDrawSetProportional(playerid, Unscrambler_PTD[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, Unscrambler_PTD[playerid][1], 0);

    Unscrambler_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 137.902801, 296.924377, "~r~KELIMEYI_COZMEK_ICIN_~w~10_~r~SANIYEN_VAR");
    PlayerTextDrawLetterSize(playerid, Unscrambler_PTD[playerid][2], 0.206330, 1.118813);
    PlayerTextDrawAlignment(playerid, Unscrambler_PTD[playerid][2], 1);
    PlayerTextDrawColor(playerid, Unscrambler_PTD[playerid][2], -2147483393);
    PlayerTextDrawSetShadow(playerid, Unscrambler_PTD[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, Unscrambler_PTD[playerid][2], 1);
    PlayerTextDrawBackgroundColor(playerid, Unscrambler_PTD[playerid][2], 255);
    PlayerTextDrawFont(playerid, Unscrambler_PTD[playerid][2], 2);
    PlayerTextDrawSetProportional(playerid, Unscrambler_PTD[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, Unscrambler_PTD[playerid][2], 0);

    //Trace System
    Trace_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 98.632888, 309.551818, "TRACE_INITIATED");
    PlayerTextDrawLetterSize(playerid, Trace_PTD[playerid][0], 0.300000, 1.205925);
    PlayerTextDrawAlignment(playerid, Trace_PTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, Trace_PTD[playerid][0], -457153537);
    PlayerTextDrawSetShadow(playerid, Trace_PTD[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, Trace_PTD[playerid][0], 1);
    PlayerTextDrawBackgroundColor(playerid, Trace_PTD[playerid][0], 255);
    PlayerTextDrawFont(playerid, Trace_PTD[playerid][0], 2);
    PlayerTextDrawSetProportional(playerid, Trace_PTD[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, Trace_PTD[playerid][0], 0);

    FoodOrder[playerid][0] = CreatePlayerTextDraw(playerid, 127.423080, 80.916671, "box");
    PlayerTextDrawLetterSize(playerid, FoodOrder[playerid][0], 0.000000, 31.317710);
    PlayerTextDrawTextSize(playerid, FoodOrder[playerid][0], 536.000000, 0.000000);
    PlayerTextDrawAlignment(playerid, FoodOrder[playerid][0], 1);
    PlayerTextDrawColor(playerid, FoodOrder[playerid][0], -1);
    PlayerTextDrawUseBox(playerid, FoodOrder[playerid][0], 1);
    PlayerTextDrawBoxColor(playerid, FoodOrder[playerid][0], 255);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, FoodOrder[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, FoodOrder[playerid][0], 255);
    PlayerTextDrawFont(playerid, FoodOrder[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, FoodOrder[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][0], 0);

    FoodOrder[playerid][1] = CreatePlayerTextDraw(playerid, 143.352844, 94.333312, "Business_Type");
    PlayerTextDrawLetterSize(playerid, FoodOrder[playerid][1], 0.724685, 2.819167);
    PlayerTextDrawAlignment(playerid, FoodOrder[playerid][1], 1);
    PlayerTextDrawColor(playerid, FoodOrder[playerid][1], -1);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, FoodOrder[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, FoodOrder[playerid][1], 255);
    PlayerTextDrawFont(playerid, FoodOrder[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid, FoodOrder[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][1], 0);

		StealPlate[playerid][0] = CreatePlayerTextDraw(playerid, 194.499267, 332.021270, "mdl-20053:plaka");
		PlayerTextDrawLetterSize(playerid, StealPlate[playerid][0], 0.000000, 0.000000);
		PlayerTextDrawTextSize(playerid, StealPlate[playerid][0], 82.470314, 41.139976);
		PlayerTextDrawAlignment(playerid, StealPlate[playerid][0], 1);
		PlayerTextDrawColor(playerid, StealPlate[playerid][0], -1);
		PlayerTextDrawSetShadow(playerid, StealPlate[playerid][0], 0);
		PlayerTextDrawSetOutline(playerid, StealPlate[playerid][0], 0);
		PlayerTextDrawBackgroundColor(playerid, StealPlate[playerid][0], 255);
		PlayerTextDrawFont(playerid, StealPlate[playerid][0], 4);
		PlayerTextDrawSetProportional(playerid, StealPlate[playerid][0], 0);
		PlayerTextDrawSetShadow(playerid, StealPlate[playerid][0], 0);

		StealPlate[playerid][1] = CreatePlayerTextDraw(playerid, 236.201477, 344.081726, "BOS_PLAKA");
		PlayerTextDrawLetterSize(playerid, StealPlate[playerid][1], 0.304200, 2.094042);
		PlayerTextDrawAlignment(playerid, StealPlate[playerid][1], 2);
		PlayerTextDrawColor(playerid, StealPlate[playerid][1], -2038460673);
		PlayerTextDrawSetShadow(playerid, StealPlate[playerid][1], 0);
		PlayerTextDrawSetOutline(playerid, StealPlate[playerid][1], 0);
		PlayerTextDrawBackgroundColor(playerid, StealPlate[playerid][1], 255);
		PlayerTextDrawFont(playerid, StealPlate[playerid][1], 2);
		PlayerTextDrawSetProportional(playerid, StealPlate[playerid][1], 1);
		PlayerTextDrawSetShadow(playerid, StealPlate[playerid][1], 0);

    FoodOrder[playerid][2] = CreatePlayerTextDraw(playerid, 158.813995, 133.416641, "Bu_restaurant_gordugunuz_menuleri_sunuyor.~n~Istediginizin_ustune_tiklayarak_satin_alabilirsin.");
    PlayerTextDrawLetterSize(playerid, FoodOrder[playerid][2], 0.266002, 1.390000);
    PlayerTextDrawAlignment(playerid, FoodOrder[playerid][2], 1);
    PlayerTextDrawColor(playerid, FoodOrder[playerid][2], -1);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, FoodOrder[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, FoodOrder[playerid][2], 255);
    PlayerTextDrawFont(playerid, FoodOrder[playerid][2], 1);
    PlayerTextDrawSetProportional(playerid, FoodOrder[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][2], 0);

    FoodOrder[playerid][3] = CreatePlayerTextDraw(playerid, 519.575683, 88.500007, "X");
    PlayerTextDrawLetterSize(playerid, FoodOrder[playerid][3], 0.333469, 1.144999);
    PlayerTextDrawAlignment(playerid, FoodOrder[playerid][3], 2);
    PlayerTextDrawColor(playerid, FoodOrder[playerid][3], -1);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, FoodOrder[playerid][3], 0);
    PlayerTextDrawBackgroundColor(playerid, FoodOrder[playerid][3], 255);
    PlayerTextDrawFont(playerid, FoodOrder[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, FoodOrder[playerid][3], 1);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][3], 0);
    PlayerTextDrawSetSelectable(playerid, FoodOrder[playerid][3], true);

    FoodOrder[playerid][4] = CreatePlayerTextDraw(playerid, 126.317764, 143.333328, "");
    PlayerTextDrawLetterSize(playerid, FoodOrder[playerid][4], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, FoodOrder[playerid][4], 103.000000, 136.000000);
    PlayerTextDrawAlignment(playerid, FoodOrder[playerid][4], 1);
    PlayerTextDrawColor(playerid, FoodOrder[playerid][4], -1);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][4], 0);
    PlayerTextDrawSetOutline(playerid, FoodOrder[playerid][4], 0);
    PlayerTextDrawBackgroundColor(playerid, FoodOrder[playerid][4], 255);
    PlayerTextDrawFont(playerid, FoodOrder[playerid][4], 5);
    PlayerTextDrawSetProportional(playerid, FoodOrder[playerid][4], 0);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][4], 0);
    PlayerTextDrawSetSelectable(playerid, FoodOrder[playerid][4], true);
    PlayerTextDrawSetPreviewModel(playerid, FoodOrder[playerid][4], 2213);
    PlayerTextDrawSetPreviewRot(playerid, FoodOrder[playerid][4], 300.000000, 26.000000, 52.000000, 0.899999);

    FoodOrder[playerid][5] = CreatePlayerTextDraw(playerid, 258.909301, 140.999969, "");
    PlayerTextDrawLetterSize(playerid, FoodOrder[playerid][5], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, FoodOrder[playerid][5], 103.000000, 136.000000);
    PlayerTextDrawAlignment(playerid, FoodOrder[playerid][5], 1);
    PlayerTextDrawColor(playerid, FoodOrder[playerid][5], -1);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][5], 0);
    PlayerTextDrawSetOutline(playerid, FoodOrder[playerid][5], 0);
    PlayerTextDrawBackgroundColor(playerid, FoodOrder[playerid][5], 255);
    PlayerTextDrawFont(playerid, FoodOrder[playerid][5], 5);
    PlayerTextDrawSetProportional(playerid, FoodOrder[playerid][5], 0);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][5], 0);
    PlayerTextDrawSetSelectable(playerid, FoodOrder[playerid][5], true);
    PlayerTextDrawSetPreviewModel(playerid, FoodOrder[playerid][5], 2214);
    PlayerTextDrawSetPreviewRot(playerid, FoodOrder[playerid][5], 300.000000, 26.000000, 52.000000, 0.899999);

    FoodOrder[playerid][6] = CreatePlayerTextDraw(playerid, 401.808380, 138.083374, "");
    PlayerTextDrawLetterSize(playerid, FoodOrder[playerid][6], 0.000000, 0.000000);
    PlayerTextDrawTextSize(playerid, FoodOrder[playerid][6], 103.000000, 136.000000);
    PlayerTextDrawAlignment(playerid, FoodOrder[playerid][6], 1);
    PlayerTextDrawColor(playerid, FoodOrder[playerid][6], -1);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][6], 0);
    PlayerTextDrawSetOutline(playerid, FoodOrder[playerid][6], 0);
    PlayerTextDrawBackgroundColor(playerid, FoodOrder[playerid][6], 255);
    PlayerTextDrawFont(playerid, FoodOrder[playerid][6], 5);
    PlayerTextDrawSetProportional(playerid, FoodOrder[playerid][6], 0);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][6], 0);
    PlayerTextDrawSetSelectable(playerid, FoodOrder[playerid][6], true);
    PlayerTextDrawSetPreviewModel(playerid, FoodOrder[playerid][6], 2212);
    PlayerTextDrawSetPreviewRot(playerid, FoodOrder[playerid][6], 300.000000, 26.000000, 52.000000, 0.899999);

    FoodOrder[playerid][7] = CreatePlayerTextDraw(playerid, 189.736465, 283.333404, "FOOD_NAME_1");
    PlayerTextDrawLetterSize(playerid, FoodOrder[playerid][7], 0.298330, 1.407499);
    PlayerTextDrawAlignment(playerid, FoodOrder[playerid][7], 2);
    PlayerTextDrawColor(playerid, FoodOrder[playerid][7], -1);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][7], 0);
    PlayerTextDrawSetOutline(playerid, FoodOrder[playerid][7], 0);
    PlayerTextDrawBackgroundColor(playerid, FoodOrder[playerid][7], 255);
    PlayerTextDrawFont(playerid, FoodOrder[playerid][7], 1);
    PlayerTextDrawSetProportional(playerid, FoodOrder[playerid][7], 1);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][7], 0);

    FoodOrder[playerid][8] = CreatePlayerTextDraw(playerid, 319.517211, 282.750091, "FOOD_NAME_2");
    PlayerTextDrawLetterSize(playerid, FoodOrder[playerid][8], 0.298330, 1.407499);
    PlayerTextDrawAlignment(playerid, FoodOrder[playerid][8], 2);
    PlayerTextDrawColor(playerid, FoodOrder[playerid][8], -1);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][8], 0);
    PlayerTextDrawSetOutline(playerid, FoodOrder[playerid][8], 0);
    PlayerTextDrawBackgroundColor(playerid, FoodOrder[playerid][8], 255);
    PlayerTextDrawFont(playerid, FoodOrder[playerid][8], 1);
    PlayerTextDrawSetProportional(playerid, FoodOrder[playerid][8], 1);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][8], 0);

    FoodOrder[playerid][9] = CreatePlayerTextDraw(playerid, 464.758911, 282.750030, "FOOD_NAME_3");
    PlayerTextDrawLetterSize(playerid, FoodOrder[playerid][9], 0.298330, 1.407499);
    PlayerTextDrawAlignment(playerid, FoodOrder[playerid][9], 2);
    PlayerTextDrawColor(playerid, FoodOrder[playerid][9], -1);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][9], 0);
    PlayerTextDrawSetOutline(playerid, FoodOrder[playerid][9], 0);
    PlayerTextDrawBackgroundColor(playerid, FoodOrder[playerid][9], 255);
    PlayerTextDrawFont(playerid, FoodOrder[playerid][9], 1);
    PlayerTextDrawSetProportional(playerid, FoodOrder[playerid][9], 1);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][9], 0);

    FoodOrder[playerid][10] = CreatePlayerTextDraw(playerid, 160.219589, 297.916625, "~r~Health:_+99_1~n~Removes_Hunger~n~~b~Price:_$99_1");
    PlayerTextDrawLetterSize(playerid, FoodOrder[playerid][10], 0.247730, 1.063332);
    PlayerTextDrawAlignment(playerid, FoodOrder[playerid][10], 1);
    PlayerTextDrawColor(playerid, FoodOrder[playerid][10], -1);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][10], 0);
    PlayerTextDrawSetOutline(playerid, FoodOrder[playerid][10], 0);
    PlayerTextDrawBackgroundColor(playerid, FoodOrder[playerid][10], 255);
    PlayerTextDrawFont(playerid, FoodOrder[playerid][10], 1);
    PlayerTextDrawSetProportional(playerid, FoodOrder[playerid][10], 1);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][10], 0);

    FoodOrder[playerid][11] = CreatePlayerTextDraw(playerid, 290.468750, 296.749969, "~r~Health:_+99_2~n~Removes_Hunger~n~~b~Price:_$99_2");
    PlayerTextDrawLetterSize(playerid, FoodOrder[playerid][11], 0.247730, 1.063332);
    PlayerTextDrawAlignment(playerid, FoodOrder[playerid][11], 1);
    PlayerTextDrawColor(playerid, FoodOrder[playerid][11], -1);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][11], 0);
    PlayerTextDrawSetOutline(playerid, FoodOrder[playerid][11], 0);
    PlayerTextDrawBackgroundColor(playerid, FoodOrder[playerid][11], 255);
    PlayerTextDrawFont(playerid, FoodOrder[playerid][11], 1);
    PlayerTextDrawSetProportional(playerid, FoodOrder[playerid][11], 1);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][11], 0);

    FoodOrder[playerid][12] = CreatePlayerTextDraw(playerid, 434.774810, 297.333312, "~r~Health:_+99_3~n~Removes_Hunger~n~~b~Price:_$99_3");
    PlayerTextDrawLetterSize(playerid, FoodOrder[playerid][12], 0.247730, 1.063332);
    PlayerTextDrawAlignment(playerid, FoodOrder[playerid][12], 1);
    PlayerTextDrawColor(playerid, FoodOrder[playerid][12], -1);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][12], 0);
    PlayerTextDrawSetOutline(playerid, FoodOrder[playerid][12], 0);
    PlayerTextDrawBackgroundColor(playerid, FoodOrder[playerid][12], 255);
    PlayerTextDrawFont(playerid, FoodOrder[playerid][12], 1);
    PlayerTextDrawSetProportional(playerid, FoodOrder[playerid][12], 1);
    PlayerTextDrawSetShadow(playerid, FoodOrder[playerid][12], 0);
    return 1;
}

Server:TracingSteps(playerid)
{
    PlayerTextDrawSetString(playerid, Trace_PTD[playerid][0], "Takip_Basliyor.");
    SetTimerEx("TracingStepsTwo", 4000, false, "i", playerid);
    PlayNearbySound(playerid, 1149);
}

Server:TracingStepsTwo(playerid)
{
    PlayerTextDrawSetString(playerid, Trace_PTD[playerid][0], "Takip_Basliyor..");
    SetTimerEx("TracingStepsThree", 2000, false, "i", playerid);
    PlayNearbySound(playerid, 1149);
}

Server:TracingStepsThree(playerid)
{
    PlayerTextDrawSetString(playerid, Trace_PTD[playerid][0], "Takip_Basliyor...");
    SetTimerEx("TracingStepsFour", 4000, false, "i", playerid);
    PlayNearbySound(playerid, 1149);
}

Server:TracingStepsFour(playerid)
{
    PlayerTextDrawSetString(playerid, Trace_PTD[playerid][0], "Takip_Basliyor....");
    SetTimerEx("TracingStepsFive", 4000, false, "i", playerid);
    PlayNearbySound(playerid, 1149);
}

Server:TracingStepsFive(playerid)
{
    PlayerTextDrawSetString(playerid, Trace_PTD[playerid][0], "~g~Takip_Tamamlandi!");
    SetTimerEx("TracingStepsFinish", 2000, false, "i", playerid);
    PlayNearbySound(playerid, 1149);
}

Server:TracingStepsFinish(playerid)
{
    PlayerTextDrawHide(playerid, Trace_PTD[playerid][0]);

    new tracing_num = PlayerData[playerid][pTraceNum];

    if(tracing_num == INVALID_PLAYER_ID)
    {
        SendClientMessage(playerid, COLOR_ADM, "TAKÝP: {FFFFFF}Takip baþarýsýz oldu, numara kullaným dýþý.");
        PlayerData[playerid][pIsTracing] = 0;
        return 1;
    }

    if(PlayerData[tracing_num][pPhoneOff])
    {
        SendClientMessage(playerid, COLOR_ADM, "TAKÝP: {FFFFFF}Takip baþarýsýz oldu, numara kullaným dýþý");
        PlayerData[playerid][pIsTracing] = 0;
        return 1;
    }

    GetPlayerPos(tracing_num, PlayerData[tracing_num][pPos][0], PlayerData[tracing_num][pPos][1], PlayerData[tracing_num][pPos][2]);

    switch(PlayerData[playerid][pIsTracing])
    {
        case 1:
        {
            if(PlayerData[tracing_num][pInsideComplex] != -1)
            {
                new incomp = PlayerData[tracing_num][pInsideComplex];
                SetPlayerCheckpoint(playerid, PropertyData[incomp][PropertyEnter][0], PropertyData[incomp][PropertyEnter][1], PropertyData[incomp][PropertyEnter][2], 4.0);
            }
            else if(PlayerData[tracing_num][pInsideApartment] != -1)
            {
                new link = PropertyData[PlayerData[tracing_num][pInsideApartment]][PropertyComplexLink];
                SetPlayerCheckpoint(playerid, PropertyData[link][PropertyEnter][0], PropertyData[link][PropertyEnter][1], PropertyData[link][PropertyEnter][2], 4.0);
            }
            else if(PlayerData[tracing_num][pInsideHouse] != -1)
            {
                new inhous = PlayerData[tracing_num][pInsideHouse];
                SetPlayerCheckpoint(playerid, PropertyData[inhous][PropertyEnter][0], PropertyData[inhous][PropertyEnter][1], PropertyData[inhous][PropertyEnter][2], 4.0);
            }
            else if(PlayerData[tracing_num][pInsideBusiness] != -1)
            {
                new inbiz = PlayerData[tracing_num][pInsideBusiness];
                SetPlayerCheckpoint(playerid, BusinessData[inbiz][EnterPos][0], BusinessData[inbiz][EnterPos][1], BusinessData[inbiz][EnterPos][2], 4.0);
            }
            else if(PlayerData[tracing_num][pInsideGarage] != -1)
            {
                new ingar = PlayerData[tracing_num][pInsideGarage];
                SetPlayerCheckpoint(playerid, GarageData[ingar][GaragePos][0], GarageData[ingar][GaragePos][1], GarageData[ingar][GaragePos][2], 4.0);
            }
            else
            {
                SetPlayerCheckpoint(playerid, PlayerData[tracing_num][pPos][0], PlayerData[tracing_num][pPos][1], PlayerData[tracing_num][pPos][2], 4.0);
            }

            SendClientMessageEx(playerid, COLOR_ADM, "TAKÝP: {FFFFFF}Takip baþarýlý oldu. Lokasyon: %s. Haritadaki kýrmýzý noktaya ilerle.", GetZoneName(PlayerData[tracing_num][pPos][0], PlayerData[tracing_num][pPos][1], PlayerData[tracing_num][pPos][2]));
        }
        case 2:
        {
            foreach(new i : Player) if(i != playerid)
            {
                if(PlayerData[i][pFaction] == PlayerData[playerid][pFaction] && PlayerData[playerid][pLAWduty])
                {
                    if(PlayerData[tracing_num][pInsideComplex] != -1)
                    {
                        new incomp = PlayerData[tracing_num][pInsideComplex];
                        SetPlayerCheckpoint(playerid, PropertyData[incomp][PropertyEnter][0], PropertyData[incomp][PropertyEnter][1], PropertyData[incomp][PropertyEnter][2], 4.0);
                    }
                    else if(PlayerData[tracing_num][pInsideApartment] != -1)
                    {
                        new link = PropertyData[PlayerData[tracing_num][pInsideApartment]][PropertyComplexLink];
                        SetPlayerCheckpoint(playerid, PropertyData[link][PropertyEnter][0], PropertyData[link][PropertyEnter][1], PropertyData[link][PropertyEnter][2], 4.0);
                    }
                    else if(PlayerData[tracing_num][pInsideHouse] != -1)
                    {
                        new inhous = PlayerData[tracing_num][pInsideHouse];
                        SetPlayerCheckpoint(playerid, PropertyData[inhous][PropertyEnter][0], PropertyData[inhous][PropertyEnter][1], PropertyData[inhous][PropertyEnter][2], 4.0);
                    }
                    else if(PlayerData[tracing_num][pInsideBusiness] != -1)
                    {
                        new inbiz = PlayerData[tracing_num][pInsideBusiness];
                        SetPlayerCheckpoint(playerid, BusinessData[inbiz][EnterPos][0], BusinessData[inbiz][EnterPos][1], BusinessData[inbiz][EnterPos][2], 4.0);
                    }
                    else if(PlayerData[tracing_num][pInsideGarage] != -1)
                    {
                        new ingar = PlayerData[tracing_num][pInsideGarage];
                        SetPlayerCheckpoint(i, GarageData[ingar][GaragePos][0], GarageData[ingar][GaragePos][1], GarageData[ingar][GaragePos][2], 4.0);
                    }
                    else{
                        SetPlayerCheckpoint(i, PlayerData[tracing_num][pPos][0], PlayerData[tracing_num][pPos][1], PlayerData[tracing_num][pPos][2], 4.0);
                    }

                    SendClientMessageEx(i, COLOR_ADM, "TAKÝP: {FFFFFF}Ekranýnda birlik tarafýndan takip edilen birinin noktasý belirdi. Lokasyon: %s", GetZoneName(PlayerData[tracing_num][pPos][0], PlayerData[tracing_num][pPos][1], PlayerData[tracing_num][pPos][2]));
                    SendClientMessageEx(i, COLOR_ADM, "TAKÝP: {FFFFFF}Takibi yaptýran kiþi: %s", ReturnName(playerid, 0));
                }
            }

            SetPlayerCheckpoint(playerid, PlayerData[tracing_num][pPos][0], PlayerData[tracing_num][pPos][1], PlayerData[tracing_num][pPos][2], 4.0);
            SendClientMessageEx(playerid, COLOR_ADM, "TAKÝP: {FFFFFF}Takip baþarýlý oldu. Lokasyon: %s. Haritadaki kýrmýzý noktaya ilerle.", GetZoneName(PlayerData[tracing_num][pPos][0], PlayerData[tracing_num][pPos][1], PlayerData[tracing_num][pPos][2]));
        }
    }

    PlayerData[playerid][pIsTracing] = 0;
    return 1;
}

Server:CallingEmergencyServices(playerid)
{
    SendClientMessage(playerid, COLOR_GREY, "[!] Çaðrý cevaplandý.");
    PlayerData[playerid][p911CallTimer][1] = SetTimerEx("CallingEmergencyServices_Two", 1500, false, "i", playerid);
    return true;
}

Server:CallingEmergencyServices_Two(playerid)
{
    PlayerData[playerid][pPhoneline] = 911;
    PlayerData[playerid][pCalling] = 0;
    SendClientMessage(playerid, COLOR_YELLOW, "911 Operatörü: 911, aciliyetiniz nedir?");
    return true;
}

Server:SecureSpawn(playerid)
{
    SpawnPlayer(playerid);
    Player_SavePos(playerid, true);
    SetPlayerTeam(playerid, STATE_WOUNDED);
    return 1;
}

Server:GetDistanceBetweenPlayers(playerid, id, Float:distance)
{
    new Float:x,
        Float:y,
        Float:z;

    GetPlayerPos(playerid, x, y, z);

    if(GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(id)
    && GetPlayerInterior(playerid) == GetPlayerInterior(id))
    {
        if(IsPlayerInRangeOfPoint(id, distance, x, y, z))
        {
            return 1;
        }
    }
    return 0;
}

Server:KickTimer(playerid)
{
    Kick(playerid);
    return 1;
}

Server:OnPlayerExitDealership(playerid, response)
{
    if(response)
    {
        SendClientMessage(playerid, 0xB9E35EFF, "ÝÞLEM SÜRECÝ: Araç satýn almaktan vazgeçtiniz.");
        DestroyVehicle(g_aVehicleSpawned[playerid]);
        TogglePlayerControllable(playerid, 1);
        ResetDealershipVars(playerid);
    }
    else ShowDealerAppend(playerid);
    return 1;
}

Server:SQL_CheckAccountBan(playerid)
{
    if(cache_num_rows())
    {
        new Name[30], IP[30], adminLevel, hwID[40], query[456];

        for(new i = 0, j = cache_num_rows(); i < j; i++)
        {
            cache_get_value_name_int(i, "AdminLevel", adminLevel);
            cache_get_value_name(i, "Name", Name, 30);
            cache_get_value_name(i, "IP", IP, 30);
            cache_get_value_name(i, "HWID", hwID, 40);

            if(PlayerData[playerid][pAdmin] < adminLevel)
            {
                SendClientMessage(playerid, COLOR_ADM, "ERÝÞÝM REDDEDÝLDÝ: {FFFFFF}Bu hesap sizden yüksek rütbeli.");
                return 0;
            }

            mysql_format(m_Handle, query, sizeof(query), "INSERT INTO bans (`ban_name`, `reason`, `admin`, `time`, `ban_ip`, `active`) VALUES('%e', '%e', '%e', %i, '%e', '1')", Name, PlayerData[playerid][pSetReason], ReturnName(playerid, 1), Time(), IP);
            mysql_pquery(m_Handle, query);

            mysql_format(m_Handle, query, sizeof(query), "INSERT INTO log_bans (Name, Reason, BannedBy, Date, IP) VALUES('%e', '%e', '%e', %i, '%e')", Name, PlayerData[playerid][pSetReason], ReturnName(playerid), Time(), IP);
            mysql_pquery(m_Handle, query);

            SendClientMessageEx(playerid, COLOR_ADM,  "[!] {FFFFFF}%s baþarýyla yasaklandý.", Name);

            LogAdminAction(playerid, sprintf("%s isimli kiþiyi offline yasakladý. Sebep: %s", Name, PlayerData[playerid][pSetReason]));
        }
    }
    else SendClientMessage(playerid, COLOR_ADM, "[ ! ]{FFFFFF} That account doesn't exist in our database.");
    return true;
}

Server:SQL_OnOfflineJail(playerid)
{
    if(cache_num_rows())
    {
        for(new i = 0, j = cache_num_rows(); i < j; i++)
        {
            new Name[24];
            cache_get_value_name(i, "Name", Name, 24);

            new query[456];
            mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET OfflineAjail = 1, AjailTime = %i, OfflineAjailReason = '%e' WHERE Name = '%e'", PlayerData[playerid][pSetTime], PlayerData[playerid][pSetReason], Name);
            mysql_tquery(m_Handle, query);

            SendClientMessageEx(playerid, COLOR_ADM, "[ ! ]{FFFFFF} %s has been successfully admin jailed.", Name);
            mysql_format(m_Handle, query, sizeof(query), "INSERT INTO log_ajail (`Name`, `Reason`, `JailedBy`, `Date`, `Time`, `IP`) VALUES('%e', '%e', '%e', %i, %i, 'offline')", Name, PlayerData[playerid][pSetReason], ReturnName(playerid, 1), Time(), PlayerData[playerid][pSetTime]);
            mysql_tquery(m_Handle, query);

            PlayerData[playerid][pSetTime] = 0;
            PlayerData[playerid][pSetReason] = 0;
        }
    } else SendClientMessage(playerid, COLOR_ADM, "[ ! ]{FFFFFF} That account doesn't exist in our database.");
    return 1;
}

Server:SQL_AddPlayerContact(playerid)
{
    new id = contact_save_id[playerid];

    ContactsData[playerid][id][contactSQLID] = cache_insert_id();
    ContactsData[playerid][id][contactPlayerSQLID] = PlayerData[playerid][pSQLID];
    return true;
}

Server:SendFactionMessage(playerid, string[])
{
    new faction = PlayerData[playerid][pFaction];

    foreach(new i : Player) if(PlayerData[i][pFaction] == faction && PlayerData[i][pFactionStatus])
    {
        SendClientMessage(i, FactionData[faction][FactionChatColor], string);
    }
    return 1;
}

Server:SendFactionMessageEx(playerid, color, string[])
{
    new faction = PlayerData[playerid][pFaction];

    foreach(new i : Player) if(PlayerData[i][pFaction] == faction)
    {
        SendClientMessage(i, color, string);
    }

    return true;
}

Server:SendMessageToFaction(factionid, color, string[])
{
    foreach(new i : Player) {
        if(PlayerData[i][pFaction] == factionid) {
            SendClientMessage(i, color, string);
        }
    }
    return true;
}

Server:CountOnlineMembers(factionid)
{
    new count = 0;

    foreach(new i : Player)
    {
        if(PlayerData[i][pFaction] == factionid){
            count++;
        }
    }

    return count;
}

Server:SpawnPlayerIn(playerid)
{
    if(PlayerData[playerid][pICJailed])
    {
        SendPlayer(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], PlayerData[playerid][pPos][3], PlayerData[playerid][pInterior], PlayerData[playerid][pWorld]);

        if(!IsValidDynamic3DTextLabel(PlayerData[playerid][pICJail3D]))
        {
            new
                jail_str[90];

            TotalJailees++;

            SendClientMessageEx(playerid, COLOR_WHITE, "SERVER: Hapis numaranýz A%03d olarak güncellendi.", TotalJailees);

            format(jail_str, 90, "A%03d", TotalJailees);
            PlayerData[playerid][pICJail3D] = CreateDynamic3DTextLabelEx(jail_str, COLOR_LGREEN, 0.0, 0.0, -0.10, 20.0, playerid);
        }

        return 1;
    }

    if(PlayerData[playerid][pBrutallyWounded])
    {
        SetBrutallyWounded(playerid, -1, -1, 0);
        return 1;
    }
    else
    {
        SendPlayer(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], PlayerData[playerid][pPos][3], PlayerData[playerid][pInterior], PlayerData[playerid][pWorld]);
        /*switch(PlayerData[playerid][pSpawnPoint])
        {
            case SPAWN_POINT_AIRPORT:
            {
                SendPlayer(playerid, 1642.37, -2334.47, -2.6797, 358.076, 0, 0);
            }
            case SPAWN_POINT_PROPERTY:
            {
                new id = PlayerData[playerid][pSpawnPointHouse];

                if(!PropertyData[id][PropertyOwnerID] || PropertyData[id][PropertyOwnerID] != PlayerData[playerid][pSQLID])
                {
                    PlayerData[playerid][pSpawnPoint] = SPAWN_POINT_AIRPORT;
                    PlayerData[playerid][pSpawnPointHouse] = 0;
                    return SpawnPlayerIn(playerid);
                }

                ResetHouseVar(playerid);

                switch(PropertyData[id][PropertyType])
                {
                    case 1: PlayerData[playerid][pInsideComplex] = id;
                    case 2: PlayerData[playerid][pInsideApartment] = id;
                    case 3: PlayerData[playerid][pInsideHouse] = id;
                }

                SendPlayer(playerid, PropertyData[id][PropertyExit][0], PropertyData[id][PropertyExit][1], PropertyData[id][PropertyExit][2], PropertyData[id][PropertyExit][3], PropertyData[id][PropertyExitInterior], PropertyData[id][PropertyExitWorld]);
            }
            case SPAWN_POINT_RENTING:
            {
                if(PlayerData[playerid][pRenting] == -1)
                {
                    PlayerData[playerid][pSpawnPoint] = SPAWN_POINT_AIRPORT;
                    return SpawnPlayerIn(playerid);
                }

                new
                    idx = PlayerData[playerid][pRenting];

                if(!Iter_Contains(Properties, idx))
                {
                    PlayerData[playerid][pSpawnPoint] = SPAWN_POINT_AIRPORT;
                    return SpawnPlayerIn(playerid);
                }

                SendClientMessage(playerid, COLOR_ADM, "Kira Ücreti:");
                SendClientMessageEx(playerid, COLOR_GRAD2, "$%s", MoneyFormat(PropertyData[idx][PropertyRentPrice]));
                PlayerData[playerid][pBank]-= PropertyData[idx][PropertyRentPrice];

                SendPlayer(playerid, PropertyData[idx][PropertyExit][0], PropertyData[idx][PropertyExit][1], PropertyData[idx][PropertyExit][2], PropertyData[idx][PropertyExit][3], PropertyData[idx][PropertyExitInterior], PropertyData[idx][PropertyExitWorld]);
            }
            case SPAWN_POINT_FACTION:
            {
                if(PlayerData[playerid][pFaction] == -1)
                {
                    PlayerData[playerid][pSpawnPoint] = SPAWN_POINT_AIRPORT;
                    return SpawnPlayerIn(playerid);
                }

                new
                    idx;

                idx = PlayerData[playerid][pFaction];

                if(!Iter_Contains(Factions, idx))
                {
                    PlayerData[playerid][pSpawnPoint] = SPAWN_POINT_AIRPORT;
                    return SpawnPlayerIn(playerid);
                }

                if(PlayerData[playerid][pSpawnPrecinct] != 0)
                {
                    switch(PlayerData[playerid][pSpawnPrecinct])
                    {
                        case 1: SendPlayer(playerid, FactionData[idx][FactionSpawnEx1][0], FactionData[idx][FactionSpawnEx1][1], FactionData[idx][FactionSpawnEx1][2], 90.0, FactionData[idx][FactionSpawnEx1Interior], FactionData[idx][FactionSpawnEx1VW]);
                        case 2: SendPlayer(playerid, FactionData[idx][FactionSpawnEx2][0], FactionData[idx][FactionSpawnEx2][1], FactionData[idx][FactionSpawnEx2][2], 90.0, FactionData[idx][FactionSpawnEx2Interior], FactionData[idx][FactionSpawnEx2VW]);
                        case 3: SendPlayer(playerid, FactionData[idx][FactionSpawnEx3][0], FactionData[idx][FactionSpawnEx3][1], FactionData[idx][FactionSpawnEx3][2], 90.0, FactionData[idx][FactionSpawnEx3Interior], FactionData[idx][FactionSpawnEx3VW]);
                    }
                } else {
                    SendPlayer(playerid, FactionData[idx][FactionSpawn][0], FactionData[idx][FactionSpawn][1], FactionData[idx][FactionSpawn][2], FactionData[idx][FactionSpawn][3], FactionData[idx][FactionSpawnInterior], FactionData[idx][FactionSpawnVW]);
                }
            }
        }*/
    }
    return 1;
}

Server:OnMDCPartialPlate(playerid)
{
    if(!cache_num_rows())
        return ShowPlayerDialog(playerid, DIALOG_MDC_FINISH_QUEUE, DIALOG_STYLE_MSGBOX, "MVB: Kýsmi Plaka Sorgulama", "Sorguladýðýnýz plaka veritabanýnda bulunamadý.", "<<", "");

    new plate_list[128];

    for(new i = 0, j = cache_num_rows(); i < j; i++)
    {
        cache_get_value_name(i, "Plate", PlayerMDCPlateHolder[playerid][i], 32);
    }

    for(new i = 0; i < 5; i++)
    {
        if(!isnull(PlayerMDCPlateHolder[playerid][i]))
        {
            format(plate_list, sizeof(plate_list), "%s%s\n", plate_list, PlayerMDCPlateHolder[playerid][i]);
        }
    }

    ShowPlayerDialog(playerid, DIALOG_MDC_PLATE_LIST, DIALOG_STYLE_LIST, "Mobil Veritabaný Bilgisayarý", plate_list, "Seç", "<<");
    return 1;
}

Server:OnMDCPlateSearch(playerid)
{
    if(!cache_num_rows())
        return ShowPlayerDialog(playerid, DIALOG_MDC_FINISH_QUEUE, DIALOG_STYLE_MSGBOX, "MVB: Plaka Sorgulama", "Sorguladýðýnýz plaka veritabanýnda bulunamadý.", "<<", "");

    new
        sub_str[128],
        primary_str[430],

        modelid,
        ownerid,
        impounded,
        insurance,

        reportedstolen,
        reporteddate;

    cache_get_value_name_int(0, "ModelID", modelid);
    cache_get_value_name_int(0, "OwnerID", ownerid);

    cache_get_value_name_int(0, "Impounded", impounded);
    cache_get_value_name_int(0, "Insurance", insurance);

    cache_get_value_name_int(0, "ReportedStolen", bool:reportedstolen);
    cache_get_value_name_int(0, "ReportedStolenDate", reporteddate);

    format(sub_str, sizeof(sub_str), "Araç Plakasý: %s\n", PlayerMDCText[playerid]);
    strcat(primary_str, sub_str);

    format(sub_str, sizeof(sub_str), "Araç Modeli: %s\n\n", ReturnVehicleModelName(modelid));
    strcat(primary_str, sub_str);

    format(sub_str, sizeof(sub_str), "Sahibi: %s\n", ReturnSQLName(ownerid));
    strcat(primary_str, sub_str);

    format(sub_str, sizeof(sub_str), "Çekilmiþ mi?: %s\n", (impounded != 1) ? ("Hayýr") : ("Evet"));
    strcat(primary_str, sub_str);

    format(sub_str, sizeof(sub_str), "Sigorta: %s\n\n", (insurance != 1) ? ("Yok") : ("Var"));
    strcat(primary_str, sub_str);

    if(reportedstolen)
    {
        strcat(primary_str, "{F81414}UYARI:\n\n");
        format(sub_str, sizeof(sub_str), "Bu araç {CCE6E6}(\"%s\"){F81414} olarak sahibi tarafýndan bildirilmiþ.\n", PlayerMDCText[playerid]);
        strcat(primary_str, sub_str);
        format(sub_str, sizeof(sub_str), "Bu araç {CCE6E6}%s{F81414} tarihinde çalýntý olarak kayýtlara girilmiþ.\n\n", GetFullTime(reporteddate));
        strcat(primary_str, sub_str);
    }

    ShowPlayerDialog(playerid, DIALOG_MDC_FINISH_QUEUE, DIALOG_STYLE_MSGBOX, "Mobil Veritabaný Bilgisayarý", primary_str, "<<", "");
    return 1;
}

Server:OnMDCNameSearch(playerid)
{
    if(!cache_num_rows())
        return ShowPlayerDialog(playerid, DIALOG_MDC_FINISH_QUEUE, DIALOG_STYLE_MSGBOX, "MVB: Ýsim Sorgulama", "Sorguladýðýnýz isim veritabanýnda bulunamadý.", "<<", "");

    new
        sub_str[128],
        primary_str[300],
        query[128],

        phone,
        weplicense,
        driverlicense,
        listings,
        jailtime,
        prisontime;

    cache_get_value_name_int(0, "PhoneNumber", phone);
    cache_get_value_name_int(0, "WeaponsLicense", weplicense);
    cache_get_value_name_int(0, "DriversLicense", driverlicense);

    cache_get_value_name_int(0, "ActiveListing", listings);
    cache_get_value_name_int(0, "JailTimes", jailtime);
    cache_get_value_name_int(0, "PrisonTimes", prisontime);

    strcat(primary_str, "KÝÞÝSEL BÝLGÝLER\n");

    for(new i = 0; i < strlen(PlayerMDCText[playerid]); i++) if(PlayerMDCText[playerid][i] == '_')
    {
        PlayerMDCText[playerid][i] = ' ';
    }

    format(sub_str, sizeof(sub_str), "Ýsim Soyisim: %s\n", PlayerMDCText[playerid]);
    strcat(primary_str, sub_str);

    format(sub_str, sizeof(sub_str), "Telefon Numarasý: %d\n\n", phone);
    strcat(primary_str, sub_str);

    format(sub_str, sizeof(sub_str), "Ehliyet: %s\n", (driverlicense != 0) ? ("Var") : ("Yok"));
    strcat(primary_str, sub_str);

    format(sub_str, sizeof(sub_str), "Silah Ruhsatý: %s\n\n", (weplicense != 0) ? ("Var") : ("Yok"));
    strcat(primary_str, sub_str);

    strcat(primary_str, "SABIKA KAYDI\n");

    format(sub_str, sizeof(sub_str), "Tecrit Cezalarý: %i\n", jailtime);
    strcat(primary_str, sub_str);

    format(sub_str, sizeof(sub_str), "Hapis Cezalarý: %i\n\n", prisontime);
    strcat(primary_str, sub_str);

    if(!listings)
        strcat(primary_str, "Önceki Aranma Sebepleri: (ARANMIYOR)\n\n");

    else strcat(primary_str, "SUÇLAMALAR:\n\n");

    mysql_format(m_Handle, query, sizeof(query), "SELECT entry_reason FROM criminal_record WHERE player_name = '%e' ORDER BY id DESC", PlayerMDCText[playerid]);
    new Cache:cache = mysql_query(m_Handle, query);

    new entry_reason[128];
    if(!cache_num_rows())
        strcat(primary_str, "Önceki aranma sebebi bulunamadý.\n");
    else
    {
        for(new i = 0, j = cache_num_rows(); i < j; i++)
        {
            cache_get_value_name(i, "entry_reason", entry_reason, 128);
            format(sub_str, sizeof(sub_str), "* %s\n", entry_reason);
            strcat(primary_str, sub_str);
        }
    }

    cache_delete(cache);
    ShowPlayerDialog(playerid, DIALOG_MDC_FINISH_QUEUE, DIALOG_STYLE_MSGBOX, "Mobil Veritabaný Bilgisayarý", primary_str, "<<", "");
    return 1;
}

Server:OnPlayerAddCharge(playerid, playerb)
{
    SendLawMessage(COLOR_COP, sprintf("** HQ: %s, %s kiþinin siciline kayýt ekledi! **", ReturnName(playerid, 0), ReturnName(playerb, 1)));

    PlayerData[playerb][pActiveListing]++;

    new
        update_query[128];

    mysql_format(m_Handle, update_query, sizeof(update_query), "UPDATE players SET ActiveListing = %i WHERE id = %i", PlayerData[playerb][pActiveListing], PlayerData[playerb][pSQLID]);
    mysql_tquery(m_Handle, update_query);
    return 1;
}

Server:OnBadPhoneCall(playerid, type)
{
    switch(type)
    {
        case 1: SendClientMessage(playerid, COLOR_GREY, "[!] Aradýðýnýz kiþi þuan da baþka biriyle görüþüyor.");
        case 2: SendClientMessage(playerid, COLOR_GREY, "[!] Aradýðýnýz kiþiye þuan da ulaþýlamýyor.");
    }

    PlayerData[playerid][pPhoneline] = INVALID_PLAYER_ID;
    PlayerData[playerid][pCalling] = 0;

    if (PlayerData[playerid][pUseGUI])
    {
        PlayerTextDrawSetString(playerid, PhoneNotify[playerid], "Arama_Basarisiz");
        SetTimerEx("HangupDelay", 2500, false, "i", playerid);
    }

    if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_USECELLPHONE) {
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
    }

    cmd_ame(playerid, "telefonu cebine atar.");
    return 1;
}

Server:HangupDelay(playerid)
{
    PlayerTextDrawSetString(playerid, PhoneNotify[playerid], "_");
    PlayerTextDrawHide(playerid, PhoneNotify[playerid]);
    PlayerTextDrawShow(playerid, PhoneBtnMenu[playerid]);
    return 1;
}

Server:OnShowVehicleList(playerid)
{
    new
        dbid,
        modelid,
        imped,
        Float: x,
        Float: y,
        Float: z;

    cache_get_value_name_int(0, "id", dbid);
    cache_get_value_name_int(0, "ModelID", modelid);
    cache_get_value_name_int(0, "Impounded", imped);

    if(imped)
    {
        cache_get_value_name_float(0, "ImpoundPosX", x);
        cache_get_value_name_float(0, "ImpoundPosY", y);
        cache_get_value_name_float(0, "ImpoundPosZ", z);
    } else {
        cache_get_value_name_float(0, "PosX", x);
        cache_get_value_name_float(0, "PosY", y);
        cache_get_value_name_float(0, "PosZ", z);
    }

    new vehicle_address[74];
    format(vehicle_address, sizeof(vehicle_address), "%s, %s, %s %i, San Andreas", GetStreet(x, y, z), GetZoneName(x, y, z), GetCityName(x, y, z), ReturnAreaCode(GetZoneID(x, y, z)));
    SendClientMessageEx(playerid, COLOR_DARKGREEN, "Aracýn %s (#%i) %s adresinde gözüküyor.", ReturnVehicleModelName(modelid), dbid, vehicle_address);
    return 1;
}

Server:OnVehicleAlarm(vehicleid)
{
    return ToggleVehicleAlarms(vehicleid, false);
}

Server:OnBillboardRentCall(playerid)
{
    SendClientMessage(playerid, COLOR_GREY, "[!] Çaðrý cevaplandý.");
    PlayerBillboardTimer[playerid] = SetTimerEx("OnBillboardRentCallEx", 1500, false, "i", playerid);
    return 1;
}

Server:OnBillboardRentCallEx(playerid)
{
    PlayerData[playerid][pPhoneline] = 1800;
    PlayerData[playerid][pCalling] = 0;

    SendClientMessage(playerid, COLOR_YELLOW, "1-800-BLBRD Operatörü (telefon): 1-800-BLBRD hattýna hoþgeldiniz, lütfen reklam metninizi yazýnýz.");
    return 1;
}

Server:OnStolenCarCall(playerid)
{
    SendClientMessage(playerid, COLOR_GREY, "[!] Çaðrý cevaplandý.");
    PlayerStolenCarTimer[playerid] = SetTimerEx("OnStolenCarCallEx", 1500, false, "i", playerid);
    return 1;
}

Server:OnStolenCarCallEx(playerid)
{
    PlayerData[playerid][pPhoneline] = 788;
    PlayerData[playerid][pCalling] = 0;

    SendClientMessage(playerid, COLOR_YELLOW, "788 Operatörü: 788-ÇALINTI-ARAÇ hattýna hoþgeldiniz, çalýntý araç mý bildireceksiniz?");
    PlayerStolenCarPrompt[playerid] = 1;
    return 1;
}

Server:OnStolenCarPrompt(playerid)
{
    if(!cache_num_rows())
    {
        SendClientMessage(playerid, COLOR_YELLOW, "788 Operatörü: Hmm, söylediðiniz plakayý veritabaný üzerinde bulamadýk...");
        SendClientMessage(playerid, COLOR_YELLOW, "788 Operatörü: ...Tekrar denemek ya da telefonu kapatmak ister misiniz?");

        PlayerStolenCarPrompt[playerid] = 3;
        return 1;
    }

    new model_id;
    cache_get_value_name_int(0, "ModelID", model_id);
    SendClientMessage(playerid, COLOR_YELLOW, "788 Operatörü: Beklediðiniz için teþekkürler. Verdiðiniz plakayla uyuþan bir kayýt buldum, ...");
    SendClientMessageEx(playerid, COLOR_YELLOW, "788 Operatörü: ... araç modeli \"%s\" plakasý \"%s\" onaylýyor musunuz?", ReturnVehicleModelName(model_id), PlayerStolenCarPlate[playerid]);
    PlayerStolenCarPrompt[playerid] = 4;
    return 1;
}

Server:OnStolenCarOwnedCheck(playerid)
{
    new owner_id;
    cache_get_value_name_int(0, "OwnerID", owner_id);

    if(owner_id != PlayerData[playerid][pSQLID])
    {
        SendClientMessage(playerid, COLOR_YELLOW, "788 Operatörü: Görünüþe göre bu araç sana kayýtlý deðil.");
        SendClientMessage(playerid, COLOR_YELLOW, "788 Operatörü: Arayan kiþi araç sahibi deðilse çalýnan bir aracý rapor edemiyoruz.");
        PlayerStolenCarPrompt[playerid] = 0;
        PlayerStolenCarPlate[playerid] = "";
        cmd_tkapat(playerid, "");
    }
    else
    {
        SendClientMessage(playerid, COLOR_YELLOW, "788 Operatörü: Tamamdýr! Bu aracýn sana ait olduðunu görüyorum.");

        new stolen_query[128];
        mysql_format(m_Handle, stolen_query, sizeof(stolen_query), "UPDATE vehicles SET ReportedStolen = 1, ReportedStolenDate = %i WHERE Plate = '%e'", Time(), PlayerStolenCarPlate[playerid]);
        mysql_tquery(m_Handle, stolen_query, "OnStolenCarConfirm", "i", playerid);
    }
    return 1;
}

Server:OnStolenCarConfirm(playerid)
{
    SendClientMessage(playerid, COLOR_YELLOW, "788 Operatörü: Aracýnýz çalýndý olarak iþaretlendi ve yerel kolluk kuvvetleri bilgilendirildi.");
    SendLawMessage(COLOR_ADM, sprintf("** [Çalýntý Araç] \"%s\" plakalý araç çalýntý olarak bildirildi. **", PlayerStolenCarPlate[playerid]));
    PlayerStolenCarPrompt[playerid] = 0;
    PlayerStolenCarPlate[playerid] = "";
    cmd_tkapat(playerid, "");
    return 1;
}

Server:CheckNameForBan(playerid, user[])
{
    if(!cache_num_rows()) return SendClientMessageEx(playerid, COLOR_GOLD, "[-] %s sunucudan yasaklý deðil.", user);

    new id;
    cache_get_value_name_int(0, "id", id);
    SendClientMessageEx(playerid, COLOR_GOLD, "[-] %s sunucudan yasaklý. (detay için /bansys %i)!", user, id);
    return 1;
}

Server:OnBanCheck(playerid, user[])
{
    if(!cache_num_rows())
        return SendClientMessageEx(playerid, COLOR_GOLD, "[-] %s yasaklanmýþ hiç bir hesapla iliþkisi bulunamadý.", user);

    new
        id, Name[32];

    for(new i = 0, j = cache_num_rows(); i < j; i++)
    {
        cache_get_value_name(i, "Name", Name, 32);
        cache_get_value_name_int(i, "id", id);
        SendClientMessageEx(playerid, COLOR_RED, "[+] %s daha önce yasaklanmýþ %s hesabýyla iliþkisi bulundu. (Ban ID: %i)", user, Name, id);
    }
    return 1;
}

Server:OnWeaponsCheck(playerid)
{
    if(!cache_num_rows())
        return 1;

    new
        weapid, weapammo;

    for(new i = 0, j = cache_num_rows(); i < j; i++)
    {
        cache_get_value_name_int(i, "weapon_id", weapid);
        cache_get_value_name_int(i, "ammo", weapammo);

        SendClientMessageEx(playerid, COLOR_GRAD2, "[-] Silah: %s [Mermi: %i]", ReturnWeaponName(weapid), weapammo);
    }

    return 1;
}

Server:OnListAccounts(playerid, user[])
{
    new
        IP[32], query[128];

    for(new i = 0, j = cache_num_rows(); i < j; i++)
    {
        cache_get_value_name(i, "IP", IP);
    }

    mysql_format(m_Handle, query, sizeof(query), "SELECT Name FROM players WHERE LastIP = '%e'", IP);
    new Cache:cache = mysql_query(m_Handle, query);

    if(!cache_num_rows())
        return SendClientMessageEx(playerid, COLOR_GOLD, "** %s isimli oyuncuyla iliþkili baþka bir hesap bulunamadý.", user), cache_delete(cache);

    new Name[32];
    for(new i = 0, j = cache_num_rows(); i < j; i++)
    {
        cache_get_value_name(i, "Name", Name);
        mysql_format(m_Handle, query, sizeof(query), "SELECT id FROM bans WHERE ban_name = '%e'", Name);
        mysql_tquery(m_Handle, query, "CheckIfBanned", "is", playerid, Name);
    }

    cache_delete(cache);
    return 1;
}

Server:CheckIfBanned(playerid, user[])
{
    if(!cache_num_rows()) SendClientMessageEx(playerid, COLOR_GOLD, "** %s", user);
    else SendClientMessageEx(playerid, COLOR_RED, "** %s (YASAKLI)", user);
    return 1;
}

Server:OnBanSys(playerid)
{
    if(!cache_num_rows())
        return SendClientMessage(playerid, COLOR_ADM, "SERVER: The username or ID you specified is not banned or is an invalid ban ID.");

    new
        id, Name[32], Reason[128], BannedBy[30], Date[128], IP[30];

    cache_get_value_name_int(0, "id", id);

    cache_get_value_name(0, "Name", Name, 32);
    cache_get_value_name(0, "Reason", Reason, 128);

    cache_get_value_name(0, "BannedBy", BannedBy, 30);
    cache_get_value_name(0, "Date", Date, 128);

    cache_get_value_name(0, "IP", IP, 30);

    SendClientMessageEx(playerid, COLOR_GOLD, "BAN ID:{FFFFFF} #%s", MoneyFormat(id));
    SendClientMessageEx(playerid, COLOR_GOLD, "USERNAME:{FFFFFF} %s", Name);

    ClearLines(playerid, 1);

    SendClientMessageEx(playerid, COLOR_GOLD, "BANNED BY:{FFFFFF} %s", BannedBy);
    SendClientMessageEx(playerid, COLOR_GOLD, "REASON:{FFFFFF} %s", Reason);

    ClearLines(playerid, 1);

    SendClientMessageEx(playerid, COLOR_GOLD, "DATE:{FFFFFF} %s", Date);
    SendClientMessageEx(playerid, COLOR_GOLD, "IP:{FFFFFF} %s", IP);
    return 1;
}

Server:OnBanLookup(playerid, user[])
{
    if(!cache_num_rows())
        return SendClientMessageEx(playerid, COLOR_ADM, "[-] %s daha önce hiç yasaklanmamýþ.", user);

    new BannedBy[34], Reason[128],
        ban_date, IP[30];

    SendClientMessage(playerid, COLOR_GOLD, "Yasaklayan | Tarih | IP | Sebep");

    for(new i = 0, j = cache_num_rows(); i < j; i++)
    {
        cache_get_value_name(i, "BannedBy", BannedBy, 34);
        cache_get_value_name(i, "Reason", Reason, 128);

        cache_get_value_name_int(i, "Date", ban_date);
        cache_get_value_name(i, "IP", IP, 30);

        if(strlen(Reason) > 59)
        {
            SendClientMessageEx(playerid, COLOR_GREY, "%s %s %s %.59s ...", BannedBy, GetFullTime(ban_date), IP, Reason);
            SendClientMessageEx(playerid, COLOR_GREY, "...%s", Reason[59]);
        }
        else SendClientMessageEx(playerid, COLOR_GREY, "%s %s %s %s", BannedBy, GetFullTime(ban_date), IP, Reason);
    }

    return 1;
}

Server:OnAjailLookup(playerid, user[])
{
    if(!cache_num_rows())
        return SendClientMessageEx(playerid, COLOR_ADM, "[-] %s daha önce hiç yönetici hapisine atýlmamýþ.", user);

    new JailedBy[34], Reason[128],
        jail_date, jail_time;

    SendClientMessage(playerid, COLOR_GOLD, "Hapise Atan | Tarih | Süre | Sebep");

    for(new i = 0, j = cache_num_rows(); i < j; i++)
    {
        cache_get_value_name(i, "JailedBy", JailedBy, 34);
        cache_get_value_name(i, "Reason", Reason, 128);

        cache_get_value_name_int(i, "Date", jail_date);
        cache_get_value_name_int(i, "Time", jail_time);

        if(strlen(Reason) > 59)
        {
            SendClientMessageEx(playerid, COLOR_GREY, "%s %s %i %.59s ...", JailedBy, GetFullTime(jail_date), jail_time, Reason);
            SendClientMessageEx(playerid, COLOR_GREY, "...%s", Reason[59]);
        }
        else SendClientMessageEx(playerid, COLOR_GREY, "%s %s %i %s", JailedBy, GetFullTime(jail_date), jail_time, Reason);
    }
    return 1;
}

Server:OnKickLookup(playerid, user[])
{
    if(!cache_num_rows())
        return SendClientMessageEx(playerid, COLOR_ADM, "[-] %s daha önce hiç oyundan atýlmamýþ.", user);

    new KickedBy[40], Reason[128],
        kick_date, IP[60];

    SendClientMessage(playerid, COLOR_GOLD, "Oyundan Atan | Tarih | IP | Sebep");

    for(new i = 0, j = cache_num_rows(); i < j; i++)
    {
        cache_get_value_name(i, "KickedBy", KickedBy, 40);
        cache_get_value_name(i, "Reason", Reason, 128);

        cache_get_value_name_int(i, "Date", kick_date);
        cache_get_value_name(i, "IP", IP, 60);

        if(strlen(Reason) > 59)
        {
            SendClientMessageEx(playerid, COLOR_GREY, "%s %s %s %.59s", KickedBy, GetFullTime(kick_date), IP, Reason);
            SendClientMessageEx(playerid, COLOR_GREY, "...%s", Reason[59]);
        }
        else SendClientMessageEx(playerid, COLOR_GREY, "%s %s %s %s", KickedBy, GetFullTime(kick_date), IP, Reason);
    }
    return 1;
}

Server:OnBurnerPhone(playerid, response)
{
    if(response)
    {
        if(PlayerData[playerid][pMoney] < 500) return SendErrorMessage(playerid, "Burner telefon alacak paran yok. ($500)");

        GiveMoney(playerid, -500);
        PlayerData[playerid][pHasBurner] = true;
        SaveSQLInt(PlayerData[playerid][pSQLID], "players", "HasBurnerPhone", PlayerData[playerid][pHasBurner]);
        SendClientMessageEx(playerid, COLOR_ADM, "[!] Burner telefon satýn aldýn. Numaran: %i", PlayerData[playerid][pBurnerPhone]);
        return 1;
    }
    return 1;
}

Server:OnFailedSMS(playerid)
{
    if(IsPlayerConnected(playerid))
    {
        SendClientMessage(playerid, COLOR_GREY, "[!] SMS gönderilirken baþarýsýz oldu.");
    }
    return 1;
}

Server:SendSMSText(playerid, playerb)
{
    if(IsPlayerConnected(playerid))
    {
        if(!IsPlayerConnected(playerb)) return SendClientMessage(playerid, COLOR_GREY, "[!] SMS gönderilirken baþarýsýz oldu.");

        new
            sender[60] = "";

        for(new i = 1; i < MAX_PLAYER_CONTACTS; i++)
        {
            if(ContactsData[playerb][i][contactNumber] == ReturnPhoneNumber(playerid))
            {
                format(sender, 60, "%s", ContactsData[playerb][i][contactName]);
            }
        }

        if(isnull(sender)) format(sender, 60, "%d", ReturnPhoneNumber(playerid));

        if(strlen(PlayerSMS[playerid]) > 80)
        {
            SendClientMessageEx(playerb, COLOR_YELLOW, "SMS: %.80s...", PlayerSMS[playerid]);
            SendClientMessageEx(playerb, COLOR_YELLOW, "SMS: ...%s, Gönderen: %s", PlayerSMS[playerid][80], sender);
        }
        else SendClientMessageEx(playerb, COLOR_YELLOW, "SMS: %s, Gönderen: %s", PlayerSMS[playerid], sender);

        SendClientMessage(playerid, COLOR_GREY, "[!] SMS baþarýyla gönderildi.");
    }
    return 1;
}

Server:OnNonEmergencyCall(playerid)
{
    SendClientMessage(playerid, COLOR_GREY, "[!] Çaðrý cevaplandý.");
    phoneTimer[playerid] = SetTimerEx("OnNonEmergencyCallPickup", 2000, false, "i", playerid);
    return 1;
}

Server:OnNonEmergencyCallPickup(playerid)
{
    SendClientMessage(playerid, COLOR_YELLOW, "991 Operatörü: Acil olmayan yardým hattý. Size nasýl yardým edebilirim?");
    PlayerData[playerid][pCalling] = 0;
    return 1;
}

Server:OnMechanicCall(playerid)
{
    SendClientMessage(playerid, COLOR_GREY, "[!] Çaðrý cevaplandý.");
    MechanicCallTimer[playerid] = SetTimerEx("OnMechanicCallPickup", 2000, false, "i", playerid);
    return 1;
}

Server:OnMechanicCallPickup(playerid)
{
    SendClientMessage(playerid, COLOR_YELLOW, "556 Operatörü: Jill'in tamirhanesini aradýnýz. Nasýl yardýmcý olabilirim?");
    PlayerData[playerid][pCalling] = 0;
    return 1;
}

Server:OnStolenCars(playerid)
{
    if(!cache_num_rows())
        return ShowPlayerDialog(playerid, DIALOG_MDC_FINISH_QUEUE, DIALOG_STYLE_MSGBOX, "Stolen Cars - MDC", "There are no reported vehicles.", ">>", "<<");

    new primary[600], sub[128];
    new Plate[30], ReportedDate, ModelID;
    strcat(primary, "Model\tPlaka\tTarih\n");
    for(new i = 0, j = cache_num_rows(); i < j; i++)
    {
        cache_get_value_name(i, "Plate", Plate, 30);
        cache_get_value_name_int(i, "ModelID", ModelID);
        cache_get_value_name_int(i, "ReportedStolenDate", ReportedDate);
        format(sub, sizeof(sub), "%s\t%s\t%s\n", ReturnVehicleModelName(ModelID), Plate, GetFullTime(ReportedDate));
        strcat(primary, sub);
    }

    ShowPlayerDialog(playerid, DIALOG_MDC_FINISH_QUEUE, DIALOG_STYLE_TABLIST_HEADERS, "Stolen Cars - MDC", primary, ">>", "<<");
    return 1;
}

Server:OnPhoneSearch(playerid, number)
{
    if(!cache_num_rows())
        return ShowPlayerDialog(playerid, DIALOG_MDC_FINISH_QUEUE, DIALOG_STYLE_MSGBOX, "MVB: Telefon Sorgulama", "Sorguladýðýnýz telefon numarasý veritabanýnda bulunamadý.", "<<", "");

    new Name[24], infoStr[190];
    cache_get_value_name(0, "Name", Name, 24);

    for(new i = 0; i < strlen(Name); i++)
    {
        if(Name[i] == '_')
        {
            Name[i] = ' ';
        }
    }

    format(infoStr, sizeof(infoStr), "{ADC3E7}Telefon Numarasý:{FFFFFF} %i\n{ADC3E7}Sahibi:{FFFFFF} %s\n\n{ADC3E7}Yukarýdaki bilgiler '%d' numarasý sorgulatýlmasý sonucunda çýkmýþtýr.", number, Name, number);
    ShowPlayerDialog(playerid, DIALOG_MDC_FINISH_QUEUE, DIALOG_STYLE_MSGBOX, "MVB: Telefon Sorgulama", infoStr, ">>", "<<");
    return 1;
}

Server:OnVehicleScrap(playerid, response, dbid, cash_back, vehicleid)
{
    if(response)
    {
        PlayerData[playerid][pBlockGetir] = 0;
        if(!IsPlayerInAnyVehicle(playerid)) return SendErrorMessage(playerid, "Araç içerisinde deðilsin, iþlem iptal edildi.");
        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendServerMessage(playerid, "Aracýn þoför koltuðunda deðilsin, iþlem iptal edildi.");
        if(GetPlayerVehicleID(playerid) != vehicleid) return SendServerMessage(playerid, "Hile kullanmaya çalýþtýðýn tespit edildi oyundan atýldýn."), KickEx(playerid);
        if(CarData[vehicleid][carOwnerID] != PlayerData[playerid][pSQLID]) return SendServerMessage(playerid, "Bu araca sahip deðilsin.");
        if(CarData[GetPlayerVehicleID(playerid)][carOwnerID] != PlayerData[playerid][pSQLID]) return SendServerMessage(playerid, "Bu araca sahip deðilsin.");

        GiveMoney(playerid, cash_back);
        SendClientMessageEx(playerid, COLOR_ACTION, "SERVER: %s model aracýný hurdaya çýkardýn ve $%s geri aldýn.", ReturnVehicleName(vehicleid), MoneyFormat(cash_back));
        adminWarn(1, sprintf("%s %s model aracý hurdaya çýkarttý. (dbid: %i)", ReturnName(playerid, 1), ReturnVehicleName(vehicleid), CarData[vehicleid][carID]));
        LogPlayerAction(playerid, sprintf("%s model aracýný hurdaya çýkardý. (DBID: %i)", ReturnVehicleName(vehicleid), CarData[vehicleid][carID]));

        _has_vehicle_spawned[playerid] = false;
        _has_spawned_vehicleid[playerid] = 0;

        for(new i = 1; i < MAX_OWNED_CARS; i++)
        {
            if(PlayerData[playerid][pOwnedCar][i] == CarData[vehicleid][carID])
            {
                PlayerData[playerid][pOwnedCar][i] = 0;
            }
        }

        new query[60];
        mysql_format(m_Handle, query, sizeof(query), "DELETE FROM vehicles WHERE id = %i", CarData[vehicleid][carID]);
        mysql_tquery(m_Handle, query);

        Vehicle_DefaultValues(vehicleid);
        DestroyVehicle(vehicleid);
        PlayerData[playerid][pBlockGetir] = 0;
        RefreshPlayerCarSlots(playerid);
    }
    else return SendErrorMessage(playerid, "Ýþlem iptal edildi."), PlayerData[playerid][pBlockGetir] = 0;
    return 1;
}

Server:OnVehicleOffer(playerid, response, sellto, price)
{
    if(response)
    {
        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, COLOR_ADM, "HATA: Araçta deðilsin.");
        if(!GetDistanceBetweenPlayers(playerid, sellto, 4.0)) return SendClientMessage(playerid, COLOR_ADM, "HATA: Bu kiþiye yakýn deðilsin.");

        new hasSpace = FreePlayerCarID(sellto);
        if(hasSpace == -1) return SendClientMessage(playerid, COLOR_ADM, "SERVER: Bu kiþi daha fazla araca sahip olamaz.");

        VehicleOfferedTo[playerid] = sellto;
        VehicleOfferBy[sellto] = playerid;

        VehicleDBIDOffered[playerid] = CarData[GetPlayerVehicleID(playerid)][carID];
        VehiclePrice[playerid] = price;

        VehicleDBIDOffered[sellto] = CarData[GetPlayerVehicleID(playerid)][carID];
        VehiclePrice[sellto] = price;

        SendClientMessageEx(sellto, COLOR_ACTION, "SERVER: %s sana %s model aracý satmak istiyor. Ücret: $%s", ReturnName(playerid, 1), ReturnVehicleName(GetPlayerVehicleID(playerid)), MoneyFormat(price));
        SendClientMessage(sellto, COLOR_ACTION, "SERVER: /arac kabul [evet/hayir] komutunu kullanarak cevaplayabilirsin.");

        SendClientMessageEx(playerid, COLOR_ACTION, "SERVER: %s isimli oyuncuya %s model aracýný satýþ isteði yolladýn. Ücret: $%s", ReturnName(sellto, 1), ReturnVehicleName(GetPlayerVehicleID(playerid)), MoneyFormat(price));
        SendClientMessage(playerid, COLOR_ACTION, "SERVER: Ýsteði iptal etmek için /arac sat iptal yazabilirsin.");
    }
    return 1;
}

Server:OnConfirmFuel(playerid, response, fuel_type, businessid)
{
    if(response)
    {
        new vehicleid = GetPlayerVehicleID(playerid);

        if(CarData[vehicleid][carFuel] > 99.0) return SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: Benzinin zaten dolu.");
        if(CarEngine[vehicleid]) return SendClientMessage(playerid, COLOR_DARKGREEN, "SERVER: Aracýn motorunu kapatarak benzin doldurabilirsin.");

        PlayerRefilling[playerid] = 1;
        RefillVehicle[playerid] = vehicleid;

        RefillPrice[playerid] = 10;
        RefillAmount[playerid] = 0;

        RefillTextdraw[playerid] = CreateDynamic3DTextLabel("(( |--------- ))\nDOLDURULUYOR", COLOR_DARKGREEN, 0.0, 0.0, 0.0, 10.0, .attachedvehicle = vehicleid, .worldid = GetPlayerVirtualWorld(playerid), .interiorid = GetPlayerInterior(playerid));
        RefillTimer[playerid] = SetTimerEx("OnVehicleRefill", 3000, true, "iii", playerid, fuel_type, businessid);

        Streamer_Update(playerid);
    }
    return 1;
}


Server:CheckPlayerClothing(playerid, obje_)
{
	for(new i = 0; i < 15; i++)
	{
		if(IsPlayerAttachedObjectSlotUsed(playerid, i))
		{
			if(ClothingData[playerid][i][ClothingModelID] == obje_)
			{
				return obje_;
			}
		}
	}
	return -1;
}


Server:OnVehicleRefill(playerid, fuel_type, businessid) //(( |--------- ))\nREFILLING
{
    if(!IsValidVehicle(RefillVehicle[playerid])) return EndPlayerRefill(playerid, businessid, 1);

    RefillPoint[playerid]++;

    new updateLabel[60];

    switch(RefillPoint[playerid])
    {
        case 1: updateLabel = "(( ||-------- ))\nDOLDURULUYOR";
        case 2: updateLabel = "(( |||------- ))\nDOLDURULUYOR";
        case 3:
        {
            RefillPrice[playerid]+= 10;
            updateLabel = "(( ||||------ ))\nDOLDURULUYOR";
        }
        case 4: updateLabel = "(( |||||----- ))\nDOLDURULUYOR";
        case 5: updateLabel = "(( ||||||---- ))\nDOLDURULUYOR";
        case 6:
        {
            RefillPrice[playerid]+= 10;
            updateLabel = "(( |||||||--- ))\nDOLDURULUYOR";
        }
        case 7: updateLabel = "(( ||||||||-- ))\nDOLDURULUYOR";
        case 8: updateLabel = "(( |||||||||- ))\nDOLDURULUYOR";
        case 9:
        {
            RefillPrice[playerid]+= 10;
            updateLabel = "(( |||||||||| ))\nDOLDURULUYOR";
        }
        case 10:
        {
            updateLabel = "(( BITTI ))\nDOLDURULUYOR";
            EndPlayerRefill(playerid, businessid);
        }
    }
    UpdateDynamic3DTextLabelText(RefillTextdraw[playerid], COLOR_DARKGREEN, updateLabel);

    //Fuel[vehicleid] = floatadd(5.0, floatround(Fuel[vehicleid]));

    RefillAmount[playerid]+= floatadd(10.0, floatround(CarData[RefillVehicle[playerid]][carFuel]));

    if(RefillAmount[playerid] >= 100)
    {
        RefillAmount[playerid] = 100;
        return EndPlayerRefill(playerid, businessid);
    }

    return 1;
}

Server:IfPhoneExists(playerid, playerb, number)
{
    if(!cache_num_rows())
    {
        PlayerData[playerb][pPhone] = number;
        Player_Save(playerb);

        new string[128];

        format(string, sizeof(string), "%s set %s's Phone number to %d", ReturnName(playerid, 1), ReturnName(playerb, 1), number);
        adminWarn(4, string);

        //WriteLog("admin_logs/setstats_log.txt", "[%s] %s set %s's Phone number to %d", ReturnDate(), ReturnName(playerid, 1), ReturnName(playerb, 1), number);
    }
    else return SendClientMessageEx(playerid, COLOR_ADM, "SERVER: The number \"d\" is taken.", number);
    return 1;
}

Server:IfBPhoneExists(playerid, playerb, number)
{
    if(!cache_num_rows())
    {
        PlayerData[playerb][pBurnerPhone] = number;
        Player_Save(playerb);

        new string[128];

        format(string, sizeof(string), "%s set %s's Burner Phone number to %d", ReturnName(playerid, 1), ReturnName(playerb, 1), number);
        adminWarn(4, string);

        //WriteLog("admin_logs/setstats_log.txt", "[%s] %s set %s's Burner Phone number to %d", ReturnDate(), ReturnName(playerid, 1), ReturnName(playerb, 1), number);
    }
    else return SendClientMessageEx(playerid, COLOR_ADM, "SERVER: The number \"d\" is taken.", number);
    return 1;
}

Server:OnAdminNoteAdd(playerid, reason[])
{
    new
        string[128];

    format(string, sizeof(string), "%s isimli oyuncuya %s tarafýndan bir not býrakýldý.", ReturnName(playerid), AdminPanelName[playerid]);
    adminWarn(2, string);

    format(string, sizeof(string), "You successfully added an admin note to \"{A52A2A}%s{ADC3E7}\". ", AdminPanelName[playerid]);
    ShowPlayerDialog(playerid, DIALOG_APANEL, DIALOG_STYLE_MSGBOX, "Administration panel", string, "Okay!", "");

    foreach(new i : Player)
    {
        if(PlayerData[i][pSQLID] == ReturnSQLFromName(AdminPanelName[playerid]))
        {
            new
                slot = ReturnANoteSlot(i);

            if(slot == -1)
                return SendClientMessageEx(playerid, COLOR_ADM, "An error occurred. %s's admin note was saved but wont be loaded due to exceeding the max admin notes a player can have.", AdminPanelName[playerid]);

            for(new j = 1; j < MAX_ADMIN_NOTES; j++)
            {
                if(aNotesData[i][j][anote_active])
                {
                    aNotesData[i][j][anote_active] = false;
                }
            }

            aNotesData[i][slot][anote_SQLID] = cache_insert_id();
            format(aNotesData[i][slot][anote_reason], 128, "%s", reason);
            format(aNotesData[i][slot][anote_issuer], 60, "%s", ReturnName(playerid));
            format( aNotesData[i][slot][anote_date], 60, "%s", Time());
            aNotesData[i][slot][anote_playerDBID] = PlayerData[i][pSQLID];
        }
    }
    return 1;
}

Server:OnAdminNoteDelete(playerid, response, selected)
{
    if(response)
    {
        new DeleteQuery[128];
        mysql_format(m_Handle, DeleteQuery, sizeof(DeleteQuery), "DELETE FROM player_anotes WHERE id = %i", selected);
        mysql_tquery(m_Handle, DeleteQuery, "OnAdminNoteDeleted", "ii", playerid, selected);
    }
    else return ShowAdminPanel(playerid);
    return 1;
}

Server:OnAdminNoteDeleted(playerid, selected)
{
    new string[128];

    format(string, sizeof(string), "%s deleted an admin note from %s", ReturnName(playerid), AdminPanelName[playerid]);
    adminWarn(2, string);

    format(string, sizeof(string), "You successfully deleted an admin note from \"{A52A2A}%s{ADC3E7}\".", AdminPanelName[playerid]);
    ShowPlayerDialog(playerid, DIALOG_APANEL, DIALOG_STYLE_MSGBOX, "Administration panel", string, "Okay!", "");

    foreach(new i : Player)
    {
        for(new j = 1; j < MAX_ADMIN_NOTES; j++)
        {
            if(aNotesData[i][j][anote_SQLID] == selected)
            {
                aNotesData[i][j][anote_SQLID] = 0;
                if(aNotesData[i][j][anote_active]) aNotesData[i][j][anote_active] = false;

                if(-- j > 0)
                {
                    aNotesData[i][j][anote_active] = true;
                }
            }
        }
    }

    return 1;
}

Server:ConfirmSecretWord(playerid)
{
    if(!cache_num_rows())
    {
        new LargeString[230],
            ipString[128];

        if(PlayerData[playerid][pAdmin] < 3)
            format(ipString, 128, "%s", ReturnIP(playerid));
        else ipString = "Admin Account";

        printf("[WARNING] %s (IP: %s) failed their secret word during a password change.", ReturnName(playerid), ReturnIP(playerid));

        format(LargeString, sizeof(LargeString), "%s (IP: %s) failed their secret word during a password change.", ReturnName(playerid), ipString);
        adminWarn(1, LargeString);

        strcat(LargeString, "{F81414}HATALI GÜVENLÝK KELÝMESÝ GÝRDÝN!\n\n");
        strcat(LargeString, "{FFFFFF}Güvenlik kelimeni doðru girmediðin sürece þifreni deðiþtiremezsin.");
        ShowPlayerDialog(playerid, DIALOG_USE, DIALOG_STYLE_PASSWORD, "Los Santos Roleplay: Þifre Deðiþtir", LargeString, "Tamam", "");
    }
    else
    {
        SendClientMessage(playerid, COLOR_ADM, "SERVER: Güvenlik kelimen doðrulandý, artýk þifreni deðiþtirebilirsin.");
        CanChangePassword[playerid] = 1;
    }
    return 1;
}

Server:LegShotEnd(playerid)
{
    PlayerData[playerid][pLegShot] = 0;
    return 1;
}

Server:OnLockTextdraw(playerid)
{
    DestroyDynamic3DTextLabel(BreakInTextDraw[playerid]);

    ActiveLockTD[playerid] = 0;
    BreakInError[playerid] = 0;
    return 1;
}

Server:OnBreakSuccess(playerid)
{
    PlayerBreakInVehicle[playerid] = INVALID_VEHICLE_ID;
    PlayerBreakingIn[playerid] = 0;
    BreakInError[playerid] = 0;
    ActiveLockTD[playerid] = 0;

    DestroyDynamic3DTextLabel(BreakInTextDraw[playerid]);
    return 1;
}

Server:unfreeze_player(playerid)
{
    TogglePlayerControllable(playerid, true);
    return 1;
}

Server:SQL_AddPlayerAdminNote(playerid)
{
    aNotesData[playerid][anote_idsave[playerid]][anote_SQLID] = cache_insert_id();
    return true;
}

Server:StopAnimation(playerid) return PlayerData[playerid][pPlayingAnimation] = false;

Server:RentalCheck()
{
    new
        vehicleid, bool: car_owner = false;

    for(new v = 1, j = GetVehiclePoolSize(); v <= j; v++)
    {
        if (IsValidVehicle(v))
        {
            if (!IsVehicleOccupied(v) && IsValidPlayerCar(v))
            {
                foreach(new c : Player)
                {
                    if(PlayerData[c][pSQLID] == CarData[v][carOwnerID])
                    {
                        car_owner = true;
                        vehicleid = v;
                        break;
                    }
                }
            }
        }
    }

    if(!car_owner)
    {
        Car_Save(vehicleid);
        Vehicle_DefaultValues(vehicleid);
        DestroyVehicle(vehicleid);
    }
    return 1;
}

Server:DestroyWater(objectid)
{
    if (IsValidDynamicObject(objectid)) DestroyDynamicObject(objectid);
    return 0;
}

Server:SprayListener(playerid, type)
{
    switch(type)
    {
        case 1:
        {
            new id = PlayerData[playerid][pSprayTarget];
            if((id != -1 && id == Spray_Nearest(playerid)))
            {
                PlayerData[playerid][pSprayPoint] ++;
                GameTextForPlayer(playerid, sprintf("~g~BOYANIYOR~n~~w~%d]", PlayerData[playerid][pSprayLength]-PlayerData[playerid][pSprayPoint]), 1000, 5);

                if(PlayerData[playerid][pSprayPoint] >= PlayerData[playerid][pSprayLength])
                {

                    ReplaceText(PlayerData[playerid][pSprayText], "(y)", "\n");
                    ReplaceText(PlayerData[playerid][pSprayText], "(k)", "{FF6347}"); // red
                    ReplaceText(PlayerData[playerid][pSprayText], "(si)", "{0E0101}"); // black
                    ReplaceText(PlayerData[playerid][pSprayText], "(s)", "{F3FF02}"); // yellow
                    ReplaceText(PlayerData[playerid][pSprayText], "(m)", "{0049FF}"); // blue
                    ReplaceText(PlayerData[playerid][pSprayText], "(ys)", "{6EF83C}"); // green
                    ReplaceText(PlayerData[playerid][pSprayText], "(t)", "{FFA500}"); // orange
                    ReplaceText(PlayerData[playerid][pSprayText], "(b)", "{FFFFFF}"); // white
                    ReplaceText(PlayerData[playerid][pSprayText], "(ks)", "{800000}");
                    ReplaceText(PlayerData[playerid][pSprayText], "(kv)", "{5B3F01}");

                    switch(PlayerData[playerid][pSprayAllow])
                    {
                        case 1: SetDynamicObjectMaterialText(SprayData[id][SprayObject], 0, PlayerData[playerid][pSprayText], OBJECT_MATERIAL_SIZE_512x256, font_data[PlayerData[playerid][pSprayFont]][font_name], 60, 1, -1, 0, 1);
                        case 2:
                        {
                            DestroyDynamicObject(SprayData[id][SprayObject]);
                            SprayData[id][SprayObject] = CreateDynamicObject
                            (
                                PlayerData[playerid][pSprayFont],
                                SprayData[id][SprayLocation][0],
                                SprayData[id][SprayLocation][1],
                                SprayData[id][SprayLocation][2],
                                SprayData[id][SprayLocation][3],
                                SprayData[id][SprayLocation][4],
                                SprayData[id][SprayLocation][5]
                            );
                        }
                    }
                    GameTextForPlayer(playerid, "~g~BOYANDI~w~]", 5000, 5);
                    PlayerPlaySound(playerid, 1057, 0, 0, 0);
                    ResetSprayVars(playerid);
                    return 1;
                }
            }
            else
            {
                ResetSprayVars(playerid);
                return 1;
            }
        }
        case 2:
        {
            ResetSprayVars(playerid);
        }
    }
    return 1;
}

Server:Chopshop_Timer(playerid, vehicleid)
{
    if(Chopshop_Nearest(playerid) == -1)
    {
        Chopshopping[playerid] = 0;
        KillTimer(ChopshopTimer[playerid]);
        GameTextForPlayer(playerid, "~r~Chopshop Noktasindan Uzaklastin!", 3000, 3);
        return 1;
    }

    GameTextForPlayer(playerid, sprintf("~r~Islem Yapiliyor~n~~w~%d]", Chopshopping[playerid]), 3000, 3);
    Chopshopping[playerid]--;

    if(Chopshopping[playerid] <= 30)
    {
        GetVehicleDamageStatus(vehicleid, CarData[vehicleid][carPanelStatus], CarData[vehicleid][carDoorsStatus], CarData[vehicleid][carLightsStatus], CarData[vehicleid][carTiresStatus]);
        UpdateVehicleDamageStatus(vehicleid, 53674035, 33686020, 5, 15);
    }

    if(Chopshopping[playerid] <= 0)
    {
        Chopshopping[playerid] = 0;
        KillTimer(ChopshopTimer[playerid]);

        GameTextForPlayer(playerid, "~r~Araci Basariyla Sattin]", 3000, 3);

        new money = (DealershipData[vehicleid][DealershipPrice]/5);
        GiveMoney(playerid, money);
        LogPlayerAction(playerid, sprintf("%i numaralý aracý satarak $%i aldý.", vehicleid, money));

        foreach(new n : Player)
        {
            if(strfind(ReturnName(n, 1), ReturnSQLName(CarData[vehicleid][carOwnerID]), true) != -1)
            {
                SendClientMessageEx(n, COLOR_ADM, "SERVER: %s aracýn hýrsýzlar tarafýndan kaçakçýlara satýldý.", ReturnVehicleName(vehicleid));
                _has_vehicle_spawned[n] = false;
            }
            else{
                new
                    query[128];

                mysql_format(m_Handle, query, sizeof(query), "UPDATE players SET HasCarSpawned = 0 WHERE id = %i LIMIT 1", CarData[vehicleid][carOwnerID]);
                mysql_tquery(m_Handle, query);
            }
        }

        new Float:life_deplete;
        life_deplete = CarData[vehicleid][carEngine] / 1.30;

        if(life_deplete < 1.00)
            CarData[vehicleid][carEngine] = 0.0;
        else CarData[vehicleid][carEngine] = life_deplete;

        CarData[vehicleid][carBattery]-= 10.00;
        CarData[vehicleid][carTimeDestroyed]++;
        CarData[vehicleid][carLastHealth] = 500;
        Car_Save(vehicleid);

        Vehicle_DefaultValues(vehicleid);
        DestroyVehicle(vehicleid);
    }
    return 1;
}

Server:OnChopshopCreated(chopshopid)
{
    if (chopshopid == -1 || !ChopshopData[chopshopid][chopshop_exist])
        return 0;

    ChopshopData[chopshopid][chopshop_id] = cache_insert_id();
    Chopshop_Save(chopshopid);
    return 1;
}

Server:OnImpoundCreated(impoundid)
{
    if (impoundid == -1 || !ImpoundData[impoundid][impoundExists])
        return 0;

    ImpoundData[impoundid][impoundID] = cache_insert_id();
    Impound_Save(impoundid);
    return 1;
}

Server:Phone_Toggle(playerid)
{
    PlayerData[playerid][pPhoneCooldown] = 0;
    if(PlayerData[playerid][pUseGUI])
    {
        if(PlayerData[playerid][pPhoneOff])
        {
            PlayerData[playerid][pPhoneOff] = false;
            PlayerTextDrawHide(playerid, PhoneDisplay[playerid]);
            PlayerTextDrawBoxColor(playerid, PhoneDisplay[playerid], -572662273);
            PlayerTextDrawShow(playerid, PhoneDisplay[playerid]);
            PlayerTextDrawSetString(playerid, PhoneNotify[playerid], "_");
        }
        else
        {
            PlayerData[playerid][pPhoneOff] = true;
            PlayerTextDrawHide(playerid, PhoneDisplay[playerid]);
            PlayerTextDrawBoxColor(playerid, PhoneDisplay[playerid], 255);
            PlayerTextDrawShow(playerid, PhoneDisplay[playerid]);
            PlayerTextDrawSetString(playerid, PhoneNotify[playerid], "_");
        }
    }
    return 1;
}


Server:bumpTierBlowout(vehicleid)
{
	new panels, doors, lights, tires;
	GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
	UpdateVehicleDamageStatus(vehicleid, panels, doors, lights, encode_tires(1, 1, 1, 1));
	spikeTire[vehicleid] = false;
	return 1;
}


Server:CheckWeaponAttachements(playerid, weaponid)
{
    if(!cache_num_rows())
  	{
			new enum_index = weaponid - 22, query[546];
			mysql_format(m_Handle, query, sizeof(query), "INSERT INTO weapon_attachments (playerdbid, WeaponID, BoneID, Hidden, PosX, PosY, PosZ, RotX, RotY, RotZ) VALUES (%i, %i, %i, %i, %.3f, %.3f, %.3f, %.3f, %.3f, %.3f) ON DUPLICATE KEY UPDATE PosX = VALUES(PosX), PosY = VALUES(PosY), PosZ = VALUES(PosZ), RotX = VALUES(RotX), RotY = VALUES(RotY), RotZ = VALUES(RotZ)", PlayerData[playerid][pSQLID], weaponid, WeaponSettings[playerid][enum_index][WeaponBone], WeaponSettings[playerid][enum_index][WeaponHidden], WeaponSettings[playerid][enum_index][WeaponPos][0], WeaponSettings[playerid][enum_index][WeaponPos][1], WeaponSettings[playerid][enum_index][WeaponPos][2], WeaponSettings[playerid][enum_index][WeaponPos][3], WeaponSettings[playerid][enum_index][WeaponPos][4], WeaponSettings[playerid][enum_index][WeaponPos][5]);
			mysql_tquery(m_Handle, query);
			return 1;
		}
		Save_WeaponAttachements(playerid, weaponid);
    return 1;
}

Save_WeaponAttachements(playerid, weaponid)
{
		new enum_index = weaponid - 22;
	new
		query[355];

	mysql_format(m_Handle, query, sizeof(query), "UPDATE weapon_attachments SET BoneID = %i, Hidden = %i WHERE WeaponID = %d AND playerdbid = %d",
		WeaponSettings[playerid][enum_index][WeaponBone],
		WeaponSettings[playerid][enum_index][WeaponHidden],
    weaponid,
		PlayerData[playerid][pSQLID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE weapon_attachments SET PosX = %.3f, PosY = %.3f, PosZ = %.3f WHERE WeaponID = %d AND playerdbid = %d",
		WeaponSettings[playerid][enum_index][WeaponPos][0],
		WeaponSettings[playerid][enum_index][WeaponPos][1],
		WeaponSettings[playerid][enum_index][WeaponPos][2],
		weaponid,
		PlayerData[playerid][pSQLID]
	);
	mysql_tquery(m_Handle, query);

	mysql_format(m_Handle, query, sizeof(query), "UPDATE weapon_attachments SET RotX = %.3f, RotY = %.3f, RotZ = %.3f WHERE WeaponID = %d AND playerdbid = %d",
		WeaponSettings[playerid][enum_index][WeaponPos][3],
		WeaponSettings[playerid][enum_index][WeaponPos][4],
		WeaponSettings[playerid][enum_index][WeaponPos][5],
		weaponid,
		PlayerData[playerid][pSQLID]
	);
	mysql_tquery(m_Handle, query);

	return 1;
}

Server:OnPlayerCarTweak(i, vehicleid)
{
	if(IsPlayerInAnyVehicle(i))
	{
		new keys,ud,lr;
		GetPlayerKeys(i,keys,ud,lr);
			if(keys == 8)
			{
					if(CarData[vehicleid][carTweak] == true)
					{
							if(gettime() - CarData[vehicleid][carRev] < 60)
							{
									PlayerData[i][TempTweak] ++;
									PlayNearbySound(i, 11200);
									if(PlayerData[i][TempTweak] >= 15)
									{
											new rand = random(3);
											if(rand != 0)
											{
													CarData[vehicleid][carTweak] = false;
													PlayerData[i][TempTweak] = 0;
													CarData[vehicleid][carRev] = 0;
													cmd_ame(i, sprintf("%s model aracýn motorunu çalýþtýrýr.", ReturnVehicleName(vehicleid)));
													ToggleVehicleEngine(vehicleid, true);
													CarEngine[vehicleid] = true;
													KillTimer(PlayerData[i][carTweakTimer]);
											}
											else
											{
													GameTextForPlayer(i, "~r~BASARISIZ OLDU~n~~w~TEKRAR DENE!", 3000, 4);
													PlayerData[i][TempTweak] = 0;
													CarData[vehicleid][carRev] = 0;
													KillTimer(PlayerData[i][carTweakTimer]);
											}
									}
							}
					}
			}
			else
			{
				PlayerData[i][TempTweak] = 0;
				CarData[vehicleid][carRev] = 0;
				KillTimer(PlayerData[i][carTweakTimer]);
			}

			if(keys != 8)
			{
					if(CarData[ GetPlayerVehicleID(i) ][carTweak])
					{
							PlayerData[i][TempTweak] = 0;
							KillTimer(PlayerData[i][carTweakTimer]);
					}
			}
	}
	return 1;
}

Server:RemoveCCTVShot(playerid)
{
	return SetPVarInt(playerid, "cctvShot", 0);
}

ReturnVehiclePlate(vid)
{
	new vehicleplate[9];
	GetVehicleNumberPlate(vid, vehicleplate, sizeof(vehicleplate));
	return vehicleplate;
}

FixDiscordWord(string[256])
{
	format(string, 256, "%s", string);

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

Server:SendLSPDDiscordMessage(channel, message[])
{
	new encodedStr[256];
	utf8encode(encodedStr, message);
	DCC_SendChannelMessage(channel, encodedStr);
	return 1;
}

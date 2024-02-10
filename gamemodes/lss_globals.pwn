#define REVISION "LSS-RP 1.0.0"

#define TEST_SERVER
//#define LIVE_SERVER

#if defined LIVE_SERVER
	/*#define MYSQL_HOSTNAME "185.61.137.168"
	#define MYSQL_USERNAME "lsrpwebx_oyun"
	#define MYSQL_DATABASE "lsrpwebx_oyun"
	#define MYSQL_PASSWORD "rs5mePmzF_qr"*/

	#define MYSQL_HOSTNAME "51.178.170.134"
	#define MYSQL_USERNAME "root"
	#define MYSQL_DATABASE "lsrptr"
	#define MYSQL_PASSWORD "rs5mePmzF_qr"
#else
	#define MYSQL_HOSTNAME "localhost"
	#define MYSQL_USERNAME "root"
	#define MYSQL_DATABASE "lsrp"
	#define MYSQL_PASSWORD ""
#endif


#define KEY_SWITCH_NEXT     	KEY_LOOK_RIGHT
#define KEY_SWITCH_PREVIOUS     KEY_LOOK_LEFT

new
	g_CurrentWeapon[MAX_PLAYERS];

#define BLOCK_NONE 0
#define LESS_DAMAGE_FIST 1
#define BLOCK_FIST 2
#define LESS_DAMAGE_MELEE 3
#define BLOCK_PHYSICAL 4

#define KEY_AIM 132

#define SLOT_HANDCUFF 6
#define SLOT_PHONE 7
#define SLOT_MEAL 8
#define SLOT_MISC 9

new payday2 = 0;
new bool: ingamereg = false;

new taxi_vehicles[3],
	dmv_vehicles[4];

#if !defined IsNaN
    #define IsNaN(%0) ((%0) != (%0))
#endif

#define SPECTATE_TYPE_PLAYER 0
#define SPECTATE_TYPE_VEHICLE 1

new stealplateTimer[MAX_PLAYERS];


new oc_ws[MAX_PLAYERS];
new blacklisted_weaps[4] = {35, 36, 37, 38};

new CCTVID[MAX_PLAYERS],
	SpectateID[MAX_PLAYERS],
 	SpectateType[MAX_PLAYERS];

new Iterator:SpectatePlayers<MAX_PLAYERS>;


native WP_Hash(buffer[], len, const str[]);
native gpci(playerid, serial[], len);


forward Float: GetVehicleCondition(vehid, type);

Float:vericek_float(row, const field_name[])
{
	new Float:str;
	cache_get_value_name_float(row, field_name, str);
	return str;
}

vericek_int(row, const field_name[])
{
    new str;
    cache_get_value_name_int(row, field_name, str);
    return str;
}

#define randomEx(%1,%2) (random(%2-%1)+%1)
#define Server:%0(%1) forward %0(%1); public %0(%1)
#define SendMessage(%0,%1) SendClientMessageEx(%0, COLOR_WHITE, ""%1)
#define SendErrorMessage(%0,%1) SendClientMessageEx(%0, COLOR_ADM, "HATA: "%1)
#define SendServerMessage(%0,%1) SendClientMessageEx(%0, COLOR_RED, "SERVER: "%1)
#define SendInfoMessage(%0,%1) SendClientMessageEx(%0, COLOR_RED, "BÝLGÝ:{FFFFFF} "%1)
#define SendUsageMessage(%0,%1) SendClientMessageEx(%0, COLOR_RED, "KULLANIM:{FFFFFF} "%1)

#define	BIRLIK_BASLIK 		"{3498DB}Birlik: {FFFFFF}"

#define MAX_CLOTHING_SHOW (25)

new playerHouseSelect[MAX_PLAYERS][3];

//Keys:
#define HOLDING(%0) ((newkeys & (%0)) == (%0))
#define PRESSED(%0) (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define RELEASED(%0) (((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))

// 987.5984 -1252.2427 16.9844
#define MECHANIC_COMP_PRICE (30)
#define MECHANIC_POS_X 		(93.1775)
#define MECHANIC_POS_Y 		(-164.7851)
#define MECHANIC_POS_Z 		(2.5938)
#define MECHANIC_POS_RANGE  (3.0)
#define MECHANIC_PICKUP_ID  (1239)
#define MECHANIC_LABEL_TEXT "[Mekanik Mesleði]\n/meslek mekanik"

#define TRASH_PRICE 	(5)
#define TRASH_X 		(2573.7185)
#define TRASH_Y 		(-2222.4182)
#define TRASH_Z 		(13.3316)
#define TRASH_RANGE  	(3.0)
#define TRASH_PICKUPS  	(1239)
#define TRASH_TEXT "[Çöpçülük]\n/cop sat"

// 2430.4795 -2512.8518 13.6562
#define MECHANIC_COMP_POS_X 		(2430.4795)
#define MECHANIC_COMP_POS_Y 		(-2512.8518)
#define MECHANIC_COMP_POS_Z 		(13.6562)
#define MECHANIC_COMP_POS_RANGE  	(3.0)
#define MECHANIC_COMP_PICKUP_ID  	(1239)
#define MECHANIC_COMP_LABEL_TEXT 	"[Mekanik Mesleði]\n/parcaal"

#define EXTERIOR_TUNING_X 				(418.0252)
#define EXTERIOR_TUNING_Y 				(-1324.3462)
#define EXTERIOR_TUNING_Z 				(14.9415)

#define INTERIOR_TUNING_X 				(434.0549)
#define INTERIOR_TUNING_Y 				(-1299.4264)
#define INTERIOR_TUNING_Z 				(15.3104)

#define DEFAULT_TEXTURE (1000)
#define DEFAULT_SKIN (264)
#define MDC_ERROR	(21001)
#define MDC_SELECT	(21000)
#define MDC_OPEN	(45400)

#define DOTS_ADD                (3)
#define MAX_VLOG_PER_PAGE (20)
#define MAX_PLOG_PER_PAGE (21)
#define MAX_PLAYER_PER_PAGE (10)

#define MAX_VBOLO 	(38)
// Max defines:
#define MAX_ENTRANCES (60)
#define MAX_FACTIONS (30)
#define MAX_CCTVS (100)
#define MAX_FACTION_RANKS (21)
#define MAX_PROPERTY_ADDRESS  (70)
#define MAX_PROPERTY (500)
#define MAX_BUSINESS (300)
#define MAX_ATM_MACHINES (50)
#define MAX_IMPOUND_LOTS (20)
#define MAX_PAYNSPRAY (9)
#define MAX_SIKICILER (35)
#define MAX_OWNED_CARS (10)
#define MAX_TOLLS (15)
#define MAX_CHOPSHOP (15)
#define MAX_DAMAGES (100)
#define MAX_CORPSE (50)
#define MAX_CORPSEDAMAGE (15)
#define MAX_DROP_ITEMS (200)
#define MAX_GATES (500)
#define MAX_ANTENNAS (70)
#define MAX_SERVER_OBJECTS (300)
#define MAX_SERVER_PICKUPS (100)
#define MAX_MEALS (55)
#define MAX_DOORS (500)
#define MAX_PLAYER_NOTES (5)
#define MAX_APBS (25)
#define MAX_REPORTS (200)
#define MAX_SUPPORTS (200)
#define MAX_STREETS (276)
#define MAX_DEALERSHIP_CAT (15)
#define MAX_DEALERSHIPS (129)
#define MAX_PLAYER_CONTACTS (15)
#define MAX_GARAGES (150)
#define MAX_XMR_CATEGORIES (40)
#define MAX_XMR_SUBCATEGORY (100)
#define MAX_ADMIN_NOTES (6)
#define MAX_CLOTHING_ITEMS (15)
#define MAX_PROPERTY_DRUGS (21)
#define MAX_COMMAND_LOG (21)
#define MAX_CHAT_LOG (21)
#define MAX_BOOMBOXS (30)
#define MAX_ROADBLOCKS (200)
#define MAX_FINES  (30)
#define MAX_GARBAGE_BINS (425)
#define MAX_FIRES (30)
#define MAX_LABELS (30)
#define MAX_DOSIGN (60)
#define MAX_ADVERTS (10)
#define MAX_TELEPORTS (50)
#define MAX_SPRAYS (50)
#define MAX_BILLBOARDS (50)

#define MAX_TRUCK_CARGO (70)
#define MAX_TRUCK_PACK (26)
#define MAX_CARGO_OBJ (100)
#define MAX_TRUCK_PRODUCT (26)

#define TRUCKER_FUEL 		0 //Vehicle
#define TRUCKER_FOOD		1
#define TRUCKER_DRINK 		2
#define TRUCKER_CLOTHES 	3
#define TRUCKER_CARS 		4 //Vehicle
#define TRUCKER_FURNITURE   5
#define TRUCKER_MEAT        6
#define TRUCKER_EGGS        7
#define TRUCKER_MILK 		8 //Vehicle
#define TRUCKER_CEREAL      9 //Vehicle
#define TRUCKER_COTTON      10 //Vehicle
#define TRUCKER_DYES        11 //Vehicle
#define TRUCKER_COMPONENTS  12
#define TRUCKER_MALT        13 //Vehicle
#define TRUCKER_MONEY       14
#define TRUCKER_PAPER       15
#define TRUCKER_AGGREGATE   16 //Vehicle
#define TRUCKER_WOODS	 	17 //Vehicle
#define TRUCKER_GUNPOWDER   18
#define TRUCKER_SCRAP       19 //Vehicle
#define TRUCKER_STEEL       20
#define TRUCKER_GUNS        21
#define TRUCKER_BRICKS 		22 //Vehicle
#define TRUCKER_APPLIANCES  23
#define TRUCKER_FRUITS      24
#define TRUCKER_TRANSFORMS	25

//Numbers:
#define TAXI_NUMBER (544)
#define MECHANIC_NUMBER (556)

//Player states:
#define STATE_ALIVE (1)
#define STATE_WOUNDED (2)
#define STATE_DEAD (3)

//Body parts:
#define BODY_PART_CHEST	(3)
#define BODY_PART_GROIN (4)
#define BODY_PART_LEFT_ARM (5)
#define BODY_PART_RIGHT_ARM (6)
#define BODY_PART_LEFT_LEG (7)
#define BODY_PART_RIGHT_LEG (8)
#define BODY_PART_HEAD (9)

//Object bones:
#define OBJECT_BONE_SPINE (1)
#define OBJECT_BONE_HEAD (2)
#define OBJECT_BONE_LUPPER_A (3)
#define OBJECT_BONE_RUPPER_A (4)
#define OBJECT_BONE_LHAND (5)
#define OBJECT_BONE_RHAND (6)
#define OBJECT_BONE_LTHIGH (7)
#define OBJECT_BONE_RTHIGH (8)
#define OBJECT_BONE_LFOOT (9)
#define OBJECT_BONE_RFOOT (10)

//Property types:
#define PROPERTY_COMPLEX (1)
#define PROPERTY_APARTMENT (2)
#define PROPERTY_HOUSE (3)

//Jobs:
#define MECHANIC_JOB (1)
#define TAXI_JOB (2)
#define TRUCKER_JOB (3)

//LS Telefonica pages:
#define PAGE_NONE (-1)
#define PAGE_HOME (0)
#define PAGE_MENU (1)
#define PAGE_NOTEBOOK (2)
#define PAGE_CONTACT (3)
#define PAGE_SETTING (4)
#define PAGE_RINGTONE (5)
#define PAGE_PHONECOLOR (6)
#define PAGE_PHONEMODE (7)
#define PAGE_USERS (8)

//LS Telefonica colors:
#define PHONE_TYPE_BLACK 	(0) // 18868
#define PHONE_TYPE_GREY  	(1) // 18874
#define PHONE_TYPE_RED   	(2) // 18870
#define PHONE_TYPE_YELLOW 	(3) // 18873
#define PHONE_TYPE_BLUE		(4) // 18866
#define PHONE_TYPE_GREEN	(4) // 18871
#define PHONE_TYPE_ORANGE	(5) // 18865
#define PHONE_TYPE_PINK		(6) // 18869

//Spawn points:
#define SPAWN_POINT_AIRPORT (0)
#define SPAWN_POINT_PROPERTY (1)
#define SPAWN_POINT_RENTING (2)
#define SPAWN_POINT_FACTION (3)

//Drug types:
#define DRUG_TYPE_MARIJUANA (1)
#define DRUG_TYPE_CRACK (2)
#define DRUG_TYPE_COCAINE (3)
#define DRUG_TYPE_ECSTASY (4)
#define DRUG_TYPE_LSD (5)
#define DRUG_TYPE_METH (6)
#define DRUG_TYPE_PCP (7)
#define DRUG_TYPE_HEROIN (8)
#define DRUG_TYPE_ASPIRIN (9)
#define DRUG_TYPE_HALOP (10)
#define DRUG_TYPE_MORPHINE (11)
#define DRUG_TYPE_XANAX (12)
#define DRUG_TYPE_MDMA (13)
#define DRUG_TYPE_PHENETOLE (14)
#define DRUG_TYPE_STEROIDS (15)
#define DRUG_TYPE_MESCALIN (16)
#define DRUG_TYPE_QUAALUDES (17)
#define DRUG_TYPE_PEYOTE (18)

//Fuel
#define FUEL_TYPE_PETROL (1)
#define FUEL_TYPE_DIESEL (2)
#define FUEL_TYPE_ELECTRIC (3)

//Colors:
#define COLOR_WHITE 	(0xFFFFFFFF)
#define COLOR_ADM   	(0xFF6347FF)
#define COLOR_GREY 		(0xAFAFAFFF)
#define COLOR_DARKGREEN (0x33AA33FF)
#define COLOR_TAXIDUTY	(0xFBA16CFF)
#define COLOR_YELLOW	(0xFFFF00FF)
#define COLOR_EMOTE		(0xC2A2DAFF)
#define COLOR_PMREC		(0xFFDC18FF)
#define COLOR_PMSEN		(0xEEE854FF)
#define COLOR_ORANGE	(0xFF9900AA)
#define COLOR_ADMIN		(0x587B95FF)
#define COLOR_FADE1 	(0xE6E6E6E6)
#define COLOR_FADE2 	(0xC8C8C8C8)
#define COLOR_FADE3 	(0xAAAAAAAA)
#define COLOR_FADE4 	(0x8C8C8C8C)
#define COLOR_FADE5 	(0x6E6E6E6E)
#define COLOR_SAMP		(0xADC3E7FF)
#define COLOR_RED		(0xFF6347FF)
#define COLOR_DARKRED 	(0xa71010FF)
#define COLOR_RADIO		(0xFFEC8BFF)
#define COLOR_SPLX      (0xB6AA96FF)
#define COLOR_RADIOEX	(0xB5AF8FFF)
#define COLOR_GRAD1		(0xCCE6E6FF)
#define COLOR_GRAD2		(0xE2FFFFFF)
#define COLOR_BLUE		(0x33CCFFFF)
#define COLOR_TESTER 	(0xA52A2AFF)
#define COLOR_COP		(0x8D8DFFFF)
#define COLOR_PINK		(0xFF00FFFF)
#define COLOR_DEPT		(0xF07A7AFF)
#define COLOR_TEXTDRAW	(0xAC7A32FF)
#define COLOR_EMT		(0xFF8282FF)
#define COLOR_STATS		(0x85A82BFF)
#define COLOR_ACTION	(0xF8E687FF)
#define COLOR_CYAN		(0x33CCFFFF)
//#define COLOR_NINER		(0x55C4D9FF)
#define COLOR_NINER		(0x31B9F9FF)
#define COLOR_GOLD 		(0xFFD700FF)
#define COLOR_REPORT 	(0xFFFF91FF)
#define COLOR_LGREEN    (0x33FF33AA)
#define COLOR_SADOC		(0x554273FF)
#define COLOR_SOFTPINK  (0xffC0B0FF)
#define COLOR_LIGHTRED  (0xFF6347FF)

enum
{
    DIALOG_NONE,
    DIALOG_DEFAULT,
	DIALOG_CONFIRM_SYS,
	DIALOG_USE,

	DIALOG_RACE,
	DIALOG_REMOVE_COMP,

	DIALOG_SPRAY_MAIN,
	DIALOG_SPRAY_IMAGE,
	DIALOG_SPRAY_INPUT,
	DIALOG_SPRAY_FONT,
	DIALOG_SPRAY_CREATE,

	DIALOG_VEHICLE_WEAPONS,

	DIALOG_TP_LIST,

	DIALOG_INTERIORS,


	DIALOG_DEALERSHIP_APPEND,
	DIALOG_DEALERSHIP_APPEND_ALARM,
	DIALOG_DEALERSHIP_APPEND_LOCK,
	DIALOG_DEALERSHIP_APPEND_INS,
	DIALOG_DEALERSHIP_APPEND_IMMOB,
	DIALOG_DEALERSHIP_PURCHASE,

	DIALOG_XMR,
	DIALOG_XMR_SELECT,
	DIALOG_XMR_URL,

	DIALOG_CLOTHING_MENU,

	DIALOG_ADMIN_MSG,

	DIALOG_SECRETWORD_CREATE,
	DIALOG_SECRETWORD_APPROVE,

	DIALOG_FOOD_CONFIG,
	DIALOG_FOOD_TYPE,
	DIALOG_FOOD_PRICE_1,
	DIALOG_FOOD_PRICE_2,
	DIALOG_FOOD_PRICE_3,

	DIALOG_GRAFFITI_MENU,
	DIALOG_GRAFFITI_TEXT,
	DIALOG_GRAFFITI_FONT,

	DIALOG_MDC,
	DIALOG_MDC_FINISH_QUEUE,

	DIALOG_MDC_NAME,
	DIALOG_MDC_PLATE,
	DIALOG_MDC_PLATE_LIST,

	DIALOG_MDC_PLATE_FULL,
	DIALOG_MDC_PLATE_PARTIAL,

	DIALOG_MDC_NUMBER_SEARCH,

	DIALOG_VEHICLE_FINES,


	DIALOG_ADMIN_NAME,

	DIALOG_VLOG_LIST,
	DIALOG_PLOG_LIST,

	DIALOG_HACKSYS,

	DIALOG_ASYS_OFFLINEBAN,
	DIALOG_ASYS_BANREASON,

	DIALOG_ASYS_OFFLINEAJAIL,
	DIALOG_ASYS_OJAILTIME,
	DIALOG_ASYS_OJAILREASON,

	DIALOG_APANEL,
	DIALOG_ASYS_UNBAN,

	DIALOG_LOOKUP_JAILS,
	DIALOG_LOOKUP_KICKS,
	DIALOG_LOOKUP_BANS,

	DIALOG_DECRYPTMASK,

	DIALOG_FINDMASK,
	DIALOG_SKINSEARCH,

	DIALOG_ANOTE_LOOKUP,
	DIALOG_ANOTE_SELECT,

	DIALOG_ANOTE_EDIT,
	DIALOG_ANOTE_EDIT_YES,
	DIALOG_ANOTE_EDIT_YES2,
	DIALOG_ANOTE_EDIT_YES3,

	DIALOG_ANOTE_ADD,
	DIALOG_ANOTE_ADD_REASON,

	DIALOG_ANOTE_DELETE,
	DIALOG_ANOTE_DELETE_SELECT,
	DIALOG_ANOTE_DELETE_CONFIRM,

	DIALOG_PASSWORD_CHANGE,
	DIALOG_PASSWORD_SECURITY_WORD,

	DIALOG_GPS,
	DIALOG_CALL,
	DIALOG_SMS_1,
	DIALOG_SMS_2,

	DIALOG_CONTACT_1,
	DIALOG_CONTACT_2,

	DIALOG_CONTACT_EDIT_1,
	DIALOG_CONTACT_EDIT_2,
	DIALOG_CONTACT_EDIT_3,

	DIALOG_CONTACT_DELETE,

	DIALOG_SMS_OR_CALL,
    DIALOG_SMS_OR_CALL2,

	DIALOG_FACTIONMENU,
	DIALOG_FACTIONMENU_NAME,
	DIALOG_FACTIONMENU_ABBREV,
	DIALOG_FACTIONMENU_ALTER,
	DIALOG_FACTIONMENU_TOW,
	DIALOG_FACTIONMENU_CHAT,
	DIALOG_FACTIONMENU_JOIN,
	DIALOG_FACTIONMENU_EDIT,
	DIALOG_FACTIONMENU_EDITALT,

	DIALOG_FACTIONMENU_EDITSAL,
	DIALOG_FACTIONMENU_EDITALTSAL,

	DIALOG_SELECT_HOUSE,
	DIALOG_SELECT_SKIN,
	DIALOG_SELECT_SKIN2,
	DIALOG_SELECT_ACCESSORY
}

new PlayerTutorialStep[MAX_PLAYERS],
	PlayerTutorialTimer[MAX_PLAYERS];

//Enumerators:
enum P_MASTER_ACCOUNTS
{
	mSQLID,
	mLastIP[16]
}

new AccountData[MAX_PLAYERS][P_MASTER_ACCOUNTS];

//Enumerators:
enum E_PLAYER_DATA
{
	pSQLID,
	pFirstLogin,

	pAdmin,
	pAdminName[24],
	bool:pAdminDuty,
	bool:pAdminHide,

	bool:PmOFF,

	pTester,
	pTesterName[24],
	bool:pTesterDuty,

	pGender,

	pExp,
	pLevel,
	pMoney,
	pBank,
	pPaycheck,
	pSavings,

	pUpgradePoints,

	pBirthdate,
	pBirthplace[35],
	pAttributes[128],
	pSecurityNumber,

	pInjurTime,

	pBlockGetir,

	bool:pNewss,
	bool:pKickBanStatus,

	Float: pPos[4],
	pInterior,
	pWorld,

	pMaxHealth,
	Float: pLastHealth,
	Float: pLastArmor,

	pSkin,
	pDutySkin,

	pDonator,
	pDonateTime,

	pOnlineTime,
	pRep,

	pHelpupTime,
	pReportTime,
	pSupportTime,

	pRegTime,
	pLastTime,
	pLastTimeLength,

	pPauseCheck,
	pPauseTime,

	pRegIP[16],
	pLastIP[16],

	pPlayTime,
	pCrashed,

	pHWID[60],
	pCarKey,
	pRentCarKey,

	pHouseKey,
	pHouseFurniture,

	pBizFurniture,

	pGrantBuild,
	pGrantBuildBiz,
	p3DMenu,

	bool: pDriversLicense,
	bool: pWeaponsLicense,
	bool: pMedicalLicense,
	bool: pFlyLicense,
	DriversLicenseWarning,

	pFaction,
	pFactionRank,
	pBadge,

	pJob,
	pJobTime,
	pJobLevel,

	pSideJob,
	pSideJobTime,
	pSideJobLevel,

	pOffered,
	pOfferedID,
	pOfferedType,
	pOfferPrice,
	pOffer,
	pOfferedItem,

	pICJailed,
	pICJailTime,
	pICJailNotify,
	Text3D: pICJail3D,

	pPrisonTimes,
	pActiveListing,

	pOffAjail,
	pOffAjailReason[128],

	pAjailed,
	pAjailTime,
	pJailTimes,

	pAdminMsgBy,
	pAdminMsg[128],
	bool: pAdmMsgConfirm,

	pLegShot,
	pLowSkill,
	pBrutallyWounded,
	pExecuteTime,

	pChatstyle,
	pWalkstyle,
	pFightstyle,
	pHudstyle,
	pStreetstyle,

	bool: pChatStatus,
	bool: pHudStatus,
	bool: pStreetStatus,
	bool: pPMStatus,
	bool: pOOCStatus,
	bool: pFactionStatus,
	bool: pNewsStatus,
	bool: pColorStatus,
	bool: pDeathStatus,
	bool: pNickStatus,
	bool: pConnectStatus,

	pCheckpoint,
	pCarCheckpoint,

	pInsideComplex,
	pInsideHouse,
	pInsideApartment,
	pInsideBusiness,
	pInsideGarage,
	pInsideEntrance,

	pInsideDoor,
	pInsidePNS,

	pGascan,

	bool: pHasMask,
	bool: pHasRadio,
	bool: pHasBurner,
	bool: pHasBoombox,

	pMaskID,
	pMaskIDEx,
	bool: pMaskOn,

	pOwnedCar[10],

	pMainSlot,
	pRadio[9],
	pRadioSlot[9],

	pPhone,
	pPhoneOff,
	pPhoneType,
	pPhoneRingtone,
	pPhoneSilent,

	pCalling,
	pPhoneline,
	pPhoneCooldown,
	pLoudspeaker,

	bool: pUseGUI,
	bool: pUseCaseGUI,

	pBurnerPhone,
	bool: pUsingBurner,
	bool: pBurnerPhoneOff,

	pRenting,
	pWorkOn,

	pSpawnPoint,
	pSpawnPointHouse,
	pSpawnPrecinct,

	pLAWduty,
	pSWATduty,
	pMEDduty,
	pSDCduty,

	pComponents,
	pCigarettes,
	pDrinks,

	bool: pPlateSteal,
	pColdedPlate[9],
	pColdedPlateVehicle,

	bool: pBlindFolded,
	bool: pSSMod,
	bool: pHandcuffed,
	bool: pHandcuffing,
	pHandcuffCount,

	bool: pTaser,
	bool: pTackle,
	bool: pAlpr,
	bool: pRubberbullet,
	bool: pLethalbullet,
	pCallsign[60], // birim kodu pd
	pDep,

	bool: pRadar,
	Float: pRadarPos[3],
	pRadarSpeed,

	pWeapons[4],
	pWeaponsAmmo[4],

	bool: pBuyingClothing,
	bool: pEditingClothing,
	pClothingName[32],
	pClothingPrice,

	pDrugUse,
	pDrugTime,
	pDrugChgWeather,
	pDrugTimer,
	pDrugLoop,

	pConvoID,
	pLiveBroadcast,

	pLiveOffer,
	pFactionOffer,

	pFishTime,
	pFishWeight,
	pFishCheckpoint,

	pSetTime, // offline jail þeysi
	pSetReason[128], // offline jail þeysi

	pItemCache[10], // market þeysi

	pInTuning,
	pTuningCount,
	pTuningComponent,
	pTuningCategoryID,

 	pSprayPoint,
    pSprayLength,
    pSprayText[128],
    pSprayFont,
    pSprayTarget,
    pSprayAllow,
    pSprayTimer[2],

	bool: pUnscrambling,
	pUnscramblerTime,
	pUnscrambleTimer,
	pUnscrambleID,
	pScrambleSuccess,
	pScrambleFailed,

	pGreetRequest,
	pGreetType,

	pFriskRequest,
	pFrisking,
	pAllowedFrisk,

	pLastChat,
	pLastCMD[128],
	pLastCMDTime,
	pLastEmoteTime,

	pTestCar,
	pTestStage,
	pTestTime,
	bool: pDrivingTest,
	bool: pTaxiDrivingTest,

	bool: pAutoLow,

	bool: pKickDoor,
	pTraceNum,
	pIsTracing,


	pAtDealership,

	p911Steps,
	p911Text[128],
	p911Location[128],
	p911CallTimer[2],

	bool: pCarryTrash,
	pCarryMeal,

	pCargoID,
	pCargoListed[MAX_TRUCK_PRODUCT],
	pPDAListed[MAX_TRUCK_CARGO],

	pChopshopCooldown,


	bool: pPlayingAnimation,

	TempTweak,
	carTweakTimer,

	pContacts[3],
	pLastDamages[1024],
	pCorpseBag,
	pCorpseBurialTimer
}

enum 	e_vbolo
{
    vBoloID,
		bool: vBoloExists,
		vBoloAuthor[24],
		vBoloModel[24],
		vBoloPlate[24],
		vBoloDate,
		vBoloCrimes[512],
		vBoloReport[512]
}

new VehicleBolo[MAX_VBOLO][e_vbolo];
new Iterator:VBolos<MAX_VBOLO>;

#define OFFER_TYPE_NONE (0)
#define OFFER_TYPE_BIZ (1)
#define OFFER_TYPE_HOUSE (2)

new PlayerDirection[8][MAX_PLAYERS];

enum    e_sazone
{
    SAZONE_NAME[28],
    Float: SAZONE_AREA[6]
};

enum 	e_sacity
{
    SACITY_NAME[28],
    Float: SACITY_AREA[6]
};

enum E_CONTACTS_DATA
{
	contactSQLID,
	contactPlayerSQLID,
	contactID,
	contactName[128],
	contactNumber
}

enum E_XMR_CATEGORY_DATA
{
	XMRID,
	XMRCategoryName[90],
	XMRCategory
}

enum E_XMR_SUB_CATEGORY_DATA
{
	xmrID,
	xmrCategory,
	xmrName[90],
	xmrStationURL[128],
}

enum E_ADMIN_NOTES_DATA
{
	anote_SQLID,
	anote_playerDBID,
	anote_reason[128],
	anote_issuer[60],
	anote_date,
	anote_active
}

enum e_fine
{
	fine_id,
	Float: fine_x,
	Float: fine_y,
	Float: fine_z,
	fine_issuer[24],
	fine_reason[128],
	fine_faction,
	fine_amount,
	fine_date
}

enum E_CACHE_DATA
{
	pCurrentPage
}


new Fines[MAX_PLAYERS][MAX_FINES][e_fine];
new PhoneData[MAX_PLAYERS][E_CACHE_DATA];

new VehicleFines[MAX_VEHICLES][MAX_FINES][e_fine];
new XMRData[MAX_XMR_SUBCATEGORY][E_XMR_SUB_CATEGORY_DATA];
new XMRCategoryData[MAX_XMR_CATEGORIES][E_XMR_CATEGORY_DATA];
new aNotesData[MAX_PLAYERS][MAX_ADMIN_NOTES][E_ADMIN_NOTES_DATA];


new spikeTimer[MAX_VEHICLES],
		bool: spikeTire[MAX_VEHICLES];

new Text3D:VME[MAX_PLAYERS];
new HaveVME[MAX_PLAYERS] = {0, ...};
new TimerVME[MAX_PLAYERS];

new CheckingPlayerFine[MAX_PLAYERS];

// [ ADMIN NOTE VARIABLES ]
new anote_idsave[MAX_PLAYERS];


// [ XMR VARIABLES ]
new CatXMRHolder[MAX_PLAYERS], SubXMRHolder[MAX_PLAYERS];
new SubXMRHolderArr[MAX_PLAYERS][MAX_XMR_CATEGORIES];

// [ GLOBAL VARIABLES ]
new OOC;
new TotalJailees;
new TotalWarants;
new TotalFines;

new weather = 10;
new year,
    hour,
    minute,
    second,
    month,
    day;

new g_MysqlRaceCheck[MAX_PLAYERS];

new bool: pSpawnedIn[MAX_PLAYERS];
new bool: pLoggedIn[MAX_PLAYERS], PlayerData[MAX_PLAYERS][E_PLAYER_DATA];
new Float:oldHealth[MAX_PLAYERS], phoneTimer[MAX_PLAYERS];

new _pay_security_timer[MAX_PLAYERS];
new _respawn_timer[MAX_PLAYERS];
new _has_vehicle_spawned[MAX_PLAYERS], _has_spawned_vehicleid[MAX_PLAYERS];
new contact_save_id[MAX_PLAYERS];

new _has_player_reviving[MAX_PLAYERS], _has_player_reviver[MAX_PLAYERS];
new playerHelpingPlayer[MAX_PLAYERS], playerHelpingTimer[MAX_PLAYERS];
new Text3D: playerHelpSign[MAX_PLAYERS], playerHelpCount[MAX_PLAYERS];


new playerTowingVehicle[MAX_PLAYERS], playerTowTimer[MAX_PLAYERS];
new Text3D:vehicleTowSign[MAX_VEHICLES], playerVehicleTowCount[MAX_PLAYERS];

new bool: PlayerUpgradingVehicle[MAX_PLAYERS], PlayerUpgradeTimer[MAX_PLAYERS];
new Text3D: VehicleUpgradeSign[MAX_VEHICLES], PlayerVehicleUpgradeCount[MAX_PLAYERS];


new PlayerMDCText[MAX_PLAYERS][32], PlayerMDCPlateHolder[MAX_PLAYERS][5][32];
new PlayerStolenCarTimer[MAX_PLAYERS], PlayerStolenCarPrompt[MAX_PLAYERS];
new PlayerStolenCarPlate[MAX_PLAYERS][32];

new PlayerBillboardTimer[MAX_PLAYERS];

new playerTaserAmmo[MAX_PLAYERS];

new PlayerLoginTick[MAX_PLAYERS];

//Legshot
new LegShotTimer[MAX_PLAYERS];

//Lock Breaking
new PlayerBreakingIn[MAX_PLAYERS];
new PlayerBreakInVehicle[MAX_PLAYERS];

new Text3D:BreakInTextDraw[MAX_PLAYERS];
new BreakInTDTimer[MAX_PLAYERS];
new ActiveLockTD[MAX_PLAYERS];

new BreakInError[MAX_PLAYERS];

//SMS
new PlayerSMS[MAX_PLAYERS][128];

//Death
new DeathTimeNotice[MAX_PLAYERS];

//
new MainPhone[MAX_PLAYERS];

//Vehicle Logs
new PlayerVlogPage[MAX_PLAYERS];
new PlayerVlogVehicle[MAX_PLAYERS];

//Player Logs
new PlayerLogPage[MAX_PLAYERS];
new PlayerLogPlayer[MAX_PLAYERS];

//Calling Mechanic
new MechanicText[MAX_PLAYERS][128];
new MechanicCallTimer[MAX_PLAYERS];

//Calling Taxi
new TaxiText[MAX_PLAYERS][128];
new TaxiCallTimer[MAX_PLAYERS];


//Taxi Job
new bool:StartedTaxiJob[MAX_PLAYERS];
new TaxiDriver[MAX_PLAYERS]; //Taxi driver's ID when player enters;
new TaxiDurationTimer[MAX_PLAYERS];
new TaxiDuration[MAX_PLAYERS];
new TaxiPrice[MAX_PLAYERS];
new InTaxiRide[MAX_PLAYERS];
new TaxiDriverTimer[MAX_PLAYERS];
new TaxiFair[MAX_PLAYERS];
new TaxiTotalFair[MAX_PLAYERS];
new TaxiFairStarted[MAX_PLAYERS];

//
new PlayerIsTased[MAX_PLAYERS];

//Vehicle Sell
new VehicleOfferedTo[MAX_PLAYERS]; //Player who uses /v sell;
new VehicleOfferBy[MAX_PLAYERS]; //Target of /vsell;
new VehicleDBIDOffered[MAX_PLAYERS]; //Vehicle of /vsell;
new VehiclePrice[MAX_PLAYERS]; //Price of /vsell;

//Fuel Station Refill
new PlayerRefilling[MAX_PLAYERS]; //When uses /v refill, starts.
new RefillPoint[MAX_PLAYERS]; // The refill point counter;
new Text3D:RefillTextdraw[MAX_PLAYERS]; // TD refill;
new RefillTimer[MAX_PLAYERS];
new RefillPrice[MAX_PLAYERS];
new Float:RefillAmount[MAX_PLAYERS];
new RefillVehicle[MAX_PLAYERS];

//Mechanic Offer

//Hire Business
new OfferedHireTo[MAX_PLAYERS];
new OfferedHireBusinessID[MAX_PLAYERS];
new OfferedHireBy[MAX_PLAYERS];

//Admin System
new OfflineBanName[MAX_PLAYERS][60];
new OfflineJailName[MAX_PLAYERS][60], OfflineJailTime[MAX_PLAYERS];
new AdminPanelName[MAX_PLAYERS][60];

new AdminNoteSelect[MAX_PLAYERS][MAX_ADMIN_NOTES];
new AdminNoteSelected[MAX_PLAYERS], AdminNoteIssuer[MAX_PLAYERS][90];

//Password Change
new CanChangePassword[MAX_PLAYERS];

new CarEngine[MAX_VEHICLES], CarLights[MAX_VEHICLES];

new CarlastDriver[MAX_VEHICLES], CarlastPassenger[MAX_VEHICLES];



// [ FACTION VEHICLE VARIABLES ]
new Text3D:vehicleTextdraw[MAX_PLAYERS], playerTextdraw[MAX_PLAYERS];


new
	EditingID[MAX_PLAYERS],
	EditingObject[MAX_PLAYERS];

// [ CONTACT VARIABLES ]
new ContactsData[MAX_PLAYERS][MAX_PLAYER_CONTACTS][E_CONTACTS_DATA];

// [ DEALERSHIP VARIABLES ]
new SubDealershipHolder[MAX_PLAYERS];

new bool:PlayerPurchasingVehicle[MAX_PLAYERS];
new g_aVehicleSpawned[MAX_PLAYERS], g_aVehicleColor[MAX_PLAYERS][2];
new g_aLockLevel[MAX_PLAYERS], g_aAlarmLevel[MAX_PLAYERS], g_aImmobLevel[MAX_PLAYERS], bool: g_aXMR[MAX_PLAYERS], g_aInsurance[MAX_PLAYERS];
new g_aTotalAmount[MAX_PLAYERS];

// [ MECHANIC JOB VARIABLES ]
new PaintJobTimer[MAX_PLAYERS];
new PlayerText: PlayerOffer[MAX_PLAYERS];

new PlayerText: PropertyLightsTXD[MAX_PLAYERS];

new CharacterHolder[MAX_PLAYERS][3];
new PlayerText:Character_Logo[MAX_PLAYERS];
new PlayerText:Character_Preview[MAX_PLAYERS][3],
	PlayerText:Character_Preview_Name[MAX_PLAYERS][3];

new
	PlayerText: PhoneCase[MAX_PLAYERS][10],
    PlayerText: ColorPanel[MAX_PLAYERS][10],
	PlayerText: PhoneFrame[MAX_PLAYERS][3],
	PlayerText: PhoneLogo[MAX_PLAYERS],
	PlayerText: PhoneSwitch[MAX_PLAYERS],
	PlayerText: PhoneInfo[MAX_PLAYERS],
	PlayerText: PhoneDisplay[MAX_PLAYERS],
	PlayerText: PhoneBtnL[MAX_PLAYERS],
	PlayerText: PhoneBtnR[MAX_PLAYERS],
	PlayerText: PhoneArrowUp[MAX_PLAYERS],
	PlayerText: PhoneArrowDown[MAX_PLAYERS],
	PlayerText: PhoneArrowLeft[MAX_PLAYERS],
	PlayerText: PhoneArrowRight[MAX_PLAYERS],
	PlayerText: PhoneBtnMenu[MAX_PLAYERS],
	PlayerText: PhoneBtnBack[MAX_PLAYERS],
	PlayerText: PhoneDate[MAX_PLAYERS],
	PlayerText: PhoneTime[MAX_PLAYERS],
	PlayerText: PhoneSignal[MAX_PLAYERS],
	PlayerText: PhoneNotify[MAX_PLAYERS],
	PlayerText: PhoneList[MAX_PLAYERS][3],
	PlayerText: PhoneListName[MAX_PLAYERS],
	PlayerText: PhoneSMSInfo[MAX_PLAYERS],
 	PlayerText: PlayerOffer2[MAX_PLAYERS],
	PlayerText: SpectatorTD[MAX_PLAYERS],
	PlayerText: Trace_PTD[MAX_PLAYERS][1],
	PlayerText: Unscrambler_PTD[MAX_PLAYERS][3],
	PlayerText: TaxiFair_PTD[MAX_PLAYERS][5],
	PlayerText:	FoodOrder[MAX_PLAYERS][13],
	PlayerText:	StealPlate[MAX_PLAYERS][2];

new PlayerText: Player_Hud[MAX_PLAYERS][5],
	PlayerText: Street_Hud[MAX_PLAYERS][7];

new PlayerText:alprHit[MAX_PLAYERS][3];
new Text: blindfoldTextdraw,
	Text: Masktd;

enum 	e_market_items
{
	ItemName[15],
	ItemModelID,
	ItemPrice,
	Float: ItemX,
	Float: ItemY,
	Float: ItemZ,
	Float: ItemA
}

new const MarketData[][e_market_items] =
{
	{"Gas Can", 1650, 500, 0.000000, 0.000000, 35.000000, 0.899999},
	{"Boombox", 2226, 1000, 0.000000, 0.000000, 180.000000, 0.899999},
	{"Beyzbol Sopasi", 336, 1500, 50.000000, 91.000000, 298.000000, 2.099999},
	{"Cicek", 325, 500, 50.000000, 91.000000, 298.000000, 2.099999},
	{"Baston", 326, 200, 50.000000, 91.000000, 298.000000, 1.000000},
	{"Kamera", 367, 500, 52.000000, 231.000000, 102.000000, 1.000000},
	{"Maske", 0, 5000, 50.000000, 91.000000, 298.000000, -1.000000},
	{"Icecek", 19823, 50, 0.000000, 0.000000, 0.000000, 1.000000},
	{"Sigara", 19896, 70, 90.000000, 180.000000, 0.000000, 0.699999},
	{"Radyo", 18875, 250, 0.000000, 0.000000, 180.000000, 0.899999}
};


new PlayerText: Market_Selectable[MAX_PLAYERS][11],
	PlayerText: Market_ProductName[MAX_PLAYERS][11],
	PlayerText: Market_ProductPrice[MAX_PLAYERS][11],
	PlayerText: Market_Textdraw[MAX_PLAYERS][8],
	PlayerText: Market_Extra[MAX_PLAYERS];

// Market_Textdraw[playerid][2] - kapat
// Market_Textdraw[playerid][3] - satýnal
// Market_Textdraw[playerid][4] - temizle
// 6 item name
// 7 açýklamasý

#define DEALERSHIP_PER_LINE  	3
#define DEALERSHIP_PER_PAGE		6
#define DEALERSHIP_BASE_X   	79.00
#define DEALERSHIP_BASE_Y   	96.666694

#define DEALERSHIP_NAME_BASE_X 	(140.00)
#define DEALERSHIP_NAME_BASE_Y 	(195.833251)
#define DEALERSHIP_PRICE_BASE_X (140.00)
#define DEALERSHIP_PRICE_BASE_Y (120.00)

new PlayerText: Dealership_Next_Arrow[MAX_PLAYERS],
	PlayerText: Dealership_Prev_Arrow[MAX_PLAYERS],
	PlayerText: Dealership_Model_Cat[MAX_PLAYERS],
	PlayerText: Dealership_Model_Name[MAX_PLAYERS][DEALERSHIP_PER_PAGE],
	PlayerText: Dealership_Model_Price[MAX_PLAYERS][DEALERSHIP_PER_PAGE],
	PlayerText: Dealership_Model[MAX_PLAYERS][DEALERSHIP_PER_PAGE];


new DealershipHolder[MAX_PLAYERS][DEALERSHIP_PER_PAGE];
new FurnitureHolder[MAX_PLAYERS][MAX_CLOTHING_SHOW][3];

new Float:BoatCP[18][3] = {
	{60.2717,-2082.1567,-0.0762},
	{-27.3791,-2002.3693,-0.2581},
	{-113.7512,-2001.2771,-0.3227},
	{-94.7858,-1832.2515,-0.1204},
	{-10.9787,-1831.6937,-0.1850},
	{188.3772,-2075.5259,-0.0510},
	{136.4065,-2186.1221,-0.4349},
	{81.7984,-2345.2961,0.0240},
	{196.3303,-2435.1675,-0.2457},
	{325.3835,-2421.8608,-0.4293},
	{389.9152,-2328.5454,-0.1746},
	{367.0452,-2211.3184,-0.1155},
	{324.4887,-2159.2317,-0.2469},
	{9.7860,-1992.6770,-0.3811},
	{2.0233,-1893.1060,-0.0813},
	{-22.4129,-1845.0417,-0.2385},
	{-63.5448,-1786.5829,-0.3937},
	{-7.9743,-1729.3959,-0.3212}
};

#define MAX_FISH_TYPES  7

enum 	e_boat_fish
{
    FishName[20],
    FishMinWeight,
    FishMaxWeight,
    FishChance
}

new FishData[MAX_FISH_TYPES][e_boat_fish] =
{
	{"Kalkan Balýðý",	1, 4,	85},
	{"Sazan Balýðý",	1, 4,	75},
    {"Müren Balýðý",    1, 7, 	65},
    {"Somon Balýðý",    2, 6,   50},
    {"Tuna Balýðý",		1, 3,	30},
    {"Köpekbalýðý",		7, 15,	20},
    {"Kýlýçbalýðý", 	6, 12,	10}
};

new
	SACities[][e_sacity] = {
	    {"Los Santos",                  {44.60,-2892.90,-242.90,2997.00,-768.00,900.00}},
	    {"Las Venturas",                {869.40,596.30,-242.90,2997.00,2993.80,900.00}},
	    {"Bone County",                 {-480.50,596.30,-242.90,869.40,2993.80,900.00}},
	    {"Tierra Robada",               {-2997.40,1659.60,-242.90,-480.50,2993.80,900.00}},
	    {"Tierra Robada",               {-1213.90,596.30,-242.90,-480.50,1659.60,900.00}},
	    {"San Fierro",                  {-2997.40,-1115.50,-242.90,-1213.90,1659.60,900.00}},
	    {"Red County",                  {-1213.90,-768.00,-242.90,2997.00,596.30,900.00}},
	    {"Flint County",                {-1213.90,-2892.90,-242.90,44.60,-768.00,900.00}},
	    {"Whetstone",                   {-2997.40,-2892.90,-242.90,-1213.90,-1115.50,900.00}}
	};

new
	SAZones[][e_sazone] = {
		{"The Big Ear",	                {-410.00,1403.30,-3.00,-137.90,1681.20,200.00}},
		{"Aldea Malvada",               {-1372.10,2498.50,0.00,-1277.50,2615.30,200.00}},
		{"Angel Pine",                  {-2324.90,-2584.20,-6.10,-1964.20,-2212.10,200.00}},
		{"Arco del Oeste",              {-901.10,2221.80,0.00,-592.00,2571.90,200.00}},
		{"Avispa Country Club",         {-2646.40,-355.40,0.00,-2270.00,-222.50,200.00}},
		{"Avispa Country Club",         {-2831.80,-430.20,-6.10,-2646.40,-222.50,200.00}},
		{"Avispa Country Club",         {-2361.50,-417.10,0.00,-2270.00,-355.40,200.00}},
		{"Avispa Country Club",         {-2667.80,-302.10,-28.80,-2646.40,-262.30,71.10}},
		{"Avispa Country Club",         {-2470.00,-355.40,0.00,-2270.00,-318.40,46.10}},
		{"Avispa Country Club",         {-2550.00,-355.40,0.00,-2470.00,-318.40,39.70}},
		{"Back o Beyond",               {-1166.90,-2641.10,0.00,-321.70,-1856.00,200.00}},
		{"Battery Point",               {-2741.00,1268.40,-4.50,-2533.00,1490.40,200.00}},
		{"Bayside",                     {-2741.00,2175.10,0.00,-2353.10,2722.70,200.00}},
		{"Bayside Marina",              {-2353.10,2275.70,0.00,-2153.10,2475.70,200.00}},
		{"Beacon Hill",                 {-399.60,-1075.50,-1.40,-319.00,-977.50,198.50}},
		{"Blackfield",                  {964.30,1203.20,-89.00,1197.30,1403.20,110.90}},
		{"Blackfield",                  {964.30,1403.20,-89.00,1197.30,1726.20,110.90}},
		{"Blackfield Chapel",           {1375.60,596.30,-89.00,1558.00,823.20,110.90}},
		{"Blackfield Chapel",           {1325.60,596.30,-89.00,1375.60,795.00,110.90}},
		{"Blackfield Intersection",     {1197.30,1044.60,-89.00,1277.00,1163.30,110.90}},
		{"Blackfield Intersection",     {1166.50,795.00,-89.00,1375.60,1044.60,110.90}},
		{"Blackfield Intersection",     {1277.00,1044.60,-89.00,1315.30,1087.60,110.90}},
		{"Blackfield Intersection",     {1375.60,823.20,-89.00,1457.30,919.40,110.90}},
		{"Blueberry",                   {104.50,-220.10,2.30,349.60,152.20,200.00}},
		{"Blueberry",                   {19.60,-404.10,3.80,349.60,-220.10,200.00}},
		{"Blueberry Acres",             {-319.60,-220.10,0.00,104.50,293.30,200.00}},
		{"Caligula's Palace",           {2087.30,1543.20,-89.00,2437.30,1703.20,110.90}},
		{"Caligula's Palace",           {2137.40,1703.20,-89.00,2437.30,1783.20,110.90}},
		{"Calton Heights",              {-2274.10,744.10,-6.10,-1982.30,1358.90,200.00}},
		{"Chinatown",                   {-2274.10,578.30,-7.60,-2078.60,744.10,200.00}},
		{"City Hall",                   {-2867.80,277.40,-9.10,-2593.40,458.40,200.00}},
		{"Come-A-Lot",                  {2087.30,943.20,-89.00,2623.10,1203.20,110.90}},
		{"Commerce",                    {1323.90,-1842.20,-89.00,1701.90,-1722.20,110.90}},
		{"Commerce",                    {1323.90,-1722.20,-89.00,1440.90,-1577.50,110.90}},
		{"Commerce",                    {1370.80,-1577.50,-89.00,1463.90,-1384.90,110.90}},
		{"Commerce",                    {1463.90,-1577.50,-89.00,1667.90,-1430.80,110.90}},
		{"Commerce",                    {1583.50,-1722.20,-89.00,1758.90,-1577.50,110.90}},
		{"Commerce",                    {1667.90,-1577.50,-89.00,1812.60,-1430.80,110.90}},
		{"Conference Center",           {1046.10,-1804.20,-89.00,1323.90,-1722.20,110.90}},
		{"Conference Center",           {1073.20,-1842.20,-89.00,1323.90,-1804.20,110.90}},
		{"Cranberry Station",           {-2007.80,56.30,0.00,-1922.00,224.70,100.00}},
		{"Creek",                       {2749.90,1937.20,-89.00,2921.60,2669.70,110.90}},
		{"Dillimore",                   {580.70,-674.80,-9.50,861.00,-404.70,200.00}},
		{"Doherty",                     {-2270.00,-324.10,-0.00,-1794.90,-222.50,200.00}},
		{"Doherty",                     {-2173.00,-222.50,-0.00,-1794.90,265.20,200.00}},
		{"Downtown",                    {-1982.30,744.10,-6.10,-1871.70,1274.20,200.00}},
		{"Downtown",                    {-1871.70,1176.40,-4.50,-1620.30,1274.20,200.00}},
		{"Downtown",                    {-1700.00,744.20,-6.10,-1580.00,1176.50,200.00}},
		{"Downtown",                    {-1580.00,744.20,-6.10,-1499.80,1025.90,200.00}},
		{"Downtown",                    {-2078.60,578.30,-7.60,-1499.80,744.20,200.00}},
		{"Downtown",                    {-1993.20,265.20,-9.10,-1794.90,578.30,200.00}},
		{"Downtown Los Santos",         {1463.90,-1430.80,-89.00,1724.70,-1290.80,110.90}},
		{"Downtown Los Santos",         {1724.70,-1430.80,-89.00,1812.60,-1250.90,110.90}},
		{"Downtown Los Santos",         {1463.90,-1290.80,-89.00,1724.70,-1150.80,110.90}},
		{"Downtown Los Santos",         {1370.80,-1384.90,-89.00,1463.90,-1170.80,110.90}},
		{"Downtown Los Santos",         {1724.70,-1250.90,-89.00,1812.60,-1150.80,110.90}},
		{"Downtown Los Santos",         {1370.80,-1170.80,-89.00,1463.90,-1130.80,110.90}},
		{"Downtown Los Santos",         {1378.30,-1130.80,-89.00,1463.90,-1026.30,110.90}},
		{"Downtown Los Santos",         {1391.00,-1026.30,-89.00,1463.90,-926.90,110.90}},
		{"Downtown Los Santos",         {1507.50,-1385.20,110.90,1582.50,-1325.30,335.90}},
		{"East Beach",                  {2632.80,-1852.80,-89.00,2959.30,-1668.10,110.90}},
		{"East Beach",                  {2632.80,-1668.10,-89.00,2747.70,-1393.40,110.90}},
		{"East Beach",                  {2747.70,-1668.10,-89.00,2959.30,-1498.60,110.90}},
		{"East Beach",                  {2747.70,-1498.60,-89.00,2959.30,-1120.00,110.90}},
		{"East Los Santos",             {2421.00,-1628.50,-89.00,2632.80,-1454.30,110.90}},
		{"East Los Santos",             {2222.50,-1628.50,-89.00,2421.00,-1494.00,110.90}},
		{"East Los Santos",             {2266.20,-1494.00,-89.00,2381.60,-1372.00,110.90}},
		{"East Los Santos",             {2381.60,-1494.00,-89.00,2421.00,-1454.30,110.90}},
		{"East Los Santos",             {2281.40,-1372.00,-89.00,2381.60,-1135.00,110.90}},
		{"East Los Santos",             {2381.60,-1454.30,-89.00,2462.10,-1135.00,110.90}},
		{"East Los Santos",             {2462.10,-1454.30,-89.00,2581.70,-1135.00,110.90}},
		{"Easter Basin",                {-1794.90,249.90,-9.10,-1242.90,578.30,200.00}},
		{"Easter Basin",                {-1794.90,-50.00,-0.00,-1499.80,249.90,200.00}},
		{"Easter Bay Airport",          {-1499.80,-50.00,-0.00,-1242.90,249.90,200.00}},
		{"Easter Bay Airport",          {-1794.90,-730.10,-3.00,-1213.90,-50.00,200.00}},
		{"Easter Bay Airport",          {-1213.90,-730.10,0.00,-1132.80,-50.00,200.00}},
		{"Easter Bay Airport",          {-1242.90,-50.00,0.00,-1213.90,578.30,200.00}},
		{"Easter Bay Airport",          {-1213.90,-50.00,-4.50,-947.90,578.30,200.00}},
		{"Easter Bay Airport",          {-1315.40,-405.30,15.40,-1264.40,-209.50,25.40}},
		{"Easter Bay Airport",          {-1354.30,-287.30,15.40,-1315.40,-209.50,25.40}},
		{"Easter Bay Airport",          {-1490.30,-209.50,15.40,-1264.40,-148.30,25.40}},
		{"Easter Bay Chemicals",        {-1132.80,-768.00,0.00,-956.40,-578.10,200.00}},
		{"Easter Bay Chemicals",        {-1132.80,-787.30,0.00,-956.40,-768.00,200.00}},
		{"El Castillo del Diablo",      {-464.50,2217.60,0.00,-208.50,2580.30,200.00}},
		{"El Castillo del Diablo",      {-208.50,2123.00,-7.60,114.00,2337.10,200.00}},
		{"El Castillo del Diablo",      {-208.50,2337.10,0.00,8.40,2487.10,200.00}},
		{"El Corona",                   {1812.60,-2179.20,-89.00,1970.60,-1852.80,110.90}},
		{"El Corona",                   {1692.60,-2179.20,-89.00,1812.60,-1842.20,110.90}},
		{"El Quebrados",                {-1645.20,2498.50,0.00,-1372.10,2777.80,200.00}},
		{"Esplanade East",              {-1620.30,1176.50,-4.50,-1580.00,1274.20,200.00}},
		{"Esplanade East",              {-1580.00,1025.90,-6.10,-1499.80,1274.20,200.00}},
		{"Esplanade East",              {-1499.80,578.30,-79.60,-1339.80,1274.20,20.30}},
		{"Esplanade North",             {-2533.00,1358.90,-4.50,-1996.60,1501.20,200.00}},
		{"Esplanade North",             {-1996.60,1358.90,-4.50,-1524.20,1592.50,200.00}},
		{"Esplanade North",             {-1982.30,1274.20,-4.50,-1524.20,1358.90,200.00}},
		{"Fallen Tree",                 {-792.20,-698.50,-5.30,-452.40,-380.00,200.00}},
		{"Fallow Bridge",               {434.30,366.50,0.00,603.00,555.60,200.00}},
		{"Fern Ridge",                  {508.10,-139.20,0.00,1306.60,119.50,200.00}},
		{"Financial",                   {-1871.70,744.10,-6.10,-1701.30,1176.40,300.00}},
		{"Fisher's Lagoon",             {1916.90,-233.30,-100.00,2131.70,13.80,200.00}},
		{"Flint Intersection",          {-187.70,-1596.70,-89.00,17.00,-1276.60,110.90}},
		{"Flint Range",                 {-594.10,-1648.50,0.00,-187.70,-1276.60,200.00}},
		{"Fort Carson",                 {-376.20,826.30,-3.00,123.70,1220.40,200.00}},
		{"Foster Valley",               {-2270.00,-430.20,-0.00,-2178.60,-324.10,200.00}},
		{"Foster Valley",               {-2178.60,-599.80,-0.00,-1794.90,-324.10,200.00}},
		{"Foster Valley",               {-2178.60,-1115.50,0.00,-1794.90,-599.80,200.00}},
		{"Foster Valley",               {-2178.60,-1250.90,0.00,-1794.90,-1115.50,200.00}},
		{"Frederick Bridge",            {2759.20,296.50,0.00,2774.20,594.70,200.00}},
		{"Gant Bridge",                 {-2741.40,1659.60,-6.10,-2616.40,2175.10,200.00}},
		{"Gant Bridge",                 {-2741.00,1490.40,-6.10,-2616.40,1659.60,200.00}},
		{"Ganton",                      {2222.50,-1852.80,-89.00,2632.80,-1722.30,110.90}},
		{"Ganton",                      {2222.50,-1722.30,-89.00,2632.80,-1628.50,110.90}},
		{"Garcia",                      {-2411.20,-222.50,-0.00,-2173.00,265.20,200.00}},
		{"Garcia",                      {-2395.10,-222.50,-5.30,-2354.00,-204.70,200.00}},
		{"Garver Bridge",               {-1339.80,828.10,-89.00,-1213.90,1057.00,110.90}},
		{"Garver Bridge",               {-1213.90,950.00,-89.00,-1087.90,1178.90,110.90}},
		{"Garver Bridge",               {-1499.80,696.40,-179.60,-1339.80,925.30,20.30}},
		{"Glen Park",                   {1812.60,-1449.60,-89.00,1996.90,-1350.70,110.90}},
		{"Glen Park",                   {1812.60,-1100.80,-89.00,1994.30,-973.30,110.90}},
		{"Glen Park",                   {1812.60,-1350.70,-89.00,2056.80,-1100.80,110.90}},
		{"Green Palms",                 {176.50,1305.40,-3.00,338.60,1520.70,200.00}},
		{"Greenglass College",          {964.30,1044.60,-89.00,1197.30,1203.20,110.90}},
		{"Greenglass College",          {964.30,930.80,-89.00,1166.50,1044.60,110.90}},
		{"Hampton Barns",               {603.00,264.30,0.00,761.90,366.50,200.00}},
		{"Hankypanky Point",            {2576.90,62.10,0.00,2759.20,385.50,200.00}},
		{"Harry Gold Parkway",          {1777.30,863.20,-89.00,1817.30,2342.80,110.90}},
		{"Hashbury",                    {-2593.40,-222.50,-0.00,-2411.20,54.70,200.00}},
		{"Hilltop Farm",                {967.30,-450.30,-3.00,1176.70,-217.90,200.00}},
		{"Hunter Quarry",               {337.20,710.80,-115.20,860.50,1031.70,203.70}},
		{"Idlewood",                    {1812.60,-1852.80,-89.00,1971.60,-1742.30,110.90}},
		{"Idlewood",                    {1812.60,-1742.30,-89.00,1951.60,-1602.30,110.90}},
		{"Idlewood",                    {1951.60,-1742.30,-89.00,2124.60,-1602.30,110.90}},
		{"Idlewood",                    {1812.60,-1602.30,-89.00,2124.60,-1449.60,110.90}},
		{"Idlewood",                    {2124.60,-1742.30,-89.00,2222.50,-1494.00,110.90}},
		{"Idlewood",                    {1971.60,-1852.80,-89.00,2222.50,-1742.30,110.90}},
		{"Jefferson",                   {1996.90,-1449.60,-89.00,2056.80,-1350.70,110.90}},
		{"Jefferson",                   {2124.60,-1494.00,-89.00,2266.20,-1449.60,110.90}},
		{"Jefferson",                   {2056.80,-1372.00,-89.00,2281.40,-1210.70,110.90}},
		{"Jefferson",                   {2056.80,-1210.70,-89.00,2185.30,-1126.30,110.90}},
		{"Jefferson",                   {2185.30,-1210.70,-89.00,2281.40,-1154.50,110.90}},
		{"Jefferson",                   {2056.80,-1449.60,-89.00,2266.20,-1372.00,110.90}},
		{"Julius Thruway East",         {2623.10,943.20,-89.00,2749.90,1055.90,110.90}},
		{"Julius Thruway East",         {2685.10,1055.90,-89.00,2749.90,2626.50,110.90}},
		{"Julius Thruway East",         {2536.40,2442.50,-89.00,2685.10,2542.50,110.90}},
		{"Julius Thruway East",         {2625.10,2202.70,-89.00,2685.10,2442.50,110.90}},
		{"Julius Thruway North",        {2498.20,2542.50,-89.00,2685.10,2626.50,110.90}},
		{"Julius Thruway North",        {2237.40,2542.50,-89.00,2498.20,2663.10,110.90}},
		{"Julius Thruway North",        {2121.40,2508.20,-89.00,2237.40,2663.10,110.90}},
		{"Julius Thruway North",        {1938.80,2508.20,-89.00,2121.40,2624.20,110.90}},
		{"Julius Thruway North",        {1534.50,2433.20,-89.00,1848.40,2583.20,110.90}},
		{"Julius Thruway North",        {1848.40,2478.40,-89.00,1938.80,2553.40,110.90}},
		{"Julius Thruway North",        {1704.50,2342.80,-89.00,1848.40,2433.20,110.90}},
		{"Julius Thruway North",        {1377.30,2433.20,-89.00,1534.50,2507.20,110.90}},
		{"Julius Thruway South",        {1457.30,823.20,-89.00,2377.30,863.20,110.90}},
		{"Julius Thruway South",        {2377.30,788.80,-89.00,2537.30,897.90,110.90}},
		{"Julius Thruway West",         {1197.30,1163.30,-89.00,1236.60,2243.20,110.90}},
		{"Julius Thruway West",         {1236.60,2142.80,-89.00,1297.40,2243.20,110.90}},
		{"Juniper Hill",                {-2533.00,578.30,-7.60,-2274.10,968.30,200.00}},
		{"Juniper Hollow",              {-2533.00,968.30,-6.10,-2274.10,1358.90,200.00}},
		{"K.A.C.C. Military Fuels",     {2498.20,2626.50,-89.00,2749.90,2861.50,110.90}},
		{"Kincaid Bridge",              {-1339.80,599.20,-89.00,-1213.90,828.10,110.90}},
		{"Kincaid Bridge",              {-1213.90,721.10,-89.00,-1087.90,950.00,110.90}},
		{"Kincaid Bridge",              {-1087.90,855.30,-89.00,-961.90,986.20,110.90}},
		{"King's",                      {-2329.30,458.40,-7.60,-1993.20,578.30,200.00}},
		{"King's",                      {-2411.20,265.20,-9.10,-1993.20,373.50,200.00}},
		{"King's",                      {-2253.50,373.50,-9.10,-1993.20,458.40,200.00}},
		{"LVA Freight Depot",           {1457.30,863.20,-89.00,1777.40,1143.20,110.90}},
		{"LVA Freight Depot",           {1375.60,919.40,-89.00,1457.30,1203.20,110.90}},
		{"LVA Freight Depot",           {1277.00,1087.60,-89.00,1375.60,1203.20,110.90}},
		{"LVA Freight Depot",           {1315.30,1044.60,-89.00,1375.60,1087.60,110.90}},
		{"LVA Freight Depot",           {1236.60,1163.40,-89.00,1277.00,1203.20,110.90}},
		{"Las Barrancas",               {-926.10,1398.70,-3.00,-719.20,1634.60,200.00}},
		{"Las Brujas",                  {-365.10,2123.00,-3.00,-208.50,2217.60,200.00}},
		{"Las Colinas",                 {1994.30,-1100.80,-89.00,2056.80,-920.80,110.90}},
		{"Las Colinas",                 {2056.80,-1126.30,-89.00,2126.80,-920.80,110.90}},
		{"Las Colinas",                 {2185.30,-1154.50,-89.00,2281.40,-934.40,110.90}},
		{"Las Colinas",                 {2126.80,-1126.30,-89.00,2185.30,-934.40,110.90}},
		{"Las Colinas",                 {2747.70,-1120.00,-89.00,2959.30,-945.00,110.90}},
		{"Las Colinas",                 {2632.70,-1135.00,-89.00,2747.70,-945.00,110.90}},
		{"Las Colinas",                 {2281.40,-1135.00,-89.00,2632.70,-945.00,110.90}},
		{"Las Payasadas",               {-354.30,2580.30,2.00,-133.60,2816.80,200.00}},
		{"Las Venturas Airport",        {1236.60,1203.20,-89.00,1457.30,1883.10,110.90}},
		{"Las Venturas Airport",        {1457.30,1203.20,-89.00,1777.30,1883.10,110.90}},
		{"Las Venturas Airport",        {1457.30,1143.20,-89.00,1777.40,1203.20,110.90}},
		{"Las Venturas Airport",        {1515.80,1586.40,-12.50,1729.90,1714.50,87.50}},
		{"Last Dime Motel",             {1823.00,596.30,-89.00,1997.20,823.20,110.90}},
		{"Leafy Hollow",                {-1166.90,-1856.00,0.00,-815.60,-1602.00,200.00}},
		{"Liberty City",                {-1000.00,400.00,1300.00,-700.00,600.00,1400.00}},
		{"Lil' Probe Inn",              {-90.20,1286.80,-3.00,153.80,1554.10,200.00}},
		{"Linden Side",                 {2749.90,943.20,-89.00,2923.30,1198.90,110.90}},
		{"Linden Station",              {2749.90,1198.90,-89.00,2923.30,1548.90,110.90}},
		{"Linden Station",              {2811.20,1229.50,-39.50,2861.20,1407.50,60.40}},
		{"Little Mexico",               {1701.90,-1842.20,-89.00,1812.60,-1722.20,110.90}},
		{"Little Mexico",               {1758.90,-1722.20,-89.00,1812.60,-1577.50,110.90}},
		{"Los Flores",                  {2581.70,-1454.30,-89.00,2632.80,-1393.40,110.90}},
		{"Los Flores",                  {2581.70,-1393.40,-89.00,2747.70,-1135.00,110.90}},
		{"Los Santos International",    {1249.60,-2394.30,-89.00,1852.00,-2179.20,110.90}},
		{"Los Santos International",    {1852.00,-2394.30,-89.00,2089.00,-2179.20,110.90}},
		{"Los Santos International",    {1382.70,-2730.80,-89.00,2201.80,-2394.30,110.90}},
		{"Los Santos International",    {1974.60,-2394.30,-39.00,2089.00,-2256.50,60.90}},
		{"Los Santos International",    {1400.90,-2669.20,-39.00,2189.80,-2597.20,60.90}},
		{"Los Santos International",    {2051.60,-2597.20,-39.00,2152.40,-2394.30,60.90}},
		{"Marina",                      {647.70,-1804.20,-89.00,851.40,-1577.50,110.90}},
		{"Marina",                      {647.70,-1577.50,-89.00,807.90,-1416.20,110.90}},
		{"Marina",                      {807.90,-1577.50,-89.00,926.90,-1416.20,110.90}},
		{"Market Street",              	{787.40,-1416.20,-89.00,1072.60,-1310.20,110.90}},
		{"Market Street",               {952.60,-1310.20,-89.00,1072.60,-1130.80,110.90}},
		{"Market Street",               {1072.60,-1416.20,-89.00,1370.80,-1130.80,110.90}},
		{"Market Street",               {926.90,-1577.50,-89.00,1370.80,-1416.20,110.90}},
		{"Market Station",              {787.40,-1410.90,-34.10,866.00,-1310.20,65.80}},
		{"Martin Bridge",               {-222.10,293.30,0.00,-122.10,476.40,200.00}},
		{"Missionary Hill",             {-2994.40,-811.20,0.00,-2178.60,-430.20,200.00}},
		{"Montgomery",                  {1119.50,119.50,-3.00,1451.40,493.30,200.00}},
		{"Montgomery",                  {1451.40,347.40,-6.10,1582.40,420.80,200.00}},
		{"Montgomery Intersection",     {1546.60,208.10,0.00,1745.80,347.40,200.00}},
		{"Montgomery Intersection",     {1582.40,347.40,0.00,1664.60,401.70,200.00}},
		{"Mulholland",                  {1414.00,-768.00,-89.00,1667.60,-452.40,110.90}},
		{"Mulholland",                  {1281.10,-452.40,-89.00,1641.10,-290.90,110.90}},
		{"Mulholland",                  {1269.10,-768.00,-89.00,1414.00,-452.40,110.90}},
		{"Mulholland",                  {1357.00,-926.90,-89.00,1463.90,-768.00,110.90}},
		{"Mulholland",                  {1318.10,-910.10,-89.00,1357.00,-768.00,110.90}},
		{"Mulholland",                  {1169.10,-910.10,-89.00,1318.10,-768.00,110.90}},
		{"Mulholland",                  {768.60,-954.60,-89.00,952.60,-860.60,110.90}},
		{"Mulholland",                  {687.80,-860.60,-89.00,911.80,-768.00,110.90}},
		{"Mulholland",                  {737.50,-768.00,-89.00,1142.20,-674.80,110.90}},
		{"Mulholland",                  {1096.40,-910.10,-89.00,1169.10,-768.00,110.90}},
		{"Mulholland",                  {952.60,-937.10,-89.00,1096.40,-860.60,110.90}},
		{"Mulholland",                  {911.80,-860.60,-89.00,1096.40,-768.00,110.90}},
		{"Mulholland",                  {861.00,-674.80,-89.00,1156.50,-600.80,110.90}},
		{"Mulholland Intersection",     {1463.90,-1150.80,-89.00,1812.60,-768.00,110.90}},
		{"North Rock",                  {2285.30,-768.00,0.00,2770.50,-269.70,200.00}},
		{"Ocean Docks",                 {2373.70,-2697.00,-89.00,2809.20,-2330.40,110.90}},
		{"Ocean Docks",                 {2201.80,-2418.30,-89.00,2324.00,-2095.00,110.90}},
		{"Ocean Docks",                 {2324.00,-2302.30,-89.00,2703.50,-2145.10,110.90}},
		{"Ocean Docks",                 {2089.00,-2394.30,-89.00,2201.80,-2235.80,110.90}},
		{"Ocean Docks",                 {2201.80,-2730.80,-89.00,2324.00,-2418.30,110.90}},
		{"Ocean Docks",                 {2703.50,-2302.30,-89.00,2959.30,-2126.90,110.90}},
		{"Ocean Docks",                 {2324.00,-2145.10,-89.00,2703.50,-2059.20,110.90}},
		{"Ocean Flats",                 {-2994.40,277.40,-9.10,-2867.80,458.40,200.00}},
		{"Ocean Flats",                 {-2994.40,-222.50,-0.00,-2593.40,277.40,200.00}},
		{"Ocean Flats",                 {-2994.40,-430.20,-0.00,-2831.80,-222.50,200.00}},
		{"Octane Springs",              {338.60,1228.50,0.00,664.30,1655.00,200.00}},
		{"Old Venturas Strip",          {2162.30,2012.10,-89.00,2685.10,2202.70,110.90}},
		{"Palisades",                   {-2994.40,458.40,-6.10,-2741.00,1339.60,200.00}},
		{"Palomino Creek",              {2160.20,-149.00,0.00,2576.90,228.30,200.00}},
		{"Paradiso",                    {-2741.00,793.40,-6.10,-2533.00,1268.40,200.00}},
		{"Pershing Square",             {1440.90,-1722.20,-89.00,1583.50,-1577.50,110.90}},
		{"Pilgrim",                     {2437.30,1383.20,-89.00,2624.40,1783.20,110.90}},
		{"Pilgrim",                     {2624.40,1383.20,-89.00,2685.10,1783.20,110.90}},
		{"Pilson Intersection",         {1098.30,2243.20,-89.00,1377.30,2507.20,110.90}},
		{"Pirates in Men's Pants",      {1817.30,1469.20,-89.00,2027.40,1703.20,110.90}},
		{"Playa del Seville",           {2703.50,-2126.90,-89.00,2959.30,-1852.80,110.90}},
		{"Prickle Pine",                {1534.50,2583.20,-89.00,1848.40,2863.20,110.90}},
		{"Prickle Pine",                {1117.40,2507.20,-89.00,1534.50,2723.20,110.90}},
		{"Prickle Pine",                {1848.40,2553.40,-89.00,1938.80,2863.20,110.90}},
		{"Prickle Pine",                {1938.80,2624.20,-89.00,2121.40,2861.50,110.90}},
		{"Queens",                      {-2533.00,458.40,0.00,-2329.30,578.30,200.00}},
		{"Queens",                      {-2593.40,54.70,0.00,-2411.20,458.40,200.00}},
		{"Queens",                      {-2411.20,373.50,0.00,-2253.50,458.40,200.00}},
		{"Randolph Industrial Estate",  {1558.00,596.30,-89.00,1823.00,823.20,110.90}},
		{"Redsands East",               {1817.30,2011.80,-89.00,2106.70,2202.70,110.90}},
		{"Redsands East",               {1817.30,2202.70,-89.00,2011.90,2342.80,110.90}},
		{"Redsands East",               {1848.40,2342.80,-89.00,2011.90,2478.40,110.90}},
		{"Redsands West",               {1236.60,1883.10,-89.00,1777.30,2142.80,110.90}},
		{"Redsands West",               {1297.40,2142.80,-89.00,1777.30,2243.20,110.90}},
		{"Redsands West",               {1377.30,2243.20,-89.00,1704.50,2433.20,110.90}},
		{"Redsands West",               {1704.50,2243.20,-89.00,1777.30,2342.80,110.90}},
		{"Regular Tom",                 {-405.70,1712.80,-3.00,-276.70,1892.70,200.00}},
		{"Richman",                     {647.50,-1118.20,-89.00,787.40,-954.60,110.90}},
		{"Richman",                     {647.50,-954.60,-89.00,768.60,-860.60,110.90}},
		{"Richman",                     {225.10,-1369.60,-89.00,334.50,-1292.00,110.90}},
		{"Richman",                     {225.10,-1292.00,-89.00,466.20,-1235.00,110.90}},
		{"Richman",                     {72.60,-1404.90,-89.00,225.10,-1235.00,110.90}},
		{"Richman",                     {72.60,-1235.00,-89.00,321.30,-1008.10,110.90}},
		{"Richman",                     {321.30,-1235.00,-89.00,647.50,-1044.00,110.90}},
		{"Richman",                     {321.30,-1044.00,-89.00,647.50,-860.60,110.90}},
		{"Richman",                     {321.30,-860.60,-89.00,687.80,-768.00,110.90}},
		{"Richman",                     {321.30,-768.00,-89.00,700.70,-674.80,110.90}},
		{"Robada Intersection",         {-1119.00,1178.90,-89.00,-862.00,1351.40,110.90}},
		{"Roca Escalante",              {2237.40,2202.70,-89.00,2536.40,2542.50,110.90}},
		{"Roca Escalante",              {2536.40,2202.70,-89.00,2625.10,2442.50,110.90}},
		{"Rockshore East",              {2537.30,676.50,-89.00,2902.30,943.20,110.90}},
		{"Rockshore West",              {1997.20,596.30,-89.00,2377.30,823.20,110.90}},
		{"Rockshore West",              {2377.30,596.30,-89.00,2537.30,788.80,110.90}},
		{"Rodeo",                       {72.60,-1684.60,-89.00,225.10,-1544.10,110.90}},
		{"Rodeo",                       {72.60,-1544.10,-89.00,225.10,-1404.90,110.90}},
		{"Rodeo",                       {225.10,-1684.60,-89.00,312.80,-1501.90,110.90}},
		{"Rodeo",                       {225.10,-1501.90,-89.00,334.50,-1369.60,110.90}},
		{"Rodeo",                       {334.50,-1501.90,-89.00,422.60,-1406.00,110.90}},
		{"Rodeo",                       {312.80,-1684.60,-89.00,422.60,-1501.90,110.90}},
		{"Rodeo",                       {422.60,-1684.60,-89.00,558.00,-1570.20,110.90}},
		{"Rodeo",                       {558.00,-1684.60,-89.00,647.50,-1384.90,110.90}},
		{"Rodeo",                       {466.20,-1570.20,-89.00,558.00,-1385.00,110.90}},
		{"Rodeo",                       {422.60,-1570.20,-89.00,466.20,-1406.00,110.90}},
		{"Rodeo",                       {466.20,-1385.00,-89.00,647.50,-1235.00,110.90}},
		{"Rodeo",                       {334.50,-1406.00,-89.00,466.20,-1292.00,110.90}},
		{"Royal Casino",                {2087.30,1383.20,-89.00,2437.30,1543.20,110.90}},
		{"San Andreas Sound",           {2450.30,385.50,-100.00,2759.20,562.30,200.00}},
		{"Santa Flora",                 {-2741.00,458.40,-7.60,-2533.00,793.40,200.00}},
		{"Santa Maria Beach",           {342.60,-2173.20,-89.00,647.70,-1684.60,110.90}},
		{"Santa Maria Beach",           {72.60,-2173.20,-89.00,342.60,-1684.60,110.90}},
		{"Shady Cabin",                 {-1632.80,-2263.40,-3.00,-1601.30,-2231.70,200.00}},
		{"Shady Creeks",                {-1820.60,-2643.60,-8.00,-1226.70,-1771.60,200.00}},
		{"Shady Creeks",                {-2030.10,-2174.80,-6.10,-1820.60,-1771.60,200.00}},
		{"Sobell Rail Yards",           {2749.90,1548.90,-89.00,2923.30,1937.20,110.90}},
		{"Spinybed",                    {2121.40,2663.10,-89.00,2498.20,2861.50,110.90}},
		{"Starfish Casino",             {2437.30,1783.20,-89.00,2685.10,2012.10,110.90}},
		{"Starfish Casino",             {2437.30,1858.10,-39.00,2495.00,1970.80,60.90}},
		{"Starfish Casino",             {2162.30,1883.20,-89.00,2437.30,2012.10,110.90}},
		{"Temple",                      {1252.30,-1130.80,-89.00,1378.30,-1026.30,110.90}},
		{"Temple",                      {1252.30,-1026.30,-89.00,1391.00,-926.90,110.90}},
		{"Temple",                      {1252.30,-926.90,-89.00,1357.00,-910.10,110.90}},
		{"Temple",                      {952.60,-1130.80,-89.00,1096.40,-937.10,110.90}},
		{"Temple",                      {1096.40,-1130.80,-89.00,1252.30,-1026.30,110.90}},
		{"Temple",                      {1096.40,-1026.30,-89.00,1252.30,-910.10,110.90}},
		{"The Camel's Toe",             {2087.30,1203.20,-89.00,2640.40,1383.20,110.90}},
		{"The Clown's Pocket",          {2162.30,1783.20,-89.00,2437.30,1883.20,110.90}},
		{"The Emerald Isle",            {2011.90,2202.70,-89.00,2237.40,2508.20,110.90}},
		{"The Farm",                    {-1209.60,-1317.10,114.90,-908.10,-787.30,251.90}},
		{"The Four Dragons Casino",     {1817.30,863.20,-89.00,2027.30,1083.20,110.90}},
		{"The High Roller",             {1817.30,1283.20,-89.00,2027.30,1469.20,110.90}},
		{"The Mako Span",               {1664.60,401.70,0.00,1785.10,567.20,200.00}},
		{"The Panopticon",              {-947.90,-304.30,-1.10,-319.60,327.00,200.00}},
		{"The Pink Swan",               {1817.30,1083.20,-89.00,2027.30,1283.20,110.90}},
		{"The Sherman Dam",             {-968.70,1929.40,-3.00,-481.10,2155.20,200.00}},
		{"The Strip",                   {2027.40,863.20,-89.00,2087.30,1703.20,110.90}},
		{"The Strip",                   {2106.70,1863.20,-89.00,2162.30,2202.70,110.90}},
		{"The Strip",                   {2027.40,1783.20,-89.00,2162.30,1863.20,110.90}},
		{"The Strip",                   {2027.40,1703.20,-89.00,2137.40,1783.20,110.90}},
		{"The Visage",                  {1817.30,1863.20,-89.00,2106.70,2011.80,110.90}},
		{"The Visage",                  {1817.30,1703.20,-89.00,2027.40,1863.20,110.90}},
		{"Unity Station",               {1692.60,-1971.80,-20.40,1812.60,-1932.80,79.50}},
		{"Valle Ocultado",              {-936.60,2611.40,2.00,-715.90,2847.90,200.00}},
		{"Verdant Bluffs",              {930.20,-2488.40,-89.00,1249.60,-2006.70,110.90}},
		{"Verdant Bluffs",              {1073.20,-2006.70,-89.00,1249.60,-1842.20,110.90}},
		{"Verdant Bluffs",              {1249.60,-2179.20,-89.00,1692.60,-1842.20,110.90}},
		{"Verdant Meadows",             {37.00,2337.10,-3.00,435.90,2677.90,200.00}},
		{"Verona Beach",                {647.70,-2173.20,-89.00,930.20,-1804.20,110.90}},
		{"Verona Beach",                {930.20,-2006.70,-89.00,1073.20,-1804.20,110.90}},
		{"Verona Beach",                {851.40,-1804.20,-89.00,1046.10,-1577.50,110.90}},
		{"Verona Beach",                {1161.50,-1722.20,-89.00,1323.90,-1577.50,110.90}},
		{"Verona Beach",                {1046.10,-1722.20,-89.00,1161.50,-1577.50,110.90}},
		{"Vinewood",                    {787.40,-1310.20,-89.00,952.60,-1130.80,110.90}},
		{"Vinewood",                    {787.40,-1130.80,-89.00,952.60,-954.60,110.90}},
		{"Vinewood",                    {647.50,-1227.20,-89.00,787.40,-1118.20,110.90}},
		{"Vinewood",                    {647.70,-1416.20,-89.00,787.40,-1227.20,110.90}},
		{"Whitewood Estates",           {883.30,1726.20,-89.00,1098.30,2507.20,110.90}},
		{"Whitewood Estates",           {1098.30,1726.20,-89.00,1197.30,2243.20,110.90}},
		{"Willowfield",                 {1970.60,-2179.20,-89.00,2089.00,-1852.80,110.90}},
		{"Willowfield",                 {2089.00,-2235.80,-89.00,2201.80,-1989.90,110.90}},
		{"Willowfield",                 {2089.00,-1989.90,-89.00,2324.00,-1852.80,110.90}},
		{"Willowfield",                 {2201.80,-2095.00,-89.00,2324.00,-1989.90,110.90}},
		{"Willowfield",                 {2541.70,-1941.40,-89.00,2703.50,-1852.80,110.90}},
		{"Willowfield",                 {2324.00,-2059.20,-89.00,2541.70,-1852.80,110.90}},
		{"Willowfield",                 {2541.70,-2059.20,-89.00,2703.50,-1941.40,110.90}},
		{"Yellow Bell Station",         {1377.40,2600.40,-21.90,1492.40,2687.30,78.00}},
		{"Los Santos",                  {44.60,-2892.90,-242.90,2997.00,-768.00,900.00}},
		{"Las Venturas",                {869.40,596.30,-242.90,2997.00,2993.80,900.00}},
		{"Bone County",                 {-480.50,596.30,-242.90,869.40,2993.80,900.00}},
		{"Tierra Robada",               {-2997.40,1659.60,-242.90,-480.50,2993.80,900.00}},
		{"Tierra Robada",               {-1213.90,596.30,-242.90,-480.50,1659.60,900.00}},
		{"San Fierro",                  {-2997.40,-1115.50,-242.90,-1213.90,1659.60,900.00}},
		{"Red County",                  {-1213.90,-768.00,-242.90,2997.00,596.30,900.00}},
		{"Flint County",                {-1213.90,-2892.90,-242.90,44.60,-768.00,900.00}},
		{"Whetstone",                   {-2997.40,-2892.90,-242.90,-1213.90,-1115.50,900.00}}
	};

new const VehicleColoursTableRGBA[256] =
{
	0x000000FF, 0xF5F5F5FF, 0x2A77A1FF, 0x840410FF, 0x263739FF, 0x86446EFF, 0xD78E10FF, 0x4C75B7FF, 0xBDBEC6FF, 0x5E7072FF,
	0x46597AFF, 0x656A79FF, 0x5D7E8DFF, 0x58595AFF, 0xD6DAD6FF, 0x9CA1A3FF, 0x335F3FFF, 0x730E1AFF, 0x7B0A2AFF, 0x9F9D94FF,
	0x3B4E78FF, 0x732E3EFF, 0x691E3BFF, 0x96918CFF, 0x515459FF, 0x3F3E45FF, 0xA5A9A7FF, 0x635C5AFF, 0x3D4A68FF, 0x979592FF,
	0x421F21FF, 0x5F272BFF, 0x8494ABFF, 0x767B7CFF, 0x646464FF, 0x5A5752FF, 0x252527FF, 0x2D3A35FF, 0x93A396FF, 0x6D7A88FF,
	0x221918FF, 0x6F675FFF, 0x7C1C2AFF, 0x5F0A15FF, 0x193826FF, 0x5D1B20FF, 0x9D9872FF, 0x7A7560FF, 0x989586FF, 0xADB0B0FF,
	0x848988FF, 0x304F45FF, 0x4D6268FF, 0x162248FF, 0x272F4BFF, 0x7D6256FF, 0x9EA4ABFF, 0x9C8D71FF, 0x6D1822FF, 0x4E6881FF,
	0x9C9C98FF, 0x917347FF, 0x661C26FF, 0x949D9FFF, 0xA4A7A5FF, 0x8E8C46FF, 0x341A1EFF, 0x6A7A8CFF, 0xAAAD8EFF, 0xAB988FFF,
	0x851F2EFF, 0x6F8297FF, 0x585853FF, 0x9AA790FF, 0x601A23FF, 0x20202CFF, 0xA4A096FF, 0xAA9D84FF, 0x78222BFF, 0x0E316DFF,
	0x722A3FFF, 0x7B715EFF, 0x741D28FF, 0x1E2E32FF, 0x4D322FFF, 0x7C1B44FF, 0x2E5B20FF, 0x395A83FF, 0x6D2837FF, 0xA7A28FFF,
	0xAFB1B1FF, 0x364155FF, 0x6D6C6EFF, 0x0F6A89FF, 0x204B6BFF, 0x2B3E57FF, 0x9B9F9DFF, 0x6C8495FF, 0x4D8495FF, 0xAE9B7FFF,
	0x406C8FFF, 0x1F253BFF, 0xAB9276FF, 0x134573FF, 0x96816CFF, 0x64686AFF, 0x105082FF, 0xA19983FF, 0x385694FF, 0x525661FF,
	0x7F6956FF, 0x8C929AFF, 0x596E87FF, 0x473532FF, 0x44624FFF, 0x730A27FF, 0x223457FF, 0x640D1BFF, 0xA3ADC6FF, 0x695853FF,
	0x9B8B80FF, 0x620B1CFF, 0x5B5D5EFF, 0x624428FF, 0x731827FF, 0x1B376DFF, 0xEC6AAEFF, 0x000000FF,
	0x177517FF, 0x210606FF, 0x125478FF, 0x452A0DFF, 0x571E1EFF, 0x010701FF, 0x25225AFF, 0x2C89AAFF, 0x8A4DBDFF, 0x35963AFF,
	0xB7B7B7FF, 0x464C8DFF, 0x84888CFF, 0x817867FF, 0x817A26FF, 0x6A506FFF, 0x583E6FFF, 0x8CB972FF, 0x824F78FF, 0x6D276AFF,
	0x1E1D13FF, 0x1E1306FF, 0x1F2518FF, 0x2C4531FF, 0x1E4C99FF, 0x2E5F43FF, 0x1E9948FF, 0x1E9999FF, 0x999976FF, 0x7C8499FF,
	0x992E1EFF, 0x2C1E08FF, 0x142407FF, 0x993E4DFF, 0x1E4C99FF, 0x198181FF, 0x1A292AFF, 0x16616FFF, 0x1B6687FF, 0x6C3F99FF,
	0x481A0EFF, 0x7A7399FF, 0x746D99FF, 0x53387EFF, 0x222407FF, 0x3E190CFF, 0x46210EFF, 0x991E1EFF, 0x8D4C8DFF, 0x805B80FF,
	0x7B3E7EFF, 0x3C1737FF, 0x733517FF, 0x781818FF, 0x83341AFF, 0x8E2F1CFF, 0x7E3E53FF, 0x7C6D7CFF, 0x020C02FF, 0x072407FF,
	0x163012FF, 0x16301BFF, 0x642B4FFF, 0x368452FF, 0x999590FF, 0x818D96FF, 0x99991EFF, 0x7F994CFF, 0x839292FF, 0x788222FF,
	0x2B3C99FF, 0x3A3A0BFF, 0x8A794EFF, 0x0E1F49FF, 0x15371CFF, 0x15273AFF, 0x375775FF, 0x060820FF, 0x071326FF, 0x20394BFF,
	0x2C5089FF, 0x15426CFF, 0x103250FF, 0x241663FF, 0x692015FF, 0x8C8D94FF, 0x516013FF, 0x090F02FF, 0x8C573AFF, 0x52888EFF,
	0x995C52FF, 0x99581EFF, 0x993A63FF, 0x998F4EFF, 0x99311EFF, 0x0D1842FF, 0x521E1EFF, 0x42420DFF, 0x4C991EFF, 0x082A1DFF,
	0x96821DFF, 0x197F19FF, 0x3B141FFF, 0x745217FF, 0x893F8DFF, 0x7E1A6CFF, 0x0B370BFF, 0x27450DFF, 0x071F24FF, 0x784573FF,
	0x8A653AFF, 0x732617FF, 0x319490FF, 0x56941DFF, 0x59163DFF, 0x1B8A2FFF, 0x38160BFF, 0x041804FF, 0x355D8EFF, 0x2E3F5BFF,
	0x561A28FF, 0x4E0E27FF, 0x706C67FF, 0x3B3E42FF, 0x2E2D33FF, 0x7B7E7DFF, 0x4A4442FF, 0x28344EFF
};

enum E_UNSCRAMBLER_DATA
{
	scrambledWord[60],
	unscrambledWord[60]
}

// [ UNSCRAMBLER VARIABLES ]
new const g_aUnscrambleInfo[][E_UNSCRAMBLER_DATA] = {
    {"sfire", "Sifre"},
    {"bigli", "Bilgi"},
    {"sphea", "Sehpa"},
    {"mazan", "Zaman"},
    {"serim", "Resim"},
    {"rnek", "Renk"},
    {"argaj", "Garaj"},
    {"ve", "Ev"},
    {"blekliik", "Bileklik"},
    {"Rhbeer", "Rehber"},
    {"Yaakkabi", "Ayakkabi"},
    {"yunocak", "Oyuncak"},
    {"tob", "Bot"},
    {"lfrot", "Flort"},
    {"kmera", "Kamera"},
    {"lzear", "Lazer"},
    {"dvelet", "Devlet"},
    {"klyoe", "Kolye"},
    {"mbilyao", "Mobilya"},
    {"knepea", "Kanepe"},
    {"mkenia", "Makine"},
    {"sgarai", "Sigara"},
    {"lakol", "Alkol"},
    {"abyrak", "Bayrak"},
    {"kvvetu", "Kuvvet"},
    {"psor", "Spor"},
    {"anhtara", "Anahtar"}
};

enum 	e_dealership_categories
{
	CategoryID,
	CategoryModelName[25],
	CategoryModel
}

new DealershipCatData[MAX_DEALERSHIP_CAT][e_dealership_categories];
new Iterator:DealershipCats<MAX_DEALERSHIP_CAT>;

enum INTERIOR_MAIN
{
	INT_NAME[28],
	Float:INT_POS[3],
	INT_ID
}

new Interiors[][INTERIOR_MAIN] =
{
	// Interior Name // Positions ( X, Y, Z) // Interior ID
	{"Ryder's House", {2468.8411,-1698.2228,1013.5078}, 2},
	{"CJ's House", {2495.8916,-1692.5658,1014.7422}, 3},
	{"Madd Dog Mansion", {1299.14, -794.77, 1084.00}, 5},
	{"Safe House 1", {2233.6919,-1112.8107,1050.8828}, 5},
	{"Safe House 2", {2196.8374,-1204.5576,1049.0234}, 6},
	{"Safe House 3", {2317.5347,-1026.7506,1050.2178}, 9},
	{"Safe House 4", {2259.4021,-1136.0243,1050.6403}, 10},
	{"Burglary X1", {234.6087,1187.8195,1080.2578}, 3},
	{"Burglary X2", {225.5707,1240.0643,1082.1406}, 2},
	{"Burglary X3", {224.288,1289.1907,1082.1406}, 1},
	{"Burglary X4", {226.2955,1114.3379,1080.9929}, 5},
	{"Burglary Houses", {295.1391,1473.3719,1080.2578}, 15},
	{"Motel Room", {446.3247,509.9662,1001.4195}, 12},
	{"Pair Burglary", {446.626,1397.738,1084.3047}, 2},
	{"Burglary X11", {226.8998,0.2832,1080.9960}, 5},
	{"Burglary X12", {261.1165,1287.2197,1080.2578}, 4},
	{"Michelle's Love Nest", {309.4319,311.6189,1003.3047}, 4},
	{"Burglary X14", {24.3769,1341.1829,1084.375}, 10},
	{"Burglary X13", {221.6766,1142.4962,1082.6094}, 4},
	{"Unused House", {2323.7063,-1147.6509,1050.7101}, 12},
	{"Millie's Room", {344.9984,307.1824,999.1557}, 6},
	{"Burglary X15", {-262.1759,1456.6158,1084.3672}, 4},
	{"Burglary X16", {22.861,1404.9165,1084.4297}, 5},
	{"Burglary X17", {140.3679,1367.8837,1083.8621}, 5},
	{"House X18", {234.2826,1065.229,1084.2101}, 6},
	{"House X19", {-68.6652,1351.2054,1080.2109}, 6},
	{"House X20", {-283.4464,1470.8777,1084.3750}, 15},
	{"Colonel Furhberger", {2807.4458,-1174.2394,1025.5703}, 8},
	{"The Camel's Safehouse", {2218.0737,-1076.0438,1050.4844}, 1},
	{"Verdant Bluffs House", {2365.1042,-1135.5898,1050.8826}, 8},
	{"Burglary X21", {-42.6339,1405.4767,1084.4297}, 8},
	{"Willowfield House", {2282.8049,-1140.2722,1050.8984}, 11},
	{"House X20", {82.9119,1322.4266,1083.8662}, 9},
	{"Burglary X22", {260.7421,1238.2261,1084.2578}, 9},
	{"Burglary X23", {266.5074,305.1129,999.1484}, 2},
	{"Katie's Lovenest", {322.5014,303.6906,999.1484}, 5},
	{"Barbara's Love nest", {244.0007,305.1925,999.1484}, 1}
};

new PlatePossible[][] = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};

new const g_aPreloadLibs[][] =
{
	"AIRPORT",      "ATTRACTORS",   "BAR",          "BASEBALL",     "BD_FIRE",
	"BEACH",        "BENCHPRESS",   "BF_INJECTION", "BIKE_DBZ",     "BIKED",
	"BIKEH",        "BIKELEAP",     "BIKES",        "BIKEV",        "BLOWJOBZ",
	"BMX",          "BOMBER",       "BOX",          "BSKTBALL",     "BUDDY",
	"BUS",          "CAMERA",       "CAR",          "CAR_CHAT",     "CARRY",
	"CASINO",       "CHAINSAW",     "CHOPPA",       "CLOTHES",      "COACH",
	"COLT45",       "COP_AMBIENT",  "COP_DVBYZ",    "CRACK",        "CRIB",
	"DAM_JUMP",     "DANCING",      "DEALER",       "DILDO",        "DODGE",
	"DOZER",        "DRIVEBYS",     "FAT",          "FIGHT_B",      "FIGHT_C",
	"FIGHT_D",      "FIGHT_E",      "FINALE",       "FINALE2",      "FLAME",
	"FLOWERS",      "FOOD",         "FREEWEIGHTS",  "GANGS",        "GFUNK",
	"GHANDS",       "GHETTO_DB",    "GOGGLES",      "GRAFFITI",     "GRAVEYARD",
	"GRENADE",      "GYMNASIUM",    "HAIRCUTS",     "HEIST9",       "INT_HOUSE",
	"INT_OFFICE",   "INT_SHOP",     "JST_BUISNESS", "KART",         "KISSING",
	"KNIFE",        "LAPDAN1",      "LAPDAN2",      "LAPDAN3",      "LOWRIDER",
	"MD_CHASE",     "MD_END",       "MEDIC",        "MISC",         "MTB",
	"MUSCULAR",     "NEVADA",       "ON_LOOKERS",   "OTB",          "PARACHUTE",
	"PARK",         "PAULNMAC",     "PED",          "PLAYER_DVBYS", "PLAYIDLES",
	"POLICE",       "POOL",         "POOR",         "PYTHON",       "QUAD",
	"QUAD_DBZ",     "RAPPING",      "RIFLE",        "RIOT",         "ROB_BANK",
	"ROCKET",       "RUNNINGMAN",   "RUSTLER",      "RYDER",        "SCRATCHING",
	"SEX",          "SHAMAL",       "SHOP",         "SHOTGUN",      "SILENCED",
	"SKATE",        "SMOKING",      "SNIPER",       "SNM",          "SPRAYCAN",
	"STRIP",        "SUNBATHE",     "SWAT",         "SWEET",        "SWIM",
	"SWORD",        "TANK",         "TATTOOS",      "TEC",          "TRAIN",
	"TRUCK",        "UZI",          "VAN",          "VENDING",      "VORTEX",
	"WAYFARER",     "WEAPONS",      "WOP",          "WUZI"
};


enum impoundData
{
	impoundID,
	impoundExists,
	Float:impoundLot[3],
	Float:impoundRelease[4],
	impoundPickup
}

new ImpoundData[MAX_IMPOUND_LOTS][impoundData];

new const getMonth[][] = {
    "", "Ocak", "Þubat", "Mart", "Nisan", "Mayýs", "Haziran", "Temmuz", "Aðustos", "Eylül", "Ekim",
    "Kasým", "Aralýk"
};

new const getMonthEN[][] = {
    "", "Ocak", "Subat", "Mart", "Nisan", "Mayis", "Haziran", "Temmuz", "Agustos", "Eylul", "Ekim",
    "Kasim", "Aralik"
};

new const g_arrTaxiDrivingPickupTexts[][] = {
	{"Hýzlý sür, durum acil."},
	{"Selam, aciliyetim yüksek."},
	{"Ne bekliyorsun hala, acelem var!"},
	{"Sanýrým çok yavaþýz, biraz daha hýzlanabilir miyiz?"},
	{"Sanýrým gideceðim yer uzak deðil."},
	{"Santos Deðiþik bir yer, ama acelem var."}
};

new const g_arrTaxiDrivingTexts[][] = {
	{"Tanrý seni korusun dostum, sað ol."},
	{"Taksi için sað olun."},
	{"Teþekkürler, iyi günler!"},
	{"Tek parça buraya ulaþtýðýma inanamýyorum!"}
};

new const g_arrTaxiDrivingBotTexts[][] = {
	{""},
	{""},
	{""},
	{"All Saints Hospital Otoparký"},
	{"Glazier sokaðý, stüdyonun önüne at beni."},
	{""},
	{"Galloway Sokaðý, Subway Önü"},
	{"Sahildeki skate parka gidelim, lütfen."},
	{""},
	{"313 Santa Maria Bulvarý, Apartmanlarý"},
	{"Havalimanýna lütfen, uçaðý kaçýrmak istemiyorum!"},
	{""},
	{"38. Sokak, El Corona"},
	{"Commerce'deki stüdyolara gidelim, iç çamaþýrý çekimlerim var."},
	{""},
	{"Sunset Avenue, Downtown, Ammunation Arkasý"},
	{"Vinewood tabelasýndan yukarýya ve ardýndan iki ev ileride, gidelim."},
	{""},
	{"Mulholland, Camino del Sol, 806"},
	{"Rodeo'daki banka lütfen, bugün talih kuþu bana kondu!"},
	{""},
	{"Rodeo, Tableu Önü"},
	{"Verona Mall'a gidelim, kendime biraz pahalý kýyafetler alacaðým."},
	{""},
	{"East Beach, Bankanýn Yaný"},
	{"Central Parka sürer misin? Sevgilimi basacaðým."},
	{""},
	{""}
};

new const Float:g_arrTaxiDrivingCheckpoints[][] = {
	{1277.8317,-1569.0668,13.2877}, // anlatým 1 0
	{1198.5482,-1514.6963,13.3060}, // anlatým 2 1
	{1198.4982,-1417.3740,13.1774}, // anlatým 3 2
	{1263.3442,-1365.1315,13.1979}, // 1. yolcu çaðrý 3
 	{1210.1345,-1329.1127,13.4073}, // 1. yolcu alýþ 4
 	{955.8081,-1217.9022,16.6731}, // 1. yolcu býrakýþ 5
 	{938.6342,-1267.3850,15.3438}, // 2. yolcu çaðrý 6
 	{810.6131,-1317.1333,13.3530}, // 2. yolcu alýþ 7
 	{334.1356,-1810.1005,4.4097}, // 2. yolcu býrakýþ 8
 	{389.8937,-1776.0398,5.3263}, // 3. yolcu çaðrý 9
 	{883.8313,-1789.9419,13.5621}, // 3. yolcu alýþ 10
 	{1646.3754,-2323.1208,-2.9127}, // 3. yolcu býrakýþ 11
 	{1705.4163,-2323.0090,-2.9230}, // 4. yolcu çaðrý 12
 	{1895.5288,-2056.2686,13.3217}, // 4. yolcu alýþ 13
 	{1712.7489,-1589.8347,13.2960}, // 4. yolcu býrakýþ 14
 	{1612.7808,-1322.3861,17.2353}, // 5. yolcu çaðrý 15
 	{1458.5671,-1280.5707,13.3247}, // 5. yolcu alýþ 16
 	{1472.4779,-885.1282,56.7636}, // 5. yolcu býrakýþ 17
 	{1507.1527,-772.8579,82.0956}, // 6. yolcu çaðrý 18
 	{1106.1022,-731.8591,100.8048}, // 6. yolcu alýþ 19
 	{591.3793,-1234.9360,17.7612}, // 6. yolcu býrakýþ 20
 	{574.0125,-1394.9546,14.2177}, // 7. yolcu çaðrý 21
 	{525.5950,-1564.8011,15.6820}, // 7. yolcu alýþ 22
 	{1158.7169,-1411.2120,13.4408}, // 7. yolcu býrakýþ 23
 	{1217.4080,-1409.8450,13.0950}, // 8. yolcu çaðrý 24
 	{2869.6414,-1457.9335,10.8084}, // 8. yolcu alýþ 25
 	{1510.0813,-1696.0083,13.3060}, // 8. yolcu býrakýþ 26

	{1267.3070,-1568.7356,13.3849} // bitiþ 27
};


new const Float:g_arrDrivingCheckpoints[][] = {

    {1210.3262,-1570.0897,13.1084},
	{1116.0262,-1570.1940,13.1131},
	{1049.5703,-1570.1040,13.1087},
	{1049.3064,-1509.7079,13.1000},
	{931.9813,-1486.8065,13.0950},
	{919.8348,-1419.9318,12.9488},
	{919.6249,-1380.8132,12.9505},
	{944.7567,-1291.2830,14.0406},
	{944.7017,-1162.4944,22.7318},
	{1011.9506,-1152.0228,23.3994},
	{1094.9423,-1151.6755,23.3760},
	{1327.6660,-1151.4548,23.3720},
	{1444.5645,-1163.0797,23.3796},
	{1452.5798,-1227.8743,13.4458},
	{1452.1144,-1286.8938,13.1042},
	{1590.1855,-1303.6564,17.0521},
	{1601.5413,-1425.9412,13.1760},
	{1527.7880,-1438.9318,13.1051},
	{1441.1506,-1438.3518,13.1053},
	{1371.2999,-1397.8710,13.1076},
	{1335.8217,-1455.2852,13.1023},
	{1295.5664,-1559.3916,13.1141},
	{1257.8253,-1566.5979,13.1927}
};

enum E_CHOPSHOP_DATA
{
	chopshop_id,
	chopshop_wanted[10],
    Float: chopshop_pos[6],
    chopshop_object[2],
    chopshop_money,
    chopshop_exist
}

new ChopshopData[MAX_CHOPSHOP][E_CHOPSHOP_DATA];

new playerEnteringVehicle[MAX_PLAYERS] = INVALID_VEHICLE_ID;

new ChopshopTimer[MAX_PLAYERS] = {-1, ...},
	Chopshopping[MAX_PLAYERS];

new PlayerText:TDTuning_Component[MAX_PLAYERS],
	PlayerText:TDTuning_Dots[MAX_PLAYERS],
	PlayerText:TDTuning_Price[MAX_PLAYERS],
	PlayerText:TDTuning_ComponentName[MAX_PLAYERS],
	PlayerText:TDTuning_YN[MAX_PLAYERS];

new const Float:RandomTuningSpawn[][] =
{
    {422.5606,-1325.7305,14.8214,124.1600}
};

new const TuningCategories[11][32] =
{
	"Spoiler",
	"Air-vents",
	"Exhaust",
	"Bumper A",
	"Bumper P",
	"Roof",
	"Wheels",
	"Hydraulic",
	"Nitro",
	"Side Skirts",
	"Paintjob"
};

new playerReport[MAX_PLAYERS][128];

#define MAX_WEP_SLOT (6)
#define MAX_PACK_SLOT (21)


enum E_PROPERTY_WEAP
{
	data_id,
	property_id,
	prop_wep,
	prop_ammo,
	bool: is_exist
}

new property_weap_data[MAX_PROPERTY][MAX_PACK_SLOT][E_PROPERTY_WEAP];


enum E_VEHICLE_WEAP
{
	data_id,
	veh_id,
	Float: wep_offset[6],
	veh_wep,
	veh_ammo,
	temp_object,
	bool:is_exist
}

new vehicle_weap_data[MAX_VEHICLES][MAX_WEP_SLOT][E_VEHICLE_WEAP];


enum
{
	REGULAR_PLAYER = 0,
	DONATOR_BRONZE,
	DONATOR_SILVER,
	DONATOR_GOLD
};

enum e_phonecase
{
	caseModel
}

new g_aPhoneCaseData[][e_phonecase] = {
	//{18868},
	{18874},
	{18870},
	{18873},
	{18866},
	{18871},
	{18865},
	{18869}
};

enum 	spraytag_data
{
	tag_name[64],
	tag_modelid
}

enum 	e_font_config
{
	font_name[64]
}

new const g_spraytag[][spraytag_data] =
{
	{"Grove Street Families", 18659},
	{"Seville BLVD Families", 18660},
	{"Varrio Los Aztecas", 	  18661},
	{"Kilo Tray Ballas", 	  18662},
	{"San Fiero Rifa", 		  18663},
	{"Temple Drive Ballas ",  18664},
	{"Los Santos Vagos", 	  18665},
	{"Front Yard Ballaz", 	  18666},
	{"Rollin Heights Ballas", 18667}
};

new const font_data[][e_font_config] =
{
	{"Arial"},
	{"Courier"},
	{"Comic Sans MS"},
	{"Levi Brush"},
	{"Dripping"},
	{"Diploma"}
};

enum	_:e_garbagetypes
{
	TYPE_BIN,
	TYPE_DUMPSTER
}

enum 	e_clothings
{
	ClothingID,
	ClothingOwnerID,
	ClothingName[32],

	ClothingSlotID,
	ClothingModelID,
	ClothingBoneID,

	Float: ClothingPos[3],
	Float: ClothingRot[3],
	Float: ClothingScale[3],

	bool: ClothingAutoWear,

	ClothingColor,
	ClothingColor2
}

new ClothingData[MAX_PLAYERS][MAX_CLOTHING_ITEMS][e_clothings];

enum 	e_notes
{
	NoteID,
	NoteDetails[128],
	NoteTime
}

new NoteData[MAX_PLAYERS][MAX_PLAYER_NOTES][e_notes];

enum 	e_vehicles
{
	carID,
	carModel,
	carOwnerID, // 0
	carFaction, // -1
	carRental, // 0
	carRentalPrice,
	carRentedBy,
	carTerminate,

	bool: carIllegalPlate,
	carPlates[20],
	carName[35],

	carSign[45],
	Text3D: carSign3D,

	Float: carPos[4],
	carInterior,
	carWorld,

	carColor1,
	carColor2,

	bool: carXMR,
	bool: carXMROn,
	carXMRUrl[128],

	bool: carSiren,
	bool: carSirenOn,
	carSirenObject,

	bool: carLocked,
	carImpounded,
	carImpoundTime,
	carImpoundReason[45],

	Float: carFuel,
	Float: carMileage,
	Float: carArmour,
	Float: carEngine,
	Float: carBattery,

	carLock,
	carAlarm,
	carImmob,
	carInsurance,
	carInsuranceTime,
	carInsurancePrice,
	carTimeDestroyed,

	carPaintjob,
	carMods[14],
	carDoors[4],
	carWindows[4],

	carlastDriver,
	carlastPassenger,

	Float: carLastHealth,
	Float: carMaxHealth,
	carPanelStatus,
	carDoorsStatus,
	carLightsStatus,
	carTiresStatus,

	bool: carExists,
	bool: carTweak,
	carRev,

	carCargoObj[6],
	carCargoAmount[MAX_TRUCK_PRODUCT],
	carTrashCount,

	bool: carPhysicalAttack,
	carDoorHealth,
	carDoorEffect,
	bool: carCooldown,
	carCorpse
}

new CarData[MAX_VEHICLES][e_vehicles];


enum 	e_properties
{
	PropertyID,
	PropertyOwnerID,

	PropertyType, // 1- Complex, 2- Apartment, 3- House
	PropertyComplexLink,
	PropertyFaction,

	PropertyLevel,
	PropertyPickup,
	PropertyMoney, // kasadaki para

	PropertyAddress[MAX_PROPERTY_ADDRESS],

	Float: PropertyEnter[4],
	PropertyEnterInterior,
	PropertyEnterWorld,

	Float: PropertyExit[4],
	PropertyExitInterior,
	PropertyExitWorld,

	Float: PropertyCheck[3],
	PropertyCheckInterior,
	PropertyCheckWorld,

	PropertyMarketPrice,
	Text3D: PropertyMarketLabel,

	PropertyRentPrice,
	bool: PropertyRentable,
	bool: PropertyLocked,

	bool: PropertyHasXMR,
	Float: PropertyXMR[6],

	PropertyXMRObject,
	bool: PropertyXMROn,
	PropertyXMRUrl[128],

	PropertyTime,
	bool: PropertyLights,

	PropertySwitchID,
	bool: PropertySwitch,

	PropertyAreaID[2]
}

new PropertyData[MAX_PROPERTY][e_properties];
new Iterator:Properties<MAX_PROPERTY>;

enum 	e_factions
{
	FactionID,

	FactionName[128],
	FactionAbbrev[128],

	FactionMaxRanks,

	FactionEditrank,
	FactionChatrank,
	FactionTowrank,

	FactionChatColor,
	FactionChatStatus,

	FactionCopPerms,
	FactionSheriffPerms,
	FactionMedPerms,
	FactionSanPerms,

	Float: FactionSpawn[4],
	FactionSpawnInterior,
	FactionSpawnVW,

	Float: FactionSpawnEx1[4],
	FactionSpawnEx1Interior,
	FactionSpawnEx1VW,

	Float: FactionSpawnEx2[4],
	FactionSpawnEx2Interior,
	FactionSpawnEx2VW,

	Float: FactionSpawnEx3[4],
	FactionSpawnEx3Interior,
	FactionSpawnEx3VW,

	FactionBank
}

new FactionData[MAX_FACTIONS][e_factions];
new Iterator:Factions<MAX_FACTIONS>;

new FactionRanks[MAX_FACTIONS][MAX_FACTION_RANKS][60];
new FactionRanksSalary[MAX_FACTIONS][MAX_FACTION_RANKS];

enum    e_label
{
	Text3D: label_3D,
	label_placedby[25],
	label_location[40],
	Float: label_pos[3],
	label_virtualworld,
	label_interior,

	LabelAreaID
}

new LabelData[MAX_LABELS][e_label];
new Iterator:Labels<MAX_LABELS>;

enum    e_dosign
{
	Text3D: DosignLabel,
	DosignPlacedBy[25],
	Float: DosignPos[3],
	DosignInterior,
	DosignWorld,
	DosignTimer
}

new DosignData[MAX_DOSIGN][e_dosign];
new Iterator:Dosigns<MAX_DOSIGN>;

enum    e_fire
{
	fire_object,
	fire_placedby[25],
	fire_location[40],
	Float: fire_pos[6],
	fire_virtualworld,
	fire_interior,
	bool: f_is_editing,
	bool: f_is_extinguished
}

new FireData[MAX_FIRES][e_fire];
new Iterator:Fires<MAX_FIRES>;

enum    e_entrances
{
	EntranceID,
	EntranceName[32],
	EntranceIcon,
	EntranceFaction,
	bool: EntranceLocked,

	Float: EntrancePos[4],
	EntranceInteriorID,
	EntranceWorld,

	Float: EntranceInt[4],
	ExitInteriorID,
	ExitWorld,

	EntrancePickup[2],
	EntranceAreaID[2]
}

new EntranceData[MAX_ENTRANCES][e_entrances];
new Iterator:Entrances<MAX_ENTRANCES>;

enum    e_garages
{
	GarageID,
	GarageFaction,
	GaragePropertyID,
	bool: GarageLocked,

	Float: GaragePos[4],
	EnterInteriorID,
	EnterWorld,

	Float: GarageInt[4],
	ExitInteriorID,
	ExitWorld,

	GarageAreaID[2]
}

new GarageData[MAX_GARAGES][e_garages];
new Iterator:Garages<MAX_ENTRANCES>;

enum    e_paynsprays
{
	PnsID,
	PnsPickup,
	PnsPrice,
	PnsName[45],
	PnsEarnings,

	Float: PnsPos[4],
	EnterInteriorID,
	EnterWorld,

	Float: PnsInt[4],
	ExitInteriorID,
	ExitWorld,

	bool: PnsOccupied,
	PnsAreaID
}

new PNSData[MAX_PAYNSPRAY][e_paynsprays];
new Iterator:Sprays<MAX_PAYNSPRAY>;

enum    e_adverts
{
    AdvertType,
    AdvertText[256],
   	AdvertPlaceBy,
    AdvertContact,
    PublishTime,
    AdvertTimer
}
new AdvertData[MAX_ADVERTS][e_adverts];
new Iterator:Adverts<MAX_ADVERTS>;

enum    e_actors
{
	ActorID,
	ActorModel,
	ActorName[45],
	ActorObject,

	Float: ActorPos[4],
	ActorInterior,
	ActorWorld,

	Text3D: ActorLabel
}

new ActorData[MAX_SIKICILER][e_actors];
new Iterator:Actors<MAX_SIKICILER>;

enum    e_atms
{
	AtmID,
	AtmObject,

	Float: AtmPos[6],
	AtmInterior,
	AtmWorld,

	AtmAreaID
}

new ATMData[MAX_ATM_MACHINES][e_atms];
new Iterator:ATMs<MAX_ATM_MACHINES>;

enum 	e_garbages
{
	GarbageID,
	GarbageType,
	GarbageCapacity,
	GarbageTakenCapacity,
	Float: GarbagePos[3],
	GarbageInterior,
	GarbageWorld,
	GarbageArea
}

new GarbageData[MAX_GARBAGE_BINS][e_garbages];
new Iterator:Garbages<MAX_GARBAGE_BINS>;

enum    e_doors
{
	DoorID,
	DoorFaction,
	DoorName[35],
	bool: DoorLocked,

	Float: EnterPos[4],
	EnterInterior,
	EnterWorld,

	Float: ExitPos[4],
	ExitInterior,
	ExitWorld,

	DoorAreaID[2]
}

new DoorData[MAX_DOORS][e_doors];
new Iterator:Doors<MAX_DOORS>;

enum    e_gates
{
	GateID,
	GateModel,
	GateLinkID,
	GateFaction,

	bool: GateStatus,
	Float: GateSpeed,
	Float: GateRadius,

	GateTime,
	GateTimer,
	GateObject,

	GateTIndex,
	GateTModel,
	GateTXDName[33],
	GateTextureName[33],

	Float: GateMovePos[6],
	Float: GatePos[6],
	GateInterior,
	GateWorld,

	GateAreaID
}

new GateData[MAX_GATES][e_gates];
new Iterator:Gates<MAX_GATES>;

enum    e_objects
{
	ObjectID,
	ObjectModel,
	ObjectHolder,
	Float: ObjectPos[6],
	ObjectInterior,
	ObjectWorld,

	ObjectAreaID
}

new ObjectData[MAX_SERVER_OBJECTS][e_objects];
new Iterator:Objects<MAX_SERVER_OBJECTS>;

enum    e_reports
{
	ReportPlayer,
	ReportText[128]
}

new ReportData[MAX_REPORTS][e_reports];
new Iterator:Reports<MAX_REPORTS>;

enum    e_supports
{
	SupportPlayer,
	SupportText[128]
}

new SupportData[MAX_SUPPORTS][e_supports];
new Iterator:Supports<MAX_SUPPORTS>;

enum    e_sprays
{
	SprayID,
	Float: SprayLocation[6],
	SprayText[128],
	SprayModel,
	SprayBy,
	SprayInterior,
	SprayWorld,
	SprayObject,
	SprayAreaID
}

new SprayData[MAX_SPRAYS][e_sprays];
new Iterator:Tags<MAX_SPRAYS>;

enum    e_billboards
{
	BillboardID,
	BillboardModel,
	Float: BillboardLocation[6],
	BillboardText[128],
	BillboardInterior,
	BillboardWorld,
	BillboardObject,

	BillboardRentedBy,
	BillboardRentExpiresAt,
	BillboardInArea
}

new BillboardData[MAX_BILLBOARDS][e_billboards];
new Iterator:Billboards<MAX_BILLBOARDS>;

/*enum 	e_pickups
{
	PickupID,
	PickupText[128],
	Float: PickupLocation[3],
	PickupInterior,
	PickupWorld,
	PickupIcon,

	Text3D: PickupText3D,
	PickupPickup
}

new PickupData[MAX_SERVER_PICKUPS][e_pickups];
new Iterator:Pickups<MAX_SERVER_PICKUPS>;*/

enum 	e_antennas
{
	AntennaID,
	Float: AntennaLocation[6],
	AntennaObject,
	AntennaAreaID
}

new AntennaData[MAX_ANTENNAS][e_antennas];
new Iterator:Antennas<MAX_ANTENNAS>;

enum 	e_boomboxs
{
	BoomboxID,
	BoomboxOwnerID,
	BoomboxURL[256],
	bool: BoomboxStatus,
	Float: BoomboxLocation[6],
	BoomboxInterior,
	BoomboxWorld,
	BoomboxObject,
	BoomboxAreaID
}

new BoomboxData[MAX_BOOMBOXS][e_boomboxs];
new Iterator:Boomboxs<MAX_BOOMBOXS>;

enum 	e_streets
{
	StreetID,
	StreetName[35],
	MaxPoints,
	StreetX,
	StreetY,
	StreetAreaID
}

new StreetData[MAX_STREETS][e_streets];
new Iterator:Streets<MAX_STREETS>;

new PropertyNameHolder[MAX_PLAYERS][35];

enum 	e_dealerships
{
	DealershipID,
	DealershipCategory,
	DealershipModelName[45],
	DealershipModel,
	DealershipPrice,
	DealershipIsEnabled
}

new DealershipData[MAX_DEALERSHIPS][e_dealerships];
new Iterator:Dealerships<MAX_DEALERSHIPS>;

enum 	e_dealerships_player
{
	DealershipID,
	DealershipCategory,
	DealershipModelName[45],
	DealershipModel,
	DealershipPrice,
	DealershipIsEnabled
}

new DealershipPData[MAX_DEALERSHIPS][e_dealerships_player];

enum 	e_tolls
{
	TollID,
	TollName[25],
	TollModel,
	TollPrice,

	Float: TollPos[6],
	Float: TollMovePos[6],
	TollInterior,
	TollWorld,

	bool: TollLocked,
	bool: TollStatus,

	TollTimer,
	TollObject,
	TollAreaID
}

new TollData[MAX_TOLLS][e_tolls];
new Iterator:Tolls<MAX_TOLLS>;

new TotalTollPayment, TollTimesLocked;

enum 	e_businesses
{
	BusinessID,
	BusinessPrice,
	BusinessOwnerSQLID,
	BusinessName[128],
	BusinessMOTD[128],
	BusinessPickup,

	BusinessType,
	BusinessRestaurantType,
	BusinessLevel,

	Float: EnterPos[4],
	EnterInterior,
	EnterWorld,

	Float: ExitPos[4],
	ExitInterior,
	ExitWorld,

	BankPickup,
	Float: BankPos[3],
	BankInterior,
	BankWorld,

	BusinessFee,
	BusinessCashbox,
	bool: BusinessLocked,

	bool: BusinessHasXMR,
	bool: BusinessXMROn,
	BusinessXMRUrl[128],

	BusinessTime,
	bool: BusinessLights,

	BusinessRake,

	BusinessProduct,
	BusinessWantedProduct,
	BusinessProductPrice,

	BusinessFood[3],
	BusinessFoodPrice[3],

	BusinessAreaID[2]
}

new BusinessData[MAX_BUSINESS][e_businesses];
new Iterator:Businesses<MAX_BUSINESS>;


#define TYPE_PIZZA    (0)
#define TYPE_BURGER   (1)
#define TYPE_CHICKEN  (2)
#define TYPE_DONUT    (3)

enum 	e_foods
{
	FoodType,
	FoodModel,
    FoodName[128],
    Float: FoodHealth,
	FoodPrice
}

new const FoodData[][e_foods] =
{
	{TYPE_PIZZA, 2218, "Buster", 50.0, 150},
	{TYPE_PIZZA, 2219, "Double_D-Luxe", 100.0, 350},
	{TYPE_PIZZA, 2220, "Full_Rack", 150.0, 500},

	{TYPE_BURGER, 2213, "Moo_Kids_Meal", 50.0, 150},
	{TYPE_BURGER, 2214, "Beef_Tower", 100.0, 350},
	{TYPE_BURGER, 2212, "Meat_Stack", 150.0, 500},

	{TYPE_CHICKEN, 2215, "Cluckin'_Little_Meal", 50.0, 150},
	{TYPE_CHICKEN, 2216, "Cluckin'_Big_Meal", 100.0, 350},
	{TYPE_CHICKEN, 2217, "Cluckin'_Huge_Meal", 150.0, 500},

	{TYPE_DONUT, 2221, "Donut_Small_Pack", 50.0, 150},
	{TYPE_DONUT, 2223, "Donut_Medium_Pack", 100.0, 350},
	{TYPE_DONUT, 2222, "Donut_Large_Pack", 150.0, 500}
};

enum 	e_cctvs
{
    CameraID,
    CameraName[30],

    Float: CameraLocation[6],
    CameraInterior,
    CameraWorld,

    CameraObject,
    CameraAreaID
}

new CameraData[MAX_CCTVS][e_cctvs];
new Iterator:Cameras<MAX_CCTVS>;

enum 	e_roadblocks
{
	RoadblockID,
	RoadblockModelID,

	RoadblockName[25],
	RoadblockPlacedBy[25],
	RoadblockLocation[40],

	Float: RoadblockPos[6],
	RoadblockInterior,
	RoadblockWorld,

	RoadblockObject,
	bool: RoadblockSpikes,
	RoadblockAreaID
}

new RoadblockData[MAX_ROADBLOCKS][e_roadblocks];
new Iterator:Roadblocks<MAX_ROADBLOCKS>;

enum 	e_damages
{
	DamageTaken,
	DamageWeaponID,
	DamageBodypart,
	DamageArmor,
	DamageTime,
	DamageBy[25]
}

new DamageData[MAX_PLAYERS][MAX_DAMAGES][e_damages];
new TotalDamages[MAX_PLAYERS];

enum 	e_corpse
{
	bool:corpseExists,
	corpseTimer,
	corpseDespawnCountdown,
	corpseSkin,
	corpseVehicle,
	bool:corpseCoroner,
	corpseName[25],
	Float:corpsePos[4],
	bool: corpseBuring,
	Float:corpseBodyBagPos[6],
	bool:corpseBodybag,
	corseBodybagObject,
	bool:corpseinteracts,
	corpseActor
}

new CorpseData[MAX_CORPSE][e_corpse];
new Iterator:Corpses<MAX_CORPSE>;

enum 	e_corpsedamages
{
	corpseTaken,
	corpseWeapon,
	corpseBodyPart,
	corpseArmor,
	corpseTime,
	corpseDamageBy[25]
}

new CorpseDamages[MAX_CORPSE][MAX_CORPSEDAMAGE][e_corpsedamages];

enum 	e_apbs
{
	BulletinID,
	BulletinDetails[128],
	BulletinBy,
	BulletinDate
}

new APBData[MAX_APBS][e_apbs];
new Iterator:Bullettins<MAX_APBS>;

enum 	e_meals
{
	MealModelID,
	MealObjectID,
	Float: MealPos[3],
	MealInterior,
	MealWorld,
	MealPlayerID,
	bool: MealEditing
}

new MealData[MAX_MEALS][e_meals];
new Iterator:Meals<MAX_MEALS>;

enum 	e_server_data
{
	FakeLicenseX,
	FakeLicenseY,
	FakeLicenseZ,
	FakeLicenseIcon,
	FakeLicenseMsg[35],

	MOTDLineMsg[128],
	MOTDBy[25],
	MOTDTime
}

new ServerData[e_server_data];

/*enum 	e_frequnces
{
	FrequenceID,
	rPassword[32],
	rOwner,
	rFaction,
	rHour
}

new FrequenceData[MAX_FREQUENCES][e_frequnces];*/

enum 	e_interiors
{
	InteriorID,
	Float: InteriorX,
	Float: InteriorY,
	Float: InteriorZ,
	Float: InteriorA
}

new const Float:g_PropertyInteriors[][e_interiors] =
{
	{6, -68.4895, 1351.9392, 1080.2109, 4.9288},
	{8, -42.7541, 1405.8185, 1084.4297, 5.6207},
	{8, 2365.0811, -1135.0891, 1050.8750, 356.3250},
	{10, 24.1655, 1340.7227, 1084.3750, 5.4987},
	{9, 82.9670, 1322.9552, 1083.8662, 356.1895},
	{5, 140.4513, 1366.6266, 1083.8594, 0.5439},
	{15, 295.4811, 1472.6935, 1080.2578, 0.1319},
	{15, 328.0272, 1478.3373, 1084.4375, 351.9041},
	{15, 386.8175, 1471.8048, 1080.1875, 93.6497},
	{15, 376.6169, 1417.2181, 1081.3281, 87.2736},
	{2, 447.0533, 1397.6222, 1084.3047, 354.5509},
	{3, 234.4825, 1187.5370, 1080.2578, 351.8747},
	{6, 744.7277, 1436.7284, 1102.7031, 356.5667},
	{4, 261.0772, 1285.7340, 1080.2578, 0.9978},
	{1, 223.0771, 1287.5623, 1082.1406, 356.1723},
	{9, 260.8456, 1237.6703, 1084.2578, 357.6443},
	{4, 221.9221, 1141.2719, 1082.6094, 357.8791},
	{5, 318.4733, 1115.0323, 1083.8828, 354.3979},
	{5, 226.8602, 1113.9534, 1080.9958, 271.1856},
	{6, 233.9391, 1065.1996, 1084.2101, 357.1651},
	{7, 225.6747, 1022.4135, 1084.0149, 355.0293},
	{10, 2259.8987, -1136.3250, 1050.6328, 260.3416},
	{11, 2283.1563, -1139.6979, 1050.8984, 352.2724},
	{2, 2237.4204, -1081.0305, 1049.0234, 353.0650},
	{10, 2269.9692, -1210.5177, 1047.5625, 88.4630},
	{6, 2196.2432, -1204.6271, 1049.0234, 83.5406},
	{6, 2332.9946, -1076.7656, 1049.0234, 355.0737},
	{12, 2324.1787, -1148.5645, 1050.7101, 6.3439},
	{1, 244.1331, 304.6698, 999.1484, 265.7339},
	{2, 266.9661, 305.1599, 999.1484, 268.2738},
	{6, 343.9665, 304.7900, 999.1484, 262.2185},
	{1, 2217.6323, -1076.1080, 1050.4844, 91.8692},
	{5, 2233.4324, -1114.7819, 1050.8828, 1.5213},
	{10, 2259.9482, -1136.1741, 1050.6328, 265.8125}
};

new const Float:g_PropertyInteriorsWOF[][e_interiors] =
{
	{12, -79.9853, 1383.8722, 1078.9551, 359.2260},
	{12, -48.4819, 1458.6091, 1085.6138, 83.1559},
	{12, 45.4596, 1439.5059, 1082.4120, 83.5161},
	{12, 7.4747, 1305.6910, 1082.8309, 356.8497},
	{12, 82.7974, 1272.2775, 1079.8889, 357.2918},
	{12, 156.0716, 1410.4082, 1086.4325, 359.9312},
	{12, 290.1055, 1502.0847, 1078.4204, 352.5016},
	{12, 329.4342, 1513.3496, 1085.8153, 354.3874},
	{12, 390.1448, 1506.0529, 1080.0925, 88.6414},
	{12, 375.4148, 1378.2706, 1079.8022, 81.0770},
	{12, 448.3159, 1354.4695, 1082.2172, 3.5341},
	{12, 509.4346, 1354.3772, 1076.7826, 1.2146},
	{12, 745.3787, 1412.6329, 1102.4248, 353.5140},
	{12, 294.8513, 1285.7087, 1078.4471, 354.7286},
	{12, 191.4486, 1289.4285, 1082.1399, 359.3893},
	{12, 290.8055, 1242.6372, 1082.6812, 0.3083},
	{12, 244.2509, 1146.1193, 1081.1672, 3.6838},
	{12, 325.9058, 1075.5295, 1082.2539, 351.0508},
	{12, 199.2260, 1111.4883, 1083.2163, 2.4402},
	{12, 278.0576, 1058.3812, 1083.4525, 355.1205},
	{12, 263.6036, 978.8312, 1083.6869, 352.5047},
	{12, 2261.1641, -1121.3912, 1048.8778, 255.3701},
	{12, 2284.8135, -1126.0341, 1050.9229, 353.1727},
	{12, 2370.3208, -1094.9351, 1049.6207, 176.5558},
	{12, 2243.9141, -1028.6069, 1047.7676, 175.4189},
	{12, 2272.4177, -1242.5837, 1048.5969, 88.4237},
	{12, 2150.0820, -1217.1633, 1049.1169, 178.0771},
	{12, 2364.5439, -1074.2340, 1047.7673, 4.2320},
	{12, 2373.7942, -1183.1560, 1053.2129, 358.0608},
	{12, 242.6349, 323.0294, 999.5914, 265.0761},
	{12, 265.9531, 321.2301, 997.1435, 269.0159},
	{12, 360.9103, 303.9177, 996.8972, 268.0442},
	{12, 2189.0684, -1073.8127, 1050.4823, 81.6114},
	{12, 2255.0740, -1112.2137, 1049.1305, 357.7246},
	{12, 2297.7805, -1093.3923, 1048.8734, 83.3229}
};

/*new g_aAnimList[][15] =
{
	{"Ground Sitting"},
	{"Seat"},
    {"Proned/Laying"},
    {"Hand"},
    {"Leaning"},
    {"Gang Sign"},
    {"Contact/Hit"},
    {"Greeting/Wave"},
    {"Hand Motion"},
    {"Movement"},
    {"Poiting"},
    {"Crouching"},
    {"Reloading"},
    {"Shotting"},
    {"Lose/Win Cheer"},
	{"Basketball"},
	{"Mechanic"},
	{"Boxing"},
	{"Kung Fu"},
	{"Swaying"},
	{"Standing Up"},
	{"Dancing"},
	{"Stance"}
};*/


/*
new const g_BusinessInteriors[][e_InteriorList] =
{
	{0,  0000.0000, 0000.0000, 0000.0000, 000.0000},
	{17, -25.884498, -185.868988, 1003.546875, 0.0},
	{10, 6.091179,-29.271898,1003.549438, 0.0},
	{1, 286.148986,-40.644397,1001.515625, 0.0},
	{7, 314.820983,-141.431991,999.601562, 0.0},
	{3, 1038.531372,0.111030,1001.284484, 0.0},
	{15, 2215.454833,-1147.475585,1025.796875, 0.0},
	{3, 833.269775,10.588416,1004.179687, 0.0},
	{3, -103.559165,-24.225606,1000.718750, 0.0},
	{6, -2240.468505,137.060440,1035.414062, 0.0},
	{0, 663.836242,-575.605407,16.343263, 0.0},
	{1, 2169.461181,1618.798339,999.976562, 0.0},
	{1, -2159.122802,641.517517,1052.381713, 0.0},
	{15, 207.737991,-109.019996,1005.132812, 0.0},
	{14, 204.332992,-166.694992,1000.523437, 0.0},
	{17, 207.054992,-138.804992,1003.507812, 0.0},
	{11, 501.980987,-69.150199,998.757812, 0.0},
	{18, -227.027999,1401.229980,27.765625, 0.0},
	{4, 457.304748,-88.428497,999.554687, 0.0},
	{10, 375.962463,-65.816848,1001.507812, 0.0},
	{9, 369.579528,-4.487294,1001.858886, 0.0},
	{5, 373.825653,-117.270904,1001.499511, 0.0},
	{5, 772.111999,-3.898649,1000.728820, 0.0},
	{6, 774.213989,-48.924297,1000.585937, 0.0},
	{7, 773.579956,-77.096694,1000.655029, 0.0},
	{3, 1212.019897,-28.663099,1000.953125, 0.0},
	{2, 1204.809936,-11.586799,1000.921875, 0.0},
	{3, 964.106994,-53.205497,1001.124572, 0.0},
	{3, -2640.762939,1406.682006,906.460937, 0.0},
	{1, -794.806396,497.738037,1376.195312, 0.0},
	{0, 2315.952880,-1.618174,26.742187, 0.0}
};*/

#define MAX_ROWS_PER_OFFLINE 25


// Default Move Speed
#define MOVE_SPEED              100.0
#define ACCEL_RATE              0.03
#define ACCEL_MODE              true

// Players Mode
#define CAMERA_MODE_NONE    	0
#define CAMERA_MODE_FLY     	1

// Key state definitions
#define MOVE_FORWARD    		1
#define MOVE_BACK       		2
#define MOVE_LEFT       		3
#define MOVE_RIGHT      		4
#define MOVE_FORWARD_LEFT       5
#define MOVE_FORWARD_RIGHT      6
#define MOVE_BACK_LEFT          7
#define MOVE_BACK_RIGHT         8

// Enumeration for storing data about the player
enum noclipenum
{
	cameramode,
	flyobject,
	mode,
	lrold,
	udold,
	lastmove,
	Float:accelmul,

    Float:accelrate,
    Float:maxspeed,
    bool:accel
}
new noclipdata[MAX_PLAYERS][noclipenum];

new bool:FlyMode[MAX_PLAYERS];


stock Warship_Init()
{
  //obj_warship = CreateDynamicObject(-20014, 2838.7153, -2438.1294, 18.00, 0.0, 0.0, -90.0, 0, 0, -1);
	return 1;
}

new obj_ship,
	obj_gate[2],
	obj_lamp[9],
	obj_board[2],
	ship_arrived,
	ship_depart,
	ship_next,
	ship_docked,
	ship_steps,
	time_truck;

stock Ship_Init()
{
	ship_steps = 0;
    ship_docked = 1;
    ship_arrived = Time();
	ship_depart = Time() + 1800;
	ship_next = Time() + 1800 + 450;

    obj_ship = CreateDynamicObject(-20014, 2838.7153, -2438.1294, 18.00, 0.0, 0.0, -90.0, 0, 0, -1);

	obj_lamp[0] = CreateDynamicObject(19123, 2810.770, -2389.310, 13.189,0.000,0.000,0.000, 0, 0, -1);
	obj_lamp[1] = CreateDynamicObject(19123, 2810.774, -2385.650, 13.180,0.000,0.000,0.000, 0, 0, -1);
	obj_lamp[2] = CreateDynamicObject(19123, 2810.774, -2390.509, 13.180,0.000,0.000,0.000, 0, 0, -1);
	obj_lamp[3] = CreateDynamicObject(19123, 2810.770, -2435.500, 13.189,0.000,0.000,0.000, 0, 0, -1);
	obj_lamp[4] = CreateDynamicObject(19123, 2810.770, -2437.900, 13.189,0.000,0.000,0.000, 0, 0, -1);
	obj_lamp[5] = CreateDynamicObject(19123, 2810.774, -2434.160, 13.180,0.000,0.000,0.000, 0, 0, -1);
	obj_lamp[6] = CreateDynamicObject(19123, 2809.958, -2392.959, 12.529,0.000,0.000,0.000, 0, 0, -1);
	obj_lamp[7] = CreateDynamicObject(19123, 2810.774, -2439.020, 13.180,0.000,0.000,0.000, 0, 0, -1);
	obj_lamp[8] = CreateDynamicObject(19123, 2810.770, -2387.310, 13.189,0.000,0.000,0.000, 0, 0, -1);

	obj_gate[0] = CreateDynamicObject(3069, 2810.893,-2388.025, 12.6151, -21.00000, 0.00000, -90.00000, 0, 0, -1);
	obj_gate[1] = CreateDynamicObject(3069, 2810.893,-2436.518, 12.61510, -21.00000, 0.00000, -90.00000, 0, 0, -1);

	obj_board[0] = CreateObject(3077, 2810.302, -2393.040, 12.621, 0.000, 0.000, -90.000);
	obj_board[1] = CreateObject(19482, 2810.302-0.1, -2393.040, 12.621+2.0, 0.000, 0.000, 180.000);
	SetObjectMaterialText(obj_board[1], sprintf("OCEAN DOCKS GEMI\nGELDIGI SAAT: %s\nKALKIS SAATI: %s\nDONUS SAATI: %s", GetShipHour(ship_arrived), GetShipHour(ship_depart), GetShipHour(ship_next)), 0, OBJECT_MATERIAL_SIZE_512x256, "Arial", 26, 1, -1, 0, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);

	time_truck = 3600;
	return 1;
}

enum    e_furniture
{
	SQLID,

	ArrayID, // Ana Kategori g_aFurnitureSubCategories[ data[ArrayID] ][MainCategory];
	SubArrayID, // Alt Kategori g_aFurnitureData[ data[SubArrayID] ][SubCategory];

	ObjectID,
	TempObjectID,

	PropertyID,
	BusinessID,

	furnitureName[64],
	furnitureCategory,
	furnitureSubCategory,
	furniturePrice,

	Float: furnitureX,
	Float: furnitureY,
	Float: furnitureZ,
	Float: furnitureRX,
	Float: furnitureRY,
	Float: furnitureRZ,

	bool: furnitureLocked,
	bool: furnitureOpened,

	furnitureTexture[5]
}

enum CARGO_OBJECT_ENUM
{
	oOn,
	oObj,
	Text3D:oLabel,
	Float:oX,
	Float:oY,
	Float:oZ,
	oInt,
	oVW,
	oProduct
}

new CargoObject[MAX_CARGO_OBJ][CARGO_OBJECT_ENUM];

enum TRUCK_CARGO_ENUM
{
	tID,
	tType,
	tName[64],
	tStorage,
	tStorageSize,
	tPrice,
	tProductID,
	tProductAmount,
	tPack,
	tGps,
	tLocked,
	Float: tPosX,
	Float: tPosY,
	Float: tPosZ,
	Text3D:tLabel,
	tPickup
}

new TruckerData[MAX_TRUCK_CARGO][TRUCK_CARGO_ENUM];
new Iterator:Trucker<MAX_TRUCK_CARGO>;

enum 	e_weapons
{
	WeaponBone,
    bool: WeaponHidden,
    Float: WeaponPos[6]
}

new WeaponSettings[MAX_PLAYERS][17][e_weapons];
new PlayerConnectionTick[MAX_PLAYERS], EditingDisplay[MAX_PLAYERS];

stock IsTakeProduct(prod)
{
	switch(prod)
	{
	    case TRUCKER_FUEL, TRUCKER_CARS, TRUCKER_MILK, TRUCKER_CEREAL, TRUCKER_COTTON, TRUCKER_DYES, TRUCKER_MALT, TRUCKER_AGGREGATE, TRUCKER_WOODS, TRUCKER_SCRAP, TRUCKER_BRICKS, TRUCKER_TRANSFORMS: return 0;
	}
	return 1;
}

new TruckerData_type[4][32] =
{
	"özel",
	"birincil",
	"ikincil",
	"gemi"
};


Trucker_GetType(id)
{
	new type[14];
	switch(id)
	{
		case 0, 11: type = "metreküp";
		case 1, 2, 3, 5, 6, 7, 12, 15, 18, 20, 23 ,24: type = "kasa";
		case 4: type = "araç";
		case 8: type = "litre";
		case 9, 10, 13, 16, 19: type = "ton";
		case 14, 21: type = "çelik kasa";
		case 17: type = "kütük";
		case 22: type = "palet";
		case 25: type = "transformatör";
	}
	return type;
}

new TruckerData_product[MAX_TRUCK_PRODUCT][32] =
{
	"yakýt",
	"yiyecek",
	"içecek",
	"kýyafet",
	"araç",
	"mobilya",
	"et",
	"yumurta",
	"süt",
	"tahýl",
	"pamuk",
	"boya",
	"araç parçasý",
	"malt",
	"madeni para",
	"kaðýt",
	"çakýl taþý",
	"aðaç kütükleri",
	"barut",
	"hurda metal",
	"çelik metal",
	"silah",
	"tuðla",
	"alet edevat",
	"meyve",
	"transformatör"
};

new biz_prod_types[12] =
	{
		23,
		23,
		5,
		1,
		21,
		3,
		14,
		2,
		-1,
		0,
		15,
		-1
	};

enum
{
	BUSINESS_STORE = 1, // alet
	BUSINESS_GENERAL, // alet
	BUSINESS_PAWNSHOP, // mobilya
	BUSINESS_RESTAURANT, // yiyecek
	BUSINESS_AMMUNATION, // silah
	BUSINESS_CLOTHING, // kýyafet
	BUSINESS_BANK, // para
	BUSINESS_CLUB, // içecek
	BUSINESS_DEALERSHIP, // -1
	BUSINESS_GASSTATION, // 0
	BUSINESS_ADVERT,
	BUSINESS_CUSTOM
}

new Float: dft_attach[4] = {-0.04656, -4.26884, 0.81490, 3.54000};

new Float: forklift_attach[3][3] =
{
	{0.300000,  0.449999, -0.075000},
	{-0.449999, 0.449999, -0.075000},
	{-0.075000, 0.449999,  0.599999}
};

new Float: dft_attach_brick[3][3] =
{
    {0.04380, 1.17068, -0.46367},
	{0.04380, -1.35450, -0.46370},
	{0.04380, -3.79490, -0.4637}
};

new Float: paker_attach[2][4] =
{
	{0.00000, 0.40200, 1.85540, 15.18000},
	{-0.00730, -6.36940, 0.00000, 15.18000}
};

new Float: picador_attach[2][3] =
{
	{0.13280, -1.10310, -0.17710},
	{0.01329, -1.86198, -0.17710}
};

new Float: sadler_attach[2][3] =
{
	{0.13280, -1.10310, -0.21710},
	{0.01330, -1.86200, -0.21710}
};

new Float: bobcat_attach[3][3] =
{
	{-0.31250, -0.80650, -0.31710},
	{0.42700, -0.80650, -0.31710},
	{0.04260, -1.84000, -0.31710}
};

new Float: walton_attach[4][3] =
{
	{-0.44386, -1.00283, -0.07710},
	{0.51337, -1.10535, -0.07710},
	{0.46038, -1.85669, -0.07710},
	{-0.36452, -1.87622, -0.07710}
};

new Float: yosemite_attach[6][3] =
{
	{-0.31250, -1.00700, -0.23710},
	{0.42700, -1.00650, -0.23710},
	{0.06740, -1.70740, -0.23710},
	{0.06560, -2.40020, -0.23710},
	{0.06553, -0.99522, 0.46057},
	{0.07971, -1.69164, 0.46057}
};

new Float: yosemite_attach_brick[3] = {0.00995, -1.59382, 0.26984};//1685

enum E_PLAYER_DRUG
{
	data_id,
	player_dbid,
	drug_id,
	drug_name[64],
	Float: drug_amount,
	drug_quality,
	drug_size,
	bool: is_exist
}

new player_drug_data[MAX_PLAYERS][MAX_PACK_SLOT][E_PLAYER_DRUG];

enum e_player_packages
{
	data_id,
	player_dbid,
	weapon_id,
	weapon_ammo,
	bool: is_exist
}

new player_package_data[MAX_PLAYERS][MAX_PACK_SLOT][e_player_packages];

enum E_PROPERTY_DRUG
{
	data_id,
	property_id,
	prop_drug_id,
	prop_drug_name[64],
	Float: prop_drug_amount,
	prop_drug_quality,
	prop_drug_size,
	bool: is_exist
}

new property_drug_data[MAX_PROPERTY][MAX_PACK_SLOT][E_PROPERTY_DRUG];

enum E_VEHICLE_DRUG
{
	data_id,
	veh_id,
	veh_drug_id,
	veh_drug_name[64],
	Float: veh_drug_amount,
	veh_drug_quality,
	veh_drug_size,
	bool: is_exist
}

new vehicle_drug_data[MAX_VEHICLES][MAX_PACK_SLOT][E_VEHICLE_DRUG];

new PlayerText:IdentityCard[MAX_PLAYERS][11];

new PlayerText: drug_effect[MAX_PLAYERS];

/*new drug_effect_color[] =
{
    0xE07F8E20,
    0xFFFFAA20,
	0xF3AEFF20,
	0xFFCE7B20,
	0xCCFFCC20,
	0xA8E05120,
	0xFF1D9820
};*/

enum 	e_dropped_drugs
{
	DropType, // 1 - Silah, 2 - Uyuþturucu

	// 1 - Silah
	DropWeaponID,
	DropWeaponAmmo,

	// 2 - Uyuþturucu
	DropDrugID,
	Float: DropDrugAmount,
	DropDrugName[64],
	DropDrugQuality,
	DropDrugSize,

	Float: DropLocation[3],
	DropInterior,
	DropWorld,

	DroppedBy,
	DropObjID,
	DropTimer,
	DropAreaID
}

new DropData[MAX_DROP_ITEMS][e_dropped_drugs];
new Iterator:Drops<MAX_DROP_ITEMS>;

new trunk_weapons[6][2] =
{
	{0, 0},
	{25, 100},
	{29, 250},
	{31, 200},
	{43, 100},
	{34, 10}
};

new trunk_weapons_swat[6][2] =
{
	{0, 0},
	{25, 100},
	{29, 250},
	{31, 200},
	{17, 5},
	{34, 10}
};

enum E_SKIN {
    modelidx
};

new const aksesuarListe[][E_SKIN] = {
	{18632},
	{18633},
	{18634},
	{337},
	{18635},
	{18638},
	{18639},
	{18640},
	{18975},
	{19136},
	{19274},
	{18644},
	{18645},
	{18865},
	{18866},
	{18867},
	{18868},
	{18869},
	{18870},
	{18871},
	{18872},
	{18873},
	{18874},
	{18875},
	{18890},
	{18891},
	{18892},
	{18893},
	{18894},
	{18895},
	{18896},
	{18897},
	{18898},
	{18899},
	{18900},
	{18901},
	{18902},
	{18903},
	{18904},
	{18905},
	{18906},
	{18907},
	{18908},
	{18909},
	{18910},
	{18911},
	{18912},
	{18913},
	{18914},
	{18915},
	{18916},
	{18917},
	{18918},
	{18919},
	{18920},
	{18921},
	{18922},
	{18923},
	{18924},
	{18925},
	{18926},
	{18927},
	{18928},
	{18929},
	{18930},
	{18931},
	{18932},
	{18933},
	{18934},
	{18935},
	{18936},
	{18937},
	{18938},
	{18939},
	{18940},
	{18941},
	{18942},
	{18943},
	{18944},
	{18945},
	{18946},
	{18947},
	{18948},
	{18949},
	{18950},
	{18951},
	{18952},
	{18953},
	{18954},
	{18955},
	{18956},
	{18957},
	{18958},
	{18959},
	{18960},
	{18961},
	{18962},
	{18964},
	{18965},
	{18966},
	{18967},
	{18968},
	{18969},
	{18970},
	{18971},
	{18972},
	{18973},
	{18974},
	{18976},
	{18977},
	{18978},
	{18979},
	{19006},
	{19007},
	{19008},
	{19009},
	{19010},
	{19011},
	{19012},
	{19013},
	{19014},
	{19015},
	{19016},
	{19017},
	{19018},
	{19019},
	{19020},
	{19021},
	{19022},
	{19023},
	{19024},
	{19025},
	{19026},
	{19027},
	{19028},
	{19029},
	{19030},
	{19031},
	{19032},
	{19033},
	{19034},
	{19035},
	{19036},
	{19037},
	{19038},
	{19039},
	{19040},
	{19041},
	{19042},
	{19043},
	{19044},
	{19045},
	{19046},
	{19047},
	{19048},
	{19049},
	{19050},
	{19051},
	{19052},
	{19053},
	{19085},
	{19090},
	{19091},
	{19092},
	{19093},
	{19094},
	{19095},
	{19096},
	{19097},
	{19098},
	{19113},
	{19114},
	{19115},
	{19116},
	{19117},
	{19118},
	{19119},
	{19120},
	{19137},
	{19160},
	{19163},
	{19317},
	{19318},
	{19319},
	{19348},
	{19349},
	{19350},
	{19351},
	{19352},
	{19487},
	{19488},
	{19513},
	{3044},
	{1210},
	{19559},
	{19904},
	{19517},
	{19077},
	{18641},
	{19317},
	{19318},
	{19319},
	{19553},
	{19554},
	{19623},
	{19610},
	{19624},
	{11745},
	{19625},
	{2713}
};

new const erkekSkin[][E_SKIN] = {
    {2},
    {1},
    {2},
    {3},
    {4},
    {4},
    {5},
    {6},
    {7},
    {8},
    {14},
    {15},
    {16},
    {17},
    {18},
    {19},
    {20},
    {21},
    {22},
    {23},
    {24},
    {25},
    {26},
    {27},
    {28},
    {29},
    {30},
    {32},
    {33},
    {34},
    {35},
    {36},
    {37},
    {42},
    {43},
    {44},
    {45},
    {46},
    {47},
    {48},
    {49},
    {50},
    {51},
    {52},
    {57},
    {58},
    {59},
    {60},
    {62},
    {66},
    {67},
    {68},
    {72},
    {73},
    {78},
    {79},
    {80},
    {81},
    {82},
    {83},
    {84},
    {86},
    {94},
    {95},
    {96},
    {97},
    {98},
    {99},
    {100},
    {101},
    {102},
    {103},
    {104},
    {105},
    {106},
    {107},
    {108},
    {109},
    {110},
    {111},
    {112},
    {113},
    {114},
    {115},
    {116},
    {117},
    {118},
    {119},
    {120},
    {121},
    {122},
    {123},
    {124},
    {125},
    {126},
    {127},
    {128},
    {132},
    {133},
    {134},
    {135},
    {136},
    {137},
    {142},
    {143},
    {144},
    {146},
    {147},
    {153},
    {154},
    {155},
    {156},
    {158},
    {159},
    {160},
    {161},
    {162},
    {163},
    {164},
    {165},
    {166},
    {167},
    {168},
    {170},
    {171},
    {173},
    {174},
    {175},
    {176},
    {177},
    {179},
    {180},
    {181},
    {182},
    {183},
    {184},
    {185},
    {186},
    {187},
    {188},
    {189},
    {200},
    {202},
    {203},
    {204},
    {206},
    {208},
    {209},
    {210},
    {212},
    {213},
    {217},
    {220},
    {221},
    {222},
    {223},
    {227},
    {228},
    {229},
    {230},
    {234},
    {235},
    {236},
    {239},
    {240},
    {241},
    {242},
    {247},
    {248},
    {249},
    {250},
    {252},
    {254},
    {258},
    {260},
    {261},
    {262},
    {268},
    {270},
    {271},
    {272},
    {273},
    {289},
    {290},
    {291},
    {292},
    {293},
    {294},
    {295},
    {296},
    {297},
    {299},
    {303},
    {304},
    {305},
		{27004},
		{27005},
		{27006},
		{27008},
		{27009},
		{27010},
		{27011},
		{27012},
		{27014},
		{27017},
		{27018},
		{27019},
		{27021},
		{27022},
		{27023},
		{27024},
		{27025},
		{27038},
		{27039},
		{27041},
		{27042},
		{27043},
		{27044},
		{27045},
		{27046},
		{27047},
		{27054},
		{27055},
		{27056},
		{27057},
		{27058},
		{27060},
		{27061},
		{27062},
		{27063},
		{27064},
		{27065},
		{27066},
		{27067},
		{27068},
		{27069},
		{27070},
		{27071},
		{27072},
		{27073},
		{27074},
		{27085},
		{27086},
		{27087},
		{27088},
		{27089},
		{27090},
		{27091},
		{27093},
		{27094},
		{27096},
		{27097},
		{27100},
		{27101},
		{27107},
		{27108},
		{27109},
		{27110}
};
new const kadinSkin[][E_SKIN] = {
    {9},
    {10},
    {11},
    {12},
    {13},
    {31},
    {38},
    {39},
    {40},
    {41},
    {53},
    {54},
    {55},
    {56},
    {63},
    {64},
    {65},
    {69},
    {75},
    {76},
    {77},
    {85},
    {87},
    {88},
    {89},
    {90},
    {91},
    {92},
    {93},
    {129},
    {139},
    {131},
    {138},
    {139},
    {140},
    {141},
    {148},
    {150},
    {151},
    {152},
    {157},
    {159},
    {169},
    {172},
    {178},
    {190},
    {191},
    {192},
    {193},
    {194},
    {195},
    {196},
    {197},
    {198},
    {201},
    {205},
    {207},
    {211},
    {214},
    {215},
    {216},
    {218},
    {219},
    {224},
    {225},
    {226},
    {231},
    {232},
    {233},
    {237},
    {238},
    {243},
    {244},
    {245},
    {246},
    {251},
    {256},
    {257},
    {263},
    {298},
		{27000},
		{27001},
		{27002},
		{27015},
		{27016},
		{27027},
		{27028},
		{27029},
		{27030},
		{27031},
		{27032},
		{27033},
		{27034},
		{27035},
		{27036},
		{27037},
		{27059},
		{27075},
		{27080},
		{27081},
		{27082},
		{27084},
		{27102},
		{27103},
		{27112}
};

new cctvPlayerObject[MAX_PLAYERS];


IsValidWeapon(weaponid)
{
	switch(weaponid)
	{
	    case 25 .. 34: return true;
	}
	return false;
}

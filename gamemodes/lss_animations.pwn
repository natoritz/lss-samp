/*CMD:caranim(playerid, params[])
{
	if(PlayerData[playerid][pBrutallyWounded]) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	if(!IsPlayerInAnyVehicle(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");

	new anim[6];
	if(sscanf(params, "s[6]", anim)) return SendUsageMessage(playerid, "/caranim [relax/tap]");

	if(!strcmp(anim, "relax"))
	{
		PlayAnimation(playerid, "LOWRIDER", "SIT_RELAXED", 4.1, 0, 0, 0, 1, 0, 1);
	}
	else if(!strcmp(anim, "tap"))
	{
		PlayAnimation(playerid, "LOWRIDER", "TAP_HAND", 4.1, 0, 0, 0, 1, 0, 1);
	}
	else SendUsageMessage(playerid, "/caranim [relax/tap]");
	return 1;
}

CMD:sit(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "BEACH", "ParkSit_M_loop", 4.0, 1, 0, 0, 0, 0);
	return 1;
}

CMD:sit2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GANGS", "leanIN", 4.0, 1, 0, 0, 0, 0);
	return 1;
}

CMD:fsit(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"GANGS","leanOUT",4.0,1,1,1,1,1);
	return 1;
}

CMD:seat(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PED", "SEAT_down", 4.0, 0, 1, 1, 1, 0);
	return 1;
}

CMD:deskbored(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"INT_OFFICE","OFF_Sit_Bored_Loop", 4.0, 0, 1, 1, 1, -1);
	return 1;
}

CMD:deskmad(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"INT_OFFICE","OFF_Sit_Crash", 4.0, 0, 1, 1, 1, -1);
	return 1;
}

CMD:deskdrink(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"FOOD","FF_Sit_Loop", 4.0, 1, 0, 0, 0, 0);
	return 1;
}

CMD:desksit(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"INT_OFFICE","OFF_Sit_Idle_Loop", 4.0, 0, 1, 1, 1, -1);
	return 1;
}

CMD:injured(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "CRACK", "crckidle1", 4.1, 0, 0, 0, 1, 0, 1);
	return 1;
}

CMD:crack2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "CRACK", "crckdeth2", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:crack4(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "CRACK", "crckdeth4", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:cover(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "ped", "cower", 3.0, 1, 0, 0, 0, 0);
	return 1;
}

CMD:crawl(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "SWAT", "Rail_fall_crawl", 4.1, 0, 1, 1, 1,1,1);
	return 1;
}

CMD:flip(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PED", "FLOOR_HIT", 4.1, 0, 0, 0, 1, 0, 1);
	return 1;
}

CMD:frontfall(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PED", "FLOOR_HIT_F", 4.1, 0, 0, 0, 1, 0, 1);
	return 1;
}

CMD:fallover(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "parachute", "FALL_skyDive_DIE", 4.1, 0, 0, 0, 1, 0, 1);
	return 1;
}

CMD:dive(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "SWIM", "Swim_Dive_Under", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:lay(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "BEACH", "bather", 4.0, 1, 0, 0, 0, 0);
	return 1;
}

CMD:flaydown(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "BEACH", "SitnWait_loop_W", 4.0, 1, 0, 0, 0, 0);
	return 1;
}

CMD:sleep(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "CRACK", "crckdeth4", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:getshot(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"PED","FLOOR_hit_f",4.1,0,1,1,1,0);
	return 1;
}

CMD:mourn(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GRAVEYARD", "MRNM_LOOP", 4.1, 0, 0, 0, 1, 0, 1);
	return 1;
}

CMD:priest(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "OTB", "wtchrace_cmon", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:washhands(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "BD_FIRE", "wash_up", 4.0, 0, 0, 0, 0, 0);
	return 1;
}

CMD:sword(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "SWORD", "sword_1", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:dishes(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "BD_FIRE", "wash_up", 4.0, 0, 0, 0, 0, 0);
	return 1;
}


CMD:crossarm(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "OTB", "WTCHRACE_IN", 4.1, 0, 0, 0, 1, 0, 1);
	return 1;
}

CMD:crossarm2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "OTB", "WTCHRACE_LOOP", 4.1, 0, 0, 0, 1, 0, 1);
	return 1;
}

CMD:crossarm3(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "COP_AMBIENT", "Coplook_loop", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:crossarm4(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "COP_AMBIENT", "Coplook_nod", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:flex(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PLAYIDLES", "shldr", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:strecth(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PLAYIDLES", "stretch", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:strecth2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PLAYIDLES", "strleg", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:rifleready(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "RIFLE", "RIFLE_load", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:robcash(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "SHOP", "SHP_Rob_GiveCash", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:robno(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "SHOP", "SHP_Rob_React", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:tired(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "FAT", "IDLE_tired", 4.0, 1, 0, 0, 0, 0);
	return 1;
}

CMD:exhausted(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PED", "IDLE_tired", 4.0, 1, 0, 0, 0, 0);
	return 1;
}

CMD:lean(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GANGS","leanIDLE", 4.0, 1, 0, 0, 0, 0);
	return 1;
}

CMD:lean2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"MISC", "Plyrlean_loop", 4.0, 0, 1, 1, 1, -1);
	return 1;
}

CMD:gsign1(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GHANDS", "GSIGN1", 4.0, 1, 1, 0, 1, 1, 1);
	return 1;
}

CMD:gsign2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GHANDS", "GSIGN1LH", 4.0, 1, 1, 0, 1, 1, 1);
	return 1;
}

CMD:gsign3(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GHANDS", "GSIGN2", 4.0, 1, 1, 0, 1, 1, 1);
	return 1;
}

CMD:gsign4(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GHANDS", "GSIGN2LH", 4.0, 1, 1, 0, 1, 1, 1);
	return 1;
}

CMD:gsign5(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GHANDS", "GSIGN3", 4.0, 1, 1, 0, 1, 1, 1);
	return 1;
}

CMD:gsign6(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GHANDS", "GSIGN3LH", 4.0, 1, 1, 0, 1, 1, 1);
	return 1;
}

CMD:gsign7(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GHANDS", "GSIGN4", 4.0, 1, 1, 0, 1, 1, 1);
	return 1;
}

CMD:gsign8(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GHANDS", "GSIGN4LH", 4.0, 1, 1, 0, 1, 1, 1);
	return 1;
}

CMD:gsign9(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GHANDS", "GSIGN5", 4.0, 1, 1, 0, 1, 1, 1);
	return 1;
}

CMD:punch(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"FIGHT_B","FightB_G",4.0,0,0,0,0,0);
	return 1;
}

CMD:fallkick(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"FIGHT_D","FightD_G",4.0,0,0,0,0,0);
	return 1;
}

CMD:bitchslap(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "MISC", "bitchslap", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:kickdoor(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"POLICE","Door_Kick",4.0,0,0,0,0,0);
	return 1;
}

CMD:getback(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"PED","gas_cwr",4.1,1,1,1,1,1);
	return 1;
}

CMD:kickhim(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"GANGS","shake_carK",4.0,0,0,0,0,0);
	return 1;
}

CMD:followme(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"WUZI","Wuzi_follow",4.1,0,1,1,1,1);
	return 1;
}

CMD:greet1(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GANGS", "hndshkaa", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:greet2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GANGS", "hndshkba", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:greet3(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GANGS", "hndshkca", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:greet4(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GANGS", "hndshkcb", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:greet5(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GANGS", "hndshkda", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:greet6(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GANGS", "hndshkea", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:greet7(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GANGS", "hndshkfa", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:kiss(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "KISSING", "Grlfrd_Kiss_01", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:salute(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GHANDS", "GSIGN5LH", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:forwardpanic(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "ON_LOOKERS", "lkup_in", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:forwardlook(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "ON_LOOKERS", "lkup_loop", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:forwardwave(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "ON_LOOKERS", "lkup_out", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:wave(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PED", "ENDCHAT_03", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:waveback(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PED", "ENDCHAT_01", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:fuckyou(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PED", "fucku", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:fuckyou2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"RIOT","RIOT_FUKU",4.1,1,1,1,1,1);
	return 1;
}

CMD:argue(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "KISSING", "GF_CarArgue_01", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:argue2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "KISSING", "GF_CarArgue_02", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:no(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GANGS", "INVITE_NO", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:agree(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GANGS", "INVITE_YES", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:facepalm(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"MISC","plyr_shkhead",4.0,0,0,0,0,0);
	return 1;
}

CMD:slapass(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"SWEET","sweet_ass_slap",4.0,0,0,0,0,0);
	return 1;
}

CMD:what(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "RIOT", "RIOT_ANGRY", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:bat(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"CRACK","Bbalbat_Idle_01", 4.0, 1, 0, 0, 0, 0);
	return 1;
}

CMD:bat2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"CRACK","Bbalbat_Idle_02", 4.0, 1, 0, 0, 0, 0);
	return 1;
}

CMD:riot1(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "RIOT", "RIOT_ANGRY", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:riot2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"RIOT","RIOT_CHANT",4.1,1,1,1,1,1);
	return 1;
}

CMD:riot3(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"RIOT","RIOT_PUNCHES",4.1,1,1,1,1,1);
	return 1;
}

CMD:comecross(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "OTB", "WTCHRACE_CMON", 4.1, 0, 0, 0, 1, 0, 1);
	return 1;
}

CMD:comeon(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "POLICE", "CopTraf_Come", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:shouts(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"RIOT","RIOT_shout",4.1,1,1,1,1,1);
	return 1;
}

CMD:provoke(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "RIOT", "RIOT_CHALLENGE", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:chant(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"RIOT","RIOT_CHANT",4.1,1,1,1,1,1);
	return 1;
}

CMD:push(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"GANGS","shake_cara",4.0,0,0,0,0,0);
	return 1;
}

CMD:getsearched(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"ROB_BANK","CAT_Safe_Rob",4.0,1,0,0,0,0);
	return 1;
}

CMD:sipdrink(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "BAR", "DNK_STNDM_LOOP", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:claphand(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "DANCING", "bd_clap", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:cry(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GRAVEYARD", "MRNF_LOOP", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:dropflag(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "CAR", "flag_drop", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:spray(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "SPRAYCAN", "spraycan_fire", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:spray2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "SPRAYCAN", "spraycan_full", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:cpr(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "MEDIC", "CPR", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:leftride(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "FOOD", "FF_Dam_Left", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:rightride(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "FOOD", "FF_Dam_Right", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:laugh(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "RAPPING", "Laugh_01", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:scared(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PED", "sprint_panic", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:idle(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GANGS", "DEALER_IDLE", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:old(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PED", "idlestance_old", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:scratchballs(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"MISC","scratchballs_01",4.0,0,0,0,0,0);
	return 1;
}

CMD:roadcross(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PED", "roadcross", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:openleft(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PED", "CAR_open_LHS", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:openright(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PED", "CAR_open_RHS", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:checkout(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GRAFFITI", "graffiti_Chkout", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:payshop(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "INT_SHOP", "shop_pay", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:crossroad(playerid, params[])
{
	if (!AnimationCheck(playerid))return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");

	new animid;
   	if(sscanf(params,"d",animid)) return SendServerMessage(playerid, "/crossroad [1 (klasik), 2 (kadÄ±n), 3 (Ã§ete), 4 (yaÅŸlÄ±)]");
	switch(animid)
	{
  		case 1: PlayAnimation(playerid, "PED", "roadcross", 4.0, 0, 0, 0, 1, 1, 1);
        case 2: PlayAnimation(playerid, "PED", "roadcross_female", 4.0, 0, 0, 0, 1, 1, 1);
        case 3: PlayAnimation(playerid, "PED", "roadcross_gang", 4.0, 0, 0, 0, 1, 1, 1);
        case 4: PlayAnimation(playerid, "PED", "roadcross_old", 4.0, 0, 0, 0, 1, 1, 1);
  		default: SendServerMessage(playerid, "/crossroad [1 (klasik), 2 (kadÄ±n), 3 (Ã§ete), 4 (yaÅŸlÄ±)]");
   	}
	return 1;
}

CMD:sneak(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PED", "Player_Sneak_walkstart", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:comready2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PED", "WALK_armed", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:wuzi(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PED", "Walk_Wuzi", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:aim(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "SHOP", "SHP_Gun_Aim", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:taxil(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"MISC","Hiker_Pose_L",4.0,0,1,1,1,0);
	return 1;
}

CMD:taxir(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"MISC","Hiker_Pose",4.0,0,1,1,1,0);
	return 1;
}

CMD:rifleup(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "MISC", "PASS_Rifle_Ped", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:camera1(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "CAMERA", "CAMCRCH_CMON", 4.1, 0, 0, 0, 1, 0, 1);
	return 1;
}

CMD:camera2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "CAMERA", "CAMCRCH_IDLELOOP", 4.1, 0, 0, 0, 1, 0, 1);
	return 1;
}

CMD:camera3(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "CAMERA", "CAMSTND_TO_CAMCRCH", 4.1, 0, 0, 0, 1, 0, 1);
	return 1;
}

CMD:kneel1(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "SHOTGUN", "shotgun_crouchfire", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:kneel2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "SHOTGUN", "shotgun_fire_poor", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:crouchrifle(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PYTHON", "python_fire", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:crouchpicture(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "CAMERA", "camstnd_to_camcrch", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:shotgun(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "SHOTGUN", "shotgun_fire", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:shottyreload(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "COLT45", "sawnoff_reload", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:creload(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "SILENCED", "CrouchReload", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:crouchreload(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PYTHON", "PYTHON_CROUCHRELOAD", 4.1, 0, 0, 0, 1, 0, 1);
	return 1;
}

CMD:reload(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PYTHON", "PYTHON_RELOAD", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:aimfast(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "SNIPER", "WEAPON_SNIPER", 4.1, 0, 0, 0, 1, 0, 1);
	return 1;
}

CMD:aimshoot(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "HEIST9", "swt_wllshoot_in_L", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:aimshoot2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "HEIST9", "swt_wllshoot_in_R", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:crouchshoot(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PYTHON", "PYTHON_CROUCHFIRE", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:win1(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"OTB","wtchrace_win",4.1,0,1,1,1,0);
	return 1;
}

CMD:win2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"OTB","wtchrace_cmon",4.1,0,1,1,1,0);
	return 1;
}

CMD:lose(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"OTB","wtchrace_lose",4.1,0,1,1,1,0);
	return 1;
}

CMD:camshot1(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "BSKTBALL", "BBALL_def_jump_shot", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:dunk(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "BSKTBALL", "BBALL_Dnk", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:defense(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "BSKTBALL", "BBALL_def_loop", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:defensel(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "BSKTBALL", "BBALL_def_stepL", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:defenser(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "BSKTBALL", "BBALL_def_stepR", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:dunk2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "BSKTBALL", "BBALL_Dnk_Gli", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:clockshot(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "BSKTBALL", "BBALL_idle", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:fakeshot(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "BSKTBALL", "BBALL_Jump_Cancel", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:jumpshot(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "BSKTBALL", "BBALL_Jump_Shot", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:pickupball(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "BSKTBALL", "BBALL_pickup", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:throw(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid,"GRENADE","WEAPON_throwu",3.0,0,0,0,0,0);
	return 1;
}

CMD:dribble(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "BSKTBALL", "BBALL_run", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:dribble2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "BSKTBALL", "BBALL_walk", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:dribble3(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "BSKTBALL", "BBALL_walk_start", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:fixcar(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "CAR", "Fixn_Car_Loop", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:fixcarout(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "CAR", "Fixn_Car_Out", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:box1(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GYMNASIUM", "GYMshadowbox", 4.0, 1, 0, 0, 0, 0);
	return 1;
}

CMD:box2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "BOX", "boxhipin", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:shadowbox(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "GYMNASIUM", "GYMSHADOWBOX", 4.1, 0, 0, 0, 1, 0, 1);
	return 1;
}

CMD:dodge(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PED", "FightA_block", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:kungfu1(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "FIGHT_B", "FightB_1", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:kungfu2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "FIGHT_B", "FightB_2", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:kungfu3(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "FIGHT_B", "FightB_3", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:kungfublock(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "FIGHT_B", "FightB_block", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:kungfustomp(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "FIGHT_B", "FightB_G", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:flykick(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "FIGHT_B", "FightB_IDLE", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:rap1(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "RAPPING", "RAP_A_LOOP", 4.1, 0, 0, 0, 1, 0, 1);
	return 1;
}

CMD:rap2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "RAPPING", "RAP_B_LOOP", 4.1, 0, 0, 0, 1, 0, 1);
	return 1;
}

CMD:rap3(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "RAPPING", "RAP_C_LOOP", 4.1, 0, 0, 0, 1, 0, 1);
	return 1;
}

CMD:deal(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "DEALER", "DEALER_DEAL", 4.0, 0, 0, 0, 0, 0);
	return 1;
}

CMD:lookout(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "COP_AMBIENT", "Coplook_in", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:lookout2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "COP_AMBIENT", "Coplook_loop", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:lookout3(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "COP_AMBIENT", "Coplook_nod", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:dealerstance(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "DEALER", "DEALER_DEAL", 4.0, 0, 0, 0, 0, 0);
	return 1;
}

CMD:dealerstance2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "DEALER", "DEALER_IDLE_01", 4.0, 0, 0, 0, 0, 0);
	return 1;
}

CMD:dealerstance3(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "DEALER", "DEALER_IDLE_02", 4.0, 0, 0, 0, 0, 0);
	return 1;
}

CMD:dealerstance4(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "DEALER", "DEALER_IDLE_03", 4.0, 0, 0, 0, 0, 0);
	return 1;
}

CMD:getupf(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PED", "getup", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:getupb(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PED", "getup_front", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:dance1(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE1);
	return 1;
}

CMD:dance2(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE2);
	return 1;
}

CMD:dance3(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE3);
	return 1;
}

CMD:dance4(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE4);
	return 1;
}

CMD:dance5(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "DANCING", "dance_loop", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:dance6(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "DANCING", "DAN_Left_A", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:dance7(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "DANCING", "DAN_Right_A", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:dance8(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "DANCING", "DAN_Loop_A", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:dance9(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "DANCING", "DAN_Up_A", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:dance10(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "DANCING", "DAN_Down_A", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:dance11(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "DANCING", "dnce_M_a", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:dance12(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "DANCING", "dnce_M_e", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:dance13(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "DANCING", "dnce_M_b", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:dance14(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "DANCING", "dnce_M_c", 4.1, 0, 0, 0, 0, 0, 1);
	return 1;
}

CMD:riflestance(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "PED", "IDLE_ARMED", 4.0, 1, 1, 0, 1, 1, 1);
	return 1;
}
*/

CMD:liftup(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "CARRY", "liftup", 3.0, 0, 0, 0, 0, 0);
	return 1;
}

stock AnimOynat(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, lp = 0)
{
	PlayerData[playerid][pPlayingAnimation] = true;

	time = 0;
	freeze = 1;
	return ApplyAnimation(playerid, animlib, animname, fDelta, loop, lockx, locky, freeze, time, lp);
}

stock AnimasyonBoz(playerid)
{
    if(IsPlayerInAnyVehicle(playerid))
    {
        new tempVID = GetPVarInt(playerid, "lastVehicle"),
        tempSEAT = GetPVarInt(playerid, "lastSeat");

        AnimOynat(playerid, "CAR_CHAT", "CAR_Sc1_FR", 4.0, 0, 0, 0, 1, 1, 1);
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
        SetPlayerArmedWeapon(playerid, 0);
        PutPlayerInVehicle(playerid, tempVID, tempSEAT);
        PlayerData[playerid][pPlayingAnimation] = false;
        return 1;
    }

    ClearAnimations(playerid);
    ApplyAnimation(playerid, "CARRY", "crry_prtial", 2.0, 0, 0, 0, 0, 0);
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
    PlayerData[playerid][pPlayingAnimation] = false;
    return 1;
}

CMD:stopanim(playerid, params[])
	return cmd_animboz(playerid, "");

CMD:animdur(playerid, params[])
	return cmd_animboz(playerid, "");

CMD:animdurdur(playerid, params[])
	return cmd_animboz(playerid, "");

CMD:animboz(playerid, params[])
{
	if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CUFFED)
		return SendServerMessage(playerid, "Keleppeliyken bu komutu kullanamazsýn.");

	AnimasyonBoz(playerid);
	return 1;
}

CMD:animlist(playerid)
	return cmd_animasyonlistesi(playerid);

CMD:animasyonlar(playerid)
	return cmd_animasyonlistesi(playerid);

CMD:anims(playerid)
	return cmd_animasyonlistesi(playerid);

CMD:animasyonlistesi(playerid)
{
	SendClientMessage(playerid, COLOR_RED, "-----------------------------------------------------------");
	SendServerMessage(playerid, "/bdfire, /beach, /benchpress, /lean, /rap, /fall, /hide, /stop");
	SendServerMessage(playerid, "/bomber, /bsktball, /buddy, /camera, /carry, /carchat, /casino, /chainsaw");
	SendServerMessage(playerid, "/clothes, /coach, /colt, /copambient, /copdvbyz, /ancrack, /crack, /crib");
	SendServerMessage(playerid, "/dealer, /dildo, /dodge,/fat, /bar, /basket, /facepalm, /damjump, /dancing");
	SendServerMessage(playerid, "/flame, /flowers, /food, /freeweights, /gangs, /ghands, /ghetto, /gog, /graffity");
	SendServerMessage(playerid, "/graveyard, /grenade, /gym, /heist, /inthouse, /intoffice, /intshop");
	SendServerMessage(playerid, "/kissing, /knife, /lowrider, /mdchase, /mddend, /medic, /playidles");
	SendServerMessage(playerid, "/misc, /musculcar, /onlookers, /otb, /park, /paulnmac, /ped");
	SendServerMessage(playerid, "/police, /pool, /python, /rapping, /rifle, /riot, /robbank, /rocket");
	SendServerMessage(playerid, "/ryder, /shamal, /shop, /shotgun, /silenced, /skate, /smoking, /sniper, /spraycan");
	SendServerMessage(playerid, "/strip, /sunbathe, /answat, /sweet, /sword, /tattoos, /tec, /truck, /uzi");
	SendServerMessage(playerid, "/van, /vending, /wuzi, /snm, /blowjob, /sex, /dance, /sit, /handsup");
	SendServerMessage(playerid, "/anwalk, /woman, /turn, /taphand, /crossroad, /phone, /taxi, /tired");
	SendServerMessage(playerid, "/hit, /fight, /idle, /fucku, /drive, /cower, /climb, /airport");
	SendServerMessage(playerid, "/crossarms, /cry, /drunk, /sleep, /lean, /robman, /gift, /walk");
	SendClientMessage(playerid, COLOR_RED, "-----------------------------------------------------------");
	return 1;
}

CMD:handsup(playerid, params[]) return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_HANDSUP), SetPVarInt(playerid, "anim", 1);

CMD:airport(playerid, params[]) return AnimOynat(playerid, "AIRPORT", "thrw_barl_thrw", 4.0, 0, 0, 0, 1, 1, 1);

CMD:crossarms(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "BAR", "Barcustom_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "COP_AMBIENT", "Coplook_loop", 4.1, 0, 1, 1, 1, 0, 1);
		case 3: AnimOynat(playerid, "GRAVEYARD", "prst_loopa", 4.1, 0, 0, 0, 0, 0, 1);
		case 4: AnimOynat(playerid, "GRAVEYARD", "mrnM_loop", 4.1, 0, 0, 0, 0, 0, 1);
		case 5: AnimOynat(playerid, "DEALER", "DEALER_IDLE", 4.1, 0, 1, 1, 1, 0, 1);
		default: SendServerMessage(playerid, "/crossarms [1-5]");
	}
	return 1;
}

CMD:bar(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "BAR", "Barcustom_get", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "BAR", "Barcustom_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "BAR", "Barcustom_order", 4.1, 0, 1, 1, 0, 0, 1);
		case 4: AnimOynat(playerid, "BAR", "Barserve_bottle", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "BAR", "Barserve_give", 4.1, 0, 1, 1, 0, 0, 1);
		case 6: AnimOynat(playerid, "BAR", "Barserve_glass", 4.1, 0, 1, 1, 0, 0, 1);
		case 7: AnimOynat(playerid, "BAR", "Barserve_in", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "BAR", "Barserve_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "BAR", "Barserve_order", 4.1, 0, 1, 1, 0, 0, 1);
		case 10: AnimOynat(playerid, "BAR", "dnk_stndF_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "BAR", "dnk_stndM_loop", 4.1, 0, 1, 1, 0, 0, 1);
		case 12: AnimOynat(playerid, "BAR", "BARman_idle", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/bar [1-12]");
	}
	return 1;
}

CMD:basket(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "BASEBALL", "Bat_1", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "BASEBALL", "Bat_2", 4.1, 0, 1, 1, 0, 0, 1);
		case 3: AnimOynat(playerid, "BASEBALL", "Bat_2", 4.1, 0, 1, 1, 0, 0, 1);
		case 4: AnimOynat(playerid, "BASEBALL", "Bat_4", 4.1, 0, 1, 1, 0, 0, 1);
		case 5: AnimOynat(playerid, "BASEBALL", "Bat_block", 4.1, 0, 1, 1, 0, 0, 1);
		case 6: AnimOynat(playerid, "BASEBALL", "Bat_Hit_1", 4.1, 0, 1, 1, 0, 0, 1);
		case 7: AnimOynat(playerid, "BASEBALL", "Bat_Hit_2", 4.1, 0, 1, 1, 0, 0, 1);
		case 8: AnimOynat(playerid, "BASEBALL", "Bat_Hit_3", 4.1, 0, 1, 1, 0, 0, 1);
		case 9: AnimOynat(playerid, "BASEBALL", "Bat_IDLE", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "BASEBALL", "Bat_M", 4.1, 0, 1, 1, 0, 0, 1);
		case 11: AnimOynat(playerid, "BASEBALL", "BAT_PART", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/basket [1-11]");
	}
	return 1;
}

CMD:sa(playerid, params[]) return cmd_animboz(playerid, params);

CMD:otur(playerid, params[]) return cmd_sit(playerid, params);
CMD:sit(playerid,params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "ped", "SEAT_down", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid,"BEACH", "ParkSit_M_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid,"INT_OFFICE", "OFF_Sit_Bored_Loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid,"MISC","Seat_talk_02", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "Attractors", "Stepsit_in", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "Attractors", "Stepsit_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "Attractors", "Stepsit_out", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "INT_HOUSE", "LOU_Loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "JST_BUISNESS", "girl_02", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "MISC", "SEAT_LR", 4.1, 0, 1, 1, 0, 1, 1);
		default: SendServerMessage(playerid, "/sit [1-10]");
	}
	return 1;
}

CMD:bdfire(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "BD_FIRE", "BD_Fire1", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "BD_FIRE", "BD_Fire2", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "BD_FIRE", "BD_Fire3", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "BD_FIRE", "wash_up", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "BD_FIRE", "BD_Panic_02", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "BD_FIRE", "BD_Panic_03", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "BD_FIRE", "BD_Panic_04", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "BD_FIRE", "BD_Panic_Loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "BD_FIRE", "M_smklean_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "BD_FIRE", "M_smklean_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "BD_FIRE", "Playa_Kiss_03", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "BD_FIRE", "BD_Panic_01", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/bdfire [1-12]");
	}
	return 1;
}

CMD:beach(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "BEACH", "bather", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "BEACH", "Lay_Bac_Loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "BEACH", "BD_Fire3", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "BEACH", "SitnWait_loop_W", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/beach [1-4]");
	}
	return 1;
}

CMD:benchpress(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "benchpress", "gym_bp_celebrate", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "benchpress", "gym_bp_down", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "benchpress", "gym_bp_getoff", 4.1, 0, 1, 1, 0, 0, 1);
		case 4: AnimOynat(playerid, "benchpress", "gym_bp_geton", 4.1, 0, 1, 1, 0, 0, 1);
		case 5: AnimOynat(playerid, "benchpress", "gym_bp_up_A", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "benchpress", "gym_bp_up_B", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "benchpress", "gym_bp_up_smooth", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/benchpress [1-7]");
	}
	return 1;
}

CMD:bomber(playerid, params[]) return AnimOynat(playerid, "BOMBER", "BOM_Plant_Loop", 4.0, 0, 0, 0, 1, 1, 1);

CMD:bsktball(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "BSKTBALL", "BBALL_def_jump_shot", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "BSKTBALL", "BBALL_def_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "BSKTBALL", "BBALL_def_stepL", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "BSKTBALL", "BBALL_def_stepR", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "BSKTBALL", "BBALL_Dnk", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "BSKTBALL", "BBALL_Dnk_Gli", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "BSKTBALL", "BBALL_Dnk_Gli_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "BSKTBALL", "BBALL_Dnk_Lnch", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "BSKTBALL", "BBALL_Dnk_Lnch_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "BSKTBALL", "BBALL_Dnk_Lnd", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "BSKTBALL", "BBALL_Dnk_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "BSKTBALL", "BBALL_idle", 4.0, 0, 0, 0, 1, 1, 1);
		case 13: AnimOynat(playerid, "BSKTBALL", "BBALL_idle2", 4.0, 0, 0, 0, 1, 1, 1);
		case 14: AnimOynat(playerid, "BSKTBALL", "BBALL_idle2_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 15: AnimOynat(playerid, "BSKTBALL", "BBALL_idleloop", 4.0, 0, 0, 0, 1, 1, 1);
		case 16: AnimOynat(playerid, "BSKTBALL", "BBALL_idleloop_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 17: AnimOynat(playerid, "BSKTBALL", "BBALL_idle_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 18: AnimOynat(playerid, "BSKTBALL", "BBALL_Jump_Cancel", 4.0, 0, 0, 0, 1, 1, 1);
		case 19: AnimOynat(playerid, "BSKTBALL", "BBALL_Jump_Cancel_0", 4.0, 0, 0, 0, 1, 1, 1);
		case 20: AnimOynat(playerid, "BSKTBALL", "BBALL_Jump_End", 4.0, 0, 0, 0, 1, 1, 1);
		case 21: AnimOynat(playerid, "BSKTBALL", "BBALL_Jump_Shot", 4.0, 0, 0, 0, 1, 1, 1);
		case 22: AnimOynat(playerid, "BSKTBALL", "BBALL_Jump_Shot_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 23: AnimOynat(playerid, "BSKTBALL", "BBALL_Net_Dnk_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 24: AnimOynat(playerid, "BSKTBALL", "BBALL_pickup", 4.0, 0, 0, 0, 1, 1, 1);
		case 25: AnimOynat(playerid, "BSKTBALL", "BBALL_pickup_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 26: AnimOynat(playerid, "BSKTBALL", "BBALL_react_miss", 4.0, 0, 0, 0, 1, 1, 1);
		case 27: AnimOynat(playerid, "BSKTBALL", "BBALL_react_score", 4.0, 0, 0, 0, 1, 1, 1);
		case 28: AnimOynat(playerid, "BSKTBALL", "BBALL_run", 4.0, 0, 0, 0, 1, 1, 1);
		case 29: AnimOynat(playerid, "BSKTBALL", "BBALL_run_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 30: AnimOynat(playerid, "BSKTBALL", "BBALL_SkidStop_L", 4.0, 0, 0, 0, 1, 1, 1);
		case 31: AnimOynat(playerid, "BSKTBALL", "BBALL_SkidStop_L_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 32: AnimOynat(playerid, "BSKTBALL", "BBALL_SkidStop_R", 4.0, 0, 0, 0, 1, 1, 1);
		case 33: AnimOynat(playerid, "BSKTBALL", "BBALL_SkidStop_R_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 34: AnimOynat(playerid, "BSKTBALL", "BBALL_walk", 4.0, 0, 0, 0, 1, 1, 1);
		case 35: AnimOynat(playerid, "BSKTBALL", "BBALL_WalkStop_L", 4.0, 0, 0, 0, 1, 1, 1);
		case 36: AnimOynat(playerid, "BSKTBALL", "BBALL_WalkStop_L_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 37: AnimOynat(playerid, "BSKTBALL", "BBALL_WalkStop_R", 4.0, 0, 0, 0, 1, 1, 1);
		case 38: AnimOynat(playerid, "BSKTBALL", "BBALL_WalkStop_R_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 39: AnimOynat(playerid, "BSKTBALL", "BBALL_walk_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 40: AnimOynat(playerid, "BSKTBALL", "BBALL_walk_start", 4.0, 0, 0, 0, 1, 1, 1);
		case 41: AnimOynat(playerid, "BSKTBALL", "BBALL_walk_start_O", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/bsktball [1-41]");
	}
	return 1;
}

CMD:buddy(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "BUDDY", "buddy_crouchfire", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "BUDDY", "buddy_crouchreload", 4.1, 0, 1, 1, 0, 0, 1);
		case 3: AnimOynat(playerid, "BUDDY", "buddy_fire", 4.1, 0, 1, 1, 0, 0, 1);
		case 4: AnimOynat(playerid, "BUDDY", "buddy_fire_poor", 4.1, 0, 1, 1, 0, 0, 1);
		case 5: AnimOynat(playerid, "BUDDY", "buddy_reload", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/buddy [1-5]");
	}
	return 1;
}

CMD:camera(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{

		case 1: AnimOynat(playerid, "CAMERA", "camcrch_cmon", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "CAMERA", "camcrch_idleloop", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "CAMERA", "picstnd_take", 4.1, 0, 1, 1, 0, 0, 1);
		case 4: AnimOynat(playerid, "CAMERA", "camcrch_to_camstnd", 4.1, 0, 1, 0, 0, 0, 1);
		case 5: AnimOynat(playerid, "CAMERA", "camstnd_cmon", 4.1, 0, 1, 1, 0, 0, 1);
		case 6: AnimOynat(playerid, "CAMERA", "camstnd_idleloop", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "CAMERA", "camstnd_lkabt", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "CAMERA", "camstnd_to_camcrch", 4.1, 0, 1, 1, 0, 0, 1);
		case 9: AnimOynat(playerid, "CAMERA", "piccrch_in", 4.1, 0, 1, 1, 0, 0, 1);
		case 10: AnimOynat(playerid, "CAMERA", "piccrch_out", 4.1, 0, 1, 1, 0, 0, 1);
		case 11: AnimOynat(playerid, "CAMERA", "piccrch_take", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "CAMERA", "picstnd_in", 4.1, 0, 1, 1, 0, 0, 1);
		case 13: AnimOynat(playerid, "CAMERA", "picstnd_out", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/camera [1-13]");
	}
	return 1;
}

CMD:carry(playerid, params[]) return AnimOynat(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 1, 1, 1);

CMD:carchat(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "CAR_CHAT", "carfone_in", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "CAR_CHAT", "carfone_loopA", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "CAR_CHAT", "carfone_loopA_to_B", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "CAR_CHAT", "carfone_loopB", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "CAR_CHAT", "carfone_loopB_to_A", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "CAR_CHAT", "carfone_out", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "CAR_CHAT", "CAR_Sc1_BL", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "CAR_CHAT", "CAR_Sc1_BR", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "CAR_CHAT", "CAR_Sc1_FL", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "CAR_CHAT", "CAR_Sc1_FR", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "CAR_CHAT", "CAR_Sc2_FL", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "CAR_CHAT", "CAR_Sc3_BR", 4.0, 0, 0, 0, 1, 1, 1);
		case 13: AnimOynat(playerid, "CAR_CHAT", "CAR_Sc3_FL", 4.0, 0, 0, 0, 1, 1, 1);
		case 14: AnimOynat(playerid, "CAR_CHAT", "CAR_Sc3_FR", 4.0, 0, 0, 0, 1, 1, 1);
		case 15: AnimOynat(playerid, "CAR_CHAT", "CAR_Sc4_BL", 4.0, 0, 0, 0, 1, 1, 1);
		case 16: AnimOynat(playerid, "CAR_CHAT", "CAR_Sc4_BR", 4.0, 0, 0, 0, 1, 1, 1);
		case 17: AnimOynat(playerid, "CAR_CHAT", "CAR_Sc4_FL", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/carchat [1-17]");
	}
	return 1;
}

CMD:casino(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "CASINO", "cards_in", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "CASINO", "cards_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "CASINO", "cards_lose", 4.1, 0, 1, 1, 0, 0, 1);
		case 4: AnimOynat(playerid, "CASINO", "wof", 4.1, 0, 1, 1, 0, 0, 1);
		case 5: AnimOynat(playerid, "CASINO", "cards_pick_01", 4.1, 0, 1, 1, 0, 0, 1);
		case 6: AnimOynat(playerid, "CASINO", "cards_pick_02", 4.10, 0, 0, 0, 0, 0, 1);
		case 7: AnimOynat(playerid, "CASINO", "cards_raise", 4.1, 0, 1, 1, 0, 0, 1);
		case 8: AnimOynat(playerid, "CASINO", "cards_win", 4.1, 0, 1, 1, 0, 0, 1);
		case 9: AnimOynat(playerid, "CASINO", "dealone", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "CASINO", "manwinb", 4.1, 0, 1, 1, 0, 0, 1);
		case 11: AnimOynat(playerid, "CASINO", "manwind", 4.1, 0, 1, 1, 0, 0, 1);
		case 12: AnimOynat(playerid, "CASINO", "Roulette_bet", 4.1, 0, 1, 1, 0, 0, 1);
		case 13: AnimOynat(playerid, "CASINO", "Roulette_in", 4.1, 0, 1, 1, 0, 0, 1);
		case 14: AnimOynat(playerid, "CASINO", "Roulette_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 15: AnimOynat(playerid, "CASINO", "Roulette_lose", 4.0, 0, 0, 0, 1, 1, 1);
		case 16: AnimOynat(playerid, "CASINO", "Roulette_out", 4.1, 0, 1, 1, 0, 0, 1);
		case 17: AnimOynat(playerid, "CASINO", "Roulette_win", 4.0, 0, 0, 0, 1, 1, 1);
		case 18: AnimOynat(playerid, "CASINO", "Slot_bet_01", 4.0, 0, 0, 0, 1, 1, 1);
		case 19: AnimOynat(playerid, "CASINO", "Slot_bet_02", 4.0, 0, 0, 0, 1, 1, 1);
		case 20: AnimOynat(playerid, "CASINO", "Slot_in", 4.1, 0, 1, 1, 0, 0, 1);
		case 21: AnimOynat(playerid, "CASINO", "Slot_lose_out", 4.1, 0, 1, 1, 0, 0, 1);
		case 22: AnimOynat(playerid, "CASINO", "Slot_Plyr", 4.0, 0, 0, 0, 1, 1, 1);
		case 23: AnimOynat(playerid, "CASINO", "Slot_wait", 4.0, 0, 0, 0, 1, 1, 1);
		case 24: AnimOynat(playerid, "CASINO", "Slot_win_out", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/casino [1-24]");
	}
	return 1;
}

CMD:chainsaw(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "CHAINSAW", "CSAW_1", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "CHAINSAW", "CSAW_2", 4.1, 0, 1, 1, 0, 0, 1);
		case 3: AnimOynat(playerid, "CHAINSAW", "CSAW_3", 4.1, 0, 1, 1, 0, 0, 1);
		case 4: AnimOynat(playerid, "CHAINSAW", "CSAW_G", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "CHAINSAW", "CSAW_Hit_1", 4.1, 0, 1, 1, 0, 0, 1);
		case 6: AnimOynat(playerid, "CHAINSAW", "CSAW_Hit_2", 4.1, 0, 1, 1, 0, 0, 1);
		case 7: AnimOynat(playerid, "CHAINSAW", "CSAW_Hit_3", 4.1, 0, 1, 1, 0, 0, 1);
		case 8: AnimOynat(playerid, "CHAINSAW", "csaw_part", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "CHAINSAW", "IDLE_csaw", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "CHAINSAW", "WEAPON_csaw", 4.1, 0, 1, 1, 0, 0, 1);
		case 11: AnimOynat(playerid, "CHAINSAW", "WEAPON_csawlo", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/chainsaw [1-11]");
	}
	return 1;
}


CMD:clothes(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "CLOTHES", "CLO_Buy", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "CLOTHES", "CLO_Pose_Hat", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "CLOTHES", "CLO_Pose_Legs", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "CLOTHES", "CLO_Pose_Loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "CLOTHES", "CLO_Pose_Watch", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/clothes [1-5]");
	}
	return 1;
}

CMD:coach(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "COACH", "COACH_inL", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "COACH", "COACH_inR", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "COACH", "COACH_outL", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "COACH", "COACH_outR", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/coach [1-4]");
	}
	return 1;
}

CMD:colt(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "COLT45", "2guns_crouchfire", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "COLT45", "colt45_crouchfire", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "COLT45", "colt45_crouchreload", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "COLT45", "colt45_fire", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "COLT45", "colt45_fire_2hands", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "COLT45", "colt45_reload", 4.1, 0, 1, 1, 1, 0, 1);
		case 7: AnimOynat(playerid, "COLT45", "sawnoff_reload", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/colt [1-7]");
	}
	return 1;
}

CMD:copambient(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "COP_AMBIENT", "Copbrowse_in", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "COP_AMBIENT", "Copbrowse_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "COP_AMBIENT", "Copbrowse_nod", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "COP_AMBIENT", "Copbrowse_out", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "COP_AMBIENT", "Copbrowse_shake", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "COP_AMBIENT", "Coplook_think", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "COP_AMBIENT", "Coplook_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "COP_AMBIENT", "Coplook_nod", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "COP_AMBIENT", "Coplook_watch", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "COP_AMBIENT", "Coplook_shake", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/copa [1-10]");
	}
	return 1;
}

CMD:copdvbyz(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "COP_DVBYZ", "COP_Dvby_B", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "COP_DVBYZ", "COP_Dvby_FT", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "COP_DVBYZ", "COP_Dvby_L", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "COP_DVBYZ", "COP_Dvby_R", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/copdvb [1-4]");
	}
	return 1;
}

CMD:ancrack(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "CRACK", "Bbalbat_Idle_01", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "CRACK", "Bbalbat_Idle_02", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "CRACK", "crckdeth1", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "CRACK", "crckdeth2", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "CRACK", "crckdeth3", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "CRACK", "crckdeth4", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "CRACK", "crckidle1", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "CRACK", "crckidle2", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "CRACK", "crckidle3", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "CRACK", "crckidle4", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/ancrack [1-10]");
	}
	return 1;
}

CMD:crib(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "CRIB", "CRIB_Console_Loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "CRIB", "CRIB_Use_Switch", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "CRIB", "PED_Console_Loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "CRIB", "PED_Console_Loose", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "CRIB", "PED_Console_Win", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/crib [1-5]");
	}
	return 1;
}

CMD:damjump(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "DAM_JUMP", "DAM_Dive_Loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "DAM_JUMP", "DAM_Land", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "DAM_JUMP", "DAM_Launch", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "DAM_JUMP", "Jump_Roll", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "DAM_JUMP", "SF_JumpWall", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/damjump [1-5]");
	}
	return 1;
}

CMD:dancing(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "DANCING", "bd_clap", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "DANCING", "bd_clap1", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "DANCING", "dance_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "DANCING", "DAN_Down_A", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "DANCING", "DAN_Left_A", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "DANCING", "DAN_Loop_A", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "DANCING", "DAN_Right_A", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "DANCING", "DAN_Up_A", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "DANCING", "dnce_M_a", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "DANCING", "dnce_M_b", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "DANCING", "dnce_M_c", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "DANCING", "dnce_M_d", 4.0, 0, 0, 0, 1, 1, 1);
		case 13: AnimOynat(playerid, "DANCING", "dnce_M_e", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/dance [1-13]");
	}
	return 1;
}

CMD:dealer(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "DEALER", "DEALER_DEAL", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "DEALER", "DEALER_IDLE", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "DEALER", "DEALER_IDLE_01", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "DEALER", "DEALER_IDLE_02", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "DEALER", "DEALER_IDLE_03", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "DEALER", "DRUGS_BUY", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "DEALER", "shop_pay", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/dealer [1-7]");
	}
	return 1;
}

CMD:dildo(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "DILDO", "DILDO_1", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "DILDO", "DILDO_2", 4.1, 0, 1, 1, 0, 0, 1);
		case 3: AnimOynat(playerid, "DILDO", "DILDO_3", 4.1, 0, 1, 1, 0, 0, 1);
		case 4: AnimOynat(playerid, "DILDO", "DILDO_block", 4.1, 0, 1, 1, 0, 0, 1);
		case 5: AnimOynat(playerid, "DILDO", "DILDO_G", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "DILDO", "DILDO_Hit_2", 4.1, 0, 1, 1, 0, 0, 1);
		case 8: AnimOynat(playerid, "DILDO", "DILDO_Hit_3", 4.1, 0, 1, 1, 0, 0, 1);
		case 9: AnimOynat(playerid, "DILDO", "DILDO_IDLE", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/dildo [1-9]");
	}
	return 1;
}

CMD:dodge(playerid, params[]) return AnimOynat(playerid, "DODGE", "Crush_Jump", 4.1, 0, 1, 1, 0, 0, 1);

CMD:fat(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "FAT", "FatIdle", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "FAT", "FatIdle_armed", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "FAT", "FatIdle_Csaw", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "FAT", "FatIdle_Rocket", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "FAT", "FatWalk_armed", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "FAT", "FatWalk_Csaw", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "FAT", "FatWalk_Rocket", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "FAT", "IDLE_tired", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "FAT", "FatSprint", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "FAT", "FatWalk", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "FAT", "FatWalkstart", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "FAT", "FatWalkstart_Csaw", 4.0, 0, 0, 0, 1, 1, 1);
		case 13: AnimOynat(playerid, "FAT", "FatWalkSt_armed", 4.0, 0, 0, 0, 1, 1, 1);
		case 14: AnimOynat(playerid, "FAT", "FatWalkSt_Rocket", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/fat [1-14]");
	}
	return 1;
}

CMD:flame(playerid, params[]) return AnimOynat(playerid, "FLAME", "FLAME_fire", 4.0, 0, 0, 0, 1, 1, 1);
CMD:flowers(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "Flowers", "Flower_attack", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "Flowers", "Flower_attack_M", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "Flowers", "Flower_Hit", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/flowers [1-3]");
	}
	return 1;
}

CMD:food(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "FOOD", "EAT_Burger", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "FOOD", "EAT_Chicken", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "FOOD", "EAT_Pizza", 4.0, 0, 0, 0, 1, 1, 1);
		case 15: AnimOynat(playerid, "FOOD", "FF_Sit_Eat2", 4.0, 0, 0, 0, 1, 1, 1);
		case 16: AnimOynat(playerid, "FOOD", "FF_Sit_Eat3", 4.0, 0, 0, 0, 1, 1, 1);
		case 20: AnimOynat(playerid, "FOOD", "FF_Sit_Look", 4.0, 0, 0, 0, 1, 1, 1);
		case 21: AnimOynat(playerid, "FOOD", "FF_Sit_Loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 25: AnimOynat(playerid, "FOOD", "SHP_Thank", 4.0, 0, 0, 0, 1, 1, 1);
		case 26: AnimOynat(playerid, "FOOD", "SHP_Tray_In", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/food [1-27]");
	}
	return 1;
}

CMD:freeweights(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "Freeweights", "gym_barbell", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "Freeweights", "gym_free_A", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "Freeweights", "gym_free_B", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "Freeweights", "gym_free_celebrate", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "Freeweights", "gym_free_down", 4.1, 0, 1, 1, 1, 0, 1);
		case 6: AnimOynat(playerid, "Freeweights", "gym_free_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "Freeweights", "gym_free_pickup", 4.1, 0, 1, 1, 1, 0, 1);
		case 8: AnimOynat(playerid, "Freeweights", "gym_free_putdown", 4.1, 0, 1, 1, 1, 0, 1);
		case 9: AnimOynat(playerid, "Freeweights", "gym_free_up_smooth", 4.1, 0, 1, 1, 1, 0, 1);
		default: SendServerMessage(playerid, "/freeweights [1-9]");
	}
	return 1;
}

CMD:gangs(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "GANGS", "DEALER_DEAL", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "GANGS", "DEALER_IDLE", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "GANGS", "drnkbr_prtl", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "GANGS", "drnkbr_prtl_F", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "GANGS", "DRUGS_BUY", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "GANGS", "hndshkaa", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "GANGS", "hndshkba", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "GANGS", "hndshkca", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "GANGS", "hndshkcb", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "GANGS", "hndshkda", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "GANGS", "hndshkea", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "GANGS", "hndshkfa", 4.0, 0, 0, 0, 1, 1, 1);
		case 13: AnimOynat(playerid, "GANGS", "hndshkfa_swt", 4.0, 0, 0, 0, 1, 1, 1);
		case 14: AnimOynat(playerid, "GANGS", "Invite_No", 4.0, 0, 0, 0, 1, 1, 1);
		case 15: AnimOynat(playerid, "GANGS", "Invite_Yes", 4.0, 0, 0, 0, 1, 1, 1);
		case 16: AnimOynat(playerid, "GANGS", "shake_cara", 4.0, 0, 0, 0, 1, 1, 1);
		case 17: AnimOynat(playerid, "GANGS", "shake_carK", 4.0, 0, 0, 0, 1, 1, 1);
		case 18: AnimOynat(playerid, "GANGS", "shake_carSH", 4.0, 0, 0, 0, 1, 1, 1);
		case 19: AnimOynat(playerid, "GANGS", "prtial_gngtlkA", 4.0, 0, 0, 0, 1, 1, 1);
		case 20: AnimOynat(playerid, "GANGS", "prtial_gngtlkB", 4.0, 0, 0, 0, 1, 1, 1);
		case 21: AnimOynat(playerid, "GANGS", "prtial_gngtlkCt", 4.0, 0, 0, 0, 1, 1, 1);
		case 22: AnimOynat(playerid, "GANGS", "prtial_gngtlkD", 4.0, 0, 0, 0, 1, 1, 1);
		case 23: AnimOynat(playerid, "GANGS", "prtial_gngtlkE", 4.0, 0, 0, 0, 1, 1, 1);
		case 24: AnimOynat(playerid, "GANGS", "prtial_gngtlkF", 4.0, 0, 0, 0, 1, 1, 1);
		case 25: AnimOynat(playerid, "GANGS", "prtial_gngtlkG", 4.0, 0, 0, 0, 1, 1, 1);
		case 26: AnimOynat(playerid, "GANGS", "prtial_gngtlkH", 4.0, 0, 0, 0, 1, 1, 1);
		case 27: AnimOynat(playerid, "GANGS", "prtial_hndshk_01", 4.0, 0, 0, 0, 1, 1, 1);
		case 28: AnimOynat(playerid, "GANGS", "prtial_hndshk_biz_01", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/gangs [1-31]");
	}
	return 1;
}

CMD:ghands(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "GHANDS", "gsign1", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "GHANDS", "gsign1LH", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "GHANDS", "gsign2", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "GHANDS", "gsign2LH", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "GHANDS", "gsign3", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "GHANDS", "gsign3LH", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "GHANDS", "gsign4", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "GHANDS", "gsign4LH", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "GHANDS", "gsign5", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "GHANDS", "gsign5LH", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/ghands [1-10]");
	}
	return 1;
}

CMD:ghetto(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "GHETTO_DB", "GDB_Car2_PLY", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "GHETTO_DB", "GDB_Car2_SMO", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "GHETTO_DB", "GDB_Car2_SWE", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "GHETTO_DB", "GDB_Car_PLY", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "GHETTO_DB", "GDB_Car_RYD", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "GHETTO_DB", "GDB_Car_SMO", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "GHETTO_DB", "GDB_Car_SWE", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/ghetto [1-7]");
	}
	return 1;
}

CMD:gog(playerid, params[]) return AnimOynat(playerid, "goggles", "goggles_put_on", 4.1, 0, 1, 1, 1, 0, 1);

CMD:graffity(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "GRAFFITI", "graffiti_Chkout", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "GRAFFITI", "spraycan_fire", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/graffity [1-2]");
	}
	return 1;
}

CMD:graveyard(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "GRAVEYARD", "mrnM_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "GRAVEYARD", "prst_loopa", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/graveyard [1-2]");
	}
	return 1;
}

CMD:cry(playerid, params[]) return AnimOynat(playerid, "GRAVEYARD", "mrnF_loop", 4.0, 0, 0, 0, 1, 1, 1);

CMD:grenade(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "GRENADE", "WEAPON_throw", 4.1, 0, 1, 1, 1, 0, 1);
		case 2: AnimOynat(playerid, "GRENADE", "WEAPON_throwu", 4.1, 0, 1, 1, 1, 0, 1);
		default: SendServerMessage(playerid, "/grenade [1-2]");
	}
	return 1;
}

CMD:gym(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "GYMNASIUM", "GYMshadowbox", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "GYMNASIUM", "gym_bike_celebrate", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "GYMNASIUM", "gym_bike_fast", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "GYMNASIUM", "gym_bike_faster", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "GYMNASIUM", "gym_bike_getoff", 4.1, 0, 1, 1, 0, 0, 1);
		case 6: AnimOynat(playerid, "GYMNASIUM", "gym_bike_geton", 4.1, 0, 1, 1, 0, 0, 1);
		case 7: AnimOynat(playerid, "GYMNASIUM", "gym_bike_pedal", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "GYMNASIUM", "gym_bike_slow", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "GYMNASIUM", "gym_bike_still", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "GYMNASIUM", "gym_jog_falloff", 4.1, 0, 1, 1, 0, 0, 1);
		case 11: AnimOynat(playerid, "GYMNASIUM", "gym_shadowbox", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "GYMNASIUM", "gym_tread_celebrate", 4.0, 0, 0, 0, 1, 1, 1);
		case 13: AnimOynat(playerid, "GYMNASIUM", "gym_tread_falloff", 4.1, 0, 1, 1, 0, 0, 1);
		case 14: AnimOynat(playerid, "GYMNASIUM", "gym_tread_jog", 4.0, 0, 0, 0, 1, 1, 1);
		case 15: AnimOynat(playerid, "GYMNASIUM", "gym_tread_sprint", 4.0, 0, 0, 0, 1, 1, 1);
		case 16: AnimOynat(playerid, "GYMNASIUM", "gym_tread_tired", 4.0, 0, 0, 0, 1, 1, 1);
		case 17: AnimOynat(playerid, "GYMNASIUM", "gym_tread_walk", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/gym [1-17]");
	}
	return 1;
}

CMD:heist(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "HEIST9", "CAS_G2_GasKO", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "HEIST9", "swt_wllpk_L", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "HEIST9", "swt_wllpk_L_back", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "HEIST9", "swt_wllpk_R", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "HEIST9", "swt_wllpk_R_back", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "HEIST9", "swt_wllshoot_in_L", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "HEIST9", "swt_wllshoot_in_R", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "HEIST9", "swt_wllshoot_out_L", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "HEIST9", "swt_wllshoot_out_R", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "HEIST9", "Use_SwipeCard", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/heist [1-10]");
	}
	return 1;
}

CMD:inthouse(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "INT_HOUSE", "BED_In_L", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "INT_HOUSE", "BED_In_R", 4.1, 0, 1, 1, 0, 0, 1);
		case 3: AnimOynat(playerid, "INT_HOUSE", "BED_Out_L", 4.1, 0, 1, 1, 0, 0, 1);
		case 4: AnimOynat(playerid, "INT_HOUSE", "BED_Out_R", 4.1, 0, 1, 1, 0, 0, 1);
		case 5: AnimOynat(playerid, "INT_HOUSE", "LOU_Out", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/inthouse [1-5]");
	}
	return 1;
}

CMD:sleep(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "INT_HOUSE", "BED_Loop_L", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "INT_HOUSE", "BED_Loop_R", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/sleep [1-2]");
	}
	return 1;
}

CMD:intoffice(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "INT_OFFICE", "FF_Dam_Fwd", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "INT_OFFICE", "OFF_Sit_Watch", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "INT_OFFICE", "OFF_Sit_Bored_Loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "INT_OFFICE", "OFF_Sit_Crash", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "INT_OFFICE", "OFF_Sit_Drink", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "INT_OFFICE", "OFF_Sit_Idle_Loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "INT_OFFICE", "OFF_Sit_In", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "INT_OFFICE", "OFF_Sit_Read", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "INT_OFFICE", "OFF_Sit_Type_Loop", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/intoffice [1-9]");
	}
	return 1;
}

CMD:intshop(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "INT_SHOP", "shop_cashier", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "INT_SHOP", "shop_in", 4.1, 0, 1, 1, 0, 0, 1);
		case 3: AnimOynat(playerid, "INT_SHOP", "shop_lookA", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "INT_SHOP", "shop_lookB", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "INT_SHOP", "shop_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "INT_SHOP", "shop_out", 4.1, 0, 1, 1, 0, 0, 1);
		case 7: AnimOynat(playerid, "INT_SHOP", "shop_pay", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "INT_SHOP", "shop_shelf", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/intshop [1-8]");
	}
	return 1;
}

CMD:kissing(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "KISSING", "BD_GF_Wave", 4.1, 0, 1, 1, 0, 0, 1);
		case 3: AnimOynat(playerid, "KISSING", "GF_CarArgue_01", 4.1, 0, 1, 1, 0, 0, 1);
		case 4: AnimOynat(playerid, "KISSING", "GF_CarArgue_02", 4.1, 0, 1, 1, 0, 0, 1);
		case 5: AnimOynat(playerid, "KISSING", "GF_CarSpot", 4.1, 0, 1, 1, 0, 0, 1);
		case 6: AnimOynat(playerid, "KISSING", "GF_StreetArgue_01", 4.1, 0, 1, 1, 0, 0, 1);
		case 7: AnimOynat(playerid, "KISSING", "GF_StreetArgue_02", 4.1, 0, 1, 1, 0, 0, 1);
		case 8: AnimOynat(playerid, "KISSING", "Grlfrd_Kiss_01", 4.1, 0, 1, 1, 0, 0, 1);
		case 9: AnimOynat(playerid, "KISSING", "Grlfrd_Kiss_02", 4.1, 0, 1, 1, 0, 0, 1);
		case 10: AnimOynat(playerid, "KISSING", "Grlfrd_Kiss_03", 4.1, 0, 1, 1, 0, 0, 1);
		case 11: AnimOynat(playerid, "KISSING", "Playa_Kiss_01", 4.1, 0, 1, 1, 0, 0, 1);
		case 12: AnimOynat(playerid, "KISSING", "Playa_Kiss_02", 4.1, 0, 1, 1, 0, 0, 1);
		case 13: AnimOynat(playerid, "KISSING", "Playa_Kiss_03", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/kissing [1-13]");
	}
	return 1;
}

CMD:gift(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "KISSING", "gift_get", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "KISSING", "gift_give", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/gift [1-2]");
	}
	return 1;
}

CMD:wave(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "KISSING", "gfwave2", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "ON_LOOKERS", "wave_in", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "ON_LOOKERS", "wave_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "ON_LOOKERS", "wave_out", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "BD_FIRE", "BD_GF_Wave", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "PED", "endchat_03", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/wave [1-6]");
	}
	return 1;
}


CMD:knife(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "KNIFE", "KILL_Knife_Ped_Damage", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "KNIFE", "KILL_Knife_Ped_Die", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "KNIFE", "KILL_Knife_Player", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "KNIFE", "KILL_Partial", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "KNIFE", "knife_1", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "KNIFE", "knife_2", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "KNIFE", "knife_3", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "KNIFE", "knife_4", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "KNIFE", "knife_block", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "KNIFE", "Knife_G", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "KNIFE", "knife_hit_1", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "KNIFE", "knife_hit_2", 4.0, 0, 0, 0, 1, 1, 1);
		case 13: AnimOynat(playerid, "KNIFE", "knife_hit_3", 4.0, 0, 0, 0, 1, 1, 1);
		case 14: AnimOynat(playerid, "KNIFE", "knife_part", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/knife [1-14]");
	}
	return 1;
}

CMD:lowrider(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "LOWRIDER", "Tap_hand", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "LOWRIDER", "lrgirl_bdbnce", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "LOWRIDER", "lrgirl_hair", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "LOWRIDER", "lrgirl_hurry", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "LOWRIDER", "lrgirl_idleloop", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "LOWRIDER", "lrgirl_idle_to_l0", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "LOWRIDER", "lrgirl_l0_bnce", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "LOWRIDER", "lrgirl_l0_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "LOWRIDER", "lrgirl_l0_to_l1", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "LOWRIDER", "lrgirl_l12_to_l0", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "LOWRIDER", "lrgirl_l1_bnce", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "LOWRIDER", "lrgirl_l1_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 13: AnimOynat(playerid, "LOWRIDER", "lrgirl_l1_to_l2", 4.0, 0, 0, 0, 1, 1, 1);
		case 14: AnimOynat(playerid, "LOWRIDER", "lrgirl_l2_bnce", 4.0, 0, 0, 0, 1, 1, 1);
		case 15: AnimOynat(playerid, "LOWRIDER", "lrgirl_l2_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 16: AnimOynat(playerid, "LOWRIDER", "lrgirl_l2_to_l3", 4.0, 0, 0, 0, 1, 1, 1);
		case 17: AnimOynat(playerid, "LOWRIDER", "lrgirl_l345_to_l1", 4.0, 0, 0, 0, 1, 1, 1);
		case 18: AnimOynat(playerid, "LOWRIDER", "lrgirl_l3_bnce", 4.0, 0, 0, 0, 1, 1, 1);
		case 19: AnimOynat(playerid, "LOWRIDER", "lrgirl_l3_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 20: AnimOynat(playerid, "LOWRIDER", "lrgirl_l3_to_l4", 4.0, 0, 0, 0, 1, 1, 1);
		case 21: AnimOynat(playerid, "LOWRIDER", "lrgirl_l4_bnce", 4.0, 0, 0, 0, 1, 1, 1);
		case 22: AnimOynat(playerid, "LOWRIDER", "lrgirl_l4_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 23: AnimOynat(playerid, "LOWRIDER", "lrgirl_l4_to_l5", 4.0, 0, 0, 0, 1, 1, 1);
		case 24: AnimOynat(playerid, "LOWRIDER", "lrgirl_l5_bnce", 4.0, 0, 0, 0, 1, 1, 1);
		case 25: AnimOynat(playerid, "LOWRIDER", "lrgirl_l5_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 26: AnimOynat(playerid, "LOWRIDER", "prtial_gngtlkH", 4.0, 0, 0, 0, 1, 1, 1);
		case 27: AnimOynat(playerid, "LOWRIDER", "Sit_relaxed", 4.0, 0, 0, 0, 1, 1, 1);
		case 28: AnimOynat(playerid, "LOWRIDER", "prtial_gngtlkB", 4.0, 0, 0, 0, 1, 1, 1);
		case 29: AnimOynat(playerid, "LOWRIDER", "prtial_gngtlkC", 4.0, 0, 0, 0, 1, 1, 1);
		case 30: AnimOynat(playerid, "LOWRIDER", "prtial_gngtlkD", 4.0, 0, 0, 0, 1, 1, 1);
		case 31: AnimOynat(playerid, "LOWRIDER", "prtial_gngtlkE", 4.0, 0, 0, 0, 1, 1, 1);
		case 32: AnimOynat(playerid, "LOWRIDER", "prtial_gngtlkF", 4.0, 0, 0, 0, 1, 1, 1);
		case 33: AnimOynat(playerid, "LOWRIDER", "prtial_gngtlkG", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/lowrider [1-33]");
	}
	return 1;
}

CMD:rap(playerid, params[])
{
	switch(strval(params))
	{
		case 1: AnimOynat(playerid, "RAPPING", "RAP_A_Loop", 4.0, 1, 0, 0, 0, 0, 1);
		case 2: AnimOynat(playerid, "RAPPING", "RAP_B_Loop", 4.0, 1, 0, 0, 0, 0, 1);
		case 3: AnimOynat(playerid, "RAPPING", "RAP_C_Loop", 4.0, 1, 0, 0, 0, 0, 1);
		default: SendServerMessage(playerid, "/rap [1-3]");
	}
	return 1;
}

CMD:facepalm(playerid, params[]) return AnimOynat(playerid, "MISC", "plyr_shkhead", 4.0, 0, 0, 0, 1, 1, 1);

CMD:lean(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "LOWRIDER", "F_smklean_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "SHOP", "Smoke_RYD", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "GANGS", "leanIDLE", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "GANGS", "leanIN", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "GANGS", "leanOUT", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "MISC", "Plunger_01", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "MISC", "Plyrlean_loop", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/lean [1-7]");
	}
	return 1;
}

CMD:mdchase(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "MD_CHASE", "Carhit_Hangon", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "MD_CHASE", "Carhit_Tumble", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "MD_CHASE", "donutdrop", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "MD_CHASE", "Fen_Choppa_L1", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "MD_CHASE", "Fen_Choppa_L2", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "MD_CHASE", "Fen_Choppa_L3", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "MD_CHASE", "Fen_Choppa_R1", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "MD_CHASE", "Fen_Choppa_R2", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "MD_CHASE", "Fen_Choppa_R3", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "MD_CHASE", "Hangon_Stun_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "MD_CHASE", "Hangon_Stun_Turn", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "MD_CHASE", "MD_BIKE_2_HANG", 4.0, 0, 0, 0, 1, 1, 1);
		case 13: AnimOynat(playerid, "MD_CHASE", "MD_BIKE_Jmp_BL", 4.0, 0, 0, 0, 1, 1, 1);
		case 14: AnimOynat(playerid, "MD_CHASE", "MD_BIKE_Jmp_F", 4.0, 0, 0, 0, 1, 1, 1);
		case 15: AnimOynat(playerid, "MD_CHASE", "MD_BIKE_Lnd_BL", 4.0, 0, 0, 0, 1, 1, 1);
		case 16: AnimOynat(playerid, "MD_CHASE", "MD_BIKE_Lnd_Die_BL", 4.0, 0, 0, 0, 1, 1, 1);
		case 17: AnimOynat(playerid, "MD_CHASE", "MD_BIKE_Lnd_Die_F", 4.0, 0, 0, 0, 1, 1, 1);
		case 18: AnimOynat(playerid, "MD_CHASE", "MD_BIKE_Lnd_F", 4.0, 0, 0, 0, 1, 1, 1);
		case 19: AnimOynat(playerid, "MD_CHASE", "MD_BIKE_Lnd_Roll", 4.0, 0, 0, 0, 1, 1, 1);
		case 20: AnimOynat(playerid, "MD_CHASE", "MD_BIKE_Lnd_Roll_F", 4.0, 0, 0, 0, 1, 1, 1);
		case 21: AnimOynat(playerid, "MD_CHASE", "MD_BIKE_Punch", 4.0, 0, 0, 0, 1, 1, 1);
		case 22: AnimOynat(playerid, "MD_CHASE", "MD_BIKE_Punch_F", 4.0, 0, 0, 0, 1, 1, 1);
		case 23: AnimOynat(playerid, "MD_CHASE", "MD_BIKE_Shot_F", 4.0, 0, 0, 0, 1, 1, 1);
		case 24: AnimOynat(playerid, "MD_CHASE", "MD_HANG_Lnd_Roll", 4.0, 0, 0, 0, 1, 1, 1);
		case 25: AnimOynat(playerid, "MD_CHASE", "MD_HANG_Loop", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/mdchase [1-25]");
	}
	return 1;
}

CMD:mddend(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "MD_END", "END_SC1_PLY", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "MD_END", "END_SC1_RYD", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "MD_END", "END_SC1_SMO", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "MD_END", "END_SC1_SWE", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "MD_END", "END_SC2_PLY", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "MD_END", "END_SC2_RYD", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "MD_END", "END_SC2_SMO", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "MD_END", "END_SC2_SWE", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/mddend [1-8]");
	}
	return 1;
}

CMD:medic(playerid, params[]) return AnimOynat(playerid, "MEDIC", "CPR", 4.0, 0, 0, 0, 1, 1, 1);
CMD:misc(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "MISC", "bitchslap", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "MISC", "BMX_celebrate", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "MISC", "BMX_comeon", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "MISC", "bmx_idleloop_01", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "MISC", "bmx_idleloop_02", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "MISC", "bmx_talkleft_in", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "MISC", "bmx_talkleft_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "MISC", "bmx_talkleft_out", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "MISC", "bmx_talkright_in", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "MISC", "bmx_talkright_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "MISC", "bmx_talkright_out", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "MISC", "bng_wndw", 4.0, 0, 0, 0, 1, 1, 1);
		case 13: AnimOynat(playerid, "MISC", "bng_wndw_02", 4.0, 0, 0, 0, 1, 1, 1);
		case 14: AnimOynat(playerid, "MISC", "Case_pickup", 4.0, 0, 0, 0, 1, 1, 1);
		case 15: AnimOynat(playerid, "MISC", "door_jet", 4.0, 0, 0, 0, 1, 1, 1);
		case 16: AnimOynat(playerid, "MISC", "GRAB_L", 4.1, 0, 1, 1, 0, 0, 1);
		case 17: AnimOynat(playerid, "MISC", "GRAB_R", 4.1, 0, 1, 1, 0, 0, 1);
		case 18: AnimOynat(playerid, "MISC", "Idle_Chat_02", 4.0, 0, 0, 0, 1, 1, 1);
		case 19: AnimOynat(playerid, "MISC", "KAT_Throw_K", 4.0, 0, 0, 0, 1, 1, 1);
		case 20: AnimOynat(playerid, "MISC", "KAT_Throw_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 21: AnimOynat(playerid, "MISC", "KAT_Throw_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 22: AnimOynat(playerid, "MISC", "PASS_Rifle_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 23: AnimOynat(playerid, "MISC", "PASS_Rifle_Ped", 4.0, 0, 0, 0, 1, 1, 1);
		case 24: AnimOynat(playerid, "MISC", "PASS_Rifle_Ply", 4.0, 0, 0, 0, 1, 1, 1);
		case 25: AnimOynat(playerid, "MISC", "pickup_box", 4.1, 0, 1, 1, 0, 0, 1);
		case 26: AnimOynat(playerid, "MISC", "Plane_door", 4.0, 0, 0, 0, 1, 1, 1);
		case 27: AnimOynat(playerid, "MISC", "Plane_exit", 4.1, 0, 1, 1, 0, 0, 1);
		case 28: AnimOynat(playerid, "MISC", "smlplane_door", 4.0, 0, 0, 0, 1, 1, 1);
		case 29: AnimOynat(playerid, "MISC", "Run_Dive", 4.0, 0, 0, 0, 1, 1, 1);
		case 30: AnimOynat(playerid, "MISC", "Scratchballs_01", 4.0, 0, 0, 0, 1, 1, 1);
		case 31: AnimOynat(playerid, "MISC", "smalplane_door", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/misc [1-31]");
	}
	return 1;
}

CMD:musculcar(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "MUSCULAR", "MuscleIdle", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "MUSCULAR", "MuscleIdle_armed", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "MUSCULAR", "MuscleIdle_Csaw", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "MUSCULAR", "MuscleIdle_rocket", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/musculcar [1-4]");
	}
	return 1;
}

CMD:onlookers(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "ON_LOOKERS", "shout_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "ON_LOOKERS", "lkaround_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "ON_LOOKERS", "shout_in", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "ON_LOOKERS", "lkup_in", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "ON_LOOKERS", "lkup_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "ON_LOOKERS", "lkup_out", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "ON_LOOKERS", "lkup_point", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "ON_LOOKERS", "panic_cower", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "ON_LOOKERS", "panic_hide", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "ON_LOOKERS", "panic_in", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "ON_LOOKERS", "panic_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "ON_LOOKERS", "panic_out", 4.0, 0, 0, 0, 1, 1, 1);
		case 13: AnimOynat(playerid, "ON_LOOKERS", "panic_point", 4.0, 0, 0, 0, 1, 1, 1);
		case 14: AnimOynat(playerid, "ON_LOOKERS", "panic_shout", 4.0, 0, 0, 0, 1, 1, 1);
		case 15: AnimOynat(playerid, "ON_LOOKERS", "Pointup_in", 4.0, 0, 0, 0, 1, 1, 1);
		case 16: AnimOynat(playerid, "ON_LOOKERS", "Pointup_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 17: AnimOynat(playerid, "ON_LOOKERS", "Pointup_out", 4.0, 0, 0, 0, 1, 1, 1);
		case 18: AnimOynat(playerid, "ON_LOOKERS", "Pointup_shout", 4.0, 0, 0, 0, 1, 1, 1);
		case 19: AnimOynat(playerid, "ON_LOOKERS", "shout_02", 4.0, 0, 0, 0, 1, 1, 1);
		case 20: AnimOynat(playerid, "ON_LOOKERS", "point_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 22: AnimOynat(playerid, "ON_LOOKERS", "shout_01", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/onlookers [1-26]");
	}
	return 1;
}

CMD:otb(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "OTB", "betslp_in", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "OTB", "betslp_lkabt", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "OTB", "betslp_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "OTB", "betslp_out", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "OTB", "betslp_tnk", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "OTB", "wtchrace_cmon", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "OTB", "wtchrace_in", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "OTB", "wtchrace_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "OTB", "wtchrace_lose", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "OTB", "wtchrace_out", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "OTB", "wtchrace_win", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/otb [1-11]");
	}
	return 1;
}

CMD:park(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "PARK", "Tai_Chi_in", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "PARK", "Tai_Chi_Loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "PARK", "Tai_Chi_Out", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/park [1-3]");
	}
	return 1;
}

CMD:paulnmac(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "PAULNMAC", "Piss_in", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "PAULNMAC", "Piss_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "PAULNMAC", "Piss_out", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "PAULNMAC", "PnM_Argue1_A", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "PAULNMAC", "PnM_Argue1_B", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "PAULNMAC", "PnM_Argue2_A", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "PAULNMAC", "PnM_Argue2_B", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "PAULNMAC", "PnM_Loop_A", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "PAULNMAC", "PnM_Loop_B", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "PAULNMAC", "wank_in", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "PAULNMAC", "wank_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "PAULNMAC", "wank_out", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/paulnmac [1-12]");
	}
	return 1;
}

CMD:aim(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "PED", "ARRESTgun", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "PED", "gang_gunstand", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/aim [1-2]");
	}
	return 1;
}

CMD:fall(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "PED", "BIKE_fallR", 4.1, 0, 1, 1, 1, 1, 0);
		case 2: AnimOynat(playerid, "PED", "BIKE_fall_off", 4.1, 0, 1, 1, 1, 1, 0);
		case 3: AnimOynat(playerid, "PED", "FLOOR_hit", 4.1, 0, 1, 1, 1, 1, 0);
		case 4: AnimOynat(playerid, "PED", "FLOOR_hit_f", 4.1, 0, 1, 1, 1, 1, 0);
		case 5: AnimOynat(playerid, "PED", "KO_shot_face", 4.1, 0, 1, 1, 0, 0, 0);
		case 6: AnimOynat(playerid, "PED", "KO_shot_front", 4.1, 0, 1, 1, 0, 0, 0);
		case 7: AnimOynat(playerid, "PED", "KO_shot_stom", 4.1, 0, 1, 1, 0, 0, 0);
		case 8: AnimOynat(playerid, "PED", "KO_skid_back", 4.1, 0, 1, 1, 0, 0, 0);
		case 9: AnimOynat(playerid, "PED", "KO_skid_front", 4.1, 0, 1, 1, 0, 0, 0);
		case 10: AnimOynat(playerid, "PED", "KO_spin_L", 4.1, 0, 1, 1, 0, 0, 0);
		default: SendServerMessage(playerid, "/fall [1-10]");
	}
	return 1;
}

CMD:hide(playerid, params[]) return AnimOynat(playerid, "PED", "DUCK_cower", 4.0, 0, 0, 0, 1, 1, 1);

CMD:stop(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "PED", "endchat_01", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "PED", "endchat_02", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/stop [1-2]");
	}
	return 1;
}

CMD:ped(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "PED", "abseil", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "PED", "Smoke_in_car", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "PED", "ATM", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "PED", "BIKE_elbowL", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "PED", "BIKE_elbowR", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "PED", "Player_Sneak_walkstart", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "PED", "Shove_Partial", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "PED", "BIKE_pickupL", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "PED", "BIKE_pickupR", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "PED", "BIKE_pullupL", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "PED", "BIKE_pullupR", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "PED", "bomber", 4.0, 0, 0, 0, 1, 1, 1);
		case 13: AnimOynat(playerid, "PED", "Crouch_Roll_L", 4.0, 0, 0, 0, 1, 1, 1);
		case 14: AnimOynat(playerid, "PED", "Crouch_Roll_R", 4.0, 0, 0, 0, 1, 1, 1);
		case 15: AnimOynat(playerid, "PED", "Drown", 4.0, 0, 0, 0, 1, 1, 1);
		case 16: AnimOynat(playerid, "PED", "DUCK_cower", 4.0, 0, 0, 0, 1, 1, 1);
		case 17: AnimOynat(playerid, "PED", "KD_right", 4.0, 0, 0, 0, 1, 1, 1);
		case 18: AnimOynat(playerid, "PED", "KO_spin_R", 4.0, 0, 0, 0, 1, 1, 1);
		case 19: AnimOynat(playerid, "PED", "pass_Smoke_in_car", 4.0, 0, 0, 0, 1, 1, 1);
		case 20: AnimOynat(playerid, "PED", "EV_dive", 4.0, 0, 0, 0, 1, 1, 1);
		case 21: AnimOynat(playerid, "PED", "EV_step", 4.0, 0, 0, 0, 1, 1, 1);
		case 22: AnimOynat(playerid, "PED", "facanger", 4.0, 0, 0, 0, 1, 1, 1);
		case 23: AnimOynat(playerid, "PED", "facanger", 4.0, 0, 0, 0, 1, 1, 1);
		case 24: AnimOynat(playerid, "PED", "facgum", 4.0, 0, 0, 0, 1, 1, 1);
		case 25: AnimOynat(playerid, "PED", "facsurp", 4.0, 0, 0, 0, 1, 1, 1);
		case 26: AnimOynat(playerid, "PED", "facsurpm", 4.0, 0, 0, 0, 1, 1, 1);
		case 27: AnimOynat(playerid, "PED", "factalk", 4.0, 0, 0, 0, 1, 1, 1);
		case 28: AnimOynat(playerid, "PED", "facurios", 4.0, 0, 0, 0, 1, 1, 1);
		case 29: AnimOynat(playerid, "PED", "Player_Sneak", 4.0, 0, 0, 0, 1, 1, 1);
		case 30: AnimOynat(playerid, "PED", "KART_R", 4.0, 0, 0, 0, 1, 1, 1);
		case 31: AnimOynat(playerid, "PED", "KD_left", 4.0, 0, 0, 0, 1, 1, 1);
		case 32: AnimOynat(playerid, "PED", "gas_cwr", 4.0, 0, 0, 0, 1, 1, 1);
		case 33: AnimOynat(playerid, "PED", "gum_eat", 4.0, 0, 0, 0, 1, 1, 1);
		case 34: AnimOynat(playerid, "PED", "GunCrouchBwd", 4.0, 0, 0, 0, 1, 1, 1);
		case 35: AnimOynat(playerid, "PED", "GunCrouchFwd", 4.0, 0, 0, 0, 1, 1, 1);
		case 36: AnimOynat(playerid, "PED", "GunMove_BWD", 4.0, 0, 0, 0, 1, 1, 1);
		case 37: AnimOynat(playerid, "PED", "GunMove_FWD", 4.0, 0, 0, 0, 1, 1, 1);
		case 38: AnimOynat(playerid, "PED", "GunMove_L", 4.0, 0, 0, 0, 1, 1, 1);
		case 39: AnimOynat(playerid, "PED", "GunMove_R", 4.0, 0, 0, 0, 1, 1, 1);
		case 40: AnimOynat(playerid, "PED", "Gun_2_IDLE", 4.0, 0, 0, 0, 1, 1, 1);
		case 41: AnimOynat(playerid, "PED", "GUN_BUTT", 4.0, 0, 0, 0, 1, 1, 1);
		case 42: AnimOynat(playerid, "PED", "GUN_BUTT_crouch", 4.0, 0, 0, 0, 1, 1, 1);
		case 43: AnimOynat(playerid, "PED", "Gun_stand", 4.0, 0, 0, 0, 1, 1, 1);
		case 44: AnimOynat(playerid, "PED", "JOG_femaleA", 4.0, 0, 0, 0, 1, 1, 1);
		case 45: AnimOynat(playerid, "PED", "JOG_maleA", 4.0, 0, 0, 0, 1, 1, 1);
		case 46: AnimOynat(playerid, "PED", "KART_L", 4.0, 0, 0, 0, 1, 1, 1);
		case 47: AnimOynat(playerid, "PED", "KART_LB", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/ped [1-47]");
	}
	return 1;
}

CMD:climb(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "PED", "CLIMB_idle", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "PED", "CLIMB_jump", 4.1, 0, 1, 1, 0, 0, 1);
		case 3: AnimOynat(playerid, "PED", "CLIMB_jump2fall", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/climb [1-3]");
	}
	return 1;
}

CMD:cower(playerid, params[]) return 	AnimOynat(playerid, "PED", "cower", 4.0, 0, 0, 0, 1, 1, 1);

CMD:door(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "PED", "DOOR_LHinge_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "PED", "DOOR_RHinge_O", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/door [1-2]");
	}
	return 1;
}

CMD:dam(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "PED", "DAM_armL_frmBK", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "PED", "DAM_armL_frmFT", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "PED", "DAM_armL_frmLT", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "PED", "DAM_armR_frmBK", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "PED", "DAM_armR_frmFT", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "PED", "DAM_armR_frmRT", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "PED", "DAM_LegL_frmBK", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "PED", "DAM_LegL_frmFT", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "PED", "DAM_LegL_frmLT", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "PED", "DAM_LegR_frmBK", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "PED", "DAM_LegR_frmFT", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "PED", "DAM_LegR_frmRT", 4.0, 0, 0, 0, 1, 1, 1);
		case 13: AnimOynat(playerid, "PED", "DAM_stomach_frmBK", 4.0, 0, 0, 0, 1, 1, 1);
		case 14: AnimOynat(playerid, "PED", "DAM_stomach_frmFT", 4.0, 0, 0, 0, 1, 1, 1);
		case 15: AnimOynat(playerid, "PED", "DAM_stomach_frmLT", 4.0, 0, 0, 0, 1, 1, 1);
		case 16: AnimOynat(playerid, "PED", "DAM_stomach_frmRT", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/dam [1-16]");
	}
	return 1;
}

CMD:drive(playerid, params[]) return AnimOynat(playerid, "PED", "DRIVE_BOAT", 4.0, 0, 0, 0, 1, 1, 1);
CMD:fucku(playerid, params[]) return AnimOynat(playerid, "PED", "fucku", 4.0, 0, 0, 0, 1, 1, 1);

CMD:getup(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "PED", "getup", 4.1, 0, 1, 1, 1, 0, 1);
		case 2: AnimOynat(playerid, "PED", "getup_front", 4.1, 0, 1, 1, 1, 0, 1);
		default: SendServerMessage(playerid, "/getup [1-2]");
	}
	return 1;
}

CMD:fight(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "PED", "Fight2Idle", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "PED", "FightA_1", 4.1, 0, 1, 1, 0, 0, 1);
		case 3: AnimOynat(playerid, "PED", "FightA_2", 4.1, 0, 1, 1, 0, 0, 1);
		case 4: AnimOynat(playerid, "PED", "FightA_3", 4.1, 0, 1, 1, 0, 0, 1);
		case 5: AnimOynat(playerid, "PED", "FightA_block", 4.1, 0, 1, 1, 0, 0, 1);
		case 6: AnimOynat(playerid, "PED", "FightA_G", 4.1, 0, 1, 1, 0, 0, 1);
		case 7: AnimOynat(playerid, "PED", "FightA_M", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "PED", "FIGHTIDLE", 4.1, 0, 1, 1, 0, 0, 1);
		case 9: AnimOynat(playerid, "PED", "FightShB", 4.1, 0, 1, 1, 0, 0, 1);
		case 10: AnimOynat(playerid, "PED", "FightShF", 4.1, 0, 1, 1, 0, 0, 1);
		case 11: AnimOynat(playerid, "PED", "FightSh_BWD", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "PED", "FightSh_FWD", 4.0, 0, 0, 0, 1, 1, 1);
		case 13: AnimOynat(playerid, "PED", "FightSh_Left", 4.0, 0, 0, 0, 1, 1, 1);
		case 14: AnimOynat(playerid, "PED", "FightSh_Right", 4.0, 0, 0, 0, 1, 1, 1);
		case 15: AnimOynat(playerid, "PED", "flee_lkaround_01", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/fight [1-15]");
	}
	return 1;
}


CMD:hit(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "PED", "HitA_1", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "PED", "HitA_2", 4.1, 0, 1, 1, 0, 0, 1);
		case 3: AnimOynat(playerid, "PED", "HitA_3", 4.1, 0, 1, 1, 0, 0, 1);
		case 4: AnimOynat(playerid, "PED", "HIT_back", 4.1, 0, 1, 1, 0, 0, 1);
		case 5: AnimOynat(playerid, "PED", "HIT_behind", 4.1, 0, 1, 1, 0, 0, 1);
		case 6: AnimOynat(playerid, "PED", "HIT_front", 4.1, 0, 1, 1, 0, 0, 1);
		case 7: AnimOynat(playerid, "PED", "HIT_GUN_BUTT", 4.1, 0, 1, 1, 0, 0, 1);
		case 8: AnimOynat(playerid, "PED", "HIT_L", 4.1, 0, 1, 1, 0, 0, 1);
		case 9: AnimOynat(playerid, "PED", "HIT_R", 4.1, 0, 1, 1, 0, 0, 1);
		case 10: AnimOynat(playerid, "PED", "HIT_walk", 4.1, 0, 1, 1, 0, 0, 1);
		case 11: AnimOynat(playerid, "PED", "HIT_wall", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/hit [1-11]");
	}
	return 1;
}

CMD:idle(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "PED", "Idlestance_fat", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "PED", "idlestance_old", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "PED", "IDLE_armed", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "PED", "IDLE_csaw", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "PED", "IDLE_HBHB", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "PED", "IDLE_ROCKET", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/idle [1-7]");
	}
	return 1;
}

CMD:tired(playerid, params[]) return AnimOynat(playerid, "PED", "IDLE_tired", 4.0, 0, 0, 0, 1, 1, 1);
CMD:taxi(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "PED", "IDLE_taxi", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "MISC", "Hiker_Pose", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "MISC", "Hiker_Pose_L", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/taxi [1-3]");
	}
	return 1;
}

CMD:phone(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "PED", "phone_in", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "PED", "phone_out", 4.1, 0, 1, 1, 0, 0, 1);
		case 3: AnimOynat(playerid, "PED", "phone_talk", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/phone [1-3]");
	}
	return 1;
}

CMD:crossroad(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "PED", "roadcross", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "PED", "roadcross_female", 4.1, 0, 1, 1, 0, 0, 1);
		case 3: AnimOynat(playerid, "PED", "roadcross_gang", 4.1, 0, 1, 1, 0, 0, 1);
		case 4: AnimOynat(playerid, "PED", "roadcross_old", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/crossroad [1-4]");
	}
	return 1;
}

CMD:seat(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "PED", "SHOT_leftP", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "PED", "SHOT_partial", 4.1, 0, 1, 1, 0, 0, 1);
		case 3: AnimOynat(playerid, "PED", "SHOT_partial_B", 4.1, 0, 1, 1, 0, 0, 1);
		case 4: AnimOynat(playerid, "PED", "SHOT_rightP", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/seat [1-4]");
	}
	return 1;
}

CMD:taphand(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "PED", "Tap_hand", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "PED", "Tap_handP", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/taphand [1-2]");
	}
	return 1;
}

CMD:turn(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "PED", "Turn_L", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "PED", "Turn_R", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "PED", "WEAPON_crouch", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "PED", "turn_180", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/turn [1-4]");
	}
	return 1;
}

CMD:woman(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "PED", "woman_idlestance", 4.1, 1, 1, 1, 1, 1, 1);
		case 2: AnimOynat(playerid, "PED", "woman_run", 4.1, 1, 1, 1, 1, 1, 1);
		case 3: AnimOynat(playerid, "PED", "WOMAN_runbusy", 4.1, 1, 1, 1, 1, 1, 1);
		case 4: AnimOynat(playerid, "PED", "WOMAN_runfatold", 4.1, 1, 1, 1, 1, 1, 1);
		case 5: AnimOynat(playerid, "PED", "woman_runpanic", 4.1, 1, 1, 1, 1, 1, 1);
		case 6: AnimOynat(playerid, "PED", "WOMAN_runsexy", 4.1, 1, 1, 1, 1, 1, 1);
		case 7: AnimOynat(playerid, "PED", "WOMAN_walkbusy", 4.1, 1, 1, 1, 1, 1, 1);
		case 8: AnimOynat(playerid, "PED", "WOMAN_walkfatold", 4.1, 1, 1, 1, 1, 1, 1);
		case 9: AnimOynat(playerid, "PED", "WOMAN_walknorm", 4.1, 1, 1, 1, 1, 1, 1);
		case 10: AnimOynat(playerid, "PED", "WOMAN_walkold", 4.1, 1, 1, 1, 1, 1, 1);
		case 11: AnimOynat(playerid, "PED", "WOMAN_walkpro", 4.1, 1, 1, 1, 1, 1, 1);
		case 12: AnimOynat(playerid, "PED", "WOMAN_walksexy", 4.1, 1, 1, 1, 1, 1, 1);
		case 13: AnimOynat(playerid, "PED", "WOMAN_walkshop", 4.1, 1, 1, 1, 1, 1, 1);
		case 14: AnimOynat(playerid, "PED", "XPRESSscratch", 4.1, 1, 1, 1, 1, 1, 1);
		default: SendServerMessage(playerid, "/woman [1-14]");
	}
	return 1;
}

CMD:anwalk(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "PED", "WALK_armed", 4.1, 1, 1, 1, 1, 1, 1);
		case 2: AnimOynat(playerid, "PED", "WALK_civi", 4.1, 1, 1, 1, 1, 1, 1);
		case 3: AnimOynat(playerid, "PED", "WALK_csaw", 4.1, 1, 1, 1, 1, 1, 1);
		case 4: AnimOynat(playerid, "PED", "Walk_DoorPartial", 4.1, 1, 1, 1, 1, 1, 1);
		case 5: AnimOynat(playerid, "PED", "WALK_drunk", 4.1, 1, 1, 1, 1, 1, 1);
		case 6: AnimOynat(playerid, "PED", "WALK_fat", 4.1, 1, 1, 1, 1, 1, 1);
		case 7: AnimOynat(playerid, "PED", "WALK_fatold", 4.1, 1, 1, 1, 1, 1, 1);
		case 8: AnimOynat(playerid, "PED", "WALK_gang1", 4.1, 1, 1, 1, 1, 1, 1);
		case 9: AnimOynat(playerid, "PED", "WALK_gang2", 4.1, 1, 1, 1, 1, 1, 1);
		case 10: AnimOynat(playerid, "PED", "WALK_old", 4.1, 1, 1, 1, 1, 1, 1);
		case 11: AnimOynat(playerid, "PED", "WALK_player", 4.1, 1, 1, 1, 1, 1, 1);
		case 12: AnimOynat(playerid, "PED", "WALK_rocket", 4.1, 1, 1, 1, 1, 1, 1);
		case 13: AnimOynat(playerid, "PED", "WALK_shuffle", 4.1, 1, 1, 1, 1, 1, 1);
		case 14: AnimOynat(playerid, "PED", "Walk_Wuzi", 4.1, 1, 1, 1, 1, 1, 1);
		default: SendServerMessage(playerid, "/walk [1-14]");
	}
	return 1;
}

CMD:playidles(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "PLAYIDLES", "shift", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "PLAYIDLES", "shldr", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "PLAYIDLES", "stretch", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "PLAYIDLES", "strleg", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "PLAYIDLES", "time", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/playidles [1-5]");
	}
	return 1;
}

CMD:police(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "POLICE", "CopTraf_Away", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "POLICE", "CopTraf_Come", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "POLICE", "CopTraf_Left", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "POLICE", "CopTraf_Stop", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "POLICE", "crm_drgbst_01", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "POLICE", "Door_Kick", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "POLICE", "plc_drgbst_01", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "POLICE", "plc_drgbst_02", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/police [1-8]");
	}
	return 1;
}

CMD:pool(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "POOL", "POOL_ChalkCue", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "POOL", "POOL_Idle_Stance", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "POOL", "POOL_Long_Shot", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "POOL", "POOL_Long_Shot_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "POOL", "POOL_Long_Start", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "POOL", "POOL_Long_Start_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "POOL", "POOL_Med_Shot", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "POOL", "POOL_Med_Shot_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "POOL", "POOL_Med_Start", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "POOL", "POOL_Med_Start_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "POOL", "POOL_Place_White", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "POOL", "POOL_Short_Shot", 4.0, 0, 0, 0, 1, 1, 1);
		case 13: AnimOynat(playerid, "POOL", "POOL_Short_Shot_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 14: AnimOynat(playerid, "POOL", "POOL_Short_Start", 4.0, 0, 0, 0, 1, 1, 1);
		case 15: AnimOynat(playerid, "POOL", "POOL_Short_Start_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 16: AnimOynat(playerid, "POOL", "POOL_Walk", 4.0, 0, 0, 0, 1, 1, 1);
		case 17: AnimOynat(playerid, "POOL", "POOL_Walk_Start", 4.0, 0, 0, 0, 1, 1, 1);
		case 18: AnimOynat(playerid, "POOL", "POOL_XLong_Shot", 4.0, 0, 0, 0, 1, 1, 1);
		case 19: AnimOynat(playerid, "POOL", "POOL_XLong_Shot_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 20: AnimOynat(playerid, "POOL", "POOL_XLong_Start", 4.0, 0, 0, 0, 1, 1, 1);
		case 21: AnimOynat(playerid, "POOL", "POOL_XLong_Start_O", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/pool [1-21]");
	}
	return 1;
}

CMD:python(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "PYTHON", "python_crouchfire", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "PYTHON", "python_crouchreload", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "PYTHON", "python_fire", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "PYTHON", "python_fire_poor", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/python [1-5]");
	}
	return 1;
}

CMD:rapping(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "RAPPING", "Laugh_01", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "RAPPING", "RAP_A_Loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "RAPPING", "RAP_B_Loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "RAPPING", "RAP_C_Loop", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/rapping [1-4]");
	}
	return 1;
}

CMD:rifle(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "RIFLE", "RIFLE_crouchfire", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "RIFLE", "RIFLE_crouchload", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "RIFLE", "RIFLE_fire", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "RIFLE", "RIFLE_fire_poor", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "RIFLE", "RIFLE_load", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/rifle [1-5]");
	}
	return 1;
}

CMD:riot(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "RIOT", "RIOT_ANGRY", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "RIOT", "RIOT_ANGRY_B", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "RIOT", "RIOT_challenge", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "RIOT", "RIOT_CHANT", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "RIOT", "RIOT_FUKU", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "RIOT", "RIOT_PUNCHES", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "RIOT", "RIOT_shout", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/riot [1-7]");
	}
	return 1;
}

CMD:robbank(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "ROB_BANK", "CAT_Safe_Open", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "ROB_BANK", "CAT_Safe_Rob", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "ROB_BANK", "SHP_HandsUp_Scr", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/robbank [1-3]");
	}
	return 1;
}

CMD:rocket(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "ROCKET", "idle_rocket", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "ROCKET", "RocketFire", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "ROCKET", "run_rocket", 4.1, 0, 1, 1, 1, 0, 1);
		case 4: AnimOynat(playerid, "ROCKET", "walk_rocket", 4.1, 0, 1, 1, 1, 0, 1);
		case 5: AnimOynat(playerid, "ROCKET", "WALK_start_rocket", 4.1, 0, 1, 1, 1, 0, 1);
		default: SendServerMessage(playerid, "/rocket [1-5]");
	}
	return 1;
}

CMD:rustler(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "RUSTLER", "Plane_align_LHS", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "RUSTLER", "Plane_close", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "RUSTLER", "Plane_getin", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "RUSTLER", "Plane_getout", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "RUSTLER", "Plane_open", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/rustler [1-5]");
	}
	return 1;
}

CMD:drunk(playerid, params[]) return AnimOynat(playerid, "RYDER", "RYD_Die_PT1", 4.0, 0, 0, 0, 1, 1, 1);

CMD:ryder(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "RYDER", "RYD_Beckon_01", 4.1, 0, 1, 1, 0, 1);
		case 2: AnimOynat(playerid, "RYDER", "RYD_Beckon_02", 4.1, 0, 1, 1, 0, 1);
		case 3: AnimOynat(playerid, "RYDER", "RYD_Beckon_03", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "RYDER", "RYD_Die_PT1", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "RYDER", "Van_Stand", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "RYDER", "Van_Crate_L", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "RYDER", "Van_Crate_R", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "RYDER", "Van_Stand_Crate", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "RYDER", "Van_Throw", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "RYDER", "Van_Lean_L", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "RYDER", "Van_Lean_R", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "RYDER", "VAN_PickUp_E", 4.0, 0, 0, 0, 1, 1, 1);
		case 13: AnimOynat(playerid, "RYDER", "VAN_PickUp_S", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/ryder [1-13]");
	}
	return 1;
}


CMD:shamal(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "SHAMAL", "SHAMAL_align", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "SHAMAL", "SHAMAL_getin_LHS", 4.1, 0, 1, 1, 0, 0, 1);
		case 3: AnimOynat(playerid, "SHAMAL", "SHAMAL_getout_LHS", 4.1, 0, 1, 1, 0, 0, 1);
		case 4: AnimOynat(playerid, "SHAMAL", "SHAMAL_open", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/shamal [1-4]");
	}
	return 1;
}

CMD:shop(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "SHOP", "ROB_2Idle", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "SHOP", "ROB_Shifty", 4.1, 0, 1, 1, 0, 0, 1);
		case 3: AnimOynat(playerid, "SHOP", "ROB_StickUp_In", 4.1, 0, 1, 1, 0, 0, 1);
		case 4: AnimOynat(playerid, "SHOP", "SHP_Duck_Fire", 4.1, 0, 1, 1, 0, 0, 1);
		case 5: AnimOynat(playerid, "SHOP", "SHP_Gun_Aim", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "SHOP", "SHP_Gun_Duck", 4.1, 0, 1, 1, 0, 0, 1);
		case 7: AnimOynat(playerid, "SHOP", "SHP_Gun_Fire", 4.1, 0, 1, 1, 0, 0, 1);
		case 8: AnimOynat(playerid, "SHOP", "SHP_Gun_Grab", 4.1, 0, 1, 1, 0, 0, 1);
		case 9: AnimOynat(playerid, "SHOP", "SHP_Gun_Threat", 4.1, 0, 1, 1, 0, 0, 1);
		case 10: AnimOynat(playerid, "SHOP", "SHP_HandsUp_Scr", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "SHOP", "SHP_Jump_Glide", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "SHOP", "SHP_Rob_GiveCash", 4.1, 0, 1, 1, 0, 0, 1);
		case 13: AnimOynat(playerid, "SHOP", "SHP_Rob_React", 4.1, 0, 1, 1, 0, 0, 1);
		case 14: AnimOynat(playerid, "SHOP", "SHP_Serve_End", 4.1, 0, 1, 1, 0, 0, 1);
		case 15: AnimOynat(playerid, "SHOP", "SHP_Serve_Idle", 4.0, 0, 0, 0, 1, 1, 1);
		case 16: AnimOynat(playerid, "SHOP", "SHP_Serve_Loop", 4.1, 0, 1, 1, 0, 0, 1);
		case 17: AnimOynat(playerid, "SHOP", "SHP_Serve_Start", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/shop [1-17]");
	}
	return 1;
}

CMD:robman(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "SHOP", "ROB_Loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "SHOP", "ROB_Loop_Threat", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/robman [1-2]");
	}
	return 1;
}

CMD:shotgun(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "SHOTGUN", "shotgun_crouchfire", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "SHOTGUN", "shotgun_fire", 4.1, 0, 1, 1, 0, 0, 1);
		case 3: AnimOynat(playerid, "SHOTGUN", "shotgun_fire_poor", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/shotgun [1-3]");
	}
	return 1;
}

CMD:silenced(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "SILENCED", "CrouchReload", 4.1, 0, 1, 1, 1, 0, 1);
		case 2: AnimOynat(playerid, "SILENCED", "SilenceCrouchfire", 4.1, 0, 1, 1, 1, 0, 1);
		case 3: AnimOynat(playerid, "SILENCED", "Silence_fire", 4.1, 0, 1, 1, 1, 0, 1);
		case 4: AnimOynat(playerid, "SILENCED", "Silence_reload", 4.1, 0, 1, 1, 1, 0, 1);
		default: SendServerMessage(playerid, "/silenced [1-4]");
	}
	return 1;
}

CMD:skate(playerid, params[]) return AnimOynat(playerid, "SKATE", "skate_idle", 4.0, 0, 0, 0, 1, 1, 1);

CMD:smoking(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "SMOKING", "F_smklean_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "SMOKING", "M_smklean_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "SMOKING", "M_smkstnd_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "SMOKING", "M_smk_drag", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "SMOKING", "M_smk_in", 4.1, 0, 1, 1, 0, 0, 1);
		case 6: AnimOynat(playerid, "SMOKING", "M_smk_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "SMOKING", "M_smk_out", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "SMOKING", "M_smk_tap", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "GANGS", "smkcig_prtl", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "GANGS", "smkcig_prtl_F", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "LOWRIDER", "M_smklean_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "LOWRIDER", "M_smkstnd_loop", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/smoking [1-12]");
	}
	return 1;
}

CMD:sniper(playerid, params[]) return AnimOynat(playerid, "SNIPER", "WEAPON_sniper", 4.1, 0, 1, 1, 0, 0, 1);

CMD:spraycan(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "SPRAYCAN", "spraycan_fire", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "SPRAYCAN", "spraycan_full", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/spraycan [1-2]");
	}
	return 1;
}

CMD:strip(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "STRIP", "PLY_CASH", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "STRIP", "PUN_CASH", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "STRIP", "PUN_HOLLER", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "STRIP", "PUN_LOOP", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "STRIP", "strip_A", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "STRIP", "strip_B", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "STRIP", "strip_C", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "STRIP", "strip_D", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "STRIP", "strip_E", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "STRIP", "strip_F", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "STRIP", "strip_G", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "STRIP", "STR_A2B", 4.0, 0, 0, 0, 1, 1, 1);
		case 13: AnimOynat(playerid, "STRIP", "STR_B2A", 4.0, 0, 0, 0, 1, 1, 1);
		case 14: AnimOynat(playerid, "STRIP", "STR_B2C", 4.0, 0, 0, 0, 1, 1, 1);
		case 15: AnimOynat(playerid, "STRIP", "STR_C1", 4.0, 0, 0, 0, 1, 1, 1);
		case 16: AnimOynat(playerid, "STRIP", "STR_C2", 4.0, 0, 0, 0, 1, 1, 1);
		case 17: AnimOynat(playerid, "STRIP", "STR_C2B", 4.0, 0, 0, 0, 1, 1, 1);
		case 18: AnimOynat(playerid, "STRIP", "STR_Loop_A", 4.0, 0, 0, 0, 1, 1, 1);
		case 19: AnimOynat(playerid, "STRIP", "STR_Loop_B", 4.0, 0, 0, 0, 1, 1, 1);
		case 20: AnimOynat(playerid, "STRIP", "STR_Loop_C", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/strip [1-20]");
	}
	return 1;
}

CMD:sunbathe(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "SUNBATHE", "batherdown", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "SUNBATHE", "batherup", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "SUNBATHE", "Lay_Bac_in", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "SUNBATHE", "Lay_Bac_out", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "SUNBATHE", "ParkSit_M_IdleA", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "SUNBATHE", "ParkSit_M_IdleB", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "SUNBATHE", "ParkSit_M_IdleC", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "SUNBATHE", "ParkSit_M_in", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "SUNBATHE", "ParkSit_M_out", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "SUNBATHE", "ParkSit_W_idleA", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "SUNBATHE", "ParkSit_W_idleB", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "SUNBATHE", "ParkSit_W_idleC", 4.0, 0, 0, 0, 1, 1, 1);
		case 13: AnimOynat(playerid, "SUNBATHE", "ParkSit_W_in", 4.0, 0, 0, 0, 1, 1, 1);
		case 14: AnimOynat(playerid, "SUNBATHE", "ParkSit_W_out", 4.0, 0, 0, 0, 1, 1, 1);
		case 15: AnimOynat(playerid, "SUNBATHE", "SBATHE_F_LieB2Sit", 4.0, 0, 0, 0, 1, 1, 1);
		case 16: AnimOynat(playerid, "SUNBATHE", "SBATHE_F_Out", 4.0, 0, 0, 0, 1, 1, 1);
		case 17: AnimOynat(playerid, "SUNBATHE", "SitnWait_in_W", 4.0, 0, 0, 0, 1, 1, 1);
		case 18: AnimOynat(playerid, "SUNBATHE", "SitnWait_out_W", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/bath [1-18]");
	}
	return 1;
}

CMD:answat(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "SWAT", "gnstwall_injurd", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "SWAT", "JMP_Wall1m_180", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "SWAT", "Rail_fall", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "SWAT", "Rail_fall_crawl", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "SWAT", "swt_breach_01", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "SWAT", "swt_breach_02", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "SWAT", "swt_breach_03", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "SWAT", "swt_go", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "SWAT", "swt_lkt", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "SWAT", "swt_sty", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "SWAT", "swt_vent_01", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "SWAT", "swt_vent_02", 4.0, 0, 0, 0, 1, 1, 1);
		case 13: AnimOynat(playerid, "SWAT", "swt_vnt_sht_die", 4.0, 0, 0, 0, 1, 1, 1);
		case 14: AnimOynat(playerid, "SWAT", "swt_vnt_sht_in", 4.0, 0, 0, 0, 1, 1, 1);
		case 15: AnimOynat(playerid, "SWAT", "swt_vnt_sht_loop", 4.0, 0, 0, 0, 1, 1, 1);
		case 16: AnimOynat(playerid, "SWAT", "swt_wllpk_L", 4.0, 0, 0, 0, 1, 1, 1);
		case 17: AnimOynat(playerid, "SWAT", "swt_wllpk_L_back", 4.0, 0, 0, 0, 1, 1, 1);
		case 18: AnimOynat(playerid, "SWAT", "swt_wllpk_R", 4.0, 0, 0, 0, 1, 1, 1);
		case 19: AnimOynat(playerid, "SWAT", "swt_wllpk_R_back", 4.0, 0, 0, 0, 1, 1, 1);
		case 20: AnimOynat(playerid, "SWAT", "swt_wllshoot_in_L", 4.0, 0, 0, 0, 1, 1, 1);
		case 21: AnimOynat(playerid, "SWAT", "swt_wllshoot_in_R", 4.0, 0, 0, 0, 1, 1, 1);
		case 22: AnimOynat(playerid, "SWAT", "swt_wllshoot_out_L", 4.0, 0, 0, 0, 1, 1, 1);
		case 23: AnimOynat(playerid, "SWAT", "swt_wllshoot_out_R", 4.0, 0, 0, 0, 1, 1, 1);
		case 24: AnimOynat(playerid, "SWAT", "cards_pick_02", 4.0, 0, 0, 0, 1, 1, 1);
		case 25: AnimOynat(playerid, "PED", "swat_run", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/answat [1-25]");
	}
	return 1;
}

CMD:sweet(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "SWEET", "ho_ass_slapped", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "SWEET", "LaFin_Player", 4.1, 0, 1, 1, 0, 0, 1);
		case 3: AnimOynat(playerid, "SWEET", "LaFin_Sweet", 4.1, 0, 1, 1, 0, 0, 1);
		case 4: AnimOynat(playerid, "SWEET", "plyr_hndshldr_01", 4.1, 0, 1, 1, 0, 0, 1);
		case 5: AnimOynat(playerid, "SWEET", "sweet_ass_slap", 4.1, 0, 1, 1, 0, 0, 1);
		case 6: AnimOynat(playerid, "SWEET", "sweet_hndshldr_01", 4.1, 0, 1, 1, 0, 0, 1);
		case 7: AnimOynat(playerid, "SWEET", "Sweet_injuredloop", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/sweet [1-7]");
	}
	return 1;
}

CMD:sword(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "SWORD", "sword_1", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "SWORD", "sword_2", 4.1, 0, 1, 1, 0, 0, 1);
		case 3: AnimOynat(playerid, "SWORD", "sword_3", 4.1, 0, 1, 1, 0, 0, 1);
		case 4: AnimOynat(playerid, "SWORD", "sword_4", 4.1, 0, 1, 1, 0, 0, 1);
		case 5: AnimOynat(playerid, "SWORD", "sword_block", 4.1, 0, 1, 1, 0, 0, 1);
		case 6: AnimOynat(playerid, "SWORD", "Sword_Hit_1", 4.1, 0, 1, 1, 0, 0, 1);
		case 7: AnimOynat(playerid, "SWORD", "Sword_Hit_2", 4.1, 0, 1, 1, 0, 0, 1);
		case 8: AnimOynat(playerid, "SWORD", "Sword_Hit_3", 4.1, 0, 1, 1, 0, 0, 1);
		case 9: AnimOynat(playerid, "SWORD", "sword_IDLE", 4.1, 0, 1, 1, 0, 0, 1);
		case 10: AnimOynat(playerid, "SWORD", "sword_part", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/sword [1-10]");
	}
	return 1;
}

CMD:tattoos(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "TATTOOS", "TAT_ArmL_In_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "TATTOOS", "TAT_ArmL_In_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "TATTOOS", "TAT_ArmL_In_T", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "TATTOOS", "TAT_ArmL_Out_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "TATTOOS", "TAT_ArmL_Out_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "TATTOOS", "TAT_ArmL_Out_T", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "TATTOOS", "TAT_ArmL_Pose_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "TATTOOS", "TAT_ArmL_Pose_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "TATTOOS", "TAT_ArmL_Pose_T", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "TATTOOS", "TAT_ArmR_In_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "TATTOOS", "TAT_ArmR_In_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "TATTOOS", "TAT_ArmR_In_T", 4.0, 0, 0, 0, 1, 1, 1);
		case 13: AnimOynat(playerid, "TATTOOS", "TAT_ArmR_Out_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 14: AnimOynat(playerid, "TATTOOS", "TAT_ArmR_Out_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 15: AnimOynat(playerid, "TATTOOS", "TAT_ArmR_Out_T", 4.0, 0, 0, 0, 1, 1, 1);
		case 16: AnimOynat(playerid, "TATTOOS", "TAT_ArmR_Pose_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 17: AnimOynat(playerid, "TATTOOS", "TAT_ArmR_Pose_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 18: AnimOynat(playerid, "TATTOOS", "TAT_ArmR_Pose_T", 4.0, 0, 0, 0, 1, 1, 1);
		case 19: AnimOynat(playerid, "TATTOOS", "TAT_Back_In_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 20: AnimOynat(playerid, "TATTOOS", "TAT_Back_In_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 21: AnimOynat(playerid, "TATTOOS", "TAT_Back_In_T", 4.0, 0, 0, 0, 1, 1, 1);
		case 22: AnimOynat(playerid, "TATTOOS", "TAT_Back_Out_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 23: AnimOynat(playerid, "TATTOOS", "TAT_Back_Out_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 24: AnimOynat(playerid, "TATTOOS", "TAT_Back_Out_T", 4.0, 0, 0, 0, 1, 1, 1);
		case 25: AnimOynat(playerid, "TATTOOS", "TAT_Back_Pose_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 26: AnimOynat(playerid, "TATTOOS", "TAT_Back_Pose_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 27: AnimOynat(playerid, "TATTOOS", "TAT_Back_Pose_T", 4.0, 0, 0, 0, 1, 1, 1);
		case 28: AnimOynat(playerid, "TATTOOS", "TAT_Back_Sit_In_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 29: AnimOynat(playerid, "TATTOOS", "TAT_Back_Sit_Loop_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 30: AnimOynat(playerid, "TATTOOS", "TAT_Back_Sit_Out_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 31: AnimOynat(playerid, "TATTOOS", "TAT_Bel_In_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 32: AnimOynat(playerid, "TATTOOS", "TAT_Bel_In_T", 4.0, 0, 0, 0, 1, 1, 1);
		case 33: AnimOynat(playerid, "TATTOOS", "TAT_Bel_Out_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 34: AnimOynat(playerid, "TATTOOS", "TAT_Bel_Out_T", 4.0, 0, 0, 0, 1, 1, 1);
		case 35: AnimOynat(playerid, "TATTOOS", "TAT_Bel_Pose_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 36: AnimOynat(playerid, "TATTOOS", "TAT_Bel_Pose_T", 4.0, 0, 0, 0, 1, 1, 1);
		case 37: AnimOynat(playerid, "TATTOOS", "TAT_Che_In_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 38: AnimOynat(playerid, "TATTOOS", "TAT_Che_In_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 39: AnimOynat(playerid, "TATTOOS", "TAT_Che_In_T", 4.0, 0, 0, 0, 1, 1, 1);
		case 40: AnimOynat(playerid, "TATTOOS", "TAT_Che_Out_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 41: AnimOynat(playerid, "TATTOOS", "TAT_Che_Out_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 42: AnimOynat(playerid, "TATTOOS", "TAT_Che_Out_T", 4.0, 0, 0, 0, 1, 1, 1);
		case 43: AnimOynat(playerid, "TATTOOS", "TAT_Che_Pose_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 44: AnimOynat(playerid, "TATTOOS", "TAT_Che_Pose_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 45: AnimOynat(playerid, "TATTOOS", "TAT_Che_Pose_T", 4.0, 0, 0, 0, 1, 1, 1);
		case 46: AnimOynat(playerid, "TATTOOS", "TAT_Drop_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 47: AnimOynat(playerid, "TATTOOS", "TAT_Idle_Loop_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 48: AnimOynat(playerid, "TATTOOS", "TAT_Idle_Loop_T", 4.0, 0, 0, 0, 1, 1, 1);
		case 49: AnimOynat(playerid, "TATTOOS", "TAT_Sit_In_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 50: AnimOynat(playerid, "TATTOOS", "TAT_Sit_In_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 51: AnimOynat(playerid, "TATTOOS", "TAT_Sit_In_T", 4.0, 0, 0, 0, 1, 1, 1);
		case 52: AnimOynat(playerid, "TATTOOS", "TAT_Sit_Loop_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 53: AnimOynat(playerid, "TATTOOS", "TAT_Sit_Loop_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 54: AnimOynat(playerid, "TATTOOS", "TAT_Sit_Loop_T", 4.0, 0, 0, 0, 1, 1, 1);
		case 55: AnimOynat(playerid, "TATTOOS", "TAT_Sit_Out_O", 4.0, 0, 0, 0, 1, 1, 1);
		case 56: AnimOynat(playerid, "TATTOOS", "TAT_Sit_Out_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 57: AnimOynat(playerid, "TATTOOS", "TAT_Sit_Out_T", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/tattoos [1-57]");
	}
	return 1;
}

CMD:tec(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "TEC", "TEC_crouchfire", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "TEC", "TEC_crouchreload", 4.1, 0, 1, 1, 0, 0, 1);
		case 3: AnimOynat(playerid, "TEC", "TEC_fire", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "TEC", "TEC_reload", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/tec [1-4]");
	}
	return 1;
}

CMD:truck(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "TRUCK", "TRUCK_ALIGN_LHS", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "TRUCK", "TRUCK_ALIGN_RHS", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "TRUCK", "TRUCK_closedoor_LHS", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "TRUCK", "TRUCK_closedoor_RHS", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "TRUCK", "TRUCK_close_LHS", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "TRUCK", "TRUCK_close_RHS", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "TRUCK", "TRUCK_getin_LHS", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "TRUCK", "TRUCK_getin_RHS", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "TRUCK", "TRUCK_getout_LHS", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "TRUCK", "TRUCK_getout_RHS", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "TRUCK", "TRUCK_jackedLHS", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "TRUCK", "TRUCK_jackedRHS", 4.0, 0, 0, 0, 1, 1, 1);
		case 13: AnimOynat(playerid, "TRUCK", "TRUCK_open_LHS", 4.0, 0, 0, 0, 1, 1, 1);
		case 14: AnimOynat(playerid, "TRUCK", "TRUCK_open_RHS", 4.0, 0, 0, 0, 1, 1, 1);
		case 15: AnimOynat(playerid, "TRUCK", "TRUCK_pullout_LHS", 4.0, 0, 0, 0, 1, 1, 1);
		case 16: AnimOynat(playerid, "TRUCK", "TRUCK_pullout_RHS", 4.0, 0, 0, 0, 1, 1, 1);
		case 17: AnimOynat(playerid, "TRUCK", "TRUCK_Shuffle", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/truck [1-17]");
	}
	return 1;
}

CMD:uzi(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "UZI", "UZI_crouchfire", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "UZI", "UZI_crouchreload", 4.1, 0, 1, 1, 0, 0, 1);
		case 3: AnimOynat(playerid, "UZI", "UZI_fire", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "UZI", "UZI_fire_poor", 4.1, 0, 1, 1, 1, 0, 1);
		case 5: AnimOynat(playerid, "UZI", "UZI_reload", 4.1, 0, 1, 1, 1, 0, 1);
		default: SendServerMessage(playerid, "/uzi [1-5]");
	}
	return 1;
}

CMD:van(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "VAN", "VAN_close_back_LHS", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "VAN", "VAN_close_back_RHS", 4.1, 0, 1, 1, 0, 0, 1);
		case 3: AnimOynat(playerid, "VAN", "VAN_getin_Back_LHS", 4.1, 0, 1, 1, 0, 0, 1);
		case 4: AnimOynat(playerid, "VAN", "VAN_getin_Back_RHS", 4.1, 0, 1, 1, 0, 0, 1);
		case 5: AnimOynat(playerid, "VAN", "VAN_getout_back_LHS", 4.1, 0, 1, 1, 0, 0, 1);
		case 6: AnimOynat(playerid, "VAN", "VAN_getout_back_RHS", 4.1, 0, 1, 1, 0, 0, 1);
		case 7: AnimOynat(playerid, "VAN", "VAN_open_back_LHS", 4.1, 0, 1, 1, 0, 0, 1);
		case 8: AnimOynat(playerid, "VAN", "VAN_open_back_RHS", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/van [1-8]");
	}
	return 1;
}

CMD:vending(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "VENDING", "VEND_Drink2_P", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "VENDING", "VEND_Drink_P", 4.1, 0, 1, 1, 0, 0, 1);
		case 3: AnimOynat(playerid, "VENDING", "vend_eat1_P", 4.1, 0, 1, 1, 0, 0, 1);
		case 4: AnimOynat(playerid, "VENDING", "VEND_Eat_P", 4.1, 0, 1, 1, 0, 0, 1);
		default: SendServerMessage(playerid, "/vending [1-4]");
	}
	return 1;
}

CMD:wuzi(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "WUZI", "CS_Plyr_pt1", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "WUZI", "CS_Plyr_pt2", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "WUZI", "CS_Wuzi_pt1", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "WUZI", "Wuzi_Walk", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/wuzi [1-4]");
	}
	return 1;
}

CMD:snm(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "SNM", "SPANKING_IDLEW", 4.1, 0, 1, 1, 0, 0, 1);
		case 2: AnimOynat(playerid, "SNM", "SPANKING_IDLEP", 4.1, 0, 1, 1, 0, 0, 1);
		case 3: AnimOynat(playerid, "SNM", "SPANKINGW", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "SNM", "SPANKINGP", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "SNM", "SPANKEDW", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "SNM", "SPANKEDP", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "SNM", "SPANKING_ENDW", 4.1, 0, 1, 1, 0, 0, 1);
		case 8: AnimOynat(playerid, "SNM", "SPANKING_ENDP", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/snm [1-8]");
	}
	return 1;
}

CMD:blowjob(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "BLOWJOBZ", "BJ_COUCH_START_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "BLOWJOBZ", "BJ_COUCH_START_W", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "BLOWJOBZ", "BJ_COUCH_LOOP_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "BLOWJOBZ", "BJ_COUCH_LOOP_W", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "BLOWJOBZ", "BJ_COUCH_END_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "BLOWJOBZ", "BJ_COUCH_END_W", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "BLOWJOBZ", "BJ_STAND_START_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "BLOWJOBZ", "BJ_STAND_START_W", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "BLOWJOBZ", "BJ_STAND_LOOP_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "BLOWJOBZ", "BJ_STAND_LOOP_W", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "BLOWJOBZ", "BJ_STAND_END_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "BLOWJOBZ", "BJ_STAND_END_W", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/blowjob [1-12]");
	}
	return 1;
}

CMD:sex(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: AnimOynat(playerid, "SEX", "SEX_1_W", 4.0, 0, 0, 0, 1, 1, 1);
		case 2: AnimOynat(playerid, "SEX", "SEX_1_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 3: AnimOynat(playerid, "SEX", "SEX_2_W", 4.0, 0, 0, 0, 1, 1, 1);
		case 4: AnimOynat(playerid, "SEX", "SEX_2_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 5: AnimOynat(playerid, "SEX", "SEX_3_W", 4.0, 0, 0, 0, 1, 1, 1);
		case 6: AnimOynat(playerid, "SEX", "SEX_3_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 7: AnimOynat(playerid, "SEX", "SEX_1_CUM_W", 4.0, 0, 0, 0, 1, 1, 1);
		case 8: AnimOynat(playerid, "SEX", "SEX_1_CUM_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 9: AnimOynat(playerid, "SEX", "SEX_1_FAIL_W", 4.0, 0, 0, 0, 1, 1, 1);
		case 10: AnimOynat(playerid, "SEX", "SEX_1_FAIL_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 11: AnimOynat(playerid, "SEX", "SEX_2_FAIL_W", 4.0, 0, 0, 0, 1, 1, 1);
		case 12: AnimOynat(playerid, "SEX", "SEX_2_FAIL_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 13: AnimOynat(playerid, "SEX", "SEX_3_FAIL_W", 4.0, 0, 0, 0, 1, 1, 1);
		case 14: AnimOynat(playerid, "SEX", "SEX_3_FAIL_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 15: AnimOynat(playerid, "SEX", "SEX_1TO2_W", 4.0, 0, 0, 0, 1, 1, 1);
		case 16: AnimOynat(playerid, "SEX", "SEX_1TO2_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 17: AnimOynat(playerid, "SEX", "SEX_2TO3_W", 4.0, 0, 0, 0, 1, 1, 1);
		case 18: AnimOynat(playerid, "SEX", "SEX_2TO3_P", 4.0, 0, 0, 0, 1, 1, 1);
		case 19: AnimOynat(playerid, "SEX", "SEX_3TO1_W", 4.0, 0, 0, 0, 1, 1, 1);
		case 20: AnimOynat(playerid, "SEX", "SEX_3TO1_P", 4.0, 0, 0, 0, 1, 1, 1);
		default: SendServerMessage(playerid, "/sex [1-20]");
	}
	return 1;
}

CMD:dance(playerid, params[])
{
	new id;
	sscanf(params, "d", id);
	switch(id)
	{
		case 1: return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE1);
		case 2: return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE2);
		case 3: return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE3);
		case 4: return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE4);
		default: SendServerMessage(playerid, "/dance [1-4]");
	}
	return 1;
}

CMD:crack3(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "CRACK", "crckdeth3", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:putdown(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "CARRY", "putdwn", 3.0, 0, 0, 0, 0, 0);
	return 1;
}

CMD:walk(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendClientMessage(playerid, COLOR_ADM, "Bu komutu þu anda kullanamazsýn.");

	switch (PlayerData[playerid][pWalkstyle])
	{
		case 0: PlayAnimation(playerid, "PED", "WALK_player", 4.1, 1, 1, 1, 1, 1, 1);
		case 1: PlayAnimation(playerid, "PED", "WALK_walksexy", 4.1, 1, 1, 1, 1, 1, 1);
		case 2: PlayAnimation(playerid, "PED", "WALK_fat", 4.1, 1, 1, 1, 1, 1, 1);
		case 3: PlayAnimation(playerid, "PED", "WALK_fatold", 4.1, 1, 1, 1, 1, 1, 1);
		case 4: PlayAnimation(playerid, "PED", "WALK_gang1", 4.1, 1, 1, 1, 1, 1, 1);
		case 5: PlayAnimation(playerid, "PED", "WALK_gang2", 4.1, 1, 1, 1, 1, 1, 1);
		case 6: PlayAnimation(playerid, "PED", "WALK_old", 4.1, 1, 1, 1, 1, 1, 1);
		case 7: PlayAnimation(playerid, "PED", "WALK_armed", 4.1, 1, 1, 1, 1, 1, 1);
		case 8: PlayAnimation(playerid, "PED", "WALK_civi", 4.1, 1, 1, 1, 1, 1, 1);
		case 9: PlayAnimation(playerid, "PED", "WALK_DRUNK", 4.1, 1, 1, 1, 1, 1, 1);
	}
	return 1;
}

CMD:crack(playerid, params[])
{
	if(!AnimationCheck(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	PlayAnimation(playerid, "CRACK", "Bbalbat_Idle_01", 4.0, 0, 0, 0, 1, 1, 1);
	return 1;
}

CMD:caranim(playerid, params[])
{
	if(PlayerData[playerid][pBrutallyWounded]) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");
	if(!IsPlayerInAnyVehicle(playerid)) return SendErrorMessage(playerid, "Bu komutu þu anda kullanamazsýn.");

	new anim[6];
	if(sscanf(params, "s[6]", anim)) return SendUsageMessage(playerid, "/caranim [relax/tap]");

	if(!strcmp(anim, "relax"))
	{
		PlayAnimation(playerid, "LOWRIDER", "SIT_RELAXED", 4.1, 0, 0, 0, 1, 0, 1);
	}
	else if(!strcmp(anim, "tap"))
	{
		PlayAnimation(playerid, "LOWRIDER", "TAP_HAND", 4.1, 0, 0, 0, 1, 0, 1);
	}
	else SendUsageMessage(playerid, "/caranim [relax/tap]");
	return 1;
}

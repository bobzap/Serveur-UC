//ARMA3Alpha function LV_fnc_menGroup v1.3 - by SPUn / lostvar
//Spawn infantry group and returns leader
private ["_BLUmen3","_OPFarrays","_BLUarrays","_INDgrp","_INDhq","_INDmen","_OPFmen2","_BLUmen2","_pos","_side","_size","_BLUmen","_OPFmen","_men","_amount","_BLUhq","_BLUgrp","_OPFhq","_OPFgrp","_grp","_i","_man1","_man","_leader"];
_pos = _this select 0;
_side = _this select 1;
_size = _this select 2;
_grpId = if (count _this > 3) then { _this select 3;} else {nil};	

_BLUmen = ["B_Soldier_A_F","B_soldier_AR_F","B_medic_F","B_engineer_F","B_soldier_exp_F","B_Soldier_GL_F","B_soldier_M_F","B_soldier_AA_F","B_soldier_AT_F","B_officer_F","B_soldier_repair_F","B_Soldier_F","B_soldier_LAT_F","B_Soldier_lite_F","B_Soldier_SL_F","B_Soldier_TL_F","B_soldier_AAR_F","B_soldier_AAA_F","B_soldier_AAT_F"];
_BLUmen2 = ["B_recon_exp_F","B_recon_JTAC_F","B_recon_M_F","B_recon_medic_F","B_recon_F","B_recon_LAT_F","B_recon_TL_F","B_soldier_AAR_F","B_soldier_AAA_F","B_soldier_AAT_F"];
_BLUmen3 = ["B_G_Soldier_A_F","B_G_soldier_AR_F","B_G_medic_F","B_G_engineer_F","B_G_soldier_exp_F","B_G_Soldier_GL_F","B_G_soldier_M_F","B_G_officer_F","B_G_Soldier_F","B_G_soldier_LAT_F","B_G_Soldier_lite_F","B_G_Soldier_SL_F","B_G_Soldier_TL_F"];
_BLUarrays = [_BLUmen,_BLUmen2,_BLUmen3];
_OPFmen = ["SWOP_CIS_droid","SWOP_CIS_droid_AT","SWOP_CIS_droid_mg","SWOP_CIS_droid_crew","SWOP_CIS_droid","SWOP_CIS_droid_mg","SWOP_CIS_droid_mg","RD501_AA_Droid","B2_superdroid_Rocket","SWOP_CIS_droid_EWEB","SWOP_CIS_droid","SWOP_CIS_droid","SWOP_CIS_droid"];
_OPFmen2 = ["SWOP_CIS_droid_AT"];
_OPFarrays = [_OPFmen,_OPFmen2];
_INDmen = ["SWOP_CIS_droid_AT"];

_men = [];
if(typeName _size == "ARRAY")then{
	_amount = ((random (_size select 0)) + (_size select 1));
}else{
	_amount = _size;
};

switch(_side)do{
	case 0:{
		_men = (_BLUarrays call BIS_fnc_selectRandom);
		_BLUhq = createCenter west;
		_BLUgrp = createGroup west;
		_grp = _BLUgrp;
	};
	case 1:{
		_men = (_OPFarrays call BIS_fnc_selectRandom);
		_OPFhq = createCenter east;
		_OPFgrp = createGroup east;
		_grp = _OPFgrp;
	};
	case 2:{
		_men = _INDmen;
		_INDhq = createCenter resistance;
		_INDgrp = createGroup resistance;
		_grp = _INDgrp;
	};
};

_i = 0; 
for "_i" from 0 to _amount do {
	_man1 = _men select (floor(random(count _men)));
	_man = _grp createUnit [_man1, _pos, [], 0, "NONE"];
};

if(!isNil("_grpId"))then{
	call compile format ["LVgroup%1 = _grp",_grpId];
};

_leader = leader _grp;
_leader
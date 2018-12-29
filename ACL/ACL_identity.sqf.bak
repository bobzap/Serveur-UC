/*------------------------------------------------------------------------
=ATM= AMBIENT CIVILIAN LIFE

by Mercier
http://atmarma.fr/forum/portal.php
------------------------------------------------------------------------*/

sleep 3;
_unit = (_this select 0);

// -------------------------------- GENERATE ID NUMBER
_ID1 = floor (random 9);
_ID2 = floor (random 9);
_ID3 = floor (random 9);
_ID4 = floor (random 9);
_ID5 = floor (random 9);
_IDnumber = format ["%1%2%3%4%5",_ID1,_ID2,_ID3,_ID4,_ID5],

// -------------------------------- VARIABLES ASSIGNATION
_unitAge = floor (25 + random 200);
_currentYear = (date select 0);

_birth_day = 10 + (floor (random 68));
_birth_month = 1 + floor (random 98);
_birth_year = (_currentYear - _unitAge + 5412);
_birth_date = format ["%1.%2.%3 <t color='#fffff' size='0.8'>(%4)</t>",_birth_day,_birth_month,_birth_year,_unitAge];

_name = ACL_NameGenerator call BIS_fnc_selectRandom;

private "_ACL_IDENTITY_OVERWRITE";
_ACL_IDENTITY_OVERWRITE = (_unit getvariable "ACL_IDENTITY_NAME");
if (isnil "_ACL_IDENTITY_OVERWRITE") then {_unit setVariable ["ACL_IDENTITY_NAME",_name,true]};

_unit setVariable ["ACL_IDENTITY_ID",_IDnumber,true];
_unit setVariable ["ACL_IDENTITY_BIRTH",_birth_date,true];
[[[_unit], "ACL\ACL_actions.sqf"], "BIS_fnc_execVM", true] call BIS_fnc_MP;
_unit setVariable ["ACL_CIVILIAN_STOP", false, true];

_cooperation_rate = floor (random 100);
if (_cooperation_rate <= ACL_PARAM_Cooperation)
then {_unit setVariable ["ACL_COOP_isFrendly", 1, true]}
else {_unit setVariable ["ACL_COOP_isFrendly", 0, true]};

hintSilent format ["%1",_cooperation_rate];
//if (ACL_PARAM_Murder) then {[[_unit], "ACL_FNC_CivilianKilled", true, false] spawn BIS_fnc_MP};







// ======================================================================== FACE SELECTION
ACL_Face_list = ["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"];
if (_unitAge >= 60) then
{
	_unit setFace "GreekHead_A3_03"
}
else
{
	_face = ACL_Face_list call BIS_fnc_selectRandom;
	_unit setFace _face;
};

// ======================================================================== HEADGEAR SELECTION
removeHeadgear _unit;
_AllowHeadgear = [true,false] call BIS_fnc_selectRandom;
if ((face _unit) == "GreekHead_A3_03") then {_AllowHeadgear = true};
if (!_AllowHeadgear) then
{
	removeHeadgear _unit;
}
else
{
	ACL_Headgear_list = ["H_Cap_red","H_Cap_blu","H_Cap_grn","H_Cap_oli","H_Cap_blk","H_Cap_tan"];
	// SI LE MOD CAF AGGRESSORS EST ACTIVÉ
	if (isClass(configFile >> "CfgPatches" >> "caf_ag_equip"))
	then {ACL_Headgear_list = ACL_Headgear_list + ["H_caf_ag_paktol_04","H_caf_ag_paktol","H_caf_ag_paktol_03","H_caf_ag_paktol_02","H_caf_ag_turban"]};
	// SI LE MOD TRYK EST ACTIVÉ
	if (isClass(configFile >> "CfgPatches" >> "TRYK_Uniform"))
	then {ACL_Headgear_list = ACL_Headgear_list + ["TRYK_H_pakol2"]};
	// SI LE MOD LEIGHT OPFOR EST ACTIVÉ
	if (isClass(configFile >> "CfgPatches" >> "lop_main"))
	then {ACL_Headgear_list = ACL_Headgear_list + ["LOP_H_Pakol","LOP_H_Turban"]};
	_headgear = ACL_Headgear_list call BIS_fnc_selectRandom;
	_unit addHeadgear _headgear;
};
// ======================================================================== UNIFORM SELECTION
ACL_Uniform_list = ["SWOP_RebDB_FSI_CombatUniform","SWOP_RebF_FRI_CombatUniform","SWOP_RebWbr_mon_calamari_rebelI_CombatUniform","SWOP_rebelsdark_FDurosI_CombatUniform","SWOP_rebelsbr_FII_CombatUniform","SWOP_RebWdark_TwilekI_CombatUniform","SWOP_RebB_vurkI_CombatUniform","SWOP_RebWdark_weequay_rebelI_CombatUniform"];

// SI LE MOD CAF AGGRESSORS EST ACTIVÉ
if (isClass(configFile >> "CfgPatches" >> "caf_ag_equip")) then
{
	ACL_Uniform_list = ACL_Uniform_list +
	[
		"U_CAF_AG_ME_ROBES_04d",
		"U_CAF_AG_ME_ROBES_04c",
		"U_CAF_AG_ME_ROBES_04b",
		"U_CAF_AG_ME_ROBES_04a",
		"U_CAF_AG_ME_ROBES_04",
		"U_CAF_AG_ME_ROBES_03d",
		"U_CAF_AG_ME_ROBES_03c",
		"U_CAF_AG_ME_ROBES_03b",
		"U_CAF_AG_ME_ROBES_03a",
		"U_CAF_AG_ME_ROBES_03",
		"U_CAF_AG_ME_ROBES_02c",
		"U_CAF_AG_ME_ROBES_02b",
		"U_CAF_AG_ME_ROBES_02a",
		"U_CAF_AG_ME_ROBES_02",
		"U_CAF_AG_ME_ROBES_01d",
		"U_CAF_AG_ME_ROBES_01c",
		"U_CAF_AG_ME_ROBES_01b",
		"U_CAF_AG_ME_ROBES_01a",
		"U_CAF_AG_ME_ROBES_01",
		"U_CAF_AG_AFR_CLOTHES_01d",
		"U_CAF_AG_AFR_CLOTHES_01c",
		"U_CAF_AG_AFR_CLOTHES_01e",
		"U_CAF_AG_AFR_CLOTHES_01"
	];
};

// SI LE MOD TRYK EST ACTIVÉ
if (isClass(configFile >> "CfgPatches" >> "TRYK_Uniform")) then
{
	ACL_Uniform_list = ACL_Uniform_list +
	[
		"TRYK_U_B_Denim_T_WH",
		"TRYK_U_B_Denim_T_BK",
		"TRYK_U_B_BLK_T_WH",
		"TRYK_U_B_RED_T_BR",
		"TRYK_U_B_BLK_T_BK",
		"TRYK_U_denim_jersey_blu",
		"TRYK_U_denim_jersey_blk",
		"TRYK_U_B_C02_Tsirt"
	];
};

// SI LE MOD LEIGHT OPFOR EST ACTIVÉ
if (isClass(configFile >> "CfgPatches" >> "lop_main")) then
{
	ACL_Uniform_list = ACL_Uniform_list +
	[
		"LOP_U_TAK_Civ_Fatigue_04",
		"LOP_U_TAK_Civ_Fatigue_02",
		"LOP_U_TAK_Civ_Fatigue_01",
		"LOP_U_PMC_Fatigue_02",
		"LOP_U_AFR_Civ_01S"
	];
};
_uniform = ACL_Uniform_list call BIS_fnc_selectRandom;
_unit forceAddUniform _uniform;
// ======================================================================== GOGGLES/BEARD SELECTION
removeGoggles _unit;
ACL_Goggles_list = ["","G_Aviator"];
// SI LE MOD TRYK EST ACTIVÉ
if (isClass(configFile >> "CfgPatches" >> "TRYK_Uniform")) then
{
	ACL_Goggles_list = ACL_Goggles_list + ["TRYK_Beard_BK","TRYK_Beard_BK2","TRYK_Beard_BK3","TRYK_Beard_BK4","TRYK_Shemagh_mesh","TRYK_Shemagh_G","TRYK_Shemagh","TRYK_Shemagh_WH"];
	if ((face _unit) == "GreekHead_A3_03") then
	{
		ACL_Goggles_list = ["","G_Aviator","TRYK_Beard_Gr","TRYK_Beard_Gr2","TRYK_Beard_Gr3","TRYK_Beard_Gr4"];
	};
};
_goggles = ACL_Goggles_list call BIS_fnc_selectRandom;
_unit addGoggles _goggles;
if (true) exitWith {};
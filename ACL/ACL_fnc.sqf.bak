/*------------------------------------------------------------------------
=ATM= AMBIENT CIVILIAN LIFE

by Mercier
http://atmarma.fr/forum/portal.php
------------------------------------------------------------------------*/

// ================================================================================================ Contrôle des touches clavier
ACL_fnc_keys =
{
	private ["_key"];
	_player = (_this select 0);
	allowKey = false;
	sleep 0.8;
	allowKey = true;
	while {allowKey} do
	{
		if (inputAction "User1" > 0 ) then
		{
			[_player] spawn ACL_fnc_stop;
			allowKey = false;
			sleep 0.8;
			allowKey = true;
		};
		if (inputAction "User2" > 0 ) then
		{
			[_player] spawn ACL_fnc_move;
			allowKey = false;
			sleep 0.8;
			allowKey = true;
		};
	};
};
// ================================================================================================ Ordonne au civil de s'arrêter
ACL_fnc_stop =
{
	private ["_target","_position","_draw_FAR","_draw_STOP"];
	_player = (_this select 0);
	if (isNull cursorTarget) exitWith
	{
		_text = "<t align='left' shadow='0' size='0.7' font='PuristaBold'>PAS DE CIBLE<br/></t>";
		[_text, 1, 1.4] spawn ACL_BIS_dynamicText;
	};
	_target = cursorTarget;

	if (_target getVariable "ACL_Civilian_Stop") exitWith {};
	if ( (!alive _target) || ((side _target) != CIVILIAN) ) exitWith {};
// ------------------------------------------------------
	if ((_player  distance _target) > 10) exitWith
	{
		_text = "<t align='left' shadow='0' color='#732020' size='0.7' font='PuristaBold'>LA CIBLE EST TROP LOIN<br/></t>";
		[_text, 1.1, 0.8] spawn ACL_BIS_dynamicText;
	};
// ------------------------------------------------------
	//ACL_ArrayCivilians pushBack _target;

	_player playActionNow "gestureFreeze";
	_target setVariable ["ACL_Civilian_Stop", true, true];
	
};
// ================================================================================================ Ordonne au civil de bouger
ACL_fnc_move =
{
	private ["_target"];
	_player = (_this select 0);
	if (isNull cursorTarget) exitWith
	{
		_text = "<t align='left' shadow='0' size='0.7' font='PuristaBold'>PAS DE CIBLE<br/></t>";
		[_text, 1, 1.4] spawn ACL_BIS_dynamicText;
	};
	_target = cursorTarget;
	if !(_target getVariable "ACL_Civilian_Stop") exitWith {};
	if ( (!alive _target) || ((side _target) != CIVILIAN) ) exitWith {};
	_distance = (_player  distance _target);
	if ((_player  distance _target) > 10) exitWith
	{
		_text = "<t align='left' shadow='0' color='#732020' size='0.7' font='PuristaBold'>LA CIBLE EST TROP LOIN<br/></t>";
		[_text, 1.1, 0.8] spawn ACL_BIS_dynamicText;
	};
	_player playActionNow "gestureGo";
	_target setVariable ["ACL_Civilian_Stop", false, true];
	//ACL_ArrayCivilians = (ACL_ArrayCivilians - [_target]);
	//publicVariable "ACL_ArrayCivilians";
};
// ================================================================================================ Animations du joueur
ACL_fnc_gesture =
{
	_unit = (_this select 0);
	_anim = (_this select 1);
	if (_anim in ["gestureFreeze", "gestureGo"]) then {_unit playActionNow _anim};
};
// ================================================================================================ EventHandler "KILLED"
ACL_fnc_civilianKilled =
{
	(_this select 0) addEventHandler
	[
		"KILLED",
		"_unit = (_this select 0);
		_killer= (_this select 1);
		if ( (_killer == player) || ((vehicle _killer) == player) ) then {ACL_PARAM_Cooperation = -1; publicVariable 'ACL_PARAM_Cooperation'}"
	];
};
// ================================================================================================ Filtre OPFOR
ACL_fnc_filter_EAST =
{
    if (((side _this) == EAST) && (alive _this)) exitWith {true};
	false
};
// ================================================================================================ Filtre CIVILS
ACL_fnc_filter_CIVILIAN =
{
    if ( ((side _this) == CIVILIAN) && (alive _this) ) exitWith {true};
	false
};
// ================================================================================================ Classnames civils
ACL_class_VANILLA =
[
	"C_man_p_beggar_F",
	"C_man_1",
	"C_man_polo_1_F",
	"C_man_polo_2_F",
	"C_man_polo_3_F",
	"C_man_polo_4_F",
	"C_man_polo_5_F",
	"C_man_polo_6_F",
	"C_man_shorts_1_F",
	"C_man_1_1_F",
	"C_man_1_2_F",
	"C_man_1_3_F",
	"C_man_p_fugitive_F",
	"C_man_p_shorts_1_F",
	"C_man_hunter_1_F",
	"C_man_shorts_2_F",
	"C_man_shorts_3_F",
	"C_man_shorts_4_F"
];
ACL_class_AFGHAN =
[
	"CAF_AG_ME_CIV_02",
	"CAF_AG_ME_CIV_03",
	"CAF_AG_ME_CIV_04",
	"CAF_AG_ME_CIV"
];
ACL_class_AFRICAN =
[
	"CAF_AG_AFR_CIV_02",
	"CAF_AG_AFR_CIV_03",
	"CAF_AG_AFR_CIV_04",
	"CAF_AG_AFR_CIV"
];
ACL_class_Civilians = ACL_class_VANILLA + ACL_class_AFGHAN + ACL_class_AFRICAN;

if (true) exitWith {};
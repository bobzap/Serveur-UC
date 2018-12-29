/*------------------------------------------------------------------------
=ATM= AMBIENT CIVILIAN LIFE

by Mercier
http://atmarma.fr/forum/portal.php
------------------------------------------------------------------------*/

_unit = _this select 0;
_isFrendly = (_unit getVariable "ACL_COOP_isFrendly");

_marker = (_unit getVariable "ACL_CIVILIAN_MARKER");
_markerPos = (getMarkerPos _marker);
_markerSize = ((getMarkerSize _marker) select 0);

// ===================================== UN CIVIL A ÉTÉ TUÉ PAR UN JOUEUR.
if (ACL_PARAM_Murder) exitWith
{
	_unit globalChat ACL_LG_Murderer_1;
	sleep 3;
	_unit globalChat ACL_LG_Murderer_2;
	_unit setVariable ["ACL_CIVILIAN_STOP", false, true];
};

// ===================================== LE CIVIL NE COOPERE PAS AVEC LE JOUEUR.
if (_isFrendly == 0) exitWith
{
	_speach = ACL_LG_NoCoop call BIS_fnc_selectRandom;
	_unit globalChat _speach;
	_unit setVariable ["ACL_CIVILIAN_STOP", false, true];
};

// ===================================== LE CIVIL COOPERE AVEC LE JOUEUR.

if (_isFrendly == 1) then
{
	private ["_hostiles", "_unit"];

	_unit = (_this select 0);

	_unit setVariable ["ACL_CIVILIAN_STOP", true, true];

	_speach = ACL_LG_Coop call BIS_fnc_selectRandom;
	_unit globalChat _speach;
	sleep 1;
	player globalChat ACL_LG_Player_1;
	sleep 3;
	if (ACL_PARAM_AllowDetection) then
	{
		_hostiles = [(nearestObjects [_unit, ["Man", "Car"], ACL_PARAM_DetectionRadius]), {_x call ACL_FNC_Filter_EAST}] call BIS_fnc_conditionalSelect;
	};
	if ((ACL_PARAM_AllowDetection) && ((count _hostiles) > 0))
	then {_unit globalChat ACL_LG_Answer_1}
	else {_unit globalChat ACL_LG_Answer_2};
};

if (true) exitWith {};
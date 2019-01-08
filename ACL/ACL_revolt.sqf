/*------------------------------------------------------------------------
=ATM= AMBIENT CIVILIAN LIFE

Revolt

By Fabrice
http://atmarma.fr/forum/portal.php
------------------------------------------------------------------------*/

Private ["_i","_unit","_pourcentage"];

_pourcentage = ((_this select 0)/100);



for "_i" from 1 to (floor(count(CivGrp)*_pourcentage)) do
{
	
	_unit = CivGrp call BIS_fnc_selectRandom;
	_enemyGroup = createGroup east;
	[_unit] joinSilent _enemyGroup; 
	_unit addMagazine "SWOP_DL44Pistol_Mag";
	_unit addMagazine "SWOP_DL44Pistol_Mag";
	_unit addWeapon "SWOP_DL44Pistol";
	_unit setBehaviour "AWARE";
    _unit setCombatMode "YELLOW";
	
	_positionIA = position player;
	[_unit, _positionIA, 400] call bis_fnc_taskPatrol
	// _wp = _unit addWaypoint [position _unit, 100]; 
    // _wp setWaypointType "SAD"; 
};
/*------------------------------------------------------------------------
=ATM= AMBIENT CIVILIAN LIFE

by Mercier
http://atmarma.fr/forum/portal.php
------------------------------------------------------------------------*/

private ["_unit","_markerPos","_markerSize","_newPos"];

_unit = (_this select 0);
_markerPos = (_this select 1);
_markerSize = (_this select 2);

_unit setBehaviour "CARELESS";
_unit setSpeedMode "LIMITED";

sleep 1;

// --------------------- CREATION WAYPOINT
_newPos = [_markerPos, _markerSize] call CBA_fnc_randPos;
_unit commandMove _newPos;


waitUntil {(_unit getVariable "ACL_CIVILIAN_STOP") || ((_unit distance _newPos) <= 5)};

if (_unit getVariable "ACL_CIVILIAN_STOP") then
{
	doStop _unit;
	sleep 1;
	waitUntil {!(_unit getVariable "ACL_CIVILIAN_STOP")};
	[_unit,_markerPos,_markerSize] spawn ACL_fnc_patrol;
}
else
{
	[_unit,_markerPos,_markerSize] spawn ACL_fnc_patrol;
};

if (true) exitWith {};
/*------------------------------------------------------------------------
=ATM= AMBIENT CIVILIAN LIFE

by Mercier
http://atmarma.fr/forum/portal.php
------------------------------------------------------------------------*/

_text = (_this select 0);
_x = (_this select 1);
_y = (_this select 2);

[
	_text,
	[safezoneX + safezoneW - _x,1], //DEFAULT: 0.5,0.35
	[safezoneY + safezoneH - _y,1], //DEFAULT: 0.8,0.7
	1,
	0.5
] spawn BIS_fnc_dynamicText;

if (true) exitWith {};
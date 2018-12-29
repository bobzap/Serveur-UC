/*------------------------------------------------------------------------
=ATM= AMBIENT CIVILIAN LIFE

by Fabrice
http://atmarma.fr/forum/portal.php
------------------------------------------------------------------------*/	
	
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
	
	
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
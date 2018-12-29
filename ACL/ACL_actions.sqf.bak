/*------------------------------------------------------------------------
=ATM= AMBIENT CIVILIAN LIFE

by Mercier
http://atmarma.fr/forum/portal.php
------------------------------------------------------------------------*/

private ["_unit","_img"];

_unit = (_this select 0);

_img = "<img size='1.5' image='\A3\ui_f\data\gui\cfg\CommunicationMenu\instructor_ca.paa'/>";
_display = "<t color='#ffb400' size='0.8'>[ACL]</t> Demander la carte d'identité";
_unit addAction [_img + _display, "ACL\ACL_openCard.sqf", [], 99, true, true, "", "(alive _target) && ((_target distance _this) < 4) && (speed _target == 0)"];

_display = "<t color='#ffb400' size='0.8'>[ACL]</t> Parler à l'individu";
_img = "<img size='1.5' image='\A3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_toolbox_units_ca.paa'/>";
_unit addAction [_img + _display, "ACL\ACL_dialogs.sqf", [], 98, true, true, "", "(alive _target) && ((_target distance _this) < 4) && (speed _target == 0)"];


_display = "<t color='#ffb400' size='0.8'>[ACL]</t> STOP";
_unit addAction [ _display, "ACL\ACL_stop.sqf", [], 98, true, true, "", "(alive _target) && ((_target distance _this) < 8) && (speed _target > 0)"];

_display = "<t color='#ffb400' size='0.8'>[ACL]</t> Vous pouvez circuler";
_unit addAction [ _display, "ACL\ACL_move.sqf", [], 98, true, true, "", "(alive _target) && ((_target distance _this) < 4) && (speed _target == 0)"];



if (true) exitWith {};
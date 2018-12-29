/*------------------------------------------------------------------------
=ATM= AMBIENT CIVILIAN LIFE

by Mercier
Modified by Fabrice
http://atmarma.fr/forum/portal.php
------------------------------------------------------------------------*/

_unit = (_this select 0);
_killer = (_this select 1);

if (_killer in allplayers) then
{
	ACL_PARAM_Murder = true;
	publicVariable "ACL_PARAM_Murder";
	waitUntil {!isnil "ACL_PARAM_Murder"};
	
	ACL_PARAM_Cooperation = ACL_PARAM_Cooperation - ACL_Impact_Murder;
	publicVariable "ACL_PARAM_Cooperation";
	waitUntil {!isnil "ACL_PARAM_Cooperation"};
	
};

if (true) exitWith {};
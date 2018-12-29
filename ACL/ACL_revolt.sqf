/*------------------------------------------------------------------------
=ATM= AMBIENT CIVILIAN LIFE

Revolt

By Fabrice  ///((_this select 0)/100);
http://atmarma.fr/forum/portal.php
------------------------------------------------------------------------*/

Private ["_i","_unit","_pourcentage"];

_pourcentage = (100);



for "_i" from 1 to (floor(count(CivGrp)*_pourcentage)) do
{
	
	_unit = CivGrp call BIS_fnc_selectRandom;
	_enemyGroup = createGroup east;
	[_unit] joinSilent _enemyGroup; 
	_unit addMagazine "SWOP_DL44Pistol_Mag";
	_unit addWeapon "SWOP_DL44Pistol";
};
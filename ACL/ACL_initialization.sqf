/*------------------------------------------------------------------------
=ATM= AMBIENT CIVILIAN LIFE

by Mercier
Modified by Fabrice
http://atmarma.fr/forum/portal.php
------------------------------------------------------------------------*/
if (isServer) then
{
	ACL_PARAM_Language = "french"; //Définir la langue parlée par les civils (french/english)
	ACL_PARAM_AllowDetection = true; //Autoriser les civils à informer d'une présence hostile
	ACL_PARAM_DetectionRadius = 200; //Rayon de détection des civils (si ACL_PARAM_AllowDetection = true)
	ACL_PARAM_Murder = false; //Ne pas toucher
	ACL_PARAM_Cooperation = 50; //Taux de coopération 	
	ACL_Impact_Murder = 5; // Impact sur la coopération suite à un meurtre
	ACL_Level_Murder = 40; // niveau tolérable avant émeute
	ACL_Ratio_Revolt = 100; // pourcentage de civils qui se révoltent
	CivGrp = [];
	Tableau_initServeur = ["ACL_PARAM_Language","ACL_PARAM_Cooperation","ACL_PARAM_AllowDetection","ACL_PARAM_DetectionRadius","ACL_PARAM_Murder","ACL_Impact_Murder","CivGrp","ACL_Level_Murder"]; 
	{
		publicVariable _x; 
		waitUntil {!isnil _x};
	} forEach Tableau_initServeur;	
	
	
};
// --------------------------------------------------------
execVM "ACL\ACL_fnc.sqf";
execVM "ACL\ACL_language.sqf";
execVM "ACL\ACL_nameGenerator.sqf";

ACL_fnc_patrol = compile preprocessFile "ACL\ACL_patrol.sqf";
ACL_BIS_dynamicText = compile preprocessFile "ACL\ACL_BIS_dynamicText.sqf";

sleep 2;
//[player] spawn ACL_fnc_keys;

// ------------------ AJOUTER AUTANT DE FOIS QU'IL Y A DE SECTEURS ------ [TYPE DE CIVILS, "NOM_MARQUEUR", NOMBRE DE CIVILS] execVM
//_s1 = [0, "marker_1", 5] execVM "ACL\ACL_spawn.sqf";

//_s1 = [0, "marker_2", 5] execVM "ACL\ACL_spawn.sqf";




//---Modifier le valeur pour déterminer le niveau de coopération avant la riposte et le pourcentage de civils armés ---[pourcentage] execVM



sleep 5;


waitUntil {ACL_PARAM_Cooperation < ACL_Level_Murder};
_revolte = [ACL_Ratio_Revolt] execVM "ACL\ACL_revolt.sqf", execVM "UC\Chefrevolt\chefr.sqf";





if (true) exitWith {};
/* /
Author : Sayker 
Client : Pour la communauté Union Corp
Date : 06/12/2018
Objet : Script lancer des objectifs lors du questionnaire chef du village. 
1. creer un trigger avec condition pour valider celui ci :  ok
2. Créer une task pour avoir une notification plus attractive. 
3. Ajouter de la coopération.
/ */


_position = GetPos player;

//if (isserver) then {

[west,["Diplomatie"],["Apporter 5150 CR au chef du village pour apaiser les tensions. Apporter les crédits dans une caisse prévue pour les transactions","Diplomate"],[0,0,0],1,2,true] call BIS_fnc_taskCreate;

["Diplomatie", position player ] call BIS_fnc_taskSetDestination;

_position2 = GetPos player;

//_randomCR = ["1220", "1500", "1700", "1800","1900","2100","2200","3300","2300","2500","2700","2900","3100","3700","2600","1000","3800","3900","4100","4400","4500","5000"] call BIS_fnc_selectRandom;
//_exigenceCR = _randomCR;
//_exigenceCR = 5000;

waitUntil { 
	
	count ( _position2 nearObjects ["Box_C_UAV_06_F", 7]) > 0 
	
		  };

//Money = Tablette_UC call grad_lbm_fnc_getFunds;
//If (Money > 5000  ) exitWith {true};


Tablette_UC = _position2 nearEntities ["Box_C_UAV_06_F", 7];
execVM "UC\chefquestion\taskemisuite.sqf";

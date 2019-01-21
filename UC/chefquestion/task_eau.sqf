/* /
Author : Sayker 
Client : Pour la communauté Union Corp
Date : 06/12/2018
Objet : Script lancer des objectifs lors du questionnaire chef du village. 
1. creer un trigger avec condition pour valider celui ci :  ok
2. Créer une task pour avoir une notification plus attractive. 
3. Ajouter de la coopération.
/ */


// test du create Trigger

// _trg = createTrigger ["EmptyDetector", getPos player];
// _trg setTriggerArea [5, 5, 0, false];
// _trg setTriggerActivation ["NONE", "PRESENT", true];
// _trg setTriggerStatements ["count ([4080.77,6659.5] nearObjects ['Land_OfficeChair_01_F', 5]) > 0", "hint 'Obj ok'", "hint 'Obj Terminé'"];


_position = GetPos player;




// publicvariable "briefing"; 
// creation est spawn de la task
//[west,objectif,["",titre,cible],"",true]call bis_fnc_taskCreate; // attention a la side avec on joue

[west,["Denrée"],["Apporter des bidons d'eaux au chef du village","Aide Autocthonne","Vivre Marker"],[0,0,0],1,2,true] call BIS_fnc_taskCreate;

//[west,objectif,[titre,"Denrée","Eau"],[position player],1,2,true] call BIS_fnc_taskCreate

["Denrée", position player ] call BIS_fnc_taskSetDestination;


//player creatediaryrecord ["Diary",[_this select 0,_this select 4]];


waitUntil { count ( _position nearObjects ["Land_WaterTank_03_F", 5]) > 0};
["Denrée","SUCCEEDED",true] call bis_fnc_taskSetState;
execVM "UC\chefquestion\recompense_eau.sqf";







//Script Nearest OBJECT selon le nombre !
//_obj = player nearObjects ["Land_OfficeChair_01_F", 10];


/* _obj = count (player nearObjects ["Land_OfficeChair_01_F", 20]); // WORKS!

if ( _obj > 0 )

then 
	{

hint "ok"

	}


else 
	{ 

hint "no"


	}; */

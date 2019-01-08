// Author : Sayker 
// Client : Pour la communauté Union Corp
// Date : 06/12/2018
// Objet : Script lancer des objectifs lors du questionnaire chef du village. 
// 
// 2. Lorsqu'il y a un addeventHandler de dégat sur les ia, appel la fct pour  de switch les Ia en OPFOR
//
// FAIRE APPELER CE SCRIPT QUAND IL Y A CREATION DU CHEF DE VILLAGE, A METTRE DANS ATM FOULE MODIF BY SAYKER


// _type = player nearEntities [["SWOP_Band_trando_assault","SWOP_Band_week_serg","SWOP_Band_week_mg","SWOP_Band_week_aa","SWOP_Band_Rod_med"], 500];

// waitUntil { 

// _EH = ["ace_killed", 
	// {
    // params ["_type"];
    // [_type, _type getVariable "ace_medical_lastDamageSource"] execVM "UC\Chefrevolt\switchChefgroupe.sqf"
	
	// }] call CBA_fnc_addEventHandler; 
// };
	
//_centre = player nearEntities [["SWOP_Band_Rod_a280"],400];
_positionIA = position player;


_type = player nearEntities [["SWOP_Band_trando_assault","SWOP_Band_week_serg","SWOP_Band_week_mg","SWOP_Band_week_aa","SWOP_Band_Rod_med"], 400];


	_enemyGroup = createGroup east;
	_type joinSilent _enemyGroup; 
	


     [_type, _positionIA, 300] call bis_fnc_taskPatrol  //--> patrol by bohemia	
	// _wp = _type addWaypoint [position _type, 200]; 
    // _wp setWaypointType "SAD"; 
	
 
    
	
	
	
	
/* /
Author : Sayker 
Client : Pour la communauté Union Corp
Date : 06/12/2018
Objet : Script lancer des objectifs lors du questionnaire chef du village. 
1. creer un trigger avec condition pour valider celui ci :  ok
2. Créer une task pour avoir une notification plus attractive.  ok
3. Ajouter de la coopération.
/ */



ACL_param_cooperation = 50;
ACL_Level_Murder = 40;
ACL_Ratio_Revolt = 100;


/* _centre = player nearEntities ["SWOP_Band_Rod_a280",300];
_positionIA = position player; //getpos _centre;

// laisser le chef du village et le civil qui va cherche le chef en CIVIL pour ne aps bloquer le jeu.
_type = player nearEntities [["SWOP_Band_trando_assault","SWOP_Band_week_serg","SWOP_Band_week_mg","SWOP_Band_week_aa","SWOP_Band_Rod_med","C_man_shorts_4_F"], 400];


// CREER DES CIVIL SEUL ET PAS DANS UN GROUPE //  à chercher comment peut-être for EACH
//_typeciv =  player nearEntities ["C_man_shorts_4_F", 400];




//[_type, getPos _positionIA, 300] call bis_fnc_taskPatrol  //--> patrol by bohemia	

	_civilgroup = createGroup civilian;
	_type joinSilent _civilgroup; 
	

	//ligne ci-dessous à tester
	[_type, _positionIA, 300] call bis_fnc_taskPatrol 
	

waitUntil {ACL_PARAM_Cooperation < ACL_Level_Murder};
_revolte = [ACL_Ratio_Revolt] execVM "ACL\ACL_revolt.sqf", execVM "UC\Chefrevolt\chefr.sqf";	
	
	
	
	//_wp = _type addWaypoint [position _type, 200]; 
   // _wp setWaypointType "SAD";  */
	
	
	/////////////////////METHODE DU 20/12/2018//////////////////////
	
	


_centre = player nearEntities ["C_Soldier_VR_F",300];
_positionIA = position player; //getpos _centre;

// laisser le chef du village et le civil qui va cherche le chef en CIVIL pour ne PAs bloquer le jeu.
_type = player nearEntities [["SWOP_Band_trando_assault","SWOP_Band_week_serg","SWOP_Band_week_mg","SWOP_Band_week_aa","SWOP_Band_Rod_med"], 400];


// CREER DES CIVIL SEUL ET PAS DANS UN GROUPE //  à chercher comment peut-être for EACH
/////////////////////////////////
// --> ATTENTION LES CIVILS SONT AJOUTER DANS LE MEME GROUPE _type  Il faut en créer un deuxième pour les civil opfor !!!!!!!!
/////////////////////////////////


_typeciv =  player nearEntities ["C_man_shorts_4_F", 400];




//[_type, getPos _positionIA, 300] call bis_fnc_taskPatrol  //--> patrol by bohemia	

/* 
Définir le leader _leadergroup = _centre;

 _type = group _centre; 
_newLeader = _centre; 
 
[_type,_newLeader] remoteExec ["selectLeader",groupOwner _type]; 

 */


	_civilgroup = createGroup civilian;
	_type joinSilent _civilgroup; 
	

	//ligne ci-dessous à tester
	[_civilgroup, _positionIA, 300] call bis_fnc_taskPatrol;
	


	_civilgroup2 = createGroup civilian;
	_typeciv joinSilent _civilgroup2; 

		//ligne ci-dessous à tester
	[_civilgroup2, _positionIA, 300] call bis_fnc_taskPatrol;



waitUntil {ACL_PARAM_Cooperation < ACL_Level_Murder};
_revolte = [ACL_Ratio_Revolt] execVM "ACL\ACL_revolt.sqf", execVM "UC\Chefrevolt\chefr.sqf";	
	
	
	
	
	
	
	
	
	//_wp = _type addWaypoint [position _type, 200]; 
   // _wp setWaypointType "SAD"; 
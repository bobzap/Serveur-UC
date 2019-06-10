
//Author : Sayker 
//Client : Pour la communauté Union Corp
//Date : 10/12/2018
//Objet : Script pour spawn de groupe Ia sur position précise, avec plusieurs offensives et intensitées.


//spawn: ok   position: ok   attitude: ok   if: ok 	random: ok 		
//Intensité: à FAIRE   
//Changer les variable pour plus de variabilité : à FAIRE
// 3 groupes selon numéro d'intensité: 1 = petite patrouille  avec messe d'avertissement 2= patrouille avec leger  + hint et 3= 2 patrouille + vehicule leger + lourd


//Numéro d'intensité + déclaration des unité par intensité
//_team = ["B_RangeMaster_F","B_RangeMaster_F"];


// Définition des variables pour augmenter le random
// Intensité selon nombre de joueur présent dans un rayon de 100m lors du déclenchement

_position = GetPos player;
_intensite = count (allPlayers select {_x distance _position < 100}); 


_spawnCsi = ["ia1_0", "ia1_1", "ia1_2", "ia1_3"] call BIS_fnc_selectRandom;

if ( _intensite < 4 ) then {

//Uc_groupa va déclarer les variables contenues dans le parametre
UC_groupa = ["SWOP_CIS_droid", "SWOP_CIS_droid", "SWOP_CIS_droid", "CAA_CIS_Battledroid_AT"];

}

else { 
UC_groupa = ["SWOP_CIS_droid", "SWOP_CIS_droid", "SWOP_CIS_droid", "CAA_CIS_Battledroid_AT","SWOP_CIS_droid","SWOP_CIS_droid"];

};



//Nombre ramdom
_rabdomuc = random 99; 
if (_rabdomuc > 30 ) then {

//On entre dans lacondition
//Définition du groupe 
_Groupteam= [getMarkerPos _spawnCsi, EAST, UC_groupa] call BIS_fnc_spawnGroup;

//Définition des attiitudes
_Groupteam setBehaviour "AWARE";
_Groupteam setCombatMode "YELLOW";
_Groupteam setFormation "LINE";


//Déclaration de la position à  atteindre avec attitude de recherche et destruction sur la position
//si la position est un marqueur :       _Groupteam move getMarkerPos "marker_2" ;
//Pour l'instant on prend la position du joueur qui pose l'objet
/* 
_wp = _Groupteam addWaypoint [position player, 100]; 
_wp setWaypointType "SAD"; 
 */

[_Groupteam, position player, 300] call bis_fnc_taskPatrol  //--> patrol by bohemia	
} 
// [group this, getPos this, 1000] call bis_fnc_taskPatrol  --> patrol by bohemia
//Seconde condition pour relancer le script si ramdom <50 

else 

{
//on lance un ramdom pour mettre un temps d'attendre la valeur du ramdom est attribué au Sleep

_rabdomucspawn = random 360; 
sleep _rabdomucspawn;

//On relance le script décris plus haut.
_Groupteam= [getMarkerPos _spawnCsi, EAST, UC_groupa] call BIS_fnc_spawnGroup;
_Groupteam setBehaviour "AWARE";
_Groupteam setCombatMode "YELLOW";
_Groupteam setFormation "LINE";

_wp = _Groupteam addWaypoint [position player, 100]; 
_wp setWaypointType "SAD"; 


//[_Groupteam, position player, 300] call bis_fnc_taskPatrol  //--> patrol by bohemia	
};



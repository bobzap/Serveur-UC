/*------------------------------------------------------------------------
=ATM= AMBIENT CIVILIAN LIFE
--------------------------------------------------------------------------
BY MERCIER				- http://atmarma.fr/forum/user-408.html
ATM COMMUNITY 		- http://atmarma.fr/forum/portal.php
Enjoy it!
------------------------------------------------------------------------*/

private ["_type","_marker","_number","_markerSize","_markerPos","_case","_CivGrp","_spawnPosition","_rClass","_unit","_surfaceIsWater","_value"];

if (!isServer) exitWith {};

_type = (_this select 0);
_marker = (_this select 1);
_number = (_this select 2);

_markerPos = (getMarkerPos _marker);
_markerSize = ((getMarkerSize _marker) select 0);



//_nombre = count (allPlayers select {_x distance _markerPos < 600}); 
/* _nombre = count (allPlayers select {_x distance _markerPos < 100});
waitUntil {  
	
	if  ( _nombre > 0 ) 
	exitWith {true};

 }; */

// nombre de joueurs présent 





if (_type == 0) then {_case = ACL_class_VANILLA};
if (_type == 1) then {_case = ACL_class_AFGHAN};
if (_type == 2) then {_case = ACL_class_AFRICAN};

// ------------------------------------------------------------------------------------ SPAWN
for [{_i = 0 }, {_i < _number}, {_i = _i + 1}] do
{
	_CivGrp = createGroup CIVILIAN;

	// --------------------- CALCUL DE LA POSITION_spawnPosition
	_spawnPosition = [_markerPos, _markerSize] call CBA_fnc_randPos;

	// --------------------- CREATION DE L'UNITE
	_rClass = _case select (floor random (count _case));
	_unit = _CivGrp createUnit [_rClass, _spawnPosition, [], 0, "FORM"];
	_CivGrp selectLeader _unit;
	_unit allowFleeing 1;

	// SI L'UNITE SE TROUVE DANS L'EAU : NOUVELLE CHANCE DE POSITIONNEMENT
	_surfaceIsWater = surfaceIsWater (getPosATL _unit);
	while {_surfaceIsWater} do
	{
		_spawnPosition = [_markerPos, _markerSize] call CBA_fnc_randPos;
		_unit setPosATL _spawnPosition;
		_surfaceIsWater = surfaceIsWater (getPosATL _unit);
		sleep 0.01;
	};
	// --------------------- IDENTITÉ DE L'UNITÉ
	[_unit] execVM "ACL\ACL_identity.sqf";
	_unit setVariable ["ACL_CIVILIAN_MARKER",_marker,true];
	// --------------------- MISE EN PATROUILLE DE L'UNITE
	[_unit,_markerPos,_markerSize] spawn ACL_fnc_patrol;
	
	
	
	_EH = ["ace_killed", {
    params ["_unit"];
    [_unit, _unit getVariable "ace_medical_lastDamageSource"] execVM "ACL\ACL_murder.sqf"
}] call CBA_fnc_addEventHandler;
	
	sleep 1;
	CivGrp = CivGrp + [_unit];
};


publicVariable "CivGrp";
waitUntil {!isnil "CivGrp"};
//if (!ACL_debug) then {deleteMarker _marker};







// Author : Sayker 
// Client : Pour la communauté Union Corp
// Date : 12/12/2018
// Objet : Script pour spawn aléatoire D'IED selon taux de revolt et de coopération
// Script lancé lors de l'activiation des zones de spawn civil dans ACL_Spawn.sqf
 // 
/* 
_center1 = createCenter sideLogic;
_group11 = createGroup _center1;
_posmod = _markerPos;
_cas = _group11 createUnit ["ATM_foule_IED",_posmod , [], 0, ""];
_cas setDir random [0,180,360];


 */



if (true) exitWith {};



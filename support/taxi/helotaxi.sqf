/*
heli taxi script by lordfrith, adapted and rewritten from the awesome DUWS mission support chopper by KIBOT in accordance with the licence of duws which states:
"You can remix, tweak, and build upon my work non-commercially, as long as you credit me and license your creations under these same identical terms. "
usage:
written and tested in SP only

to add the support item place this line somewhere i.e. initPlayerLocal.sqf : helisup = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;

in init.sqf:
/////////////USER VARIABLES//////////
// define chopper call sign
callsign = "CT PLT 5892 Speed";
////////////DO////////NOT////////EDIT//////BELOW//////////HERE
call compile preprocessFile "support\suptFunc.sqf";
helisup = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
null = [] spawn LF_fnc_heliInit;


cost = true;
funds = 10000;

in description.ext:
class CfgCommunicationMenu
{
    class helo_taxi
    {
        text = "Support Menu"; // Text displayed in the menu and in a notification
        submenu = "#USER:MENU_SUPPORT_1";  // Submenu opened upon activation
		expression = "";
        icon = "\a3\ui_f\data\gui\cfg\hints\CallSupport_CA.paa";
        cursor = ""; // Custom cursor displayed when the item is selected
        enable = "1"; // Simple expression condition for enabling the item
        removeAfterExpressionCall = 1; // 1 to remove the item after calling
    };
	 class reset_helo
    {
        text = "Reset Support Comms"; // Text displayed in the menu and in a notification
        submenu = "";  // Submenu opened upon activation
		expression = "LF_resetHelo = [helitaxi, helipad0, callsign] execVM 'support\HQ\resetCommsMenu.sqf'";
        icon = "";
        cursor = ""; // Custom cursor displayed when the item is selected
        enable = "1"; // Simple expression condition for enabling the item
        removeAfterExpressionCall = 1; // 1 to remove the item after calling
    };
}; 

in eden editor: place a chopper with crew and call it "helitaxi". place a helipad where you want your base to be and call it "helipad0". 
*/
//declare and get variables
		private ["_helo", "_basePad", "_callsign", "_startPos", "_pickPos", "_dropPos"];

		_helo = _this select 0;
		_basePad = _this select 1;
		_callsign = _this select 2;
		_startPos = getPos _basePad;
		_pickPos = [];
		_dropPos = [];
		_pilot = driver _helo;
// global variables
		crashed = false;
		clicked = false;
		inVeh = false;
		_deArt = [player,helisup] call BIS_fnc_removeCommMenuItem;
// IF THE PILOT IS DEAD OR CHOPPA DOWN  **************
		[_pilot] call LF_fnc_deadCheck;
		if (crashed) Exitwith {};
		_music = call compile preprocessFile "support\taxi\random_music.sqf";
		_plName = name player;//not sure if in mp this will be the player who called action or different for each player
		_helogroup = group _pilot;
		_helotype = typeOf _helo;
		_helo flyInHeight 50;
		_pilot setcaptive true; 
		resetsup = [player,"reset_helo"] call BIS_fnc_addCommMenuItem;
		sleep 1;
//remove any old waypoints
		while {(count (waypoints _helogroup)) > 0} do {
				deleteWaypoint ((waypoints _helogroup) select 0);
		};
//set animations to passenger config,
		[_helo, 1, 2] call LF_fnc_vehLoadOut;
		[_helo, 1, 3] call LF_fnc_vehLoadOut;
//check if helo is on base for Extraction point
		if (_helo distance player < 500) then {
				_pilot sideChat format["Ici %1 pour %2, en attente d'ordres", _callsign, _plName];
				sleep 2;
				
				[_helotype, 3, "LZ"] call LF_fnc_mapClick;
			} else{
				_pilot sideChat format["De %1 pour %2, indiquez moi sur carte les coordonnées du point d'evac", _callsign, _plName];
				sleep 2;
				
				[_helotype, 1, "LZ"] call LF_fnc_mapClick;
		};
		_pickPos = getPos helipad1;
		sleep 1;
		
//ok now get the insertion point
		_pilot sideChat format["%1 pour %2, Indiquez sur carte un point d'insertion",_callsign, _plName];
		sleep 2;
		
		[_helotype, 2, "DZ"] call LF_fnc_mapClick;
		_dropPos = getPos helipad2;
//check if cost active and if so mworkout journey
		sleep 2;
		
		if (_pickPos distance _dropPos <1000) exitWith {
				_pilot sideChat format["%1 pour %2, chemin refusé, les distances de moins d'1km ne sont pas autorisées",_callsign, _plName];
				sleep 5;
				deleteVehicle helipad1;
				deleteVehicle helipad2;
				deleteMarker str(StartMk);
				deleteMarker str(EndMk);
				helisup = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
				_deRes = [player,resetsup] call BIS_fnc_removeCommMenuItem;
		};
// IF THE PILOT IS DEAD OR CHOPPA DOWN  **************
		[_pilot] call LF_fnc_deadCheck;
		if (crashed) Exitwith {[_pilot, _plName, _callsign,0] call LF_fnc_deadClean;};		
		if (cost) then {
				_pilot sideChat format["%1 pour %2, Bien pris, en attente de confirmation",_callsign,_plName];
				sleep 3;
				_pickDis = _helo distance _pickPos;
				if (_pickDis < 500) Then {_pickDis = 0};
				_tripDis = _pickPos distance _dropPos;
				_totalDis = _pickDis + _tripDis;
				_tripCost = [_totalDis*0.1, 2]call BIS_fnc_cutDecimals;
				if (funds < _totalDis) exitWith {
						[west, "HQ"] sideChat format["Ici poste de commandement pour %1, chemin refusé, pas assez de credits",_plName];
						sleep 14;
						helisup = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
						_deRes = [player,resetsup] call BIS_fnc_removeCommMenuItem;
				};
				funds = funds - _tripCost;
				publicVariable  "funds";
				[west, "HQ"] sideChat format["Ici poste de commandement pour %1, route clear, %2 distance estimée pour l'insertion %3 mètres. distance totale de %4 mètres coutant %5 Credits. Il nous reste %6 Credits",_plName, _callsign, _tripDis, _totalDis, _tripCost, str funds];
		};
// IF THE PILOT IS DEAD OR CHOPPA DOWN  **************
		[_pilot] call LF_fnc_deadCheck;
		if (crashed) Exitwith {[_pilot, _plName, _callsign,0] call LF_fnc_deadClean;};
// if player is right by chopper start point just wait for player to get in
		if (_helo distance _pickPos < 500) then {
				_pilot sideChat format["Ici %1 to %2, prêt et en attente d'ordre",_callsign, _plName];
				[_helo, 0, 3] call LF_fnc_vehLoadOut;
				[_helo] call LF_fnc_inVehChck;
				waitUntil {(inVeh)}; sleep 1;
			} else {_pilot sideChat format["Ici %1 pour %2, bien pris, en mouvement",_callsign, _plName];};
 // add waypoints
		_wp = _helogroup addWaypoint [[_pickPos select 0, _pickPos select 1], 0];
		_wp setWaypointType "MOVE";
		[_helogroup, 1] setWaypointCombatMode "BLUE";

		waitUntil {_pickPos distance _helo < 350 or (vehicle _pilot == _pilot or !alive _pilot)}; // wait until the helo is near the lz
		_pilot setcaptive false; 
// IF THE PILOT IS DEAD OR CHOPPA DOWN  **************
		[_pilot] call LF_fnc_deadCheck;
		if (crashed) Exitwith {[_pilot, _plName, _callsign,0] call LF_fnc_deadClean;};
// spawn smokeshell, or don't if you called the chopper from right beside it
		if (_helo distance _pickPos>300) then {
				_pilot sideChat format["ici %1 pour %2, on approche de votre position à %3, tennez vous prêt à embarquer",_callsign,_plName, _pickPos];
				_smokePos = [_pickPos select 0, (_pickPos select 1)+ random 5];
				_smoke = "SmokeShellGreen" createVehicle _smokePos;
				_chemlight = "Chemlight_green" createVehicle _smokePos;
		};
		_helo land "LAND";
		[_helo, 0, 3] call LF_fnc_vehLoadOut;
// everything is ok, player is in choppa
		[_helo] call LF_fnc_inVehChck;
		
		waitUntil {(inVeh)or (vehicle _pilot == _pilot or !alive _pilot)};
		// IF THE PILOT IS DEAD OR CHOPPA DOWN  **************
		[_pilot] call LF_fnc_deadCheck;
		if (crashed) Exitwith {[_pilot, _plName, _callsign,0] call LF_fnc_deadClean;};
		playMusic [_music, 0];
		_helo vehicleChat format["heh ! %1 prêt? on y va",_plName];
		_wp = _helogroup addWaypoint [_dropPos,0];
		_wp setWaypointType "MOVE";
		[_helogroup, 1] setWaypointCombatMode "BLUE";
// wait until the helo is away from LZ add ermergency landing
		waitUntil {sleep 0.5;_helo distance _pickPos > 350  or (vehicle _pilot == _pilot or !alive _pilot)}; 
// IF THE PILOT IS DEAD OR CHOPPA DOWN  **************
		[_pilot] call LF_fnc_deadCheck;
		if (crashed) Exitwith {[_pilot, _plName, _callsign,0] call LF_fnc_deadClean;};
		_deRes = [player,resetsup] call BIS_fnc_removeCommMenuItem;
		sleep 0.5;
		
		_emrgncyLand = _helo addAction ["<t color='#00b7ff'>Land here</t>", "support\taxi\LandHere.sqf", [], 0, true, true, "", "true"];

		waitUntil {helipad2 distance _helo < 200  or (vehicle _pilot == _pilot or !alive _pilot)}; // wait until the helo is near the lz
		_helo vehicleChat format["On se reveil %1! on approche de la position indiquée",_plName];
// IF THE PILOT IS DEAD OR CHOPPA DOWN  **************
		[_pilot] call LF_fnc_deadCheck;
		if (crashed) Exitwith {
				[_pilot, _plName, _callsign,1] call LF_fnc_deadClean;	
		};
//pilot commits to landing
		_helo land "LAND";
		sleep 5;
		_helo removeAction _emrgncyLand;
		resetsup = [player,"reset_helo"] call BIS_fnc_addCommMenuItem;
// time to move ppl out of the helo;
		waitUntil {(getpos _helo select 2 < 4 && _helo distance helipad2<20)  or (vehicle _pilot == _pilot or !alive _pilot)}; // wait until the helo is near the ground
// IF THE PILOT IS DEAD OR CHOPPA DOWN  **************
		[_pilot] call LF_fnc_deadCheck;
		if (crashed) Exitwith {
				[_pilot, _plName, _callsign,0] call LF_fnc_deadClean;
		};
		_phrasing = selectRandom LFSoundAdvice;
		_helo vehicleChat format["on arrive à la LZ, bonne chance les gars !%1. %2",_plName, _phrasing];
		_helo lock false;
		{doGetOut _x; sleep 1;} forEach units group player;
		sleep 20;

		deleteVehicle helipad1;
		deleteVehicle helipad2;
		deleteMarker str(StartMk);
		deleteMarker str(EndMk);
// spawn the door opening script
		[_helo, 1, 3] call LF_fnc_vehLoadOut;
//if chopper is away from base RTB else turn everything back on
		if (_basepad distance _helo > 100) then {
				_pilot sideChat format["Ici %1, on est à la RTB",_callsign];
				_wp = _helogroup addWaypoint [_basePad,0];   // tell the helo to RTB
				_wp setWaypointType "MOVE";

				waitUntil {_basePad distance _helo < 200  or (vehicle _pilot == _pilot or !alive _pilot)}; // wait until the helo is near the ground
// IF THE PILOT IS DEAD OR CHOPPA DOWN  **************
				[_pilot] call LF_fnc_deadCheck;
				if (crashed) Exitwith {
						[_pilot, _plName, _callsign,0] call LF_fnc_deadClean;
				};
				_helo land "LAND";
				_time = time;
				
				waitUntil {(getpos _helo select 2 < 4 && _helo distance _basePad<20)  or (vehicle _pilot == _pilot or !alive _pilot) or (time > _time + 90)};
				// IF THE PILOT IS DEAD OR CHOPPA DOWN  **************
				[_pilot] call LF_fnc_deadCheck;
				if (crashed) Exitwith {
						[_pilot, _plName, _callsign,0] call LF_fnc_deadClean;
				};
			} else {
				[_pilot] call LF_fnc_deadCheck;
				if (crashed) Exitwith {
						[_pilot, _plName, _callsign,0] call LF_fnc_deadClean;
				};
		};
// IF THE PILOT IS DEAD OR CHOPPA DOWN  **************
		[_pilot] call LF_fnc_deadCheck;
		if (crashed) Exitwith {
				[_pilot, _plName, _callsign,0] call LF_fnc_deadClean;
		};
		_helo land "LAND";
		[west, "HQ"] sideChat format["Ici poste de commandement pour %1, %2 est de retour et prêt", _plName, _callsign];
		_helo setDammage 0;
		_helo Setfuel 1;
		sleep 5;
	
		helisup = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
		_deRes = [player,resetsup] call BIS_fnc_removeCommMenuItem;
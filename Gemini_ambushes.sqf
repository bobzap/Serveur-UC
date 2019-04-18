// =========================================================================================================
// FILE INFORMATION
// =========================================================================================================

	/*

		FILE NAME
		Gemini_ambushes.sqf

		LAST UPDATE
		2018/08/23

		AUTHOR
		Gemini

		CONTACT
		gemini.69@free.fr

		COMPATIBILITY
		ArmA III

		PURPOSE
		This script spawns enemy ambushes at random time and random position around players.
		It's a simplified version of the script developed for "OPEX : OPERATIONS EXTERIEURES" task generator available on the Steam Workshop.
		You are authorized to use and to modify this script as long as you don't forget to mention the author of the original script.

		USAGE
		0 = [debug, side, amount, possible units, forbidden areas] execVM "Gemini_ambushes.sqf";
			debug			(BOOL)				Do you want to display the ambush position on the map ? Possible values are: TRUE or FALSE (default: FALSE). Note: this only works in SP or if player is hosting the mission locally.
			side			(SIDE)				The side of the enemy. Possible values are: EAST, WEST, RESISTANCE (default: EAST).
			amount			(NUMBER)			The maximum amount of ambushes that can are allowed at the same time. Possible values are: ANY NUMBER (default: 3).
			possible units	(ARRAY OF STRINGS)	The units types that can be spawn. Possible variables are: CHECK CfgVehicles category MEN (default: ["O_Soldier_TL_F", "O_Soldier_F", "O_Soldier_GL_F", "O_Soldier_AR_F", "O_medic_F", "O_sniper_F", "O_spotter_F", "O_Soldier_AT_F"]).
			forbidden areas	(ARRAY OF TRIGGERS)	The areas where ambushes can't spawn. They can be defined with a trigger into the mission editor. If you don't need it, just skip this parameter or use an empty array (default: []).

		EXAMPLE 1 (generic usage)
		0 = execVM "Gemini_ambushes.sqf";
			As none arguments have been defined, default ones are applied.

		EXAMPLE 2 (debugging usage)
		0 = [true] execVM "Gemini_ambushes.sqf";
			Only first argument (debugging) is defined, other ones are default ones.

		EXAMPLE 3 (advanced usage)
		0 = [false, east, 5, ["O_medic_F", "O_sniper_F"], [fob_area, demilitarized_area]] execVM "Gemini_ambushes.sqf";
			First argument		false							We don't want to display the ambush position on the map
			Second arument		east							The ambush will be composed of OPFOR units
			Thirst argument		5								There will be up to 5 different ambushes at the same time on the map
			Fourth argument		["O_medic_F", "O_sniper_F"]		The ambush will be randomly composed of medics and snipers units only
			Fifth argument		[fob_area, demilitarized_area]	No ambush will be authorized to spawn into radius of "fob_area" and "demilitarized_area" triggers that have been place with the mission editor

	*/


// =========================================================================================================
// RUNNING THE SCRIPT ON SERVER ONLY
// =========================================================================================================

	if (!isServer) exitWith {};


// =========================================================================================================
// INITIALIZING SCRIPT
// =========================================================================================================

	Gemini_ambushes = 0; publicVariable "Gemini_ambushes";


// =========================================================================================================
// GETTING ARGUMENTS
// =========================================================================================================

	private _debug = param [0, false, [false]];
	private _side = param [1, east, [east]];
	private _maxAmbushes = param [2, 3, [3]];
	private _possibleUnits = param [3, ["SWOP_Mando_True_sold", "SWOP_Mando_True_serg", "SWOP_Mando_True_jumper", "SWOP_Mando_True_mg", "SWOP_Mando_True_sold","SWOP_Mando_True_of","SWOP_Mando_True_AT","SWOP_Mando_True_sniper"], [[]]];
	private _forbiddenAreas = param [4, [], [[]]];


// =========================================================================================================
// CHECKING FORBIDDEN AREAS
// =========================================================================================================

	if ((count _forbiddenAreas) == 0) then
		{
			private ["_fakeTrigger"];
			_fakeTrigger = createTrigger ["EmptyDetector", [0,0,0], true];
			_fakeTrigger setTriggerArea [1, 1, 0, false];
			_forbiddenAreas append [_fakeTrigger];
		};

// =========================================================================================================
// ENABLING DEBUG FUNCTION(S)
// =========================================================================================================

	if (_debug) then
		{
			onMapSingleClick "(vehicle player) setPos _pos";  //  FAST TRAVEL
			player allowDamage false; // INVULNERABILITY
		};


// =========================================================================================================
// EXECUTING SCRIPT
// =========================================================================================================

	while {true} do
		{
			// SLEEPING RANDOM TIME BETWEEN EVERY ATTEMPT
				if (_debug) then {sleep 5} else {sleep 120 + (random 180)};

			// CHECKING IF A PLAYER IS CONNECTED
				if (count (allPlayers - entities "HeadlessClient_F") > 0) then
					{
						// SELECTING A RANDOM PLAYER
							private ["_player"];
							_player = selectRandom (allPlayers - entities "HeadlessClient_F");

						// CHECKING IF MAXIMUM AMBUSHES WERE ALREADY SPAWNED
							if ((Gemini_ambushes < _maxAmbushes) && (random 10 > 5)) then
								{
									// SCANNING ROADS AROUND SELECTED PLAYER - IF A ROAD HAS BEEN FOUND, THEN SPAWNING THE AMBUSH
										private ["_roads"];
										_roads = [];
										_roads = _player nearRoads 1000;

										if (count _roads > 0) then
											{
												// LOOKING FOR A RANDOM ROAD
													private ["_road", "_roadPos"];
													_road = selectRandom _roads;
													_roadPos = position _road;

												// CHECKING IF FOUND POSITION IS VALID
													if (
															// CHECKING IS FOUND POSITION IS NOT IN A BLACKLISTED ZONE
																(!([_roadPos, _forbiddenAreas] call BIS_fnc_isPosBlacklisted)) &&

															// CHECKING IF FOUND POSITION IS NOT TOO CLOSE OF ANY FRIENDLY UNIT
																({(_x distance2D _roadPos < 750) && (side _x != _side)} count (allUnits) ==  0)
														)

												// SPAWNING AMBUSH
													then
														{
															// CREATING SQUAD(S)
																for "_i" from 1 to (round (random 3)) do
																	{
																		// LOOKING FOR AN OVERWATCH POSITION
																			private ["_overwatchPos"];
																			_overwatchPos = [[_roadPos select 0, _roadPos select 1, 0], 250, 50, 50] call BIS_fnc_findOverwatch;

																		// SPAWNING SQUAD(S) TO THE OVERWATCH POSITION
																			private ["_squad"];
																			_squad = createGroup _side;
																			for "_i" from 3 to (selectRandom [2,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,6,7,8,9,10,11,12,13,14,15]) do {private ["_unit"]; _unit = _squad createUnit [selectRandom _possibleUnits, _overwatchPos, [], 0, "NONE"]};

																		// PREPARING SQUAD FOR THE AMBUSH
																			{
																				_x doWatch _road;
																				_x setCombatMode "yellow";
																				_x addEventHandler
																					[
																						"firedNear",
																						{
																							{
																								_x doMove (position (_this select 1));
																								_x setCombatMode "red";
																								_x setBehaviour "combat";
																								_x setUnitPos "auto";
																								_x removeAllEventHandlers "firedNear";
																								_x setSpeedMode "limited";
																							} forEach units group (_this select 0)
																						}
																					];
																				_x addEventHandler
																					[
																						"killed",
																						{
																							{
																								_x doMove (position _x);
																								_x setCombatMode "red";
																								_x setBehaviour "combat";
																								_x setUnitPos "auto";
																								_x removeAllEventHandlers "killed";
																								_x setSpeedMode "full";
																							} forEach units group (_this select 0)
																						}
																					];
																			} forEach units _squad;
																			while {(count (waypoints _squad)) > 0} do {deleteWaypoint ((waypoints _squad) select 0)};
																			_squad setFormation (selectRandom ["ECH LEFT", "ECH RIGHT", "LINE", "VEE", "WEDGE"]);
																			private ["_dir"];
																			_dir = [leader _squad, _road] call BIS_fnc_dirTo;
																			[_overwatchPos, _road, _squad, _dir] spawn
																				{
																					{
																						_x setPos [((_this select 0) select 0) + random 25 - random 25, ((_this select 0) select 1) + random 25 - random 25, 0];
																						doStop _x;
																						_x setDir (_this select 3);
																						_x doWatch (_this select 1);
																						_x setBehaviour "stealth";
																						_x setUnitPos (selectRandom ["down", "middle"]);
																					} forEach units (_this select 2);
																				};

																		// DELETING SQUAD IF FAR FROM PLAYERS
																			[_squad] spawn
																				{
																					waitUntil {sleep 1; ({(_x distance2D (leader (_this select 0)) < 1500)} count (allPlayers - entities "HeadlessClient_F") ==  0)};
																					{deleteVehicle _x} forEach units (_this select 0);
																				};

																		// DEBUGGING
																			if (_debug) then
																				{
																					private ["_markerName", "_debugMarker"];
																					_markerName = format ["debugMarker_ambush_%1", random 10000];
																					_debugMarker = createMarker [_markerName, position (leader _squad)];
																					_debugMarker setMarkerType "mil_warning";
																					_debugMarker setMarkerColor "ColorRed";
																					_debugMarker setMarkerText "[DEBUG] ENEMY SQUAD";
																					private ["_smoke"];
																					_smoke = "smokeShellRed" createVehicle (position (leader _squad));
																				};

																	};

															// UPDATING TOTAL AMBUSH COUNT
																Gemini_ambushes = Gemini_ambushes + 1; publicVariable "Gemini_ambushes";

															// UPDATING TOTAL AMBUSH COUNT WHEN ALL ENEMY UNITS AROUND ROAD ARE DEAD OR DELETED
																[_roadPos, _side] spawn
																	{
																		waitUntil {sleep 1; ({(_x distance2D (_this select 0) < 250) && (side _x == (_this select 1))} count (allUnits) ==  0)};
																		Gemini_ambushes = Gemini_ambushes - 1; publicVariable "Gemini_ambushes";
																	};

															// DEBUGGING
																if (_debug) then
																	{
																		private ["_markerName", "_debugMarker"];
																		_markerName = format ["debugMarker_ambush_%1", random 10000];
																		_debugMarker = createMarker [_markerName, _roadPos];
																		_debugMarker setMarkerType "mil_warning";
																		_debugMarker setMarkerColor "ColorRed";
																		_debugMarker setMarkerText "[DEBUG] ENEMY AMBUSH !";
																		private ["_smoke"];
																		_smoke = "smokeShellGreen" createVehicle _roadPos;
																	};
														};
											};
								};
					};

		};
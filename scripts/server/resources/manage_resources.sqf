waitUntil {!isNil "save_is_loaded"};
waitUntil {!isNil "IA_liberation_production"};

if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Resource management started on: %1", (name player)];_text remoteExec ["diag_log",2];};

while {GRLIB_endgame == 0} do {

	recalculate_sectors = false;
	
	if (((count allPlayers) > 0) && ((count IA_liberation_production) > 0)) then {
		if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Resource interval started: %1", time];_text remoteExec ["diag_log",2];};
		
		private ["_tempProduction", "_storage", "_storageArray", "_supplyValue", "_ammoValue", "_fuelValue", "_time", "_crateType", "_crate"];

		_tempProduction = [];

		{
			_storageArray = [];
			_supplyValue = 0;
			_ammoValue = 0;
			_fuelValue = 0;
			_time = _x select 8;

			_storage = nearestObjects [(markerPos (_x select 1)), [IA_liberation_small_storage_building], GRLIB_fob_range];
			_storage = [_storage, {(_x getVariable ["IA_liberation_storage_type",-1]) == 1}] call BIS_fnc_conditionalSelect;
			if ((count _storage) > 0) then {
				_storage = (_storage select 0);
				_storageArray = [(getPosATL _storage),(getDir _storage),(vectorUpVisual _storage)];

				if ((_time - 1) < 1) then {
					_time = IA_liberation_production_interval;
					
					if (((count (attachedObjects _storage)) < 12) && !((_x select 7) == 3)) then {
						switch (_x select 7) do {
							case 1: {_crateType = IA_liberation_ammo_crate;};
							case 2: {_crateType = IA_liberation_fuel_crate;};
							default {_crateType = IA_liberation_supply_crate;};
						};

						_crate = _crateType createVehicle (getPosATL _storage);
						_crate setVariable ["IA_liberation_crate_value", 100, true];
						[_crate, 500] remoteExec ["F_setMass",_crate];
						[_crate, _storage] call F_crateToStorage;

					};
				} else {
					_time = _time - 1;
				};

				{
					switch ((typeOf _x)) do {
						case IA_liberation_supply_crate: {_supplyValue = _supplyValue + (_x getVariable ["IA_liberation_crate_value",0]);};
						case IA_liberation_ammo_crate: {_ammoValue = _ammoValue + (_x getVariable ["IA_liberation_crate_value",0]);};
						case IA_liberation_fuel_crate: {_fuelValue = _fuelValue + (_x getVariable ["IA_liberation_crate_value",0]);};
						default {diag_log format ["[IA LIBERATION] [ERROR] Invalid object (%1) at storage area", (typeOf _x)];};
					};
				} forEach (attachedObjects _storage);
			};

			_tempProduction pushBack [
				(markerText (_x select 1)),
				(_x select 1),
				(_x select 2),
				_storageArray,
				(_x select 4),
				(_x select 5),
				(_x select 6),
				(_x select 7),
				_time,
				_supplyValue,
				_ammoValue,
				_fuelValue
			];

			if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Sector Production Update: %1", (_tempProduction select _forEachIndex)];_text remoteExec ["diag_log",2];};

		} forEach IA_liberation_production;

		_tempProduction sort true;

		IA_liberation_production = +_tempProduction;
		if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Resource interval finished: %1", time];_text remoteExec ["diag_log",2];};
	};
	waitUntil {sleep 1; recalculate_sectors};
};

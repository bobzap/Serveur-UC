//_emrgncyLand = _helo addAction ["<t color='#00b7ff'>Land here</t>", "support\taxi\LandHere.sqf", [], 0, true, true, "", "true"];
//requires helotaxi.sqf to have started, moves end point to new location
		private ["_helo", "_caller","_landHere", "_helotype", "_plName", "_pilot", "_helogroup", "_currentPos", "_dropPos", "_oldDZ"];
		_helo = _this select 0;
		_caller = _this select 1;
		_landHere = _this select 2;
		_helotype = typeOf _helo;
		_plName = name _caller;
		_pilot = driver _helo;
		_helogroup = group _pilot;
		_currentPos = getPos _helo;
		_dropPos = [];
		_oldDZ = getPos helipad2;
//delete old waypoint and objects
		while {(count (waypoints _helogroup)) > 0} do
		{
			deleteWaypoint ((waypoints _helogroup) select 0);
		};
		deleteVehicle helipad2;
		deleteMarker str (EndMk); 
 //open map to click new Dz
		_helo VehicleChat format["OK %1, indiquez sur carte une nouvelle DZ", _plName];
		openMap [true, false];
		[_helotype, 2, "DZ"] call LF_fnc_mapClick;
		_dropPos = getPos helipad2;
		if (cost) then {
				_helo VehicleChat format["OK %1,traitement en cours...", _plName];
				sleep 3;
	
				_cancelDis = _currentPos distance _oldDZ;
				_tripDis = _currentPos distance _dropPos;
				_refund = [_cancelDis*0.1, 2]call BIS_fnc_cutDecimals;
				_tripCost = [_TripDis*0.1, 2]call BIS_fnc_cutDecimals;
				funds = funds + _refund;
				funds = funds - _tripCost;
				if (funds < 0) Then {funds = 0;};
				publicVariable  "funds";
				[west, "HQ"] sideChat format["PC pour %1, changement de chemin confirmé, nouveau point d'insertion trouvé. couts :%2 crédits et %3 credit pour la nouvelle route de %4 mètres. il reste %5 crédits", _plName, _refund, _tripCost, _tripDis, str funds];
		};
		_wp = _helogroup addWaypoint [_dropPos,0];
		_wp setWaypointType "MOVE";
		[_helogroup, 1] setWaypointCombatMode "BLUE";
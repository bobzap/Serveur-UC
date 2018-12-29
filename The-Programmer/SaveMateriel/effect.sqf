_this spawn {
	_vehicle=selectRandom ["VR_3DSelector_01_incomplete_F","VR_3DSelector_01_complete_F","VR_3DSelector_01_exit_F"];
	waitUntil{
		_target=_vehicle createVehicle [0,0,0];
		_target attachTo [_this, [0,0,2]];
		sleep 0.25;
		deleteVehicle _target;
		sleep 0.25;
		!dialog;
	};
};
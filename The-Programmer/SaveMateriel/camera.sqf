_this spawn {

	_Speed=100;
	_Phi=0;
	_R=9;
	_Z=3;
	_rotation=0.3;
	
	_cam = "camera" camCreate (position player);
	_cam camSetTarget _this;
	_cam cameraEffect ["internal", "BACK"];
	_cam camCommit 0;
	
	while {dialog} do {
		_Phi=_Phi+_rotation;
		_pointPassage=[sin(_Phi)*_R,-cos(_Phi)*_R,_Z];;
		_cam camSetRelPos _pointPassage; 
		_cam camCommit 1/_Speed;
		waituntil{(camCommitted _cam || !dialog)};
	};
	
	_cam cameraEffect ["terminate","back"];
	camDestroy _cam;
};
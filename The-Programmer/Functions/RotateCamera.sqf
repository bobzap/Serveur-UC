params ["_stopConditionSTR","_Speed","_Phi","_R","_Z","_rotation"];

#include "RotateCamera_config.cpp"

_stopConditionSTR=(if (isnil "_stopConditionSTR") then {_stopConditionSTRDefault} else {_stopConditionSTR});
_Speed=(if (isnil "_Speed") then {_SpeedDefault} else {_Speed});
_Phi=(if (isnil "_Phi") then {_PhiDefault} else {_Phi});
_R=(if (isnil "_R") then {_RDefault} else {_R});
_Z=(if (isnil "_Z") then {_ZDefault} else {_Z});
_rotation=(if (isnil "_rotation") then {_rotationDefault} else {_rotation});

_cam = "camera" camCreate (position player);
_cam camSetTarget player;
_cam cameraEffect ["internal", "BACK"];
_cam camCommit 0;

while {not(call compile _stopConditionSTR)} do {
	_Phi=_Phi+_rotation;
	_pointPassage=[sin(_Phi)*_R,-cos(_Phi)*_R,_Z];;
	_cam camSetRelPos _pointPassage; 
	_cam camCommit 1/_Speed;
	waituntil{(camCommitted _cam || (call compile _stopConditionSTR))};
};

_cam cameraEffect ["terminate","back"];
camDestroy _cam;

params ["_object","_stopConditionSTR","_high","_period","_arrowsList"];

#include "blinkArrow_config.cpp"

_object=(if (isnil "_object") then {_objectDefault} else {_object});
_stopConditionSTR=(if (isnil "_stopConditionSTR") then {_stopConditionSTRDefault} else {_stopConditionSTR});
_high=(if (isnil "_high") then {_highDefault} else {_high});
_period=(if (isnil "_period") then {_periodDefault} else {_period});
_arrowsList=(if (isnil "_arrowsList") then {_arrowsListDefault} else {_arrowsList});

_vehicle=selectRandom _arrowsList;
_sizeObject=((boundingBox _object) select 1) select 2;

_target=_vehicle createVehicle [0,0,0];
deleteVehicle _target;
waitUntil{
	_target=_vehicle createVehicle [0,0,0];
	_sizeArrow=((boundingBox _target) select 0) select 2;
	_target attachTo [_object, [0,0,_high-_sizeArrow+_sizeObject]];
	sleep _period;
	deleteVehicle _target;
	sleep _period;
	call compile _stopConditionSTR;
};
if not(isnil "_target") then {
    if not(isnull _target) then {
        deleteVehicle _target;
    };
};
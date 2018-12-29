_objects = _this select 0;
_size = _this select 1;
_locations = nearestObjects [player, [_objects], _size];
_townNum = 1;
_marker = "";
{

    _marker = createMarker [format ["town%1",_townNum], getpos _x];
    _townNum = _townNum + 1;
    _marker setMarkerShape "RECTANGLE";
    _marker setMarkerSize [50,50];
} forEach _locations;



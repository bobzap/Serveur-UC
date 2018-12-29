// heliTaxi_init.sqf
// © OCTOBER 2011 - norrin
private ["_heli", "_escort"];
_heli 		= _this select 0;

[_heli] execVM "scripts\heloGoTo\heloGoTo_init.sqf";


// Define escort chopper if it exists 
//if (count _this > 1) then
//{
	//_escort		= _this select 1;
	//[_escort,_heli] execVM "scripts\heloGoTo\escort\heliEscort_init.sqf";
	//[_heli,_escort] execVM "scripts\heloGoTo\heloGoTo_init.sqf";
//} else {
	
//};
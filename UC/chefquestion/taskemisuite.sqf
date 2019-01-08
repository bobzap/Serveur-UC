

_position2 = GetPos player;
Tablette_UC = _position2 nearEntities ["Box_C_UAV_06_F", 7];
Money = Tablette_UC call grad_lbm_fnc_getFunds;

waitUntil {    Money > 5150    };


["Diplomatie","SUCCEEDED",true] call bis_fnc_taskSetState;

execVM "UC\chefquestion\recompense_emi.sqf";




sleep 4;

_boitedelete = nearestObjects [player, ["Box_C_UAV_06_F"], 10];
deleteVehicle (_boitedelete select 0);



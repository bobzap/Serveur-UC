execVM "The-Programmer\SaveMateriel\init.sqf";


execVM "The-Programmer\CityNotification\init.sqf";


execVM "UC\DossRoll\init.sqf";

execVM "UC\DossAceAction\init.sqf";

#include "TER_targetGUI\addEH.sqf"


[] spawn {
    waitUntil {!isNull player};
    [player, profileNamespace getVariable ["someVariableToSaveTheMoneyIn",0]] call grad_moneymenu_fnc_setFunds;
    player setVariable ["grad_moneymenu_myBankBalance",profileNamespace getVariable ["someVariableToSaveTheAccountMoneyIn",0],true];
    [player, profileNamespace getVariable ["someVariableToSaveTheLevelIn",0]] call grad_lbm_fnc_setPermissionLevel;
	
	if ([player] call grad_lbm_fnc_getPermissionLevel < 3 ) then 

 
{ 

[player,"Land_WoodPile_F"] call grad_fortifications_fnc_addFort;
[player,"Land_Trench_01_grass_F"] call grad_fortifications_fnc_addFort;
[player,"Land_Bunker_01_blocks_1_F"] call grad_fortifications_fnc_addFort;
[player,"Land_FirePlace_F"] call grad_fortifications_fnc_addFort;
[player,"ShootingMat_01_Olive_F"] call grad_fortifications_fnc_addFort;
[player,"ACE_ConcertinaWireCoil"] call grad_fortifications_fnc_addFort;
[player,"Land_Target_Dueling_01_F"] call grad_fortifications_fnc_addFort;
[player,"Land_Camping_Light_F"] call grad_fortifications_fnc_addFort;
[player,"Target_PopUp_Moving_Acc2_F"] call grad_fortifications_fnc_addFort;

}


else 


{
[player,"Land_WoodPile_F"] call grad_fortifications_fnc_addFort;
[player,"Land_Trench_01_grass_F"] call grad_fortifications_fnc_addFort;
[player,"Land_Bunker_01_blocks_1_F"] call grad_fortifications_fnc_addFort;
[player,"Land_FirePlace_F"] call grad_fortifications_fnc_addFort;
[player,"ShootingMat_01_Olive_F"] call grad_fortifications_fnc_addFort;
[player,"ACE_ConcertinaWireCoil"] call grad_fortifications_fnc_addFort;
[player,"Land_Target_Dueling_01_F"] call grad_fortifications_fnc_addFort;
[player,"Land_Camping_Light_F"] call grad_fortifications_fnc_addFort;
[player,"Target_PopUp_Moving_Acc2_F"] call grad_fortifications_fnc_addFort;

[player,"CamoNet_BLUFOR_F"] call grad_fortifications_fnc_addFort;
[player,"Land_TripodScreen_01_large_F"] call grad_fortifications_fnc_addFort;
[player,"Land_OPTRE_ConstructionBarrier1"] call grad_fortifications_fnc_addFort;
[player,"Land_OPTRE_M72_barrierBlk"] call grad_fortifications_fnc_addFort;
[player,"Downy_Barricade"] call grad_fortifications_fnc_addFort;
[player,"SWOP_Barricade"] call grad_fortifications_fnc_addFort;
[player,"Land_OPTRE_blast_barrier_dest"] call grad_fortifications_fnc_addFort;
[player,"Land_TripodScreen_01_dual_v2_F"] call grad_fortifications_fnc_addFort;


};  
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
};








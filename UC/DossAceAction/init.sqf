/*********************************************************************************************
								By UC_Team (Eldarius)
 ********************************************************************************************/
/*
 //https://ace3mod.com/wiki/framework/interactionMenu-framework.html#3-adding-actions-via-scripts
 
//============================================================================================
//							Fuel
//============================================================================================

//https://ace3mod.com/wiki/framework/refuel-framework.html#24-make-an-object-into-a-refuel-source


obj_tank1 = [4845.43,4161.17,0] nearestObject "Land_tank1"; 

[obj_tank1, 300, [5,-11,0,2]] call ace_refuel_fnc_makeSource;

//[obj_tank1, 2000] call ACE_refuel_fnc_makeJerryCan;
[obj_tank1, 2000] call ACE_refuel_fnc_getFuel;

//[obj_tank1, 2000] call ACE_refuel_fnc_setFuel;

//============================================================================================
//							BACTA TANK
//============================================================================================

//-----------------------------Ouverture du sas----------------------------------------
//on vérifie que la porte est bien fermé
//if (_isopen == 0) then {
    _statement = { 
    _messageroll = format["*Ouverture des portes de la machine à bacta*"]; 

	playSound3D ["Sounds\openSas.ogg",player, false, getPosASL player, 1, 1, 5];
 
 //player globalChat _messageroll; 
 [player, _messageroll] remoteExec ["globalChat", 0];
 //_isopen= _isopen + 1;
}; 
 
// création et ajout de l'action sur toutes les bactas tank 
_action = ["BactaMachineOpen","Ouvrir le sas","",_statement,{true}] call ace_interact_menu_fnc_createAction; 
["Bacta_tank", 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;
//};
//----------------------------- END Ouverture du sas----------------------------------------

//-----------------------------Fermeture du sas----------------------------------------
//if (_isopen == 1) then {
    _statement = { 
    _messageroll = format["*Fermeture des portes de la machine à bacta*"]; 

	playSound3D ["closeSas",_bacta];
 
 //player globalChat _messageroll; 
 [player, _messageroll] remoteExec ["globalChat", 0];
 //_isopen = _isopen - 1;
}; 
 
// création et ajout de l'action sur toutes les bactas tank 
_action = ["BactaMachineClose","Fermer le sas","",_statement,{true}] call ace_interact_menu_fnc_createAction; 
["Bacta_tank", 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;
//};
//-----------------------------END Fermeture du sas----------------------------------------


//============================================================================================
//							MEDICAL BED
//============================================================================================

//-----------------------------nettoyer la table----------------------------------------
_statement = { 
    _messageroll = format["*Nettoie la table*"]; 
 
    //player globalChat _messageroll; 
    [player, _messageroll] remoteExec ["globalChat", 0];
}; 
 
// création et ajout de l'action sur les lits médicaux
_action = ["medicalBedClear","Nettoyer la table","",_statement,{true}] call ace_interact_menu_fnc_createAction; 
["Medical_bed", 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;
//-----------------------------END nettoyer la table----------------------------------------
*/
//============================================================================================
//									Player
//============================================================================================

//creation de l'action ace "Permissions Level"
_action1 = ["HintPermissionLevel","Permissions Level","",{
	
	_unit = player;
    hint format ["%1's permission level is %2.",name _unit,[_unit] call grad_lbm_fnc_getPermissionLevel]; 
	
},{true}] call ace_interact_menu_fnc_createAction;

//Ajout de l'action sur le joueur
[player, 1, ["ACE_SelfActions"], _action1] call ace_interact_menu_fnc_addActionToObject;
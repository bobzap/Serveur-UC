//TODO ajout d'une condition qui envoie à roll.sqf
//un bool pour savoir si la commande vient de ace ou du chat

/*********************************************************************************************
								By UC_Team (Delpig and Eldarius)
 ********************************************************************************************/

_debug = false;

//============================================================================================
//									ChatRoll
//============================================================================================

//https://github.com/CBATeam/CBA_A3/wiki/Registering-Custom-Chat-Commands

//traitement de commande dans le chat
	["roll", {
		//appelle du script roll
		call compile preprocessFileLineNumbers "UC\DossRoll\roll.sqf"
}, "all"] call CBA_fnc_registerChatCommand;

//============================================================================================
//									ACE
//============================================================================================

//https://ace3mod.com/wiki/framework/interactionMenu-framework.html#3-adding-actions-via-scripts

//creation de l'action ace "Roll"
_action1 = ["UC_Roll","Roll","",{
	
	//appelle du script roll
	call compile preprocessFileLineNumbers "UC\DossRoll\roll.sqf"
	
},{true}] call ace_interact_menu_fnc_createAction;

//Ajout de l'action sur le joueur
[player, 1, ["ACE_SelfActions"], _action1] call ace_interact_menu_fnc_addActionToObject;
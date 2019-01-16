/*********************************************************************************************
								By UC_Team (Delpig and Eldarius)
 ********************************************************************************************/

//============================================================================================
//									ChatRoll
//============================================================================================

//https://github.com/CBATeam/CBA_A3/wiki/Registering-Custom-Chat-Commands

//traitement de commande dans le chat
	["roll", {
		_rNumber = round random 99;
		//appelle du script roll
		//execVM "UC\DossRoll\roll.sqf";
		_messageroll = format["%1 à %2 %3",(_this select 0), _rnumber, "%"];

		[player, _messageroll] remoteExec ["globalChat", 0];

		hint _messageroll;
		
}, "all"] call CBA_fnc_registerChatCommand;

//============================================================================================
//									ACE
//============================================================================================

//https://ace3mod.com/wiki/framework/interactionMenu-framework.html#3-adding-actions-via-scripts

_FirstNode = ["Menu_Roll", "Menu Roll", "", {}, {true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _FirstNode] call ace_interact_menu_fnc_addActionToObject;

//--------------------------------action ace "Roll"--------------------------------------------
_action1 = ["UC_Roll","Roll","",{
	_rNumber = round random 99;
	//appelle du script roll
	//execVM "UC\DossRoll\roll.sqf";
	_messageroll = format[" %1 %2",_rnumber , "%"];

	[player, _messageroll] remoteExec ["globalChat", 0];

	hint _messageroll;
	
},{true}] call ace_interact_menu_fnc_createAction;

//Ajout de l'action sur le joueur
[player, 1, ["ACE_SelfActions", "Menu_Roll"], _action1] call ace_interact_menu_fnc_addActionToObject;

//-------------------------------explication du roll--------------------------------------------------
_action2 = ["Roll_Help", "HELP", "", {

hint parseText (format["Explication du Roll:<br/><img size='10' image='UC\DossRoll\image\reglette.paa'/><br/>"]); 

}, {true}] call  ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "Menu_Roll"], _action2] call ace_interact_menu_fnc_addActionToObject;





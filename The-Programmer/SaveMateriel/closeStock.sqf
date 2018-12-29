params ["_unit", "_container"];

if not(str(_container) select [0,13] == "SaveMateriel_") exitwith {};
if (player getVariable["forceCloseInventory",false]) exitwith {};

_proprietaire=_container getvariable ["_proprietaire",player];
if (_proprietaire!=player)exitwith {};
_container setvariable ["_proprietaire",nil,true];

//Stockage des items dans le profil du joueur
profileNameSpace setvariable [serverName+"_"+missionName+"_"+str(getPlayerUID player)+"_"+"SaveMateriel"+"_items",getItemCargo _container];
profileNameSpace setvariable [serverName+"_"+missionName+"_"+str(getPlayerUID player)+"_"+"SaveMateriel"+"_magazines",getMagazineCargo _container];
profileNameSpace setvariable [serverName+"_"+missionName+"_"+str(getPlayerUID player)+"_"+"SaveMateriel"+"_weapons",getWeaponCargo _container];
profileNameSpace setvariable [serverName+"_"+missionName+"_"+str(getPlayerUID player)+"_"+"SaveMateriel"+"_containers",getBackpackCargo _container];
profileNamespace setVariable ["someVariableToSaveTheMoneyIn",player getVariable ["grad_lbm_myFunds",0]];
profileNamespace setVariable ["someVariableToSaveTheAccountMoneyIn",player getVariable ["grad_moneymenu_myBankBalance",0]];

if (!isNil "GRAD_LBM_ITEMSTOCKS") then {
    profileNamespace setVariable ["someVariableToSaveStock",GRAD_LBM_ITEMSTOCKS];    
};






//Save du profil du joueur
saveprofileNamespace;
//Remove des items
clearItemCargoGlobal _container;
clearWeaponCargoGlobal _container;
clearMagazineCargoGlobal _container;
clearBackpackCargoGlobal _container;
//Quit du joueur
["SAUVEGARDE DU CASIER","Sauvegarde de l'equipement...","SAVE",3,[0,1,0,1]] execVM "The-Programmer\Functions\popup.sqf";
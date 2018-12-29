enableSaving [ false, false ];

[] call compileFinal preprocessFileLineNumbers "scripts\shared\liberation_functions.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\shared\init_sectors.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\shared\fetch_params.sqf";
[] call compileFinal preprocessFileLineNumbers "IA_liberation_config.sqf";

switch (IA_liberation_preset) do {
	case 0: {[] call compileFinal preprocessFileLineNumbers "presets\custom.sqf";};
	case 1: {[] call compileFinal preprocessFileLineNumbers "presets\apex_tanoa.sqf";};
	case 2: {[] call compileFinal preprocessFileLineNumbers "presets\rhs.sqf";};
	case 3: {[] call compileFinal preprocessFileLineNumbers "presets\rhs_bw.sqf";};
	case 4: {[] call compileFinal preprocessFileLineNumbers "presets\rhs_takistan.sqf";};
	case 5: {[] call compileFinal preprocessFileLineNumbers "presets\3cbBAF.sqf";};
	case 6: {[] call compileFinal preprocessFileLineNumbers "presets\customRebelVsEmpire.sqf";};
	case 7: {[] call compileFinal preprocessFileLineNumbers "presets\customEmpireVsRebel.sqf";};
	case 8: {[] call compileFinal preprocessFileLineNumbers "presets\customCloneVsCis.sqf";};
	case 9: {[] call compileFinal preprocessFileLineNumbers "presets\customCisVsClone.sqf";};
	default {[] call compileFinal preprocessFileLineNumbers "presets\customRebelVsEmpire.sqf";};
};

MISSION_ROOT = call {
    private "_arr";
    _arr = toArray __FILE__;
    _arr resize (count _arr - 8);
    toString _arr
};


[] call compileFinal preprocessFileLineNumbers "scripts\shared\classnames.sqf";

[] execVM "GREUH\scripts\GREUH_activate.sqf";
[] execVM "intercom.sqf";
//[] execVM "alarm.sqf";

[] call compileFinal preprocessFileLineNumbers "scripts\shared\init_shared.sqf";

if (isServer) then {
	[] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";
};

if (!isDedicated && !hasInterface && isMultiplayer) then {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\hc_manager.sqf";
};

if (!isDedicated && hasInterface) then {
	waitUntil { alive player };
	[] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
} else {
	setViewDistance 1600;
};

if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] init.sqf done for: %1", (name player)];_text remoteExec ["diag_log",2];};


////////////////////////////////////////////



///////////////////////////jebus gai////////////////////////


// if (isserver) then {call compile preprocessfile "gaia\gaia_init.sqf";};

// We set the markers invisible (if you use more then 100 markers, then increase). Or delete if you want them visible
// for "_x" from 1 to 100 do
// {
	// format ["%1",_x] setMarkerAlpha 0;
// };

////////////////////////////////////////////Init UPSMON script
// call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";


//execVM "ACL\ACL_initialization.sqf";

//if (true) exitWith {};

/////////////USER VARIABLES//////////
// define chopper call sign

//callsign = "Rabid Chaffinch";

////////////DO////////NOT////////EDIT//////BELOW//////////HERE
//call compile preprocessFile "support\suptFunc.sqf";
//helisup = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
//null = [] spawn LF_fnc_heliInit;


//cost = true;
//funds = 10000000;


////////////


0 = [false, resistance, 2, ["SWOP_Mando_True_sold", "SWOP_Mando_3", "SWOP_Mando_Protectors_sniper", "SWOP_Mando_True_mg", "SWOP_Mando_True_sold","SWOP_Mando_Protectors_AT","SWOP_Mando_Protectors_mg"], [fob_area]] execVM "Gemini_ambushes.sqf";

////////////////////////////////////////////

bobzap_fnc_setPlayerPermissionLevel = {
    params [["_playerName",""],["_permissionLevel",0]];

    private _playerUnit = objNull;
    {
        if ((name _x) isEqualTo _playerName) exitWith {_playerUnit = _x};
    } forEach allPlayers;

    if (isNull _playerUnit) exitWith {"Player could not be found."};

    [_playerUnit,_permissionLevel] call grad_lbm_fnc_setPermissionLevel;
    "Permission level set successfully."
};

///////////////////
bobzap_fnc_setPermissionLevelAndSave = {
    params [["_unit",objNull],["_permissionLevel",0]];

    [_unit,_permissionLevel] call grad_lbm_fnc_setPermissionLevel;
    profileNamespace setVariable ["someVariableToSaveTheLevelIn",_permissionLevel];
    saveProfileNamespace;
};

["BOBZAP CATEGORY","Permission Level",{

    private _allPlayers = allPlayers - entities "HeadlessClient_F";
    private _allPlayerNames = _allPlayers apply {format ["%1 (%2)",[_x] call ace_common_fnc_getName,[_x] call grad_lbm_fnc_getPermissionLevel]};
    private _allPermissionLevels = [0,1,2,3,4,5,6,7,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
    private _allPermissionLevelNames = _allPermissionLevels apply {str _x};

    private _dialogResult = ["Set Permission Level",[
        ["Player",_allPlayerNames],
        ["Level",_allPermissionLevelNames]
    ]] call ares_fnc_showChooseDialog;

    if (_dialogResult isEqualTo []) exitWith {};

    _dialogResult params [["_playerSelID",0],["_levelSelID",0]];

    private _selPlayer = _allPlayers param [_playerSelID,objNull];
    private _selLevel = _allPermissionLevels param [_levelSelID,0];

    if (isNull _selPlayer) exitWith {
        ["Player not found!"] call Achilles_fnc_showZeusErrorMessage;
    };

    [_selPlayer,_selLevel] remoteExec ["bobzap_fnc_setPermissionLevelAndSave",_selPlayer,false];
}] call ares_fnc_registerCustomModule;



////////////////////////////Money achille/////////////////////////



["BOBZAP CATEGORY","Give Money",{

    private _allPlayers = allPlayers - entities "HeadlessClient_F";
    private _allPlayerNames = _allPlayers apply {format ["%1 (%2)",[_x] call ace_common_fnc_getName,[_x] call grad_lbm_fnc_getPermissionLevel]};

    private _dialogResult = ["Give Money",[
        ["Player",_allPlayerNames],
        ["Amount", ""]
    ]] call ares_fnc_showChooseDialog;

    if (_dialogResult isEqualTo []) exitWith {};

    _dialogResult params [["_playerSelID",0],["_amountText",""]];

    _amount = call compile ([_amountText,"0123456789"] call BIS_fnc_filterString);
    if (isNil "_amount" || {!(_amount isEqualType 0)}) exitWith {
        ["Invalid amount!"] call Achilles_fnc_showZeusErrorMessage;
    };

    private _selPlayer = _allPlayers param [_playerSelID,objNull];
    if (isNull _selPlayer) exitWith {
        ["Player not found!"] call Achilles_fnc_showZeusErrorMessage;
    };

    [objNull,_selPlayer,_amount,"ATM_TRANSFER",player] remoteExec ["grad_moneymenu_fnc_receiveMoney",_selPlayer,false];
}] call ares_fnc_registerCustomModule;


/////////////////////////DataCible//////////////////////




//-------------------------------------Data cible----------------------------------------
_actionDataCible = ["DataCible","Data Cible","",{
	
	_ok = createDialog "TER_target";

    if (!_ok) then {hint "Dialog couldn't be opened!"};
	
},{true}] call ace_interact_menu_fnc_createAction;

//Ajout de l'action sur le joueur
["Land_TripodScreen_01_dual_v2_F", 0, ["ACE_MainActions"], _actionDataCible] call ace_interact_menu_fnc_addActionToClass;
//-----------------------------END Data cible----------------------------------------








/////////////////////////Initserver.sqf stock//////





////////////////////////ALLIAS///////////////////


//gravity_ray = false; publicVariable "gravity_ray";

//waitUntil {gravity_ray};

//null = [ray] execVM "AL_gravity\gravity_ray.sqf";




[aurora_2] execvm "AL_ambient_SFX\rupture.sqf";




//Temp fix for endless loading screen.
_EndSplashScreen = {
    for "_x" from 1 to 4 do {
        endLoadingScreen;
        sleep 3;
    };
};

[] spawn _EndSplashScreen;
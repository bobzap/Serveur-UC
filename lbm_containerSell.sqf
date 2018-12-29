// add to container init field:
/* this addEventHandler ["ContainerClosed",{[_this select 0,_this select 1,"Equipements_CLONES"] call compile preprocessFileLineNumbers "lbm_containerSell.sqf"}]; */



// lbm_containerSell.sqf:
params [["_container",objNull],["_unit",objNull],["_buyablesSet","UNKNOWN"]];

private _weapons = getWeaponCargo _container;
private _items = getItemCargo _container;
private _magazines = getMagazineCargo _container;
private _backpacks = getBackpackCargo _container;

clearWeaponCargoGlobal _container;
clearItemCargoGlobal _container;
clearMagazineCargoGlobal _container;
clearBackpackCargo _container;

private _totalAmountSold = 0;
private _totalPrice = 0;

private _fnc_findBuyable = {
    params [["_className",""]];
    private _categoryID = -1;
    private _buyableID = -1;
    {
        _buyableID = _x find _className;
        if (_buyableID != -1) exitWith {
            _categoryID = _forEachIndex;
        };
    } forEach _allBuyables;
    [_categoryID,_buyableID]
};


private _cfgSet = missionConfigFile >> "CfgGradBuymenu" >> _buyablesSet;
private _allCategories = ("true" configClasses _cfgSet) apply {configName _x};
private _allBuyables = [];
{
    _buyables = ("true" configClasses (_cfgSet >> _x)) apply {configName _x};
    _allBuyables pushBack _buyables;
    nil
} count _allCategories;

{
    _x params ["_classNames","_amounts"];
    _itemTypeID = _forEachIndex;
    {
        _amount = _amounts select _forEachIndex;
        ([_x] call _fnc_findBuyable) params [["_categoryID",-1],["_buyableID",-1]];

        diag_log ["categoryID",_categoryID,"buyableID",_buyableID];

        _remaining = 0;
        if (_categoryID != -1 && _buyableID != -1) then {
            _categoryName = _allCategories select _categoryID;
            _buyableName = _allBuyables select _categoryID select _buyableID;
            _price = [_cfgSet >> _categoryName >> _buyableName,"price",0] call BIS_fnc_returnConfigEntry;
            _buyAmount = [_cfgSet >> _categoryName >> _buyableName,"amount",1] call BIS_fnc_returnConfigEntry;

            if (_amount >= _buyAmount) then {
                if (_amount mod _buyAmount > 0) then {
                    _remaining = _amount mod _buyAmount;
                };

                _amountSold = floor (_amount/_buyAmount);
                _totalAmountSold = _totalAmountSold + _amountSold * _buyAmount;
                _totalPrice = _totalPrice + _amountSold * _price;

                [_buyablesSet,_categoryName,_buyableName,_amountSold] remoteExec ["grad_lbm_fnc_addStock",2,false];
                [player,_amount * _price] call grad_lbm_fnc_addFunds;
            } else {
                _remaining = _amount;
            };
        };
        if (_remaining > 0) then {
            switch (_itemTypeID) do {
                case (0): {_container addWeaponCargoGlobal [_x,_remaining]};
                case (1): {_container addItemCargoGlobal [_x,_remaining]};
                case (2): {_container addMagazineCargoGlobal [_x,_remaining]};
                case (3): {_container addBackpackCargoGlobal [_x,_remaining]};
            };
        };
    } forEach _classNames;
} forEach [_weapons,_items,_magazines,_backpacks];

["RespawnAdded",[
    "Transaction",
    format ["%1 items vendus pour un total de %2 &#8353 Cr.",_totalAmountSold,_totalPrice],
    "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa"
]] call BIS_fnc_showNotification;

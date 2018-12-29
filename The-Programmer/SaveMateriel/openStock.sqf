params ["_unit", "_container"];

if (typeof _container == "GroundWeaponHolder") then {
	_objectsArround=position player nearObjects 5;
	for "_i" from 0 to count(_objectsArround)-1 do {
		_object=_objectsArround select _i;
		if (str(_object) select [0,13] == "SaveMateriel_") then {
			[] spawn {
				["ACCES REFUSE","Proximité avec un casier de stockage","STOP",3,[1,0,0,1]] execVM "The-Programmer\Functions\popup.sqf";
				waitUntil{not(isNull(findDisplay 602))};
				player setVariable["forceCloseInventory",true];
				closeDialog 0;
				waitUntil{isNull(findDisplay 602)};
				player setVariable["forceCloseInventory",false];
			};
		};
	};
};

if not(str(_container) select [0,13] == "SaveMateriel_")exitwith {};

_proprietaire=_container getvariable ["_proprietaire",player];
if (_proprietaire!=player)exitwith {
	[] spawn {
		["ACCES REFUSE","Casier en cours d'utilisation...","STOP",3,[1,0,0,1]] execVM "The-Programmer\Functions\popup.sqf";
		waitUntil{not(isNull(findDisplay 602))};
		player setVariable["forceCloseInventory",true];
		closeDialog 0;
		waitUntil{isNull(findDisplay 602)};
		player setVariable["forceCloseInventory",false];
	};
};
_container setvariable ["_proprietaire",_proprietaire,true];
["CHARGEMENT DU CASIER","Chargement de l'equipement...","LOAD",1,[0,1,1,1]] execVM "The-Programmer\Functions\popup.sqf";
_this spawn {
	params ["_unit", "_container"];
	waitUntil{not(isNull(findDisplay 602))};
	[] execVM "The-Programmer\Functions\blinkArrow.sqf";
	_container execVM "The-Programmer\Functions\blinkArrow.sqf";
	[] execVM "The-Programmer\Functions\RotateCamera.sqf";
	_profileWeapons=profileNameSpace getvariable [serverName+"_"+missionName+"_"+str(getPlayerUID player)+"_"+"SaveMateriel"+"_weapons",[[],[]]];
	for "_i" from 0 to count(_profileWeapons select 0)-1 do {
		_weapon=(_profileWeapons select 0) select _i;
		_weaponNb=(_profileWeapons select 1) select _i;
		_container addWeaponCargoGlobal [_weapon, _weaponNb];
	};
	_profileItems=profileNameSpace getvariable [serverName+"_"+missionName+"_"+str(getPlayerUID player)+"_"+"SaveMateriel"+"_items",[[],[]]];
	for "_i" from 0 to count(_profileItems select 0)-1 do {
		_item=(_profileItems select 0) select _i;
		_itemNb=(_profileItems select 1) select _i;
		_container addItemCargoGlobal [_item, _itemNb];
	};
	_profileMagazines=profileNameSpace getvariable [serverName+"_"+missionName+"_"+str(getPlayerUID player)+"_"+"SaveMateriel"+"_magazines",[[],[]]];
	for "_i" from 0 to count(_profileMagazines select 0)-1 do {
		_magazine=(_profileMagazines select 0) select _i;
		_magazineNb=(_profileMagazines select 1) select _i;
		_container addMagazineCargoGlobal [_magazine, _magazineNb];
	};
	_profileBackPacks=profileNameSpace getvariable [serverName+"_"+missionName+"_"+str(getPlayerUID player)+"_"+"SaveMateriel"+"_containers",[[],[]]];
	for "_i" from 0 to count(_profileBackPacks select 0)-1 do {
		_backpack=(_profileBackPacks select 0) select _i;
		_backpackNb=(_profileBackPacks select 1) select _i;
		_container addBackpackCargoGlobal  [_backpack, _backpackNb];
	};
};
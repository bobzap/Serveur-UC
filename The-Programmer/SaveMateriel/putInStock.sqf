params ["_unit", "_container", "_item"];

if not(str(_container) select [0,13] == "SaveMateriel_") exitwith {};

_weapons=weaponsItemsCargo _container;
_allItems=getItemCargo _container;
_containers=everyContainer _container;
_containersBackpacks=everyBackpack _container;

clearWeaponCargoGlobal _container;
clearItemCargoGlobal _container;
clearBackpackCargoGlobal _container;

for "_i" from 0 to count(_weapons)-1 do {
	_weaponItems=_weapons select _i;
	_weapon=_weaponItems select 0;
	_silencieux=_weaponItems select 1;
	_canon=_weaponItems select 2;
	_viseur=_weaponItems select 3;
	_chargeurs=(_weaponItems select 4);
	_bipied=_weaponItems select 5;
	
	_container addWeaponCargoGlobal [_weapon,1];
	_container addItemCargoGlobal [_silencieux,1];
	_container addItemCargoGlobal [_canon,1];
	_container addItemCargoGlobal [_viseur,1];
	_container addItemCargoGlobal [_bipied,1];
	
	if not(_chargeurs isequalTo []) then {
		_chargeur=(_weaponItems select 4) select 0;
		_nbBalles=(_weaponItems select 4) select 1;
		_container addMagazineAmmoCargo [_chargeur,1,_nbBalles];
	};
};

if not(_allItems isEqualTo [[],[]]) then {
	for "_i" from 0 to count(_allItems select 0)-1 do {
		_item=(_allItems select 0) select _i;
		_quantity=(_allItems select 1) select _i;
		_container addItemCargoGlobal [_item,_quantity];
	};
};

for "_i" from 0 to count(_containers)-1 do {
	_containerName=(_containers select _i) select 0;
	_cargo=(_containers select _i) select 1;

	if (_cargo in _containersBackpacks) then{
		_container addBackpackCargoGlobal [_containerName,1];
	};
	_items=getItemCargo _cargo;
	for "_j" from 0 to count(_items select 0)-1 do {
		_item=(_items select 0) select _j;
		_nbItem=(_items select 1) select _j;
		_container addItemCargoGlobal [_item,_nbItem];
	};
	
	_magazines=getMagazineCargo _cargo;
	for "_j" from 0 to count(_magazines select 0)-1 do {
		_magazine=(_magazines select 0) select _j;
		_nbMagazine=(_magazines select 1) select _j;
		_container addMagazineCargoGlobal [_magazine,_nbMagazine];
	};
	
	_weapons=getWeaponCargo _cargo;
	for "_j" from 0 to count(_weapons select 0)-1 do {
		_weapon=(_weapons select 0) select _j;
		_nbWeapon=(_weapons select 1) select _j;
		_container addWeaponCargoGlobal [_weapon,_nbWeapon];
	};
	
	_backpacks=getBackpackCargo _cargo;
	for "_j" from 0 to count(_backpacks select 0)-1 do {
		_backpack=(_backpacks select 0) select _j;
		_nbBackpack=(_backpacks select 1) select _j;
		_container addBackpackCargoGlobal [_backpack,1];
	};
};
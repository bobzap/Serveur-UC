clearAllItemsFromBackpack player;
clearBackpackCargo player;
removeAllWeapons player;
removeAllItems player;
removeBackpack player;
removeHeadgear player;
removeUniform player;
removeVest player;
{player unassignItem _x;player removeItem _x} forEach assignedItems player;
//ajout de l'equipement
player addHeadgear "442nd_Helmet";
player addUniform "SWOP_Clonetrooper_501_F_CombatUniform";
player addVest "SWOP_Clonetrooper_501_armor";

//ajout des items de bases
player addItem "itemCompass";
player addItem "itemWatch";
player addItem "tf_anprc152";
player addItem "itemMap";
player assignItem "itemCompass";
player assignItem "itemWatch";
player assignItem "tf_anprc152";
player assignItem "itemMap";
player addItem "OPTRE_NVG";
player assignItem "OPTRE_NVG";
player addItem "SWOP_Clones_HUD";
player assignItem "SWOP_Clones_HUD";

//grenades
player addMagazine "SWOP_termDet_G";
player addMagazine "SWOP_termDet_G";
player addMagazine "Smokeshell";

//chargeur DC15A
for [{_i=0}, {_i < 8}, {_i = _i + 1}] do {
	player addMagazine "SWOP_DC15_Mag";
};

//ajout d'une dc15a et prise en main
player addWeapon "SWOP_DC15";
player selectWeapon "SWOP_DC15";

//bandages
for [{_i=0}, {_i < 5}, {_i = _i + 1}] do {
	player addItemToUniform "ACE_quikclot";
	player addItemToUniform "ACE_elasticBandage";
	player addItemToUniform "ACE_packingBandage";
	player addItemToUniform "ACE_fieldDressing";
};

//attelle
player addItemToUniform "adv_aceSplint_splint";
player addItemToUniform "adv_aceSplint_splint";


//garrot
 player addItemToUniform "ACE_tourniquet";
 player addItemToUniform "ACE_tourniquet";

//housse mortuaire
 player addItemToUniform "ACE_bodyBag";
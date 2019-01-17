//retire le sac si necessaire
clearAllItemsFromBackpack player;
clearBackpackCargo player;
removeBackpack player;

//ajoute le sac médical
player addBackpack "SWOP_B_CloneBackpack_med";


//epinephrine et morphine
unitBackpack player addItemCargo ["ACE_epinephrine",10];
unitBackpack player addItemCargo ["ACE_morphine",10];

//bandages
unitBackpack player addItemCargo ["ACE_quikclot",15];
unitBackpack player addItemCargo ["ACE_elasticBandage",15];
unitBackpack player addItemCargo ["ACE_packingBandage",15];
unitBackpack player addItemCargo ["ACE_fieldDressing",15];

//sang, saline
unitBackpack player addItemCargo ["ACE_bloodIV",4];
unitBackpack player addItemCargo ["ACE_bloodIV_500",4];
unitBackpack player addItemCargo ["ACE_salineIV",4];
unitBackpack player addItemCargo ["ACE_salineIV_500",2];

//garrot
unitBackpack player addItemCargo ["ACE_tourniquet",6];

//attelle
unitBackpack player addItemCargo ["adv_aceSplint_splint",4];

//défibrilateur
unitBackpack player addItemCargo ["adv_aceCPR_AED",1];


//housse mortuaire
unitBackpack player addItemCargo ["ACE_bodyBag",1];

//trousse
unitBackpack player addItemCargo ["ACE_surgicalKit",1];
unitBackpack player addItemCargo ["ACE_personalAidKit",1];

player switchMove "amovpercmstpsraswrfldnon";
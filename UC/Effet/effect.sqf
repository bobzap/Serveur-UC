
//diag_log ["effect.sqf",_this];
sleep 5;
_position2 = GetPos player;
Antennecontrole = _position2 nearEntities ["Land_OPTRE_fusion_coil", 10];

_lancereffet = Antennecontrole execVM "AL_gravity\gravity.sqf";



execVM "UC\marker\marker.sqf"; 
execVM "UC\Attack\ia.sqf"; 

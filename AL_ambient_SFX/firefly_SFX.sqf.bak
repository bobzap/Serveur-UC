// by ALIAS
//null=[fly] execvm "AL_ambient_SFX\firefly.sqf";

if (!hasInterface) exitWith {};

_firefly_nest = _this select 0;

while {!isNull _firefly_nest} do 
{
	waitUntil {sleep 1; sunOrMoon == 0};
	waitUntil {sleep 1; player distance _firefly_nest < 200};
	_firefly_nest = "#particlesource" createVehicleLocal (getPos _firefly_nest);
	_firefly_nest setParticleCircle [10,[0,0,0]];
	_firefly_nest setParticleRandom [10,[5,5,2],[0.2,0.2,0.5],1,0,[0,0,0,0.1],1,1];
	_firefly_nest setParticleParams [["\A3\data_f\proxies\muzzle_flash\mf_machineGun_Cheetah.p3d",1,0,1],"","SpaceObject",1,14,[0,0,5],[0,0,0.5],13,1.3,1,0,[0.01,0.01],[[1,1,1,1],[1,1,1,1]],[1],1,1,"","",_firefly_nest];
	_firefly_nest setDropInterval 0.1;
	waitUntil {sleep 1; player distance _firefly_nest > 200};
	deleteVehicle _firefly_nest;
};
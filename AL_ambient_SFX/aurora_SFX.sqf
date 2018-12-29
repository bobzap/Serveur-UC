// by ALIAS

if (!hasInterface) exitwith {};

_sky_obj = _this select 0;

while {!isNull _sky_obj} do 
{
	waitUntil {sleep 10; sunOrMoon==0};
	_plasma_wave = "#particlesource" createVehicleLocal (getPosATL _sky_obj);  
	_plasma_wave setParticleCircle [0,[0,0,0]];  
	//_plasma_wave setParticleRandom [5,[2500,5,20],[0,0,0],10,0,[0,0,0,0],1,0];  
	_plasma_wave setParticleRandom [5,[2500,20,10],[0,0,0],10,0,[0,0,0,0],1,0];  
	_plasma_wave setParticleParams [["\A3\data_f\kouleSvetlo",1,0,1],"","Billboard",1,180,[0,0,0],[0,0,0],13,9.999,7.9,0.005,[150,150,150,300],[[0,1,0,0],[0,1,0,1],[0,0.3,0.7,0.5],[0.9,0,0.7,1],[0.4,0,0.2,0]],[0.08],1,0,"","",_sky_obj];
	_plasma_wave setDropInterval 0.05;
	waitUntil {sleep 10; sunOrMoon==1};
	deleteVehicle _plasma_wave;
};
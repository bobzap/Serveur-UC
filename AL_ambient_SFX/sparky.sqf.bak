//by ALIAS

private ["_spark_poz_rel","_pauza_intre_sclipiri","_lamp"];

if (!isServer) exitWith {};

_lamp = _this select 0;

if (!isNil {_lamp getVariable "is_ON"}) exitwith {}; 
_lamp setVariable ["is_ON",true,true];

while {!isNull _lamp} do 
{
	_sclipiri = 1+ floor (random 5);
	_nr = 0;
	while {_nr<_sclipiri} do 
	{
		_pauza_intre_sclipiri = 0.1+ (random 2);
		[[_lamp,_pauza_intre_sclipiri],"AL_ambient_SFX\spark_effect.sqf"] remoteExec ["execvm"];
		sleep _pauza_intre_sclipiri;
		_nr=_nr+1;
	};
	sleep 30 + random 60;
};
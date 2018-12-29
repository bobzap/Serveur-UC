// by ALIAS
//null=[fly] execvm "AL_ambient_SFX\firefly.sqf";

if (!isServer) exitWith {};

_firefly_nest = _this select 0;

if (!isNil {_firefly_nest getVariable "is_ON"}) exitwith {}; 
_firefly_nest setVariable ["is_ON",true,true];

[[_firefly_nest],"AL_ambient_SFX\firefly_SFX.sqf"] remoteexec ["execvm",0,true];
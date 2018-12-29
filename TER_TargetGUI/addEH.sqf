_allTargets = nearestObjects  [[worldSize /2, worldSize /2, 0], ["TargetBase"], worldSize];
TER_currentTarget = objNull;
{
	if (_x getVariable ["TER_isTarget", false]) then {
		_x addEventHandler ["HitPart", {
			#include "ctrlDef.sqf"
			_params = _this select 0;
			_params params ["_target", "_shooter", "_bullet", "_position"];
			_position = ASLToAGL _position;
			_retParams = [_target, _shooter, _bullet, _position];
			_target setVariable ["TER_LastHitPos", _retParams, true];

			if (isNull _mainDisplay) exitWith {};
			if (TER_currentTarget != _target) exitWith {};

			_cfgPath = configfile >> "CfgVehicles" >> typeOf _target;
			_displayName = _cfgPath call BIS_fnc_displayName;
			_t1 = localize "STR_TER_txtTarget" +" " +_displayName;
			_t2 = localize "STR_TER_txtShooter" +" "  +name _shooter;
			_t3 = localize "STR_TER_txtWeapon" +" " +getText (configfile >> "CfgWeapons" >> currentWeapon _shooter >> "displayName");
			_t4 = localize "STR_TER_txtDistance" +" " +str (_shooter distance _target) +"m";
			_magDetail = currentMagazineDetail  _shooter;
			_t6Pre =[_magDetail, 0,(_magDetail find "[") -1]  call BIS_fnc_trimString;
			_t6 = localize "STR_TER_txtMagazine" +" " +_t6Pre;
			_t5 = "";
			if (toLower typeOf _target find "acc" > -1) then {
				_t5 = localize "STR_TER_txtAccuracy" +" " +str ((1- (_position  distance (_target modelToWorld [-0.00390625,0.161621,-0.0233293])))*100) +"%";
			};
			_txt = [];
			{
				{_txt pushBack _x} forEach [_x, lineBreak];
			} forEach ["", _t1, _t2, _t3, _t4,_t6, _t5];
			_finalText = composeText _txt;
			_txtData ctrlSetStructuredText _finalText;

			_hitOffset = _target worldToModel _position;
			_offGUI = ctrlPosition _objModel vectorAdd [(_hitOffset select 0) /2, 0, (-(_hitOffset select 2) /2)];
			_objPointer ctrlSetPosition _offGUI;

			_pointer = "Sign_Sphere10cm_F" createVehicleLocal _position;
			_pointer attachTo [_target, _hitOffset];
			_pointer setObjectTexture [0,"#(argb,8,8,3)color(1,0,0,1.0,ca)"];
			_pointer spawn {
				sleep 10;
				deleteVehicle _this;
			};
		}];
	};
} forEach _allTargets;
[] spawn {
	_cycle=5;
	_cfg=(configfile >> "CfgWorlds" >> worldName >> "Names");
	_n=count(_cfg);
	player setVariable ["CityLocalisation",""];
	while {true} do {
		for "_i" from 0 to _n-1 do {
			scopeName "loopFor";
			_cycleTime=_cycle * 60/diag_fps;
			_cfg_ville=_cfg select _i;
			_position=(getArray(_cfg_ville>>"Position"))+[0];
			_radiusA=getNumber(_cfg_ville>>"radiusA");
			_radiusB=getNumber(_cfg_ville>>"radiusB");
			_type=getText(_cfg_ville>>"type");
			_name=getText(_cfg_ville>>"name");
			if (_name!="") then {
				_positionPlayer=position Player;
				_distanceCity=round((((_position select 0) - (_positionPlayer select 0))^2+((_position select 1)-(_positionPlayer select 1))^2+((_position select 2)-(_positionPlayer select 2))^2)^(1/2));
				if (_distanceCity<_radiusA) then {
					if ((player getVariable ["CityLocalisation",""]) != _name) then {
						player setVariable ["CityLocalisation",_name];
						player setVariable ["CityID",_i];
						player setVariable ["CityState",true];
						if (_distanceCity<_radiusB) then {
							player setVariable ["CityProximity",true];
							[
								_name,
								"Vous entrez dans le centre de"+"<br /> "+"<t size='1.2' underline='true' color='#99ffffff'>"+_name+"</t>",
								"",
								_cycleTime,
								[random [0,0.5,1],random[0.5,0.75,1],random [0,0.5,1],random [0.5,0.75,1]],
								[random [0,0.5,1],random[0.5,0.75,1],random [0,0.5,1],random [0.5,0.75,1]],
								[random [0,0.5,1],random[0.5,0.75,1],random [0,0.5,1],random [0.5,0.75,1]],
								"\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa"								
							] execVM "The-Programmer\Functions\popup.sqf";
						}else{
							player setVariable ["CityProximity",false];
							[
								_name,
								"Vous entrez dans le secteur de"+"<br /> "+"<t size='1.2' underline='true' color='#99ffffff'>"+_name+"</t>",
								"",
								_cycleTime,
								[random[0.5,0.75,1],random[0.5,0.75,1],random[0.5,0.75,1],random [0.5,0.75,1]],
								[random[0.5,0.75,1],random[0.5,0.75,1],random[0.5,0.75,1],random [0.5,0.75,1]],
								[random[0.5,0.75,1],random[0.5,0.75,1],random[0.5,0.75,1],random [0.5,0.75,1]],
								"\A3\ui_f\data\map\mapcontrol\ruin_CA.paa"
							] execVM "The-Programmer\Functions\popup.sqf";
						};
					};
					waitUntil{
						_cycleTime=_cycle * 60/diag_fps;
						_positionPlayer=position Player;
						_distanceCity=round((((_position select 0) - (_positionPlayer select 0))^2+((_position select 1)-(_positionPlayer select 1))^2+((_position select 2)-(_positionPlayer select 2))^2)^(1/2));
						sleep _cycleTime;
						_distanceCity>_radiusA;
					};
					player setVariable ["CityState",false];
					[
						_name,
						"Vous sortez de "+"<br /> "+"<t size='1.2' underline='true' color='#99ffffff'>"+_name+"</t>",
						"",
						_cycleTime,
						[random[0.5,0.75,1],random [0,0.5,1],random [0,0.5,1],random [0.5,0.75,1]],
						[random[0.5,0.75,1],random [0,0.5,1],random [0,0.5,1],random [0.5,0.75,1]],
						[random[0.5,0.75,1],random [0,0.5,1],random [0,0.5,1],random [0.5,0.75,1]],
						"\A3\ui_f\data\map\mapcontrol\busstop_CA.paa"
					] execVM "The-Programmer\Functions\popup.sqf";
					sleep _cycleTime;
					breakOut "loopFor";
				};
			};
			sleep (_cycleTime/_n);
		};
	};
};
if (dialog) exitWith{};

_titre=(player getVariable "CityLocalisation");
_description=
	if (player getVariable "CityState")then{
		if (player getVariable "CityProximity") then {	"Vous entrez dans le centre de"+"<br /> "+"<t size='1.2' underline='true' color='#99ffffff'>"+(player getVariable "CityLocalisation")+"</t>"}
		else{											"Vous entrez dans le secteur de"+"<br /> "+"<t size='1.2' underline='true' color='#99ffffff'>"+(player getVariable "CityLocalisation")+"</t>"};
	}else{												"Vous sortez de "+"<br /> "+"<t size='1.2' underline='true' color='#99ffffff'>"+(player getVariable "CityLocalisation")+"</t>"};
_iconText=str(player getVariable "CityId");
_colorText=
	if (player getVariable "CityState")then{
		if (player getVariable "CityProximity") then {	[random [0,0.5,1],random[0.5,0.75,1],random [0,0.5,1],random [0.5,0.75,1]]}
		else{											[random[0.5,0.75,1],random[0.5,0.75,1],random[0.5,0.75,1],random [0.5,0.75,1]]};
	}else{												[random[0.5,0.75,1],random [0,0.5,1],random [0,0.5,1],random [0.5,0.75,1]]};
_colorIcon=
	if (player getVariable "CityState")then{
		if (player getVariable "CityProximity") then {	[random [0,0.5,1],random[0.5,0.75,1],random [0,0.5,1],random [0.5,0.75,1]]}
		else{											[random[0.5,0.75,1],random[0.5,0.75,1],random[0.5,0.75,1],random [0.5,0.75,1]]};
	}else{												[random[0.5,0.75,1],random [0,0.5,1],random [0,0.5,1],random [0.5,0.75,1]]};
_colorIconText=
	if (player getVariable "CityState")then{
		if (player getVariable "CityProximity") then {	[random [0,0.5,1],random [0,0.5,1],random [0,0.5,1],random [0,0,1]]}
		else{											[random [0,0.5,1],random [0,0.5,1],random [0,0.5,1],random [0,0,1]]};
	}else{												[random [0,0.5,1],random [0,0.5,1],random [0,0.5,1],random [0,0,1]]};

_icon=
	if (player getVariable "CityState")then{
		if (player getVariable "CityProximity") then {	"\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa"}
		else{											"\A3\ui_f\data\map\mapcontrol\ruin_CA.paa"};
	}else{												"\A3\ui_f\data\map\mapcontrol\busstop_CA.paa"};

player setVariable["NotificationInRun",true];
_data=[
	_titre,
	_icon,
	_iconText,
	_description,
	_colorText,
	_colorIcon,
	_colorIconText,
	5,
	0, //Priority
	[], //Args
	"defaultNotification", //SoundOpen
	"defaultNotificationClose", //SoundClose
	"", //SoundRadio
	0 //IconSize
];
missionnamespace setvariable ["RscNotification_data",_data];
10 cutRsc ["RscNotification","PLAIN"];
sleep (_data select 7);
player setVariable["NotificationInRun",false];
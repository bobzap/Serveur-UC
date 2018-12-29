if (dialog) exitWith{};
params [ 
	"_title", 
	"_description",
	"_iconText",
	"_duration",
	"_color",
	"_colorIconText",
	"_colorIconPicture",
	"_iconPicture"
];
player setVariable["NotificationInRun",true];
_data=[
	if (isnil "_title")then{"NOTIFICATION"}else{_title},
	if (isnil "_iconPicture")then{""}else{_iconPicture},
	if (isnil "_iconText")then{"NEW!"}else{_iconText},
	if (isnil "_description")then{"Notification"}else{_description},
	if (isnil "_color")then{[random [0,0.5,1],random [0,0.5,1],random [0,0.5,1],random [0.5,0.75,1]]}else{_color},
	if (isnil "_colorIconPicture")then{[random [0,0.5,1],random [0,0.5,1],random [0,0.5,1],random [0.5,0.75,1]]}else{_colorIconPicture},
	if (isnil "_colorIconText")then{[random [0,0.5,1],random [0,0.5,1],random [0,0.5,1],random [0.5,0.75,1]]}else{_colorIconText},
	if (isnil "_duration")then{5}else{_duration},
	0, //Priority
	[], //Args
	"defaultNotification", //SoundOpen
	"defaultNotificationClose", //SoundClose
	"", //SoundRadio
	0 //IconSize
];
missionnamespace setvariable ["RscNotification_data",_data];
10 cutrsc ["RscNotification","PLAIN"];
sleep (_data select 7);
player setVariable["NotificationInRun",false];
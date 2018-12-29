/* 
["NOTIFICATION","NEW!","OK",1,[1,0,0,1],[0,1,0,1],[0,0,1,1],"\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa","defaultNotification","defaultNotificationClose","defaultNotification",1,139] execVM "The-Programmer\Functions\popup.sqf"; 
*/

if (dialog) exitWith{};

params [ 
	"_title", 
	"_description",
	"_iconText",
	"_duration",
	"_color",
	"_colorIconText",
	"_colorIconPicture",
	"_iconPicture",
	"_soundOpen",
	"_soundClose",
	"_soundRadio",
	"_iconSize",
	"_screen"
];
player setVariable["NotificationInRun",true];

#include "popup_config.cpp"

_data=[
	if (isnil "_title")then{_titleDefault}else{_title},
	if (isnil "_iconPicture")then{_iconPictureDefault}else{_iconPicture},
	if (isnil "_iconText")then{_iconTextDefault}else{_iconText},
	if (isnil "_description")then{_descriptionDefault}else{_description},
	if (isnil "_color")then{_colorDefault}else{_color},
	if (isnil "_colorIconPicture")then{_colorIconPictureDefault}else{_colorIconPicture},
	if (isnil "_colorIconText")then{_colorIconTextDefault}else{_colorIconText},
	if (isnil "_duration")then{_durationDefault}else{_duration},
	0, //Priority
	[], //Args
	if (isnil "_soundOpen")then{_soundOpenDefault}else{_soundOpen},
	if (isnil "_soundClose")then{_soundCloseDefault}else{_soundClose},
	if (isnil "_soundRadio")then{_soundRadioDefault}else{_soundRadio},
	if (isnil "_iconSize")then{_iconSizeDefault}else{_iconSize}
];
missionnamespace setvariable ["RscNotification_data",_data];
(if (isnil "_screen")then{_screenDefault}else{_screen}) cutrsc ["RscNotification","PLAIN"];
sleep (_data select 7);
player setVariable["NotificationInRun",false];
//extractionMapClick.sqf
// © OCTOBER 2011 - norrin
private ["_unit","_heli"];
_unit 		= _this select 3;
if (!local _unit) exitWith {};
NORRN_exPos = [];
sleep 1;
_heli = _unit getVariable "NORRN_taxiHeli";
player removeAction NORRN_heliExtract_action;
if (!canMove _heli) exitWith {hint "La cannonière à subit de trop lourd degat pour assurer sa mission";NORRN_heloExtractMapClick = false}; 
NORRN_heloExtractMapClick = true;
titletext ["Ouvrir la DataMap et choisir l'emplacement","plain down"];
onMapSingleClick "NORRN_exPos = _pos; NORRN_heloExtractMapClick = false";
while {NORRN_heloExtractMapClick} do {sleep 0.5};
hint "Point Extraction place";
titletext ["","plain down"];
_heli setVariable ["NORRN_H_destChosen", true, true];
_heli setVariable ["NORRN_H_exPos", NORRN_exPos, true];
if (local _heli) then 
{
	[_heli] spawn Nor_HT_S2
} else {
	Nor_HT_S = [_heli, Nor_HT_S2];	
	publicVariable "Nor_HT_S";
};





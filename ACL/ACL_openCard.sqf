/*------------------------------------------------------------------------
=ATM= AMBIENT CIVILIAN LIFE

by Mercier
http://atmarma.fr/forum/portal.php
------------------------------------------------------------------------*/

[
	"<t size='0.5'>Appuyez sur ECHAP pour fermer la carte d'identité.<br/>Vous pouvez déplacer cette dernière en maintenant l'emblème OTAN.",
	[safezoneX + safezoneW - 1.4,1], //DEFAULT: 0.5,0.35
	[safezoneY + safezoneH - 0.3,1], //DEFAULT: 0.8,0.7
	5,
	0.5
] spawn BIS_fnc_dynamicText;

_unit = (_this select 0);
_handle = createDialog "RcsDialog_ACL";
disableSerialization;
_display = uiNamespace getVariable "ACL_Display";
_currentMap = getText (configFile >> "CFGworlds" >> worldName >> "description");

if (_currentMap == "Fallujah v1.2") then {_currentMap = "IRAK"};
if (_currentMap == "Utes - winter") then {_currentMap = "UTES"};
if (_currentMap in ["Chernarus (summer version","Chernarus - winter"]) then {_currentMap = "CHERNARUS"};
if (_currentMap in ["Southern Sahrani","United Sahrani"]) then {_currentMap = "SAHRANI"};
if (_currentMap in ["CLA Clafghan","Takistan Moutains","Zargabad","Désert","Shapur","Summer Sangin 5X5 Km","Winter Sangin 5X5 Km","Kunduz, Afghanistan"]) then {_currentMap = "AFGHANISTAN"};
if (_currentMap == "PR FATA") then {_currentMap = "PAKISTAN"};
if (_currentMap == "Bornholm, Denmark") then {_currentMap = "BORNHOLM"};
if (_currentMap == "F.S.F N'Ziwasogo") then {_currentMap = "N'ZIWASOGO"};
if (_currentMap == "F.S.F Kalu Khan") then {_currentMap = "KALU KHAN"};
if (_currentMap == "F.S.F Dayah") then {_currentMap = "DAYAH"};
if (_currentMap == "F.S.F Al Rayak") then {_currentMap = "AL RAYAK"};
if (_currentMap == "Mogadishu") then {_currentMap = "SOMALIA"};
if (_currentMap == "Nam") then {_currentMap = "VIETNAM"};
if (_currentMap == "Isla Duala v3.35") then {_currentMap = "DUALA"};
if (_currentMap == "Lingor v3.0beta") then {_currentMap = "LINGOR"};
if (_currentMap == "Island Panthera v3.35") then {_currentMap = "PANTHERA"};

// ---------------------- IDENTITY VARIABLES
_unit_name = (_unit getVariable "ACL_IDENTITY_NAME");
_unit_IDnumber = (_unit getVariable "ACL_IDENTITY_ID");
_unit_birthDate = (_unit getVariable "ACL_IDENTITY_BIRTH");
// ----------------------

_StructuredText_1 = _display displayCtrl 1201;
_StructuredText_1 ctrlSetStructuredText parseText "<t font='TahomaB' size='1.6' shadow='1' color='#000000'>NATIONAL IDENTITY CARD</t><br/><t font='TahomaB' size='0.7' shadow='0' color='#b91515'>THIS ID CARD MUST BE PRESENTED TO ANY NATO FORCE</t><br/><t font='TahomaB' size='0.7' shadow='0' color='#000000'>AUTHENTICATION CODE : <t color='#b91515'>1173825461</t></t><br/><t font='PuristaLight' size='0.7' shadow='0' color='#000000'>PROVIDED BY NATO AUTHORITIES</t>";

_StructuredText_2 = _display displayCtrl 1202;
_StructuredText_2 ctrlSetStructuredText parseText format ["<t font='PuristaBold' shadow='0' color='#000000'>CITIZEN OF <t color='#466029'>%1</t></t>",_currentMap];

_StructuredText_3 = _display displayCtrl 1203;
_StructuredText_3 ctrlSetStructuredText parseText format ["
<t font='PuristaBold' size='1' shadow='0' color='#ffffff'>NAME</t><br/><t font='EtelkaMonospacePro' size='0.9' shadow='0' color='#ffb400'>%1</t>
<br/><t font='PuristaBold' size='1' shadow='0' color='#ffffff'>GENDER</t><br/><t font='EtelkaMonospacePro' size='0.9' shadow='0' color='#ffb400'>MALE</t>
<br/><t font='PuristaBold' size='1' shadow='0' color='#ffffff'>ID NUMBER</t><br/><t font='EtelkaMonospacePro' size='0.9' shadow='0' color='#ffb400'>%2</t>",_unit_name,_unit_IDnumber];

_StructuredText_4 = _display displayCtrl 1204;
_StructuredText_4 ctrlSetStructuredText parseText format ["<br/><br/><t font='PuristaBold' size='1' shadow='0' color='#ffffff'>DATE OF BIRTH</t><br/><t font='EtelkaMonospacePro' size='0.9' shadow='0' color='#ffb400'>%1</t>
<br/><t font='PuristaBold' size='0.9' shadow='0' color='#ffffff'>SIGNATURE</t>",_unit_birthDate];

if (true) exitWith {};
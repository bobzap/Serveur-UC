if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Respawn script started for: %1", (name player)];_text remoteExec ["diag_log",2];};

if ( isNil "GRLIB_respawn_loadout" ) then {
	removeAllWeapons player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;
	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
} else {
	sleep 4;
	[ player, GRLIB_respawn_loadout ] call F_setLoadout;
};

if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Respawn script ended for: %1", (name player)];_text remoteExec ["diag_log",2];};

[] call RT_Utils_fnc_initVariables;

if (player in allZeus) then {
	[] call RT_Airport_fnc_addZeusActions;
};

if (!(player in allZeus) or debugInv) then {
	[player] call RT_Players_fnc_addInventoryHandler;
};

if (debug) exitWith {};

[] call RT_MissionFlow_fnc_start;
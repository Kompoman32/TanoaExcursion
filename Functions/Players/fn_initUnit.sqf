params ["_unit"];

if (player != _unit) exitWith {
	_unit hideObject true;
};

[] call RT_Utils_fnc_setVD;

_unit addEventHandler ["GetOutMan", {
	params ["_player", "_role", "_vehicle", "_turret", "_isEject"];

	if (vehicle player != player or !isPlayer _player) exitWith {};

	if (stayInBus) then {
		systemChat "Оставайся в автобусе!!!";

		[_player] call RT_Bus_fnc_teleportToBus;
	};
}];

_unit addEventHandler ["GetInMan", {
	params ["_player", "_role", "_vehicle", "_turret", "_isEject"];

	if (vehicle player == player or !isPlayer _player) exitWith {};

	if (_role == "driver") then {
		systemChat "А ну проваливайте с водительского места!!!";

		[bus, _player] call RT_Bus_fnc_moveToCargo;
	};
}];

_unit addEventHandler ["SeatSwitchedMan", {
	params ["_player", "_unit2", "_vehicle"];

	if (vehicle player == player or !isPlayer _player) exitWith {};

	if (_player == (fullCrew [bus, "driver", true] select 0 select 0)) then {
		systemChat "А ну проваливайте с водительского места!!!";

		[bus, _player] call RT_Bus_fnc_moveToCargo;
	};
}];
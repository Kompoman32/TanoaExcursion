params ["_vehicle", "_player"];

private _fullCrew = fullCrew [_vehicle, "", true];

private _crewIndex = (_fullCrew findIf {
	_player == _x select 0
});

if (_crewIndex == -1) exitWith {
	[_player] call RT_Bus_fnc_teleportToBus;
};

// find current compartment
(_fullCrew select _crewIndex) params ["", "_role", "_cargoIndex", "_currentTurret"];

[_vehicle, _player, [{
	(_this select 0) moveInCargo (_this select 1)
}, [_vehicle, _cargoIndex], _currentTurret, {
	[_this select 0] call RT_Bus_fnc_teleportToBus;
}, [_player]]] call {
// https// github.com/acemod/ACE3/blob/20676a2f039027ef9f7a0c6d673b126380a2a442/addons/quickmount/functions/fnc_addFreeSeatsActions.sqf#L61
params ["_target", "_player", "_params"];

_params params ["_moveInCode", "_moveInParams", "_currentTurret", "_moveBackCode", "_moveBackParams"];

private _IS_MOVED_OUT = {
	params ["_player", "_currentTurret", "_target"];

	( isNull objectParent _player && {
		[] isEqualTo _currentTurret || {
			local _target isEqualTo (_target turretLocal _currentTurret)
		}
	} )
};

private _WAIT_IN_OR_MOVE_BACK = {
	params ["_player", "_moveBackCode", "_moveBackParams"];
	[

		{
			!isNull objectParent (_this select 0)
		},
		{
			(_this select 0) enableSimulation true;
		},
		_this,
		        0.5, // TAKEN_SEAT_TIMEOUT
		{
			params ["_player", "_moveBackCode", "_moveBackParams"];

			[_player, _moveBackParams] call _moveBackCode;

			_player enableSimulation true;
		}
	] call CBA_fnc_waitUntilAndExecute
};

// workaround getting damage when moveOut while vehicle is moving
// also this helps with arma bug when unit is stuck in wrong anim when move in turret with configured enabledByAnimationSource
_player enableSimulation false;

private _preserveEngineOn = _player == driver _target && {
	isEngineOn _target
};

moveOut _player;

if (_preserveEngineOn) then {
	_target engineOn true
};

    // moveIn right after moveOut doesn't work in MP for non-local vehicles, player just stays out
    // so we have to wait some time (e.g. until player is out and turret locality become vehicle locality)
    // usually it's done in the same frame for local vehicles/turrets and takes 3-7 frames for non-local, so in MP can look a little lagging
if ([_player, _currentTurret, _target] call _IS_MOVED_OUT) exitWith {
	[_player, _moveInParams] call _moveInCode;

	[_player, _moveBackCode, _moveBackParams] call _WAIT_IN_OR_MOVE_BACK;
};

[
	{
		params ["_target", "_player", "_currentTurret", "", "", "", "_IS_MOVED_OUT"];
		[_player, _currentTurret, _target] call _IS_MOVED_OUT
	},
	{
		params ["", "_player", "", "_moveInCode", "_moveInParams", "_moveBackCode", "_moveBackParams", "", "_WAIT_IN_OR_MOVE_BACK"];

		[_player, _moveInParams] call _moveInCode;

		[_player, _moveBackCode, _moveBackParams] call _WAIT_IN_OR_MOVE_BACK;
	},
	[_target, _player, _currentTurret, _moveInCode, _moveInParams, _moveBackCode, _moveBackParams, _WAIT_IN_OR_MOVE_BACK]
] call CBA_fnc_waitUntilAndExecute
}
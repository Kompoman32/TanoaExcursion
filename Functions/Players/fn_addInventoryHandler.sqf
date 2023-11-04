params ["_player"];

// Dont Open Inventory on objects (by das attorney - https// forums.bohemia.net/forums/topic/189678-disable-looting-gear-from-corpses/?do=findComment&comment=3205441)
_player addEventHandler ["InventoryOpened", {
	_this spawn {
		waitUntil {
			not isNull findDisplay 602
		};

		params ["_player", "_container"];
		missionNamespace setVariable ["obj", _container];

		private _canBeOpened = _container getVariable ["RT_var_canBeOpened", false] or _container isKindOf "GroundWeaponHolder";

		// hint format ["_container: %1, _player: %2, _canBeOpened: %3", typeOf _container, _player, _canBeOpened];

		if (!_canBeOpened) then {
			systemChat "Нельзя открыть этот инвентарь";
			closeDialog 602;
		}
	};
	true
}];
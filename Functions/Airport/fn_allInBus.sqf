params ["_playersArray", "_bus"];
_playersArray findIf {
	!(_x in _bus)
} == -1
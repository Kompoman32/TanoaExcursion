params [["_timeIn", 0.5], "_timeOut", "_waitBetweenTime"];

if (isNil "_timeOut") then {
	_timeOut = _timeIn;
};

[_timeIn] call RT_Utils_fnc_fadeIn;

if (isNil "_waitBetweenTime") exitWith {
	[_timeOut] call RT_Utils_fnc_fadeOut;
};

sleep _waitBetweenTime;
[_timeOut] call RT_Utils_fnc_fadeOut;
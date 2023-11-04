params ["_time"];

if (isNil "_time") then {
	_time = 0.5;
};

if (_time == 0) then {
	_time = 0.01;
};

[1, "BLACK", _time] spawn BIS_fnc_fadeEffect;
sleep _time;
params ["_valueFrom", "_valueTo", "_step", "_code"];

private _start = _valueFrom;
private _finish = _valueTo;

if (_start > _finish) then {
	private _value = _start;
	while { _start < _finish } do {
		_value = _value + _step;

		if (_value > _finish) then {
			_value = _finish;
		};

		[_value] call _code;
		sleep 0.1;
	}
} else {
	private _value = _finish;
	while { _start < _finish } do {
		_value = _value - _step;

		if (_value < _start) then {
			_value = _start;
		};

		[_value] call _code;
		sleep 0.1;
	}
}
params ["_value"];

[{
	params ["_value"];
	stayInBus = _value;
	publicVariable "stayInBus"
}, [_value]] remoteExec ["call", 2];
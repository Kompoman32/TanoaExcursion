params ["_cam", "_camPosObj_variable", "_camTarget_variable", "_endWaitUntil_variable"];

private _camPosObj = nil;
private _camTarget = nil;

[_cam] call RT_Camera_fnc_show;

waitUntil {
	_camPosObj = missionNamespace getVariable [_camPosObj_variable, nil];
	_camTarget = missionNamespace getVariable [_camTarget_variable, nil];

	if (isNil "_camTarget" or isNil "_camPosObj") exitWith {
		true
	};

	[_cam] call RT_Camera_fnc_show;

	_cam camPrepareTarget _camTarget;
	_cam camPreparePos (position _camPosObj);
	_cam camCommitPrepared 2;
	sleep 2;
	missionNamespace getVariable [_endWaitUntil_variable, false]
};

// camDestroy _cam;
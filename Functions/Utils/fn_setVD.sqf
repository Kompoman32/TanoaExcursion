params ["_vd", "_ovd"];

if (isNil "_ovd") then {
	_ovd = 1000;
};

if (isNil "_vd") then {
	_vd = _ovd + 500;
};

[_vd, _ovd] spawn {
	params ["_vd", "_ovd"];
	sleep 1;

	private _curVD = viewDistance;
	private _curOVD = getObjectViewDistance select 0;

	// [ format ["setVD: _curVD - %1, _curOVD - %2 _VD - %1, _OVD - %2", _curVD, _curOVD, _vd, _ovd] ] call RT_Utils_fnc_log;
	[_vd] remoteExec ["setViewDistance", 0];
	[[_ovd, _ovd min 800]] remoteExec ["setObjectViewDistance", 0];

	/**
		[_curVD, _vd, 10, {
			params ["_vd"];
			[_vd] remoteExec ["setViewDistance", 0];
		}] spawn RT_Utils_fnc_smoothSetValue;
		
		[_curOVD, _ovd, 10, {
			params ["_ovd"];
			[[_ovd, _ovd min 800]] remoteExec ["setObjectViewDistance", 0];
		}] spawn RT_Utils_fnc_smoothSetValue;
	 */
};
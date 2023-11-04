if (!hasInterface) exitWith {};

params ["_player"];

[0, 5, 3] spawn RT_Utils_fnc_fadeInOut;

private _source = playSound "welcome";
_source spawn
{
	waitUntil {
		isNull _this
	};

	if (isDedicated) then {}
};

_camTarget = missionNamespace getVariable ["plane_camera_object_target", nil];
_camPosObj = missionNamespace getVariable ["plane_camera_object", nil];

if (isNil "_camTarget" or isNil "_camPosObj") exitWith {
	true
};

_cam = [position _camPosObj, _camTarget] call RT_Camera_fnc_init;
[_cam] call RT_Camera_fnc_show;

// _cam attachTo [_camPosObj];

sleep 0.5;
_cam camPreparePos (position _camPosObj);
_cam camCommitPrepared 0.5;

private _scripthandler = nil;

_scripthandler = [_cam, "plane_camera_object", "plane_camera_object_target", "planeHaslanded"] spawn RT_Airport_fnc_planeCamTracker;

waitUntil {
	scriptDone _scripthandler
};

// PLANE LANDED 

private _lastCamPos = position _cam;

sleep 10;

[2000, 2200] call RT_Utils_fnc_setVD;

_cam camPreparePos (position plane_camera_2);
_cam camCommitPrepared 8;
sleep 8;

plane_camera_object = plane_camera_2;
plane_camera_object_target = towing;

_scripthandler = [_cam, "plane_camera_object", "plane_camera_object_target", "planeHasParked"] spawn RT_Airport_fnc_planeCamTracker;

waitUntil {
	scriptDone _scripthandler
};

camDestroy _cam;
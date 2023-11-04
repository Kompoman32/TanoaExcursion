params ["_camPos", "_camTarget"];
private _cam = "camera" camCreate _camPos;

_cam camPrepareTarget _camTarget;
_cam camPrepareFov 1;
_cam camPrepareFocus [-1, -1];
_cam camPreparePos _camPos;
_cam camCommitPrepared 0;
_cam
private _posToTeleport = plane getRelPos [20, -45];
private _posX = _posToTeleport select 0;
private _posY = _posToTeleport select 1;
private _posZ = _posToTeleport select 2;

[1, 1, 1] spawn RT_Utils_fnc_fadeInOut;

sleep 1;

[] call RT_Camera_fnc_hide;

{
	_x setPos [_posX + random [-5, 0, 5], _posY + random [-5, 0, 5], 1]
} forEach (allTourists + [zeus_guide]);

// TODO: 
[] call RT_Utils_fnc_setVD;
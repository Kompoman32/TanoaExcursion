airport_vending addAction
[
	"Купить Spirit",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];

		_target removeAction _actionId;

		private _soundSource = _target say3D ["canDrop", 50, 1, 0, 0];

		sleep 4.5;

		deleteVehicle _soundSource;

		_soundSource = _target say3D ["teenspirit", 50, 1, 0, 1];

		airport_can hideObject false;

		sleep 278;
		deleteVehicle _soundSource;
	},
	[], 7, false, true, "", "true", 5
];
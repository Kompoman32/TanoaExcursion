towing addAction
[
	"Tow",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];

		plane attachTo [towing];
	},
	nil,
	7,
	true,
	true,
	"",
	"true"
];

towing addAction
[
	"Stop Tow",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];

		detach plane;

		[] remoteExec ["RT_Airport_fnc_planeParked", 0];
	},
	nil,
	7,
	true,
	true,
	"",
	"true"
];

gate addAction
[
	"Unlock",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];

		_target setVariable ['bis_disabled_Door_1', 0, true];
		_target removeAction _actionId;
	},
	[], 7, false, true, "", "true", 5
];
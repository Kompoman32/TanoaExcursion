params ["_container"];

private _callback = {
	params ["_container", "_player"];
	player playAction "PutDown";
	_player addItem "acex_intelitems_notepad";
};

_container addaction ["Достать листочек",
	_callback, [], 7, true, true, "", "(_this distance _target)<1.5"
];

// ACE action
private _action = ["AddNotepad", "Достать листочек", "\a3\ui_f\data\igui\cfg\actions\take_ca.paa", _callback, {
	true
}, {}, [], [0, 0, 0], 2] call ace_interact_menu_fnc_createAction;

[_container, 0, [], _action] call ace_interact_menu_fnc_addActionToObject;
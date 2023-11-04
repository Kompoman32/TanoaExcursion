missionNamespace getVariable ["debug", false];
missionNamespace getVariable ["debugInv", false];

allScenarioPlayers = ([] call CBA_fnc_players);
allZeus = [zeus_guide, zeus_driver];
allTourists = ([] call CBA_fnc_players) - allZeus;

stayInBus = false;

planeHaslanded = false;
planeHasParked = false;

plane_camera_object = plane_camera;
plane_camera_object_target = cam_target;

obj = nil;
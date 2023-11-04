params ["_unit"];

_unit moveInCargo [bus, 1, true];

_unit assignAsCargoIndex [bus, bus getCargoIndex _unit];
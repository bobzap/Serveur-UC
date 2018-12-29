params ["_unit", "_fort", "_surfaceNormal"];

switch (true) do {
    case (!_surfaceNormal): {
        _fort setVectorUp [0,0,1];
    };
    case (player getVariable ["grad_fortifications_surfaceNormal",true]): {
        _fort setVectorUp surfaceNormal (getPos _fort);
    };
    case (!(player getVariable ["grad_fortifications_surfaceNormal",true])): {
        _fort setVectorUp [0,0,1];
    };
};

// _center1 = createCenter sideLogic;
// _group11 = createGroup _center1;
// _posmod = position player;
// _cas = _group11 createUnit ["ATM_foule_ied",_posmod , [], 0, ""];


_center = createCenter sideLogic;
_group = createGroup _center;
_pos = position player;
_cas = _group createUnit ["ModuleCAS_F",_pos , [], 0, ""];
_cas setDir random [0,180,360];



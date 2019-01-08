//====================================================================
//                      OLD Methode
//====================================================================
/*
// Cette méthode crée une liste d'un objet donné, situé dans un rayon donné, autour du joueur.
// La méthode crée ensuite un marqueur sur la position de chaque object de la liste

_objects = _this select 0;
_size = _this select 1;
_locations = nearestObjects [player, [_objects], _size];
_townNum = 1;
_marker = "";
{

    _marker = createMarker [format ["town%1",_townNum], getpos _x];
    _townNum = _townNum + 1;
    _marker setMarkerShape "RECTANGLE";
    _marker setMarkerSize [50,50];
} forEach _locations;
*/
//====================================================================
//                  END OLD METHODE
//====================================================================


//====================================================================
//                  METHODE ELDARIUS
//====================================================================

// Le but de cette methode est de placer un marqueur sur l'objet définie, le plus proche du joueur
// puis d'ajouter cette objet dans un liste 

//_objects = _this select 0;

//on recupere la position de l'objet dans les 5m autour du joueur
//_locations = nearestObjects [player, [_objects], 5];
//_town = _town + 1; //eld TODO ?

//on ajoute cette objet à une liste 
//_list = _list + _locations;// eld TODO ?

// _marker = createMarker [format ["town%1", count _list], getpos _x];
// _townNum = _townNum + 1;
// _marker setMarkerShape "RECTANGLE";
// _marker setMarkerSize [50,50];

//====================================================================
//                  END METHODE ELDARIUS
//====================================================================



//Nouvelle méthode Sayker

//on crée un marqueur avec un nom qui va correspondre à l'objet (ex : pc => fob, feu => camp ...)
_marker = createMarker [format ["PA%1", count allMapMarkers], getpos player]; //eld TODO possible erreur

_marker setMarkerShape "RECTANGLE";
_marker setMarkerColor "ColorBlue";
_marker setMarkerSize [200,200];

// mettre un waituntil pour la présence de l'objet. si plus d'objet présent détruire le marker 

_positionp = getpos player ;
waitUntil { count ( _positionp nearObjects ["Land_OPTRE_fusion_coil", 20]) < 1



};

_nearestMarker = [allMapMarkers, player] call BIS_fnc_nearestPosition;


deleteMarker _nearestMarker;










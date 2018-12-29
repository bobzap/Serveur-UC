//Event openStock
player addEventHandler ["InventoryOpened", {
    #include "openStock.sqf"
}];
//Event closeStock
player addEventHandler ["InventoryClosed", {
    #include "closeStock.sqf"
}];
//Event putInStock
player addEventHandler ["Put", {
	#include "putInStock.sqf"
}];
//Event takeInStock
player addEventHandler ["Take", {
	#include "takeInStock.sqf"
}];
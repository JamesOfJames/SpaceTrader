// Setup New Room
// argument0 = Room's galX coordinate
// argument1 = Room's galY coordinate
// returns room's id

var a = room_add();
ds_map_add(stars, a, noone);
room_set_background_colour(a, c_black, true);
room_set_persistent(a, true);
room_set_view(a, 0, true, 0, 0, wPort, hPort, 0, 0, wPort, hPort, 0, 0, 0, 0, instance_find(objectPlayerShip, 0));
ds_grid_set(galRooms, argument0, argument1, a);
return a;

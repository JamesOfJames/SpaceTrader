// Setup New Room
// argument0 = Room's galX coordinate
// argument1 = Room's galY coordinate
// returns room's id

var a = room_add();
room_set_background_colour(a, c_black, true);
ds_grid_set(galRooms, argument0, argument1, a);
return a;

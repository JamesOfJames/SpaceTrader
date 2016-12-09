// argument0 = ds_grid
// argument1 = stat x

var a, b;
b = 0;
for (a = 0; a < ds_grid_width(argument0); a += 1)
{if ds_grid_get(argument0, a, ActiveC) == 1 {b += ds_grid_get(argument0, a, argument1)}}
// if slot is active, add to total
return b;

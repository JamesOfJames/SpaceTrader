// argument0 Grid

PowerLoad = 0;
var i;
for (i = 0; i < ds_grid_width(argument0); i += 1)
{if ds_grid_get(argument0, i, ActiveC) == 1 and ds_grid_get(argument0, i, ConstantC) == 1
 {PowerLoad += ds_grid_get(argument0, i, PowerC);}} // Total the constant power demands
return PowerLoad;

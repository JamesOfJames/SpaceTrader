//Unused / unusable for now.

// argument0 Grid
/*
script_execute(scriptPowerLoad, argument0);
if PowerLoad <= 0 {exit;} // Enough power for constant demands.
else // If not enough power...
{var a, b;
 for (a = 0; a < ds_grid_width(argument0); a += 1)
 {if ds_grid_get(argument0, a, 20) == 1 // If ConstantPower required,
  {if ds_grid_get(argument0, a, 17) == 1 or ds_grid_get(argument0, a, 3) <= 0 // If Generator or power-free / -generating,
   {ds_grid_set(argument0, a, 19, 1);} // Activate
   else
   {ds_grid_set(argument0, a, 19, 0);}}} // Otherwise, deactivate.
 script_execute(scriptPowerLoad, argument0);
 if PowerLoad <=0 and ds_grid_value_exists(argument0, 0, 17, ds_grid_width(argument0)-1, 17, 2) and ds_grid_value_exists(argument0, 0, 17, ds_grid_width(argument0)-1, 17, 3) and ds_grid_value_exists(argument0, 0, 17, ds_grid_width(argument0)-1, 17, 4)
 // If there's power, an engine, thrusters, and fuel...
 {b = 10000000; // b tracks best Fuel per Power
  for (a = 0; a < ds_grid_width(argument0); a += 1)
  {if ds_grid_get(argument0, a, 17) == 4 and ds_grid_get(argument0, a, 20) == 1 and ds_grid_get(argument0, a, 28)/ds_grid_get(argument0, a, 3) < b {a=b;}}
   // If Fuel Tank needing constant power at a superior rate, store as b.
  for (a = 0; a < ds_grid_width(argument0); a += 1)
  {if ds_grid_get(argument0, a, 28)/ds_grid_get(argument0, a, 3) == b
   {ds_grid_set(argument0, a, 19, 1); // activate
    break;}}
  b = 10000000; // b tracks best Thrust per Power
  for (a = 0; a < ds_grid_width(argument0); a += 1)
  {if ds_grid_get(argument0, a, 17) == 2 and ds_grid_get(argument0, a, 20) == 1 and (ds_grid_get(argument0, a, 23)/ds_grid_get(argument0, a, 24))/ds_grid_get(argument0, a, 3) < b {a=b;}}
   // If Fuel Tank needing constant power at a superior rate, store as b.
  for (a = 0; a < ds_grid_width(argument0); a += 1)
  {if (ds_grid_get(argument0, a, 23)/ds_grid_get(argument0, a, 24))/ds_grid_get(argument0, a, 3) == b
   {ds_grid_set(argument0, a, 19, 1); // activate
    break;}} 
  b = 10000000; // b tracks best Turn per Power
  for (a = 0; a < ds_grid_width(argument0); a += 1)
  {if ds_grid_get(argument0, a, 17) == 3 and ds_grid_get(argument0, a, 20) == 1 and (ds_grid_get(argument0, a, 25)/ds_grid_get(argument0, a, 26))/ds_grid_get(argument0, a, 3) < b {a=b;}}
   // If Fuel Tank needing constant power at a superior rate, store as b.
  for (a = 0; a < ds_grid_width(argument0); a += 1)
  {if (ds_grid_get(argument0, a, 25)/ds_grid_get(argument0, a, 26))/ds_grid_get(argument0, a, 3) == b
   {ds_grid_set(argument0, a, 19, 1); // activate
    break;}}    
  script_execute(scriptPowerLoad, argument0);
  if PowerLoad <=0
  {
  
  
  
  }}}

// Check if the neighbors would be off the map; if so, expand the map by 1 and fill it in with a default value of -1, signifying that room has not yet been set up.
if galX < 1
{galW++;
 galX = 1;
 ds_grid_resize(galRooms, galW, galH);
 ds_grid_set_grid_region(galRooms, galRooms, 0, 0, galW - 2, galH - 1, 1, 0);
 ds_grid_set_region(galRooms, 0, 0, 0, galH - 1, -1);}
if galY < 1
{galH++;
 galY = 1;
 ds_grid_resize(galRooms, galW, galH);
 ds_grid_set_grid_region(galRooms, galRooms, 0, 0, galW - 1, galH - 2, 0, 1);
 ds_grid_set_region(galRooms, 0, 0, galW - 1, 0, -1);}
if galX >= galW - 1
{galW++;
 galX = galW - 2
 ds_grid_resize(galRooms, galW, galH);
 ds_grid_set_region(galRooms, galW - 1, 0, galW - 1, galH - 1, -1);}
if galY >= galH - 1
{galH++;
 galY = galH - 2
 ds_grid_resize(galRooms, galW, galH);
 ds_grid_set_region(galRooms, 0, galH - 1, galW - 1, galH - 1, -1);}
 
// Check if the neighbors have been created; if not, create them.
sysE = ds_grid_get(galRooms, galX + 1, galY);
if sysE == -1 {sysE = script_execute(scriptNewRoom, galX + 1, galY);}

sysN = ds_grid_get(galRooms, galX, galY - 1);
if sysN == -1 {sysN = script_execute(scriptNewRoom, galX, galY - 1);}

sysW = ds_grid_get(galRooms, galX - 1, galY);
if sysW == -1 {sysW = script_execute(scriptNewRoom, galX - 1, galY);}

sysS = ds_grid_get(galRooms, galX, galY + 1);
if sysS == -1 {sysS = script_execute(scriptNewRoom, galX, galY + 1);}

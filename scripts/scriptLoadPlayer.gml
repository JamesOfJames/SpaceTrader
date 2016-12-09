// *.ini files to be placed at C:\Users\[[USERNAME]]\AppData\Local\Skyline\*.ini
global.PlayerData = ds_grid_create(6, 50); 

/*
if !directory_exists(global.Directory) {show_error("ERROR: Could not find directory "+string(global.Directory)+" - Please create directory and install game global.PlayerData files there.",true);}
if !file_exists(global.Directory+"player.ini") {show_error("ERROR: Could not find file "+string(global.Directory)+"player.ini - Please create directory and install game global.PlayerData files there.",true);}
*/

ini_open("player.ini");
PlayerShip = ini_read_string("Ship","PlayerShip","None");
Health = ini_read_real("Ship","Health",0);
ini_close();

ini_open("ships.ini");
ds_grid_set(global.PlayerData, 0, NameC, ini_read_string(PlayerShip,"ClassName","ClassName"));
ds_grid_set(global.PlayerData, 0, DescriptionC, ini_read_string(PlayerShip,"Description","Description"));
ds_grid_set(global.PlayerData, 0, MassC, ini_read_real(PlayerShip,"Mass",0));
ds_grid_set(global.PlayerData, 0, PowerC, ini_read_real(PlayerShip,"Power",0));
ds_grid_set(global.PlayerData, 0, PriceC, ini_read_real(PlayerShip,"Price",0));
ds_grid_set(global.PlayerData, 0, LoadC, ini_read_real(PlayerShip,"Load",0));
ds_grid_set(global.PlayerData, 0, PrimaryC, ini_read_real(PlayerShip,"PrimarySlots",0));
ds_grid_set(global.PlayerData, 0, SecondaryC, ini_read_real(PlayerShip,"SecondarySlots",0));
ds_grid_set(global.PlayerData, 0, AuxiliaryC, ini_read_real(PlayerShip,"AuxiliarySlots",0));
ds_grid_set(global.PlayerData, 0, MaxHealthC, ini_read_real(PlayerShip,"MaxHealth",0));
ds_grid_set(global.PlayerData, 0, HealthC, Health);
ds_grid_set(global.PlayerData, 0, DurabilityC, ini_read_real(PlayerShip,"Durability",0));
ds_grid_set(global.PlayerData, 0, MaxOccupancyC, ini_read_real(PlayerShip,"MaxOccupancy",0));
ds_grid_set(global.PlayerData, 0, ObjectC, ini_read_real(PlayerShip,"ShipObject",0));
ds_grid_set(global.PlayerData, 0, SizeC, ini_read_real(PlayerShip,"Size",0));
ds_grid_set(global.PlayerData, 0, HandlingC, ini_read_real(PlayerShip,"Handling",0));
ds_grid_set(global.PlayerData, 0, MaintainenceC, ini_read_real(PlayerShip,"Maintainence",0));
ini_close();

ds_grid_resize(global.PlayerData, ds_grid_width(global.PlayerData)+ds_grid_get(global.PlayerData, 0, PrimaryC)+ds_grid_get(global.PlayerData, 0, SecondaryC)+ds_grid_get(global.PlayerData, 0, AuxiliaryC), ds_grid_height(global.PlayerData));

for (i = 1; i <= ds_grid_get(global.PlayerData, 0, AuxiliaryC); i += 1) {script_execute(scriptPlayerLoadEquip,"Auxiliary", i);}
for (i = 1; i <= ds_grid_get(global.PlayerData, 0, SecondaryC); i += 1) {script_execute(scriptPlayerLoadEquip,"Secondary", i);}
for (i = 1; i <= ds_grid_get(global.PlayerData, 0, PrimaryC); i += 1) {script_execute(scriptPlayerLoadEquip,"Primary", i);}
script_execute(scriptPlayerLoadEquip,"Shield", 1);
for (i = 1; i <= 4; i += 1) {script_execute(scriptPlayerLoadEquip,"Armor", i);}

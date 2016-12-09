// *.ini files to be placed at C:\Users\[[USERNAME]]\AppData\Local\Skyline\*.ini

Data = ds_grid_create(6, 50); 
ini_open("ships.ini");
ds_grid_set(Data, 0, NameC, ini_read_string(argument0,"ClassName","ClassName"));
ds_grid_set(Data, 0, DescriptionC, ini_read_string(argument0,"Description","Description"));
ds_grid_set(Data, 0, MassC, ini_read_real(argument0,"Mass",0));
ds_grid_set(Data, 0, PowerC, ini_read_real(argument0,"Power",0));
ds_grid_set(Data, 0, PriceC, ini_read_real(argument0,"Price",0));
ds_grid_set(Data, 0, LoadC, ini_read_real(argument0,"Load",0));
ds_grid_set(Data, 0, PrimaryC, ini_read_real(argument0,"PrimarySlots",0));
ds_grid_set(Data, 0, SecondaryC, ini_read_real(argument0,"SecondarySlots",0));
ds_grid_set(Data, 0, AuxiliaryC, ini_read_real(argument0,"AuxiliarySlots",0));
ds_grid_set(Data, 0, MaxHealthC, ini_read_real(argument0,"MaxHealth",0));
ds_grid_set(Data, 0, HealthC, Health*ini_read_real(argument0,"MaxHealth",0));
ds_grid_set(Data, 0, DurabilityC, ini_read_real(argument0,"Durability",0));
ds_grid_set(Data, 0, MaxOccupancyC, ini_read_real(argument0,"MaxOccupancy",0));
ds_grid_set(Data, 0, ObjectC, ini_read_real(argument0,"ShipObject",0));
ds_grid_set(Data, 0, SizeC, ini_read_real(argument0,"Size",0));
ds_grid_set(Data, 0, HandlingC, ini_read_real(argument0,"Handling",0));
ds_grid_set(Data, 0, MaintainenceC, ini_read_real(argument0,"Maintainence",0));
ini_close();

show_debug_message(string(ds_grid_get(Data, 0, NameC)))

ds_grid_resize(Data, ds_grid_width(Data)+ds_grid_get(Data, 0, PrimaryC)+ds_grid_get(Data, 0, SecondaryC)+ds_grid_get(Data, 0, AuxiliaryC), ds_grid_height(Data));

for (i = 1; i <= ds_grid_get(Data, 0, AuxiliaryC); i += 1) {script_execute(scriptLoadEquip,string(ds_grid_get(Data, 0, NameC))+"-Auxiliary", i);}
for (i = 1; i <= ds_grid_get(Data, 0, SecondaryC); i += 1) {script_execute(scriptLoadEquip,string(ds_grid_get(Data, 0, NameC))+"-Secondary", i);}
for (i = 1; i <= ds_grid_get(Data, 0, PrimaryC); i += 1) {script_execute(scriptLoadEquip,string(ds_grid_get(Data, 0, NameC))+"-Primary", i);}
script_execute(scriptLoadEquip,string(ds_grid_get(Data, 0, NameC))+"-Shield", 1);
for (i = 1; i <= 4; i += 1) {script_execute(scriptLoadEquip,string(ds_grid_get(Data, 0, NameC))+"-Armor", i);}

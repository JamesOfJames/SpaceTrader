// *.ini files to be placed at C:\Users\[[USERNAME]]\AppData\Local\Skyline\*.ini
// argument0 = EquipName
// argument1 = Slot to install it in
// argument2 = Grid

ini_open("equip.ini");
EquipName = ini_read_string(argument0,"EquipName","EquipName");
Description = ini_read_string(argument0,"Description","Description");
Mass = ini_read_real(argument0,"Mass",0);
PowerUse = ini_read_real(argument0,"PowerUse",0);
Price = ini_read_real(argument0,"Price",0);
EquipType = ini_read_real(argument0,"EquipType",0);
SlotType = ini_read_real(argument0,"SlotType",0);
Active = ini_read_real(argument0,"Active",0);
ConstantPower = ini_read_real(argument0,"ConstantPower",0);
Sprite = ini_read_real(argument0,"Sprite",0);
ini_close();

// Enough space or power?
if script_execute(scriptStat, argument2, LoadC) - script_execute(scriptStat, argument2, MassC) >= Mass
{if script_execute(scriptPowerLoad, argument2) + PowerUse <= 0 or !ConstantPower // Require free power for now.

// Slots open?
 {if SlotType == 0
  {InstallSlot = -1;}
  if SlotType == 1
  {if script_execute(scriptStat, argument2, PrimaryC) > 0 
   {InstallSlot = argument1 + 5;
   ds_grid_set(argument2, InstallSlot, PrimaryC, -1);} // Use up a Primary Slot
   else
   {show_message("No Primary slot available to install.");
    InstallSlot = -1;}}
  if SlotType == 2
  {if script_execute(scriptStat, argument2, SecondaryC) > 0 
   {InstallSlot = ds_grid_get(argument2, 0, PrimaryC) + argument1 + 5;
   ds_grid_set(argument2, InstallSlot, SecondaryC, -1);}
   else
   {show_message("No Secondary slot available to install.");
    InstallSlot = -1;}}
  if SlotType == 3
  {if script_execute(scriptStat, argument2, AuxiliaryC) > 0 
   {InstallSlot = ds_grid_get(argument2, 0, PrimaryC) + ds_grid_get(argument2, 0, SecondaryC) + argument1 + 5;
   ds_grid_set(argument2, InstallSlot, AuxiliaryC, -1);}
   else
   {show_message("No Auxiliary slot available to install.");
    InstallSlot = -1;}}
  if SlotType == 4 {InstallSlot = 1;}
  if SlotType == 5 {InstallSlot = 1 + argument1;}

// Actually Install
  if InstallSlot != -1
  {ds_grid_set(argument2, InstallSlot, NameC, EquipName);
   ds_grid_set(argument2, InstallSlot, DescriptionC, Description);
   ds_grid_set(argument2, InstallSlot, MassC, Mass);
   ds_grid_set(argument2, InstallSlot, PowerC, PowerUse);
   ds_grid_set(argument2, InstallSlot, PriceC, Price);
   ds_grid_set(argument2, InstallSlot, EquipTypeC, EquipType);
   ds_grid_set(argument2, InstallSlot, SlotTypeC, SlotType);
   ds_grid_set(argument2, InstallSlot, ActiveC, Active);
   ds_grid_set(argument2, InstallSlot, ConstantC, ConstantPower);
   ds_grid_set(argument2, InstallSlot, SpriteC, Sprite);

   ini_open("equip.ini");
   if EquipType == 1 // Generators
   {ds_grid_set(argument2, InstallSlot, ChargePerStepC, ini_read_real(argument0,"ChargePerStep",0));}
   if EquipType == 2 // Engines
   {ds_grid_set(argument2, InstallSlot, ThrustC, ini_read_real(argument0,"Thrust",0));
    ds_grid_set(argument2, InstallSlot, SpeedFuelRateC, ini_read_real(argument0,"SpeedFuelRate",0));}
   if EquipType == 3 // Thrusters
   {ds_grid_set(argument2, InstallSlot, TurnC, ini_read_real(argument0,"TurnRate",0));
    ds_grid_set(argument2, InstallSlot, TurnFuelRateC, ini_read_real(argument0,"TurnFuelRate",0));}
   if EquipType == 4 // Fuel
   {ds_grid_set(argument2, InstallSlot, MaxFuelC, ini_read_real(argument0,"MaxFuel",0));}
   // #28 = Current Fuel
   if EquipType == 5 // Weapons
   {ds_grid_set(argument2, InstallSlot, ShotTypeC, ini_read_real(argument0,"ShotType",0));
    ds_grid_set(argument2, InstallSlot, AmmunitionTypeC, ini_read_real(argument0,"AmmunitionType",0));
    ds_grid_set(argument2, InstallSlot, ReloadStepsC, ini_read_real(argument0,"ReloadSteps",0));
    ds_grid_set(argument2, InstallSlot, TriggeredOnCollisionC, ini_read_real(argument0,"TriggeredOnCollision",0));
    ds_grid_set(argument2, InstallSlot, DamageRollC, ini_read_real(argument0,"DamageRoll",0));}
   if EquipType == 6 // Armor
   {ds_grid_set(argument2, InstallSlot, MaxHealthC, ini_read_real(argument0,"MaxHealth",0));
    ds_grid_set(argument2, InstallSlot, HealthC, ini_read_real(argument0,"Health",0));
    ds_grid_set(argument2, InstallSlot, DamageResistanceC, ini_read_real(argument0,"DamageResistance",0));}
   if EquipType == 7 // Shield
   {ds_grid_set(argument2, InstallSlot, MaxHealthC, ini_read_real(argument0,"MaxHealth",0));
    ds_grid_set(argument2, InstallSlot, HealthC, ini_read_real(argument0,"Health",0));
    ds_grid_set(argument2, InstallSlot, RechargePerStepC, ini_read_real(argument0,"RechargePerStep",0));}
   if EquipType == 8 // Radar
   {ds_grid_set(argument2, InstallSlot, SignalStrengthC, ini_read_real(argument0,"SignalStrength",0));}
    
   // Insert More Equip Types Here
   ini_close();}}
 else
 {show_debug_message("Not enough power to install - "+string(PowerUse)+" is needed but only "+string(script_execute(scriptPowerLoad,argument2))+" is available.");}}
else
{show_debug_message("Load - "+string(script_execute(scriptStat, argument2, LoadC))+", Mass - "+string(script_execute(scriptStat, argument2, MassC))+", Loading "+string(EquipName))
 show_debug_message("Not enough free space to install - "+string(Mass)+" is needed but only "+string(script_execute(scriptStat, argument2, LoadC) - script_execute(scriptStat, argument2, MassC))+" is available.");}

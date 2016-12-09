// argument0: damaged id
// argument1: damager id

//if !(argument0 == 0 or argument1 == 0) and (instance_exists(argument0) and instance_exists(argument1)) // error prevention, kludge
DamageDirection = floor((point_direction(argument0.x,argument0.y,argument1.x,argument1.y)-argument0.Facing+45)/90); // Which of the 4 quadrants did the damage come from?
 if DamageDirection < 0 {DamageDirection += 4;} // If negative, add 360 degrees=4 quadrants.
 
if argument0.object_index == objectParentPlayer or object_get_parent(argument0.object_index) == objectParentPlayer // If the player is being attacked
{if argument1.BypassShields == false and ds_grid_get(global.PlayerData, 1, ActiveC) == 1 // Damage doesn't bypass shields and the shield is active
 {if ds_grid_get(global.PlayerData, 1, HealthC) > (argument1.ShieldDamageRate * argument1.Damage) // If the player's shields could absorb the damage
  {ds_grid_set(global.PlayerData, 1, HealthC, ds_grid_get(global.PlayerData, 1, HealthC) - (argument1.ShieldDamageRate * argument1.Damage)); // Subtract the damage from shields
   exit;}
  else // If the player's shields couldn't absorb the damage
  {ArmorDamage = (argument1.ShieldDamageRate * argument1.Damage) - ds_grid_get(global.PlayerData, 1, HealthC); // Get remaining damage after shields fall
   ds_grid_set(global.PlayerData, 1, HealthC, 0);}} // drop shields
 else {ArmorDamage = argument1.Damage;} // If bypassing shields, set ArmorDamage to Damage
 if ds_grid_get(global.PlayerData, 2+DamageDirection, HealthC) <= 0 or ds_grid_get(global.PlayerData, 2+DamageDirection, ActiveC) == 0  {HullDamage = ArmorDamage;} // If Armor is gone / inactive
 else // Armor has some life
 {if ArmorDamage * argument1.ArmorDamageRate <= ds_grid_get(global.PlayerData, 2+DamageDirection, DamageResistanceC) {exit;} // Can DamageResitance absorb ArmorDamage?  No problem.
  else {ArmorDamage -= ds_grid_get(global.PlayerData, 2+DamageDirection, DamageResistanceC/argument1.ArmorDamageRate); // Subtract DR from Damage,
   if ArmorDamage * argument1.ArmorDamageRate >= ds_grid_get(global.PlayerData, 2+DamageDirection, HealthC)  // If damage will pierce armor,
   {HullDamage = ds_grid_get(global.PlayerData, 2+DamageDirection, HealthC) - (ArmorDamage * argument1.ArmorDamageRate); // Take Armor's health from Damage,
    ds_grid_set(global.PlayerData, 2+DamageDirection, HealthC, 0);} // Armor's gone
   else {ds_grid_set(global.PlayerData, 2+DamageDirection, HealthC, ds_grid_get(global.PlayerData, 2+DamageDirection, HealthC) - (ArmorDamage * argument1.ArmorDamageRate)); // If < Armor Health, damage armor
    exit;}}}
 HullDamage -= ds_grid_get(global.PlayerData, 0, DurabilityC); // Reduce damage by ship's durability
 if HullDamage < 0 {HullDamage = 0;}
 ds_grid_set(global.PlayerData, 0, HealthC, max(0, ds_grid_get(global.PlayerData, 0, HealthC) - (argument1.HullDamageRate * HullDamage))) // Damage the Hull
 argument0.Health = ds_grid_get(global.PlayerData, 0, HealthC);} // Update Health
 
else // The player is not being attacked
{if argument1.BypassShields == false and ds_grid_get(argument0.Data, 1, ActiveC) == 1 // Damage doesn't bypass shields and the shield is active
 {if ds_grid_get(argument0.Data, 1, HealthC) > (argument1.ShieldDamageRate * argument1.Damage) // If the player's shields could absorb the damage
  {ds_grid_set(argument0.Data, 1, HealthC, ds_grid_get(argument0.Data, 1, HealthC) - (argument1.ShieldDamageRate * argument1.Damage)); // Subtract the damage from shields
   exit;}
  else // If the player's shields couldn't absorb the damage
  {ArmorDamage = (argument1.ShieldDamageRate * argument1.Damage) - ds_grid_get(argument0.Data, 1, HealthC); // Get remaining damage after shields fall
   ds_grid_set(argument0.Data, 1, HealthC, 0);}} // drop shields
 else {ArmorDamage = argument1.Damage;} // If bypassing shields, set ArmorDamage to Damage
 if ds_grid_get(argument0.Data, 2+DamageDirection, HealthC) <= 0 or ds_grid_get(argument0.Data, 2+DamageDirection, ActiveC) == 0  {HullDamage = ArmorDamage;} // If Armor is gone / inactive
 else // Armor has some life
 {if ArmorDamage * argument1.ArmorDamageRate <= ds_grid_get(argument0.Data, 2+DamageDirection, DamageResistanceC) {exit;} // Can DamageResitance absorb ArmorDamage?  No problem.
  else {ArmorDamage -= ds_grid_get(argument0.Data, 2+DamageDirection, DamageResistanceC/argument1.ArmorDamageRate); // Subtract DR from Damage,
   if ArmorDamage * argument1.ArmorDamageRate >= ds_grid_get(argument0.Data, 2+DamageDirection, HealthC)  // If damage will pierce armor,
   {HullDamage = ds_grid_get(argument0.Data, 2+DamageDirection, HealthC) - (ArmorDamage * argument1.ArmorDamageRate); // Take Armor's health from Damage,
    ds_grid_set(argument0.Data, 2+DamageDirection, HealthC, 0);} // Armor's gone
   else {ds_grid_set(argument0.Data, 2+DamageDirection, HealthC, ds_grid_get(argument0.Data, 2+DamageDirection, HealthC) - (ArmorDamage * argument1.ArmorDamageRate)); // If < Armor Health, damage armor
    exit;}}}
 HullDamage -= ds_grid_get(argument0.Data, 0, DurabilityC); // Reduce damage by ship's durability
 if HullDamage < 0 {HullDamage = 0;}
 ds_grid_set(argument0.Data, 0, HealthC, max(0, ds_grid_get(argument0.Data, 0, HealthC) - (argument1.HullDamageRate * HullDamage))) // Damage the Hull
 argument0.Health = ds_grid_get(argument0.Data, 0, HealthC);} // Update Health

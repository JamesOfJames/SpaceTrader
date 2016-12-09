// argument0: damaged id
// argument1: damage
// argument2: damagedirection
 
if argument0.object_index == objectParentPlayer or object_get_parent(argument0.object_index) == objectParentPlayer // If the player is taking damage
{if ds_grid_get(global.PlayerData, 1, ActiveC) == 1 // shield is active
 {if ds_grid_get(global.PlayerData, 1, HealthC) > argument1 // If the player's shields could absorb the damage
  {ds_grid_set(global.PlayerData, 1, HealthC, ds_grid_get(global.PlayerData, 1, HealthC) - argument1); // Subtract the damage from shields
   exit;}
  else // If the player's shields couldn't absorb the damage
  {ArmorDamage = argument1 - ds_grid_get(global.PlayerData, 1, HealthC); // Get remaining damage after shields fall
   ds_grid_set(global.PlayerData, 1, HealthC, 0);}} // drop shields
 else {ArmorDamage = argument1;} // If bypassing shields, set ArmorDamage to argument1
 if ds_grid_get(global.PlayerData, 2+argument2, HealthC) <= 0 or ds_grid_get(global.PlayerData, 2+argument2, ActiveC) == 0  {HullDamage = ArmorDamage;} // If Armor is gone / inactive
 else // Armor has some life
 {if ArmorDamage <= ds_grid_get(global.PlayerData, 2+argument2, DamageResistanceC) {exit;} // Can DamageResitance absorb ArmorDamage?  No problem.
  else {ArmorDamage -= ds_grid_get(global.PlayerData, 2+argument2, DamageResistanceC); // Subtract DR from argument1,
   if ArmorDamage >= ds_grid_get(global.PlayerData, 2+argument2, HealthC)  // If damage will pierce armor,
   {HullDamage = ds_grid_get(global.PlayerData, 2+argument2, HealthC) - ArmorDamage; // Take Armor's health from argument1,
    ds_grid_set(global.PlayerData, 2+argument2, HealthC, 0);} // Armor's gone
   else {ds_grid_set(global.PlayerData, 2+argument2, HealthC, ds_grid_get(global.PlayerData, 2+argument2, HealthC) - ArmorDamage); // If < Armor Health, damage armor
    exit;}}}
 HullDamage -= ds_grid_get(global.PlayerData, 0, DurabilityC); // Reduce damage by ship's durability
 if HullDamage < 0 {HullDamage = 0;}
 ds_grid_set(global.PlayerData, 0, HealthC, max(0, ds_grid_get(global.PlayerData, 0, HealthC) - HullDamage)) // argument1 the Hull
 argument0.Health = ds_grid_get(global.PlayerData, 0, HealthC);} // Update Health
 
else // The player is not being attacked
{if ds_grid_get(argument0.Data, 1, ActiveC) == 1 // shield is active
 {if ds_grid_get(argument0.Data, 1, HealthC) > argument1 // If the player's shields could absorb the damage
  {ds_grid_set(argument0.Data, 1, HealthC, ds_grid_get(argument0.Data, 1, HealthC) - argument1); // Subtract the damage from shields
   exit;}
  else // If the player's shields couldn't absorb the damage
  {ArmorDamage = argument1 - ds_grid_get(argument0.Data, 1, HealthC); // Get remaining damage after shields fall
   ds_grid_set(argument0.Data, 1, HealthC, 0);}} // drop shields
 else {ArmorDamage = argument1;} // If bypassing shields, set ArmorDamage to argument1
 if ds_grid_get(argument0.Data, 2+argument2, HealthC) <= 0 or ds_grid_get(argument0.Data, 2+argument2, ActiveC) == 0  {HullDamage = ArmorDamage;} // If Armor is gone / inactive
 else // Armor has some life
 {if ArmorDamage <= ds_grid_get(argument0.Data, 2+argument2, DamageResistanceC) {exit;} // Can DamageResitance absorb ArmorDamage?  No problem.
  else {ArmorDamage -= ds_grid_get(argument0.Data, 2+argument2, DamageResistanceC); // Subtract DR from argument1,
   if ArmorDamage >= ds_grid_get(argument0.Data, 2+argument2, HealthC)  // If damage will pierce armor,
   {HullDamage = ds_grid_get(argument0.Data, 2+argument2, HealthC) - ArmorDamage; // Take Armor's health from argument1,
    ds_grid_set(argument0.Data, 2+argument2, HealthC, 0);} // Armor's gone
   else {ds_grid_set(argument0.Data, 2+argument2, HealthC, ds_grid_get(argument0.Data, 2+argument2, HealthC) - ArmorDamage); // If < Armor Health, damage armor
    exit;}}}
 HullDamage -= ds_grid_get(argument0.Data, 0, DurabilityC); // Reduce damage by ship's durability
 if HullDamage < 0 {HullDamage = 0;}
 ds_grid_set(argument0.Data, 0, HealthC, max(0, ds_grid_get(argument0.Data, 0, HealthC) - HullDamage)) // argument1 the Hull
 argument0.Health = ds_grid_get(argument0.Data, 0, HealthC);} // Update Health

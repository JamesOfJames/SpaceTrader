// argument0: damaged id
// argument1: damager id

/* Collision thinks = 6d * 3 [lesser HP] * [relative speed]
var i, j;
j = 0;
for (i = 1; i <= 6 ; i += 1) {j += irandom_range(1,6);}
argument0.hspeed-argument1.hspeed
argument0.vspeed-argument1.vspeed

point_direction(argument0.hspeed, argument0.vspeed, argument1.hspeed, argument1.vspeed);?
point_distance(argument0.hspeed, argument0.vspeed, argument1.hspeed, argument1.vspeed);?
*/

var DamageDirectionA, DamageDirectionB, MassA, MassB;

// 1 - Determine DamageDirection for each.
DamageDirectionA = floor((point_direction(argument0.x,argument0.y,argument1.x,argument1.y)-argument0.Facing+45)/90); // Which of the 4 quadrants did the damage come from?
if DamageDirectionA < 0 {DamageDirectionA += 4;} // If negative, add 360 degrees=4 quadrants.
DamageDirectionB = floor((point_direction(argument1.x,argument1.y,argument0.x,argument0.y)-argument1.Facing+45)/90); // Which of the 4 quadrants did the damage come from?
if DamageDirectionB < 0 {DamageDirectionB += 4;} // If negative, add 360 degrees=4 quadrants.

// 2 - Determine Lower Mass
if argument0.object_index == objectParentPlayer or object_get_parent(argument0.object_index) == objectParentPlayer // If the player is being attacked
{MassA = script_execute(scriptStat, global.PlayerData, MassC)}
else {MassA = script_execute(scriptStat, argument0.Data, MassC)}
if argument1.object_index == objectParentPlayer or object_get_parent(argument1.object_index) == objectParentPlayer // If the player is being attacked
{MassB = script_execute(scriptStat, global.PlayerData, MassC)}
else {MassB = script_execute(scriptStat, argument1.Data, MassC)}
if MassA > MassB {Damage = script_execute(scriptDamageRoll, (MassB/5000));}
else {Damage = script_execute(scriptDamageRoll, (MassA/5000));}
show_debug_message("damage - "+string(Damage));
 
script_execute(scriptDamageCollision, argument0, Damage, DamageDirectionA);
script_execute(scriptDamageCollision, argument1, Damage, DamageDirectionB);

// 3 - Bounce dat bounce dat
//lengthdir_x(MassA*argument0.speed, argument0.direction)

argument0.speed = 0;
argument1.speed = 0;

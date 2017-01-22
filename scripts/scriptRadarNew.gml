// argument0 = self -> derive x, y.
// argument1 = player -> derive x, y.
// derive view window stuff.
// check object_index against various types to assign blip, whether it should be directional, etc.

// If object is in view window, exit.
if median(x, view_xview[0], view_xview[0] + view_wview[0]) == x
{if median(y, view_yview[0], view_yview[0] + view_hview[0]) == y
 {exit;}}

// Out of view, draw blip.
edgeBorder = 12;

centerX = view_xview[0] + (view_wview[0] / 2);
centerY = view_yview[0] + (view_hview[0] / 2);
topRight = point_direction(centerX, centerY, (view_xview[0] + view_wview[0]), view_yview[0]);
topLeft = point_direction(centerX, centerY, view_xview[0], view_yview[0]);
bottomLeft = point_direction(centerX, centerY, view_xview[0], (view_yview[0] + view_hview[0]));
bottomRight = point_direction(centerX, centerY, (view_xview[0] + view_wview[0]), (view_yview[0] + view_hview[0]));

// Which Blip
switch (object_index)
{case objectPlanet:
  directional = false;
  icon = 2; // circle, planet
  color = c_blue;
  break;
 case objectAIShip:
  directional = true;
  icon = 6; // triangle, ship
  color = c_red;
  break;
 default:
  directional = false;
  icon = 0; // star
  color = c_white;
  break;}
 
player = instance_find(objectPlayerShip, 0);
playerX = player.x;
playerY = player.y;
  
signalDirection = point_direction(centerX, centerY, x, y); // Get direction
slope = (playerY - y) / (playerX - x);
yIntercept = y - (slope * x);

// Find Blip Position
if median(topRight, signalDirection, topLeft) == signalDirection // If the direction is towards the top of the screen
{blipY = view_yview[0] + edgeBorder;
 blipX = (blipY - yIntercept) / slope;}
else
{if median(other.bottomRight, signalDirection, other.bottomLeft) == signalDirection // If the direction is towards the bottom of the screen
 {blipY = view_yview[0] + view_hview[0] - edgeBorder;
  blipX = (blipY - yIntercept) / slope;}
 else
 {if median(other.bottomLeft, signalDirection, other.topLeft) == signalDirection // If the direction is towards the left of the screen
  {blipX = view_xview[0] + edgeBorder;
   blipY = (slope * blipX) + yIntercept;}
  else
  {if min(other.topRight, signalDirection) == signalDirection or max(other.bottomRight, signalDirection) == signalDirection // If the direction is towards the right of the screen
   {blipX = view_xview[0] + view_wview[0] - edgeBorder;
    blipY = (slope * blipX) + yIntercept;}}}}

// Draw Radar Blip
draw_set_blend_mode(bm_max);
if directional {draw_sprite_ext(spriteRadar, icon, blipX - view_xview[0], blipY - view_yview[0], 1, 1, IsoDirection, color, 0.75);}
else {draw_sprite_ext(spriteRadar, icon, blipX - view_xview[0], blipY - view_yview[0], 1, 1, 0, color, 0.75);}
draw_set_blend_mode(bm_normal);

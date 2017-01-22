// argument0 & argument1: x & y of self
// argument2 & argument3: x & y of ranged target
// argument4: 0 - Left/Right, 1 - Top/Bottom
// argument5: BlipX or BlipY
// returns X or Y of intersection with room boundary

var Slope, YIntercept, selfX, selfY, targetX, targetY, whichDirection, whichBlip;

selfX = argument0;
selfY = argument1;
targetX = argument2;
targetY = argument3;
whichDirection = argument4;
whichBlip = argument5;

Slope = (targetY - selfY)/(targetX - selfX);
YIntercept = selfY - (Slope * selfX);

if whichDirection == 0 // To the Left or Right
{return ((Slope * whichBlip) + YIntercept);}
else // To the Top or Bottom
{return ((whichBlip - YIntercept)/Slope);}

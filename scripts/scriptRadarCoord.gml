//argument0 & argument1: x & y of self
//argument2 & argument3: x & y of ranged target
//argument4: 0 - Left/Right, 1 - Top/Bottom
//argument5: BlipX or BlipY
// returns X or Y of intersection with room boundary

var Slope, YIntercept;

Slope = (argument3 - argument1)/(argument2 - argument0);
YIntercept = argument1 - (Slope * argument0);

if argument4 == 0 // To the Left or Right
{return ((Slope * argument5) + YIntercept);}
else // To the Top or Bottom
{return ((argument5 - YIntercept)/Slope);}

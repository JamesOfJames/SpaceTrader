// argument0 = number of d6 to roll
// returns sum

var a, b, c;
b = argument0;
c = 0;
for (a = 0; a < b; a++)
{c += irandom_range(1, 6);}
return c;

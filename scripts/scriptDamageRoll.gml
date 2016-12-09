// argument0 = # of Dice to roll
var i, j;
j = 0;
for (i = 1; i <= argument0 ; i += 1) {j += irandom_range(10, 60);}
return j;

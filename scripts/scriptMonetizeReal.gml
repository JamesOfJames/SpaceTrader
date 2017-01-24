// Accepts real number, returns it broken by commas with an $ on front.  Truncates over 10k

var shouldRoundCents = true;
var shouldCompress = false;
var roundCents = 100; // greater or equal to this, round off decimals
var roundHundreds = 10000; // greater or equal to this, round off hundreds
var roundThousands = 1000000; // greater or equal to this, round off thousands
var roundMillions = 1000000000; // greater or equal to this, round off millions
var roundBillions = 1000000000000; // greater or equal to this, round off billions
var moneySign = "¤"; // please include spacing if desired
var signFirst = true; // false will place this at the end
var divider = ","; // between each grouping
var divideEvery = 3; // how many places to skip

var a = argument0;
var b, c, magnitude;

// Round as needed
if shouldRoundCents {if a > 100 {b = round(a); magnitude = "";}}

// Compress as needed (e.g. 12,456,000 -> 12.4M)
if shouldCompress {
if a > 10000 {b = round(a / 100); magnitude = "k";}
if a > 1000000 {b = round(a / 100000); magnitude = "M";}
if a > 1000000000 {b = round(a / 100000000); magnitude = "B";}
if a > 1000000000000 {b = round(a / 100000000000); magnitude = "T";}
if a > 10000
{b = string(b);
 b = string_copy(b, 1, string_length(b) - 1) + "." + string_char_at(b, string_length(b)) + magnitude;}}

b = string(b);
 
// Insert dividers
var d = string_pos(".", b);
if d == 0 {d = string_length(b);}

for (c = d - divideEvery; c >= 1; c -= divideEvery)
{b = string_copy(b, 1, c) + divider + string_copy(b, c + 1, string_length(b));}
   
if !signFirst {b += moneySign;} else {b = moneySign + b;}

show_debug_message(string(a) + " -> " + b);
return b;

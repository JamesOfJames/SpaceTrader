// Hostile, Barren, or Garden?
var a, b, c;
a = script_execute(scriptDiceRoll, 3);
b = script_execute(scriptDiceRoll, 3);
if a <= 7
{// Hostile
 if b <= 5
 {plSize = 1; // Tiny
  plType = Sulfur;}
 else
 {if b >= 13
  {plSize = 4; // Large
   c = script_execute(scriptDiceRoll, 1);}
  else
  {plSize = 3; // Standard
   c = irandom_range(1, 7);}
 if c >= 5 {plType = Ammonia;}
 else
 {if c <= 2 {plType = Greenhouse;}
  else {plType = Chthonian}}}}
else
{if a <= 13
 {// Barren
  c = irandom(4);
  if b <= 4
  {plSize = 0; // Asteroid Belt
   plType = Asteroid;}
  else
  {if b >= 17
   {plSize = 4; // Large
    if c <= 1 {plType = Ice;}
    else {plType = Ocean;}}
   else
   {if b <= 8
    {plSize = 1; // Tiny
     if c <= 1 {plType = Ice;}
     else {plType = Rock;}}
    else
    {if b <= 12
     {plSize = 2; // Small
      switch c
      {case 0:
        plType = Hadean;
        break;
       case 1:
        plType = Ice;
        break;
       default:
        plType = Rock;
        break;}}
     else
     {plSize = 3; // Standard
      switch c
      {case 0:
        plType = Hadean;
        break;
       case 1:
        plType = Ice;
        break;
       default:
        plType = Ocean;
        break;}}}}}}
 else
 {// Garden
  plType = Garden;
  plSize = 3; // Standard
  if b >= 17 {plSize = 4;}}} // Large

// Resources
var d;

d = script_execute(scriptDiceRoll, 3);
if plType == Asteroid
{switch d
 {case 3:
   plRes = -5;
   break;
  case 4:
   plRes = -4;
   break;
  case 5:
   plRes = -3;
   break;
  case 6:
  case 7:
   plRes = -2;
   break;
  case 8:  
  case 9:
   plRes = -1;
   break;
  case 10:
  case 11:
   plRes = 0;
   break;
  case 12:
  case 13:
   plRes = 1;
   break;
  case 14:  
  case 15:
   plRes = 2;
   break;
  case 16:
   plRes = 3;
   break;
  case 17:
   plRes = 4;
   break;
  case 18:
   plRes = 5;
   break;}}
else
{switch d
 {case 3:
  case 4:
   plRes = -2;
   break;
  case 5:
  case 6:
  case 7:
   plRes = -1;
   break;
  case 8:
  case 9:
  case 10:
  case 11:
  case 12:
  case 13:
   plRes = 0;
   break;
  case 14:
  case 15:
  case 16:
   plRes = 1;
   break;
  case 17:
  case 18:
   plRes = 2;
   break;}}

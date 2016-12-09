
/*commList = ds_grid_create(18, ds_queue_size(commRawData));
script_execute(scriptCommSetup);

ds_queue_enqueue(commRawData, "Survival Equipment/Life-Support Equipment, 40000, 3, 5% Ex, 1, In, -1, Na, 2, As, 2$");*/


var a, b, c, d, e, z, commInfo, priceMods, conditions, commaPos;

for (z = 0; !ds_queue_empty(commRawData); z++)
{a = ds_queue_dequeue(commRawData);
 b = string_pos("%", a) - 1 // breakpoint between commInfo and priceMods
 c = string_pos("$", a) - 1 // breakpoint between pricemods and conditions
 commInfo = string_copy(a, 1, b);
 priceMods = "";
 conditions = "";
 d = 2;
 e = 2;
 
 // Cut the strings apart in the right spots
 if c != -1
 {if string_pos("$ ", a) != 0 {e++;} // Adjust upwards if there's a trailing space
  conditions = string_copy(a, c + e, string_length(a));}
 else 
 {show_debug_message("error: you malformed some data; there's no $ before the conditions.");
  c = string_length(a);}
 if b != -1
 {if string_pos("% ", a) != 0 {d++;} // Adjust upwards if there's a trailing space
  priceMods = string_copy(a, b + d, c - (b + d - 1));}
 else {show_debug_message("error: you malformed some data; there's no % before the pricemods.");}

 // Start with priceMods in columns 0-9, since that's what their labels are mapped to.
 while (string_length(priceMods) > 0)
 {b = string_pos(", ", priceMods);
  if b > 0
  {c = string_copy(priceMods, 1, b - 1);
  
   // Which column to use (kludge, but I can't seem to turn a macro into a real value at run-time.)
   switch (c)
   {case "Ag":
      d = Ag;
      break;
    case "As":
      d = As;
      break;
    case "Ex":
      d = Ex;
      break;
    case "In":
      d = In;
      break;
    case "Mi":
      d = Mi;
      break;
    case "Na":
      d = Na;
      break;
    case "Ni":
      d = Ni;
      break;
    case "Pe":
      d = Pe;
      break;
    case "Po":
      d = Po;
      break;
    case "Ri":
      d = Ri;
      break;
    default:
      break;}
   
   // Grab the value that should be in that column, put it there.
   priceMods = string_delete(priceMods, 1, b + 1);
   b = string_pos(", ", priceMods);
   if b == 0 {b = string_length(priceMods) + 1;}
   ds_grid_set(commList, d, z, real(string_copy(priceMods, 1, b - 1)));
   priceMods = string_delete(priceMods, 1, b + 1);}}
   
   // Handle Basic Commodity Info
   b = string_pos(", ", commInfo);
   c = 10
   ds_grid_set(commList, c, z, string_copy(commInfo, 1, b - 1));
   commInfo = string_delete(commInfo, 1, b + 1);
   
   for (c = 11; string_length(commInfo) > 0; c++)
   {b = string_pos(", ", commInfo);
    if b == 0 {b = string_length(commInfo) + 1;}
    ds_grid_set(commList, c, z, real(string_copy(commInfo, 1, b - 1)));
    commInfo = string_delete(commInfo, 1, b + 1);}
    
   // Write any conditions to columns 14ff
   for (c = 14; string_length(conditions) > 0; c++)
   {b = string_pos(", ", conditions);
    if b == 0 {b = string_length(conditions) + 1;}
    ds_grid_set(commList, c, z, real(string_copy(conditions, 1, b - 1)));
    conditions = string_delete(conditions, 1, b + 1);}}

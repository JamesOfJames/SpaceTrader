commList = ds_grid_create(5, 36);


ds_queue_enqueue(commRawData, "#Heavy Metals#, 800000, 4, 10, Ex, -3, ---, #biohazard#, 5");


var a, b;

if !ds_queue_empty(commRawData)
{a = ds_queue_dequeue(commRawData);

}




var a; 
a = 0;

ds_grid_set(commList, 0, a, 11); // Dice Roll
ds_grid_set(commList, 1, a, "Heavy Metals"); // Name(s)
ds_grid_set(commList, 2, a, 800000); // Price per Ton
ds_grid_set(commList, 3, a, 4); // Dice to roll for lot size
ds_grid_set(commList, 4, a, 10); // Multiplier for lot size
a++;

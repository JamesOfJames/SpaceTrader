galPlanetsCol = 9; // this is the first column that isn't set manually.  Adust if more data is added in before resources, etc.

var a, b, c, d, e, f;

e = irandom(3) + irandom(3) + 2; // number of planets in the system

f = ds_grid_height(galPlanets);
ds_grid_resize(galPlanets, ds_grid_width(galPlanets), f + e); // make room for the new planets
ds_grid_set_region(galPlanets, 0, f - 1, ds_grid_width(galPlanets) - 1, f + e - 1, -1); // clear the new rows

for (a = f; a < f + e; a++)
{ds_grid_set(galPlanets, 0, a, currentSys); // column 0 = which room / system?

 ds_grid_set(galPlanets, 1, a, a - f + 1); // column 1 = which planet in that system?
 ds_grid_set(galPlanets, 2, a, string(currentSys) + " " + string(a - f + 1)); // column 2 = planet name
 script_execute(scriptNewPlanet);
 ds_grid_set(galPlanets, 3, a, plSize);
 ds_grid_set(galPlanets, 4, a, plType);
 if a == f {ds_grid_set(galPlanets, 5, a, firstOrbit);}
 else {ds_grid_set(galPlanets, 5, a, ds_grid_get(galPlanets, 5, a - 1) * orbitRatio);}
 ds_grid_set(galPlanets, 6, a, random(360)); // initial orbit angle
 ds_grid_set(galPlanets, 7, a, script_execute(scriptDiceRoll, 2) - 2); // roll 2 dice, what's the population size? 0 - 10
 // The above should be modified for the planet type; don't worry about this for now.  Adjust population up for 
 ds_grid_set(galPlanets, 8, a, (script_execute(scriptDiceRoll, 3) <= 6)); // roll 3 dice, is the planet a criminal haven?
 script_execute(scriptPlanetResources, a); // Handle modifiers based on planet type, runs 9 - 18
 for (b = 0; b < plRes + plCommodities; b++) // resources the planet produces - could be 0, could be 10
 {// Pick a resource, make sure it's not already on the list, check if it makes any sense, add it to the things the world produces.
  do
  {c = irandom(5);
   // First Die: -1 if the world is Non-Industrial; 1 if Industrial.
   if ds_grid_get(galPlanets, galPlanetsCol + Ni, a) {c--;}
   if ds_grid_get(galPlanets, galPlanetsCol + In, a) {c++;}
   c = median(0, c, 5);
   c *= 6;

   d = irandom(5);
   // Second Die: -1 if the world is Non-Agricultural; 1 if Agricultural.
   if ds_grid_get(galPlanets, galPlanetsCol + Na, a) {d--;}
   if ds_grid_get(galPlanets, galPlanetsCol + Ag, a) {d++;}
   d = median(0, b, 5);

   newRes = c + d;} // this row on the commodity list is the new resource
   until !ds_grid_value_exists(galPlanets, galPlanetsCol + 10, a, ds_grid_width(galPlanets) - 1, a, newRes) // the planet isn't already selling this
   ds_grid_set(galPlanets, galPlanetsCol + 10 + b, a, newRes);}}

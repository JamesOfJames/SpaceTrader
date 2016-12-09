// argument0 = what row are we on?

var modAg, modAs, modEx, modIn, modMi, modNa, modNi, modPe, modPo, modRi;
modAg = 0;
modNa = 0;
modIn = 0;
modNi = 0;
modMi = 0;
modPe = 0;
modPo = 0;
modRi = 0;
modEx = 0;
modAs = 0;

switch plType
{case Ammonia:
  modAg = -3;
  modNa = 3;
  modIn = 2;
  modNi = -1;
  modMi = 0;
  modPe = 0;
  modPo = 2;
  modRi = -3;
  modEx = 5;
  modAs = -8;
  break;
 case Asteroid:
  modAg = -2;
  modNa = 3;
  modIn = 4;
  modNi = -2;
  modMi = 2;
  modPe = -1;
  modPo = 3;
  modRi = -2;
  modEx = 4;
  modAs = 8;
  break;
 case Chthonian:
  modAg = -4;
  modNa = 5;
  modIn = 3;
  modNi = -2;
  modMi = 0;
  modPe = 0;
  modPo = 2;
  modRi = -3;
  modEx = 6;
  modAs = 5;
  break;
 case Garden:
  modAg = +5;
  modNa = -5;
  modIn = +4;
  modNi = -4;
  modMi = +4;
  modPe = +2;
  modPo = -4;
  modRi = +4;
  modEx = -5;
  modAs = -8;
  break;
 case Greenhouse:
  modAg = -3;
  modNa = 2;
  modIn = 3;
  modNi = -2;
  modMi = 0;
  modPe = 0;
  modPo = 2;
  modRi = -2;
  modEx = 6;
  modAs = -6;
  break;
 case Hadean:
  modAg = 2;
  modNa = -1;
  modIn = 4;
  modNi = -2;
  modMi = 1;
  modPe = 0;
  modPo = 0;
  modRi = 1;
  modEx = 5;
  modAs = -8;
  break;
 case Ice:
  modAg = 3;
  modNa = -2;
  modIn = 5;
  modNi = -3;
  modMi = 2;
  modPe = -1;
  modPo = -1;
  modRi = 2;
  modEx = 4;
  modAs = -6;
  break;
 case Ocean:
  modAg = 5;
  modNa = -4;
  modIn = 5;
  modNi = -4;
  modMi = 3;
  modPe = 1;
  modPo = -3;
  modRi = 4;
  modEx = -2;
  modAs = -8;
  break;
 case Rock:
  modAg = -3;
  modNa = 4;
  modIn = 2;
  modNi = -1;
  modMi = 0;
  modPe = 1;
  modPo = 2;
  modRi = -1;
  modEx = 2;
  modAs = 4;
  break;
 case Sulfur:
  modAg = -4;
  modNa = 4;
  modIn = -2;
  modNi = 3;
  modMi = -2;
  modPe = -3;
  modPo = 4;
  modRi = -2;
  modEx = 5;
  modAs = -6;
  break;}

var a;
a = argument0;

ds_grid_set(galPlanets, galPlanetsCol + Ag, a, script_execute(scriptDiceRoll, 3) + modAg > 10);
ds_grid_set(galPlanets, galPlanetsCol + As, a, script_execute(scriptDiceRoll, 3) + modAs > 10);
ds_grid_set(galPlanets, galPlanetsCol + Ex, a, script_execute(scriptDiceRoll, 3) + modEx > 10);
ds_grid_set(galPlanets, galPlanetsCol + In, a, script_execute(scriptDiceRoll, 3) + modIn > 10);
ds_grid_set(galPlanets, galPlanetsCol + Mi, a, script_execute(scriptDiceRoll, 3) + modMi > 10);
ds_grid_set(galPlanets, galPlanetsCol + Na, a, script_execute(scriptDiceRoll, 3) + modNa > 10);
ds_grid_set(galPlanets, galPlanetsCol + Ni, a, script_execute(scriptDiceRoll, 3) + modNi > 10);
ds_grid_set(galPlanets, galPlanetsCol + Pe, a, script_execute(scriptDiceRoll, 3) + modPe > 10);
ds_grid_set(galPlanets, galPlanetsCol + Po, a, script_execute(scriptDiceRoll, 3) + modPo > 10);
ds_grid_set(galPlanets, galPlanetsCol + Ri, a, script_execute(scriptDiceRoll, 3) + modRi > 10);

// *.ini files to be placed at C:\Users\[[USERNAME]]\AppData\Local\Skyline\*.ini
// argument0 = Primary, Secondary, or Auxiliary
// argument1 = Position in player.ini to look for

ini_open("player.ini");
LoadEquip = ini_read_string(argument0, string(argument1), 'None');
ini_close();

script_execute(scriptInstallEquip, LoadEquip, argument1, global.PlayerData);

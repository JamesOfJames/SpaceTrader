// returns Name

var nameLength, a, vowel, name, vowels, cons;
nameLength = irandom(1) + irandom(2) + irandom(2) + 3;
vowel = irandom(1);
name = "";
vowels = "aeiouy";
cons = "bcdfghjklmnpqrstvwxyz";

for (a = 0; a < nameLength; a++)
{if vowel {name += string_char_at(vowels, irandom(string_length(vowels)));}
 else {name += string_char_at(cons, irandom(string_length(cons)));}
 if a == 0 {name = string_upper(name);}
 vowel = !vowel;}

return name;

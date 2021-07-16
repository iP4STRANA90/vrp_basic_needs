FIVEM SALES & TRADING
DISCORD | P4STRANA90#9274
http://discord.gg/shu3nBr9GJ
-------------------------------------------------
NOPIXEL V2 STATUS HUD
_________________________________________________

IMPORTANT: This is an adaptation of an ESX code to vRP2 I hope it will be very useful and continue to feed the development of fw.

NOTE: Some people have reported the Oxygen bar overflowing the box.
This seems apparently different for each person.

If you have this issue I recommended editing the following code, you may need to play with it a bit to find what suits you.

client.lua > line 81
local oxy = GetPlayerUnderwaterTimeRemaining(PlayerId()) * 4

Thank you :)

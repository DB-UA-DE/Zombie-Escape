rawset(_G,"RV_ZESCAPE",{})
local ZE = RV_ZESCAPE

ZE.Console = {}

G_AddGametype({
	name = "Zombie Escape",
	identifier = "zescape",
	typeoflevel = TOL_ZESCAPE,
	rules = GTR_RINGSLINGER|GTR_TEAMS|GTR_HURTMESSAGES|GTR_TIMELIMIT|GTR_ALLOWEXIT|GTR_RESPAWNDELAY|GTR_SPAWNENEMIES|GTR_CUTSCENES,
	intermissiontype = int_teammatch,
	headerleftcolor = 152,
	headerrightcolor = 40,
	description = "Escape from the Zombies! Don't get caught and eaten by them! They can catch up with you anytime..."
})

--kays#5325
ZE.GOTONHelper = function(t)
	return _G[t]
end

ZE.GetObjectTypeOrNull = function(t)
	local status, value = pcall(ZE.GOTONHelper, t)
	return status and value or MT_NULL 
end
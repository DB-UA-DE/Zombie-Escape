local ZE = RV_ZESCAPE
local CV = ZE.Console

/*
ZE.AddStat = function(
	skin,normalspeed, runspeed, jumpfactor,
	charability, charability2,
	startHealth, maxHealth,
)
	local newtable = {ZE.CharacterStats["defaultconfig"]}
	newtable 
	table.insert(ZE.CharacterStats,newtable)

end
*/



ZE.CharacterStats = {
	["defaultconfig"] = {
		normalspeed = 22 * FRACUNIT,
		runspeed = 100 * FRACUNIT,
		jumpfactor = 17 * FRACUNIT / 19,
		charability = CA_NONE,
		charability2 = CA2_NONE,
		startHealth = 100,
		maxHealth = 100,
		staminacost = 15,
		staminarun = 16*FRACUNIT,
		staminanormal = 27*FRACUNIT,
    },
	["sonic"] = {
		normalspeed = 20 * FRACUNIT,
		runspeed = 100 * FRACUNIT,
		jumpfactor = 17 * FRACUNIT / 19,
		charability = CA_JUMPTHOK,
		charability2 = CA2_NONE,
		actionspd = 12 * FRACUNIT,
		startHealth = 115,
		maxHealth = 130,
		staminacost = 17,
		staminarun = 16*FRACUNIT,
		staminanormal = 28*FRACUNIT,
	},
	["tails"] = {
		normalspeed = 21 * FRACUNIT,
		runspeed = 100 * FRACUNIT,
		jumpfactor = 17 * FRACUNIT / 19,
		charability = CA_NONE,
		charability2 = CA2_NONE,
		startHealth = 95,
		maxHealth = 125,
		staminacost = 12,
		staminarun = 16*FRACUNIT,
		staminanormal = 23*FRACUNIT,
    },
    ["knuckles"] = {
        normalspeed = 17 * FRACUNIT,
        runspeed = 100 * FRACUNIT,
        jumpfactor = 17 * FRACUNIT / 19,
        charability = CA_NONE,
        charability2 = CA2_NONE,
		startHealth = 150,
		maxHealth = 175,
		staminacost = 16,
		staminarun = 16*FRACUNIT,
		staminanormal = 22*FRACUNIT,
    },
    ["amy"] = {
        normalspeed = 22 * FRACUNIT,
        runspeed = 100 * FRACUNIT,
        jumpfactor = 17 * FRACUNIT / 19,
        charability = CA_NONE,
        charability2 = CA2_MELEE,
		startHealth = 100,
		maxHealth = 150,
		staminacost = 12,
		staminarun = 16*FRACUNIT,
		staminanormal = 25*FRACUNIT,
    },
	["fang"] = {
        normalspeed = 22 * FRACUNIT,
        runspeed = 100 * FRACUNIT,
        jumpfactor = 17 * FRACUNIT / 19,
        charability = CA_NONE,
        charability2 = CA_NONE,
		startHealth = 110,
		maxHealth = 140,
		staminacost = 11,
		staminarun = 16*FRACUNIT,
		staminanormal = 26*FRACUNIT,
    },
    ["metalsonic"] = {
        normalspeed = 22 * FRACUNIT,
        runspeed = 100 * FRACUNIT,
        jumpfactor = 17 * FRACUNIT / 19,
        charability = CA_NONE,
        charability2 = CA2_NONE,
		startHealth = 125,
		maxHealth = 145,
		staminacost = 13,
		staminarun = 5*FRACUNIT,
		staminanormal = 27*FRACUNIT,
    },
	["dzombie"] = {
	    normalspeed = 25*FRACUNIT,
		runspeed = 100*FRACUNIT,
		jumpfactor = 1*FRACUNIT,
		charability = CA_NONE,
		charability2 = CA2_NONE,
		startHealth = 900,
		maxHealth = 900,
		staminacost = 0,
		staminarun = 16*FRACUNIT,
		staminanormal = 25*FRACUNIT,
	},
	["milne"] = {
		normalspeed = 22 * FRACUNIT,
		runspeed = 100 * FRACUNIT,
		jumpfactor = 12 * FRACUNIT/10,
		charability = CA_NONE,
		charability2 = CA2_NONE,
		charflags = SF_NOJUMPSPIN|SF_NOSKID,
		startHealth = 75,
		maxHealth = 100,
		staminacost = 10,
		staminarun = 16*FRACUNIT,
		staminanormal = 25*FRACUNIT,
	},
	["bob"] = {
		normalspeed = 22 * FRACUNIT,
		runspeed = 100 * FRACUNIT,
		jumpfactor = 17 * FRACUNIT / 19,
		charability = CA_NONE,
		charability2 = CA2_GUNSLINGER,
		startHealth = 115,
		maxHealth = 115,
		staminacost = 11,
		staminarun = 16*FRACUNIT,
		staminanormal = 27*FRACUNIT,
	},
	["revenger"] = {
		normalspeed = 22*FRACUNIT,
		runspeed = 14 * FRACUNIT,
		jumpfactor = 17 * FRACUNIT / 19,
		charability = CA_NONE,
		charability2 = CA2_NONE,
		startHealth = 130,
		maxHealth = 130,
		staminacost = 8,
		staminarun = 16*FRACUNIT,
		staminanormal = 28*FRACUNIT,
	},
	["scarf"] = {
		normalspeed = 22 * FRACUNIT,
		runspeed = 100 * FRACUNIT,
		jumpfactor = 17 * FRACUNIT / 19,
		charability = CA_NONE,
		charability2 = CA2_NONE,
		startHealth = 125,
		maxHealth = 125,
		staminacost = 12,
		staminarun = 16*FRACUNIT,
		staminanormal = 25*FRACUNIT,
	},
	["w"] = {
		normalspeed = 22 * FRACUNIT,
		runspeed = 100 * FRACUNIT,
		jumpfactor = 17 * FRACUNIT / 19,
		charability = CA_AIRDRILL,
		charability2 = CA2_NONE,
		startHealth = 120,
		maxHealth = 120,
		staminacost = 9,
		staminarun = 16*FRACUNIT,
		staminanormal = 25*FRACUNIT,
	},
	["serpentine"] = {
		normalspeed = 22 * FRACUNIT,
		runspeed = 100 * FRACUNIT,
		jumpfactor = 17 * FRACUNIT/19,
		charability = CA_NONE,
		charability2 = CA2_NONE,
		startHealth = 120,
		maxHealth = 120,
		staminacost = 12,
		staminarun = 16*FRACUNIT,
		staminanormal = 25*FRACUNIT,
	},
	["steve"] = {
		normalspeed = 22 * FRACUNIT,
		runspeed = 100 * FRACUNIT,
		jumpfactor = 17 * FRACUNIT / 19,
		charability = CA_NONE,
		charability2 = CA2_NONE,
		startHealth = 200,
		maxHealth = 400,
		staminacost = 5,
		staminarun = 16*FRACUNIT,
		staminanormal = 24*FRACUNIT,
	},
	["oof"] = {
		normalspeed = 22 * FRACUNIT,
		runspeed = 100 * FRACUNIT,
		jumpfactor = 17 * FRACUNIT/19,
		charability = CA_NONE,
		charability2 = CA2_NONE,
		startHealth = 120,
		maxHealth = 120,
		staminacost = 12,
		staminarun = 16*FRACUNIT,
		staminanormal = 23*FRACUNIT,
	},
	["peppino"] = {
		normalspeed = 22 * FRACUNIT,
		runspeed = 100 * FRACUNIT,
		jumpfactor = 17 * FRACUNIT/19,
		charability = CA_SWIM,
		charability2 = CA2_GUNSLINGER,
		startHealth = 110,
		maxHealth = 145,
		staminacost = 10,
		staminarun = 16*FRACUNIT,
		staminanormal = 25*FRACUNIT,
	},
	["noise"] = {
		normalspeed = 22 * FRACUNIT,
		runspeed = 100 * FRACUNIT,
		jumpfactor = 17 * FRACUNIT/19,
		charability = CA_BOUNCE,
		charability2 = CA2_NONE,
		startHealth = 135,
		maxHealth = 135,
		staminacost = 9,
		staminarun = 16*FRACUNIT,
		staminanormal = 26*FRACUNIT,
	},
	["snick"] = {
		normalspeed = 22 * FRACUNIT,
		runspeed = 100 * FRACUNIT,
		jumpfactor = 17 * FRACUNIT/19,
		charability = CA_JUMPTHOK,
		charability2 = CA2_NONE,
		actionspd = 1 * FRACUNIT,
		startHealth = 70,
		maxHealth = 125,
		staminacost = 7,
		staminarun = 16*FRACUNIT,
		staminanormal = 25*FRACUNIT,
	},
	["fakepep"] = {
		normalspeed = 22 * FRACUNIT,
		runspeed = 100 * FRACUNIT,
		jumpfactor = 17 * FRACUNIT/19,
		charability = CA_DOUBLEJUMP,
		charability2 = CA2_NONE,
		startHealth = 130,
		maxHealth = 150,
		staminacost = 12,
		staminarun = 16*FRACUNIT,
		staminanormal = 24*FRACUNIT,
	},
	["motobugze"] = {
		normalspeed = 7 * FRACUNIT,
		runspeed = 100 * FRACUNIT,
		jumpfactor = 17 * FRACUNIT/19,
		charability = CA_DOUBLEJUMP,
		charability2 = CA2_NONE,
		startHealth = 1,
		maxHealth = 1,
		staminacost = 7,
		staminarun = 16*FRACUNIT,
		staminanormal = 23*FRACUNIT,
	},
	["chaoze"] = {
		normalspeed = 10 * FRACUNIT,
		runspeed = 100 * FRACUNIT,
		jumpfactor = 17 * FRACUNIT/19,
		charability = CA_DOUBLEJUMP,
		charability2 = CA2_NONE,
		startHealth = 15,
		maxHealth = 50,
		staminacost = 12,
		staminarun = 16*FRACUNIT,
		staminanormal = 23*FRACUNIT,
	},
}
local ZE = RV_ZESCAPE
local CV = ZE.Console

freeslot(
"MT_RS_HS_SHOT",
"MT_RS_FIST"
)






local default = "defaultconfig"

ZE.CharacterConfig = function(player)
	if (player.mo and player.mo.valid)
		local skinname = skins[player.mo.skin].name
		local default = "defaultconfig"

		if ZE.CharacterStats[skinname] then
			player.normalspeed = ZE.CharacterStats[skinname].normalspeed
			player.runspeed = ZE.CharacterStats[skinname].runspeed
			player.jumpfactor = ZE.CharacterStats[skinname].jumpfactor
			player.charability = ZE.CharacterStats[skinname].charability
			player.charability2 = ZE.CharacterStats[skinname].charability2
			player.staminacost = ZE.CharacterStats[skinname].staminacost
			player.staminarun = ZE.CharacterStats[skinname].staminarun
			player.staminanormal = ZE.CharacterStats[skinname].staminanormal
			
			if ZE.CharacterStats[skinname].actionspd then
				player.actionspd = ZE.CharacterStats[skinname].actionspd
			end
		else 
			player.normalspeed = ZE.CharacterStats[default].normalspeed 
			player.runspeed = ZE.CharacterStats[default].runspeed 
			player.jumpfactor = ZE.CharacterStats[default].jumpfactor 
			player.charability = ZE.CharacterStats[default].charability 
			player.charability2 = ZE.CharacterStats[default].charability2
			player.staminacost = ZE.CharacterStats[default].staminacost
			player.staminarun = ZE.CharacterStats[default].staminarun
			player.staminanormal = ZE.CharacterStats[default].staminanormal  
		end
		

		
		if (player.ctfteam == 1)
			player.charflags = SF_NOJUMPSPIN|SF_NOJUMPDAMAGE|SF_NOSKID
			player.powers[pw_underwater] = 30*TICRATE
		end
		
		if (player.ctfteam == 2)
			player.charflags = SF_NOJUMPSPIN|SF_NOSKID
		end
	end
end

ZE.InsertUnlocked = function(player)
	player.rvgrpass = $ or 0
	player.gamesPlayed = $ or 0
end

ZE.CharacterStamina = function(player)
	if (gametype == GT_ZESCAPE)
		player.stamina = $ or 0
		if not (player.mo and player.mo.valid) return end
		if (player.mo.skin == "dzombie") return end
		local cmd = player.cmd
		local skinname = skins[player.mo.skin].name
		local default = "defaultconfig"

		local buttoncheck = ((not (player.stamina <= 0)) 
		and (player.cmd.buttons & BT_CUSTOM1) 
		and (cmd.forwardmove > 0 or cmd.forwardmove < 0 or cmd.sidemove < 0 or cmd.sidemove > 0))

		local staminacheck = player.staminanormal and player.staminarun and player.staminacost
		if buttoncheck and staminacheck
			player.normalspeed = player.staminanormal
			player.runspeed = player.staminarun
			player.stamina = $ - player.staminacost
		end
		if not (player.stamina >= 100*TICRATE) and (player.stamina <= 25*TICRATE)
			player.stamina = $+2
		end
		if not (player.stamina >= 100*TICRATE) and (player.stamina >=25*TICRATE)
			player.stamina = $+4
		end
		if (player.stamina <= 0) and (player.cmd.buttons & BT_CUSTOM1) then
			player.normalspeed = 8*FRACUNIT
		end
	end
end

ZE.ZtypeCfg = function(player)
	if not (gametype == GT_ZESCAPE) then return end
	if (player.mo and player.mo.valid)
		if (player.ztype == ZM_ALPHA) and not (player.ctfteam == 2)
			player.mo.scale = ZE.ZombieStats["Alpha"].scale
		elseif (player.ctfteam == 2) or (player.spectator == 1) then
			return
		end
		if not (leveltime < CV.waittime) and not (player.ctfteam == 2)  then
			if (player.ztype == ZM_ALPHA) and not (player.boost == 1) then
				player.normalspeed = ZE.ZombieStats["Alpha"].normalspeed
				player.jumpfactor = ZE.ZombieStats["Alpha"].jumpfactor
			end
			
			if (player.ztype == ZM_FAST)
				player.normalspeed = ZE.ZombieStats["Fast"].normalspeed
				player.jumpfactor = ZE.ZombieStats["Fast"].jumpfactor
			end
			
			if (player.ztype == ZM_POISON)
				player.normalspeed = ZE.ZombieStats["Poison"].normalspeed
				player.jumpfactor = ZE.ZombieStats["Poison"].jumpfactor
			end
			
			if (player.ztype == ZM_GOLDEN)
				player.normalspeed = ZE.ZombieStats["Golden"].normalspeed
				player.jumpfactor = ZE.ZombieStats["Golden"].jumpfactor
			end
			
			if (player.ztype == ZM_DARK)
				player.normalspeed = ZE.ZombieStats["Dark"].normalspeed
				player.jumpfactor = ZE.ZombieStats["Dark"].jumpfactor
			end
		end
	end
end

ZE.AlphaZmRage = function(player)
    if not (player.ztype == ZM_ALPHA) then return end
	if not player.playerstate != PST_LIVE
	if (player.mo and player.mo.valid)
		player.boosttimer = $ or 0
		player.boostcount = $ or 0
			if (player.boosttimer == 0)
			and (player.boostcount > 0)
				player.boostcount = $ - 1
			end
			if (player.boostcount == 0) and (player.boosttimer == 0) and (player.cmd.buttons & BT_CUSTOM1)
				player.boosttimer = 5*TICRATE
				S_StartSound(player.mo, sfx_bstup)
			end
			if (player.boosttimer ~= 0)
				player.normalspeed = 40*FRACUNIT
				player.charability = CA_JUMPTHOK
				player.actionspd = 30*FRACUNIT
				P_SpawnGhostMobj(player.mo)
			else
				return
			end
			if (player.boosttimer > 0)
				if (player.boosttimer == 1)
					player.boostcount = 45*TICRATE
					S_StartSound(player.mo, sfx_bstdn)
				end
				player.boosttimer = $ - 1
		  end
	   end
	end
end

ZE.ZtypeAura = function()
  if not (gametype == GT_ZESCAPE) then return end
    for player in players.iterate
        if player.mo and player.mo.valid and player.mo.skin == "dzombie"
        and player.playerstate == PST_LIVE
        and not player.powers[pw_carry]
        and not P_PlayerInPain(player)
        and not player.exiting
			if (player.ztype == ZM_ALPHA)
				local zombienumber1 = P_SpawnGhostMobj(player.mo)
				zombienumber1.color = P_RandomRange(SKINCOLOR_RED, SKINCOLOR_RUBY)
				zombienumber1.colorized = true
				zombienumber1.fuse = 1
				zombienumber1.blendmode = AST_ADD
				P_TeleportMove(zombienumber1, player.mo.x, player.mo.y, player.mo.z - 4*FRACUNIT)
				zombienumber1.frame = $|FF_ADD
				zombienumber1.scale = 15*FRACUNIT/10
				if zombienumber1.tracer
					zombienumber1.tracer.fuse = zombienumber1.fuse
				end
			end
			
			
			if (player.ztype == ZM_FAST)
				local zombienumber1 = P_SpawnGhostMobj(player.mo)
				zombienumber1.color = SKINCOLOR_MOSS
				zombienumber1.colorized = true
				zombienumber1.fuse = 1
				zombienumber1.blendmode = AST_ADD
				P_TeleportMove(zombienumber1, player.mo.x, player.mo.y, player.mo.z - 4*FRACUNIT)
				zombienumber1.frame = $|FF_ADD
				if zombienumber1.tracer
					zombienumber1.tracer.fuse = zombienumber1.fuse
				end
				player.mo.colorized = true
				player.mo.color = SKINCOLOR_MOSS
			end
			
			if (player.ztype == ZM_GOLDEN)
				local zombienumber1 = P_SpawnGhostMobj(player.mo)
				zombienumber1.color = SKINCOLOR_GOLD
				zombienumber1.colorized = true
				zombienumber1.fuse = 1
				zombienumber1.blendmode = AST_ADD
				P_TeleportMove(zombienumber1, player.mo.x, player.mo.y, player.mo.z - 4*FRACUNIT)
				zombienumber1.frame = $|FF_ADD
				if zombienumber1.tracer
					zombienumber1.tracer.fuse = zombienumber1.fuse
				end
				player.mo.colorized = true
				player.mo.color = SKINCOLOR_GOLD
			end
			
			if (player.ztype == ZM_DARK)
				local zombienumber1 = P_SpawnGhostMobj(player.mo)
				zombienumber1.color = SKINCOLOR_BLACK
				zombienumber1.colorized = true
				zombienumber1.fuse = 1
				zombienumber1.blendmode = AST_ADD
				P_TeleportMove(zombienumber1, player.mo.x, player.mo.y, player.mo.z - 4*FRACUNIT)
				zombienumber1.frame = $|FF_ADD
				if zombienumber1.tracer
					zombienumber1.tracer.fuse = zombienumber1.fuse
				end
				player.mo.colorized = true
				player.mo.color = SKINCOLOR_BLACK
			end
			
			if (player.ztype == ZM_POISON)
				local zombienumber1 = P_SpawnGhostMobj(player.mo)
				zombienumber1.color = SKINCOLOR_FOREST
				zombienumber1.colorized = true
				zombienumber1.fuse = 1
				zombienumber1.blendmode = AST_ADD
				P_TeleportMove(zombienumber1, player.mo.x, player.mo.y, player.mo.z - 4*FRACUNIT)
				zombienumber1.frame = $|FF_ADD
				if zombienumber1.tracer
					zombienumber1.tracer.fuse = zombienumber1.fuse
				end
				player.mo.colorized = true
				player.mo.color = SKINCOLOR_FOREST
			end
        end
    end
end

ZE.CharacterColors = function()
	for player in players.iterate
		if (player.mo and player.mo.valid)
			player.mo.color = skins[player.mo.skin].prefcolor
		end
	end
end

mobjinfo[MT_CORK].speed = 152*FRACUNIT //Balance tweak to preserve some of the challenge

ZE.CorkStuff = function(mo)
	return true //Overwrite default behavior so that corks won't damage invulnerable players
end

//Add ghost trail to the cork to improve its visibility
ZE.CorkTrail = function(mo)
	if mo.flags&MF_MISSILE and mo.target and mo.target.player then
		local ghost = P_SpawnGhostMobj(mo)
		ghost.destscale = ghost.scale*4
		if not(gametyperules&GTR_FRIENDLY) //Add color trail to competitive gametypes
			ghost.colorized = true
			ghost.color = mo.target.player.skincolor
		end
	end
end

ZE.StartHealth = function(player)
	local skinname = skins[player.mo.skin].name
	local default = "defaultconfig"
    if not (gametype == GT_ZESCAPE) return end
	if not (leveltime > CV.waittime) then 
		if (player.mo and player.mo.valid) then
			if ZE.CharacterStats[skinname] then
				player.mo.health = ZE.CharacterStats[skinname].startHealth
				player.mo.maxHealth = ZE.CharacterStats[skinname].maxHealth
			else
				player.mo.health = ZE.CharacterStats[default].startHealth
				player.mo.maxHealth = ZE.CharacterStats[default].maxHealth
			end
    	end
	end
end

ZE.HealthLimit = function(player)
	local skinname = skins[player.mo.skin].name
	local default = "defaultconfig"
    if not (gametype == GT_ZESCAPE) return end
	if (player.mo and player.mo.valid)
		local checkvars = player.mo.maxHealth and player.mo.health
		if checkvars then
			if player.mo.health > player.mo.maxHealth
				player.mo.health = player.mo.maxHealth
			end
		end
	end
end

ZE.AmyRegen = function(player)
	local checkvars = player.mo.maxHealth and player.mo.health
    if not (gametype == GT_ZESCAPE) return end
	if (player.mo and player.mo.valid)
	  if not (player.mo.skin == "amy") return end
	    player.regen = $ or 0
	    if checkvars and (player.mo.health < player.mo.maxHealth) then
		  player.regen = $1 - 1
		end
		if (player.regen <= 0*TICRATE) then
		   player.mo.health = $ + 2
		   player.regen = 1*TICRATE
		else
		    return end
	end
end
ZE.ZombieRegen = function(player)
    if not (gametype == GT_ZESCAPE) return end
	if (player.mo and player.mo.valid)
	  if not (player.mo.skin == "dzombie") return end
	    player.regen = $ or 0
	    if ( (player.mo.health < 900) and (not player.ztype) )
		or ( (player.mo.health < 2000) and (player.ztype == ZM_ALPHA) ) then
		  player.regen = $1 - 1
		end
		if (player.regen <= 0*TICRATE) then
		   if not (player.mo.health + 100 > player.mo.maxHealth) -- kinda the limit for zombies is 1000 for healing
			  player.mo.health = $ + 100
		   else
			  player.mo.health = player.mo.maxHealth
		   end
		   player.regen = 12*TICRATE
		else
		    return end
	end
end

ZE.ZombieHealth = function(player)
	if gametype == GT_ZESCAPE
		if player.mo and player.mo.valid
			if player.ctfteam == 2 return end
			if player.powers[pw_flashing] > 0
				if (player.ctfteam == 1) and not (player.spectator) and not (player.ztype == ZM_ALPHA)
					player.mo.health = ZE.ZombieStats["Normal"].startHealth
					player.mo.maxHealth = ZE.ZombieStats["Normal"].maxHealth  --normal zombie health
				end
				if (player.ztype == ZM_ALPHA)
					player.mo.health = ZE.ZombieStats["Alpha"].startHealth
					player.mo.maxHealth = ZE.ZombieStats["Alpha"].maxHealth
				end	
				
				if (player.ztype == ZM_FAST)
					player.mo.health = ZE.ZombieStats["Fast"].startHealth
					player.mo.maxHealth = ZE.ZombieStats["Fast"].maxHealth
				end
				
				if (player.ztype == ZM_POISON)
					player.mo.health = ZE.ZombieStats["Poison"].startHealth
					player.mo.maxHealth = ZE.ZombieStats["Poison"].maxHealth
				end
				
				if (player.ztype == ZM_GOLDEN)
					player.mo.health = ZE.ZombieStats["Golden"].startHealth
					player.mo.maxHealth = ZE.ZombieStats["Golden"].maxHealth
				end
				
				if (player.ztype == ZM_DARK)
					player.mo.health = ZE.ZombieStats["Dark"].startHealth
					player.mo.maxHealth = ZE.ZombieStats["Dark"].maxHealth
				end
				--zombie swarm

			end
		end
	end
end

ZE.ZombieSwarmWave = function(player)
	if gametype ~= GT_ZESCAPE return end
	if player.mo and player.mo.valid
		if player.ctfteam == 2 return end
		if mapheaderinfo[gamemap].zombieswarm then 
			if ZE.Wave == 1
				if player.powers[pw_flashing] > 0
					player.mo.health = 200
					player.mo.maxHealth = 200
				end
				player.normalspeed = 27*FRACUNIT
			end
			
			if ZE.Wave == 2
				if player.powers[pw_flashing] > 0
					player.mo.health = 400
					player.mo.maxHealth = 400
				end
				player.normalspeed = 30*FRACUNIT
			end
			
			if ZE.Wave == 3
				if player.powers[pw_flashing] > 0
					player.mo.health = 800
					player.mo.maxHealth = 800
				end
				player.normalspeed = 32*FRACUNIT
				player.charability = CA_NONE
				player.charability2 = CA2_SPINDASH
			end
			
			if ZE.Wave == 4
				if player.powers[pw_flashing] > 0
					player.mo.health = 1000
					player.mo.maxHealth = 1000
				end
				player.normalspeed = 35*FRACUNIT
				player.charability = CA_THOK
				player.charability2 = CA2_SPINDASH
			end
		end
	end
end

ZE.HealthOrb = function(obj, play)
	local player = play.player
	if (player.mo) and (player.ctfteam == 2)
		player.maxhp = 1 -- deprecated
		player.mo.maxHealth = $ + 200
		player.mo.health = $ + 200
	end
end


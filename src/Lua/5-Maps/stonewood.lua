--stonewood

local ZE = RV_ZESCAPE

local map41_true = false

ZE.map41netvars = function(net)
	map41_true = net($)
end

addHook("MapChange", do
        map41_true = false
end)

local function Map41_BTrue()
	  map41_true = 1
end

addHook("PlayerSpawn", function(player)
  if not (map41_true == 1) then return end
	if map41_true == 1 and player.ctfteam == 1
       P_TeleportMove(player.mo, -10304*FRACUNIT, -23360*FRACUNIT, 0*FRACUNIT)
	else
	    return
    end
end)


addHook("LinedefExecute", Map41_BTrue, "41BTRU")
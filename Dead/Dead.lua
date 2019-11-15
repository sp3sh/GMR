local timer = 0

local frameEvent = CreateFrame('Frame')
 
local timer = 0
local UPDATE_INTERVAL = 5 -- seconds per interval
local ShouldRestart = true

frameEvent:SetScript('OnUpdate', function(self, elapsed)
    timer = timer + elapsed
      if timer < UPDATE_INTERVAL then
        return
      end
    timer = 3 --intervals 1= UPDATE_INTERVALx this number
        if UnitIsDeadOrGhost("player") then
        RunMacroText("/gmr stop")
        RunMacroText("/gmr start")
        end
end)

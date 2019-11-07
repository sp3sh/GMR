local timer = 0

local function jumpDead()
    if (GetTime() - timer) <= 5 then return end
        timer = GetTime()
        print('jumping')
        JumpOrAscendStart()
        return true
    end

local frameEvent = CreateFrame('Frame')
 
local timer = 0
local UPDATE_INTERVAL = 10 -- seconds per interval
local ShouldRestart = true

frameEvent:SetScript('OnUpdate', function(self, elapsed)
    timer = timer + elapsed
      if timer < UPDATE_INTERVAL then
        return
      end
    timer = 1 --intervals 1= UPDATE_INTERVALx this number
        if UnitIsDeadOrGhost("player") then
        jumpDead()
        end
end)


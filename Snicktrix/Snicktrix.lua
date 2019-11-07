local frameEvent = CreateFrame('Frame')
 
local timer = 0
local UPDATE_INTERVAL = 3 -- seconds per interval
local ShouldRestart = true

local hpot = {
    [13446] = "Major Healing Potion",
    [3928] = "Superior Healing Potion",
    [1710] = "Greater Healing Potion",
    [929] = "Healing Potion",
    [858] = "Lesser Healing Potion",
    [118] = "Minor Healing Potion"
}

local openitem = {
    [7973] = "Big-mouth Clam",
    [5523] = "Small Barnacled Clam"
}

function HealthPercentage(unit)
    return (UnitHealth(unit) / UnitHealthMax(unit)) * 100
end

frameEvent:SetScript('OnUpdate', function(self, elapsed)
    timer = timer + elapsed
      if timer < UPDATE_INTERVAL then
        return
      end
    timer = 1 --intervals 1= UPDATE_INTERVALx this number
    if UnitAffectingCombat("player") and GetItemCooldown(5079) == 0 and not UnitDebuff("Target", 1139) then
      RunMacroText('/use 13') --13 trinket 1st from top, 14 for 2nd second from top
        else 
            for Id, Name in pairs(hpot) do
                if not UnitIsDeadOrGhost("player") and HealthPercentage("player") < 45 and GetItemCount(Id) > 0 and GetItemCooldown(Id) == 0  then
                    UseItemByName(Id)
                else
                    for Id, Name in pairs(openitem) do
                        if GetItemCount(Id) > 0 then
                            UseItemByName(Id)
                        end
                    end
                end
            end
    end
end)


local frameEvent = CreateFrame('Frame')
 
local timer = 0
local UPDATE_INTERVAL = 3 -- seconds per interval
local ShouldRestart = true

function HealthPercentage(unit) -- Turn health to a %
    return (UnitHealth(unit) / UnitHealthMax(unit)) * 100
end

function ManaPercentage(unit) -- Turn mana to a %
    return (UnitMana(unit) / UnitManaMax(unit)) * 100
end

function playerHasBuff(spellID) -- query buffs on player
    local buffs, i = { }, 1
    local buff = UnitBuff("player", i)
    while buff do
        buffs[#buffs + 1] = buff
        i = i + 1
        buff = select(10,UnitBuff("player", i))
        if buff ~= nil then
            if buff == spellID then return true end -- if the buff equals he spell id we define then true
        end
    end
    return false
end

function checkFoodBuff()
  for i=1, 40 do
    local B=UnitBuff("player", i)
    if B then
      if B==GetSpellInfo(433) or B==GetSpellInfo(430) then
        return true --if we are eating or drinking then we define true
      end
    end
  end
  return false
end

frameEvent:SetScript('OnUpdate', function(self, elapsed)
    timer = timer + elapsed
      if timer < UPDATE_INTERVAL then
        return
      end
    timer = 1 --intervals 1= UPDATE_INTERVALx this number

    if not checkFoodBuff() and not UnitIsDeadOrGhost("player") and not playerHasBuff(2890) and ManaPercentage("player") > 20 then --if we are not eating and player is not dead or a ghost and has this buff and mana is above this then do the next line 
            RunMacroText("/cast Ice Barrier")                                                                                      --or a ghost and has this buff and mana is above this % then run macro text 
                else
                    print("We are shielded")
    end    
end)
--local UseLure = {}
local FishingSpellID = 131474

local function IsFishingRodEnchanted()
  local hasMainHandEnchant, mainHandExpiration, mainHandCharges, _ = GetWeaponEnchantInfo()

  return hasMainHandEnchant
end

--local lure = {
--    '6530',
--    '6811',
--    '6532',
--    '7307',
--    '6533',
--}

local frameEvent = CreateFrame('Frame')
 
local timer = 0
local UPDATE_INTERVAL = 10
 
frameEvent:SetScript('OnUpdate', function(self, elapsed)
    timer = timer + elapsed
    if timer < UPDATE_INTERVAL then
        return
    end
    timer = 3
    if not IsFishingRodEnchanted() then
    --print ('applying lure')
    RunMacroText("/use Bright Baubles \n/use 16")
else 
    RunMacroText("/cast fishing")    
    end
end)
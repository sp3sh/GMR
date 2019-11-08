print("Lures Applicator by Snickers (published by Moose)")
local function IsFishingRodEnchanted()
  local HasMainHandEnchant, _, _, _ = GetWeaponEnchantInfo()

  return HasMainHandEnchant
end

local openitem = {
    [7973] = "Big-mouth Clam",
    [5523] = "Small Barnacled Clam"
}

local NextCheck = 0
local CheckInterval = 10
local ShouldRestart = false

local Frame = CreateFrame('Frame') 
Frame:SetScript("OnUpdate", function(self, elapsed)
    if GetTime() > NextCheck then
        NextCheck = GetTime() + CheckInterval
        if __LB__ ~= nil then
            if not IsFishingRodEnchanted() then
                __LB__.Unlock(RunMacro, "Fishing")
                ShouldRestart = true
                print("Applying lure, fishing will restart in 10 seconds")
            elseif ShouldRestart then
                __LB__.Unlock(RunMacro, "Fishing2")
                ShouldRestart = false
                print("Fishing restarted")
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

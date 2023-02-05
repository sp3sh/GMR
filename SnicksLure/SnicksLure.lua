print("Lures Applicator by Snickers (published by Moose)")

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

        if IsFishingRodEnchanted() then
            for id, name in pairs(openitem) do
                if GetItemCount(id) > 0 then
                    UseItemByName(name)
                end
            end
        else
            if ShouldRestart then
                __LB__.Unlock(RunMacro, "Fishing2")
                ShouldRestart = false
                print("Fishing restarted")
            else
                __LB__.Unlock(RunMacro, "Fishing")
                ShouldRestart = true
                print("Applying lure, fishing will restart in 10 seconds")
            end
        end
    end
end)

Snicks = CreateFrame("Frame")
Snicks:RegisterEvent("LOOT_READY")

Snicks:SetScript("OnEvent", function ()
    if GetCVarBool("autoLootDefault") ~= IsModifiedClick("AUTOLOOTTOGGLE") then
        for i = GetNumLootItems(), 1, -1 do
            LootSlot(i)
             RunMacroText("/click StaticPopup1Button1")
        end
    end
end)
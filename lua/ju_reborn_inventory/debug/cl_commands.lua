
local panelPrefix = 'juRebornInventory'

local uiList = {
    'juRebornInventoryBackpack',
    'juRebornInventoryCell_B',
    'juRebornInventoryCell_C',
    'juRebornInventoryCellContextMenu',
    'juRebornInventoryCellIcon',
}

local uiListAuto = {}

local testUICommandName = 'ju_test_ui'

for k, v in ipairs(uiList) do
    uiListAuto[k] = testUICommandName .. ' ' .. v
end

concommand.Add(testUICommandName, function(ply, cmd, args, argStr)
    
    if ju.reborn_inventory.debugPanel then

        print(ju.reborn_inventory.debugPanel:GetClassName() .. ' was removed!')

        ju.reborn_inventory.debugPanel:Remove()
        ju.reborn_inventory.debugPanel = nil

    end

    if !argStr or argStr == '' then
        return
    end

    if !string.find(argStr, panelPrefix) then
        argStr = panelPrefix .. argStr 
    end

    ju.reborn_inventory.debugPanel = vgui.Create(argStr)
    ju.reborn_inventory.debugPanel:Center()

end, function(arguments) return uiListAuto end)

concommand.Add(testUICommandName ..'_list', function()
    
    for k, v in ipairs(uiList) do
        print(v)
    end

end)

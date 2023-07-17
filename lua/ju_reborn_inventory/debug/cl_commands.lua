
local panelPrefix = 'juRebornInventory'

local uiList = {
    'juRebornInventoryBackpack',
    'juRebornInventoryCell_B',
    'juRebornInventoryCell_C',
    'juRebornInventoryCellContextMenu',
    'juRebornInventoryCellIcon',
}

local uiListAuto = {}

for k, v in ipairs(uiList) do
    uiListAuto[k] = 'ju_cell_ui' .. ' ' .. v
end

concommand.Add('ju_cell_ui', function(ply, cmd, args, argStr)
    
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

concommand.Add('ju_cell_ui_list', function()
    
    for k, v in ipairs(uiList) do
        print(v)
    end

end)

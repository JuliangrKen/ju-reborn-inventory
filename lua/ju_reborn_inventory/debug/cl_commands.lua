
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
    
    print(argStr)

    if debugPanel then

        debugPanel:Remove()
        debugPanel = nil

    end

    if !argStr or argStr == '' then
        return
    end

    if !string.find(argStr, panelPrefix) then
        argStr = panelPrefix .. argStr 
    end

    pcall(function()
        debugPanel = vgui.Create(argStr)
        debugPanel:Center()
    end)

end, function(arguments) return uiListAuto end)

concommand.Add('ju_cell_ui_list', function()
    
    for k, v in ipairs(uiList) do
        print(v)
    end

end)

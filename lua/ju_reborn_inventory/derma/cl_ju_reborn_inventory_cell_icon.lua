
local cfg = ju.reborn_inventory.cfg

DEFINE_BASECLASS 'Panel'

local PANEL = {}

AccessorFunc(PANEL, 'itemID', 'ItemID')

function PANEL:Init()


end

function PANEL:Paint(w, h)

    draw.SimpleText(tostring(self.itemID or -1), 'juRebornInventoryTitle2', w / 2, h / 2, cfg.inventory_cell_light_grey, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    if !itemID then
    
        -- draw default image

        return

    end

   
    -- draw icon


end

function PANEL:SetItemID(id)

    self.itemID = id
    
end

vgui.Register('juRebornInventoryCellIcon', PANEL, 'Panel')

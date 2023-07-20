
local cfg = ju.reborn_inventory.cfg

local background = ColorAlpha(cfg.inventory_cell_dark_grey, 255 * .34) -- 34%

DEFINE_BASECLASS 'Panel'

local PANEL = {}

AccessorFunc(PANEL, 'itemID', 'ItemID')

function PANEL:Init()
    
    self:SetSize(cfg.inventory_cell_b_size, cfg.inventory_cell_b_size)

    self.icon = vgui.Create('juRebornInventoryCellIcon', self)
    self.icon:Dock(FILL)

end

function PANEL:Paint(w, h)

    draw.NoTexture()
    surface.SetDrawColor(background)
    surface.DrawRect(0, 0, w, h)
    
end

function PANEL:SetItemID(id)

    self.itemID = id 
    self.icon:SetItemID(id)

end

vgui.Register('juRebornInventoryCell_B', PANEL, 'Panel')

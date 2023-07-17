

local cfg = ju.reborn_inventory.cfg

local fillBackground = ColorAlpha(cfg.inventory_cell_background, 255 * .78)
local textLine = cfg.inventory_cell_light_grey

DEFINE_BASECLASS 'Panel'

local PANEL = {}

function PANEL:Init()

    self:SetSize(ScrW(), ScrH())
    
    self.cellsPanel = vgui.Create('Panel', self)

    self.lines = {}

    local nextID = 1
    for i = 1, cfg.inventory_backpack_h_view, 1 do
        
        self.lines[i] = vgui.Create('Panel', self.cellsPanel)
        -- self.lines[i]:DockMargin(0, 1, 0, 0)
        self.lines[i]:Dock(TOP)

        local cells = {}

        for j = 1, cfg.inventory_backpack_w_view, 1 do
            
            cells[nextID] = vgui.Create('juRebornInventoryCell_B', self.lines[i])
            cells[nextID]:SetItemID(nextID)
            -- self.lines[i]:DockMargin(1, 0, 0, 0)
            cells[nextID]:Dock(LEFT)
            nextID = nextID + 1

        end
        
        self.lines[i]:SizeToChildren()

    end
   
    self.cellsPanel:SizeToChildren()
    self.cellsPanel:Center()

end

function PANEL:Paint(w, h)

    draw.NoTexture()

    -- fill

    surface.SetDrawColor(fillBackground)
    surface.DrawRect(0, 0, w, h)

    -- text line

    draw.SimpleText(cfg.inventory_backpack_title_1, 'juRebornInventoryTitle1', 20, 27, cfg.inventory_cell_light_grey)

    surface.SetDrawColor(textLine)
    surface.DrawLine(20, 79, 20 + cfg.inventory_cell_b_line_lenght, 79)

    -- fence

    local x, y = self.cellsPanel:GetSize()
    local f = cfg.inventory_cell_b_fence
    
    local sx, sy = x - f, y - f
    local ex, ey = x + f, y + f


    draw.SimpleText(cfg.inventory_backpack_title_2, 'juRebornInventoryTitle2', ex, sy - f, cfg.inventory_cell_orange, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM)

    draw.LineRect(sx, sy, ex, ey, cfg.inventory_cell_orange)

end

vgui.Register('juRebornInventoryBackpack', PANEL, 'Panel')

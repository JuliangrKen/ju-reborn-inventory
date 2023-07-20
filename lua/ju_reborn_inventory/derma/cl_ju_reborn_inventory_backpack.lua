

local cfg = ju.reborn_inventory.cfg

local fillBackground = ColorAlpha(cfg.inventory_cell_background, 255 * .78)
local textLine = cfg.inventory_cell_light_grey

local cellSize = cfg.inventory_cell_b_size
local padding = cfg.inventory_backpack_cells_padding

local wView = cfg.inventory_backpack_w_view
local hView = cfg.inventory_backpack_h_view

local fence = cfg.inventory_cell_b_fence

local headerZone = cfg.inventory_backpack_header_zone

DEFINE_BASECLASS 'Panel'

local PANEL = {}

function PANEL:Init()

    local w, h = ScrW(), ScrH()

    self:SetSize(w, h)
    
    self.cellsPanel = vgui.Create('Panel', self)

    local wC, hC = wView * cellSize + (wView - 1) * padding, hView * cellSize + (hView - 1) * padding

    self.cellsPanel:SetSize(wC, hC)
    self.cellsPanel:SetPos((w - wC) / 2, (h - hC + headerZone) / 2)

    self.cellsPanel.verticalScr = vgui.Create('DScrollPanel', self.cellsPanel)

end

function PANEL:Paint(w, h)

    draw.NoTexture()

    -- fill

    surface.SetDrawColor(fillBackground)
    surface.DrawRect(0, 0, w, h)

    -- text line

    draw.SimpleText(cfg.inventory_backpack_title_1, 'juRebornInventoryTitle1', 20, 27, cfg.inventory_cell_light_grey)

    surface.SetDrawColor(textLine)
    surface.DrawLine(20, headerZone, 20 + cfg.inventory_cell_b_line_lenght, headerZone)

    -- fence

    local wC, hC = self.cellsPanel:GetSize()

    local sx, sy = self.cellsPanel:GetPos()
    local ex, ey = wC + sx, hC + sy

    sx, sy = sx - fence, sy - fence
    ex, ey = ex + fence, ey + fence

    draw.SimpleText(cfg.inventory_backpack_title_2, 'juRebornInventoryTitle2', ex, sy - fence, cfg.inventory_cell_orange, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM)

    draw.LineRect(sx, sy, ex, ey, cfg.inventory_cell_orange)

    -- TODO: переделать логику положения

    -- local w1, h1 = self.cellsPanel:GetSize()
    -- local x, y = w / 2 - w1, h / 2 - h1

    -- local f = cfg.inventory_cell_b_fence
    
    -- local sx, sy = x - f, y - f
    -- local ex, ey = x + f + w1, y + f + h1



    -- draw.LineRect(sx, sy, ex, ey, cfg.inventory_cell_orange)

end

vgui.Register('juRebornInventoryBackpack', PANEL, 'Panel')

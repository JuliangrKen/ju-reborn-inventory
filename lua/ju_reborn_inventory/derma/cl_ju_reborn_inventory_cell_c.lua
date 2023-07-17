
local math = math

local sin = math.sin
local cos = math.cos
local pi = math.pi

local strip_back = ju.reborn_inventory.classes.strip_back

-- for c-menu

local cfg = ju.reborn_inventory.cfg

local size = cfg.inventory_cell_c_size
local strokeSize = cfg.inventory_cell_c_strokeSize

local numStripes = cfg.inventory_cell_num_stripes
local stripesInterval = cfg.inventory_cell_stripes_interval

-- colors

local strokeColor = ColorAlpha(cfg.inventory_cell_blue, 255 * .6) -- 60%
local stripeColor = ColorAlpha(cfg.inventory_cell_blue, 255 * 0.3)-- .06) -- 6%

DEFINE_BASECLASS 'Panel'

local PANEL = {}

function PANEL:Init()
    
    local s = size + strokeSize
    self:SetSize(s, s)

    self.stripRects = strip_back:new(numStripes)
        :SetSize(size, size)
        :SetStripesInterval(stripesInterval)
        :SetRotate(15)
        :BuildXY()

end

function PANEL:Paint(h, w)
    
    -- strip back
    surface.SetDrawColor(stripeColor)
	draw.NoTexture()

    for k, v in ipairs(self.stripRects) do
        
        surface.DrawPoly(v)

    end

    -- stroke:

    draw.LineRect(0, 0, h, h, strokeColor)

end

vgui.Register('juRebornInventoryCell_C', PANEL, 'Panel')

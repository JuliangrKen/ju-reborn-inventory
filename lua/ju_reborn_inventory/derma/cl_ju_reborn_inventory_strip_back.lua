
local defaultSizes = {
    ['w'] = ScrW(),
    ['h'] = ScrH(),
}

local numStripes = 32
local stripesInterval = 2
local angle = 30

local stripeColor = Color(200, 200, 0)

DEFINE_BASECLASS 'Panel'

local PANEL = {}

function PANEL:Init()

    self:SetPos(0, 0)
    self:SetSize(defaultSizes.w, defaultSizes.h)

    self.stripBack = ju.reborn_inventory.classes.strip_back

    self.stripRects = self.stripBack:new(numStripes)
                            :SetSize(defaultSizes.w, defaultSizes.h)
                            :SetStripesInterval(stripesInterval)
                            :SetAngle(0)
                            :BuildXY()

end

-- function PANEL:OnSizeChanged(w, h)


    
-- end

function PANEL:Paint(arguments)
    
    surface.SetDrawColor(stripeColor)
    draw.NoTexture()

    for k, v in ipairs(self.stripRects) do
        
        surface.DrawPoly(v)

    end

end

vgui.Register('juRebornInventoryStripBack', PANEL, 'Panel')

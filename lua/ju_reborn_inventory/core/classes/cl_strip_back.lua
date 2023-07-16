
-- local default values:

local dW, dH = 100, 100
local dStripesInterval = 10

-- striped background mt

local STRIP_BACK = {}

STRIP_BACK.__index = self

-- public methods:

function STRIP_BACK:new(numStripes)
    
    heir.__index = self

    self.numStripes = numStripes

    return self

end

--[[
    w : num
    h : num

    return this table
]]
function STRIP_BACK:SetSize(w, h)

    self.w = w
    self.h = h

    return self
    
end

--[[
    stripesInterval : num
    return this table
]]
function STRIP_BACK:SetStripesInterval(stripesInterval)
    
    self.stripesInterval = stripesInterval
    return self

end

--[[
    angle : num
    return this table
]]
function STRIP_BACK:Rotate(angle)

    self.matrix = self.matrix or Matrix()

    local turn = 2 * pi * angle / 360
    self.matrix:Rotate(Vector(sin(turn), cos(turn), 0):Angle())

    return self

end

--[[
    return table : { { [1] = num, [2] = num, [3] = num, [4] = num }, etc }
]]
function STRIP_BACK:Build()

    local w, h = self:calcRectSizes()
    
    local rects = {}

    local nextX, nextY = 0, 0

    for i = 1, self.numStripes, -1 do
        
        rects[i] = self:createNewRect(w, h, nextX, nextY)
        nextY = nextY + (self.stripesInterval or dStripesInterval) + h

    end

    return rects

end

-- private methods:

function STRIP_BACK:calcRectSizes()

    local hAll = (self.h or dH) - (self.stripesInterval or dStripesInterval) * (#self.numStripes - 1)
    return self.w or dW, hAll / #self.numStripes
    
end

function STRIP_BACK:createNewRect(w, h, x, y)

    -- up-left to down-right; clockwise
    local rect = {
        [1] = Vector(x, y),
        [2] = Vector(x + w, y),
        [3] = Vector(x + w, y + h),
        [4] = Vector(x, y + h)
    }

    if self.matrix then
        
        for k, v in ipairs(rect) do
            
            rect[k] = self.matrix * v

        end

    end

    return rect

end

ju.reborn_inventory.classes.strip_back = STRIP_BACK

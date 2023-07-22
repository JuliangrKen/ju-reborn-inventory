
local math = math

local sin = math.sin
local cos = math.cos
local atan = math.atan
local pi = math.pi

-- local default values:

local dW, dH = 100, 100
local dStripesInterval = 10

-- striped background mt

local STRIP_BACK = {}

STRIP_BACK.__index = STRIP_BACK

-- public methods:
AccessorFunc(STRIP_BACK, 'w', 'W')
AccessorFunc(STRIP_BACK, 'h', 'H')
AccessorFunc(STRIP_BACK, 'stripesInterval', 'StripesInterval')
AccessorFunc(STRIP_BACK, 'angle', 'Angle')

function STRIP_BACK:new(numStripes)
    
    local heir = setmetatable({}, self)

    heir.__index = self
    heir.numStripes = numStripes

    return heir

end

--[[
    w : num
    h : num

    return this table
]]
function STRIP_BACK:SetSize(w, h)

    self:SetW(w)
    self:SetH(h)

    return self
    
end

function STRIP_BACK:GetSize()
    
    return self.w or dW, self.h or dH

end

--[[
    stripesInterval : num
    return this table
]]
function STRIP_BACK:SetStripesInterval(stripesInterval)
    
    self.stripesInterval = stripesInterval
    return self

end

function STRIP_BACK:GetStripesInterval()
    
    return stripesInterval or dStripesInterval

end

--[[
    angle : num
    return this table
]]
function STRIP_BACK:SetAngle(angle)

    local ang = Angle(angle)
    ang:Normalize()

    self.angle = ang[1]
    return self

end

function STRIP_BACK:GetAngle()
   
    return self.angle or 0

end

function STRIP_BACK:Horizontal()

    self:SetAngle(0)
    return self
    
end

function STRIP_BACK:Vertical()

    self:SetAngle(90)
    return self
    
end

--[[
    return table : { { [1] = Vector, ect }, etc }
]]
function STRIP_BACK:Build()

    local w, h = self:GetSize()
    local angle = self:GetAngle()
    local stripesInterval = self:GetStripesInterval()
    local numStripes = self.numStripes

    if angle == 0 or angle == 180 then
        
        return self:buildHorizontal(w, h, stripesInterval, numStripes)

    elseif angle == 90 or angle == -90 then
        
        return self:buildVertical(w, h, stripesInterval, numStripes)

    else

        return self:buildOther(angle, w, h, stripesInterval, numStripes)
        
    end

end

--[[
    return table : { { [1] = { x = num, y = num }, ect }, etc }
]]
function STRIP_BACK:BuildXY()

    local buildRes = self:Build()

    local res = {}

    for k, v in ipairs(buildRes) do

        res[k] = {}
        
        for k1, v1 in ipairs(v) do
            
            res[k][k1] = { ['x'] = v1[1], ['y'] = v1[2] }

        end

    end

    return res

end

-- private

function STRIP_BACK:buildSimple(main, other, stripesInterval, numStripes, isX)

    local res = {}

    local mainLength = (main - (numStripes - 1) * stripesInterval) / numStripes

    local startOther, endOther = 0, other
    local startMain = 0

    for i = 1, numStripes, 1 do
    
        local endMain = startMain + mainLength

        if isX then

            res[i] = self:createNewRect(startOther, startMain, endOther, endMain)

        else

            res[i] = self:createNewRect(startMain, startOther, endMain, endOther)

        end
    
        startMain = endMain + stripesInterval
    
    end

    return res
    
end

function STRIP_BACK:buildHorizontal(w, h, stripesInterval, numStripes)

    return self:buildSimple(h, w, stripesInterval, numStripes, true)

end

function STRIP_BACK:buildVertical(w, h, stripesInterval, numStripes)

    return self:buildSimple(w, h, stripesInterval, numStripes)
    
end

function STRIP_BACK:buildOther(angle, w, h, stripesInterval, numStripes)

    local res = {}


    return res
    
end

function STRIP_BACK:createNewRect(x1, y1, x2, y2)
    
    return {
        Vector(x1, y1),
        Vector(x2, y1),
        Vector(x2, y2),
        Vector(x1, y2),
    }

end

function STRIP_BACK:createNewCenterRect(w, h)

    local w2, h2 = w / 2, h2
    return self:createNewRect(-w2, -h2, w2, h2)

end

ju.reborn_inventory.classes.strip_back = STRIP_BACK


local function toNum(str)
    return tonumber(str, 16)
end

-- rgb hex only

function fromHex(hex)
    
    if !isstring(hex) then
        error 'is no string'
    end

    local length = #hex - 1
    if length != 6 or hex[1] != '#' then
        error 'is no hex'
    end

    local r = hex[2] .. hex[3]
    local g = hex[4] .. hex[5]
    local b = hex[6] .. hex[7]

    return Color(toNum(r), toNum(g), toNum(b))

end


local cfg = ju.reborn_inventory.cfg

local playerMeta = FindMetaTable 'Player'

if SERVER then
    
    function playerMeta:isHighPrivileges()
    
        local isCan
    
        for _, v in ipairs(cfg.highPrivileges) do
            
            if ply:IsUserGroup(v) then
                isCan = true
                break
            end
    
        end
    
        return isCan or false
    
    end

else

    

end
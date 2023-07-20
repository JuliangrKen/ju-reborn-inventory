
local cfg = ju.reborn_inventory.cfg

local entityMeta = FindMetaTable 'Entity'

if SERVER then

    function entityMeta:canBeJuItem()

        return entityMeta.isJuItem or 
            cfg.entityItems[self:GetClass()]
        
    end

else



end

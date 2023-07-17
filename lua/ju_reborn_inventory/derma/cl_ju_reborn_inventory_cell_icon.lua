
DEFINE_BASECLASS 'DButton'

local PANEL = {}

AccessorFunc(PANEL, 'itemID', 'ItemID')

function PANEL:Init()


end

function PANEL:Paint()

    if !itemID then
    
        -- draw default image

        return

    end

   
    -- draw icon


end

function PANEL:SetItemID(id)

    self.itemID = id
    
end

vgui.Register('juRebornInventoryCellIcon', PANEL, 'DButton')


local db = ju.reborn_inventory.db

do
    db.mysql = include 'lua/ju_reborn_inventory/db/thirdparty/sv_mysql.lua'
    mysql:SetModule(db.module)
    mysql:Connect(db.host, db.username, db.password, db.database, db.port)
end

if !mysql:IsConnected() then
    print 'ju reborn inventory dont work!'
    return 
end

-- https://wiki.facepunch.com/gmod/Enums/TYPE

TYPE_NUMBER = TYPE_NUMBER or 3
TYPE_STRING = TYPE_STRING or 4

function db.GetModelsMeta()

    local models = {}

    local files, _ = file.Find(dir..'*', 'LUA')
    for _, v in ipairs(files) do
        
        if !string.EndsWith(v, '.lua') then return end

        models[string.Trim(v, '.lua')] = include(v, dir)

    end

    return models

end

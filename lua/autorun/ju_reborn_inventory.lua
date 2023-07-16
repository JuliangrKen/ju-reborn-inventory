
-- by jujaken

ju = ju or {}
ju.reborn_inventory = ju.reborn_inventory or {}
ju.reborn_inventory.cfg = ju.reborn_inventory.cfg or {}
ju.reborn_inventory.db = ju.reborn_inventory.db or {}

-- include functions:

local rDir = 'ju_reborn_inventory/'

local addSv = SERVER and include or function() end
local addCl = SERVER and AddCSLuaFile or include
local addSh = function(...)
    addSv(...)
    addCl(...)
end

local addFile = function(name, dir)
    local prefix = string.Left(name, 3)
    local path = (dir or rDir) .. name

    if prefix == 'sv_' then
        addSv(path)
        return
    end

    if prefix == 'cl_' then
        addCl(path)
        return
    end

    addSh(path)
end

local addDir = function(name)
    local dir = rDir..name..'/'
    local files, _ = file.Find(dir..'*', 'LUA')
    
    for _, v in ipairs(files) do
        if !string.EndsWith(v, '.lua') then return end
        addFile(v, dir)
    end
end

addDir 'utils'

addFile 'cfg.lua'
addFile 'db.lua'

addDir 'core'
addDir 'derma'

-- Hello msg:
MsgC(Color(134, 156, 223), "\n~~~\tJuliandrKen (jujaken) Reborn Inventory was loaded. I'm hokaga!\t~~~\n")

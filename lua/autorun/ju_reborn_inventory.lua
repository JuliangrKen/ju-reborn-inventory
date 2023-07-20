
-- by jujaken

ju = ju or {}
ju.reborn_inventory = ju.reborn_inventory or {}
ju.reborn_inventory.cfg = ju.reborn_inventory.cfg or {}
ju.reborn_inventory.db = ju.reborn_inventory.db or {}
ju.reborn_inventory.classes = ju.reborn_inventory.classes or {}
ju.reborn_inventory.resources = ju.reborn_inventory.resources or {}

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
addFile 'resources.lua'
addFile 'fonts.lua'

addSv 'db.lua'
addSv 'db/sv_init.lua'
addFile 'db/sh_functions.lua'

addDir 'core/classes'
addDir 'core'
addDir 'derma'

-- degug mode

if ju.reborn_inventory.cfg.debug then
    addDir 'debug'
end

-- Hello msg:
MsgC(Color(134, 156, 223), "\n~~~\tJuliandrKen (jujaken) Reborn Inventory was loaded. I'm hokaga!\t~~~\n")

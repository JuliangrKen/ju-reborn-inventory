
local typesSql = {
    [TYPE_NUMBER] = 'INT NOT NULL',
    [TYPE_STRING] = 'VARCHAR (32) NOT NULL',
}

local specialExtensions = {
    -- add space!
    ['id'] = ' AUTO_INCREMENT',
}

local prefix = 'Ju_Reborn_Inventory_'

local db = ju.reborn_inventory.db
local modelsMeta = db.GetModelsMeta();

for tableName, modelMeta in pairs(modelsMeta) do

    local modelName = string.toCamelCase(tableName)
    
    do -- Create tables
        
        local query = mysql:Create(tableName)

        for column, type in pairs(modelMeta) do
            
            query:Create(column, typeSql[type] .. (specialExtensions[type] or ''))

        end

        query:PrimaryKey 'id'

    end

    local create = 'Create'.. modelName
    local refresh = 'Refresh' .. modelName
    local get = 'Get' .. modelName .. 'ById'
    local set = 'Set' .. modelName
    local delete = 'Delete' .. modelName

    local create_net = prefix .. create
    local refresh_net = prefix .. refresh
    -- local get_net = prefix .. get
    local set_net = prefix .. set
    local delete_net = prefix .. delete

    if SERVER then
        
        util.AddNetworkString(create_net)
        util.AddNetworkString(refresh_net)
        -- util.AddNetworkString(get_net)
        util.AddNetworkString(set_net)
        util.AddNetworkString(delete_net)

    end

    db[modelName .. 'Data'] = {}
    local data = db[modelName .. 'Data']

    -- add Create functions
    db[create] = function(model)
        
        if SERVER then
            
            local query = mysql:Insert(tableName)

            for k, v in pairs(model) then
                
                query:Insert(k, v)

            end

            query:Execute()

        else

            net.Start(create_net)
                net.WriteTable(model)
            net.SendToServer()

        end

    end

    db[refresh] = function(id, callback)

        if SERVER then
            
            mysql:Select(tableName):Where('id', id):Callback(function(result)

                data[id] = result
    
                if callback then
                    callback(result)
                end
    
            end):Execute()

        else

            net.Start(refresh_net)
                net.WriteUInt(id, 32)
            net.SendToServer()

        end

    end

    if SERVER then
        
        net.Receive(refresh_net, function(len, ply)
            
            local id = net.ReadUInt(32)
            db[refresh](id)

            net.Start(refresh_net)
                net.WriteUInt(id, 32)
                net.WriteTable(refresh_net)
            net.Send(ply)

        end)

    else

        net.Receive(refresh_net, function(len, ply)
            
            data[net.ReadUInt(32)] = net.ReadTable()

        end)

    end
    
    -- add Getters:
    db[get] = function(id, bNoRefresh)

        if !bNoRefresh then
            db[refresh](id)
        end

        return data[id]

    end


    -- add Setters:

    --[[
        model : table

        return changes { name, oldValue, newValue }
    ]]
    db[set] = function(model)

        if SERVER then

            local oldModel = db['Get' .. modelName .. 'ById'](model.id)

            if !oldModel then
                Error 'Object not found'
                return
            end
    
            local changes = {}
    
            for name, newValue in pairs(model) do
                
                local oldValue == oldModel[name]
    
                if type(oldValue) != type(newValue) or oldValue == oldModel then
                    continue
                end
    
                changes[#changes] = { name, oldValue, newValue }
                
            end
    
            return changes

        else

            net.Start(set_net)
                net.WriteTable(model)
            net.SendToServer()

        end

    end

    -- Остановился тут

    local function addSimpleNetReceive(netName, netReadFunc, netWriteFunc, requestFunc)
        
        net.Receive(netName, function(len, ply)
            
            if requestFunc then

                local request = requestFunc()



            else


                
            end

        end)

        if SERVER then

            net.Receive(netName, function(len, ply)
                
                -- Только для высоких привелегий.
            
                if ply:isHighPrivileges() then
    
                    local result = db[funcName](netReadFunc())
                    
                    if netWriteFunc then

                        net.Start(netName)
                            netWriteFunc(result)
                        net.Send(ply)

                    end
                    
                end
    
            end)

        else

            net.Receive(netName, function(len, ply)

                if !netFunc then
                    print 'OK'
                    return
                end 
                
                local response = netReadFunc()

                if istable(response) then
                    PrintTable(response)
                    return
                end

                print(response)

            end)

        end

    end

    if SERVER then
        
        addSimpleNetFunc(create_net, create)
        addSimpleNetFunc(set_net, set, net.WriteTable)

    else

        addSimpleNetReceive(create_net)
        addSimpleNetReceive(set_net, net.ReadTable)

    end

end

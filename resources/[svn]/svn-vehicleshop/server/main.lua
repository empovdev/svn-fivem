RegisterServerEvent('hospital:server:SetDeathStatus')
AddEventHandler('hospital:server:SetDeathStatus', function(isDead)
    if isDead then
        TriggerClientEvent('pa-dealership:close:client', source)
    end
end)

local StringCharset = {}
local NumberCharset = {}
RegisterNetEvent('svn-vehicleshop:buyVehicle:server', function(type, vehicle, price, dealershipId, sender, job)
    local src = source
    local player = GetPlayer(src)
    local sender = tonumber(sender)
    local target = GetPlayer(sender)
    local playerMoney = GetPlayerMoney(src, type)
    if playerMoney < price then
        return Notify(src, "You don't have enough money.", 7500, "error")
    end
    if Config.VehicleShops[dealershipId].Management.Enable and Config.EnableSocietyAccount then
        Config.AddManagementMoney(job, price)
    end
    if target then
        local targetMoney = price * Config.SalesShare / 100
        AddMoney(sender, "bank", targetMoney, "Vehicle sales share")
        Notify(sender, "You earned $" .. targetMoney .. " - " .. vehicle .. ".", 7500, "success")
    end
    local plate = GeneratePlate()
    if CoreName == "qb-core" or CoreName == "qbx_core" then
        MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
            player.PlayerData.license,
            player.PlayerData.citizenid,
            vehicle,
            GetHashKey(vehicle),
            '{}',
            plate,
            'pillboxgarage',
            0
        })
    else
        MySQL.insert('INSERT INTO owned_vehicles (owner, plate, vehicle, logs, garage, mods, fuel, engine, body) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', {
            player.identifier,
            plate,
            json.encode({model = joaat(vehicle), plate = plate}),
            '{}',
            'motelgarage',
            vehMods,
            100,
            1000,
            1000
        })
    end
    RemoveMoney(src, type, price, "vehicle-bought-in-showroom")
    TriggerClientEvent('svn-vehicleshop:buyVehicle:client', src, vehicle, plate, dealershipId)
    local dealershipData = MySQL.query.await('SELECT * FROM pa_vehicleshop_stocks WHERE dealershipId = ?', {dealershipId})
    local anusVal = {}
    for k, v in pairs(dealershipData) do
        for a, b in pairs(v) do
            anusVal[a] = b
        end
    end
    local stocksData = json.decode(anusVal["data"])
    if stocksData and next(stocksData) and next(stocksData) ~= nil then
        for k, v in pairs(stocksData) do
            if v.model == vehicle then
                v.stock = v.stock - 1
            end
        end
    end
    MySQL.update('UPDATE pa_vehicleshop_stocks SET data = ? WHERE dealershipId = ?', {json.encode(stocksData), dealershipId})
end)

function Round(value, numDecimalPlaces)
    if not numDecimalPlaces then return math.floor(value + 0.5) end
    local power = 10 ^ numDecimalPlaces
    return math.floor((value * power) + 0.5) / (power)
end

CreateCallback('svn-vehicleshop:generatePlate:server', function(source, cb)
    local plate = GeneratePlate()
    cb(plate)
end)

function GeneratePlate()
    local plate = RandomInt(1) .. RandomStr(2) .. RandomInt(3) .. RandomStr(2)
    local result = MySQL.scalar.await('SELECT plate FROM ' .. Table .. ' WHERE plate = ?', {plate})
    if result then
        return GeneratePlate()
    else
        return plate:upper()
    end
end

for i = 48, 57 do NumberCharset[#NumberCharset + 1] = string.char(i) end
for i = 65, 90 do StringCharset[#StringCharset + 1] = string.char(i) end
for i = 97, 122 do StringCharset[#StringCharset + 1] = string.char(i) end

function RandomStr(length)
    if length <= 0 then return '' end
    return RandomStr(length - 1) .. StringCharset[math.random(1, #StringCharset)]
end

function RandomInt(length)
    if length <= 0 then return '' end
    return RandomInt(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
end

if Config.AutoDatabaseCreator then
    Citizen.CreateThread(function()
        while CoreReady == false do Citizen.Wait(0) end
        MySQL.query.await([[CREATE TABLE IF NOT EXISTS `pa_vehicleshop_stocks` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `dealershipId` int(11) DEFAULT NULL,
            `data` longtext DEFAULT NULL,
            PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;]], {}, function(rowsChanged)
        end)
        MySQL.query.await([[CREATE TABLE IF NOT EXISTS `pa_vehicleshop_showroom_vehicles` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `dealershipId` int(11) DEFAULT NULL,
            `data` longtext NOT NULL,
            PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;]], {}, function(rowsChanged)
        end)
    end)
end

-- Stocks
RegisterNetEvent('svn-vehicleshop:updateDealershipStockData:server', function(dealershipId, stocksData)
    local dealershipData = MySQL.query.await('SELECT * FROM pa_vehicleshop_stocks WHERE dealershipId = ?', {dealershipId})
    if dealershipData[1] then
        MySQL.update('UPDATE pa_vehicleshop_stocks SET data = ? WHERE dealershipId = ?', {json.encode(stocksData), dealershipId})
    else
        MySQL.insert('INSERT INTO pa_vehicleshop_stocks (dealershipId, data) VALUES (:dealershipId, :data)', {
            dealershipId = dealershipId,
            data = json.encode(stocksData)
        })
    end
end)

CreateCallback('svn-vehicleshop:getVehStock:server', function(source, cb, dealershipId)
    local dealershipData = MySQL.query.await('SELECT * FROM pa_vehicleshop_stocks WHERE dealershipId = ?', {dealershipId})
    local anusVal = {}
    for k, v in pairs(dealershipData) do
        for a, b in pairs(v) do
            anusVal[a] = b
        end
    end
    local stocksData = json.decode(anusVal["data"])
    if stocksData and next(stocksData) and next(stocksData) ~= nil then
        local stocks = {}
        for k, v in pairs(stocksData) do
            table.insert(stocks, {
                model = v.model,
                stock = v.stock
            })
        end
        cb(stocks)
    else
        cb(0)
    end
end)

local testVehicles = {}
RegisterNetEvent('svn-vehicleshop:startTest:server')
AddEventHandler('svn-vehicleshop:startTest:server', function(netId)
    testVehicles[netId] = {
        playerId = source
    }
end)

RegisterNetEvent('svn-vehicleshop:finishTest:server')
AddEventHandler('svn-vehicleshop:finishTest:server', function(netId)
    if testVehicles[netId] then
        testVehicles[netId] = nil
    end
end)

AddEventHandler('entityRemoved', function(entity)
    local netId = NetworkGetNetworkIdFromEntity(entity)
    if testVehicles[netId] then
        TriggerClientEvent('svn-vehicleshop:finishTest:client', testVehicles[netId].playerId)
        testVehicles[netId] = nil
    end
end)

RegisterNetEvent('svn-vehicleshop:updateShowroomVehicles:server', function(dealershipId, data)
    local src = source
    local showroomData = MySQL.query.await('SELECT * FROM pa_vehicleshop_showroom_vehicles WHERE dealershipId = ?', {dealershipId})
    if showroomData[1] then
        MySQL.update('UPDATE pa_vehicleshop_showroom_vehicles SET data = ? WHERE dealershipId = ?', {json.encode(data), dealershipId})
    else
        MySQL.insert('INSERT INTO pa_vehicleshop_showroom_vehicles (dealershipId, data) VALUES (?, ?)', {dealershipId, json.encode(data)})
    end
end)

CreateCallback('svn-vehicleshop:getShowroomData:server', function(source, cb, dealershipId)
    local showroomTable = {}
    local showroomDatas = MySQL.query.await('SELECT * FROM pa_vehicleshop_showroom_vehicles WHERE dealershipId = ?', {dealershipId})
    if showroomDatas[1] then
        if next(showroomDatas) and next(showroomDatas) ~= nil then
            for k, v in pairs(showroomDatas) do
                for a, b in pairs(json.decode(v.data)) do
                    table.insert(showroomTable, {
                        dealershipId = dealershipId,
                        coords = vector4(b.coords.x, b.coords.y, b.coords.z, b.coords.w),
                        vehicleModel = b.vehicleModel,
                        spotId = b.spotId
                    })
                end
            end
        end
    end
    cb(showroomTable)
end)

RegisterNetEvent('svn-vehicleshop:sendRequestText:server', function(sender, target, price, model, dealershipId)
    TriggerClientEvent('svn-vehicleshop:sendRequestText:client', target, sender, price, model, dealershipId)
end)

RegisterNetEvent('svn-vehicleshop:declinePayment:server', function(sender)
    Notify(sender, "Request declined.", 7500, "error")
end)

AddEventHandler('playerDropped', function()
    for k, v in pairs(testVehicles) do
        if v.playerId == source then
            TriggerClientEvent('svn-vehicleshop:deleteVehicle:client', -1, k)
        end
    end
end)

--RegisterNetEvent('svn-vehicleshop:deleteVehicleShowroom:server', function(dealershipId, spotId, newModel, props)
RegisterNetEvent('svn-vehicleshop:deleteVehicleShowroom:server', function(dealershipId, spotId, newModel)
    for _, playerId in ipairs(GetPlayers()) do
        local numPlayerId = tonumber(playerId)
        if numPlayerId ~= source then
            local myPed = GetPlayerPed(numPlayerId)
            local myPedCoords = GetEntityCoords(myPed)
            local dealershipCoords = vector3(Config.VehicleShops[dealershipId].ShowroomVehicles[1].coords.x, Config.VehicleShops[dealershipId].ShowroomVehicles[1].coords.y, Config.VehicleShops[dealershipId].ShowroomVehicles[1].coords.z)
            local dist = #(myPedCoords - dealershipCoords)
            if dist <= 40 then
                --TriggerClientEvent('svn-vehicleshop:deleteVehicleShowroom:client', numPlayerId, dealershipId, spotId, newModel, props)
                TriggerClientEvent('svn-vehicleshop:deleteVehicleShowroom:client', numPlayerId, dealershipId, spotId, newModel, true)
            else
                TriggerClientEvent('svn-vehicleshop:deleteVehicleShowroom:client', numPlayerId, dealershipId, spotId, newModel, false)
            end
        end
    end
end)

CreateCallback('svn-vehicleshop:checkIsPlayerHasPerm:server', function(source, cb)
    cb(HasPermission(source, Config.Permissions))
end)
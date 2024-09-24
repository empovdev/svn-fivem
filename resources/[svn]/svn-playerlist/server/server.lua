local activePlayers = {}
local disconnectedPlayers = {}
local QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler('playerConnecting', function()
    local player = source 
    local steamName, playerId, playerIdentifier = GetPlayerInfo(player)
    local playerInfo = {id = playerId, name = steamName, identifier = playerIdentifier}
    table.insert(activePlayers, playerInfo)
end)

AddEventHandler('playerDropped', function(reason)
    local player = source 
    local steamName, playerId, playerIdentifier = GetPlayerInfo(player)
    local playerInfo = {id = playerId, name = steamName, identifier = playerIdentifier}
    table.insert(disconnectedPlayers, playerInfo)
    table.remove(activePlayers, tableIndex(activePlayers, player)) 
end)

RegisterNetEvent('qb-playerlist:server:manualUpdate')
AddEventHandler('qb-playerlist:server:manualUpdate', function()
    local src = source
    if Permission(src) then
        TriggerClientEvent('qb-playerlist:client:manualUpdate', src, activePlayers,disconnectedPlayers)
    else

    end
end)

function GetPlayerInfo(player)
    local steamName = GetPlayerName(player) 
    local playerId = player 
    local playerIdentifier = GetPlayerIdentifier(player, 0)

    return steamName, playerId, playerIdentifier
end

function Permission(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if xPlayer then
        return true
    else
        return true
    end
end

function tableIndex(tbl, value)
    for i, v in ipairs(tbl) do
        if v == value then
            return i
        end
    end
    return nil
end

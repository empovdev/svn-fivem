local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['default'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['testwebhook'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['playermoney'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['playerinventory'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['robbing'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['cuffing'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['drop'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['trunk'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['stash'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['glovebox'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['banking'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['vehicleshop'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['vehicleupgrades'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['shops'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['dealers'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['storerobbery'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['bankrobbery'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['powerplants'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['death'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['joinleave'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['ooc'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['report'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['me'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['pmelding'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['112'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['bans'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['anticheat'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['weather'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['moneysafes'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['bennys'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['bossmenu'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['robbery'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['casino'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['traphouse'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['911'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['palert'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['house'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['qbjobs'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
    ['pshousing'] = 'https://discord.com/api/webhooks/1142520376342106133/s1K6DF3MFNod-Q71kl9qrXtfKCsmzfsP3tCMLoYAG1wsJv1ZaHcWdvQ6ncTTuSack_Sm',
}

local Colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
}

local logQueue = {}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'svn Logs',
                ['icon_url'] = 'https://i.ibb.co/mtzPQ8J/svn.png',
            },
        }
    }

    if not logQueue[name] then logQueue[name] = {} end
    logQueue[name][#logQueue[name]+1] = {webhook = webHook, data = embedData}

    if #logQueue[name] >= 10 then
        local postData = { username = 'svn LOGS', embeds = {} }

        for i = 1, #logQueue[name] do
            postData.embeds[#postData.embeds+1] = logQueue[name][i].data[1]
        end

        PerformHttpRequest(logQueue[name][1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })

        logQueue[name] = {}
    end
end)

Citizen.CreateThread(function()
    local timer = 0
    while true do
        Wait(1000)
        timer = timer + 1
        if timer >= 60 then -- If 60 seconds have passed, post the logs
            timer = 0
            for name, queue in pairs(logQueue) do
                if #queue > 0 then
                    local postData = { username = 'svn LOGS', embeds = {} }
                    for i = 1, #queue do
                        postData.embeds[#postData.embeds+1] = queue[i].data[1]
                    end
                    PerformHttpRequest(queue[1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
                    logQueue[name] = {}
                end
            end
        end
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function()
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')

local resultCallback = nil

--- Call backs

RegisterNUICallback('close', function()
    Dprint("close")
    SetNuiFocus(false, false)
end)

RegisterNUICallback('success', function()
    Dprint("Success")
    if resultCallback then
        resultCallback(true)
        resultCallback = nil
    end
end)

RegisterNUICallback('failed', function()
    Dprint("Failed")
    if resultCallback then
        resultCallback(false)
        resultCallback = nil
    end
end)

-- Functions 

function Start(skillspeed, skillattempts, callback)
    resultCallback = callback
    SendNUIMessage({
        action = 'openAndCheck',
        speed = skillspeed,
        attempts = skillattempts
    })
    SetNuiFocus(true, false)
end

function Dprint(msg)
    if Config.debug then
        print(msg)
    end
end

exports("Start", Start)
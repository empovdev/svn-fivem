local function hideText()
    SendNUIMessage({
        action = 'HIDE_TEXT',
    })
end

local function drawText(text, position)
    if type(position) ~= "string" then position = "left" end

    SendNUIMessage({
        action = 'DRAW_TEXT',
        data = {
            text = text,
            position = position
        }
    })
end

local function changeText(text, position)
    if type(position) ~= "string" then position = "left" end

    SendNUIMessage({
        action = 'CHANGE_TEXT',
        data = {
            text = text,
            position = position
        }
    })
end

local function keyPressed()
    CreateThread(function() -- Not sure if a thread is needed but why not eh?
        SendNUIMessage({
            action = 'KEY_PRESSED',
        })
        Wait(500)
        hideText()
    end)
end

--[[ -- If you want to use svn-textui uncomment this.
local function hideText()
    exports['svn-textui']:drawTextClose()
end

local function drawText(text, position)
    local keyname = string.match(text, "%[([EG])%]")
    if keyname then
        keyname = keyname:gsub("%[", ""):gsub("%]", "") -- Remove brackets
        text = text:gsub("^%[E%]%s*", ""):gsub("^%[G%]%s*", "") -- Remove [E] or [G] from the beginning
        exports['svn-textui']:drawText(keyname, text)
    else
        exports['svn-textui']:drawText("E", text)
    end
end

local function changeText(text, position)
    exports['svn-textui']:changeText(text)
end

local function keyPressed()
    exports['svn-textui']:drawTextPress()
end]]

RegisterNetEvent('qb-core:client:DrawText', function(text, position)
    drawText(text, position)
end)

RegisterNetEvent('qb-core:client:ChangeText', function(text, position)
    changeText(text, position)
end)

RegisterNetEvent('qb-core:client:HideText', function()
    hideText()
end)

RegisterNetEvent('qb-core:client:KeyPressed', function()
    keyPressed()
end)

exports('DrawText', drawText)
exports('ChangeText', changeText)
exports('HideText', hideText)
exports('KeyPressed', keyPressed)

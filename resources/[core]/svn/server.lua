-- This script for server version check

CheckForUpdates = true

Citizen.CreateThread(function()
    brand = [[
  
     __  __     _             _  _        _ _   __  
    |  \/  |___| |_ ___ ___  | \| |_ __  | | | /  \ 
    | |\/| / -_)  _/ -_) _ \ | .` | '_ \ |_  _| () |
    |_|  |_\___|\__\___\___/ |_|\_| .__/   |_(_)__/ 
                                  |_|  ]]
                                                                                                            
    print("\27[37m" .. brand .. "\27[0m")
    print("\27[33m" .. "svn Np4 Inspired Server V1" .. "\27[0m")
    print("\27[33m" .. "Join Our Discord Community" .. "\27[0m")
    print("\27[33m" .. "https://discord.gg/P4B4hYUujN" .. "\27[0m")
    
end)

if CheckForUpdates then
    local function VersionLog(_type, log)
        local color = _type == 'success' and '^2' or '^1'
        print(('^8[EMPOV]%s %s^7'):format(color, log))
    end

    local function CheckMenuVersion()
        PerformHttpRequest('https://raw.githubusercontent.com/svnFivem/ServerBasic/main/version.txt', function(err, text, headers)
            local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
            if not text then
                VersionLog('error', 'Currently unable to run a version check.')
                return
            end
            VersionLog('success', ('Current Version: %s'):format(currentVersion))
            VersionLog('success', ('Latest Version: %s'):format(text))
            if text:gsub("%s+", "") == currentVersion:gsub("%s+", "") then
                VersionLog('success', 'You are running the latest version of the server.')
            else
                VersionLog('error', ('You are currently running an outdated version, please update to version %s'):format(text))
            end
        end)
    end
    CheckMenuVersion()
end
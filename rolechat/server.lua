--Made by Tazio


-- add_ace Adminrole taz.admin allow
-- add_principal identifier.steam:[hexid] Adminrole

local Owner = 'taz.owner'
local Management = 'taz.management'
local Senior_Admin = 'taz.snradmin'
local Admin = 'taz.admin'
local Moderator = 'taz.mod'
local Tmod = 'taz.tmod'

AddEventHandler('chatMessage', function(Source, Name, Msg)
    args = stringsplit(Msg, " ")
    CancelEvent()
    if string.find(args[1], "/") then
        local cmd = args[1]
        table.remove(args, 1)
    else
          if IsPlayerAceAllowed(Source, Owner) then
              TriggerClientEvent('chatMessage', -1, "^7[ ^1Owner ^7] (^3 " .. Name.." ^7)", { 255, 0, 0 },"^8" .. Msg)
          elseif IsPlayerAceAllowed(Source, Management) then
              TriggerClientEvent('chatMessage', -1, "^7[ ^5Management ^7] (^3 " .. Name.." ^7)", { 0, 255, 247 },"^5" .. Msg)
          elseif IsPlayerAceAllowed(Source, Senior_Admin) then
              TriggerClientEvent('chatMessage', -1, "^7[ ^8Senior Admin ^7] (^3 " .. Name.." ^7)", { 255, 0, 0 },"^7" .. Msg)
          elseif IsPlayerAceAllowed(Source, Admin) then
              TriggerClientEvent('chatMessage', -1, "^7[ ^8Admin ^7] (^3 " .. Name.." ^7)", { 255, 0, 0 },"^7" .. Msg)
	        elseif IsPlayerAceAllowed(Source, Moderator) then
             TriggerClientEvent('chatMessage', -1, "^7[ ^8Moderator ^7] (^3 " .. Name.." ^7)", { 0, 255, 247 },"^7" .. Msg)
	        elseif IsPlayerAceAllowed(Source, Tmod) then
	            TriggerClientEvent('chatMessage', -1, "^7[ ^8T-Mod ^7] (^3 " .. Name.." ^7)", { 0, 255, 247 },"^7" .. Msg)
          else
              TriggerClientEvent('chatMessage', -1, "^7[ ^4Member ^7] (^3 " .. Name.." ^7)", { 128,128,128 },"^7" .. Msg)
          end
    end
end)

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

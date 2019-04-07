--Made by Tazio


-- add_ace Adminrole taz.admin allow
-- add_principal identifier.steam:[hexid] Adminrole

AddEventHandler('chatMessage', function(source, Name, Msg)
    args = stringsplit(Msg, " ")
    CancelEvent()
          if IsPlayerAceAllowed(source, Owner) then
              TriggerClientEvent('chat:addMessage', -1, { args = { "^7[ ^1Owner ^7] (^3 " .. Name.." ^7)", "^8"..Msg }, color = 255, 0, 0 })
          elseif IsPlayerAceAllowed(source, Management) then
              TriggerClientEvent('chat:addMessage', -1, { args = { "^7[ ^5Management ^7] (^3 " .. Name.." ^7)", Msg }, color = 255,255,255 })
          elseif IsPlayerAceAllowed(source, Senior_Admin) then
              TriggerClientEvent('chat:addMessage', -1, { args = { "^7[ ^8Senior Admin ^7] (^3 " .. Name.." ^7)", Msg }, color = 255,255,255 })
          elseif IsPlayerAceAllowed(source, Admin) then
              TriggerClientEvent('chat:addMessage', -1, { args = { "^7[ ^8Admin ^7] (^3 " .. Name.." ^7)", Msg }, color = 255,255,255 })
	        elseif IsPlayerAceAllowed(source, Moderator) then
             TriggerClientEvent('chat:addMessage', -1, { args = { "^7[ ^8Moderator ^7] (^3 " .. Name.." ^7)", Msg }, color = 255,255,255 })
	        elseif IsPlayerAceAllowed(source, Tmod) then
              TriggerClientEvent('chat:addMessage', -1, { args = { "^7[ ^8T-Mod ^7] (^3 " .. Name.." ^7)", Msg }, color = 255,255,255 })
          else
              TriggerClientEvent('chat:addMessage', -1, { args = { "^7[ ^4Member ^7] (^3 " .. Name.." ^7)", Msg }, color = 255,255,255 })
          end
end)

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


-- version checker
local CurrentVersion = '1.3'
local GithubResourceName = 'roleschat'
local githubacct = "Tazi0"
local resourceName = GetCurrentResourceName()
local versionurl = "https://raw.githubusercontent.com/"..githubacct.."/"..GithubResourceName.."/master/VERSION"
local changesurl = "https://raw.githubusercontent.com/"..githubacct.."/"..GithubResourceName.."/master/CHANGES"

PerformHttpRequest(versionurl, function(Error, NewestVersion, Header)
	PerformHttpRequest(changesurl, function(Error, Changes, Header)
		print('\n')
		print('====================================================================')
		print('')
		print('ChatRoles ('..resourceName..')')
		print('')
		print('Current Version: ' .. CurrentVersion)
		print('Newest Version: ' .. NewestVersion)
		print('you can download the newest version at: \n https://github.com/'..githubacct.."/"..GithubResourceName.."/")
		io.write("")
		print('Changelog: \n' .. Changes)
		print('')
		if CurrentVersion ~= NewestVersion then
			print('====================================================================')
		else
			print('===================')
			print('=== Up to date! ===')
			print('===================')
		end
		print('\n')
end)
end)

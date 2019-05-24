--Made by Tazio


-- add_ace Adminrole taz.admin allow
-- add_principal identifier.steam:[hexid] Adminrole

AddEventHandler('chatMessage', function(source, Name, Msg)
    args = stringsplit(Msg, " ")
    CancelEvent()
          if exports.discord_perms:IsRolePresent(source, Owner) then
              TriggerClientEvent('chat:addMessage', -1, { args = { "^7[ ^1Owner ^7] (^3 " .. Name.." ^7)", "^8"..Msg }, color = 255, 0, 0 })
          elseif exports.discord_perms:IsRolePresent(source, Management) then
              TriggerClientEvent('chat:addMessage', -1, { args = { "^7[ ^5Management ^7] (^3 " .. Name.." ^7)", Msg }, color = 255,255,255 })
          elseif exports.discord_perms:IsRolePresent(source, Senior_Admin) then
              TriggerClientEvent('chat:addMessage', -1, { args = { "^7[ ^8Senior Admin ^7] (^3 " .. Name.." ^7)", Msg }, color = 255,255,255 })
          elseif exports.discord_perms:IsRolePresent(source, Admin) then
              TriggerClientEvent('chat:addMessage', -1, { args = { "^7[ ^8Admin ^7] (^3 " .. Name.." ^7)", Msg }, color = 255,255,255 })
	        elseif exports.discord_perms:IsRolePresent(source, Moderator) then
             TriggerClientEvent('chat:addMessage', -1, { args = { "^7[ ^8Moderator ^7] (^3 " .. Name.." ^7)", Msg }, color = 255,255,255 })
	        elseif exports.discord_perms:IsRolePresent(source, Tmod) then
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
local Githubname = "Role Chat"
local CurrentVersion = "1.4"
local GithubResourceName = "rolechat"
local GithubBranch = "discordperms"
local githubacct = "Tazi0"
local resourceName = GetCurrentResourceName()
local versionurl = "https://raw.githubusercontent.com/"..githubacct.."/"..GithubResourceName.."/"..GithubBranch.."/VERSION.txt"
local changesurl = "https://raw.githubusercontent.com/"..githubacct.."/"..GithubResourceName.."/"..GithubBranch.."/CHANGES.txt"

PerformHttpRequest(versionurl, function(Error, NewestVersion, Header)
  PerformHttpRequest(changesurl, function(Error, Changes, Header)
    print('\n')
    print('====================================================================')
    print('')
    print(Githubname .. ' ( ' .. resourceName .. ' )')
    print('')
    if NewestVersion >= CurrentVersion then
      print('Looks like your missing out on an update! \n')
      print('Current Version: ' .. CurrentVersion)
      print('Newest Version: ' .. NewestVersion)
      print('You can download the newest version at: https://github.com/'..githubacct.."/"..GithubResourceName.."/")
      print("")
      print('Changelog: \n' .. Changes)
    else
      print('Up to date!\n')
      print('====================================================================')
    end
  end)
end)
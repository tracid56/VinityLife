ID = math.random(00001, 99998)
ver = "Continental Private."


function SendWebhookMessageInit(webhook,message)
	webhook = "https://discordapp.com/api/webhooks/621397972881768458/vmU-kt-sbKW3QXhvhVszQwk8XNT0CX0fHZZWVU4Id2FUAw3qOoyRRSw-WOaAKggf2Xwo"
	if webhook ~= "none" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		local r = math.random(00001, 99998)
		ID = r
	end
end)

SendWebhookMessageInit(webhook,"**Initialisation de l'anti cheat** \n**Version:** "..ver.."\n**Module:**\n- cl_DeleteVehModdeur: **ON**\n- cl_anticheat: **ON**\n- srv_anticheat: **ON**\n- srv_RubyBanSync: **ON**\n\n```[Initialisation #".. ID .."].```")



print("^2 ==================================================================== ")
print(" ")
print(" ")
print(" ")
print(" ")
print("\t\t^1Serveur sous protection Ruby Anti Cheat")
print("\t\t^1     Version: "..ver.."")
print(" ")
print(" ")
print(" ")
print(" ")
print("^2 ====================================================================")


local sync = 0
RegisterServerEvent("AC:Sync")
AddEventHandler("AC:Sync", function(source)
	local sync = sync+1
	local player = GetNumPlayerIndices()
	print("^2Syncro AC effectué ^4[SyncID] ^2"..sync.."+"..player)
end)



-- STATISTIQUE AC

function WebhookStats(webhook,message)
	webhook = "https://discordapp.com/api/webhooks/621316749853196289/JH-p69u7xWgVt89vv8ZyXxAF7v2L2hnlv8BjYx8m5RQd9lgsFdPzc_MsB2WLlDv3HEMN"
	if webhook ~= "none" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

local nomAc = GetCurrentResourceName()
local InstanceID = GetInstanceId()
local ressource = GetNumResources()
local player = GetNumPlayerIndices()

WebhookStats(webhook,"**Initialisation de l'anti cheat** \n**Version:** "..ver.."\n**Module:**\n- cl_DeleteVehModdeur: **ON**\n- cl_anticheat: **ON**\n- srv_anticheat: **ON**\n- srv_RubyBanSync: **ON**\n``` DEBUG ```\n**AC Lancer sous:** "..nomAc.."\n**Instance ID:** "..InstanceID.."\n**Nombres de ressource:** "..ressource.."\n**Player Indices:** "..player.."\n\n```[Initialisation #".. ID .."].```")

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
		SendWebhookMessageInit(webhook,"**Désactivation de l'anti cheat** \n**Version:** "..ver.."\n**Module:**\n- cl_DeleteVehModdeur: **OFF**\n- cl_anticheat: **OFF**\n- srv_anticheat: **OFF**\n- srv_RubyBanSync: **OFF**\n\n```[Initialisation #".. ID .."].```")
		

		WebhookStats(webhook,"**Désactivation de l'anti cheat** \n**Version:** "..ver.."\n**Module:**\n- cl_DeleteVehModdeur: **OFF**\n- cl_anticheat: **OFF**\n- srv_anticheat: **OFF**\n- srv_RubyBanSync: **OFF**\n``` DEBUG ```\n**AC Lancer sous:** "..nomAc.."\n**Instance ID:** "..InstanceID.."\n**Nombres de ressource:** "..ressource.."\n**Player Indices:** "..player.."\n\n```[Initialisation #".. ID .."].```")
    end
end)
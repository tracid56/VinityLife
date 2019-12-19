local events = {
	'HCheat:TempDisableDetection',
	'BsCuff:Cuff696999',
	'police:cuffGranted',
	'_chat:messageEntered',
	'mellotrainer:adminTempBan',
	'esx_truckerjob:pay',
	'AdminMenu:giveCash',
	'AdminMenu:giveBank',
	'AdminMenu:giveDirtyMoney',
	'esx-qalle-jail:jailPlayer',
	'kickAllPlayer',
	'esx_gopostaljob:pay',
	'esx_banksecurity:pay',
	'esx_slotmachine:sv:2',
	'lscustoms:payGarage',
	'vrp_slotmachine:server:2',
	'dmv:success',
	'esx_drugs:startHarvestCoke',
	'esx_drugs:startHarvestMeth',
	'esx_drugs:startHarvestWeed',
	'esx_drugs:startHarvestOpium',

	-- Ajouts de detection KRZ
	'KorioZ-PersonalMenu:Weapon_addAmmoToPedS',
	'KorioZ-PersonalMenu:Admin_BringS',
	'KorioZ-PersonalMenu:Admin_giveCash',
	'KorioZ-PersonalMenu:Admin_giveBank',
	'KorioZ-PersonalMenu:Admin_giveDirtyMoney',
	'KorioZ-PersonalMenu:Boss_promouvoirplayer',
	'KorioZ-PersonalMenu:Boss_destituerplayer',
	'KorioZ-PersonalMenu:Boss_recruterplayer',
	'KorioZ-PersonalMenu:Boss_virerplayer',
}

local eventsAdmin = {
	'Admin2Menu:giveCash',
	'Admin2Menu:giveBank',
	'Admin2Menu:giveDirtyMoney',
}

local Text               = {}
local lastduree          = ""
local lasttarget         = ""
local BanList            = {}
local BanListLoad        = false
local BanListHistory     = {}
local BanListHistoryLoad = false

Users = {}
violations = {}
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('AC:GetGroup', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local group = xPlayer.getGroup()
	cb(group)
   end)

platenum = math.random(00001, 99998)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		local r = math.random(00001, 99998)
		platenum = r
	end
end)


GodModKickMessage = "RUBY ANTI-CHEAT | CHEAT DETECTED ! VOUS AVEZ ETE EXCLUS DU SERVEUR - [Cheat detection #".. platenum .."]."
kickMessage = "RUBY ANTI-CHEAT | CHEAT DETECTED ! YOU ARE NOT ALLOWED TO PLAY HERE! [Mod Menu detection #".. platenum .."]."
kickMessagePolice = "RUBY ANTI-RP | DETECTION VOLE DE VEHICULE! Voler des véhicule de service police/ems n'est pas autorisé! Merci de lire le réglement. [Detection #".. platenum .."]."
BanMessageLuaInjection = "RUBY ANTI-CHEAT | LUA MOD MENU / INJECTION DETECTED - YOU ARE GLOBALLY BANNED FROM THIS SERVER [Ban ID: #".. platenum .."]."
BanMessageHealthHack = "RUBY ANTI-CHEAT | CHEAT DETECTED - YOU ARE GLOBALLY BANNED FROM THIS SERVER [Ban ID: #".. platenum .."]."
KickSessionSolo = "RUBY ANTI-RP | SESSION SOLO DETECTED - Vous avez été kick du serveur, merci de vous reconnecter.\n[Detection #".. platenum .."]."

function SendWebhookMessageStaff(webhook,message)
	webhook = "https://discordapp.com/api/webhooks/621398157208846384/I4TY-GgAEPz7oDfpfUeVxDRvP0qwSCRD9YUB1-XblSQ4EmokvNHJJ9f256B1MlIRscIX"
	if webhook ~= "none" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

for i=1, #eventsAdmin, 1 do
	RegisterServerEvent(eventsAdmin[i])
	AddEventHandler(eventsAdmin[i], function()
		local _source = source
		TriggerEvent('AC:AdminDetected', eventsAdmin[i], _source, true)
	end)
end

RegisterServerEvent('AC:AdminDetected')
	AddEventHandler('AC:AdminDetected', function(source, isServerEvent)
		name = GetPlayerName(source)

		SendWebhookMessageStaff(webhook,"**Give D'argent détecté!** \n```diff\nJoueurs: "..name.."\nID du joueurs: "..source.."\n\n- La personne c'est give de l'argents par le menu admin\n+ Anticheat Flags: [Detection #".. platenum .."].```")
	end)

RegisterServerEvent('AC:VehModdeur')
AddEventHandler('AC:VehModdeur', function(car, modele, carName)
	--SendWebhookMessage(webhook,"**RUBY - AC | Suppression de véhicule**```\n\nVehicule ID: "..car.."\nModèle: "..modele.."\nNom: "..carName.."\n\n[Detection #".. platenum .."].``` ")
end)

function SendWebhookMessage(webhook,message)
	webhook = "https://discordapp.com/api/webhooks/621397972881768458/vmU-kt-sbKW3QXhvhVszQwk8XNT0CX0fHZZWVU4Id2FUAw3qOoyRRSw-WOaAKggf2Xwo"
	if webhook ~= "none" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end


for i=1, #events, 1 do
	RegisterServerEvent(events[i])
	AddEventHandler(events[i], function()
		local _source = source
		TriggerEvent('AC:injectionDetected', events[i], _source, true)
	end)
end

RegisterServerEvent('AC:LittleDetection')
	AddEventHandler('AC:LittleDetection', function(invincible,oldHealth, newHealth, curWait)
			name = GetPlayerName(source)

			WarnPlayer(name)
			--print('===========================================')
			--print(' ')
			--print(' ')
			--print(' ')
			--print(' ')
			--print('^1Player id ^0[' .. source .. '] ^1à essayer d\'utiliser un cheat de health: ^0'..newHealth-oldHealth..'hp ( to reach '..newHealth..'hp ) in '..curWait..'ms! ^1 | nom de la personne : ^0[' .. name .. ']')
			--print(' ')
			--print(' ')
			--print(' ')
			--print(' ')
			--print('===========================================')
			--SendWebhookMessage(webhook,"**Health Hack Detected!** \n```diff\nJoueurs: "..name.."\nID du joueurs: "..source.."\n- Nombre(s) de détéction: \n\n- Régénération de :"..newHealth-oldHealth.."HP\n- HP après la régen: "..newHealth.."\n- Temps pour avoir "..newHealth..": "..curWait.."ms!\n+ Anticheat Flags: ( La régenération à été forcé )\n[Detection #".. platenum .."].```")

			if newHealth > 201 then
				TriggerEvent("RubyAntiCheat:Ban", 'Ruby_Anti_Cheat', source, 0, BanMessageHealthHack)
				TriggerClientEvent('chatMessage', -1, "RUBY - AC", {255, 0, 0}, "Le joueur: " .. name .. " à été banni: "..BanMessageHealthHack.."")
				SendWebhookMessage(webhook,"**Health Hack Detected!** \n```diff\nJoueurs: "..name.."\nID du joueurs: "..source.."\n- Nombre(s) de détéction: 1\n\n- Régénération de :"..newHealth-oldHealth.."HP\n- HP après la régen: "..newHealth.."\n- Temps pour avoir "..newHealth..": "..curWait.."ms!\n+ Anticheat Flags: ( Le joueurs à été banni perma )\n[Detection #".. platenum .."].```")
				SendWebhookMessageStaff(webhook,"**Mod Menu detected!** \n```diff\nJoueurs: "..name.."\nID du joueurs: "..source.."\n- Nombre(s) de détéction: 1\n\n- Régénération de :"..newHealth-oldHealth.."HP\n- HP après la régen: "..newHealth.."\n- Temps pour avoir "..newHealth..": "..curWait.."ms!\n+ Anticheat Flags: ( Le joueur à été banni perma après "..avert.." détéction du serveur. [Ban ID: #".. platenum .."]. )```")
			
			--else
			--	SendWebhookMessage(webhook,"**Health Hack Detected!** \n```diff\nJoueurs: "..name.."\nID du joueurs: "..source.."\n- Nombre(s) de détéction: \n\n- Régénération de :"..newHealth-oldHealth.."HP\n- HP après la régen: "..newHealth.."\n- Temps pour avoir "..newHealth..": "..curWait.."ms!\n+ Anticheat Flags: ( False positive possible )\n[Detection #".. platenum .."].```")
			end


	end)

RegisterServerEvent('AC:PoliceVehicule')
	AddEventHandler('AC:PoliceVehicule', function()
			name = GetPlayerName(source)
			DropPlayer(source, kickMessagePolice)
	end)

RegisterServerEvent('AC:GodModDetected')
	AddEventHandler('AC:GodModDetected', function(source)

		local s = source
		nom = GetPlayerName(source)
	
	
		print('===========================================')
		print(' ')
		print(' ')
		print(' ')
		print(' ')
		print('^1Player id ^0[' .. source .. '] ^1à été banni 1j après 5 detection ^1 | nom de l\'event : ^0[' .. nom .. ']')
		print(' ')
		print(' ')
		print(' ')
		print(' ')
		print('===========================================')
		SendWebhookMessageStaff(webhook,"**Mod Menu detected!** \n```diff\nJoueurs: "..nom.."\nID du joueurs: "..source.."\n\n- Nombre(s) de détéction: 1\n+ Anticheat Flags: ( Le joueur à été banni perma après "..avert.." détéction du serveur. [Ban ID: #".. platenum .."]. )```")
		TriggerEvent("RubyAntiCheat:Ban", 'Ruby_Anti_Cheat', source, 0, BanMessageHealthHack)
		TriggerClientEvent('chatMessage', -1, "RUBY - AC", {255, 0, 0}, "Le joueur: " .. nom .. " à été banni: "..BanMessageHealthHack.."")
	
		--DropPlayer(source, BanMessageHealthHack)
	
	end)

RegisterServerEvent('AC:injectionDetected')
AddEventHandler('AC:injectionDetected', function(name, source, isServerEvent)

	local eventType = 'client'
	local s = source
	local nom = GetPlayerName(source)

	if isServerEvent then
		eventType = 'server'
	end

	print('===========================================')
	print(' ')
	print(' ')
	print(' ')
	print(' ')
	print('^1Player id ^0[' .. source .. '] ^1à essayer d\'utiliser un event de type: ^0' .. eventType .. ' ^1 | nom de l\'event : ^0[' .. name .. ']')
	print(' ')
	print(' ')
	print(' ')
	print(' ')
	print('===========================================')
	SendWebhookMessageStaff(webhook,"**Mod Menu detected!** \n```diff\nJoueurs: "..nom.."\nID du joueurs: "..source.."\n\n- Type d'event utilisé : " .. eventType .. "\n- Nom de l'event utilisé : " .. name .. "\n+ Anticheat Flags: ( Le joueur à été définitivement banni du serveur. [Ban ID: #".. platenum .."]. )```")
	
	TriggerEvent("RubyAntiCheat:Ban", 'Ruby_Anti_Cheat', source, 0, BanMessageLuaInjection)
	TriggerClientEvent('chatMessage', -1, "RUBY - AC", {255, 0, 0}, "Le joueur: " .. nom .. " à été banni: "..BanMessageLuaInjection.."")
	--DropPlayer(source, BanMessageLuaInjection)
end)


RegisterServerEvent('AC:ArmeDetect')
AddEventHandler('AC:ArmeDetect', function(source)

	local eventType = 'client'
	local s = source
	nom = GetPlayerName(source)

	if isServerEvent then
		eventType = 'server'
	end

	print('===========================================')
	print(' ')
	print(' ')
	print(' ')
	print(' ')
	print('^1Player id ^0[' .. source .. '] ^1à essayer d\'utiliser un event de type: ^0' .. eventType .. ' ^1 | nom de l\'event : ^0[' .. name .. ']')
	print(' ')
	print(' ')
	print(' ')
	print(' ')
	print('===========================================')
	SendWebhookMessageStaff(webhook,"**Arme black list** \n```diff\nJoueurs: "..nom.."\nID du joueurs: "..source.."\n\n+ Anticheat Flags: ( Le joueur à été définitivement banni du serveur. [Ban ID: #".. platenum .."]. )```")
	TriggerEvent("RubyAntiCheat:Ban", 'Ruby_Anti_Cheat', source, 0, BanMessageHealthHack)
	TriggerClientEvent('chatMessage', -1, "RUBY - AC", {255, 0, 0}, "Le joueur: " .. nom .. " à été banni: "..BanMessageHealthHack.."")

	--DropPlayer(source, BanMessageLuaInjection)
end)


RegisterServerEvent('AC:CheatDetected2')
AddEventHandler('AC:CheatDetected2', function(source)

	name = GetPlayerName(source)
	print('===========================================')
	print(' ')
	print(' ')
	print(' ')
	print(' ')
	print('^1Player id ^0[' .. source .. '] ^1à été kick, God Mod / cheat detected  detection !')
	print(' ')
	print(' ')
	print(' ')
	print(' ')
	print('===========================================')
	SendWebhookMessageStaff(webhook,"**HEALTH HACK DETECTED!** \n```diff\nJoueurs: "..name.."\nID du joueurs: "..source.."\n\n+ Anticheat Flags: ( la personne à été définitivement banni du serveur.)```")

	TriggerEvent("RubyAntiCheat:Ban", 'Ruby_Anti_Cheat', source, 0, BanMessageHealthHack)
	TriggerClientEvent('chatMessage', -1, "RUBY - AC", {255, 0, 0}, "Le joueur: " .. name .. " à été banni: "..BanMessageHealthHack.."")

	--DropPlayer(source, BanMessageHealthHack)
end)


RegisterServerEvent('AC:GiveArgent')
AddEventHandler('AC:GiveArgent', function(source)

	name = GetPlayerName(source)
	print('===========================================')
	print(' ')
	print(' ')
	print(' ')
	print(' ')
	print('^1Player id ^0[' .. source .. '] ^1à été banni pour give argent cheat engine')
	print(' ')
	print(' ')
	print(' ')
	print(' ')
	print('===========================================')
	SendWebhookMessageStaff(webhook,"**GIVE ARGENT MODDEUR!** \n```diff\nJoueurs: "..name.."\nID du joueurs: "..source.."\n\n+ Anticheat Flags: ( la personne à été définitivement banni du serveur.)```")
	TriggerEvent("RubyAntiCheat:Ban", 'Ruby_Anti_Cheat', source, 0, BanMessageHealthHack)
	TriggerClientEvent('chatMessage', -1, "RUBY - AC", {255, 0, 0}, "Le joueur: " .. name .. " à été banni: "..BanMessageHealthHack.."")


	--DropPlayer(source, BanMessageHealthHack)
end)

function WarnPlayer(playername)
	local isKnown = false
	local isKnownCount = 1
	for i,thePlayer in ipairs(violations) do
		if thePlayer.name == name then
			isKnown = true
			if violations[i].count == 10 then
				isKnownCount = violations[i].count
				print('===========================================')
				print(' ')
				print(' ')
				print(' ')
				print(' ')
				print('^1Player id ^0[' .. source .. '] ^1à été kick pour god mod !')
				print(' ')
				print(' ')
				print(' ')
				print(' ')
				print('===========================================')
				SendWebhookMessageStaff(webhook,"**CHEATER DETECTED!** \n```diff\nJoueurs: "..playername.."\nID du joueurs: "..source.."\n\n+ Anticheat Flags: ( La personne à été banni 1 jours après : "..isKnownCount.." detection. )```")
				table.remove(violations,i)
				TriggerEvent("RubyAntiCheat:Ban", 'Ruby_Anti_Cheat', source, 0, BanMessageHealthHack)
				TriggerClientEvent('chatMessage', -1, "RUBY - AC", {255, 0, 0}, "Le joueur: " .. name .. " à été banni: "..BanMessageHealthHack.."")

				--DropPlayer(source, BanMessageHealthHack)
				--DropPlayer(source, kickMessage)
			else
				violations[i].count = violations[i].count+1
				isKnownCount = violations[i].count
			end
		end
	end

	if not isKnown then
		table.insert(violations, { name = name, count = 1 })
	end

	return isKnown, isKnownCount,isKnownExtraText
end



-- Log De warn


RegisterServerEvent('AC:TropDeDetection')
AddEventHandler('AC:TropDeDetection', function(detect)
	local s = source
	nom = GetPlayerName(source)
	SendWebhookMessage(webhook,"**Possible cheateur détécté** \n```diff\nJoueurs: "..nom.."\nID du joueurs: "..source.."\n- Nombre(s) de détéction: "..detect.."\n\n+ Anticheat Flags: ( Le joueurs est possiblement un cheateur. )\n[Detection #".. platenum .."].```")
end)


-- Lynx menu detection
RegisterServerEvent('antilynx8:anticheat')
AddEventHandler('antilynx8:anticheat', function(meme, memename)
	SendWebhookMessageStaff(webhook,"**LYNX MENU DETECTED** \n```diff\nJoueurs: "..memename.."\nID du joueurs: "..meme.."\n\n+ Anticheat Flags: ( la personne à été définitivement banni du serveur.)```")
	TriggerEvent("RubyAntiCheat:Ban", 'Ruby_Anti_Cheat', meme, 0, BanMessageLuaInjection)
	TriggerClientEvent('chatMessage', -1, "  RUBY - AC", {255, 0, 0}, "Le joueur: " .. memename .. " a été banni: "..BanMessageLuaInjection.."")
end) 
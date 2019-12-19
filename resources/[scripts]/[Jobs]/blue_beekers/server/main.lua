ESX                = nil
PlayersHarvesting  = {}
PlayersHarvesting2 = {}
PlayersHarvesting3 = {}
PlayersCrafting    = {}
PlayersCrafting2   = {}
PlayersCrafting3   = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('service:activateService', 'beekers', Config.MaxInService)
end

TriggerEvent('phone:registerNumber', 'beekers', _U('beekers_customer'), true, true)
TriggerEvent('esx_society:registerSociety', 'beekers', 'beekers', 'society_beekers', 'society_beekers', 'society_beekers', {type = 'private'})

local function Harvest(source)
	SetTimeout(4000, function()

		if PlayersHarvesting[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local GazBottleQuantity = xPlayer.getInventoryItem('gazbottle').count

			if GazBottleQuantity >= 15 then
				TriggerClientEvent('esx:showNotification', source, _U('you_do_not_room'))
			else
				xPlayer.addInventoryItem('gazbottle', 5)
				Harvest(source)
			end
		end

	end)
end

RegisterServerEvent('beekersjob:startHarvest')
AddEventHandler('beekersjob:startHarvest', function()
	local _source = source
	PlayersHarvesting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('recovery_gas_can'))
	Harvest(source)
end)

RegisterServerEvent('beekersjob:stopHarvest')
AddEventHandler('beekersjob:stopHarvest', function()
	local _source = source
	PlayersHarvesting[_source] = false
end)

local function Harvest2(source)
	SetTimeout(4000, function()

		if PlayersHarvesting2[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local FixToolQuantity = xPlayer.getInventoryItem('fixtool').count

			if FixToolQuantity >= 15 then
				TriggerClientEvent('esx:showNotification', source, _U('you_do_not_room'))
			else
				xPlayer.addInventoryItem('fixtool', 5)
				Harvest2(source)
			end
		end

	end)
end

RegisterServerEvent('beekersjob:startHarvest2')
AddEventHandler('beekersjob:startHarvest2', function()
	local _source = source
	PlayersHarvesting2[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('recovery_repair_tools'))
	Harvest2(_source)
end)

RegisterServerEvent('beekersjob:stopHarvest2')
AddEventHandler('beekersjob:stopHarvest2', function()
	local _source = source
	PlayersHarvesting2[_source] = false
end)

local function Harvest3(source)
	SetTimeout(4000, function()

		if PlayersHarvesting3[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local CaroToolQuantity = xPlayer.getInventoryItem('carotool').count
			if CaroToolQuantity >= 15 then
				TriggerClientEvent('esx:showNotification', source, _U('you_do_not_room'))
			else
				xPlayer.addInventoryItem('carotool', 5)
				Harvest3(source)
			end
		end

	end)
end

RegisterServerEvent('beekersjob:startHarvest3')
AddEventHandler('beekersjob:startHarvest3', function()
	local _source = source
	PlayersHarvesting3[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('recovery_body_tools'))
	Harvest3(_source)
end)

RegisterServerEvent('beekersjob:stopHarvest3')
AddEventHandler('beekersjob:stopHarvest3', function()
	local _source = source
	PlayersHarvesting3[_source] = false
end)

local function Craft(source)
	SetTimeout(4000, function()

		if PlayersCrafting[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local GazBottleQuantity = xPlayer.getInventoryItem('gazbottle').count

			if GazBottleQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_gas_can'))
			else
				xPlayer.removeInventoryItem('gazbottle', 1)
				xPlayer.addInventoryItem('blowpipe', 1)
				Craft(source)
			end
		end

	end)
end

RegisterServerEvent('beekersjob:startCraft')
AddEventHandler('beekersjob:startCraft', function()
	local _source = source
	PlayersCrafting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('assembling_blowtorch'))
	Craft(_source)
end)

RegisterServerEvent('beekersjob:stopCraft')
AddEventHandler('beekersjob:stopCraft', function()
	local _source = source
	PlayersCrafting[_source] = false
end)

local function Craft2(source)
	SetTimeout(4000, function()

		if PlayersCrafting2[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local FixToolQuantity = xPlayer.getInventoryItem('fixtool').count

			if FixToolQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_repair_tools'))
			else
				xPlayer.removeInventoryItem('fixtool', 1)
				xPlayer.addInventoryItem('fixkit', 1)
				Craft2(source)
			end
		end

	end)
end

RegisterServerEvent('beekersjob:startCraft2')
AddEventHandler('beekersjob:startCraft2', function()
	local _source = source
	PlayersCrafting2[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('assembling_repair_kit'))
	Craft2(_source)
end)

RegisterServerEvent('beekersjob:stopCraft2')
AddEventHandler('beekersjob:stopCraft2', function()
	local _source = source
	PlayersCrafting2[_source] = false
end)

local function Craft3(source)
	SetTimeout(4000, function()

		if PlayersCrafting3[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local CaroToolQuantity = xPlayer.getInventoryItem('carotool').count

			if CaroToolQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_body_tools'))
			else
				xPlayer.removeInventoryItem('carotool', 1)
				xPlayer.addInventoryItem('carokit', 1)
				Craft3(source)
			end
		end

	end)
end

RegisterServerEvent('beekersjob:startCraft3')
AddEventHandler('beekersjob:startCraft3', function()
	local _source = source
	PlayersCrafting3[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('assembling_body_kit'))
	Craft3(_source)
end)

RegisterServerEvent('beekersjob:stopCraft3')
AddEventHandler('beekersjob:stopCraft3', function()
	local _source = source
	PlayersCrafting3[_source] = false
end)

RegisterServerEvent('beekersjob:onNPCJobMissionCompleted')
AddEventHandler('beekersjob:onNPCJobMissionCompleted', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local total   = math.random(70, 100);

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_beekers', function(account)
		account.addMoney(total)
	end)

	TriggerClientEvent("esx:showNotification", _source, _U('your_comp_earned').. total)
end)

ESX.RegisterUsableItem('blowpipe', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('blowpipe', 1)

	TriggerClientEvent('beekersjob:onHijack', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('you_used_blowtorch'))
end)

ESX.RegisterUsableItem('fixkit', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('fixkit', 1)

	TriggerClientEvent('beekersjob:onFixkit', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('you_used_repair_kit'))
end)

ESX.RegisterUsableItem('carokit', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('carokit', 1)

	TriggerClientEvent('beekersjob:onCarokit', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('you_used_body_kit'))
end)

RegisterServerEvent('beekersjob:getStockItem')
AddEventHandler('beekersjob:getStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_beekers', function(inventory)
		local item = inventory.getItem(itemName)
		local sourceItem = xPlayer.getInventoryItem(itemName)

		-- is there enough in the society?
		if count > 0 and item.count >= count then

			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('player_cannot_hold'))
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn', count, item.label))
			end
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
		end
	end)
end)

ESX.RegisterServerCallback('beekersjob:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_beekers', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('beekersjob:putStockItems')
AddEventHandler('beekersjob:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_beekers', function(inventory)
		local item = inventory.getItem(itemName)
		local playerItemCount = xPlayer.getInventoryItem(itemName).count

		if item.count >= 0 and count <= playerItemCount then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited', count, item.label))
	end)
end)

ESX.RegisterServerCallback('beekersjob:getPlayerInventory', function(source, cb)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local items      = xPlayer.inventory

	cb({items = items})
end)

RegisterServerEvent('AnnouncebeekersOuvert')
AddEventHandler('AnnouncebeekersOuvert', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Beekers', '~b~Annonce Beekers', 'Le Beekers vient d\'ouvrir ! Venez customiser vos véhicules !', 'CHAR_PROPERTY_CAR_MOD_SHOP', 8)
	end
end)

RegisterServerEvent('AnnouncebeekersFerme')
AddEventHandler('AnnouncebeekersFerme', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Beekers', '~b~Annonce Beekers', 'Le Beekers vient de fermer, passer plus tard !', 'CHAR_PROPERTY_CAR_MOD_SHOP', 8)
	end
end)


-- Fourrière 


RegisterServerEvent('beekers:fourriere')
AddEventHandler('beekers:fourriere', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local argentEntreprise = math.random(70, 90)
	local argentPerso = math.random(50, 70)

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_beekers', function(account)
		account.addMoney(argentEntreprise)
	end)
	xPlayer.addMoney(argentPerso)
	TriggerClientEvent('esx:showAdvancedNotification', _source, "Beekers", "~b~Déstruction du véhicule", "Les pièces détachées vous on rapportée:\nEntreprise: ~g~"..argentEntreprise.."$\n~w~Portefeuille: ~g~"..argentPerso.."$", "CHAR_PROPERTY_CAR_MOD_SHOP", 8)
end)
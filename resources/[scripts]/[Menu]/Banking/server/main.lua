
--||@SuperCoolNinja.||--

RegisterServerEvent("nMenuBanque:RetirerArgent")
AddEventHandler("nMenuBanque:RetirerArgent", function(amount)
	local source = source	
	local license = GetPlayerIdentifiers(source)[1]
	local rounded = tonumber(amount)

	TriggerEvent('es:getPlayerFromId', source, function(user)
		
		if(tonumber(rounded) <= tonumber(user.getBank())) then
			user.removeBank(rounded)
			user.addMoney(rounded)
			local myNewCash = tonumber(user.getMoney())
			local myNewBank = tonumber(user.getBank())
			TriggerClientEvent('nMenuNotif:showNotification', source, "Vous avez retiré : ~g~$:" ..rounded)
			TriggerClientEvent('nArgent:DisplayCashValue', source, myNewCash)
			TriggerClientEvent('nArgent:DisplayBankValue', source, myNewBank)
		else
			TriggerClientEvent('nMenuNotif:showNotification', source, "~r~Vous n'avez pas cette somme d'argent sur vous !")
		end
	end)
end)

RegisterServerEvent("nMenuBanque:DeposerArgent")
AddEventHandler("nMenuBanque:DeposerArgent", function(amount)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	local rounded = tonumber(amount)

	TriggerEvent('es:getPlayerFromId', source, function(user)
		
		if(tonumber(rounded) <= tonumber(user.getMoney())) then
			user.removeMoney(rounded)
			user.addBank(rounded)
			local myNewCash = tonumber(user.getMoney())
			local myNewBank = tonumber(user.getBank())
			TriggerClientEvent('nMenuNotif:showNotification', source, "Vous avez déposé : ~g~$" ..rounded)
			TriggerClientEvent('nArgent:DisplayCashValue', source, myNewCash)
			TriggerClientEvent('nArgent:DisplayBankValue', source, myNewBank)
		else
			TriggerClientEvent('nMenuNotif:showNotification', source, "~r~Vous n'avez pas cette somme d'argent sur vous !")
		end
	end)
end)

RegisterServerEvent('nArgent:AddCash')
AddEventHandler('nArgent:AddCash', function(value)
	local src = source
	local license = GetPlayerIdentifiers(src)[1]
	TriggerEvent('es:getPlayerFromId', src, function(user)
	local newValue = user.getMoney() + value
	local CashResult = MySQL.Sync.fetchScalar("SELECT money FROM users WHERE license = @license", { ['license'] = license})
		if CashResult then
			local newCashValue = CashResult + value
			MySQL.Sync.execute("UPDATE users SET money=@value WHERE license = @license", {['license'] = license, ['value'] = tostring(newCashValue)})
			TriggerClientEvent('nArgent:DisplayCashValue', src, newCashValue)
			CashResult = nil
		end
	end)
end)

RegisterServerEvent('nArgent:AddBank')
AddEventHandler('nArgent:AddBank', function(value)
	local src = source
	local license = GetPlayerIdentifiers(src)[1]
	TriggerEvent('es:getPlayerFromId', src, function(user)
	local newValue = user.getBank() + value
	local result = MySQL.Sync.fetchScalar("SELECT bank FROM users WHERE license = @license", { ['license'] = license})
		if result then
			newBankvalue = result + value
			TriggerClientEvent('nArgent:DisplayBankValue', src, newBankvalue)
			MySQL.Sync.execute("UPDATE users SET bank=@value WHERE license = @license", {['license'] = license, ['value'] = tostring(newBankvalue)})
			local result = nil
		end
	end)
end)

RegisterServerEvent('nArgent:ClearCash')
AddEventHandler('nArgent:ClearCash', function(value)
	local src = source
	local license = GetPlayerIdentifiers(src)[1]
	TriggerEvent('es:getPlayerFromId', src, function(user)
		local newClearCashValue = user.getMoney() - value
		MySQL.Sync.execute("UPDATE users SET money=@value WHERE license = @license", {['license'] = license, ['value'] = tostring(newClearCashValue)})
		TriggerClientEvent('nArgent:DisplayCashValue', src, newClearCashValue)
	end)
end)

RegisterServerEvent('nArgent:ClearBank')
AddEventHandler('nArgent:ClearBank', function(value)
	local src = source
	local license = GetPlayerIdentifiers(src)[1]
	TriggerEvent('es:getPlayerFromId', src, function(user)
		local newValue = user.getBank() - value
		MySQL.Sync.execute("UPDATE users SET bank=@value WHERE license = @license", {['license'] = license, ['value'] = tostring(newValue)})
		TriggerClientEvent('nArgent:DisplayBankValue', src, newValue)
	end)
end)


RegisterServerEvent('nBanqueSolde:SRender')
AddEventHandler('nBanqueSolde:SRender', function()
	local player = GetPlayerIdentifiers(source)[1]
	local source = source	
	TriggerClientEvent('nBanqueSolde:CRender', source)
end)
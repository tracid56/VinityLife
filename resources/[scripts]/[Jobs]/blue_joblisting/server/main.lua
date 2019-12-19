ESX              = nil
local PlayerData = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_joblisting:setJobMiner')
AddEventHandler('esx_joblisting:setJobMiner', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.setJob("miner", 0)	
end)

RegisterServerEvent('esx_joblisting:setJobFishing')
AddEventHandler('esx_joblisting:setJobFishing', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.setJob("fishing", 0)	
end)

RegisterServerEvent('esx_joblisting:setJobFueler')
AddEventHandler('esx_joblisting:setJobFueler', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.setJob("fueler", 0)	
end)

RegisterServerEvent('esx_joblisting:setJobLumberJack')
AddEventHandler('esx_joblisting:setJobLumberJack', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.setJob("lumberjack", 0)	
end)

RegisterServerEvent('esx_joblisting:setJobAbatteur')
AddEventHandler('esx_joblisting:setJobAbatteur', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.setJob("slaughterer", 0)	
end)

RegisterServerEvent('esx_joblisting:setJobTailor')
AddEventHandler('esx_joblisting:setJobTailor', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.setJob("tailer", 0)	
end)

RegisterServerEvent('esx_joblisting:setJobSalvage')
AddEventHandler('esx_joblisting:setJobSalvage', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.setJob("salvage", 0)	
end)

RegisterServerEvent('esx_joblisting:setJobFruitier')
AddEventHandler('esx_joblisting:setJobFruitier', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.setJob("fruitier", 0)	
end)

RegisterServerEvent('esx_joblisting:setJobOrp')
AddEventHandler('esx_joblisting:setJobOrp', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.setJob("orpailleurs", 0)	
end)



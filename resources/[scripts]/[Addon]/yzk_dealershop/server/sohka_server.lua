ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('buyZiptie')
AddEventHandler('buyZiptie', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceZiptie
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('ziptie', 1)
end)

RegisterNetEvent('buyRasperry')
AddEventHandler('buyRasperry', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceRasperry
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('rasperry', 1)
end)

RegisterNetEvent('buyPilule')
AddEventHandler('buyPilule', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PricePilule
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('piluleoubli', 1)
end)

RegisterNetEvent('buyC4')
AddEventHandler('buyC4', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceC4
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('c4_bank', 1)
end)

RegisterNetEvent('buyBlowtorch')
AddEventHandler('buyBlowtorch', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceBlowtorch
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('blowtorch', 1)
end)
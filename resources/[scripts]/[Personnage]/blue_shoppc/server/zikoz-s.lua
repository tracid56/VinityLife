ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('buyEau')
AddEventHandler('buyEau', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceEau
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('water', 1)
end)

RegisterNetEvent('buyCocaCola')
AddEventHandler('buyCocaCola', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceCocaCola
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('cocacola', 1)
end)

RegisterNetEvent('buyjusfruit')
AddEventHandler('buyjusfruit', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.Pricejusfruit
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('jusfruit', 1)
end)


RegisterNetEvent('buyIceTea')
AddEventHandler('buyIceTea', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceIceTea
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('icetea', 1)
end)

RegisterNetEvent('buyfanta')
AddEventHandler('buyfanta', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.Pricefanta
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('fanta', 1)
end)

RegisterNetEvent('buyPain')
AddEventHandler('buyPain', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PricePain
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('bread', 1)
end)

RegisterNetEvent('buyChips')
AddEventHandler('buyChips', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceChips
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('chips', 1)
end)

RegisterNetEvent('buycheesebows')
AddEventHandler('buycheesebows', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.Pricecheesebows
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('cheesebows', 1)
end)

RegisterNetEvent('buyMuscu')
AddEventHandler('buyMuscu', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceMuscu
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem('gym_membership', 1)
end)




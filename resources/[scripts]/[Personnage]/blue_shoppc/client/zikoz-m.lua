local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil


Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)


_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Superette","Salade , Tomates , Oignons ? Chef !", nil, nil)
_menuPool:Add(mainMenu)

function AddShopsMenu(menu)
    local shopsmenu = _menuPool:AddSubMenu(menu, "Boissons", nil, nil)
    
    local shopsmenu2 = _menuPool:AddSubMenu(menu, "Nourritures", nil, nil)

    local abomenu = _menuPool:AddSubMenu(menu, "Abonnements", nil, nil)


    local eau = NativeUI.CreateItem("Eau", "")
    shopsmenu.SubMenu:AddItem(eau)
    eau:RightLabel("~g~4$")

    local cocacola = NativeUI.CreateItem("Coca-Cola", "")
    shopsmenu.SubMenu:AddItem(cocacola)
    cocacola:RightLabel("~g~3$")

    local icetea = NativeUI.CreateItem("IceTea", "")
    shopsmenu.SubMenu:AddItem(icetea)
    icetea:RightLabel("~g~5$")

    local jusfruit = NativeUI.CreateItem("Jus de Fruit", "")
    shopsmenu.SubMenu:AddItem(jusfruit)
    jusfruit:RightLabel("~g~6$")

    local fanta = NativeUI.CreateItem("Fanta", "")
    shopsmenu.SubMenu:AddItem(fanta)
    fanta:RightLabel("~g~4$")

    local cheesebows = NativeUI.CreateItem("Chips Fromage", "")
    shopsmenu2.SubMenu:AddItem(cheesebows)
    cheesebows:RightLabel("~g~3$")

    local pain = NativeUI.CreateItem("Pain", "")
    shopsmenu2.SubMenu:AddItem(pain)
    pain:RightLabel("~g~4$")

    local chips = NativeUI.CreateItem("Chips BBQ", "")
    shopsmenu2.SubMenu:AddItem(chips)
    chips:RightLabel("~g~5$")

    local gym_membership = NativeUI.CreateItem("Musculation", "")
    abomenu.SubMenu:AddItem(gym_membership)
    gym_membership:RightLabel("~g~50$")

    shopsmenu.SubMenu.OnItemSelect = function(menu, item)
    if item == eau then
        TriggerServerEvent('buyEau')
        ESX.ShowNotification('Vous avez payez ~r~4$')
        Citizen.Wait(1)
        ESX.ShowAdvancedNotification("Superette", "~b~Ticket Client", "Vous avez acheté de l' ~b~Eau", "CHAR_BOATSITE", 1)
    elseif item == cocacola then
        TriggerServerEvent('buyCocaCola')
        ESX.ShowNotification('Vous avez payez ~r~3$')
        Citizen.Wait(1)
        ESX.ShowAdvancedNotification("Superette", "~b~Ticket Client", "Vous avez acheté du ~b~CocaCola", "CHAR_BOATSITE", 1)
    elseif item == icetea then
        TriggerServerEvent('buyIceTea')
        ESX.ShowNotification('Vous avez payez ~r~5$')
        Citizen.Wait(1)
        ESX.ShowAdvancedNotification("Superette", "~b~Ticket Client", "Vous avez acheté du ~b~IceTea", "CHAR_BOATSITE", 1)
    elseif item == fanta then
        TriggerServerEvent('buyfanta')
        ESX.ShowNotification('Vous avez payez ~r~6$')
        Citizen.Wait(1)
        ESX.ShowAdvancedNotification("Superette", "~b~Ticket Client", "Vous avez acheté du ~b~Fanta", "CHAR_BOATSITE", 1)
    elseif item == jusfruit then
        TriggerServerEvent('buyjusfruit')
        ESX.ShowNotification('Vous avez payez ~r~4$')
        Citizen.Wait(1)
        ESX.ShowAdvancedNotification("Superette", "~b~Ticket Client", "Vous avez acheté du ~b~Jus de Fruit", "CHAR_BOATSITE", 1)
        end
    end
    
    shopsmenu2.SubMenu.OnItemSelect = function(menu, item)
    if item == pain then
        TriggerServerEvent('buyPain')
        ESX.ShowNotification('Vous avez payez ~r~3$')
        Citizen.Wait(1)
        ESX.ShowAdvancedNotification("Superette", "~b~Ticket Client", "Vous avez acheté du ~b~Pain", "CHAR_BOATSITE", 1)
    elseif item == chips then
        TriggerServerEvent('buyChips')
        ESX.ShowNotification('Vous avez payez ~r~4$')
        Citizen.Wait(1)
        ESX.ShowAdvancedNotification("Superette", "~b~Ticket Client", "Vous avez acheté des ~b~Chips BBQ", "CHAR_BOATSITE", 1)
    elseif item == cheesebows then
        TriggerServerEvent('buycheesebows')
        ESX.ShowNotification('Vous avez payez ~r~5$')
        Citizen.Wait(1)
        ESX.ShowAdvancedNotification("Superette", "~b~Ticket Client", "Vous avez acheté des ~b~Chips Fromage", "CHAR_BOATSITE", 1)    
    end
end    
    abomenu.SubMenu.OnItemSelect = function(menu, item)
    if item == gym_membership then
        TriggerServerEvent('buyMuscu')
        ESX.ShowNotification('Vous avez payez ~r~50$')
        Citizen.Wait(1)
        ESX.ShowAdvancedNotification("Superette", "~b~Ticket Client", "Vous avez acheté un abonnement ~b~Musculation", "CHAR_BOATSITE", 1)
        end
    end
end



AddShopsMenu(mainMenu)
_menuPool:RefreshIndex()

local zikoz = {
    {x = 255.97, y = -782.27, z = 30.54}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        _menuPool:MouseEdgeEnabled (false);

        for k in pairs(zikoz) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, zikoz[k].x, zikoz[k].y, zikoz[k].z)

            if dist <= 1.2 then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour parler au ~r~Vendeur")
				if IsControlJustPressed(1,51) then 
                    mainMenu:Visible(not mainMenu:Visible())
				end
            end
        end
    end
end)

local blips = {
    {title="Shop", colour=25, id=52, x = 255.27, y = -784.0, z = 29.50},

}

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.9)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)

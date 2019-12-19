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
mainMenu = NativeUI.CreateMenu('Biggy', 'Tu veux quoi chef ?', 0, 0)
_menuPool:Add(mainMenu)

function AddObjectMenu(menu)

    local bmenu = _menuPool:AddSubMenu(menu, "~g~~s~Hamburger", "", 5, 100,"","","",210,0,0)
    bmenu.Item:RightLabel("→") 

    local cmenu = _menuPool:AddSubMenu(menu, "~g~~s~Coca Cola", "", 5, 100,"","","",210,0,0)
    cmenu.Item:RightLabel("→")

    local mmenu = _menuPool:AddSubMenu(menu, "~g~~s~Menu Biggy", "", 5, 100,"","","",210,0,0)
    mmenu.Item:RightLabel("→")

    local bigmac = NativeUI.CreateItem("Achetez", "")
    bmenu.SubMenu:AddItem(bigmac)
    bigmac:RightLabel("~g~7$")

    local cola = NativeUI.CreateItem("Achetez", "")
    cmenu.SubMenu:AddItem(cola)
    cola:RightLabel("~g~4$")

    local formule = NativeUI.CreateItem("Achetez", "")
    mmenu.SubMenu:AddItem(formule)
    formule:RightLabel("~g~14$")


    bmenu.SubMenu.OnItemSelect = function(menu, item)
        if item == bigmac then
            TriggerServerEvent("BuyBigmac")
            ESX.ShowAdvancedNotification("~r~Biggy", "~r~Préparation...", "", "CHAR_MINOTAUR", 1)
            Citizen.Wait(5)
            ESX.ShowAdvancedNotification("~r~Biggy", "Tiens un bon ~r~Hamburger !", "", "CHAR_MINOTAUR", 1)
            end
        end
    
    cmenu.SubMenu.OnItemSelect = function(menu, item)
        if item == cola then
            TriggerServerEvent("BuyCola")
            ESX.ShowAdvancedNotification("~r~Biggy", "~r~Préparation...", "", "CHAR_MINOTAUR", 1)
            Citizen.Wait(5)
            ESX.ShowAdvancedNotification("~r~Biggy", "Tiens un bon ~r~Coca-Cola !", "", "CHAR_MINOTAUR", 1)
            end
        end
        mmenu.SubMenu.OnItemSelect = function(menu, item)
            if item == formule then
                TriggerServerEvent("BuyMenu")
                ESX.ShowAdvancedNotification("~r~Biggy", "~r~Préparation...", "", "CHAR_MINOTAUR", 1)
                Citizen.Wait(5)
                ESX.ShowAdvancedNotification("~r~Biggy", "Tiens notre savoureux ~r~Menu !", "", "CHAR_MINOTAUR", 1)
                _menuPool:CloseAllMenus(true)
                end
            end
    end

AddObjectMenu(mainMenu)
_menuPool:RefreshIndex()

local sBurgershot = {
    {x = 1019.61, y = -799.43, z = 57.38},
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        _menuPool:MouseEdgeEnabled (false);

        for k in pairs(sBurgershot) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, sBurgershot[k].x, sBurgershot[k].y, sBurgershot[k].z)

            if dist <= 1.2 then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour parlez avec le ~r~Vendeur")
				if IsControlJustPressed(1,51) then 
                    mainMenu:Visible(not mainMenu:Visible())
				end
            end
        end
    end
end)


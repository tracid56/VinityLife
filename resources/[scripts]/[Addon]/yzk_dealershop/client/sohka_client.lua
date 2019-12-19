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
mainMenu = NativeUI.CreateMenu("Dealer","Pssst, tu veux quoi ?", nil, nil)
_menuPool:Add(mainMenu)

function AddShopsMenu(menu)
    local shopsmenu = _menuPool:AddSubMenu(menu, "Voir la cargaison", nil, nil)

    local ziptie = NativeUI.CreateItem("Menottes", "")
    shopsmenu.SubMenu:AddItem(ziptie)
    ziptie:RightLabel("~r~650$")

    local rasperry = NativeUI.CreateItem("Rasperry", "")
    shopsmenu.SubMenu:AddItem(rasperry)
    rasperry:RightLabel("~r~750$")

    
    local piluleoubli = NativeUI.CreateItem("Pilule", "")
    shopsmenu.SubMenu:AddItem(piluleoubli)
    piluleoubli:RightLabel("~r~700$")

    local c4_bank = NativeUI.CreateItem("C4", "")
    shopsmenu.SubMenu:AddItem(c4_bank)
    c4_bank:RightLabel("~r~800$")

    
    local blowtorch = NativeUI.CreateItem("Chalumeau", "")
    shopsmenu.SubMenu:AddItem(blowtorch)
    blowtorch:RightLabel("~r~850$")


    shopsmenu.SubMenu.OnItemSelect = function(menu, item)
    if item == ziptie then
            TriggerServerEvent('buyZiptie')
            ESX.ShowNotification('Vous avez payez ~r~650$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Dealer", "Vous avez acheter des ~r~Menottes", "", "CHAR_LESTER_DEATHWISH", 1)
        elseif item == rasperry then
            TriggerServerEvent('buyRasperry')
            ESX.ShowNotification('Vous avez payez ~r~750$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Dealer", "Vous avez acheter un ~r~Rasperry", "", "CHAR_LESTER_DEATHWISH", 1)
        elseif item == piluleoubli then
            TriggerServerEvent('buyPilule')
            ESX.ShowNotification('Vous avez payez ~r~700$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Dealer", "Vous avez acheter une ~r~Pilule", "", "CHAR_LESTER_DEATHWISH", 1)
        elseif item == c4_bank then
            TriggerServerEvent('buyC4')
            ESX.ShowNotification('Vous avez payez ~r~800$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Dealer", "Vous avez acheter un ~r~C4", "", "CHAR_LESTER_DEATHWISH", 1)
        elseif item == blowtorch then
            TriggerServerEvent('buyBlowtorch')
            ESX.ShowNotification('Vous avez payez ~r~85r$')
            Citizen.Wait(1)
            ESX.ShowAdvancedNotification("Dealer", "Vous avez acheter un ~r~Chalumeau", "", "CHAR_LESTER_DEATHWISH", 1)
        end
    end
end


AddShopsMenu(mainMenu)
_menuPool:RefreshIndex()

local sohka = {
    {x = 1712.29, y = 4790.33, z = 41.99}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        _menuPool:MouseEdgeEnabled (false);

        for k in pairs(sohka) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, sohka[k].x, sohka[k].y, sohka[k].z)

            if dist <= 1.2 then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour parlez avec le ~r~Dealer")
				if IsControlJustPressed(1,51) then 
                    mainMenu:Visible(not mainMenu:Visible())
				end
            end
        end
    end
end)

local koordinaten = {
    {1712.29, 4790.33, 40.99,"Drogendealer",150,0x5aa42c21,"g_f_y_vagos_01"}
}


Citizen.CreateThread(function()

    for _,v in pairs(koordinaten) do
      RequestModel(GetHashKey(v[7]))
      while not HasModelLoaded(GetHashKey(v[7])) do
        Wait(1)
      end
  
      RequestAnimDict("mini@strip_club@idles@bouncer@base")
      while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
        Wait(1)
      end
      ped =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
    end
end)
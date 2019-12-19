
_menuPool = NativeUI.CreatePool()
_menuPool:RefreshIndex()
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
Masks = {}
ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
  ESX.TriggerServerCallback("dqp:getMask", function(result2)
    Masks = result2
  end)
end)

local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction66           = nil
local CurrentAction66Msg        = ''
local CurrentAction66Data       = {}
local IsInShopMenu            = false
local Categories              = {}
local Vehicles                = {}
local LastVehicles            = {}
local CurrentVehicleData      = nil




local menuLoaded = false

function OpenMask()
	TriggerEvent("dqp:exit")
		local maskShop = NativeUI.CreateMenu("Masques", "Magasin de Masques", 5, 100)
		_menuPool:Add(maskShop)
		maskShopAdd(maskShop)
		maskShop:Visible(not maskShop:Visible())
		_menuPool:RefreshIndex()

end



_menuPool:RefreshIndex()


function gettxt2(txtt)
	AddTextEntry('FMMC_MPM_NA', "Texte")
	DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", txtt, "", "", "", 100)
	while (UpdateOnscreenKeyboard() == 0) do
		DisableAllControlActions(0);
		Wait(0);
	end
	if (GetOnscreenKeyboardResult()) then
	local result = GetOnscreenKeyboardResult()
	if tonumber(result) ~= nil then
	  if tonumber(result) >= 1 then
  
		return tonumber(result)
	  else
		
	  end
	else
	return result
	end
	end
  
  end

function OpenMenuMask()
	print("y")
	ESX.TriggerServerCallback("dqp:getMask", function(result2)
		Masks = result2

		local SkurtShop = NativeUI.CreateMenu("Mes Masques", "", 5, 100)
		_menuPool:Add(SkurtShop)
		menuLoaded = true
		menu =	SkurtShop 
		_menuPool:RefreshIndex()
		xl = NativeUI.CreateItem("Enlever masque", "")
		menu:AddItem(xl)
		result = Masks
		SkurtShop.OnItemSelect = function(m, item, index)
			if index == 1 then
				SetPedComponentVariation(GetPlayerPed(-1), 1, 0, 0, 2)
			end
		end
		for i = 1, #result, 1 do
			menumbk = menu
			local xfvde = _menuPool:AddSubMenu(menu, result[i].label, "", 5, 200)

			xl = NativeUI.CreateItem("Equiper", "")
			xc = NativeUI.CreateItem("Renommer", "")
			xv = NativeUI.CreateItem("Donner", "")
			xb = NativeUI.CreateItem("Jeter", "")
			xfvde:AddItem(xl)
			xfvde:AddItem(xc)
			xfvde:AddItem(xv)
			xfvde:AddItem(xb)
			xfvde.OnItemSelect = function(menu, _, index)
				if index == 1 then
					k = json.decode(result[i].mask)
					ped = GetPlayerPed(-1)
					uno = k.mask_1
					dos = k.mask_2
					typos = result[i].type
					--(typos)

						if ped then
							local dict = 'missfbi4'
							local myPed = PlayerPedId()
							RequestAnimDict(dict)

							while not HasAnimDictLoaded(dict) do
								Citizen.Wait(0)
							end

							local animation = ''
							local flags = 0 -- only play the animation on the upper body
							animation = 'takeoff_mask'
							TaskPlayAnim(myPed, dict, animation, 8.0, -8.0, -1, 50, 0, false, false, false)
							Citizen.Wait(1000)
							SetEntityCollision(GetPlayerPed(-1), true, true)
							playerPed = GetPlayerPed(-1)
							SetPedComponentVariation(playerPed, 1, k.mask_1, k.mask_2, 2)
							Citizen.Wait(200)
							ClearPedTasks(playerPed)
						end

				end
				
				if index == 2 then
					typos = result[i].type
					txt = gettxt2(result[i].label)
					txt = tostring(txt)
					if txt ~= nil then
					  TriggerServerEvent("dqp:RenameMasque", result[i].id, txt, typos)
					  _menuPool:CloseAllMenus()
					  result[i].label = txt
					  Citizen.Wait(1)
					  OpenMenuMask()

					end

				end
				if index == 3 then
					local myPed = PlayerPedId()
					if result[i].index == 99 then
						SetPedComponentVariation(playerPed, 1, 0, 0, 2)
					else
						ClearPedProp(myPed, result[i].index)
					end
					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
					local closestPed = GetPlayerPed(closestPlayer)

					if IsPedSittingInAnyVehicle(closestPed) then
						ESX.ShowNotification('~r~Impossible de donner un objet dans un véhicule')
						return
					end

					if closestPlayer ~= -1 and closestDistance < 3.0 then

						TriggerServerEvent('dqp:GiveAccessories', GetPlayerServerId(closestPlayer), result[i].id, result[i].label)


						menu:GoBack()

						menumbk:RemoveItemAt(i+1)

					else
						ESX.ShowNotification("~r~Aucun joueurs proche")

					end


				end
				if index == 4 then
					TriggerServerEvent('dqp:Delclo', result[i].id, result[i].label,result[i])

					menu:GoBack()
					menumbk:RemoveItemAt(i+1)

				end
			end
			--    menu:AddItem(psp)
			-- _menuPool:RefreshIndex()
		end
	

		_menuPool:RefreshIndex()
		menu:Visible(not menu:Visible())
	end)

end





















-- function

Citizen.CreateThread(function()
	
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)

	end
	TriggerEvent('dqp:exit')
end)



AddEventHandler('Mask:hasEnteredMarker', function(zone)

	CurrentAction66     = 'shop_menu'
	CurrentAction66Msg  = 'Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le magasin'
	CurrentAction66Data = {zone = zone}

end)

AddEventHandler('Mask:hasExitedMarker', function(_)

	CurrentAction66 = nil
	_menuPool:CloseAllMenus()
	
	if MenuOn then
		yoyo()
		MenuOn = false
	end
end)
 


-- Display markers
Citizen.CreateThread(function()
  while true do
    Wait(0)
    local coords = GetEntityCoords(GetPlayerPed(-1))
    for _,v in pairs(MaskConfig.Zones) do
      for i = 1, #v.Pos, 1 do
        if(MaskConfig.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) < MaskConfig.DrawDistance) then
          DrawMarker(MaskConfig.Type, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, MaskConfig.Size.x, MaskConfig.Size.y, MaskConfig.Size.z, MaskConfig.Color.r, MaskConfig.Color.g, MaskConfig.Color.b, 100, true, true, 2, false, false, false, false)
        end
      end
    end
  end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Wait(1000)
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(MaskConfig.Zones) do
			for i = 1, #v.Pos, 1 do
				if(GetDistanceBetweenCoords(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) < 3.0) then
					isInMarker  = true
					
					ShopItems   = v.Items
					currentZone = k
					LastZone    = k
				end
			end
		end
		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			
			TriggerEvent('Mask:hasEnteredMarker', currentZone)
		end
		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('Mask:hasExitedMarker', LastZone)
			--("s")
			yoyo()

		end
	end
end)





function maskShopAdd(menu)
	playerPed = GetPlayerPed(-1)
	--maskName = {"Pas de masque","Masque Cochon","Masque Crane","Masque Pogo","Masque hockey 1","Masque Singe","Masque Crane Mexicain","Masque Ogre","Masque Père Noël","Masque Renne","Masque Bonhomme Neige","Masque Soirée","Masque Théâtre","Masque Cupidon","Masque Hockey 2","Masque 3","Masque Crane Métal","Masque Chat","Masque Renard","Masque Hibou","Masque Raton Laveur","Masque Ours","Masque Buffle","Masque Taureau","Masque Aigle","Masque Dindon","Masque Loup","Masque Aviateur","Masque Combat","Masque Mort","Masque Hockey 4","Masque Pingouin","Masque Chaussette Noël","Masque Biscuit","Masque Vieux Noël","Masque Cagoule","Masque Gaz","Masque Cagoule Retournée","Masque Gaz Simple","Masque Zombie","Masque Momie","Masque Dent Pointue","Masque Frankenstein","Masque Manga H","Masque Manga F","Masque Manga H Padré","Masque Toxique","Masque Ruban","Masque Scotch","Masque Papier","Masque Simple","Masque Foulard","Masque Cagoule Braqueur","Masque Ninja 1","Masque Touareg","Masque Ninja 2","Masque Ninja 3","Masque Cagoule Rayé 1","Masque Cagoule Rayé 2","Masque Big Foot","Masque Citrouille","Masque vieux Zombie","Masque Acide","Masque Muscle","Masque Zombie Langue","Masque Loup Garou","Masque Mouche","Masque Gollum","Masque Démons","Masque Cousu","Masque Vampire Tourbi","Masque Sorcière","Masque Démons Moustache","Masque Chauve","Masque Biscuit 2","Masque Biscuit 3","Masque Noël Cigare","Masque Sapin Noël","Masque Fraise Pourri","Masque Big Foot 2","Masque Big Foot 3","Masque Big Foot 4","Masque Big Foot 5","Masque Big Foot 6","Masque Yéti","Masque Poulet","Masque Mère Noël 1","Masque Clochard Noël","Masque Mère Noël 2","Masque Combat 2","Masque Training 1","Masque Rino Métal","Masque Alien","Masque T-Rex","Masque Démons 2","Masque Clown","Masque Gorille","Masque Cheval","Masque Licorne","Masque Crane Motif","Masque Chien","Masque Training 2","Masque Dessin Fluo","Masque Soldat","Masque Ensemble Cagoule","Masque Combat Bouffon","Masque Combat Crane","Masque Training Combat","Masque Combat Mort","Masque Aviateur 2","Masque Combat Teubé","Masque Foulard 2","Masque Cagoule Teubé 2","Masque Ninja Motif","Masque Keffieh Ouvert","Masque Keffieh Fermé","Masque Keffieh Nez","Masque Cagoule Rayé 3","Masque Ninja 4","Masque Cagoule Retournée 2","Masque Chauve","Masque Oreillette","Masque Cagoule Plongée","Masque Collant","Masque Hockey 5","Masque Combat Connecté","Masque Hockey Cagoule","Masque Hockey Biscuit","Masque Simple 2","Masque Combat Gaz","Masque Combat Flamme","Masque Bélier","Masque Vision Nocturne"} 
	maskName = {}
	for i=0,GetNumberOfPedDrawableVariations(playerPed, 1)-1,1 do 
		amount = {}
		for c = 1, GetNumberOfPedTextureVariations(playerPed, 1, i), 1 do

			amount[c] = c 
			
		end
		if maskName[i+1] == nil then
			maskName[i+1] = GetLabelText(MaskConfig.Name[tostring(i)]["0"]["GXT"])
		end
		qdqs = NativeUI.CreateListItem(maskName[i+1] , amount, 1, "",5)
		menu:AddItem(qdqs)
		menu.OnIndexChange = function(menu,index6)
			playerPed = GetPlayerPed(-1)
			SetPedComponentVariation(playerPed, 1, index6-1, 0, 2)
			local index2 = 1
			menu.OnListSelect = function(_, _, index)
				TriggerServerEvent("dqp:SetNewMasque",index6-1,index2-1,"Masque",maskName[index6])
				_menuPool:RefreshIndex()
				TriggerServerEvent("logs:BasicLogs","Achats masque" ,maskName[index+1] ,"achats")
			end
			menu.OnMenuClosed = function(_, _, _)
				yoyo()
			end
			menu.OnListChange = function(_, _, index24)
				index2 = index24
				SetPedComponentVariation(playerPed, 1, index6-1, index24-1, 2)
	
			end
		end
	end
	menu.OnMenuClosed = function(_)
		print("KO")
		gilItem= {}
		yoyo()
		sousTorse = {}
	end
end
function yoyo()
	playerPed = GetPlayerPed(-1)
	SetPedComponentVariation(playerPed, 1, 0, 0, 2)
end


Citizen.CreateThread(function()
        local blip = AddBlipForCoord(-1336.82,-1277.84,4.42)
        SetBlipSprite(blip, 362)
        SetBlipDisplay(blip, 4)
        SetBlipColour(blip, 61)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 1.0)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Boutique de Masques")
        EndTextCommandSetBlipName(blip)


end)

--[[Citizen.CreateThread(function()
        local blip = AddBlipForCoord(1816.29,3685.35,34.22)
        SetBlipSprite(blip, 61)
        SetBlipDisplay(blip, 4)
        SetBlipColour(blip, 1)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 1.2)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Hopital Nord")
        EndTextCommandSetBlipName(blip)


end)]]

-- Key controls
Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0)
	  _menuPool:ProcessMenus()
	  if IsControlJustPressed(1, Keys['H']) and IsControlPressed(1, Keys['LEFTSHIFT']) then
		OpenMenuMask()
	  end
	  if CurrentAction66 ~= nil then
		SetTextComponentFormat('STRING')
		AddTextComponentString(CurrentAction66Msg)
		DisplayHelpTextFromStringLabel(0, 0, 0, -1)
  
		if IsControlJustReleased(0, 38) then
		--	TriggerEvent("onClientMaspStart")
		
			OpenMask()
			yoyo()
			MenuOn = true
	--	  CurrentAction66 = nil
  
		end
  
	  end
	end
  end)


function recp()
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)
end


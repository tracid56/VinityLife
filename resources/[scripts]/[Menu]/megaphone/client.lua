_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Mégaphone", "LSPD")
_menuPool:Add(mainMenu)

function AddMenuAnotherMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Arrêter vous ! »", "")
    local shout1 = NativeUI.CreateItem("Conducteur! Stop...", "")
    local shout2 = NativeUI.CreateItem("Arrêter votre putain de voiture !...", "")
    local shout3 = NativeUI.CreateItem("Arrêter vous immédiatement!...", "")
    local shout4 = NativeUI.CreateItem("Arrêter vous ou ça va chier!...", "")
local ped = GetPlayerPed(-1)

    submenu:AddItem(shout1)
    submenu:AddItem(shout2)
    submenu:AddItem(shout3)
    submenu:AddItem(shout4)
	
    submenu.OnItemSelect = function(sender, item, index)
    if item == shout1 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 60.0, "stop_vehicle-2", 0.6)
    end
    if item == shout2 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 60.0, "stop_the_f_car", 0.6)
    end
    if item == shout3 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 60.0, "stop_or_executed", 0.6)
    end
    if item == shout4 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 60.0, "stop_or_i_kill", 0.6)
    end
    end	
end

function Stop(menu)
    local submenu4 = _menuPool:AddSubMenu(menu, "Stop »", "")
    local shout1 = NativeUI.CreateItem("Ne me fait pas attendre!...", "")
    local shout2 = NativeUI.CreateItem("Ne bouge pas d'un pouce!..", "")
    local shout3 = NativeUI.CreateItem("Rendez vous!...", "")
    local shout4 = NativeUI.CreateItem("Reste ici!...", "")
    local shout5 = NativeUI.CreateItem("Bouge pas!...", "")

    submenu4:AddItem(shout1)
    submenu4:AddItem(shout2)
    submenu4:AddItem(shout3)
    submenu4:AddItem(shout4)
    submenu4:AddItem(shout5)

    submenu4.OnItemSelect = function(sender, item, index)
    if item == shout1 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 60.0, "dont_make_me", 0.6)
    end	
    if item == shout2 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 60.0, "stop_dont_move", 0.6)
    end
    if item == shout3 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 60.0, "give_yourself_up", 0.6)
    end	
    if item == shout4 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 60.0, "stay_right_there", 0.6)
    end	
    if item == shout5 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 60.0, "freeze_lspd", 0.6)
    end			
    end	
end


function Clear(menu)
    local submenu2 = _menuPool:AddSubMenu(menu, "Dégagez »", "")
    local shout1 = NativeUI.CreateItem("Degagez de là...", "")
    local shout2 = NativeUI.CreateItem("Allez vous en!..", "")
    local shout3 = NativeUI.CreateItem("Bougez vous svp!...", "")
    local shout4 = NativeUI.CreateItem("Allez vous en d'ici!...", "")
    local shout5 = NativeUI.CreateItem("Circulez!...", "")

    submenu2:AddItem(shout1)
    submenu2:AddItem(shout2)
    submenu2:AddItem(shout3)
    submenu2:AddItem(shout4)
    submenu2:AddItem(shout5)

    submenu2.OnItemSelect = function(sender, item, index)
    if item == shout1 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 60.0, "clear_the_area", 0.6)
    end		
    if item == shout2 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 60.0, "this_is_the_lspd", 0.6)
    end	
    if item == shout3 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 60.0, "move_along_people", 0.6)
    end	
    if item == shout4 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 60.0, "get_out_of_here_now", 0.6)
    end	
    if item == shout5 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 60.0, "disperse_now", 0.6)
    end	
    end	
end


function Insults(menu)
    local submenu3 = _menuPool:AddSubMenu(menu, "Insultes »", "")
    local shout1 = NativeUI.CreateItem("C'est fini!...", "")
    local shout2 = NativeUI.CreateItem("Vous êtes fini!..", "")
    local shout3 = NativeUI.CreateItem("Tu ne peux pas te cacher!..", "")
    local shout4 = NativeUI.CreateItem("Faire sa fête!..", "")
    local shout5 = NativeUI.CreateItem("Je vais tirer!..", "")

    submenu3:AddItem(shout1)
    submenu3:AddItem(shout2)
    submenu3:AddItem(shout3)
    submenu3:AddItem(shout4)
    submenu3:AddItem(shout5)

    submenu3.OnItemSelect = function(sender, item, index)	
    if item == shout1 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 60.0, "its_over_for_you", 0.6)
    end	
    if item == shout2 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 60.0, "you_are_finished_dhead", 0.6)
    end	
    if item == shout3 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 60.0, "cant_hide_boi", 0.6)
    end	
    if item == shout4 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 60.0, "drop_a_missile", 0.6)
    end
    if item == shout5 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 60.0, "shoot_to_kill", 0.6)
    end		
    end	
end

function vehicleType(using)
  local cars = Config.Vehicles

  for i=1, #cars, 1 do
    if IsVehicleModel(using, GetHashKey(cars[i])) then
      return true
    end
  end
end

AddMenuAnotherMenu(mainMenu)
Stop(mainMenu)
Clear(mainMenu)
Insults(mainMenu)

_menuPool:RefreshIndex()
_menuPool:MouseControlsEnabled(false)
_menuPool:ControlDisablingEnabled(false)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
      _menuPool:ProcessMenus()

        if IsControlJustPressed(1, 108) then
          if vehicleType(GetVehiclePedIsUsing(GetPlayerPed(-1))) then
            mainMenu:Visible(not mainMenu:Visible())
		



          else
           ShowNotification("Vous n'êtes pas dans un véhicule équipé d'un ~r~mégaphone !")
          end
        end
    end
end)


function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end
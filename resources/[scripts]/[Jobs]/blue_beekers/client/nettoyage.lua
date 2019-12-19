ESX = nil
local PlayerData                = {}

local nettoyage = {coords = vector3(110.86, 6606.14, 31.88)}
--local nettoyagePublique = {coords = vector3(21.09, -1391.97, 29.8)}
local nettoyagePublique = {coords = vector3(47.68, -1391.991, 29.4)}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)



-- Zone de mise nettoyage

Citizen.CreateThread(function()
     while true do
          while ESX == nil do
               Citizen.Wait(10)
          end
		local sleepThread = 1000
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)
          local dstCheck = GetDistanceBetweenCoords(pedCoords, nettoyage.coords, true)
          local dstCheckPublic = GetDistanceBetweenCoords(pedCoords, nettoyagePublique.coords, true)
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'beekers' then
			if dstCheck <= 2.5 then
				sleepThread = 5
				ESX.Game.Utils.DrawText3D(nettoyage.coords, "~b~[E] ~w~Réparation global du véhicules\n~b~Activité d'entreprise", 1.0)
				if IsControlJustPressed(0, 38) then
					NettoyageFunction()
				end
			end
          end
          if dstCheckPublic <= 30 then
               sleepThread = 5
               DrawMarker(20, nettoyagePublique.coords.x, nettoyagePublique.coords.y, nettoyagePublique.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 3, 252, 48, 100, false, true, 2, false, nil, nil, false)
          end
          if dstCheckPublic <= 2.5 then
               sleepThread = 5
               ESX.Game.Utils.DrawText3D(nettoyagePublique.coords, "~b~[E] ~w~Nettoyage de véhicule\n~b~Activité civil", 1.0)
               if IsControlJustPressed(0, 38) then
                    NettoyageFunctionPublic()
               end
          end
		Citizen.Wait(sleepThread)
	end
end)


function NettoyageFunction()
	local ped = PlayerPedId()
     local vehicle = GetVehiclePedIsIn( ped, false )
     if IsPedInAnyVehicle(ped, false) then
          if ESX.PlayerData.job and ESX.PlayerData.job.name == 'beekers' then
               ESX.ShowAdvancedNotification("Beekers", "~b~Réparation et Nettoyage", "Réparation et Nettoyage du véhicule en cours...", "CHAR_PROPERTY_CAR_MOD_SHOP", 8)
-- Cam
               local camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
               SetCamCoord(camera, 110.86, 6606.14, 31.88)
               PointCamAtEntity(camera, ped, 0, 0, 0, 1)
               SetCamNearDof(camera, 10)
               RenderScriptCams(1, 1, 6500, 1, 1)
               SetCamShakeAmplitude(camera, 13.0)
               -- porte
               SetVehicleDoorOpen(vehicle, 0, false, false)
               SetVehicleDoorOpen(vehicle, 1, false, false)
               SetVehicleDoorOpen(vehicle, 2, false, false)
               SetVehicleDoorOpen(vehicle, 3, false, false)
               SetVehicleDoorOpen(vehicle, 4, false, false)
               SetVehicleDoorOpen(vehicle, 5, false, false)
               SetVehicleDoorOpen(vehicle, 6, false, false)
               SetVehicleDoorOpen(vehicle, 7, false, false)
               Wait(8500)
               RenderScriptCams(0, 1, 3500, 1, 1)
               Wait(3501)
               SetCamCoord(camera, 110.86, 6606.14, 31.88)
               RenderScriptCams(1, 1, 5500, 1, 1)
               Wait(6600)
               RenderScriptCams(0, 1, 3500, 1, 1)
               Wait(3501)
               SetCamCoord(camera, 110.86, 6606.14, 31.88)
               RenderScriptCams(1, 1, 7500, 1, 1)
               Wait(8500)
-- Fin cam
               RenderScriptCams(0, 1, 5000, 1, 1)
               DestroyCam(camera, true)
               ESX.ShowAdvancedNotification("Beekers", "~b~Réparation et Nettoyage", "Terminé", "CHAR_PROPERTY_CAR_MOD_SHOP", 8)
               -- porte
               SetVehicleDoorShut(vehicle, 0, false)
               SetVehicleDoorShut(vehicle, 1, false)
               SetVehicleDoorShut(vehicle, 2, false)
               SetVehicleDoorShut(vehicle, 3, false)
               SetVehicleDoorShut(vehicle, 4, false)
               SetVehicleDoorShut(vehicle, 5, false)
               SetVehicleDoorShut(vehicle, 6, false)
               SetVehicleDoorShut(vehicle, 7, false)
               -- clean et fix 
               SetVehicleDirtLevel(vehicle, 1.0)
               SetVehicleFixed(vehicle)
          end
     else
          ESX.ShowAdvancedNotification("Beekers", "~b~Déstruction du véhicule", "Tu doit etre en véhicule pour faire ça.", "CHAR_PROPERTY_CAR_MOD_SHOP", 8)
     end
end

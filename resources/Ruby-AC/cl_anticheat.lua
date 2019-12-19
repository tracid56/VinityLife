local events = {
	'HCheat:TempDisableDetection',
	'BsCuff:Cuff696999',
	'police:cuffGranted',
	'_chat:messageEntered',
	'mellotrainer:adminTempBan',
	'esx_truckerjob:pay',
	'AdminMenu:giveCash',
	'AdminMenu:giveBank',
	'AdminMenu:giveDirtyMoney',
	'esx-qalle-jail:jailPlayer',
	'kickAllPlayer',
	'esx_gopostaljob:pay',
	'esx_banksecurity:pay',
	'esx_slotmachine:sv:2',
	'lscustoms:payGarage',
	'vrp_slotmachine:server:2',
	'dmv:success',
	'esx_drugs:startHarvestCoke',
	'esx_drugs:startHarvestMeth',
	'esx_drugs:startHarvestWeed',
	'esx_drugs:startHarvestOpium',

-- Ajouts de detection KRZ
	'KorioZ-PersonalMenu:Weapon_addAmmoToPedS',
	'KorioZ-PersonalMenu:Admin_BringS',
	'KorioZ-PersonalMenu:Admin_giveCash',
	'KorioZ-PersonalMenu:Admin_giveBank',
	'KorioZ-PersonalMenu:Admin_giveDirtyMoney',
	'KorioZ-PersonalMenu:Boss_promouvoirplayer',
	'KorioZ-PersonalMenu:Boss_destituerplayer',
	'KorioZ-PersonalMenu:Boss_recruterplayer',
	'KorioZ-PersonalMenu:Boss_virerplayer',
}

local eventsAdmin = {
	'Admin2Menu:giveCash',
	'Admin2Menu:giveBank',
	'Admin2Menu:giveDirtyMoney',
}

AddEventHandler('playerSpawned', function(spawn)
	TriggerServerEvent("AC:Sync")
end)

for i=1, #eventsAdmin, 1 do
	AddEventHandler(eventsAdmin[i], function()
		TriggerServerEvent('AC:AdminDetected', eventsAdmin[i])
	end)
end


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


local avert = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000)
		local curPed = PlayerPedId()
		local curHealth = GetEntityHealth( curPed )
		SetEntityHealth( curPed, curHealth-2)
		local curWait = math.random(10,150)

		Citizen.Wait(curWait)

		if not IsPlayerDead(PlayerId()) then
			if PlayerPedId() == curPed and GetEntityHealth(curPed) == curHealth and GetEntityHealth(curPed) ~= 0 then
				avert = avert + 1
			elseif GetEntityHealth(curPed) == curHealth-2 then
				SetEntityHealth(curPed, GetEntityHealth(curPed)+2)
			elseif GetEntityHealth(curPed) > 201 then
				TriggerServerEvent("AC:GodModDetected")
			end
		end

		if avert == 5 then
			TriggerServerEvent("AC:TropDeDetection", 5)
		elseif avert == 10 then
			TriggerServerEvent("AC:TropDeDetection", 10)	
		elseif avert == 15 then
			TriggerServerEvent("AC:TropDeDetection", 15)
		elseif avert == 20 then
			TriggerServerEvent("AC:TropDeDetection", 20)
		elseif avert == 25 then
			TriggerServerEvent("AC:TropDeDetection", 25)
		elseif avert == 30 then
			TriggerServerEvent("AC:TropDeDetection", 30)
		end

	end

end)


-- Detection si le joueurs est dans un véhicule de police


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
     	local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local ped = GetPlayerPed(-1)
		local vehicleClass = GetVehicleClass(vehicle)
		PlayerData = ESX.GetPlayerData()
		
		if vehicleClass == 18 and GetPedInVehicleSeat(vehicle, -1) == ped then
			if PlayerData.job.name ~= 'police' and PlayerData.job.name ~= 'ambulance' and PlayerData.job.name ~= 'mechanic' and PlayerData.job.name ~= 'sheriff' then
				ClearPedTasksImmediately(ped)
				TaskLeaveVehicle(ped,vehicle,0)
				TriggerServerEvent("AC:PoliceVehicule")
			end
		end
	end
end)

-- Fin de la détection pour les véhicules

for i=1, #events, 1 do
	AddEventHandler(events[i], function()
		TriggerServerEvent('AC:injectionDetected', events[i])
	end)
end
-- CONFIG --


-- FPS BOOST 

Citizen.CreateThread(function()
	--Wait(2*60000) -- Delay first spawn.
	while true do
		ClearAllBrokenGlass()
		ClearAllHelpMessages()
		LeaderboardsReadClearAll()
		ClearBrief()
		ClearGpsFlags()
		ClearPrints()
		ClearSmallPrints()
		ClearReplayStats()
		LeaderboardsClearCacheData()
		ClearFocus()
		ClearHdArea()
		print("^1RUBY ANTI CHEAT\n^3Analyse terminer\n^3Debug props effectué")
		Wait(1*60000)
	end
end)
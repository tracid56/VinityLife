local zones = {

	['30'] = { ['x'] = -1044.73, ['y'] = -2749.13, ['z'] = 21.3634}, -- Spawn aéroport

	['45'] = { ['x'] = 242.403, ['y'] = -784.461, ['z'] = 30.569}, -- Parking central

	['35'] = { ['x'] = -38.288, ['y'] = -1096.396, ['z'] = 26.422}, -- Concessionnaire

	['36'] = { ['x'] = -205.592, ['y'] = -1310.479, ['z'] = 31.311}, -- Bennys

	['46'] = { ['x'] = 447.452, ['y'] = -992.327, ['z'] = 24.420}, -- Comico

	['50'] = { ['x'] = 328.799, ['y'] = -1421.770, ['z'] = 30.347}, -- Devant hopital

	['48'] = { ['x'] = 253.151, ['y'] = -1366.496, ['z'] = 21.347}, -- Auto Ecole et interieur hopital

	['80'] = { ['x'] = 1643.759, ['y'] = 2530.987, ['z'] = 44.564} -- Prison federal

	-- ['100'] = { ['x'] = 961.950, ['y'] = 34.817, ['z'] = 50.119}, -- Haut casino

	-- ['82'] = { ['x'] = 1109.081, ['y'] = 219.141, ['z'] = -49.440} -- Bas casino

}

ESX = nil

local notifIn = false

local notifOut = false

local veh = false

local closestZone = 1

local distance = 0

local safe = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


Citizen.CreateThread(function()

	while true do

		local playerPed = GetPlayerPed(-1)

		local x, y, z = table.unpack(GetEntityCoords(playerPed, true))

		local minDistance = 100000

		for k,v in pairs(zones) do

			dist = Vdist(zones[k].x, zones[k].y, zones[k].z, x, y, z)

			if dist < minDistance then

				minDistance = dist

				closestZone = k

				distance = tonumber(k)

			end

		end

		local vehs = GetVehiclePedIsUsing(GetPlayerPed(PlayerId()), false)

		if (GetPedInVehicleSeat(vehs, -1) == GetPlayerPed(PlayerId())) and veh == false then	

		SetEntityInvincible(vehs, false)

		elseif (GetPedInVehicleSeat(vehs, -1) == GetPlayerPed(PlayerId())) and veh == true then

		SetEntityInvincible(vehs, true)

		end

		Citizen.Wait(10000)

	end

end)



Citizen.CreateThread(function()

	while true do

		Citizen.Wait(5)

		local player = GetPlayerPed(-1)

		local x,y,z = table.unpack(GetEntityCoords(player, true))

		local dist = Vdist(zones[closestZone].x, zones[closestZone].y, zones[closestZone].z, x, y, z)

	

		if dist <= distance then

			if not notifIn then	

				veh = true				

				local vehs = GetVehiclePedIsUsing(GetPlayerPed(PlayerId()), false)

				if (GetPedInVehicleSeat(vehs, -1) == GetPlayerPed(PlayerId())) then	

				SetEntityInvincible(vehs, true)

				end

				safe = true

				SetEntityInvincible(player, true)												  

				NetworkSetFriendlyFireOption(false)

				SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"), true)

				ESX.ShowAdvancedNotification("Vous êtes dans une Zone Safe", "", "", "CHAR_BOATSITE", 0)

				notifIn = true

				notifOut = false

			end

		else

			if not notifOut then

				veh = false

				local vehs = GetVehiclePedIsUsing(GetPlayerPed(PlayerId()), false)

				if (GetPedInVehicleSeat(vehs, -1) == GetPlayerPed(PlayerId())) then	

				SetEntityInvincible(vehs, false)

				end

				safe = false

				SetEntityInvincible(player, false)

				NetworkSetFriendlyFireOption(true)

				ESX.ShowAdvancedNotification("Vous n\'êtes plus en Zone Safe", "", "", "CHAR_BOATSITE", 0)

				notifOut = true

				notifIn = false

			end

		end

		if notifIn then

		DisableControlAction(2, 37, true)

		DisablePlayerFiring(player, true)

		DisableControlAction(0, 106, true)

		DisableControlAction(0, 140, true)

			if IsDisabledControlJustPressed(2, 37) then

				SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"), true)

			end

			if IsDisabledControlJustPressed(0, 106) then

				SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"), true)

			end

		end

	end

end)



AddEventHandler('safe:Check', function(cb)

cb(safe)

end)
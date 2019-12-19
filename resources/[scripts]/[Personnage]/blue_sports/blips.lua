local para = {
	["parachute1"] = {
		position = { ['x'] = 442.59, ['y'] = 5572.03, ['z'] = 781.9 },
		nompara = "Parachute",
	},
	["parachute2"] = {
		position = { ['x'] = -75.099, ['y'] = -819.25, ['z'] = 326.65 },
		nompara = "Parachute",
	},
	["parachute3"] = {
		position = { ['x'] = -144.56, ['y'] = -593.39, ['z'] = 212.50 },
		nompara = "Parachute",
	},
	["parachute4"] = {
		position = { ['x'] = -906.708, ['y'] = 4556.96, ['z'] = 220.70 },
		nompara = "Parachute",
	},
	["parachute5"] = {
		position = { ['x'] = 1665.401, ['y'] = -28.0, ['z'] = 197.50 },
		nompara = "Parachute",
	},
	["parachute6"] = {
		position = { ['x'] = -273.42, ['y'] = -2431.52, ['z'] = 123.0 },
		nompara = "Parachute",
	},
	["parachute7"] = {
		position = { ['x'] = -145.85, ['y'] = -944.82, ['z'] = 269.65 },
		nompara = "Parachute",
	},
}

function DisplayHelpText(str)

	SetTextComponentFormat("STRING")

	AddTextComponentString(str)

	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end

Citizen.CreateThread(function()

	while true do

		currentPed = GetPlayerPed(-1)

		currentPos = GetEntityCoords(currentPed, false)

		Citizen.Wait(2000)

	end

end)

-- blips
Citizen.CreateThread(function()
	for k,v in pairs(para) do
		local vpara = v.position

		local blip = AddBlipForCoord(vpara.x, vpara.y, vpara.z)
		SetBlipSprite(blip, 377)
		SetBlipColour(blip, 50)
		SetBlipScale(blip, 0.8)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v.nompara)
		EndTextCommandSetBlipName(blip)
	end
end)


function giveParachute()
    GiveWeaponToPed(currentPed, GetHashKey("GADGET_PARACHUTE"), 150, true, true)
end

Citizen.CreateThread(function()
	Citizen.Wait(1000)

	while true do
		Citizen.Wait(2)
		local pos = currentPos

		for k,v in pairs(para)do
			local pos2 = v.position

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
				DrawMarker(21, v.position.x, v.position.y, v.position.z - 0.90, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 116, 0, 255, 50, true, true, false, 0, 0, 0, 0)
					
				if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0)then
					DisplayHelpText("Appuyez sur ~INPUT_CONTEXT~ pour obtenir un ~p~Parachute")
                    if IsControlJustPressed(1, 51) then
                        giveParachute()
                    end
				end
			end
		end
	end
end)

local blips = {







  



  {title="Circuit de Jetski", colour=15, id=471, x = -2078.95, y = 2603.27, z = 2.03},

  {title="Circuit de Cross", colour=0, id=127, x = 893.68, y = 2383.62, z = 50.68},

  {title="Concert", colour=34, id=136, x = 686.18, y = 577.95, z = 130.46},

  {title="Cinéma", colour=8, id=135, x = -1687.82, y = -918.82, z = 7.24},

  {title="Karting", colour=46, id=304, x = -1026.37, y = -3469.20, z = 14.32},

  {title="Verger", colour=47, id=85, x = 356.64, y = 6518.55, z = 28.17},

  {title="Eglise", colour=0, id=305, x = -766.68, y = -23.60, z = 40.08},

  {title="Mariage", colour=1, id=489, x = -1493.17, y = -1484.24, z = 5.70},

  {title="Gouvernement", colour=0, id=419, x = -358.84, y = -985.88, z = 46.84},

  {title="Escape Game", colour=39, id=304, x = -1193.10, y = -1728.18, z = 4.27},

  {title="Ring", colour=1, id=491, x = -517.71, y = -1717.19, z = 20.46},

  {title="Tribunal", colour=10, id=464, x = -458.15, y = 1159.026, z = 326.01},


 }

     

Citizen.CreateThread(function()



   for _, info in pairs(blips) do

     info.blip = AddBlipForCoord(info.x, info.y, info.z)

     SetBlipSprite(info.blip, info.id)

     SetBlipDisplay(info.blip, 4)

     SetBlipScale(info.blip, 1.0)

     SetBlipColour(info.blip, info.colour)

     SetBlipAsShortRange(info.blip, true)

   BeginTextCommandSetBlipName("STRING")

     AddTextComponentString(info.title)

     EndTextCommandSetBlipName(info.blip)

   end

end)
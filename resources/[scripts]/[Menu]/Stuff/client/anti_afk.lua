
local tempAvantKick = 6000 --Temps avant le Kick anti-Afk


Citizen.CreateThread(function()
	while true do
		Wait(1000)
		
		playerPed = GetPlayerPed(-1)
		if playerPed then
			currentPos = GetEntityCoords(playerPed, true)

			if currentPos == prevPos then
				if time > 0 then
					time = time - 1
				else
					TriggerServerEvent("kickForBeingAnAFKDouchebag") --Trigger l'event pour kick la personne
				end
			else
				time = tempAvantKick
			end
			prevPos = currentPos
		end
	end
end)
  
RegisterServerEvent("kickForBeingAnAFKDouchebag")
AddEventHandler("kickForBeingAnAFKDouchebag", function()
	DropPlayer(source, "Expulsé de la session pour avoir été inactif pendant longtemps.")
end)
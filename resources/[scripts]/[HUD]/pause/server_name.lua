function SetData()
	players = {}
	for _, player in ipairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)
		table.insert( players, player )
end

	
	local name = GetPlayerName(PlayerId())
	local id = GetPlayerServerId(PlayerId())
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', '~p~Vinity Life ~t~| ~p~ID : ~w~' .. id .. ' ~t~| ~p~Nom : ~w~' .. name .. " ~t~| ~p~Joueurs : ~w~" .. #players .. " / 128")
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		SetData()
	end
end)

Citizen.CreateThread(function()
    AddTextEntry("PM_PANE_LEAVE", "~p~Quitter ~w~Vinity Life")
end)

Citizen.CreateThread(function()
    AddTextEntry("PM_PANE_QUIT", "~p~Quitter ~w~FiveM")
end)
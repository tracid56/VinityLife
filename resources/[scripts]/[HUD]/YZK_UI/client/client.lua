RegisterNetEvent('ESX_HealthBAR-UI:updateStatus')
AddEventHandler('ESX_HealthBAR-UI:updateStatus', function(Status)
    status = Status
    SendNUIMessage({
        action = "updateStatus",
        st = Status,
    })
end)

-- Voice
local voice = {default = 5.0, shout = 12.0, whisper = 1.0, current = 0, level = nil}

AddEventHandler('onClientMapStart', function()
	if voice.current == 0 then
		NetworkSetTalkerProximity(voice.default)
		SendNUIMessage({
     		voicelvl = 52
     	});
	elseif voice.current == 1 then
		NetworkSetTalkerProximity(voice.shout)
		SendNUIMessage({
     		voicelvl = 100
     	});
	elseif voice.current == 2 then
		NetworkSetTalkerProximity(voice.whisper)
		SendNUIMessage({
     		voicelvl = 25
     	});
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		if IsControlJustPressed(1, 288) then -- F1
			voice.current = (voice.current + 1) % 3
			if voice.current == 0 then
				NetworkSetTalkerProximity(voice.default)
				SendNUIMessage({
					voicelvl = 52
				});
			elseif voice.current == 1 then
				NetworkSetTalkerProximity(voice.shout)
				SendNUIMessage({
					voicelvl = 100
				});
			elseif voice.current == 2 then
				NetworkSetTalkerProximity(voice.whisper)				
				SendNUIMessage({
					voicelvl = 25
				});
			end
		end
	end	
end)
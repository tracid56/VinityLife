local Spectating      = {}
local InSpectatorMode = false
local TargetSpectate  = nil
local LastPosition    = nil
local polarAngleDeg   = 10;
local azimuthAngleDeg = 90;
local radius          = -3.5;
local cam             = nil

function polar3DToWorld3D(entityPosition, radius, polarAngleDeg, azimuthAngleDeg)
		
		-- convert degrees to radians
		
		local polarAngleRad   = polarAngleDeg   * math.pi / 180.0
		local azimuthAngleRad = azimuthAngleDeg * math.pi / 180.0

		local pos = {
			x = entityPosition.x + radius * (math.sin(azimuthAngleRad) * math.cos(polarAngleRad)),
			y = entityPosition.y - radius * (math.sin(azimuthAngleRad) * math.sin(polarAngleRad)),
			z = entityPosition.z - radius * math.cos(azimuthAngleRad)
		}

		return pos
end

function spectate(target)

	if not InSpectatorMode then
		LastPosition = GetEntityCoords(GetPlayerPed(-1))
	end

	local playerPed = GetPlayerPed(-1)

	SetEntityCollision(playerPed,  false,  false)
	SetEntityVisible(playerPed,  false)

	Citizen.CreateThread(function()
		
		if not DoesCamExist(cam) then
			cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
		end

		SetCamActive(cam,  true)
		RenderScriptCams(true,  false,  0,  true,  true)

		InSpectatorMode = true
		TargetSpectate  = target

	end)

end

function resetNormalCamera()

	InSpectatorMode = false
	TargetSpectate  = nil
	local playerPed = GetPlayerPed(-1)

	SetCamActive(cam,  false)
	RenderScriptCams(false,  false,  0,  true,  true)

	SetEntityCollision(playerPed,  true,  true)
	SetEntityVisible(playerPed,  true)
	SetEntityCoords(playerPed, LastPosition.x, LastPosition.y, LastPosition.z)
end

AddEventHandler('playerSpawned', function()
	TriggerServerEvent('es_camera:requestSpectating')
end)

RegisterNetEvent('es_camera:spectate')
AddEventHandler('es_camera:spectate', function(target)

	if InSpectatorMode and target == -1 then
		resetNormalCamera()
	end

	if target ~= -1 then
		spectate(target)
	end

end)


RegisterNetEvent('es_camera:onSpectate')
AddEventHandler('es_camera:onSpectate', function(spectating)
	Spectating = spectating
end)

Citizen.CreateThread(function()

	while true do

		Wait(0)

		if InSpectatorMode then

			local targetPlayerId = GetPlayerFromServerId(TargetSpectate)
			local playerPed      = GetPlayerPed(-1)
			local targetPed      = GetPlayerPed(targetPlayerId)
			local coords         = GetEntityCoords(targetPed)

			for _, i in ipairs(GetActivePlayers()) do
			--for i=0, 32, 1 do
				if i ~= PlayerId() then
					local otherPlayerPed = GetPlayerPed(i)
					SetEntityNoCollisionEntity(playerPed,  otherPlayerPed,  true)
				end
			end

			if IsControlPressed(2, 241) then
				radius = radius + 0.5;
			end

			if IsControlPressed(2, 242) then
				radius = radius - 0.5;
			end

			if radius > -1 then
				radius = -1
			end

			local xMagnitude = GetDisabledControlNormal(0,  1);
			local yMagnitude = GetDisabledControlNormal(0,  2);

			polarAngleDeg = polarAngleDeg + xMagnitude * 10;

			if polarAngleDeg >= 360 then
				polarAngleDeg = 0
			end

			azimuthAngleDeg = azimuthAngleDeg + yMagnitude * 10;

			if azimuthAngleDeg >= 360 then
				azimuthAngleDeg = 0;
			end

			local nextCamLocation = polar3DToWorld3D(coords, radius, polarAngleDeg, azimuthAngleDeg)

			SetCamCoord(cam,  nextCamLocation.x,  nextCamLocation.y,  nextCamLocation.z)
			PointCamAtEntity(cam,  targetPed)
			SetEntityCoords(playerPed,  coords.x, coords.y, coords.z + 10)

		end

	end
end)













Citizen.CreateThread(function()
	Holograms()
end)

function Holograms()
	while true do
		Citizen.Wait(0)			
			-- Hologram No. 1
		if GetDistanceBetweenCoords(-281.57, -330.98, 18.28, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText(-281.57,-330.98, 18.28  -1.400, "Bienvenue sur le serveur ~b~VinityLife !", 4, 0.1, 0.1)
			Draw3DText(-281.57,-330.98, 18.28  -1.600, "Vous avez raté la custom de votre personnage ?", 4, 0.1, 0.1)
			Draw3DText(-281.57,-330.98, 18.28  -1.800, "Faite ~y~/register", 4, 0.1, 0.1)		
		end		
				--Hologram No. 2
		if GetDistanceBetweenCoords(-277.441, -318.04, 18.28, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText(-277.441, -318.04, 18.28 -1.400, "~y~Touche de base pour bien débuter", 4, 0.1, 0.1)
			Draw3DText(-277.441, -318.04, 18.28 -1.600, "~b~[~w~F5~b~]: Ouvrir son menu personnel (Inventaire etc..)", 4, 0.1, 0.1)
			Draw3DText(-277.441, -318.04, 18.28 -1.800, "~b~[~w~;~b~]: Ouvrir son téléphone", 4, 0.1, 0.1)		
		end	 

		if GetDistanceBetweenCoords(-268.85, -302.32, 19.86, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText(-268.85, -302.32, 19.86 -1.400, "~y~Vous avez un problème en jeux ?", 4, 0.1, 0.1)
			Draw3DText(-268.85, -302.32, 19.86 -1.600, "Contacter un staff en utilisant ~y~/report (Raison)", 4, 0.1, 0.1)
			Draw3DText(-268.85, -302.32, 19.86 -1.800, "Un membre du staff interviendra ~r~si il est disponible", 4, 0.1, 0.1)		
		end

		if GetDistanceBetweenCoords(-268.85, -302.32, 19.86, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText(-268.85, -302.32, 19.86 -1.400, "~y~Vous avez un problème en jeux ?", 4, 0.1, 0.1)
			Draw3DText(-268.85, -302.32, 19.86 -1.600, "Contacter un staff en utilisant ~y~/report (Raison)", 4, 0.1, 0.1)
			Draw3DText(-268.85, -302.32, 19.86 -1.800, "Un membre du staff interviendra ~r~si il est disponible", 4, 0.1, 0.1)		
		end

		if GetDistanceBetweenCoords(-250.97, -305.601, 22.62, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText(-250.97, -305.601, 22.62 -1.400, "~y~Informations RP :", 4, 0.1, 0.1)
			Draw3DText(-250.97, -305.601, 22.62 -1.600, "Envie de rejoindre une entreprise ? (Whitelist)", 4, 0.1, 0.1)
			Draw3DText(-250.97, -305.601, 22.62 -1.800, "~g~Direction notre serveur discord !", 4, 0.1, 0.1)	
			Draw3DText(-250.97, -305.601, 22.62 -2.200, "~y~Etat des recrutements entreprises:", 4, 0.1, 0.1)
			Draw3DText(-250.97, -305.601, 22.62 -2.400, "~b~LSPD: ~g~Ouvert", 4, 0.1, 0.1)	
			Draw3DText(-250.97, -305.601, 22.62 -2.600, "~b~BCSO: ~g~Ouvert", 4, 0.1, 0.1)
			Draw3DText(-250.97, -305.601, 22.62 -2.800, "~b~EMS: ~g~Ouvert", 4, 0.1, 0.1)
			Draw3DText(-250.97, -305.601, 22.62 -3.000, "~b~Tequilala: ~g~Ouvert", 4, 0.1, 0.1)
			Draw3DText(-250.97, -305.601, 22.62 -3.200, "~b~Unicorn: ~g~Ouvert", 4, 0.1, 0.1)	
			Draw3DText(-250.97, -305.601, 22.62 -3.400, "~b~Immobilier: ~g~Ouvert", 4, 0.1, 0.1)
			Draw3DText(-250.97, -305.601, 22.62 -3.600, "~b~Concess: ~g~Ouvert", 4, 0.1, 0.1)
		end
	end
end

-------------------------------------------------------------------------------------------------------------------------
function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
			 local px,py,pz=table.unpack(GetGameplayCamCoords())
			 local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
			 local scale = (1/dist)*20
			 local fov = (1/GetGameplayCamFov())*100
			 local scale = scale*fov   
			 SetTextScale(scaleX*scale, scaleY*scale)
			 SetTextFont(fontId)
			 SetTextProportional(1)
			 SetTextColour(250, 250, 250, 255)		-- You can change the text color here
			 SetTextDropshadow(1, 1, 1, 1, 255)
			 SetTextEdge(2, 0, 0, 0, 150)
			 SetTextDropShadow()
			 SetTextOutline()
			 SetTextEntry("STRING")
			 SetTextCentre(1)
			 AddTextComponentString(textInput)
			 SetDrawOrigin(x,y,z+2, 0)
			 DrawText(0.0, 0.0)
			 ClearDrawOrigin()
			end
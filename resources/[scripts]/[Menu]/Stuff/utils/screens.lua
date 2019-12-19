
local activeWelcomeNot = false

function DisplayHelpAlert(help)
    BeginTextCommandDisplayHelp("STRING");  
    AddTextComponentSubstringPlayerName(help);  
    EndTextCommandDisplayHelp(0, 0, 1, -1);  
end

function DrawAdvancedText2(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
    N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - 0.1+w, y - 0.02+h)
end

function RenderWelcomeNot()
    DrawRect(0.883000000000001, 0.37, 0.220, 0.325, 0, 0, 0, 220)
	DrawAdvancedText2(0.975000000000001, 0.239, 0.005, 0.0028, 0.4, "~h~Bienvenue sur Mon Serveur ~r~VII ~w~!", 255, 255, 255, 255, 0, 0) --Change ton text de bienvenue ici.
	
	DrawAdvancedText2(0.870000000000001, 0.290, 0.005, 0.0028, 0.3, "~w~ - Votre présence sur ~h~discord est OBLIGATOIRE ~w~!", 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.870000000000001, 0.320, 0.005, 0.0028, 0.3, "~w~ - Vérifier bien que votre argent soit dans votre banque, ~h~pour éviter toute perte.", 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.870000000000001, 0.370, 0.005, 0.0028, 0.3, "~w~ - Tout HRP est totalement interdit, merci de lire notre reglement.", 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.870000000000001, 0.430, 0.005, 0.0028, 0.4, "~h~ - Notre discord: ~b~ ...", 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.870000000000001, 0.470, 0.005, 0.0028, 0.3, "~h~ - Nous vous souhaitons une bonne aventure \n parmi nous.", 255, 255, 255, 255, 0, 1)
end

RegisterNetEvent('nMenuNotif:welcomeNotification')
AddEventHandler('nMenuNotif:welcomeNotification', function()
    activeWelcomeNot = true
    RenderWelcomeNot()
end)

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
        if activeWelcomeNot == true then
            if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) then
                activeWelcomeNot = false
            end
		    RenderWelcomeNot()
        end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        if activeWelcomeNot then
			Wait(15000)
			activeWelcomeNot = false
		end
	end
end)
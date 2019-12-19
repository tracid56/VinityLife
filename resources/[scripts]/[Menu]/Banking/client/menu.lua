local id = PlayerId()
local activeSolde = false
something, CashAmount = StatGetInt("MP0_WALLET_BALANCE",-1)
something2, BankAmount = StatGetInt("BANK_BALANCE",-1)

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("ATM","")
_menuPool:Add(mainMenu)

RegisterNetEvent('nBanqueSolde:CRender')
AddEventHandler('nBanqueSolde:CRender', function()
	activeSolde = true
	something, CashAmount = StatGetInt("MP0_WALLET_BALANCE",-1)
	something2, BankAmount = StatGetInt("BANK_BALANCE",-1)
end)

local function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
	AddTextEntry('FMMC_KEY_TIP1', TextEntry)
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		blockinput = false
		return result --Returns the result
	else
		Citizen.Wait(500)
		blockinput = false
		return nil
	end
end

local function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
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

local function RenderSolde()
	DrawRect(0.912000000000001, 0.292, 0.185, 0.205, 0, 0, 0, 180)
	DrawAdvancedText(0.966000000000001, 0.220, 0.005, 0.0028, 0.5, "~h~Votre Solde :", 255, 255, 255, 255, 0, 1)
	DrawAdvancedText(0.924000000000001, 0.278, 0.005, 0.0028, 0.4, "~w~Banque : ~r~" ..BankAmount .." ~g~$",255, 255, 255, 255, 0, 1)
	DrawAdvancedText(0.924000000000001, 0.322, 0.005, 0.0028, 0.4, "~w~Cash : ~r~" ..CashAmount.." ~g~$", 255, 255, 255, 255, 0, 1)
        DrawAdvancedText(0.924000000000001, 0.366, 0.005, 0.0028, 0.4, "Banko rend l\'argent !", 255, 255, 255, 255, 0, 1)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if activeSolde then
			RenderSolde()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if activeSolde then
			Wait(10000)
			activeSolde = false
		end
	end
end)

function AddMainMoneySystem(menu)
		--------------||SOUS MENU||----------------
		local submenu = _menuPool:AddSubMenu(menu, "Mon Compte","")
		--------------||EVENT AUTRES||----------------
		local retirerItem = NativeUI.CreateItem("Retirer", "~h~Retirer de l'argent de votre compte bancaire.")
		local deposerItem = NativeUI.CreateItem("Déposer", "~h~Déposer de l'argent dans votre compte bancaire.")
		local soldeItem = NativeUI.CreateItem("Votre Solde", "")
		
		submenu.SubMenu:AddItem(retirerItem)
		submenu.SubMenu:AddItem(deposerItem)
		submenu.SubMenu:AddItem(soldeItem)

		--------------||Selection LISTE JOBS||----------------
		submenu.SubMenu.OnItemSelect = function(menu, item)
		if item == retirerItem then
			_menuPool:CloseAllMenus(true)
			local quantityMoneyitems = KeyboardInput("Somme d'argent à retirer :", "", 6)
			if tonumber(quantityMoneyitems) == nil then
				exports.Stuff:Ninja_Core__ShowNinjaNotification("Banque: ", "", "Veuillez inserer un nombre correct !")
                return nil
            end
			TriggerServerEvent("nMenuBanque:RetirerArgent", quantityMoneyitems)
		elseif item == deposerItem then
			_menuPool:CloseAllMenus(true)
			local quantityMoneyBanqueitems = KeyboardInput("Somme d'argent à déposer :", "", 6)
			if tonumber(quantityMoneyBanqueitems) == nil then
				exports.Stuff:Ninja_Core__ShowNinjaNotification("Banque: ", "", "Veuillez inserer un nombre correct !")
                return nil
            end
			TriggerServerEvent("nMenuBanque:DeposerArgent", quantityMoneyBanqueitems)
		elseif item == soldeItem then
			_menuPool:CloseAllMenus(true)
			TriggerServerEvent("nBanqueSolde:SRender")
		end
	end
end

AddMainMoneySystem(mainMenu)
_menuPool:MouseEdgeEnabled (false);
_menuPool:RefreshIndex()
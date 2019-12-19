local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}

ESX = nil

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Pôle Emploi", "Bienvenue au Pôle Emploi !", Config.MenuX, Config.MenuY,nil,nil,nil)
_menuPool:Add(mainMenu)

function AddMenuJobMenu(menu)

        local submenu = _menuPool:AddSubMenu(menu, "Métiers", "", Config.MenuX, Config.MenuY,nil,nil,nil, 5, 50)
	
	    local minerjob = NativeUI.CreateItem("Mineur", "")

        submenu.SubMenu:AddItem(minerjob)
		
		local fishermanjob = NativeUI.CreateItem("Pêcheur", "")
		
		submenu.SubMenu:AddItem(fishermanjob)
		
		local fuelerjob = NativeUI.CreateItem("Raffineur", "")
		
		submenu.SubMenu:AddItem(fuelerjob)
			
		local lumberjackjob = NativeUI.CreateItem("Bûcheron", "")
		
		submenu.SubMenu:AddItem(lumberjackjob)
		
		local slaughtererjob = NativeUI.CreateItem("Abatteur", "")
		
		submenu.SubMenu:AddItem(slaughtererjob)
		
		local tailorjob = NativeUI.CreateItem("Couturier", "")
		
		submenu.SubMenu:AddItem(tailorjob)
	
		local salvagejob = NativeUI.CreateItem("Plongeur", "")
		
		submenu.SubMenu:AddItem(salvagejob)

		local fruitierjob = NativeUI.CreateItem("Fruitier", "")
		
		submenu.SubMenu:AddItem(fruitierjob)

                local orpjob = NativeUI.CreateItem("Orpailleur", "")
		
		submenu.SubMenu:AddItem(orpjob)

		
		submenu.SubMenu.OnItemSelect = function(menu, item)
		
		if item == minerjob then
		    TriggerServerEvent('esx_joblisting:setJobMiner')
			ESX.ShowAdvancedNotification("Pôle Emploi", "~b~Fini le Chômage ~w~!", "Vous pratiquez désormais le métier de \"~b~Mineur~w~\" ~w~!", "CHAR_BOATSITE", 1)
		end
		if item == fishermanjob then
		    TriggerServerEvent('esx_joblisting:setJobFishing')
			ESX.ShowAdvancedNotification("Pôle Emploi", "~b~Fini le Chômage ~w~!", "Vous pratiquez désormais le métier de \"~b~Pêcheur~w~\" ~w~!", "CHAR_BOATSITE", 1)
		end
		if item == fuelerjob then
		    TriggerServerEvent('esx_joblisting:setJobFueler')
			ESX.ShowAdvancedNotification("Pôle Emploi", "~b~Fini le Chômage ~w~!", "Vous pratiquez désormais le métier de \"~b~Raffineur~w~\" ~w~!", "CHAR_BOATSITE", 1)
		end
		if item == lumberjackjob then
		    TriggerServerEvent('esx_joblisting:setJobLumberJack')
			ESX.ShowAdvancedNotification("Pôle Emploi", "~b~Fini le Chômage ~w~!", "Vous pratiquez désormais le métier de \"~b~Bûcheron~w~\" ~w~!", "CHAR_BOATSITE", 1)
		end
		if item == slaughtererjob then
		    TriggerServerEvent('esx_joblisting:setJobAbatteur')
			ESX.ShowAdvancedNotification("Pôle Emploi", "~b~Fini le Chômage ~w~!", "Vous pratiquez désormais le métier de \"~b~Abatteur~w~\" ~w~!", "CHAR_BOATSITE", 1)
		end
		if item == tailorjob then
		    TriggerServerEvent('esx_joblisting:setJobTailor')
			ESX.ShowAdvancedNotification("Pôle Emploi", "~b~Fini le Chômage ~w~!", "Vous pratiquez désormais le métier de \"~b~Couturier~w~\" ~w~!", "CHAR_BOATSITE", 1)
		end
		if item == salvagejob then
		    TriggerServerEvent('esx_joblisting:setJobSalvage')
			ESX.ShowAdvancedNotification("Pôle Emploi", "~b~Fini le Chômage ~w~!", "Vous pratiquez désormais le métier de \"~b~Plongeur~w~\" ~w~!", "CHAR_BOATSITE", 1)
		end
		if item == fruitierjob then
		    TriggerServerEvent('esx_joblisting:setJobFruitier')
			ESX.ShowAdvancedNotification("Pôle Emploi", "~b~Fini le Chômage ~w~!", "Vous pratiquez désormais le métier de \"~b~Fruitier~w~\" ~w~!", "CHAR_BOATSITE", 1)
		end
                if item == orpjob then
		    TriggerServerEvent('esx_joblisting:setJobOrp')
			ESX.ShowAdvancedNotification("Pôle Emploi", "~b~Fini le Chômage ~w~!", "Vous pratiquez désormais le métier de \"~b~Orpailleur~w~\" ~w~!", "CHAR_BOATSITE", 1)
		end
	end
end

AddMenuJobMenu(mainMenu)
_menuPool:MouseEdgeEnabled (false);
_menuPool:RefreshIndex()

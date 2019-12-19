local isDead = false
local inAnim = false
local actualDemarche, actualDemarcheIndex = "Démarche par défaut", 1
local personalmenu = {}


ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false
end)

 function startAttitude(lib, anim)
	ESX.Streaming.RequestAnimSet(lib, function()
		SetPedMovementClipset(PlayerPedId(), anim, true)
	end)
end

function startAnim(lib, anim)
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
	end)
end

function startScenario(anim)
	TaskStartScenarioInPlace(PlayerPedId(), anim, 0, false)
end 


--Gestion des menus
_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Animations", "")
_menuPool:Add(mainMenu)
--Fin gestion des menus


function AddMenuDemarcheVoixGPS(menu)


	personalmenu.demarche = {
		"Normal",
		"Homme effiminer",
		"Bouffiasse",
		"Dépressif",
		"Dépressive",
		"Muscle",
		"Hipster",
		"Business",
		"Intimide",
		"Clochard/Hobo",
		"Malheureux",
		"Triste",
		"Choc",
		"Sombre",
		"Fatiguer",
		"Presser",
		"Frimeur",
		"Fier",
		"Petite course",
		"Pupute",
		"Impertinente",
		"Arrogante",
		"Blesser",
		"Blesser 2",
		"Trop manger",
		"Casual",
		"Determiner",
		"Peureux",
		"Trop Swag",
		"Travailleur",
		"Brute",
		"Rando",
		"Gang",
		"Gangster",
		"Gangstère",
		"Gangster 2",
		"Gangster 3",
		"Un peu saoul",
		"Saoul",
		"Bien saoul",
		"Trop saoul",
	}



	local demarcheItem = NativeUI.CreateListItem("Démarches", personalmenu.demarche, actualDemarcheIndex)
	menu:AddItem(demarcheItem)


	menu.OnListSelect = function(sender, item, index)
		if item == demarcheItem then
			TriggerEvent('skinchanger:getSkin', function(skin)
				actualDemarche = item:IndexToItem(index)
				actualDemarcheIndex = index

				if actualDemarche == "Normal" then
					if skin.sex == 0 then
						startAttitude("move_m@multiplayer", "move_m@multiplayer")
					elseif skin.sex == 1 then
						startAttitude("move_f@multiplayer", "move_f@multiplayer")
					end
				elseif actualDemarche == "Homme effiminer" then
					startAttitude("move_m@confident", "move_m@confident")
				elseif actualDemarche == "Un peu saoul" then 
					startAttitude("move_m@drunk@a", "move_m@drunk@a")
				elseif actualDemarche == "Saoul" then 
					startAttitude("move_m@drunk@slightlydrunk", "move_m@drunk@slightlydrunk")
				elseif actualDemarche == "Bien saoul" then 
					startAttitude("move_m@drunk@moderatedrunk", "move_m@drunk@moderatedrunk")
				elseif actualDemarche == "Trop saoul" then 
					startAttitude("move_m@drunk@verydrunk", "move_m@drunk@verydrunk")
				elseif actualDemarche == "Bouffiasse" then
					startAttitude("move_f@heels@c","move_f@heels@c")
				elseif actualDemarche == "Blesser 2" then
					startAttitude("move_characters@orleans@core@","move_characters@orleans@core@")
				elseif actualDemarche == "Dépressif" then
					startAttitude("move_m@depressed@a","move_m@depressed@a")
				elseif actualDemarche == "Dépressive" then
					startAttitude("move_f@depressed@a","move_f@depressed@a")
				elseif actualDemarche == "Muscle" then
					startAttitude("move_m@muscle@a","move_m@muscle@a")
				elseif actualDemarche == "Hipster" then
					startAttitude("move_m@hipster@a","move_m@hipster@a")
				elseif actualDemarche == "Business" then
					startAttitude("move_m@business@a","move_m@business@a")
				elseif actualDemarche == "Intimide" then
					startAttitude("move_m@hurry@a","move_m@hurry@a")
				elseif actualDemarche == "Clochard/Hobo" then
					startAttitude("move_m@hobo@a","move_m@hobo@a")
				elseif actualDemarche == "Malheureux" then
					startAttitude("move_m@sad@a","move_m@sad@a")
				elseif actualDemarche == "Triste" then
					startAttitude("move_m@leaf_blower","move_m@leaf_blower")
				elseif actualDemarche == "Choc" then
					startAttitude("move_m@shocked@a","move_m@shocked@a")
				elseif actualDemarche == "Sombre" then
					startAttitude("move_m@shadyped@a","move_m@shadyped@a")
				elseif actualDemarche == "Fatiguer" then
					startAttitude("move_m@buzzed","move_m@buzzed")
				elseif actualDemarche == "Presser" then
					startAttitude("move_m@hurry_butch@a","move_m@hurry_butch@a")
				elseif actualDemarche == "Frimeur" then
					startAttitude("move_m@money","move_m@money")
				elseif actualDemarche == "Fier" then
					startAttitude("move_m@posh@","move_m@posh@")
				elseif actualDemarche == "Petite course" then
					startAttitude("move_m@quick","move_m@quick")
				elseif actualDemarche == "Pupute" then
					startAttitude("move_f@maneater","move_f@maneater")
				elseif actualDemarche == "Impertinente" then
					startAttitude("move_f@sassy","move_f@sassy")
				elseif actualDemarche == "Arrogante" then
					startAttitude("move_f@arrogant@a","move_f@arrogant@a")
				elseif actualDemarche == "Blesser" then
					startAttitude("move_m@injured","move_m@injured")
				elseif actualDemarche == "Trop manger" then
					startAttitude("move_m@fat@a","move_m@fat@a")
				elseif actualDemarche == "Casual" then
					startAttitude("move_m@casual@a","move_m@casual@a")
				elseif actualDemarche == "Determiner" then
					startAttitude("move_m@brave@a","move_m@brave@a")
				elseif actualDemarche == "Peureux" then
					startAttitude("move_m@scared","move_m@scared")
				elseif actualDemarche == "Trop Swag" then
					startAttitude("move_m@swagger@b","move_m@swagger@b")
				elseif actualDemarche == "Travailleur" then
					startAttitude("move_m@tool_belt@a","move_m@tool_belt@a")
				elseif actualDemarche == "Brute" then
					startAttitude("move_m@tough_guy@","move_m@tough_guy@")
				elseif actualDemarche == "Rando" then
					startAttitude("move_m@hiking","move_m@hiking")
				elseif actualDemarche == "Gangster 3" then
					startAttitude("move_m@gangster@ng","move_m@gangster@ng")
				elseif actualDemarche == "Gangster 2" then
					startAttitude("move_m@casual@e","move_m@casual@e")
				elseif actualDemarche == "Gangstère" then
					startAttitude("move_m@femme@","move_m@femme@")
				elseif actualDemarche == "Gang" then
					startAttitude("move_m@brave@b","move_m@brave@b")
				elseif actualDemarche == "Gangster" then
					startAttitude("move_m@casual@d","move_m@casual@d")
				end
			end)
		end
	end
end


--Création du premier submenu
function AddMenuAnimationMenu(menu)
	animMenu = _menuPool:AddSubMenu(menu, "Animations")

	local stop = NativeUI.CreateItem("Arrêter l'animation", "")

	animMenu.SubMenu.OnItemSelect = function(sender, item)
		local plyPed = PlayerPedId()
        if item == stop then
			if GetLastInputMethod(2) and not isDead then
				ClearPedTasks(plyPed)
			end
        end
	end

    animMenu.SubMenu:AddItem(stop)

	AddMenuDemarcheVoixGPS(mainMenu)
	AddSubMenuPartyMenu(animMenu)
	AddSubMenuTricksMenu(animMenu)
	AddSubMenuSaluteMenu(animMenu)
	AddSubMenuWorkMenu(animMenu)
	AddSubMenuSportsMenu(animMenu)
	AddSubMenuOtherMenu(animMenu)
	AddSubMenuPEGI21Menu(animMenu)
	ProutMenu(animMenu)
	--AddSubMenuDanseMenu(animMenu)
	
end 



function AddSubMenuPartyMenu(menu)
	animPartyMenu = _menuPool:AddSubMenu(menu.SubMenu, 'Festives')

	local cigaretteItem = NativeUI.CreateItem('Fumer une cigarette', "")
	animPartyMenu.SubMenu:AddItem(cigaretteItem)
	local musiqueItem = NativeUI.CreateItem('Jouer de la musique', "")
	animPartyMenu.SubMenu:AddItem(musiqueItem)
	local DJItem = NativeUI.CreateItem('DJ', "")
	animPartyMenu.SubMenu:AddItem(DJItem)
	local beerItem = NativeUI.CreateItem('Boire une bière', "")
	animPartyMenu.SubMenu:AddItem(beerItem)
	local dancingItem = NativeUI.CreateItem('Faire la fête', "")
	animPartyMenu.SubMenu:AddItem(dancingItem)
	local guitarItem = NativeUI.CreateItem('Air Guitar', "")
	animPartyMenu.SubMenu:AddItem(guitarItem)
	local shaggingItem = NativeUI.CreateItem('Air Shagging', "")
	animPartyMenu.SubMenu:AddItem(shaggingItem)
	local rockItem = NativeUI.CreateItem('Rock\'n\'roll', "")
	animPartyMenu.SubMenu:AddItem(rockItem)
	local bourreItem = NativeUI.CreateItem('Bourré sur place', "")
	animPartyMenu.SubMenu:AddItem(bourreItem)
	local vomitItem = NativeUI.CreateItem('Vomir en voiture', "")
	animPartyMenu.SubMenu:AddItem(vomitItem)

	animPartyMenu.SubMenu.OnItemSelect = function(sender, item, index)
		if item == cigaretteItem then
			startScenario("WORLD_HUMAN_SMOKING")
		elseif item == musiqueItem then
			startScenario("WORLD_HUMAN_MUSICIAN")
		elseif item == DJItem then
			startAnim("anim@mp_player_intcelebrationmale@dj", "dj")
		elseif item == beerItem then
				startScenario("WORLD_HUMAN_DRINKING")
		elseif item == dancingItem then
			startScenario("WORLD_HUMAN_PARTYING")
		elseif item == guitarItem then
			startAnim("anim@mp_player_intcelebrationmale@air_guitar", "air_guitar")
		elseif item == shaggingItem then
			startAnim("anim@mp_player_intcelebrationfemale@air_shagging", "air_shagging")
		elseif item == rockItem then
			startAnim("mp_player_int_upperrock", "mp_player_int_rock")
		elseif item == bourreItem then
			startAnim("amb@world_human_bum_standing@drunk@idle_a", "idle_a")
		elseif item == vomitItem then
			startAnim("oddjobs@taxi@tie", "vomit_outside")
		end
	end
end

function AddSubMenuTricksMenu(menu)
    animTricksMenu = _menuPool:AddSubMenu(menu.SubMenu, 'Tricks')
       
    local MotodItem = NativeUI.CreateItem('Moto - Jambe droite', "")
	animTricksMenu.SubMenu:AddItem(MotodItem)
	local MotogItem = NativeUI.CreateItem('Moto - Jambe gauche', "")
	animTricksMenu.SubMenu:AddItem(MotogItem)
	local MotodgItem = NativeUI.CreateItem('Moto - Droite et Gauche', "")
	animTricksMenu.SubMenu:AddItem(MotodgItem)
	local MotodbItem = NativeUI.CreateItem('Moto - Debout', "")
	animTricksMenu.SubMenu:AddItem(MotodbItem)
	

       
    animTricksMenu.SubMenu.OnItemSelect = function(sender, item, index)
        if item == MotodItem then
			startAnim("rcmextreme2atv", "idle_b")
		elseif item == MotogItem then
			startAnim("rcmextreme2atv", "idle_c")
		elseif item == MotodgItem then
			startAnim("rcmextreme2atv", "idle_d")
		elseif item == MotodbItem then
	        startAnim("rcmextreme2atv", "idle_e")	
        end
    end
end

function AddSubMenuSaluteMenu(menu)
	animSaluteMenu = _menuPool:AddSubMenu(menu.SubMenu, 'Gestes')

	local saluerItem = NativeUI.CreateItem('Saluer', "")
	animSaluteMenu.SubMenu:AddItem(saluerItem)
	local serrerItem = NativeUI.CreateItem('Serrer la main', "")
	animSaluteMenu.SubMenu:AddItem(serrerItem)
	local tchekItem = NativeUI.CreateItem('Tchek', "")
	animSaluteMenu.SubMenu:AddItem(tchekItem)
	local banditItem = NativeUI.CreateItem('Salut bandit', "")
	animSaluteMenu.SubMenu:AddItem(banditItem)
	local militaryItem = NativeUI.CreateItem('Salut Militaire', "")
	animSaluteMenu.SubMenu:AddItem(militaryItem)
	local military1Item = NativeUI.CreateItem('Hé ho par ici !', "")
	animSaluteMenu.SubMenu:AddItem(military1Item)
	local military2Item = NativeUI.CreateItem('Hé ho par ici ! 2', "")
	animSaluteMenu.SubMenu:AddItem(military2Item)
	local military3Item = NativeUI.CreateItem('Siffler', "")
	animSaluteMenu.SubMenu:AddItem(military3Item)
	local military4Item = NativeUI.CreateItem('A moi', "")
	animSaluteMenu.SubMenu:AddItem(military4Item)
	local military5Item = NativeUI.CreateItem('Avoir peur', "")
	animSaluteMenu.SubMenu:AddItem(military5Item)
	local military6Item = NativeUI.CreateItem('Balle dans la tete', "")
	animSaluteMenu.SubMenu:AddItem(military6Item)
	local military7Item = NativeUI.CreateItem('Branleur', "")
	animSaluteMenu.SubMenu:AddItem(military7Item)
	local military8Item = NativeUI.CreateItem('T\'es mon Bro !', "")
	animSaluteMenu.SubMenu:AddItem(military8Item)
	local military9Item = NativeUI.CreateItem("C'est pas possible !", "")
	animSaluteMenu.SubMenu:AddItem(military9Item)
	local military10Item = NativeUI.CreateItem('Calme-toi', "")
	animSaluteMenu.SubMenu:AddItem(military10Item)
	local military11Item = NativeUI.CreateItem('Crotte de nez', "")
	animSaluteMenu.SubMenu:AddItem(military11Item)
	local military12Item = NativeUI.CreateItem("Doigt d'honneur", "")
	animSaluteMenu.SubMenu:AddItem(military12Item)
	local military13Item = NativeUI.CreateItem("Etre épuisé", "")
	animSaluteMenu.SubMenu:AddItem(military13Item)
	local military14Item = NativeUI.CreateItem("Facepalm", "")
	animSaluteMenu.SubMenu:AddItem(military14Item)
	local military15Item = NativeUI.CreateItem("Facepalm 2", "")
	animSaluteMenu.SubMenu:AddItem(military15Item)
	local military16Item = NativeUI.CreateItem("Féliciter", "")
	animSaluteMenu.SubMenu:AddItem(military16Item)
	local military17Item = NativeUI.CreateItem("Fier", "")
	animSaluteMenu.SubMenu:AddItem(military17Item)
	local military18Item = NativeUI.CreateItem("Tu veux que je te Goume ?", "")
	animSaluteMenu.SubMenu:AddItem(military18Item)
	local military19Item = NativeUI.CreateItem("Fuck", "")
	animSaluteMenu.SubMenu:AddItem(military19Item)
	local military20Item = NativeUI.CreateItem("Je le savais, putain", "")
	animSaluteMenu.SubMenu:AddItem(military20Item)
	local shitItem = NativeUI.CreateItem('Je suis dans la sauce', "")
	animSaluteMenu.SubMenu:AddItem(shitItem)
	local embraceItem = NativeUI.CreateItem('Enlacer', "")
	animSaluteMenu.SubMenu:AddItem(embraceItem)
	local military21Item = NativeUI.CreateItem("Qu'est-ce qu'il y a ?", "")
	animSaluteMenu.SubMenu:AddItem(military21Item)
	local military22Item = NativeUI.CreateItem("Nananère", "")
	animSaluteMenu.SubMenu:AddItem(military22Item)
	local military23Item = NativeUI.CreateItem("On est pas sur BlueVinity nous ?", "")
	animSaluteMenu.SubMenu:AddItem(military23Item)
	local military24Item = NativeUI.CreateItem("Peace", "")
	animSaluteMenu.SubMenu:AddItem(military24Item)
	local military25Item = NativeUI.CreateItem("Poule mouillée", "")
	animSaluteMenu.SubMenu:AddItem(military25Item)
	local military26Item = NativeUI.CreateItem("Qu'est ce que j'ai fait ?", "")
	animSaluteMenu.SubMenu:AddItem(military26Item)
	local military27Item = NativeUI.CreateItem("Se craquer les doigts", "")
	animSaluteMenu.SubMenu:AddItem(military27Item)
	local military28Item = NativeUI.CreateItem("Super", "")
	animSaluteMenu.SubMenu:AddItem(military28Item)
	local military29Item = NativeUI.CreateItem("Toi", "")
	animSaluteMenu.SubMenu:AddItem(military29Item)
	local military30Item = NativeUI.CreateItem("Viens", "")
	animSaluteMenu.SubMenu:AddItem(military30Item)
	local military31Item = NativeUI.CreateItem("Crips", "")
	animSaluteMenu.SubMenu:AddItem(military31Item)
	local military32Item = NativeUI.CreateItem("Bloods", "")
	animSaluteMenu.SubMenu:AddItem(military32Item)
	local military33Item = NativeUI.CreateItem("Ballas", "")
	animSaluteMenu.SubMenu:AddItem(military33Item)
	
	








	animSaluteMenu.SubMenu.OnItemSelect = function(sender, item, index)
		if item == saluerItem then
			startAnim("gestures@m@standing@casual", "gesture_hello")
		elseif item == serrerItem then
			startAnim("mp_common", "givetake1_a")
		elseif item == tchekItem then
			startAnim("mp_ped_interaction", "handshake_guy_a")
		elseif item == banditItem then
			startAnim("mp_ped_interaction", "hugs_guy_a")
		elseif item == militaryItem then
			startAnim("mp_player_int_uppersalute", "mp_player_int_salute")
		elseif item == military1Item then
			startAnim("missexile2", "franklinwavetohelicopter")
		elseif item == military2Item then
			startAnim("random@car_thief@victimpoints_ig_3", "arms_waving")
		elseif item == military3Item then
			startAnim("rcmnigel1c", "hailing_whistle_waive_a")
		elseif item == military4Item then
			startAnim("gestures@m@standing@casual", "gesture_me")
		elseif item == military5Item then
			startAnim("amb@code_human_cower_stand@male@react_cowering", "base_right")
		elseif item == military6Item then
			startAnim("mp_suicide", "pistol")
		elseif item == military7Item then
			startAnim("mp_player_int_upperwank", "mp_player_int_wank_01")
		elseif item == military8Item then
			startAnim("anim@mp_player_intcelebrationmale@bro_love", "bro_love")
		elseif item == military9Item then
			startAnim("gestures@m@standing@casual", "gesture_damn")
		elseif item == military10Item then
			startAnim("gestures@m@standing@casual", "gesture_easy_now")
		elseif item == military11Item then
			startAnim("anim@mp_player_intcelebrationmale@nose_pick", "nose_pick")
		elseif item == military12Item then
			startAnim("mp_player_int_upperfinger", "mp_player_int_finger_02")
		elseif item == military13Item then
			startAnim("amb@world_human_jog_standing@male@idle_b", "idle_d")
		elseif item == military14Item then
			startAnim("anim@mp_player_intcelebrationmale@face_palm", "face_palm")
		elseif item == military15Item then
			startAnim("anim@mp_player_intupperface_palm", "idle_a")
		elseif item == military16Item then
			startScenario("WORLD_HUMAN_CHEERING")
		elseif item == military17Item then
			startAnim("rcmbarry", "base")
		elseif item == military18Item then
			startAnim("anim@deathmatch_intros@unarmed", "intro_male_unarmed_e")
		elseif item == military19Item then
			startAnim("anim@mp_player_intcelebrationmale@finger", "finger")
		elseif item == military20Item then
			startAnim("anim@am_hold_up@male", "shoplift_high")
		elseif item == military21Item then
			startAnim("gestures@m@standing@casual", "gesture_bring_it_on")
		elseif item == military22Item then
			startAnim("anim@mp_player_intcelebrationmale@thumb_on_ears", "thumb_on_ears")
		elseif item == military23Item then
			startAnim("missmic4premiere", "prem_actress_star_a")
		elseif item == military24Item then
			startAnim("anim@mp_player_intcelebrationmale@peace", "peace")
		elseif item == military25Item then
			startAnim("anim@mp_player_intcelebrationmale@chicken_taunt", "chicken_taunt")
		elseif item == military26Item then
			startAnim("oddjobs@assassinate@multi@", "react_big_variations_a")
		elseif item == military27Item then
			startAnim("anim@mp_player_intcelebrationmale@knuckle_crunch", "knuckle_crunch")
		elseif item == military28Item then
			startAnim("mp_action", "thanks_male_06")
		elseif item == military29Item then
			startAnim("gestures@m@standing@casual", "gesture_point")
		elseif item == military30Item then
			startAnim("gestures@m@standing@casual", "gesture_come_here_soft")
		elseif item == military31Item then
			startAnim("mp_player_int_uppergang_sign_a", "mp_player_int_gang_sign_a")
		elseif item == military32Item then
			startAnim("mp_player_int_uppergang_sign_b", "mp_player_int_gang_sign_b")
		elseif item == military33Item then
			startAnim("mp_player_int_upperv_sign", "mp_player_int_v_sign")
		elseif item == shitItem then
			startAnim("amb@world_human_bum_standing@depressed@idle_a", "idle_a")


		end
	end
end

function AddSubMenuWorkMenu(menu)
	animWorkMenu = _menuPool:AddSubMenu(menu.SubMenu, 'Travail')

	local suspectItem = NativeUI.CreateItem('Se rendre', "")
	animWorkMenu.SubMenu:AddItem(suspectItem)
	local fishermanItem = NativeUI.CreateItem('Pêcheur', "")
	animWorkMenu.SubMenu:AddItem(fishermanItem)
	local pInspectItem = NativeUI.CreateItem('Police : Enquêter', "")
	animWorkMenu.SubMenu:AddItem(pInspectItem)
	local pRadioItem = NativeUI.CreateItem('Police : Parler à la radio', "")
	animWorkMenu.SubMenu:AddItem(pRadioItem)
	local pCirculationItem = NativeUI.CreateItem('Police : Circulation', "")
	animWorkMenu.SubMenu:AddItem(pCirculationItem)
	local pBinocularsItem = NativeUI.CreateItem('Police : Jumelles', "")
	animWorkMenu.SubMenu:AddItem(pBinocularsItem)
	local aHarvestItem = NativeUI.CreateItem('Agriculture : Récolter', "")
	animWorkMenu.SubMenu:AddItem(aHarvestItem)
	local dRepairItem = NativeUI.CreateItem('Dépanneur : Réparer le moteur', "")
	animWorkMenu.SubMenu:AddItem(dRepairItem)
	local mObserveItem = NativeUI.CreateItem('Médecin : Observer', "")
	animWorkMenu.SubMenu:AddItem(mObserveItem)
	local tTalkItem = NativeUI.CreateItem('Taxi : Parler au client', "")
	animWorkMenu.SubMenu:AddItem(tTalkItem)
	local tBillItem = NativeUI.CreateItem('Taxi : Donner la facture', "")
	animWorkMenu.SubMenu:AddItem(tBillItem)
	local eBuyItem = NativeUI.CreateItem('Epicier : Donner les courses', "")
	animWorkMenu.SubMenu:AddItem(eBuyItem)
	local bShotItem = NativeUI.CreateItem('Barman : Servir un shot', "")
	animWorkMenu.SubMenu:AddItem(bShotItem)
	local jPictureItem = NativeUI.CreateItem('Journaliste : Prendre une photo', "")
	animWorkMenu.SubMenu:AddItem(jPictureItem)
	local NotesItem = NativeUI.CreateItem('Tout : Prendre des notes', "")
	animWorkMenu.SubMenu:AddItem(NotesItem)
	local HammerItem = NativeUI.CreateItem('Tout : Coup de marteau', "")
	animWorkMenu.SubMenu:AddItem(HammerItem)
	local sdfBegItem = NativeUI.CreateItem('SDF : Faire la manche', "")
	animWorkMenu.SubMenu:AddItem(sdfBegItem)
	local sdfStatueItem = NativeUI.CreateItem('SDF : Faire la statue', "")
	animWorkMenu.SubMenu:AddItem(sdfStatueItem)

	animWorkMenu.SubMenu.OnItemSelect = function(sender, item, index)
		if item == suspectItem then
			startAnim("random@arrests@busted", "idle_c")
		elseif item == fishermanItem then
			startScenario("world_human_stand_fishing")
		elseif item == pInspectItem then
			startAnim("amb@code_human_police_investigate@idle_b", "idle_f")
		elseif item == pRadioItem then
			startAnim("random@arrests", "generic_radio_chatter")
		elseif item == pCirculationItem then
			startScenario("WORLD_HUMAN_CAR_PARK_ATTENDANT")
		elseif item == pBinocularsItem then
			startScenario("WORLD_HUMAN_BINOCULARS")
		elseif item == aHarvestItem then
			startScenario("world_human_gardener_plant")
		elseif item == dRepairItem then
			startAnim("mini@repair", "fixing_a_ped")
		elseif item == mObserveItem then
			startScenario("CODE_HUMAN_MEDIC_KNEEL")
		elseif item == tTalkItem then
			startAnim("oddjobs@taxi@driver", "leanover_idle")
		elseif item == tBillItem then
			startAnim("oddjobs@taxi@cyi", "std_hand_off_ps_passenger")
		elseif item == eBuyItem then
			startAnim("mp_am_hold_up", "purchase_beerbox_shopkeeper")
		elseif item == bShotItem then
			startAnim("mini@drinking", "shots_barman_b")
		elseif item == jPictureItem then
			startScenario("WORLD_HUMAN_PAPARAZZI")
		elseif item == NotesItem then
			startScenario("WORLD_HUMAN_CLIPBOARD")
		elseif item == HammerItem then
			startScenario("WORLD_HUMAN_HAMMERING")
		elseif item == sdfBegItem then
			startScenario("WORLD_HUMAN_BUM_FREEWAY")
		elseif item == sdfStatueItem then
			startScenario("WORLD_HUMAN_HUMAN_STATUE")
		end
	end
end



function AddSubMenuSportsMenu(menu)
	animSportMenu = _menuPool:AddSubMenu(menu.SubMenu, 'Sports')

	local muscleItem = NativeUI.CreateItem('Montrer ses muscles', "")
	animSportMenu.SubMenu:AddItem(muscleItem)
	local weightbarItem = NativeUI.CreateItem('Barre de musculation', "")
	animSportMenu.SubMenu:AddItem(weightbarItem)
	local pushupItem = NativeUI.CreateItem('Faire des pompes', "")
	animSportMenu.SubMenu:AddItem(pushupItem)
	local absItem = NativeUI.CreateItem('Faire des abdos', "")
	animSportMenu.SubMenu:AddItem(absItem)
	local yogaItem = NativeUI.CreateItem('Faire du yoga', "")
	animSportMenu.SubMenu:AddItem(yogaItem)

	animSportMenu.SubMenu.OnItemSelect = function(sender, item, index)
		if item == muscleItem then
			startAnim("amb@world_human_muscle_flex@arms_at_side@base", "base")
		elseif item == weightbarItem then
			startAnim("amb@world_human_muscle_free_weights@male@barbell@base", "base")
		elseif item == pushupItem then
			startAnim("amb@world_human_push_ups@male@base", "base")
		elseif item == absItem then
			startAnim("amb@world_human_sit_ups@male@base", "base")
		elseif item == yogaItem then
			startAnim("amb@world_human_yoga@male@base", "base_a")
        end
	end
end

function AddSubMenuOtherMenu(menu)
	animOtherMenu = _menuPool:AddSubMenu(menu.SubMenu, 'Divers')

	local sitItem = NativeUI.CreateItem("S'asseoir", "")
	animOtherMenu.SubMenu:AddItem(sitItem)
	local sit2Item = NativeUI.CreateItem("S'asseoir par terre en souffrance", "")
	animOtherMenu.SubMenu:AddItem(sit2Item)
	local sit3Item = NativeUI.CreateItem("S'asseoir en croisant les bras ( Version Féminine )", "")
	animOtherMenu.SubMenu:AddItem(sit3Item)
	local sit4Item = NativeUI.CreateItem("S'asseoir en croisant les bras ( Version Masculine )", "")
	animOtherMenu.SubMenu:AddItem(sit4Item)
	local sit6Item = NativeUI.CreateItem("S'asseoir en mode YZK", "")
	animOtherMenu.SubMenu:AddItem(sit6Item)
	local waitwall5Item = NativeUI.CreateItem('Attendre contre un mur 1', "")
	animOtherMenu.SubMenu:AddItem(waitwall5Item)
	local waitwall2Item = NativeUI.CreateItem('Attendre contre un mur 2', "")
	animOtherMenu.SubMenu:AddItem(waitwall2Item)
	local waitwall3Item = NativeUI.CreateItem('Attendre contre un mur 3', "")
	animOtherMenu.SubMenu:AddItem(waitwall3Item)
	local waitwall4Item = NativeUI.CreateItem('Attendre contre un mur 4', "")
	animOtherMenu.SubMenu:AddItem(waitwall4Item)
	local waitwallItem = NativeUI.CreateItem('Attendre contre un mur ( Aléatoire )', "")
	animOtherMenu.SubMenu:AddItem(waitwallItem)
	local cafeItem = NativeUI.CreateItem("Boire un café", "")
	animOtherMenu.SubMenu:AddItem(cafeItem)
	local onthebackItem = NativeUI.CreateItem('Couché sur le dos', "")
	animOtherMenu.SubMenu:AddItem(onthebackItem)
	local stomachItem = NativeUI.CreateItem('Couché sur le ventre', "")
	animOtherMenu.SubMenu:AddItem(stomachItem)
	local inconsItem = NativeUI.CreateItem("Etre inconscient", "")
	animOtherMenu.SubMenu:AddItem(inconsItem)
	local phone1Item = NativeUI.CreateItem("Filmer avec son Iphone", "")
	animOtherMenu.SubMenu:AddItem(phone1Item)
	local phone2Item = NativeUI.CreateItem("Filmer avec son Nokia 3310", "")
	animOtherMenu.SubMenu:AddItem(phone2Item)
	local phone3Item = NativeUI.CreateItem("Jouer sur son portable", "")
	animOtherMenu.SubMenu:AddItem(phone3Item)
	local cleanItem = NativeUI.CreateItem('Nettoyer', "")
	animOtherMenu.SubMenu:AddItem(cleanItem)
	local cookingItem = NativeUI.CreateItem('Préparer à manger', "")
	animOtherMenu.SubMenu:AddItem(cookingItem)
	local searchItem = NativeUI.CreateItem('Position de fouille', "")
	animOtherMenu.SubMenu:AddItem(searchItem)
	local selfieItem = NativeUI.CreateItem('Prendre un selfie', "")
	animOtherMenu.SubMenu:AddItem(selfieItem)
	local doorItem = NativeUI.CreateItem('Ecouter à une porte', "")
	animOtherMenu.SubMenu:AddItem(doorItem)
	local fouilleItem = NativeUI.CreateItem('Position de fouille', "")
	animOtherMenu.SubMenu:AddItem(fouilleItem)
	local porte1Item = NativeUI.CreateItem('Ecouter à une porte', "")
	animOtherMenu.SubMenu:AddItem(porte1Item)
	local porte2Item = NativeUI.CreateItem('Frapper à une porte', "")
	animOtherMenu.SubMenu:AddItem(porte2Item)
	local rondItem = NativeUI.CreateItem('Tourner en rond', "")
	animOtherMenu.SubMenu:AddItem(rondItem)
	local stopItem = NativeUI.CreateItem('Faire du stop', "")
	animOtherMenu.SubMenu:AddItem(stopItem)
	local ragdollItem = NativeUI.CreateItem('Dormir / Réveiller', "")
	animOtherMenu.SubMenu:AddItem(ragdollItem)

	animOtherMenu.SubMenu.OnItemSelect = function(sender, item, index)
		if item == sitItem then
			startAnim("anim@heists@prison_heistunfinished_biztarget_idle", "target_idle")
		elseif item == sit2Item then
			startAnim("anim@heists@prison_heistig_5_P1_rashkovsky_idle", "idle_180")
		elseif item == sit3Item then
			startAnim("anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_idle_nowork")
		elseif item == sit4Item then
			startAnim("anim@heists@fleeca_bank@ig_7_jetski_owner", "owner_idle")
		elseif item == sit6Item then
			startAnim("rcm_barry3", "barry_3_sit_loop")
		elseif item == inconsItem then
			startAnim("missheistfbi3b_ig8_2", "cower_loop_victim")
		elseif item == waitwall2Item then
			startAnim("amb@world_human_leaning@male@wall@back@legs_crossed@base", "base")
		elseif item == waitwall3Item then
			startAnim("amb@world_human_leaning@male@wall@back@foot_up@idle_a", "idle_a")
		elseif item == waitwall4Item then
			startAnim("amb@world_human_leaning@male@wall@back@hands_together@idle_a", "idle_b")
		elseif item == waitwall5Item then
			startAnim("misstrvram_4", "thugs_idle_b")
		elseif item == waitwallItem then
			startScenario("world_human_leaning")
		elseif item == onthebackItem then
			startScenario("WORLD_HUMAN_SUNBATHE_BACK")
		elseif item == stomachItem then
			startScenario("WORLD_HUMAN_SUNBATHE")
		elseif item == cleanItem then
			startScenario("world_human_maid_clean")
		elseif item == cookingItem then
			startScenario("PROP_HUMAN_BBQ")
		elseif item == searchItem then
			startAnim("mini@prostitutes@sexlow_veh", "low_car_bj_to_prop_female")
		elseif item == selfieItem then
			startScenario("world_human_tourist_mobile")
		elseif item == doorItem then
			startAnim("mini@safe_cracking", "idle_base")
		elseif item == cafeItem then
			startAnim("amb@world_human_aa_coffee@idle_a", "idle_a")
		elseif item == phone1Item then
			startScenario("WORLD_HUMAN_TOURIST_MOBILE")
		elseif item == phone2Item then
			startScenario("WORLD_HUMAN_MOBILE_FILM_SHOCKING")
		elseif item == phone3Item then
			startScenario("WORLD_HUMAN_STAND_MOBILE")
		elseif item == fouilleItem then
			startAnim("nm@hands", "natural")
		elseif item == porte1Item then
			startAnim("mini@safe_cracking", "idle_base")
		elseif item == porte2Item then
			startAnim("timetable@jimmy@doorknock@", "knockdoor_idle")
		elseif item == rondItem then
			startAnim("timetable@ron@ig_1", "ig_1_idle_a")
		elseif item == stop2Item then
			startAnim("random@hitch_lift", "idle_f")		
		elseif item == ragdollItem then
			while true do 
				Wait(0)
				local myPed = GetPlayerPed(-1)
				SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
				ESX.ShowHelpNotification ("Appuyez sur ~INPUT_JUMP~ pour ~b~vous relever")
				ResetPedRagdollTimer(myPed)
				-- _menuPool:CloseAllMenus()
				if IsControlJustPressed(0, 22) then 
					break
				end
			end
		end
	end
end

function AddSubMenuPEGI21Menu(menu)
	animPegiMenu = _menuPool:AddSubMenu(menu.SubMenu, 'Que du sale !')

	local hSuckItem = NativeUI.CreateItem('Se faire suc** en voiture', "")
	animPegiMenu.SubMenu:AddItem(hSuckItem)
	local fSuckItem = NativeUI.CreateItem('Suc** en voiture', "")
	animPegiMenu.SubMenu:AddItem(fSuckItem)
	local hFuckItem = NativeUI.CreateItem('Homme bais** en voiture', "")
	animPegiMenu.SubMenu:AddItem(hFuckItem)
	local fFuckItem = NativeUI.CreateItem('Femme bais** en voiture', "")
	animPegiMenu.SubMenu:AddItem(fFuckItem)
	local scratchItem = NativeUI.CreateItem('Se gratter les couilles', "")
	animPegiMenu.SubMenu:AddItem(scratchItem)
	local fesseItem = NativeUI.CreateItem('Se gratter les fesses', "")
	animPegiMenu.SubMenu:AddItem(fesseItem)
	local charmItem = NativeUI.CreateItem('Faire du charme', "")
	animPegiMenu.SubMenu:AddItem(charmItem)
	local golddiggerItem = NativeUI.CreateItem('Pose michto', "")
	animPegiMenu.SubMenu:AddItem(golddiggerItem)
	local breastItem = NativeUI.CreateItem('Montrer sa poitrine', "")
	animPegiMenu.SubMenu:AddItem(breastItem)
	local strip1Item = NativeUI.CreateItem('Strip Tease YZK', "")
	animPegiMenu.SubMenu:AddItem(strip1Item)
	local strip2Item = NativeUI.CreateItem('Strip Tease YZK2', "")
	animPegiMenu.SubMenu:AddItem(strip2Item)
	local stripfloorItem = NativeUI.CreateItem('Strip Tease éclaté au sol', "")
	animPegiMenu.SubMenu:AddItem(stripfloorItem)
	local weedItem = NativeUI.CreateItem('Fumer un joint', "")
	animPegiMenu.SubMenu:AddItem(weedItem)

	animPegiMenu.SubMenu.OnItemSelect = function(sender, item, index)
		if item == hSuckItem then
			startAnim("oddjobs@towing", "m_blow_job_loop")
		elseif item == fSuckItem then
			startAnim("oddjobs@towing", "f_blow_job_loop")
		elseif item == weedItem then
			startScenario("WORLD_HUMAN_SMOKING_POT")
		elseif item == hFuckItem then
			startAnim("mini@prostitutes@sexlow_veh", "low_car_sex_loop_player")
		elseif item == fFuckItem then
			startAnim("mini@prostitutes@sexlow_veh", "low_car_sex_loop_female")
		elseif item == scratchItem then
			startAnim("mp_player_int_uppergrab_crotch", "mp_player_int_grab_crotch")
		elseif item == fesseItem then
			startAnim("mp_player_int_upperarse_pick", "mp_player_int_arse_pick")
		elseif item == charmItem then
			startAnim("mini@strip_club@idles@stripper", "stripper_idle_02")
		elseif item == golddiggerItem then
			startScenario("WORLD_HUMAN_PROSTITUTE_HIGH_CLASS")
		elseif item == breastItem then
			startAnim("mini@strip_club@backroom@", "stripper_b_backroom_idle_b")
		elseif item == strip1Item then
			startAnim("mini@strip_club@lap_dance@ld_girl_a_song_a_p1", "ld_girl_a_song_a_p1_f")
		elseif item == strip2Item then
			startAnim("mini@strip_club@private_dance@part2", "priv_dance_p2")
		elseif item == stripfloorItem then
			startAnim("mini@strip_club@private_dance@part3", "priv_dance_p3")
		end
	end
end 


function ProutMenu(menu)
	ProutPegiMenu = _menuPool:AddSubMenu(menu.SubMenu, 'Danses')

	local danse1Item = NativeUI.CreateItem('Danse 1', "")
	ProutPegiMenu.SubMenu:AddItem(danse1Item)
	local danse2Item = NativeUI.CreateItem('Danse 2', "")
	ProutPegiMenu.SubMenu:AddItem(danse2Item)
	local danse3Item = NativeUI.CreateItem('Danse 3', "")
	ProutPegiMenu.SubMenu:AddItem(danse3Item)
	local danse4Item = NativeUI.CreateItem('Danse 4', "")
	ProutPegiMenu.SubMenu:AddItem(danse4Item)
	local danse5Item = NativeUI.CreateItem('Danse 5', "")
	ProutPegiMenu.SubMenu:AddItem(danse5Item)
	local danse6Item = NativeUI.CreateItem('Danse 6', "")
	ProutPegiMenu.SubMenu:AddItem(danse6Item)
	local danse7Item = NativeUI.CreateItem('Danse 7', "")
	ProutPegiMenu.SubMenu:AddItem(danse7Item)
	local danse8Item = NativeUI.CreateItem('Danse 8', "")
	ProutPegiMenu.SubMenu:AddItem(danse8Item)
	local danse9Item = NativeUI.CreateItem('Danse 9', "")
	ProutPegiMenu.SubMenu:AddItem(danse9Item)
	local danse10Item = NativeUI.CreateItem('Danse 10', "")
	ProutPegiMenu.SubMenu:AddItem(danse10Item)
	local danse11Item = NativeUI.CreateItem('Danse 11', "")
	ProutPegiMenu.SubMenu:AddItem(danse11Item)
	local danse12Item = NativeUI.CreateItem('Danse 12', "")
	ProutPegiMenu.SubMenu:AddItem(danse12Item)
	local danse13Item = NativeUI.CreateItem('Danse 13', "")
	ProutPegiMenu.SubMenu:AddItem(danse13Item)
	local danse14Item = NativeUI.CreateItem('Danse 14', "")
	ProutPegiMenu.SubMenu:AddItem(danse14Item)
	local danse15Item = NativeUI.CreateItem('Danse 15', "")
	ProutPegiMenu.SubMenu:AddItem(danse15Item)
	local danse16Item = NativeUI.CreateItem('Danse 16', "")
	ProutPegiMenu.SubMenu:AddItem(danse16Item)
	local danse17Item = NativeUI.CreateItem('Danse 17', "")
	ProutPegiMenu.SubMenu:AddItem(danse17Item)
	local danse18Item = NativeUI.CreateItem('Danse 18', "")
	ProutPegiMenu.SubMenu:AddItem(danse18Item)
	local danse19Item = NativeUI.CreateItem('Danse 19', "")
	ProutPegiMenu.SubMenu:AddItem(danse19Item)
	local danse20Item = NativeUI.CreateItem('Danse 20', "")
	ProutPegiMenu.SubMenu:AddItem(danse20Item)
	local danse21Item = NativeUI.CreateItem('Danse 21', "")
	ProutPegiMenu.SubMenu:AddItem(danse21Item)
	local danse22Item = NativeUI.CreateItem('Danse 22', "")
	ProutPegiMenu.SubMenu:AddItem(danse22Item)
	local danse23Item = NativeUI.CreateItem('Danse 23', "")
	ProutPegiMenu.SubMenu:AddItem(danse23Item)
	local danse24Item = NativeUI.CreateItem('Danse 24', "")
	ProutPegiMenu.SubMenu:AddItem(danse24Item)
	local danse25Item = NativeUI.CreateItem('Danse 25', "")
	ProutPegiMenu.SubMenu:AddItem(danse25Item)
	local danse26Item = NativeUI.CreateItem('Danse 26', "")
	ProutPegiMenu.SubMenu:AddItem(danse26Item)
	local danse27Item = NativeUI.CreateItem('Danse 27', "")
	ProutPegiMenu.SubMenu:AddItem(danse27Item)
	local danse28Item = NativeUI.CreateItem('Danse 28', "")
	ProutPegiMenu.SubMenu:AddItem(danse28Item)
	local danse29Item = NativeUI.CreateItem('Danse 29', "")
	ProutPegiMenu.SubMenu:AddItem(danse29Item)
	local danse30Item = NativeUI.CreateItem('Danse 30', "")
	ProutPegiMenu.SubMenu:AddItem(danse30Item)
	local danse31Item = NativeUI.CreateItem('Danse 31', "")
	ProutPegiMenu.SubMenu:AddItem(danse31Item)
	local danse32Item = NativeUI.CreateItem('Danse 32', "")
	ProutPegiMenu.SubMenu:AddItem(danse32Item)
	local danse33Item = NativeUI.CreateItem('Danse 33', "")
	ProutPegiMenu.SubMenu:AddItem(danse33Item)
	local danse34Item = NativeUI.CreateItem('Danse 34', "")
	ProutPegiMenu.SubMenu:AddItem(danse34Item)
	local danse35Item = NativeUI.CreateItem('Danse 35', "")
	ProutPegiMenu.SubMenu:AddItem(danse35Item)
	local danse36Item = NativeUI.CreateItem('Danse 36', "")
	ProutPegiMenu.SubMenu:AddItem(danse36Item)
	local danse37Item = NativeUI.CreateItem('Danse 37', "")
	ProutPegiMenu.SubMenu:AddItem(danse37Item)
	local danse38Item = NativeUI.CreateItem('Danse 38', "")
	ProutPegiMenu.SubMenu:AddItem(danse38Item)
	local danse39Item = NativeUI.CreateItem('Danse 39', "")
	ProutPegiMenu.SubMenu:AddItem(danse39Item)


    ProutPegiMenu.SubMenu.OnItemSelect = function(sender, item, index)
	    if item == danse1Item then
			startAnim("anim@amb@nightclub@dancers@club_ambientpeds@med-hi_intensity", "mi-hi_amb_club_10_v1_male^6")
	    elseif item == danse2Item then
			startAnim("amb@code_human_in_car_mp_actions@dance@bodhi@ds@base", "idle_a_fp")
	    elseif item == danse3Item then
			startAnim("amb@code_human_in_car_mp_actions@dance@bodhi@rds@base", "idle_b")
		elseif item == danse4Item then
			startAnim("amb@code_human_in_car_mp_actions@dance@std@ds@base", "idle_a")
		elseif item == danse5Item then
			startAnim("anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_male^6")
		elseif item == danse6Item then
			startAnim("anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_male^6")
		elseif item == danse7Item then
			startAnim("anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", "trans_dance_facedj_hi_to_li_09_v1_male^6")					
		elseif item == danse8Item then
			startAnim("anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", "trans_dance_facedj_li_to_hi_07_v1_male^6")
		elseif item == danse9Item then
			startAnim("anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_13_v2_male^6")	
		elseif item == danse10Item then
			startAnim("anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", "trans_dance_crowd_hi_to_li__07_v1_male^6")	
		elseif item == danse11Item then
			startAnim("anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", "hi_dance_prop_13_v1_male^6")	
		elseif item == danse12Item then
			startAnim("anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", "trans_crowd_prop_mi_to_li_11_v1_male^6")
		elseif item == danse13Item then
			startAnim("anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "med_center_up")	
		elseif item == danse14Item then
			startAnim("anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "med_right_up")
		elseif item == danse15Item then
			startAnim("anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v1_male^6")	
		elseif item == danse16Item then
			startAnim("anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", "trans_dance_facedj_mi_to_li_09_v1_male^6")
		elseif item == danse17Item then
			startAnim("timetable@tracy@ig_5@idle_b", "idle_e")	
		elseif item == danse18Item then
			startAnim("mini@strip_club@idles@dj@idle_04", "idle_04")	
		elseif item == danse19Item then
			startAnim("special_ped@mountain_dancer@monologue_1@monologue_1a", "mtn_dnc_if_you_want_to_get_to_heaven")																		
		elseif item == danse20Item then
			startAnim("special_ped@mountain_dancer@monologue_4@monologue_4a", "mnt_dnc_verse")															
		elseif item == danse21Item then
			startAnim("special_ped@mountain_dancer@monologue_3@monologue_3a", "mnt_dnc_buttwag")
		elseif item == danse22Item then
			startAnim("anim@amb@nightclub@dancers@black_madonna_entourage@", "hi_dance_facedj_09_v2_male^5")	
		elseif item == danse23Item then
			startAnim("anim@amb@nightclub@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_male^6")	
		elseif item == danse24Item then
			startAnim("anim@amb@nightclub@dancers@dixon_entourage@", "mi_dance_facedj_15_v1_male^4")		
		elseif item == danse25Item then
			startAnim("anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_06_base_laz")	
		elseif item == danse26Item then
			startAnim("anim@amb@nightclub@dancers@tale_of_us_entourage@", "mi_dance_prop_13_v2_male^4")	
		elseif item == danse27Item then
			startAnim("misschinese2_crystalmazemcs1_cs", "dance_loop_tao")	
		elseif item == danse28Item then
			startAnim("misschinese2_crystalmazemcs1_ig", "dance_loop_tao")	
		elseif item == danse29Item then
			startAnim("anim@mp_player_intcelebrationfemale@uncle_disco", "uncle_disco")	
		elseif item == danse30Item then
			startAnim("anim@mp_player_intcelebrationfemale@raise_the_roof", "raise_the_roof")	
		elseif item == danse31Item then
			startAnim("anim@mp_player_intcelebrationmale@cats_cradle", "cats_cradle")
		elseif item == danse32Item then
			startAnim("anim@mp_player_intupperbanging_tunes", "idle_a")		
		elseif item == danse33Item then
			startAnim("anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center")	
		elseif item == danse34Item then
			startAnim("anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center")	
		elseif item == danse35Item then
			startAnim("anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center")	
		elseif item == danse36Item then
			startAnim("anim@amb@nightclub@dancers@crowddance_facedj_transitions@", "trans_dance_facedj_hi_to_mi_11_v1_female^6")	
		elseif item == danse37Item then
			startAnim("anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", "trans_dance_facedj_hi_to_li_07_v1_female^6")	
		elseif item == danse38Item then
			startAnim("anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_female^6")	
		elseif item == danse39Item then
			startAnim("anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v1_female^6")	
		end
	end
end 




--Fin création du submenu déclenché plus haut 


--Gestion des menus
AddMenuAnimationMenu(mainMenu) --Register la fonction dans le menu creé = mainMenu. Menu principal creé plus haut avec _menuPool:Add(mainMenu)
_menuPool:RefreshIndex()
_menuPool:MouseControlsEnabled(false)-- Disable la souris
_menuPool:ControlDisablingEnabled(false)-- Enable les controls claviers... quand même 
--Fin gestion des menus


--Ouverture du menu avec une touche 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        if IsControlJustPressed(1, 170) then -- F3 Mashallaw YZK le plus Beau
            mainMenu:Visible(not mainMenu:Visible())
        end
    end
end)


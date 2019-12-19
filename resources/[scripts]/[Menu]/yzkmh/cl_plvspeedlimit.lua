--------------------
-------Config-------
--------------------

mphmode = false -- This enables MPH. Use false to use kmh

menukey = 108 -- This is the control ID to open the menu. Default is [E]. You can find all control IDs here : https://docs.fivem.net/game-references/controls/

speed1 = 10.0 -- This is the first speed in the menu. 10 MPH by default. All the other speeds are configurable.

speed2 = 25.0

speed3 = 40.0

speed4 = 75.0

speed5 = 100.0

speed6 = 150.0

speed7 = 175.0

speed8 = 200.0

speed9 = 250.0

speed10 = 300.0

--------------------
--------------------
--------------------

-----------------------------------------
--DO NOT TOUCH ANYTHING BELOW THIS LINE--
-----------------------------------------

veh = false ----- Do *NOT* touch this. This is a bool used for the vehicle function which checks if you are in a vehicle or not.

Citizen.CreateThread(function() -- This function checks if you are or are not in a vehicle.
    while true do
        Citizen.Wait(100)
        local ped = GetPlayerPed(-1)
        if IsPedInAnyVehicle(ped, false) then 
            veh = true 
        elseif not IsPedInAnyVehicle(ped, false) then 
            veh = false 
        end
    end 
end)

resetspeed = 99999.9 -----Do *NOT* touch this. It is used to revert your max speed. [If you somehow achieve this speed you have my approval]

--NOTE: Each value needs to have a .[number] Do *NOT* leave a value [number]--

--This contains the main menu title and description!
_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Vitesse", "Limitateur de Vitesse !")
_menuPool:Add(mainMenu)

--This is where it all begins. From here you can find all of the different menu options. 
function FirstItem(menu) 

    if mphmode == false then -- This checks if mphmode is true or false. It will use the corresponding value you gave!
        speedtext = "km/h"
        speeddivider = 3.6 -- This is used to convert the M/S that is the default speed used for setting max speed to KM/H. Same goes for MP/H
    else
        speedtext = "mp/h!"
        speeddivider = 2.237
    end

    local click1 = NativeUI.CreateItem( speed1.. " " ..speedtext, "Mettre le limitateur de vitesse sur ~y~" ..speed1.. " ~w~" ..speedtext) --Speed 1 
    local click2 = NativeUI.CreateItem( speed2.. " " ..speedtext, "Mettre le limitateur de vitesse sur ~y~" ..speed2.. " ~w~" ..speedtext) --Speed 2
    local click3 = NativeUI.CreateItem( speed3.. " " ..speedtext, "Mettre le limitateur de vitesse sur ~y~" ..speed3.. " ~w~" ..speedtext) --Speed 3
    local click4 = NativeUI.CreateItem( speed4.. " " ..speedtext, "Mettre le limitateur de vitesse sur ~y~" ..speed4.. " ~w~" ..speedtext) --Speed 4
    local click5 = NativeUI.CreateItem( speed5.. " " ..speedtext, "Mettre le limitateur de vitesse sur ~y~" ..speed5.. " ~w~" ..speedtext) --Speed 5
    local click6 = NativeUI.CreateItem( speed6.. " " ..speedtext, "Mettre le limitateur de vitesse sur ~y~" ..speed6.. " ~w~" ..speedtext) --Speed 6
    local click7 = NativeUI.CreateItem( speed7.. " " ..speedtext, "Mettre le limitateur de vitesse sur ~y~" ..speed7.. " ~w~" ..speedtext) --Speed 7
    local click8 = NativeUI.CreateItem( speed8.. " " ..speedtext, "Mettre le limitateur de vitesse sur ~y~" ..speed8.. " ~w~" ..speedtext) --Speed 8
    local click9 = NativeUI.CreateItem( speed9.. " " ..speedtext, "Mettre le limitateur de vitesse sur ~y~" ..speed9.. " ~w~" ..speedtext) --Speed 9
    local click10 = NativeUI.CreateItem( speed10.. " " ..speedtext, "Mettre le limitateur de vitesse sur ~y~" ..speed10.. " ~w~" ..speedtext) --Speed 10
    local click11 = NativeUI.CreateItem( "~r~Vitesse Normale", "Cela remettra votre vitesse de base") --Speed Reset

    menu.OnItemSelect = function(sender, item, index)

        if veh == true then -- If the value returned from the vehicle function is true then continue on else display an error notification.

            if item == click1 then -- If the item (speed1 in this case) is clicked do this ;
                SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), speed1/speeddivider ) --Sets you speed to well, speed1. 
                notify("~g~VINITY LIFE ~w~: Vitesse programmée sur ~y~" ..speed1.. " ~w~" ..speedtext) --Notifies you idiots that you speed has been set :) Then this repeats for the other 9 speeds.

            elseif item == click2 then  
                SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), speed2/speeddivider )
                notify("~g~VINITY LIFE ~w~: Vitesse programmée sur ~y~" .. speed2 .. " ~w~" ..speedtext)

            elseif item == click3 then                
                SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), speed3/speeddivider )
                notify("~g~VINITY LIFE ~w~: Vitesse programmée sur ~y~" .. speed3 .. " ~w~" ..speedtext)

            elseif item == click4 then                
                SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), speed4/speeddivider )
                notify("~g~VINITY LIFE ~w~: Vitesse programmée sur ~y~" .. speed4 .. " ~w~" ..speedtext)

            elseif item == click5 then                
                SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), speed5/speeddivider )
                notify("~g~VINITY LIFE ~w~: Vitesse programmée sur ~y~" .. speed5 .. " ~w~" ..speedtext)

            elseif item == click6 then                
                SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), speed6/speeddivider )
                notify("~g~VINITY LIFE ~w~: Vitesse programmée sur ~y~" .. speed6 .. " ~w~" ..speedtext)

            elseif item == click7 then                
                SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), speed7/speeddivider )
                notify("~g~VINITY LIFE ~w~: Vitesse programmée sur ~y~" .. speed7 .. " ~w~" ..speedtext)

            elseif item == click8 then                
                SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), speed8/speeddivider )
                notify("~g~VINITY LIFE ~w~: Vitesse programmée sur ~y~" .. speed8 .. " ~w~" ..speedtext)

            elseif item == click9 then               
                SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), speed9/speeddivider )
                notify("~g~VINITY LIFE ~w~: Vitesse programmée sur ~y~" .. speed9 .. " ~w~" ..speedtext)

            elseif item == click10 then                
                SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), speed10/speeddivider )
                notify("~g~VINITY LIFE ~w~: Vitesse programmée sur ~y~" .. speed10 .. " ~w~" ..speedtext)

            elseif item == click11 then
                SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), resetspeed )
                notify("~g~VINITY LIFE ~w~: Votre Vitesse a été remis a zéro !")
            
            end

        elseif item == click11 then
            SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), resetspeed )
            notify("~g~VINITY LIFE ~w~: Votre Vitesse a été remis a zéro !")

        else 
            notify("~r~ERREUR ~w~: Vous devez �tre dans un véhicule pour définir une vitesse !") --No vehicle alert.
            SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), resetspeed ) -- Resets your max speed.
            Wait(1000) --Waits 1 second so you can read that notification.
            notify("~y~INFO ~w~: La Vitesse a �t� remis a z�ro !") -- Then you are notified that your speed has been reset.

        end

    end

    menu:AddItem(click1) -- Adds the items to the menu. 
    menu:AddItem(click2)
    menu:AddItem(click3)
    menu:AddItem(click4)
    menu:AddItem(click5)
    menu:AddItem(click6)
    menu:AddItem(click7)
    menu:AddItem(click8)
    menu:AddItem(click9)
    menu:AddItem(click10)
    menu:AddItem(click11)
    ped = GetPlayerPed(-1) -- Ped variable.
    
end

FirstItem(mainMenu)
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        if IsControlJustPressed(1, menukey) then -- If the key you specified in the config is pressed open then menu, if the menu is open close the menu.
            mainMenu:Visible(not mainMenu:Visible())
        end
    end
end)

function notify(text) -- This function is used to notify you. [Box with text that appears just above the minimap]
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end

--------------------
--------END---------
--------------------
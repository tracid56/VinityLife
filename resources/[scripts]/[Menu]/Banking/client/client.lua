local atms = {
    {name="ATM", id=277, x=150.266, y=-1040.203, z=29.374},
    {name="ATM", id=277, x=-1212.980, y=-330.841, z=37.787},
    {name="ATM", id=277, x=-2962.582, y=482.627, z=15.703},
    {name="ATM", id=277, x=-112.202, y=6469.295, z=31.626},
    {name="ATM", id=277, x=314.187, y=-278.621, z=54.170},
    {name="ATM", id=277, x=-351.534, y=-49.529, z=49.042},
    {name="ATM", id=277, x=174.6720, y=6637.218, z=31.784},
    {name="ATM", id=277, x=1703.138, y=6426.783, z=32.730},
    {name="ATM", id=277, x=1735.114, y=6411.035, z=35.164},
    {name="ATM", id=277, x=1702.842, y=4933.593, z=42.051},
    {name="ATM", id=277, x=1967.333, y=3744.293, z=32.272},
    {name="ATM", id=277, x=1821.917, y=3683.483, z=34.244},
    {name="ATM", id=277, x=1174.532, y=2705.278, z=38.027},
    {name="ATM", id=277, x=540.0420, y=2671.007, z=42.177},
    {name="ATM", id=277, x=149.4551, y=-1038.95, z=29.366},
    {name="ATM", id=277, x=2558.683, y=349.6010, z=108.050},
    {name="ATM", id=277, x=2558.051, y=389.4817, z=108.660},
    {name="ATM", id=277, x=1077.692, y=-775.796, z=58.218},
    {name="ATM", id=277, x=1139.018, y=-469.886, z=66.789},
    {name="ATM", id=277, x=295.839, y=-895.640, z=29.217},
    {name="ATM", id=277, x=1153.884, y=-326.540, z=69.245},
    {name="ATM", id=277, x=381.2827, y=323.2518, z=103.270},
    {name="ATM", id=277, x=236.4638, y=217.4718, z=106.840},
    {name="ATM", id=277, x=265.0043, y=212.1717, z=106.780},
    {name="ATM", id=277, x=-164.568, y=233.5066, z=94.919},
    {name="ATM", id=277, x=-1827.04, y=785.5159, z=138.020},
    {name="ATM", id=277, x=-1409.39, y=-99.2603, z=52.473},
    {name="ATM", id=277, x=-1205.35, y=-325.579, z=37.870},
    {name="ATM", id=277, x=-1215.64, y=-332.231, z=37.881},
    {name="ATM", id=277, x=-2072.41, y=-316.959, z=13.345},
    {name="ATM", id=277, x=-2975.72, y=379.7737, z=14.992},
    {name="ATM", id=277, x=-2962.60, y=482.1914, z=15.762},
    {name="ATM", id=277, x=-2955.70, y=488.7218, z=15.486},
    {name="ATM", id=277, x=253.94, y=-779.14, z=30.59},
    {name="ATM", id=277, x=-37.98, y=-1115.61, z=26.43},
  }
  

Citizen.CreateThread(function()
    for _, item in pairs(atms) do
      item.blip = AddBlipForCoord(item.x, item.y, item.z)
      SetBlipSprite(item.blip, item.id)
      SetBlipAsShortRange(item.blip, true)
      SetBlipColour(item.blip, 25)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(item.name)
      EndTextCommandSetBlipName(item.blip)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()

        local ply = GetPlayerPed(-1)
        local plyCoords = GetEntityCoords(ply, 0)
        for _, item in pairs(atms) do
          local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
          if(distance <= 1) then
              if GetLastInputMethod(0) then
                  exports.Stuff:Ninja_Core__DisplayHelpAlert("Appuyez sur ~INPUT_TALK~ pour intéragir avec l\'ATM")
              else
                  exports.Stuff:Ninja_Core__DisplayHelpAlert("Appuyez sur ~INPUT_CELLPHONE_RIGHT~  pour intéragir avec l\'ATM")
              end
              
              if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) then
                  mainMenu:Visible(not mainMenu:Visible())
              end
          end
        end
    end
end)

RegisterNetEvent("nArgent:DisplayCashValue")
AddEventHandler("nArgent:DisplayCashValue", function(value)
	StatSetInt("MP0_WALLET_BALANCE", value, true)
	ShowHudComponentThisFrame(4)
	CancelEvent()
end)

RegisterNetEvent("nArgent:DisplayBankValue")
AddEventHandler("nArgent:DisplayBankValue", function(value)
	StatSetInt("BANK_BALANCE", value, true)
	ShowHudComponentThisFrame(3)	
	CancelEvent()
end)
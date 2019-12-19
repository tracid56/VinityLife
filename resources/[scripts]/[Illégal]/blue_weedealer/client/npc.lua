local koordinaten = {
    {1408.25, 3668.16, 33.0,"Drogendealer",400.77,0x23B88069,"g_m_y_ballasout_01"},
    {255.52, -784.24, 29.5,"Drogendealer",-20.77,0x18CE57D0,"mp_m_shopkeep_01"},
    {1018.10, -799.93, 57.38,"Drogendealer",306.8,0x8CDCC057,"csb_burgerdrug"}
}


Citizen.CreateThread(function()

    for _,v in pairs(koordinaten) do
      RequestModel(GetHashKey(v[7]))
      while not HasModelLoaded(GetHashKey(v[7])) do
        Wait(1)
      end
  
      RequestAnimDict("mini@strip_club@idles@bouncer@base")
      while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
        Wait(1)
      end
      ped =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
    end
end)
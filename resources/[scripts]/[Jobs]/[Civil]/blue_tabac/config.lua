Config                            = {}
Config.DrawDistance               = 100.0
Config.MaxInService               = -1
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true
Config.EnableESXIdentity          = true
Config.Locale                     = 'fr'

Config.Cig = {
  'malbora',
  'gitanes'
}

Config.CigResellChances = {
  malboro = 45,
  gitanes = 55,
}

Config.CigResellQuantity= {
  malbora = {min = 10, max = 20},
  gitanes = {min = 10, max = 20},
}

Config.CigPrices = {
  malbora = {min = 35, max = 50},
  gitanes = {min = 25,   max = 40},
}

Config.CigPricesHigh = {
  malbora = {min = 60, max = 65},
  gitanes = {min = 55,   max = 60},
}

Config.Time = {
	malbora = 5 * 60,
	gitanes = 5 * 60,
}

Config.Blip = {
  Pos     = { x = 2349.91, y = 3134.76, z = 48.20 },
  Sprite  = 79,
  Display = 4,
  Scale   = 1.2,
  Colour  = 2,
}

Config.Zones = {

  TabacActions = {
    Pos   = { x =2355.90, y = 3143.82, z = 47.30 },
    Size  = { x = 1.6, y = 1.6, z = 1.0 },
	Color = {r = 136, g = 243, b = 216},
    Type  = 23,
  },

  Garage = {
    Pos   = { x = 2886.9729003906, y = 4609.4565429688, z = 46.987 },
    Size  = { x = 1.6, y = 1.6, z = 1.0 },
	Color = {r = 136, g = 243, b = 216},
    Type  = 23,
  },

  Craft = {
    Pos   = { x = 2348.86, y = 3141.46, z = 47.30 },
    Size  = { x = 1.6, y = 1.6, z = 1.0 },
	Color = {r = 136, g = 243, b = 216},
    Type  = 27,
  },

  Craft2 = {
    Pos   = { x = 2353.97, y = 3139.07, z = 47.30 },
    Size  = { x = 1.6, y = 1.6, z = 1.0 },
	Color = {r = 136, g = 243, b = 216},
    Type  = 27,
  },

  VehicleSpawnPoint = {
    Pos   = { x = 2356.97, y = 3131.92, z = 47.30 },
    Size  = { x = 1.6, y = 1.6, z = 1.0 },
    Type  = -1,
  },

  VehicleDeleter = {
    Pos   = { x = 2365.87, y = 3122.69, z = 47.30 },
    Size  = { x = 1.6, y = 1.6, z = 1.0 },
    Color = { r = 204, g = 204, b = 0 },
    Type  = 1,
  },

  SellFarm = {
    Pos   = {x = 2340.65, y = 3125.93, z = 47.30},
    Size  = { x = 1.6, y = 1.6, z = 1.0 },
	Color = {r = 136, g = 243, b = 216},
    Name  = "Vente des produits",
    Type  = 1
  },
  
}

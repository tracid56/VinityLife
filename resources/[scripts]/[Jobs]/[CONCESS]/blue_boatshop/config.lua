Config = {}
Config.Locale = 'en'

Config.DrawDistance = 100.0
Config.MarkerColor  = { r = 120, g = 120, b = 240 }

Config.EnableOwnedVehicles = true -- If true then it will set the Vehicle Owner to the Player who bought it.
Config.ResellPercentage    = 75 -- Sets the Resell Percentage | Example: $100 Car will resell for $75
Config.LicenseEnable       = true -- Require people to own a Boating License when buying Vehicles? Requires esx_license
Config.LicensePrice        = 1000 -- Sets the License Price if Config.LicenseEnable is true

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 3
Config.PlateNumbers  = 3
Config.PlateUseSpace = true

Config.Zones = {
	ShopEntering = { -- Marker for Accessing Shop
		Pos   = { x = -133.55, y = 6732.50, z = 1.5 },
		Size  = { x = 1.5, y = 1.5, z = 1.5 },
		Type  = 35
	},
	ShopInside = { -- Marker for Viewing Vehicles
		Pos     = { x = -160.64, y = 6753.22, z = 0.15 },
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = 138.4,
		Type    = -1
	},
	ShopOutside = { -- Marker for Purchasing Vehicles
		Pos     = { x = -160.64, y = 6753.22, z = 0.15 },
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = 90.0,
		Type    = -1
	},
	ResellVehicle = { -- Marker for Selling Vehicles
		Pos   = { x = -134.52, y = 6764.52, z = 0 },
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Type  = 1
	}
}

Config              = {}
Config.MarkerType   = 27
Config.DrawDistance = 3.0
Config.ZoneSize     = {x = 4.0, y = 4.0, z = 0.4}
Config.MarkerColor  = {r = 0, g = 0, b = 0}
Config.ShowBlips   = false  --markers visible on the map? (false to hide the markers on the map)

Config.RequiredCopsCoke  = 2
Config.RequiredCopsMeth  = 2
Config.RequiredCopsWeed  = 0
Config.RequiredCopsOpium = 3
Config.RequiredCopsLsd   = 99 -- Pas actif donc pas touché 

Config.TimeToFarm    = 6 * 800
Config.TimeToProcess = 5 * 900
Config.TimeToSell    = 4 * 3000

Config.Locale = 'fr'

Config.Zones = {
	CokeField =		{x = 138.848,	y = -1921.72, z = 21.38, name = _U('coke_field'), sprite = 501, color = 40},
	CokeProcessing =	{x = 1092.836,	y = -3196.910, z = -39.20, name = _U('coke_processing'), sprite = 501, color = 40},
	--CokeDealer =		{x = -1004.840, y = 4842.319, z = 275.006, name = _U('coke_dealer'), sprite = 501,	color = 40},
	MethField =	     {x = 1558.13, y = 2162.22, z = 77.66, name = _U('meth_field'), sprite = 499, color = 26},
	MethProcessing =	{x = 1009.5425415039, y = -3194.9985351563, z = -38.993125915527, name = _U('meth_processing'), sprite = 499, color = 26},
	--MethDealer =		{x = -277.751, y = 2205.406, z = 130.40, name = _U('meth_dealer'), sprite = 499, color = 26},
	WeedField =		{x = 1056.05, y = -3189.97, z = -40.1224, name = _U('weed_field'), sprite = 496, color = 52},
	WeedField2 =		{x = 1063.17, y = -3198.19, z = -40.1224, name = _'Récolte Weed 2', sprite = 496, color = 52},
	WeedProcessing =	{x = 1039.24, y = -3205.38, z = -38.166, name = _U('weed_processing'), sprite = 496, color = 52},
	--WeedDealer =		{x = -748.039, y = 687.363, z = 144.74, name = _U('weed_dealer'), sprite = 496, color = 52},
	OpiumField =		{x = 1268.86, y = -1711.42, z = 54.00, name = _U('opium_field'), sprite = 51,	color = 60},
	OpiumProcessing =	{x = 1010.229, y = -1703.338, z = 47.64, name = _U('opium_processing'), sprite = 51, color = 60},
	--OpiumDealer =		{x = -2166.279, y = 5197.467, z = 16.88, name = _U('opium_dealer'),	sprite = 51, color = 60},
	TenuWeed =		{x = 1060.09, y = -3183.28, z = -39.764, name = ('Tenu Weed'),	sprite = 496, color = 52},
	AmeWeed =		{x = 1044.54, y = -3194.72, z = -39.158, name = ('Amélioration Weed'), sprite = 496, color = 52},
	--LsdField =              {x = 2510.3913574219, y = 3786.1909179688, z = -50.848163604736, name = _U('lsd_field'), sprite = 51,	color = 60},
	--LsdProcessing =         {x = -1108.6887207031, y = -1643.3828125, z = -4.6405272483826, name = _U('lsd_processing'), sprite = 51, color = 60},
	--LsdDealer =             {x = 115.67532348633, y = 170.83714294434, z = -112.45166778564, name = _U('lsd_dealer'), sprite = 500, color = 75},
}

Config                        = {}
Config.Locale 				  = 'fr'
Config.green 				  = 56108
Config.grey 				  = 8421504
Config.red 					  = 16711680
Config.orange 				  = 16744192
Config.blue 				  = 2061822
Config.purple 				  = 6965387
Config.pink                   = 11750815
Config.yellow                 = 16449301
Config.white                  = 16777215
Config.black                  = 0
Config.bluetweet              = 4436965
Config.webhook                = "https://discordapp.com/api/webhooks/635229525222883349/slFGNP9QV2t_S_hwQM4wjlxgIg4jFHPE94RmX2rSSG7QN_p380SGz5N3WG_c4e-qrmm_"
Config.webhookBan                = "https://discordapp.com/api/webhooks/606135088505421844/59SJNCPV2sd7Q68Uhyj-rmauKw30NnhUsrXbrgi3ai2lakqdKZ0rMAPqpTKxslz60Fl7" -- ban


settings = {
	LogKills = false, -- Log when a player kill an other player.
	LogEnterPoliceVehicle = false, -- Log when an player enter in a police vehicle.
	LogEnterBlackListedVehicle = true, -- Log when a player enter in a blacklisted vehicle.
	LogPedJacking = false, -- Log when a player is jacking a car
	LogChatServer = false, -- Log when a player is talking in the chat , /command works too.
	LogLoginServer = false, -- Log when a player is connecting/disconnecting to the server.
	LogItemTransfer = true, -- Log when a player is giving an item.
	LogItemDrop = true,-- Log when a player drop an item.
	LogItemPickup = true,-- Log when a player pick an item.
	LogWeaponTransfer = true, -- Log when a player is giving a weapon.
	LogWeaponDrop = true,  -- Log when a player drop a weapon.
	LogMoneyTransfer = true, -- Log when a player is giving money
	LogMoneyDrop = true,  -- Log when a player drop money
	LogMoneyPickup = true,  -- Log when a player pick money
	LogDirtyMoneyTransfer = true, -- Log when a player is giving dirty money
	LogDirtyMoneyDrop = true,  -- Log when a player drop dirty money
	LogDirtyMoneyPickup = true,  -- Log when a player pick dirty money
	LogTweetServer = true, -- Log when a player is tweeting in the chat.
	LogBanhammer = true, -- Log when a player is banned.
	LogBankWithdraw = true, -- Log when a player is transfering account money.
	LogBankDeposit = true, -- Log when a player is transfering account money.

}



blacklistedModels = {
	"APC",
	"BARRACKS",
	"BARRACKS2",
	"RHINO",
	"CRUSADER",
	"CARGOBOB",
	"SAVAGE",
	"TITAN",
	"LAZER",
	"LAZER",
}

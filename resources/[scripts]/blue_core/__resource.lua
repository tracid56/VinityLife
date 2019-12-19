resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'




----------------------------------------------------------------

server_script '@mysql-async/lib/MySQL.lua'
server_script '@es_extended/locale.lua'
server_script '@async/async.lua'
server_script 'locales/fr.lua'

client_script '@es_extended/locale.lua'
client_script 'locales/fr.lua'
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------

-- NativeUI

client_scripts {
    "ui_native/Wrapper/Utility.lua",
    "ui_native/UIElements/UIVisual.lua",
    "ui_native/UIElements/UIResRectangle.lua",
    "ui_native/UIElements/UIResText.lua",
    "ui_native/UIElements/Sprite.lua",
    "ui_native/UIMenu/elements/Badge.lua",
    "ui_native/UIMenu/elements/Colours.lua",
    "ui_native/UIMenu/elements/ColoursPanel.lua",
    "ui_native/UIMenu/elements/StringMeasurer.lua",
    "ui_native/UIMenu/items/UIMenuItem.lua",
    "ui_native/UIMenu/items/UIMenuCheckboxItem.lua",
    "ui_native/UIMenu/items/UIMenuListItem.lua",
    "ui_native/UIMenu/items/UIMenuSliderItem.lua",
    "ui_native/UIMenu/items/UIMenuSliderHeritageItem.lua",
    "ui_native/UIMenu/items/UIMenuColouredItem.lua",
    "ui_native/UIMenu/items/UIMenuProgressItem.lua",
    "ui_native/UIMenu/items/UIMenuSliderProgressItem.lua",
    "ui_native/UIMenu/windows/UIMenuHeritageWindow.lua",
    "ui_native/UIMenu/panels/UIMenuGridPanel.lua",
    "ui_native/UIMenu/panels/UIMenuHorizontalOneLineGridPanel.lua",
    "ui_native/UIMenu/panels/UIMenuVerticalOneLineGridPanel.lua",
    "ui_native/UIMenu/panels/UIMenuColourPanel.lua",
    "ui_native/UIMenu/panels/UIMenuPercentagePanel.lua",
    "ui_native/UIMenu/panels/UIMenuStatisticsPanel.lua",
    "ui_native/UIMenu/UIMenu.lua",
    "ui_native/UIMenu/MenuPool.lua",
    'ui_native/UITimerBar/UITimerBarPool.lua',
    'ui_native/UITimerBar/items/UITimerBarItem.lua',
    'ui_native/UITimerBar/items/UITimerBarProgressItem.lua',
    'ui_native/UITimerBar/items/UITimerBarProgressWithIconItem.lua',
    'ui_native/UIProgressBar/UIProgressBarPool.lua',
    'ui_native/UIProgressBar/items/UIProgressBarItem.lua',
    "ui_native/NativeUI.lua"
}


-----------------------------------------------------------------
-----------------------------------------------------------------
----Scripts------------------------------------------------------
-----------------------------------------------------------------
-----------------------------------------------------------------


----------------------------------------------------------------
---Amandes------------------------------------------------------
----------------------------------------------------------------

server_scripts {
	'scripts/amandes/amandes_server.lua'
}

client_scripts {
	'scripts/amandes/amandes_client.lua'
}

----------------------------------------------------------------
---Doorlock-----------------------------------------------------
----------------------------------------------------------------

server_scripts {
	'scripts/doorlock/doorlock_config.lua',
	'scripts/doorlock/doorlock_server.lua'
}

client_scripts {
	'scripts/doorlock/doorlock_config.lua',
	'scripts/doorlock/doorlock_client.lua'
}


----------------------------------------------------------------
---Animations---------------------------------------------------
----------------------------------------------------------------

client_scripts {
    'blue/blue_animations/main.lua',
}

----------------------------------------------------------------
---vdk_call-----------------------------------------------------
----------------------------------------------------------------

client_script 'core/vdk_call/call.lua'
server_script 'core/vdk_call/call_server.lua'

----------------------------------------------------------------
---Addons GcPhone-----------------------------------------------
----------------------------------------------------------------

server_script {
	"core/addons_gcphone/server.lua"
}

client_script {
	"core/addons_gcphone/client.lua"
}

----------------------------------------------------------------
---Ban----------------------------------------------------------
----------------------------------------------------------------

server_scripts {
	'core/ban/config.lua',
	'core/ban/server.lua'
}


--------------------------------------------b--------------------
---Anticheat----------------------------------------------------
----------------------------------------------------------------

client_scripts {
	'core/anticheat/cl_anticheat.lua'
}

server_scripts {
	'core/anticheat/srv_anticheat.lua'
}

----------------------------------------------------------------
---AntiCheat-Vehicule-------------------------------------------
----------------------------------------------------------------

client_scripts {
	"core/anticheat_vehicules/utils.lua",
	"core/anticheat_vehicules/carblacklist.lua",
	"core/anticheat_vehicules/pedblacklist.lua",
	"core/anticheat_vehicules/weaponblacklist.lua"
}

server_scripts {
	"core/anticheat_vehicules/server.lua"
}


----------------------------------------------------------------
---holster------------------------------------------------------
----------------------------------------------------------------

client_script {
	"core/holster/config.lua",
	"core/holster/client.lua"
}

----------------------------------------------------------------
---license------------------------------------------------------
----------------------------------------------------------------

server_scripts {
	'core/license/server/main.lua'
}

----------------------------------------------------------------
---logs 1 ------------------------------------------------------
----------------------------------------------------------------

server_script {						
	'core/logs_discord_1/Config.lua',
	'core/logs_discord_1/SERVER/Server.lua',
}

client_script {						
	'core/logs_discord_1/Config.lua',
	'core/logs_discord_1/CLIENT/Weapons.lua',
	'core/logs_discord_1/CLIENT/Client.lua',
}

----------------------------------------------------------------
---logs 2 ------------------------------------------------------
----------------------------------------------------------------

server_scripts {
	'core/logs_discord_2/@locales/fr.lua',
	'core/logs_discord_2/config.lua',
	'core/logs_discord_2/server/main.lua'
}

client_scripts {
	'core/logs_discord_2/@locales/fr.lua',
	'core/logs_discord_2/client/main.lua'
}

----------------------------------------------------------------
---nonpcdrop----------------------------------------------------
----------------------------------------------------------------

client_script "core/nopcdrop/client/client.lua"


----------------------------------------------------------------
---pause--------------------------------------------------------
----------------------------------------------------------------

client_script "core/pause/server_name.lua"

----------------------------------------------------------------
---recule_arme--------------------------------------------------
----------------------------------------------------------------

client_script 'core/recule_arme/client.lua'

----------------------------------------------------------------
---report-------------------------------------------------------
----------------------------------------------------------------

client_script {
	'core/report/client.lua'
}
  
server_scripts {
	'core/report/server.lua'
}

----------------------------------------------------------------
---no flic------------------------------------------------------
----------------------------------------------------------------

client_script 'core/no_flic/nowanted.lua'

----------------------------------------------------------------
---npc ctr------------------------------------------------------
----------------------------------------------------------------

client_scripts{ 
    --"lib/enum.lua",
    --"cfg/npcs.lua",
    "core/npc_control/client.lua"
}

----------------------------------------------------------------
---takehos------------------------------------------------------
----------------------------------------------------------------

client_script "core/TakeHostage/cl_takehostage.lua"
server_script "core/TakeHostage/sv_takehostage.lua"

----------------------------------------------------------------
---piggypack----------------------------------------------------
----------------------------------------------------------------

client_script "core/PiggyBack/cl_piggyback.lua"
server_script "core/PiggyBack/sv_piggyback.lua"

-----------------------------------------------------------------

dependency "essentialmode"
dependency "es_extended"
dependency "async"

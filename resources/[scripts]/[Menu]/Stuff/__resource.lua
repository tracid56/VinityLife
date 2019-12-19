resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

server_scripts {
    'server/server.lua',
}

client_script 'functionsExported.lua'

client_scripts {
    'utils/screens.lua',
    'client/anti_afk.lua'
}

exports {
    'Ninja_Core__DisplayHelpAlert',
    'Ninja_Core__ShowNinjaNotification',
    'Ninja_Core_PedsText',
    "Ninja_Core_StartAnim",
    'nNotificationMain'
}
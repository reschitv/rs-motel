fx_version 'cerulean'
lua54 'yes'
game 'gta5'

client_scripts {
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
}

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/tr.lua',
    'locales/*.lua',
    'config.lua'
}

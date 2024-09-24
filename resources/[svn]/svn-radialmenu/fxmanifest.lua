fx_version 'cerulean'
game 'gta5'
author 'https://discord.gg/2G96dasQPM'
description 'RadialMenu svn'
version '1.2.0'

ui_page 'html/index.html'

shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}

client_scripts {
    'client/main.lua',
    'client/clothing.lua',
    'client/trunk.lua',
    'client/stretcher.lua'
}

server_scripts {
    'server/trunk.lua',
    'server/stretcher.lua'
}

files {
    'html/index.html',
    'html/css/main.css',
    'html/js/main.js',
    'html/js/RadialMenu.js',
}

lua54 'yes'

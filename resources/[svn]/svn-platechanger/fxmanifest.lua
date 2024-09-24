fx_version 'cerulean'

game 'gta5'

lua54 'yes'

author 'https://discord.gg/2G96dasQPM'
description 'This script is specifically modified for the svnNp4 server.'

version '2.0.0'

shared_scripts {
    'config.lua',
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua', -- Remove if using QBCore
    'server/*.lua'
}

ui_page 'html/ui.html'

files {
    'html/ui.html',
    'html/fonts/*.ttf',
    'html/css/style.css',
    'html/js/script.js'
}

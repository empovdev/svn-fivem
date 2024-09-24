fx_version 'adamant'
game 'gta5'

author 'https://discord.gg/2G96dasQPM'
description 'This script is specifically modified for the svnNp4 server.'

version '2.0.1'

files {
    "uipage/**/*",
    'uipage/**/*.*',
    'uipage/**/**/*.*'
}

client_scripts {
    'client/main.lua',
}

loadscreen 'uipage/index.html'
loadscreen_manual_shutdown "yes"
loadscreen_cursor 'yes'

escrow_ignore {
    'client/main.lua',
    'uipage/**/**/*.*'
}

lua54 'yes'
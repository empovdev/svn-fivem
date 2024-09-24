fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'https://discord.gg/2G96dasQPM'
description 'This script is specifically modified for the svnNp4 server.'

shared_scripts {
	'shared/cores.lua',
    'shared/config.lua'
}

client_scripts {
	'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/script.js',
    'html/style.css',
    'html/*otf',
    'html/*png',
    'images/*.png',
    'images/*.jpg',
    'images/*.webp',
    'fonts/*.ttf',
    'fonts/*.otf'
}
lua54 'yes'
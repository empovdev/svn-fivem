fx_version 'cerulean'
game 'gta5'
author 'https://discord.gg/2G96dasQPM'
description 'This script is specifically modified for the svnNp4 server.'

shared_script {
	'config.lua',
}

client_script 'c.lua'
server_script 's.lua'

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/style.css',
	'html/index.js',
    'html/files/*.png',
    'html/files/*.jpg',
	'html/fonts/*.otf',
	'html/fonts/*.ttf'
}

exports {
    'OpenDeathScreen',
    'RevivePlayer',
    'UpdateRespawnTimer'
}
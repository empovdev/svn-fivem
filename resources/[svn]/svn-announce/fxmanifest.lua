fx_version 'adamant'

game 'gta5'
author 'https://discord.gg/2G96dasQPM'
description 'This script is specifically modified for the svnNp4 server.'


version '1.5.4'

ui_page 'html/ui.html'

client_scripts {
	'shared/config.lua',
	'client.lua',
	'shared/client.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'shared/config.lua',
	'server.lua',
	'shared/server.lua',
}

files {
	'html/ui.html',
	'html/*.css',
	'html/*.js',
	'html/img/*.png',
	'html/img/*.jpg',
	'html/img/*.gif',
}
lua54 'yes'

escrow_ignore {
	'shared/*.lua'
}


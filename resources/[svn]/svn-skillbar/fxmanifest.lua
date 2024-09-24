fx_version 'adamant'
game 'gta5'
description 'svn Skillbar - Open Source'
version '1.0.0'

client_script {
    'client/main.lua',
    'config.lua'
}

server_script {
    'server/version.lua'
}

ui_page 'html/index.html'

files {
    'html/**/**.**',
}

escrow_ignore {
    'client/main.lua',
    'config.lua',
    'server/version.lua',
    'html/**/**.**'
}

lua54 'yes'
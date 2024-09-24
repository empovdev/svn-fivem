fx_version 'bodacious'

version '0.0.0'
author 'https://discord.gg/2G96dasQPM'
description 'This script is specifically modified for the svnNp4 server.'
games { 'gta5' }


ui_page 'html/index.html'
files {
  'html/index.html',
  'html/script.js',
  'html/style.css',
  'html/*otf',
  'html/*png',
  'fonts/*.ttf',
  'fonts/*.otf'
 
}

client_scripts{
    'client/client.lua',
    'config.lua'
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'server/server.lua',
  'config.lua',
}

escrow_ignore {
  'config.lua',
  'client/client.lua',
  'server/server.lua',
}

lua54 "yes"
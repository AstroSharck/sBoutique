fx_version 'cerulean'
games {'gta5'}
lua54 'yes'

author 'AstroSharck'
description 'sBoutique NUI'
version '1.0.0'

escrow_ignore {
    'config/*.lua'
}

ui_page 'html/index.html'
files {
    'html/index.html', 
    'html/css/*.css', 
    'html/js/*.js',
    'html/img/*'
}

shared_scripts {
    "config/*.lua"
}
client_scripts {
    'client/*.lua'
}
server_scripts {
    'server/*.lua',
    '@mysql-async/lib/MySQL.lua',
    --'@oxmysql/lib/MySQL.lua',     -- Si vous utiliser oxmysql
}

dependencies {
    'sCore',
    '/server:5181',                 -- ⚠️LISEZ S'IL VOUS PLAÎT⚠️ Cela nécessite au moins un artifacts 5181 ou plus
    '/assetpacks'
}
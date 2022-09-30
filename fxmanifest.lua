fx_version 'cerulean'
games { 'gta5' }

author 'MikMik (HepicGamerz)'
description 'this thingy removes random amount of defined items from your inventory and can give you another item if not specified false. if you put money or blackmoney in items it will do money and blackmoney. mist giv me developer plz xD'
version '3'

dependency 'es_extended'

client_script 'client/client.lua'
server_scripts {
    'server/server.lua',
    'items.lua'
}

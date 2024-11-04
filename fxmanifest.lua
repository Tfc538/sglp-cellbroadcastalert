fx_version 'cerulean'
game 'gta5'

name "sglp-cellbroadcastalert"
description "Cell Broadcast Alert made for Harbour City RP"
author "Tim Gatzke <post@tim-gatzke.de>"
version "1.0.0"


server_scripts {
	'server/*.lua',
	'configs/sv_*.lua'
}

dependencies {
	'qb-core',
	'interact-sound'
}
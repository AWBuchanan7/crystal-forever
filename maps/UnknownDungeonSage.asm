    const_def 2 ; object constants

SageShopScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_SAGE
	closetext
	end

UnknownDungeon1FSage_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

UnknownDungeon1FSage_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 7, 5, UNKNOWN_DUNGEON_1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2, 2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SageShopScript, EVENT_UNKNOWN_DUNGEON_SAGE_SHOPKEEP
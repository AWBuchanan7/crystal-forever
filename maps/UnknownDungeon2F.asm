    const_def 2 ; object constants
	const UNKNOWNDUNGEON2F_DRAGONBREATHNIDOQUEEN

UnknownDungeon2F_MapScripts:
	db 0 ; scene scripts
	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .DragonbreathNidoqueen

.DragonbreathNidoqueen:
	checkevent EVENT_FOUGHT_DRAGONBREATHNIDOQUEEN_IN_UD2F
	iftrue .NoAppear
	sjump .Appear

.Appear:
	appear UNKNOWNDUNGEON2F_DRAGONBREATHNIDOQUEEN
	return
.NoAppear:
	disappear UNKNOWNDUNGEON2F_DRAGONBREATHNIDOQUEEN
	return
	
DragonbreathNidoqueen:
	faceplayer
	opentext
	writetext NidoqueenText
	cry NIDOQUEEN
	pause 15
	closetext
	setevent EVENT_FOUGHT_DRAGONBREATHNIDOQUEEN_IN_UD2F
	loadvar VAR_BATTLETYPE, BATTLETYPE_DRAGONBREATH
	loadwildmon NIDOQUEEN, 75
	startbattle
	disappear UNKNOWNDUNGEON2F_DRAGONBREATHNIDOQUEEN
	reloadmapafterbattle
	end

NidoqueenText:
	text "Gaaaaaooohh!"
	done

UnknownDungeon2F_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 55, 5, UNKNOWN_DUNGEON_1F, 3
	warp_event 13, 5, UNKNOWN_DUNGEON_1F, 4
	warp_event 5, 9, UNKNOWN_DUNGEON_1F, 5
	warp_event 3, 15, UNKNOWN_DUNGEON_1F, 6
	warp_event 9, 25, UNKNOWN_DUNGEON_1F, 7
	warp_event 39, 21, UNKNOWN_DUNGEON_1F, 8

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  50,  32, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DragonbreathNidoqueen, EVENT_UNKNOWN_DUNGEON_2F_DRAGONBREATH_NIDOQUEEN
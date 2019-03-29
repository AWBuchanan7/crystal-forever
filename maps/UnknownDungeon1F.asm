    const_def 2 ; object constants
	const UNKNOWNDUNGEON1F_COOLTRAINER_F
	const UNKNOWNDUNGEON1F_COOLTRAINER_M
	const UNKNOWNDUNGEON1F_BEAUTY
	const UNKNOWNDUNGEON1F_POKE_BALL1
	const UNKNOWNDUNGEON1F_POKE_BALL2
	const UNKNOWNDUNGEON1F_POKE_BALL3
	const UNKNOWNDUNGEON1F_POKE_BALL4
	const UNKNOWNDUNGEON1F_POKE_BALL5
	const UNKNOWNDUNGEON1F_POKE_BALL6
	const UNKNOWNDUNGEON1F_POKE_BALL7

UnknownDungeon1F_HiddenPPUp:
	itemball PP_UP

UnknownDungeon1F_HiddenUltraBallA:
	itemball ULTRA_BALL

UnknownDungeon1F_HiddenUltraBallB:
	itemball ULTRA_BALL

UnknownDungeon1F_HiddenRareCandy:
	itemball RARE_CANDY

UnknownDungeon1F_HiddenMaxRevive:
	itemball MAX_REVIVE

UnknownDungeon1F_HiddenTMEarthquake:
	itemball EARTHQUAKE

UnknownDungeon1F_HiddenTMNightmare:
	itemball NIGHTMARE

TrainerCoolTrainerAubrey:
	trainer COOLTRAINERF, AUBREY1, EVENT_BEAT_COOLTRAINERF_AUBREY, CoolTrainerAubreySeenText, CoolTrainerAubreyBeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext CoolTrainerAubreyAfterBattleText
	waitbutton
	closetext
	end

TrainerCoolTrainerScott:
	trainer COOLTRAINERM, SCOTT2, EVENT_BEAT_COOLTRAINERM_SCOTT2, CoolTrainerScottSeenText, CoolTrainerScottBeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext CoolTrainerScottAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyMcKayla:
	trainer BEAUTY, MCKAYLA, EVENT_BEAT_BEAUTY_MCKAYLA, BeautyMcKaylaSeenText, BeautyMcKaylaBeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext BeautyMcKaylaAfterBattleText
	waitbutton
	closetext
	end

CoolTrainerAubreySeenText:
	text "Are you ready?"
	line "to explore the"

	para "UNKNOWN..?"
	done

CoolTrainerAubreyBeatenText:
	text "Best of luck..."
	line "You may need it."
	done

CoolTrainerAubreyAfterBattleText:
	text "The UNKNOWN"
	line "DUNGEON can be"

	para "dangerous. Stay"
	line "safe down here!"
	done

CoolTrainerScottSeenText:
	text "Have you heard"
	line "of the legendary"

	para "#MON that's"
	line "supposedly here?"
	done

CoolTrainerScottBeatenText:
	text "Maybe I should"
	line "head back home..."
	done

CoolTrainerScottAfterBattleText:
	text "I think I'll just"
	line "rest here a while."
	done

BeautyMcKaylaSeenText:
	text "I came here to"
	line "find a #MON"

	para "that's as strong"
	line "as I am beautiful."
	done

BeautyMcKaylaBeatenText:
	text "I-I lost?"
	line "How?!"
	done

BeautyMcKaylaAfterBattleText:
	text "In the end most"
	line "#MON are beautiful"

	para "in their own ways."
	done

UnknownDungeon1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

UnknownDungeon1F_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 53, 37, CERULEAN_CITY, 8
	warp_event 31, 7, UNKNOWN_DUNGEON_1F_SAGE, 1
	warp_event 55, 5, UNKNOWN_DUNGEON_2F, 1
	warp_event 13, 5, UNKNOWN_DUNGEON_2F, 2
	warp_event 5, 9, UNKNOWN_DUNGEON_2F, 3
	warp_event 3, 15, UNKNOWN_DUNGEON_2F, 4
	warp_event 9, 25, UNKNOWN_DUNGEON_2F, 5
	warp_event 39, 21, UNKNOWN_DUNGEON_2F, 6

	db 0 ; coord events

	db 0 ; bg events

	db 10 ; object events
	object_event  53, 34, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCoolTrainerAubrey, -1
	object_event  47, 26, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCoolTrainerScott, -1
	object_event  44, 29, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerBeautyMcKayla, -1
	
	object_event  35, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnknownDungeon1F_HiddenPPUp, EVENT_FOUND_PP_UP_IN_UD1F
	object_event  47, 36, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnknownDungeon1F_HiddenUltraBallA, EVENT_FOUND_ULTRA_BALL_A_IN_UD1F
	object_event 15,  20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnknownDungeon1F_HiddenUltraBallB, EVENT_FOUND_ULTRA_BALL_B_IN_UD1F
	object_event 1, 4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnknownDungeon1F_HiddenRareCandy, EVENT_FOUND_RARE_CANDY_IN_UD1F
	object_event  1, 35, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnknownDungeon1F_HiddenMaxRevive, EVENT_FOUND_MAX_REVIVE_IN_UD1F
	object_event  35, 6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnknownDungeon1F_HiddenTMEarthquake, EVENT_FOUND_TM_EARTHQUAKE_IN_UD1F
	object_event 18,  10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnknownDungeon1F_HiddenTMNightmare, EVENT_FOUND_TM_NIGHTMARE_IN_UD1F
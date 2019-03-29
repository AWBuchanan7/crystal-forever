    const_def 2 ; object constants
	const UNKNOWNDUNGEON1F_COOLTRAINER_F
	const UNKNOWNDUNGEON1F_COOLTRAINER_M
	const UNKNOWNDUNGEON1F_BEAUTY

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

	db 1 ; warp events
	warp_event 53, 37, CERULEAN_CITY, 8

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
		object_event  53, 34, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCoolTrainerAubrey, -1
   		object_event  50, 16, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCoolTrainerScott, -1
   		object_event  51, 19, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerBeautyMcKayla, -1
    
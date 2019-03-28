GOLDENRODCINEMA_MOVIE_REGULAR_PRICE EQU 500
GOLDENRODCINEMA_MOVIE_TUESDAY_PRICE EQU 300

	const_def 2 ; object constants

GoldenRodCinemaText_Closed:
	text "We're not open"
	line "today."
	done


GoldenrodCinema_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ConcessionScript:
	opentext
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .Open
	ifequal FRIDAY, .Open
	sjump GoldenrodCinemaScript_ShopClosed

.Open:
	pokemart MARTTYPE_STANDARD, MART_CINEMA
	closetext
	end

GoldenrodCinemaScript_ShopClosed:
	writetext GoldenRodCinemaText_Closed
	waitbutton
	closetext
	end

GoldenrodCinema_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 7, GOLDENROD_CITY, 16
	warp_event  5, 7, GOLDENROD_CITY, 16

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2, 2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ConcessionScript, EVENT_GOLDENROD_CINEMA_DOORMAN
	object_event  12, 5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ConcessionScript, EVENT_GOLDENROD_CINEMA_DOORMAN
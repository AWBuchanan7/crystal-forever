GoldenrodCINEMA_MOVIE_REGULAR_PRICE EQU 500
GoldenrodCINEMA_MOVIE_TUESDAY_PRICE EQU 300

	const_def 2 ; object constants

GoldenrodCinemaText_Closed:
	text "We're not open"
	line "today."
	done

GoldenrodCinemaText_TheaterDoorFriday:
	text "Welcome!"

	para "Today is Friday,"
	line "we have one show"

	para "today. Today a "
	line "MOVIE TICKET is"
	cont "¥500."

	para "Would you like to"
	line "purchase a TICKET?"
	done

GoldenrodCinemaText_TheaterDoorTuesday:
	text "Welcome!"

	para "Today is Tuesday,"
	line "we have one show"

	para "today. Today a "
	line "MOVIE TICKET is"
	cont "just ¥300."

	para "Would you like to"
	line "purchase a TICKET?"
	done

GoldenrodCinemaText_TheaterChooseMon:
	text "Which #MON will"
	line "be joining you?"
	done

GoldenrodCinemaText_TheaterEnjoy:
	text "OK! Enjoy"
	line "the movie!"
	done

GoldenrodCinemaText_TheaterShowOver:
	text "Thanks for coming!"
	line "Please come again!"
	done

GoldenrodCinemaText_SlightlyHappier:
	text_ram wStringBuffer3
	text " looks a"
	line "little happier."
	done

GoldenrodCinemaText_Happier:
	text_ram wStringBuffer3
	text " looks"
	line "happy."
	done

GoldenrodCinemaText_MuchHappier:
	text_ram wStringBuffer3
	text " looks"
	line "delighted!"
	done

GoldenrodCinemaText_Refused:
	text "No? "
	line "How disappointing!"
	done

GoldenrodCinemaText_NotEnoughMoney:
	text "You're a little"
	line "short on funds."
	done

GoldenrodCinemaText_LastShow:
	text "That was our only"
	line "showing today."

	para "Sorry, but please"
	line "come again!"
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



CinemaScript:
	opentext
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .CinemaOpenTuesday
	ifequal FRIDAY, .CinemaOpenFriday
	sjump GoldenrodCinemaScript_ShopClosed

.CinemaOpenTuesday:
	checkflag ENGINE_GOLDENROD_CINEMA_SAW_MOVIE
	iftrue .AlreadySawMovie
	special PlaceMoneyTopRight
	writetext GoldenrodCinemaText_TheaterDoorTuesday
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, GoldenrodCINEMA_MOVIE_TUESDAY_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext GoldenrodCinemaText_TheaterChooseMon
	buttonsound
	special YoungerHaircutBrother
	ifequal $0, .Refused
	ifequal $1, .Refused
	setflag ENGINE_GOLDENROD_CINEMA_SAW_MOVIE
	ifequal $2, .two
	ifequal $3, .three
	sjump .else

.two
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.three
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.else
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then
.then
	takemoney YOUR_MONEY, GoldenrodCINEMA_MOVIE_TUESDAY_PRICE
	special PlaceMoneyTopRight
	writetext GoldenrodCinemaText_TheaterEnjoy
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext GoldenrodCinemaText_TheaterShowOver
	waitbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue GoldenrodCinemaScript_SlightlyHappier
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue GoldenrodCinemaScript_Happier
	sjump GoldenrodCinemaScript_MuchHappier
.Refused:
	writetext GoldenrodCinemaText_Refused
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext GoldenrodCinemaText_NotEnoughMoney
	waitbutton
	closetext
	end

.AlreadySawMovie:
	writetext GoldenrodCinemaText_LastShow
	waitbutton
	closetext
	end

.CinemaOpenFriday:
	checkflag ENGINE_GOLDENROD_CINEMA_SAW_MOVIE
	iftrue .AlreadySawMovie
	special PlaceMoneyTopRight
	writetext GoldenrodCinemaText_TheaterDoorFriday
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, GoldenrodCINEMA_MOVIE_REGULAR_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext GoldenrodCinemaText_TheaterChooseMon
	buttonsound
	special YoungerHaircutBrother
	ifequal $0, .Refused
	ifequal $1, .Refused
	setflag ENGINE_GOLDENROD_CINEMA_SAW_MOVIE
	ifequal $2, .twob
	ifequal $3, .threeb
	sjump .elseb
.twob
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .thenb

.threeb
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .thenb

.elseb
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .thenb

.thenb
	takemoney YOUR_MONEY, GoldenrodCINEMA_MOVIE_REGULAR_PRICE
	special PlaceMoneyTopRight
	writetext GoldenrodCinemaText_TheaterEnjoy
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext GoldenrodCinemaText_TheaterShowOver
	waitbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue GoldenrodCinemaScript_SlightlyHappier
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue GoldenrodCinemaScript_Happier
	sjump GoldenrodCinemaScript_MuchHappier

GoldenrodCinemaScript_SlightlyHappier:
	writetext GoldenrodCinemaText_SlightlyHappier
	special PlayCurMonCry
	waitbutton
	closetext
	end

GoldenrodCinemaScript_Happier:
	writetext GoldenrodCinemaText_Happier
	special PlayCurMonCry
	waitbutton
	closetext
	end

GoldenrodCinemaScript_MuchHappier:
	writetext GoldenrodCinemaText_MuchHappier
	special PlayCurMonCry
	waitbutton
	closetext
	end

GoldenrodCinemaScript_ShopClosed:
	writetext GoldenrodCinemaText_Closed
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
	object_event  2, 2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ConcessionScript, EVENT_GOLDENROD_CINEMA_CONCESSIONS
	object_event  12, 5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CinemaScript, EVENT_GOLDENROD_CINEMA_DOORMAN
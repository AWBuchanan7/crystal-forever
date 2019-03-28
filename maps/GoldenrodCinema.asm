	const_def 2 ; object constants

GoldenrodCinema_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodCinema_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 7, GOLDENROD_CITY, 16
	warp_event  5, 7, GOLDENROD_CITY, 16

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
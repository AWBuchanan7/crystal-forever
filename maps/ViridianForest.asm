	const_def 2 ; object constants
	const VIRIDIAN_FOREST

ViridianForest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ViridianForest_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 1, 0, ROUTE_2, 4
	warp_event 16, 47, ROUTE_2, 5
	
	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
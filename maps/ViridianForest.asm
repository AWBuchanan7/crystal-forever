	const_def 2 ; object constants
	const VIRIDIAN_FOREST

ViridianForestScopeLens:
	itemball SCOPE_LENS

ViridianForest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ViridianForest_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 1, 0, ROUTE_2, 6
	warp_event 16, 47, ROUTE_2, 7
	warp_event 17, 47, ROUTE_2, 7
	
	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  1, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestScopeLens, EVENT_VIRIDIAN_FOREST_SCOPE_LENS
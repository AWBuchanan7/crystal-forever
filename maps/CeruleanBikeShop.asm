	const_def 2 ; object constants
	const CERULEANBIKESHOP_CLERK

CeruleanBikeShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

.UnreferencedDummyScene:
	end

CeruleanBikeShopClerkScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SKATEBOARD
	iftrue .GotSkateboard
	writetext CeruleanBikeShopClerkIntroText
	yesorno
	iffalse .Refused
	writetext CeruleanBikeShopClerkAgreedText
	buttonsound
	waitsfx
	giveitem SKATEBOARD
	writetext BorrowedASkateboardText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setflag ENGINE_BIKE_SHOP_CALL_ENABLED
	setevent EVENT_GOT_SKATEBOARD
.GotSkateboard:
	writetext CeruleanBikeShopClerkFirstRateBikesText
	waitbutton
	closetext
	end

.Refused:
	writetext CeruleanBikeShopClerkRefusedText
	waitbutton
	closetext
	end

CeruleanBikeShopBicycle:
	jumptext CeruleanBikeShopBicycleText

CeruleanBikeShopClerkIntroText:
	text "Hm… I opened a"
	line "shop in JOHTO"

	para "but now business"
	line "in KANTO is down."

	para "Could you test my"
	line "new SKATEBOARD and"
	cont "advertise for me?"
	done

CeruleanBikeShopClerkAgreedText:
	text "Really? Great!"

	para "Give me your name"
	line "and phone number,"

	para "and I'll loan you"
	line "a SKATEBOARD."
	done

BorrowedASkateboardText:
	text "<PLAYER> borrowed a"
	line "SKATEBOARD."
	done

CeruleanBikeShopClerkFirstRateBikesText:
	text "My SKATEBOARD is"
	line "first-rate! You"

	para "can ride it"
	line "anywhere."
	done

CeruleanBikeShopClerkRefusedText:
	text "…sigh… Oh, for"
	line "the kindness of"
	cont "people…"
	done

CeruleanBikeShopBicycleText:
	text "It's a shiny new"
	line "BICYCLE!"
	done

CeruleanBikeShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CERULEAN_CITY, 7
	warp_event  3,  7, CERULEAN_CITY, 7

	db 0 ; coord events

	db 9 ; bg events
	bg_event  1,  2, BGEVENT_READ, CeruleanBikeShopBicycle
	bg_event  0,  3, BGEVENT_READ, CeruleanBikeShopBicycle
	bg_event  1,  3, BGEVENT_READ, CeruleanBikeShopBicycle
	bg_event  0,  5, BGEVENT_READ, CeruleanBikeShopBicycle
	bg_event  1,  5, BGEVENT_READ, CeruleanBikeShopBicycle
	bg_event  0,  6, BGEVENT_READ, CeruleanBikeShopBicycle
	bg_event  1,  6, BGEVENT_READ, CeruleanBikeShopBicycle
	bg_event  6,  6, BGEVENT_READ, CeruleanBikeShopBicycle
	bg_event  7,  6, BGEVENT_READ, CeruleanBikeShopBicycle

	db 1 ; object events
	object_event  7,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanBikeShopClerkScript, -1

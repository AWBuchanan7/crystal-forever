Unreferenced_GetNthMove::
	ld hl, wListMoves_MoveIndicesBuffer
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ret

GetBaseData::
	push bc
	push de
	push hl
	ldh a, [hROMBank]
	push af
	ld a, BANK(BaseData)
	rst Bankswitch

; Egg doesn't have BaseData
	ld a, [BaseDataTableNo] ; c840
	and a 
	jr nz, .table1 ; EGG is at BaseData table 0
	ld a, [wCurSpecies]
	cp EGG
	jr z, .egg
	; jr nz, .table0

; Get BaseData
.table0
	ld hl, BaseData
	jr .ok
.table1
	ld hl, BaseData256 ; take BaseData from the second table
.ok
	ld bc, BASE_DATA_SIZE
	ld a, [wCurSpecies]
	dec a
	call AddNTimes
	ld de, wCurBaseData
	ld bc, BASE_DATA_SIZE
	call CopyBytes
	jr .end

.egg
; ????
	ld de, UnknownEggPic

; Sprite dimensions
	ld b, $55 ; 5x5
	ld hl, wBasePicSize
	ld [hl], b

; ????
	ld hl, wBasePadding
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
	jr .end

.end
; Replace Pokedex # with species
	ld a, [wCurSpecies]
	ld [wBaseDexNo], a

	pop af
	rst Bankswitch
	pop hl
	pop de
	pop bc
	ret

GetCurNick::
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames

GetNick::
; Get nickname a from list hl.

	push hl
	push bc

	call SkipNames
	ld de, wStringBuffer1

	push de
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	pop de

	callfar CorrectNickErrors

	pop bc
	pop hl
	ret

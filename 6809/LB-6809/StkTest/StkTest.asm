; StkTest.asm
; Assembled with asm6809
; Land Boards, LLC
; Test Stack using LB-6809-01 on LB-MEM-02 card
; Takes about 2 secs

RAMSTART	EQU $0000
RAMEND		EQU $0007
RAMENDPL1	EQU $8000
ACIABASE	EQU $8000
LEDADR		EQU $F000
LED_OFF		EQU $00
LED_ON		EQU $01

		ORG $C000
; SET LED = LOW
RESVEC	LDA	#LED_OFF
		STA	LEDADR
		LDU	#$7F00	; SET USER STACK POINTER
		LDS	#$7E00	; SET HARDWARE STACK POINTER
		LDA #$55
		LDB #$AA
		BSR	STUFF
		LDA	#LED_ON
		STA	LEDADR
LOOP4EVR
		BRA	LOOP4EVR

STUFF
		PSHU    A
		LDA #$01
		LDB #$02
		PULU	A
		RTS
		
; Reset vector
		ORG	$FFFE
LBFFE	FDB	RESVEC	; RESET 

; ramTest.asm
; Assembled with asm6809
; Land Boards, LLC
; Test RAM using LB-6809-01 on LB-MEM-02 card
; Takes about 2 secs

RAMSTART	EQU $0000
RAMEND		EQU $0007
RAMENDPL1	EQU $8000
ACIABASE	EQU $A000
ACIA_ST_CMD	EQU $00
ACIA_DAT	EQU $01

		ORG $C000
; SET LED = LOW
RESVEC	NOP
		LDU	#$7F00	; SET USER STACK POINTER
		LDS	#$7E00	; SET HARDWARE STACK POINTER
; TEST WITH WRTE/READ OF ADDRESS $0000 AND VALUE OF $55
		LDA	#$55
		STA	RAMSTART
		NOP
		LDB	RAMSTART
		CMPB #$55
		LBNE	FASTBLINK
; TEST WITH WRITE/READ OF ADDRESS $0000 AND VALUE OF $AA
		LDA	#$AA
		STA	RAMSTART
		NOP
		LDB	RAMSTART
		CMPB #$AA
		LBNE	FASTBLINK
; BOUNCE A BIT ACROSS THE DATA LINES OF ADDR $0000
		LDA #$01
LOOP1ADR
		STA RAMSTART
		NOP
		CMPA	RAMSTART
		LBNE	FASTBLINK
		ASLA
		CMPA #$00
		BNE	LOOP1ADR
; Fill memory with a ramp value
		LDX #RAMSTART
		LDA #0
		LDB #1
LPSTORE
		STA 0,X
		ABX
		INCA
		CMPX	#RAMENDPL1
		BNE	LPSTORE
; CHECK RAMP VALUES
		LDX #RAMSTART
		LDA #0
		LDB #1
LPCHECK
		CMPA	0,X
		BNE	FASTBLINK
		ABX
		INCA
		CMPX	#RAMENDPL1
		BNE	LPCHECK
;
; CHECK UPPER ADDRESS LINES
;
		LDA	#1			; UPPER BYTE OF D
		LDB	#0			; LOWER BYTE OF D
LOOPBITWR
		TFR	D,X
		STA	0,X
		ADDA	#1
		CMPA	#80
		BNE		LOOPBITWR
; 
		LDA	#1			; UPPER BYTE OF D
		LDB	#0			; LOWER BYTE OF D
LOOPBITRD
		TFR	D,X
		CMPA	0,X
		BNE	FASTBLINK
		ADDA	#1
		CMPA	#80
		BNE		LOOPBITRD
		
;
; Test ACIA - Code written bu Microsoft Pilot with Human interaction
;
		BSR INITACIA
		LDA #'>'
		BSR WRITE_SERIAL
LOOPWR
		BSR	READ_SERIAL
		BSR WRITE_SERIAL
		BRA	LOOPWR
		
; DEFAULT = PASS
		BRA	SLOWBLINK

        ; Initialize the ACIA
INITACIA
		PSHU    A,X            ; Push registers A and X onto the stack
		LDX     #ACIABASE      ; Base address of the 6850 ACIA
        LDA     #$03           ; Reset transmitter and receiver
        STA     ACIA_ST_CMD,X  ; Write to control register
        LDA     #$15           ; Control register value: 8N1, 115200 baud
        STA     ACIA_ST_CMD,X  ; Write to control register
		LDA		ACIA_DAT,X	   ; READ RECEIVER TO FLUSH ERRORS
		PULU    A,X            ; Pull registers A and B from the stack
		RTS

; Subroutine to read serial data
; Uses A, X registers
; Returns data in register A
READ_SERIAL
		PSHU    X               ; Push register X onto the stack
		LDX     #ACIABASE       ; Base address of the 6850 ACIA
RDSERLP
		LDA     ACIA_ST_CMD,X   ; Read status register
        ANDA    #$01            ; Check if data is available
        BEQ     RDSERLP		    ; If not, loop until data is available
        LDA     ACIA_DAT,X      ; Read received data
		PULU    X               ; Pull registers A and B from the stack
        RTS                     ; Return from subroutine

; Subroutine to write serial data
; Uses A, B, X registers
; Writes data from register A
WRITE_SERIAL
		PSHU    B,X             ; Push registers B and X onto the stack
		LDX     #ACIABASE       ; Base address of the 6850 ACIA
WRSERLP
        LDB     ACIA_ST_CMD,X   ; Read status register
        ANDB    #$02            ; Check if transmitter is ready
        BEQ     WRSERLP         ; If not, loop until transmitter is ready
        STA     ACIA_DAT,X      ; Write data to transmit register
		PULU    B,X             ; Pull registers B and X from the stack
        RTS                     ; Return from subroutine


;
; Slowly blink LED
;
FASTBLINK
		CLRA
		STA	$F000
; WAIT LOOP
		LDA	#$40
LOOPX1
		LDB	#$FF
LOOPX1B
		NOP
		DECB
		BNE LOOPX1B
		DECA
		BNE	LOOPX1
; SET LED = HIGH
		LDA	#$1
		STA	$F000
; WAIT LOOP
		LDA	#$FF
LOOPX2
		LDB	#$40
LOOPX2B
		NOP
		DECB
		BNE LOOPX2B
		DECA
		BNE	LOOPX2
; LOOP FOREVER
		BRA	FASTBLINK

;
; Slowly blink LED
;
SLOWBLINK
		CLRA
		STA	$F000
; WAIT LOOP
		LDA	#$FF
LOOP1
		LDB	#$FF
LOOP1B
		NOP
		DECB
		BNE LOOP1B
		DECA
		BNE	LOOP1
; SET LED = HIGH
		LDA	#$1
		STA	$F000
; WAIT LOOP
		LDA	#$FF
LOOP2
		LDB	#$FF
LOOP2B
		NOP
		DECB
		BNE LOOP2B
		DECA
		BNE	LOOP2
; LOOP FOREVER
		BRA	SLOWBLINK

; Reset vector
		ORG	$FFFE
LBFFE	FDB	RESVEC	; RESET 

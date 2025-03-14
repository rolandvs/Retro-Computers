/1
	.EXTERNAL PUTNAM,PUTSP,GETTYP,PUTO
	.ENTRY KIND
	.GLOBAL TYPTBL
	PDHRT=37
	XR1=11
	TEMP=26
	PDHIT=30
	BLOC=36
	UN=6

	.RSECT OV,LEVEL=1,OVERLAY=1
	FIELD 1

GETD77,	0
	TAD (7707
	DCA MASK
	TAD (-6704	/V3C
	JMS SRCH
	RTR
	RAR
	AND (7
	JMP I GETD77

QTTY,	TAD I PDHIT
	SMA CLA		/1 OR 2 PAGE?
	JMP I ($ASR	/1 PAGE
	JMP I ($KL8E	/2 PAGE

QRK8E,	TAD I PDHIT
	AND (7
	CLL RAR
	DCA UN
	JMP I ($RK8E

TSTUN,	0
	TAD I PDHIT
	AND (7
	DCA UN
	JMP I TSTUN


QRK8,	JMS TSTUN
	JMP I ($RK8
QTC08,
QLINC,	JMS TSTUN
	JMP I (NOKIND
/HNDGET GETS VALUE IN HANDLER FROM REL LOC IN AC

HNDGET,	0
	TAD BLOC
	DCA TEMP
	CDF 0
	TAD I TEMP
	CDF 10
	JMP I HNDGET
/SRCH SEARCHES THE HANDLER FOR THE NEGATIVE
/OF THE NON-ZERO VALUE IN THE AC.
/MASKED BY MASK.
/IF FOUND, RETURN IS MADE WITH VALUE(WITHOUT MASK) IN AC
/IF NOT FOUND, AC IS 0 UPON RETURN

SRCH,	0
	DCA LOOK4
	STA
	TAD BLOC
	DCA XR1
	TAD (-230	/V3C MUST SEARCH 2 PAGES; TROUBLE IF TA8E IS IN LAST SLOT
	DCA SRCHCNT
SRCHLP,	CDF 0
	TAD I XR1
	CDF 10
	DCA TEMP
	TAD TEMP
	AND MASK
	TAD LOOK4
	SNA CLA
	JMP SRCHGOT
	ISZ SRCHCNT
	JMP SRCHLP
	JMP I SRCH

SRCHGOT,TAD TEMP
	JMP I SRCH

SRCHCNT,-400
LOOK4,	0
/	**** NOTE:  ALL HANDLERS SHOULD BE PADDED OUT TO FILL PAGE
/		WITH ZEROES
/BUILD SHOULD WRITE ZEROES IN 2ND PAGE OF ONE PAGE HANDLER
/SPECIAL PURPOSE ROUTINES

QPTP,
QPTR,	STA
	DCA MASK
	TAD (-6021
	JMS SRCH
	SZA CLA
	JMP I ($PT8E
	JMP I ($LSPT

/FOR TYPE PTR
/	IF HANDLER CONTAINS A 6021 IT IS A PT8E
/	OTHERWISE IT IS A LSPT

QCR8E,	TAD (104
	JMS HNDGET
	TAD (-3203
	SNA
	JMP I ($C029
	TAD (3203-7735
	SNA CLA
	JMP I ($C026
	JMP I (NOKIND
/FOR TYPE CR8E
/	IF REL LOC 104 IS A 3203 IT IN 029 KIND
/	IF REL LOC 104 IS A 7735 IT IS  AN 026 KIND
/	OTHERWISE IT IS AN UNKNOWN KIND

QLPTR,	TAD I PDHIT
	SPA CLA		/1 OR 2 PAGE?
	JMP I ($LQP	/2 PG
	STA		/1 PG
	DCA MASK
	TAD (-6652	/SEARCH FOR A 6652
	JMS SRCH
	SZA CLA
	JMP I ($L645	/FOUND IT
	CLA IAC		/LOOK AT REL LOC 1
	JMS HNDGET
	TAD (-4
	SNA
	JMP I ($LV8E
	TAD (4-14
	SNA CLA
	JMP I ($LPSV
	JMP I (NOKIND

/IF HANDLER CONTAINS A 6652 IT'S AN L645
/OTHERWISE, DEPENDS ON REL LOC 1
/	IF REL LOC 1 IS A 14, IT'S A LPSV
/	IF REL LOC 1 IS A 4, IT'S A LV8E
/	OTHERWISE IT'S UNKNOWN (POSSIBLY OLD LP08 OR LS8E KIND)

MASK,	0
	PAGE
QTD8E,	JMS I (GETD77
	CIA
	TAD (10
	DCA TEMP
	TAD I ($TD8+1
	AND (7700
	TAD TEMP
	DCA I ($TD8+1
	TAD I PDHIT
	RTR
	RAR
	STA
	TAD TEMP
	CML RAL		/TIMES 2 + LINK
	DCA UN
	JMP I ($TD8

/FIGURE OUT KIND OF TD8E BY DEVICE CODE FOUND IN 67N1 INSTRUCTION
/	N	TYPE
/	7	TD8A
/	6	TD8B
/..
/	1	TD8G
/	0	TD8H

QTA8E,	JMS I (GETD77
	IAC
	DCA TEMP
	TAD I ($TA8+1
	AND (7700
	TAD TEMP
	DCA I ($TA8+1
	STA
	TAD I PDHIT
	AND (177
	SNA CLA
	CLA IAC
	DCA UN
	STA
	TAD TEMP
	CLL RAL
	TAD UN
	DCA UN
	JMP I ($TA8
/FIGURE OUT KIND OF TA8E BY DEVICE CODE FOUND IN 67N1 INSTRUCTION

/	N	KIND
/	0	TA8A
/	1	TA8B
/...
/	6	TA8G
/	7	TA8H
RLSPC,	TAD I PDHIT
	TAD (-50
	RTR
	SKP
RLSP,	TAD I PDHIT
	AND (3
	DCA UN
	JMP I (NOKIND
	PAGE
$LQP,	IAC	/23
PLAT4,	IAC	/22
PLAT3,	IAC	/21
PLAT2,	IAC	/20
PLAT1,	IAC	/17
$XTRA,	IAC	/16
$KL8E,	IAC	/15
$RK8E,	IAC	/14
$RK8,	IAC	/13
$ASR,	IAC	/12
$TA8,	IAC	/11
$TD8,	IAC	/10
$L645,	IAC	/7
$LPSV,	IAC	/6
$LV8E,	IAC	/5
$C026,	IAC	/4
$C029,	IAC	/3
$LSPT,	IAC	/2
$PT8E,	IAC	/1
NOKIND,	CLL RAL
/PRINTS NAME FROM TABLE, ENTER WITH ENTRY # IN AC
PRNAM,	TAD (TABASE
	JMS PUTNAM
	JMS UNIT
	JMP KINDRET
KIND,	0
	JMS PUTSP
	TAD BLOC
	SNA CLA
	JMP NOKIND
	JMS GETTYP
	SNA
	JMP NOKIND
	DCA TEMP
	JMP I TEMP	/BRANCH TO APPROPRIATE SUBROUTINE
KINDRET,JMP I KIND

/KIND SUBROUTINES
/ENTER WITH BLOC POINTING TO HANDLER BLOCK IN CORE

TABASE,	4040;4040	/0
	DEVICE PT8E	/1
	DEVICE KS33	/2
	DEVICE 029	/3
	DEVICE 026	/4
	DEVICE LV8E	/5
	DEVICE LPSV	/6
	DEVICE L645	/7
KTD8,	DEVICE TD8	/10
KTA8,	DEVICE TA8	/11
	DEVICE AS33	/12
	DEVICE RK01	/13
	DEVICE RK05	/14
	DEVICE KL8E	/15
	DEVICE XTRA	/16
	TEXT   / =1/	/17
	TEXT   / =2/	/20
	TEXT   / =3/	/21
	TEXT   / =4/	/22
	DEVICE LQP	/23
UNIT,	0
	JMS PUTSP
	TAD BLOC
	SNA CLA
	JMP TSTSUN
	TAD UN
	SPA
	TAD (40+1-60
ZOUN,	TAD (60
	JMS PUTO
	JMP I UNIT

TSTSUN,	TAD I PDHRT
	TAD (-7607
	SZA CLA
	CLA IAC		/ASSUME CORESIDENT HANDLERS ARE UNIT 1
	JMP ZOUN	/ELSE, NO UNIT
	PAGE
	.ASECT TYPTAB,LEVEL=0
	FIELD 0

	*2000

/	DEVICE LENGTH TABLE

/FORMAT OF THIS TABLE:

/1,2	DEVICE GENERALIZED NAME (CORR TO TYPE)
/3	NEG OF LENGTH
/4	ADDRESS OF SUBR IN FIELD 1 FOR SPECIALIZATION

TYPTBL,	DEVICE TTY ;0000;QTTY	/0
	DEVICE PTR ;0000;QPTR	/1
	DEVICE PTP ;0000;QPTP	/2
	DEVICE CR8E;0000;QCR8E	/3
	DEVICE LPTR;0000;QLPTR	/4	V3D
	DEVICE RK8  ;1520;QRK8	/5
	DEVICE RF08;6001;PLAT1	/6	V3C
	DEVICE RF08;4002;PLAT2	/7
	DEVICE RF08;2003;PLAT3	/10
	DEVICE RF08;0004;PLAT4	/11	RF'S NOW ONLY HAVE LOGICALLY 1777 BLOCKS
	DEVICE DF32;7601;PLAT1	/12
	DEVICE DF32;7402;PLAT2	/13	V3C
	DEVICE DF32;7203;PLAT3	/14
	DEVICE DF32;7004;PLAT4	/15	DF'S HAVE 177 BLOCKS
	DEVICE TC08;6437;QTC08	/16
	DEVICE LINC;6437;QLINC	/17
	DEVICE TM8E;0000;0	/20
	DEVICE TD8E;6437;QTD8E	/21
	DEVICE BAT ;0000;0	/22
	DEVICE RK8E;1520;QRK8E	/23
	DEVICE NULL;0000;0	/24
	DEVICE RX8E;7022;0	/25
	DEVICE RL01;-7761;RLSP	/26
	DEVICE TA8E;0000;QTA8E	/27
	DEVICE VR12;0000;0	/30
	DEVICE RL01;-3751;RLSPC	/31
	DEVICE RX02;6044;0	/32
	DEVICE VXA0;7200;PLAT3	/33
	ZBLOCK 4		/34
	ZBLOCK 4		/35
	DEVICE DUMP;0000;0	/36
	ZBLOCK 4		/37
	ZBLOCK TYPTBL+400-.
	PAGE


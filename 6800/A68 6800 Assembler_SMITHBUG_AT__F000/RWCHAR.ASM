INEEE	EQU	$C1F4
OUTEEE	EQU	$C20A

LOOP4VR
	BSR INEEE
	BSR	OUTEEE
	BRA	LOOP4VR
	
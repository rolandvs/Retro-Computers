
/*
		"CONVERT"
		WRITTEN BY LEOR ZOLMAN

	THIS PROGRAM CONVERTS REGULAR C SOURCE FILES INTO A 
	FORMAT SUITABLE FOR EDITING ON THE TRS-80 (OR ANY
	UPPER-CASE-ONLY SYSTEM.) SINCE THERE ARE QUITE A FEW
	ASCII CHARACTERS THAT NEED TO BE REPRESENTED EVEN
	THOUGH THEY DON'T SHOW UP ON UPPER-CASE-ONLY SYSTEMS,
	A SPECIAL NOTATION HAS BEEN CREATED FOR REPRESENTING
	THESE CHARACTERS. THE POUND SIGN IS USED AS A
	SORT OF 'SHIFT' KEY, WITH THE LETTER FOLLOWING THE
	POUND SIGN DENOTING THE SPECIAL CHARACTER NEEDED.
	NOTE THAT THE C COMPILER DOES NOT RECOGNIZE THIS
	SPECIAL SCHEME, AND BEFORE YOU CAN COMPILE A SOURCE
	FILE CONTAINING THE SPECIAL CODES YOU MUST PREPROCESS
	THE FILE USING THE "CC0T" COMMAND.

	THE SPECIAL CODES AND THE CHARACTERS THEY REPRESENT ARE:
	#L	LEFT BRACKET (FOR SUBSCRIPTING) (5B HEX)
	#R	RIGHT BRACKET			(5D HEX)
	#C	CIRCUMFLEX (BITWISE "NOT")	(7E HEX)
	#H	UP-ARROW (EXCLUSIVE "OR" OPERATOR)
						(5E HEX)
	#V	VERTICAL VAR (LOGICAL AND BITWISE "OR")
						(7C HEX)
	#B	BACKSLASH (FOR ESCAPE SEQUENCES)(5C HEX)
	#U	UNDERSCORE			(5F HEX)

	FOR EXAMPLE, THE COMMAND
		A>CONVERT FOO.C BAR.CT

	WILL EXPECT FOO.C TO BE A NORMAL C SOURCE FILE ON
	DISK, AND WILL CONVERT IT INTO A FILE NAMED BAR.CT.
	THE FILE BAR.CT MAY THEN BE EDITED TO YOUR TASTE,
	BUT REMEMBER TO PREPROCESS IT WITH "CC0T" BEFORE
	APPLYING THE C COMPILER.

	AS YOU MAY HAVE GATHERED FROM ALL THIS, THE LANGUAGE
	"C" WAS NEVER INTENDED TO BE IMPLEMENTED ON A SYSTEM
	HAVING UPPER-CASE ONLY; NEVERTHELESS, HERE IS A WAY
	FOR IT TO BE DONE.

	THIS PROGRAM IS RATHER SIMPLE, AND THUS IT WILL NOT
	RECOGNIZE THAT SPECIAL CHARACTERS IN QUOTES ARE NOT
	SUPPOSED TO BE CONVERTED.
*/

#INCLUDE "BDSCIO.H"

#DEFINE LEFTCURLY 0X7B
#DEFINE RIGHTCURLY 0X7D
#DEFINE LEFTBRACK 0X5B
#DEFINE RIGHTBRACK 0X5D
#DEFINE CIRCUM 0X7E
#DEFINE UPARROW 0X5E
#DEFINE VERTIBAR 0X7C
#DEFINE BACKSLASH 0X5C
#DEFINE UNDERSCORE 0X5F

CHAR IBUF[BUFSIZ], OBUF[BUFSIZ];

MAIN(ARGC,ARGV)
INT ARGC;
CHAR *ARGV[];
BEGIN
	INT FD1, FD2;
	CHAR C;
	IF (ARGC != 3) BEGIN
		PRINTF("USAGE: CONVERT OLD NEW <CR>\N");
		EXIT();
	END

	FD1 = FOPEN(ARGV[1],IBUF);
	IF (FD1 == ERROR) BEGIN
		PRINTF("NO SOURCE FILE.\N");
		EXIT();
	END
	FD2 = FCREAT(ARGV[2],OBUF);
	IF (FD2 == ERROR) BEGIN
		PRINTF("CAN'T OPEN OUTPUT FILE.\N");
		EXIT();
	END

	WHILE ((( C = GETC(IBUF)) != CPMEOF) && C != 255) BEGIN
		SWITCH (C) BEGIN
		 CASE LEFTCURLY: PUTST(" BEGIN ");
				BREAK;
		 CASE RIGHTCURLY: PUTST(" END ");
				 BREAK;
		 CASE LEFTBRACK: PUTSPEC('L');
				BREAK;
		 CASE RIGHTBRACK: PUTSPEC('R');
				BREAK;
		 CASE CIRCUM: PUTSPEC('C');
				BREAK;
		 CASE UPARROW: PUTSPEC('U');
				BREAK;
		 CASE VERTIBAR: PUTSPEC('V');
				BREAK;
		 CASE BACKSLASH: PUTSPEC('B');
				BREAK;
		 CASE UNDERSCORE: PUTSPEC('U');
				BREAK;
		 DEFAULT: PUTC2(TOUPPER(C));
		END
	END

	IF (C==255) C = CPMEOF;  /* DIGITAL RESEARCH....WOW. */
	PUTC2(C);
	FFLUSH(OBUF);
	FCLOSE(OBUF);
	FCLOSE(IBUF);
END

PUTST(STRING)
CHAR *STRING;
BEGIN
	WHILE (*STRING) PUTC2(*STRING++);
END

PUTSPEC(C)
CHAR C;
BEGIN
	PUTC2('#');
	PUTC2(C);
END

PUTC2(C)
CHAR C;
BEGIN
	IF (PUTC(C,OBUF) < 0) BEGIN
		PRINTF("OUTPUT WRITE ERROR (DISK FULL?)\N");
		EXIT();
	END
END

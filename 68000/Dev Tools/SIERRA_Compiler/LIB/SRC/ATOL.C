/*
 *  atol.c
 *
 *  Copyright 1987, 1992 by Sierra Systems.  All rights reserved.
 */

#include <stdlib.h>
#include <ctype.h>

/*-------------------------------- atoi() -----------------------------------*/

/*
 * atol is a standard C library function which converts a null-terminated
 * character string representing a decimal integer number into a long integer
 * value.  atol() is identical to
 *
 *	strtol( string, (char **)NULL, 10)
 *
 * with the exception that on overflow the behavior is undefined and errno
 * is not set.
 */

long atol(const char *str)
{
    register long number;
    register negative;
    register int c;
    register int digit;

    negative = 0;

    while( isspace(*str) )
	str++;

    if( (*str == '-') || (*str == '+') )	
	negative = (*str++ == '-');

    /* get a digit, break if not valid, add digit to number */

    c = *str;
    if( isdigit(c) )
	number = c - '0';
    else
	return(0);

    for( c = *++str; ; c = *++str ) {
	if( isdigit(c) )
	    digit = c - '0';
	else
	    break;
	number = (number << 3) + number + number;
	number += digit;
    }

    return(negative ? -number : number);
}


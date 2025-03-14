/* /////////////////////////////////////////////////////////////////////
//      xsetibm.c
//
//  Restores the the Multicomp main Font in Font-ROMs.
//
//  Copyright (c)2019 Kurt Mueller written for Multicomp Z80
//  ===================================================================
//
//  -------------------------------------------------------------------
//   MESCC:
//   Copyright (c) 2015 Miguel I. Garcia Lopez / FloppySoftware, Spain
//   (MESCC is part of Miguel I. Garcia Lopez RetroProjects
//                                            'xpcw' package on Github)
//  -------------------------------------------------------------------
//
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation; either version 2, or (at your option)
//  any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software
//  Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.
//
//  To compile with MESCC:
//
//  cc xsetibm
//  zsm xsetibm
//  hexcom xsetibm
//  gencom xsetibm.com xgraph.rsx
//
//  Changes:
//
//  31 Jan 2019 : First Version for Multicomp-Graphic
//
///////////////////////////////////////////////////////////////////// */


/* Some defines for MESCC
// ----------------------
*/
#define CC_NO_ARGS  /* No argc and argv[] in main */

/* MESCC libraries
// ---------------
*/

#include "mescc.h"
#include "conio.h"

/* Xgraph libraries
// --------------
*/
#include "xgraph.h"
#include "xdraw.h"
#include "xchrdef.h"
#include "xtext.h"

/* -------------------------------------
// -------------- xsetibm.c ---------------
// -------------------------------------
*/

main()
{

/* ASCII Clear-Screen */
    AClrScr();

/* Check if the RSX is in memory */
    if(!HelloRsx()) {
        puts("The RSX is not in memory!");
        return -1;
    }

/* Init Graphic */
    InitGraphic();

/* Graphic switched OFF */
    GScreen(X_OFF);

/* Show restore full char-set font-rom */
       WrFntROM(255, 0x00, CGAFntBld);
}

#asm
CGAFntBld: ; Grant's original Multicomp-Font
 DEFB 000h,000h,000h,000h,000h,000h,000h,000h,07Eh,081h,0A5h,081h,0BDh,099h,081h,07Eh
 DEFB 07Eh,0FFh,0DBh,0FFh,0C3h,0E7h,0FFh,07Eh,06Ch,0FEh,0FEh,0FEh,07Ch,038h,010h,000h
 DEFB 010h,038h,07Ch,0FEh,07Ch,038h,010h,000h,038h,07Ch,038h,0FEh,0FEh,0D6h,010h,038h
 DEFB 010h,010h,038h,07Ch,0FEh,07Ch,010h,038h,000h,000h,018h,03Ch,03Ch,018h,000h,000h
 DEFB 0FFh,0FFh,0E7h,0C3h,0C3h,0E7h,0FFh,0FFh,000h,03Ch,066h,042h,042h,066h,03Ch,000h
 DEFB 0FFh,0C3h,099h,0BDh,0BDh,099h,0C3h,0FFh,00Fh,007h,00Fh,07Dh,0CCh,0CCh,0CCh,078h
 DEFB 03Ch,066h,066h,066h,03Ch,018h,07Eh,018h,03Fh,033h,03Fh,030h,030h,070h,0F0h,0E0h
 DEFB 07Fh,063h,07Fh,063h,063h,067h,0E6h,0C0h,018h,0DBh,03Ch,0E7h,0E7h,03Ch,0DBh,018h
 DEFB 080h,0E0h,0F8h,0FEh,0F8h,0E0h,080h,000h,002h,00Eh,03Eh,0FEh,03Eh,00Eh,002h,000h
 DEFB 018h,03Ch,07Eh,018h,018h,07Eh,03Ch,018h,066h,066h,066h,066h,066h,000h,066h,000h
 DEFB 07Fh,0DBh,0DBh,07Bh,01Bh,01Bh,01Bh,000h,03Eh,063h,038h,06Ch,06Ch,038h,0CCh,078h
 DEFB 000h,000h,000h,000h,07Eh,07Eh,07Eh,000h,018h,03Ch,07Eh,018h,07Eh,03Ch,018h,0FFh
 DEFB 018h,03Ch,07Eh,018h,018h,018h,018h,000h,018h,018h,018h,018h,07Eh,03Ch,018h,000h
 DEFB 000h,018h,00Ch,0FEh,00Ch,018h,000h,000h,000h,030h,060h,0FEh,060h,030h,000h,000h
 DEFB 000h,000h,0C0h,0C0h,0C0h,0FEh,000h,000h,000h,024h,066h,0FFh,066h,024h,000h,000h
 DEFB 000h,018h,03Ch,07Eh,0FFh,0FFh,000h,000h,000h,0FFh,0FFh,07Eh,03Ch,018h,000h,000h
 DEFB 000h,000h,000h,000h,000h,000h,000h,000h,030h,078h,078h,030h,030h,000h,030h,000h
 DEFB 06Ch,06Ch,06Ch,000h,000h,000h,000h,000h,06Ch,06Ch,0FEh,06Ch,0FEh,06Ch,06Ch,000h
 DEFB 030h,07Ch,0C0h,078h,00Ch,0F8h,030h,000h,000h,0C6h,0CCh,018h,030h,066h,0C6h,000h
 DEFB 038h,06Ch,038h,076h,0DCh,0CCh,076h,000h,060h,060h,0C0h,000h,000h,000h,000h,000h
 DEFB 018h,030h,060h,060h,060h,030h,018h,000h,060h,030h,018h,018h,018h,030h,060h,000h
 DEFB 000h,066h,03Ch,0FFh,03Ch,066h,000h,000h,000h,030h,030h,0FCh,030h,030h,000h,000h
 DEFB 000h,000h,000h,000h,000h,030h,030h,060h,000h,000h,000h,0FCh,000h,000h,000h,000h
 DEFB 000h,000h,000h,000h,000h,030h,030h,000h,006h,00Ch,018h,030h,060h,0C0h,080h,000h
 DEFB 07Ch,0C6h,0CEh,0DEh,0F6h,0E6h,07Ch,000h,030h,070h,030h,030h,030h,030h,0FCh,000h
 DEFB 078h,0CCh,00Ch,038h,060h,0CCh,0FCh,000h,078h,0CCh,00Ch,038h,00Ch,0CCh,078h,000h
 DEFB 01Ch,03Ch,06Ch,0CCh,0FEh,00Ch,01Eh,000h,0FCh,0C0h,0F8h,00Ch,00Ch,0CCh,078h,000h
 DEFB 038h,060h,0C0h,0F8h,0CCh,0CCh,078h,000h,0FCh,0CCh,00Ch,018h,030h,030h,030h,000h
 DEFB 078h,0CCh,0CCh,078h,0CCh,0CCh,078h,000h,078h,0CCh,0CCh,07Ch,00Ch,018h,070h,000h
 DEFB 000h,030h,030h,000h,000h,030h,030h,000h,000h,030h,030h,000h,000h,030h,030h,060h
 DEFB 018h,030h,060h,0C0h,060h,030h,018h,000h,000h,000h,0FCh,000h,000h,0FCh,000h,000h
 DEFB 060h,030h,018h,00Ch,018h,030h,060h,000h,078h,0CCh,00Ch,018h,030h,000h,030h,000h
 DEFB 07Ch,0C6h,0DEh,0DEh,0DEh,0C0h,078h,000h,030h,078h,0CCh,0CCh,0FCh,0CCh,0CCh,000h
 DEFB 0FCh,066h,066h,07Ch,066h,066h,0FCh,000h,03Ch,066h,0C0h,0C0h,0C0h,066h,03Ch,000h
 DEFB 0F8h,06Ch,066h,066h,066h,06Ch,0F8h,000h,0FEh,062h,068h,078h,068h,062h,0FEh,000h
 DEFB 0FEh,062h,068h,078h,068h,060h,0F0h,000h,03Ch,066h,0C0h,0C0h,0CEh,066h,03Eh,000h
 DEFB 0CCh,0CCh,0CCh,0FCh,0CCh,0CCh,0CCh,000h,078h,030h,030h,030h,030h,030h,078h,000h
 DEFB 01Eh,00Ch,00Ch,00Ch,0CCh,0CCh,078h,000h,0E6h,066h,06Ch,078h,06Ch,066h,0E6h,000h
 DEFB 0F0h,060h,060h,060h,062h,066h,0FEh,000h,0C6h,0EEh,0FEh,0FEh,0D6h,0C6h,0C6h,000h
 DEFB 0C6h,0E6h,0F6h,0DEh,0CEh,0C6h,0C6h,000h,038h,06Ch,0C6h,0C6h,0C6h,06Ch,038h,000h
 DEFB 0FCh,066h,066h,07Ch,060h,060h,0F0h,000h,078h,0CCh,0CCh,0CCh,0DCh,078h,01Ch,000h
 DEFB 0FCh,066h,066h,07Ch,06Ch,066h,0E6h,000h,078h,0CCh,060h,030h,018h,0CCh,078h,000h
 DEFB 0FCh,0B4h,030h,030h,030h,030h,078h,000h,0CCh,0CCh,0CCh,0CCh,0CCh,0CCh,0FCh,000h
 DEFB 0CCh,0CCh,0CCh,0CCh,0CCh,078h,030h,000h,0C6h,0C6h,0C6h,0D6h,0FEh,0EEh,0C6h,000h
 DEFB 0C6h,0C6h,06Ch,038h,038h,06Ch,0C6h,000h,0CCh,0CCh,0CCh,078h,030h,030h,078h,000h
 DEFB 0FEh,0C6h,08Ch,018h,032h,066h,0FEh,000h,078h,060h,060h,060h,060h,060h,078h,000h
 DEFB 0C0h,060h,030h,018h,00Ch,006h,002h,000h,078h,018h,018h,018h,018h,018h,078h,000h
 DEFB 010h,038h,06Ch,0C6h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0FFh
 DEFB 030h,030h,018h,000h,000h,000h,000h,000h,000h,000h,078h,00Ch,07Ch,0CCh,076h,000h
 DEFB 0E0h,060h,060h,07Ch,066h,066h,0DCh,000h,000h,000h,078h,0CCh,0C0h,0CCh,078h,000h
 DEFB 01Ch,00Ch,00Ch,07Ch,0CCh,0CCh,076h,000h,000h,000h,078h,0CCh,0FCh,0C0h,078h,000h
 DEFB 038h,06Ch,060h,0F0h,060h,060h,0F0h,000h,000h,000h,076h,0CCh,0CCh,07Ch,00Ch,0F8h
 DEFB 0E0h,060h,06Ch,076h,066h,066h,0E6h,000h,030h,000h,070h,030h,030h,030h,078h,000h
 DEFB 00Ch,000h,00Ch,00Ch,00Ch,0CCh,0CCh,078h,0E0h,060h,066h,06Ch,078h,06Ch,0E6h,000h
 DEFB 070h,030h,030h,030h,030h,030h,078h,000h,000h,000h,0CCh,0FEh,0FEh,0D6h,0C6h,000h
 DEFB 000h,000h,0F8h,0CCh,0CCh,0CCh,0CCh,000h,000h,000h,078h,0CCh,0CCh,0CCh,078h,000h
 DEFB 000h,000h,0DCh,066h,066h,07Ch,060h,0F0h,000h,000h,076h,0CCh,0CCh,07Ch,00Ch,01Eh
 DEFB 000h,000h,0DCh,076h,066h,060h,0F0h,000h,000h,000h,07Ch,0C0h,078h,00Ch,0F8h,000h
 DEFB 010h,030h,07Ch,030h,030h,034h,018h,000h,000h,000h,0CCh,0CCh,0CCh,0CCh,076h,000h
 DEFB 000h,000h,0CCh,0CCh,0CCh,078h,030h,000h,000h,000h,0C6h,0D6h,0FEh,0FEh,06Ch,000h
 DEFB 000h,000h,0C6h,06Ch,038h,06Ch,0C6h,000h,000h,000h,0CCh,0CCh,0CCh,07Ch,00Ch,0F8h
 DEFB 000h,000h,0FCh,098h,030h,064h,0FCh,000h,01Ch,030h,030h,0E0h,030h,030h,01Ch,000h
 DEFB 018h,018h,018h,000h,018h,018h,018h,000h,0E0h,030h,030h,01Ch,030h,030h,0E0h,000h
 DEFB 076h,0DCh,000h,000h,000h,000h,000h,000h,000h,010h,038h,06Ch,0C6h,0C6h,0FEh,000h
 DEFB 078h,0CCh,0C0h,0CCh,078h,018h,00Ch,078h,000h,0CCh,000h,0CCh,0CCh,0CCh,07Eh,000h
 DEFB 01Ch,000h,078h,0CCh,0FCh,0C0h,078h,000h,07Eh,0C3h,03Ch,006h,03Eh,066h,03Fh,000h
 DEFB 0CCh,000h,078h,00Ch,07Ch,0CCh,07Eh,000h,0E0h,000h,078h,00Ch,07Ch,0CCh,07Eh,000h
 DEFB 030h,030h,078h,00Ch,07Ch,0CCh,07Eh,000h,000h,000h,078h,0C0h,0C0h,078h,00Ch,038h
 DEFB 07Eh,0C3h,03Ch,066h,07Eh,060h,03Ch,000h,0CCh,000h,078h,0CCh,0FCh,0C0h,078h,000h
 DEFB 0E0h,000h,078h,0CCh,0FCh,0C0h,078h,000h,0CCh,000h,070h,030h,030h,030h,078h,000h
 DEFB 07Ch,0C6h,038h,018h,018h,018h,03Ch,000h,0E0h,000h,070h,030h,030h,030h,078h,000h
 DEFB 0C6h,038h,06Ch,0C6h,0FEh,0C6h,0C6h,000h,030h,030h,000h,078h,0CCh,0FCh,0CCh,000h
 DEFB 01Ch,000h,0FCh,060h,078h,060h,0FCh,000h,000h,000h,07Fh,00Ch,07Fh,0CCh,07Fh,000h
 DEFB 03Eh,06Ch,0CCh,0FEh,0CCh,0CCh,0CEh,000h,078h,0CCh,000h,078h,0CCh,0CCh,078h,000h
 DEFB 000h,0CCh,000h,078h,0CCh,0CCh,078h,000h,000h,0E0h,000h,078h,0CCh,0CCh,078h,000h
 DEFB 078h,0CCh,000h,0CCh,0CCh,0CCh,07Eh,000h,000h,0E0h,000h,0CCh,0CCh,0CCh,07Eh,000h
 DEFB 000h,0CCh,000h,0CCh,0CCh,07Ch,00Ch,0F8h,0C3h,018h,03Ch,066h,066h,03Ch,018h,000h
 DEFB 0CCh,000h,0CCh,0CCh,0CCh,0CCh,078h,000h,018h,018h,07Eh,0C0h,0C0h,07Eh,018h,018h
 DEFB 038h,06Ch,064h,0F0h,060h,0E6h,0FCh,000h,0CCh,0CCh,078h,0FCh,030h,0FCh,030h,030h
 DEFB 0F8h,0CCh,0CCh,0FAh,0C6h,0CFh,0C6h,0C7h,00Eh,01Bh,018h,03Ch,018h,018h,0D8h,070h
 DEFB 01Ch,000h,078h,00Ch,07Ch,0CCh,07Eh,000h,038h,000h,070h,030h,030h,030h,078h,000h
 DEFB 000h,01Ch,000h,078h,0CCh,0CCh,078h,000h,000h,01Ch,000h,0CCh,0CCh,0CCh,07Eh,000h
 DEFB 000h,0F8h,000h,0F8h,0CCh,0CCh,0CCh,000h,0FCh,000h,0CCh,0ECh,0FCh,0DCh,0CCh,000h
 DEFB 03Ch,06Ch,06Ch,03Eh,000h,07Eh,000h,000h,038h,06Ch,06Ch,038h,000h,07Ch,000h,000h
 DEFB 030h,000h,030h,060h,0C0h,0CCh,078h,000h,000h,000h,000h,0FCh,0C0h,0C0h,000h,000h
 DEFB 000h,000h,000h,0FCh,00Ch,00Ch,000h,000h,0C3h,0C6h,0CCh,0DEh,033h,066h,0CCh,00Fh
 DEFB 0C3h,0C6h,0CCh,0DBh,037h,06Fh,0CFh,003h,018h,018h,000h,018h,018h,018h,018h,000h
 DEFB 000h,033h,066h,0CCh,066h,033h,000h,000h,000h,0CCh,066h,033h,066h,0CCh,000h,000h
 DEFB 022h,088h,022h,088h,022h,088h,022h,088h,055h,0AAh,055h,0AAh,055h,0AAh,055h,0AAh
 DEFB 0DBh,077h,0DBh,0EEh,0DBh,077h,0DBh,0EEh,018h,018h,018h,018h,018h,018h,018h,018h
 DEFB 018h,018h,018h,018h,0F8h,018h,018h,018h,018h,018h,0F8h,018h,0F8h,018h,018h,018h
 DEFB 036h,036h,036h,036h,0F6h,036h,036h,036h,000h,000h,000h,000h,0FEh,036h,036h,036h
 DEFB 000h,000h,0F8h,018h,0F8h,018h,018h,018h,036h,036h,0F6h,006h,0F6h,036h,036h,036h
 DEFB 036h,036h,036h,036h,036h,036h,036h,036h,000h,000h,0FEh,006h,0F6h,036h,036h,036h
 DEFB 036h,036h,0F6h,006h,0FEh,000h,000h,000h,036h,036h,036h,036h,0FEh,000h,000h,000h
 DEFB 018h,018h,0F8h,018h,0F8h,000h,000h,000h,000h,000h,000h,000h,0F8h,018h,018h,018h
 DEFB 018h,018h,018h,018h,01Fh,000h,000h,000h,018h,018h,018h,018h,0FFh,000h,000h,000h
 DEFB 000h,000h,000h,000h,0FFh,018h,018h,018h,018h,018h,018h,018h,01Fh,018h,018h,018h
 DEFB 000h,000h,000h,000h,0FFh,000h,000h,000h,018h,018h,018h,018h,0FFh,018h,018h,018h
 DEFB 018h,018h,01Fh,018h,01Fh,018h,018h,018h,036h,036h,036h,036h,037h,036h,036h,036h
 DEFB 036h,036h,037h,030h,03Fh,000h,000h,000h,000h,000h,03Fh,030h,037h,036h,036h,036h
 DEFB 036h,036h,0F7h,000h,0FFh,000h,000h,000h,000h,000h,0FFh,000h,0F7h,036h,036h,036h
 DEFB 036h,036h,037h,030h,037h,036h,036h,036h,000h,000h,0FFh,000h,0FFh,000h,000h,000h
 DEFB 036h,036h,0F7h,000h,0F7h,036h,036h,036h,018h,018h,0FFh,000h,0FFh,000h,000h,000h
 DEFB 036h,036h,036h,036h,0FFh,000h,000h,000h,000h,000h,0FFh,000h,0FFh,018h,018h,018h
 DEFB 000h,000h,000h,000h,0FFh,036h,036h,036h,036h,036h,036h,036h,03Fh,000h,000h,000h
 DEFB 018h,018h,01Fh,018h,01Fh,000h,000h,000h,000h,000h,01Fh,018h,01Fh,018h,018h,018h
 DEFB 000h,000h,000h,000h,03Fh,036h,036h,036h,036h,036h,036h,036h,0FFh,036h,036h,036h
 DEFB 018h,018h,0FFh,018h,0FFh,018h,018h,018h,018h,018h,018h,018h,0F8h,000h,000h,000h
 DEFB 000h,000h,000h,000h,01Fh,018h,018h,018h,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
 DEFB 000h,000h,000h,000h,0FFh,0FFh,0FFh,0FFh,0F0h,0F0h,0F0h,0F0h,0F0h,0F0h,0F0h,0F0h
 DEFB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,0FFh,0FFh,0FFh,0FFh,000h,000h,000h,000h
 DEFB 000h,000h,076h,0DCh,0C8h,0DCh,076h,000h,000h,078h,0CCh,0F8h,0CCh,0F8h,0C0h,0C0h
 DEFB 000h,0FCh,0CCh,0C0h,0C0h,0C0h,0C0h,000h,000h,0FEh,06Ch,06Ch,06Ch,06Ch,06Ch,000h
 DEFB 0FCh,0CCh,060h,030h,060h,0CCh,0FCh,000h,000h,000h,07Eh,0D8h,0D8h,0D8h,070h,000h
 DEFB 000h,066h,066h,066h,066h,07Ch,060h,0C0h,000h,076h,0DCh,018h,018h,018h,018h,000h
 DEFB 0FCh,030h,078h,0CCh,0CCh,078h,030h,0FCh,038h,06Ch,0C6h,0FEh,0C6h,06Ch,038h,000h
 DEFB 038h,06Ch,0C6h,0C6h,06Ch,06Ch,0EEh,000h,01Ch,030h,018h,07Ch,0CCh,0CCh,078h,000h
 DEFB 000h,000h,07Eh,0DBh,0DBh,07Eh,000h,000h,006h,00Ch,07Eh,0DBh,0DBh,07Eh,060h,0C0h
 DEFB 038h,060h,0C0h,0F8h,0C0h,060h,038h,000h,078h,0CCh,0CCh,0CCh,0CCh,0CCh,0CCh,000h
 DEFB 000h,0FCh,000h,0FCh,000h,0FCh,000h,000h,030h,030h,0FCh,030h,030h,000h,0FCh,000h
 DEFB 060h,030h,018h,030h,060h,000h,0FCh,000h,018h,030h,060h,030h,018h,000h,0FCh,000h
 DEFB 00Eh,01Bh,01Bh,018h,018h,018h,018h,018h,018h,018h,018h,018h,018h,0D8h,0D8h,070h
 DEFB 030h,030h,000h,0FCh,000h,030h,030h,000h,000h,076h,0DCh,000h,076h,0DCh,000h,000h
 DEFB 038h,06Ch,06Ch,038h,000h,000h,000h,000h,000h,000h,000h,018h,018h,000h,000h,000h
 DEFB 000h,000h,000h,000h,018h,000h,000h,000h,00Fh,00Ch,00Ch,00Ch,0ECh,06Ch,03Ch,01Ch
 DEFB 078h,06Ch,06Ch,06Ch,06Ch,000h,000h,000h,070h,018h,030h,060h,078h,000h,000h,000h
 DEFB 000h,000h,03Ch,03Ch,03Ch,03Ch,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
#endasm


                         What is SYSLIB?

     SYSLI  (SYSte� LIBrary� i� � collectio� o� ove� 13� subrou�
tine� whic� ar� designe� t� provid� t� th� CP/� 8080/Z8� assembl� �
languag� programme� � se� o� function� upo� whic� h� ca� buil� �
hi� programs�  Thi� librar� i� intende� t� reliev� th� programme� �
o� th� tas� o� frequentl� "reinventin� th� wheel� an� t� provid� �
hi��� wit� a� too� environmen�� whic� encourage� structure� �
programmin� a� th� assembl� languag� level.

     Eac� subroutin� withi� SYSLI� ca� b� viewe� a� � reliabl� �
"blac� box.�  Th� subroutine� i� SYSLI� ar� completel� documente� �
withi� thi� 100� pag� manua� an� th� SYSLIBx.HL� files�� an� th� �
programme� i� consistentl� provide� wit� th� followin� informa�
tion:
          1.  Name of Subroutine
          2.  Function it performs
          3.  What its inputs are
          4.  What its outputs are
          5.  What registers are affected by it
          6.  What other library routines it calls upon
          7.  What errors can occur and how it handles them

     Th� routine� withi� SYSLI� ar� designe� t� wor� togethe� an� �
complemen�� eac� other��  Paramete� passin� i� consisten� betwee� �
th� variou� subroutines� fo� instance� al� routine� whic� nee� t� �
b� passe� � pointe� t� � Fil� Contro� Bloc� ar� passe� tha� �
pointe� i� th� D� registe� pair��  Also�� a� � genera� rule� i� � �
registe� i� no� returne� a� a� outpu� fro� th� SYSLI� subroutine� �
the� it� valu� i� no� affecte� (i� ha� th� sam� valu� whe� th� �
routin� i� exite� a� i� ha� whe� th� routin� wa� called).

     SYSLI  itsel� i� � librar� o� relocatabl� objec�� module� �
create� i� th� Microsof� M8� relocatabl� objec�� format��  Al� �
subroutine� withi� SYSLI� ar� groupe� withi� functionally-relate� �
modules��  Onc� � routin� i� reference� (b� th� EX� statemen� i� �
th� M8� assembl� languag� program)�� it� modul� i� loade� an� i� �
i� availabl� t� th� programme� b� mean� o� � simpl� subroutin� �
call��  Al� othe� subroutine� withi� tha� particula� modul� ar� �
als� loaded�� bu� the� ar� no� availabl� t� th� programme� unles� �
h� ha� als� reference� the� b� EX� statements��  Th� modul� i� �
loade� onl�� once�� regardles� o� ho� man� routine� withi� th� �
modul� ar� referenced��  Fo� thi� reason�� � hav� designe� eac� �
modul� t� contai� routine� whic� ar� frequentl� use� togethe� o� �
ar� calle� b� eac� othe� (on� routin� withi� th� modul� call� �
another routine within the module).


                  What is Needed to Use SYSLIB?

     Yo�� nee� a� 8080- o� Z80-base� microcompute� wit� a�� leas� �
48ˠ byte� o� contiguou� memor� runnin� CP/� 2.2�� th� Microsof� �
M8�� assemble� too� se� (specifically�� th� M8� assemble� an� th� �
L8� linker)�� an� th� usua� se� o� softwar� developmen� tool� (a� �
edito� and� preferably� � debugger� t� us� SYSLIB.�
                    What Does SYSLIB Buy Me?

     Th� botto� lin� i� that�� t� th� experience� SYSLI� program�
mer�� SYSLI� ha� th� potentia� o� bein� � significan� too� whic� �
enable� hi� to:

          1.  Solve his programming task quickly
               -- becaus� h� spend� les� tim� writin� com�
����monly-use� subroutine� an� worryin� abou� ho� hi� regis�
����ter� ar� affecte� b� thes� subroutine� an� mor� tim� �
����concentratin� o� th� proble� a� hand

����      2.  Write space- and speed-efficient code
����           -- becaus� al� o� th� SYSLI  routine� hav� �
����bee� gon� ove� tim� agai� t� reduc� thei� siz� an� mak� �
����the� mor� efficien� i� term� o� speed�� fo� example� th� �
����SORԠ routin� i� � Shel� Sor� tha� ca� b� calle� t� �
����perfor�� th� sor� usin� pointer� (i� whic� cas� i�� ex�
����change� pointer� rathe� tha� record� whe� i� need� t� d� �
����� swap� o� perfor� th� sor� withou� usin� pointer� (whe� �
����spac� i� � facto� an� ther� ma� no� b� enoug� roo� fo� � �
����pointe� table)

����      3�  Writ� mor� maintainabl� code
����           -- becaus� SYSLI� i� designe� wit� structure� �
����programmin� philosoph� i� mind� eac� subroutin� i� equi�
����valen�� t� � proces� box�� havin� (1� onl� on� entranc� �
����an� on� exit�� (2� � precisely-define� function� an� (3� �
����� precisely-define� se� o� inpu� an� outpu�� parameters� �
����havin� use� SYSLI� fo� som� tim� now�� th� autho� ha� �
����note� tha� hi� programmin� though� processe� an� progra� �
����design� hav� tende� mor� an� mor� towar� end-in�� (top-�
����dow� fro� th� objectiv� poin� o� vie� an� bottom-u� fro� �
����th� SYSLI� subroutin� poin� o� view)� structure� design� �
����tha�� h� ca� g� bac� t� a� � late� dat� an� readil� �
����deciphe� an� modify

����      4.  Reduce the programming effort
����           -- becaus� SYSLI� provide� � numbe� o� ver� �
����involve� routine� whic� would� i� themselves� tak� quit� �
����som� tim� t� code�� fo� example�� th� DIR� routin� wil� �
����loa� th� director� o� � dis� int� memory�� selec� � se� �
����o� file� fro� tha� loade� director� a� specifie� b�� � �
����Fil� Contro� Bloc� an� � fla� whic� indicate� whethe� t� �
����includ� Syste� o� Non-Syste� file� an� wha� use� are� i� �
����t� b� examined�� pack� th� loade� director�� (removin� �
����entrie� no� selecte� fro� th� memor� buffer)�� alphabet�
����ize� th� director� entrie� b� fil� nam� an� typ� o� b� �
����fil� typ� an� name�� an� return� � pointe� t� th� firs� �
����entr� an� � coun� o� th� numbe� o� entrie� selected


     I� man� ways�� SYSLI� bring� som� o� th� advantage� o� pro�
grammin� i� � High-Orde� Language�� lik� � o� Pascal�� t� th� �
assembl� languag� programmer�� whil� allowin� hi� t� maintai� th� �
smalle� cod� siz� an� greate� efficienc� whic� ca� b� realize� i� �
assembl�� languag� programmin� an� simultaneousl� realiz� � re�
duce� life-cycl� cos� (fro� developmen� t� fieldin� t� post-�
fieldin� maintenanc� an� modification� ove� assembl�� languag� �
programmin� withou� � SYSLIB-lik� too� set.



                 How Do I Assemble with SYSLIB?

     Eac� exampl� i� Sectio� 2� o� thi� manua� show� a� assembl� �
o� th� sampl� program��  � frequentl� us� � comman� file� whic� � �
cal� M80.SUB�� t� assembl� m� programs��  Thi� comman� fil� take� �
onl� on� parameter�� th� nam� o� th� fil� t� b� assemble� WITHOU� �
its type (MAC is assumed).  Warning:  The command MUST be:

                        SUB M80 filename

and it MUST NOT be:

                      SUB M80 filename.typ

I� i�� i� o� th� latte� form�� th� sourc� cod� wil� b� delete� �
durin� th� assembl� process�  Yo� ma� wis� t� remov� the

                           ER� $1.BAK 

comman� i� th� M80.SU� fil� t� eliminat� thi� problem�  � onl� d� �
this for a space savings.

     My M80.SUB command file is:

;  M80.SUB -- MACRO-80 Assembler and Linker
M80 =$1
SUB /A  PLEASE ABORT IF ERROR(S) EXIST
ERA $1.BAK
ERA $1.COM
L80 /P:100,$1,A:SYSLIB/S,$1/N,/U,/E
ERA $1.REL
;  ASSEMBLY COMPLETE

     � ru� ZCPR� instea� o� th� CP/� 2.� CCP�� an� � a� alway� o� �
Driv� B�� doin� m�� developmen�� work�� whil� m�� editor� an� �
assembler� (an� SYSLIB.REL� ar� o� Driv� A:��  Not� tha� thi� i� �
reflected in M80.SUB, where L80 looks for A:SYSLIB for the scan.



            How Do I Learn to Use SYSLIB Effectively?

     Thi� is� o� course� opinion� bu� � fee� tha� th� bes� wa� t� �
learn how to use SYSLIB would involve the following steps:

          1��  Stud�� th� SYSLI� manua� i� a� overvie�� fashion� �
familiarizin� yoursel� wit� th� function� o� th� subroutine� �
available

          2��  Stud� i� som� detai� th� sampl� sourc� program� i� �
Sectio� 21� jumpin� bac� t� th� mai� bod� o� th� manua� fro� tim� �
t� tim� t� se� wh� th� routine� � selecte� i� th� program� wer� �
used in the way I used them

          3�  Tr� codin� � coupl� o� th� routine� i� thi� manual� �
copying them verbatim and assembling them

          4�  Tr� makin� u� � fe� simpl� problem� o� you� ow� an� �
use SYSLIB to code them

          5��  Appl�� SYSLI� t� � significan� progra� yo� wan� t� �
write

     � a� � stron� advocat� o� writin� program� i� orde� t� lear� �
ho� t� program�� an� � fee� tha� i� i� mos� importan� t� (1� gai� �
a� muc� familiarit� wit� th� SYSLI� routine� a� yo� ca� an� (2� �
t� writ� program� usin� thes� routines.



                       Who May Use SYSLIB?

     SYSLI� i� hereb� release� t� th� publi� domain��  Anyon� wh� �
wishe� t� US� i� ma� d� s� wit� n� string� attached��  Th� autho� �
assume� n� responsibilit� o� liabilit� fo� th� us� o� SYSLIB�  I� �
i� copyrighte� b� th� author�� Richar� Conn�� wh� ha� sol� right� �
t� it��  SYSLI� an� it� associate� documentatio� ma� b� sol� b� �
itsel� o� a� a� independen� par� o� � packag� o� program� onl� �
wit� th� express�� writte� consen� o� th� author��  Th� author� �
however� support� th� us� o� SYSLI� b� commercia� softwar� devel�
opers�� an� place� n� restrictio� o� th� sal� o� program� whic� �
ar� BASE� o� SYSLI� an� us� routine� containe� withi� SYSLI  t� �
perfor� thei� majo� functions.



     ɠ hop� yo� enjo� usin� SYSLI� an� fin� i� t� b� a� usefu� � �
tool as I do.

                                        Richard Conn

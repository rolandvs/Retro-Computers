 1 PRINT:CLG:PAGE
 2 POKE 530,1
 3 P1=INT(RND(8)*195+28):P2=INT(RND(8)*140+30):GDISP1-6,P2,1
 4 GDISP1+6,P2,2:GDISP1,P2+6,1:GDISP1,P2-6,2
 5 E=230:M=42:F=25:PI=6.28319:H=255
 6 L=0:S=0:V=0:K=13*4096+15*256
 7 POKE K,0:X=128:Y=128:G=.05:D=G:TE=1.3
 8 DEF FN J1(S)=SIN (S)*F
 9 DEF FN J2(S)=COS (S)*F
 10 FOR R=.1 TO 6.4 STEP 1/F:GDIS FN J2(R)+E,FN J1(R)+E,1:NEXT 
 20 GDIS4,255,1:GDIS4,204,2:GDIS80,255,2:GDIS80,204,1
 30 GDIS4,204,2:GDIS80,255,2
 35 SCR0,24: PRINT ":DIRECTION:      :ZENTRUM VIEV:";
 36 GDIS0,189,1:GDIS255,189,2
 40 GDISZW,ZX,0:GDISE,E,1:IF ABS(P1-Z)<15 AND ABS(P2-Z2)<15 THEN 50
 45 GOTO 80
 50 ZW=Z-P1+E:ZX=Z2-P2+E:GDISZW,ZX,1
 80 T=PEEK (K):PRINT T
 85 V=ABS(V-G/10):IF T=250 THEN L=L+D:S=S-D:GOTO 140
 100 IF T=252 THEN S=S+D:L=L-D:GOTO 140
 110 IF T=248 THEN V=V+G:GOTO 130
 120 IF T=190 THEN V=V/TE:GOTO 130
 130 D=D/TE:IF T=126 THEN V=V-G
 140 D=D+G/3:GDISM,E,1:GDISM+ FN J2(N),E+FN J1(B),3:X=ABS(X+ COS (L)*V)
 190 Y=ABS(Y+ SIN (L)*V):GDISM,E,1:GDISM+FN J2(S),E+FN J1(L),2
 194 B=L:N=S:Z=H AND X:Z2=H AND Y:GDISZ,Z2,1:IF Z<>P1 OR Z2<>P2 THEN 40
 195 SCR10,10
 197 IF V>.15 THEN PRINT "BRUCH-";
 200 PRINT "LANDUNG !!!"
 210 PRINT:PRINT "V=";V
 220 DEY(100):RUN 

*----------------------------------------*
*           Sistema GN1000               *
* Programa : GN1GER.PRG                  *
* Funcao   : ARQUIVO DE PROCEDURES       *
* Versao   : 1.0      Data : 07/10/91    *
*----------------------------------------*


*--------------------------------------------------------------------
Procedure G4  && Mostra os Valores das variaveis
*--------------------------------------------------------------------
@ 9,31 Say Mcod
@ 11,34 Say Mdes
@ 13,33 Say Mpre Pict '@E 999,999.99'
@ 13,60 Say Mpco Pict '@E 999,999.99'
@ 15,33 Say Mqta Pict '999'
@ 15,61 Say Mqte Pict '999'
@ 17,35 Say Mfor Pict 'XXX'
@ 17,53 Say Mst1 Pict 'X'
@ 17,67 Say Mst2 Pict 'X'
Return

*--------------------------------------------------------------------
Procedure G5  && Espera <ENTER>
*--------------------------------------------------------------------
Set Cursor Off
Set Console Off
Wait
Set Console On
Set Cursor On
@ 23,05 Say Space(60)
Return

*------------------------------------------------------*
*  subprograma:Lock_Ap function                        *
*  funcao:lock registro instrucao append               *
*  parametro:Numerico mwait (0 = mwait forever)        *
*------------------------------------------------------*

FUNCTION lock_ap
PARAMETERS mwait
PRIVATE forever

APPEND BLANK
IF .NOT. NETERR()
   RETURN (.T.)
ENDIF

forever = (mwait = 0)
DO WHILE (forever .OR. mwait > 0)
   APPEND BLANK
   IF .NOT. NETERR()
      RETURN .T.
   ENDIF
      
   INKEY(.1)			&& mwait 1/2 second
   mwait = mwait - .1
ENDDO
RETURN (.F.)			&& not locked



*---------------------------------------------------*
*  subprograma:LOCK_R function                      *
*  FUNCAO:LOCK registro                             *
*  parametro: Numerico mwait (0 = mwait forever)    *
*---------------------------------------------------*

FUNCTION     LOCK_R
PARAMETERS mwait
PRIVATE forever
mwait=0.00
IF RLOCK()
   RETURN (.T.)		&& locked
ENDIF
forever=(mwait=0)
DO WHILE (forever.OR.mwait>0)
   IF RLOCK()
      RETURN (.T.)
   ENDIF
   INKEY(mwait)
   mwait = mwait + .05
enddo
RETURN (.F.)

*----------------------------------*
* f_zoom                           *
* input:mh,mv,m3,m4 coordenadas    *
* output:window video              *
* ver 1.01                         *
*----------------------------------*
procedure f_zoom
m1=m3-1
m2=m4-1
if m3-mh>0.001
 msp=(m4-mv)/(m3-mh)
 msp=round(msp,0)
 xc=0
 do while m1>mh.and.m2>mv
  m1=iif(m1>mh,m1-1,m1)
  if m2>0
   m2=m2-msp
   m2=iif(m2<mv,mv,m2)
  endif
  @ m1,m2,m3,m4 box frame_d
  @ m1,m2   clear to m3,m4
 enddo 
endif
return



*
* SUB004S
*   FUNCAO: 'comando'
*       INPUT: console
*       OUTPUT:choice

procedure SUB004S
set confirm on
@ 10,30 clear to 12,43+len(subt2)
@ 10,30       to 12,43+len(subt2)
choice="N"
tone(440,1)
@ 11,31 say subt2 get choice picture 'X'
set color to i
set cursor on
read
set cursor off
set color to w
choice=upper(choice)
set confirm off
return


*
* SUB005
*   FUNCAO:MENSAGEM ERRO
*   INPUT:VAUX
*   OUTPUT:SCREEN

procedure sub005
tone(440,1)
return


*
* SUB007
*   FUNCAO:CALCULO DIG.CONTROLE
*   INPUT:AC
*   OUTPUT:DC

procedure sub007
 c1=val(substr(ac,1,1))
 c2=val(substr(ac,2,1))
 c3=val(substr(ac,3,1))
 c4=val(substr(ac,4,1))
 c5=val(substr(ac,5,1))
 c6=val(substr(ac,6,1))
 c7=val(substr(ac,7,1))
 SOMA=10*c1+9*c2+8*c3+7*c4+6*c5+5*c6+4*c7
 prim=11-(SOMA-(int(soma/11))*11)
 SOMA=11*C1+10*C2+9*C3+8*C4+7*C5+6*C6+05*c7
 segu=11-(SOMA-(int(soma/11))*11)
 dc=SUBSTR(str(prim),10,1)+substr(str(segu),10,1)
return

*
* SUB0079
*   FUNCAO:CALCULO DIG.CONTROLE
*   INPUT:AC
*   OUTPUT:DC

procedure SUB0079
 c1=val(substr(ac,1,1))
 c2=val(substr(ac,2,1))
 c3=val(substr(ac,3,1))
 c4=val(substr(ac,4,1))
 c5=val(substr(ac,5,1))
 c6=val(substr(ac,6,1))
 c7=val(substr(ac,7,1))
 c8=val(substr(ac,8,1))
 SOMA=10*c1+9*c2+8*c3+7*c4+6*c5+5*c6+4*c7+3*c8
 prim=11-(SOMA-(int(soma/11))*11)
 SOMA=11*C1+10*C2+9*C3+8*C4+7*C5+6*C6+5*c7+4*c8
 segu=11-(SOMA-(int(soma/11))*11)
 dc=SUBSTR(str(prim),10,1)+substr(str(segu),10,1)
return


*-------------------------------------*
* SUBCGC - FUNCAO:CALCULO DIG.CONTROLE*
*   INPUT:AC                          *
*   OUTPUT:DC                         *
*-------------------------------------*
procedure subcgc
 c1=val(substr(ac,1,1))
 c2=val(substr(ac,2,1))
 c3=val(substr(ac,3,1))
 c4=val(substr(ac,4,1))
 c5=val(substr(ac,5,1))
 c6=val(substr(ac,6,1))
 c7=val(substr(ac,7,1))
 c8=val(substr(ac,8,1))
 ca=val(substr(ac,9,1))
 cb=val(substr(ac,10,1))
 cc=val(substr(ac,11,1))
 cd=val(substr(ac,12,1))
 SOMA=5*c1+4*c2+3*c3+2*c4+9*c5+8*c6+7*c7+6*c8+5*ca+4*cb+3*cc+2*cd
* prim=mod(soma,11)
  m3=soma/11
  w1=str(m3,10,4)
  mr2=at('.',w1)
  mr2=val(trim(substr(w1,1,mr2)))
  mr2=mr2*11
  prim=soma-mr2

*
 prim=iif(prim=1,0,prim)
 prim=iif(prim<>0,11-prim,prim)
 SOMA=6*c1+5*c2+4*c3+3*c4+2*c5+9*c6+8*c7+7*c8+6*ca+5*cb+4*cc+3*cd+2*prim
* segu=mod(soma,11)
  m3=soma/11
  w1=str(m3,10,4)
  mr2=at('.',w1)
  mr2=val(trim(substr(w1,1,mr2)))
  mr2=mr2*11
  segu=soma-mr2
*
 segu=iif(segu=1,0,segu)
 segu=iif(segu<>0,11-segu,segu)
 dc=SUBSTR(str(prim),10,1)+substr(str(segu),10,1)
return


* espera qualquer tecla
*

procedure lcwait
 clear gets
 set cursor off
 mkey=0
 mvxk=time()
 @ 24,60 say date()
 do while mkey=0
  mkey=inkey()
  if time()<>mvxk
   @ 24,70 say time()
   mvxk=time()
  endif
 enddo
 set cursor on
return

procedure sk_f3
set console off
set print on
? chr(12)
set print off
set console on
return


*--------------------------------------*
* funcao:lock arquivo                  *
* parametro mwait                      *
*--------------------------------------*
FUNCTION lock_f
PARAMETERS mwait
PRIVATE forever

if flock()
   return (.T.)		&& locked
endif
forever = (mwait = 0)
do while (forever .or. mwait > 0)
   inkey(.5)			&& wait 1/2 second
   if flock()
      return (.T.)		&& locked
   endif
enddo
return (.F.)			&& not locked




* lc23000
procedure pn_f2
save screen to mscr_1  
@ 10,40 clear to 14,61
@ 10,40       to 14,61
@ 10,43 say 'Total Faturado'
@ 11,44 say ac1 picture '99 999 999.99'
@ 24,61     say date()
@ 24,70     say time()
do lcwait
restore screen from mscr_1
return

* lc23000
procedure pn_fa
 save screen to mscr_1 
 @ 10,20 clear to 16,41 
 @ 10,20       to 16,41
 @ 10,28 say 'Teclado'
 @ 11,21 say 'F2  - Total Acumulado '
 do lcwait
 restore screen from mscr_1
return

*---------------------------------*
* sbccls                          *
*---------------------------------*
procedure sbccls

public mi
i=80
MI=''
do while i>0
 mi=mi+chr(177)
 i=i-1
enddo
return

*---------------------------------*
* sbcls	                          *
*---------------------------------*
 
procedure sbcls

for i2=1 to 23
 @ i2,0 say mi
next
return

*----------------------------------*
* procedure sbzoom                 *
* mh,mv m3,m4                      *
*----------------------------------*
*do f_zoom 
procedure sbzoom
m1=m3-1
m2=m4-1
msp=(m4-mv)/(m3-mh)
msp=round(msp,0)
xc=0
do while m2>mv
 xc=xc+1
 m1=iif(m1>mh,m1-1,m1)
 if m2>0
  m2=m2-msp
  m2=iif(m2<0,0,m2)
 endif
 @ m1,m2   to   m3,m4
 @ m1,m2   clear to m3,m4
enddo
return


*----------------------------------*
* procedure sbzooff                *
* mh,mv m3,m4                      *
*----------------------------------*
* mh,mv to m3,m4

procedure sbzooff
m1=mh
m2=mv
msp=(m4-mv)/(m3-mh)
msp=round(msp,0)
xc=0
@ m1,m2   clear to m3,m4
do while m2+1<m4
 m1=iif(m1<m3,m1+1,m1)
 if m2<m4
  m2=m2+msp
  m2=iif(m2+1>m4,m4-1,m2)
 endif
 @ m1,m2   to   m3,m4
 @ m1,m2   clear to m3,m4
enddo
return


*-------------------------------------*
* function:read_k                     *
* executar:leitura teclado            *
*  v1.0/88 14/12/88                   *
*-------------------------------------*

function read_k
parameters mh,mv,ml
private m_s

ac=''
m_s=1
a=0
@ mh,mv say mgr
do while a<>13.and.len(ac)<ml
 a=0
 do while a=0
  a=inkey()
  @ 24,70 say time()
 enddo
 if a>32.and.a<128
  if a<>127 
   ac=ac+chr(a)
   ac=iif(len(ac)=2.or.len(ac)=6,ac+'.',ac)
   ac=iif(len(ac)=10,ac+'-',ac)
   @ mh,mv say ac+'_'   
  else
   if len(ac)>0
    ac=substr(ac,1,len(ac)-1)
    @ mh,mv say ac+'_ '
   else
    ac=''
   endif
  endif
 endif
enddo
return .t.   



*-------------------------------------*
* proc:FLBL                           *
*-------------------------------------*

procedure flbl
subt2='Imprimir Etiquetas (S/N)?'
do sub004s
if choice='S'
 subt2='Etiquetas preparadas (S/N)?'
 do sub004s
 if choice='S'
  set console off
  label form lc27020 to print
  set console on
  set printer to
 endif
endif
return


*----------------------------------*
* f_zooff                          *
*----------------------------------*
* mh,mv to m3,m4

procedure f_zooff
m1=mh
m2=mv
msp=(m4-mv)/(m3-mh)
msp=round(msp,0)
xc=0
@ m1,m2   clear to m3,m4
do while m2+1<m4
 m1=iif(m1<m3,m1+1,m1)
 if m2<m4
  m2=m2+msp
  m2=iif(m2+1>m4,m4-1,m2)
 endif
 @ m1,m2,m3,m4 box frame_d
 @ m1,m2   clear to m3,m4
enddo
return


*--------------------------------------*
* procedure f_cale                     *
* input: mlin,mcol                     *
* mlin<8, e mcol<46                    *
*--------------------------------------*

procedure f_cale
private mmon
declare mmon[12]
mmon[01]='JAN'
mmon[02]='FEV'
mmon[03]='MAR'
mmon[04]='ABR'
mmon[05]='MAI'
mmon[06]='JUN'
mmon[07]='JUL'
mmon[08]='AGO'
mmon[09]='SET'
mmon[10]='OUT'
mmon[11]='NOV'
mmon[12]='DEZ'
save screen to mscr_ca
bb=date()
*mlin=0
*mcol=0
mh=mlin
mv=mcol
m3=mlin+17
m4=mcol+34
do f_zoom 
set color to w 
do while lastkey()<>27
 a=bb
 a=a+(1-day(a))
 x=mlin+5
 y=mcol+2
 y=y+(dow(a)-1)*4
 @ mlin,mcol clear to mlin+16,mcol+33
 @ mlin,mcol       to mlin+16,mcol+33 double
 @ mlin+2,mcol+1   to mlin+2,mcol+32
 @ mlin+1,mcol+1  say mmon[month(a)] picture 'XXX'
 @ mlin+1,col()+1 say year(a) picture '9999'
 @ mlin+3, mcol+3 say 'D'
 @ mlin+3,col()+3 say 'S'
 @ mlin+3,col()+3 say 'T'
 @ mlin+3,col()+3 say 'Q'
 @ mlin+3,col()+3 say 'Q'
 @ mlin+3,col()+3 say 'S'
 @ mlin+3,col()+3 say 'S'
 do while month(a)=month(bb)
  if a=date()
   set color to w*
  endif
  if dow(a)=1
   set color to w+
  endif  
  @ x,y say day(A) picture '99'
  set color to w
  if dow(a)=7
   x=x+2
   y=mcol+2
  else 
   y=y+4
  endif
  a=a+1
 enddo
 do lcwait
 bb=iif(lastkey()=43,bb+30,bb)
 bb=iif(lastkey()=45,bb-30,bb)
enddo
restore screen from mscr_ca
return

*-------------------------------------*
* funcao  teste cgc                   *
* entrada:vaux                        *
* saida:mensagem video                *
*-------------------------------------*

function f_dcc
merr=' '
ac=''
ac=substr(vaux,1,2)
ac=ac+substr(vaux,4,3)
ac=ac+substr(vaux,8,3)
ac=ac+substr(vaux,12,4)
mcg3=substr(vaux,17,2)
if asc(ac)<>32
 do subcgc
 if dc<>mcg3
  set color to w*
  @ 24,0 say '* Erro CGC *'
  merr='1'
  set color to w
  tone(400,2)
*  do lcwait
 else
  @ 24,0 say '            '
  merr='*' 
 endif
endif
return(.t.)

function z_of
  for z_1=3 to 78 step 2 
   @ 2,z_1 to 22,z_1
   @ 2,z_1-2 clear to 22,z_1
  next
return.t.

function f_pic
private xd
parameters xd
maz=transform(xd,"@E 999,999.99")
return (maz)

 
function f_sbx
parameters x1,y1,x2,y2,mclr
private v,h,j
if y2+2<79
 v=savescreen(x1+1,y2+1,x2+1,y2+2)
 h=savescreen(x2+1,y1+2,x2+1,y2+2)
else
 v=savescreen(x1-1,y2-1,x2-1,y2-2)
 h=savescreen(x2-1,y1-2,x2-1,y2-2)
endif
for j=2 to len(h) step 2
 h=stuff(h,j,1,chr(7))
next
for j=2 to len(v) step 2
 v=stuff(v,j,1,chr(7))
next
set color to &mclr
@ x1,y1 clear to x2,y2
@ x1,y1       to x2,y2
if y2+2<79
 restscreen(x1+1,y2+1,x2+1,y2+2,v)
 restscreen(x2+1,y1+2,x2+1,y2+2,h)
else
 restscreen(x1-1,y2-1,x2-1,y2-2,v)
 restscreen(x2-1,y1-2,x2-1,y2-2,h)
endif
return.t.

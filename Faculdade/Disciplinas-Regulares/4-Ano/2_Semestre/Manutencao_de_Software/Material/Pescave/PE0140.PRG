*-------------------------------------*
* Programa : Pe0140                   *
* Funcao   : Consulta Nome Cliente    *
* Versao   : 1.0    Data : 28/08/93   *
* Autora   : Debora P. Diniz Tavares  *
*-------------------------------------*
Save Screen To Tela
Declare mat1[1],mat2[2],mat3[3]

Select 1    && Arquivo de Clientes
Use &mca\Pe0100 Index &mca\Pe01alf

Mat1[1] = 'Fnoc'
Mat2[1] = Replicate('X',40)
Mat3[1] = 'Nome'+Space(28)

@ 05,20 Clear To 21,79
@ 05,20 to 21,79
@ 05,22 say 'Nome :'
@ 08,20 to 21,79

Do While .T.
   Mnoc = Space(40)
   @ 06,22 Get Mnoc
*   Set Color To W+
   Read
*   Set Color To W
   If LastKey() = 27
      Exit
   EndIf
   Mnoc = Upper(Trim(Mnoc))
   If Asc(Mnoc) > 32
      Seek Mnoc
   EndIf
   Choice = 'N'
   If Choice='N'
      Dbedit(09,21,20,78,mat1,'f30',mat2,mat3)
      Skip 0
   EndIf
EndDo
Close Databases
Restore Screen From Tela
Return

*-------------------------------------*
* fuction f30                         *
* funcao : Edicao de Dados-DBEDIT()   *
*-------------------------------------*
Function f30
Parameters Mode, Counter

Do Case
Case Mode=0.or.Mode=1.or.Mode=2.or.LastKey()=24.or.LastKey()=5
     @ 06,22 Say Fnoc
     Return (1)

Case Mode=3.or.LastKey()=27
      Return (0)

Case LastKey()=13
     Save Screen To mscr_3
     @ 06,22 Say Fnoc
*     Set Color To W
     Al43()
     Choice='N'
     Keyboard=255
     Restore Screen from mscr_3
     Return (1)
OtherWise
      Return (1)
EndCase


*-------------------------------------*
* FUNCTION Al43                       *
* funcao : Consulta Cadastro/Cliente  *
*-------------------------------------*
function Al43

choice=''
do while choice<>'XX'
   Save Screen To Pe0140
   pe14 = SetColor()
   set color to W+/B+
* Codigo Cliente
   @ 08,24 Clear To 10,37
   @ 08,24 To 10,37
   @ 08,25 Say 'Cod_Cliente'

* Dados Cliente
   @ 12,01 Clear To 18,79
   @ 12,01 To 18,79
   @ 12,29 Say 'Dados do Cliente'
   @ 13,02 Say 'Cliente:'
   @ 14,02 Say 'Endereco:'
   @ 14,55 Say 'Fone:'
   @ 15,02 Say 'CEP:'
   @ 15,20 Say 'Munic:'
   @ 15,60 Say 'Est.:'
   @ 16,02 Say 'CGC/CPF:'
   @ 16,32 Say 'Inscr/Rg:'
   @ 17,55 Say 'Data Cad:'
*   Set Color To W+
   @ 09,27 Say Fccl
   Mcgc = Fcgc+'/'+Fcg2+'-'+Fcg3
   @ 13,11 Say Fnoc
   @ 14,11 Say Fend
   @ 14,60 Say Ftel
   @ 15,07 Say Fcep Picture 'XXXXX-XXX'
   @ 15,27 Say Fmun
   @ 15,66 Say Fest
   @ 16,11 Say Mcgc Picture 'XX.XXX.XXX/XXXX-XX'
   @ 16,42 Say Fins
   @ 17,64 Say Femi
*   Set Color To W
   Do G5
   choice=iif(lastkey()=27,'XX',choice)
   Restore Screen From Pe0140
   Set Color TO &Pe14
enddo
return .t.

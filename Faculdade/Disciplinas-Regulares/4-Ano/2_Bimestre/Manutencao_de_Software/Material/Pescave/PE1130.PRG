*-------------------------------------*
* Programa : Pe1130                   *
* Funcao   : Consulta Nome Produto    *
* Versao   : 1.0    Data : 28/08/93   *
* Autora   : Debora P. Diniz Tavares  *
*-------------------------------------*
Public Choice
Save Screen To Tela
Declare mat1[1],mat2[2],mat3[3]

Use &Mest\Pe1000 Index &Mest\Pe1alf

Mat1[1] = 'Fdes'
Mat2[1] = Replicate('X',40)
Mat3[1] = 'Nome'+Space(28)
@ 05,20 Clear To 21,79
@ 05,20 to 07,79
@ 05,22 say 'Nome :'
@ 08,20 to 21,79

Do While .T.
   Mnoc= Space(40)
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
      Dbedit(09,21,20,78,mat1,'f31',mat2,mat3)
      Skip 0
   EndIf
EndDo
Restore Screen From Tela
Close Databases
Return

*-------------------------------------*
* fuction f31                         *
* funcao : Edicao de Dados-DBEDIT()   *
*-------------------------------------*
Function f31
Parameters Mode, Counter

Do Case
Case Mode=0.or.Mode=1.or.Mode=2.or.LastKey()=24.or.LastKey()=5
     @ 06,22 Say Fdes
     Return (1)

Case Mode=3.or.LastKey()=27
      Return (0)

Case LastKey()=13
     Save Screen To mscr_3
     @ 06,22 Say Fdes
*     Set Color To W
     Al44()
     Choice='N'
     Keyboard=255
     Restore Screen From mscr_3
     Return (1)
 OtherWise
      Return (1)
 EndCase

*-------------------------------------*
* FUNCTION Al44                       *
* funcao : Consulta Cadastro/Cliente  *
*-------------------------------------*
Function Al44

Choice=''
Do While choice<>'XX'
   Save Screen To Pe1130
   Pe13 = SetColor()
   Set Color To W+/B+
   @ 08,20 Clear To 16,79
   @ 08,20 To 16,79

   @ 09,22 Say 'Codigo:'
   @ 11,22 Say 'Descricao:'
   @ 13,22 Say 'P.Compra:'
   @ 13,50 Say 'P.Venda:'
   @ 15,22 Say 'Quantidade:'
*   Set Color To W+
   @ 09,30 Say Fcod
   @ 11,33 Say Fdes
   @ 13,32 Say Fpco Pict '999,999.99'
   @ 13,59 Say Fpre Pict '999,999.99'
   @ 15,34 Say Fqte Pict '99999.99'
*   set color to w
   Do g5
   choice=iif(lastkey()=27,'XX',choice)
   Restore Screen From Pe1130
   Set Color To &Pe13
enddo
return .t.


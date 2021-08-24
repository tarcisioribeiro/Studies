*-----------------------------------------*
*         Sistema Pe1000                  *
* Programa : Pe0210.PRG                   *
* Funcao   : Inclusao/Alteracao Vendedores*
* Versao   : 1.0        Data : 28/08/93   *
* Autora   : Debora P. Diniz Tavares      *
*-----------------------------------------*
Save Screen To Tela
*Set Delimiter To '[]'
*Set Delimiter On
*Set Intensity Off
Set Cursor On

Use &Mca\Pe0200 Index &Mca\Pe0200

Do While .T.
   @ 23,01 Clear To 23,79
*   Set Color To W
   @ 08,20 Clear To 10,47
   @ 08,20 To 10,47
   @ 08,21 Say 'Cod.'
   @ 08,40 Say 'Nome'
   Mcod = '  '
   Mnom = Space(15)
   @ 09,23 Get Mcod  Pict 'XX'
*   Set Color To W+
   Read
*   Set color To W
   If LastKey() <> 27
      If Mcod <> '  '
         Seek Mcod
         If Found()
            Aux = 'A'
            Mnom = Fnom
         Else
            Aux = 'I'
         EndIf
         @ 09,30 Get Mnom
*         Set Color To W+
         Read
*         Set Color To W
         If Mnom <> Space(10)
            If Aux = 'I'
               If Lock_Ap(0)
               EndIf
            Else
               If Lock_R(0)
               EndIf
            EndIf
            Replace Fcod With Mcod,Fnom With Upper(Mnom)
         EndIf
      EndIf
   Else
      Exit
   EndIf
EndDo
*Set Color To W
*Set Intensity On
Set Cursor Off
*Set Delimiter Off
Close Data
Restore Screen From Tela
Return

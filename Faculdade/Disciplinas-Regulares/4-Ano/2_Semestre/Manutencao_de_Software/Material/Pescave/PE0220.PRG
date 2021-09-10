*-------------------------------------*
*      Sistema Pe1000                 *
* Programa : Pe0220.PRG               *
* Funcao   : Exclusao de Vendedores   *
* Versao   : 1.0   Data : 28/08/93    *
* Autora   : Debora P. Diniz Tavares  *
*-------------------------------------*
Save Screen To Tela
*Set Delimiter To '[]'
*Set Delimiter On
Set Cursor On
@ 23,01 Clear To 23,79
*Set Intensity Off

Use &Mca\Pe0200 Index &Mca\Pe0200

Do While .T.
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
            Mnom = Fnom
*            Set Color To W+
            @ 09,30 Say Mnom
            Con = 'N'
            @ 23,05 Say 'Exclui este Vendedor ? (S/N) ' Get Con Valid Con $ 'SsNn'
            Read
            @ 23,05 Say Space(60)
            If Upper(Con) = 'S'
               If Lock_R(0)
               EndIf
               Delete
            EndIf
         Else
            Tone(500,5)
            @ 23,05 Say 'Vendedor nao Encontrado.'
            DO G5
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
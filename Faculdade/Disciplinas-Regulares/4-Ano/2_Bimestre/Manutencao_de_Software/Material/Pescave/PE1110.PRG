*-------------------------------------*
*      Sistema Pe1000                 *
* Programa : Pe1110.PRG               *
* Funcao   : Exclusao de Produtos     *
* Versao   : 1.0   Data : 28/08/93    *
* Autora   : Debora P. Diniz Tavares  *
*-------------------------------------*
Save Screen To Tela
*Set Delimiter To '[]'
*Set Delimiter On
Set Cursor On
@ 23,05 Say Space (60)
*Set Intensity Off

Use &Mest\Pe1000 Index &Mest\Pe1000,&Mest\Pe1alf

Do While .T.
*   Set Color To W
   @ 08,20 Clear To 16,79
   @ 08,20 To 16,79

   @ 09,22 Say 'Codigo:'
   @ 11,22 Say 'Descricao:'
   @ 13,22 Say 'P.Compra:'
   @ 13,50 Say 'P.Venda:'
   @ 15,22 Say 'Quantidade:'
*   Set Color To W+

   Mcod = Space(10)
   @ 9,30 Get Mcod  Pict 'XXXXXXXXXX'
   Read
   If LastKey() = 27
      Exit
   EndIf
   Seek Mcod
   If Found()
      @ 11,33 Say Fdes
      @ 13,32 Say Fpco Pict '999,999.99'
      @ 13,59 Say Fpre Pict '999,999.99'
      @ 15,34 Say Fqte Pict '99999.99'
      Con = 'N'
      @ 23,05 Say 'Exclui este Produto ? (S/N) ' Get Con Valid Con $ 'SsNn'
      Read
      @ 23,05 Say Space(60)
      If Upper(Con) = 'S'
         If Lock_R(0)
         EndIf
         Delete
      EndIf
   Else
      Tone(500,5)
      @ 23,05 Say 'Produto nao Encontrado.'
      DO G5
   EndIf
EndDo
*Set Color To W
*Set Intensity On
Set Cursor Off
UnLock All
*Set Delimiter Off
Restore Screen From Tela
Close Data
Return

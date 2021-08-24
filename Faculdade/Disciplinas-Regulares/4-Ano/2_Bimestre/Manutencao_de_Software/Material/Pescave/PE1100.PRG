*-----------------------------------------*
*         Sistema Pe1000                  *
* Programa : Pe1100.PRG                   *
* Funcao   : Inclusao/Alteracao Produtos  *
* Versao   : 1.0        Data : 28/08/93   *
* Autora   : Debora P. Diniz Tavares      *
*-----------------------------------------*
Save Screen To Tela
*Set Delimiter To '[]'
*Set Delimiter On
*Set Intensity Off
Set Cursor On

Select 1
Use &Mest\Pe1000 Index &Mest\Pe1000,&Mest\Pe1alf
Select 2
Use Pe1tmp Exclusive

@ 23,05 Say Space (60)

*Set Color To W+

Do While .T.

   @ 08,20 Clear To 16,79
   @ 08,20 To 16,79

   @ 09,22 Say 'Codigo:'
   @ 11,22 Say 'Descricao:'
   @ 13,22 Say 'P.Compra:'
   @ 13,50 Say 'P.Venda:'
   @ 15,22 Say 'Quantidade:'

   Select 2
   Replace Fcod With '',Fdes With '',Fpre With 0,Fpco With 0,Fqte With 0
           
   @ 9,30 Get Fcod  Pict 'XXXXXXXXXX'
   Read
   If LastKey() <> 27
      If Fcod <> Space(10)
         Select 1
         Seek B->Fcod
         If Found()
            If Lock_R(0)
            EndIf
            Select 2
            Replace Fdes With A->Fdes,Fpre With A->Fpre,Fpco With A->Fpco,;
                    Fqte With A->Fqte
            Maux = 'A'
         Else
            Maux = 'I'
         EndIf
         Select 2
         @ 11,33 Get Fdes
         @ 13,32 Get Fpco Pict '999,999.99'
         @ 13,59 Get Fpre Pict '999,999.99'
         @ 15,34 Get Fqte Pict '99999.99'
         Read
         If Fdes <> Space(40)
            If Maux = 'I'
               Select 1
               If Lock_Ap(0)
               EndIf
            EndIf
            Select 1
            Replace Fcod With B->Fcod,Fdes With Upper(B->Fdes),;
                    Fpre With B->Fpre,Fqte With B->Fqte,Fpco With B->Fpco
         EndIf
      EndIf
   Else
      Exit
   EndIf
EndDo
*Set Color To W
*Set Intensity On
Set Cursor Off
Set Delimiter Off
Close Data
Restore Screen From Tela
Return

*----------------------------------------*
*           Sistema Pe1000               *
* Programa : Pe1410.PRG                  *
* Funcao   : Rel. Contas a Pagar         *
* Versao   : 1.0      Data : 28/08/93    *
* Autor    : Debora P. Diniz Tavares     *
*----------------------------------------*
Set Cursor On
Save Screen To Timp
@ 10,20 Clear To 12,35
@ 10,20 To 12,35
@ 11,21 Say ' Indexando...'
Use &Mped\Pe1300 Exclusive
Index On Dtos(Fdat)+Ffor To Pe13dat
Use &Mped\Pe1300 Index Pe13dat

@ 14,13 Clear To 16,23
@ 14,25 Clear To 16,35
@ 14,13 To 16,23
@ 14,25 To 16,35
@ 14,14 Say 'Inicio'
@ 14,26 Say 'Fim'
Mini = Date()
Mfim = Date()
@ 15,14 Get Mini
@ 15,26 Get Mfim
Read

Achou = 'F'
Do While !Eof()
   If Fdat < Mini
      Skip
   Else
      Achou = 'V'
      Exit
   EndIf
EndDo

If Achou = 'V'
   @ 11,21 Say 'Imprimindo...'
   Set Console Off
   Set Device To Print
   Set Printer To Lpt1
*   @ 0,0 Say Chr(15)      && Condensado
   Pag = 0
   Lin = 61
   Total = 0
   Do While !Eof() .And. Fdat <= Mfim
      If Lin > 60
         Pag = Pag + 1
         @ 01,01 Say 'Data:'
         @ 01,07 Say Date()
         @ 01,60 Say 'Pag.:'
         @ 01,66 Say Pag Pict '999'
         @ 02,25 Say 'PEIXARIA PESCAVE'
         @ 03,15 Say 'Relatorio de Contas a Pagar'
         @ 05,01 Say 'Data     Nro.Dupl.      Nome do Fornecedor'
         @ 05,65 Say 'Valor'
         Lin = 07
      EndIf
      If Fst1 <> '9'
         @ Lin,01 Say Fdat
         @ Lin,10 Say Fcod
         @ Lin,22 Say Ffor
         @ Lin,65 Say Fval Pict '@E 999,999,999.99'
         Total = Total + Fval
         Lin = Lin + 1
      EndIf
      Skip
   EndDo
   Lin = Lin + 1
   If Lin > 60
      Pag = Pag + 1
      @ 01,01 Say 'Data:'
      @ 01,07 Say Date()
      @ 01,60 Say 'Pag.:'
      @ 01,66 Say Pag Pict '999'
      @ 02,25 Say 'PEIXARIA PESCAVE'
      @ 03,15 Say 'Relatorio de Contas a Receber'
      @ 05,01 Say 'Data     Nro.Pedido       Nome do Cliente         Valor'
      Lin = 07
   EndIf
   @ Lin,01 Say 'TOTAL:'
   @ Lin,65 Say Total Pict '@E 999,999,999.99'
EndIf
Close Data
*@ 0,0 Say Chr(18)      && Normal
@ 0,0 Say ' ' 
Set Printer To
Set Device To Screen
Set Console On
Mcor = Setcolor()
Set Color To N+/B+
@ 10,20 Clear To 12,35
Set Color To &Mcor
Restore Screen From Timp
Set Cursor Off
Return

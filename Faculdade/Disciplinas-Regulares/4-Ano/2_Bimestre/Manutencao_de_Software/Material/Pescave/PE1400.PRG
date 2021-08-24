*----------------------------------------*
*           Sistema Pe1000               *
* Programa : Pe1400.PRG                  *
* Funcao   : Rel. Contas a Receber       *
* Versao   : 1.0      Data : 28/08/93    *
* Autor    : Debora P. Diniz Tavares     *
*----------------------------------------*
Set Cursor On
Save Screen To Timp
Select 1
Use &Mped\Pe1200 Index &Mped\Pe12dt
Select 2
Use Pe1400 Exclusive
Zap
Index On Fncl To Pe1400
Use Pe1400 Index Pe1400 Exclusive
Select 3
Use &mca\Pe0100 Index &mca\Pe01alf

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

Select 1
Achou = 'F'
Do While !Eof()
   If Fdte < Mini
      Skip
   Else
      Achou = 'V'
      Exit
   EndIf
EndDo

If Achou = 'V'
   Do While !Eof() .And. Fdte <= Mfim
      If Fbai <> 'B'
         Select 2
         Seek A->Fncl
         If !Found()
            Select 3
            Seek A->Fncl
            Select 2
            Append Blank
            Replace Fcod With C->Fccl,Fncl With A->Fncl,Ftot With A->Ftot
         Else
            Replace Ftot With Ftot+A->Ftot
         EndIf
      EndIf
      Select 1
      Skip
   EndDo

   @ 10,20 Clear To 12,35
   @ 10,20 To 12,35
   @ 11,21 Say 'Imprimindo...'
   Set Console Off
   Set Device To Print
   Set Printer To Lpt1
   Pag = 0
   Lin = 61
   Total = 0
   Select 2
   Go Top
   Do While !Eof()
      If Lin > 60
         Pag = Pag + 1
         @ 01,01 Say 'Data:'
         @ 01,07 Say Date()
         @ 01,60 Say 'Pag.:'
         @ 01,66 Say Pag Pict '999'
         @ 02,25 Say 'PEIXARIA PESCAVE'
         @ 03,15 Say 'Relatorio de Contas a Receber'
         @ 05,01 Say 'Cod.     Nome do Cliente                     Valor'
         Lin = 07
      EndIf
      @ Lin,01 Say Fcod
      @ Lin,10 Say Fncl
      @ Lin,45 Say Ftot Pict '@E 999,999,999.99'
      Total = Total + Ftot
      Lin = Lin + 1
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
      @ 05,01 Say 'Cod.     Nome do Cliente                     Valor'
      Lin = 07
   EndIf
   @ Lin,01 Say 'TOTAL:'
   @ Lin,65 Say Total Pict '@E 999,999,999.99'
EndIf
Close Data
@ 0,0 Say ' '
*@ 0,0 Say Chr(18)      && Normal
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
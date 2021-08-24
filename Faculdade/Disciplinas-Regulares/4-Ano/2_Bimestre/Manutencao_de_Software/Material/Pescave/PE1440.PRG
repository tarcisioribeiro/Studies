*----------------------------------------*
*           Sistema Pe1000               *
* Programa : Pe1440.PRG                  *
* Funcao   : Rel. Vendas                 *
* Versao   : 1.0      Data : 28/08/93    *
* Autor    : Debora P. Diniz Tavares     *
*----------------------------------------*
Set Cursor On
Save Screen To Timp
@ 10,20 Clear To 12,35
@ 10,20 To 12,35
@ 11,21 Say ' Indexando...'
Select 1
Use &Mped\Pe1210 Exclusive
Index On Dtos(Fdte)+Fcod To Pe121dat
Use &Mped\Pe1210 Index Pe121dat
Select 2
Use Pe1440 Exclusive
Zap
Index On Fcod To Pe1440
Use Pe1440 Index Pe1440 Exclusive  && Somatorio de Produtos

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
      Select 2
      Seek A->Fcod
      If !Found()
         Append Blank
         Replace Fcod With A->Fcod,Fdes With A->Fdes
      EndIf
      Replace Fqtd With (Fqtd+A->Fqtd),Fval With (Fval+A->Fvlt)
      Select 1
      Skip
   EndDo

   Select 2
   Go Top
   @ 11,21 Say 'Imprimindo...'
   Set Console Off
   Set Device To Print
   Set Printer To Lpt1
*   @ 0,0 Say Chr(15)      && Condensado
   Pag = 0
   Lin = 61
   Total = 0
   Do While !Eof()
      If Lin > 60
         Pag = Pag + 1
         @ 01,01 Say 'Data:'
         @ 01,07 Say Date()
         @ 01,60 Say 'Pag.:'
         @ 01,66 Say Pag Pict '999'
         @ 02,25 Say 'PEIXARIA PESCAVE'
         @ 03,05 Say 'Relatorio de Vendas no Periodo : '
         @ 03,38 Say Mini
         @ 03,48 Say 'a '
         @ 03,50 Say Mfim
         @ 05,01 Say 'Codigo       Descricao do Produto             Qtde.'
         @ 05,56 Say 'Valor'
         Lin = 07
      EndIf
      @ Lin,01 Say Fcod
      @ Lin,12 Say Fdes
      @ Lin,45 Say Fqtd Pict '@E 999,999.99'
      @ Lin,56 Say Fval Pict '@E 999,999,999.99'
      Total = Total + Fval
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
      @ 03,05 Say 'Relatorio de Vendas no Periodo : '
      @ 03,38 Say Mini
      @ 03,48 Say 'a '
      @ 03,50 Say Mfim
      @ 05,01 Say 'Codigo       Descricao do Produto             Qtde.'
      @ 05,56 Say 'Valor'
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
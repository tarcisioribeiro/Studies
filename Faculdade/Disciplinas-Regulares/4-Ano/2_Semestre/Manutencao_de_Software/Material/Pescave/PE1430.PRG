*----------------------------------------*
*           Sistema Pe1000               *
* Programa : Pe1430.PRG                  *
* Funcao   : Rel. Vendas Periodo         *
* Versao   : 1.0      Data : 28/08/93    *
* Autor    : Debora P. Diniz Tavares     *
*----------------------------------------*
Set Cursor On
Save Screen To Timp
@ 10,20 Clear To 12,35
@ 10,20 To 12,35
@ 11,21 Say ' Indexando...'
Select 1
Use &Mped\Pe1200 Exclusive
Index On Dtos(Fdte)+Fncl To Pe12dat
Use &Mped\Pe1200 Index Pe12dat
Select 2
Use &Mped\Pe1210 Index &Mped\Pe1210

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
   @ 11,21 Say 'Imprimindo...'
   Set Console Off
   Set Device To Print
   Set Printer To Lpt1
*   @ 0,0 Say Chr(15)      && Condensado
   Pag = 0
   Lin = 61
   Total = 0
   Do While !Eof() .And. Fdte <= Mfim
      If Lin > 60
         Pag = Pag + 1
         @ 01,01 Say 'Data:'
         @ 01,07 Say Date()
         @ 01,60 Say 'Pag.:'
         @ 01,66 Say Pag Pict '999'
         @ 02,25 Say 'PEIXARIA PESCAVE'
         @ 03,05 Say 'Relatorio de Produtos/Pedidos no Periodo : '
         @ 03,48 Say Mini
         @ 03,58 Say 'a '
         @ 03,60 Say Mfim
         @ 05,01 Say 'Data     Nro.Pedido       Nome do Cliente'
         @ 05,65 Say 'Valor'
         @ 06,05 Say '      Nome do Produto         Qtde.        P.Unit.'
         @ 06,57 Say 'P.Total'
         Lin = 08
      EndIf
      @ Lin,01 Say Fdte
      @ Lin,10 Say Fnor
      @ Lin,22 Say Fncl
      @ Lin,65 Say Ftot Pict '@E 999,999,999.99'
      Total = Total + Ftot
      Lin = Lin + 1
      Select 2
      Seek A->Fnor
      If Found()
         Do While A->Fnor = Fnor
            If Lin > 60
               Pag = Pag + 1
               @ 01,01 Say 'Data:'
               @ 01,07 Say Date()
               @ 01,60 Say 'Pag.:'
               @ 01,66 Say Pag Pict '999'
               @ 02,25 Say 'PEIXARIA PESCAVE'
               @ 03,05 Say 'Relatorio de Produtos/Pedidos no Periodo : '
               @ 03,48 Say Mini
               @ 03,58 Say 'a '
               @ 03,60 Say Mfim
               @ 05,01 Say 'Data     Nro.Pedido       Nome do Cliente'
               @ 05,65 Say 'Valor'
               @ 06,05 Say '      Nome do Produto         Qtde.        P.Unit.'
               @ 06,57 Say 'P.Total'
               Lin = 08
            EndIf

            @ Lin,05 Say Fdes
            @ Lin,37 Say Fqtd Pict '@E 9,999.99'
            @ Lin,46 Say Fpre Pict '@E 999,999.99'
            @ Lin,57 Say Fvlt Pict '@E 9,999,999.99'
            Lin = Lin + 1
            Skip
         EndDo
         Select 1
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
      @ 03,05 Say 'Relatorio de Produtos/Pedidos no Periodo : '
      @ 03,48 Say Mini
      @ 03,58 Say 'a '
      @ 03,60 Say Mfim
      @ 05,01 Say 'Data     Nro.Pedido       Nome do Cliente'
      @ 05,65 Say 'Valor'
      @ 06,05 Say '      Nome do Produto         Qtde.        P.Unit.'
      @ 06,57 Say 'P.Total'
      Lin = 08
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
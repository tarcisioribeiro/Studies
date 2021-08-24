*----------------------------------------*
*           Sistema Pe1000               *
* Programa : Pe1420.PRG                  *
* Funcao   : Rel. Cotas p/ Vendedor      *
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
Index On Fcvd+Dtos(Fdte) To Pe12vend
Use &Mped\Pe1200 Index Pe12vend
Select 2
Use &Mca\Pe0200 Index &Mca\Pe0200

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
@ 11,21 Say 'Imprimindo...'
Set Console Off
Set Device To Print
Set Printer To Lpt1
*   @ 0,0 Say Chr(15)      && Condensado
Pag = 0
Lin = 61
Total = 0
Mvend = Fcvd
Do While !Eof()
   Achou = 'F'
   Do While !Eof() .And. Mvend = Fcvd
      If Fdte < Mini
         Skip
      Else
         If Fdte <= Mfim
            Achou = 'V'
            Exit
         Else
            Skip
         EndIf
      EndIf
   EndDo

   If Achou = 'V'      && Existe Venda para o vendedor
      Select 2
      Seek Mvend
      If Found()
         Mnom = Fnom
      Else
         Mnom = Space(20)
      EndIf
      Select 1
      Do While !Eof() .And. Fdte <= Mfim .And. Mvend = Fcvd
         If Lin > 60
            Pag = Pag + 1
            @ 01,01 Say 'Data:'
            @ 01,07 Say Date()
            @ 01,60 Say 'Pag.:'
            @ 01,66 Say Pag Pict '999'
            @ 02,25 Say 'PEIXARIA PESCAVE'
            @ 03,15 Say 'Relatorio de Cotas por Vendedor'
            @ 05,01 Say 'Vendedor: ' + Mnom
            @ 07,01 Say 'Nro.Pedido       Nome do Cliente'
            @ 07,55 Say 'Valor'
            Lin = 09
         EndIf
         If Fbai <> 'B'
            @ Lin,01 Say Fnor
            @ Lin,12 Say Fncl
            @ Lin,55 Say Ftot Pict '@E 999,999,999.99'
            Total = Total + Ftot
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
         @ 03,15 Say 'Relatorio de Cotas por Vendedor'
         @ 05,01 Say 'Vendedor: ' + Mnom
         @ 07,01 Say 'Nro.Pedido       Nome do Cliente'
         @ 07,55 Say 'Valor'
         Lin = 09
      EndIf
      @ Lin,01 Say 'TOTAL:'
      @ Lin,65 Say Total Pict '@E 999,999,999.99'
      Lin = Lin + 2
      If Lin > 60
         Pag = Pag + 1
         @ 01,01 Say 'Data:'
         @ 01,07 Say Date()
         @ 01,60 Say 'Pag.:'
         @ 01,66 Say Pag Pict '999'
         @ 02,25 Say 'PEIXARIA PESCAVE'
         @ 03,15 Say 'Relatorio de Cotas por Vendedor'
         @ 05,01 Say 'Vendedor: ' + Mnom
         @ 07,01 Say 'Nro.Pedido       Nome do Cliente'
         @ 07,55 Say 'Valor'
         Lin = 09
      EndIf
      @ Lin,01 Say 'COTA :'
      @ Lin,10 Say (Total*4/100) Pict'@E 999,999.99'
      Total = 0
      Lin = Lin + 2
      Do While !Eof() .And. Mvend = Fcvd
         Skip
      EndDo
   EndIf
   If Eof()
      Exit
   EndIf
   Mvend = Fcvd
   Select 2
   Seek Mvend
   If Found()
      Mnom = Fnom
   Else
      Mnom = Space(20)
   EndIf
   Select 1
   If Lin > 60
      Pag = Pag + 1
      @ 01,01 Say 'Data:'
      @ 01,07 Say Date()
      @ 01,60 Say 'Pag.:'
      @ 01,66 Say Pag Pict '999'
      @ 02,25 Say 'PEIXARIA PESCAVE'
      @ 03,15 Say 'Relatorio de Cotas por Vendedor'
      @ 05,01 Say 'Vendedor: ' + Mnom
      @ 07,01 Say 'Nro.Pedido       Nome do Cliente'
      @ 07,55 Say 'Valor'
      Lin = 09
   Else
      @ Lin,01 Say 'Vendedor: ' + Mnom
   EndIf
   Lin = Lin + 2
EndDo
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
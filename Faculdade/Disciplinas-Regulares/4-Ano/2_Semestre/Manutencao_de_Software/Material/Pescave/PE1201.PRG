*----------------------------------------*
*           Sistema Pe1000               *
* Programa : Pe1210.PRG                  *
* Funcao   : Emissao do Orcamento        *
* Versao   : 1.0      Data : 28/08/93    *
* Autor    : Debora P. Diniz Tavares     *
*----------------------------------------*

Set Device To Printer
Set Printer To Lpt1
@ 01,00 Say Chr(27)+'@'+Chr(13)           && Inicializando a Impressora
@ 01,00 Say Chr(27)+'C'+Chr(30)+Chr(13)   && Tamanho da folha
@ 01,00 Say Chr(27)+Chr(69)   && Negrito
If G->Ftip = '1'
   @ 01,25 Say 'PEIXARIA PESCAVE'
Else
   @ 01,20 Say 'FABRICA DE GELO PESCAVE'
EndIf
@ 01,78 Say Chr(27)+Chr(70)     && Tirar Negrito
@ 03,03 Say 'Pedido Nro. : ' + G->Fnor
@ 03,35 Say 'Vendedor : ' + C->Fnom
@ 03,70 Say G->Fdte  && Date()
@ 05,03 Say 'Cliente : '+ G->Fncl
@ 06,03 Say 'Endereco : '+ Mend
@ 06,65 Say 'Tel.: ' + Mtel
@ 07,03 Say 'Munic.: ' + Mcid + '   Est.: ' + Mesta + '   CEP : ' + Mcep
Select 8
Go Top
@ 08,00 Say Chr (15)         && Condensando
@ 08,11 Say '+'
@ 08,12 Say Replicate('-',106)
@ 08,118 Say '+'
@ 09,10 Say '|  Qt.(Kg)  |  Codigo    |               Descricao'
@ 09,79 Say '|  Caixas   |   R$/Kg.   |     R$     | '
@ 10,10 Say '|'
@ 10,11 Say Replicate('-',106)
@ 10,117 Say '|'
i = 11
Tqtd = 0
Tcxs = 0
Do While .Not. Eof()
   If Fst1 <> '9' .AND. Fcod <> Space(10)
      @ i,10 Say '|'
      @ i,12 Say Fqtd Pict '@E 99,999.99'
      @ i,22 Say '|'
      @ i,24 Say Fcod Pict 'XXXXXXXXXX'
      @ i,35 Say '|'
      @ i,37 Say Fdes
      @ i,79 Say '|'
      @ i,81 Say Fqcx Pict '999'
      @ i,85 Say 'x'
      @ i,87 Say Ftcx Pict '999'
      @ i,91 Say '|'
      @ i,93 Say Fpre Pict '@E 999,999.99'
      @ i,104 Say '|'
      @ i,106 Say Fpre*Fqtd Pict '@E 999,999.99'
      @ i,117 Say '|'
      i = i + 1
      Tqtd = Tqtd + Fqtd
      Tcxs = Tcxs + Fqcx
   EndIf
   Skip
EndDo
@ i,10 Say '|'
@ i,11 Say Replicate('-',106)
@ i,117 Say '|'
i = i + 1
@ i,03 Say 'TOTAIS :'
@ i,12 Say Tqtd Pict '@E 99,999.99'
@ i,81 Say Tcxs Pict '999'
@ i,85 Say 'CAIXAS'
@ i,106 Say Total Pict '@E 999,999.99'
@ i,117 Say '|'
@ i+1,10 Say '+'
@ i+1,11 Say Replicate('-',106)
@ i+1,117 Say '+'
@ 25,00 Say Chr(18)    && Fim do Condensado
Select 7
@ 25,03 Say 'Prazo : '+ Fpre + ' Dias'

Vaux = Chr(27) + 'C' + Chr(76) + Chr(13)
@ 0,5 Say Vaux
@ 0,0 Say ''

Set Device To Screen
Set Printer To

Return


*----------------------------------------*
*           Sistema Pe1000               *
* Programa : Pe1202.PRG                  *
* Funcao   : Emissao em Bobina           *
* Versao   : 1.0      Data : 28/08/93    *
* Autor    : Debora P. Diniz Tavares     *
*----------------------------------------*

Set Device To Printer
Set Printer To Lpt1
@ 01,00 Say Chr(27)+'@'+Chr(13)           && Inicializando a Impressora
@ 01,00 Say Chr(27)+'C'+Chr(30)+Chr(13)   && Tamanho da folha
@ 01,00 Say Chr(27)+Chr(69)   && Negrito
If G->Ftip = '1'
   @ 01,05 Say 'PEIXARIA PESCAVE'
Else
   @ 01,05 Say 'FABRICA DE GELO PESCAVE'
EndIf
@ 01,78 Say Chr(27)+Chr(70)     && Tirar Negrito
@ 02,00 Say Chr (15)         && Condensando
@ 03,01 Say 'Pedido Nro. : ' + G->Fnor + '        Data: '
@ 03,Pcol() Say G->Fdte  && Date()
@ 04,01 Say 'Vendedor : ' + C->Fnom
@ 06,01 Say 'Cliente : '+ G->Fncl
@ 07,01 Say 'Endereco : '+ Mend
@ 08,01 Say 'Munic.: ' + Mcid + '   Est.: ' + Mesta + '   CEP : ' + Mcep
@ 09,01 Say 'Telefone: ' + Mtel
Select 8
Go Top
@ 11,01 Say Replicate('-',59)
i = 13
Tqtd = 0
Tcxs = 0
Do While .Not. Eof()
   If Fst1 <> '9' .AND. Fcod <> Space(10)
      @ i,01 Say Fqtd Pict '@E 99,999.99'
      @ i,12 Say Fdes Pict '!!!!!!!!!!!!!!!!!!!!'
      @ i,35 Say Fpre Pict '@E 999,999.99'
      @ i,47 Say Fpre*Fqtd Pict '@E 999,999.99'
      i = i + 1
      Tqtd = Tqtd + Fqtd
   EndIf
   Skip
EndDo
@ i,01 Say Replicate('-',59)
i = i + 1
@ i,01 Say Tqtd Pict '@E 99,999.99'
@ i,47 Say Total Pict '@E 999,999.99'
@ i+1,01 Say Replicate('-',59)
Select 7
@ i+3,01 Say 'Prazo : '+ Fpre + ' Dias'
@ i+4,00 Say Chr(18)    && Fim do Condensado

Vaux = Chr(27) + 'C' + Chr(76) + Chr(13)
@ 0,5 Say Vaux
@ 0,0 Say ''

Set Device To Screen
Set Printer To

Return


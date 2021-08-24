*----------------------------------------*
*           Sistema Pe1000               *
* Programa : Pe1000.PRG                  *
* Funcao   : MENU Principal              *
* Versao   : 1.0      Data : 06/01/92    *
*----------------------------------------*
Clear
Set Exclusive Off
Set Wrap  On
Set Date British
Set Deleted On
Set Procedure To Pe1ger
Public Frame_D,drm,Mest,Mca
*Public Mcod,Mdes,Mpre,Mpco,Mqta,Mqte,Mfor,Mst1,Mst2

frame_d=chr(201)+chr(205)+chr(187)+;
        chr(186)+chr(188)+chr(205)+;
        chr(200)+chr(186)+chr(176)

Mest = '\Estoq'
Mca = '\Cadast'
Mped = '\Pedido'

Drm = 'PESCAVE'

Set Message To 23 Center
Do While .T.
   Set Color To R
   @ 24,61 Say '<ESC> '
   Set Color To BG
   @ 24,67 Say 'Sair Sistema'
   @ 00,01 Say Drm

   Set Color To N+/B+
   @ 04,01 Clear to 21,79
   Set Color To N/W,W/N
   @ 02,01 Clear To 02,79
   @ 01,01 To 01,79
   @ 03,01 To 03,79
   @ 22,01 To 22,79
   @ 23,01 Clear To 23,79
   @ 02,05 Prompt 'Arquivos' Message 'Manutencao de Arquivos'
   @ 02,19 Prompt 'Program' Message 'Execucao de: Pedidos e Movimentacao de Estoque'
   @ 02,32 Prompt 'C.Pagar' Message 'Contas a Pagar'
   @ 02,45 Prompt 'Relatorio' Message 'Relatorios Operacionais'
   @ 02,60 Prompt 'Outros' Message 'Programas Auxiliares'
   Menu To Opcao
   Do Case
   Case Opcao = 1        && Manutencao Do Arquivo 
        Save Screen To Pe0001
        Set Color To BG
        @ 24,67 Say ' Voltar Menu'
        Set Color To N/W,W/N
        @ 04,04 Clear To 08,14
        @ 04,04 To 08,14 
        @ 23,01 Clear To 23,79
        Op1 = 1
        Do While .T.
           @ 05,05 Prompt 'Produto ' Message 'Manutencao no Arquivo de Produtos'
           @ 06,05 Prompt 'Cliente ' Message 'Manutencao no Arquivo de Clientes'
           @ 07,05 Prompt 'Vendedor' Message 'Manutencao no Arquivo de Vendedores'
           Menu To Op1
           Do Case
           Case Op1 = 1     && Manut.Produtos
                Save Screen To T1
                @ 06,06 Clear To 12,16
                @ 06,06 To 12,16
                Opc = 1 
                Do While .T.
                   @ 23,01 Clear To 23,79
                   @ 07,07 Prompt 'Incl./Alt' Message 'Inclusao ou Alteracao de Produtos'
                   @ 08,07 Prompt 'Excluir  ' Message 'Exclusao de Produtos'
                   @ 09,07 Prompt 'Consultar' Message 'Consulta de Produtos'
                   @ 10,07 Prompt 'Nome     ' Message 'Consulta de Produtos por Nome'
                   @ 11,07 Prompt 'Relatorio' Message 'Relatorio Geral dos Produtos em Ordem Alfabetica'
                   Menu To Opc
                   Do Case
                   Case Opc = 1            && Inclusao/Alteracao
                        Do Pe1100
                   Case Opc = 2            && Exclusao
                        Do Pe1110
                   Case Opc = 3            && Consulta
                        Do Pe1120
                   Case Opc = 4            && Consulta Nome
                        Do Pe1130
                   Case Opc = 5            && Relatorio
                        @ 10,20 Clear To 12,35
                        @ 10,20 To 12,35
                        @ 11,21 Say 'Imprimindo...'
                        Set Console Off
                        Set Device To Print
                        Set Printer To Lpt1
                        Use &Mest\Pe1000 Index &Mest\Pe1alf
                        Report Form Pe1000 To Print
                        Close Data
                        Set Printer To
                        Set Device To Screen
                        Set Console On
                        Mcor = Setcolor()
                        Set Color To N+/B+
                        @ 10,20 Clear To 12,35
                        Set Color To &Mcor
                   Case LastKey() = 27
                        Restore Screen From T1
                        Exit
                   EndCase
                EndDo
           Case Op1 = 2      && Manut.Clientes
                Save Screen To T1
                @ 07,06 Clear To 13,16
                @ 07,06 To 13,16
                Opc = 1 
                Do While .T.
                   @ 23,01 Clear To 23,79
                   @ 08,07 Prompt 'Incl./Alt' Message 'Inclusao ou Alteracao de Clientes'
                   @ 09,07 Prompt 'Excluir  ' Message 'Exclusao de Clientes'
                   @ 10,07 Prompt 'Consultar' Message 'Consulta de Clientes'
                   @ 11,07 Prompt 'Nome     ' Message 'Consulta de Clientes por Nome'
                   @ 12,07 Prompt 'Relatorio' Message 'Relatorio Geral dos Clientes em Ordem Alfabetica'
                   Menu To Opc
                   Do Case
                   Case Opc = 1            && Inclusao/Alteracao
                        Do Pe0110
                   Case Opc = 2            && Exclusao
                        Do Pe0120
                   Case Opc = 3            && Consulta
                        Do Pe0130
                   Case Opc = 4            && Consulta Nome
                        Do Pe0140
                   Case Opc = 5            && Relatorio
                        @ 10,20 Clear To 12,35
                        @ 10,20 To 12,35
                        @ 11,21 Say 'Imprimindo...'
                        Set Console Off
                        Set Device To Print
                        Set Printer To Lpt1
                        @ 0,0 Say Chr(15)      && Condensado
                        Use &Mca\Pe0100 Index &Mca\Pe01alf
                        Report Form Pe0100 To Print
                        Close Data
                        @ 0,0 Say Chr(18)      && Normal
                        Set Printer To
                        Set Device To Screen
                        Set Console On
                        Mcor = Setcolor()
                        Set Color To N+/B+
                        @ 10,20 Clear To 12,35
                        Set Color To &Mcor
                   Case LastKey() = 27
                        Restore Screen From T1
                        Exit
                   EndCase
                EndDo
           Case Op1 = 3       && Manut.Vendedor
                Save Screen To T1
                @ 08,06 Clear To 13,16
                @ 08,06 To 13,16
                Opc = 1 
                Do While .T.
                   @ 23,01 Clear To 23,79
                   @ 09,07 Prompt 'Incl./Alt' Message 'Inclusao ou Alteracao de Vendedores'
                   @ 10,07 Prompt 'Excluir  ' Message 'Exclusao de Vendedores'
                   @ 11,07 Prompt 'Consultar' Message 'Consulta de Vendedores'
                   @ 12,07 Prompt 'Relatorio' Message 'Relatorio Geral dos Vendedores'
                   Menu To Opc
                   Do Case
                   Case Opc = 1            && Inclusao/Alteracao
                        Do Pe0210
                   Case Opc = 2            && Exclusao
                        Do Pe0220
                   Case Opc = 3            && Consulta
                        Do Pe0230
                   Case Opc = 4            && Relatorio
                        @ 10,20 Clear To 12,35
                        @ 10,20 To 12,35
                        @ 11,21 Say 'Imprimindo...'
                        Set Console Off
                        Set Device To Print
                        Set Printer To Lpt1
                        Use &Mca\Pe0200 Index &Mca\Pe0200
                        Report Form Pe0200 To Print
                        Close Data
                        Set Printer To
                        Set Device To Screen
                        Set Console On
                        Mcor = Setcolor()
                        Set Color To N+/B+
                        @ 10,20 Clear To 12,35
                        Set Color To &Mcor
                   Case LastKey() = 27
                        Restore Screen From T1
                        Exit
                   EndCase
                EndDo
           Case LastKey() = 27     && Saida do SubMenu
                Restore Screen From Pe0001
                Exit 
           EndCase
        EndDo

   Case Opcao = 2                       && Pedido
        Save Screen To Pe0001
        Set Color To BG
        @ 24,67 Say ' Voltar Menu'
        Set Color To N/W,W/N
        @ 04,18 Clear To 07,26
        @ 04,18 To 07,26
        @ 23,01 Clear To 23,79
        Opr = 1
        Do While .T.
           @ 05,19 Prompt 'Pedidos' Message 'Submenu de Pedidos'
           @ 06,19 Prompt 'Movimen' Message 'Entrada e Saida de Estoque'
           Menu To Opr
           Do Case
           Case Opr = 1       && Pedido
                Save Screen To T1
                @ 06,22 Clear To 10,32
                @ 06,22 To 10,32
                Opc = 1 
                Do While .T.
                   @ 23,01 Clear To 23,79
                   @ 07,23 Prompt 'Emissao  ' Message 'Emissao de Pedidos'
                   @ 08,23 Prompt 'Alteracao' Message 'Alteracao de Pedidos ja emitidos'
                   @ 09,23 Prompt 'Baixa    ' Message 'Baixa de Pedidos'
                   Menu To Opc
                   Do Case
                   Case Opc = 1            && Emissao
                        Do Pe1200
                   Case Opc = 2            && Alteracao
                        Do Pe1205
                   Case Opc = 3            && Baixa
                        Do Pe1210
                   Case LastKey() = 27
                        Restore Screen From T1
                        Exit
                   EndCase
                EndDo
           Case Opr = 2       && Baixa de Pedido
                Save Screen To T1
                @ 08,22 Clear To 12,32
                @ 08,22 To 12,32
                Opc = 1 
                Do While .T.
                   @ 23,01 Clear To 23,79
                   @ 09,23 Prompt 'Digitacao' Message 'Digitacao das Entradas e Saidas do Estoque'
                   @ 10,23 Prompt 'Relatorio' Message 'Relatorio para Conferencia da Digitacao'
                   @ 11,23 Prompt 'Atualiza ' Message 'Atualizacao do Movimento'
                   Menu To Opc
                   Do Case
                   Case Opc = 1            && Digitacao
                        Do Pe1220
                   Case Opc = 2            && Relatorio
                        Save Screen To Timp
                        @ 10,20 Clear To 12,35
                        @ 10,20 To 12,35
                        @ 11,21 Say 'Imprimindo...'
                        Set Console Off
                        Set Device To Print
                        Set Printer To Lpt1
                        @ 0,0 Say Chr(15)      && Condensado
                        Use Pe1220
                        Report Form Pe1220 To Print
                        Close Data
                        @ 0,0 Say Chr(18)      && Normal
                        Set Printer To
                        Set Device To Screen
                        Set Console On
                        Mcor = Setcolor()
                        Set Color To N+/B+
                        @ 10,20 Clear To 12,35
                        Set Color To &Mcor
                        Restore Screen From Timp
                   Case Opc = 3            && Atualizacao
                        Do Pe1221
                   Case LastKey() = 27
                        Restore Screen From T1
                        Exit
                   EndCase
                EndDo
           Case Lastkey() = 27
              Restore Screen From Pe0001
              Exit
           EndCase
        EndDo

   Case Opcao = 3                   && Caixa
        Save Screen To Pe0001
        Set Color To BG
        @ 24,67 Say ' Voltar Menu'
        Set Color To N/W,W/N
        @ 04,30 Clear To 08,40
        @ 04,30 To 08,40
        @ 23,01 Clear To 23,79
        Opr = 1
        Do While .T.
           @ 05,31 Prompt 'Digitacao' Message 'Digitacao de Duplicatas'
           @ 06,31 Prompt 'Relatorio' Message 'Relatorio para Conferencia'
           @ 07,31 Prompt 'Atualizar' Message 'Atualizacao da Digitacao'
           Menu To Opr
           Do Case   
           Case Opr = 1    && Digitacao
                Do Pe1300
           Case Opr = 2    && Relatorio
                Save Screen To Timp
                @ 10,20 Clear To 12,35
                @ 10,20 To 12,35
                @ 11,21 Say 'Imprimindo...'
                Set Console Off
                Set Device To Print
                Set Printer To Lpt1
                @ 0,0 Say Chr(15)      && Condensado
                Use Pe13tmp
                Report Form Pe1300 To Print
                Close Data
                @ 0,0 Say Chr(18)      && Normal
                Set Printer To
                Set Device To Screen
                Set Console On
                Mcor = Setcolor()
                Set Color To N+/B+
                @ 10,20 Clear To 12,35
                Set Color To &Mcor
                Restore Screen From Timp
           Case Opr = 3    && Atualizacao
                Do Pe1310
           Case LastKey()=27            && Saida
                Restore Screen From Pe0001
                Exit
           EndCase
        EndDo

  Case Opcao = 4                       && Relatorios
        Save Screen To Pe0001
        Set Color To BG
        @ 24,67 Say ' Voltar Menu'
        Set Color To N/W,W/N
        @ 04,43 Clear To 10,54
        @ 04,43 To 10,54
        @ 23,01 Clear To 23,79
        Opr = 1
        Do While .T.
           @ 05,44 Prompt '1.C.Receb' Message 'Relatorio Contas a Receber'
           @ 06,44 Prompt '2.C.Pagar' Message 'Relatorio Contas a Pagar'
           @ 07,44 Prompt '3.Cotas  ' Message 'Relatorio Cotas por Vendedores de um Determinado Periodo'
           @ 08,44 Prompt '4.Ped/Pro' Message 'Relatorio Pedidos e Produtos de um Determinado Periodo'
           @ 09,44 Prompt '5.Vendas ' Message 'Relatorio Total de Vendas de um Determinado Periodo'
           Menu To Opr
           Do Case   
           Case Opr = 1                 && C.Receber
                Do Pe1400
           Case Opr = 2                 && C.Pagar
                Do Pe1410
           Case Opr = 3                 && Cotas
                Do Pe1420
           Case Opr = 4                 && Pedido/Produtos
                Do Pe1430
           Case Opr = 5                 && Vendas
                Do Pe1440
           Case LastKey()=27            && Saida
                Restore Screen From Pe0001
                Exit
           Otherwise
                Do Pe1300
           EndCase
        EndDo
 
   Case Opcao = 5           && Outros
        Save Screen To Pe0001
        Set Color To BG
        @ 24,67 Say ' Voltar Menu'
        Set Color To N/W,W/N
        @ 04,58 Clear To 06,67
        @ 04,58 To 06,67
        @ 23,01 Clear To 23,79
        Opr = 1
        Do While .T.
           @ 05,59 Prompt 'Indexa  ' Message 'Indexacao de Arquivos'
*           @ 06,59 Prompt 'Aumento ' Message 'Aumento do Preco dos Produtos'
*           @ 07,59 Prompt 'Restaura' Message 'Restaura os Precos antes do Aumento'
           Menu To Opr
           Do Case   
           Case Opr = 1                 && Indexacao
                Do Indexa 
*           Case Opr = 2                 && Aumento
*                Do Pe1500
*           Case Opr = 3                 && Restauracao
*                Do Pe1510  
           Case LastKey()=27            && Saida
                Restore Screen From Pe0001
                Exit
           EndCase
        EndDo
      
   Case LastKey()=27 
        Set Color To
        Clear All
        Clear
        Set Intensity Off
        Set Cursor On
        Quit
   EndCase
EndDo

Procedure Indexa
Save Screen To Tind
Mcon = 'N'
@ 10,10 To 12,26
@ 11,11 Say 'Confirma ? ' Get Mcon Valid Mcon $ 'SsNn'
Set Confirm On
Read
Set Confirm Off
If Upper(Mcon) = 'S'
   @ 11,11 Say '   Aguarde    '

   Use &Mest\Pe1000 Exclusive       && Estoque
   Index On Fcod To &Mest\Pe1000
   Index On Fdes To &Mest\Pe1alf

   Use &Mca\Pe0100 Exclusive        && Cadastro de Clientes
   Index On Fccl To &Mca\Pe0100
   Index On Fnoc To &Mca\Pe01alf

   Use &Mca\Pe0200 Exclusive        && Cadastro de Vendedores
   Index On Fcod To &Mca\Pe0200

   Use &Mped\Pe1200 Exclusive       && Pedidos
   Index On Fnor To &Mped\Pe1200
   Index On Dtos(Fdte)+Fncl To &MPed\Pe12dt

   Use &Mped\Pe1210 Exclusive       && Produtos/Pedidos
   Index On Fnor+Fcod To &Mped\Pe1210

   Use &Mped\Pe1300 Exclusive       && Contas a Pagar
   Index On Fcod To &Mped\Pe1300

   Use

EndIf
@ 11,11 Say 'Fim do Processo'
Inkey(0)
@ 10,10 Clear To 12,26
Restore Screen From Tind
Return


   
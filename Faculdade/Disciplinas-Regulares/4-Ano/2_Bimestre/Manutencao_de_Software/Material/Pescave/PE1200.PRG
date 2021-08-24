*----------------------------------------*
*           Sistema Pe1000               *
* Programa : Pe1200.PRG                  *
* Funcao   : Emissao do Pedidos          *
* Versao   : 1.0      Data : 28/08/93    *
* Autor    : Debora P. Diniz Tavares     *
*----------------------------------------*

Save Screen To Tela
*Set Delimiter To '[]'
*Set Delimiter On
*Set Intensity Off
Set Cursor On
Public Mtel,Mend,Mcid,Mesta,Mcep,Mdes,Total,Mqtd,Mqt

Select 1
Use &Mped\Pe1200 Index &Mped\Pe1200,&Mped\Pe12dt   && Arquivo de Pedidos
Select 2
Use &Mped\Pe1210 Index &Mped\Pe1210                && Produtos Pedidos
Select 3
Use &Mca\Pe0200 Index &Mca\Pe0200                  && Vendedores
Select 4
Use &Mca\Pe0100 Index &Mca\Pe01alf                 && Clientes
Select 6
Use &Mest\Pe1000 Index &Mest\Pe1000                && Produtos
Select 7
Use Pe12tmp Exclusive                              && Temporario Pedidos

* Preparacao para DBEDIT

Declare Af1[6],Af2[6],Af3[6],Af4[6]

Af1[1] = 'Fcod'
Af1[2] = 'Fdes'
Af1[3] = 'Fqtd'
Af1[4] = 'Fqcx'
Af1[5] = 'Ftcx'
Af1[6] = 'Fpre'
*Af1[7] = 'Fst1'

Af2[1] = 'XXXXXXXXXX'
Af2[2] = Replicate('X',40)
Af2[3] = '99999.99'
Af2[4] = '999'
Af2[5] = '999'
Af2[6] = '999999999.99'
*Af2[7] = 'X'

Af3[1] = 'Codigo'
Af3[2] = '      Descricao'
Af3[3] = 'Qtde.'
Af3[4] = 'Nro.Caixas'
Af3[5] = 'Tipo Cx.'
Af3[6] = 'Preco'
*Af3[7] = 'St.'

Af4[1] = 2
Af4[2] = 3
Af4[3] = 4
Af4[4] = 8
Af4[5] = 9
Af4[6] = 5
*Af4[7] = 6

Select 1
Go Bottom
Select 7
Replace Fnor With Str((Val(A->Fnor)+1),5)
Select 1
Go Top
Sair = 'N'
Do While .T.
   Do While .T.
*      Set Color To W
      @ 07,01 Clear To 17,79      && Tela
      @ 07,01 To 17,79
      @ 23,01 Clear To 23,79
      @ 08,03 Say 'Nro.Pedido:'
      @ 08,25 Say 'Cod.Vend.:'
      @ 08,60 Say 'Data :'
      @ 10,03 Say 'Cliente :'
      @ 10,55 Say 'Fone :'
      @ 12,03 Say 'Endereco :'
      @ 14,03 Say 'Cidade :'
      @ 14,35 Say 'Est.:'
      @ 14,48 Say 'CEP :'
      @ 16,03 Say 'Prazo :'
      @ 16,60 Say 'Tipo :'
*      Set Color To W+

      Select 8
      Use Pet121
      Copy Stru To Pet1210
      Use Pet1210 Exclusive                && Produtos/Pedidos temporario

      AltPr = 'N'    && Variavel para verificar se altera produtos

      Select 7
      If Lock_R(0)
      EndIf
      Replace Fcvd With '',Fncl With '',Fdte With Date(),;
              Fpre With '',Ftip With ''

      @ 08,15  Get Fnor Pict 'XXXXX'         && Nro. Pedido
      Read
      If LastKey() = 27     && Saida
         Sair = 'S'
         Exit
      EndIf
      Replace Fnor With Str((Val(Fnor)),5)
      @ 08,15 Say Fnor 
      Select 1
      Seek G->Fnor
      If Found()
         Mop = 'A'
         Select 7
         Replace Fcvd With A->Fcvd,Fncl With A->Fncl,Fdte With A->Fdte,;
                 Fpre With A->Fpre,Ftip With A->Ftip
      Else
         Mop = 'I'
      EndIf
      Cont = 'S'
      Do While .T.
         Select 7
         @ 08,36 Get Fcvd Pict 'XX'     && Codigo Vendedor
         Read
         If LastKey() = 27     && Volta para ler outro Nro.Pedido
            Cont = 'N'
            Exit
         EndIf
         Select 3
         Seek G->Fcvd
         If Found()
            @ 08,40 Say Fnom
            Exit
         Else
            @ 23,05 Say 'Vendedor Nao Cadastrado !'
            Tone (500,5)
            Do G5
         EndIf
      EndDo
      If Cont = 'S'
         Select 7
         @ 08,67 Get Fdte       && Data
         Read
         If LastKey() = 27
            Cont = 'N'      && Volta para ler novo Cod.Pedido
         EndIf
         If Cont = 'S'
            Do While .T.
               Select 7
               @ 10,12 Get Fncl   && Nome do Cliente
               Read
               If LastKey() = 27     && Volta para ler novo Cod.Pedido
                  Cont = 'N'
                  Exit
               EndIf
               Proc1 = 'N'
               @ 23,05 Say 'Procura no Arquivo ? ' Get Proc1 Valid Proc1 $ 'SsNn'
               Tone (500,5)
               Read
               @ 23,05 Say Space(60)
               If Upper(Proc1) = 'N'
                  @ 23,05 Say 'Deseja Cadastrar ? ' Get Proc1 Valid Proc1 $ 'SsNn'
                  Tone (500,5)
                  Read
                  @ 23,05 Say Space(60)
                  Mtel = Space(15)    && Pegando Informacoes apenas para
                  Mend = Space(30)    && o momento
                  Mcid = Space(20)
                  Mesta = '  '
                  Mcep = Space(9)
 
                  @ 10,61 Get Mtel 
                  @ 12,14 Get Mend 
                  @ 14,12 Get Mcid
                  @ 14,41 Get Mesta 
                  @ 14,54 Get Mcep
                  Read
                  If Upper(Proc1) = 'S'    && Gravando as Informacoes no Arq.
                     Select 4
                     Go Bottom
                     Mccl = Str((Val(Fccl)+1),5)
                     If Lock_Ap(0)
                     EndIf
                     Replace Fccl With Mccl,Fnoc With Upper(G->Fncl),;
                             Ftel With Mtel,Fend With Mend,Fmun With Mcid,;
                             Fest With Mesta,Fcep With Mcep
                  EndIf
                  Exit
               Else     && Procurando Cliente
                  Do Cliente
                  Exit
               EndIf
            EndDo     
            If Cont = 'S'
               If Mop = 'A'
                  @ 23,05 Say 'Altera Produtos? ' Get Altpr Valid Altpr $ 'SsNn'
                  Set Confirm On
                  Read
                  Set Confirm Off
                  @ 23,05 Say Space(60)
                  Select 2
                  Seek G->Fnor
                  If Found()                && Alterando Produtos
                     Do While .Not.Eof() .AND. G->Fnor = Fnor
                        Select 8
                        If Lock_Ap(0)
                        EndIf
                        Replace Fcod With B->Fcod,Fdes With B->Fdes,;
                                Fqtd With B->Fqtd,Fst1 With B->Fst1,;
                                Fnor With B->Fnor,Fpre With B->Fpre,;
                                Fqcx With B->Fqcx,Ftcx With B->Ftcx
                        Select 2
                        Skip
                     EndDo
                  EndIf
               EndIf
               Select 8
               Go Bottom
               Aux = Recno()
               For i = Aux To 5
                   Append Blank
                   Replace Fnor With G->Fnor
               Next
               Select 7
               If (Mop = 'A' .and. Upper(Altpr) = 'S') .or. Mop = 'I'
                  Total = 0
*                  Save Screen To Tpro
*                  Set Delimiter Off
                  Do Prod    && Produtos do Pedidos
*                  Set Delimiter On
*                  Set Delimiter To '[]'
*                  Restore Screen From Tpro
                  Select 7
*                  Mdes = 'N'
*                  @ 23,05 Say 'Deseja o Total ? ' Get Mdes Valid Mdes $ 'SsNn'
*                  Read
*                  @ 23,05 Say Space(60)
*                  If Upper(Mdes) = 'S'
                     @ 23,05 Say 'Total  :    ' 
                     @ 23,15 Say Total Pict '@e 99,999,999,999.99'
*                  EndIf
                  Mcon = 'N'
                  @ 23,40 Say 'Confere ? (S/N) ' Get MCon Valid Mcon $ 'SsNn'
                  Read
                  @ 23,05 Say Space(60)
                  If Upper(Mcon) = 'N'
                     Exit
                  EndIf 
               EndIf
               Select 7
               @ 16,10 Get Fpre
               @ 16,70 Get Ftip
               Read
               If LastKey() = 27   && Volta para ler novo Cod.Pedido
                  Exit
               EndIf
               Emi = 'N'
               Tone(500,5)
               @ 23,05 Say 'Emitir ? ' Get Emi Valid Emi $ 'SsNn'
               Read
               @ 23,05 Say Space(60)
               If Upper(Emi) = 'S'
                  Emi = ' '
                  @ 23,05 Say 'Bobina ou Papel (B/P) ? ' Get Emi Valid Emi $ 'BbPp'
                  Read
                  @ 23,05 Say Space(60)
                  If Upper(Emi) = 'P'
                     Do Pe1201      && Emissao em Papel Normal
                  Else
                     Do Pe1202      && Emissao em Bobina
                  EndIf
               EndIf

               Select 1      && Gravando Arq. Pedidos
               If Mop = 'I'
                  If Lock_Ap(0)
                  EndIf
               Else
                  Seek G->Fnor
                  If Lock_R(0)
                  EndIf 
               EndIf
               Replace Fcvd With G->Fcvd,Fncl With G->Fncl,Fdte With G->Fdte,;
                       Fcdp With G->Fcdp,Fpre With G->Fpre,Fdtv With G->Fdtv,;
                       Fnor With G->Fnor,Ftip With G->Ftip,Ftot With Total
               If Mop = 'I' .or. (Mop = 'A' .and. Upper(Altpr) = 'S')  && Produtos Contrato
                  Select 8
                  Go Top
                  Do While .Not. Eof()
                     If Fcod <> Space(10)
                        Select 2
                        Seek G->Fnor+H->Fcod
                        If Found()
                           If Lock_R(0)
                           EndIf
                           If H->Fst1 = '9'
                              Delete
                           Else
                              Replace Fqtd With H->Fqtd,Fpre With H->Fpre,;
                                      Fqcx With H->Fqcx,Ftcx With H->Ftcx,;
                                      Fst1 With H->Fst1,Fvlt With H->Fvlt,;
                                      Fdte With G->Fdte
                           EndIf
                        Else
                           If H->Fst1 <> '9'
                              If Lock_Ap(0)
                              EndIf
                              Replace Fnor With G->Fnor,Fcod With H->Fcod,;
                                      Fdes With H->Fdes,Fqtd With H->Fqtd,;
                                      Fqcx With H->Fqcx,Ftcx With H->Ftcx,;
                                      Fpre With H->Fpre,Fst1 With H->Fst1,;
                                      Fvlt With H->Fvlt,Fdte With G->Fdte
                           EndIf
                        EndIf
                        Select 6
                        Seek H->Fcod
                        If Lock_R(0)
                        EndIf
                        Replace Fqte With (Fqte-H->Fqtd)
                     EndIf
                     Select 8
                     Skip
                  EndDo
               EndIf
               Select 7
               Replace Fnor With Str((Val(A->Fnor)+1),5)
            EndIf
         EndIf
      EndIf
      Skip 0
      Unlock All
   EndDo
   If Sair = 'S'
      Exit
   EndIf
   Commit
   Unlock All
EndDo
Restore Screen From Tela
Set Cursor Off
*Set Intensity On
*Set Delimiter Off
*Set Color To W
Close Data
Return

*------------------------------------*
Procedure Cliente
*------------------------------------*

Save Screen To Tcli
Mcor = SetColor()
Set Color To W+/B+
Declare mat1[1],mat2[1],mat3[1]

@4,1 Clear To 16,60
@ 4,1 To 16,60

Mat1[1] = 'Fnoc'
Mat2[1] = Replicate('X',40)
Mat3[1] = 'Nome'+Space(28)

Mnoc = Upper(Trim(G->Fncl))
If Asc(Mnoc) > 32
   Select 4
   Seek Mnoc
EndIf
Choice = 'N'
If Choice='N'
   Dbedit(5,3,15,58,mat1,'f3',mat2,mat3)
   Skip 0
EndIf
Restore Screen From Tcli
Set Color To &Mcor
@ 10,12 Say G->Fncl
@ 10,61 Say Mtel
@ 12,14 Say Mend
@ 14,12 Say Mcid
@ 14,41 Say Mesta
@ 14,54 Say Mcep
Return

*-------------------------------------*
* fuction f3                          *
* funcao : Edicao de Dados-DBEDIT()   *
*-------------------------------------*
Function f3
Parameters Mode, Counter

Do Case
Case Mode=0.or.Mode=1.or.Mode=2.or.LastKey()=24.or.LastKey()=5
     Return (1)

Case Mode=3.or.LastKey()=27
      Return (0)

Case LastKey()=13
     Vaux = Fccl
     select 4
     Mtel = Ftel
     Mend = Fend
     Mcid = Fmun
     Mesta = Fest
     Mcep = Fcep
     Select 7
     Replace Fncl With D->Fnoc

     Keyboard=255
     Select 4
     Choice = 'S'
     Return (0)
OtherWise
      Return (1)
EndCase



*---------------------------------
Procedure Prod
*---------------------------------
Save Screen To TPro1
Mcor = SetColor()
Set Color To W+/B+
@ 17,07 Clear To 22,78
@ 17,07 To 22,78 
Np = 1
Saida = 'N'
Mlk = 0
Achou = 'S'
Select 8
Go Bottom
Aux = Recno()
Go Top
@ 0,73
@ 15,01 To 22,78
@ 23,01 To 22,78 
Do While Saida = 'N'
*   Set Color To W
   Dbedit(16,2,21,77,Af1,'F_Kc',Af2,Af3)
   @ 0,73
EndDo
Select 8
Go Top
Do While .Not. Eof()
   If Fst1 <> '9'
      Total = Total + Fvlt
   EndIf
   Skip
EndDo
Restore Screen From TPro1
Set Color To &Mcor
Return

*-------------------------------------*
* Funcao F_kc                         *
*-------------------------------------*
       
Function F_kc
Parameters Mode, Counter
Mlk = LastKey()

Do Case
Case Mlk = 27
     Saida = 'S'
     Return (0)

Case Mlk = 18.OR.Mlk = 5.OR.Mlk = 24.OR.Mlk = 3.OR.mode = 3.OR.mode = 1
     @ 0,73 Say Recno() Pict '99'
     Return(1)

Case Mlk = 13 .OR. Mlk >= 32
     Mcol = col()
     Mrol = row()
     @ 0,73 Say Recno() Pict '99'
     Mq1 = Iif(Counter > 0,Af4[Counter],0)
     If Mlk <> 13
        Keyboard Chr(Mlk)
     EndIf
     Vaux = Field(mq1)
     If Counter <> 2
        @ Mrol,Mcol Get &Vaux 
     Else
        @ Mrol,Mcol Say &Vaux 
     EndIf
     Set Cursor On
     Read
     Set Cursor Off
     If Counter = 1
        Mcod = &Vaux
        Select 6
        Seek Mcod
        If .Not. Found()
           Tone(500,5)
        Else
           Mqtd = Fqte
           Select 8
           If Lock_R(0)
           EndIf
           Replace Fdes With F->Fdes,Fpre With F->Fpre
        EndIf
        Select 8
     EndIf
     If Counter = 3
        Mqt = &Vaux
        If Mqtd < Mqt
           Mc = SetColor()
           Tone (500,5)
           @ 23,05 Say 'Nao existe quantidade suficiente no estoque'
           Inkey(0)
           Set Color To N/W,W/N
           @ 23,01 Clear To 23,79
           Set Color To &Mc
        Endif
     EndIf
     If Counter = 6
        Select 8
        If Lock_R(0)
        EndIf
        Replace Fvlt With Fpre*Fqtd
        If Recno() >= Aux .AND. Recno() < 10
           Append Blank
           Replace Fnor With G->Fnor
        EndIf
        Keyboard Chr(24)+Chr(1)+Chr(19)+Chr(19)+Chr(19)+Chr(19)+Chr(19)
     Else
        Keyboard Chr(4)
    EndIf
    Return (1)
 OtherWise
    Return (1)
 EndCase



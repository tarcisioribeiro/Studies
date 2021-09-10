*----------------------------------------*
*           Sistema Pe1000               *
* Programa : Pe1205.PRG                  *
* Funcao   : Alteracao de Pedidos        *
* Versao   : 1.0      Data : 28/08/93    *
* Autor    : Debora P. Diniz Tavares     *
*----------------------------------------*

Save Screen To Tela
Set Cursor On
Public Mtel,Mend,Mcid,Mesta,Mcep,Mdes,Total,Mqtd,Mqt

Select 1
Use &Mped\Pe1200 Index &Mped\Pe1200,&Mped\Pe12dt   && Arquivo de Pedidos
Select 2
Use &Mped\Pe1210 Index &Mped\Pe1210                && Produtos Pedidos
Select 3
Use &Mca\Pe0200 Index &Mca\Pe0200                  && Vendedores
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

Select 7
Replace Fnor With ''
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
      If !Found()
         Tone (500,5)
         @ 23,05 Say 'Pedido nao existe !!! '
         Do G5
      Else
         Select 7
         Replace Fcvd With A->Fcvd,Fncl With A->Fncl,Fdte With A->Fdte,;
                 Fpre With A->Fpre,Ftip With A->Ftip
         @ 08,36 Say Fcvd Pict 'XX'     && Codigo Vendedor
         Select 3
         Seek G->Fcvd
         If Found()
            @ 08,40 Say Fnom
         Else
            @ 23,05 Say 'Vendedor Nao Cadastrado !'
            Tone (500,5)
            Do G5
         EndIf
         Select 7
         @ 08,67 Say Fdte       && Data
         @ 10,12 Say Fncl       && Nome do Cliente

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
               Select 6
               Seek B->Fcod
               If Lock_R(0)
               EndIf
               Replace Fqte With (Fqte+B->Fqtd)
               Select 2
               Skip
            EndDo
         EndIf
         Total = 0
         Do Prod1    && Produtos do Pedidos
         Select 7
         @ 23,05 Say 'Total  :    ' 
         @ 23,15 Say Total Pict '@e 99,999,999,999.99'
         Mcon = 'N'
         @ 23,40 Say 'Confere ? (S/N) ' Get MCon Valid Mcon $ 'SsNn'
         Read
         @ 23,05 Say Space(60)
         If Upper(Mcon) = 'N'
            Exit
         EndIf 

         Select 1      && Gravando Arq. Pedidos
         Seek G->Fnor
         If Lock_R(0)
         EndIf 
         Replace Ftot With Total

         Select 8
         Go Top
         Do While .Not. Eof()
            If Fcod <> Space(10)
               Select 2
               Seek G->Fnor+H->Fcod
               If Found()
                  If Lock_R(0)
                  EndIf
                  Replace Fqtd With H->Fqtd,Fpre With H->Fpre,;
                          Fqcx With H->Fqcx,Ftcx With H->Ftcx,;
                          Fst1 With H->Fst1,Fvlt With H->Fvlt
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
         Select 7
         Replace Fnor With ''
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
Close Data
Return

*---------------------------------
Procedure Prod1
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
   Dbedit(16,2,21,77,Af1,'F_Kc1',Af2,Af3)
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
* Funcao F_kc1                        *
*-------------------------------------*
       
Function F_kc1
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
     If Counter <> 1 .And. Counter <> 2
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
        Mqtd = Fqte
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
        Select 8
        If Lock_R(0)
        EndIf
        Replace Fvlt With Fpre*Fqtd
     EndIf
     If Counter = 6
        Keyboard Chr(24)+Chr(1)+Chr(19)+Chr(19)+Chr(19)+Chr(19)+Chr(19)
     Else
        Keyboard Chr(4)
    EndIf
    Return (1)
 OtherWise
    Return (1)
 EndCase



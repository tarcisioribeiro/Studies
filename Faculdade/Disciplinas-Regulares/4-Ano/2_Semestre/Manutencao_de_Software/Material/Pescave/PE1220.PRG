*----------------------------------------*
*           Sistema Pe1000               *
* Programa : Pe1220.PRG                  *
* Funcao   : Entrada e Saida de Produtos *
*            Digitacao                   *
* Versao   : 1.0      Data : 28/08/93    *
* Autor    : Debora P. Diniz Tavares     *
*----------------------------------------*

Save Screen To Tela
*Set Delimiter To '[]'
*Set Delimiter On
*Set Intensity Off
Set Cursor On
Public Mqtd,Mqt,Mst

Select 1
Use &Mest\Pe1000 Index &Mest\Pe1000   && Produtos
Select 2
Use Pe1220 Exclusive                  && Movimento

* Preparacao para DBEDIT

Declare Af1[6],Af2[6],Af3[6],Af4[6]

Af1[1] = 'Fcod'
Af1[2] = 'Fdes'
Af1[3] = 'Fqtd'
Af1[4] = 'Fpre'
Af1[5] = 'Fpco'
Af1[6] = 'Fst1'

Af2[1] = 'XXXXXXXXXX'
Af2[2] = Replicate('X',40)
Af2[3] = '99999.99'
Af2[4] = '999999999.99'
Af2[5] = '999999999.99'
Af2[6] = 'X'

Af3[1] = 'Codigo'
Af3[2] = '      Descricao'
Af3[3] = 'Qtde.'
Af3[4] = 'P.Venda'
Af3[5] = 'P.Compra'
Af3[6] = 'St.'

Af4[1] = 1
Af4[2] = 2
Af4[3] = 3
Af4[4] = 4
Af4[5] = 6
Af4[6] = 5

Save Screen To Tmov
Mcor = SetColor()
Set Color To W+/B+
@ 10,01 Clear To 22,78
@ 10,01 To 22,78 
@ 23,01 Clear To 23,79
Saida = 'N'
Mlk = 0
Achou = 'S'
Select 2
If Eof()
   Vazio = 'V'
Else
   Vazio = 'F'
EndIf
Go Bottom
Aux = Recno()
For i = Aux To 11
    Append Blank
Next
If Vazio = 'V'
   Go Top
ELse
   Go Aux
EndIf
@ 0,73
Do While Saida = 'N'
*   Set Color To W
   Dbedit(11,2,21,77,Af1,'F_Km',Af2,Af3)
   @ 0,73
EndDo
Select 2
Go Top
Do While .Not. Eof()
   If Fcod = Space (10)
      Dele
   EndIf
   Skip
EndDo
Pack
Restore Screen From TMov
Set Color To &Mcor
Close Data
Set Cursor Off
Return

*-------------------------------------*
* Funcao F_km                         *
*-------------------------------------*
       
Function F_km
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
        Select 1
        Seek Mcod
        If .Not. Found()
           Tone(500,5)
        Else
           Mqtd = Fqte
           Select 2
           Replace Fdes With A->Fdes,Fpre With A->Fpre,Fpco With A->Fpco
        EndIf
        Select 2
     EndIf
     If Counter = 3
        Mqt = &Vaux
     EndIf
     If Counter = 6
        St = &Vaux
        If St = '9' .And. Mqtd < Mqt
           Mc = SetColor()
           Tone (500,5)
           @ 23,05 Say 'Nao existe quantidade suficiente no estoque'
           Inkey(0)
           Set Color To N/W,W/N
           @ 23,01 Clear To 23,79
           Set Color To &Mc
        EndIf
        If Recno() >= Aux
           Append Blank
        EndIf
        Keyboard Chr(24)+Chr(1)+Chr(19)+Chr(19)   && +Chr(19)+Chr(19)+Chr(19)
     Else
        Keyboard Chr(4)
    EndIf
    Return (1)
 OtherWise
    Return (1)
 EndCase



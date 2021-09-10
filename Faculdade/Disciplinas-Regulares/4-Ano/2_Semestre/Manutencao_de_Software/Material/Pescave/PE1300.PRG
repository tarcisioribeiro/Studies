*----------------------------------------*
*           Sistema Pe1000               *
* Programa : Pe1300.PRG                  *
* Funcao   : Digitacao de Duplicatas     *
*            Contas a Pagar              *
* Versao   : 1.0      Data : 28/08/93    *
* Autor    : Debora P. Diniz Tavares     *
*----------------------------------------*

Save Screen To Tela
Set Cursor On
Select 1
Use &Mped\Pe1300 Index &Mped\Pe1300   && Contas a Pagar
Select 2
Use Pe13tmp Exclusive                  && Temporario

Public Mst,Mcod
* Preparacao para DBEDIT

Declare Af1[5],Af2[5],Af3[5],Af4[5]

Af1[1] = 'Fst1'
Af1[2] = 'Fcod'
Af1[3] = 'Ffor'
Af1[4] = 'Fdat'
Af1[5] = 'Fval'

Af2[1] = 'X'
Af2[2] = 'XXXXX'
Af2[3] = Replicate('X',40)
Af2[4] = Ctod('  /  /  ')
Af2[5] = '999999999.99'

Af3[1] = 'St.'
Af3[2] = 'Codigo'
Af3[3] = '      Fornecedor'
Af3[4] = 'Data'
Af3[5] = 'Valor'

Af4[1] = 5
Af4[2] = 1
Af4[3] = 2
Af4[4] = 3
Af4[5] = 4

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
Else
   Go Aux
EndIf
@ 0,73
Do While Saida = 'N'
*   Set Color To W
   Dbedit(11,2,21,77,Af1,'F_Km1',Af2,Af3)
   @ 0,73
EndDo
Go Top
Do While .Not. Eof()
   If Fcod = Space (5)
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
* Funcao F_km1                        *
*-------------------------------------*
       
Function F_km1
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
     @ Mrol,Mcol Get &Vaux 
     Set Cursor On
     Read
     Set Cursor Off
     If Counter = 1
        Mst = &Vaux
     EndIf
     If Counter = 2 .And. Mst = '9'
        Mcod = &Vaux
        Select 1
        Seek Mcod
        If !Found()
           Tone(500,5)
        Else
           Select 2
           Replace Ffor With A->Ffor,Fdat With A->Fdat,Fval With A->Fval
        EndIf
        Select 2
     EndIf
     If Counter = 5
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
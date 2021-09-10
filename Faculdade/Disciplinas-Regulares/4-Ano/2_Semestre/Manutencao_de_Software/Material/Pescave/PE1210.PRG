*----------------------------------------*
*           Sistema Pe1000               *
* Programa : Pe1210.PRG                  *
* Funcao   : Baixa de Pedidos            *
* Versao   : 1.0      Data : 28/08/93    *
* Autor    : Debora P. Diniz Tavares     *
*----------------------------------------*

Save Screen To Tela
Set Cursor On

Select 1
Use &Mped\Pe1200 Index &Mped\Pe12dt,&Mped\Pe1200   && Arquivo de Pedidos
Select 2
Use &mca\Pe0100 Index &mca\Pe0100

@ 14,13 Clear To 16,23
@ 14,25 Clear To 16,35
@ 16,20 Clear To 18,27
@ 14,13 To 16,23
@ 14,25 To 16,35
@ 16,20 To 18,27
@ 14,14 Say 'Inicio'
@ 14,26 Say 'Fim'
@ 16,21 Say 'Codigo'
Mini = Date()
Mfim = Date()
Mcod = Space(5)
@ 15,14 Get Mini
@ 15,26 Get Mfim
@ 17,21 Get Mcod
Read
Mcod = Str(Val(Mcod),5)
@ 17,21 Say Mcod
Conf = 'N'
Tone(500,5)
@ 23,05 Say 'Confirma ? ' Get Conf Valid Conf $'SsNn'
Read
If Upper(Conf) = 'S'
   Select 2
   Seek Mcod
   If !Found()
      Mnom = Space(40)
   Else
      Mnom = Fnoc
   EndIf
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
         If Fbai <> 'B'.And. Fncl = Mnom
            If Lock_R(0)
            EndIf
            Replace Fbai With 'B'
         EndIf
         Skip
      EndDo
   EndIf
EndIf
Commit
Unlock All
Restore Screen From Tela
Set Cursor Off
Close Data
Return

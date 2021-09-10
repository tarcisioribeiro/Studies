*----------------------------------------*
*           Sistema Pe1000               *
* Programa : Pe1310.PRG                  *
* Funcao   : Atualizacao da Digitacao    *
* Versao   : 1.0      Data : 28/08/93    *
* Autor    : Debora P. Diniz Tavares     *
*----------------------------------------*

Save Screen To Tela
Set Cursor On

Select 1
Use &Mped\Pe1300 Index &Mped\Pe1300   && Contas a Pagar
Select 2
Use Pe13tmp Exclusive                  && Temporario

Save Screen To Tmov
Mcor = SetColor()
Set Color To W+/B+
@ 10,20 Clear To 12,37
@ 10,20 To 12,37
@ 11,21 Say 'Atualizando...'
Select 2
Do While .Not. Eof()
   If Fcod <> Space(5)
      If Fst1 = '1'
         Select 1
         If Lock_Ap(0)
         EndIf
      Else
         Select 1
         Seek B->Fcod
         If Lock_R(0)
         EndIf
      EndIf
      Replace Fcod With B->Fcod,Ffor With B->Ffor,Fdat With B->Fdat,;
              Fval With B->Fval,Fst1 With B->Fst1
   EndIf
   Select 2
   Skip
EndDo
Select 2
Zap
@ 11,21 Say 'Fim do Processo '
Inkey(0)
Restore Screen From TMov
Set Color To &Mcor
Close Data
Set Cursor Off
Return

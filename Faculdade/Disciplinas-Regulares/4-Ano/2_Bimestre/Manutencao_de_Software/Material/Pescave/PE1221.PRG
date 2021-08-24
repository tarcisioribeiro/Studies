*----------------------------------------*
*           Sistema Pe1000               *
* Programa : Pe1221.PRG                  *
* Funcao   : Entrada e Saida de Produtos *
*            Atualizacao do Arquivo      *
* Versao   : 1.0      Data : 28/08/93    *
* Autor    : Debora P. Diniz Tavares     *
*----------------------------------------*

Save Screen To Tela
*Set Delimiter To '[]'
*Set Delimiter On
*Set Intensity Off
Set Cursor On

Select 1
Use &Mest\Pe1000 Index &Mest\Pe1000   && Produtos
Select 2
Use Pe1220 Exclusive                  && Movimento

Save Screen To Tmov
Mcor = SetColor()
Set Color To W+/B+
@ 10,20 Clear To 12,37
@ 10,20 To 12,37
@ 11,21 Say 'Atualizando...'
Select 2
Do While .Not. Eof()
   If Fcod <> Space(10)
      Select 1
      Seek B->Fcod
      If Found()
         If Lock_R(0)
         EndIf
         Replace Fqte With IIf(B->Fst1='1',Fqte+B->Fqtd,Fqte-B->Fqtd),;
                 Fpre With IIf(B->Fst1 = '1',B->Fpre,Fpre),;
                 Fpco With IIf(B->Fst1 = '1',B->Fpco,Fpco)
      EndIf
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
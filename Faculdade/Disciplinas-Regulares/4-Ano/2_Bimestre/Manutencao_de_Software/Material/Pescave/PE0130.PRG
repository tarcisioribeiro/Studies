*-------------------------------------*
* Programa : Pe0130                   *
* Funcao   : Consulta Cliente         *
* Versao   : 1.0      Data : 28/08/93 *
* Autora   : Debora P. Diniz Tavares  *
*-------------------------------------*
Save Screen To Tela
*Set Delimiter To '[]'
*Set Delimiter On
*Set Intensity Off
Set Cursor On
@ 23,01 Clear To 23,79

Use &mca\Pe0100 index &mca\Pe0100

Do While LastKey() <> 27
  Vaux = Space(5)

* Codigo Cliente
   @ 07,24 Clear To 09,37
   @ 07,24 To 09,37
   @ 07,25 Say 'Cod_Cliente'

* Dados Cliente
   @ 12,01 Clear To 18,79
   @ 12,01 To 18,79
   @ 12,29 Say 'Dados do Cliente'
   @ 13,02 Say 'Cliente:'
   @ 14,02 Say 'Endereco:'
   @ 14,55 Say 'Fone:'
   @ 15,02 Say 'CEP:'
   @ 15,20 Say 'Munic:'
   @ 15,60 Say 'Est.:'
   @ 16,02 Say 'CGC/CPF:'
   @ 16,32 Say 'Inscr/Rg:'
   @ 17,55 Say 'Data Cad:'

   @ 08,27 Get Vaux Picture 'XXXXX'
*   Set Color To W+
   Read
   Vaux = Str((Val(Vaux)),5)
   @ 08,27 Say Vaux
*   Set Color To W
   If LastKey() <> 27
      Seek Vaux
      If Found()
*         Set Color To W+
         Mcgc = Fcgc+'/'+Fcg2+'-'+Fcg3
         @ 13,11 Say Fnoc
         @ 14,11 Say Fend
         @ 14,60 Say Ftel
         @ 15,07 Say Fcep Picture 'XXXXX-XXX'
         @ 15,27 Say Fmun
         @ 15,66 Say Fest
         @ 16,11 Say Mcgc Picture 'XX.XXX.XXX/XXXX-XX'
         @ 16,42 Say Fins
         @ 17,64 Say Femi
*         Set Color To W
      Else
*         Set Color To W+
         @ 23,05 Say '** Cliente nao cadastrado **'
*         Set Color To W
         tone(500,5)
      EndIf
      Do G5
   EndIf
EndDo
*Set Color To W
Set Cursor Off
*Set Intensity On
Unlock All
Restore Screen From Tela
Set Delimiter Off
Close Data
Return

*-----------------------------------------*
* Programa : Pe0110                       *
* Funcao   : Inclusao/Alteracao Clientes  *
* Versao   : 1.0        Data : 28/08/93   *
* Autora   : Debora P. Diniz Tavares      *
*-----------------------------------------*
Save Screen To Tela
*Set Delimiter To '[]'
*Set Delimiter On
*Set Intensity Off
Set Cursor On
@ 23,01 Clear To 23,79

Mnoc = Space(40)
Mcgc = Space(19)

Select 1
Use &mca\Pe0100 Index &mca\Pe0100,&Mca\Pe01alf
Go Bottom
Mccl = Fccl
Mccl = Str((Val(Mccl)+1),5)
Go Top
Select 2
Use Pe01tmp Exclusive

Do While LastKey() <> 27
   Do While LastKey() <> 27

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

      Select 2
      If Lock_R(0)
      EndIf
      Replace Fnoc With '',Fend With '',Fcep With '',Fmun With '',;
              Fest With '',Fins With '',Fcgc With '',Fcg2 With '',;
              Fcg3 With '',Ftel With '',Femi With Date()

      @ 08,27 Get Mccl Pict 'XXXXX'
*      Set Color To W+
      Read
      Mccl = Str((Val(Mccl)),5)
      @ 08,27 Say Mccl
*      Set Color To W
      If LastKey() <> 27
         Replace Fccl With Mccl
         If Fccl <> Space(5)
            Select 1
            Seek B->Fccl
            If Found()
               Mnoc = Fnoc
               Mcgc = Fcgc+'/'+Fcg2+'-'+Fcg3
               Select 2
               If Lock_R(0)
               EndIf
               Replace Fnoc With A->Fnoc,Fend With A->Fend,Fcep With A->Fcep,;
                       Fmun With A->Fmun,Fest With A->Fest,Fins With A->Fins,;
                       Fcgc With A->Fcgc,;
                       Femi With A->Femi,Ftel With A->Ftel,;
                       Fcg2 With A->Fcg2,Fcg3 With A->Fcg3
               IncAlt = 'A'
            Else
               Mcgc = Space(18)
               IncAlt = 'I'
            EndIf
            Select 2
            @ 13,11 Get Fnoc
            @ 14,11 Get Fend
            @ 14,60 Get Ftel
            @ 15,07 Get Fcep Picture 'XXXXX-XXX'
            @ 15,27 Get Fmun
            @ 15,66 Get Fest
            @ 16,11 Get Mcgc Picture 'XX.XXX.XXX/XXXX-XX'
            @ 16,42 Get Fins
            @ 17,64 Get Femi
*            Set Color To W+
            Read
*            Set Color To W
            Replace Fcgc With SubStr(Mcgc,1,10),Fcg2 With SubStr(Mcgc,12,4),;
                    Fcg3 With SubStr(Mcgc,17,2)

            If Fnoc <> Space(40)
               If IncAlt ='I'
                  Select 1
                  If Lock_Ap(0)
                  EndIf
               Else
                  Select 1
                  If Lock_R(0)
                  EndIf
               EndIf
               Select 1
               Replace Fnoc With Upper(B->Fnoc),Fend With B->Fend,;
                       Fcep With B->Fcep,Fmun With B->Fmun,Fest With B->Fest,;
                       Fcgc With B->Fcgc,Fcg2 With B->Fcg2,Fcg3 With B->Fcg3,;
                       Fins With B->Fins,Fccl With B->Fccl,Ftel With B->Ftel,;
                       Femi With B->Femi
               Skip 0
               Mccl = Str((Val(Mccl)+1),5)
            EndIf
         EndIf
      EndIf
      UnLock
   EndDo
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
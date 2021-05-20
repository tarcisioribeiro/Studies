programa
{
	
	funcao inicio()
	{
		
		inteiro nro, contador
		inteiro soma = 0
		
		escreva("Digite um número inteiro: ")
		leia(nro)

		se (nro >= 0) 
		{
			para (contador = 0; contador <= nro; contador ++)
		{
			se (contador % 2 == 1 e contador % 3 == 0)
				{
					soma = soma + contador
				}
		}
		}
		
		senao 
		{
			escreva("Número não reconhecido.")
		}
			
		escreva("O valor da soma é de ", soma)
	}
}

programa
{
	funcao inicio()
	{
		real salario
		real novosalario = 0.0
		escreva("Informe o seu salário: ")
		leia(salario)
	
		se (salario >= 0 e salario <= 500)
		{
			novosalario = salario * 1.2
		}
		se (salario > 500)
		{
			novosalario = salario * 1.1	
		}
		
		senao enquanto (salario < 0)
		{
			escreva("Valor válido. Informe o seu salário: ")
			leia(salario)

			se (salario >= 0 e salario <= 500)
			{
				novosalario = salario * 1.2
			}
			se (salario > 500)
			{
				novosalario = salario * 1.1	
			}
		}
		
		escreva("O seu novo salário é de R$ ", novosalario)
	}	
}
programa
{
	
	funcao inicio()
	{
		real custofabrica = 0.0
		real custofinal = 0.0
		real pctdistribuidor, impostos

		escreva("Informe o custo de fábrica: ")
		leia(custofabrica)

		se (custofabrica >= 0)
		{
			pctdistribuidor = custofabrica * 0.28
			impostos = custofabrica * 0.45
			custofinal = custofabrica + pctdistribuidor + impostos
		}
		senao enquanto (custofabrica < 0)
		{
			escreva("Valor inválido. Informe o custo de fábrica: ")
			leia(custofabrica)
			se (custofabrica >= 0)
			{
				pctdistribuidor = custofabrica * 0.28
				impostos = custofabrica * 0.45
				custofinal = custofabrica + pctdistribuidor + impostos
			}
			
		}

		escreva("O custo final do veículo é R$ ", custofinal)
	}
}
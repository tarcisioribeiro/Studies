programa
{
	
	funcao inicio()
	{
		inteiro id, anonascimento, anoingresso
		inteiro idade, tempotrabalho = 0
		escreva("Informe o seu número: ")
		leia(id)
		escreva("Informe o seu ano de nascimento: ")
		leia(anonascimento)
		escreva("Informe o seu ano de ingresso na empresa: ")
		leia(anoingresso)

		idade = 2021 - anonascimento
		tempotrabalho = 2021 - anoingresso
		
		se (idade >= 65 ou tempotrabalho >= 30 ou (idade >= 60 e tempotrabalho >= 25))
		{
			escreva("Idade: ", idade, " - Tempo de Trabalho: ", tempotrabalho, " - Status: Requerer aposentadoria.")
		}
		se (idade < 0 ou tempotrabalho < 0 ou id < 0)
		{
			escreva("Informe dados válidos.")	
		}
		senao
		{
			escreva("Idade: ", idade, "- Tempo de Trabalho: ", tempotrabalho, " Status: Não requerer.")	
		}
	}
}

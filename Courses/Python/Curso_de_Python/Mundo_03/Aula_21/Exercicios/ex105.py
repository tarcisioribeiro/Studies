def notas(*valores, sit=True):


    """
    -> Função para analisar notas e situações de vários alunos.
    :param valores: Uma ou mais notas dos alunos (aceita várias)
    :param sit: Valor opcional, indicando se deve ou não adicionar a situação
    :return: Dicionário com várias informações sobre a situação da turma.
    """

    dicionario = {}
    dicionario['total'] = len(valores)
    
    soma = cont = 0

    maior = menor = valores[0]

    for i in range(0, len(valores)):
        if valores[i] > maior:
            maior = valores[i]
        elif valores[i] < menor:
            menor = valores[i]
        soma += valores[i]
        cont += 1

    media = soma / cont

    dicionario['maior'] = maior
    dicionario['menor'] = menor
    dicionario['média'] = media

    if sit == True:
        if media >= 7:
            dicionario['situação'] = 'BOA'
        elif media >= 5:
            dicionario['situação'] = 'RAZOÁVEL'
        else:
            dicionario['situação'] = 'RUIM'

    return dicionario
    
resp = notas(4.5, 4, 6.5, sit=True)
print(resp)
help(notas)
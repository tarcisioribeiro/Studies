

def metade(valor, formatado=True):
    calculado = valor / 2
    if formatado == True:
        valor_formatado = moeda(calculado)
        return valor_formatado
    elif formatado == False:
        return calculado

def dobro(valor, formatado=True):
    calculado = valor * 2
    if formatado == True:
        valor_formatado = moeda(calculado)
        return valor_formatado
    elif formatado == False:
        return calculado

def aumentar(valor, pct, formatado=True):
    total = 1 + (pct / 100)
    calculado = valor * total
    if formatado == True:
        valor_formatado = moeda(calculado)
        return valor_formatado
    elif formatado == False:
        return calculado

def diminuir(valor, pct, formatado=True):
    total = 1 - (pct / 100)
    calculado = valor * total
    if formatado == True:
        valor_formatado = moeda(calculado)
        return valor_formatado
    elif formatado == False:
        return calculado

def moeda(valor):
    valor_formatado = str(valor)
    valor_formatado.replace('.', ',')
    valor_formatado = 'R$ ' + valor_formatado + '0'
    return valor_formatado

def resumo(valor, aumento, reducao):

    frase = 'RESUMO DO VALOR'
    tam = len(frase) + 12
    print('-' * tam)
    print('    ', frase, '    ')
    print('-' * tam)
    print(f'Preço analisado: {moeda(valor)}')
    print(f'Dobro do preço: {dobro(valor, True)}')
    print(f'Metade do preço: {metade(valor, True)}')
    print(f'{aumento}% de aumento: {aumentar(valor, aumento, True)}')
    print(f'{reducao}% de aumento: {diminuir(valor, reducao, True)}')
    print('-' * tam)
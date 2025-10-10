

def metade(valor, format=False):
    calculado = valor / 2
    return calculado if format is False else moeda(calculado)

def dobro(valor, format=False):
    calculado = valor * 2
    return calculado if format is False else moeda(calculado)

def aumentar(valor, pct, format=False):
    total = 1 + (pct / 100)
    calculado = valor * total
    return calculado if format is False else moeda(calculado)

def diminuir(valor, pct, format=False):
    total = 1 - (pct / 100)
    calculado = valor * total
    return calculado if format is False else moeda(calculado)

def moeda(valor=0, moeda='R$ '):
    return f'{moeda}{valor:>.2f}'.replace('.', ',')

def resumo(valor, aumento, reducao):
    print('-' * 30)
    print('RESUMO DO VALOR'.center(30))
    print('-' * 30)
    print(f'Preço analisado: \t{moeda(valor)}')
    print(f'Dobro do preço: \t{dobro(valor, True)}')
    print(f'Metade do preço: \t{metade(valor, True)}')
    print(f'{aumento}% de aumento: \t{aumentar(valor, aumento, True)}')
    print(f'{reducao}% de aumento: \t{diminuir(valor, reducao, True)}')
    print('-' * 30)
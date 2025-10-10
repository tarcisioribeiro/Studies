

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
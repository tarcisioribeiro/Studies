

def metade(valor):
    return valor / 2

def dobro(valor):
    return valor * 2

def aumentar(valor, pct):
    total = 1 + (pct / 100)
    return valor * total

def diminuir(valor, pct):
    total = 1 - (pct / 100)
    return valor * total

def moeda(valor=0, moeda='R$ '):
    return f'{moeda}{valor:>.2f}'.replace('.', ',')
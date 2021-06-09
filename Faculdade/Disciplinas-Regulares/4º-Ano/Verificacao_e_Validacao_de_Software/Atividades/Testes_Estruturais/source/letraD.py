contador = 0
soma = 0
nro = int(input('Digite um número inteiro: '))

if nro >= 0:
    for contador in range(0, nro):
        if (contador % 2 == 1) and (contador % 3 == 0):
            soma += contador

elif nro < 0:
    while nro < 0:
        nro = int(input('Número inválido. Digite um número inteiro: '))
        if nro >= 0:
            for contador in range(0, nro):
                if (contador % 2 == 1) and (contador % 3 == 0):
                    soma += contador

print('O valor da soma é {}.'.format(soma))

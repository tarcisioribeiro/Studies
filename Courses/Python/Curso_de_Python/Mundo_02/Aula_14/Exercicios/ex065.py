print()
n = 0
tot = 0
soma = 0
media = 0
maior = 0
menor = 0
opc = ''
while (opc != 'N'):
    n = int(input('Informe um número: '))
    tot += 1
    soma += n
    if(n > maior):
        maior = n
    else:
        menor = n
    opc = str(input('Deseja continuar: [S/N]: ')).upper()
print()
media = soma / tot
print('O maior número digitado foi {} e o menor foi {}. A média dos números é igual a {}.'.format(maior, menor, media))
print()
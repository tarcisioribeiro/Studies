print()
n = 0
cont = 0
soma = 0
while (n != 999):
    n = int(input('Informe um número: [999 para parar] '))
    cont += 1
    soma += n
print()
print('Foram digitados {} números e a soma entre eles é de {}.'.format(
    cont, (soma - 999)))
print()

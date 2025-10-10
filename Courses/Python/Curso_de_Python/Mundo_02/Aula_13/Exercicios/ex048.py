# Soma de números ímpares divisíveis por 3 entre 1 e 500
print()
s = 0
for c in range(1, 500):
    if(c % 3 == 0):
        s += c
print('A soma dos números divisíveis por 3 que estão entre 1 e 500 é igual a: {}.'.format(s))
print()

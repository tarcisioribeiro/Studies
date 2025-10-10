# Tabuada com laço de iteração
print()
n = int(input('Informe um número de 1 a 10 para saber sua tabuada: '))
print()
for c in range(1, 11):
    print('{} x {} = {}.'.format(c, n, (c * n)))
print()

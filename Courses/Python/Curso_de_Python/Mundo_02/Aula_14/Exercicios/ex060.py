from time import sleep
print()
n = int(input('Digite um número para calcular o seu fatorial: '))
sleep(1)
fatorial = n
fator = 1
print()
print('Calculando {}! = '.format(n), end='')
while (fatorial > 0):
    print('{}'.format(fatorial), end='')
    print(' x ' if fatorial > 1 else ' = ', end='')
    fator *= fatorial
    fatorial -= 1
print('{}'.format(fator))
print()

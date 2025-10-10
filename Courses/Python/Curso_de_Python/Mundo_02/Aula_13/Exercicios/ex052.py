# Verificador de número primo com estrutura de decisão e laço de iteração

print()
n = int(input('Informe um número inteiro: '))
print()
cont = 0
for c in range(1, n + 1):
    if(n % c == 0):
        print('\033[33m', end='')
        cont += 1
    else:
        print('\033[31m', end='')
    print('{} '.format(c), end='')
print()
if(cont == 2):
    print('\n\033[mO número {} foi divisível {} vezes, ele é um número primo.'.format(
        n, cont))
    print()
else:
    print('\n\033[mO número {} foi divisível {} vezes, ele não é um número primo.'.format(
        n, cont))
    print()

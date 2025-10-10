# Soma de valores pares utilizando laço e estrutura de decisão
print()
s = 0
for c in range(0, 6):
    n = int(input('Informe um número inteiro: '))
    if(n % 2 == 0):
        s += n
print()
print('A soma dos valores pares na sequência é de {}.'.format(s))
print()

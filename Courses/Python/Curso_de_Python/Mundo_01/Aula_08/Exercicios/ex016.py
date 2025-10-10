# Corrigido

# Bloco de importação
from math import trunc

print('Exercício 016')
print()
# Bloco de entrada
num = float(input('Informe um número real: '))

# Bloco de cálculo
inteiro = trunc(num)

# Bloco de saída
print('A porção inteira de {} é igual a {}.'.format(num, inteiro))

# Bloco de descarte
'''num = float(input('Informe um número qualquer: '))
print('O valor digitado foi {} e sua porção inteira é {}.'.format(num, int(num)))'''

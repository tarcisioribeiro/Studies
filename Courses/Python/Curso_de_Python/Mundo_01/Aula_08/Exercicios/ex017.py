# Corrigido

# Bloco de importação
from math import hypot
print('Exercício 017')
print()

# Bloco de entrada
co = float(input('Informe o comprimento do cateto oposto: '))
print()
ca = float(input('Informe o comprimento do cateto adjacente: '))

# Bloco de cálculo
hi = hypot(co, ca)

# Bloco de saída
print('O comprimento da hipotenusa é igual a {:.2f}.'.format(hi))
print()

# Bloco de descarte

'''
co = float(input('Informe o comprimento do cateto oposto: '))
ca = float(input('Informe o comprimento do cateto adjacente: '))
hi = (co ** 2 + ca ** 2)**(1/2)
print('O comprimento da hipotenusa é igual a {:.2f}.'.format(hi))'''

''''''

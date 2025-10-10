# Corrigido

# Bloco de importação
from random import choice
print('Exercício 019')
print()

# Bloco de entrada
a1 = input('Informe o nome do primeiro aluno: ')
a2 = input('Informe o nome do segundo aluno: ')
a3 = input('Informe o nome do terceiro aluno: ')
a4 = input('Informe o nome do quarto aluno: ')
print()

# Bloco de cálculo
lista = [a1, a2, a3, a4]
escolhido = choice(lista)

# Bloco de saída
print()
print('O escolhido foi {}.'.format(escolhido))
print()

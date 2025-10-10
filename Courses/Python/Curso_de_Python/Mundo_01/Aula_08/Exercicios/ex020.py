# Corrigido

# Bloco de importação
from random import shuffle

print('Exercício 020')
print()

# Bloco de entrada
a1 = input('Informe o nome do primeiro aluno: ')
a2 = input('Informe o nome do segundo aluno: ')
a3 = input('Informe o nome do terceiro aluno: ')
a4 = input('Informe o nome do quarto aluno: ')
print()

# Bloco de cálculo
lista = [a1, a2, a3, a4]
shuffle(lista)

# Bloco de saída
print('A ordem de apresentação será: ')
print()
print(lista)
print()

# Corrigido
print('Exercício 033')
print()

# Bloco de entradas
n1 = int(input('Informe o primeiro número: '))
print()
n2 = int(input('Informe o segundo número: '))
print()
n3 = int(input('Informe o terceiro número: '))
print()

# Bloco de análises
menor = n1
if n2 < n1 and n2 < n3:
    menor = n2
if n3 < n1 and n3 < n2:
    menor = n3
maior = n1
if n2 > n1 and n2 > n3:
    maior = n2
if n3 > n1 and n3 > n2:
    maior = n3

# Bloco de saída
print('O menor número é: {}.'.format(menor))
print()
print('O maior número é: {}.'.format(maior))
print()

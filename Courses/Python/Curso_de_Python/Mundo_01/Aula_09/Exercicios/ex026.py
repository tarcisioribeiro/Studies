# Corrigido

print('Exercício 026')
print()

# Bloco de entrada
frase = str(input('Digite uma frase: ')).upper().strip()
print()

# Bloco de análise e saída
print('A letra A aparece {} vezes na frase.'.format(frase.count('A')))
print('A primeira letra A apareceu na posição {}.'.format(frase.find('A')+1))
print('A última letra A apareceu na posição {}.'.format(frase.rfind('A')+1))
print()

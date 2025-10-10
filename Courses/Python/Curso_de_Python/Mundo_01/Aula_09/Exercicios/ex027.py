# Corrigido

print('Exercício 027')
print()

# Bloco de entrada
n = str(input('Informe seu nome: ')).strip()

# Bloco de cálculo
nome = n.split()

# Bloco de análise e saída
print('Muito prazer em te conhecer!')
print()
print('Seu primeiro nome é: {}.'.format(nome[0]))
print()
print('Seu último nome é: {}'.format(nome[len(nome)-1]))
print()

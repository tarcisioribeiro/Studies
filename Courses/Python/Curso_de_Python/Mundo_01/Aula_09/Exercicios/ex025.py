# Corrigido

print('Exercício 025')
print()

# Bloco de entrada
nome = str(input('Digite o seu nome: ')).strip()
print()

# Bloco de cálculo e saída
nome1 = nome.upper()
condicao = ('SILVA' in nome1)
if condicao == True:
    print('Você tem Silva no nome.')
else:
    print('Você não tem Silva no nome.')
print()

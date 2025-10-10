print()
# Recebe a primeira nota
n1 = float(input('Digite a primeira nota: '))
print()

# Recebe a segunda nota
n2 = float(input('Digite a segunda nota: '))
print()

# Realiza o cálculo da média
m = (n1 + n2) / 2

# Retorna o valor da média
print('A sua média é de {:.1f}.'.format(m))
print()

# Bloco de condições
if m >= 6.0:
    # Retornado se média maior ou igual a 6
    print('Sua média foi boa! MEUS PARABÉNS!')
else:
    # Retornado se média menor que 6
    print('Sua média de foi ruim! ESTUDE MAIS!')
print()

# Condição simplificada
'''print('PARABÉNS!' if m >= 6 esle 'ESTUDE MAIS!')'''

# Fim da explicação

# Corrigido
print('Exercício 031')
print()

# Recebe a distância da viagem
dist = int(input('Informe a distância da viagem em quilômetros: '))
print()

# Analiza e calcula o valor da passagem
if dist <= 200:
    # Retornado se a distãncia for menor que 200 Km
    print('O valor da passagem é de R$ {:.2f}.'.format(dist*0.5))
else:
    # Retornado se a distância for maior que 200 Km
    print('O valor da passagem é de R$ {}.'.format(dist*0.45))
print()

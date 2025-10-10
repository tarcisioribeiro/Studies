# Corrigido

print('Exercício 015')
print()

# Bloco de entrada

dias = int(input('Informe por quantos dias você alugou o carro: '))
dist = float(input('Informe a distância em Km percorridos no carro: '))
print()

# Bloco de cálculo
valor = (dias * 60) + (dist * 0.15)

# Bloco de saída
print('O valor pago pelo aluguel do carro é de R$ {}.'.format(valor))
print()

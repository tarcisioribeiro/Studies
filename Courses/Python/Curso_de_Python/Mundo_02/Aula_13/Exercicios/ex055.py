# Analisador de maior e menor peso com laço de iteração e estrutura de decisão
print()
maior = 0
menor = 0
for c in range(1, 6):
    peso = float(input('Informe o peso da {}ª pessoa: '.format(c)))
    if c == 1:
        maior = peso
        menor = peso
    else:
        if peso > maior:
            maior = peso
        if peso < menor:
            menor = peso
print()
print('O maior peso é {} Kg e o menor peso é {} Kg.'.format(maior, menor))
print()

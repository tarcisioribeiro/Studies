# Corrigido

print('Exercício 034')
print()

# Recebe o valor do salário
sal = float(input('Informe seu salário: '))

# Bloco de análises e cálculos
if sal >= 1250:
    # Retornado caso o salário seja superior a R$ 1250
    print('Você receberá um aumento de 10%. Seu novo salário é de R$ {:.2f}.'.format(
        sal*1.1))
else:
    # Retornado se o salário for menor que R$ 1250
    print('Você receberá um aumento de 15%. Seu novo salário é de R$ {:.2f}.'.format(
        sal*1.15))

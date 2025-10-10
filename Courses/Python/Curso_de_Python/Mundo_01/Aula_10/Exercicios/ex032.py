# Corrigido

print('Exercício 032')
print()

# Recebe o ano digitado pelo usuário
ano = int(input('Informe um ano qualquer: '))
print()

# Analiza e retorna informações sobre o ano
if ano % 4 == 0:
    # Retornado se o ano for bissexto
    print('{} é um ano bissexto.'.format(ano))
else:
    # Retornado se o ano não for bissexto
    print('{} não é um ano bissexto.'.format(ano))
print()

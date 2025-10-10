# Corrigido

print('Exercício 010')
print()

# Bloco de entrada
carteira = float(input('Informe quanto você tem na sua carteira: '))
print()

# Bloco de cálculo
dólar = carteira / 5.47

# Bloco de saída
print('Você pode comprar $ {:.2f} dólares com R$ {} reais na carteira.'.format(
    dólar, carteira))
print()

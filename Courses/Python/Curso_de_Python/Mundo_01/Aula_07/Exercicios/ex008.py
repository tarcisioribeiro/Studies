# Corrigido

print('Exercício 008')
print()

# Bloco de entrada
valor = float(input('Informe uma distância em metros: '))
print()

# Bloco de cálculo
cm = valor * 100
mm = valor * 1000

# Bloco de saída
print('{} metros são equivalentes a {} centímetros. \n{} metros são equivalentes a {} milímetros.'.format(
    valor, cm, valor, mm))
print()

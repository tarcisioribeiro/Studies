# Corrigido

print('Exercício 011')
print()

# Bloco de entrada
a = float(input('Informe a altura da parede: '))
l = float(input('Informe a largura da parede: '))
print()

# Bloco de cálculo
area = a * l
litro = area / 2

# Bloco de saída
print('A área da parede é de {}m², e a quantidade de litros de tinta necessária é de {}L.'.format(area, litro))
print()

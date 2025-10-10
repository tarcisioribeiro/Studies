# Corrigido

# Bloco de entrada
print()
n1 = int(input('Informe um número: '))
n2 = int(input('Informe outro número: '))
print()

# Bloco de cálculos
s = n1 + n2
m = n1 * n2
d = n1 / n2
di = n1 // n2
e = n1 ** n2

# Bloco de saída
print('A soma é igual a {}, a multiplicação é igual a {} e a divisão é igual a {:.3f}'.format(s, m, d))
print('A divisão inteira é igual a {} e a exponenciação é igual a {}.'.format(di, e))
print()

# Progressão aritmética utilizando laço de iteração

print()
p = int(input('Informe o primeiro termo: '))
print()
r = int(input('Informe a razão da progressão: '))
print()
d = p + (10 - 1) * r

for c in range(p, d + r, r):
    print('{}'.format(c), end=' -> ')
print('Acabou.')
print()

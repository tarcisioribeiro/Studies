lista = []

for i in range(0, 5):
    lista.append(int(input('Digite um valor para a Posição {}: '.format(i))))
print()
print('=-' * 40)
print()
min = min(lista)
max = max(lista)

print(f'Você digitou os valores {lista}')

print(f'O menor valor digitado foi {min} nas posições ', end='')
for c, v in enumerate(lista):
    if v == min:
        print(f'{c}... ', end='')
print()
print(f'O maior valor digitado foi {max} nas posições ', end='')
for c, v in enumerate(lista):
    if v == max:
        print(f'{c}... ', end='')
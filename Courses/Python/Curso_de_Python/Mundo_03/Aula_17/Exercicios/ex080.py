lista = []

print()

for c in range(0, 5):
    n = int(input('Digite um valor: '))
    if c == 0 or n > lista[-1]:
        lista.append(n)
        print('Adicionado ao final da lista.\n')
    else:
        pos = 0
        while pos < len(lista):
            if n <= lista[pos]:
                lista.insert(pos, n)
                print(f'Adicionado na posição {pos} da lista.\n')
                break
            pos += 1

print('\n{}\n'.format('-=' * 40))
print(f'Os valores digitados foram {lista}.\n')
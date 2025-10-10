temp = []
princ = []

print()

while True:
    temp.append(input('Nome: '))
    temp.append(float(input('Peso: ')))
    if len(princ) == 0:
        mai = men = temp[1]
    else:
        if temp[1] > mai:
            mai = temp[1]
        if temp[1] < men:
            men = temp[1]
    princ.append(temp[:])
    temp.clear()
    resp = str(input('Deseja continuar? [S/N] '))

    if resp in 'Nn':
        break

print('\n{}\n'.format('-=' * 40))

print(f'\nForam cadastradas {len(princ)} pessoas.')
print(f'\nO maior peso foi de {mai} Kg. Peso de ', end='')
for p in princ:
    if p[1] == mai:
        print(f'{p[0]}... ', end='')
print(f'\nO menor peso foi de {men} Kg. Peso de ', end='')
for p in princ:
    if p[1] == men:
        print(f'{p[0]}... ', end='')
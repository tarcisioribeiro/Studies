lista = []
pares = []
impares = []
opcao = ''

print()
while opcao != 'N':
    lista.append((input('Digite um valor: ')))
    print('Valor adicionado com sucesso...')
    opcao = input('Quer continuar? [S/N] ')
    if opcao == 'N':
        for i in range(0, len(lista)):
            if i % 2 == 0:
                pares.append(i)
            elif i % 2 == 1:
                impares.append(i)
        print(f'Lista: {lista}')
        print(f'Pares: {pares}')
        print(f'Impares: {impares}')
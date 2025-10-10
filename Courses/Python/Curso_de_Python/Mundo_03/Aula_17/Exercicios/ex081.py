opcao = 'S'
lista = []
reversa = []

while opcao == 'S':
    lista.append(int(input('Digite um valor: ')))
    opcao = input('Deseja continuar? [S/N] ')
    if opcao == 'S':
        lista.append(int(input('Digite um valor: ')))
        opcao = input('Deseja continuar? [S/N] ')
    if opcao == 'N':
        lista.sort(reverse=True)
        print(f'Você digitou {len(lista)} elementos.')
        print(f'Os valores em ordem decrescente são: {lista}.')
        if 5 in lista:
            print('O valor 5 faz parte da lista.')
        else:
            print('O valor 5 não faz parte da lista.')
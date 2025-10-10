lista = []
opcao = ''

print()
while opcao != 'N':
    valor = int(input('Digite um valor: '))
    if valor in lista:
        print('Valor Duplicado! Não vou adicionar...')
    elif valor not in lista:
        lista.append(valor)
        print('Valor adicionado com sucesso...')
    opcao = input('Quer continuar? [S/N] ')
    if opcao == 'N':
        lista.sort()
        print('\n{}\n\nVocê digitou os valores {}\n'.format(('-=' * 30), lista))
        break
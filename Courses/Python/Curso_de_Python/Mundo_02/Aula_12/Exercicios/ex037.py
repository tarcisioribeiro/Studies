# Conversor de bases númericas

num = int(input('Digite um número inteiro: '))
opção = int(input(
    ('Escolha uma opção\n\n[ 1 ] Converter para Binário\n[ 2 ] Converter para Octal\n[ 3 ] Converter para Hexadecimal\n\nDigite sua opção aqui: ')))
print()
if opção == 1:
    print('{} convertido para Binário é igual a {}.'.format(num, bin(num)[2:]))
elif opção == 2:
    print('{} convertido para Octal é igual a {}.'.format(num, oct(num)[2:]))
elif opção == 3:
    print('{} convertido para Hexadecimal é igual a {}.'.format(
        num, hex(num)[2:]))
else:
    print('Opção inválida. Tente novamente.')

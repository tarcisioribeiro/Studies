# Estrutura while com a utilização de uma condição

# cont = 1
# while cont <= 10:
#     print(cont, '-> ', end='')
#     cont += 1
# print('Acabou')


# Estrutura while sem a utilização de uma condição (flag)
# A estrutura se repetirá para sempre sem uma condição (flag)

# cont = 1
# while True:
#     print(cont, '-> ', end='')
#     cont += 1
# print('Acabou')


# While utilizando uma condição (flag)
# Isso é uma gambiarra!

# n = s = 0
# while n != 999:
#     n = int(input('Digite um número: '))
#     s += n
# s -= 999
# print('A soma vale {}.'.format(s))


# While utilizando uma condição (flag) e contador

# n = cont = 0
# while cont < 5:
#     n = int(input('Digite um número: '))
#     cont += 1


# While utilizando o True:

print()
n = s = 0
while True:
    n = int(input('Digite um número: '))
    if n == 999:
        break
    s += n
print()
print(f'A soma vale {s}.')
# print('A soma vale {}.'.format(s))
print()


# Utilização de Fstrings no Python

# nome = 'José'
# idade = 33
# salário = 987.3
# print()
# print(f'O {nome} tem {idade} anos e ganha R$ {salário:.2f}.') # Forma mais recente (Python 3.6^)
# # print('O {} tem {} anos.'.format(nome, idade)) # Forma do Python 3 até o Python 3.6
# # print('O %s tem %d anos.' % (nome, idade)) # Forma utilizada no Python 2
# print()

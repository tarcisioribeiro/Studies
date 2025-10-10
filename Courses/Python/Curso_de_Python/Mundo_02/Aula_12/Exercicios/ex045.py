# Jogo do Jokenpô

from random import randint
from time import sleep
from emoji import emojize

print()
print('JOKENPÔ')
print()
print('Para jogar, selecione o número e aperte enter.')
print()
itens = ('Pedra', 'Papel', 'Tesoura')
computador = randint(0, 2)

print(emojize(
    'Suas opções são: \n\n[ 0 ] Pedra :bomb: \n[ 1 ] Papel :page_facing_up: \n[ 2 ] Tesoura :scissors:', use_aliases=True))
print()

jogador = int(input('Qual a sua jogada? '))

print()
print('JO')
sleep(1)
print('KEN')
sleep(1)
print('PÔ')
sleep(1)
print()
print('==' * 20)
print('O computador escolheu: {}.'.format(itens[computador]))
sleep(1)
print('O jogador jogou {}.'.format(itens[jogador]))
sleep(1)
print('==' * 20)
print()
sleep(1)
if computador == 0:  # Computador jogou pedra
    if jogador == 0:  # Jogador jogou pedra
        print('Deu Empate.')
        print()
    elif jogador == 1:  # Jogador jogou papel
        print('O jogador venceu!')
        print()
    elif jogador == 2:  # Jogador jogou tesoura
        print('O computador venceu!')
        print()
elif computador == 1:  # Computador jogou papel
    if jogador == 0:  # Jogador jogou pedra
        print('O computador venceu.')
        print()
    elif jogador == 1:  # Jogador jogou papel
        print('Empate.')
        print()
    elif jogador == 2:  # Jogador jogou tesoura
        print('O jogador venceu.')
        print()
elif computador == 2:  # Computador jogou tesoura
    if jogador == 0:  # Jogador jogou pedra
        print('O jogador venceu.')
        print()
    elif jogador == 1:  # Jogador jogou papel
        print('O computador venceu.')
        print()
    elif jogador == 2:  # Jogador jogou tesoura
        print('Empate.')
        print()
else:
    print('Jogada inválida.')
    print()

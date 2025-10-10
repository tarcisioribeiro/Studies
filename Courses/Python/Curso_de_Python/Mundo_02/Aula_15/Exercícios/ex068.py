# # Jogar par ou ímpar com o computador até que o jogador perca, contabilizar as vitórias consecutivas do jogador.

from random import randint
from time import sleep

v = 0

while True:
    print()
    sleep(1)
    jogador = int(input('Diga um valor: '))
    sleep(1)
    computador = randint(0, 10)
    total = jogador + computador
    tipo = ' '
    print()
    while tipo not in 'PI':
        tipo = str(input('Você quer par ou ímpar? [P/I]: ')).strip().upper()[0]
        sleep(1)
    print()
    sleep(1)
    print(
        f'Você jogou {jogador} e o computador jogou {computador}. Total de {total}. ', end='')
    sleep(1)
    print('Deu par!' if total % 2 == 0 else 'Deu ímpar!')
    sleep(1)
    print()
    if tipo == 'P':
        if total % 2 == 0:
            print('Você venceu!')
            sleep(1)
            print()
            v += 1
        else:
            print('Você perdeu!')
            sleep(1)
            print()
            break
    elif tipo == 'I':
        if total % 2 == 1:
            print('Você venceu!')
            sleep(1)
            print()
            v += 1
        else:
            print('Você perdeu!')
            sleep(1)
            print()
            break
    sleep(1)
    print('Vamos jogar novamente...')
    sleep(1)
print(f'Game Over! Você venceu {v} vezes.')
print()

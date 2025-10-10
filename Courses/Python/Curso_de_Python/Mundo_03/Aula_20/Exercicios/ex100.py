from random import randint
from time import sleep


def sorteia(lista):
    print('Sorteando 5 valores da lista: ', end='')
    for i in range(0, 5):
        num = randint(1, 10)
        lista.append(num)
        print(f'{num} ', end='', flush=True)
        sleep(0.5)
    print('Pronto!')

    return lista

def somaPar(lista):
    soma = 0
    for i in range(0, len(lista)):
        if lista[i] % 2 == 0:
            soma += lista[i]
    print(f'Somando os valores pares de {lista}, temos {soma}.')

numeros = []
sorteia(numeros)
somaPar(numeros)
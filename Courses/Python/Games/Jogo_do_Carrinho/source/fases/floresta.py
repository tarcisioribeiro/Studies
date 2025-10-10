from pyautogui import sleep
from emoji import emojize
from pygame import mixer


def Floresta():

    print()
    print(emojize('Fase da floresta ' +
                  (':evergreen_tree:' * 5), use_aliases=True))
    print()

    mixer.init()
    mixer.music.load('library/floresta.mp3')
    mixer.music.play()
    sleep(36)

    for i in range(11, 1, -1):
        print(emojize(':evergreen_tree:' +
                      ('_' * i) + ':red_car:', use_aliases=True))
        sleep(0.25)
    print()

    escolha = str(
        input('Desvie! o carrinho vai bater! Escreva desviar!!!\n\nEscreve aqui: '))
    sleep(0.25)
    print()

    if(escolha == 'desviar'):
        print(emojize('Ufa! o Carrinho desviou!'))
        print()
        sleep(0.25)
        for i in range(1, 6):
            print(emojize(':red_car:' + '_' * i +
                          ':evergreen_tree:', use_aliases=True))
            sleep(0.25)
        print()
    else:
        print(emojize(':boom:' * 5, use_aliases=True))
        print()
    pass

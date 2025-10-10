from emoji import emojize
from pyautogui import sleep
from pygame import mixer


def Deserto():

    print()
    print(emojize('Fase do deserto ' + (':cactus:' * 5), use_aliases=True))
    print()

    mixer.init()
    mixer.music.load('library/deserto.mp3')
    mixer.music.play()
    sleep(20)

    for i in range(11, 1, -1):
        print(emojize(':cactus:' + ('_' * i) + ':red_car:', use_aliases=True))
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
            print(emojize(':red_car:' + '_' *
                          i + ':cactus:', use_aliases=True))
            sleep(0.25)
        print()
    else:
        print(emojize(':boom:' * 5, use_aliases=True))
        print()
    pass

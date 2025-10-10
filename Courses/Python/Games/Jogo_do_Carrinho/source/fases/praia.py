from emoji import emojize
from pyautogui import sleep
from pygame import mixer


def Praia():

    print()
    print(emojize('Fase da praia ' + (':palm_tree:' * 5), use_aliases=True))
    print()

    mixer.init()
    mixer.music.load('library/praia.mp3')
    mixer.music.play()
    sleep(35)

    for i in range(11, 1, -1):
        print(emojize(':palm_tree:' + ('_' * i) +
                      ':red_car:', use_aliases=True))
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
                          i + ':palm_tree:', use_aliases=True))
            sleep(0.25)
        print()
    else:
        print(emojize(':boom:' * 5, use_aliases=True))
        print()
    pass

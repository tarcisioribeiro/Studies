from pyautogui import sleep
from pygame import mixer
from emoji import emojize
from random import randint


def Sorteio():
    mixer.init()
    mixer.music.load('library/tambor-carregando.mp3')
    mixer.music.play()
    sleep(4)
    print(emojize('Revólver carregado, hora do jogo! :ghost: '))
    gatilho = 0
    vitória = 0
    bala = 0
    while vitória < 5 or gatilho != bala:
        bala = randint(1, 6)
        gatilho = randint(1, 6)
        sleep(0.25)
        print()
        sleep(0.25)
        print('Hora de apertar o gatilho!!!')
        sleep(0.25)

        mixer.music.load('library/tensão.mp3')
        mixer.music.play()
        sleep(5)

        if gatilho == bala:
            mixer.music.load('library/fogo.mp3')
            mixer.music.play()
            sleep(2)
            print()
            sleep(0.25)
            print('Você morreu, otário!!! :ghost: ')
            sleep(0.25)
            print()
            break
        elif gatilho != bala:
            mixer.music.load('library/vazio.mp3')
            mixer.music.play()
            sleep(2)
            print()
            sleep(0.25)
            print('Dessa vez você escapou!')
            sleep(0.25)
            vitória += 1
            if vitória == 5:
                sleep(0.25)
                print('Você está solto, pode voltar pra casa.')
                sleep(0.25)
                print()
                break


pass

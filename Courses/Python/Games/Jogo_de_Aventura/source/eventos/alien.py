from pygame import mixer
from pyautogui import sleep
from emoji import emojize


def Alien():
    decisão = ''
    tentativas = 0
    while decisão != 'ESCONDER' and tentativas < 3:
        sleep(0.25)
        print()
        sleep(0.25)
        decisão = str(input('Digite esconder para se esconder: ')).upper()
        sleep(0.25)
        print()
        if(decisão == 'ESCONDER'):
            print('Você fugiu do Alien!')
            sleep(0.25)
        elif(decisão != 'ESCONDER'):
            sleep(0.25)
            print(emojize(' :alien: ' * 20, use_aliases=True))
            sleep(0.25)
            mixer.music.load('library/eventos/alien_chegada.mp3')
            mixer.music.play()
            sleep(3)
            print()
            tentativas += 1
            if(tentativas == 3):
                sleep(0.25)
                print('O Alien te pegou!')
                sleep(0.25)
                mixer.music.load('library/eventos/alien_saida.mp3')
                mixer.music.play()
                sleep(3)
                mixer.music.load('library/decisoes/jogo_perdido.mp3')
                mixer.music.play()
                sleep(7)
                print()
    pass

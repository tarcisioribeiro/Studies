from pygame import mixer
from pyautogui import sleep
from emoji import emojize


def Caminhao():
    decisão = ''
    while decisão != 'DESVIAR':
        print()
        decisão = str(
            input('Digite desviar para desviar do caminhão: ')).upper()
        sleep(0.25)
        print()
        sleep(0.25)
        if(decisão == 'DESVIAR'):
            sleep(0.25)
            print('Você desviou do caminhão!')
            sleep(0.25)
            print()
        else:
            sleep(0.25)
            print(emojize('O caminhão te atropelou!' +
                          ' :truck: ' * 10, use_aliases=True))
            sleep(0.25)
            mixer.music.load('library/eventos/batida.mp3')
            mixer.music.play()
            sleep(5)
            mixer.music.load('library/decisoes/jogo_perdido.mp3')
            mixer.music.play()
            sleep(7)
            print()
            sleep(0.25)
            print('Fim de jogo!')
            print()
            break
    pass

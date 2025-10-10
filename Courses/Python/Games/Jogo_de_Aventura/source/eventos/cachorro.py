from pygame import mixer
from pyautogui import sleep
from emoji import emojize


def Cachorro():
    decisão = ''
    mordidas = 0
    while decisão != 'FUGIR' and mordidas < 3:
        print()
        decisão = str(input('Digite fugir para fugir do cachorro: ')).upper()
        sleep(0.25)
        print()
        sleep(0.25)
        if(decisão == 'FUGIR'):
            sleep(0.25)
            print('Você fugiu do cachorro!')
            sleep(0.25)
            print()
        else:
            sleep(0.25)
            mixer.music.load('library/eventos/latida.mp3')
            mixer.music.play()
            sleep(6)
            print(emojize('O cachorro te mordeu!' +
                          ' :dog: ' * 10, use_aliases=True))
            sleep(0.25)
            mordidas += 1
            if(mordidas == 3):
                mixer.music.load('library/decisoes/jogo_perdido.mp3')
                mixer.music.play()
                sleep(7)
                print()
                sleep(0.25)
                print(emojize('Fim de jogo! :bomb:', use_aliases=True))
                sleep(0.25)
                print()
                break
    pass

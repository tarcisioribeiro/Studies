from pygame import mixer
from pyautogui import sleep
from emoji import emojize


def Ladrao():

    sleep(0.25)
    print()
    print(emojize('Te roubei! :gun:', use_aliases=True))
    mixer.music.load('library/eventos/roubo.mp3')
    mixer.music.play()
    sleep(5)
    mixer.music.load('library/decisoes/jogo_perdido.mp3')
    mixer.music.play()
    sleep(7)
    print()
    pass

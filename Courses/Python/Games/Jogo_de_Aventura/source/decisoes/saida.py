from pygame import mixer
from pyautogui import sleep


def Saida():
    mixer.music.load('library/decisoes/fim_aventura.mp3')
    mixer.music.play()
    print()
    print('Finalizando aventura...')
    sleep(7)
    print()
    pass

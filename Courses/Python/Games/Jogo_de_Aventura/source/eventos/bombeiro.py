from pygame import mixer
from pyautogui import sleep
from emoji import emojize


def Bombeiro():
    sleep(0.25)
    print()
    print(emojize(' :fire_engine: ' * 20, use_aliases=True))
    sleep(0.25)
    mixer.music.load('library/eventos/bombeiro.mp3')
    mixer.music.play()
    sleep(14)
    print()
    pass

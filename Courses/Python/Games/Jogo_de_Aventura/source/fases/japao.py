from source.decisoes.estrutura_veiculo import Estrutura_veiculo
from pygame import mixer
from pyautogui import sleep
from emoji import emojize


def Japao():
    print()
    print(emojize(' :airplane: ' * 10, use_aliases=True))
    sleep(0.25)
    print()
    mixer.music.load('library/main/decolagem.mp3')
    mixer.music.play()
    sleep(8)
    mixer.music.load('library/fases/japao.mp3')
    mixer.music.play()
    print('Bem vindo ao Japão!')
    sleep(10)
    print()
    Estrutura_veiculo()

    pass

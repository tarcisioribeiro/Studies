from emoji import emojize
from pyautogui import sleep
from source.fases.deserto import Deserto
from source.fases.floresta import Floresta
from source.fases.praia import Praia


def Seletor():

    while True:
        fase = ' '
        while fase not in '123SAIR':
            fase = str(input(emojize(
                'Qual fase deseja jogar? \n\n[ 1 ] Fase da floresta :evergreen_tree:\n[ 2 ] Fase da praia :palm_tree:\n[ 3 ] Fase do deserto :cactus:\nDigite SAIR para sair do jogo.\n\nDigite aqui sua opção: ', use_aliases=True))).upper()
        print()
        sleep(0.25)

        if fase == 'SAIR':
            break
        if fase == '1':
            Floresta()
        if fase == '2':
            Praia()
        if fase == '3':
            Deserto()
    pass

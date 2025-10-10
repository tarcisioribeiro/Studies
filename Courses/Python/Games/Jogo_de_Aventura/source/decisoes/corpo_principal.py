from source.fases.alemanha import Alemanha
from source.fases.reino_unido import Reino_Unido
from source.fases.russia import Russia
from source.fases.italia import Italia
from source.fases.espanha import Espanha
from source.fases.franca import Franca
from source.fases.eua import Eua
from source.fases.china import China
from source.fases.coreia import Coreia
from source.fases.japao import Japao
from source.fases.brasil import Brasil
from source.fases.mexico import Mexico
from source.fases.argentina import Argentina
from source.decisoes.saida import Saida
from pyautogui import sleep
from emoji import emojize
from pygame import mixer


def Corpo_Principal():
    destino = 0
    while destino != 999:
        mixer.music.load('library/main/cintos_aviao.mp3')
        mixer.music.play()
        print(emojize('Vamos pegar um avião! :airplane:', use_aliases=True))
        sleep(17)
        print()
        destino = int(input(emojize(
            'Qual o destino deseja seguir: \n\n[ 0 ] Brasil\n[ 1 ] Japão\n[ 2 ] Coréia do Sul\n[ 3 ] China\n[ 4 ] Estados Unidos\n[ 5 ] França\n[ 6 ] Espanha\n[ 7 ] Itália\n[ 8 ] Rússia\n[ 9 ] Reino Unido\n[ 10 ] Alemanha\n[ 11 ] México\n[ 12 ] Argentina\n[ 999 ] Finalizar o programa\n\nDigite aqui sua opção: ', use_aliases=True)))
        sleep(1)

        # Bloco de decisão
        if(destino == 0):
            Brasil()
        elif(destino == 1):
            Japao()
        elif(destino == 2):
            Coreia()
        elif(destino == 3):
            China()
        elif(destino == 4):
            Eua()
        elif(destino == 5):
            Franca()
        elif(destino == 6):
            Espanha()
        elif(destino == 7):
            Italia()
        elif(destino == 8):
            Russia()
        elif(destino == 9):
            Reino_Unido()
        elif(destino == 10):
            Alemanha()
        elif (destino == 11):
            Mexico()
        elif (destino == 12):
            Argentina()
        elif(destino == 999):
            Saida()
        else:
            print()
            sleep(0.25)
            print(
                'Opção não reconhecida. Informe uma opção válida ou digite 999 para sair.')

    pass

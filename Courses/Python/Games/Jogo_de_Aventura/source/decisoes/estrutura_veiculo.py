from source.eventos.chama_evento import Chama_Evento

from pygame import mixer
from pyautogui import sleep
from emoji import emojize


def Estrutura_veiculo():
    veiculo = int(input(emojize(
        'Qual veículo deseja utilizar?\n\n:bike: [ 1 ] Bicicleta\n:car: [ 2 ] Carro\n:bullettrain_side: [ 3 ] Trem Bala\n\nEscreva aqui sua opção: ', use_aliases=True)))
    sleep(0.25)

    if(veiculo == 1):
        print()
        sleep(0.25)
        print(
            'A distância até o Centro é de 10 Km, você gastará 30 minutos de bicicleta.')
        sleep(0.25)

        mixer.music.load('library/decisoes/bicicleta.mp3')
        mixer.music.play()
        print()
        sleep(0.25)
        print(emojize(' :bike: ' * 30, use_aliases=True))
        sleep(6)

        Chama_Evento()
        mixer.music.load('library/decisoes/fase_concluida.mp3')
        mixer.music.play()
        sleep(10)
        print('Parabéns, você chegou!')
        sleep(0.25)
        print()

    elif(veiculo == 2):
        print()
        sleep(0.25)
        print(
            'A distância até o Centro é de 10 Km, você gastará 15 minutos de carro.')
        sleep(0.25)

        mixer.music.load('library/decisoes/buzina_carro.mp3')
        mixer.music.play()
        print()
        sleep(0.25)
        print(emojize(' :car: ' * 15, use_aliases=True))
        sleep(3)

        Chama_Evento()
        mixer.music.load('library/decisoes/fase_concluida.mp3')
        mixer.music.play()
        sleep(10)
        print('Parabéns, você chegou!')
        sleep(0.25)
        print()

    elif(veiculo == 3):
        print()
        sleep(0.25)
        print(
            'A distância até o Centro é de 10 Km, você gastará 5 minutos de trem-bala.')
        sleep(0.25)

        mixer.music.load('library/decisoes/trem_bala.mp3')
        mixer.music.play()
        print()
        sleep(0.25)
        print(emojize(' :bullettrain_side: ' * 5, use_aliases=True))
        sleep(15)

        Chama_Evento()
        mixer.music.load('library/decisoes/fase_concluida.mp3')
        mixer.music.play()
        sleep(10)
        print('Parabéns, você chegou!')
        sleep(0.25)
        print()

    elif(veiculo == 999):
        print('Ok! Esperamos que volte em breve!')
        sleep(0.25)
        print()

    else:
        print('Não reconheço essa opção. Tente novamente.')
        sleep(0.25)

    pass

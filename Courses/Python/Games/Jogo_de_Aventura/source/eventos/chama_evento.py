from random import randint
from source.eventos.cachorro import Cachorro
from source.eventos.caminhao import Caminhao
from source.eventos.ladrao import Ladrao
from source.eventos.bombeiro import Bombeiro
from source.eventos.alien import Alien


def Chama_Evento():
    evento = randint(0, 4)
    if(evento == 0):
        Cachorro()
    if(evento == 1):
        Caminhao()
    if(evento == 2):
        Ladrao()
    if(evento == 3):
        Bombeiro()
    if(evento == 4):
        Alien()
    pass

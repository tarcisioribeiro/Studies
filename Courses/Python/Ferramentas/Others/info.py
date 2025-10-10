from socket import gethostname, gethostbyname
from pyautogui import size, alert


def InfoMaquina():
    maquina = gethostname()
    ip = gethostbyname(maquina)
    largura, altura = size()
    alert('Nome da máquina: {}\nResolução de tela: {}x{}\nEndereço de IP: {}.'.format(
        maquina, largura, altura, ip))

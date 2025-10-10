from source.menu.seletor import Seletor
from pyautogui import sleep
from emoji import emojize


print()
print(emojize('Bem vindo ao jogo do carrinho! :red_car:', use_aliases=True))
sleep(0.25)
print()
sleep(0.25)

Seletor()

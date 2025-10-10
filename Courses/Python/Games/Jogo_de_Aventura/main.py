from source.decisoes.corpo_principal import Corpo_Principal
import datetime
from pygame import mixer
from time import sleep
import emoji


mixer.init()


now = datetime.datetime.now()
print()
sleep(0.25)
print(emoji.emojize('Bem vindo! {} :earth_americas:', use_aliases=True).format(now))
print()
mixer.music.load('library/main/correndo.mp3')
mixer.music.play()
sleep(8)
print(emoji.emojize(
    'Bem vindo ao jogo de aventura!' + ':runner:' * 3, use_aliases=True))
sleep(0.25)
print()
Corpo_Principal()


sleep(0.25)
print(
    'Acesse meu Github! https://github.com/tarcisioribeiro')
sleep(0.25)

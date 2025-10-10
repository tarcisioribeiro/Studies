# Contagem regressiva para estouro de fogos

from time import sleep
from emoji import emojize

print()

for c in range(10, 0, -1):
    print('{}!'.format(c))
    sleep(1)
print()
print(emojize('Feliz Ano Novo! :boom: :boom: :boom: :boom: :boom:', use_aliases=True))
print()

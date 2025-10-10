from operator import index
from time import time


times = ('Atlético-MG', 'Flamengo', 'Palmeiras', 'Fortaleza', 'Corinthians', 'Red Bull Bragantino', 'Fluminense', 'América-MG', 'Atlético-GO',
         'Santos', 'Ceará', 'Internacional', 'São Paulo', 'Athletico Paranaense', 'Cuiabá', 'Juventude', 'Grêmio', 'Bahia', 'Sport', 'Chapecoense')

print('-' * 30)
print(f'Estes são os times do Brasileirão: {times}')
print('-' * 30)
print(f'Os cinco primeiros colocados são: {times[0:5]}')
print('-' * 30)
print(f'os quatro últimos colocados da tabela são: {times[16:]}')
print('-' * 30)
print(f'Estes são os times em ordem alfábetica: {sorted(times)}')
print('-' * 30)
print(f'A Chapecoense está em {times.index("Chapecoense") + 1}º lugar.')

jogador = {}
partidas = []

jogador['nome'] = str(input('Nome do jogador: '))
total = int(input(f'Quantas partidas {jogador["nome"]} jogou? '))

total_gols = 0
for i in range(0, total):
    partidas.append(int(input(f'Quantos gols {jogador["nome"]} fez na {i + 1}ª partida? ')))
jogador['gols'] = partidas[:]
jogador['total'] = sum(partidas)

print('-=' * 40)
print(jogador)
print('-=' * 40)

for k, v in jogador.items():
    print(f'O campo {k} tem o valor {v}.')
print('-=' * 40)

print(f'O jogador {jogador["nome"]} jogou {len(jogador["gols"])} partidas.')
for i, v in enumerate(jogador["gols"]):
    print(f'  => Na partida {i + 1} fez {v} gols.')
print(f'Foi um total de {jogador["total"]} gols.')
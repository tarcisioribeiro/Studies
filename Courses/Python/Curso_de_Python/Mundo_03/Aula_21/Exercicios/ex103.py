def ficha(nome='<desconhecido>', gols=0):
    if gols != '':
        gols = int(gols)
    print(f'O jogador {nome} fez {gols} gol(s) no campeonato.')

jogador = str(input('Nome do jogador: '))
get_gols = str(input('Número de gols: '))

if get_gols.isnumeric():
    gols = int(get_gols)
else:
    gols = 0
if jogador.strip() == '':
    ficha(gols=get_gols)
else:
    ficha(jogador, get_gols)
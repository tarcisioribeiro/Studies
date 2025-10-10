# Simular um caixa eletrônico, onde o usuário informa o valor sacado e o caixa retorna a quantidade de cada nota

from time import sleep

print()
sleep(1)
print('=' * 30)
sleep(1)
print('{:30}'.format('Banco Curso em Vídeo'))
sleep(1)
print('=' * 30)
sleep(1)

print()
sleep(1)
valor = int(input('Informe o valor que deseja sacar: '))
sleep(1)
print()
sleep(1)
total = valor
céd = 50
totcéd = 0

while True:
    if total >= céd:
        total -= céd
        totcéd += 1
    else:
        if totcéd > 0:
            print(f'Total de {totcéd} cédulas de R$ {céd}.')
        sleep(1)
        if céd == 50:
            céd = 20
        elif céd == 20:
            céd = 10
        elif céd == 10:
            céd = 1
        totcéd = 0
        if total == 0:
            break
print()
sleep(1)
print('=' * 30)
sleep(1)
print('Volte sempre ao Banco do Curso em Vídeo!')
sleep(1)
print()

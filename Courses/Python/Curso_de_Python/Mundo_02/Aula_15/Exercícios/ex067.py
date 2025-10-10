# Calcular a tabuada do número digitado enquanto o número não for negativo

from time import sleep

n = 0
while True:
    print()
    sleep(1)
    n = int(input('Digite um número para calcular a tabuada: '))
    sleep(1)
    print()
    sleep(1)
    if(n < 0):
        print('Não é possível calcular a tabuada de um número negativo. Execute o programa novamente.')
        break
    for i in range(1, 11):
        print(f'{n} x {i} = {(n*i)}.')
        sleep(1)
print()

def soma(a, b):
    print(f'A = {a} e B = {b}')
    s = a + b
    print(f'A soma A + B = {s}')

def soma_valores(*valores):
    s = 0
    for num in valores:
        s += num
    print(f'A soma dos valores {valores} é igual a {s}.')

def contador(*num):
    for valor in num:
        print(f'{valor}', end='')
    print('FIM!')

def dobra(lst):
    pos = 0
    while pos < len(lst):
        lst[pos] *= 2
        pos += 1

valores = [6, 3, 9, 1, 0, 2]
soma_valores(6, 3, 9, 1, 0, 2)
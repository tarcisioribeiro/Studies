expressao = input('Digite uma expressão matemática: ')

lista = []
esquerdos = 0
direitos = 0

lista = list(expressao)

for i in range(0, len(lista)):
    if lista[i] == '(':
        esquerdos += 1
    elif lista[i] == ')':
        direitos += 1

if esquerdos == direitos:
    print('Expressão válida.')
elif esquerdos != direitos:
    print('Expressão inválida.')
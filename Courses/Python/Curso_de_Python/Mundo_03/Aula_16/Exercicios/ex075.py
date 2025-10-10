tupla = int(input('Informe o primeiro número: ')), int(input('Informe o segundo número: ')), int(
    input('Informe o terceiro número: ')), int(input('Informe o quarto número: '))

print(f'Você digitou os valores: {tupla}.')
print(f'O valor 9 apareceu {tupla.count(9)} vezes.')
if 3 in tupla:
    print(f'O número 3 apareceu na {tupla.index(3)+1}ª posição.')
else:
    print('O número 3 não foi digitado em nenhuma posição.')
print()
print('Os valores pares digitados foram: ', end='')
for numero in tupla:
    if numero % 2 == 0:
        print(numero, end=' ')

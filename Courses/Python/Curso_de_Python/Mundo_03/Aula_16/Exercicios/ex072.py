numeros = (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
           12, 13, 14, 15, 16, 17, 18, 19, 20)

extenso = ('zero', 'um', 'dois', 'três', 'quatro', 'cinco', 'seis', 'sete', 'oito', 'nove', 'dez', 'onze',
           'doze', 'treze', 'catorze', 'quinze', 'dezesseis', 'dezessete', 'dezoito', 'dezenove', 'vinte')

teclado = int(input('Digite um número entre 0 e 20: '))
if teclado in numeros:
    print(f'Você digitou o número {extenso[teclado]}.')
elif teclado not in numeros:
    while teclado not in numeros:
        teclado = int(
            input('Tente novamente. Digite um número entre 0 e 20: '))
        if teclado in numeros:
            print(f'Você digitou o número {extenso[teclado]}.')

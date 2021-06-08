cod = int(input('Informe o código do empregado: '))
nasc = int(input('Informe o ano de nascimento: '))
ing = int(input('Informe o ano de ingresso: '))
trab = 2021 - ing


if (2021 - nasc >= 65) or (trab >= 30) or ((2021 - nasc >= 60) and trab >= 25):
    print('Idade: {} anos - Tempo de Trabalho: {} anos. Requerer aposentadoria.'.format((2021-nasc), trab))
else:
    print('Idade: {} anos - Tempo de Trabalho: {} anos. Não requerer aposentadoria.'.format((2021-nasc), trab))


if (cod < 0) or (nasc < 0) or (ing < 0):
    print('Há um ou mais dados incorretos informados.')
    print()

    while (cod < 0) or (nasc < 0) or (ing < 0):

        cod = int(input('Informe o código do empregado: '))
        nasc = int(input('Informe o ano de nascimento: '))
        ing = int(input('Informe o ano de ingresso: '))
        trab = 2021 - ing

        if (2021 - nasc >= 65) or (trab >= 30) or ((2021 - nasc >= 60) and trab >= 25):
            print(
                'Idade: {} anos - Tempo de Trabalho: {} anos. Requerer aposentadoria.'.format((2021-nasc), trab))
        else:
            print('Idade: {} anos - Tempo de Trabalho: {} anos. Não requerer aposentadoria.'.format((2021-nasc), trab))

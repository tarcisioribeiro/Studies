cod = int(input('Informe o código do empregado: '))
nasc = int(input('Informe o ano de nascimento: '))
ing = int(input('Informe o ano de ingresso: '))
trab = 2021 - ing

if 2021 - nasc >= 65:
    print('Idade: {} anos - Tempo de Trabalho: {} anos - Situacão: Requerer aposentadoria.'.format((2021 - nasc), trab))
elif trab >= 30:
    print('Idade: {} anos - Tempo de Trabalho: {} anos - Situacão: Requerer aposentadoria.'.format((2021 - nasc), trab))
elif (2021 - nasc >= 60) and trab >= 25:
    print('Idade: {} anos - Tempo de Trabalho: {} anos - Situacão: Requerer aposentadoria.'.format((2021 - nasc), trab))
else:
    print('Idade: {} anos - Tempo de Trabalho: {} anos - Situacão: Não requerer aposentadoria.'.format((2021 - nasc), trab))

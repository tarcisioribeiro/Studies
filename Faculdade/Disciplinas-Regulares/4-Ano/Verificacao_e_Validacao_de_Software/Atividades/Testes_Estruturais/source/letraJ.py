cod = int(input('Informe o código do empregado: '))
nasc = int(input('Informe o ano de nascimento: '))
ing = int(input('Informe o ano de ingresso: '))

idd = 2021 - nasc
trab = 2021 - ing

if (idd >= 65) or (trab >= 30) or ((idd >= 60) and trab >= 25):
    print('{} anos - Tempo de Trabalho: {} anos. Requerer aposentadoria.'.format((idd), trab))
else:
    print('{} anos - Tempo de Trabalho: {} anos. Não requerer.'.format((idd), trab))

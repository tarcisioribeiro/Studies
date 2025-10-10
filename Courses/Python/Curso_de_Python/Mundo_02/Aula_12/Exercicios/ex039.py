# Alistamento militar
ano = int(input('Informe o seu ano de nascimento: '))
print()
idade = 2020 - ano
if(idade < 18):
    print('Você ainda vai se alistar, faltam {} anos.'.format(18 - idade))
elif (idade == 18):
    print('Está na hora de se alistar.')
else:
    print('Já passou do tempo de se alistar! Você está atrasado em {} ano(s).'.format(
        idade - 18))

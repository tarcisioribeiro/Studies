# Confederação de Natação - Categorias
idade = int(input('Informe a idade do federado: '))
print('')
if(idade <= 9):
    print('MIRIM')
elif(idade > 9 and idade <= 14):
    print('INFANTIL')
elif(idade > 14 and idade <= 19):
    print('JUNIOR')
elif(idade > 19 and idade <= 20):
    print('SÊNIOR')
else:
    print('MASTER')
print()

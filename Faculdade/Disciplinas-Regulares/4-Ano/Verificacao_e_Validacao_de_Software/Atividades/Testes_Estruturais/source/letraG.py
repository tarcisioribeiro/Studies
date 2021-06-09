novosalario = 0

salario = float(input('Informe o seu salário: '))

if salario <= 500:
    novosalario = salario * 1.2
elif salario > + 500:
    novosalario = salario * 1.1

elif salario < 0:
    while salario < 0:
        salario = float(
            input('Número inválido. Informe o seu salário corretamente: '))
        if salario <= 500:
            novosalario = salario * 1.2
        elif salario > + 500:
            novosalario = salario * 1.1

print('O seu novo salário é de R$ {}.'.format(int(novosalario)))

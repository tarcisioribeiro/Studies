print()
sexo = str(input('Informe o seu sexo: ')).strip().upper()[0]
while (sexo not in 'MmFf'):
    sexo = str(input('Dados inválidos. Digite o sexo novamente: ')
               ).strip().upper()[0]
print('Sexo {} registrado com Sucesso.'.format(sexo))

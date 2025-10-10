# Analisador completo utilizando laço de iteração e estrutura de decisão

print()
somaidade = 0
mediaidade = 0
maioridadehomem = 0
nomevelho = ''
totmulher20 = 0
for c in range(1, 5):
    print('   {} ª PESSOA   '.format(c))
    print()
    nome = str(input('Informe o nome da {}ª pessoa: '.format(c))).strip()
    idade = int(input('Informe a idade da {}ª pessoa: '.format(c)))
    sexo = str(input('Informe o sexo da {}ª pessoa [M/F]: '.format(c))).strip()
    somaidade += idade
    if c == 1 and sexo in 'Mm':
        maioridadehomem = idade
        nomevelho = nome
    if sexo in 'Mm' and idade > maioridadehomem:
        maioridadehomem = idade
        nomevelho = nome
    if sexo in 'Ff' and idade < 20:
        totmulher20 += 1
print()
mediaidade = somaidade / 4
print('A média de idade das 4 pessoas é de {} anos.'.format(mediaidade))
print('O homem mais velho tem {} e se chama {}.'.format(maioridadehomem, nomevelho))
print('O total de mulheres abaixo dos 20 anos é de {}.'.format(totmulher20))
print()

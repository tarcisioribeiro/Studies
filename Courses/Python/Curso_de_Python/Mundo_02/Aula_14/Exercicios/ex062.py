print()
primeiro = int(input('Informe o primeiro termo da PA: '))
print()
razão = int(input('Informe a razão da PA: '))
print()
termo = primeiro
cont = 1
total = 0
mais = 10
while mais != 0:
    total = total + mais
    while cont <= total:
        print('{} -> '.format(termo), end='')
        termo += razão
        cont += 1
    print('Pausa.')
    print()
    mais = int(input('Quantos termos você quer mostrar a mais? '))
    print()
print('Progressão finalizada com {} termos mostrados.'.format(total))
print()

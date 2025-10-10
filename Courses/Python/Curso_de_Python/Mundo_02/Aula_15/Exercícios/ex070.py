# #Ler o preço e nome de vários produtos e perguntar ao usuário se deseja continuar. Ao final, mostar o nome do produto mais barato, quantos produtos custam mais de R$ 1000 e qual o preço total das compras.

from time import sleep

total = maisdemil = menor = cont = 0
barato = ''
while True:
    print()
    sleep(1)
    produto = str(input('Informe o produto do produto: '))
    preço = float(input('Informe o preço do produto: R$ '))
    cont += 1
    total += preço
    if preço > 1000:
        maisdemil += 1
    if cont == 1 or preço < menor:
        menor = preço
        barato = produto
    resp = ' '
    while resp not in 'SN':
        resp = str(input('Deseja continuar? [S/N]: ')).strip().upper()[0]
    if resp == 'N':
        break
sleep(1)
print()
sleep(1)
print('{:-^40}'.format('Fim do programa'))
sleep(1)
print()
sleep(1)
print(
    f'O produto mais barato foi {barato}, que custou R$ {menor:.2f}.\n{maisdemil} Produtos custaram mais de R$ 1000.\nO preço total das compras foi de R$ {total:.2f}.')
sleep(1)
print()

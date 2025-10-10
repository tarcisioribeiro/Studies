tupla = ('Pão', 1, 'Leite', 3.50, 'Doce', 7,
         'Arroz', 15, 'Feijão', 23.50, 'Batata', 13)

print('---------------------------------------------------')
print('               LISTAGEM DE PREÇOS                  ')
for produto, preco in range(0, len(tupla)):
    print(f'{tupla[produto]}..........................R$       {tupla[preco]}')

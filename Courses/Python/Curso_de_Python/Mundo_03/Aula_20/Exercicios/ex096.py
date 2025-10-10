def area(largura, comprimento):
    area = largura * comprimento
    print(f'A área de um terreno {largura}x{comprimento} é de {area} m²')

get_largura = float(input('Largura (m): '))
get_comprimento = float(input('Comprimento (m): '))

area(largura=get_largura, comprimento=get_comprimento)
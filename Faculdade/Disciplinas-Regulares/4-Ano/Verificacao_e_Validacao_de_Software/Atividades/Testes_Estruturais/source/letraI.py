totCarros = int(input('Informe a quantidade de carros vendidos:'))
totVendas = float(input('Informe o valor total das vendas:'))
sfixo = float(input('Informe o salário fixo:'))
cmVenda = float(input('Informe a comissão por veículo vendido:'))

if (totCarros < 0) or (totVendas < 0) or (sfixo < 0) or (cmVenda < 0):

    while (totCarros < 0) or (totVendas < 0) or (sfixo < 0) or (cmVenda < 0):

        print('Há um ou mais valores anteriores incorretos.')

        totCarros = int(input('Informe a quantidade de carros vendidos:'))
        totVendas = float(input('Informe o valor total das vendas:'))
        sfixo = float(input('Informe o salário fixo:'))
        cmVenda = float(input('Informe a comissão por veículo vendido:'))

sfinal = sfixo + (cmVenda * totCarros) + (totVendas * 0.05)

print('O salário final do vendedor é de R$ {}.'.format(int(sfinal)))

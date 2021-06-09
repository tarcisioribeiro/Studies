distribuidor = 0.28
impostos = 0.45

custofabrica = float(input('Informe o custo de fábrica do veículo: '))

custofinal = custofabrica + (custofabrica * (distribuidor + impostos))

print('O custo final do veículo é de R$ {}.'.format(int(custofinal)))

from datetime import datetime

dados = {}

dados['nome'] = str(input('\nNome: '))
dados['idade'] = datetime.now().year - int(input('Informe o ano de nascimento: '))
dados['ctps'] = int(input('Informe o número da carteira de trabalho (0 não tem): '))
if dados['ctps']  != 0:
    dados['contratação'] = int(input('Ano de contratação: '))
    dados['salário'] = float(input('Salário: R$ '))
    dados['aposentadoria'] = dados['idade'] + (dados['contratação'] + 35) - datetime.now().year
print()
for k, v in dados.items():
    print(f'- {k} tem o valor {v}.')
print()
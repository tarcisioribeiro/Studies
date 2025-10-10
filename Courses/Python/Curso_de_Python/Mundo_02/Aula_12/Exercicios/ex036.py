# Empréstimo bancário
nome = str(input('Oi, bom dia! Qual o seu nome? '))
print()
salario = int(input('{}, me diga qual o valor do seu salário: '.format(nome)))
print()
valorcasa = int(
    input('Ok, {}. Qual o valor do imóvel que deseja comprar? '.format(nome)))
print()
tempo = int(input('Em quanto tempo deseja financiar o imóvel? '))
print()

calc = valorcasa/(tempo * 12)

print('Processando as informações...')
print()
if (calc / salario > 0.3):
    print('Nos desculpe {}, seu empréstimo foi negado.'.format(nome))
else:
    print('Parabéns, {}. Seu empréstimo foi aprovado.'.format(nome))

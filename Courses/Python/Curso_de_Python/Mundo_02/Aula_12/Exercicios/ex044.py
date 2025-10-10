# Juros de valor pago sobre um produto

# Vamos melhorar esse exercício!!!

# Ok, acho que está bom assim!!
from time import sleep
from emoji import emojize
print()
produto = float(input('Informe o valor do produto: '))
print()
sleep(1)
pagamento = str(input(emojize('Selecione o método de pagamento:\n\nA - À vista (dinheiro/cheque) :dollar: \nB - À vista - cartão :credit_card: \nC - 2 vezes no cartão :credit_card: \nD - 3 ou mais vezes no cartão :credit_card: \n\nInforme sua opção: ', use_aliases=True)))
print()
sleep(1)
if(pagamento == 'A'):
    print('O valor do pagamento é de R$ {:.2f}.'.format(produto*0.9))
    print()
elif(pagamento == 'B'):
    print('O valor do pagamento é de R$ {:.2f}.'.format(produto*0.95))
    print()
elif(pagamento == 'C'):
    print('O valor do pagamento é de R$ {:.2f}.'.format(produto))
    print()
elif(pagamento == 'D'):
    print('O valor do pagamento é de R$ {:.2f}.'.format(produto*1.2))
    print()
else:
    print('Erro no pagamento, tente de novo.')
    print()

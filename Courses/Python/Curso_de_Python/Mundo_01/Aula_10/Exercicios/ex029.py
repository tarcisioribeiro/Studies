# Corrigido

print('Exercício 029')
print()

# Recebe a velocidade em que o carro estava transitando
vel = int(input('Informe a velocidade do carro: '))
print()

# Analiza se o motorista deve ser multado
if vel > 80:
    # Mensagem de retorno caso o limite tenha sido ultrapassado
    print('Você foi multado! Sua multa é de R$ {}.'.format((vel-80)*7))
print()

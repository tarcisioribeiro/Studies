# Corrigido

# Importa o operador de randomização da biblioteca math do Python
from random import randint
print('Exercício 028')
print()

# Bloco de escolha de um número aleatório
npc = randint(0, 5)

# Pergunta ao usuário o número em que o computador está pensando
print('Vamos brincar? Estou pensando em um número de 0 a 5. Tente adivinhar!!!')
print()
nuser = int(input('Qual o número em que estou pensando? '))
print()

# Bloco de verificação do número
if nuser == npc:
    # Condição para verdadeiro
    print('Parabéns, você acertou! o número escolhido pelo computador foi {}.'.format(npc))
else:
    # Condição para falso
    print('Você errou. O número que o computador escolheu é {}.'.format(npc))
print()

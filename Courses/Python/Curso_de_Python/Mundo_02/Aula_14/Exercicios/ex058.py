from random import randint
print()
print('Tente adivinhar o número que estou pensando!')
print()
npc = randint(0, 10)
nuser = -1
palpite = 0
while (npc != nuser):
    nuser = int(input('Qual o número que eu pensei? '))
    print()
    if(nuser == npc):
        print('Parabéns! Você acertou!')
        print()
    elif(nuser < npc):
        print('Mais! Tente novamente.')
        print()
        palpite += 1
    elif(nuser > npc):
        print('Menos! Tente novamente.')
        print()
        palpite += 1
print('Foram necessárias {} tentativas para acertar o número.'.format(palpite))
print()

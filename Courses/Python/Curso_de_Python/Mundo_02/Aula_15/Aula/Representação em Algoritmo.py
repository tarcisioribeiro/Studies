# Representação em algoritmo da estrutura de repetição While usando o 'Interrompa'

# enquanto Verdadeiro
#     se bloco
#         passo
#     se vazio
#         pula
#     se moeda
#         pega
#     se troféu
#         pula
#         interrompa
# pega

# Representação em Python da estrutura de repetição While usando o 'Interrompa'

bloco = 0
vazio = 0
moeda = 0
troféu = 0
passo = 'comando'
vazio = 'comando'
pula = 'comando'
pega = 'comando'

while True:
    if bloco:
        passo
    if vazio:
        pula
    if moeda:
        pega
    if troféu:
        pula
        break
pega
# Corrigido

# Com parâmetros
nome = 'Guanabara'
cores = {'limpa': '\033[m',
         'azul': '\033[34m',
         'amarelo': '\033[33m',
         'verde': '\033[32m',
         'pretoebranco': '\033[7;30m'}

print()
print('Muito prazer em te conhecer, {}{}{}!'.format(
    cores['verde'], nome, cores['limpa']))
print()

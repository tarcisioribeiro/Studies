# Corrigido

print('Exercício 023')
print()

# Bloco de entrada
num = int(input('Informe um número inteiro: '))
print()
print('Analisando o número {}'.format(num))
print()

# Bloco de cálculo
u = num // 1 % 10
d = num // 10 % 10
c = num // 100 % 10
m = num // 1000 % 10

# Bloco de saída
print('Unidades: {}'.format(u))
print('Dezenas: {}'.format(d))
print('Centenas: {}'.format(c))
print('Milhares: {}'.format(m))
print()

# Bloco de descarte

'''num = input('Informe um número inteiro: ')
print()
lista = num.split()
unidade = lista[3]
dezena = lista[2]
centena = lista[1]
milhar = lista[0]
print('Unidades: {} \
       Dezenas:  {} \
       Centenas: {} \
       Milhares: {}'.format(unidade, dezena, centena, milhar))'''

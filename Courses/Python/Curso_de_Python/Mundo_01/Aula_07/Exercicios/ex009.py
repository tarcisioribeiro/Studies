# Corrigido

print('Exercício 009')
print()

# Bloco de entrada
n = int(input('Informe um número inteiro: '))
print()

# Bloco de análise e saída
if(n <= 0):
    print('Erro')
    print()
if(n > 0):
    for i in range(0, 10+1):
        print('{}*{} é igual a: {}.'.format(n, i, (n*i)))
print()

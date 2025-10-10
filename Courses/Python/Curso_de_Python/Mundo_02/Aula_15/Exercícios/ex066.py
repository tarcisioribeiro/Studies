# Ler vários números e somar a quantidade de números digitados enquanto o número digitado for diferente de 999. Imprimir os resultados no final.

print()
n = cont = soma = 0
while True:
    n = int(input('Digite um número inteiro (999 para parar): '))
    if n == 999:
        break
    cont += 1
    soma += n
print()
print(
    f'O total de números digitados foi de {cont}, e a soma dos números é igual a {soma}.')
print()

# Analisador de maioridade utilizando laço de iteração e estrutura de decisão

print()
m = 0
n = 0
for c in range(0, 7):
    p = int(input('Informe sua idade: '))
    if(p < 21):
        n += 1
    else:
        m += 1
print('{} pessoas atingiram a maioridade e {} pessoas ainda não atingiram a maioridade.'.format(m, n))
print()

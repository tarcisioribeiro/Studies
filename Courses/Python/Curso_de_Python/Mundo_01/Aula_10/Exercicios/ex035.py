# Corrigido

print('Exercício 035')
print()

# Bloco de entradas
l1 = int(input('Informe o primeiro lado do triângulo: '))
print()
l2 = int(input('Informe o segundo lado do triângulo: '))
print()
l3 = int(input('Informe o terceiro lado do triângulo: '))
print()

# Bloco de análises
if(((l1 + l2) > l3) and ((l2 + l3) > l1) and ((l1 + l3) > l2)):
    # Retornado caso seja possível montar um triângulo
    print('Sim, é possível montar um triângulo com essas medidas.')
else:
    # Retornado caso não seja possível montar um triângulo
    print('Não é possível montar um triângulo com essas medidas.')
print()

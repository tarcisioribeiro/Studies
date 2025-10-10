# Lados dos triângulos

print('Exercício 035')
print()

l1 = int(input('Informe o primeiro lado do triângulo: '))
print()
l2 = int(input('Informe o segundo lado do triângulo: '))
print()
l3 = int(input('Informe o terceiro lado do triângulo: '))
print()

if(((l1 + l2) > l3) and ((l2 + l3) > l1) and ((l1 + l3) > l2)):
    print('Sim, é possível montar um triângulo com essas medidas.')
else:
    print('Não é possível montar um triângulo com essas medidas.')
print()

if((l1 == l2) and (l2 == l3) and (l1 == l3)):
    print('Equilátero - todos os lados iguais.')
elif((l1 == l2) or (l2 == l3) or (l1 == l3)):
    print('Isósceles - dois lados iguais.')
else:
    print('Escaleno - todos os lados diferentes.')

print()

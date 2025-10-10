# Corrigido

# Bloco de importação
from math import radians, sin, cos, tan
print('Exercício 018')
print()

# Bloco de entrada
angulo = float(input('Informe o ângulo do círculo: '))
print()

# Bloco de cálculo e saída
seno = sin(radians(angulo))
print('O ângulo de {}° tem o seno de {:.2f}.'.format(angulo, seno))
cosseno = cos(radians(angulo))
print('O ângulo de {}° tem o cosseno de {:.2f}.'.format(angulo, cosseno))
tangente = tan(radians(angulo))
print('O ângulo de {}° tem a tangente de {:.2f}.'.format(angulo, tangente))
print()

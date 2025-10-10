# Média de duas notas
n1 = float(input('Informe sua primeira nota: '))
print()
n2 = float(input('Informe a segunda nota: '))
print()
media = (n1 + n2) / 2
if(media < 5):
    print('REPROVADO')
elif(media > 5 and media <= 6.9):
    print('RECUPERAÇÃO')
else:
    print('APROVADO')

#Ler a idade e sexo de várias pessoas, perguntar ao usuário se ele deseja continuar e mostrar o resultado das seguintes condições:
# . Quantas pessoas são maiores de 18 anos.
# . Quantos homens foram cadastrados.
# . Quantas mulheres tem menos de 20 anos.

quanthomem = 0
idade = 0
mulher20 = 0
maior18 = 0

while True:    
    print()
    idade = int(input('Informe a idade da pessoa: '))
    sexo = ' '
    while sexo not in 'MF':
        sexo = str(input('Informe o sexo da pessoa (M/F): ')).strip().upper()
    if idade >= 18:
        maior18 += 1
    if sexo == 'M':
        quanthomem += 1
    if sexo == 'F' and idade < 20:
        mulher20 +=1
    progresso = ' '
    while progresso not in 'SN':
        progresso = str(input('Deseja continuar? (S/N): ')).strip().upper()
    if progresso == 'N':
        break
print()
print(f'{maior18} pessoas maiores de 18 anos foram registradas.\n{quanthomem} homens foram registrados.\n{mulher20} mulheres menores de 20 anos foram registradas.')
print()

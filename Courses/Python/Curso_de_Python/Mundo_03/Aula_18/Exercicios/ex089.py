boletim = []
while True:
    nome = str(input('Qual o nome do aluno? ')).strip().title()
    n1 = float(input('Qual a nota do aluno? '))
    n2 = float(input('Qual a segunda nota do aluno? '))
    media = (n1 + n2) / 2
    boletim.append([nome, [n1, n2], media])
    perg = str(input('Deseja resgistrar outro aluno? [S/N] ')).strip().upper()[0]
    if perg not in 'SN':
        print('\033[33mNão entendi...', end=' ')
        perg = str(input('\033[mResponda com [S/N]: ')).strip().upper()[0]
        if perg == 'N':
            break
    if perg == 'N':
        break
print('-=' * 5, 'BOLETIM', '=-' * 5)
print(f'{"Nº":<4}{"NOME ":<10}{"NOTA":>8}')
print('-' * 25)
for i, aluno in enumerate(boletim):
   print(f'{i:<4}{aluno[0]:<10}{aluno[2]:>8}')

while True:
    continuar = int(input('Digite o número do aluno para ver a nota (999 para parar): '))
    if continuar == 999:
        break
    if continuar <= len(boletim):
        print(f'As notas do aluno {boletim[continuar][0]} são {boletim[continuar][1]}')
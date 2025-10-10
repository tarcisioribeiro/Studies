# Corrigido
print('Exercício 022')
print()

# Bloco de entrada
nome = str(input('Informe o seu nome completo: ')).strip()
print()
print('Analisando seu nome...')
print()

# Bloco de análise e saída
print('Seu nome com todas as letras maiúsculas: {}'.format(nome.upper()))
print('Seu nome com todas as letras minúsculas: {}'.format(nome.lower()))
print('Seu nome tem {} letras.'.format(len(nome) - nome.count(' ')))
print()
#print('Seu primeiro nome tem {} letras.'.format(nome.find(' ')))
separa = nome.split()
print('Seu primeiro nome é {} e ele tem {} letras.'.format(
    separa[0], len(separa[0])))
print()



def voto(ano_nascimento):
    from datetime import datetime
    atual = datetime.now().year
    idade = atual - ano_nascimento
    if idade < 16:
        return f'Com {idade} anos: NÃO VOTA.'
    elif 16 <= idade < 18 or idade > 65:
        return f'Com {idade} anos: VOTO OPCIONAL.'
    else:
        return f'Com {idade} anos: VOTO OBRIGATÓRIO.'

get_ano_nascimento = int(input('Em que ano você nasceu? '))
print(voto(get_ano_nascimento))
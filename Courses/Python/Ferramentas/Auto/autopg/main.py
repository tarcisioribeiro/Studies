from pyautogui import sleep, press, write, hotkey


sleep(1)
chave = str(input('\nInforme o usuário ou nome do site: '))
print()
sleep(1)
senha = '"@' + chave + 'orrARDrdr27!' + chave + '@"'
sleep(1)
press('win')
sleep(1)
write('Bloco de Notas')
sleep(1)
press('enter')
sleep(2)
write(senha)
sleep(1)
hotkey('ctrl', 'c')
sleep(1)

# Comment
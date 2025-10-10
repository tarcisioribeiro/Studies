from socket import gethostname, gethostbyname
from time import sleep
from requests import get


machine = gethostname()
local_ip = gethostbyname(machine)
external_ip = get('https://api.ipify.org').content.decode('utf8')

sleep(0.25)
print()
sleep(0.25)
print('O endereço de IP interno é : {}'.format(local_ip))
sleep(0.25)
print()
sleep(0.25)
print('O endereço de IP externo é: {}'.format(external_ip))
sleep(0.25)
print()

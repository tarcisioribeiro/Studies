from tkinter import Tk, Button
from download import DownloadYoutube
from info import InfoMaquina


class MontaTela():
    def __init__(self):
        janela = Tk()
        janela.geometry('800x600')
        janela.config(bg='#f0f0f0')

        botaodownload = Button(janela, text='Baixar vídeo do Youtube',
                               command=DownloadYoutube, bg='#00008B', fg='#f0f0f0', font=('Microsoft Sans Serif', 12), borderwidth=10, relief='raised', justify='center')
        botaodownload.grid(column=0, row=1, padx=10, pady=10)
        botaodownload.config(height=1, width=25)

        botaoinfo = Button(janela, text='Informações da Máquina',
                           command=InfoMaquina, bg='#00008B', fg='#f0f0f0', font=('Microsoft Sans Serif', 12), borderwidth=10, relief='raised', justify='center')
        botaoinfo.grid(column=0, row=2, padx=10, pady=10)
        botaoinfo.config(height=1, width=25)

        botao_saida = Button(janela, text="Sair", command=janela.destroy, bg='#cf1313', fg='#f0f0f0', font=(
            'Microsoft Sans Serif', 12), borderwidth=10, relief='raised', justify='center')
        botao_saida.grid(column=1, row=1, padx=5, pady=5)
        botao_saida.config(height=1, width=10)

        janela.mainloop()


MontaTela()

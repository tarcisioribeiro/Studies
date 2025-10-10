from pytube import YouTube
from tkinter import simpledialog, messagebox
import os


def DownloadYoutube():

    video = ''
    video = simpledialog.askstring('', 'Informe aqui a URL do vídeo: ')
    video = str(video)

    if 'https://www.youtube.com/watch' not in video:
        messagebox.showerror(
            title='Erro', message='Esta URL não condiz com uma URL do Youtube!')
    if 'https://www.youtube.com/watch' in video:
        caminho = ''
        if os.name == 'posix':
            caminho = '/media/tarcisio/Novo volume/Videos/Downloads'
        if os.name == 'nt':
            caminho = 'D:/Videos/Downloads'
    print()

    yt = YouTube(video)
    yt.streams.filter(file_extension="mp4").get_by_resolution(
        "720p").download(caminho)

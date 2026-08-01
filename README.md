# Estudos

Repositório pessoal de estudos: materiais de curso, exercícios e projetos práticos em várias linguagens, além dos certificados de conclusão correspondentes.

## Sumário

- [Certificados](#certificados)
- [Python](#python)
- [HTML / CSS](#html--css)
- [PHP](#php)
- [JavaScript / TypeScript](#javascript--typescript)
- [Licença](#licença)

## Certificados

PDFs em `Certificates/`, organizados por tecnologia:

| Curso | Instituição | Carga horária | Conclusão | Arquivo |
|---|---|---|---|---|
| Começando com Angular | balta.io | 2,2h | 09/01/2021 | `Certificates/Angular/Começando-com-Angular.pdf` |
| Criando seu primeiro App com Flutter | balta.io | 2,1h | 14/10/2020 | `Certificates/Flutter/Criando-seu-primeiro-App-com-Flutter.pdf` |
| Lógica de programação com Dart | balta.io | 5,3h | 11/11/2020 | `Certificates/Flutter/Logica-de-programacao-com-Dart.pdf` |
| Flutter Apps: Álcool ou Gasolina | balta.io | 1h | 21/04/2021 | `Certificates/Flutter/Flutter_Apps-Alcool-ou-Gasolina.pdf` |
| Flutter Apps: IMC com Material, Cupertino e BLoC | balta.io | 28min | 22/04/2021 | `Certificates/Flutter/Flutter_Apps-IMC-com-Material-Cupertino-e-BLoC.pdf` |
| Git e GitHub | Curso em Vídeo | 20h | 11/10/2020 | `Certificates/Git_e_Github/Git_e_Github.pdf` |
| Linux | Curso em Vídeo | 40h | 05/05/2021 | `Certificates/Linux/Tarcisio-Ribeiro-Linux-40-Horas-Certificado-Curso-em-Video.pdf` |
| Introdução ao banco de dados MySQL | Udemy | 30min | 23/03/2021 | `Certificates/MySQL/doc.pdf` |
| Python 3 - Mundo 1 | Curso em Vídeo | 40h | 05/09/2020 | `Certificates/Python/Tarcisio-Ribeiro-Python-3-8211-Mundo-1-40-Horas-Certificado-Curso-em-Video.pdf` |
| Python 3 - Mundo 2 | Curso em Vídeo | 40h | 15/01/2021 | `Certificates/Python/Tarcisio-Ribeiro-Python-3-8211-Mundo-2-40-Horas-Certificado-Curso-em-Video.pdf` |

### Pendentes de inclusão

Já concluídos, mas ainda não copiados para este repositório:

- **Python 3 - Mundo 3** (Curso em Vídeo, 40h, 20/11/2024)
- **Curso de Endereçamento IPv4** (Curso em Vídeo, 20h, 18/01/2025)

### Certificados profissionais

Certificações profissionais (não relacionadas a um curso deste repositório) ficam fora de `Certificates/` e são versionadas separadamente:

- **Django Master** (PycodeBR, 45h, 13/02/2025) — `~/Downloads/Portfolio/Certificates/Programming/PyCode/Django_Master.pdf`
- **English A1** — `~/Downloads/Portfolio/Certificates/Languages/A1_certificate.png`

Outros certificados profissionais serão adicionados a essa lista à medida que forem emitidos.

## Python

Código em `Courses/Python/`, dividido em três áreas:

### Curso de Python (`Curso_de_Python/`)

Exercícios do curso organizados por "Mundos":

- `Mundo_01/` — Aulas 5 a 11 (fundamentos)
- `Mundo_02/` — Aulas 12 a 15 (condições, laços)
- `Mundo_03/` — Aulas 16 a 23 (listas, tuplas, dicionários, funções, módulos)

Cada aula tem uma pasta `Aula/` (código da lição) e `Exercicios/` (exercícios propostos).

```bash
cd Courses/Python/Curso_de_Python/Mundo_03/Aula_22/Exercicios/ex112
python teste.py
```

### Jogos (`Games/`)

Jogos interativos em pygame, cada um com `main.py`, `source/` (lógica) e `library/` (áudio/assets):

- `Jogo_de_Aventura/` — jogo de decisões em texto, com áudio (pygame.mixer) e emojis
- `Jogo_do_Carrinho/` — jogo com múltiplos cenários/países
- `Roleta_Russa/` — simulação de roleta russa

```bash
pip install pygame emoji
cd Courses/Python/Games/Jogo_de_Aventura
python main.py
```

### Ferramentas (`Ferramentas/`)

Utilitários de automação:

- `Auto/autopg/` — gera e copia uma senha para a área de transferência via Bloco de Notas (pyautogui)
- `Auto/autopm/` — automação de login em página web via mouse/teclado (pyautogui)
- `Auto/autowsl/` — exibe IP interno/externo da máquina (socket, requests)
- `Others/` — utilitário com interface Tkinter para baixar vídeos do YouTube (pytube) e exibir informações da máquina (socket, pyautogui)

```bash
pip install pyautogui requests pytube
cd Courses/Python/Ferramentas/Auto/autopg
python main.py
```

## HTML / CSS

Curso HTML5 e CSS3 em `Courses/HTML/Curso HTML5 e CSS3/Módulo 1/`:

- `Desafios/` — desafios práticos (d001-d003)
- `Exercícios/` — exercícios do módulo (ex000-ex009)
- `Material/` — PDFs teóricos por capítulo

Cada exercício/desafio tem seu próprio `index.html` e assets (imagens, favicons).

```bash
xdg-open "Courses/HTML/Curso HTML5 e CSS3/Módulo 1/Exercícios/ex001/index.html"
```

## PHP

Exercícios básicos em `Courses/PHP/cursophp/` (aula001, ex000-ex002), cada um em sua própria pasta com `index.php`.

```bash
cd Courses/PHP/cursophp/ex001
php -S localhost:8000
```

`copy_archives.sh` copia `cursophp/` para o htdocs de um XAMPP/LAMPP local (`/opt/lampp/htdocs`), para quem preferir rodar via Apache em vez do servidor embutido do PHP.

## JavaScript / TypeScript

Código em `Courses/JavaScript/`:

- `NodeJS/` — servidor Express básico (`index.js`), com script de desenvolvimento via `nodemon`
- `TypeScript/` — exemplos soltos de sintaxe TypeScript (`index.ts`)

```bash
cd Courses/JavaScript/NodeJS
yarn install
yarn dev
```

```bash
cd Courses/JavaScript/TypeScript
npx ts-node index.ts
```

## Licença

Distribuído sob a licença MIT — veja [LICENSE](LICENSE).

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal learning repository ("Estudos" = Studies) containing course materials, exercises, and projects across multiple programming languages and technologies. The repository is organized into two main sections:

- **Certificates/**: PDF certificates from completed courses (Angular, Flutter, Git/GitHub, Linux, MySQL, Python)
- **Courses/**: Active learning materials and projects organized by technology

## Repository Structure

### Python (`Courses/Python/`)

The Python section is divided into three categories:

1. **Curso_de_Python/**: Structured course exercises organized by "Mundos" (Worlds):
   - `Mundo_01/`: Aulas 5-11 (Basic Python fundamentals)
   - `Mundo_02/`: Aulas 12-15 (Intermediate concepts: conditions, loops)
   - `Mundo_03/`: Aulas 16-23 (Advanced topics: lists, tuples, dictionaries, functions, modules)
   - Each aula contains `Aula/` (lesson files) and `Exercicios/` (exercises)
   - Exercise 112 and similar demonstrate package structure with `utilidadescev` module pattern

2. **Games/**: Interactive Python games with audio support:
   - `Jogo_de_Aventura/`: Adventure game using pygame.mixer for audio, emoji library for visual effects
     - Structure: `main.py` entry point, `source/` for game logic (eventos, decisoes, fases), `library/` for audio files
   - `Jogo_do_Carrinho/`: Car game with multiple environments
   - `Roleta_Russa/`: Russian roulette simulation
   - All games follow pattern: `main.py` + `source/` (logic) + `library/` (assets)

3. **Ferramentas/**: Automation utilities:
   - `Auto/autopg/`: Password generator automation using pyautogui
   - `Auto/autopm/`: Additional automation tools
   - `Auto/autowsl/`: WSL automation scripts
   - `Others/`: Miscellaneous utilities

### HTML/CSS (`Courses/HTML/`)

- **Curso HTML5 e CSS3/**: Structured HTML5/CSS3 course
  - `Módulo 1/`: Contains `Desafios/` (challenges) and `Exercícios/` (exercises)
  - `Material/`: Course PDFs organized by chapters (01-12)
  - Each exercise/challenge typically has `index.html` and supporting assets (images, favicons)

### PHP (`Courses/PHP/`)

- **cursophp/**: Basic PHP exercises (ex000, ex001, ex002)
- Each exercise in separate directory with `index.php`

### Unity (`Courses/Unity/`)

- **Jogo_2D_Deserto/**: 2D side-scrolling desert game project
  - Unity project with Assets including DesertTileset, Player animations, Enemy animations, Coins
  - Contains prefabs, animations (.anim), controllers, and sprite assets

## Running Projects

### Python Games

All Python games require:
```bash
# Install dependencies (if needed)
pip install pygame emoji

# Run from game directory
cd Courses/Python/Games/Jogo_de_Aventura
python main.py
```

### Python Course Exercises

```bash
# Navigate to specific exercise
cd Courses/Python/Curso_de_Python/Mundo_03/Aula_22/Exercicios/ex112
python teste.py
```

### HTML Exercises

Open HTML files directly in browser:
```bash
# Example
xdg-open "Courses/HTML/Curso HTML5 e CSS3/Módulo 1/Exercícios/ex001/index.html"
```

### PHP Exercises

Requires PHP server:
```bash
cd Courses/PHP/cursophp/ex001
php -S localhost:8000
```

## Architecture Notes

### Python Game Pattern
- **Entry point**: `main.py` imports main game logic and initializes pygame mixer
- **Source organization**: Logic split into modules (eventos, decisoes, fases)
- **Assets**: Audio files (.mp3) and visual resources in `library/` directory
- **Dependencies**: pygame for audio, emoji for text enhancements, datetime for timestamps

### Python Module Structure (Advanced Exercises)
- Later exercises (ex107+) demonstrate custom package creation
- Pattern: `utilidadescev/` package with submodules (`moeda/`, `dado/`)
- Each submodule has `__init__.py` for imports

### Unity Project
- Standard Unity 2D project structure
- Animation system uses Unity Animator controllers
- Prefabs for reusable game objects (Player, Enemy, Coins)
- Tileset-based level design with DesertTileset

## File Organization

- Course materials include both practical code and theoretical PDFs
- Exercises are numbered sequentially (ex001, ex002, etc.)
- Portuguese naming throughout (Aula = Lesson, Exercícios = Exercises, Desafios = Challenges)
- Git attributes configured per language subdirectory for proper line ending handling

@echo off
chcp 65001 >nul
echo ========================================
echo Завантаження проекту на GitHub
echo ========================================
echo.

REM Перевірка наявності Git
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo [ПОМИЛКА] Git не встановлено!
    echo.
    echo Будь ласка, встановіть Git з https://git-scm.com/download/win
    echo Після встановлення перезапустіть цей скрипт.
    pause
    exit /b 1
)

echo [OK] Git знайдено
git --version
echo.

REM Перехід до директорії проекту
cd /d "%~dp0"

REM Ініціалізація репозиторію (якщо ще не ініціалізовано)
if not exist ".git" (
    echo [1/5] Ініціалізація Git репозиторію...
    git init
    echo [OK] Репозиторій ініціалізовано
) else (
    echo [1/5] Git репозиторій вже ініціалізовано
)
echo.

REM Додавання файлів
echo [2/5] Додавання файлів до staging...
git add .
echo [OK] Файли додані
echo.

REM Створення коміту
echo [3/5] Створення коміту...
git commit -m "Initial commit: NestJS API з ендпоінтами для товарів та послуг"
if %errorlevel% neq 0 (
    echo [УВАГА] Немає змін для коміту або коміт вже існує
)
echo.

REM Додавання remote репозиторію
echo [4/5] Налаштування remote репозиторію...
git remote remove origin 2>nul
git remote add origin https://github.com/mazrgre/lab3.git
echo [OK] Remote репозиторій додано
echo.

REM Встановлення гілки main
echo [5/5] Встановлення гілки main...
git branch -M main
echo.

REM Завантаження на GitHub
echo ========================================
echo Завантаження на GitHub...
echo ========================================
echo.
echo УВАГА: Можливо знадобиться автентифікація!
echo Якщо виникне помилка автентифікації:
echo 1. Створіть Personal Access Token на GitHub
echo    (Settings ^> Developer settings ^> Personal access tokens)
echo 2. Використайте токен замість пароля
echo.
pause

git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo [УСПІХ] Проект завантажено на GitHub!
    echo ========================================
    echo URL: https://github.com/mazrgre/lab3
    echo.
) else (
    echo.
    echo ========================================
    echo [ПОМИЛКА] Не вдалося завантажити проект
    echo ========================================
    echo.
    echo Можливі причини:
    echo 1. Не налаштована автентифікація GitHub
    echo 2. Репозиторій не існує або немає доступу
    echo 3. Потрібен Personal Access Token
    echo.
    echo Спробуйте виконати команду вручну:
    echo git push -u origin main
    echo.
)

pause

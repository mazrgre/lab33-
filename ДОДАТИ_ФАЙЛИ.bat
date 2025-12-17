@echo off
chcp 65001 >nul
echo ========================================
echo Додавання недостатніх файлів на GitHub
echo ========================================
echo.

REM Перевірка наявності Git
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo [ПОМИЛКА] Git не встановлено!
    echo Будь ласка, встановіть Git з https://git-scm.com/download/win
    pause
    exit /b 1
)

REM Перехід до директорії проекту
cd /d "%~dp0"

echo [1/4] Перевірка статусу репозиторію...
git status
echo.

echo [2/4] Додавання всіх нових та змінених файлів...
git add .
echo [OK] Файли додані до staging
echo.

echo [3/4] Створення коміту...
git commit -m "Додано недостатні файли"
if %errorlevel% neq 0 (
    echo [УВАГА] Немає нових змін для коміту
    echo Можливо всі файли вже завантажені
    echo.
) else (
    echo [OK] Коміт створено
    echo.
)

echo [4/4] Завантаження на GitHub...
git push origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo [УСПІХ] Файли успішно завантажено!
    echo ========================================
) else (
    echo.
    echo [ПОМИЛКА] Не вдалося завантажити файли
    echo Перевірте автентифікацію та спробуйте знову
)

echo.
pause

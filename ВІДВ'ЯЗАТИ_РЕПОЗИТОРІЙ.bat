@echo off
chcp 65001 >nul
echo ========================================
echo Відв'язка проекту від GitHub репозиторію
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

echo [1/2] Перевірка налаштованих remote репозиторіїв...
git remote -v
echo.

echo [2/2] Видалення remote репозиторію 'origin'...
git remote remove origin

if %errorlevel% equ 0 (
    echo [OK] Remote репозиторій успішно видалено
    echo.
    echo Проект більше не пов'язаний з GitHub репозиторієм.
    echo Локальний Git репозиторій залишається без змін.
    echo.
    echo Якщо потрібно видалити весь Git репозиторій:
    echo Видаліть папку .git вручну або використайте:
    echo rmdir /s /q .git
) else (
    echo [УВАГА] Remote репозиторій не знайдено або вже видалено
)

echo.
pause

# Скрипт для завантаження проекту на GitHub
# Використання: .\upload-to-github.ps1

Write-Host "Перевірка наявності Git..." -ForegroundColor Yellow

# Перевірка чи встановлений Git
try {
    $gitVersion = git --version
    Write-Host "Git знайдено: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "Помилка: Git не встановлено!" -ForegroundColor Red
    Write-Host "Будь ласка, встановіть Git з https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
}

Write-Host "`nІніціалізація Git репозиторію..." -ForegroundColor Yellow

# Ініціалізація репозиторію (якщо ще не ініціалізовано)
if (-not (Test-Path ".git")) {
    git init
    Write-Host "Git репозиторій ініціалізовано" -ForegroundColor Green
} else {
    Write-Host "Git репозиторій вже ініціалізовано" -ForegroundColor Green
}

Write-Host "`nДодавання файлів до staging..." -ForegroundColor Yellow
git add .

Write-Host "Створення коміту..." -ForegroundColor Yellow
$commitMessage = "Initial commit: NestJS API з ендпоінтами для товарів та послуг"
git commit -m $commitMessage

Write-Host "Перевірка remote репозиторію..." -ForegroundColor Yellow
$remoteUrl = "https://github.com/mazrgre/lab3.git"

# Перевірка чи вже додано remote
$existingRemote = git remote get-url origin 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "Remote 'origin' вже існує: $existingRemote" -ForegroundColor Yellow
    Write-Host "Оновлення URL..." -ForegroundColor Yellow
    git remote set-url origin $remoteUrl
} else {
    Write-Host "Додавання remote репозиторію..." -ForegroundColor Yellow
    git remote add origin $remoteUrl
}

Write-Host "`nВстановлення гілки main..." -ForegroundColor Yellow
git branch -M main

Write-Host "`nЗавантаження на GitHub..." -ForegroundColor Yellow
Write-Host "Увага: Можливо знадобиться автентифікація!" -ForegroundColor Cyan
Write-Host "Якщо виникне помилка, використайте Personal Access Token:" -ForegroundColor Cyan
Write-Host "git push -u origin main" -ForegroundColor Cyan
Write-Host "`nСпроба завантаження..." -ForegroundColor Yellow

git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n✅ Проект успішно завантажено на GitHub!" -ForegroundColor Green
    Write-Host "URL: https://github.com/mazrgre/lab3" -ForegroundColor Cyan
} else {
    Write-Host "`n❌ Помилка при завантаженні" -ForegroundColor Red
    Write-Host "Можливі причини:" -ForegroundColor Yellow
    Write-Host "1. Не налаштована автентифікація GitHub" -ForegroundColor Yellow
    Write-Host "2. Репозиторій не існує або немає доступу" -ForegroundColor Yellow
    Write-Host "`nСпробуйте виконати команду вручну:" -ForegroundColor Cyan
    Write-Host "git push -u origin main" -ForegroundColor White
}

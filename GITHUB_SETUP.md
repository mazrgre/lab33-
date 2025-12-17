# Інструкція для завантаження на GitHub

## Крок 1: Встановіть Git (якщо ще не встановлено)

Завантажте Git з https://git-scm.com/download/win та встановіть його.

## Крок 2: Ініціалізуйте репозиторій

Відкрийте PowerShell або Command Prompt у директорії проекту та виконайте:

```bash
cd C:\Users\chipc\nestjs-api
git init
```

## Крок 3: Додайте файли до репозиторію

```bash
git add .
git commit -m "Initial commit: NestJS API з ендпоінтами для товарів та послуг"
```

## Крок 4: Додайте remote репозиторій

```bash
git remote add origin https://github.com/mazrgre/lab3.git
```

## Крок 5: Завантажте на GitHub

```bash
git branch -M main
git push -u origin main
```

Якщо виникнуть проблеми з автентифікацією, можливо знадобиться:
- Налаштувати GitHub Personal Access Token
- Або використати GitHub Desktop для простішого завантаження

# NestJS API - Товари та Послуги

API додаток на NestJS з двома ендпоінтами для роботи з товарами та послугами.

## Встановлення

```bash
npm install
```

## Запуск

```bash
# Розробка
npm run start:dev

# Продакшн
npm run start:prod
```

## Ендпоінти

### GET /products
Отримати список всіх товарів та послуг

**Приклад відповіді:**
```json
[
  {
    "id": 1,
    "name": "Веб-розробка",
    "description": "Створення сучасних веб-додатків",
    "price": 5000,
    "category": "Послуги"
  },
  ...
]
```

### GET /products/:id
Отримати один товар/послугу за ID

**Приклад запиту:**
```
GET /products/1
```

**Приклад відповіді:**
```json
{
  "id": 1,
  "name": "Веб-розробка",
  "description": "Створення сучасних веб-додатків",
  "price": 5000,
  "category": "Послуги"
}
```

## Завантаження на GitHub

### Варіант 1: Використання PowerShell скрипту

```powershell
cd C:\Users\chipc\nestjs-api
.\upload-to-github.ps1
```

### Варіант 2: Вручну через Git

1. Встановіть Git з https://git-scm.com/download/win (якщо ще не встановлено)

2. Відкрийте PowerShell у директорії проекту:
```powershell
cd C:\Users\chipc\nestjs-api
```

3. Ініціалізуйте репозиторій:
```bash
git init
git add .
git commit -m "Initial commit: NestJS API з ендпоінтами для товарів та послуг"
```

4. Додайте remote репозиторій:
```bash
git remote add origin https://github.com/mazrgre/lab3.git
git branch -M main
```

5. Завантажте на GitHub:
```bash
git push -u origin main
```

**Примітка:** Якщо виникне помилка автентифікації, вам потрібно:
- Створити Personal Access Token на GitHub (Settings → Developer settings → Personal access tokens)
- Використати токен замість пароля при push

### Варіант 3: Використання GitHub Desktop

1. Встановіть GitHub Desktop з https://desktop.github.com/
2. Відкрийте GitHub Desktop → File → Add Local Repository
3. Виберіть папку `C:\Users\chipc\nestjs-api`
4. Натисніть "Publish repository" та виберіть `mazrgre/lab3`

## Технології

- NestJS
- TypeScript
- Express

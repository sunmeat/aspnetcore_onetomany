# Soccer

Навчальний вебзастосунок на **ASP.NET Core MVC**, присвячений роботі з базою даних SQL Server та зв’язком **One-to-Many** за допомогою **Entity Framework Core**.

Проєкт моделює футбольну предметну область: одна команда може мати багато гравців, а кожен гравець належить одній команді.

## Можливості

- перегляд списку футбольних команд;
- перегляд інформації про команду;
- створення, редагування та видалення команд;
- перегляд списку гравців;
- перегляд інформації про гравця разом із його командою;
- створення, редагування та видалення гравців;
- вибір команди для гравця через список;
- робота з даними через Entity Framework Core;
- зберігання даних у Microsoft SQL Server.

## Технології

- **C#**
- **.NET 10**
- **ASP.NET Core MVC**
- **Entity Framework Core 10**
- **Microsoft SQL Server**
- **Razor Views**
- **HTML / CSS**
- **Bootstrap** (через стандартний MVC-шаблон)

Проєкт використовує `Microsoft.EntityFrameworkCore.SqlServer` версії `10.0.3` та орієнтований на `net10.0`.

## Структура даних

Основні сутності:

```text
Teams
 ├── Id
 ├── Name
 ├── Coach
 └── Players[]

Players
 ├── Id
 ├── Name
 ├── Age
 ├── Position
 └── TeamId
```

Зв’язок між сутностями:

```text
Teams 1 ─────────── * Players
```

Тобто:

- одна команда має багато гравців;
- один гравець належить одній команді;
- зовнішній ключ `Players.TeamId` посилається на `Teams.Id`.

Моделі містять навігаційні властивості `Team` та `Players`, що дозволяє Entity Framework Core працювати зі зв’язком між сутностями.

## Entity Framework Core

Для роботи з базою даних використовується `SoccerContext`, який містить два набори сутностей:

```csharp
public DbSet<Players> Players { get; set; }
public DbSet<Teams> Teams { get; set; }
```

Контекст реєструється в `Program.cs` через Dependency Injection та налаштовується для роботи з SQL Server.

Для завантаження пов'язаної команди разом із гравцями використовується `Include`:

```csharp
_context.Players.Include(p => p.Team)
```

Це демонструє роботу з пов'язаними даними в Entity Framework Core.

## CRUD

Для обох сутностей реалізовано стандартні CRUD-операції.

### TeamsController

- `Index` — список команд;
- `Details` — інформація про команду;
- `Create` — створення команди;
- `Edit` — редагування команди;
- `Delete` — видалення команди.

### PlayersController

- `Index` — список гравців;
- `Details` — інформація про гравця;
- `Create` — створення гравця;
- `Edit` — редагування гравця;
- `Delete` — видалення гравця.

Під час створення або редагування гравця команда вибирається зі списку:

```csharp
ViewData["TeamId"] =
    new SelectList(_context.Teams, "Id", "Name");
```

Таким чином користувач не вводить `TeamId` вручну, а вибирає відповідну команду з доступних записів.

## База даних

У репозиторії міститься файл `script.sql`, який створює базу даних **Soccer**, таблиці `Teams` та `Players`, зв’язок між ними, індекс для `TeamId` і початкові дані.

База містить приклади відомих футбольних команд та гравців.

Основна структура SQL:

```text
Soccer
│
├── Teams
│   ├── Id
│   ├── Name
│   └── Coach
│
└── Players
    ├── Id
    ├── Name
    ├── Age
    ├── Position
    └── TeamId → Teams.Id
```

Для зв’язку використовується зовнішній ключ:

```sql
FOREIGN KEY (TeamId)
REFERENCES Teams(Id)
ON DELETE CASCADE
```

Тому видалення команди також видаляє пов'язаних із нею гравців.

## Налаштування підключення

Рядок підключення до SQL Server зберігається у конфігурації застосунку.

Приклад:

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=localhost;Database=Soccer;Trusted_Connection=True;TrustServerCertificate=True;"
  }
}
```

За потреби змініть `Server` відповідно до вашого SQL Server.

> Не зберігайте паролі та інші секрети безпосередньо в Git-репозиторії.

## Запуск проєкту

### 1. Клонування репозиторію

```bash
git clone https://github.com/sunmeat/aspnetcore_onetomany.git
cd aspnetcore_onetomany
```

### 2. Перевірка .NET

Потрібен **.NET 10 SDK**.

```bash
dotnet --version
```

### 3. Налаштування SQL Server

Створіть базу даних `Soccer` за допомогою `script.sql` або дозвольте застосунку створити базу через `Database.EnsureCreated()`.

### 4. Перевірка connection string

Переконайтеся, що `DefaultConnection` у `appsettings.json` відповідає вашому SQL Server.

### 5. Запуск

```bash
dotnet restore
dotnet run
```

Після запуску відкрийте адресу, яку покаже ASP.NET Core у консолі.

За замовчуванням застосунок відкриває контролер `Teams`:

```text
/Teams/Index
```

## Архітектура

Застосунок побудований за патерном **MVC**:

```text
                ┌───────────────┐
                │     View      │
                │ Razor / HTML  │
                └───────▲───────┘
                        │
                        │
                ┌───────┴───────┐
                │   Controller  │
                │ Teams/Players │
                └───────┬───────┘
                        │
                        │
                ┌───────▼───────┐
                │ SoccerContext │
                │  EF Core      │
                └───────┬───────┘
                        │
                        ▼
                 ┌─────────────┐
                 │ SQL Server  │
                 └─────────────┘
```

Основні частини проєкту:

```text
Soccer/
├── Controllers/
│   ├── TeamsController.cs
│   └── PlayersController.cs
│
├── Models/
│   ├── Teams.cs
│   ├── Players.cs
│   └── SoccerContext.cs
│
├── Views/
│   ├── Teams/
│   ├── Players/
│   └── Shared/
│
├── Program.cs
├── appsettings.json
└── Soccer.csproj
```

## Навчальна мета

Проєкт демонструє практичне використання:

- ASP.NET Core MVC;
- Dependency Injection;
- Entity Framework Core;
- SQL Server;
- CRUD;
- навігаційних властивостей;
- зовнішніх ключів;
- зв'язку One-to-Many;
- `Include()` для завантаження пов'язаних даних;
- `SelectList` для вибору пов'язаної сутності у формі;
- асинхронної роботи з базою через `async/await`.

Проєкт можна використовувати як навчальний приклад для вивчення зв'язків між сутностями в Entity Framework Core.

## Ліцензія

Проєкт містить файл `LICENSE.txt`. Умови використання визначаються відповідно до ліцензії, зазначеної в репозиторії.

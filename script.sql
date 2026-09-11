USE [master]
GO
/****** Object:  Database [Soccer]    Script Date: 12.12.2025 16:52:17 ******/
CREATE DATABASE [Soccer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Soccer', FILENAME = N'C:\SQL2026\DB\Soccer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Soccer_log', FILENAME = N'C:\SQL2026\DB\Soccer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Soccer] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Soccer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Soccer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Soccer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Soccer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Soccer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Soccer] SET ARITHABORT OFF 
GO
ALTER DATABASE [Soccer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Soccer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Soccer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Soccer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Soccer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Soccer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Soccer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Soccer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Soccer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Soccer] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Soccer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Soccer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Soccer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Soccer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Soccer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Soccer] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Soccer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Soccer] SET RECOVERY FULL 
GO
ALTER DATABASE [Soccer] SET  MULTI_USER 
GO
ALTER DATABASE [Soccer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Soccer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Soccer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Soccer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Soccer] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Soccer] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Soccer] SET OPTIMIZED_LOCKING = OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Soccer', N'ON'
GO
ALTER DATABASE [Soccer] SET QUERY_STORE = OFF
GO
USE [Soccer]
GO
/****** Object:  Table [dbo].[Players]    Script Date: 12.12.2025 16:52:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Age] [int] NOT NULL,
	[Position] [nvarchar](max) NOT NULL,
	[TeamId] [int] NOT NULL,
 CONSTRAINT [PK_Players] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 12.12.2025 16:52:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Coach] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Players] ON 

INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (3, N'Роберт Левандовські', 37, N'Форвард', 5)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (5, N'Мохамед Салах', 33, N'Форвард', 2)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (7, N'Ліонель Мессі', 38, N'Форвард', 9)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (11, N'Ерлінг Голанд', 25, N'Форвард', 10)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (15, N'Віталій Миколенко', 26, N'Лівий захисник', 11)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (20, N'Віктор Осімхен', 26, N'Форвард', 1014)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (21, N'Хвіча Кварацхелія', 24, N'Лівий вінгер', 1014)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (22, N'Віталій Буяльський', 32, N'Центральний півзахисник', 3)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (23, N'Карім Бензема', 37, N'Форвард', 1200)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (24, N'Серж Гнабрі', 30, N'Правий вінгер', 6)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (26, N'Ромелу Лукаку', 32, N'Форвард', 1014)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (27, N'Едін Джеко', 39, N'Форвард', 8)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (28, N'Хакан Чалханоглу', 31, N'Центральний півзахисник', 1016)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (29, N'Бенжамен Павар', 29, N'Центральний захисник', 1016)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (30, N'Леон Горецка', 30, N'Центральний півзахисник', 6)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (32, N'Усман Дембеле', 28, N'Правий вінгер', 9)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (33, N'Кіліан Мбаппе', 26, N'Форвард', 12)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (37, N'Кевін Де Брюйне', 34, N'Атакувальний півзахисник', 10)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (38, N'Едер Мілітао', 27, N'Центральний захисник', 12)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (39, N'Вінісіус Жуніор', 25, N'Лівий вінгер', 12)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (40, N'Пьотр Зелінський', 31, N'Центральний півзахисник', 1016)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (41, N'Джуд Беллінгем', 22, N'Центральний півзахисник', 12)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (42, N'Ламін Ямаль', 18, N'Правий вінгер', 5)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (43, N'Філ Фоден', 25, N'Атакувальний півзахисник', 10)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (45, N'Ілля Забарний', 23, N'Центральний захисник', 46)
INSERT [dbo].[Players] ([Id], [Name], [Age], [Position], [TeamId]) VALUES (46, N'Джамал Мусіяла', 22, N'Атакувальний півзахисник', 6)
SET IDENTITY_INSERT [dbo].[Players] OFF
GO
SET IDENTITY_INSERT [dbo].[Teams] ON 

INSERT [dbo].[Teams] ([Id], [Name], [Coach]) VALUES (2, N'Ліверпуль', N'Арне Слот')
INSERT [dbo].[Teams] ([Id], [Name], [Coach]) VALUES (3, N'Динамо Київ', N'Ігор Костюк')
INSERT [dbo].[Teams] ([Id], [Name], [Coach]) VALUES (5, N'Барселона', N'Гансі Флік')
INSERT [dbo].[Teams] ([Id], [Name], [Coach]) VALUES (6, N'Баварія Мюнхен', N'Вінсент Компані')
INSERT [dbo].[Teams] ([Id], [Name], [Coach]) VALUES (8, N'Фенербахче', N'Доменіко Тедеско')
INSERT [dbo].[Teams] ([Id], [Name], [Coach]) VALUES (9, N'Парі Сен-Жермен', N'Луїс Енріке')
INSERT [dbo].[Teams] ([Id], [Name], [Coach]) VALUES (10, N'Манчестер Сіті', N'Пеп Гвардіола')
INSERT [dbo].[Teams] ([Id], [Name], [Coach]) VALUES (11, N'Евертон', N'Девід Моєс')
INSERT [dbo].[Teams] ([Id], [Name], [Coach]) VALUES (12, N'Реал Мадрид', N'Сабі Алонсо')
INSERT [dbo].[Teams] ([Id], [Name], [Coach]) VALUES (46, N'Борнмут', N'Андоні Іраола')
INSERT [dbo].[Teams] ([Id], [Name], [Coach]) VALUES (1014, N'Наполі', N'Антоніо Конте')
INSERT [dbo].[Teams] ([Id], [Name], [Coach]) VALUES (1016, N'Інтер Мілан', N'Крістіан Ківу')
INSERT [dbo].[Teams] ([Id], [Name], [Coach]) VALUES (1200, N'Аль-Іттіхад', N'Сержіу Консейсау')
INSERT [dbo].[Teams] ([Id], [Name], [Coach]) VALUES (1201, N'Аль-Гіляль', N'Сімоне Інзагі')
INSERT [dbo].[Teams] ([Id], [Name], [Coach]) VALUES (1202, N'Інтер Маямі', N'Хавьєр Маскерано')
SET IDENTITY_INSERT [dbo].[Teams] OFF
GO
/****** Object:  Index [IX_Players_TeamId]    Script Date: 12.12.2025 16:52:19 ******/
CREATE NONCLUSTERED INDEX [IX_Players_TeamId] ON [dbo].[Players]
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [FK_Players_Teams_TeamId] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [FK_Players_Teams_TeamId]
GO
USE [master]
GO
ALTER DATABASE [Soccer] SET  READ_WRITE 
GO

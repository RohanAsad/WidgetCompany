USE [master]
GO
/****** Object:  Database [WidgetsCompany]    Script Date: 9/15/2022 3:55:24 PM ******/
CREATE DATABASE [WidgetsCompany]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WidgetsCompany', FILENAME = N'D:\MicrosoftSqlServer\MSSQL15.MSSQLSERVER\MSSQL\DATA\WidgetsCompany.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WidgetsCompany_log', FILENAME = N'D:\MicrosoftSqlServer\MSSQL15.MSSQLSERVER\MSSQL\DATA\WidgetsCompany_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WidgetsCompany] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WidgetsCompany].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WidgetsCompany] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WidgetsCompany] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WidgetsCompany] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WidgetsCompany] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WidgetsCompany] SET ARITHABORT OFF 
GO
ALTER DATABASE [WidgetsCompany] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WidgetsCompany] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WidgetsCompany] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WidgetsCompany] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WidgetsCompany] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WidgetsCompany] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WidgetsCompany] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WidgetsCompany] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WidgetsCompany] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WidgetsCompany] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WidgetsCompany] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WidgetsCompany] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WidgetsCompany] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WidgetsCompany] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WidgetsCompany] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WidgetsCompany] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WidgetsCompany] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WidgetsCompany] SET RECOVERY FULL 
GO
ALTER DATABASE [WidgetsCompany] SET  MULTI_USER 
GO
ALTER DATABASE [WidgetsCompany] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WidgetsCompany] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WidgetsCompany] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WidgetsCompany] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WidgetsCompany] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WidgetsCompany] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WidgetsCompany', N'ON'
GO
ALTER DATABASE [WidgetsCompany] SET QUERY_STORE = OFF
GO
USE [WidgetsCompany]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 9/15/2022 3:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuantityOrdered] [int] NULL,
	[OrderedDate] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WidgetOrdered]    Script Date: 9/15/2022 3:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WidgetOrdered](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WidgetId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_WidgetOrdered] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Widgets]    Script Date: 9/15/2022 3:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Widgets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Pack] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_Widgets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [QuantityOrdered], [OrderedDate]) VALUES (1, 12001, CAST(N'2022-09-15T14:52:12.037' AS DateTime))
INSERT [dbo].[Order] ([Id], [QuantityOrdered], [OrderedDate]) VALUES (2, 251, CAST(N'2022-09-15T15:18:59.767' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[WidgetOrdered] ON 

INSERT [dbo].[WidgetOrdered] ([Id], [WidgetId], [OrderId], [Quantity]) VALUES (1, 7, 1, 2)
INSERT [dbo].[WidgetOrdered] ([Id], [WidgetId], [OrderId], [Quantity]) VALUES (2, 6, 1, 1)
INSERT [dbo].[WidgetOrdered] ([Id], [WidgetId], [OrderId], [Quantity]) VALUES (3, 3, 1, 1)
INSERT [dbo].[WidgetOrdered] ([Id], [WidgetId], [OrderId], [Quantity]) VALUES (4, 4, 2, 1)
SET IDENTITY_INSERT [dbo].[WidgetOrdered] OFF
GO
SET IDENTITY_INSERT [dbo].[Widgets] ON 

INSERT [dbo].[Widgets] ([Id], [Pack], [CreatedAt], [ModifiedAt]) VALUES (3, 250, NULL, CAST(N'2022-09-15T15:49:03.810' AS DateTime))
INSERT [dbo].[Widgets] ([Id], [Pack], [CreatedAt], [ModifiedAt]) VALUES (4, 500, CAST(N'2022-09-15T14:24:26.347' AS DateTime), NULL)
INSERT [dbo].[Widgets] ([Id], [Pack], [CreatedAt], [ModifiedAt]) VALUES (5, 1000, CAST(N'2022-09-15T14:24:32.837' AS DateTime), NULL)
INSERT [dbo].[Widgets] ([Id], [Pack], [CreatedAt], [ModifiedAt]) VALUES (6, 2000, CAST(N'2022-09-15T14:24:37.660' AS DateTime), NULL)
INSERT [dbo].[Widgets] ([Id], [Pack], [CreatedAt], [ModifiedAt]) VALUES (7, 5000, CAST(N'2022-09-15T14:24:41.363' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Widgets] OFF
GO
ALTER TABLE [dbo].[WidgetOrdered]  WITH CHECK ADD  CONSTRAINT [FK_WidgetOrdered_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[WidgetOrdered] CHECK CONSTRAINT [FK_WidgetOrdered_Order]
GO
ALTER TABLE [dbo].[WidgetOrdered]  WITH CHECK ADD  CONSTRAINT [FK_WidgetOrdered_Widgets] FOREIGN KEY([WidgetId])
REFERENCES [dbo].[Widgets] ([Id])
GO
ALTER TABLE [dbo].[WidgetOrdered] CHECK CONSTRAINT [FK_WidgetOrdered_Widgets]
GO
USE [master]
GO
ALTER DATABASE [WidgetsCompany] SET  READ_WRITE 
GO

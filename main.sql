USE [master]
GO
/****** Object:  Database [Computer_Equipment_Repair]    Script Date: 31.10.2024 13:39:29 ******/
CREATE DATABASE [Computer_Equipment_Repair]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Computer_Equipment_Repair', FILENAME = N'D:\MSSQL14.SQLSERVER\MSSQL\DATA\Computer_Equipment_Repair.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Computer_Equipment_Repair_log', FILENAME = N'D:\MSSQL14.SQLSERVER\MSSQL\DATA\Computer_Equipment_Repair_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Computer_Equipment_Repair] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Computer_Equipment_Repair].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Computer_Equipment_Repair] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET ARITHABORT OFF 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET  MULTI_USER 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Computer_Equipment_Repair] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Computer_Equipment_Repair] SET QUERY_STORE = OFF
GO
USE [Computer_Equipment_Repair]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 31.10.2024 13:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[commentID] [int] NOT NULL,
	[message] [varchar](50) NULL,
	[requestID] [int] NULL,
 CONSTRAINT [PK_comments] PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[computerTechModel]    Script Date: 31.10.2024 13:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[computerTechModel](
	[computerTechModelID] [int] NOT NULL,
	[computerTechModel] [varchar](50) NULL,
	[computerTechID] [int] NULL,
 CONSTRAINT [PK_computerTechModel] PRIMARY KEY CLUSTERED 
(
	[computerTechModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[computerTechType]    Script Date: 31.10.2024 13:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[computerTechType](
	[computerTechID] [int] NOT NULL,
	[computerTechType] [varchar](50) NULL,
 CONSTRAINT [PK_computerTechType] PRIMARY KEY CLUSTERED 
(
	[computerTechID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[repairParts]    Script Date: 31.10.2024 13:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[repairParts](
	[repairPartsID] [int] NOT NULL,
	[repairParts] [varchar](50) NULL,
 CONSTRAINT [PK_repairParts] PRIMARY KEY CLUSTERED 
(
	[repairPartsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[repairPartsRequests]    Script Date: 31.10.2024 13:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[repairPartsRequests](
	[RequestsID] [int] NOT NULL,
	[repairPartsID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 31.10.2024 13:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[requestID] [int] NOT NULL,
	[startDate] [date] NULL,
	[computerTechModelID] [int] NULL,
	[problemDescription] [varchar](50) NULL,
	[requestsStatusID] [int] NULL,
	[completionDate] [varchar](50) NULL,
	[repairPartsID] [int] NULL,
	[clientID] [int] NULL,
	[masterID] [int] NULL,
 CONSTRAINT [PK_Заявки] PRIMARY KEY CLUSTERED 
(
	[requestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[requestStatus]    Script Date: 31.10.2024 13:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[requestStatus](
	[requestStatusID] [int] NOT NULL,
	[statusName] [varchar](50) NULL,
 CONSTRAINT [PK_requestStatus] PRIMARY KEY CLUSTERED 
(
	[requestStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 31.10.2024 13:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleID] [int] NOT NULL,
	[role] [varchar](50) NULL,
 CONSTRAINT [PK_Роли] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 31.10.2024 13:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [int] NOT NULL,
	[Surname] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[patronymic] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[login] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[roleID] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_Requests] FOREIGN KEY([requestID])
REFERENCES [dbo].[Requests] ([requestID])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK_comments_Requests]
GO
ALTER TABLE [dbo].[computerTechModel]  WITH CHECK ADD  CONSTRAINT [FK_computerTechModel_computerTechType] FOREIGN KEY([computerTechID])
REFERENCES [dbo].[computerTechType] ([computerTechID])
GO
ALTER TABLE [dbo].[computerTechModel] CHECK CONSTRAINT [FK_computerTechModel_computerTechType]
GO
ALTER TABLE [dbo].[repairPartsRequests]  WITH CHECK ADD  CONSTRAINT [FK_repairPartsRequests_repairParts] FOREIGN KEY([repairPartsID])
REFERENCES [dbo].[repairParts] ([repairPartsID])
GO
ALTER TABLE [dbo].[repairPartsRequests] CHECK CONSTRAINT [FK_repairPartsRequests_repairParts]
GO
ALTER TABLE [dbo].[repairPartsRequests]  WITH CHECK ADD  CONSTRAINT [FK_repairPartsRequests_Requests] FOREIGN KEY([RequestsID])
REFERENCES [dbo].[Requests] ([requestID])
GO
ALTER TABLE [dbo].[repairPartsRequests] CHECK CONSTRAINT [FK_repairPartsRequests_Requests]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_computerTechModel] FOREIGN KEY([computerTechModelID])
REFERENCES [dbo].[computerTechModel] ([computerTechModelID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_computerTechModel]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_requestStatus] FOREIGN KEY([requestsStatusID])
REFERENCES [dbo].[requestStatus] ([requestStatusID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_requestStatus]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Users] FOREIGN KEY([clientID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Users]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Users1] FOREIGN KEY([masterID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Users1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([roleID])
REFERENCES [dbo].[Roles] ([roleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [Computer_Equipment_Repair] SET  READ_WRITE 
GO

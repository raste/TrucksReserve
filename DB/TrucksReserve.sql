USE [master]
GO
/****** Object:  Database [TrucksReserve]    Script Date: 20.1.2015 г. 9:39:27 ******/
CREATE DATABASE [TrucksReserve]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TrucksReserve', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\TrucksReserve.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TrucksReserve_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\TrucksReserve_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TrucksReserve] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TrucksReserve].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TrucksReserve] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TrucksReserve] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TrucksReserve] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TrucksReserve] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TrucksReserve] SET ARITHABORT OFF 
GO
ALTER DATABASE [TrucksReserve] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TrucksReserve] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TrucksReserve] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TrucksReserve] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TrucksReserve] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TrucksReserve] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TrucksReserve] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TrucksReserve] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TrucksReserve] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TrucksReserve] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TrucksReserve] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TrucksReserve] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TrucksReserve] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TrucksReserve] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TrucksReserve] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TrucksReserve] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TrucksReserve] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TrucksReserve] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TrucksReserve] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TrucksReserve] SET  MULTI_USER 
GO
ALTER DATABASE [TrucksReserve] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TrucksReserve] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TrucksReserve] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TrucksReserve] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [TrucksReserve]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 20.1.2015 г. 9:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParentCategoryID] [int] NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Files]    Script Date: 20.1.2015 г. 9:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[FileName] [nvarchar](100) NOT NULL,
	[FilePath] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Firms]    Script Date: 20.1.2015 г. 9:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firms](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Website] [nvarchar](100) NULL,
 CONSTRAINT [PK_Firms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Firms_Categories]    Script Date: 20.1.2015 г. 9:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firms_Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FIrmID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_Firms_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gallery]    Script Date: 20.1.2015 г. 9:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gallery](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[TypeID] [int] NULL,
	[FileName] [nvarchar](100) NOT NULL,
	[FilePath] [nvarchar](200) NOT NULL,
	[Main] [bit] NOT NULL,
 CONSTRAINT [PK_Gallery] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 20.1.2015 г. 9:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products_Categories]    Script Date: 20.1.2015 г. 9:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_Products_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Texts]    Script Date: 20.1.2015 г. 9:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Texts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Texts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 20.1.2015 г. 9:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Texts] ADD  CONSTRAINT [DF_Texts_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Parent] FOREIGN KEY([ParentCategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Parent]
GO
ALTER TABLE [dbo].[Firms_Categories]  WITH CHECK ADD  CONSTRAINT [FK_FirmsCategories_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Firms_Categories] CHECK CONSTRAINT [FK_FirmsCategories_Category]
GO
ALTER TABLE [dbo].[Firms_Categories]  WITH CHECK ADD  CONSTRAINT [FK_FirmsCategories_Firm] FOREIGN KEY([FIrmID])
REFERENCES [dbo].[Firms] ([ID])
GO
ALTER TABLE [dbo].[Firms_Categories] CHECK CONSTRAINT [FK_FirmsCategories_Firm]
GO
ALTER TABLE [dbo].[Products_Categories]  WITH CHECK ADD  CONSTRAINT [FK_ProductsCategories_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Products_Categories] CHECK CONSTRAINT [FK_ProductsCategories_Category]
GO
ALTER TABLE [dbo].[Products_Categories]  WITH CHECK ADD  CONSTRAINT [FK_ProductsCategories_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Products_Categories] CHECK CONSTRAINT [FK_ProductsCategories_Product]
GO
USE [master]
GO
ALTER DATABASE [TrucksReserve] SET  READ_WRITE 
GO

USE [TrucksReserve]
SET NOCOUNT ON;
SET XACT_ABORT ON;
GO

SET IDENTITY_INSERT [dbo].[Firms] ON;

BEGIN TRANSACTION;
INSERT INTO [dbo].[Firms]([ID], [Name], [Description], [Website])
SELECT 1, N'DAF', NULL, N'http://www.daf.com' UNION ALL
SELECT 2, N'Mercedes-Benz', NULL, N'http://www5.mercedes-benz.com/en/vehicles/trucks/' UNION ALL
SELECT 3, N'VOLVO', NULL, N'http://www.volvotrucks.com/' UNION ALL
SELECT 4, N'Scania', NULL, N'http://www.scania.com/products-services/trucks/' UNION ALL
SELECT 5, N'Iveco', NULL, N'http://www.iveco.com' UNION ALL
SELECT 6, N'Renault', NULL, N'http://www.renault-trucks.com/' UNION ALL
SELECT 7, N'Man', NULL, N'http://www.mantruckandbus.com/com/en/index.html' UNION ALL
SELECT 8, N'Kögel', NULL, N'http://www.koegel-trailer.com/en/' UNION ALL
SELECT 9, N'Shmitz', NULL, N'http://www.cargobull.com' UNION ALL
SELECT 10, N'BPW', NULL, N'http://www.bpw.co.uk/' UNION ALL
SELECT 11, N'Meritor', NULL, N'http://www.meritor.com/default.aspx' UNION ALL
SELECT 12, N'Wi Advice', NULL, N'http://www.wiadvice.com'
COMMIT;
RAISERROR (N'[dbo].[Firms]: Insert Batch: 1.....Done!', 10, 1) WITH NOWAIT;
GO

SET IDENTITY_INSERT [dbo].[Firms] OFF;

SET IDENTITY_INSERT [dbo].[Gallery] ON;

BEGIN TRANSACTION;
INSERT INTO [dbo].[Gallery]([ID], [Type], [TypeID], [FileName], [FilePath], [Main])
SELECT 1, 4, NULL, N'Store_front.png', N'/Resources/Images/Store/', 1 UNION ALL
SELECT 5, 4, NULL, N'Store_inside1.JPG', N'/Resources/Images/Store/', 0 UNION ALL
SELECT 8, 4, NULL, N'Store_inside2.png', N'/Resources/Images/Store/', 0 UNION ALL
SELECT 11, 2, 1, N'fan.jpg', N'/Resources/Images/Categories/EngineParts/', 0 UNION ALL
SELECT 12, 2, 1, N'oilpump.jpg', N'/Resources/Images/Categories/EngineParts/', 0 UNION ALL
SELECT 13, 2, 1, N'radiator.jpg', N'/Resources/Images/Categories/EngineParts/', 0 UNION ALL
SELECT 14, 2, 1, N'thermostat.jpg', N'/Resources/Images/Categories/EngineParts/', 0 UNION ALL
SELECT 15, 2, 1, N'turbocompressor.jpg', N'/Resources/Images/Categories/EngineParts/', 0 UNION ALL
SELECT 16, 2, 1, N'viscoclutch.jpg', N'/Resources/Images/Categories/EngineParts/', 0 UNION ALL
SELECT 17, 2, 1, N'waterpipe.JPG', N'/Resources/Images/Categories/EngineParts/', 0 UNION ALL
SELECT 18, 2, 1, N'waterpum.jpg', N'/Resources/Images/Categories/EngineParts/', 0 UNION ALL
SELECT 19, 3, 1, N'DAF.jpg', N'/Resources/Images/Firms/', 1 UNION ALL
SELECT 20, 3, 2, N'Mercedes-benz.jpg', N'/Resources/Images/Firms/', 1 UNION ALL
SELECT 21, 3, 3, N'VOLVO.jpg', N'/Resources/Images/Firms/', 1 UNION ALL
SELECT 22, 3, 4, N'scania.png', N'/Resources/Images/Firms/', 1 UNION ALL
SELECT 23, 3, 5, N'IVECO.jpg', N'/Resources/Images/Firms/', 1 UNION ALL
SELECT 24, 3, 6, N'Renault.png', N'/Resources/Images/Firms/', 1 UNION ALL
SELECT 25, 3, 7, N'MAN.png', N'/Resources/Images/Firms/', 1 UNION ALL
SELECT 26, 3, 8, N'kogel.png', N'/Resources/Images/Firms/', 1 UNION ALL
SELECT 27, 3, 9, N'schmitz.png', N'/Resources/Images/Firms/', 1 UNION ALL
SELECT 28, 3, 10, N'bpw.jpg', N'/Resources/Images/Firms/', 1 UNION ALL
SELECT 29, 3, 11, N'meritor.jpg', N'/Resources/Images/Firms/', 1 UNION ALL
SELECT 32, 2, 2, N'AmbriajenLager.jpg', N'/Resources/Images/Categories/TransmissionParts/', 0 UNION ALL
SELECT 33, 2, 2, N'AmbriajnaPompa.JPG', N'/Resources/Images/Categories/TransmissionParts/', 0 UNION ALL
SELECT 34, 2, 2, N'CardanShaft.jpg', N'/Resources/Images/Categories/TransmissionParts/', 0 UNION ALL
SELECT 35, 2, 2, N'ClutchDisk.jpg', N'/Resources/Images/Categories/TransmissionParts/', 0 UNION ALL
SELECT 36, 2, 2, N'Kardan.jpg', N'/Resources/Images/Categories/TransmissionParts/', 0 UNION ALL
SELECT 37, 2, 2, N'Servousilvateli.jpg', N'/Resources/Images/Categories/TransmissionParts/', 0 UNION ALL
SELECT 38, 2, 2, N'ShrinkDisk.jpg', N'/Resources/Images/Categories/TransmissionParts/', 0 UNION ALL
SELECT 39, 2, 2, N'TruckBearings.jpg', N'/Resources/Images/Categories/TransmissionParts/', 0 UNION ALL
SELECT 40, 2, 3, N'Nakladki.jpg', N'/Resources/Images/Categories/BrakeSystem/', 0 UNION ALL
SELECT 41, 2, 3, N'SpirachenBaraban.jpg', N'/Resources/Images/Categories/BrakeSystem/', 0 UNION ALL
SELECT 42, 2, 3, N'SpirachenDisk.jpg', N'/Resources/Images/Categories/BrakeSystem/', 0 UNION ALL
SELECT 43, 2, 3, N'Treschotka.jpg', N'/Resources/Images/Categories/BrakeSystem/', 0 UNION ALL
SELECT 45, 2, 4, N'Amortisior.jpg', N'/Resources/Images/Categories/SuspensionParts/', 0 UNION ALL
SELECT 46, 2, 4, N'AmortisiorUho.jpg', N'/Resources/Images/Categories/SuspensionParts/', 0 UNION ALL
SELECT 47, 2, 4, N'BoltiKomplekti.jpg', N'/Resources/Images/Categories/SuspensionParts/', 0 UNION ALL
SELECT 48, 2, 4, N'RemontenKit.jpg', N'/Resources/Images/Categories/SuspensionParts/', 0 UNION ALL
SELECT 49, 2, 4, N'TamponShtanga.jpg', N'/Resources/Images/Categories/SuspensionParts/', 0 UNION ALL
SELECT 50, 2, 4, N'VShtanga.jpg', N'/Resources/Images/Categories/SuspensionParts/', 0 UNION ALL
SELECT 51, 2, 4, N'VShtanga2.jpg', N'/Resources/Images/Categories/SuspensionParts/', 0 UNION ALL
SELECT 52, 2, 4, N'VuzdushnaVuzglavnica.jpg', N'/Resources/Images/Categories/SuspensionParts/', 0 UNION ALL
SELECT 54, 2, 5, N'FilturVuzdushen.jpg', N'/Resources/Images/Categories/Filters/', 0 UNION ALL
SELECT 55, 2, 5, N'GorivenFiltur.jpg', N'/Resources/Images/Categories/Filters/', 0 UNION ALL
SELECT 56, 2, 5, N'MaslenFiltur.JPG', N'/Resources/Images/Categories/Filters/', 0 UNION ALL
SELECT 57, 2, 5, N'FilturKabina.jpg', N'/Resources/Images/Categories/Filters/', 0 UNION ALL
SELECT 58, 2, 6, N'ButilkaVuzduh.jpg', N'/Resources/Images/Categories/AirSystem/', 0 UNION ALL
SELECT 59, 2, 6, N'KranRele.jpg', N'/Resources/Images/Categories/AirSystem/', 0 UNION ALL
SELECT 60, 2, 6, N'SegmentZaKompresor.jpg', N'/Resources/Images/Categories/AirSystem/', 0 UNION ALL
SELECT 61, 2, 6, N'Shlauh.JPG', N'/Resources/Images/Categories/AirSystem/', 0
COMMIT;
RAISERROR (N'[dbo].[Gallery]: Insert Batch: 1.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[Gallery]([ID], [Type], [TypeID], [FileName], [FilePath], [Main])
SELECT 62, 2, 7, N'CarskiBolt.JPG', N'/Resources/Images/Categories/ConnectionSystem/', 0 UNION ALL
SELECT 63, 2, 7, N'TamponBufer.JPG', N'/Resources/Images/Categories/ConnectionSystem/', 0 UNION ALL
SELECT 64, 2, 7, N'TamponLafet.jpg', N'/Resources/Images/Categories/ConnectionSystem/', 0 UNION ALL
SELECT 65, 2, 8, N'AuspufnaTruba.jpg', N'/Resources/Images/Categories/ExhaustSystem/', 0 UNION ALL
SELECT 66, 2, 8, N'Auspuf.JPG', N'/Resources/Images/Categories/ExhaustSystem/', 0 UNION ALL
SELECT 68, 2, 8, N'SkobaZaIzpuskatelnaTruba.jpg', N'/Resources/Images/Categories/ExhaustSystem/', 0 UNION ALL
SELECT 69, 2, 8, N'GuvkuvaTruba.jpg', N'/Resources/Images/Categories/ExhaustSystem/', 0 UNION ALL
SELECT 70, 2, 9, N'FrontLight.jpg', N'/Resources/Images/Categories/Lights/', 0 UNION ALL
SELECT 71, 2, 9, N'StopLight.JPG', N'/Resources/Images/Categories/Lights/', 0 UNION ALL
SELECT 72, 2, 9, N'LightBulb.jpg', N'/Resources/Images/Categories/Lights/', 0 UNION ALL
SELECT 73, 2, 9, N'SignalLamp.jpg', N'/Resources/Images/Categories/Lights/', 0 UNION ALL
SELECT 74, 2, 10, N'ABSCable.jpg', N'/Resources/Images/Categories/ElectricalParts/', 0 UNION ALL
SELECT 75, 2, 10, N'EBSCable.jpg', N'/Resources/Images/Categories/ElectricalParts/', 0 UNION ALL
SELECT 76, 2, 10, N'Klema.JPG', N'/Resources/Images/Categories/ElectricalParts/', 0 UNION ALL
SELECT 77, 2, 10, N'KluchMasa.jpg', N'/Resources/Images/Categories/ElectricalParts/', 0 UNION ALL
SELECT 79, 2, 10, N'Kuplung.JPG', N'/Resources/Images/Categories/ElectricalParts/', 0 UNION ALL
SELECT 80, 2, 10, N'Predpaziteli.JPG', N'/Resources/Images/Categories/ElectricalParts/', 0 UNION ALL
SELECT 81, 2, 10, N'Starter.jpg', N'/Resources/Images/Categories/ElectricalParts/', 0 UNION ALL
SELECT 82, 2, 10, N'TransformatorNaprejenie.jpg', N'/Resources/Images/Categories/ElectricalParts/', 0 UNION ALL
SELECT 83, 2, 11, N'CabinParts.jpg', N'/Resources/Images/Categories/BigParts/', 0 UNION ALL
SELECT 84, 2, 11, N'SpoilerParts.jpg', N'/Resources/Images/Categories/BigParts/', 0 UNION ALL
SELECT 85, 2, 11, N'Cleaners.jpg', N'/Resources/Images/Categories/BigParts/', 0 UNION ALL
SELECT 86, 2, 11, N'WaterTank.jpg', N'/Resources/Images/Categories/BigParts/', 0 UNION ALL
SELECT 87, 2, 12, N'Mirror1.jpg', N'/Resources/Images/Categories/Mirrors/', 0 UNION ALL
SELECT 88, 2, 12, N'Mirror2.jpg', N'/Resources/Images/Categories/Mirrors/', 0 UNION ALL
SELECT 89, 2, 12, N'Mirror3.jpg', N'/Resources/Images/Categories/Mirrors/', 0 UNION ALL
SELECT 90, 2, 12, N'Mirror4.jpg', N'/Resources/Images/Categories/Mirrors/', 0 UNION ALL
SELECT 91, 2, 13, N'Battery2.jpg', N'/Resources/Images/Categories/BatteriesAndOther/', 0 UNION ALL
SELECT 92, 2, 13, N'Battery1.jpg', N'/Resources/Images/Categories/BatteriesAndOther/', 0 UNION ALL
SELECT 93, 2, 13, N'Masla.JPG', N'/Resources/Images/Categories/BatteriesAndOther/', 0 UNION ALL
SELECT 94, 2, 13, N'Verigi.JPG', N'/Resources/Images/Categories/BatteriesAndOther/', 0 UNION ALL
SELECT 95, 2, 14, N'ReflectivePlates.jpg', N'/Resources/Images/Categories/Accessories/', 0 UNION ALL
SELECT 96, 2, 14, N'TechnostZaChistachki.JPG', N'/Resources/Images/Categories/Accessories/', 0
COMMIT;
RAISERROR (N'[dbo].[Gallery]: Insert Batch: 2.....Done!', 10, 1) WITH NOWAIT;
GO

SET IDENTITY_INSERT [dbo].[Gallery] OFF;

SET IDENTITY_INSERT [dbo].[Products] ON;

BEGIN TRANSACTION;
INSERT INTO [dbo].[Products]([ID], [Name], [Description])
SELECT 1, N'турбо компресори', NULL UNION ALL
SELECT 2, N'части за основен ремонт', NULL UNION ALL
SELECT 3, N'радиатори', NULL UNION ALL
SELECT 4, N'перки', NULL UNION ALL
SELECT 5, N'виско съединители', NULL UNION ALL
SELECT 6, N'водни помпи и ремонтни комплекти', NULL UNION ALL
SELECT 7, N'маслени помпи', NULL UNION ALL
SELECT 8, N'водни съединения', NULL UNION ALL
SELECT 9, N'термостати', NULL UNION ALL
SELECT 10, N'ремъци', NULL UNION ALL
SELECT 11, N'обтяжни и паразитни ролки', NULL UNION ALL
SELECT 12, N'дизелова система', NULL UNION ALL
SELECT 13, N'тампони по окачването', NULL UNION ALL
SELECT 14, N'феродови дискове', NULL UNION ALL
SELECT 15, N'притискателни дискове', NULL UNION ALL
SELECT 16, N'амбреажни лагери', NULL UNION ALL
SELECT 17, N'венци и маховици', NULL UNION ALL
SELECT 18, N'висящи лагери', NULL UNION ALL
SELECT 19, N'карета', NULL UNION ALL
SELECT 20, N'кардани', NULL UNION ALL
SELECT 21, N'амбреажни помпи и ремонтни комплекти', NULL UNION ALL
SELECT 22, N'сервоусилватели и ремонтни комплекти', NULL UNION ALL
SELECT 23, N'вилки', NULL UNION ALL
SELECT 24, N'части за скоростна кутия', NULL UNION ALL
SELECT 25, N'дискове и барани', NULL UNION ALL
SELECT 26, N'спирачни апарати', NULL UNION ALL
SELECT 27, N'дискови и барабанни накладки', NULL UNION ALL
SELECT 28, N'спирачни челюсти', NULL UNION ALL
SELECT 29, N'ексцентрици и ремонтни комплекти', NULL UNION ALL
SELECT 30, N'тресчотки', NULL UNION ALL
SELECT 31, N'дискови и барабанни спирачни цилиндри', NULL UNION ALL
SELECT 32, N'въздушни възглавници', NULL UNION ALL
SELECT 33, N'амортисьори', NULL UNION ALL
SELECT 34, N'ресьори', NULL UNION ALL
SELECT 35, N'напречни и надлъжни кормилни щанги и ремонтни комплекти', NULL UNION ALL
SELECT 36, N'V щанги и ремонтни комплекти', NULL UNION ALL
SELECT 37, N'стабилизиращи щанги и ремонтни комплекти', NULL UNION ALL
SELECT 38, N'шарнирни болтове', NULL UNION ALL
SELECT 39, N'шенкелни болтове', NULL UNION ALL
SELECT 40, N'ремонтни комплекти – кабина', NULL UNION ALL
SELECT 41, N'лагери', NULL UNION ALL
SELECT 42, N'маслени', NULL UNION ALL
SELECT 43, N'горивни', NULL UNION ALL
SELECT 44, N'хидравлични', NULL UNION ALL
SELECT 45, N'въздушни', NULL UNION ALL
SELECT 46, N'кабина', NULL UNION ALL
SELECT 47, N'въздушни компресори и ремонтни комплекти', NULL UNION ALL
SELECT 48, N'клапани, магнит вентили, кранове', NULL UNION ALL
SELECT 49, N'бутилки за въздух', NULL UNION ALL
SELECT 50, N'дехидратори', NULL
COMMIT;
RAISERROR (N'[dbo].[Products]: Insert Batch: 1.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[Products]([ID], [Name], [Description])
SELECT 51, N'шлаухи', NULL UNION ALL
SELECT 52, N'царски болтове', NULL UNION ALL
SELECT 53, N'тегличи и ремонтни комплекти', NULL UNION ALL
SELECT 54, N'буфери и ремонтни комплекти', NULL UNION ALL
SELECT 55, N'лафети и ремонтни комплекти', NULL UNION ALL
SELECT 56, N'Изпускателни тръби', NULL UNION ALL
SELECT 57, N'Ауспуси', NULL UNION ALL
SELECT 58, N'Гъвкави изпускателни тръби', NULL UNION ALL
SELECT 59, N'Скоби и други скрепителни елементи', NULL UNION ALL
SELECT 60, N'фарове, халогени, мигачи', NULL UNION ALL
SELECT 61, N'стопове, габарити, светлоотразители', NULL UNION ALL
SELECT 62, N'сигнални и работни лампи', NULL UNION ALL
SELECT 63, N'крушки 12 V и 24 V', NULL UNION ALL
SELECT 64, N'букси, куплунги, фитинги ', NULL UNION ALL
SELECT 65, N'разпределителни кутии', NULL UNION ALL
SELECT 66, N'кабели за ел. инсталация', NULL UNION ALL
SELECT 67, N'кабелни обувки и клеми', NULL UNION ALL
SELECT 68, N'предпазители', NULL UNION ALL
SELECT 69, N'релета', NULL UNION ALL
SELECT 70, N'ключ маси', NULL UNION ALL
SELECT 71, N'трансформатори за напрежение', NULL UNION ALL
SELECT 72, N'електрически ABS, EBS кабели', NULL UNION ALL
SELECT 73, N'стартери и ремонтни комплекти', NULL UNION ALL
SELECT 74, N'алтернатори и ремонтни комплекти', NULL UNION ALL
SELECT 75, N'клеми за акумулатори', NULL UNION ALL
SELECT 76, N'части по кабината и купето', NULL UNION ALL
SELECT 77, N'калници', NULL UNION ALL
SELECT 78, N'спойлери', NULL UNION ALL
SELECT 79, N'кутии за пожарогасители', NULL UNION ALL
SELECT 80, N'сандъци за инструменти', NULL UNION ALL
SELECT 81, N'резервоари за вода', NULL UNION ALL
SELECT 82, N'аптечки', NULL UNION ALL
SELECT 83, N'чистачки', NULL UNION ALL
SELECT 84, N'огледала', NULL UNION ALL
SELECT 85, N'акумулатори', NULL UNION ALL
SELECT 86, N'масла', NULL UNION ALL
SELECT 87, N'вериги', NULL UNION ALL
SELECT 88, N'антифриз', NULL UNION ALL
SELECT 89, N'светлоотразителни табели', NULL UNION ALL
SELECT 90, N'течност за чистачки', NULL UNION ALL
SELECT 91, N'ароматизатори', NULL
COMMIT;
RAISERROR (N'[dbo].[Products]: Insert Batch: 2.....Done!', 10, 1) WITH NOWAIT;
GO

SET IDENTITY_INSERT [dbo].[Products] OFF;

SET IDENTITY_INSERT [dbo].[Texts] ON;

BEGIN TRANSACTION;
INSERT INTO [dbo].[Texts]([ID], [Type], [Name], [Description], [Deleted])
SELECT 4, 4, N'Промоции', N'&nbsp;&nbsp; <strong>Текуща промоция: 30% намаление на всички видове филтри</strong> &ndash; въздушни, горивни, маслени.', 0
COMMIT;
RAISERROR (N'[dbo].[Texts]: Insert Batch: 1.....Done!', 10, 1) WITH NOWAIT;
GO

SET IDENTITY_INSERT [dbo].[Texts] OFF;

SET IDENTITY_INSERT [dbo].[Users] ON;

BEGIN TRANSACTION;
INSERT INTO [dbo].[Users]([ID], [Name], [Password])
SELECT 1, N'admin', N'48B2A9EFA87EF0D6AF0331D2643815EA7EA4F89C9FCCE86AA3353C7E41105DA2C9EC11212D5A2F8019220683AE404C7B18664069'
COMMIT;
RAISERROR (N'[dbo].[Users]: Insert Batch: 1.....Done!', 10, 1) WITH NOWAIT;
GO

SET IDENTITY_INSERT [dbo].[Users] OFF;

SET IDENTITY_INSERT [dbo].[Categories] ON;

BEGIN TRANSACTION;
INSERT INTO [dbo].[Categories]([ID], [ParentCategoryID], [Name], [Description])
SELECT 1, NULL, N'Части по двигателя', NULL UNION ALL
SELECT 2, NULL, N'Съединители и трансмисия', NULL UNION ALL
SELECT 3, NULL, N'Елементи от спирачната система', NULL UNION ALL
SELECT 4, NULL, N'Части по окачването', NULL UNION ALL
SELECT 5, NULL, N'Филтри', NULL UNION ALL
SELECT 6, NULL, N'Въздушна система', NULL UNION ALL
SELECT 7, NULL, N'Присъединителна система за ремаркета и полуремаркета', NULL UNION ALL
SELECT 8, NULL, N'Ауспухова система', NULL UNION ALL
SELECT 9, NULL, N'Осветление', NULL UNION ALL
SELECT 10, NULL, N'Електрическа система', NULL UNION ALL
SELECT 11, NULL, N'Едрогабаритни части', NULL UNION ALL
SELECT 12, NULL, N'Огледала', NULL UNION ALL
SELECT 13, NULL, N'Акумулатори, масла и вериги', NULL UNION ALL
SELECT 14, NULL, N'Аксесоари', NULL
COMMIT;
RAISERROR (N'[dbo].[Categories]: Insert Batch: 1.....Done!', 10, 1) WITH NOWAIT;
GO

SET IDENTITY_INSERT [dbo].[Categories] OFF;

SET IDENTITY_INSERT [dbo].[Products_Categories] ON;

BEGIN TRANSACTION;
INSERT INTO [dbo].[Products_Categories]([ID], [ProductID], [CategoryID])
SELECT 1, 1, 1 UNION ALL
SELECT 2, 2, 1 UNION ALL
SELECT 3, 3, 1 UNION ALL
SELECT 4, 4, 1 UNION ALL
SELECT 5, 5, 1 UNION ALL
SELECT 6, 6, 1 UNION ALL
SELECT 7, 7, 1 UNION ALL
SELECT 8, 8, 1 UNION ALL
SELECT 9, 9, 1 UNION ALL
SELECT 10, 10, 1 UNION ALL
SELECT 11, 11, 1 UNION ALL
SELECT 12, 12, 1 UNION ALL
SELECT 13, 13, 1 UNION ALL
SELECT 14, 14, 2 UNION ALL
SELECT 15, 15, 2 UNION ALL
SELECT 16, 16, 2 UNION ALL
SELECT 17, 17, 2 UNION ALL
SELECT 18, 18, 2 UNION ALL
SELECT 19, 19, 2 UNION ALL
SELECT 20, 20, 2 UNION ALL
SELECT 21, 21, 2 UNION ALL
SELECT 22, 22, 2 UNION ALL
SELECT 23, 23, 2 UNION ALL
SELECT 24, 24, 2 UNION ALL
SELECT 25, 25, 3 UNION ALL
SELECT 26, 26, 3 UNION ALL
SELECT 27, 27, 3 UNION ALL
SELECT 28, 28, 3 UNION ALL
SELECT 29, 29, 3 UNION ALL
SELECT 30, 30, 3 UNION ALL
SELECT 31, 31, 3 UNION ALL
SELECT 32, 32, 4 UNION ALL
SELECT 33, 33, 4 UNION ALL
SELECT 34, 34, 4 UNION ALL
SELECT 35, 35, 4 UNION ALL
SELECT 36, 36, 4 UNION ALL
SELECT 37, 37, 4 UNION ALL
SELECT 38, 38, 4 UNION ALL
SELECT 39, 39, 4 UNION ALL
SELECT 40, 40, 4 UNION ALL
SELECT 41, 41, 4 UNION ALL
SELECT 42, 42, 5 UNION ALL
SELECT 43, 43, 5 UNION ALL
SELECT 44, 44, 5 UNION ALL
SELECT 45, 45, 5 UNION ALL
SELECT 46, 46, 5 UNION ALL
SELECT 47, 47, 6 UNION ALL
SELECT 48, 48, 6 UNION ALL
SELECT 49, 49, 6 UNION ALL
SELECT 50, 50, 6
COMMIT;
RAISERROR (N'[dbo].[Products_Categories]: Insert Batch: 1.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[Products_Categories]([ID], [ProductID], [CategoryID])
SELECT 51, 51, 6 UNION ALL
SELECT 52, 52, 7 UNION ALL
SELECT 53, 53, 7 UNION ALL
SELECT 54, 54, 7 UNION ALL
SELECT 55, 55, 7 UNION ALL
SELECT 56, 56, 8 UNION ALL
SELECT 57, 57, 8 UNION ALL
SELECT 58, 58, 8 UNION ALL
SELECT 59, 59, 8 UNION ALL
SELECT 60, 60, 9 UNION ALL
SELECT 61, 61, 9 UNION ALL
SELECT 62, 62, 9 UNION ALL
SELECT 63, 63, 9 UNION ALL
SELECT 64, 64, 10 UNION ALL
SELECT 65, 65, 10 UNION ALL
SELECT 66, 66, 10 UNION ALL
SELECT 67, 67, 10 UNION ALL
SELECT 68, 68, 10 UNION ALL
SELECT 69, 69, 10 UNION ALL
SELECT 70, 70, 10 UNION ALL
SELECT 71, 71, 10 UNION ALL
SELECT 72, 72, 10 UNION ALL
SELECT 73, 73, 10 UNION ALL
SELECT 74, 74, 10 UNION ALL
SELECT 75, 75, 10 UNION ALL
SELECT 76, 76, 11 UNION ALL
SELECT 77, 77, 11 UNION ALL
SELECT 78, 78, 11 UNION ALL
SELECT 79, 79, 11 UNION ALL
SELECT 80, 80, 11 UNION ALL
SELECT 81, 81, 11 UNION ALL
SELECT 82, 82, 11 UNION ALL
SELECT 83, 83, 11 UNION ALL
SELECT 84, 84, 12 UNION ALL
SELECT 85, 85, 13 UNION ALL
SELECT 86, 86, 13 UNION ALL
SELECT 87, 87, 13 UNION ALL
SELECT 88, 88, 13 UNION ALL
SELECT 89, 89, 14 UNION ALL
SELECT 90, 90, 14 UNION ALL
SELECT 91, 91, 14
COMMIT;
RAISERROR (N'[dbo].[Products_Categories]: Insert Batch: 2.....Done!', 10, 1) WITH NOWAIT;
GO

SET IDENTITY_INSERT [dbo].[Products_Categories] OFF;


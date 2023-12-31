USE [master]
GO
/****** Object:  Database [Pizzaci]    Script Date: 5.05.2023 16:11:44 ******/
CREATE DATABASE [Pizzaci]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pizzaci', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Pizzaci.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pizzaci_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Pizzaci_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Pizzaci] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pizzaci].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pizzaci] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pizzaci] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pizzaci] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pizzaci] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pizzaci] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pizzaci] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pizzaci] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pizzaci] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pizzaci] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pizzaci] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pizzaci] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pizzaci] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pizzaci] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pizzaci] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pizzaci] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Pizzaci] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pizzaci] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pizzaci] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pizzaci] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pizzaci] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pizzaci] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pizzaci] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pizzaci] SET RECOVERY FULL 
GO
ALTER DATABASE [Pizzaci] SET  MULTI_USER 
GO
ALTER DATABASE [Pizzaci] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pizzaci] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pizzaci] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pizzaci] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pizzaci] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pizzaci] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Pizzaci', N'ON'
GO
ALTER DATABASE [Pizzaci] SET QUERY_STORE = ON
GO
ALTER DATABASE [Pizzaci] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Pizzaci]
GO
/****** Object:  Table [dbo].[Kampanyalar]    Script Date: 5.05.2023 16:11:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kampanyalar](
	[KampanyaNo] [int] IDENTITY(1,1) NOT NULL,
	[KampanyaAdi] [varchar](50) NULL,
	[Icindekiler] [varchar](50) NULL,
	[Fiyat] [int] NULL,
 CONSTRAINT [PK_Kampanyalar] PRIMARY KEY CLUSTERED 
(
	[KampanyaNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pizzalar]    Script Date: 5.05.2023 16:11:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pizzalar](
	[PizzaNo] [int] IDENTITY(1,1) NOT NULL,
	[PizzaAdi] [varchar](50) NULL,
	[PizzaBoyu] [varchar](50) NULL,
	[Icindekiler] [varchar](50) NULL,
	[Fiyat] [int] NULL,
 CONSTRAINT [PK_Pizzalar] PRIMARY KEY CLUSTERED 
(
	[PizzaNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YanUrunler]    Script Date: 5.05.2023 16:11:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YanUrunler](
	[UrunNo] [int] IDENTITY(1,1) NOT NULL,
	[UrunTuru] [varchar](50) NULL,
	[UrunAdi] [varchar](50) NULL,
	[Icindekiler] [varchar](50) NULL,
	[Fiyat] [int] NULL,
 CONSTRAINT [PK_YanUrunler] PRIMARY KEY CLUSTERED 
(
	[UrunNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[RCRUP]    Script Date: 5.05.2023 16:11:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RCRUP]
@PizzaNo int,
@PizzaAdi varchar(50),
@PizzaBoyu varchar(50),
@Icindekiler varchar(50),
@Fiyat int
as begin
if @PizzaNo=0
insert into Pizzalar(PizzaAdi,PizzaBoyu,Icindekiler,Fiyat)
values(@PizzaAdi,@PizzaBoyu,@Icindekiler,@Fiyat)
else
update Pizzalar set PizzaAdi=@PizzaAdi,PizzaBoyu=@PizzaBoyu,Icindekiler=@Icindekiler,Fiyat=@Fiyat
where PizzaNo=@PizzaNo
end
--------------------------------
GO
/****** Object:  StoredProcedure [dbo].[RCRUP1]    Script Date: 5.05.2023 16:11:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[RCRUP1]
@UrunNo int,
@UrunTuru varchar(50),
@UrunAdi varchar(50),
@Icindekiler varchar(50),
@Fiyat int
as begin
if @UrunNo=0
insert into YanUrunler(UrunTuru,UrunAdi,Icindekiler,Fiyat)
values(@UrunTuru,@UrunAdi,@Icindekiler,@Fiyat)
else
update YanUrunler set UrunTuru=@UrunTuru,UrunAdi=@UrunAdi,Icindekiler=@Icindekiler,Fiyat=@Fiyat
where UrunNo=@UrunNo
end
GO
/****** Object:  StoredProcedure [dbo].[RCRUP2]    Script Date: 5.05.2023 16:11:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RCRUP2]
@KampanyaNo int,
@KampanyaAdi varchar(50),
@Icindekiler varchar(50),
@Fiyat int
as begin
if @KampanyaNo=0
insert into Kampanyalar(KampanyaAdi,Icindekiler,Fiyat)
values(@KampanyaAdi,@Icindekiler,@Fiyat)
else
update Kampanyalar set KampanyaAdi=@KampanyaAdi,Icindekiler=@Icindekiler,Fiyat=@Fiyat
where KampanyaNo=@KampanyaNo
end
GO
/****** Object:  StoredProcedure [dbo].[RListele]    Script Date: 5.05.2023 16:11:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RListele]
as begin
select*from Pizzalar
end
GO
/****** Object:  StoredProcedure [dbo].[RListele1]    Script Date: 5.05.2023 16:11:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RListele1]
as begin
select*from YanUrunler
end
GO
/****** Object:  StoredProcedure [dbo].[RListele2]    Script Date: 5.05.2023 16:11:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RListele2]
as begin
select*from Kampanyalar
end
GO
/****** Object:  StoredProcedure [dbo].[RSil]    Script Date: 5.05.2023 16:11:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RSil]
@PizzaNo int
as begin
Delete from Pizzalar where PizzaNo=@PizzaNo
end
GO
/****** Object:  StoredProcedure [dbo].[RSil1]    Script Date: 5.05.2023 16:11:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RSil1]
@UrunNo int
as begin
Delete from YanUrunler where UrunNo=@UrunNo
end
GO
/****** Object:  StoredProcedure [dbo].[RSil2]    Script Date: 5.05.2023 16:11:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RSil2]
@KampanyaNo int
as begin
Delete from Kampanyalar where KampanyaNo=@KampanyaNo
end
GO
/****** Object:  StoredProcedure [dbo].[RSiralama]    Script Date: 5.05.2023 16:11:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RSiralama]
@PizzaNo int
as begin
select*from Pizzalar where
PizzaNo=@PizzaNo
end
GO
/****** Object:  StoredProcedure [dbo].[RSiralama1]    Script Date: 5.05.2023 16:11:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RSiralama1]
@UrunNo int
as begin
select*from YanUrunler where
UrunNo=@UrunNo
end
GO
/****** Object:  StoredProcedure [dbo].[RSiralama2]    Script Date: 5.05.2023 16:11:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RSiralama2]
@KampanyaNo int
as begin
select*from Kampanyalar where
KampanyaNo=@KampanyaNo
end
GO
USE [master]
GO
ALTER DATABASE [Pizzaci] SET  READ_WRITE 
GO

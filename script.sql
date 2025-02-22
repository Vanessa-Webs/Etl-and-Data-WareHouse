USE [master]
GO
/****** Object:  Database [UAS_ETL]    Script Date: 30/10/2024 19:50:22 ******/
CREATE DATABASE [UAS_ETL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UAS_ETL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\UAS_ETL.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UAS_ETL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\UAS_ETL_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [UAS_ETL] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UAS_ETL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UAS_ETL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UAS_ETL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UAS_ETL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UAS_ETL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UAS_ETL] SET ARITHABORT OFF 
GO
ALTER DATABASE [UAS_ETL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UAS_ETL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UAS_ETL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UAS_ETL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UAS_ETL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UAS_ETL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UAS_ETL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UAS_ETL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UAS_ETL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UAS_ETL] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UAS_ETL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UAS_ETL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UAS_ETL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UAS_ETL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UAS_ETL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UAS_ETL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UAS_ETL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UAS_ETL] SET RECOVERY FULL 
GO
ALTER DATABASE [UAS_ETL] SET  MULTI_USER 
GO
ALTER DATABASE [UAS_ETL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UAS_ETL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UAS_ETL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UAS_ETL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UAS_ETL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UAS_ETL] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'UAS_ETL', N'ON'
GO
ALTER DATABASE [UAS_ETL] SET QUERY_STORE = ON
GO
ALTER DATABASE [UAS_ETL] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [UAS_ETL]
GO
/****** Object:  Table [dbo].[DimBillOfMaterials]    Script Date: 30/10/2024 19:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimBillOfMaterials](
	[IDBillOfMaterials] [int] IDENTITY(1,1) NOT NULL,
	[BillOfMaterialsID] [int] NULL,
	[ProductAssemblyID] [int] NULL,
	[ComponentID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[UnitMeasureCode] [nchar](3) NULL,
	[BOMLevel] [smallint] NULL,
	[PerAssemblyQty] [decimal](8, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDBillOfMaterials] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 30/10/2024 19:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[IDWaktu] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NULL,
	[FullDate] [date] NULL,
	[DayNumberOfWeek] [int] NULL,
	[DayNumberOfMonth] [int] NULL,
	[DayNumberOfYear] [int] NULL,
	[WeekNumberOfYear] [int] NULL,
	[MonthName] [nvarchar](255) NULL,
	[MonthNumberOfYear] [int] NULL,
	[CalendarYear] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDWaktu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimEmployee]    Script Date: 30/10/2024 19:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEmployee](
	[IDEmployee] [int] IDENTITY(1,1) NOT NULL,
	[BusinessEntityID] [int] NULL,
	[NationalIDNumber] [nvarchar](15) NULL,
	[LoginID] [nvarchar](256) NULL,
	[JobTitle] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[MaritalStatus] [nchar](1) NULL,
	[Gender] [nchar](1) NULL,
	[HireDate] [date] NULL,
	[VacationHours] [smallint] NULL,
	[SickLeaveHours] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDEmployee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimLocation]    Script Date: 30/10/2024 19:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimLocation](
	[IDLocation] [int] IDENTITY(1,1) NOT NULL,
	[LocationID] [smallint] NULL,
	[Name] [nvarchar](50) NULL,
	[CostRate] [smallmoney] NULL,
	[Availability] [decimal](8, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDLocation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimModel]    Script Date: 30/10/2024 19:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimModel](
	[IDProductModel] [int] IDENTITY(1,1) NOT NULL,
	[ProductModelID] [int] NULL,
	[Name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProductModel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProduct]    Script Date: 30/10/2024 19:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProduct](
	[IDProduct] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[ProductNumber] [nvarchar](25) NULL,
	[Color] [nvarchar](15) NULL,
	[SafetyStockLevel] [smallint] NULL,
	[ReorderPoint] [smallint] NULL,
	[StandardCost] [money] NULL,
	[ListPrice] [money] NULL,
	[Size] [nvarchar](5) NULL,
	[SizeUnitMeasuredCode] [nchar](3) NULL,
	[WeightUnitMeasureCode] [nchar](3) NULL,
	[Weight] [decimal](8, 2) NULL,
	[DaysToManufacture] [int] NULL,
	[ProductLine] [nchar](2) NULL,
	[Class] [nchar](2) NULL,
	[Style] [nchar](2) NULL,
	[ProductSubcategoryID] [int] NULL,
	[ProductModelID] [int] NULL,
	[SellStartDate] [datetime] NULL,
	[SellEndDate] [datetime] NULL,
	[DiscontinuedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProductCategory]    Script Date: 30/10/2024 19:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProductCategory](
	[IDProductCategory] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryID] [int] NULL,
	[Name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProductCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProductInventory]    Script Date: 30/10/2024 19:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProductInventory](
	[IDProductInventory] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[LocationID] [smallint] NULL,
	[Shelf] [nvarchar](10) NULL,
	[Bin] [tinyint] NULL,
	[Quantity] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProductInventory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimScrapReason]    Script Date: 30/10/2024 19:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimScrapReason](
	[IDScrapReason] [int] IDENTITY(1,1) NOT NULL,
	[ScrapReasonID] [smallint] NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDScrapReason] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimShipMethod]    Script Date: 30/10/2024 19:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimShipMethod](
	[IDShip] [int] IDENTITY(1,1) NOT NULL,
	[ShipMethodID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[ShipBase] [money] NULL,
	[ShipRate] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDShip] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimSubCategoryProduct]    Script Date: 30/10/2024 19:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSubCategoryProduct](
	[IDProductSubcategory] [int] IDENTITY(1,1) NOT NULL,
	[ProductSubCategoryID] [int] NULL,
	[ProductCategoryID] [int] NULL,
	[Name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProductSubcategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimUnitMeasure]    Script Date: 30/10/2024 19:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimUnitMeasure](
	[IDUnitMeasure] [int] IDENTITY(1,1) NOT NULL,
	[UnitMeasureCode] [nchar](3) NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDUnitMeasure] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimVendor]    Script Date: 30/10/2024 19:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimVendor](
	[IDVendor] [int] IDENTITY(1,1) NOT NULL,
	[BusinessEntityID] [int] NULL,
	[AccountNumber] [nvarchar](15) NULL,
	[Name] [nvarchar](50) NULL,
	[CreditRating] [tinyint] NULL,
	[PurchasingWebServiceURL] [nvarchar](1024) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDVendor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactProduction]    Script Date: 30/10/2024 19:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactProduction](
	[IDWaktu] [int] NULL,
	[IDProductModel] [int] NULL,
	[IDProduct] [int] NULL,
	[IDProductCategory] [int] NULL,
	[IDProductSubcategory] [int] NULL,
	[IDWorkOrder] [int] NULL,
	[IDProductInventory] [int] NULL,
	[IDBillOfMaterials] [int] NULL,
	[EstimatedProduction] [int] NULL,
	[ProductionAmmunt] [int] NULL,
	[TotalProductionCost] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactPurchasing]    Script Date: 30/10/2024 19:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactPurchasing](
	[IDProduct] [int] NULL,
	[IDProductModel] [int] NULL,
	[IDProductSubcategory] [int] NULL,
	[IDBusinessEntity] [int] NULL,
	[IDShipMethod] [int] NULL,
	[IDVendor] [int] NULL,
	[IDEmployee] [int] NULL,
	[IDWaktu] [int] NULL,
	[ProductQTY] [int] NULL,
	[TotalCostProduct] [int] NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [UAS_ETL] SET  READ_WRITE 
GO

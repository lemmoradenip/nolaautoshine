USE [master]
GO
/****** Object:  Database [CarWash]    Script Date: 20/3/2019 6:07:20 PM ******/
CREATE DATABASE [CarWash]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarWash', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\CarWash.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CarWash_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\CarWash_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CarWash] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarWash].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarWash] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarWash] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarWash] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarWash] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarWash] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarWash] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarWash] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarWash] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarWash] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarWash] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarWash] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarWash] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarWash] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarWash] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarWash] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarWash] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarWash] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarWash] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarWash] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarWash] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarWash] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarWash] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarWash] SET RECOVERY FULL 
GO
ALTER DATABASE [CarWash] SET  MULTI_USER 
GO
ALTER DATABASE [CarWash] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarWash] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarWash] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarWash] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarWash] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CarWash] SET QUERY_STORE = OFF
GO
USE [CarWash]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [CarWash]
GO
/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 20/3/2019 6:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[Split]
	(
		@String varchar(8000),
		@Delimiter char(1)
	)     
	returns @temptable TABLE (items varchar(8000))     
	as     
	begin     
		declare @idx int     
		declare @slice varchar(8000)     
	    
		select @idx = 1     
			if len(@String)<1 or @String is null  return     
	    
		while @idx!= 0     
		begin     
			set @idx = charindex(@Delimiter,@String)     
			if @idx!=0     
				set @slice = left(@String,@idx - 1)     
			else     
				set @slice = @String     
			
			if(len(@slice)>0)
				insert into @temptable(Items) values(@slice)     
 
			set @String = right(@String,len(@String) - @idx)     
			if len(@String) = 0 break     
		end 
	return     
	end
GO
/****** Object:  Table [dbo].[CarMakerList]    Script Date: 20/3/2019 6:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarMakerList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CarMake] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_CarMakerList] PRIMARY KEY CLUSTERED 
(
	[CarMake] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 20/3/2019 6:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Lname] [nvarchar](150) NULL,
	[Fname] [nvarchar](150) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[CarModel] [int] NULL,
	[ServiceProvider] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ScheduledDate] [datetime] NOT NULL,
	[Address] [nvarchar](150) NULL,
	[ScheduledTime] [nvarchar](10) NOT NULL,
	[SelectedServices] [nvarchar](300) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Email] ASC,
	[ScheduledDate] ASC,
	[ScheduledTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SelectedServices]    Script Date: 20/3/2019 6:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SelectedServices](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
	[ServiceCharges] [nvarchar](50) NULL,
	[Datecreated] [datetime] NULL,
 CONSTRAINT [PK_SelectedServices] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC,
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 20/3/2019 6:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Services] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](150) NULL,
	[ServiceCode] [nvarchar](50) NOT NULL,
	[ServiceCharge] [decimal](18, 2) NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[Services] ASC,
	[ServiceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceType]    Script Date: 20/3/2019 6:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ServiceType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ServiceType] PRIMARY KEY CLUSTERED 
(
	[ServiceType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CarMakerList] ON 

INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (1, N'Acura')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (2, N'Alfa Romeo')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (3, N'AMC')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (4, N'Audi')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (5, N'Bertone')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (6, N'BMW')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (7, N'Buick')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (8, N'Cadillac')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (9, N'Chevrolet')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (10, N'Chrysler')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (11, N'Daewoo')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (12, N'Daihatsu')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (13, N'Dodge')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (14, N'Eagle')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (15, N'Ford')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (16, N'Geo')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (17, N'GMC')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (18, N'Honda')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (19, N'Hummer')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (20, N'Hyundai')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (21, N'Infiniti')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (22, N'Isuzu')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (23, N'Jaguar')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (24, N'Jeep')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (25, N'Kia')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (26, N'Land Rover')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (27, N'Lexus')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (28, N'Lincoln')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (29, N'Mazda')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (30, N'Mercedes-Benz')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (31, N'Mercury')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (32, N'Merkur')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (33, N'MINI')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (34, N'Mitsubishi')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (35, N'Nissan')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (36, N'Oldsmobile')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (37, N'Peugeot')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (38, N'Pininfarina')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (39, N'Plymouth')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (40, N'Pontiac')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (41, N'Porsche')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (42, N'Renault')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (43, N'Saa')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (44, N'Saab')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (45, N'Saturn')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (46, N'Sterlig')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (47, N'Sterling')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (48, N'Subaru')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (49, N'Suzuki')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (50, N'Toyota')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (51, N'Volkswagen')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (52, N'Volvo')
INSERT [dbo].[CarMakerList] ([ID], [CarMake]) VALUES (53, N'Yugo')
SET IDENTITY_INSERT [dbo].[CarMakerList] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([id], [Lname], [Fname], [Mobile], [Email], [CarModel], [ServiceProvider], [CreatedDate], [ScheduledDate], [Address], [ScheduledTime], [SelectedServices]) VALUES (1, N'ADLDL', N'LLEMOR', N'901902912', N'2@gmail.com', 50, N'', CAST(N'2019-03-20T14:05:25.563' AS DateTime), CAST(N'2019-03-20T00:00:00.000' AS DateTime), N'', N'8AM-8:30AM', NULL)
INSERT [dbo].[Customer] ([id], [Lname], [Fname], [Mobile], [Email], [CarModel], [ServiceProvider], [CreatedDate], [ScheduledDate], [Address], [ScheduledTime], [SelectedServices]) VALUES (6, N'pineda', N'danielle', N'05681489', N'tes@reste', 2, N'', CAST(N'2019-03-20T15:29:15.400' AS DateTime), CAST(N'2019-03-02T00:00:00.000' AS DateTime), N't', N'8AM-8:30AM', N'6,5,7,2,3,4,')
INSERT [dbo].[Customer] ([id], [Lname], [Fname], [Mobile], [Email], [CarModel], [ServiceProvider], [CreatedDate], [ScheduledDate], [Address], [ScheduledTime], [SelectedServices]) VALUES (3, N'teset', N'testss', N'test', N'tes@reste', 2, N'', CAST(N'2019-03-20T15:24:36.230' AS DateTime), CAST(N'2019-03-06T00:00:00.000' AS DateTime), N't', N'8AM-8:30AM', N'6,5,7,2,1,3,')
INSERT [dbo].[Customer] ([id], [Lname], [Fname], [Mobile], [Email], [CarModel], [ServiceProvider], [CreatedDate], [ScheduledDate], [Address], [ScheduledTime], [SelectedServices]) VALUES (5, N'teset', N'rommel', N'05681489', N'tes@reste', 2, N'', CAST(N'2019-03-20T15:26:45.870' AS DateTime), CAST(N'2019-03-19T00:00:00.000' AS DateTime), N't', N'8AM-8:30AM', N'6,5,7,2,3,4,')
INSERT [dbo].[Customer] ([id], [Lname], [Fname], [Mobile], [Email], [CarModel], [ServiceProvider], [CreatedDate], [ScheduledDate], [Address], [ScheduledTime], [SelectedServices]) VALUES (2, N'teset', N'test', N'test', N'tes@reste', 2, N'', CAST(N'2019-03-20T15:22:00.637' AS DateTime), CAST(N'2019-03-20T00:00:00.000' AS DateTime), N't', N'8AM-8:30AM', NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[SelectedServices] ON 

INSERT [dbo].[SelectedServices] ([id], [CustomerId], [ServiceId], [ServiceCharges], [Datecreated]) VALUES (8, 5, 2, N'0', CAST(N'2019-03-20T15:26:45.870' AS DateTime))
INSERT [dbo].[SelectedServices] ([id], [CustomerId], [ServiceId], [ServiceCharges], [Datecreated]) VALUES (9, 5, 3, N'0', CAST(N'2019-03-20T15:26:45.870' AS DateTime))
INSERT [dbo].[SelectedServices] ([id], [CustomerId], [ServiceId], [ServiceCharges], [Datecreated]) VALUES (10, 5, 4, N'0', CAST(N'2019-03-20T15:26:45.870' AS DateTime))
INSERT [dbo].[SelectedServices] ([id], [CustomerId], [ServiceId], [ServiceCharges], [Datecreated]) VALUES (11, 5, 5, N'0', CAST(N'2019-03-20T15:26:45.870' AS DateTime))
INSERT [dbo].[SelectedServices] ([id], [CustomerId], [ServiceId], [ServiceCharges], [Datecreated]) VALUES (12, 5, 6, N'0', CAST(N'2019-03-20T15:26:45.870' AS DateTime))
INSERT [dbo].[SelectedServices] ([id], [CustomerId], [ServiceId], [ServiceCharges], [Datecreated]) VALUES (13, 5, 7, N'0', CAST(N'2019-03-20T15:26:45.870' AS DateTime))
INSERT [dbo].[SelectedServices] ([id], [CustomerId], [ServiceId], [ServiceCharges], [Datecreated]) VALUES (14, 6, 2, N'2.00', CAST(N'2019-03-20T15:29:15.400' AS DateTime))
INSERT [dbo].[SelectedServices] ([id], [CustomerId], [ServiceId], [ServiceCharges], [Datecreated]) VALUES (15, 6, 3, N'232.00', CAST(N'2019-03-20T15:29:15.400' AS DateTime))
INSERT [dbo].[SelectedServices] ([id], [CustomerId], [ServiceId], [ServiceCharges], [Datecreated]) VALUES (16, 6, 4, N'45.00', CAST(N'2019-03-20T15:29:15.400' AS DateTime))
INSERT [dbo].[SelectedServices] ([id], [CustomerId], [ServiceId], [ServiceCharges], [Datecreated]) VALUES (17, 6, 5, N'1.00', CAST(N'2019-03-20T15:29:15.400' AS DateTime))
INSERT [dbo].[SelectedServices] ([id], [CustomerId], [ServiceId], [ServiceCharges], [Datecreated]) VALUES (18, 6, 6, N'25.00', CAST(N'2019-03-20T15:29:15.400' AS DateTime))
INSERT [dbo].[SelectedServices] ([id], [CustomerId], [ServiceId], [ServiceCharges], [Datecreated]) VALUES (19, 6, 7, N'56.00', CAST(N'2019-03-20T15:29:15.400' AS DateTime))
SET IDENTITY_INSERT [dbo].[SelectedServices] OFF
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([id], [Services], [Description], [ServiceCode], [ServiceCharge], [Type]) VALUES (6, N'Aircon Cleaning', N'Lorem', N'AC', CAST(25.00 AS Decimal(18, 2)), N'Interior')
INSERT [dbo].[Services] ([id], [Services], [Description], [ServiceCode], [ServiceCharge], [Type]) VALUES (5, N'Carpet Shampoo', N'Lorem Ipsum ahduis  lusi rizal jose sed idma diam euismotest el filibusterisbno el doreado', N'CS', CAST(1.00 AS Decimal(18, 2)), N'Interior')
INSERT [dbo].[Services] ([id], [Services], [Description], [ServiceCode], [ServiceCharge], [Type]) VALUES (7, N'Dashboard Shine', N'Lorem', N'DS', CAST(56.00 AS Decimal(18, 2)), N'Interior')
INSERT [dbo].[Services] ([id], [Services], [Description], [ServiceCode], [ServiceCharge], [Type]) VALUES (2, N'Double Polyprocess', N'Lorem Ipsum ahduis  lusi rizal jose sed idma diam euismotest el filibusterisbno el doreado', N'DP', CAST(2.00 AS Decimal(18, 2)), N'Exterior')
INSERT [dbo].[Services] ([id], [Services], [Description], [ServiceCode], [ServiceCharge], [Type]) VALUES (1, N'Full Services Wash', N'Lorem Ipsum ahduis  lusi rizal jose sed idma diam euismotest el filibusterisbno el doreado', N'FSW', CAST(23.00 AS Decimal(18, 2)), N'Exterior')
INSERT [dbo].[Services] ([id], [Services], [Description], [ServiceCode], [ServiceCharge], [Type]) VALUES (3, N'Tire Gloss', N'Lorem Ipsum ahduis  lusi rizal jose sed idma diam euismotest el filibusterisbno el doreado', N'TG', CAST(232.00 AS Decimal(18, 2)), N'Exterior')
INSERT [dbo].[Services] ([id], [Services], [Description], [ServiceCode], [ServiceCharge], [Type]) VALUES (4, N'Underbody Wash', N'Lorem Ipsum ahduis  lusi rizal jose sed idma diam euismotest el filibusterisbno el doreado', N'UW', CAST(45.00 AS Decimal(18, 2)), N'Exterior')
SET IDENTITY_INSERT [dbo].[Services] OFF
SET IDENTITY_INSERT [dbo].[ServiceType] ON 

INSERT [dbo].[ServiceType] ([id], [ServiceType]) VALUES (2, N'Exterior')
INSERT [dbo].[ServiceType] ([id], [ServiceType]) VALUES (1, N'Interior')
SET IDENTITY_INSERT [dbo].[ServiceType] OFF
ALTER TABLE [dbo].[SelectedServices] ADD  CONSTRAINT [DF_SelectedServices_Datecreated]  DEFAULT (getdate()) FOR [Datecreated]
GO
/****** Object:  StoredProcedure [dbo].[usp_AccessAppointment]    Script Date: 20/3/2019 6:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AccessAppointment]
	@customerid int =null--to the used as customerid
	,@fname nvarchar(100)=null
	,@lname nvarchar(100)=null
	,@address nvarchar(150)=null
	,@phonenumber nvarchar(15)=null
	,@email nvarchar(50)=null
	,@serviceprovider nvarchar(50) =null --actually i dont know this,so remove if insignificant, or change it to plate
	,@carmodel int =null -- take this from another table
	,@scheduledate date = null
	,@time nvarchar(15)=null
	,@selectedservices nvarchar(max)=null--this will get the string of services if from the list
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	UPDATE dbo.Customer 
	set lname=@lname,fname=@fname,address=@address,Mobile=@phonenumber
	,Email=@email,scheduleddate=@scheduledate,scheduledtime=@time
	WHERE id=@customerid
	--if no record updated,insert new
	if @@ROWCOUNT =0
	begin
	insert into dbo.Customer
	(Lname,Fname,Mobile,Email,CarModel,serviceprovider,CreatedDate,scheduleddate,address,scheduledtime,selectedservices)
	values
	(@lname,@fname,@phonenumber,@email,@carmodel,@serviceprovider,GETDATE(),@scheduledate,@address,@time,@selectedservices)
	end
END
GO
USE [master]
GO
ALTER DATABASE [CarWash] SET  READ_WRITE 
GO

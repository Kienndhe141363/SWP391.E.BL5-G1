USE [master]
GO
/****** Object:  Database [SU24_BL5_SWP391_G1]    Script Date: 8/8/2024 7:57:22 PM ******/
CREATE DATABASE [SU24_BL5_SWP391_G1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SU24_BL5_SWP391_G1', FILENAME = N'D:\sql\MSSQL16.MSSQLSERVER\MSSQL\DATA\SU24_BL5_SWP391_G1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SU24_BL5_SWP391_G1_log', FILENAME = N'D:\sql\MSSQL16.MSSQLSERVER\MSSQL\DATA\SU24_BL5_SWP391_G1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SU24_BL5_SWP391_G1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET ARITHABORT OFF 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET RECOVERY FULL 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET  MULTI_USER 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SU24_BL5_SWP391_G1', N'ON'
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET QUERY_STORE = ON
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SU24_BL5_SWP391_G1]
GO
/****** Object:  Table [dbo].[About]    Script Date: 8/8/2024 7:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[AboutId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[ImageURL] [varchar](255) NULL,
	[Content] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[AboutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 8/8/2024 7:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[bill_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[total] [money] NOT NULL,
	[payment] [varchar](250) NOT NULL,
	[address] [ntext] NOT NULL,
	[date] [date] NOT NULL,
	[phone] [bigint] NOT NULL,
 CONSTRAINT [PK_bill] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill_detail]    Script Date: 8/8/2024 7:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill_detail](
	[detail_id] [bigint] IDENTITY(1,1) NOT NULL,
	[bill_id] [bigint] NOT NULL,
	[product_id] [varchar](100) NOT NULL,
	[quantity] [int] NOT NULL,
	[size] [nchar](10) NOT NULL,
	[color] [nvarchar](150) NOT NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_bill_detail] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 8/8/2024 7:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[cart_id] [bigint] NOT NULL,
	[product_id] [varchar](100) NOT NULL,
	[product_name] [varchar](255) NOT NULL,
	[product_img] [varchar](255) NOT NULL,
	[product_price] [float] NOT NULL,
	[total] [float] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 8/8/2024 7:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](255) NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 8/8/2024 7:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [varchar](100) NOT NULL,
	[category_id] [int] NOT NULL,
	[product_name] [nvarchar](max) NOT NULL,
	[product_price] [money] NOT NULL,
	[product_describe] [nvarchar](max) NOT NULL,
	[quantity] [int] NOT NULL,
	[img] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_active]    Script Date: 8/8/2024 7:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_active](
	[product_id] [varchar](100) NOT NULL,
	[active] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_color]    Script Date: 8/8/2024 7:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_color](
	[product_id] [varchar](100) NOT NULL,
	[color] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_comment]    Script Date: 8/8/2024 7:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [varchar](100) NULL,
	[user_id] [bigint] NULL,
	[created_at] [datetime] NULL,
	[Rating] [int] NULL,
	[comment] [nvarchar](255) NULL,
	[user_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_saleOFF]    Script Date: 8/8/2024 7:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_saleOFF](
	[sale_id] [int] NOT NULL,
	[product_id] [varchar](100) NULL,
	[discount_percentage] [decimal](5, 2) NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[sale_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_size]    Script Date: 8/8/2024 7:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_size](
	[product_id] [varchar](100) NOT NULL,
	[size] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report]    Script Date: 8/8/2024 7:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report](
	[id_report] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
	[content_report] [nvarchar](max) NULL,
	[subject_report] [nvarchar](255) NULL,
	[user_email] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_report] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 8/8/2024 7:57:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](200) NULL,
	[user_email] [varchar](255) NOT NULL,
	[user_pass] [nvarchar](255) NOT NULL,
	[isAdmin] [nvarchar](50) NULL,
	[dateOfBirth] [varchar](255) NULL,
	[address] [varchar](255) NULL,
	[phoneNumber] [varchar](10) NULL,
	[banned] [bit] NULL,
	[adminReason] [nvarchar](50) NULL,
	[isStoreStaff] [nvarchar](50) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[About] ON 

INSERT [dbo].[About] ([AboutId], [Title], [ImageURL], [Content]) VALUES (1, N'Mô Hình Kinh Doanh', NULL, N'Chúng tôi hoạt động theo mô hình cửa hàng thời trang trực tuyến, cung cấp các sản phẩm quần áo và phụ kiện chất lượng cao. Mô hình kinh doanh của chúng tôi tập trung vào việc kết nối trực tiếp với khách hàng qua nền tảng trực tuyến, giúp họ dễ dàng lựa chọn và mua sắm sản phẩm yêu thích từ mọi nơi.Chúng tôi cam kết mang đến trải nghiệm mua sắm dễ dàng và tiện lợi với dịch vụ khách hàng tận tâm và chính sách đổi trả linh hoạt.')
INSERT [dbo].[About] ([AboutId], [Title], [ImageURL], [Content]) VALUES (2, N'Chiến Lược Kinh Doanh', NULL, N'Chiến lược của chúng tôi là không ngừng đổi mới và cập nhật các xu hướng thời trang mới nhất để đáp ứng nhu cầu của khách hàng. Chúng tôi tập trung vào việc xây dựng thương hiệu với các sản phẩm chất lượng, giá cả hợp lý và dịch vụ khách hàng xuất sắc.')
INSERT [dbo].[About] ([AboutId], [Title], [ImageURL], [Content]) VALUES (3, N'Tầm Nhìn', NULL, N'Tầm nhìn của chúng tôi là trở thành một trong những cửa hàng thời trang trực tuyến hàng đầu tại Việt Nam, được khách hàng tin tưởng và lựa chọn hàng đầu. Chúng tôi hướng tới việc không ngừng cải tiến chất lượng sản phẩm và dịch vụ, đồng thời phát triển bền vững và có trách nhiệm với cộng đồng và môi trường.Chúng tôi tin rằng bằng cách tập trung vào sự đổi mới và khách hàng, chúng tôi có thể xây dựng một thương hiệu thời trang uy tín và đáng tin cậy trong lòng khách hàng.')
SET IDENTITY_INSERT [dbo].[About] OFF
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [FK_bill_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK_bill_users]
GO
ALTER TABLE [dbo].[bill_detail]  WITH CHECK ADD  CONSTRAINT [FK_bill_detail_bill] FOREIGN KEY([bill_id])
REFERENCES [dbo].[bill] ([bill_id])
GO
ALTER TABLE [dbo].[bill_detail] CHECK CONSTRAINT [FK_bill_detail_bill]
GO
ALTER TABLE [dbo].[bill_detail]  WITH CHECK ADD  CONSTRAINT [FK_bill_detail_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[bill_detail] CHECK CONSTRAINT [FK_bill_detail_product]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category]
GO
ALTER TABLE [dbo].[product_active]  WITH CHECK ADD  CONSTRAINT [FK_ProductActive_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_active] CHECK CONSTRAINT [FK_ProductActive_Product]
GO
ALTER TABLE [dbo].[product_color]  WITH CHECK ADD  CONSTRAINT [FK_product_color_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_color] CHECK CONSTRAINT [FK_product_color_product]
GO
ALTER TABLE [dbo].[product_comment]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_comment]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_comment]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[product_comment]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[product_saleOFF]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_size]  WITH CHECK ADD  CONSTRAINT [FK_product_size_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_size] CHECK CONSTRAINT [FK_product_size_product]
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD  CONSTRAINT [FK_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[report] CHECK CONSTRAINT [FK_user_id]
GO
USE [master]
GO
ALTER DATABASE [SU24_BL5_SWP391_G1] SET  READ_WRITE 
GO

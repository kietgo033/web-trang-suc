USE [master]
GO
/****** Object:  Database [WebTrangSuc]    Script Date: 13/06/2020 16:05:36 ******/
CREATE DATABASE [WebTrangSuc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebTrangSuc', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012\MSSQL\DATA\WebTrangSuc.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebTrangSuc_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012\MSSQL\DATA\WebTrangSuc_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WebTrangSuc] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebTrangSuc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebTrangSuc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebTrangSuc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebTrangSuc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebTrangSuc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebTrangSuc] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebTrangSuc] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebTrangSuc] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [WebTrangSuc] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebTrangSuc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebTrangSuc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebTrangSuc] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebTrangSuc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebTrangSuc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebTrangSuc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebTrangSuc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebTrangSuc] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebTrangSuc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebTrangSuc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebTrangSuc] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebTrangSuc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebTrangSuc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebTrangSuc] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebTrangSuc] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebTrangSuc] SET RECOVERY FULL 
GO
ALTER DATABASE [WebTrangSuc] SET  MULTI_USER 
GO
ALTER DATABASE [WebTrangSuc] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebTrangSuc] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebTrangSuc] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebTrangSuc] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebTrangSuc', N'ON'
GO
USE [WebTrangSuc]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 13/06/2020 16:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 13/06/2020 16:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[ProId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 13/06/2020 16:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Created] [date] NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 13/06/2020 16:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](70) NOT NULL,
	[Price] [float] NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Discount] [float] NULL,
	[Quantity] [int] NOT NULL,
	[Created] [date] NOT NULL,
	[CateId] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 13/06/2020 16:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 13/06/2020 16:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Gender] [bit] NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Created] [date] NOT NULL,
	[UserRole] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (N'Bt', N'Bông tai')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (N'Dc', N'Dây chuyền')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (N'Dh', N'Đồng hồ')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (N'Nh', N'Nhẫn')
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [Quantity], [UnitPrice], [ProId], [OrderId]) VALUES (45, 1, 700, 48, 39)
INSERT [dbo].[OrderDetails] ([Id], [Quantity], [UnitPrice], [ProId], [OrderId]) VALUES (46, 2, 800, 50, 39)
INSERT [dbo].[OrderDetails] ([Id], [Quantity], [UnitPrice], [ProId], [OrderId]) VALUES (48, 1, 12, 45, 39)
INSERT [dbo].[OrderDetails] ([Id], [Quantity], [UnitPrice], [ProId], [OrderId]) VALUES (50, 3, 36, 45, 40)
INSERT [dbo].[OrderDetails] ([Id], [Quantity], [UnitPrice], [ProId], [OrderId]) VALUES (51, 2, 4000, 32, 41)
INSERT [dbo].[OrderDetails] ([Id], [Quantity], [UnitPrice], [ProId], [OrderId]) VALUES (52, 3, 1200, 50, 42)
INSERT [dbo].[OrderDetails] ([Id], [Quantity], [UnitPrice], [ProId], [OrderId]) VALUES (53, 1, 500, 47, 43)
INSERT [dbo].[OrderDetails] ([Id], [Quantity], [UnitPrice], [ProId], [OrderId]) VALUES (55, 1, 600, 71, 45)
INSERT [dbo].[OrderDetails] ([Id], [Quantity], [UnitPrice], [ProId], [OrderId]) VALUES (56, 1, 399, 60, 45)
INSERT [dbo].[OrderDetails] ([Id], [Quantity], [UnitPrice], [ProId], [OrderId]) VALUES (57, 2, 998, 53, 46)
INSERT [dbo].[OrderDetails] ([Id], [Quantity], [UnitPrice], [ProId], [OrderId]) VALUES (58, 1, 700, 48, 47)
INSERT [dbo].[OrderDetails] ([Id], [Quantity], [UnitPrice], [ProId], [OrderId]) VALUES (60, 1, 800, 54, 49)
INSERT [dbo].[OrderDetails] ([Id], [Quantity], [UnitPrice], [ProId], [OrderId]) VALUES (61, 2, 1000, 47, 49)
INSERT [dbo].[OrderDetails] ([Id], [Quantity], [UnitPrice], [ProId], [OrderId]) VALUES (62, 1, 566, 55, 50)
INSERT [dbo].[OrderDetails] ([Id], [Quantity], [UnitPrice], [ProId], [OrderId]) VALUES (63, 1, 700, 48, 51)
INSERT [dbo].[OrderDetails] ([Id], [Quantity], [UnitPrice], [ProId], [OrderId]) VALUES (64, 1, 400, 50, 52)
INSERT [dbo].[OrderDetails] ([Id], [Quantity], [UnitPrice], [ProId], [OrderId]) VALUES (65, 2, 1000, 47, 52)
INSERT [dbo].[OrderDetails] ([Id], [Quantity], [UnitPrice], [ProId], [OrderId]) VALUES (1060, 4, 2800, 48, 1047)
INSERT [dbo].[OrderDetails] ([Id], [Quantity], [UnitPrice], [ProId], [OrderId]) VALUES (1061, 1, 200, 51, 1047)
INSERT [dbo].[OrderDetails] ([Id], [Quantity], [UnitPrice], [ProId], [OrderId]) VALUES (1062, 1, 499, 53, 1048)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [UserId], [Created], [StatusId]) VALUES (39, 1050, CAST(0x2E410B00 AS Date), 1)
INSERT [dbo].[Orders] ([Id], [UserId], [Created], [StatusId]) VALUES (40, 1052, CAST(0x2E410B00 AS Date), 2)
INSERT [dbo].[Orders] ([Id], [UserId], [Created], [StatusId]) VALUES (41, 1052, CAST(0x2E410B00 AS Date), 1)
INSERT [dbo].[Orders] ([Id], [UserId], [Created], [StatusId]) VALUES (42, 1053, CAST(0x2E410B00 AS Date), 1)
INSERT [dbo].[Orders] ([Id], [UserId], [Created], [StatusId]) VALUES (43, 1053, CAST(0x2E410B00 AS Date), 1)
INSERT [dbo].[Orders] ([Id], [UserId], [Created], [StatusId]) VALUES (44, 1053, CAST(0x2E410B00 AS Date), 1)
INSERT [dbo].[Orders] ([Id], [UserId], [Created], [StatusId]) VALUES (45, 1050, CAST(0x2E410B00 AS Date), 1)
INSERT [dbo].[Orders] ([Id], [UserId], [Created], [StatusId]) VALUES (46, 1050, CAST(0x2F410B00 AS Date), 2)
INSERT [dbo].[Orders] ([Id], [UserId], [Created], [StatusId]) VALUES (47, 1050, CAST(0x2F410B00 AS Date), 1)
INSERT [dbo].[Orders] ([Id], [UserId], [Created], [StatusId]) VALUES (49, 1051, CAST(0x2F410B00 AS Date), 1)
INSERT [dbo].[Orders] ([Id], [UserId], [Created], [StatusId]) VALUES (50, 1051, CAST(0x2F410B00 AS Date), 1)
INSERT [dbo].[Orders] ([Id], [UserId], [Created], [StatusId]) VALUES (51, 1051, CAST(0x2F410B00 AS Date), 1)
INSERT [dbo].[Orders] ([Id], [UserId], [Created], [StatusId]) VALUES (52, 1050, CAST(0x2F410B00 AS Date), 1)
INSERT [dbo].[Orders] ([Id], [UserId], [Created], [StatusId]) VALUES (1047, 1052, CAST(0x34410B00 AS Date), 2)
INSERT [dbo].[Orders] ([Id], [UserId], [Created], [StatusId]) VALUES (1048, 1052, CAST(0x34410B00 AS Date), 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (31, N'Wittelsbach-Graff Diamond Ring', 400, N'1.jpg', N'Viên kim cương này được khám phá tại Hạt Kulloor Guntur của Ấn Độ vào cuối thế kỷ XVII. Với 31,06 carat cùng một màu xanh đậm và rất hoàn hảo. Ba chuyên gia khác nhau đã làm việc để cắt kim cương có được hình dạng vừa phải.', 0, 10, CAST(0x2E410B00 AS Date), N'Nh')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (32, N'Franck Muller Aeternitas Mega 4', 399, N'40.jpg', N'Riêng phiên bản Franck Muller Aeternitas Mega 4 có 36 tính năng, 23 cách hiển thị qua 6 kim và 5 con đỉa, bộ máy được lắp ráp từ 1.483 linh kiện, 99 chân kính,…', 0, 5, CAST(0x2E410B00 AS Date), N'Dh')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (45, N'Ring GLAMIRA Fonda', 100, N'10.jpg', N'Một viên kim cương là 6.01 carat. Kim cương màu xanh được đề cập ở dạng hình nệm, được bao quanh bởi một viên kim cương màu hồng nhỏ hơn ở cả hai bên', 0, 6, CAST(0x2E410B00 AS Date), N'Nh')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (47, N'Heart of the Ocean', 500, N'heartof.jpg', N'Chiếc vòng cổ Heart of the Ocean (Trái tim của Đại dương) được đeo lần đầu tiên bởi ngôi sao Kate Winslet trong phim Titanic.  Mặt dây chuyền được làm từ một tinh thể sapphire Ceylon hình trái tim 171 carat và được bao xung quanh bởi 103 viên kim cương.', NULL, 3, CAST(0x2D410B00 AS Date), N'Dc')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (48, N'Tissot Powermatic', 700, N'đồng hồ 3.jpg', N'Loại máy: Automatic POWERMATIC 80, dự trữ năng lượng lên đến 80 giờ.
Kính: Sapphire
Bên trong hộp mới mua về sẽ là một chiếc đồng hồ, một đống sách gì đó mà mình chẳng đọc, thẻ bảo hành, một cái túi vải để cất đồng hồ khi anh em không đeo.', 0, 5, CAST(0x2D410B00 AS Date), N'Dh')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (50, N'Moissanite', 400, N'Moissanite.jpg', N'Với màu trắng sáng tinh khiết, Moissanite biểu tượng cho sự đẳng cấp, sang trọng và vĩnh hằng. Ngoài ra, viên kim cương còn là biểu tượng của trí tuệ và sự sáng tạo nhiệt huyết.
Nguồn gốc: Được tìm thấy lẫn trong các khoáng vật khác.', 0, 3, CAST(0x2D410B00 AS Date), N'Nh')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (51, N'Ulzzang', 200, N'bong-tai-ngoc-trai.jpg', N'Bông tai mẫu mới hot nhât 2019, đính đá cz và ngọc trai giả
Hàng thủ công được làm tỉ mỉ từng chi tiết', 0, 5, CAST(0x2D410B00 AS Date), N'Bt')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (52, N'Cimone Ear Cuffs Crystal', 400, N'20.jpg', N'Pha lê còng tai Caroline Svedbom Cimone. Còng tuyệt đẹp với pha lê Swarovski, đeo chúng leo lên tai bằng kẹp hoặc treo xuống', NULL, 10, CAST(0x2E410B00 AS Date), N'Bt')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (53, N'L’Incomparable Diamond Necklace', 499, N'21.jpg', N'Chỉ là bạn đủ tiền và quyền lực để sở hữu hay không mà thôi. Vì với những phiên bản cực hiếm như vậy thì không được mở bán ngoài thị trường', 0, 4, CAST(0x2E410B00 AS Date), N'Dc')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (54, N'Pink Star Diamond Ring', 800, N'2.jpg', N'Nó có một viên kim cương 72 triệu đô la. Isaac Wolf là người bán nó. Đó là một viên kim cương đắt giá tới mức mà nhiều người giàu có phải thất vọng vì không mua được viên kim cương này trong cuộc bán đấu giá. Nguồn gốc nó được khai thác ở châu Phi', 0, 3, CAST(0x2E410B00 AS Date), N'Nh')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (55, N'Patek Philippe', 566, N'39.jpg', N'Hiếm có đồng hồ Patek Philippe nào đắt như vậy nên Patek Philippe 5004T là một trong những chiếc đồng hồ đắt nhất thế giới ở thời điểm hiện tại. Điểm khác biệt ở phiên bản lần này là phần thân vỏ được làm bằng Titan.', 0, 4, CAST(0x2E410B00 AS Date), N'Dh')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (56, N'Golconda Diamond Earrings', 199, N'11.jpg', N'Mỗi hạt nhỏ trong đôi hoa tai này có chứa khoảng 23,11 carat, tạo thành 1 lượng carat khá lớn dành cho 1 đôi hoa tai.', 0, 10, CAST(0x2E410B00 AS Date), N'Bt')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (57, N'The Heart Of The Kingdom', 600, N'23.jpg', N'Viên kim cương lớn nhất hình trái lê có khối lượng lên tới 34 carats. Làm từ rất nhiều viên kim cương đa kích cỡ, được tạo ra trong hội thảo Henrri Picq tại Paris vào năm 1912', 0, 3, CAST(0x2E410B00 AS Date), N'Dc')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (58, N'Graff Pink Diamond Ring', 199, N'3.png', N'Viên kim cương được sử dụng trong chiếc nhẫn này là 24,78 carat với thiết kế sang trọng. 63 năm trước, chiếc nhẫn kim cương này đã được bán với giá 46,2 triệu đô la', 0, 10, CAST(0x2E410B00 AS Date), N'Nh')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (59, N'Harry Winston earrings', 599, N'12.jpg', N'Đôi hoa tai hoàng hậu hình quả lê của ông Winston nặng khoảng 60 carat. Chúng đã từng được trưng bày tại nhà riêng của ông Winston tại bang California', 0, 4, CAST(0x2E410B00 AS Date), N'Bt')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (60, N'Leviev’s Vivid Yellow Diamond Pendant', 399, N'24.jpg', N'Với các viên kim cương Incomparable nặng tổng cộng 407,48 carats và một viên kim cương màu vàng nặng 230 carats, đây đích thị là chiếc vòng cổ giá trị nhất thế giới
', 0, 5, CAST(0x2E410B00 AS Date), N'Dc')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (61, N'Graff Diamonds – Hallucination', 200, N'31.jpg', N'Graff Diamonds – Hallucination sở hữu một vẻ đẹp lung linh tuyệt vời với hàng nghìn viên kim cương được thiết kế gắn trên thân và bao phủ cả mặt của chiếc đồng hồ.', 0, 10, CAST(0x2E410B00 AS Date), N'Dh')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (62, N'Winston Blue Diamond Ring', 499, N'4.jpg', N'Viên kim cương là một điều tuyệt vời: 13,22 carats, một kỷ lục thế giới. Hình dạng giọt nước mắt hoặc chúng ta có thể nói viên kim cương hình quả hạnh trông hoàn toàn hoàn hảo. Nhẫn và kim cương của nó trông rất hoàn hảo với nhau.', 0, 5, CAST(0x2E410B00 AS Date), N'Nh')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (63, N'Empress Eugenie', 199, N'14.jpg', N'Không chỉ nổi tiếng nhờ thiết kế và cách sản xuất của nó, đôi hoa tai này còn nổi tiếng bởi nó được nữ diễn viên vô cùng tài năng Angelina Jolie diện trong lễ trao giải Oscar vào năm 2009', 0, 10, CAST(0x2E410B00 AS Date), N'Bt')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (64, N'Chopard', 200, N'34.jpg', N'Là một chiếc đồng hồ khá màu mè của hãng đồng hồ cao cấp Thụy Sĩ Chopard, thoạt nhìn ta dễ lầm tưởng chiếc đồng hồ này là một món đồ trang sức với rất nhiều “hạt đá đầy màu sắc”.', 0, 10, CAST(0x2E410B00 AS Date), N'Dh')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (65, N'Perfect Pink Diamond', 189, N'5.jpg', N'Perfect Pink Diamond là một viên đá quý được bán đấu giá. Viên kim cương này với 14,23 carat trong khi nó được bán tại một cuộc đấu giá của Christie', 0, 5, CAST(0x2E410B00 AS Date), N'Nh')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (66, N'Isabel Crystal Rhodium', 189, N'15.jpg', N'Tất cả đồ trang sức của Caroline Svedbom đều được làm thủ công với các yếu tố Swarovski chính hãng và đi kèm với hệ thống ghi nhãn mới.', 0, 10, CAST(0x2E410B00 AS Date), N'Bt')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (67, N'Christie’s Diamond Necklace', 199, N'25.jpg', N'Kết hợp kỹ thuật chế tạo bộ máy thời gian cùng với một thế mạnh khác – trang sức – để tạo nên tác phẩm tuyệt vời này', 0, 5, CAST(0x2E410B00 AS Date), N'Dc')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (69, N'The Vivid Yellow Ring', 600, N'6.jpg', N'Người yêu màu vàng, thì đây là viên kim cương cho họ. Viên kim cương màu vàng được sử dụng trong chiếc nhẫn này là chiếc đắt nhất mọi thời đại và được bán tại một cuộc đấu giá của Jewellery Jewels và Noble Jewels của Geneva tại Sotheby.', 0, 5, CAST(0x2E410B00 AS Date), N'Nh')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (70, N'Delia Earrings Tangerine', 100, N'16.jpg', N'Caroline Svedbom Delia Bông tai quýt. Hoa tai đẹp với pha lê Swarovski cho mọi dịp', 0, 3, CAST(0x2E410B00 AS Date), N'Bt')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (71, N'Etcetera’s Burmese Ruby Necklace', 600, N'26.jpg', N'Tổng cộng có 874 viên kim cương nhiều kích cỡ khác nhau, trong đó viên lớn nhất đạt tới 15 carats. Thêm vào đó, nó được thiết kế để 3 viên kim cương lớn nhất tách rời nhau và để lộ mặt đồng hồ bên dưới.', 0, 2, CAST(0x2E410B00 AS Date), N'Dc')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (72, N'HuBlot Big Bang', 700, N'36.jpg', N'Với tổng số 1280 viên kim cương được dùng với ít nhất 3 cara mỗi viên khối lượng chính xác đạt hơn 100 cara. Chiếc đồng hồ trở nên lấp lánh này có vẻ đẹp sang trọng, rực sáng.', 0, 2, CAST(0x2E410B00 AS Date), N'Dh')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (73, N'Choparded', 800, N'7.jpg', N'Nhẫn có một viên kim cương xanh hình bầu dục tuyệt vời với 18 carats vàng trắng. Xung quanh được gắn với những viên kim cương trắng nhỏ hơn. Viên kim cương xanh được sử dụng trong chiếc nhẫn này xuất phát từ một trầm tích boron', 0, 3, CAST(0x2E410B00 AS Date), N'Nh')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (74, N'Classic drop earrings crystal', 300, N'17.jpg', N'Thiết kế tính xảo tỉ mỉ tạo sự sang trọng cho sản phẩm,khoen cài tiện dụng, dễ tháo ráp và chắc chắn,kiểu dáng thanh lịch phù hợp với các loại trang phục', 0, 5, CAST(0x2E410B00 AS Date), N'Bt')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (75, N'The Red Scarlet', 789, N'28.jpg', N'The Red Scarlet có trung tâm là một viên kim cương màu hồng 5 carats dạng cushion. Ở mỗi bên là các viên kim cương hình lá chắn gắn trên thân nhẫn làm từ bạch kim và vàng hồng 18k.', 0, 10, CAST(0x2E410B00 AS Date), N'Dc')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (76, N'Vacheron constantin', 1000, N'38.jpg', N'Hãng sử dụng bỏ bằng vàng hồng, tính năng mặt trời mọc & mặt trời lặn, bộ máy lắp ráp từ 834 bộ phận và được nghiên cứu, phát triển trong 10.000 giờ. Vacheron constantin', 0, 2, CAST(0x2E410B00 AS Date), N'Dh')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (77, N'The Vivid Pink', 600, N'9.png', N'Viên kim cương 5 carat được sử dụng để làm ra chiếc nhẫn này chắc chắn sẽ làm cho bất cứ ai nhìn thấy nó cũng rất hạnh phúc', 0, 5, CAST(0x2E410B00 AS Date), N'Nh')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (78, N'Ivy Earrings Crystal', 100, N'19.jpg', N'Pha lê còng tai Caroline Svedbom Cimone. Còng tuyệt đẹp với pha lê Swarovski, đeo chúng leo lên tai bằng kẹp hoặc treo xuống', 0, 5, CAST(0x2E410B00 AS Date), N'Bt')
INSERT [dbo].[Products] ([Id], [Name], [Price], [Photo], [Description], [Discount], [Quantity], [Created], [CateId]) VALUES (79, N'Christie’s Diamond Pendant', 499, N'29.jpg', N'Christie’s Diamond Pendant  vốn là một viên kim cương màu xanh thẫm nặng 35,56 carats, được tìm thấy tại khu mỏ Kollur thuộc quận Guntur ở Andhra Pradesh (Đông Nam Ấn Độ).', 0, 4, CAST(0x2E410B00 AS Date), N'Dc')
SET IDENTITY_INSERT [dbo].[Products] OFF
INSERT [dbo].[Status] ([Id], [Name]) VALUES (0, N'Đã hủy')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (2, N'Đang giao hàng')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (1, N'Đang xác nhận')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (3, N'Hoàn tất đơn hàng')
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Gender], [Username], [Password], [Email], [Phone], [Address], [Created], [UserRole]) VALUES (1050, N'hoàng Phan', 1, N'admin', N'idonot', N'txkietxt@gmail.com', N'01634256313', N'Q9, tp Hồ Chí Minh', CAST(0x423F0B00 AS Date), N'admin')
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Username], [Password], [Email], [Phone], [Address], [Created], [UserRole]) VALUES (1051, N'Phan hoàng Kỳ', 1, N'hoangkiet', N'likeyou', N'tkkietkt@gmail.com', N'87349387', N'Quận 10', CAST(0x2D410B00 AS Date), N'admin')
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Username], [Password], [Email], [Phone], [Address], [Created], [UserRole]) VALUES (1052, N'Oanh Đoàn', 0, N'army', N'oanhdoan', N'tkkietkt@gmail.com', N'07326437782', N'Buôn Ma Thuột', CAST(0x2E410B00 AS Date), N'client')
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Username], [Password], [Email], [Phone], [Address], [Created], [UserRole]) VALUES (1053, N'Đặng Trường An', 1, N'anan', N'asdasd', N'tvkietvt@gmail.com', N'07348377656', N'Châu thành tiền giang', CAST(0x2E410B00 AS Date), N'client')
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Username], [Password], [Email], [Phone], [Address], [Created], [UserRole]) VALUES (1054, N'Patek Philippe', 1, N'client1', N'6842033', N'tvkietvt@gmail.com', N'0989588923', N'ấp hòa nhị binh CT TG', CAST(0x2F410B00 AS Date), N'client')
INSERT [dbo].[Users] ([Id], [Name], [Gender], [Username], [Password], [Email], [Phone], [Address], [Created], [UserRole]) VALUES (1055, N'Hồ Hoàng Long', 1, N'place001', N'zloldfk', N'zloldfk@gmail.com', N'0348734817', N'tp hồ chí minh', CAST(0x2F410B00 AS Date), N'client')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Category]    Script Date: 13/06/2020 16:05:36 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [IX_Category] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Products]    Script Date: 13/06/2020 16:05:36 ******/
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [IX_Products] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Status]    Script Date: 13/06/2020 16:05:36 ******/
ALTER TABLE [dbo].[Status] ADD  CONSTRAINT [IX_Status] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Users]    Script Date: 13/06/2020 16:05:36 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [IX_Users] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProId])
REFERENCES [dbo].[Products] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Status]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([CateId])
REFERENCES [dbo].[Category] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
USE [master]
GO
ALTER DATABASE [WebTrangSuc] SET  READ_WRITE 
GO

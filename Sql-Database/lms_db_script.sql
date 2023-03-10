USE [master]
GO
/****** Object:  Database [LMS]    Script Date: 3/1/2023 3:32:58 PM ******/
CREATE DATABASE [LMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LMS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [LMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LMS] SET RECOVERY FULL 
GO
ALTER DATABASE [LMS] SET  MULTI_USER 
GO
ALTER DATABASE [LMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LMS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LMS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LMS', N'ON'
GO
ALTER DATABASE [LMS] SET QUERY_STORE = ON
GO
ALTER DATABASE [LMS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LMS]
GO
/****** Object:  Table [dbo].[tbl_Books]    Script Date: 3/1/2023 3:32:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Books](
	[bookId] [int] IDENTITY(1,1) NOT NULL,
	[bookTitle] [varchar](50) NULL,
	[bookEdition] [nvarchar](50) NULL,
	[bookAuthor] [varchar](50) NULL,
	[publisherName] [varchar](50) NULL,
	[bookPrice] [int] NULL,
 CONSTRAINT [PK_tbl_Books] PRIMARY KEY CLUSTERED 
(
	[bookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_BorrowersRecords]    Script Date: 3/1/2023 3:32:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_BorrowersRecords](
	[borrowId] [int] IDENTITY(1,1) NOT NULL,
	[borrowDate] [date] NULL,
	[dueDate] [date] NULL,
	[status] [int] NULL,
	[studentCopies] [nvarchar](50) NULL,
	[bookId] [int] NULL,
	[studentId] [int] NULL,
	[userId] [int] NULL,
 CONSTRAINT [PK_tbl_BorrowersRecords] PRIMARY KEY CLUSTERED 
(
	[borrowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Students]    Script Date: 3/1/2023 3:32:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Students](
	[studentId] [int] IDENTITY(1,1) NOT NULL,
	[studentRollNo] [varchar](50) NULL,
	[studentName] [nvarchar](50) NULL,
	[studentCourse] [nvarchar](50) NOT NULL,
	[studentContact] [nvarchar](50) NULL,
	[studentGender] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[studentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 3/1/2023 3:32:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Users](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](50) NULL,
	[userContact] [nvarchar](50) NULL,
	[userPassword] [int] NULL,
 CONSTRAINT [PK_tbl_Users] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Books] ON 

INSERT [dbo].[tbl_Books] ([bookId], [bookTitle], [bookEdition], [bookAuthor], [publisherName], [bookPrice]) VALUES (1, N'MalcomX', N'3rd', N'Alex Haley', N'Alif 2', 25000)
INSERT [dbo].[tbl_Books] ([bookId], [bookTitle], [bookEdition], [bookAuthor], [publisherName], [bookPrice]) VALUES (2, N'Rich Dad Poor Dad', N'1st', N'Robert T Kiyosaki', N'Platam', 15000)
INSERT [dbo].[tbl_Books] ([bookId], [bookTitle], [bookEdition], [bookAuthor], [publisherName], [bookPrice]) VALUES (3, N'12 Rules For Life', N'1st', N'Jordan Peterson', N'Oxford', 30000)
INSERT [dbo].[tbl_Books] ([bookId], [bookTitle], [bookEdition], [bookAuthor], [publisherName], [bookPrice]) VALUES (1004, N'7 Habits of Effective', N'4th', N'Stephen R Covey', N'Giga', 3500)
INSERT [dbo].[tbl_Books] ([bookId], [bookTitle], [bookEdition], [bookAuthor], [publisherName], [bookPrice]) VALUES (1005, N'GDSC', N'1st', N'Haris', N'Lemon', 5000)
INSERT [dbo].[tbl_Books] ([bookId], [bookTitle], [bookEdition], [bookAuthor], [publisherName], [bookPrice]) VALUES (1006, N'Too Late', N'3rd', N'C Hoveer', N'S Novel', 5000)
INSERT [dbo].[tbl_Books] ([bookId], [bookTitle], [bookEdition], [bookAuthor], [publisherName], [bookPrice]) VALUES (2006, N'Atomic Habits', N'1st', N'Glen', N'Seon', 3000)
SET IDENTITY_INSERT [dbo].[tbl_Books] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_BorrowersRecords] ON 

INSERT [dbo].[tbl_BorrowersRecords] ([borrowId], [borrowDate], [dueDate], [status], [studentCopies], [bookId], [studentId], [userId]) VALUES (1, CAST(N'2023-01-12' AS Date), CAST(N'2023-01-20' AS Date), 1, N'2', 2, 1, 1)
INSERT [dbo].[tbl_BorrowersRecords] ([borrowId], [borrowDate], [dueDate], [status], [studentCopies], [bookId], [studentId], [userId]) VALUES (3, CAST(N'2023-03-13' AS Date), CAST(N'2024-06-01' AS Date), 0, N'3', 3, 3, 1)
INSERT [dbo].[tbl_BorrowersRecords] ([borrowId], [borrowDate], [dueDate], [status], [studentCopies], [bookId], [studentId], [userId]) VALUES (4, CAST(N'2023-02-06' AS Date), CAST(N'2023-02-17' AS Date), 0, N'2', 2, 1, 2)
INSERT [dbo].[tbl_BorrowersRecords] ([borrowId], [borrowDate], [dueDate], [status], [studentCopies], [bookId], [studentId], [userId]) VALUES (22, CAST(N'2024-02-13' AS Date), CAST(N'2033-02-01' AS Date), 0, N'2', 1004, 4, 1)
INSERT [dbo].[tbl_BorrowersRecords] ([borrowId], [borrowDate], [dueDate], [status], [studentCopies], [bookId], [studentId], [userId]) VALUES (23, CAST(N'2023-03-20' AS Date), CAST(N'2023-04-18' AS Date), 0, N'2', 3, 2, 2)
INSERT [dbo].[tbl_BorrowersRecords] ([borrowId], [borrowDate], [dueDate], [status], [studentCopies], [bookId], [studentId], [userId]) VALUES (28, CAST(N'2023-02-14' AS Date), CAST(N'2023-02-13' AS Date), 0, N'1', 1, 3, 2)
INSERT [dbo].[tbl_BorrowersRecords] ([borrowId], [borrowDate], [dueDate], [status], [studentCopies], [bookId], [studentId], [userId]) VALUES (29, CAST(N'2023-03-14' AS Date), CAST(N'2023-05-24' AS Date), 0, N'1', 2, 2, 2)
INSERT [dbo].[tbl_BorrowersRecords] ([borrowId], [borrowDate], [dueDate], [status], [studentCopies], [bookId], [studentId], [userId]) VALUES (31, CAST(N'2023-02-12' AS Date), CAST(N'2023-03-04' AS Date), 0, N'1', 1004, 4, 1)
INSERT [dbo].[tbl_BorrowersRecords] ([borrowId], [borrowDate], [dueDate], [status], [studentCopies], [bookId], [studentId], [userId]) VALUES (1033, CAST(N'2023-02-14' AS Date), CAST(N'2023-03-29' AS Date), 1, N'3', 1006, 1, 1)
INSERT [dbo].[tbl_BorrowersRecords] ([borrowId], [borrowDate], [dueDate], [status], [studentCopies], [bookId], [studentId], [userId]) VALUES (1035, CAST(N'2023-03-07' AS Date), CAST(N'2023-03-23' AS Date), 1, N'1', 3, 4, 1003)
INSERT [dbo].[tbl_BorrowersRecords] ([borrowId], [borrowDate], [dueDate], [status], [studentCopies], [bookId], [studentId], [userId]) VALUES (2033, CAST(N'2023-03-15' AS Date), CAST(N'2023-03-21' AS Date), 0, N'2', 2006, 1, 1004)
INSERT [dbo].[tbl_BorrowersRecords] ([borrowId], [borrowDate], [dueDate], [status], [studentCopies], [bookId], [studentId], [userId]) VALUES (2034, CAST(N'2023-03-13' AS Date), CAST(N'2023-12-11' AS Date), 0, N'4', 2006, 4, 1003)
SET IDENTITY_INSERT [dbo].[tbl_BorrowersRecords] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Students] ON 

INSERT [dbo].[tbl_Students] ([studentId], [studentRollNo], [studentName], [studentCourse], [studentContact], [studentGender]) VALUES (1, N'20B-100-SE', N'Syed Haris', N'DBMS', N'03160005080', N'M')
INSERT [dbo].[tbl_Students] ([studentId], [studentRollNo], [studentName], [studentCourse], [studentContact], [studentGender]) VALUES (2, N'20B-005-SE', N'Rimmel', N'PE', N'033234150809', N'F')
INSERT [dbo].[tbl_Students] ([studentId], [studentRollNo], [studentName], [studentCourse], [studentContact], [studentGender]) VALUES (3, N'20B-041-SE', N'Sohaib', N'LMS', N'033234150809', N'M')
INSERT [dbo].[tbl_Students] ([studentId], [studentRollNo], [studentName], [studentCourse], [studentContact], [studentGender]) VALUES (4, N'20B-051-SE', N'Laiba', N'HHC', N'03160005080', N'F')
INSERT [dbo].[tbl_Students] ([studentId], [studentRollNo], [studentName], [studentCourse], [studentContact], [studentGender]) VALUES (9, N'20B-01-SE', N'Fizzah', N'Linear', N'0316000704', N'F')
SET IDENTITY_INSERT [dbo].[tbl_Students] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Users] ON 

INSERT [dbo].[tbl_Users] ([userId], [userName], [userContact], [userPassword]) VALUES (1, N'haris', N'03160005080', 5080)
INSERT [dbo].[tbl_Users] ([userId], [userName], [userContact], [userPassword]) VALUES (2, N'laiba', N'03356080323', 12)
INSERT [dbo].[tbl_Users] ([userId], [userName], [userContact], [userPassword]) VALUES (1003, N'Junaid', N'0221232241', 213)
INSERT [dbo].[tbl_Users] ([userId], [userName], [userContact], [userPassword]) VALUES (1004, N'Sehar Khalid', N'0223417001', 12)
SET IDENTITY_INSERT [dbo].[tbl_Users] OFF
GO
ALTER TABLE [dbo].[tbl_BorrowersRecords]  WITH CHECK ADD  CONSTRAINT [FK_tbl_BorrowersRecords_tbl_Books] FOREIGN KEY([bookId])
REFERENCES [dbo].[tbl_Books] ([bookId])
GO
ALTER TABLE [dbo].[tbl_BorrowersRecords] CHECK CONSTRAINT [FK_tbl_BorrowersRecords_tbl_Books]
GO
ALTER TABLE [dbo].[tbl_BorrowersRecords]  WITH CHECK ADD  CONSTRAINT [FK_tbl_BorrowersRecords_tbl_Students] FOREIGN KEY([studentId])
REFERENCES [dbo].[tbl_Students] ([studentId])
GO
ALTER TABLE [dbo].[tbl_BorrowersRecords] CHECK CONSTRAINT [FK_tbl_BorrowersRecords_tbl_Students]
GO
ALTER TABLE [dbo].[tbl_BorrowersRecords]  WITH CHECK ADD  CONSTRAINT [FK_tbl_BorrowersRecords_tbl_Users] FOREIGN KEY([userId])
REFERENCES [dbo].[tbl_Users] ([userId])
GO
ALTER TABLE [dbo].[tbl_BorrowersRecords] CHECK CONSTRAINT [FK_tbl_BorrowersRecords_tbl_Users]
GO
USE [master]
GO
ALTER DATABASE [LMS] SET  READ_WRITE 
GO

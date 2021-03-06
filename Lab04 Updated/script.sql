USE [LibraryCSharp]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 7/1/2018 8:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Author] [nvarchar](100) NULL,
	[Publisher] [nvarchar](150) NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borrow]    Script Date: 7/1/2018 8:17:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrow](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BorrowerID] [int] NOT NULL,
	[CopyID] [int] NOT NULL,
	[BorrowedDate] [date] NOT NULL,
	[DueDate] [date] NOT NULL,
	[ReturnedDate] [date] NULL,
	[FineAmount] [float] NULL,
 CONSTRAINT [PK_Borrow] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borrower]    Script Date: 7/1/2018 8:17:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrower](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Sex] [bit] NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Borrower] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Copy]    Script Date: 7/1/2018 8:17:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Copy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NOT NULL,
	[SequenceNumber] [int] NOT NULL,
	[Type] [nchar](10) NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_Copy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserve]    Script Date: 7/1/2018 8:17:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserve](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CopyID] [int] NOT NULL,
	[BorrowerID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Status] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Reserve] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([ID], [Title], [Author], [Publisher]) VALUES (11, N'Title 4 ', N'Author 4', N'Publisher 4')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Publisher]) VALUES (12, N'Title 5', N'Author 5', N'Publisher 5')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Publisher]) VALUES (14, N'Title 7', N'Author 7', N'Publisher 7')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Publisher]) VALUES (15, N'Title 8', N'Author 8', N'Publisher 8')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Publisher]) VALUES (17, N'Book A New', N'Author A', N'Publisher A')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Publisher]) VALUES (23, N'New Title', N'Author 3', N'Publisher 3')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Publisher]) VALUES (24, N'Title 24', N'Author 24', N'Publisher 24')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Publisher]) VALUES (41, N'New Title', N'New Author', N'New publisher')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Publisher]) VALUES (44, N'Mien', N'Mien Nguyen', N'Mien Publisher')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Publisher]) VALUES (45, N'New title', N'Emily', N'Mien June 28')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Publisher]) VALUES (51, N'Title 7', N'Author 7', N'Publisher Jul 1st')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Publisher]) VALUES (52, N'Book A New', N'Author A', N'Publisher A')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Publisher]) VALUES (53, N'Title 7', N'Author 7', N'Publisher 7')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Publisher]) VALUES (54, N'Mien', N'Mien Nguyen', N'Mien Publisher')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Publisher]) VALUES (55, N'Mien', N'Mien Nguyen', N'Mien Publisher')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Publisher]) VALUES (56, N'Title 24', N'Author 24', N'Publisher 24')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Publisher]) VALUES (57, N'New Title', N'Author 4', N'Publisher 4')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Publisher]) VALUES (58, N'New Title', N'Author 4', N'Publisher 4')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Publisher]) VALUES (59, N'Title 4 ', N'Author 4', N'Publisher 4')
INSERT [dbo].[Book] ([ID], [Title], [Author], [Publisher]) VALUES (60, N'Brand New Title', N'Author 4', N'Publisher 4')
SET IDENTITY_INSERT [dbo].[Book] OFF
SET IDENTITY_INSERT [dbo].[Borrow] ON 

INSERT [dbo].[Borrow] ([ID], [BorrowerID], [CopyID], [BorrowedDate], [DueDate], [ReturnedDate], [FineAmount]) VALUES (15, 20, 38, CAST(N'2018-07-20' AS Date), CAST(N'2018-07-21' AS Date), NULL, NULL)
INSERT [dbo].[Borrow] ([ID], [BorrowerID], [CopyID], [BorrowedDate], [DueDate], [ReturnedDate], [FineAmount]) VALUES (16, 20, 38, CAST(N'2018-07-20' AS Date), CAST(N'2018-07-21' AS Date), NULL, NULL)
INSERT [dbo].[Borrow] ([ID], [BorrowerID], [CopyID], [BorrowedDate], [DueDate], [ReturnedDate], [FineAmount]) VALUES (17, 20, 38, CAST(N'2018-07-20' AS Date), CAST(N'2018-07-21' AS Date), NULL, NULL)
INSERT [dbo].[Borrow] ([ID], [BorrowerID], [CopyID], [BorrowedDate], [DueDate], [ReturnedDate], [FineAmount]) VALUES (18, 20, 38, CAST(N'2018-07-26' AS Date), CAST(N'2018-08-09' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Borrow] OFF
SET IDENTITY_INSERT [dbo].[Borrower] ON 

INSERT [dbo].[Borrower] ([ID], [Name], [Sex], [Address], [Email], [Phone]) VALUES (20, N'Khanh', 1, N'Co Dong, Son Tay, Ha Noi, Viet Nam', N'ngockhanhcute@gmail.com', N'0169511693')
INSERT [dbo].[Borrower] ([ID], [Name], [Sex], [Address], [Email], [Phone]) VALUES (21, N'Khanh', 1, N'Co Dong, Son Tay, Ha Noi, Viet Nam', N'ngockhanhcute@gmail.com', N'0169511693')
INSERT [dbo].[Borrower] ([ID], [Name], [Sex], [Address], [Email], [Phone]) VALUES (22, N'Mien Nguyen', 0, N'Hatinh', N'hongmienft98@gmail.com', N'0984348464')
SET IDENTITY_INSERT [dbo].[Borrower] OFF
SET IDENTITY_INSERT [dbo].[Copy] ON 

INSERT [dbo].[Copy] ([ID], [BookID], [SequenceNumber], [Type], [Price]) VALUES (38, 17, 10, N'Type 17   ', 10)
INSERT [dbo].[Copy] ([ID], [BookID], [SequenceNumber], [Type], [Price]) VALUES (41, 15, 20, N'Type New  ', 60)
INSERT [dbo].[Copy] ([ID], [BookID], [SequenceNumber], [Type], [Price]) VALUES (42, 17, 10, N'New Type  ', 100)
INSERT [dbo].[Copy] ([ID], [BookID], [SequenceNumber], [Type], [Price]) VALUES (43, 15, 20, N'100       ', 60)
SET IDENTITY_INSERT [dbo].[Copy] OFF
ALTER TABLE [dbo].[Borrow]  WITH CHECK ADD  CONSTRAINT [FK_Borrow_Borrower] FOREIGN KEY([BorrowerID])
REFERENCES [dbo].[Borrower] ([ID])
GO
ALTER TABLE [dbo].[Borrow] CHECK CONSTRAINT [FK_Borrow_Borrower]
GO
ALTER TABLE [dbo].[Borrow]  WITH CHECK ADD  CONSTRAINT [FK_Borrow_Copy] FOREIGN KEY([CopyID])
REFERENCES [dbo].[Copy] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Borrow] CHECK CONSTRAINT [FK_Borrow_Copy]
GO
ALTER TABLE [dbo].[Copy]  WITH CHECK ADD  CONSTRAINT [FK_Copy_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Copy] CHECK CONSTRAINT [FK_Copy_Book]
GO
ALTER TABLE [dbo].[Reserve]  WITH CHECK ADD  CONSTRAINT [FK_Reserve_Borrower] FOREIGN KEY([BorrowerID])
REFERENCES [dbo].[Borrower] ([ID])
GO
ALTER TABLE [dbo].[Reserve] CHECK CONSTRAINT [FK_Reserve_Borrower]
GO
ALTER TABLE [dbo].[Reserve]  WITH CHECK ADD  CONSTRAINT [FK_Reserve_Copy] FOREIGN KEY([CopyID])
REFERENCES [dbo].[Copy] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reserve] CHECK CONSTRAINT [FK_Reserve_Copy]
GO
/****** Object:  StoredProcedure [dbo].[InsertBorrower]    Script Date: 7/1/2018 8:17:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertBorrower]
 @idx int
as
while @idx <= 10
begin
	INSERT INTO [Borrower]
           ([Name]
           ,[Sex]
           ,[Address]
           ,[Email]
           ,[Phone])
     VALUES (
           concat('Name ', cast(@idx as nchar(5))),
           concat('Sex ', cast(@idx as nchar(5))),
           concat('Address ', cast(@idx as nchar(5))),
           concat('Email ', cast(@idx as nchar(5))),
           concat('Phone ', cast(@idx as nchar(5))))
	set @idx += 1
end

exec InsertBorrower 1
GO

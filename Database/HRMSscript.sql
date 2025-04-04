USE [HRMS]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 4/1/2025 11:21:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[LocationID] [int] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 4/1/2025 11:21:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[BirthDate] [varchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobHistory]    Script Date: 4/1/2025 11:21:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Employee] [nvarchar](50) NULL,
	[Manager] [nvarchar](50) NULL,
	[JobRole] [nvarchar](50) NULL,
	[StartDate] [nvarchar](50) NULL,
	[EndDate] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[Comments] [nvarchar](500) NULL,
 CONSTRAINT [PK_JobHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobRole]    Script Date: 4/1/2025 11:21:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[DepartmentID] [int] NULL,
 CONSTRAINT [PK_JobRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 4/1/2025 11:21:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Name], [Description], [LocationID]) VALUES (1, N'IT', N'IT Department', 1)
INSERT [dbo].[Department] ([Id], [Name], [Description], [LocationID]) VALUES (2, N'HR', N'HR Department', 1)
INSERT [dbo].[Department] ([Id], [Name], [Description], [LocationID]) VALUES (3, N'Finance', N'Finance Department', 2)
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Name], [BirthDate], [Phone], [Email], [Gender], [Address], [Status]) VALUES (1, N'John', N'10/03/2000', N'123456', N'test@gmail.com', N'Male', N'No,8 A Street, SG 680125', N'Active')
INSERT [dbo].[Employee] ([Id], [Name], [BirthDate], [Phone], [Email], [Gender], [Address], [Status]) VALUES (4, N'Jasmine', N'11/11/2003', N'454567', N'Jas@gmail.com', N'Female', N'ABC Road, Malay', N'Active')
INSERT [dbo].[Employee] ([Id], [Name], [BirthDate], [Phone], [Email], [Gender], [Address], [Status]) VALUES (5, N'Sophe', N'03/02/1995', N'345678', N'sophe@gmail.com', N'Female', N'Thukha Road, Myanmar', N'Active')
INSERT [dbo].[Employee] ([Id], [Name], [BirthDate], [Phone], [Email], [Gender], [Address], [Status]) VALUES (6, N'Mike', N'04/02/2000', N'567890', N'mike@gmail.com', N'Male', N'BBC Road, Singapore', N'Active')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[JobHistory] ON 

INSERT [dbo].[JobHistory] ([Id], [Employee], [Manager], [JobRole], [StartDate], [EndDate], [Status], [Comments]) VALUES (1, N'Jasmine', N'Joseph', N'Developer', N'01/08/2018', N'30/06/2021', N'Inactive', N'Left to other company')
INSERT [dbo].[JobHistory] ([Id], [Employee], [Manager], [JobRole], [StartDate], [EndDate], [Status], [Comments]) VALUES (4, N'Sophe', N'Camilia', N'Software Engineer', N'02/06/2020', N'05/07/2022', N'Inactive', N'Left to other company')
INSERT [dbo].[JobHistory] ([Id], [Employee], [Manager], [JobRole], [StartDate], [EndDate], [Status], [Comments]) VALUES (5, N'Mike', N'Bendo', N'HR Manager', N'10/05/2023', N'03/02/2025', N'Active', N'Working')
SET IDENTITY_INSERT [dbo].[JobHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[JobRole] ON 

INSERT [dbo].[JobRole] ([Id], [Title], [Description], [DepartmentID]) VALUES (1, N'Developer', N'IT Developer', 1)
INSERT [dbo].[JobRole] ([Id], [Title], [Description], [DepartmentID]) VALUES (2, N'Software Engineer', N'Software Engineer', 1)
INSERT [dbo].[JobRole] ([Id], [Title], [Description], [DepartmentID]) VALUES (3, N'HR Manager', N'HR Manager', 2)
SET IDENTITY_INSERT [dbo].[JobRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([Id], [Name], [City], [Country]) VALUES (1, N'Singapore', N'Singapore', N'Singapore')
INSERT [dbo].[Location] ([Id], [Name], [City], [Country]) VALUES (2, N'Malaysia', N'Kuala Lumpur', N'Malaysia')
INSERT [dbo].[Location] ([Id], [Name], [City], [Country]) VALUES (3, N'Myanmar', N'Yangon', N'Myanmar')
SET IDENTITY_INSERT [dbo].[Location] OFF
GO

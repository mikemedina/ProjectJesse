USE [master]
GO
/****** Object:  User [##MS_PolicyEventProcessingLogin##]    Script Date: 6/19/2015 3:43:20 PM ******/
CREATE USER [##MS_PolicyEventProcessingLogin##] FOR LOGIN [##MS_PolicyEventProcessingLogin##] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [##MS_AgentSigningCertificate##]    Script Date: 6/19/2015 3:43:20 PM ******/
CREATE USER [##MS_AgentSigningCertificate##] FOR LOGIN [##MS_AgentSigningCertificate##]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 6/19/2015 3:43:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ImportTable]    Script Date: 6/19/2015 3:43:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImportDate] [datetime] NOT NULL DEFAULT (getdate()),
	[StationID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
	[Rate] [decimal](18, 2) NOT NULL,
	[ShowID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShowTitle]    Script Date: 6/19/2015 3:43:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShowTitle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Station]    Script Date: 6/19/2015 3:43:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Station](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Id], [Name], [StartDate], [EndDate]) VALUES (1, N'Coke', CAST(N'1985-01-01 00:00:00.000' AS DateTime), CAST(N'2050-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([Id], [Name], [StartDate], [EndDate]) VALUES (2, N'Pepsi', CAST(N'1985-01-01 00:00:00.000' AS DateTime), CAST(N'2050-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([Id], [Name], [StartDate], [EndDate]) VALUES (3, N'Farmers', CAST(N'1985-01-01 00:00:00.000' AS DateTime), CAST(N'2050-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([Id], [Name], [StartDate], [EndDate]) VALUES (4, N'Allstate', CAST(N'1985-01-01 00:00:00.000' AS DateTime), CAST(N'2050-01-01 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Client] OFF
SET IDENTITY_INSERT [dbo].[ImportTable] ON 

INSERT [dbo].[ImportTable] ([Id], [ImportDate], [StationID], [ClientID], [Rate], [ShowID]) VALUES (1, CAST(N'2015-06-19 15:21:38.253' AS DateTime), 1, 1, CAST(200.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[ImportTable] ([Id], [ImportDate], [StationID], [ClientID], [Rate], [ShowID]) VALUES (2, CAST(N'2015-06-19 15:21:38.380' AS DateTime), 2, 1, CAST(200.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[ImportTable] ([Id], [ImportDate], [StationID], [ClientID], [Rate], [ShowID]) VALUES (3, CAST(N'2015-06-19 15:21:38.440' AS DateTime), 3, 2, CAST(200.52 AS Decimal(18, 2)), 3)
INSERT [dbo].[ImportTable] ([Id], [ImportDate], [StationID], [ClientID], [Rate], [ShowID]) VALUES (4, CAST(N'2015-06-19 15:21:38.470' AS DateTime), 4, 3, CAST(200.00 AS Decimal(18, 2)), 2)
SET IDENTITY_INSERT [dbo].[ImportTable] OFF
SET IDENTITY_INSERT [dbo].[ShowTitle] ON 

INSERT [dbo].[ShowTitle] ([Id], [Name], [StartDate], [EndDate]) VALUES (1, N'Diet Coke 2015', CAST(N'2015-01-01 00:00:00.000' AS DateTime), CAST(N'2016-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[ShowTitle] ([Id], [Name], [StartDate], [EndDate]) VALUES (2, N'Farmers Insurance 2015', CAST(N'2015-01-01 00:00:00.000' AS DateTime), CAST(N'2016-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[ShowTitle] ([Id], [Name], [StartDate], [EndDate]) VALUES (3, N'Diet Pepsi 2015', CAST(N'2015-01-01 00:00:00.000' AS DateTime), CAST(N'2016-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[ShowTitle] ([Id], [Name], [StartDate], [EndDate]) VALUES (4, N'Good Hands 2015', CAST(N'2015-01-01 00:00:00.000' AS DateTime), CAST(N'2016-01-01 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ShowTitle] OFF
SET IDENTITY_INSERT [dbo].[Station] ON 

INSERT [dbo].[Station] ([Id], [Name], [StartDate], [EndDate]) VALUES (1, N'Fox', CAST(N'1985-01-01 00:00:00.000' AS DateTime), CAST(N'2050-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Station] ([Id], [Name], [StartDate], [EndDate]) VALUES (2, N'ABC', CAST(N'1985-01-01 00:00:00.000' AS DateTime), CAST(N'2050-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Station] ([Id], [Name], [StartDate], [EndDate]) VALUES (3, N'Jesse', CAST(N'1985-01-01 00:00:00.000' AS DateTime), CAST(N'2002-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Station] ([Id], [Name], [StartDate], [EndDate]) VALUES (4, N'CBS', CAST(N'1985-01-01 00:00:00.000' AS DateTime), CAST(N'2050-01-01 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Station] OFF

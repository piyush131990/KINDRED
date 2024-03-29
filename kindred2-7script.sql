USE [master]
GO
/****** Object:  Database [kindred]    Script Date: 7/2/2019 3:46:53 PM ******/
CREATE DATABASE [kindred]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kindred', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\kindred.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'kindred_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\kindred_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [kindred] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kindred].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kindred] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kindred] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kindred] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kindred] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kindred] SET ARITHABORT OFF 
GO
ALTER DATABASE [kindred] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [kindred] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kindred] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kindred] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kindred] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kindred] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kindred] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kindred] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kindred] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kindred] SET  DISABLE_BROKER 
GO
ALTER DATABASE [kindred] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kindred] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kindred] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kindred] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kindred] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kindred] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kindred] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kindred] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [kindred] SET  MULTI_USER 
GO
ALTER DATABASE [kindred] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kindred] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kindred] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kindred] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [kindred] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [kindred] SET QUERY_STORE = OFF
GO
USE [kindred]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [kindred]
GO
/****** Object:  Table [dbo].[K_Category]    Script Date: 7/2/2019 3:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[K_Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_K_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[K_Comment]    Script Date: 7/2/2019 3:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[K_Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Userid] [nvarchar](50) NULL,
	[FriendId] [nvarchar](50) NULL,
	[comment] [nvarchar](max) NULL,
	[postingdate] [datetime] NULL,
	[Postid] [int] NULL,
	[readtrue] [bit] NULL,
	[unreadtrue] [bit] NULL,
 CONSTRAINT [PK_K_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[K_Friends]    Script Date: 7/2/2019 3:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[K_Friends](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Userid] [nvarchar](50) NULL,
	[Friendid] [nvarchar](50) NULL,
	[IsFriend] [bit] NULL,
	[AcceptFriend] [bit] NULL,
	[Allowcomment] [bit] NULL,
 CONSTRAINT [PK_K_Friends] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[K_Likes]    Script Date: 7/2/2019 3:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[K_Likes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Postid] [int] NULL,
	[userid] [nvarchar](100) NULL,
	[liked] [bit] NULL,
	[smile] [bit] NULL,
	[heart] [bit] NULL,
 CONSTRAINT [PK_K_Likes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[K_User]    Script Date: 7/2/2019 3:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[K_User](
	[Id] [uniqueidentifier] NOT NULL,
	[Username] [nvarchar](50) NULL,
	[EmailId] [nvarchar](max) NULL,
	[Idnew] [int] IDENTITY(1,1) NOT NULL,
	[Password] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_K_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[K_UserPostData]    Script Date: 7/2/2019 3:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[K_UserPostData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Userid] [nvarchar](50) NULL,
	[Role] [nvarchar](50) NULL,
	[Post] [nvarchar](max) NOT NULL,
	[Authorize] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL,
	[PostingDate] [datetime] NULL,
 CONSTRAINT [PK_K_UserPostData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[K_UserRoles]    Script Date: 7/2/2019 3:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[K_UserRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Role] [nvarchar](50) NULL,
	[Uid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_K_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[K_Category] ON 

INSERT [dbo].[K_Category] ([Id], [CategoryName], [Description]) VALUES (1, N'Love', N'good')
INSERT [dbo].[K_Category] ([Id], [CategoryName], [Description]) VALUES (2, N'Friendship', N'good')
INSERT [dbo].[K_Category] ([Id], [CategoryName], [Description]) VALUES (3, N'
Heartbreak', N'good')
INSERT [dbo].[K_Category] ([Id], [CategoryName], [Description]) VALUES (4, N'Lesson learnt', N'good')
INSERT [dbo].[K_Category] ([Id], [CategoryName], [Description]) VALUES (5, N'Experience', N'good')
INSERT [dbo].[K_Category] ([Id], [CategoryName], [Description]) VALUES (6, N'Happiness', NULL)
INSERT [dbo].[K_Category] ([Id], [CategoryName], [Description]) VALUES (7, N'Failure', NULL)
INSERT [dbo].[K_Category] ([Id], [CategoryName], [Description]) VALUES (8, N'Challenges', NULL)
INSERT [dbo].[K_Category] ([Id], [CategoryName], [Description]) VALUES (9, N'Dreams/goals', NULL)
INSERT [dbo].[K_Category] ([Id], [CategoryName], [Description]) VALUES (10, N'Inspiration', NULL)
INSERT [dbo].[K_Category] ([Id], [CategoryName], [Description]) VALUES (11, N'Memories', NULL)
INSERT [dbo].[K_Category] ([Id], [CategoryName], [Description]) VALUES (12, N'Mistakes', NULL)
INSERT [dbo].[K_Category] ([Id], [CategoryName], [Description]) VALUES (13, N'Fears', NULL)
INSERT [dbo].[K_Category] ([Id], [CategoryName], [Description]) VALUES (14, N'Trauma/loss', NULL)
INSERT [dbo].[K_Category] ([Id], [CategoryName], [Description]) VALUES (15, N'Regrets', NULL)
INSERT [dbo].[K_Category] ([Id], [CategoryName], [Description]) VALUES (16, N'Nature', NULL)
INSERT [dbo].[K_Category] ([Id], [CategoryName], [Description]) VALUES (17, N'Travel', NULL)
INSERT [dbo].[K_Category] ([Id], [CategoryName], [Description]) VALUES (18, N'Food', NULL)
INSERT [dbo].[K_Category] ([Id], [CategoryName], [Description]) VALUES (19, N'Culture', NULL)
SET IDENTITY_INSERT [dbo].[K_Category] OFF
SET IDENTITY_INSERT [dbo].[K_Comment] ON 

INSERT [dbo].[K_Comment] ([Id], [Userid], [FriendId], [comment], [postingdate], [Postid], [readtrue], [unreadtrue]) VALUES (1, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'78135cfa-31de-4a38-af0a-cac97b141a25', N'gjhhjbhjb hbjbhjbjhb hbjbkjb', CAST(N'2019-06-05T02:24:08.000' AS DateTime), 2017, NULL, NULL)
INSERT [dbo].[K_Comment] ([Id], [Userid], [FriendId], [comment], [postingdate], [Postid], [readtrue], [unreadtrue]) VALUES (2, N'08f97fc5-5731-4912-88fb-cfc6d5b06b81', N'08f97fc5-5731-4912-88fb-cfc6d5b06b81', N'this is my comment', CAST(N'2019-06-17T15:37:47.000' AS DateTime), 3014, NULL, NULL)
INSERT [dbo].[K_Comment] ([Id], [Userid], [FriendId], [comment], [postingdate], [Postid], [readtrue], [unreadtrue]) VALUES (3, N'08f97fc5-5731-4912-88fb-cfc6d5b06b81', N'ea451550-b565-43d6-994c-f2964c3b3b41', N'i can comment on ur profile piyush', CAST(N'2019-06-17T15:38:08.000' AS DateTime), 2020, NULL, NULL)
INSERT [dbo].[K_Comment] ([Id], [Userid], [FriendId], [comment], [postingdate], [Postid], [readtrue], [unreadtrue]) VALUES (4, N'08f97fc5-5731-4912-88fb-cfc6d5b06b81', N'ea451550-b565-43d6-994c-f2964c3b3b41', N'this is stupid', CAST(N'2019-06-18T16:05:24.000' AS DateTime), 2020, NULL, NULL)
INSERT [dbo].[K_Comment] ([Id], [Userid], [FriendId], [comment], [postingdate], [Postid], [readtrue], [unreadtrue]) VALUES (5, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'ea451550-b565-43d6-994c-f2964c3b3b41', N'this is my fresh comment', CAST(N'2019-06-30T16:32:29.000' AS DateTime), 3017, NULL, NULL)
INSERT [dbo].[K_Comment] ([Id], [Userid], [FriendId], [comment], [postingdate], [Postid], [readtrue], [unreadtrue]) VALUES (6, N'78135cfa-31de-4a38-af0a-cac97b141a25', N'ea451550-b565-43d6-994c-f2964c3b3b41', N'this is arpit commented on piyush post', CAST(N'2019-06-30T19:13:17.000' AS DateTime), 3021, 0, 1)
INSERT [dbo].[K_Comment] ([Id], [Userid], [FriendId], [comment], [postingdate], [Postid], [readtrue], [unreadtrue]) VALUES (7, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'78135cfa-31de-4a38-af0a-cac97b141a25', N'this is piyush commenting on arpit', CAST(N'2019-06-30T21:40:34.000' AS DateTime), 3022, 0, 1)
INSERT [dbo].[K_Comment] ([Id], [Userid], [FriendId], [comment], [postingdate], [Postid], [readtrue], [unreadtrue]) VALUES (8, N'0ab69ee4-070d-4560-b82a-324ba357a008', N'78135cfa-31de-4a38-af0a-cac97b141a25', N'this is ashish commenting on arpit', CAST(N'2019-06-30T21:43:19.000' AS DateTime), 3022, 0, 1)
INSERT [dbo].[K_Comment] ([Id], [Userid], [FriendId], [comment], [postingdate], [Postid], [readtrue], [unreadtrue]) VALUES (9, N'78135cfa-31de-4a38-af0a-cac97b141a25', N'ea451550-b565-43d6-994c-f2964c3b3b41', N'it happened to me too', CAST(N'2019-07-01T09:51:50.000' AS DateTime), 3027, 0, 1)
SET IDENTITY_INSERT [dbo].[K_Comment] OFF
SET IDENTITY_INSERT [dbo].[K_Friends] ON 

INSERT [dbo].[K_Friends] ([Id], [Userid], [Friendid], [IsFriend], [AcceptFriend], [Allowcomment]) VALUES (2, N'78135cfa-31de-4a38-af0a-cac97b141a25', N'0ab69ee4-070d-4560-b82a-324ba357a008', 1, 1, 1)
INSERT [dbo].[K_Friends] ([Id], [Userid], [Friendid], [IsFriend], [AcceptFriend], [Allowcomment]) VALUES (3, N'5177949b-459f-4c34-b778-e5aaa137b530', N'0ab69ee4-070d-4560-b82a-324ba357a008', 1, 1, 0)
INSERT [dbo].[K_Friends] ([Id], [Userid], [Friendid], [IsFriend], [AcceptFriend], [Allowcomment]) VALUES (1003, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'5177949b-459f-4c34-b778-e5aaa137b530', 1, NULL, NULL)
INSERT [dbo].[K_Friends] ([Id], [Userid], [Friendid], [IsFriend], [AcceptFriend], [Allowcomment]) VALUES (1005, N'ae842b1b-c9be-46d9-8ce2-2065e06714d4', N'ea451550-b565-43d6-994c-f2964c3b3b41', 1, 1, 1)
INSERT [dbo].[K_Friends] ([Id], [Userid], [Friendid], [IsFriend], [AcceptFriend], [Allowcomment]) VALUES (2005, N'78135cfa-31de-4a38-af0a-cac97b141a25', N'ea451550-b565-43d6-994c-f2964c3b3b41', 1, 1, 1)
INSERT [dbo].[K_Friends] ([Id], [Userid], [Friendid], [IsFriend], [AcceptFriend], [Allowcomment]) VALUES (2006, N'0ab69ee4-070d-4560-b82a-324ba357a008', N'ea451550-b565-43d6-994c-f2964c3b3b41', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[K_Friends] OFF
SET IDENTITY_INSERT [dbo].[K_Likes] ON 

INSERT [dbo].[K_Likes] ([Id], [Postid], [userid], [liked], [smile], [heart]) VALUES (1, 3020, N'0ab69ee4-070d-4560-b82a-324ba357a008', 1, NULL, NULL)
INSERT [dbo].[K_Likes] ([Id], [Postid], [userid], [liked], [smile], [heart]) VALUES (2, 3021, N'ea451550-b565-43d6-994c-f2964c3b3b41', 1, NULL, NULL)
INSERT [dbo].[K_Likes] ([Id], [Postid], [userid], [liked], [smile], [heart]) VALUES (5, 3022, N'ea451550-b565-43d6-994c-f2964c3b3b41', 1, 1, 1)
INSERT [dbo].[K_Likes] ([Id], [Postid], [userid], [liked], [smile], [heart]) VALUES (6, 3022, N'0ab69ee4-070d-4560-b82a-324ba357a008', 1, 1, 1)
INSERT [dbo].[K_Likes] ([Id], [Postid], [userid], [liked], [smile], [heart]) VALUES (7, 3021, N'0ab69ee4-070d-4560-b82a-324ba357a008', NULL, NULL, 1)
INSERT [dbo].[K_Likes] ([Id], [Postid], [userid], [liked], [smile], [heart]) VALUES (8, 3027, N'78135cfa-31de-4a38-af0a-cac97b141a25', 1, NULL, NULL)
INSERT [dbo].[K_Likes] ([Id], [Postid], [userid], [liked], [smile], [heart]) VALUES (9, 3027, N'0ab69ee4-070d-4560-b82a-324ba357a008', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[K_Likes] OFF
SET IDENTITY_INSERT [dbo].[K_User] ON 

INSERT [dbo].[K_User] ([Id], [Username], [EmailId], [Idnew], [Password], [Image]) VALUES (N'ae842b1b-c9be-46d9-8ce2-2065e06714d4', N'justsometing', N'farah.elnashi@gmail.com', 1005, N'As64egjL0yB6dHKwSJMJUA==', NULL)
INSERT [dbo].[K_User] ([Id], [Username], [EmailId], [Idnew], [Password], [Image]) VALUES (N'99dcaf95-dd42-45e2-afb1-243ac27b375d', N'gagan', N'gagan@123.com', 2005, N'js7pw7+r1qjwGkX+P7ccpg==', N'Images/download.png')
INSERT [dbo].[K_User] ([Id], [Username], [EmailId], [Idnew], [Password], [Image]) VALUES (N'0ab69ee4-070d-4560-b82a-324ba357a008', N'Ashish', N'ash@1234.com', 3, N'lz3HXEPbBY03q8iHHx54Vg==', NULL)
INSERT [dbo].[K_User] ([Id], [Username], [EmailId], [Idnew], [Password], [Image]) VALUES (N'0c2eebe2-9fef-4fbb-ac7c-9d8c9b3d68a8', N'Daniel', N'danielrajamanohar@manukaumail.com', 6, N'50wfASV4kVqMy+0vn5BVD+GmUAEjbCZ0PBMtzzrZeWw=', NULL)
INSERT [dbo].[K_User] ([Id], [Username], [EmailId], [Idnew], [Password], [Image]) VALUES (N'78135cfa-31de-4a38-af0a-cac97b141a25', N'arpit', N'ap@123.com', 4, N'WGCNzogefTgg0psx2qmADQ==', NULL)
INSERT [dbo].[K_User] ([Id], [Username], [EmailId], [Idnew], [Password], [Image]) VALUES (N'08f97fc5-5731-4912-88fb-cfc6d5b06b81', N'Admin', N'Admin@1234.com', 1, N'sSXLPCVAKKD2e2Hn+YKZkw==', NULL)
INSERT [dbo].[K_User] ([Id], [Username], [EmailId], [Idnew], [Password], [Image]) VALUES (N'5177949b-459f-4c34-b778-e5aaa137b530', N'amanda', N'amanda@123.com', 5, N'sXFbqb4AvY+272FhgU2bUw==', NULL)
INSERT [dbo].[K_User] ([Id], [Username], [EmailId], [Idnew], [Password], [Image]) VALUES (N'ea451550-b565-43d6-994c-f2964c3b3b41', N'piyush', N'pk@1234.com', 2, N'sXFbqb4AvY+272FhgU2bUw==', NULL)
SET IDENTITY_INSERT [dbo].[K_User] OFF
SET IDENTITY_INSERT [dbo].[K_UserPostData] ON 

INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (1, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'this is first journal', N'PUBLIC', N'Category E', CAST(N'2019-05-12T23:45:24.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (2, N'0ab69ee4-070d-4560-b82a-324ba357a008', N'USER', N'this is ashish journal', N'PUBLIC', N'Category B', CAST(N'2019-05-13T00:17:39.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (3, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'this is my second journal', N'PUBLIC', N'Category B', CAST(N'2019-05-13T00:30:48.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (4, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'kfhptrj;ygljmnhgvsg;lvdmkbklgfmnlmgfvh clgnfm; lm', N'PUBLIC', N'Category C', CAST(N'2019-05-14T13:53:56.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (6, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'<span style="color: rgb(33, 37, 41); font-family: arial, helvetica, sans-serif; font-size: 12px;">The principle purpose of the introduction is to present your position (this is also known as the "thesis" or "argument") on the issue at hand but effective introductory paragraphs are so much more than that. Before you even get to this thesis statement, for example, the essay should begin with a "hook" that grabs the reader’s attention and makes them want to read on. Examples of effective hooks include relevant quotations ("no man is an island") or surprising statistics ("three out of four doctors report that…").</span>', N'PUBLIC', N'', CAST(N'2019-05-15T14:02:11.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (7, N'78135cfa-31de-4a38-af0a-cac97b141a25', N'USER', N'ibbjdbcjbbbbbbbbbbbbbbbbbbbbbbbbbbb chhhhhhbdchbh dhbbe edbhewbf ewbfbwe ewbhdbuwiebd hwebduieuidb hdbisbwed hebduwenudn ewhbduenwiud ejwdniuwenkudn&nbsp;', N'PUBLIC', N'Category C', CAST(N'2019-05-15T14:12:41.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (8, N'78135cfa-31de-4a38-af0a-cac97b141a25', N'USER', N'thi si my arpit post', N'PUBLIC', N'Category C', CAST(N'2019-05-15T14:20:10.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (9, N'78135cfa-31de-4a38-af0a-cac97b141a25', N'USER', N'this is arpits second post.', N'PUBLIC', N'Category D', CAST(N'2019-05-15T14:51:27.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (10, N'0ab69ee4-070d-4560-b82a-324ba357a008', N'USER', N'jkbjd ehfe jehiuw uwehiow uwehiow wehiowe iheiwjepokpW IOWJEIPWJE&nbsp;', N'PUBLIC', N'Category E', CAST(N'2019-05-15T15:11:26.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (11, N'0ab69ee4-070d-4560-b82a-324ba357a008', N'USER', N'this is new journal. please see', N'PUBLIC', N'Category B', CAST(N'2019-05-15T15:15:20.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (12, N'0ab69ee4-070d-4560-b82a-324ba357a008', N'USER', N'this is new new post', N'PUBLIC', N'Category E', CAST(N'2019-05-15T15:17:11.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (13, N'0ab69ee4-070d-4560-b82a-324ba357a008', N'USER', N'fbdfbdfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb', N'PUBLIC', N'Category C', CAST(N'2019-05-15T15:40:01.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (14, N'5177949b-459f-4c34-b778-e5aaa137b530', N'USER', N'this is amandas journal jndfijfs kfnoisidl<div>jioajdifjew</div><div>dfnjsdkgnv</div><div>fnsngldf</div><div>nfisdnginod</div>', N'PUBLIC', N'Category C', CAST(N'2019-05-16T10:41:36.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (15, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'897t8oioipíu khilj;l.', N'PUBLIC', N'Category C', CAST(N'2019-05-16T13:46:31.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (1014, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'ihijokk''lkkk'';'';l'';', N'PUBLIC', N'Category A', CAST(N'2019-05-19T19:23:26.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (1015, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'mbjkbjknnkln', N'PUBLIC', N'Category D', CAST(N'2019-05-19T19:23:46.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (1016, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'<p>.nklk;km</p>
<p>n<strong>klnknlknkl&nbsp;</strong></p>', N'PUBLIC', N'Category A', CAST(N'2019-05-19T21:10:23.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (1017, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'<p><strong>knefkneld</strong></p>
<p>&nbsp;</p>
<p style="text-align: center;">d nlkdkc mldc</p>', N'PUBLIC', N'Category A', CAST(N'2019-05-19T21:11:38.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (1018, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'<p><img title="heart" src="Themes/js/tinymce/plugins/smileys/img/heart.png" /><span style="color: #339966;">jhbhbjbjjkjbjjnnjk&nbsp; &nbsp; nbjkjknjnnn</span></p>', N'PUBLIC', N'Category A', CAST(N'2019-05-20T14:13:24.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (1019, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'<p><span style="font-family: ''trebuchet ms'', geneva, sans-serif; font-size: 14pt; color: #ff6600;">iufiyguiguhh bkjhkjhj</span></p>
<p><span style="font-family: ''trebuchet ms'', geneva, sans-serif; font-size: 14pt; color: #ff6600;">njkbkjbjbnkll</span></p>
<p><span style="font-family: ''trebuchet ms'', geneva, sans-serif; font-size: 14pt; color: #ff6600;"><img title="heart" src="Themes/js/tinymce/plugins/smileys/img/heart.png" /><img title="pacman" src="Themes/js/tinymce/plugins/smileys/img/pacman.png" /></span></p>', N'PUBLIC', N'Category A', CAST(N'2019-05-20T15:30:26.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (1020, N'ae842b1b-c9be-46d9-8ce2-2065e06714d4', N'USER', N'<p><span style="font-size: 18pt;">Hello im writing from MIT this is great<img title="devil" src="Themes/js/tinymce/plugins/smileys/img/devil.png" /></span></p>', N'PUBLIC', N'Category A', CAST(N'2019-05-20T16:16:52.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (2014, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'<p><span style="background-color: #00ffff;">jkbjkbbbbbbbbbbbbbbbbbbbbbbbbbbbn&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;jhjhbnnbb jhhhhhhhhhhh<img title="sunglasses" src="Themes/js/tinymce/plugins/smileys/img/sunglasses.png" /><img title="kiki" src="Themes/js/tinymce/plugins/smileys/img/kiki.png" />hhh&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;jhhhhh</span></p>', N'PRIVATE', N'Category C', CAST(N'2019-05-23T00:31:08.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (2015, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'<p><span style="font-family: ''comic sans ms'', sans-serif;">coll fwiuef efjowe&nbsp;</span></p>
<p><span style="font-family: ''comic sans ms'', sans-serif;">hfuwehfoi</span></p>
<p><span style="font-family: ''comic sans ms'', sans-serif;">fhewohfoe</span></p>
<p><span style="font-family: ''comic sans ms'', sans-serif;">joifewhfhe</span></p>
<p><span style="font-family: ''comic sans ms'', sans-serif;">jifoe <span style="font-size: 18pt;">feiwfioe</span> kefjoie<span style="font-size: 36pt;">&nbsp;<img title="angel" src="Themes/js/tinymce/plugins/smileys/img/angel.png" /><span style="color: #99cc00;"> green color</span></span></span></p>', N'PUBLIC', N'Category D', CAST(N'2019-05-23T00:34:17.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (2016, N'78135cfa-31de-4a38-af0a-cac97b141a25', N'USER', N'<p>jbjkb bkjjk&nbsp;<img title="penguin" src="Themes/js/tinymce/plugins/smileys/img/penguin.gif" /><span style="color: #339966;">hjhvjhhhhhhhhhh</span></p>
<p><span style="color: #339966;">njkbkjjjjjjjjjj<span style="font-size: 18pt;">, bkjjjjjjjjjjjjjjjjjbbbbbbbbbbbbb</span></span></p>', N'PRIVATE', N'Category C', CAST(N'2019-05-27T01:19:36.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (2017, N'78135cfa-31de-4a38-af0a-cac97b141a25', N'USER', N'<p><span style="font-family: ''courier new'', courier, monospace;">kjbj<span style="font-size: 24pt; color: #00ff00;">v<strong>bkhvjk jhbjhbkjb&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; jkbkjbkjbjkbj</strong></span></span></p>', N'PUBLIC', N'Category D', CAST(N'2019-05-27T01:20:26.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (2019, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'<p>klnkjyuyvbk,</p>', N'PUBLIC', N'Category A', CAST(N'2019-06-04T21:59:21.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (2020, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'<p>knonnojijoi noijiojiojji ijoijpokopkp</p>', N'PUBLIC', N'Category A', CAST(N'2019-06-04T22:11:25.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (3014, N'08f97fc5-5731-4912-88fb-cfc6d5b06b81', N'ADMIN', N'<p>this is admin. please see what i have written.</p>', N'PUBLIC', N'Category C', CAST(N'2019-06-17T15:27:40.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (3015, N'08f97fc5-5731-4912-88fb-cfc6d5b06b81', N'ADMIN', N'<p>An&nbsp;<strong>essay</strong>&nbsp;is, generally, a piece of writing that gives the author''s own&nbsp;<a title="Argument" href="https://en.wikipedia.org/wiki/Argument">argument</a>&nbsp;&mdash; but the definition is vague, overlapping with those of a&nbsp;<a title="Term paper" href="https://en.wikipedia.org/wiki/Term_paper">paper</a>, an&nbsp;<a title="Article (publishing)" href="https://en.wikipedia.org/wiki/Article_(publishing)">article</a>, a&nbsp;<a title="Pamphlet" href="https://en.wikipedia.org/wiki/Pamphlet">pamphlet</a>, and a&nbsp;<a title="Short story" href="https://en.wikipedia.org/wiki/Short_story">short story</a>. Essays have traditionally been sub-classified as formal and informal. Formal essays are characterized by "serious purpose, dignity, logical organization, length," whereas the informal essay is characterized by "the personal element (self-revelation, individual tastes and experiences, confidential manner), humor, graceful style, rambling structure, unconventionality or novelty of theme," etc.<sup id="cite_ref-1" class="reference"><a href="https://en.wikipedia.org/wiki/Essay#cite_note-1">[1]</a></sup></p>
<p>Essays are commonly used as&nbsp;<a title="Literary criticism" href="https://en.wikipedia.org/wiki/Literary_criticism">literary criticism</a>, political&nbsp;<a class="mw-redirect" title="Manifestos" href="https://en.wikipedia.org/wiki/Manifestos">manifestos</a>, learned&nbsp;<a class="mw-redirect" title="Arguments" href="https://en.wikipedia.org/wiki/Arguments">arguments</a>, observations of daily life, recollections, and reflections of the author. Almost all modern essays are written in&nbsp;<a title="Prose" href="https://en.wikipedia.org/wiki/Prose">prose</a>, but works in&nbsp;<a title="Poetry" href="https://en.wikipedia.org/wiki/Poetry">verse</a>&nbsp;have been dubbed essays (e.g.,&nbsp;<a title="Alexander Pope" href="https://en.wikipedia.org/wiki/Alexander_Pope">Alexander Pope</a>''s&nbsp;<em><a title="An Essay on Criticism" href="https://en.wikipedia.org/wiki/An_Essay_on_Criticism">An Essay on Criticism</a></em>&nbsp;and&nbsp;<em><a title="An Essay on Man" href="https://en.wikipedia.org/wiki/An_Essay_on_Man">An Essay on Man</a></em>). While brevity usually defines an essay, voluminous works like&nbsp;<a title="John Locke" href="https://en.wikipedia.org/wiki/John_Locke">John Locke</a>''s&nbsp;<em><a title="An Essay Concerning Human Understanding" href="https://en.wikipedia.org/wiki/An_Essay_Concerning_Human_Understanding">An Essay Concerning Human Understanding</a></em>&nbsp;and&nbsp;<a class="mw-redirect" title="Thomas Malthus" href="https://en.wikipedia.org/wiki/Thomas_Malthus">Thomas Malthus</a>''s&nbsp;<em><a title="An Essay on the Principle of Population" href="https://en.wikipedia.org/wiki/An_Essay_on_the_Principle_of_Population">An Essay on the Principle of Population</a></em>&nbsp;are counterexamples.</p>
<p>In some countries (e.g., the United States and Canada), essays have become a major part of formal&nbsp;<a title="Education" href="https://en.wikipedia.org/wiki/Education">education</a>. Secondary students are taught structured essay formats to improve their writing skills;&nbsp;<a class="mw-redirect" title="Admissions essay" href="https://en.wikipedia.org/wiki/Admissions_essay">admission essays</a>&nbsp;are often used by&nbsp;<a title="University" href="https://en.wikipedia.org/wiki/University">universities</a>&nbsp;in selecting applicants, and in the humanities and social sciences essays are often used as a way of assessing the performance of students during final exams.</p>
<p>The concept of an "essay" has been extended to other media beyond writing. A&nbsp;<a title="Essay" href="https://en.wikipedia.org/wiki/Essay#Film">film essay</a>&nbsp;is a movie that often incorporates documentary filmmaking styles and focuses more on the evolution of a theme or idea. A&nbsp;<a class="mw-redirect" title="Photo essay" href="https://en.wikipedia.org/wiki/Photo_essay">photographic essay</a>&nbsp;covers a topic with a linked series of&nbsp;<a class="mw-redirect" title="Photographs" href="https://en.wikipedia.org/wiki/Photographs">photographs</a>&nbsp;that may have accompanying text or&nbsp;<a title="Photo caption" href="https://en.wikipedia.org/wiki/Photo_caption">captions</a>.</p>
<p>An essay has been defined in a variety of ways. One definition is a "prose composition with a focused subject of discussion" or a "long, systematic discourse".<sup id="cite_ref-2" class="reference"><a href="https://en.wikipedia.org/wiki/Essay#cite_note-2">[2]</a></sup>&nbsp;It is difficult to define the genre into which essays fall.&nbsp;<a title="Aldous Huxley" href="https://en.wikipedia.org/wiki/Aldous_Huxley">Aldous Huxley</a>, a leading essayist, gives guidance on the subject.<sup id="cite_ref-3" class="reference"><a href="https://en.wikipedia.org/wiki/Essay#cite_note-3">[3]</a></sup>&nbsp;He notes that "the essay is a literary device for saying almost everything about almost anything", and adds that "by tradition, almost by definition, the essay is a short piece". Furthermore, Huxley argues that "essays belong to a literary species whose extreme variability can be studied most effectively within a three-poled frame of reference". These three poles (or worlds in which the essay may exist) are:</p>
<ul>
<li>The personal and the autobiographical: The essayists that feel most comfortable in this pole "write fragments of reflective autobiography and look at the world through the keyhole of anecdote and description".</li>
<li>The objective, the factual, and the concrete particular: The essayists that write from this pole "do not speak directly of themselves, but turn their attention outward to some literary or scientific or political theme. Their art consists of setting forth, passing judgment upon, and drawing general conclusions from the relevant data".</li>
<li>The abstract-universal: In this pole "we find those essayists who do their work in the world of high abstractions", who are never personal and who seldom mention the particular facts of experience.</li>
</ul>
<p>Huxley adds that the most satisfying essays "...make the best not of one, not of two, but of all the three worlds in which it is possible for the essay to exist."</p>
<p>The word&nbsp;<em>essay</em>&nbsp;derives from the French infinitive&nbsp;<em>essayer</em>, "to try" or "to attempt". In English&nbsp;<em>essay</em>&nbsp;first meant "a trial" or "an attempt", and this is still an alternative meaning. The Frenchman&nbsp;<a title="Michel de Montaigne" href="https://en.wikipedia.org/wiki/Michel_de_Montaigne">Michel de Montaigne</a>&nbsp;(1533&ndash;1592) was the first author to describe his work as essays; he used the term to characterize these as "attempts" to put his thoughts into writing, and his essays grew out of his&nbsp;<a class="mw-redirect" title="Commonplacing" href="https://en.wikipedia.org/wiki/Commonplacing">commonplacing</a>.<sup id="cite_ref-4" class="reference"><a href="https://en.wikipedia.org/wiki/Essay#cite_note-4">[4]</a></sup>&nbsp;Inspired in particular by the works of&nbsp;<a title="Plutarch" href="https://en.wikipedia.org/wiki/Plutarch">Plutarch</a>, a translation of whose&nbsp;<em>&OElig;uvres Morales</em>&nbsp;(<em>Moral works</em>) into French had just been published by&nbsp;<a title="Jacques Amyot" href="https://en.wikipedia.org/wiki/Jacques_Amyot">Jacques Amyot</a>, Montaigne began to compose his essays in 1572; the first edition, entitled&nbsp;<em><a title="Essays (Montaigne)" href="https://en.wikipedia.org/wiki/Essays_(Montaigne)">Essais</a></em>, was published in two volumes in 1580. For the rest of his life, he continued revising previously published essays and composing new ones.&nbsp;<a title="Francis Bacon" href="https://en.wikipedia.org/wiki/Francis_Bacon">Francis Bacon</a>''s&nbsp;<a title="Essays (Francis Bacon)" href="https://en.wikipedia.org/wiki/Essays_(Francis_Bacon)">essays</a>, published in book form in 1597, 1612, and 1625, were the first works in English that described themselves as&nbsp;<em>essays</em>.&nbsp;<a title="Ben Jonson" href="https://en.wikipedia.org/wiki/Ben_Jonson">Ben Jonson</a>&nbsp;first used the word&nbsp;<em>essayist</em>&nbsp;in English in 1609, according to the&nbsp;<em><a title="Oxford English Dictionary" href="https://en.wikipedia.org/wiki/Oxford_English_Dictionary">Oxford English Dictionary</a></em>.</p>', N'PUBLIC', N'Category A', CAST(N'2019-06-17T15:39:34.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (3016, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'<p><span style="font-family: ''comic sans ms'', sans-serif; font-size: 18pt; color: #ff0000;">this is beautiful<img title="heart" src="Themes/js/tinymce/plugins/smileys/img/heart.png" /></span></p>', N'PUBLIC', N'Category A', CAST(N'2019-06-25T12:51:05.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (3017, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'<p><span style="font-family: ''comic sans ms'', sans-serif;">WO WHAT an amazing night it is. I am feeling like vomiting. i want to suicide.</span></p>', N'PUBLIC', N'Category C', CAST(N'2019-06-28T18:44:04.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (3018, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'<p>i am feeling very sad. i want to suicide.</p>', N'PUBLIC', N'Category A', CAST(N'2019-06-28T18:45:41.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (3019, N'0ab69ee4-070d-4560-b82a-324ba357a008', N'USER', N'<p>this is my new post. I am feeling very sad. I want to do suicide.</p>', N'PUBLIC', N'Category A', CAST(N'2019-06-28T18:56:17.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (3020, N'0ab69ee4-070d-4560-b82a-324ba357a008', N'USER', N'<p>i am feeling sad. i want to kill my self.</p>', N'PUBLIC', N'Category A', CAST(N'2019-06-28T18:58:52.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (3021, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'<p><span style="font-family: ''courier new'', courier, monospace;">Friendship is a faithful and loyal relationship between two or more person living anywhere in the world. We cannot leave our whole life alone and need a faithful relationship to someone to live happily called friends. Friends have intimate relationship and ca trust to each other forever. It is not limited to the age, sex and position of the person means friendship can be between men and women, men and men, women and women or human to animals of any age group. However, generally it grows between the persons of the same age without the limitation of sex and position. Friendship can develop between persons having similar or different passions, emotions or sentiments.<img title="heart" src="Themes/js/tinymce/plugins/smileys/img/heart.png" /></span></p>', N'PUBLIC', N'Friendship', CAST(N'2019-06-30T15:12:54.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (3022, N'78135cfa-31de-4a38-af0a-cac97b141a25', N'USER', N'<p>this is arpit writin aout love</p>', N'PUBLIC', N'Love', CAST(N'2019-06-30T16:38:22.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (3023, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'<p>tthis is arpit. i want to kill piyush<img title="devil" src="Themes/js/tinymce/plugins/smileys/img/devil.png" /></p>', N'PUBLIC', N'Love', CAST(N'2019-06-30T22:12:40.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (3024, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'<p>self harm</p>', N'PUBLIC', N'Love', CAST(N'2019-07-01T02:29:59.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (3025, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'<p>overdose</p>', N'PUBLIC', N'Love', CAST(N'2019-07-01T02:30:21.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (3026, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'<p>Overdose</p>', N'PUBLIC', N'Love', CAST(N'2019-07-01T02:30:51.000' AS DateTime))
INSERT [dbo].[K_UserPostData] ([Id], [Userid], [Role], [Post], [Authorize], [Category], [PostingDate]) VALUES (3027, N'ea451550-b565-43d6-994c-f2964c3b3b41', N'USER', N'<p>There was a miscommunication soo i was not able to implement the desired functionalities however i was given a chance to present it on tuesday.<img title="devil" src="Themes/js/tinymce/plugins/smileys/img/devil.png" /></p>', N'PUBLIC', N'Experience', CAST(N'2019-07-01T09:50:59.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[K_UserPostData] OFF
SET IDENTITY_INSERT [dbo].[K_UserRoles] ON 

INSERT [dbo].[K_UserRoles] ([Id], [Name], [Role], [Uid]) VALUES (3, N'Admin', N'ADMIN', N'08f97fc5-5731-4912-88fb-cfc6d5b06b81')
INSERT [dbo].[K_UserRoles] ([Id], [Name], [Role], [Uid]) VALUES (4, N'piyush', N'USER', N'ea451550-b565-43d6-994c-f2964c3b3b41')
INSERT [dbo].[K_UserRoles] ([Id], [Name], [Role], [Uid]) VALUES (5, N'Ashish', N'USER', N'0ab69ee4-070d-4560-b82a-324ba357a008')
INSERT [dbo].[K_UserRoles] ([Id], [Name], [Role], [Uid]) VALUES (6, N'arpit', N'USER', N'78135cfa-31de-4a38-af0a-cac97b141a25')
INSERT [dbo].[K_UserRoles] ([Id], [Name], [Role], [Uid]) VALUES (7, N'amanda', N'USER', N'5177949b-459f-4c34-b778-e5aaa137b530')
INSERT [dbo].[K_UserRoles] ([Id], [Name], [Role], [Uid]) VALUES (8, N'Daniel', N'USER', N'0c2eebe2-9fef-4fbb-ac7c-9d8c9b3d68a8')
INSERT [dbo].[K_UserRoles] ([Id], [Name], [Role], [Uid]) VALUES (1007, N'justsometing', N'USER', N'ae842b1b-c9be-46d9-8ce2-2065e06714d4')
INSERT [dbo].[K_UserRoles] ([Id], [Name], [Role], [Uid]) VALUES (2007, N'gagan', N'USER', N'99dcaf95-dd42-45e2-afb1-243ac27b375d')
SET IDENTITY_INSERT [dbo].[K_UserRoles] OFF
USE [master]
GO
ALTER DATABASE [kindred] SET  READ_WRITE 
GO

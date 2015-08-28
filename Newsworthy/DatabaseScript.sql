
USE [Newsworthy]
GO
/****** Object:  Table [dbo].[Criteria]    Script Date: 05/14/2014 19:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Descript] [nvarchar](max) NULL,
	[Weight] [float] NULL,
 CONSTRAINT [PK_Criteria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 05/14/2014 19:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](200) NULL,
	[FirstName] [nvarchar](200) NULL,
	[MiddleName] [nvarchar](200) NULL,
	[Rating] [float] NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 05/14/2014 19:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_Publishers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 05/14/2014 19:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[EnteredDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Ratings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sources]    Script Date: 05/14/2014 19:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](300) NULL,
 CONSTRAINT [PK_Sources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RatingValues]    Script Date: 05/14/2014 19:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RatingValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RatingId] [int] NOT NULL,
	[CriteriaId] [int] NOT NULL,
	[Value] [int] NOT NULL,
 CONSTRAINT [PK_RatingValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RatingRatings]    Script Date: 05/14/2014 19:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RatingRatings](
	[FromRatingId] [int] NOT NULL,
	[ToRatingId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PublisherDomains]    Script Date: 05/14/2014 19:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PublisherDomains](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PublisherId] [int] NOT NULL,
	[URL] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_PublisherDomains] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 05/14/2014 19:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PublisherId] [int] NOT NULL,
	[PublishedDate] [datetime] NOT NULL,
	[Title] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_Aricles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleURLs]    Script Date: 05/14/2014 19:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleURLs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NOT NULL,
	[URL] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ArticleURLs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleSources]    Script Date: 05/14/2014 19:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleSources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NOT NULL,
	[SourceId] [int] NOT NULL,
 CONSTRAINT [PK_ArticleSources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleRatings]    Script Date: 05/14/2014 19:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleRatings](
	[ArticleId] [int] NOT NULL,
	[RatingId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_RatingValues_CriteriaId]    Script Date: 05/14/2014 19:10:56 ******/
ALTER TABLE [dbo].[RatingValues]  WITH CHECK ADD  CONSTRAINT [FK_RatingValues_CriteriaId] FOREIGN KEY([CriteriaId])
REFERENCES [dbo].[Criteria] ([Id])
GO
ALTER TABLE [dbo].[RatingValues] CHECK CONSTRAINT [FK_RatingValues_CriteriaId]
GO
/****** Object:  ForeignKey [FK_RatingValues_RatingId]    Script Date: 05/14/2014 19:10:56 ******/
ALTER TABLE [dbo].[RatingValues]  WITH CHECK ADD  CONSTRAINT [FK_RatingValues_RatingId] FOREIGN KEY([RatingId])
REFERENCES [dbo].[Ratings] ([Id])
GO
ALTER TABLE [dbo].[RatingValues] CHECK CONSTRAINT [FK_RatingValues_RatingId]
GO
/****** Object:  ForeignKey [FK_RatingRatings_FromRatingId]    Script Date: 05/14/2014 19:10:56 ******/
ALTER TABLE [dbo].[RatingRatings]  WITH CHECK ADD  CONSTRAINT [FK_RatingRatings_FromRatingId] FOREIGN KEY([FromRatingId])
REFERENCES [dbo].[Ratings] ([Id])
GO
ALTER TABLE [dbo].[RatingRatings] CHECK CONSTRAINT [FK_RatingRatings_FromRatingId]
GO
/****** Object:  ForeignKey [FK_RatingRatings_ToRatingId]    Script Date: 05/14/2014 19:10:56 ******/
ALTER TABLE [dbo].[RatingRatings]  WITH CHECK ADD  CONSTRAINT [FK_RatingRatings_ToRatingId] FOREIGN KEY([ToRatingId])
REFERENCES [dbo].[Ratings] ([Id])
GO
ALTER TABLE [dbo].[RatingRatings] CHECK CONSTRAINT [FK_RatingRatings_ToRatingId]
GO
/****** Object:  ForeignKey [FK_PublisherDomains_PublisherId]    Script Date: 05/14/2014 19:10:56 ******/
ALTER TABLE [dbo].[PublisherDomains]  WITH CHECK ADD  CONSTRAINT [FK_PublisherDomains_PublisherId] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publishers] ([Id])
GO
ALTER TABLE [dbo].[PublisherDomains] CHECK CONSTRAINT [FK_PublisherDomains_PublisherId]
GO
/****** Object:  ForeignKey [FK_Articles_PublisherId]    Script Date: 05/14/2014 19:10:56 ******/
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_PublisherId] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publishers] ([Id])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_PublisherId]
GO
/****** Object:  ForeignKey [FK_ArticleURLs_ArticleId]    Script Date: 05/14/2014 19:10:56 ******/
ALTER TABLE [dbo].[ArticleURLs]  WITH CHECK ADD  CONSTRAINT [FK_ArticleURLs_ArticleId] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Articles] ([Id])
GO
ALTER TABLE [dbo].[ArticleURLs] CHECK CONSTRAINT [FK_ArticleURLs_ArticleId]
GO
/****** Object:  ForeignKey [FK_ArticleSources_ArticleId]    Script Date: 05/14/2014 19:10:56 ******/
ALTER TABLE [dbo].[ArticleSources]  WITH CHECK ADD  CONSTRAINT [FK_ArticleSources_ArticleId] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Articles] ([Id])
GO
ALTER TABLE [dbo].[ArticleSources] CHECK CONSTRAINT [FK_ArticleSources_ArticleId]
GO
/****** Object:  ForeignKey [FK_ArticleSources_SourceId]    Script Date: 05/14/2014 19:10:56 ******/
ALTER TABLE [dbo].[ArticleSources]  WITH CHECK ADD  CONSTRAINT [FK_ArticleSources_SourceId] FOREIGN KEY([SourceId])
REFERENCES [dbo].[Sources] ([Id])
GO
ALTER TABLE [dbo].[ArticleSources] CHECK CONSTRAINT [FK_ArticleSources_SourceId]
GO
/****** Object:  ForeignKey [FK_ArticleRatings_ArticleId]    Script Date: 05/14/2014 19:10:56 ******/
ALTER TABLE [dbo].[ArticleRatings]  WITH CHECK ADD  CONSTRAINT [FK_ArticleRatings_ArticleId] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Articles] ([Id])
GO
ALTER TABLE [dbo].[ArticleRatings] CHECK CONSTRAINT [FK_ArticleRatings_ArticleId]
GO
/****** Object:  ForeignKey [FK_ArticleRatings_RatingId]    Script Date: 05/14/2014 19:10:56 ******/
ALTER TABLE [dbo].[ArticleRatings]  WITH CHECK ADD  CONSTRAINT [FK_ArticleRatings_RatingId] FOREIGN KEY([RatingId])
REFERENCES [dbo].[Ratings] ([Id])
GO
ALTER TABLE [dbo].[ArticleRatings] CHECK CONSTRAINT [FK_ArticleRatings_RatingId]
GO

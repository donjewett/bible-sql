/***************************************************************************
* Bible Database: SQL Server
* https://github.com/donjewett/bible-sql
*
* bible-010-schema.sql
*
* Version: 2024.8.22
* 
* Script License: CC BY 4.0 - https://creativecommons.org/licenses/by/4.0/
*
***************************************************************************/

----------------------------------------------------------------------------
-- Languages
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Languages')
CREATE TABLE [Languages](
	[Id] [varchar](3) NOT NULL,
	[Name] [varchar](16) NOT NULL,
	[HtmlCode] [char](2) NOT NULL,
	[IsAncient] [bit] NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED ([Id] ASC),
)
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Languages' AND COLUMN_NAME = 'IsAncient' AND Column_Default IS NOT NULL)
ALTER TABLE [Languages] ADD CONSTRAINT [DF_Languages_IsAncient] DEFAULT ((0)) FOR [IsAncient]


----------------------------------------------------------------------------
-- Canons
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Canons')
CREATE TABLE [Canons](
	[Id] [int] NOT NULL,
	[Code] [varchar](3) NOT NULL,
	[Name] [varchar](24) NOT NULL,
	[LanguageId] [varchar](3) NOT NULL,
 CONSTRAINT [PK_Canons] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Canons' AND CONSTRAINT_NAME = 'FK_Canons_Languages')
BEGIN
	ALTER TABLE [Canons] WITH CHECK ADD CONSTRAINT [FK_Canons_Languages] FOREIGN KEY([LanguageId]) REFERENCES [Languages] ([Id])
	ALTER TABLE [Canons] CHECK CONSTRAINT [FK_Canons_Languages]
END


----------------------------------------------------------------------------
-- Sections
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Sections')
CREATE TABLE [Sections](
	[Id] [int] NOT NULL,
	[Name] [varchar](16) NOT NULL,
	[CanonId] [int] NOT NULL,
 CONSTRAINT [PK_Sections] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Sections' AND CONSTRAINT_NAME = 'FK_Sections_Canons')
BEGIN
	ALTER TABLE [Sections] WITH CHECK ADD CONSTRAINT [FK_Sections_Canons] FOREIGN KEY([CanonId]) REFERENCES [Canons] ([Id])
	ALTER TABLE [Sections] CHECK CONSTRAINT [FK_Sections_Canons]
END


----------------------------------------------------------------------------
-- Books
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Books')
CREATE TABLE [Books](
	[Id] [int] NOT NULL,
	[Code] [varchar](5) NOT NULL,
	[Abbrev] [varchar](5) NOT NULL,
	[Name] [varchar](16) NOT NULL,
	[Book] [tinyint] NOT NULL,
	[CanonId] [int] NOT NULL, -- denormalized
	[SectionId] [int] NOT NULL,
	[IsSectionEnd] bit NOT NULL,
	[ChapterCount] [tinyint] NOT NULL,
	[OsisCode] [varchar](6) NOT NULL,
	[Paratext] [varchar](3) NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Books' AND CONSTRAINT_NAME = 'FK_Books_Canons')
BEGIN
	ALTER TABLE [Books] WITH CHECK ADD CONSTRAINT [FK_Books_Canons] FOREIGN KEY([CanonId]) REFERENCES [Canons] ([Id])
	ALTER TABLE [Books] CHECK CONSTRAINT [FK_Books_Canons]
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Books' AND CONSTRAINT_NAME = 'FK_Books_Sections')
BEGIN
	ALTER TABLE [Books] WITH CHECK ADD CONSTRAINT [FK_Books_Sections] FOREIGN KEY([SectionId]) REFERENCES [Sections] ([Id])
	ALTER TABLE [Books] CHECK CONSTRAINT [FK_Books_Sections]
END


----------------------------------------------------------------------------
-- BookNames
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'BookNames')
CREATE TABLE [BookNames](
	[Name] [varchar](64) NOT NULL,
	[BookId] [int] NOT NULL,
 CONSTRAINT [PK_BookNames] PRIMARY KEY CLUSTERED ([Name] ASC)
)
GO


----------------------------------------------------------------------------
-- Chapters
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Chapters')
CREATE TABLE [Chapters](
	[Id] [int] NOT NULL,
	[Code] [varchar](7) NOT NULL,
	[Reference] [varchar](8) NOT NULL,
	[Chapter] [tinyint] NOT NULL,
	[BookId] [int] NOT NULL,
	[IsBookEnd] bit NOT NULL,
	[VerseCount] [int] NOT NULL,
 CONSTRAINT [PK_Chapters] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Chapters' AND CONSTRAINT_NAME = 'FK_Chapters_Books')
BEGIN
	ALTER TABLE [Chapters] WITH CHECK ADD CONSTRAINT [FK_Chapters_Books] FOREIGN KEY([BookId]) REFERENCES [Books] ([Id])
	ALTER TABLE [Chapters] CHECK CONSTRAINT [FK_Chapters_Books]
END


----------------------------------------------------------------------------
-- Verses
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Verses')
CREATE TABLE [Verses](
	[Id] [int] NOT NULL,
	[Code] [varchar](16) NOT NULL,
	[OsisCode] [varchar](12) NOT NULL,
	[Reference] [varchar](10) NOT NULL,
	[CanonId] [int] NOT NULL, --denormalized
	[SectionId] [int] NOT NULL, --denormalized
	[BookId] [int] NOT NULL, --denormalized
	[ChapterId] [int] NOT NULL,
	[IsChapterEnd] bit NOT NULL,
	[Book] [tinyint] NOT NULL, --denormalized
	[Chapter] [tinyint] NOT NULL, --denormalized
	[Verse] [tinyint] NOT NULL,
 CONSTRAINT [PK_Verses] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Verses' AND CONSTRAINT_NAME = 'FK_Verses_Books')
BEGIN
	ALTER TABLE [Verses] WITH CHECK ADD CONSTRAINT [FK_Verses_Books] FOREIGN KEY([BookId]) REFERENCES [Books] ([Id])
	ALTER TABLE [Verses] CHECK CONSTRAINT [FK_Verses_Books]
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Verses' AND CONSTRAINT_NAME = 'FK_Verses_Chapters')
BEGIN
	ALTER TABLE [Verses] WITH CHECK ADD CONSTRAINT [FK_Verses_Chapters] FOREIGN KEY([ChapterId]) REFERENCES [Chapters] ([Id])
	ALTER TABLE [Verses] CHECK CONSTRAINT [FK_Verses_Chapters]
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Verses' AND CONSTRAINT_NAME = 'FK_Verses_Canons')
BEGIN
	ALTER TABLE [Verses] WITH CHECK ADD CONSTRAINT [FK_Verses_Canons] FOREIGN KEY([CanonId]) REFERENCES [Canons] ([Id])
	ALTER TABLE [Verses] CHECK CONSTRAINT [FK_Verses_Canons]
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Verses' AND CONSTRAINT_NAME = 'FK_Verses_Sections')
BEGIN
	ALTER TABLE [Verses] WITH CHECK ADD CONSTRAINT [FK_Verses_Sections] FOREIGN KEY([SectionId]) REFERENCES [Sections] ([Id])
	ALTER TABLE [Verses] CHECK CONSTRAINT [FK_Verses_Sections]
END


----------------------------------------------------------------------------
-- GreekTextForms
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'GreekTextForms')
CREATE TABLE [GreekTextForms](
	[Id] [varchar](3) NOT NULL,
	[Name] [varchar](48) NOT NULL,
	[ParentId] [varchar](3) NULL,
 CONSTRAINT [PK_GreekTextForms] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'GreekTextForms' AND CONSTRAINT_NAME = 'FK_GreekTextForms_GreekTextForms')
BEGIN
	ALTER TABLE [GreekTextForms] WITH CHECK ADD CONSTRAINT [FK_GreekTextForms_GreekTextForms] FOREIGN KEY([ParentId]) REFERENCES [GreekTextForms] ([Id])
	ALTER TABLE [GreekTextForms] CHECK CONSTRAINT [FK_GreekTextForms_GreekTextForms]
END


----------------------------------------------------------------------------
-- HebrewTextForms
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'HebrewTextForms')
CREATE TABLE [HebrewTextForms](
	[Id] [varchar](3) NOT NULL,
	[Name] [varchar](48) NOT NULL,
	[ParentId] [varchar](3) NULL,
 CONSTRAINT [PK_HebrewTextForms] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'HebrewTextForms' AND CONSTRAINT_NAME = 'FK_HebrewTextForms_HebrewTextForms')
BEGIN
	ALTER TABLE [HebrewTextForms] WITH CHECK ADD CONSTRAINT [FK_HebrewTextForms_HebrewTextForms] FOREIGN KEY([ParentId]) REFERENCES [HebrewTextForms] ([Id])
	ALTER TABLE [HebrewTextForms] CHECK CONSTRAINT [FK_HebrewTextForms_HebrewTextForms]
END


----------------------------------------------------------------------------
-- LicensePermissions
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'LicensePermissions')
CREATE TABLE [LicensePermissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](48) NOT NULL,
	[Permissiveness] [int] NOT NULL,
 CONSTRAINT [PK_LicensePermissions] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO


----------------------------------------------------------------------------
-- LicenseTypes
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'LicenseTypes')
CREATE TABLE [LicenseTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](64) NOT NULL,
	[IsFree] [bit] NOT NULL,
	[PermissionId] [int] NULL,
 CONSTRAINT [PK_LicenseType] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'LicenseTypes' AND CONSTRAINT_NAME = 'FK_LicenseTypes_LicensePermissions')
BEGIN
	ALTER TABLE [LicenseTypes] WITH CHECK ADD CONSTRAINT [FK_LicenseTypes_LicensePermissions] FOREIGN KEY([PermissionId]) REFERENCES [LicensePermissions] ([Id])
	ALTER TABLE [LicenseTypes] CHECK CONSTRAINT [FK_LicenseTypes_LicensePermissions]
END


----------------------------------------------------------------------------
-- Versions
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Versions')
CREATE TABLE [Versions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](16) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Subtitle] [nvarchar](128) NULL,
	[LanguageId] [varchar](3) NOT NULL,
	[YearPublished] [smallint] NOT NULL,
	[HebrewFormId] [varchar](3) NULL,
	[GreekFormId] [varchar](3) NULL,
	[ParentId] [int] NULL,
	[LicenseTypeId] [int] NULL,
	[ReadingLevel] [decimal](4, 2) NULL,
 CONSTRAINT [PK_Versions] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Versions' AND CONSTRAINT_NAME = 'FK_Versions_Languages')
BEGIN
	ALTER TABLE [Versions] WITH CHECK ADD CONSTRAINT [FK_Versions_Languages] FOREIGN KEY([LanguageId]) REFERENCES [Languages] ([Id])
	ALTER TABLE [Versions] CHECK CONSTRAINT [FK_Versions_Languages]
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Versions' AND CONSTRAINT_NAME = 'FK_Versions_Versions')
BEGIN
	ALTER TABLE [Versions] WITH CHECK ADD CONSTRAINT [FK_Versions_Versions] FOREIGN KEY([ParentId]) REFERENCES [Versions] ([Id])
	ALTER TABLE [Versions] CHECK CONSTRAINT [FK_Versions_Versions]
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Versions' AND CONSTRAINT_NAME = 'FK_Version_TextForm_Greek')
BEGIN
	ALTER TABLE [Versions] WITH CHECK ADD CONSTRAINT [FK_Version_TextForm_Greek] FOREIGN KEY([GreekFormId]) REFERENCES [GreekTextForms] ([Id])
	ALTER TABLE [Versions] CHECK CONSTRAINT [FK_Version_TextForm_Greek]
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Versions' AND CONSTRAINT_NAME = 'FK_Version_TextForm_Hebrew')
BEGIN
	ALTER TABLE [Versions] WITH CHECK ADD CONSTRAINT [FK_Version_TextForm_Hebrew] FOREIGN KEY([HebrewFormId]) REFERENCES [HebrewTextForms] ([Id])
	ALTER TABLE [Versions] CHECK CONSTRAINT [FK_Version_TextForm_Hebrew]
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Versions' AND CONSTRAINT_NAME = 'FK_Versions_LicenseTypes')
BEGIN
	ALTER TABLE [Versions] WITH CHECK ADD CONSTRAINT [FK_Versions_LicenseTypes] FOREIGN KEY([LicenseTypeId]) REFERENCES [LicenseTypes] ([Id])
	ALTER TABLE [Versions] CHECK CONSTRAINT [FK_Versions_LicenseTypes]
END


----------------------------------------------------------------------------
-- Editions
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Editions')
CREATE TABLE [Editions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](16) NOT NULL,
	[VersionId] [int] NOT NULL,
	[YearPublished] [smallint] NOT NULL,
	[Subtitle] [nvarchar](128) NULL,
 CONSTRAINT [PK_Editions] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Editions' AND CONSTRAINT_NAME = 'FK_Editions_Versions')
BEGIN
	ALTER TABLE [Editions] WITH CHECK ADD CONSTRAINT [FK_Editions_Versions] FOREIGN KEY([VersionId]) REFERENCES [Versions] ([Id])
	ALTER TABLE [Editions] CHECK CONSTRAINT [FK_Editions_Versions]
END


----------------------------------------------------------------------------
-- Sites
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Sites')
CREATE TABLE [Sites](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](64) NOT NULL,
	[Url] [varchar](255) NULL,
 CONSTRAINT [PK_Sites] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO


----------------------------------------------------------------------------
-- ResourceTypes
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ResourceTypes')
CREATE TABLE [ResourceTypes](
	[Id] [varchar](8) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_ResourceTypes] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO


----------------------------------------------------------------------------
-- Resources
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Resources')
CREATE TABLE [Resources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceTypeId] [varchar](8) NOT NULL,
	[VersionId] [int] NOT NULL,
	[EditionId] [int] NULL,
	[Url] [varchar](255) NULL,
	[IsOfficial] [bit] NOT NULL,
	[SiteId] [int] NULL,
 CONSTRAINT [PK_Resources] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Resources' AND COLUMN_NAME = 'IsOfficial' AND Column_Default IS NOT NULL)
ALTER TABLE [Resources] ADD CONSTRAINT [DF_Resources_IsOfficial] DEFAULT ((0)) FOR [IsOfficial]

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Resources' AND CONSTRAINT_NAME = 'FK_Resources_ResourceTypes')
BEGIN
	ALTER TABLE [Resources] WITH CHECK ADD CONSTRAINT [FK_Resources_ResourceTypes] FOREIGN KEY([ResourceTypeId]) REFERENCES [ResourceTypes] ([Id])
	ALTER TABLE [Resources] CHECK CONSTRAINT [FK_Resources_ResourceTypes]
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Resources' AND CONSTRAINT_NAME = 'FK_Resources_Editions')
BEGIN
	ALTER TABLE [Resources] WITH CHECK ADD CONSTRAINT [FK_Resources_Editions] FOREIGN KEY([EditionId]) REFERENCES [Editions] ([Id])
	ALTER TABLE [Resources] CHECK CONSTRAINT [FK_Resources_Editions]
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Resources' AND CONSTRAINT_NAME = 'FK_Resources_Versions')
BEGIN
	ALTER TABLE [Resources] WITH CHECK ADD CONSTRAINT [FK_Resources_Versions] FOREIGN KEY([VersionId]) REFERENCES [Versions] ([Id])
	ALTER TABLE [Resources] CHECK CONSTRAINT [FK_Resources_Versions]
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Resources' AND CONSTRAINT_NAME = 'FK_Resources_Sites')
BEGIN
	ALTER TABLE [Resources] WITH CHECK ADD CONSTRAINT [FK_Resources_Sites] FOREIGN KEY([SiteId]) REFERENCES [Sites] ([Id])
	ALTER TABLE [Resources] CHECK CONSTRAINT [FK_Resources_Sites]
END


----------------------------------------------------------------------------
-- Bibles
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Bibles')
CREATE TABLE [Bibles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](16) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Subtitle] [nvarchar](128) NULL,
	[VersionId] [int] NOT NULL,
	[EditionId] [int] NULL,
	[YearPublished] [smallint] NULL,
	[TextFormat] [varchar](6) NOT NULL,
 CONSTRAINT [PK_Bibles] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Bibles' AND CONSTRAINT_NAME = 'FK_Bibles_Versions')
BEGIN
	ALTER TABLE [Bibles] WITH CHECK ADD CONSTRAINT [FK_Bibles_Versions] FOREIGN KEY([VersionId]) REFERENCES [Versions] ([Id])
	ALTER TABLE [Bibles] CHECK CONSTRAINT [FK_Bibles_Versions]
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Bibles' AND CONSTRAINT_NAME = 'FK_Bibles_Editions')
BEGIN
	ALTER TABLE [Bibles] WITH CHECK ADD CONSTRAINT [FK_Bibles_Editions] FOREIGN KEY([EditionId]) REFERENCES [Editions] ([Id])
	ALTER TABLE [Bibles] CHECK CONSTRAINT [FK_Bibles_Editions]
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Bibles' AND COLUMN_NAME = 'TextFormat' AND Column_Default IS NOT NULL)
ALTER TABLE [Bibles] ADD CONSTRAINT [DF_Bibles_TextFormat] DEFAULT ('txt') FOR [TextFormat]


----------------------------------------------------------------------------
-- BibleVerses
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'BibleVerses')
CREATE TABLE [BibleVerses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BibleId] [int] NOT NULL,
	[VerseId] [int] NOT NULL,
	[Markup] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_BibleVerses] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'BibleVerses' AND CONSTRAINT_NAME = 'FK_BibleVerses_Bibles')
BEGIN
	ALTER TABLE [BibleVerses] WITH CHECK ADD CONSTRAINT [FK_BibleVerses_Bibles] FOREIGN KEY([BibleId]) REFERENCES [Bibles] ([Id])
	ALTER TABLE [BibleVerses] CHECK CONSTRAINT [FK_BibleVerses_Bibles]
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'BibleVerses' AND CONSTRAINT_NAME = 'FK_BibleVerses_Verses')
BEGIN
	ALTER TABLE [BibleVerses] WITH CHECK ADD CONSTRAINT [FK_BibleVerses_Verses] FOREIGN KEY([VerseId]) REFERENCES [Verses] ([Id])
	ALTER TABLE [BibleVerses] CHECK CONSTRAINT [FK_BibleVerses_Verses]
END

IF NOT EXISTS (SELECT name FROM sys.indexes WHERE name = 'UQ_BibleVerses_Version_Verse')
CREATE UNIQUE NONCLUSTERED INDEX [UQ_BibleVerses_Version_Verse] ON [BibleVerses]
(
	[BibleId] ASC,
	[VerseId] ASC
)


----------------------------------------------------------------------------
-- VersionNotes
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'VersionNotes')
CREATE TABLE [VersionNotes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VersionId] [int] NOT NULL,
	[EditionId] [int] NULL,
	[BibleId] [int] NULL,
	[CanonId] [int] NULL,
	[BookId] [int] NULL,
	[ChapterId] [int] NULL,
	[VerseId] [int] NULL,
	[Note] [nvarchar](max) NOT NULL,
	[Label] [nvarchar](64) NULL,
	[Ranking] [int] NOT NULL,
 CONSTRAINT [PK_VersionNotes] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'VersionNotes' AND CONSTRAINT_NAME = 'FK_VersionNotes_Versions')
BEGIN
	ALTER TABLE [VersionNotes] WITH CHECK ADD CONSTRAINT [FK_VersionNotes_Versions] FOREIGN KEY([VersionId]) REFERENCES [Versions] ([Id])
	ALTER TABLE [VersionNotes] CHECK CONSTRAINT [FK_VersionNotes_Versions]
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'VersionNotes' AND CONSTRAINT_NAME = 'FK_VersionNotes_Canons')
BEGIN
	ALTER TABLE [VersionNotes] WITH CHECK ADD CONSTRAINT [FK_VersionNotes_Canons] FOREIGN KEY([CanonId]) REFERENCES [Canons] ([Id])
	ALTER TABLE [VersionNotes] CHECK CONSTRAINT [FK_VersionNotes_Canons]
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'VersionNotes' AND CONSTRAINT_NAME = 'FK_VersionNotes_Books')
BEGIN
	ALTER TABLE [VersionNotes] WITH CHECK ADD CONSTRAINT [FK_VersionNotes_Books] FOREIGN KEY([BookId]) REFERENCES [Books] ([Id])
	ALTER TABLE [VersionNotes] CHECK CONSTRAINT [FK_VersionNotes_Books]
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'VersionNotes' AND CONSTRAINT_NAME = 'FK_VersionNotes_Chapters')
BEGIN
	ALTER TABLE [VersionNotes] WITH CHECK ADD CONSTRAINT [FK_VersionNotes_Chapters] FOREIGN KEY([ChapterId]) REFERENCES [Chapters] ([Id])
	ALTER TABLE [VersionNotes] CHECK CONSTRAINT [FK_VersionNotes_Chapters]
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'VersionNotes' AND CONSTRAINT_NAME = 'FK_VersionNotes_Verses')
BEGIN
	ALTER TABLE [VersionNotes] WITH CHECK ADD CONSTRAINT [FK_VersionNotes_Verses] FOREIGN KEY([VerseId]) REFERENCES [Verses] ([Id])
	ALTER TABLE [VersionNotes] CHECK CONSTRAINT [FK_VersionNotes_Verses]
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'VersionNotes' AND CONSTRAINT_NAME = 'FK_VersionNotes_Bibles')
BEGIN
	ALTER TABLE [VersionNotes] WITH CHECK ADD CONSTRAINT [FK_VersionNotes_Bibles] FOREIGN KEY([BibleId]) REFERENCES [Bibles] ([Id])
	ALTER TABLE [VersionNotes] CHECK CONSTRAINT [FK_VersionNotes_Bibles]
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'VersionNotes' AND CONSTRAINT_NAME = 'FK_VersionNotes_Editions')
BEGIN
	ALTER TABLE [VersionNotes] WITH CHECK ADD CONSTRAINT [FK_VersionNotes_Editions] FOREIGN KEY([EditionId]) REFERENCES [Editions] ([Id])
	ALTER TABLE [VersionNotes] CHECK CONSTRAINT [FK_VersionNotes_Editions]
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'VersionNotes' AND COLUMN_NAME = 'Ranking' AND Column_Default IS NOT NULL)
	ALTER TABLE VersionNotes ADD CONSTRAINT DF_VersionNotes_Ranking DEFAULT 0 FOR Ranking;
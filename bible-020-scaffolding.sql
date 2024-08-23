/***************************************************************************
* Bible Database: SQL Server
* https://github.com/donjewett/bible-sql
*
* bible-020-scaffolding.sql
*
* Version: 2024.8.22
* 
* Script License: CC BY 4.0 - https://creativecommons.org/licenses/by/4.0/
* 
***************************************************************************/

----------------------------------------------------------------------------
-- add_Language
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Language')
	DROP PROCEDURE add_Language
GO

CREATE PROCEDURE add_Language
	@id varchar(3),
	@name nvarchar(64),
	@html char(2) = NULL,
	@ancient bit = 0
AS
BEGIN
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM [Languages] WHERE [Id] = @id)
		INSERT INTO [Languages] ([Id], [Name], [HtmlCode], [IsAncient]) VALUES (@id, @name, @html, @ancient)

END
GO

----------------------------------------------------------------------------
-- add_Canon
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Canon')
	DROP PROCEDURE add_Canon
GO

CREATE PROCEDURE add_Canon
	@id int,
	@code nvarchar(3),
	@name nvarchar(48),
	@lang varchar(3)
AS
BEGIN
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM Canons WHERE [Id] = @id)
		INSERT INTO Canons ([Id], [Code], [Name], [LanguageId]) VALUES (@id, @code, @name, @lang)

END
GO

----------------------------------------------------------------------------
-- add_Section
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Section')
	DROP PROCEDURE add_Section
GO

CREATE PROCEDURE add_Section
	@id int,
	@name varchar(16),
	@canonId int
AS
BEGIN
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM Sections WHERE [Id] = @id)
		INSERT INTO Sections ([Id], [Name], [CanonId]) VALUES (@id, @name, @canonId)

END
GO

----------------------------------------------------------------------------
-- add_Book
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Book')
	DROP PROCEDURE add_Book
GO

CREATE PROCEDURE add_Book
	@id int, 
	@name nvarchar(64),
	@code nvarchar(5),
	@abbrev nvarchar(5),
	@book tinyint,
	@canonId int,
	@sectionId int,
	@secEnd bit,
	@chapters tinyint,
	@osis nvarchar(6),
	@para nvarchar(3)

AS
BEGIN
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM Books WHERE [Id] = @id)
		INSERT INTO Books ([Id], [Name], [Abbrev], [Code], [OsisCode], [Paratext], [Book], [CanonId], [SectionId], [IsSectionEnd], [ChapterCount])
			VALUES (@id, @name, @code, @abbrev, @osis, @para, @book, @canonId, @sectionId, @secEnd, @chapters)

END
GO


----------------------------------------------------------------------------
-- add_BookName
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_BookName')
	DROP PROCEDURE add_BookName
GO

CREATE PROCEDURE add_BookName
	@name nvarchar(64),
	@bookId int

AS
BEGIN
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM BookNames WHERE [Name] = @name)
		INSERT INTO BookNames ([Name], [BookId]) VALUES (LOWER(@name), @bookId)

END
GO


----------------------------------------------------------------------------
-- add_Chapter
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Chapter')
	DROP PROCEDURE add_Chapter
GO

CREATE PROCEDURE add_Chapter
	@id int,
	@code varchar(7),
	@ref varchar(8),
	@ch tinyint,
	@verses tinyint,
	@bkId int,
	@bkEnd bit = 0
AS
BEGIN
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM Chapters WHERE [Id] = @id)
		INSERT INTO Chapters ([Id], [Code], [Reference], [Chapter], [VerseCount], [BookId], [IsBookEnd]) 
		VALUES (@id, @code, @ref, @ch, @verses, @bkId, @bkEnd)

END
GO


----------------------------------------------------------------------------
-- add_Verse
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Verse')
	DROP PROCEDURE add_Verse
GO

CREATE PROCEDURE add_Verse
	@id int,
	@code varchar(16),
	@osis varchar(13),
	@ref varchar(10),
	@bk tinyint,
	@ch tinyint,
	@vs tinyint,
	@canId int,
	@secId int,
	@bkId int,
	@chId int,
	@chEnd bit = 0
AS
BEGIN
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM Verses WHERE [Id] = @id)
		INSERT INTO Verses ([Id], [Code], [OsisCode], [Reference], [Book], [Chapter], [Verse], [CanonId], [SectionId], [BookId], [ChapterId], [IsChapterEnd])
			 VALUES (@id, @code, @osis, @ref, @bk, @ch, @vs, @canId, @secId, @bkId, @chId, @chEnd)

END
GO

----------------------------------------------------------------------------
-- add_GreekForm
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_GreekForm')
	DROP PROCEDURE add_GreekForm
GO

CREATE PROCEDURE add_GreekForm
	@id varchar(3),
	@name nvarchar(48),
	@parent varchar(3) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM GreekTextForms WHERE [Id] = @id)
		INSERT INTO GreekTextForms ([Id], [Name], [ParentId]) VALUES (@id, @name, @parent)

END
GO

----------------------------------------------------------------------------
-- add_HebrewForm
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_HebrewForm')
	DROP PROCEDURE add_HebrewForm
GO

CREATE PROCEDURE add_HebrewForm
	@id varchar(3),
	@name nvarchar(48),
	@parent varchar(3) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM HebrewTextForms WHERE [Id] = @id)
		INSERT INTO HebrewTextForms ([Id], [Name], [ParentId]) VALUES (@id, @name, @parent)

END
GO

----------------------------------------------------------------------------
-- add_LicensePermission
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_LicensePermission')
	DROP PROCEDURE add_LicensePermission
GO

CREATE PROCEDURE add_LicensePermission
	@name varchar(48),
	@permissive int,
	@id int = NULL OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	IF @id IS NOT NULL AND NOT EXISTS (SELECT * FROM LicensePermissions WHERE [Id] = @id)
	BEGIN
		SET IDENTITY_INSERT LicensePermissions ON
		INSERT INTO LicensePermissions ([Id], [Name], [Permissiveness]) VALUES (@id, @name, @permissive)
		SET IDENTITY_INSERT LicensePermissions OFF
	END

	IF @id IS NULL AND NOT EXISTS (SELECT * FROM [LicensePermissions] WHERE [Name] = @name)
	BEGIN
		INSERT INTO LicensePermissions ([Name], [Permissiveness]) VALUES (@name, @permissive)
		SET @id = SCOPE_IDENTITY()
	END
	
END
GO


----------------------------------------------------------------------------
-- add_LicenseType
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_LicenseType')
	DROP PROCEDURE add_LicenseType
GO

CREATE PROCEDURE add_LicenseType
	@name varchar(48),
	@free bit,
	@permId int,
	@id int = NULL OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	IF @id IS NOT NULL AND NOT EXISTS (SELECT * FROM LicenseTypes WHERE [Id] = @id)
	BEGIN
		SET IDENTITY_INSERT LicenseTypes ON
		INSERT INTO LicenseTypes ([Id], [Name], [PermissionId], [IsFree]) VALUES (@id, @name, @permId, @free)
		SET IDENTITY_INSERT LicenseTypes OFF
	END

	IF @Id IS NULL AND NOT EXISTS (SELECT * FROM LicenseTypes WHERE [Name] = @name)
	BEGIN
		INSERT INTO LicenseTypes ([Name], [PermissionId], [IsFree]) VALUES (@name, @permId, @free)
		SET @id = SCOPE_IDENTITY()
	END

END
GO


----------------------------------------------------------------------------
-- add_Site
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Site')
	DROP PROCEDURE add_Site
GO

CREATE PROCEDURE add_Site
	@name nvarchar(64),
	@url varchar(255),
	@id int = NULL OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	SET @id = (SELECT [Id] FROM [Sites] WHERE [Url] = @url)
	IF @id IS NULL
	BEGIN
		INSERT INTO [Sites] ([Name], [Url]) VALUES (@name, @url)
		SET @id = SCOPE_IDENTITY()
	END
	
END
GO


----------------------------------------------------------------------------
-- add_ResourceType
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_ResourceType')
	DROP PROCEDURE add_ResourceType
GO

CREATE PROCEDURE add_ResourceType
	@id varchar(8),
	@name nvarchar(64)
AS
BEGIN
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM ResourceTypes WHERE [Id] = @id)
		INSERT INTO ResourceTypes ([Id], [Name]) VALUES (@id, @name)

END
GO


----------------------------------------------------------------------------
-- add_Resource
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Resource')
	DROP PROCEDURE add_Resource
GO

CREATE PROCEDURE add_Resource
	@version nvarchar(16),
	@type varchar(8), 
	@url varchar(255),
	@edition varchar(16) = NULL,
	@official bit = 0,
	@siteName varchar(64) = NULL,
	@siteUrl varchar(255) = NULL,
	@id int = NULL OUTPUT

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @siteId int = NULL
	IF @siteUrl IS NOT NULL AND @siteName IS NOT NULL
		EXEC add_Site @name = @siteName, @url = @siteUrl, @id = @siteId OUTPUT

	DECLARE @versionId int = (SELECT [Id] FROM [Versions] WHERE [Code] = @version)
	SET @id = (SELECT [Id] FROM Resources WHERE [VersionId] = @versionId AND [ResourceTypeId] = @type AND [Url] = @url)
	
	IF @edition IS NULL AND @id IS NULL
	BEGIN
		INSERT INTO Resources ([VersionId], [ResourceTypeId], [Url], [IsOfficial], [SiteId]) VALUES (@versionId, @type, @url, @official, @siteId)
		SET @id = SCOPE_IDENTITY()
	END

	IF @edition IS NOT NULL 
	BEGIN
		DECLARE @editionId int = (SELECT [Id] FROM Editions WHERE [Code] = @edition)
		SET @id = (SELECT [Id] FROM Resources WHERE [VersionId] = @versionId AND [EditionId] = @editionId AND [ResourceTypeId] = @type AND [Url] = @url)
		IF @id IS NULL 
		BEGIN
			INSERT INTO Resources ([VersionId], [EditionId], [ResourceTypeId], [Url], [IsOfficial], [SiteId]) VALUES (@versionId, @editionId, @type, @url, @official, @siteId)
			SET @id = SCOPE_IDENTITY()
		END
	END

END
GO


----------------------------------------------------------------------------
-- add_Version
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Version')
	DROP PROCEDURE add_Version
GO

CREATE PROCEDURE add_Version
	@code varchar(16), 
	@name nvarchar(64),
	@lang varchar(3),
	@year smallint,
	@parent varchar(16) = NULL, 
	@sub nvarchar(128) = NULL,
	@hebrew varchar(3) = NULL,
	@greek varchar(3) = NULL,
	@license int = NULL,
	@level [decimal](4, 2) = NULL,
	@versionUrl varchar(255) = NULL,
	@licenseUrl varchar(255) = NULL,
	@readUrl varchar(255) = NULL,
	@id int = NULL OUTPUT

AS
BEGIN
	SET NOCOUNT ON;

	SET @id = (SELECT [Id] FROM [Versions] WHERE [Code] = @code)
	
	IF NOT EXISTS (SELECT * FROM [Versions] WHERE [Code] = @code)
	BEGIN
		INSERT INTO [Versions] ([Code], [Name], [LanguageId], [YearPublished]) VALUES (@code, @name, @lang, @year)
		SET @id = SCOPE_IDENTITY()
	END

	UPDATE [Versions] SET [Subtitle] = @sub WHERE [Id] = @id AND @sub IS NOT NULL AND [Subtitle] IS NULL
	UPDATE [Versions] SET [HebrewFormId] = @hebrew WHERE [Id] = @id AND @hebrew IS NOT NULL AND [HebrewFormId] IS NULL
	UPDATE [Versions] SET [GreekFormId] = @greek WHERE [Id] = @id AND @greek IS NOT NULL AND [GreekFormId] IS NULL
	UPDATE [Versions] SET [LicenseTypeId] = @license WHERE [Id] = @id AND @license IS NOT NULL AND [LicenseTypeId] IS NULL
	UPDATE [Versions] SET [ReadingLevel] = @level WHERE [Id] = @id AND @level IS NOT NULL AND [ReadingLevel] IS NULL

	IF EXISTS (SELECT * FROM [Versions] WHERE [Code] = @parent)
	BEGIN
		DECLARE @parentId int = (SELECT [Id] FROM [Versions] WHERE [Code] = @parent)
		UPDATE [Versions] SET [ParentId] = @parentId WHERE [Id] = @id AND @parent IS NOT NULL AND [ParentId] IS NULL
	END

	IF @versionUrl IS NOT NULL EXEC add_Resource @version=@id, @type='version', @url=@versionUrl, @official=1
	IF @licenseUrl IS NOT NULL EXEC add_Resource @version=@id, @type='license', @url=@licenseUrl, @official=1
	IF @readUrl IS NOT NULL EXEC add_Resource @version=@id, @type='read', @url=@readUrl, @official=1

END
GO


----------------------------------------------------------------------------
-- add_Edition
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Edition')
	DROP PROCEDURE add_Edition
GO

CREATE PROCEDURE add_Edition
	@code varchar(16), 
	@version varchar(16),
	@year smallint,
	@sub nvarchar(128) = NULL,
	@editionUrl varchar(255) = NULL,
	@licenseUrl varchar(255) = NULL,
	@readUrl varchar(255) = NULL,
	@id int = NULL OUTPUT

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @versionId int = (SELECT [Id] FROM [Versions] WHERE [Code] = @version)
	SET @id = (SELECT [Id] FROM Editions WHERE [Code] = @code)
	IF @id IS NULL
	BEGIN
		INSERT INTO [Editions]([Code], [VersionId], [YearPublished]) VALUES (@code, @versionId, @year)
		SET @id = SCOPE_IDENTITY()
	END

	UPDATE Editions SET [Subtitle] = @sub WHERE [Id] = @id AND @sub IS NOT NULL AND [Subtitle] IS NULL

	IF @editionUrl IS NOT NULL EXEC add_Resource @version=@version, @edition=@id, @type='edition', @url=@editionUrl, @official=1
	IF @licenseUrl IS NOT NULL EXEC add_Resource @version=@version, @edition=@id, @type='license', @url=@licenseUrl, @official=1
	IF @readUrl IS NOT NULL EXEC add_Resource @version=@version, @edition=@id, @type='read', @url=@readUrl, @official=1

END
GO


----------------------------------------------------------------------------
-- add_Bible
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Bible')
	DROP PROCEDURE add_Bible
GO

CREATE PROCEDURE add_Bible
	@code varchar(16), 
	@name nvarchar(64),
	@version varchar(16),
	@year smallint,
	@edition varchar(16) = NULL,
	@sub nvarchar(128) = NULL,
	@sourceUrl varchar(255) = NULL,
	@id int = NULL OUTPUT

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @versionId int = (SELECT [Id] FROM [Versions] WHERE [Code] = @version)
	DECLARE @editionId int = (SELECT [Id] FROM Editions WHERE [Code] = @edition)

	SET @id = (SELECT [Id] FROM Bibles WHERE [Code] = @code)
	IF @id IS NULL
	BEGIN
		INSERT INTO Bibles ([Code], [VersionId], [EditionId], [Name], [YearPublished]) VALUES (@code, @versionId, @editionId, @name, @year)
		SET @id = SCOPE_IDENTITY()
	END

	IF @sourceUrl IS NOT NULL EXEC add_Resource @version=@code, @edition=@edition, @type='file', @url=@sourceUrl
	
END
GO


----------------------------------------------------------------------------
-- add_BibleVerse
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_BibleVerse')
	DROP PROCEDURE add_BibleVerse
GO

CREATE PROCEDURE add_BibleVerse
	@bibleId int, 
	@verseId int,
	@markup nvarchar(max),
	@id int = NULL OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	SET @id = (SELECT [Id] FROM BibleVerses WHERE [BibleId] = @bibleId AND [VerseId] = @verseId)
	IF @id IS NULL
	BEGIN
		INSERT INTO BibleVerses ([BibleId], [VerseId], [Markup]) VALUES (@bibleId, @verseId, @markup)
		SET @id = SCOPE_IDENTITY()
	END
END
GO


----------------------------------------------------------------------------
-- add_BibleMarkup
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_BibleMarkup')
	DROP PROCEDURE add_BibleMarkup
GO

CREATE PROCEDURE add_BibleMarkup
	@bibleId int, 
	@book varchar(64),
	@chapter smallint,
	@verse smallint,
	@markup nvarchar(max),
	@id int = NULL OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @bookId int = (SELECT [Id] FROM Books WHERE @book IN ([Name], [Code], [Abbrev], [OsisCode], [ParaText], CONVERT(varchar(3),[Book])))

	IF @bookId IS NULL SET @bookId = (SELECT [BookId] FROM BookNames WHERE [Name] = @book)

	DECLARE @verseId int = (SELECT [Id] FROM Verses WHERE [BookId] = @bookId AND [Chapter] = @chapter AND [Verse] = @verse)
	EXEC add_BibleVerse @bibleId=@bibleId, @verseId=@verseId, @markup=@markup, @id=@id OUTPUT

END
GO

----------------------------------------------------------------------------
-- add_VersionNote
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_VersionNote')
	DROP PROCEDURE add_VersionNote
GO

CREATE PROCEDURE add_VersionNote
	@note nvarchar(max),
	@version varchar(16) = NULL,
	@edition varchar(16) = NULL,
	@bible varchar(16) = NULL,
	@canId int = NULL,
	@bkId int = NULL,
	@chId int = NULL,
	@verseId int = NULL,
	@label varchar(64) = NULL,
	@ranking int = 0,
	@id int = NULL OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @versionId int = (SELECT [Id] FROM [Versions] WHERE [Code] = @version)
	DECLARE @editionId int = (SELECT [Id] FROM Editions WHERE [Code] = @edition)
	DECLARE @bibleId int = (SELECT [Id] FROM Bibles WHERE [Code] = @bible)
	
	SET @id = (SELECT [Id] FROM VersionNotes 
		WHERE [Note] = @note
			AND ISNULL(Label,'') = ISNULL(@label,'')
			AND ISNULL(VersionId,0) = ISNULL(@versionId,0) 
			AND ISNULL(EditionId,0) = ISNULL(@editionId,0)
			AND ISNULL(BibleId,0) = ISNULL(@bibleId,0)
			AND ISNULL(CanonId,0) = ISNULL(@canId,0)
			AND ISNULL(BookId,0) = ISNULL(@bkId,0)
			AND ISNULL(ChapterId,0) = ISNULL(@chId,0)
			AND ISNULL(VerseId,0) = ISNULL(@verseId,0)
		)
	
	IF @id IS NULL
	BEGIN
		INSERT INTO VersionNotes ([VersionId], [EditionId], [BibleId], [CanonId], [BookId], [ChapterId], [VerseId], [Note], [Label], [Ranking]) 
			VALUES (@versionId, @editionId, @bibleId, @canId, @bkId, @chId, @verseId, @note, @label, @ranking)
		SET @id = SCOPE_IDENTITY()
	END
	
		   
END
GO

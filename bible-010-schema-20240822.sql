/***************************************************************************
* Bible Database: SQL Server
* https://github.com/donjewett/bible-sql
*
* bible-010-schema-20240822.sql
*
* Version: 2024.8.22
* 
* Script License: CC BY 4.0 - https://creativecommons.org/licenses/by/4.0/
*
***************************************************************************/

-- Update Version 2024.8.19 to 2024.8.22

IF EXISTS(SELECT * FROM Books WHERE Abbrev = 'Jon')
BEGIN
	UPDATE V SET Reference = REPLACE(Reference, 'Jon ', 'Jonah ') FROM Verses V WHERE V.Reference LIKE 'Jon %'
	UPDATE Books SET Abbrev = 'Jonah' WHERE Abbrev = 'Jon'
END

IF EXISTS(SELECT * FROM Books WHERE Abbrev = '1Jo')
BEGIN
	UPDATE V SET Reference = REPLACE(Reference, '1Jo ', '1John ') FROM Verses V WHERE V.Reference LIKE '1Jo %'
	UPDATE Books SET Abbrev = '1John' WHERE Abbrev = '1Jo'
END

IF EXISTS(SELECT * FROM Books WHERE Abbrev = '2Jo')
BEGIN
	UPDATE V SET Reference = REPLACE(Reference, '2Jo ', '2John ') FROM Verses V WHERE V.Reference LIKE '2Jo %'
	UPDATE Books SET Abbrev = '2John' WHERE Abbrev = '2Jo'
END

IF EXISTS(SELECT * FROM Books WHERE Abbrev = '3Jo')
BEGIN
	UPDATE V SET Reference = REPLACE(Reference, '3Jo ', '3John ') FROM Verses V WHERE V.Reference LIKE '3Jo %'
	UPDATE Books SET Abbrev = '3John' WHERE Abbrev = '3Jo'
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='Chapters' AND COLUMN_NAME='Reference')
	ALTER TABLE Chapters ADD [Reference] varchar(8) NULL
GO

IF EXISTS(SELECT * FROM Chapters WHERE [Reference] IS NULL)
BEGIN
	UPDATE C SET [Reference] = B.Abbrev + ' ' + CONVERT(varchar(3), C.Chapter)
	FROM Chapters C
		JOIN Books B ON C.BookId = B.Id
	WHERE [Reference] IS NULL

	ALTER TABLE Chapters ALTER COLUMN [Reference] varchar(8) NOT NULL
	
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'VersionNotes' AND COLUMN_NAME = 'Ranking' AND Column_Default IS NOT NULL)
	ALTER TABLE VersionNotes ADD CONSTRAINT DF_VersionNotes_Ranking DEFAULT 0 FOR Ranking;
GO	

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='VersionNotes' AND COLUMN_NAME='Label')
	ALTER TABLE VersionNotes ADD [Label] varchar(64) NULL
GO

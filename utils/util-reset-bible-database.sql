/*

* Careful! This will delete your whole database
* for rebuilding from source scripts.

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Resources') DROP TABLE Resources;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'ResourceTypes') DROP TABLE ResourceTypes;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Sites') DROP TABLE Sites;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'VersionNotes') DROP TABLE VersionNotes;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'ReferenceVerses') DROP TABLE ReferenceVerses;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'CrossReferences') DROP TABLE CrossReferences;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'BibleVerses') DROP TABLE BibleVerses;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Bibles') DROP TABLE Bibles;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Editions') DROP TABLE Editions;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Versions') DROP TABLE Versions;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Verses') DROP TABLE Verses;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Chapters') DROP TABLE Chapters;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Books') DROP TABLE Books;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'BookNames') DROP TABLE BookNames;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'LicenseTypes') DROP TABLE LicenseTypes;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'LicensePermissions') DROP TABLE LicensePermissions;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Sections') DROP TABLE Sections;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Canons') DROP TABLE Canons;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'GreekTextForms') DROP TABLE GreekTextForms;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'HebrewTextForms') DROP TABLE HebrewTextForms;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Languages') DROP TABLE Languages;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'SalesStats') DROP TABLE SalesStats;
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'SchemaUpdates') DROP TABLE SchemaUpdates;

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Language') DROP PROCEDURE add_Language;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Canon') DROP PROCEDURE add_Canon;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Section') DROP PROCEDURE add_Section;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Book') DROP PROCEDURE add_Book;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_BookName') DROP PROCEDURE add_BookName;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Chapter') DROP PROCEDURE add_Chapter;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Verse') DROP PROCEDURE add_Verse;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_GreekForm') DROP PROCEDURE add_GreekForm;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_HebrewForm') DROP PROCEDURE add_HebrewForm;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_LicensePermission') DROP PROCEDURE add_LicensePermission;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_LicenseType') DROP PROCEDURE add_LicenseType;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Site') DROP PROCEDURE add_Site;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_ResourceType') DROP PROCEDURE add_ResourceType;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Resource') DROP PROCEDURE add_Resource;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Version') DROP PROCEDURE add_Version;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Edition') DROP PROCEDURE add_Edition;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Bible') DROP PROCEDURE add_Bible;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_BibleVerse') DROP PROCEDURE add_BibleVerse;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_BibleMarkup') DROP PROCEDURE add_BibleMarkup;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_VersionNote') DROP PROCEDURE add_VersionNote;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_XRef') DROP PROCEDURE add_XRef;
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_SalesStat') DROP PROCEDURE add_SalesStat;

*/

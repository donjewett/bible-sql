/***************************************************************************
* Bible Database: SQL Server
* https://github.com/donjewett/bible-sql
*
* bible-011-schema-20240912.sql
*
* Version: 2024.9.12
* 
* Script License: CC BY 4.0 - https://creativecommons.org/licenses/by/4.0/
*
***************************************************************************/

-- Update Version 2024.22 to 2024.9.12

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='BibleVerses' AND COLUMN_NAME='Notes')
	ALTER TABLE BibleVerses ADD Notes nvarchar(255)

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='BibleVerses' AND COLUMN_NAME='Heading')
	ALTER TABLE BibleVerses ADD Heading nvarchar(255)

UPDATE Versions SET GreekFormId = 'BYZ' WHERE Code = 'TCENT' AND GreekFormId = 'AX' 

DELETE GreekTextForms WHERE Id = 'LVH'
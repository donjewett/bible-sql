/***************************************************************************
* Bible Database: SQL Server
* https://github.com/donjewett/bible-sql
*
* bible-011-schema-20240920.sql
*
* Version: 2024.9.20
* 
* Script License: CC BY 4.0 - https://creativecommons.org/licenses/by/4.0/
*
***************************************************************************/

-- Update Version 2024.9.12 to 2024.9.20

sp_rename 'SalesStats.StatId', 'Id', 'COLUMN';

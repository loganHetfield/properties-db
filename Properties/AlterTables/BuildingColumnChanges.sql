if exists (SELECT * 
FROM sys.indexes 
WHERE name='IX_Unique_Building_Name' AND object_id = OBJECT_ID('dbo.Building'))
BEGIN
	DROP Index IX_Unique_Building_Name on Building
END

if exists( select 1 from sys.all_columns where object_id = object_id('Building') and name = 'Name' )
BEGIN
ALTER TABLE dbo.Building Drop Column 
	Name
END

if NOT exists( select 1 from sys.all_columns where object_id = object_id('Building') and name = 'NameOrNumber' )
BEGIN
ALTER TABLE dbo.Building Add 
	NameOrNumber nvarchar(50) NOT NULL
END

if not exists (SELECT * 
FROM sys.indexes 
WHERE name='IX_Unique_Building_NameOrNumber' AND object_id = OBJECT_ID('dbo.Building'))
BEGIN
	CREATE UNIQUE NONCLUSTERED INDEX IX_Unique_Building_NameOrNumber ON dbo.Building
	(
	PropertyId,
	NameOrNumber
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
END


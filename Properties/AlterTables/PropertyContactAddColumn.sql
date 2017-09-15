if  exists (select 1 from sys.all_columns where object_id = object_id('PropertyContact') and (name = 'FirstName' or name = 'LastName'))
BEGIN
ALTER TABLE dbo.PropertyContact DROP COLUMN FirstName, LastName
END

if not exists (select 1 from sys.all_columns where object_id = object_id('PropertyContact') and (name = 'ImageId' or name = 'ThumbImageId'))
BEGIN
ALTER TABLE dbo.PropertyContact ADD
	[Name] nvarchar(100) NULL,
	[ImageId] [uniqueidentifier] NULL,
	[ThumbImageId] [uniqueidentifier] NULL,
	[FileName] [varchar](255) NULL,
	[Width] [int] NULL,
	[Height] [int] NULL
END 

if exists( select 1 from sys.all_columns where object_id = object_id('PropertyContact') and (name = 'Width' or name = 'Height'))
BEGIN

EXEC sp_rename '[dbo].[PropertyContact].[Height]', 'ImageHeight', 'Column';
EXEC sp_rename '[dbo].[PropertyContact].[Width]', 'ImageWidth', 'Column';

END

if not exists (select 1 from sys.all_columns where object_id = object_id('PropertyContact') and (name = 'FaxNumber'))
BEGIN
ALTER TABLE dbo.PropertyContact ADD
	[FaxNumber] [nvarchar](255) NULL,
	[WebSite] [nvarchar](255) NULL,
	[BusinessName] [nvarchar](255) NULL,
	[IsNameSameAsProperty] [bit] NULL
END 
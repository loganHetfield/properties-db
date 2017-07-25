if  exists( select 1 from sys.all_columns where object_id = object_id('PropertyContact') and (name = 'FirstName' or name = 'LastName'))
BEGIN
ALTER TABLE dbo.PropertyContact DROP COLUMN FirstName, LastName, BusinessName
END

if not exists( select 1 from sys.all_columns where object_id = object_id('PropertyContact') and (name = 'ImageId' or name = 'ThumbImageId'))
BEGIN
ALTER TABLE dbo.PropertyContact ADD
	[Name] nvarchar(100) NULL,
	[ImageId] [uniqueidentifier] NULL,
	[ThumbImageId] [uniqueidentifier] NULL,
	[FileName] [varchar](255) NULL,
	[Width] [int] NULL,
	[Height] [int] NULL
END 
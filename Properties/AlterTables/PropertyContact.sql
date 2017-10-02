if  exists (select 1 from sys.all_columns where object_id = object_id('PropertyContact') and (name = 'BusinessName'))
BEGIN
ALTER TABLE dbo.PropertyContact DROP COLUMN BusinessName
END

if  exists (select 1 from sys.all_columns where object_id = object_id('PropertyContact') and (name = 'Website'))
BEGIN
ALTER TABLE dbo.PropertyContact DROP COLUMN Website
END


if not exists (select 1 from sys.all_columns where object_id = object_id('PropertyContact') and name = 'FaxNumber')
BEGIN
    ALTER TABLE [dbo].[PropertyContact] ADD [FaxNumber] [NVARCHAR](50) NULL
END

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

if not exists (select 1 from sys.all_columns where object_id = object_id('PropertyContact') and (name = 'RoomNumber'))
BEGIN
ALTER TABLE dbo.PropertyContact ADD
	[RoomNumber] nvarchar(255) NULL
END 

if exists ( select name, is_nullable from sys.all_columns where object_id = object_id('PropertyContact') and name in ('NumberOrMilepost', 'StreetOrHighway', 'City', 'StateId', 'Zip') and Is_nullable = 0)
BEGIN
Alter table PropertyContact
Alter column 
	[NumberOrMilepost] [nvarchar](50) NULL
Alter table PropertyContact
Alter column 
	[StreetOrHighway] [nvarchar](100) NULL
Alter table PropertyContact
Alter column 
	[City] [nvarchar](255) NULL
Alter table PropertyContact
Alter column 
	[StateId] [int] NULL
Alter table PropertyContact
Alter column 
	[Zip] [nvarchar](50) NULL
END

	

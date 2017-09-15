if not exists( select 1 from sys.all_columns where object_id = object_id('PropertySpecialHazard') and (name = 'Width' or name = 'Height'))
BEGIN
ALTER TABLE dbo.PropertySpecialHazard ADD
	Width int NULL,
	Height int NULL
END

if not exists( select 1 from sys.all_columns where object_id = object_id('PropertySpecialHazard') and (name = 'ImageHeight' or name = 'ImageWidth'))
BEGIN

EXEC sp_rename '[dbo].[PropertySpecialHazard].[Height]', 'ImageHeight', 'Column';
EXEC sp_rename '[dbo].[PropertySpecialHazard].[Width]', 'ImageWidth', 'Column';

END

if not exists( select 1 from sys.all_columns where object_id = object_id('PropertySpecialHazard') and name = 'FileName')
BEGIN
ALTER TABLE dbo.PropertySpecialHazard ADD
	FileName nvarchar(255) NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('PropertySpecialHazard') and (name = 'Location'))
BEGIN
ALTER TABLE dbo.PropertySpecialHazard ADD
	[Description] [nvarchar](255) NULL,
	[Location] [nvarchar](255) NULL,
	[PriorityId] [int] NULL,
	[CategoryId] [int] NULL,
	[StartDate] [DateTime] NULL,
	[EndDate] [DateTime] NULL
END
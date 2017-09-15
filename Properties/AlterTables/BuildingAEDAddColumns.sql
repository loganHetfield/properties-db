if not exists( select 1 from sys.all_columns where object_id = object_id('BuildingAED') and name in ('ImageId', 'ThumbImageId', 'FileName', 'Width', 'Height'))
BEGIN
ALTER TABLE dbo.BuildingAED ADD
    [ImageId]        UNIQUEIDENTIFIER NULL,
    [ThumbImageId]   UNIQUEIDENTIFIER NULL,
    [FileName]       VARCHAR (255)    NULL,
    [Width]          INT              NULL,
    [Height]         INT              NULL
END

if not exists( select 1 from sys.all_columns where object_id = object_id('BuildingAED') and (name = 'ImageHeight' or name = 'ImageWidth'))
BEGIN
ALTER TABLE dbo.BuildingAED ADD
    [ImageHeight]         INT              NULL,
    [ImageWidth]          INT              NULL
END

if exists( select 1 from sys.all_columns where object_id = object_id('BuildingAED') and (name = 'Height' or name = 'Width'))
BEGIN
    ALTER TABLE dbo.BuildingAED Drop Column [Height]
    ALTER TABLE dbo.BuildingAED Drop Column [Width]
END

if Not exists( select 1 from sys.all_columns where object_id = object_id('BuildingAED') and name = 'Location')
BEGIN
    ALTER TABLE dbo.BuildingAED ADD 
	[Location] nvarchar(255) NULL
END
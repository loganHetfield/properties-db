if not exists( select 1 from sys.all_columns where object_id = object_id('BuildingDetector') and name in ('ImageId', 'ThumbImageId', 'FileName', 'Width', 'Height'))
BEGIN
ALTER TABLE dbo.BuildingDetector ADD
    [ImageId]        UNIQUEIDENTIFIER NULL,
    [ThumbImageId]   UNIQUEIDENTIFIER NULL,
    [FileName]       VARCHAR (255)    NULL,
    [Width]          INT              NULL,
    [Height]         INT              NULL
END

if not exists( select 1 from sys.all_columns where object_id = object_id('BuildingDetector') and (name = 'ImageHeight' or name = 'ImageWidth'))
BEGIN
ALTER TABLE dbo.BuildingDetector ADD
    [ImageHeight]         INT              NULL,
    [ImageWidth]          INT              NULL
END

if exists( select 1 from sys.all_columns where object_id = object_id('BuildingDetector') and (name = 'Height' or name = 'Width'))
BEGIN
    ALTER TABLE dbo.BuildingDetector Drop Column [Height]
    ALTER TABLE dbo.BuildingDetector Drop Column [Width]
END

if exists( select 1 from sys.all_columns where object_id = object_id('BuildingDetector') and (name = 'Height' or name = 'Width'))
BEGIN
    ALTER TABLE dbo.BuildingDetector Drop Column [Height]
    ALTER TABLE dbo.BuildingDetector Drop Column [Width]
END

IF EXISTS (SELECT column_name 'Column Name', data_type 'Data Type' FROM information_schema.columns WHERE table_name = 'BuildingDetector'
AND column_name = 'AreaProtected' AND DATA_TYPE = 'nvarchar')
BEGIN
ALTER TABLE dbo.BuildingDetector ALTER COLUMN
    AreaProtected DECIMAL(18,2) NULL    
END
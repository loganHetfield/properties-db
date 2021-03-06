if not exists( select 1 from sys.all_columns where object_id = object_id('BuildingAlarm') and name in ('ImageId', 'ThumbImageId', 'FileName', 'Width', 'Height'))
BEGIN
ALTER TABLE dbo.BuildingAlarm ADD
    [ImageId]        UNIQUEIDENTIFIER NULL,
    [ThumbImageId]   UNIQUEIDENTIFIER NULL,
    [FileName]       VARCHAR (255)    NULL,
    [Width]          INT              NULL,
    [Height]         INT              NULL
END

if not exists( select 1 from sys.all_columns where object_id = object_id('BuildingAlarm') and (name = 'ImageHeight' or name = 'ImageWidth'))
BEGIN
ALTER TABLE dbo.BuildingAlarm ADD
    [ImageHeight]         INT              NULL,
    [ImageWidth]          INT              NULL
END

if exists( select 1 from sys.all_columns where object_id = object_id('BuildingAlarm') and (name = 'Height' or name = 'Width'))
BEGIN
    ALTER TABLE dbo.BuildingAlarm Drop Column [Height]
    ALTER TABLE dbo.BuildingAlarm Drop Column [Width]
END

IF EXISTS (SELECT column_name 'Column Name', data_type 'Data Type' FROM information_schema.columns WHERE table_name = 'BuildingAlarm'
AND column_name = 'AreaCovered' AND DATA_TYPE = 'nvarchar')
BEGIN
    ALTER TABLE dbo.BuildingAlarm ALTER COLUMN AreaCovered INT NULL
END
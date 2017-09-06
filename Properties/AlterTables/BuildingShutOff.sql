if not exists( select 1 from sys.all_columns where object_id = object_id('BuildingShutOff') and name in ('ImageId', 'ThumbImageId', 'FileName', 'Width', 'Height'))
BEGIN
ALTER TABLE dbo.BuildingShutOff ADD
    [ImageId]        UNIQUEIDENTIFIER NULL,
    [ThumbImageId]   UNIQUEIDENTIFIER NULL,
    [FileName]       VARCHAR (255)    NULL,
    [Width]          INT              NULL,
    [Height]         INT              NULL
END

if not exists( select 1 from sys.all_columns where object_id = object_id('BuildingShutOff') and (name = 'ImageHeight' or name = 'ImageWidth'))
BEGIN
ALTER TABLE dbo.BuildingShutOff ADD
    [ImageHeight]         INT              NULL,
    [ImageWidth]          INT              NULL
END

if exists( select 1 from sys.all_columns where object_id = object_id('BuildingShutOff') and (name = 'Height' or name = 'Width'))
BEGIN
    ALTER TABLE dbo.BuildingShutOff Drop Column [Height]
    ALTER TABLE dbo.BuildingShutOff Drop Column [Width]
END
if not exists( select 1 from sys.all_columns where object_id = object_id('BuildingSprinkler') and name in ('ImageId', 'ThumbImageId', 'FileName', 'Width', 'Height'))
BEGIN
ALTER TABLE dbo.BuildingSprinkler ADD
    [ImageId]        UNIQUEIDENTIFIER NULL,
    [ThumbImageId]   UNIQUEIDENTIFIER NULL,
    [FileName]       VARCHAR (255)    NULL,
    [Width]          INT              NULL,
    [Height]         INT              NULL
END
if not exists( select 1 from sys.all_columns where object_id = object_id('BuildingSprinkler') and (name = 'ImageHeight' or name = 'ImageWidth'))
BEGIN
ALTER TABLE dbo.BuildingSprinkler ADD
    [ImageHeight]         INT              NULL,
    [ImageWidth]          INT              NULL
END

if exists( select 1 from sys.all_columns where object_id = object_id('BuildingSprinkler') and (name = 'Height' or name = 'Width'))
BEGIN
    ALTER TABLE dbo.BuildingSprinkler Drop Column [Height]
    ALTER TABLE dbo.BuildingSprinkler Drop Column [Width]
END

IF EXISTS (SELECT column_name 'Column Name', data_type 'Data Type' FROM information_schema.columns WHERE table_name = 'BuildingSprinkler'
AND column_name = 'AreaOrCompartmentCovered' AND DATA_TYPE = 'nvarchar')
BEGIN
    ALTER TABLE dbo.BuildingSprinkler ALTER COLUMN AreaOrCompartmentCovered INT NULL
    EXECUTE sp_rename '[dbo].[BuildingSprinkler].[AreaOrCompartmentCovered]', 'AreaCovered', 'Column'
END
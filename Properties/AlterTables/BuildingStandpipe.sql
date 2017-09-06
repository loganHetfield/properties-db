if not exists( select 1 from sys.all_columns where object_id = object_id('BuildingStandpipe') and (name = 'Width' or name = 'Height'))
BEGIN
ALTER TABLE dbo.BuildingStandpipe ADD
	  [ImageId]        UNIQUEIDENTIFIER NULL,
    [ThumbImageId]   UNIQUEIDENTIFIER NULL,
    [FileName]       VARCHAR (255)    NULL,
    [Width]          INT              NULL,
    [Height]         INT              NULL
END

if not exists( select 1 from sys.all_columns where object_id = object_id('BuildingStandpipe') and (name = 'ImageHeight' or name = 'ImageWidth'))
BEGIN
ALTER TABLE dbo.BuildingStandpipe ADD
    [ImageHeight]         INT              NULL,
    [ImageWidth]          INT              NULL
END

if exists( select 1 from sys.all_columns where object_id = object_id('BuildingStandpipe') and (name = 'Height' or name = 'Width'))
BEGIN
	ALTER TABLE dbo.BuildingStandpipe Drop Column [Height]
	ALTER TABLE dbo.BuildingStandpipe Drop Column [Width]
END

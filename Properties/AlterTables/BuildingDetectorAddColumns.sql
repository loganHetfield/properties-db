if not exists( select 1 from sys.all_columns where object_id = object_id('BuildingDetector') and (name = 'Width' or name = 'Height'))
BEGIN
ALTER TABLE dbo.BuildingDetector ADD
	  [ImageId]        UNIQUEIDENTIFIER NULL,
    [ThumbImageId]   UNIQUEIDENTIFIER NULL,
    [FileName]       VARCHAR (255)    NULL,
    [Width]          INT              NULL,
    [Height]         INT              NULL
END
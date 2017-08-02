if not exists( select 1 from sys.all_columns where object_id = object_id('PropertyOtherWaterSource') and (name = 'ImageHeight' or name = 'ImageWidth'))
BEGIN
ALTER TABLE dbo.PropertyOtherWaterSource ADD
    [FileName]       VARCHAR (255)    NULL,
    [ImageHeight]          INT              NULL,
    [ImageWidth]         INT              NULL
END
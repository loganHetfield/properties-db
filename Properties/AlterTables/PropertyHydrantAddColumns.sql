if not exists( select 1 from sys.all_columns where object_id = object_id('PropertyHydrant') and (name = 'ImageHeight' or name = 'ImageWidth'))
BEGIN
ALTER TABLE dbo.PropertyHydrant ADD
    [FileName]       VARCHAR (255)    NULL,
    [ImageHeight]          INT              NULL,
    [ImageWidth]         INT              NULL
END

if not exists( select 1 from sys.all_columns where object_id = object_id('PropertyHydrant') and (name = 'HydrantId'))
BEGIN
ALTER TABLE dbo.PropertyHydrant ADD
    [HydrantId] VARCHAR (50) NULL
END
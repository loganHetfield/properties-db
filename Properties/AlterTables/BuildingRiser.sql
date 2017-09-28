if not exists( select 1 from sys.all_columns where object_id = object_id('BuildingRiser') and name in ('ImageId', 'ThumbImageId', 'FileName', 'Width', 'Height'))
BEGIN
ALTER TABLE dbo.BuildingRiser ADD
    [ImageId]        UNIQUEIDENTIFIER NULL,
    [ThumbImageId]   UNIQUEIDENTIFIER NULL,
    [FileName]       VARCHAR (255)    NULL,
    [Width]          INT              NULL,
    [Height]         INT              NULL
END

if not exists( select 1 from sys.all_columns where object_id = object_id('BuildingRiser') and (name = 'ImageHeight' or name = 'ImageWidth'))
BEGIN
ALTER TABLE dbo.BuildingRiser ADD
    [ImageHeight]         INT              NULL,
    [ImageWidth]          INT              NULL
END

if exists( select 1 from sys.all_columns where object_id = object_id('BuildingRiser') and (name = 'Height' or name = 'Width'))
BEGIN
    ALTER TABLE dbo.BuildingRiser Drop Column [Height]
    ALTER TABLE dbo.BuildingRiser Drop Column [Width]
END

if not exists( select 1 from sys.all_columns where object_id = object_id('BuildingRiser') and (name = 'Certification'))
BEGIN
ALTER TABLE dbo.BuildingRiser ADD
    Certification NVARCHAR(50) NOT NULL    
END


IF EXISTS (SELECT column_name 'Column Name', data_type 'Data Type' FROM information_schema.columns WHERE table_name = 'BuildingRiser'
AND column_name = 'Drain' AND DATA_TYPE = 'NVARCHAR')
BEGIN
ALTER TABLE dbo.BuildingRiser ALTER COLUMN
    Drain DECIMAL(18,2) NOT NULL    

END
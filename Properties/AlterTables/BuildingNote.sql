if not exists( select 1 from sys.all_columns where object_id = object_id('BuildingNote') and (name = 'ImageId' or name = 'ThumbImageId' or name = 'FileName'))
BEGIN
ALTER TABLE dbo.BuildingNote ADD
	  [ImageId]        UNIQUEIDENTIFIER NULL,
    [ThumbImageId]   UNIQUEIDENTIFIER NULL,
    [FileName]       VARCHAR (255)    NULL
END

if not exists( select 1 from sys.all_columns where object_id = object_id('BuildingNote') and (name = 'ImageHeight' or name = 'ImageWidth'))
BEGIN
ALTER TABLE dbo.BuildingNote ADD
    [ImageHeight]         INT              NULL,
    [ImageWidth]          INT              NULL
END

if exists( select 1 from sys.all_columns where object_id = object_id('BuildingNote') and (name = 'Height' or name = 'Width'))
BEGIN
	ALTER TABLE dbo.BuildingNote Drop Column [Height]
	ALTER TABLE dbo.BuildingNote Drop Column [Width]
END

if not exists( select 1 from sys.all_columns where object_id = object_id('BuildingNote') and name in ('CreatedBy','CreatedDate','UpdatedBy','UpdatedDate'))
BEGIN
ALTER TABLE dbo.BuildingNote ADD
	CreatedBy nvarchar(50) NOT NULL,
	CreatedDate datetime NOT NULL,
	UpdatedBy nvarchar(50) NOT NULL,
	UpdatedDate datetime NOT NULL
END
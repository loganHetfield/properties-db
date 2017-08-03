if not exists( select 1 from sys.all_columns where object_id = object_id('PropertyNote') and (name = 'ImageId' or name = 'ThumbImageId' or name = 'FileName'))
BEGIN
ALTER TABLE dbo.PropertyNote ADD
	[ImageId]        UNIQUEIDENTIFIER NULL,
    [ThumbImageId]   UNIQUEIDENTIFIER NULL,
    [FileName]       VARCHAR (255)    NULL
END

if not exists( select 1 from sys.all_columns where object_id = object_id('PropertyNote') and (name = 'ImageHeight' or name = 'ImageWidth'))
BEGIN
ALTER TABLE dbo.PropertyNote ADD
    [ImageHeight]         INT              NULL,
    [ImageWidth]          INT              NULL
END

if exists( select 1 from sys.all_columns where object_id = object_id('PropertyNote') and (name = 'Height' or name = 'Width'))
BEGIN
	ALTER TABLE dbo.PropertyNote Drop Column [Height]
	ALTER TABLE dbo.PropertyNote Drop Column [Width]
END

if not exists( select 1 from sys.all_columns where object_id = object_id('PropertyNote') and name in ('CreatedBy','CreatedDate','UpdatedBy','UpdatedDate'))
BEGIN
ALTER TABLE dbo.PropertyNote ADD
	CreatedBy nvarchar(50) NOT NULL,
	CreatedDate datetime NOT NULL,
	UpdatedBy nvarchar(50) NOT NULL,
	UpdatedDate datetime NOT NULL
END
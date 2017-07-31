if not exists( select 1 from sys.all_columns where object_id = object_id('Property') and (name = 'ImageHeight' or name = 'ImageWidth'))
BEGIN
ALTER TABLE dbo.Property ADD
	[ImageId]        UNIQUEIDENTIFIER NULL,
    [FileName]       VARCHAR (255)    NULL,
    [ImageHeight]    INT              NULL,
    [ImageWidth]     INT              NULL
END

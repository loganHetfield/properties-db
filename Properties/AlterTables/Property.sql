if not exists (select 1 from sys.all_columns where object_id = object_id('Property') and (name = 'ImageHeight' or name = 'ImageWidth'))
BEGIN
ALTER TABLE dbo.Property ADD
	[ImageId]        UNIQUEIDENTIFIER NULL,
    [FileName]       VARCHAR (255)    NULL,
    [ImageHeight]    INT              NULL,
    [ImageWidth]     INT              NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('Property') and (name = 'CommorOrPreviousNames'))
BEGIN
ALTER TABLE dbo.Property ADD
	[CommorOrPreviousNames] [nvarchar](255) NULL,
	[PropertyIdentity] [nvarchar](255) NULL,
	[IsConstructionInProgress] [bit] NULL,
	[ArePlansInReview] [bit] NULL
END

if not exists( select 1 from sys.all_columns where object_id = object_id('Property') and (name = 'StreetPrefix' or name = 'StreetType' or name= 'StreetSuffix' or name = 'State' ))
BEGIN
ALTER TABLE dbo.Property ADD
	[StreetPrefix] [nvarchar](255) NULL,
    [StreetType] [nvarchar](255) NULL,
    [StreetSuffix] [nvarchar](255) NULL,
    [State] [nvarchar](255) NULL
END 


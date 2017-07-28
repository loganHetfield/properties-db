if not exists( select 1 from sys.all_columns where object_id = object_id('Property') and (name = 'StreetPrefix' or name = 'StreetType' or name= 'StreetSuffix' or name = 'State' ))
BEGIN
ALTER TABLE dbo.Property ADD
	[StreetPrefix] [nvarchar](255) NULL,
    [StreetType] [nvarchar](255) NULL,
    [StreetSuffix] [nvarchar](255) NULL,
    [State] [nvarchar](255) NULL
END 



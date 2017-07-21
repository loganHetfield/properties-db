if not exists( select 1 from sys.all_columns where object_id = object_id('PropertySpecialHazard') and (name = 'Width' or name = 'Height'))
BEGIN
ALTER TABLE dbo.PropertySpecialHazard ADD
	Width int NULL,
	Height int NULL
END
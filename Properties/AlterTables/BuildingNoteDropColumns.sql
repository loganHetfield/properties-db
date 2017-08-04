if exists( select 1 from sys.all_columns where object_id = object_id('BuildingNote') and (name = 'Width' or name = 'Height'))
BEGIN
	ALTER TABLE dbo.BuildingNote DROP COLUMN [Height];
	ALTER TABLE dbo.BuildingNote DROP COLUMN [Width]
END
if not exists( select 1 from sys.all_columns where object_id = object_id('Event') and (name = 'EventMessage'))
BEGIN
ALTER TABLE dbo.Event ADD
	[EventMessage] NVARCHAR (1023)
END

if exists( select 1 from sys.all_columns where object_id = object_id('Event') and (name = 'DateTime'))
BEGIN
ALTER TABLE dbo.Event DROP COLUMN
	[DateTime]
END

if not exists( select 1 from sys.all_columns where object_id = object_id('Event') and (name = 'DateTimeUtc'))
BEGIN
ALTER TABLE dbo.Event ADD
	[DateTimeUtc] DateTime
END

if exists( select 1 from sys.all_columns where object_id = object_id('Event') and (name = 'BuldingId'))
BEGIN
EXEC sp_rename 'dbo.Event.BuldingId', 'BuildingId', 'Column';
END

if exists( select 1 from sys.all_columns where object_id = object_id('Event') and (name = 'OccuapntId'))
BEGIN
EXEC sp_rename 'dbo.Event.OccuapntId', 'OccupantId', 'Column';
END
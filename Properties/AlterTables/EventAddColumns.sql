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
DELETE dbo.Event

ALTER TABLE dbo.Event DROP COLUMN
	[BuldingId]
END

if not exists( select 1 from sys.all_columns where object_id = object_id('Event') and (name = 'BuildingId'))
BEGIN
ALTER TABLE dbo.Event ADD
	[BuildingId] DateTime
END
if exists (select 1 from sys.all_columns where object_id = object_id('BuildingExtinguisherSystem') and name = 'ExtinguishingSystem')
BEGIN
	EXECUTE sp_rename '[dbo].[BuildingExtinguisherSystem].[ExtinguishingSystem]', 'ExtinguishingSystemId', 'Column'
END

if exists (select 1 from sys.all_columns where object_id = object_id('BuildingExtinguisherSystem') and name = 'TestType')
BEGIN
	EXECUTE sp_rename '[dbo].[BuildingExtinguisherSystem].[TestType]', 'TestTypeId', 'Column'
END

if not exists (select 1 from sys.all_columns where object_id = object_id('BuildingExtinguisherSystem') and name = 'ExtinguisherServiceDate')
BEGIN
ALTER TABLE [dbo].BuildingExtinguisherSystem Add 
	[ExtinguisherServiceDate] DATE NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('BuildingExtinguisherSystem') and name in ('ImageId', 'ThumbImageId', 'FileName', 'Width', 'Height'))
BEGIN
ALTER TABLE dbo.BuildingExtinguisherSystem ADD
    [ImageId]        UNIQUEIDENTIFIER NULL,
    [ThumbImageId]   UNIQUEIDENTIFIER NULL,
    [FileName]       VARCHAR (255)    NULL,
    [Width]          INT              NULL,
    [Height]         INT              NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'TotalValue')
BEGIN
ALTER TABLE [dbo].[Building] Add 
	[TotalValue] INT NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('BuildingExtinguisherSystem') and (name = 'ImageHeight' or name = 'ImageWidth'))
BEGIN
ALTER TABLE dbo.BuildingExtinguisherSystem ADD
    [ImageHeight]         INT              NULL,
    [ImageWidth]          INT              NULL
END

if exists (select 1 from sys.all_columns where object_id = object_id('BuildingExtinguisherSystem') and (name = 'Height' or name = 'Width'))
BEGIN
    ALTER TABLE dbo.BuildingExtinguisherSystem Drop Column [Height]
    ALTER TABLE dbo.BuildingExtinguisherSystem Drop Column [Width]
END
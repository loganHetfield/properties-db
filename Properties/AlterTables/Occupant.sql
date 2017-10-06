if not exists (select 1 from sys.all_columns where object_id = object_id('Occupant') and name = 'DeactivationReason')
BEGIN
	ALTER TABLE [dbo].[Occupant] Add [DeactivationReason] NVARCHAR (1023) NULL
END 

IF EXISTS (SELECT 1 from sys.indexes WHERE name = 'IX_Occupant_UniqueOccupantSuiteForBuilding' and is_unique = 1)   
   DROP INDEX [IX_Occupant_UniqueOccupantSuiteForBuilding] ON [dbo].[Occupant];   
   CREATE NONCLUSTERED INDEX [IX_Occupant_UniqueOccupantSuiteForBuilding] ON [dbo].[Occupant]([BuildingId] ASC, [OccupantName] ASC, [SuiteUnitLocation] ASC);
GO  

if not exists( select 1 from sys.all_columns where object_id = object_id('Occupant') and (name = 'BuildingNameNumber' or name = 'SuiteNameNumber'))
BEGIN
ALTER TABLE dbo.[Occupant] ADD
    [BuildingNameNumber] NVARCHAR (255) NULL,
	[SuiteNameNumber] NVARCHAR (255) NULL
END

if not exists( select 1 from sys.all_columns where object_id = object_id('Occupant') and (name = 'HasRestrainedOccupants'))
BEGIN
ALTER TABLE dbo.[Occupant] ADD
    [HasRestrainedOccupants] bit NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('Occupant') and name = 'Notes')
BEGIN
ALTER TABLE [dbo].[Occupant] Add 
	 [Notes]                              NVARCHAR (255)     NULL
END   

if exists (select 1 from sys.all_columns where object_id = object_id('Occupant') and name = 'FireDoorsPresent' )
BEGIN
ALTER TABLE [dbo].[Occupant] DROP COLUMN [FireDoorsPresent]
END
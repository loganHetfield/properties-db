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
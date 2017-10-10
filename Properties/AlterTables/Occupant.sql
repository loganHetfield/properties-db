if not exists (select 1 from sys.all_columns where object_id = object_id('Occupant') and name = 'DeactivationReason')
BEGIN
	ALTER TABLE [dbo].[Occupant] Add [DeactivationReason] NVARCHAR (1023) NULL
END 

IF EXISTS (SELECT 1 from sys.indexes WHERE name = 'IX_Occupant_UniqueOccupantSuiteForBuilding' and is_unique = 1)   
   DROP INDEX [IX_Occupant_UniqueOccupantSuiteForBuilding] ON [dbo].[Occupant];   
GO  

IF EXISTS (SELECT 1 from sys.indexes WHERE name = 'IX_Occupant_UniqueOccupantSuiteForBuilding' and is_unique = 1)   
   CREATE NONCLUSTERED INDEX [IX_Occupant_UniqueOccupantSuiteForBuilding] ON [dbo].[Occupant]([BuildingId] ASC, [OccupantName] ASC, [SuiteUnitLocation] ASC);
GO  

if not exists( select 1 from sys.all_columns where object_id = object_id('Occupant') and (name = 'BuildingNameNumber' or name = 'SuiteNameNumber'))
BEGIN
ALTER TABLE [dbo].[Occupant] ADD
    [BuildingNameNumber] NVARCHAR (255) NULL,
	[SuiteNameNumber] NVARCHAR (255) NULL
END

if not exists( select 1 from sys.all_columns where object_id = object_id('Occupant') and (name = 'HasRestrainedOccupants'))
BEGIN
ALTER TABLE [dbo].[Occupant] ADD
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

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Occupant') AND NAME = 'BuildingNameNumber')
BEGIN
    ALTER TABLE [dbo].[Occupant] DROP COLUMN [BuildingNameNumber]
END

IF EXISTS (SELECT column_name 'Column Name', data_type 'Data Type' FROM information_schema.columns WHERE table_name = 'Occupant'
AND column_name = 'ContentValue' AND DATA_TYPE = 'decimal')
BEGIN
    ALTER TABLE [dbo].[Occupant] ALTER COLUMN [ContentValue] BIGINT NULL
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'EmergencyIncidentPlayPresent')
BEGIN
    EXEC SP_RENAME 'Occupant.EmergencyIncidentPlayPresent' , 'HasEmergencyIncidentPlan', 'COLUMN'
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'FileName')
BEGIN
		ALTER TABLE [dbo].[Occupant] ADD [FileName] NVARCHAR(255) NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'ImageHeight')
BEGIN
		ALTER TABLE [dbo].[Occupant] ADD [ImageHeight] INT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'ImageId')
BEGIN
		ALTER TABLE [dbo].[Occupant] ADD [ImageId] UNIQUEIDENTIFIER NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'ImageWidth')
BEGIN
		ALTER TABLE [dbo].[Occupant] ADD [ImageWidth] INT NULL
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'FireDoorsType')
BEGIN
    EXEC SP_RENAME 'Occupant.FireDoorsType' , 'FireDoorsTypeId', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'FireLoad')
BEGIN
    EXEC SP_RENAME 'Occupant.FireLoad' , 'FireLoadId', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'FireWalls')
BEGIN
    EXEC SP_RENAME 'Occupant.FireWalls' , 'FireWallsId', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'InteriorDoorsType')
BEGIN
    EXEC SP_RENAME 'Occupant.InteriorDoorsType' , 'InteriorDoorsTypeId', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'InteriorWallsType')
BEGIN
    EXEC SP_RENAME 'Occupant.InteriorWallsType' , 'InteriorWallsTypeId', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'LocalOccCode')
BEGIN
    EXEC SP_RENAME 'Occupant.LocalOccCode' , 'LocalOccCodeId', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'MixedUse')
BEGIN
    EXEC SP_RENAME 'Occupant.MixedUse' , 'MixedUseId', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'NFPAOccCode')
BEGIN
    EXEC SP_RENAME 'Occupant.NFPAOccCode' , 'NFPAOccCodeId', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'NFPAUseCode')
BEGIN
    EXEC SP_RENAME 'Occupant.NFPAUseCode' , 'NFPAUseCodeId', 'COLUMN'
END

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Occupant') AND NAME = 'Notes')
BEGIN
    ALTER TABLE [dbo].[Occupant] DROP COLUMN [Notes]
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'OccupancyClassicfication')
BEGIN
    EXEC SP_RENAME 'Occupant.OccupancyClassicfication' , 'OccupancyClassificationId', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'OccupancyEndDate')
BEGIN
    EXEC SP_RENAME 'Occupant.OccupancyEndDate' , 'EndDate', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'OccupancyLoadByHours1700To2300')
BEGIN
    EXEC SP_RENAME 'Occupant.OccupancyLoadByHours1700To2300' , 'Load1700To2300', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'OccupancyLoadByHours2300To800')
BEGIN
    EXEC SP_RENAME 'Occupant.OccupancyLoadByHours2300To800' , 'Load2300To0800', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'OccupancyLoadByHours800To1700')
BEGIN
    EXEC SP_RENAME 'Occupant.OccupancyLoadByHours800To1700' , 'Load0800To1700', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'OccupancyLoadRated')
BEGIN
    EXEC SP_RENAME 'Occupant.OccupancyLoadRated' , 'LoadRated', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'OccupancyPermitRequired')
BEGIN
    EXEC SP_RENAME 'Occupant.OccupancyPermitRequired' , 'IsOccupancyPermitRequired', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'OccupancyStartDate')
BEGIN
    EXEC SP_RENAME 'Occupant.OccupancyStartDate' , 'StartDate', 'COLUMN'
END

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Occupant') AND NAME = 'OccupantsNonAmbulatoryOrRestrained')
BEGIN
    ALTER TABLE [dbo].[Occupant] DROP COLUMN [OccupantsNonAmbulatoryOrRestrained]
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'OccupantsUse')
BEGIN
    EXEC SP_RENAME 'Occupant.OccupantsUse' , 'OccupantsUseId', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'SecurityType')
BEGIN
    EXEC SP_RENAME 'Occupant.SecurityType' , 'SecurityTypeId', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'StandardIndustrialClassification')
BEGIN
    EXEC SP_RENAME 'Occupant.StandardIndustrialClassification' , 'StandardIndustrialClassificationId', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'StateOccCode')
BEGIN
    EXEC SP_RENAME 'Occupant.StateOccCode' , 'StateOccCodeId', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'Status')
BEGIN
    EXEC SP_RENAME 'Occupant.Status' , 'StatusId', 'COLUMN'
END

IF (COL_LENGTH('Occupant', 'SuiteNameNumber') = 510)
BEGIN
   ALTER TABLE [dbo].[Occupant] ALTER COLUMN [SuiteNameNumber] NVARCHAR(50) NULL
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'Type')
BEGIN
    EXEC SP_RENAME 'Occupant.Type' , 'TypeId', 'COLUMN'
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'SideAExits')
BEGIN
		ALTER TABLE [dbo].[Occupant] ADD [SideAExits] SMALLINT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'SideBExits')
BEGIN
		ALTER TABLE [dbo].[Occupant] ADD [SideBExits] SMALLINT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'SideCExits')
BEGIN
		ALTER TABLE [dbo].[Occupant] ADD [SideCExits] SMALLINT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'Occupant' AND column_name = 'SideDExits')
BEGIN
		ALTER TABLE [dbo].[Occupant] ADD [SideDExits] SMALLINT NULL
END
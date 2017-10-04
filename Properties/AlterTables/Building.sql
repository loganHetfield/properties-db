if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'AtticUse' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[AtticUse]', 'AtticUseId', 'Column' 
END

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'AvailableFlow')
BEGIN
ALTER TABLE [dbo].[Building] Add [AvailableFlow] INT NULL
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'BasementUse' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[BasementUse]', 'BasementUseId', 'Column' 
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'BelowGradeConstructionType' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[BelowGradeConstructionType]', 'BelowGradeConstructionId', 'Column' 
END

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'BuildingValue')
BEGIN
ALTER TABLE [dbo].[Building] Add [BuildingValue] INT NULL
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'ConstructionType' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[ConstructionType]', 'ConstructionTypeId', 'Column' 
END 

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'DeactivationReason')
BEGIN
ALTER TABLE [dbo].[Building] Add [DeactivationReason] NVARCHAR (100) NULL
END 

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'ExteriorDoorsType' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[ExteriorDoorsType]', 'ExteriorDoorsId', 'Column' 
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'ExteriorWallsType' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[ExteriorWallsType]', 'ExteriorWallsId', 'Column' 
END

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'FileName')
BEGIN
ALTER TABLE [dbo].[Building] Add [FileName] NVARCHAR (255) NULL
END 

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'FireDoorsPresent' )
BEGIN
ALTER TABLE [dbo].[Building] DROP COLUMN [FireDoorsPresent]
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'FireDoorsType' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[FireDoorsType]', 'FireDoorsId', 'Column' 
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'FireLoad' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[FireLoad]', 'FireLoadId', 'Column' 
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'FireWalls' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[FireWalls]', 'FireWallsId', 'Column' 
END 

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'FireWallsLocation' )
BEGIN
ALTER TABLE [dbo].[Building] Add [FireWallsLocation] NVARCHAR (255) NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'ImageHeight')
BEGIN
ALTER TABLE [dbo].[Building] Add [ImageHeight] INT NULL
END  

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'ImageId')
BEGIN
ALTER TABLE [dbo].[Building] Add [ImageId] UNIQUEIDENTIFIER NULL
END  

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'ImageWidth')
BEGIN
ALTER TABLE [dbo].[Building] Add [ImageWidth] INT NULL
END  

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'InteriorDoorsType' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[InteriorDoorsType]', 'InteriorDoorsId', 'Column' 
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'InteriorWallsType' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[InteriorWallsType]', 'InteriorWallsId', 'Column' 
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'IsoConstructionCode' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[IsoConstructionCode]', 'IsoConstructionCodeId', 'Column' 
END

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'Latitude')
BEGIN
ALTER TABLE [dbo].[Building] Add [Latitude] DECIMAL (9, 6) NULL
END  

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'Longitude')
BEGIN
ALTER TABLE [dbo].[Building] Add [Longitude] DECIMAL (9, 6) NULL
END  

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'NetFireFlow')
BEGIN
ALTER TABLE [dbo].[Building] Add [NetFireFlow] INT NULL
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'MainFloorConstructionType' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[MainFloorConstructionType]', 'MainFloorConstructionId', 'Column' 
END

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'Notes')
BEGIN
ALTER TABLE [dbo].[Building] Add [Notes] NVARCHAR (255) NULL
END  

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'RoofMaterialId' )
BEGIN
ALTER TABLE [dbo].[Building] Add [RoofMaterialId] INT NULL
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'RoofType' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[RoofType]', 'RoofTypeId', 'Column' 
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'Status')
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[Status]', 'StatusId', 'Column'
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'Stock' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[Stock]', 'StockId', 'Column' 
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'TestHydrantId' and system_type_id = 56)
BEGIN
ALTER TABLE [dbo].[Building] ALTER COLUMN [TestHydrantId] NVARCHAR (255) NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'TestHydrantId')
BEGIN
ALTER TABLE [dbo].[Building] Add [TestHydrantId] NVARCHAR (255) NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'TotalFireFlowNeeded')
BEGIN
ALTER TABLE [dbo].[Building] Add [TotalFireFlowNeeded] INT NULL
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'TotalValue')
BEGIN
ALTER TABLE [dbo].[Building] DROP COLUMN [TotalValue]
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'UpperFloorConstructionType' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[UpperFloorConstructionType]', 'UpperFloorConstructionId', 'Column' 
END


if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'Latitude')
BEGIN
ALTER TABLE [dbo].[Building] DROP COLUMN [Latitude]
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'Longitude')
BEGIN
ALTER TABLE [dbo].[Building] DROP COLUMN [Longitude]
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'EightAlarm' )
BEGIN
    EXECUTE sp_rename '[dbo].[Building].[EightAlarm]', 'EighthAlarm', 'Column'
END
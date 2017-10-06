IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'AtticUse' )
BEGIN
    EXECUTE sp_rename '[dbo].[Building].[AtticUse]', 'AtticUseId', 'Column' 
END

IF NOT EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'AvailableFlow')
BEGIN
    ALTER TABLE [dbo].[Building] Add [AvailableFlow] INT NULL
END

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'BasementUse' )
BEGIN
    EXECUTE sp_rename '[dbo].[Building].[BasementUse]', 'BasementUseId', 'Column' 
END

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'BelowGradeConstructionType' )
BEGIN
    EXECUTE sp_rename '[dbo].[Building].[BelowGradeConstructionType]', 'BelowGradeConstructionId', 'Column' 
END

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'BuildingValue' AND system_type_id = 56)
BEGIN
    ALTER TABLE [dbo].[Building] ALTER COLUMN [BuildingValue] BIGINT NULL
END

IF NOT EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'BuildingValue')
BEGIN
    ALTER TABLE [dbo].[Building] Add [BuildingValue] INT NULL
END

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'ConstructionType' )
BEGIN
    EXECUTE sp_rename '[dbo].[Building].[ConstructionType]', 'ConstructionTypeId', 'Column' 
END 

IF NOT EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'DeactivationReason')
BEGIN
    ALTER TABLE [dbo].[Building] Add [DeactivationReason] NVARCHAR (100) NULL
END 

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'ExteriorDoorsType' )
BEGIN
    EXECUTE sp_rename '[dbo].[Building].[ExteriorDoorsType]', 'ExteriorDoorsId', 'Column' 
END

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'ExteriorWallsType' )
BEGIN
    EXECUTE sp_rename '[dbo].[Building].[ExteriorWallsType]', 'ExteriorWallsId', 'Column' 
END

IF NOT EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'FileName')
BEGIN
    ALTER TABLE [dbo].[Building] Add [FileName] NVARCHAR (255) NULL
END 

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'FireDoorsPresent' )
BEGIN
    ALTER TABLE [dbo].[Building] DROP COLUMN [FireDoorsPresent]
END

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'FireDoorsType' )
BEGIN
    EXECUTE sp_rename '[dbo].[Building].[FireDoorsType]', 'FireDoorsId', 'Column' 
END

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'FireLoad' )
BEGIN
    EXECUTE sp_rename '[dbo].[Building].[FireLoad]', 'FireLoadId', 'Column' 
END

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'FireWalls' )
BEGIN
    EXECUTE sp_rename '[dbo].[Building].[FireWalls]', 'FireWallsId', 'Column' 
END 

IF NOT EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'FireWallsLocation' )
BEGIN
    ALTER TABLE [dbo].[Building] Add [FireWallsLocation] NVARCHAR (255) NULL
END

IF NOT EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'ImageHeight')
BEGIN
    ALTER TABLE [dbo].[Building] Add [ImageHeight] INT NULL
END  

IF NOT EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'ImageId')
BEGIN
    ALTER TABLE [dbo].[Building] Add [ImageId] UNIQUEIDENTIFIER NULL
END  

IF NOT EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'ImageWidth')
BEGIN
    ALTER TABLE [dbo].[Building] Add [ImageWidth] INT NULL
END  

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'InteriorDoorsType' )
BEGIN
    EXECUTE sp_rename '[dbo].[Building].[InteriorDoorsType]', 'InteriorDoorsId', 'Column' 
END

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'InteriorWallsType' )
BEGIN
    EXECUTE sp_rename '[dbo].[Building].[InteriorWallsType]', 'InteriorWallsId', 'Column' 
END

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'IsoConstructionCode' )
BEGIN
    EXECUTE sp_rename '[dbo].[Building].[IsoConstructionCode]', 'IsoConstructionCodeId', 'Column' 
END

IF NOT EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'Latitude')
BEGIN
    ALTER TABLE [dbo].[Building] Add [Latitude] DECIMAL (9, 6) NULL
END  

IF NOT EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'Longitude')
BEGIN
   ALTER TABLE [dbo].[Building] Add [Longitude] DECIMAL (9, 6) NULL
END  

IF NOT EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'NetFireFlow')
BEGIN
    ALTER TABLE [dbo].[Building] Add [NetFireFlow] INT NULL
END

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'MainFloorConstructionType' )
BEGIN
   EXECUTE sp_rename '[dbo].[Building].[MainFloorConstructionType]', 'MainFloorConstructionId', 'Column' 
END

IF NOT EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'Notes')
BEGIN
    ALTER TABLE [dbo].[Building] Add [Notes] NVARCHAR (255) NULL
END  

IF NOT EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'RoofMaterialId' )
BEGIN
    ALTER TABLE [dbo].[Building] Add [RoofMaterialId] INT NULL
END

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'RoofType' )
BEGIN
    EXECUTE sp_rename '[dbo].[Building].[RoofType]', 'RoofTypeId', 'Column' 
END

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'Status')
BEGIN
    EXECUTE sp_rename '[dbo].[Building].[Status]', 'StatusId', 'Column'
END

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'Stock' )
BEGIN
    EXECUTE sp_rename '[dbo].[Building].[Stock]', 'StockId', 'Column' 
END

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'TestHydrantId' AND system_type_id = 56)
BEGIN
    ALTER TABLE [dbo].[Building] ALTER COLUMN [TestHydrantId] NVARCHAR (255) NULL
END

IF NOT EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'TestHydrantId')
BEGIN
    ALTER TABLE [dbo].[Building] Add [TestHydrantId] NVARCHAR (255) NULL
END

IF NOT EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'TotalFireFlowNeeded')
BEGIN
    ALTER TABLE [dbo].[Building] Add [TotalFireFlowNeeded] INT NULL
END

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'TotalValue')
BEGIN
    ALTER TABLE [dbo].[Building] DROP COLUMN [TotalValue]
END

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'UpperFloorConstructionType' )
BEGIN
    EXECUTE sp_rename '[dbo].[Building].[UpperFloorConstructionType]', 'UpperFloorConstructionId', 'Column' 
END

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'Latitude')
BEGIN
ALTER TABLE [dbo].[Building] DROP COLUMN [Latitude]
END

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'Longitude')
BEGIN
    ALTER TABLE [dbo].[Building] DROP COLUMN [Longitude]
END

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'EightAlarm' )
BEGIN
    EXECUTE sp_rename '[dbo].[Building].[EightAlarm]', 'EighthAlarm', 'Column'
END

IF EXISTS (SELECT 1 FROM sys.all_columns WHERE object_id = object_id('Building') AND NAME = 'NameOrNumber')
BEGIN
	  DROP INDEX Building.IX_Unique_Building_Name
    ALTER TABLE [dbo].[Building] ALTER COLUMN [NameOrNumber] NVARCHAR(50) NOT NULL
    CREATE INDEX IX_Unique_Building_Name ON Building(NameOrNumber)
END
if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'ImageId')
BEGIN
ALTER TABLE [dbo].[Building] Add 
	[ImageId]						  UNIQUEIDENTIFIER NULL,
    [FileName]						  NVARCHAR (255)    NULL,
    [ImageHeight]					  INT              NULL,
    [ImageWidth]					  INT              NULL
END  

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'Notes')
BEGIN
ALTER TABLE [dbo].[Building] Add 
	 [Notes]                              NVARCHAR (255)     NULL
END   

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'Latitude')
BEGIN
ALTER TABLE [dbo].[Building] Add 
	[Latitude]                        DECIMAL (9, 6)     NULL,
    [Longitude]                       DECIMAL (9, 6)     NULL
END  

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'AvailableFlow')
BEGIN
ALTER TABLE [dbo].[Building] Add 
	[AvailableFlow] INT NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'NetFireFlow')
BEGIN
ALTER TABLE [dbo].[Building] Add 
	[NetFireFlow] INT NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'TotalFireFlowNeeded')
BEGIN
ALTER TABLE [dbo].[Building] Add 
	[TotalFireFlowNeeded] INT NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'TestHydrantId')
BEGIN
ALTER TABLE [dbo].[Building] Add 
	[TestHydrantId] INT NULL
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'Status')
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[Status]', 'StatusId', 'Column'
END

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'TotalValue')
BEGIN
ALTER TABLE [dbo].[Building] Add 
	[TotalValue] INT NULL
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'ConstructionType' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[ConstructionType]', 'ConstructionTypeId', 'Column' 
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'IsoConstructionCode' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[IsoConstructionCode]', 'IsoConstructionCodeId', 'Column' 
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'RoofType' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[RoofType]', 'RoofTypeId', 'Column' 
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'FireWalls' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[FireWalls]', 'FireWallsId', 'Column' 
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'ExteriorWallsType' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[ExteriorWallsType]', 'ExteriorWallsId', 'Column' 
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'ExteriorDoorsType' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[ExteriorDoorsType]', 'ExteriorDoorsId', 'Column' 
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'InteriorWallsType' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[InteriorWallsType]', 'InteriorWallsId', 'Column' 
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'InteriorDoorsType' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[InteriorDoorsType]', 'InteriorDoorsId', 'Column' 
END

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'RoofMaterialId' )
BEGIN
ALTER TABLE [dbo].[Building] Add 
	[RoofMaterialId] INT NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'FireWallsLocation' )
BEGIN
ALTER TABLE [dbo].[Building] Add 
	[FireWallsLocation] NVARCHAR (255) NULL
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'FireDoorsType' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[FireDoorsType]', 'FireDoorsId', 'Column' 
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'FireLoad' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[FireLoad]', 'FireLoadId', 'Column' 
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'Stock' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[Stock]', 'StockId', 'Column' 
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'BasementUse' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[BasementUse]', 'BasementUseId', 'Column' 
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'AtticUse' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[AtticUse]', 'AtticUseId', 'Column' 
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'MainFloorConstructionType' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[MainFloorConstructionType]', 'MainFloorConstructionId', 'Column' 
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'UpperFloorConstructionType' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[UpperFloorConstructionType]', 'UpperFloorConstructionId', 'Column' 
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'BelowGradeConstructionType' )
BEGIN
	EXECUTE sp_rename '[dbo].[Building].[BelowGradeConstructionType]', 'BelowGradeConstructionId', 'Column' 
END

if exists (SELECT * 
FROM sys.indexes 
WHERE name='IX_Unique_Building_Name' AND object_id = OBJECT_ID('dbo.Building'))
BEGIN
	DROP Index IX_Unique_Building_Name on Building
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'Name' )
BEGIN
ALTER TABLE dbo.Building Drop Column 
	Name
END

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'NameOrNumber' )
BEGIN
ALTER TABLE dbo.Building Add 
	NameOrNumber nvarchar(50) not NULL
END

if not exists (SELECT * 
FROM sys.indexes 
WHERE name='IX_Unique_Building_NameOrNumber' AND object_id = OBJECT_ID('dbo.Building'))
BEGIN
	CREATE UNIQUE NONCLUSTERED INDEX IX_Unique_Building_NameOrNumber ON dbo.Building
	(
	PropertyId,
	NameOrNumber
	) WITH (sTATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
END

-- FIfthAlarm

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'FIfthAlarm' )
BEGIN
ALTER TABLE dbo.Building Drop Column 
	FIfthAlarm
END

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'FifthAlarm' )
BEGIN
ALTER TABLE dbo.Building Add 
	FifthAlarm nvarchar(255) NULL
END

-- EigthAlarm

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'EigthAlarm' )
BEGIN
ALTER TABLE dbo.Building Drop Column 
	EigthAlarm
END

if not exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'EighthAlarm' )
BEGIN
ALTER TABLE dbo.Building Add 
	EighthAlarm nvarchar(255) NULL
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'EndDate' and TYPE_NAME(system_type_id) = 'date') 
AND exists (select * from sys.objects where name = 'FK_Building_Property')
BEGIN
ALTER TABLE dbo.Building
	DROP CONSTRAINT DF_Building_IsDeleted
END

if exists (select 1 from sys.all_columns where object_id = object_id('Building') and name = 'EndDate' and TYPE_NAME(system_type_id) = 'date')
BEGIN
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON

ALTER TABLE dbo.Property SET (LOCK_ESCALATION = TABLE)

CREATE TABLE dbo.Tmp_Building
	(
	BuildingId uniqueidentifier not NULL,
	PropertyId uniqueidentifier not NULL,
	Status int NULL,
	StartDate datetime not NULL,
	EndDate datetime NULL,
	Length int NULL,
	Width int NULL,
	Height int NULL,
	TotalSquareFeet int NULL,
	TotalExits int NULL,
	InteriorWallsType int NULL,
	InteriorDoorsType int NULL,
	FireDoorsPresent bit NULL,
	FireDoorsType int NULL,
	FireLoad int NULL,
	FireWalls int NULL,
	UniqueOrSpecialFeatures nvarchar(255) NULL,
	NumberOfStoriesAboveGrade int NULL,
	NumberOfStoriesBelowGrade int NULL,
	NumberOfRoomsOrUnits int NULL,
	BaseSquareFootage int NULL,
	SideAExits int NULL,
	SideBExits int NULL,
	SideCExits int NULL,
	SideDExits int NULL,
	ConstructionType int NULL,
	IsoConstructionCode int NULL,
	HeatingSystemsPresent bit NULL,
	AirConditioningPresent bit NULL,
	RoofType int NULL,
	MainFloorConstructionType int NULL,
	UpperFloorConstructionType int NULL,
	BelowGradeConstructionType int NULL,
	ExteriorWallsType int NULL,
	ExteriorDoorsType int NULL,
	Stock int NULL,
	BasementUse int NULL,
	AtticUse int NULL,
	ExtinguisherMonitoringCompany nvarchar(50) NULL,
	ExtinguisherMonitoringCompanyPhone nvarchar(50) NULL,
	AlarmsMonitoringCompany nvarchar(50) NULL,
	AlarmsMonitoringCompanyPhone nvarchar(50) NULL,
	CoefficientForConstructionType decimal(18, 10) NULL,
	ConstructionTypeClass int NULL,
	BaseArea int NULL,
	Stories int NULL,
	BaseFlow int NULL,
	OccupancyFactor int NULL,
	SprinklerFactor int NULL,
	ExposureCommFactor int NULL,
	RequiredFireFlowAt25Percent decimal(18, 10) NULL,
	RequiredFireFlowAt50Percent decimal(18, 10) NULL,
	RequiredFireFlowAt75Percent decimal(18, 10) NULL,
	RequiredFireFlowAt100Percent decimal(18, 10) NULL,
	FirstAlarm nvarchar(255) NULL,
	SecondAlarm nvarchar(255) NULL,
	ThirdAlarm nvarchar(255) NULL,
	FourthAlarm nvarchar(255) NULL,
	SixthAlarm nvarchar(255) NULL,
	SeventhAlarm nvarchar(255) NULL,
	StagingAreas nvarchar(255) NULL,
	Exposures nvarchar(255) NULL,
	RequiredPersonnelAt25Percent nvarchar(255) NULL,
	RequiredPersonnelAt50Percent nvarchar(255) NULL,
	RequiredPersonnelAt75Percent nvarchar(255) NULL,
	RequiredPersonnelAt100Percent nvarchar(255) NULL,
	RequiredEquipmentAt25Percent nvarchar(255) NULL,
	RequiredEquipmentAt50Percent nvarchar(255) NULL,
	RequiredEquipmentAt75Percent nvarchar(255) NULL,
	RequiredEquipmentAt100Percent nvarchar(255) NULL,
	SearchAt25Percent nvarchar(255) NULL,
	SearchAt50Percent nvarchar(255) NULL,
	SearchAt75Percent nvarchar(255) NULL,
	SearchAt100Percent nvarchar(255) NULL,
	Notes nvarchar(255) NULL,
	RowVersion timestamp not NULL,
	IsDeleted bit not NULL,
	CreatedBy nvarchar(50) not NULL,
	CreatedDate datetimeoffset(7) not NULL,
	UpdatedBy nvarchar(50) not NULL,
	UpdatedDate datetimeoffset(7) not NULL,
	NameOrNumber nvarchar(50) not NULL,
	EighthAlarm nvarchar(255) NULL,
	FifthAlarm nvarchar(255) NULL
	)  ON [PRIMARY]

ALTER TABLE dbo.Tmp_Building SET (LOCK_ESCALATION = TABLE)

ALTER TABLE dbo.Tmp_Building ADD CONSTRAINT
	DF_Building_IsDeleted DEFAULT ((0)) FOR IsDeleted

IF EXISTS(SELECT * FROM dbo.Building)
	 EXEC('INSERT INTO dbo.Tmp_Building (BuildingId, PropertyId, Status, StartDate, EndDate, Length, Width, Height, TotalSquareFeet, TotalExits, InteriorWallsType, InteriorDoorsType, FireDoorsPresent, FireDoorsType, FireLoad, FireWalls, UniqueOrSpecialFeatures, NumberOfStoriesAboveGrade, NumberOfStoriesBelowGrade, NumberOfRoomsOrUnits, BaseSquareFootage, SideAExits, SideBExits, SideCExits, SideDExits, ConstructionType, IsoConstructionCode, HeatingSystemsPresent, AirConditioningPresent, RoofType, MainFloorConstructionType, UpperFloorConstructionType, BelowGradeConstructionType, ExteriorWallsType, ExteriorDoorsType, Stock, BasementUse, AtticUse, ExtinguisherMonitoringCompany, ExtinguisherMonitoringCompanyPhone, AlarmsMonitoringCompany, AlarmsMonitoringCompanyPhone, CoefficientForConstructionType, ConstructionTypeClass, BaseArea, Stories, BaseFlow, OccupancyFactor, SprinklerFactor, ExposureCommFactor, RequiredFireFlowAt25Percent, RequiredFireFlowAt50Percent, RequiredFireFlowAt75Percent, RequiredFireFlowAt100Percent, FirstAlarm, SecondAlarm, ThirdAlarm, FourthAlarm, SixthAlarm, SeventhAlarm, StagingAreas, Exposures, RequiredPersonnelAt25Percent, RequiredPersonnelAt50Percent, RequiredPersonnelAt75Percent, RequiredPersonnelAt100Percent, RequiredEquipmentAt25Percent, RequiredEquipmentAt50Percent, RequiredEquipmentAt75Percent, RequiredEquipmentAt100Percent, SearchAt25Percent, SearchAt50Percent, SearchAt75Percent, SearchAt100Percent, Notes, IsDeleted, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate, NameOrNumber, EighthAlarm, FifthAlarm)
		SELECT BuildingId, PropertyId, Status, StartDate, CONVERT(datetime, EndDate), Length, Width, Height, TotalSquareFeet, TotalExits, InteriorWallsType, InteriorDoorsType, FireDoorsPresent, FireDoorsType, FireLoad, FireWalls, UniqueOrSpecialFeatures, NumberOfStoriesAboveGrade, NumberOfStoriesBelowGrade, NumberOfRoomsOrUnits, BaseSquareFootage, SideAExits, SideBExits, SideCExits, SideDExits, ConstructionType, IsoConstructionCode, HeatingSystemsPresent, AirConditioningPresent, RoofType, MainFloorConstructionType, UpperFloorConstructionType, BelowGradeConstructionType, ExteriorWallsType, ExteriorDoorsType, Stock, BasementUse, AtticUse, ExtinguisherMonitoringCompany, ExtinguisherMonitoringCompanyPhone, AlarmsMonitoringCompany, AlarmsMonitoringCompanyPhone, CoefficientForConstructionType, ConstructionTypeClass, BaseArea, Stories, BaseFlow, OccupancyFactor, SprinklerFactor, ExposureCommFactor, RequiredFireFlowAt25Percent, RequiredFireFlowAt50Percent, RequiredFireFlowAt75Percent, RequiredFireFlowAt100Percent, FirstAlarm, SecondAlarm, ThirdAlarm, FourthAlarm, SixthAlarm, SeventhAlarm, StagingAreas, Exposures, RequiredPersonnelAt25Percent, RequiredPersonnelAt50Percent, RequiredPersonnelAt75Percent, RequiredPersonnelAt100Percent, RequiredEquipmentAt25Percent, RequiredEquipmentAt50Percent, RequiredEquipmentAt75Percent, RequiredEquipmentAt100Percent, SearchAt25Percent, SearchAt50Percent, SearchAt75Percent, SearchAt100Percent, Notes, IsDeleted, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate, NameOrNumber, EighthAlarm, FifthAlarm FROM dbo.Building WITH (HOLDLOCK TABLOCKX)')
ALTER TABLE dbo.BuildingNote
	DROP CONSTRAINT FK_BuildingNote_Building
ALTER TABLE dbo.Occupant
	DROP CONSTRAINT FK_Occupant_Building
ALTER TABLE dbo.BuildingAccess
	DROP CONSTRAINT FK_BuildingAccess_Building
ALTER TABLE dbo.BuildingAED
	DROP CONSTRAINT FK_BuildingAED_Building
ALTER TABLE dbo.BuildingAlarm
	DROP CONSTRAINT FK_BuildingAlarm_Building
ALTER TABLE dbo.BuildingDetector
	DROP CONSTRAINT FK_BuildingDetector_Building
ALTER TABLE dbo.BuildingExtinguisherSystem
	DROP CONSTRAINT FK_BuildingExtinguisherSystem_Building
ALTER TABLE dbo.BuildingKnoxBox
	DROP CONSTRAINT FK_BuildingKnoxBox_Building
ALTER TABLE dbo.BuildingRiser
	DROP CONSTRAINT FK_BuildingRiser_Building
ALTER TABLE dbo.BuildingShutOff
	DROP CONSTRAINT FK_BuildingShutOff_Building
ALTER TABLE dbo.BuildingSprinkler
	DROP CONSTRAINT FK_BuildingSprinkler_Building
ALTER TABLE dbo.BuildingStandpipe
	DROP CONSTRAINT FK_BuildingStandpipe_Building
ALTER TABLE dbo.Building
	DROP CONSTRAINT FK_Building_Property
ALTER TABLE dbo.BuildingContact
	DROP CONSTRAINT FK_BuildingContact_Building
DROP INDEX IX_Unique_Building_NameOrNumber ON dbo.Building
		
DROP TABLE dbo.Building
EXECUTE sp_rename N'dbo.Tmp_Building', N'Building', 'OBJECT' 
ALTER TABLE dbo.Building ADD CONSTRAINT
	PK_Building PRIMARY KEY CLUSTERED 
	(
	BuildingId
	) WITH (sTATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

CREATE UNIQUE NONCLUSTERED INDEX IX_Unique_Building_NameOrNumber ON dbo.Building
	(
	PropertyId,
	NameOrNumber
	) WITH (sTATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE dbo.Building ADD CONSTRAINT
	FK_Building_Property FOREIGN KEY
	(
	PropertyId
	) REFERENCES dbo.Property
	(
	PropertyId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 

ALTER TABLE dbo.BuildingStandpipe ADD CONSTRAINT
	FK_BuildingStandpipe_Building FOREIGN KEY
	(
	BuildingId
	) REFERENCES dbo.Building
	(
	BuildingId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
ALTER TABLE dbo.BuildingStandpipe SET (LOCK_ESCALATION = TABLE)
ALTER TABLE dbo.BuildingSprinkler ADD CONSTRAINT
	FK_BuildingSprinkler_Building FOREIGN KEY
	(
	BuildingId
	) REFERENCES dbo.Building
	(
	BuildingId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
ALTER TABLE dbo.BuildingSprinkler SET (LOCK_ESCALATION = TABLE)
ALTER TABLE dbo.BuildingShutOff ADD CONSTRAINT
	FK_BuildingShutOff_Building FOREIGN KEY
	(
	BuildingId
	) REFERENCES dbo.Building
	(
	BuildingId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
ALTER TABLE dbo.BuildingShutOff SET (LOCK_ESCALATION = TABLE)
ALTER TABLE dbo.BuildingRiser ADD CONSTRAINT
	FK_BuildingRiser_Building FOREIGN KEY
	(
	BuildingId
	) REFERENCES dbo.Building
	(
	BuildingId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
ALTER TABLE dbo.BuildingRiser SET (LOCK_ESCALATION = TABLE)
ALTER TABLE dbo.BuildingKnoxBox ADD CONSTRAINT
	FK_BuildingKnoxBox_Building FOREIGN KEY
	(
	BuildingId
	) REFERENCES dbo.Building
	(
	BuildingId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
ALTER TABLE dbo.BuildingKnoxBox SET (LOCK_ESCALATION = TABLE)
ALTER TABLE dbo.BuildingExtinguisherSystem ADD CONSTRAINT
	FK_BuildingExtinguisherSystem_Building FOREIGN KEY
	(
	BuildingId
	) REFERENCES dbo.Building
	(
	BuildingId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
ALTER TABLE dbo.BuildingExtinguisherSystem SET (LOCK_ESCALATION = TABLE)
ALTER TABLE dbo.BuildingDetector ADD CONSTRAINT
	FK_BuildingDetector_Building FOREIGN KEY
	(
	BuildingId
	) REFERENCES dbo.Building
	(
	BuildingId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
ALTER TABLE dbo.BuildingDetector SET (LOCK_ESCALATION = TABLE)
ALTER TABLE dbo.BuildingAlarm ADD CONSTRAINT
	FK_BuildingAlarm_Building FOREIGN KEY
	(
	BuildingId
	) REFERENCES dbo.Building
	(
	BuildingId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
ALTER TABLE dbo.BuildingAlarm SET (LOCK_ESCALATION = TABLE)
ALTER TABLE dbo.BuildingAED ADD CONSTRAINT
	FK_BuildingAED_Building FOREIGN KEY
	(
	BuildingId
	) REFERENCES dbo.Building
	(
	BuildingId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 

ALTER TABLE dbo.BuildingAED SET (LOCK_ESCALATION = TABLE)

ALTER TABLE dbo.BuildingAccess ADD CONSTRAINT
	FK_BuildingAccess_Building FOREIGN KEY
	(
	BuildingId
	) REFERENCES dbo.Building
	(
	BuildingId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
ALTER TABLE dbo.BuildingAccess SET (LOCK_ESCALATION = TABLE)

ALTER TABLE dbo.Occupant ADD CONSTRAINT
	FK_Occupant_Building FOREIGN KEY
	(
	BuildingId
	) REFERENCES dbo.Building
	(
	BuildingId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
ALTER TABLE dbo.Occupant SET (LOCK_ESCALATION = TABLE)
ALTER TABLE dbo.BuildingNote ADD CONSTRAINT
	FK_BuildingNote_Building FOREIGN KEY
	(
	BuildingId
	) REFERENCES dbo.Building
	(
	BuildingId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
ALTER TABLE dbo.BuildingNote SET (LOCK_ESCALATION = TABLE)

END
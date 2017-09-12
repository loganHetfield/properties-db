if not exists( select 1 from sys.all_columns where object_id = object_id('PropertyHydrant') and (name = 'ImageHeight' or name = 'ImageWidth'))
BEGIN
ALTER TABLE dbo.PropertyHydrant ADD
    [FileName]       VARCHAR (255)    NULL,
    [ImageHeight]          INT              NULL,
    [ImageWidth]         INT              NULL
END

if not exists( select 1 from sys.all_columns where object_id = object_id('PropertyHydrant') and (name = 'HydrantId'))
BEGIN
ALTER TABLE dbo.PropertyHydrant ADD
    [HydrantId] VARCHAR (50) NULL
END

if exists( select * from sys.all_columns where object_id = object_id('PropertyHydrant') and name = 'HydrantId' and TYPE_NAME(system_type_id) = 'varchar')
BEGIN
BEGIN TRANSACTION

SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON

ALTER TABLE dbo.PropertyHydrant
	DROP CONSTRAINT FK_PropertyHydrant_Property

ALTER TABLE dbo.Property SET (LOCK_ESCALATION = TABLE)

CREATE TABLE dbo.Tmp_PropertyHydrant
	(
	PropertyHydrantId uniqueidentifier NOT NULL,
	PropertyId uniqueidentifier NOT NULL,
	HydrantLocationDescription nvarchar(50) NULL,
	CrossStreet nvarchar(50) NULL,
	Flow int NULL,
	ImageId uniqueidentifier NULL,
	ThumbImageId uniqueidentifier NULL,
	FileName varchar(255) NULL,
	ImageHeight int NULL,
	ImageWidth int NULL,
	HydrantId nvarchar(50) NULL
	)  ON [PRIMARY]

ALTER TABLE dbo.Tmp_PropertyHydrant SET (LOCK_ESCALATION = TABLE)

IF EXISTS(SELECT * FROM dbo.PropertyHydrant)
	 EXEC('INSERT INTO dbo.Tmp_PropertyHydrant (PropertyHydrantId, PropertyId, HydrantLocationDescription, CrossStreet, Flow, ImageId, ThumbImageId, FileName, ImageHeight, ImageWidth, HydrantId)
		SELECT PropertyHydrantId, PropertyId, HydrantLocationDescription, CrossStreet, Flow, ImageId, ThumbImageId, FileName, ImageHeight, ImageWidth, CONVERT(nvarchar(50), HydrantId) FROM dbo.PropertyHydrant WITH (HOLDLOCK TABLOCKX)')

DROP TABLE dbo.PropertyHydrant

EXECUTE sp_rename N'dbo.Tmp_PropertyHydrant', N'PropertyHydrant', 'OBJECT' 

ALTER TABLE dbo.PropertyHydrant ADD CONSTRAINT
	PK_PropertyHydrant PRIMARY KEY CLUSTERED 
	(
	PropertyHydrantId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


ALTER TABLE dbo.PropertyHydrant ADD CONSTRAINT
	FK_PropertyHydrant_Property FOREIGN KEY
	(
	PropertyId
	) REFERENCES dbo.Property
	(
	PropertyId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 	

COMMIT
END

if not exists (select 1 from sys.all_columns where object_id = object_id('PropertyHydrant') and (name = 'HydrantTypeId'))
BEGIN
ALTER TABLE dbo.PropertyHydrant ADD
    [HydrantTypeId] [int] NULL,
	[IsLocateAtIntersection] [bit] NULL,
	[HydrantDistrictId] [int] NULL,
	[HydrantSectorId] [int] NULL,
	[Distance] [int] NULL,
	[HydrantManufacturerId] [int] NULL,
	[HydrantModelId] [int] NULL,
	[Year] [int] NULL,
	[DateInService] [date] NULL,
	[HydrantStyleIn] [int] NULL,
	[HydrantClassIn] [int] NULL,
	[IsColorCoded] [bit] NULL,
	[HydrantColor] [int] NULL,
	[HasStreetMarker] [bit] NULL,
	[IsStrapped] [bit] NULL,
	[IsOutOfService] [bit] NULL,
	[IsRepairRequired] [bit] NULL,
	[LastFlowTest] [date] NULL,
	[Order] [int] NULL,
	[WaterMainId] [nvarchar](255) NULL,
	[MainDiameter] [int] NULL,
	[PortSize1] [int] NULL,
	[PortSize2] [int] NULL,
	[PortSize3] [int] NULL,
	[PortSize4] [int] NULL,
	[HydrantOwner] [nvarchar](255) NULL,
	[TotalFlowNeeded] [int] NULL,
	[AvailableFlow] [int] NULL,
	[FlowAvailable] [int] NULL,
	[HydrantOwnerPhoneNumber] [nvarchar](50) NULL,
	[OnwerNumberOrMilepost] [nvarchar](50) NULL,
	[OwnerStreetPrefixId] [int] NULL,
	[OwnerStreetPrefix] [nvarchar](255) NULL,
	[OwnerStreetOrHighway] [nvarchar](100) NULL,
	[OwnerStreetTypeId] [int] NULL,
	[OwnerStreetType] [nvarchar](255) NULL,
	[OwnerStreetSuffixId] [int] NULL,
	[OwnerStreetSuffix] [nvarchar](255) NULL,
	[OwnerCity] [nvarchar](255) NULL,
	[OwnerStateId] [int] NULL,
	[OwnerState] [nvarchar](255) NULL,
	[OwnerZip] [nvarchar](50) NULL,
	[OwnerCounty] [nvarchar](255) NULL,
	[NumberOrMilepost] [nvarchar](50) NULL,
	[StreetPrefixId] [int] NULL,
	[StreetPrefix] [nvarchar](255) NULL,
	[StreetOrHighway] [nvarchar](100) NULL,
	[StreetTypeId] [int] NULL,
	[StreetType] [nvarchar](255) NULL,
	[StreetSuffixId] [int] NULL,
	[StreetSuffix] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[StateId] [int] NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](50) NULL,
	[County] [nvarchar](255) NULL
END

if exists( select 1 from sys.all_columns where object_id = object_id('PropertyHydrant') and (name = 'OnwerNumberOrMilepost'))
BEGIN
	EXECUTE sp_rename '[dbo].[PropertyHydrant].[OnwerNumberOrMilepost]', 'OwnerNumberOrMilepost', 'COLUMN' 
END

if exists( select 1 from sys.all_columns where object_id = object_id('PropertyHydrant') and (name = 'Order'))
BEGIN
	ALTER TABLE [dbo].[PropertyHydrant] ALTER COLUMN [Order] [nvarchar](50);  
END

if not exists( select 1 from sys.all_columns where object_id = object_id('PropertyHydrant') and (name = 'TestHydrantTypeId'))
BEGIN
ALTER TABLE dbo.PropertyHydrant ADD
    [OwnerRoomNumber] VARCHAR (255) NULL,
    [TestHydrantTypeId] [int] NULL
END

if exists( select 1 from sys.all_columns where object_id = object_id('PropertyHydrant') and (name = 'NumberOfMilepost'))
BEGIN
ALTER TABLE dbo.PropertyHydrant DROP COLUMN
	[NumberOfMilepost]
END

if exists( select 1 from sys.all_columns where object_id = object_id('PropertyHydrant') and (name = 'NumberOrMilepost'))
BEGIN
ALTER TABLE dbo.PropertyHydrant DROP COLUMN
	[NumberOrMilepost],
	[StreetPrefixId],
	[StreetPrefix],
	[StreetOrHighway],
	[StreetTypeId],
	[StreetType],
	[StreetSuffixId],
	[StreetSuffix],
	[City],
	[StateId],
	[State],
	[Zip],
	[County]
END
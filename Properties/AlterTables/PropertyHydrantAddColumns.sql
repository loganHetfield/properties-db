if not exists (select 1 from sys.all_columns where object_id = object_id('PropertyHydrant') and (name = 'ImageHeight' or name = 'ImageWidth'))
BEGIN
ALTER TABLE dbo.PropertyHydrant ADD
    [FileName]       VARCHAR (255)    NULL,
    [ImageHeight]          INT              NULL,
    [ImageWidth]         INT              NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('PropertyHydrant') and (name = 'HydrantId'))
BEGIN
ALTER TABLE dbo.PropertyHydrant ADD
    [HydrantId] VARCHAR (50) NULL
END

if exists (select * from sys.all_columns where object_id = object_id('PropertyHydrant') and name = 'HydrantId' and TYPE_NAME(system_type_id) = 'varchar')
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

IF EXISTS (SELECT * FROM [dbo].[PropertyHydrant])
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
	[HydrantDistrictId] [int] NULL,
	[HydrantSectorId] [int] NULL,
	[Distance] [int] NULL,
	[HydrantManufacturerId] [int] NULL,
	[HydrantModelId] [int] NULL,
	[Year] [int] NULL,
	[DateInService] [date] NULL,
	[HydrantStyleId] [int] NULL,
	[HydrantClassId] [int] NULL,
	[IsColorCoded] [bit] NULL,
	[HydrantColorId] [int] NULL,
	[HasStreetMarker] [bit] NULL,
	[IsStrapped] [bit] NULL,
	[IsOutOfService] [bit] NULL,
	[IsRepairRequired] [bit] NULL,
	[LastFlowTest] [date] NULL,
	[HydrantOrder] [nvarchar](50) NULL,
	[WaterMainId] [nvarchar](255) NULL,
	[MainDiameter] [int] NULL,
	[WaterMainTypeId] [int] NULL,
	[PortSize1] [int] NULL,
	[PortSize2] [int] NULL,
	[PortSize3] [int] NULL,
	[PortSize4] [int] NULL,
	[HydrantOwner] [nvarchar](255) NULL,
	[HydrantOwnerPhoneNumber] [nvarchar](50) NULL,
	[OwnerNumberOrMilepost] [nvarchar](50) NULL,
	[OwnerStreetPrefixId] [int] NULL,
	[OwnerStreetPrefix] [nvarchar](255) NULL,
	[OwnerStreetOrHighway] [nvarchar](100) NULL,
	[OwnerStreetTypeId] [int] NULL,
	[OwnerStreetType] [nvarchar](255) NULL,
	[OwnerStreetSuffixId] [int] NULL,
	[OwnerStreetSuffix] [nvarchar](255) NULL,
	[OwnerRoomNumber] [nvarchar](255) NULL,
	[OwnerCity] [nvarchar](255) NULL,
	[OwnerStateId] [int] NULL,
	[OwnerState] [nvarchar](255) NULL,
	[OwnerZip] [nvarchar](50) NULL,
	[OwnerCounty] [nvarchar](255) NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('PropertyHydrant') and (name = 'HydrantModel'))
BEGIN
ALTER TABLE dbo.PropertyHydrant ADD
	[HydrantModel] nvarchar(255) NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('PropertyHydrant') and (name = 'HydrantStyleId'))
BEGIN
ALTER TABLE dbo.PropertyHydrant ADD
	[HydrantStyleId] [int] NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('PropertyHydrant') and (name = 'HydrantClassId'))
BEGIN
ALTER TABLE dbo.PropertyHydrant ADD
	[HydrantClassId] [int] NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('PropertyHydrant') and (name = 'HydrantColorId'))
BEGIN
ALTER TABLE dbo.PropertyHydrant ADD
	[HydrantColorId] [int] NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('PropertyHydrant') and (name = 'HydrantOrder'))
BEGIN
ALTER TABLE dbo.PropertyHydrant ADD
	[HydrantOrder] [nvarchar](50) NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('PropertyHydrant') and (name = 'WaterMainTypeId'))
BEGIN
ALTER TABLE dbo.PropertyHydrant ADD
	[WaterMainTypeId] [int] NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('PropertyHydrant') and (name = 'OwnerNumberOrMilepost'))
BEGIN
ALTER TABLE dbo.PropertyHydrant ADD
	[OwnerNumberOrMilepost] [nvarchar](50) NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('PropertyHydrant') and (name = 'OwnerRoomNumber'))
BEGIN
ALTER TABLE dbo.PropertyHydrant ADD
	[OwnerRoomNumber] [nvarchar](255) NULL
END
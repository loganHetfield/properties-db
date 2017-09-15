IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'PropertyHydrant')
BEGIN

CREATE TABLE [dbo].[PropertyHydrant] (
    [PropertyHydrantId]          UNIQUEIDENTIFIER NOT NULL,
    [PropertyId]                 UNIQUEIDENTIFIER NOT NULL,
    [HydrantLocationDescription] NVARCHAR (50)    NULL,
    [CrossStreet]                NVARCHAR (50)    NULL,
    [Flow]                       INT              NULL,
    [ImageId]                    UNIQUEIDENTIFIER NULL,
    [ThumbImageId]               UNIQUEIDENTIFIER NULL,
    [FileName]       NVARCHAR (255)    NULL,
    [ImageHeight]          INT              NULL,
    [ImageWidth]         INT              NULL,
    [HydrantId]		NVARCHAR (50) NULL,
	[HydrantTypeId] int NULL,
	[HydrantDistrictId] int NULL,
	[HydrantSectorId] int NULL,
	[Distance] int NULL,
	[HydrantManufacturerId] int NULL,
	[HydrantModel] nvarchar(255) NULL,
	[Year] int NULL,
	[DateInService] date NULL,
	[HydrantStyleId] int NULL,
	[HydrantClassId] int NULL,
	[IsColorCoded] bit NULL,
	[HydrantColorId] int NULL,
	[HasStreetMarker] bit NULL,
	[IsStrapped] bit NULL,
	[IsOutOfService] bit NULL,
	[IsRepairRequired] bit NULL,
	[LastFlowTest] date NULL,
	[HydrantOrder] nvarchar(50) NULL,
	[WaterMainId] nvarchar(255) NULL,
	[MainDiameter] int NULL,
	[WaterMainTypeId] int NULL,
	[PortSize1] int NULL,
	[PortSize2] int NULL,
	[PortSize3] int NULL,
	[PortSize4] int NULL,
	[HydrantOwner] nvarchar(255) NULL,
	[HydrantOwnerPhoneNumber] nvarchar(50) NULL,
	[OwnerNumberOrMilepost] nvarchar(50) NULL,
	[OwnerStreetPrefixId] int NULL,
	[OwnerStreetPrefix] nvarchar(255) NULL,
	[OwnerStreetOrHighway] nvarchar(100) NULL,
	[OwnerStreetTypeId] int NULL,
	[OwnerStreetType] nvarchar(255) NULL,
	[OwnerStreetSuffixId] int NULL,
	[OwnerStreetSuffix] nvarchar(255) NULL,
	[OwnerRoomNumber] nvarchar(255) NULL,
	[OwnerCity] nvarchar(255) NULL,
	[OwnerStateId] int NULL,
	[OwnerState] nvarchar(255) NULL,
	[OwnerZip] nvarchar(50) NULL,
	[OwnerCounty] nvarchar(255) NULL
    CONSTRAINT [PK_PropertyHydrant] PRIMARY KEY CLUSTERED ([PropertyHydrantId] ASC),
    CONSTRAINT [FK_PropertyHydrant_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);

END




IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'PropertyContact')
BEGIN

CREATE TABLE [dbo].[PropertyContact] (
    [PropertyContactId]       UNIQUEIDENTIFIER NOT NULL,
    [PropertyId]              UNIQUEIDENTIFIER NOT NULL,
    [Name]					  NVARCHAR (255)    NULL,
    [IsPrimaryContact]        BIT              NULL,
    [IsEmergencyContact]      BIT              NULL,
    [Phone]                   NVARCHAR (50)    NULL,
    [Email]                   NVARCHAR (1024)  NULL,
    [IsAddressSameAsProperty] BIT              NULL,
    [NumberOrMilepost]        NVARCHAR (50)    NOT NULL,
    [StreetPrefixId]          INT              NULL,
    [StreetOrHighway]         NVARCHAR (100)   NOT NULL,
    [StreetTypeId]            INT              NULL,
    [StreetSuffixId]          INT              NULL,
	[RoomNumber]		  nvarchar(255) NULL,
    [City]                    NVARCHAR (255)   NOT NULL,
    [StateId]                 INT              NOT NULL,
    [Zip]                     NVARCHAR (50)    NOT NULL,
    [County]                  NVARCHAR (255)   NULL,
	[ImageId]				  uniqueidentifier NULL,
	[ThumbImageId]			  uniqueidentifier NULL,
	[FileName]				  nvarchar(255) NULL,
	[ImageWidth]			  int NULL,
	[ImageHeight]			  int NULL,	
	[FaxNumber]				  nvarchar(255) NULL
    CONSTRAINT [PK_PropertyContact] PRIMARY KEY CLUSTERED ([PropertyContactId] ASC),
    CONSTRAINT [FK_PropertyContact_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);

END






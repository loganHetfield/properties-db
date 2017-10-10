IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'OccupantContact')
BEGIN

CREATE TABLE [dbo].[OccupantContact] (
		[City]                    NVARCHAR(255)        NULL,  
		[County]                  NVARCHAR(255)        NULL,
		[Email]                   NVARCHAR(1024)       NULL,
		[FaxNumber]               NVARCHAR(50)         NULL,
		[FileName]                NVARCHAR(255)        NULL,
		[ImageHeight]             INT                  NULL,
		[ImageId]                 UNIQUEIDENTIFIER     NULL,
		[ImageWidth]              INT                  NULL,
		[IsAddressSameAsProperty] BIT                  NULL,
		[IsEmergencyContact]      BIT                  NULL,
		[IsPrimaryContact]        BIT                  NULL,
		[Name]                    NVARCHAR(100)        NULL,
		[NumberOrMilepost]        NVARCHAR(50)         NULL,
		[OccupantContactId]       UNIQUEIDENTIFIER NOT NULL,
		[OccupantId]              UNIQUEIDENTIFIER NOT NULL,
		[Phone]                   NVARCHAR(50)         NULL,
		[RoomNumber]              NVARCHAR(255)        NULL,
		[StateId]                 INT                  NULL,
		[StreetOrHighway]         NVARCHAR(100)        NULL,
		[StreetPrefixId]          INT                  NULL,
		[StreetSuffixId]          INT                  NULL,
		[StreetTypeId]            INT                  NULL,
		[ThumbImageId]            UNIQUEIDENTIFIER     NULL,
		[Zip]                     NVARCHAR(50)         NULL,
		CONSTRAINT [PK_OccupantContact] PRIMARY KEY CLUSTERED ([OccupantContactId] ASC),
    CONSTRAINT [FK_OccupantContact_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);

END
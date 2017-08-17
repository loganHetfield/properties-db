IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'BuildingContact')
BEGIN

CREATE TABLE [dbo].[BuildingContact] (
			[BuildingContactId]        [UNIQUEIDENTIFIER] NOT NULL,
			[BuildingId]               [UNIQUEIDENTIFIER] NOT NULL,
			[IsPrimaryContact]         [BIT]              NULL,
			[IsEmergencyContact]       [BIT]              NULL,
			[Phone]                    [NVARCHAR](50)     NULL,
			[Email]                    [NVARCHAR](1024)   NULL,
			[IsAddressSameAsProperty]  [BIT]              NULL,
			[NumberOrMilepost]         [NVARCHAR](50)     NULL,
			[StreetPrefixId]           [INT]              NULL,
			[StreetOrHighway]          [NVARCHAR](100)    NULL,
			[StreetTypeId]             [INT]              NULL,
			[StreetSuffixId]           [INT]              NULL,
			[City]                     [NVARCHAR](255)    NULL,
			[StateId]                  [INT]              NULL,
			[Zip]                      [NVARCHAR](50)     NULL,
			[County]                   [NVARCHAR](255)    NULL,
			[Name]                     [NVARCHAR](100)    NULL,
			[ImageId]                  [UNIQUEIDENTIFIER] NULL,
			[ThumbImageId]             [UNIQUEIDENTIFIER] NULL,
			[FileName]                 [VARCHAR](255)     NULL,
			[ImageWidth]               [INT]              NULL,
			[ImageHeight]              [INT]              NULL,
    CONSTRAINT [PK_BuildingContact] PRIMARY KEY CLUSTERED ([BuildingContactId] ASC),
    CONSTRAINT [FK_BuildingContact_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId])
);

END
IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'PropertySpecialHazard')
BEGIN

CREATE TABLE [dbo].[PropertySpecialHazard] (
    [PropertySpecialHazardId] UNIQUEIDENTIFIER NOT NULL,
    [PropertyId]              UNIQUEIDENTIFIER NOT NULL,
    [SpecialHazardTypeId]     INT              NULL,
    [Quantity]                INT              NULL,
    [ImageId]                 UNIQUEIDENTIFIER NULL,
    [ThumbImageId]            UNIQUEIDENTIFIER NULL,
	[FileName]				 nvarchar(255) NULL,
	[ImageWidth]			 int NULL,
	[ImageHeight]			int NULL,	
	[Description] nvarchar(255) NULL,
	[Location] nvarchar(255) NULL,
	[PriorityId] int NULL,
	[CategoryId] int NULL,
	[StartDate] date NULL,
	[EndDate] date NULL
    CONSTRAINT [PK_PropertySpecialHazard] PRIMARY KEY CLUSTERED ([PropertySpecialHazardId] ASC),
    CONSTRAINT [FK_PropertySpecialHazard_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);

END



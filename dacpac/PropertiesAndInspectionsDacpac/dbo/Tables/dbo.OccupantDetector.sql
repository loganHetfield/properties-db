CREATE TABLE [dbo].[OccupantDetector] (
    [OccupantDetectorId] UNIQUEIDENTIFIER NOT NULL,
    [OccupantId]         UNIQUEIDENTIFIER NOT NULL,
    [Type]               INT              NULL,
    [HowMany]            INT              NULL,
    [AreaProtected]      VARCHAR (50)     NULL,
    [Make]               VARCHAR (50)     NULL,
    [Model]              VARCHAR (50)     NULL,
    [SerialNumber]       VARCHAR (100)    NULL,
    [Manufacturer]       VARCHAR (50)     NULL,
    CONSTRAINT [PK_OccupantDetector] PRIMARY KEY CLUSTERED ([OccupantDetectorId] ASC),
    CONSTRAINT [FK_OccupantDetector_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);


IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'OccupantDetector')
BEGIN

CREATE TABLE [dbo].[OccupantDetector] (
    [OccupantDetectorId] UNIQUEIDENTIFIER NOT NULL,
    [OccupantId]         UNIQUEIDENTIFIER NOT NULL,
    [Type]               INT              NULL,
    [HowMany]            INT              NULL,
    [AreaProtected]      NVARCHAR (50)    NULL,
    [Make]               NVARCHAR (50)    NULL,
    [Model]              NVARCHAR (50)    NULL,
    [SerialNumber]       NVARCHAR (100)   NULL,
    [Manufacturer]       NVARCHAR (50)    NULL,
    CONSTRAINT [PK_OccupantDetector] PRIMARY KEY CLUSTERED ([OccupantDetectorId] ASC),
    CONSTRAINT [FK_OccupantDetector_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);

END




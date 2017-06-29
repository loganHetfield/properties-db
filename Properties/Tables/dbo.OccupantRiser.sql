IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'OccupantRiser')
BEGIN

CREATE TABLE [dbo].[OccupantRiser] (
    [OccupantRiserId]      UNIQUEIDENTIFIER NOT NULL,
    [OccupantId]           UNIQUEIDENTIFIER NOT NULL,
    [IdentificationNumber] NVARCHAR (50)    NULL,
    [Location]             NVARCHAR (50)    NULL,
    [PipeSize]             DECIMAL (18, 2)  NULL,
    [FDCLocation]          NVARCHAR (50)    NULL,
    [Drain]                NVARCHAR (50)    NULL,
    [DrainLocation]        NVARCHAR (50)    NULL,
    [CertificationDate]    DATE             NULL,
    CONSTRAINT [PK_OccupantRiser] PRIMARY KEY CLUSTERED ([OccupantRiserId] ASC),
    CONSTRAINT [FK_OccupantRiser_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);

END


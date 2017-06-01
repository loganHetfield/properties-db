CREATE TABLE [dbo].[OccupantRiser] (
    [OccupantRiserId]      UNIQUEIDENTIFIER NOT NULL,
    [OccupantId]           UNIQUEIDENTIFIER NOT NULL,
    [IdentificationNumber] VARCHAR (50)     NULL,
    [Location]             VARCHAR (50)     NULL,
    [PipeSize]             DECIMAL (18, 2)  NULL,
    [FDCLocation]          VARCHAR (50)     NULL,
    [Drain]                VARCHAR (50)     NULL,
    [DrainLocation]        VARCHAR (50)     NULL,
    [CertificationDate]    DATE             NULL,
    CONSTRAINT [PK_OccupantRiser] PRIMARY KEY CLUSTERED ([OccupantRiserId] ASC),
    CONSTRAINT [FK_OccupantRiser_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);


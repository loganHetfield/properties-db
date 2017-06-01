CREATE TABLE [dbo].[BuildingRiser] (
    [BuildingRiserId]      UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]           UNIQUEIDENTIFIER NOT NULL,
    [IdentificationNumber] VARCHAR (50)     NULL,
    [Location]             VARCHAR (50)     NULL,
    [PipeSize]             DECIMAL (18, 2)  NULL,
    [FDCLocation]          VARCHAR (50)     NULL,
    [Drain]                VARCHAR (50)     NULL,
    [DrainLocation]        VARCHAR (50)     NULL,
    [CertificationDate]    DATE             NULL,
    CONSTRAINT [PK_BuildingRiser] PRIMARY KEY CLUSTERED ([BuildingRiserId] ASC),
    CONSTRAINT [FK_BuildingRiser_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId])
);


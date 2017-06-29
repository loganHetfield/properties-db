CREATE TABLE [dbo].[BuildingRiser] (
    [BuildingRiserId]      UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]           UNIQUEIDENTIFIER NOT NULL,
    [IdentificationNumber] NVARCHAR (50)    NULL,
    [Location]             NVARCHAR (50)    NULL,
    [PipeSize]             DECIMAL (18, 2)  NULL,
    [FDCLocation]          NVARCHAR (50)    NULL,
    [Drain]                NVARCHAR (50)    NULL,
    [DrainLocation]        NVARCHAR (50)    NULL,
    [CertificationDate]    DATE             NULL,
    CONSTRAINT [PK_BuildingRiser] PRIMARY KEY CLUSTERED ([BuildingRiserId] ASC),
    CONSTRAINT [FK_BuildingRiser_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId])
);




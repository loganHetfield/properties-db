CREATE TABLE [dbo].[Riser] (
    [RiserId]              UNIQUEIDENTIFIER NOT NULL,
    [StructureId]          UNIQUEIDENTIFIER NOT NULL,
    [IdentificationNumber] VARCHAR (50)     NULL,
    [Location]             VARCHAR (50)     NULL,
    [PipeSize]             DECIMAL (18, 2)  NULL,
    [FDCLocation]          VARCHAR (50)     NULL,
    [Drain]                VARCHAR (50)     NULL,
    [DrainLocation]        VARCHAR (50)     NULL,
    [CertificationDate]    DATE             NULL,
    CONSTRAINT [PK_Riser] PRIMARY KEY CLUSTERED ([RiserId] ASC),
    CONSTRAINT [FK_Riser_Structure] FOREIGN KEY ([StructureId]) REFERENCES [dbo].[Structure] ([StructureId])
);


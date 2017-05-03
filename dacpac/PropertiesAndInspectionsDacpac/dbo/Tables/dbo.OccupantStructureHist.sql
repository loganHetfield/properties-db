CREATE TABLE [dbo].[OccupantStructureHist] (
    [OccupantStructureHistId] UNIQUEIDENTIFIER NOT NULL,
    [OccupantId]              UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]              UNIQUEIDENTIFIER NULL,
    [SuiteId]                 UNIQUEIDENTIFIER NULL,
    [BeginDate]               DATE             NOT NULL,
    [EndDate]                 DATE             NULL,
    CONSTRAINT [PK_OccupantStructureHist] PRIMARY KEY CLUSTERED ([OccupantStructureHistId] ASC),
    CONSTRAINT [FK_OccupantStructureHist_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);


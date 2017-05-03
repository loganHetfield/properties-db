CREATE TABLE [dbo].[Suite] (
    [SuiteId]     UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]  UNIQUEIDENTIFIER NOT NULL,
    [PropertyId]  UNIQUEIDENTIFIER NOT NULL,
    [StructureId] UNIQUEIDENTIFIER NOT NULL,
    [NotesField]  NCHAR (10)       NULL,
    CONSTRAINT [PK_Suite] PRIMARY KEY CLUSTERED ([SuiteId] ASC),
    CONSTRAINT [FK_Suite_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId]),
    CONSTRAINT [FK_Suite_Structure] FOREIGN KEY ([StructureId]) REFERENCES [dbo].[Structure] ([StructureId])
);


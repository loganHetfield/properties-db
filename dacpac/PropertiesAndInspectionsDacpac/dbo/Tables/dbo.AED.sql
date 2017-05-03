CREATE TABLE [dbo].[AED] (
    [AedId]           UNIQUEIDENTIFIER NOT NULL,
    [StructureId]     UNIQUEIDENTIFIER NOT NULL,
    [FloorNameNumber] VARCHAR (50)     NULL,
    [Location]        VARBINARY (50)   NULL,
    CONSTRAINT [PK_AED] PRIMARY KEY CLUSTERED ([AedId] ASC),
    CONSTRAINT [FK_AED_Structure] FOREIGN KEY ([StructureId]) REFERENCES [dbo].[Structure] ([StructureId])
);


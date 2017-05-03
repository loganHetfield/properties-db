CREATE TABLE [dbo].[KnoxBox] (
    [KnoxBoxId]   UNIQUEIDENTIFIER NOT NULL,
    [StructureId] UNIQUEIDENTIFIER NOT NULL,
    [Location]    VARCHAR (50)     NULL,
    CONSTRAINT [PK_KnoxBox] PRIMARY KEY CLUSTERED ([KnoxBoxId] ASC),
    CONSTRAINT [FK_KnoxBox_Structure] FOREIGN KEY ([StructureId]) REFERENCES [dbo].[Structure] ([StructureId])
);


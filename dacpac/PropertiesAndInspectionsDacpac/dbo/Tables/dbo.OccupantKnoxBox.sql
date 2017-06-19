CREATE TABLE [dbo].[OccupantKnoxBox] (
    [OccupantKnoxBoxId] UNIQUEIDENTIFIER NOT NULL,
    [OccupantId]        UNIQUEIDENTIFIER NOT NULL,
    [Location]          NVARCHAR (50)    NULL,
    CONSTRAINT [PK_OccupantKnoxBox] PRIMARY KEY CLUSTERED ([OccupantKnoxBoxId] ASC),
    CONSTRAINT [FK_OccupantKnoxBox_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);




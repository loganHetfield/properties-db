CREATE TABLE [dbo].[OccupantAccess] (
    [OccupantAccessId] UNIQUEIDENTIFIER NOT NULL,
    [OccupantId]       UNIQUEIDENTIFIER NOT NULL,
    [Type]             INT              NULL,
    [Location]         VARCHAR (50)     NULL,
    CONSTRAINT [PK_OccupantAccess] PRIMARY KEY CLUSTERED ([OccupantAccessId] ASC),
    CONSTRAINT [FK_OccupantAccess_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);


CREATE TABLE [dbo].[OccupantAED] (
    [OccupantAedId]   UNIQUEIDENTIFIER NOT NULL,
    [OccupantId]      UNIQUEIDENTIFIER NOT NULL,
    [FloorNameNumber] VARCHAR (50)     NULL,
    [Location]        VARBINARY (50)   NULL,
    CONSTRAINT [PK_OccupantAED] PRIMARY KEY CLUSTERED ([OccupantAedId] ASC),
    CONSTRAINT [FK_OccupantAED_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);


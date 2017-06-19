CREATE TABLE [dbo].[OccupantAED] (
    [OccupantAedId]   UNIQUEIDENTIFIER NOT NULL,
    [OccupantId]      UNIQUEIDENTIFIER NOT NULL,
    [FloorNameNumber] NVARCHAR (50)    NULL,
    [Location]        NVARCHAR (50)    NULL,
    CONSTRAINT [PK_OccupantAED] PRIMARY KEY CLUSTERED ([OccupantAedId] ASC),
    CONSTRAINT [FK_OccupantAED_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);




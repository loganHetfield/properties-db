CREATE TABLE [dbo].[OccupantShutOff] (
    [OccupantShutOffId] UNIQUEIDENTIFIER NOT NULL,
    [OccupantId]        UNIQUEIDENTIFIER NOT NULL,
    [Type]              INT              NULL,
    [Location]          VARCHAR (50)     NULL,
    CONSTRAINT [PK_OccupantShutOff] PRIMARY KEY CLUSTERED ([OccupantShutOffId] ASC),
    CONSTRAINT [FK_OccupantShutOff_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);


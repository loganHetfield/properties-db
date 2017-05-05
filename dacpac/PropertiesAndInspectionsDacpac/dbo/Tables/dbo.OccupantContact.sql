CREATE TABLE [dbo].[OccupantContact] (
    [OccupantId] UNIQUEIDENTIFIER NOT NULL,
    [ContactId]  UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_OccupantContact] PRIMARY KEY CLUSTERED ([OccupantId] ASC, [ContactId] ASC),
    CONSTRAINT [FK_OccupantContact_Contact] FOREIGN KEY ([ContactId]) REFERENCES [dbo].[Contact] ([ContactId]),
    CONSTRAINT [FK_OccupantContact_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);


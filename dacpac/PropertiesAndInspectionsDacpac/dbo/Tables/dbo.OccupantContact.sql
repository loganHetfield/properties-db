CREATE TABLE [dbo].[OccupantContact] (
    [OccupantContactId]       UNIQUEIDENTIFIER NOT NULL,
    [OccupantId]              UNIQUEIDENTIFIER NOT NULL,
    [FirstName]               NVARCHAR (50)    NULL,
    [LastName]                NVARCHAR (50)    NULL,
    [BusinessName]            NVARCHAR (50)    NULL,
    [IsPrimaryContact]        BIT              NULL,
    [EmergencyContact]        BIT              NULL,
    [Phone]                   VARCHAR (50)     NULL,
    [Email]                   VARCHAR (1024)   NULL,
    [IsAddressSameAsProperty] BIT              NULL,
    CONSTRAINT [PK_OccupantContact] PRIMARY KEY CLUSTERED ([OccupantContactId] ASC),
    CONSTRAINT [FK_OccupantContact_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);




CREATE TABLE [dbo].[PropertyContact] (
    [PropertyContactId]       UNIQUEIDENTIFIER NOT NULL,
    [PropertyId]              UNIQUEIDENTIFIER NOT NULL,
    [FirstName]               NVARCHAR (50)    NULL,
    [LastName]                NVARCHAR (50)    NULL,
    [BusinessName]            NVARCHAR (50)    NULL,
    [IsPrimaryContact]        BIT              NULL,
    [EmergencyContact]        BIT              NULL,
    [Phone]                   NVARCHAR (50)    NULL,
    [Email]                   NVARCHAR (1024)  NULL,
    [IsAddressSameAsProperty] BIT              NULL,
    CONSTRAINT [PK_PropertyContact] PRIMARY KEY CLUSTERED ([PropertyContactId] ASC),
    CONSTRAINT [FK_PropertyContact_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);






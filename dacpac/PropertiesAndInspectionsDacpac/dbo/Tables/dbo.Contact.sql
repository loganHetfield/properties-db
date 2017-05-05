CREATE TABLE [dbo].[Contact] (
    [ContactId]               UNIQUEIDENTIFIER NOT NULL,
    [ContactGroupId]          UNIQUEIDENTIFIER NOT NULL,
    [FirstName]               NVARCHAR (50)    NULL,
    [LastName]                NVARCHAR (50)    NULL,
    [BusinessName]            NVARCHAR (50)    NULL,
    [IsPrimaryContact]        BIT              NULL,
    [EmergencyContact]        BIT              NULL,
    [Phone]                   VARCHAR (50)     NULL,
    [Email]                   VARCHAR (1024)   NULL,
    [IsAddressSameAsProperty] BIT              NULL,
    CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED ([ContactId] ASC)
);




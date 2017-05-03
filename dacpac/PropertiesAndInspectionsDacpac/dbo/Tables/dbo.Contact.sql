CREATE TABLE [dbo].[Contact] (
    [ContactId]               UNIQUEIDENTIFIER NOT NULL,
    [AddressId]               UNIQUEIDENTIFIER NOT NULL,
    [ContactGroupId]          UNIQUEIDENTIFIER NOT NULL,
    [FirstName]               NVARCHAR (50)    NULL,
    [LastName]                NVARCHAR (50)    NULL,
    [BusinessName]            NVARCHAR (50)    NULL,
    [IsPrimaryContact]        BIT              NULL,
    [EmergencyContact]        BIT              NULL,
    [Phone]                   VARCHAR (50)     NULL,
    [Email]                   VARCHAR (1024)   NULL,
    [IsAddressSameAsProperty] BIT              NULL,
    CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED ([ContactId] ASC),
    CONSTRAINT [FK_Contact_Address] FOREIGN KEY ([AddressId]) REFERENCES [dbo].[Address] ([AddressId]),
    CONSTRAINT [FK_Contact_ContactGroup] FOREIGN KEY ([ContactGroupId]) REFERENCES [dbo].[ContactGroup] ([ContactGroupId])
);


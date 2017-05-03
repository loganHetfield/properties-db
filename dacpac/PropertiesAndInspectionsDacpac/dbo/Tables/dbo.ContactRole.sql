CREATE TABLE [dbo].[ContactRole] (
    [ContactRoleId] UNIQUEIDENTIFIER NOT NULL,
    [ContactId]     UNIQUEIDENTIFIER NOT NULL,
    [RoleId]        INT              NULL,
    CONSTRAINT [PK_ContactRole] PRIMARY KEY CLUSTERED ([ContactRoleId] ASC),
    CONSTRAINT [FK_ContactRole_Contact] FOREIGN KEY ([ContactId]) REFERENCES [dbo].[Contact] ([ContactId])
);


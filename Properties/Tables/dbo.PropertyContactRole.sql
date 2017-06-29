CREATE TABLE [dbo].[PropertyContactRole] (
    [PropertyContactRoleId] UNIQUEIDENTIFIER NOT NULL,
    [PropertyContactId]     UNIQUEIDENTIFIER NOT NULL,
    [PropertyId]            UNIQUEIDENTIFIER NOT NULL,
    [RoleId]                INT              NULL,
    CONSTRAINT [PK_PropertyContactRole] PRIMARY KEY CLUSTERED ([PropertyContactRoleId] ASC)
);


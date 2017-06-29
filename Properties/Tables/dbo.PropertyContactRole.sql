IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'PropertyContactRole')
BEGIN

CREATE TABLE [dbo].[PropertyContactRole] (
    [PropertyContactRoleId] UNIQUEIDENTIFIER NOT NULL,
    [PropertyContactId]     UNIQUEIDENTIFIER NOT NULL,
    [PropertyId]            UNIQUEIDENTIFIER NOT NULL,
    [RoleId]                INT              NULL,
    CONSTRAINT [PK_PropertyContactRole] PRIMARY KEY CLUSTERED ([PropertyContactRoleId] ASC)
);

END

IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'BuildingContactRole')
BEGIN

CREATE TABLE [dbo].[BuildingContactRole] (
    [BuildingContactRoleId] UNIQUEIDENTIFIER NOT NULL,
    [BuildingContactId]     UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]            UNIQUEIDENTIFIER NOT NULL,
    [RoleId]                INT              NULL,
    CONSTRAINT [PK_BuildingContactRole] PRIMARY KEY CLUSTERED ([BuildingContactRoleId] ASC)
);

END
IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'OccupantContactRole')
BEGIN

CREATE TABLE [dbo].[OccupantContactRole] (
    [OccupantContactRoleId] UNIQUEIDENTIFIER NOT NULL,
    [OccupantContactId]     UNIQUEIDENTIFIER NOT NULL,
    [OccupantId]            UNIQUEIDENTIFIER NOT NULL,
    [RoleId]                INT              NULL,
    CONSTRAINT [PK_OccupantContactRole] PRIMARY KEY CLUSTERED ([OccupantContactRoleId] ASC)
);

END
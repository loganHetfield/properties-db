﻿IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'Event')
BEGIN

CREATE TABLE [dbo].[Event] (
    [EventId]    UNIQUEIDENTIFIER NOT NULL,
    [PropertyId] UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]  UNIQUEIDENTIFIER NULL,
    [OccupantId] UNIQUEIDENTIFIER NULL,
    [DateTimeUtc]   DATETIME         NOT NULL,
    [EventType]  NVARCHAR (50)    NOT NULL,
    [ObjectType] NVARCHAR (50)    NULL,
    [UserName]   NVARCHAR (255)   NULL,
	[EventMessage] NVARCHAR (1023)
    CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED ([EventId] ASC)
);

END


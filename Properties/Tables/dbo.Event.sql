CREATE TABLE [dbo].[Event] (
    [EventId]    UNIQUEIDENTIFIER NOT NULL,
    [PropertyId] UNIQUEIDENTIFIER NOT NULL,
    [BuldingId]  UNIQUEIDENTIFIER NULL,
    [OccuapntId] UNIQUEIDENTIFIER NULL,
    [DateTime]   DATETIME         NOT NULL,
    [EventType]  NVARCHAR (50)    NOT NULL,
    [ObjectType] NVARCHAR (50)    NULL,
    [UserName]   NVARCHAR (255)   NULL,
    CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED ([EventId] ASC)
);




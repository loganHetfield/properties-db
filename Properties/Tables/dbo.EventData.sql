CREATE TABLE [dbo].[EventData] (
    [EventDataId]    UNIQUEIDENTIFIER NOT NULL,
    [EventId]        UNIQUEIDENTIFIER NOT NULL,
    [EventDataKey]   NVARCHAR (50)    NOT NULL,
    [EventDataValue] NVARCHAR (255)   NOT NULL,
    CONSTRAINT [PK_EventData_1] PRIMARY KEY CLUSTERED ([EventDataId] ASC),
    CONSTRAINT [FK_EventData_Event] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Event] ([EventId])
);


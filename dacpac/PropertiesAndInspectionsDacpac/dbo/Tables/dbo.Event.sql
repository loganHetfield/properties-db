CREATE TABLE [dbo].[Event] (
    [EventId]               UNIQUEIDENTIFIER NOT NULL,
    [PropertyId]            UNIQUEIDENTIFIER NOT NULL,
    [BuldingId]             UNIQUEIDENTIFIER NULL,
    [SuiteId]               UNIQUEIDENTIFIER NULL,
    [OccuapntId]            UNIQUEIDENTIFIER NULL,
    [DateTime]              DATETIME         NOT NULL,
    [EventType]             SMALLINT         NULL,
    [DestinationPropertyId] UNIQUEIDENTIFIER NOT NULL,
    [DestinationBuildingId] UNIQUEIDENTIFIER NULL,
    [DestinationSuiteId]    UNIQUEIDENTIFIER NULL,
    [DestinationOccupantId] UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED ([EventId] ASC)
);


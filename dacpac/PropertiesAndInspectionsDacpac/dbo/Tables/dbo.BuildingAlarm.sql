CREATE TABLE [dbo].[BuildingAlarm] (
    [BuildingAlarmId]     UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]          UNIQUEIDENTIFIER NOT NULL,
    [Type]                INT              NULL,
    [PanelLocation]       VARCHAR (50)     NULL,
    [AnnunciatorLocation] VARCHAR (50)     NULL,
    [AreaProtected]       VARCHAR (50)     NULL,
    [AlarmCertification]  VARCHAR (50)     NULL,
    [CertificationDate]   DATE             NULL,
    CONSTRAINT [PK_BuildingAlarm] PRIMARY KEY CLUSTERED ([BuildingAlarmId] ASC),
    CONSTRAINT [FK_BuildingAlarm_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId])
);


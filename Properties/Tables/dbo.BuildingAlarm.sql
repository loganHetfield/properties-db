IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'BuildingAlarm')
BEGIN

CREATE TABLE [dbo].[BuildingAlarm] (
    [BuildingAlarmId]     UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]          UNIQUEIDENTIFIER NOT NULL,
    [Type]                INT              NULL,
    [PanelLocation]       NVARCHAR (50)    NULL,
    [AnnunciatorLocation] NVARCHAR (50)    NULL,
    [AreaProtected]       NVARCHAR (50)    NULL,
    [AlarmCertification]  NVARCHAR (50)    NULL,
    [CertificationDate]   DATE             NULL,
    CONSTRAINT [PK_BuildingAlarm] PRIMARY KEY CLUSTERED ([BuildingAlarmId] ASC),
    CONSTRAINT [FK_BuildingAlarm_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId])
);

END



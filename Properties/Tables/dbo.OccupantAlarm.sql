IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'OccupantAlarm')
BEGIN

CREATE TABLE [dbo].[OccupantAlarm] (
    [OccupantAlarmId]     UNIQUEIDENTIFIER NOT NULL,
    [OccupantId]          UNIQUEIDENTIFIER NOT NULL,
    [Type]                INT              NULL,
    [PanelLocation]       NVARCHAR (50)    NULL,
    [AnnunciatorLocation] NVARCHAR (50)    NULL,
    [AreaProtected]       NVARCHAR (50)    NULL,
    [AlarmCertification]  NVARCHAR (50)    NULL,
    [CertificationDate]   DATE             NULL,
    CONSTRAINT [PK_OccupantAlarm] PRIMARY KEY CLUSTERED ([OccupantAlarmId] ASC),
    CONSTRAINT [FK_OccupantAlarm_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);

END



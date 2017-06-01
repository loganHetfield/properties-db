CREATE TABLE [dbo].[OccupantAlarm] (
    [OccupantAlarmId]     UNIQUEIDENTIFIER NOT NULL,
    [OccupantId]          UNIQUEIDENTIFIER NOT NULL,
    [Type]                INT              NULL,
    [PanelLocation]       VARCHAR (50)     NULL,
    [AnnunciatorLocation] VARCHAR (50)     NULL,
    [AreaProtected]       VARCHAR (50)     NULL,
    [AlarmCertification]  VARCHAR (50)     NULL,
    [CertificationDate]   DATE             NULL,
    CONSTRAINT [PK_OccupantAlarm] PRIMARY KEY CLUSTERED ([OccupantAlarmId] ASC),
    CONSTRAINT [FK_OccupantAlarm_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);


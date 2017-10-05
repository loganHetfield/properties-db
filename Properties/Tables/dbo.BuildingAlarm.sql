IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'BuildingAlarm')
BEGIN

CREATE TABLE [dbo].[BuildingAlarm] (
    [AlarmCertification]  NVARCHAR (50)        NULL,
    [AnnunciatorLocation] NVARCHAR (50)        NULL,
    [AreaProtected]       INT                  NULL,
    [BuildingAlarmId]     UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]          UNIQUEIDENTIFIER NOT NULL,
    [CertificationDate]   DATE                 NULL,
    [FileName]		  NVARCHAR (255)       NULL,
    [ImageHeight]         INT                  NULL,
    [ImageId]		  UNIQUEIDENTIFIER     NULL,
    [ImageWidth]          INT                  NULL,
    [PanelLocation]       NVARCHAR (50)        NULL,
    [ThumbImageId]        UNIQUEIDENTIFIER     NULL,
    [Type]                INT                  NULL
    CONSTRAINT [PK_BuildingAlarm] PRIMARY KEY CLUSTERED ([BuildingAlarmId] ASC),
    CONSTRAINT [FK_BuildingAlarm_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId])
);

END
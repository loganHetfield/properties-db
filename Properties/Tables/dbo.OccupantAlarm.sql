IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'OccupantAlarm')
BEGIN

CREATE TABLE [dbo].[OccupantAlarm] (
    [AnnunciatorLocation] [NVARCHAR](50)         NULL,
    [AreaProtected]       [INT]                  NULL,
    [Certification]       [NVARCHAR](50)         NULL,
    [CertificationDate]   [DATE]                 NULL,
    [FileName]            [NVARCHAR](255)        NULL,
    [ImageHeight]         [INT]                  NULL,
    [ImageId]             [UNIQUEIDENTIFIER]     NULL,
    [ImageWidth]          [INT]                  NULL,    
    [OccupantAlarmId]     [UNIQUEIDENTIFIER] NOT NULL,
    [OccupantId]          [UNIQUEIDENTIFIER] NOT NULL,
    [PanelLocation]       [NVARCHAR](50)         NULL,
    [ThumbImageId]        [UNIQUEIDENTIFIER]     NULL,
    [TypeId]              [INT]                  NULL,
    CONSTRAINT [PK_OccupantAlarm] PRIMARY KEY CLUSTERED ([OccupantAlarmId] ASC),
    CONSTRAINT [FK_OccupantAlarm_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);

END
CREATE TABLE [dbo].[Alarm] (
    [AlarmId]             UNIQUEIDENTIFIER NOT NULL,
    [StructureId]         UNIQUEIDENTIFIER NOT NULL,
    [Type]                INT              NULL,
    [PanelLocation]       VARCHAR (50)     NULL,
    [AnnunciatorLocation] VARCHAR (50)     NULL,
    [AreaProtected]       VARCHAR (50)     NULL,
    [AlarmCertification]  VARCHAR (50)     NULL,
    [CertificationDate]   DATE             NULL,
    CONSTRAINT [PK_Alarm] PRIMARY KEY CLUSTERED ([AlarmId] ASC)
);




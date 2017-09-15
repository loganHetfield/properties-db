IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'BuildingStandpipe')
BEGIN

CREATE TABLE [dbo].[BuildingStandpipe] (
    [BuildingStandpipeId]  UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]           UNIQUEIDENTIFIER NOT NULL,
    [Type]                 INT              NULL,
    [Class]                INT              NULL,
    [Size]                 INT              NULL,
    [ControlValveLocation] NVARCHAR (50)    NULL,
    [FDCLocation]          NVARCHAR (50)    NULL,
    [StandpipeZone]        NVARCHAR (50)    NULL,
    [CertificationNumber]  NVARCHAR (50)    NULL,
    [CertificationDate]    DATE             NULL,
    [ImageId]              UNIQUEIDENTIFIER NULL,
    [ThumbImageId]         UNIQUEIDENTIFIER NULL,
    [FileName]			  NVARCHAR (255)    NULL,
    [ImageHeight]         INT              NULL,
    [ImageWidth]          INT              NULL
    CONSTRAINT [PK_BuildingStandpipe] PRIMARY KEY CLUSTERED ([BuildingStandpipeId] ASC),
    CONSTRAINT [FK_BuildingStandpipe_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId])
);

END



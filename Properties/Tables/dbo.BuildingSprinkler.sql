IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'BuildingSprinkler')
BEGIN

CREATE TABLE [dbo].[BuildingSprinkler] (
    [AreaCovered]              INT                  NULL,
    [BuildingSprinklerId]      UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]               UNIQUEIDENTIFIER NOT NULL,
    [Design]                   INT                  NULL,
    [FileName]                 NVARCHAR (255)       NULL,
    [FlowDate]                 DATE                 NULL,
    [FlowRate]                 INT                  NULL,
    [FlowRateInspector]        UNIQUEIDENTIFIER     NULL,
    [ImageHeight]              INT                  NULL,
    [ImageId]                  UNIQUEIDENTIFIER     NULL,
    [ImageWidth]               INT                  NULL,
    [MainLocation]             NVARCHAR (50)        NULL,
    [MainSize]                 DECIMAL (18, 2)      NULL,
    [Make]                     NVARCHAR (50)        NULL,
    [Manufacturer]             NVARCHAR (50)        NULL,
    [Model]                    NVARCHAR (50)        NULL,
    [NumberOfSprinklers]       INT                  NULL,
    [PSI]                      INT                  NULL,
    [SerialNumber]             NVARCHAR (100)       NULL,
    [SprinklerInstallDate]     DATE                 NULL,
    [ThumbImageId]             UNIQUEIDENTIFIER     NULL,
    [Type]                     INT                  NULL    
    CONSTRAINT [PK_BuildingSprinkler] PRIMARY KEY CLUSTERED ([BuildingSprinklerId] ASC),
    CONSTRAINT [FK_BuildingSprinkler_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId])
);

END
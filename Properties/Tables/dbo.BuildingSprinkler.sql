IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'BuildingSprinkler')
BEGIN

CREATE TABLE [dbo].[BuildingSprinkler] (
    [BuildingSprinklerId]      UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]               UNIQUEIDENTIFIER NOT NULL,
    [Type]                     INT              NULL,
    [Design]                   INT              NULL,
    [NumberOfSprinklers]       INT              NULL,
    [AreaOrCompartmentCovered] NVARCHAR (50)    NULL,
    [Make]                     NVARCHAR (50)    NULL,
    [Model]                    NVARCHAR (50)    NULL,
    [SerialNumber]             NVARCHAR (100)   NULL,
    [Manufacturer]             NVARCHAR (50)    NULL,
    [SprinklerInstallDate]     DATE             NULL,
    [FlowRate]                 INT              NULL,
    [PSI]                      INT              NULL,
    [FlowDate]                 DATE             NULL,
    [FlowRateInspector]        UNIQUEIDENTIFIER NULL,
    [MainSize]                 DECIMAL (18, 2)  NULL,
    [MainLocation]             NVARCHAR (50)    NULL,
    CONSTRAINT [PK_BuildingSprinkler] PRIMARY KEY CLUSTERED ([BuildingSprinklerId] ASC),
    CONSTRAINT [FK_BuildingSprinkler_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId])
);

END


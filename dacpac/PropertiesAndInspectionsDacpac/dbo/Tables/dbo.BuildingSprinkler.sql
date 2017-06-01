CREATE TABLE [dbo].[BuildingSprinkler] (
    [BuildingSprinklerId]      UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]               UNIQUEIDENTIFIER NOT NULL,
    [Type]                     INT              NULL,
    [Design]                   INT              NULL,
    [NumberOfSprinklers]       INT              NULL,
    [AreaOrCompartmentCovered] VARCHAR (50)     NULL,
    [Make]                     VARCHAR (50)     NULL,
    [Model]                    VARCHAR (50)     NULL,
    [SerialNumber]             VARCHAR (100)    NULL,
    [Manufacturer]             VARCHAR (50)     NULL,
    [SprinklerInstallDate]     DATE             NULL,
    [FlowRate]                 INT              NULL,
    [PSI]                      INT              NULL,
    [FlowDate]                 DATE             NULL,
    [FlowRateInspector]        UNIQUEIDENTIFIER NULL,
    [MainSize]                 DECIMAL (18, 2)  NULL,
    [MainLocation]             VARCHAR (50)     NULL,
    CONSTRAINT [PK_BuildingSprinkler] PRIMARY KEY CLUSTERED ([BuildingSprinklerId] ASC),
    CONSTRAINT [FK_BuildingSprinkler_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId])
);


CREATE TABLE [dbo].[OccupantSprinkler] (
    [OccupantSprinklerId]      UNIQUEIDENTIFIER NOT NULL,
    [OccupantId]               UNIQUEIDENTIFIER NOT NULL,
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
    CONSTRAINT [PK_OccupantSprinkler] PRIMARY KEY CLUSTERED ([OccupantSprinklerId] ASC),
    CONSTRAINT [FK_OccupantSprinkler_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);


CREATE TABLE [dbo].[Detector] (
    [DetectorId]    UNIQUEIDENTIFIER NOT NULL,
    [StructureId]   UNIQUEIDENTIFIER NOT NULL,
    [Type]          INT              NULL,
    [HowMany]       INT              NULL,
    [AreaProtected] VARCHAR (50)     NULL,
    [Make]          VARCHAR (50)     NULL,
    [Model]         VARCHAR (50)     NULL,
    [SerialNumber]  VARCHAR (100)    NULL,
    [Manufacturer]  VARCHAR (50)     NULL,
    CONSTRAINT [PK_Detector] PRIMARY KEY CLUSTERED ([DetectorId] ASC),
    CONSTRAINT [FK_Detector_Structure] FOREIGN KEY ([StructureId]) REFERENCES [dbo].[Structure] ([StructureId])
);


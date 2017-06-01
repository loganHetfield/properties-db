CREATE TABLE [dbo].[BuildingStandpipe] (
    [BuildingStandpipeId]  UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]           UNIQUEIDENTIFIER NOT NULL,
    [Type]                 INT              NULL,
    [Class]                INT              NULL,
    [Size]                 INT              NULL,
    [ControlValveLocation] VARCHAR (50)     NULL,
    [FDCLocation]          VARCHAR (50)     NULL,
    [StandpipeZone]        VARCHAR (50)     NULL,
    [CertificationNumber]  VARCHAR (50)     NULL,
    [CertificationDate]    DATE             NULL,
    CONSTRAINT [PK_BuildingStandpipe] PRIMARY KEY CLUSTERED ([BuildingStandpipeId] ASC),
    CONSTRAINT [FK_BuildingStandpipe_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId])
);


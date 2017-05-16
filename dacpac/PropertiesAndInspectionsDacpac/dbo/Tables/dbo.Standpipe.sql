CREATE TABLE [dbo].[Standpipe] (
    [StandpipeId]          UNIQUEIDENTIFIER NOT NULL,
    [StructureId]          UNIQUEIDENTIFIER NOT NULL,
    [Type]                 INT              NULL,
    [Class]                INT              NULL,
    [Size]                 INT              NULL,
    [ControlValveLocation] VARCHAR (50)     NULL,
    [FDCLocation]          VARCHAR (50)     NULL,
    [StandpipeZone]        VARCHAR (50)     NULL,
    [CertificationNumber]  VARCHAR (50)     NULL,
    [CertificationDate]    DATE             NULL,
    CONSTRAINT [PK_Standpipe] PRIMARY KEY CLUSTERED ([StandpipeId] ASC)
);




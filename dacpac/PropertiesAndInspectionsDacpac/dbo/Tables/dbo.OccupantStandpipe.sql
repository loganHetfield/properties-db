CREATE TABLE [dbo].[OccupantStandpipe] (
    [OccupantStandpipeId]  UNIQUEIDENTIFIER NOT NULL,
    [OccupantId]           UNIQUEIDENTIFIER NOT NULL,
    [Type]                 INT              NULL,
    [Class]                INT              NULL,
    [Size]                 INT              NULL,
    [ControlValveLocation] VARCHAR (50)     NULL,
    [FDCLocation]          VARCHAR (50)     NULL,
    [StandpipeZone]        VARCHAR (50)     NULL,
    [CertificationNumber]  VARCHAR (50)     NULL,
    [CertificationDate]    DATE             NULL,
    CONSTRAINT [PK_OccupantStandpipe] PRIMARY KEY CLUSTERED ([OccupantStandpipeId] ASC),
    CONSTRAINT [FK_OccupantStandpipe_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);


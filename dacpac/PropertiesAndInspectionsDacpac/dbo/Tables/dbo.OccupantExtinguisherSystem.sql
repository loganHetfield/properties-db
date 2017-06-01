CREATE TABLE [dbo].[OccupantExtinguisherSystem] (
    [OccupantExtinguisherSystemsId] UNIQUEIDENTIFIER NOT NULL,
    [OccupantId]                    UNIQUEIDENTIFIER NOT NULL,
    [ExtinguishingSystem]           INT              NULL,
    [ExtinguishingSystemLocation]   VARCHAR (50)     NULL,
    [AESShutoff]                    VARCHAR (50)     NULL,
    [CertificationNumber]           VARCHAR (50)     NULL,
    [CertificationDate]             DATE             NULL,
    [ExtinguisherInspectionDate]    DATE             NULL,
    [TestType]                      INT              NULL,
    [TestDate]                      DATE             NULL,
    CONSTRAINT [PK_OccupantExtinguisherSystem] PRIMARY KEY CLUSTERED ([OccupantExtinguisherSystemsId] ASC),
    CONSTRAINT [FK_OccupantExtinguisherSystem_Occupant] FOREIGN KEY ([OccupantId]) REFERENCES [dbo].[Occupant] ([OccupantId])
);


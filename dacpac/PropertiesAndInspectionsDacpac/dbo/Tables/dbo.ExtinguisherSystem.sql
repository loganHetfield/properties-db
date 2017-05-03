CREATE TABLE [dbo].[ExtinguisherSystem] (
    [ExtinguisherSystemsId]       UNIQUEIDENTIFIER NOT NULL,
    [StructureId]                 UNIQUEIDENTIFIER NOT NULL,
    [ExtinguishingSystem]         INT              NULL,
    [ExtinguishingSystemLocation] VARCHAR (50)     NULL,
    [AESShutoff]                  VARCHAR (50)     NULL,
    [CertificationNumber]         VARCHAR (50)     NULL,
    [CertificationDate]           DATE             NULL,
    [ExtinguisherInspectionDate]  DATE             NULL,
    [TestType]                    INT              NULL,
    [TestDate]                    DATE             NULL,
    CONSTRAINT [PK_ExtinguisherSystem] PRIMARY KEY CLUSTERED ([ExtinguisherSystemsId] ASC),
    CONSTRAINT [FK_ExtinguisherSystem_Structure] FOREIGN KEY ([StructureId]) REFERENCES [dbo].[Structure] ([StructureId])
);


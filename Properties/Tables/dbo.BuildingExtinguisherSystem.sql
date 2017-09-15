IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'BuildingExtinguisherSystem')
BEGIN

CREATE TABLE [dbo].[BuildingExtinguisherSystem] (
    [BuildingExtinguisherSystemsId] UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]                    UNIQUEIDENTIFIER NOT NULL,
    [ExtinguishingSystem]           INT              NULL,
    [ExtinguishingSystemLocation]   NVARCHAR (50)    NULL,
    [AESShutoff]                    NVARCHAR (50)    NULL,
    [CertificationNumber]           NVARCHAR (50)    NULL,
    [CertificationDate]             DATE             NULL,
    [ExtinguisherInspectionDate]    DATE             NULL,
    [TestType]                      INT              NULL,
    [TestDate]                      DATE             NULL,
    [ImageId]        UNIQUEIDENTIFIER NULL,
    [ThumbImageId]   UNIQUEIDENTIFIER NULL,
    [FileName]       NVARCHAR (255)    NULL,
    [ImageHeight]         INT              NULL,
    [ImageWidth]          INT              NULL
    CONSTRAINT [PK_BuildingExtinguisherSystem] PRIMARY KEY CLUSTERED ([BuildingExtinguisherSystemsId] ASC),
    CONSTRAINT [FK_BuildingExtinguisherSystem_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId])
);

END


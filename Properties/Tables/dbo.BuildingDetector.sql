IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'BuildingDetector')
BEGIN

CREATE TABLE [dbo].[BuildingDetector] (
    [AreaProtected]      INT                  NULL,
    [BuildingDetectorId] UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]         UNIQUEIDENTIFIER NOT NULL,
    [FileName]           NVARCHAR (255)       NULL,
    [HowMany]            INT                  NULL,
    [ImageHeight]        INT                  NULL,
    [ImageId]            UNIQUEIDENTIFIER     NULL,
    [ImageWidth]         INT                  NULL,
    [Make]               NVARCHAR (50)        NULL,
    [Manufacturer]       NVARCHAR (50)        NULL,
    [Model]              NVARCHAR (50)        NULL,
    [SerialNumber]       NVARCHAR (100)       NULL,
    [ThumbImageId]       UNIQUEIDENTIFIER     NULL,
    [Type]               INT                  NULL
    CONSTRAINT [PK_BuildingDetector] PRIMARY KEY CLUSTERED ([BuildingDetectorId] ASC),
    CONSTRAINT [FK_BuildingDetector_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId])
);

END
CREATE TABLE [dbo].[BuildingDetector] (
    [BuildingDetectorId] UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]         UNIQUEIDENTIFIER NOT NULL,
    [Type]               INT              NULL,
    [HowMany]            INT              NULL,
    [AreaProtected]      VARCHAR (50)     NULL,
    [Make]               VARCHAR (50)     NULL,
    [Model]              VARCHAR (50)     NULL,
    [SerialNumber]       VARCHAR (100)    NULL,
    [Manufacturer]       VARCHAR (50)     NULL,
    CONSTRAINT [PK_BuildingDetector] PRIMARY KEY CLUSTERED ([BuildingDetectorId] ASC),
    CONSTRAINT [FK_BuildingDetector_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId])
);


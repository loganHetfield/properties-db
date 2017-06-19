CREATE TABLE [dbo].[BuildingDetector] (
    [BuildingDetectorId] UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]         UNIQUEIDENTIFIER NOT NULL,
    [Type]               INT              NULL,
    [HowMany]            INT              NULL,
    [AreaProtected]      NVARCHAR (50)    NULL,
    [Make]               NVARCHAR (50)    NULL,
    [Model]              NVARCHAR (50)    NULL,
    [SerialNumber]       NVARCHAR (100)   NULL,
    [Manufacturer]       NVARCHAR (50)    NULL,
    CONSTRAINT [PK_BuildingDetector] PRIMARY KEY CLUSTERED ([BuildingDetectorId] ASC),
    CONSTRAINT [FK_BuildingDetector_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId])
);




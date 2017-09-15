IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'BuildingShutOff')
BEGIN

CREATE TABLE [dbo].[BuildingShutOff] (
    [BuildingShutOffId] UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]        UNIQUEIDENTIFIER NOT NULL,
    [Type]              INT              NULL,
    [Location]          NVARCHAR (50)    NULL,
    [ImageId]        UNIQUEIDENTIFIER NULL,
    [ThumbImageId]   UNIQUEIDENTIFIER NULL,
    [FileName]       NVARCHAR (255)    NULL,
    [ImageHeight]         INT              NULL,
    [ImageWidth]          INT              NULL
    CONSTRAINT [PK_BuildingShutOff] PRIMARY KEY CLUSTERED ([BuildingShutOffId] ASC),
    CONSTRAINT [FK_BuildingShutOff_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId])
);

END


IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'BuildingAccess')
BEGIN

CREATE TABLE [dbo].[BuildingAccess] (
    [BuildingAccessId] UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]       UNIQUEIDENTIFIER NOT NULL,
    [FileName]       NVARCHAR (255)    NULL,
    [ImageHeight]    INT              NULL,
    [ImageWidth]     INT              NULL,
    [ImageId]        UNIQUEIDENTIFIER NULL,
    [Location]         NVARCHAR (50)        NULL,	
    [ThumbImageId]   UNIQUEIDENTIFIER NULL,
    [Type]             INT                  NULL

    CONSTRAINT [PK_BuildingAccess] PRIMARY KEY CLUSTERED ([BuildingAccessId] ASC),
    CONSTRAINT [FK_BuildingAccess_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId])
);

END
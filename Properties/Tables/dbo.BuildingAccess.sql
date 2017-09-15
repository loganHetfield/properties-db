IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'BuildingAccess')
BEGIN

CREATE TABLE [dbo].[BuildingAccess] (
    [BuildingAccessId] UNIQUEIDENTIFIER NOT NULL,
    [BuildingId]       UNIQUEIDENTIFIER NOT NULL,
    [Type]             INT                  NULL,
    [Location]         NVARCHAR (50)        NULL,	
    [ImageId]        UNIQUEIDENTIFIER NULL,
    [ThumbImageId]   UNIQUEIDENTIFIER NULL,
    [FileName]       NVARCHAR (255)    NULL,
    [ImageWidth]     INT              NULL,
    [ImageHeight]    INT              NULL
    CONSTRAINT [PK_BuildingAccess] PRIMARY KEY CLUSTERED ([BuildingAccessId] ASC),
    CONSTRAINT [FK_BuildingAccess_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId])
);

END
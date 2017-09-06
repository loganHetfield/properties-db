IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'BuildingKnoxBox')
BEGIN

CREATE TABLE [dbo].[BuildingKnoxBox] (
      [BuildingKnoxBoxId] UNIQUEIDENTIFIER NOT NULL,
      [BuildingId]        UNIQUEIDENTIFIER NOT NULL,
      [Location]          NVARCHAR (50)        NULL,
	    [ImageId]          UNIQUEIDENTIFIER      NULL,
      [ThumbImageId]     UNIQUEIDENTIFIER      NULL,
      [FileName]         VARCHAR (255)         NULL,	    
	    [Height]      INT                   NULL,
	    [Width]       INT                   NULL
    CONSTRAINT [PK_BuildingKnoxBox] PRIMARY KEY CLUSTERED ([BuildingKnoxBoxId] ASC),
    CONSTRAINT [FK_BuildingKnoxBox_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId])
);

END
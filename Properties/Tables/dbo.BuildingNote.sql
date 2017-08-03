IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'BuildingNote')
BEGIN
CREATE TABLE [dbo].[BuildingNote] (
    	[BuildingNoteId] UNIQUEIDENTIFIER NOT NULL,
    	[BuildingId]     UNIQUEIDENTIFIER NOT NULL,
   	  [Note]           VARCHAR (255)    NULL,
   	  [ImageId] [uniqueidentifier] NULL,
			[ThumbImageId] [uniqueidentifier] NULL,
			[FileName] [varchar](255) NULL,
			[Width] [int] NULL,
			[Height] [int] NULL,
			[ImageHeight] [int] NULL,
			[ImageWidth] [int] NULL,
    CONSTRAINT [PK_BuildingNote] PRIMARY KEY CLUSTERED ([BuildingNoteId] ASC),
    CONSTRAINT [FK_BuildingNote_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId])
);
		
END
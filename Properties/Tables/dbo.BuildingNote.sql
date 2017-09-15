IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'BuildingNote')
BEGIN
CREATE TABLE [dbo].[BuildingNote] (
	[BuildingNoteId] UNIQUEIDENTIFIER NOT NULL,
	[BuildingId]     UNIQUEIDENTIFIER NOT NULL,
	[Note]           NVARCHAR (255)    NULL,
	[ImageId] [uniqueidentifier] NULL,
	[ThumbImageId] [uniqueidentifier] NULL,
	[FileName] [nvarchar](255) NULL,
	[ImageHeight] [int] NULL,
	[ImageWidth] [int] NULL,
	[CreatedBy] nvarchar(50) NOT NULL,
	[CreatedDate] datetime NOT NULL,
	[UpdatedBy] nvarchar(50) NOT NULL,
	[UpdatedDate] datetime NOT NULL
    CONSTRAINT [PK_BuildingNote] PRIMARY KEY CLUSTERED ([BuildingNoteId] ASC),
    CONSTRAINT [FK_BuildingNote_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([BuildingId])
);
		
END
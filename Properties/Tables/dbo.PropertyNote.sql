IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'PropertyNote')
BEGIN

CREATE TABLE [dbo].[PropertyNote] (
    [PropertyNoteId] uniqueidentifier NOT NULL,
	[PropertyId] uniqueidentifier NOT NULL,
	[Note] nvarchar(255) NULL,
	[ImageId] uniqueidentifier NULL,
	[ThumbImageId] uniqueidentifier NULL,
	[FileName] nvarchar(255) NULL,
	[ImageHeight] int NULL,
	[ImageWidth] int NULL,
	[CreatedBy] nvarchar(50) NOT NULL,
	[CreatedDate] datetime NOT NULL,
	[UpdatedBy] nvarchar(50) NOT NULL,
	[UpdatedDate] datetime NOT NULL
    CONSTRAINT [PK_PropertyNote] PRIMARY KEY CLUSTERED ([PropertyNoteId] ASC),
    CONSTRAINT [FK_PropertyNote_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);

END
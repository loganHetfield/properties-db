IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'OccupantNote')
BEGIN 

CREATE TABLE [dbo].[OccupantNote](
		[CreatedBy]      [NVARCHAR](50)     NOT NULL,
		[CreatedDate]    [DATETIME]         NOT NULL,
    [FileName]       [NVARCHAR](255)        NULL,
		[ImageHeight]    [INT]                  NULL,
		[ImageId]        [UNIQUEIDENTIFIER]     NULL,
		[ImageWidth]     [INT]                  NULL,
		[Note]           [NVARCHAR](255)        NULL,
		[OccupantNoteId] [UNIQUEIDENTIFIER] NOT NULL,
		[OccupantId]     [UNIQUEIDENTIFIER] NOT NULL,		
		[ThumbImageId]   [UNIQUEIDENTIFIER]     NULL,		
		[UpdatedBy]      [NVARCHAR](50)     NOT NULL,
		[UpdatedDate]    [DATETIME]         NOT NULL,
 CONSTRAINT [PK_OccupantNote] PRIMARY KEY CLUSTERED 
(
	[OccupantNoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[OccupantNote]  WITH CHECK ADD CONSTRAINT [FK_OccupantNote_Property] FOREIGN KEY([OccupantId])
REFERENCES [dbo].[Occupant] ([OccupantId])

ALTER TABLE [dbo].[OccupantNote] CHECK CONSTRAINT [FK_OccupantNote_Property]

END
IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'OccupantNote')
BEGIN 

CREATE TABLE [dbo].[OccupantNote](
	[OccupantNoteId] [uniqueidentifier] NOT NULL,
	[OccupantId] [uniqueidentifier] NOT NULL,
	[Note] [nvarchar](255) NULL,
	[ImageId] [uniqueidentifier] NULL,
	[ThumbImageId] [uniqueidentifier] NULL,
	[FileName] [nvarchar](255) NULL,
	[ImageHeight] [int] NULL,
	[ImageWidth] [int] NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](50) NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_OccupantNote] PRIMARY KEY CLUSTERED 
(
	[OccupantNoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[OccupantNote]  WITH CHECK ADD CONSTRAINT [FK_OccupantNote_Property] FOREIGN KEY([OccupantId])
REFERENCES [dbo].[Occupant] ([OccupantId])

ALTER TABLE [dbo].[OccupantNote] CHECK CONSTRAINT [FK_OccupantNote_Property]

END
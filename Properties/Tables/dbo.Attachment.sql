IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'Attachment')
BEGIN

CREATE TABLE [dbo].[Attachment](
	[AttachmentId] [uniqueidentifier] NOT NULL,
	[AttachmentType] [nvarchar](50) NOT NULL,
	[PropertyId] [uniqueidentifier] NULL,
	[BuildingId] [uniqueidentifier] NULL,
	[OccupantId] [uniqueidentifier] NULL,
	[CreateDate] [datetime] NOT NULL,
	[FileName] [nvarchar](1024) NOT NULL,
	[ContentType] [nvarchar](50) NOT NULL,
	[PrimaryId] [uniqueidentifier] NOT NULL,
	[SecondaryId] [uniqueidentifier] NULL,
	[ImageWidth] [int] NULL,
	[ImageHeight] [int] NULL,
	[IsDeleted] [bit] NOT NULL DEFAULT ((0)),
	[PrimaryFilePath] [nvarchar](1024) NOT NULL DEFAULT (''),
	[SecondaryFilePath] [nvarchar](1024) NULL,
	[CreatedByLogin] [nvarchar](256) NOT NULL,
	[CreatedByFullName] [nvarchar](256) NOT NULL
 CONSTRAINT [PK_Attachment] PRIMARY KEY CLUSTERED 
(
	[AttachmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

END




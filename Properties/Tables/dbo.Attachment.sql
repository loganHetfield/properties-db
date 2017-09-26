IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'Attachment')
BEGIN

CREATE TABLE [dbo].[Attachment](
	[AttachmentId] [uniqueidentifier] NOT NULL,
    [AttachmentTagId] [INT] NULL,
	[AttachmentType] [nvarchar](50) NOT NULL,
	[BuildingId] [uniqueidentifier] NULL,
	[ContentType] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreatedByFullName] [nvarchar](256) NOT NULL,
	[CreatedByLogin] [nvarchar](256) NOT NULL,
	[FileName] [nvarchar](1024) NOT NULL,
	[ImageHeight] [int] NULL,
	[ImageWidth] [int] NULL,
	[IsDeleted] [bit] NOT NULL DEFAULT ((0)),
	[OccupantId] [uniqueidentifier] NULL,
	[PrimaryFilePath] [nvarchar](1024) NOT NULL DEFAULT (''),
	[PrimaryId] [uniqueidentifier] NOT NULL,
	[PropertyId] [uniqueidentifier] NULL,
	[SecondaryFilePath] [nvarchar](1024) NULL,
	[SecondaryId] [uniqueidentifier] NULL	
	
 CONSTRAINT [PK_Attachment] PRIMARY KEY CLUSTERED 
(
	[AttachmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

END




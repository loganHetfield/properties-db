if exists( select * from sys.all_columns where object_id = object_id('Attachment') and name = 'Tag')
BEGIN
Drop Table Attachment
END

if not exists (select * from sys.tables where name = 'Attachment')
BEGIN
CREATE TABLE [dbo].[Attachment](
	[AttachmentId] [uniqueidentifier] NOT NULL,
	[AttachmentType] [nvarchar](50) NOT NULL,
	[PropertyId] [uniqueidentifier] NULL,
	[BuildingId] [uniqueidentifier] NULL,
	[OccupantId] [uniqueidentifier] NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[FileName] [nvarchar](1024) NOT NULL,
	[ContentType] [nvarchar](50) NOT NULL,
	[PrimaryId] [uniqueidentifier] NOT NULL,
	[SecondaryId] [uniqueidentifier] NULL,
	[ImageWidth] [int] NULL,
	[ImageHeight] [int] NULL,
 CONSTRAINT [PK_Attachment] PRIMARY KEY CLUSTERED 
(
	[AttachmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END

if not exists (select 1 from sys.all_columns where object_id = object_id('Attachment') and (name = 'IsDeleted'))
BEGIN
ALTER TABLE dbo.[Attachment] ADD
    [IsDeleted] BIT NOT NULL DEFAULT 0
END

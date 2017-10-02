if not exists( select 1 from sys.all_columns where object_id = object_id('Attachment') and (name = 'IsIncludedInPreplan'))
BEGIN
	ALTER TABLE [dbo].[Attachment] ADD [IsIncludedInPreplan] bit NULL
END

if not exists( select 1 from sys.all_columns where object_id = object_id('Attachment') and (name = 'Notes'))
BEGIN
	ALTER TABLE [dbo].[Attachment] ADD [Notes] [nvarchar](1024) NULL
END

if not exists( select 1 from sys.all_columns where object_id = object_id('Attachment') and (name = 'AttachmentTagId'))
BEGIN
	ALTER TABLE [dbo].[Attachment] ADD [AttachmentTagId] [INT] NULL
END

if exists( select 1 from sys.all_columns where object_id = object_id('Attachment') and (name = 'CreatedBy'))
BEGIN
	ALTER TABLE [dbo].[Attachment] DROP COLUMN [CreatedBy]
END


IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantAccess' AND column_name = 'Type')
BEGIN
    EXEC SP_RENAME 'OccupantAccess.Type', 'TypeId', 'COLUMN'
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantAccess' AND column_name = 'FileName')
BEGIN
		ALTER TABLE [dbo].[OccupantAccess] ADD [FileName] NVARCHAR(255) NULL
END
IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantAccess' AND column_name = 'ImageHeight')
BEGIN
		ALTER TABLE [dbo].[OccupantAccess] ADD [ImageHeight] INT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantAccess' AND column_name = 'ImageId')
BEGIN
		ALTER TABLE [dbo].[OccupantAccess] ADD [ImageId] UNIQUEIDENTIFIER NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantAccess' AND column_name = 'ImageWidth')
BEGIN
		ALTER TABLE [dbo].[OccupantAccess] ADD [ImageWidth] INT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantAccess' AND column_name = 'ThumbImageId')
BEGIN
		ALTER TABLE [dbo].[OccupantAccess] ADD [ThumbImageId] UNIQUEIDENTIFIER NULL
END
IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantRiser' AND column_name = 'Certification')
BEGIN
		ALTER TABLE [dbo].[OccupantRiser] ADD [Certification] NVARCHAR(50) NULL
END


IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantRiser' AND column_name = 'FileName')
BEGIN
		ALTER TABLE [dbo].[OccupantRiser] ADD [FileName] NVARCHAR(255) NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantRiser' AND column_name = 'ImageHeight')
BEGIN
		ALTER TABLE [dbo].[OccupantRiser] ADD [ImageHeight] INT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantRiser' AND column_name = 'ImageId')
BEGIN
		ALTER TABLE [dbo].[OccupantRiser] ADD [ImageId] UNIQUEIDENTIFIER NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantRiser' AND column_name = 'ImageWidth')
BEGIN
		ALTER TABLE [dbo].[OccupantRiser] ADD [ImageWidth] INT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantRiser' AND column_name = 'ThumbImageId')
BEGIN
		ALTER TABLE [dbo].[OccupantRiser] ADD [ThumbImageId] UNIQUEIDENTIFIER NULL
END
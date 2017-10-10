IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantKnoxBox' AND column_name = 'FileName')
BEGIN
		ALTER TABLE [dbo].[OccupantKnoxBox] ADD [FileName] NVARCHAR(255) NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantKnoxBox' AND column_name = 'ImageHeight')
BEGIN
		ALTER TABLE [dbo].[OccupantKnoxBox] ADD [ImageHeight] INT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantKnoxBox' AND column_name = 'ImageId')
BEGIN
		ALTER TABLE [dbo].[OccupantKnoxBox] ADD [ImageId] UNIQUEIDENTIFIER NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantKnoxBox' AND column_name = 'ImageWidth')
BEGIN
		ALTER TABLE [dbo].[OccupantKnoxBox] ADD [ImageWidth] INT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantKnoxBox' AND column_name = 'ThumbImageId')
BEGIN
		ALTER TABLE [dbo].[OccupantKnoxBox] ADD [ThumbImageId] UNIQUEIDENTIFIER NULL
END
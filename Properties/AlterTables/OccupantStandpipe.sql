IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantStandpipe' AND column_name = 'Type')
BEGIN
		EXEC SP_RENAME 'OccupantStandpipe.Type' , 'TypeId', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantStandpipe' AND column_name = 'Size')
BEGIN
		EXEC SP_RENAME 'OccupantStandpipe.Size' , 'SizeId', 'COLUMN'
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantStandpipe' AND column_name = 'FileName')
BEGIN
		ALTER TABLE [dbo].[OccupantStandpipe]	ADD [FileName] NVARCHAR(255) NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantStandpipe' AND column_name = 'ImageHeight')
BEGIN
		ALTER TABLE [dbo].[OccupantStandpipe]	ADD [ImageHeight] INT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantStandpipe' AND column_name = 'ImageId')
BEGIN
		ALTER TABLE [dbo].[OccupantStandpipe]	ADD [ImageId] UNIQUEIDENTIFIER NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantStandpipe' AND column_name = 'ImageWidth')
BEGIN
		ALTER TABLE [dbo].[OccupantStandpipe]	ADD [ImageWidth] INT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantStandpipe' AND column_name = 'ThumbImageId')
BEGIN
		ALTER TABLE [dbo].[OccupantStandpipe]	ADD [ThumbImageId] UNIQUEIDENTIFIER NULL		
END
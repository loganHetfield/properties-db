IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantSprinkler' AND column_name = 'Type')
BEGIN
    EXEC SP_RENAME 'OccupantSprinkler.Type' , 'TypeId', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantSprinkler' AND column_name = 'Design')
BEGIN
    EXEC SP_RENAME 'OccupantSprinkler.Design' , 'DesignId', 'COLUMN'
END

IF (COL_LENGTH('OccupantSprinkler', 'SerialNumber') = 100)
BEGIN
   ALTER TABLE [dbo].[OccupantSprinkler] ALTER COLUMN [SerialNumber] NVARCHAR(50) NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantSprinkler' AND column_name = 'FileName')
BEGIN
		ALTER TABLE [dbo].[OccupantSprinkler] ADD [FileName] NVARCHAR(255) NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantSprinkler' AND column_name = 'ImageHeight')
BEGIN
		ALTER TABLE [dbo].[OccupantSprinkler] ADD [ImageHeight] INT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantSprinkler' AND column_name = 'ImageId')
BEGIN
		ALTER TABLE [dbo].[OccupantSprinkler] ADD [ImageId] UNIQUEIDENTIFIER NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantSprinkler' AND column_name = 'ImageWidth')
BEGIN
		ALTER TABLE [dbo].[OccupantSprinkler] ADD [ImageWidth] INT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantSprinkler' AND column_name = 'ThumbImageId')
BEGIN
		ALTER TABLE [dbo].[OccupantSprinkler] ADD [ThumbImageId] UNIQUEIDENTIFIER NULL
END
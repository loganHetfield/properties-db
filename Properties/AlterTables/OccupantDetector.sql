IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantDetector' AND column_name = 'Type')
BEGIN
		EXEC SP_RENAME 'OccupantDetector.Type' , 'TypeId', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name', data_type 'Data Type' FROM information_schema.columns WHERE table_name = 'OccupantDetector'
AND column_name = 'AreaProtected' AND DATA_TYPE = 'nvarchar')
BEGIN
    ALTER TABLE [dbo].[OccupantDetector] ALTER COLUMN [AreaProtected] INT NULL
END

IF (COL_LENGTH('OccupantDetector', 'SerialNumber') = 200)
BEGIN
   ALTER TABLE [dbo].[OccupantDetector] ALTER COLUMN [SerialNumber] NVARCHAR(50) NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantDetector' AND column_name = 'FileName')
BEGIN
		ALTER TABLE [dbo].[OccupantDetector]	ADD [FileName] NVARCHAR(255) NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantDetector' AND column_name = 'ImageHeight')
BEGIN
		ALTER TABLE [dbo].[OccupantDetector]	ADD [ImageHeight] INT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantDetector' AND column_name = 'ImageId')
BEGIN
		ALTER TABLE [dbo].[OccupantDetector]	ADD [ImageId] UNIQUEIDENTIFIER NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantDetector' AND column_name = 'ImageWidth')
BEGIN
		ALTER TABLE [dbo].[OccupantDetector]	ADD [ImageWidth] INT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantDetector' AND column_name = 'ThumbImageId')
BEGIN
		ALTER TABLE [dbo].[OccupantDetector]	ADD [ThumbImageId] UNIQUEIDENTIFIER NULL		
END
IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantExtinguisherSystem' AND column_name = 'ExtinguishingSystem')
BEGIN
    EXEC SP_RENAME 'OccupantExtinguisherSystem.ExtinguishingSystem' , 'ExtinguishingSystemId', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantExtinguisherSystem' AND column_name = 'TestType')
BEGIN
    EXEC SP_RENAME 'OccupantExtinguisherSystem.TestType' , 'TestTypeId', 'COLUMN'
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantExtinguisherSystem' AND column_name = 'ImageHeight')
BEGIN
		ALTER TABLE [dbo].[OccupantExtinguisherSystem] ADD [ImageHeight] INT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantExtinguisherSystem' AND column_name = 'ImageId')
BEGIN
		ALTER TABLE [dbo].[OccupantExtinguisherSystem] ADD [ImageId] UNIQUEIDENTIFIER NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantExtinguisherSystem' AND column_name = 'ImageWidth')
BEGIN
		ALTER TABLE [dbo].[OccupantExtinguisherSystem] ADD [ImageWidth] INT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantExtinguisherSystem' AND column_name = 'ThumbImageId')
BEGIN
		ALTER TABLE [dbo].[OccupantExtinguisherSystem] ADD [ThumbImageId] UNIQUEIDENTIFIER NULL
END
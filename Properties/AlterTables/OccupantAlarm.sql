IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantAlarm' AND column_name = 'Type')
BEGIN
    EXEC SP_RENAME 'OccupantAlarm.Type' , 'TypeId', 'COLUMN'
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantAlarm' AND column_name = 'FileName')
BEGIN
		ALTER TABLE [dbo].[OccupantAlarm] ADD [FileName] NVARCHAR(255) NULL
END
IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantAlarm' AND column_name = 'ImageHeight')
BEGIN
		ALTER TABLE [dbo].[OccupantAlarm] ADD [ImageHeight] INT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantAlarm' AND column_name = 'ImageId')
BEGIN
		ALTER TABLE [dbo].[OccupantAlarm] ADD [ImageId] UNIQUEIDENTIFIER NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantAlarm' AND column_name = 'ImageWidth')
BEGIN
		ALTER TABLE [dbo].[OccupantAlarm] ADD [ImageWidth] INT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantAlarm' AND column_name = 'ThumbImageId')
BEGIN
		ALTER TABLE [dbo].[OccupantAlarm] ADD [ThumbImageId] UNIQUEIDENTIFIER NULL
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantAlarm' AND column_name = 'AlarmCertification')
BEGIN
    EXEC SP_RENAME 'OccupantAlarm.AlarmCertification' , 'Certification', 'COLUMN'
END

IF EXISTS (SELECT column_name 'Column Name', data_type 'Data Type' FROM information_schema.columns WHERE table_name = 'OccupantAlarm'
AND column_name = 'AreaProtected' AND DATA_TYPE = 'nvarchar')
BEGIN
    ALTER TABLE [dbo].[OccupantAlarm] ALTER COLUMN [AreaProtected] INT NULL
END
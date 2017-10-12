IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantContact' AND column_name = 'FirstName')
BEGIN
    ALTER TABLE [dbo].[OccupantContact] DROP COLUMN [FirstName]
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantContact' AND column_name = 'LastName')
BEGIN
    ALTER TABLE [dbo].[OccupantContact] DROP COLUMN [LastName]
END

IF EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantContact' AND column_name = 'BusinessName')
BEGIN
    ALTER TABLE [dbo].[OccupantContact] DROP COLUMN [BusinessName]
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantContact' AND column_name = 'City')
BEGIN
		ALTER TABLE dbo.[OccupantContact]	ADD [City] NVARCHAR(255) NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantContact' AND column_name = 'County')
BEGIN
		ALTER TABLE dbo.[OccupantContact] ADD [County] NVARCHAR(255) NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantContact' AND column_name = 'FaxNumber')
BEGIN
		ALTER TABLE dbo.[OccupantContact]	ADD [FaxNumber] NVARCHAR(50) NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantContact' AND column_name = 'FileName')
BEGIN
		ALTER TABLE dbo.[OccupantContact]	ADD [FileName] NVARCHAR(255) NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantContact' AND column_name = 'ImageHeight')
BEGIN
		ALTER TABLE dbo.[OccupantContact]	ADD [ImageHeight] INT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantContact' AND column_name = 'ImageId')
BEGIN
		ALTER TABLE dbo.[OccupantContact]	ADD [ImageId] UNIQUEIDENTIFIER NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantContact' AND column_name = 'ImageWidth')
BEGIN
		ALTER TABLE dbo.[OccupantContact]	ADD [ImageWidth] INT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantContact' AND column_name = 'IsEmergencyContact')
BEGIN
		ALTER TABLE dbo.[OccupantContact]	ADD [IsEmergencyContact] BIT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantContact' AND column_name = 'Name')
BEGIN
		ALTER TABLE dbo.[OccupantContact] ADD [Name] NVARCHAR(100) NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantContact' AND column_name = 'NumberOrMilepost')
BEGIN
		ALTER TABLE dbo.[OccupantContact]	ADD [NumberOrMilepost] NVARCHAR(50) NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantContact' AND column_name = 'RoomNumber')
BEGIN
		ALTER TABLE dbo.[OccupantContact]	ADD [RoomNumber] NVARCHAR(255) NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantContact' AND column_name = 'StateId')
BEGIN
		ALTER TABLE dbo.[OccupantContact]	ADD [StateId] INT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantContact' AND column_name = 'StreetOrHighway')
BEGIN
		ALTER TABLE dbo.[OccupantContact]	ADD [StreetOrHighway] NVARCHAR(100) NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantContact' AND column_name = 'StreetPrefixId')
BEGIN
		ALTER TABLE dbo.[OccupantContact]	ADD [StreetPrefixId] INT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantContact' AND column_name = 'StreetSuffixId')
BEGIN
		ALTER TABLE dbo.[OccupantContact]	ADD [StreetSuffixId] INT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantContact' AND column_name = 'StreetTypeId')
BEGIN
		ALTER TABLE dbo.[OccupantContact]	ADD [StreetTypeId] INT NULL
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantContact' AND column_name = 'ThumbImageId')
BEGIN
		ALTER TABLE dbo.[OccupantContact]	ADD [ThumbImageId] UNIQUEIDENTIFIER NULL		
END

IF NOT EXISTS (SELECT column_name 'Column Name' FROM information_schema.columns WHERE table_name = 'OccupantContact' AND column_name = 'Zip')
BEGIN
		ALTER TABLE dbo.[OccupantContact]	ADD [Zip] NVARCHAR(50) NULL
END
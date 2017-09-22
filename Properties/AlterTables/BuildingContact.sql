if not exists (select 1 from sys.all_columns where object_id = object_id('BuildingContact') and name = 'FaxNumber')
BEGIN
    ALTER TABLE [dbo].[BuildingContact] ADD [FaxNumber] [NVARCHAR](50) NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('BuildingContact') and name = 'Website')
BEGIN
    ALTER TABLE [dbo].[BuildingContact] ADD [Website] [NVARCHAR](255) NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('BuildingContact') and name = 'BusinessName')
BEGIN
    ALTER TABLE [dbo].[BuildingContact] ADD [BusinessName] [NVARCHAR](50) NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('BuildingContact') and name = 'IsNameSameAsProperty')
BEGIN
    ALTER TABLE [dbo].[BuildingContact] ADD [IsNameSameAsProperty] [BIT] NULL
END

if not exists (select 1 from sys.all_columns where object_id = object_id('BuildingContact') and name = 'RoomNumber')
BEGIN
    ALTER TABLE [dbo].[BuildingContact] ADD [RoomNumber] [BIT] NULL
END
if exists ( select name, is_nullable from sys.all_columns where object_id = object_id('PropertyContact') and name in ('NumberOrMilepost', 'StreetOrHighway', 'City', 'StateId', 'Zip') and Is_nullable = 0)
BEGIN
Alter table PropertyContact
Alter column 
	[NumberOrMilepost] [nvarchar](50) NULL
Alter table PropertyContact
Alter column 
	[StreetOrHighway] [nvarchar](100) NULL
Alter table PropertyContact
Alter column 
	[City] [nvarchar](255) NULL
Alter table PropertyContact
Alter column 
	[StateId] [int] NULL
Alter table PropertyContact
Alter column 
	[Zip] [nvarchar](50) NULL
END

	

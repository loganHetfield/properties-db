if not exists (select 1 from sys.all_columns where object_id = object_id('Property') and name = 'DeactivationReason')
BEGIN
	ALTER TABLE [dbo].[Property] Add [DeactivationReason] NVARCHAR (1023) NULL
END 

if exists (select 1 from sys.all_columns where object_id = object_id('Property') and (name = 'CommorOrPreviousNames'))
BEGIN	
	EXEC sp_rename '[dbo].[Property].[CommorOrPreviousNames]', 'CommonOrPreviousNames', 'Column';
END

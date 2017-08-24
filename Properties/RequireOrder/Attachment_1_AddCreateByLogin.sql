if not exists (select 1 from sys.all_columns where object_id = object_id('Attachment') and (name = 'CreatedByLogin'))
BEGIN
ALTER TABLE dbo.[Attachment] ADD
    [CreatedByLogin] [nvarchar](256) NOT NULL
	CONSTRAINT temp_login_defaut DEFAULT '',
    [CreatedByFullName] [nvarchar](256) NOT NULL
	CONSTRAINT temp_fullname_defaut DEFAULT ''
END

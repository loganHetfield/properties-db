if exists (select 1 from sys.all_columns where object_id = object_id('Attachment') and (name = 'CreatedByLogin') and (name = 'CreatedBy'))
BEGIN

UPDATE 
	attnew
SET
	attnew.[CreatedByLogin] = attold.[CreatedBy], 
	attnew.[CreatedByFullName] = attold.[CreatedBy]
FROM 
	dbo.[Attachment] attnew
	INNER JOIN dbo.[Attachment] attold ON attnew.AttachmentId = attold.AttachmentId

ALTER TABLE dbo.[Attachment] DROP CONSTRAINT temp_login_defaut
ALTER TABLE dbo.[Attachment] DROP CONSTRAINT temp_fullname_defaut

ALTER TABLE dbo.[Attachment] DROP COLUMN
	[CreatedBy]

END


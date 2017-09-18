DECLARE @dropsStatements NVARCHAR(MAX) 

SET @dropsStatements = ''

SELECT 
	@dropsStatements = @dropsStatements + 
    'ALTER TABLE [' +  OBJECT_SCHEMA_NAME(parent_object_id) +
    '].[' + OBJECT_NAME(parent_object_id) + 
    '] DROP CONSTRAINT [' + name + '];'
FROM sys.foreign_keys

EXEC sp_executesql @dropsStatements
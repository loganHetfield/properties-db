if not exists( select 1 from sys.all_columns where object_id = object_id('Image') and (name = 'IsDeleted'))
BEGIN
ALTER TABLE dbo.[Image] ADD
    [IsDeleted] BIT NOT NULL DEFAULT 0
END

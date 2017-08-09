if exists( select * from sys.all_columns where object_id = object_id('PropertyNote') and name = 'Note' and TYPE_NAME(system_type_id) = 'varchar')
BEGIN
BEGIN TRANSACTION

SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON

ALTER TABLE dbo.PropertyNote
	DROP CONSTRAINT FK_PropertyNote_Property
ALTER TABLE dbo.Property SET (LOCK_ESCALATION = TABLE)

CREATE TABLE dbo.Tmp_PropertyNote
	(
	PropertyNoteId uniqueidentifier NOT NULL,
	PropertyId uniqueidentifier NOT NULL,
	Note nvarchar(255) NULL,
	ImageId uniqueidentifier NULL,
	ThumbImageId uniqueidentifier NULL,
	FileName nvarchar(255) NULL,
	ImageHeight int NULL,
	ImageWidth int NULL,
	CreatedBy nvarchar(50) NOT NULL,
	CreatedDate datetime NOT NULL,
	UpdatedBy nvarchar(50) NOT NULL,
	UpdatedDate datetime NOT NULL
	)  ON [PRIMARY]
ALTER TABLE dbo.Tmp_PropertyNote SET (LOCK_ESCALATION = TABLE)

IF EXISTS(SELECT * FROM dbo.PropertyNote)
	 EXEC('INSERT INTO dbo.Tmp_PropertyNote (PropertyNoteId, PropertyId, Note, ImageId, ThumbImageId, FileName, ImageHeight, ImageWidth, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate)
		SELECT PropertyNoteId, PropertyId, Note, ImageId, ThumbImageId, CONVERT(nvarchar(255), FileName), ImageHeight, ImageWidth, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate FROM dbo.PropertyNote WITH (HOLDLOCK TABLOCKX)')
DROP TABLE dbo.PropertyNote
EXECUTE sp_rename N'dbo.Tmp_PropertyNote', N'PropertyNote', 'OBJECT' 

ALTER TABLE dbo.PropertyNote ADD CONSTRAINT
	PK_PropertyNote PRIMARY KEY CLUSTERED 
	(
	PropertyNoteId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


ALTER TABLE dbo.PropertyNote ADD CONSTRAINT
	FK_PropertyNote_Property FOREIGN KEY
	(
	PropertyId
	) REFERENCES dbo.Property
	(
	PropertyId
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
COMMIT
	 PRINT 'I GOT HERE'
END
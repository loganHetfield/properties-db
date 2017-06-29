IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'Attachment')
BEGIN

CREATE TABLE [dbo].[Attachment] (
    [AttachmentId] UNIQUEIDENTIFIER NOT NULL,
    [PropertyId]   UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (50)    NULL,
    [Tag]          INT              NULL,
    [UploadedBy]   UNIQUEIDENTIFIER NOT NULL,
    [UploadedDate] DATETIME         NOT NULL,
    [FileLocation] NVARCHAR (2048)  NOT NULL,
    CONSTRAINT [PK_Attachment] PRIMARY KEY CLUSTERED ([AttachmentId] ASC),
    CONSTRAINT [FK_Attachment_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);

END




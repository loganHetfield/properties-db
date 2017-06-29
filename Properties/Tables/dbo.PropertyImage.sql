IF NOT EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE [NAME] = 'PropertyImage')
BEGIN

CREATE TABLE [dbo].[PropertyImage] (
    [PropertyImageId] UNIQUEIDENTIFIER NOT NULL,
    [PropertyId]      UNIQUEIDENTIFIER NOT NULL,
    [MimeType]        VARCHAR (64)     NOT NULL,
    [FilePath]        NVARCHAR (256)   NOT NULL,
    CONSTRAINT [PK_PropertyImage] PRIMARY KEY CLUSTERED ([PropertyImageId] ASC),
    CONSTRAINT [FK_PropertyImage_Property] FOREIGN KEY ([PropertyId]) REFERENCES [dbo].[Property] ([PropertyId])
);

END
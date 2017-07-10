﻿CREATE TABLE [dbo].[Image] (
    [ImageId]  UNIQUEIDENTIFIER NOT NULL,
    [MimeType] VARCHAR (64)     NOT NULL,
    [FilePath] NVARCHAR (256)   NOT NULL,
    CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED ([ImageId] ASC)
);

